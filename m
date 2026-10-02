Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EDE14657F5
	for <devicetree@vger.kernel.org>; Fri,  2 Oct 2026 09:13:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790932426; cv=none; b=uJMOeW3Jz/Oo0tqNwiagtcGAdfpxKPckbQSC4ehSwl8fwiasl2FWArsBAoV2qZg09Y2J9Gt7R8CLrqGvmjHzj9MLJd7CqSWnIbur3lhE4SuOIqRN2GjyN2//SzHlJdKM8rAib8+sPeki+3/ydfaAydpsbQ0pPKAH1VAydnk4NIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790932426; c=relaxed/simple;
	bh=Fal4qERcRjsNgtU+MPg14Yuupug90iA1Emz7mqEbpgI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ATAfYjJWZNeTEeLa0bdh9eWXJS7L0+4seXJxgcvBqtTgZD/XiMcAE8E0XHdUdDv9wyqzTBHonq8Mp0ajyVY7BYfwnVcjpSoK4LjbEHUSISOSVRZbIr1KulsJVsrWT0lTlP47YMQYFTMXtQLQR/IriVBT8bp8FpyUjZez8kjx+VI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iqpIwy1m; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iqpIwy1m"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 157A31F00899;
	Fri,  2 Oct 2026 09:13:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790932425;
	bh=DqlMNqJyLxHzloJ45iE3bRF5UHQQww0YBUe9D7iE2RM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=iqpIwy1my5axhEbh6VQ/HxX6zJ1Si/InXhc5nUrnFwaxUZrI+NJv0h4d0KGH5roTp
	 Ssom3GCIvmscJ8uVRLJo127RTyaZtIUcVYDzzMeeA0h8ZXaWF19j9lHO2yDLC4U04/
	 MlXcLTCmZAKXAQ+NNJabINqnbCS+QDwFvafmm8Xu5CPuP/TA6TPd7YC38ReIj/Potq
	 CDOJPNWe4ASzAn4QfQ82fAnNlMXDWyXaD1LIuEmnJaJFQo1eodkYOtDCAcPkfPUPyZ
	 LkeUhKCrIiBezYCp2KCUwy0pwrhHtOixpCtlL2pInLwksHhCRuFFyWl24vXRizIWDP
	 AHFoe/vmleX9g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v10 5/6] spmi: apple: lock around FIFOs
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sasha Finkelstein" <k@chaosmail.tech>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20261001-t603x-spmi-v10-5-ff815c66c73f@chaosmail.tech>
References: <20261001-t603x-spmi-v10-0-ff815c66c73f@chaosmail.tech>
 <20261001-t603x-spmi-v10-5-ff815c66c73f@chaosmail.tech>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 02 Oct 2026 09:13:44 +0000
Message-Id: <20261002091345.157A31F00899@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] spmi: massive undocumented behavioral changes
- [Low] spmi: memcpy reverses payload byte order on BE hosts
--

commit f3fb1f6f3bd3cd5bdd607e9046ac360f8925a56a
Author: Alba Mendez <me@alba.sh>

spmi: apple: lock around FIFOs

This commit adds a mutex to the apple_spmi structure to serialize register
interactions. The new fifo_lock is initialized during probe and guards the
FIFO operations within spmi_raw_cmd().

> spmi: apple: lock around FIFOs
>
> The driver was missing locking around register interactions.

[Severity: Medium]
Does this patch bundle undocumented behavioral regressions?

The commit message claims to only add locking around register interactions,
but it appears to silently bundle major refactorings and logic changes.

For example, does it introduce new hardware ACK checking logic in
spmi_raw_cmd()?

drivers/spmi/spmi-apple-controller.c:spmi_raw_cmd() {
    ...
    if (!len_rd && !FIELD_GET(SPMI_REPLY_ACK, reply)) {
        ...
    }
}

Does it also alter how standard write commands are packed?

drivers/spmi/spmi-apple-controller.c:spmi_write_cmd() {
    ...
    return spmi_raw_cmd_ack(ctrl, opc | saddr, sid,
                            buf[0] << 8 | saddr, NULL, 0);
}

And does it implement a new callback for sleep/wakeup/shutdown commands?

drivers/spmi/spmi-apple-controller.c:
static int spmi_cmd(struct spmi_controller *ctrl, u8 opc, u8 sid)
{
    ...
}

Could the commit message be updated to describe these changes, or should th=
ey
be split into separate commits?

> diff --git a/drivers/spmi/spmi-apple-controller.c b/drivers/spmi/spmi-app=
le-controller.c
> index 9843dc871d6c7..fabccd25aa0da 100644
> --- a/drivers/spmi/spmi-apple-controller.c
> +++ b/drivers/spmi/spmi-apple-controller.c
[ ... ]
> @@ -78,6 +80,8 @@ static int spmi_raw_cmd(struct spmi_controller *ctrl, u=
8 opc, u8 sid, u16 param,
>  	size_t i =3D 0, j;
>  	int ret;
> =20
> +	guard(mutex)(&spmi->fifo_lock);
> +

[Severity: Low]
Does this code introduce a regression by reversing the payload byte order on
big-endian hosts?

In spmi_raw_cmd(), memcpy() is used to copy byte arrays into a host-endian
u32 variable, which is then written to the bus using writel():

drivers/spmi/spmi-apple-controller.c:spmi_raw_cmd() {
    ...
        while (i < len_wr) {
                j =3D min_t(size_t, sizeof(spmi_cmd), len_wr - i);
                spmi_cmd =3D 0;
                memcpy(&spmi_cmd, buf_wr + i, j);
                writel(spmi_cmd, spmi->regs + SPMI_CMD_REG);
                i +=3D j;
        }
    ...
}

On big-endian hosts, writel() will byte-swap this, resulting in the bytes
being written in reverse order compared to the original bitwise logic.

A similar reversal happens when reading the received payload:

drivers/spmi/spmi-apple-controller.c:spmi_raw_cmd() {
    ...
        while (i < len_rd) {
                ...
                rsp =3D readl(spmi->regs + SPMI_RSP_REG);
                j =3D min_t(size_t, sizeof(spmi_cmd), len_rd - i);
                memcpy(buf_rd + i, &rsp, j);
                i +=3D j;
        }
    ...
}

While Apple SoCs are little-endian and this may have no visible effect in
practice, could this unconditional byte swapping manifest as a regression on
big-endian architectures under COMPILE_TEST?

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261001-t603x-spmi=
-v10-0-ff815c66c73f@chaosmail.tech?part=3D5
