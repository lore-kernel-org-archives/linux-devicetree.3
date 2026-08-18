Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD1003EEAC2
	for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 18:44:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787078692; cv=none; b=SIwZWrWhdWQAJyPAoGkcy1q8WC0G0TGj7eixW3SuWSsVWo2rZOvc3fBsVQAdmkuJBhCO7tICywapcDA3THpD0ARCHVCAyprjS+ct5ipnuPsPukNGm8geUeTEeAWVoXMgDRHhefm1XU5NMzAzjU6Pq3qGYzDJF2jlE+yV7in6jS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787078692; c=relaxed/simple;
	bh=fflyQ9NFB2/rYT16Wy4vivJSY1HdWnJtjShhjlcLgaQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=gCGwnb0RSCFUI/ejQQVBZzNTiiuhKzSDIcm17Gai2kumdn+fAWditUSqHHbc18Ac48NOACd/R3moa9u97Cg54krAJeLWeoukR8xzSJf/2y4XsBbDe/ZqiDzL2bed9PZz51dqaZ8KY0LgWfx5xWhhex53ZBJc4Td0qpjwgrNevkI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=A//yOPsa; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="A//yOPsa"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3AE931F00A3E;
	Tue, 18 Aug 2026 18:44:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787078690;
	bh=hoe9K8QFf1Zkfjk3nkFRS7bGbC8NoC9GiWWy4vpdrn0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=A//yOPsa6pDWPgiJnr23YoJB5HpGpLxoDtkumBvVQRCuQB3EZrkaYpUbaDnDDVG5O
	 EDp0GQ78MRIXNeP3Cz7bE8z2XaCDbgOoedZbbXjRMhFLvAdz+0ObDxY8gMCLAn/Bvy
	 iz4rZr1a0MRBLZmIzeP/t3q6+4nCxVe0V3axBe19Uyc16p/cgyfUn+hNnBEa46d/iF
	 8wTjLmEc4URqtQydVB6tZlFcNn1HbCdVQuPX/jm5oSMN8Ufc+0SMASjzU2VyG6gMrE
	 Kh7dW/XCWJr89XLfWYCD762dFM8A2cSPR4y6IF7MTWuVaYX0i7EUk+L+vqN+TjqSk2
	 sNwPpbV6tGSow==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 2/6] spmi: apple: Validate FIFO state
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sasha Finkelstein" <k@chaosmail.tech>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260818-t603x-spmi-v7-2-dafebe6e7739@chaosmail.tech>
References: <20260818-t603x-spmi-v7-0-dafebe6e7739@chaosmail.tech>
 <20260818-t603x-spmi-v7-2-dafebe6e7739@chaosmail.tech>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 18 Aug 2026 18:44:49 +0000
Message-Id: <20260818184450.3AE931F00A3E@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

New issues:
- [Medium] Instantaneous check of RX_FIFO_EMPTY randomly aborts valid multi=
-word reads if the hardware streams data.

Pre-existing issues:
- [High] Missing controller-level lock allows concurrent operations to corr=
upt SPMI bus transactions and race on prev_fail.
--

--- Patch [2]: [PATCH v7 2/6] spmi: apple: Validate FIFO state ---
commit b638b8c461a5028b5eb344197adecba7ccd922ba
Author: Alba Mendez <me@alba.sh>

spmi: apple: Validate FIFO state

This commit adds checks to validate the FIFO state before reading reply data
and after a command completes. It introduces a prev_fail flag and flushes
the FIFO before executing new commands if previous operations failed.

> diff --git a/drivers/spmi/spmi-apple-controller.c b/drivers/spmi/spmi-app=
le-controller.c
> --- a/drivers/spmi/spmi-apple-controller.c
> +++ b/drivers/spmi/spmi-apple-controller.c

[ ... ]

> @@ -67,6 +71,11 @@ static int spmi_read_cmd(struct spmi_controller *ctrl,=
 u8 opc, u8 sid,
>  	u8 i;
>  	int ret;
> =20
> +	if (spmi->prev_fail) {

[Severity: High]
This isn't a bug introduced by this patch, but does this missing
controller-level lock allow concurrent operations to corrupt SPMI bus
transactions?

Since the SPMI subsystem exposes this controller to all its children and
does not natively serialize read_cmd or write_cmd operations, multiple
threads could invoke spmi_read_cmd() simultaneously. This would lead to
concurrent modifications of spmi->prev_fail and shared hardware registers
without mutual exclusion.

> +		writel(SPMI_ACT_FIFO_FLUSH, spmi->regs + SPMI_ACT_REG);
> +		spmi->prev_fail =3D false;
> +	}
> +
>  	writel(spmi_cmd, spmi->regs + SPMI_CMD_REG);

[ ... ]

> @@ -78,6 +87,12 @@ static int spmi_read_cmd(struct spmi_controller *ctrl,=
 u8 opc, u8 sid,
> =20
>  	/* Read SPMI data reply */
>  	while (len_read < len) {
> +		if (readl(spmi->regs + SPMI_STATUS_REG) & SPMI_RX_FIFO_EMPTY) {
> +			spmi->prev_fail =3D true;
> +			dev_err_ratelimited(&ctrl->dev,
> +					    "FIFO lacks reply data, controller stuck?\n");
> +			return -EIO;
> +		}

[Severity: Medium]
Could this instantaneous check of SPMI_RX_FIFO_EMPTY spuriously abort valid
multi-word reads?

In a multi-word read transaction, the CPU might outrun the SPMI bus after
reading the first word. If the hardware streams data and hasn't buffered
the next word yet, the CPU will immediately see SPMI_RX_FIFO_EMPTY and
return -EIO instead of waiting for the next word to arrive.

>  		rsp =3D readl(spmi->regs + SPMI_RSP_REG);
>  		i =3D 0;

[ ... ]

> @@ -97,6 +117,11 @@ static int spmi_write_cmd(struct spmi_controller *ctr=
l, u8 opc, u8 sid,
>  	size_t i =3D 0, j;
>  	int ret;
> =20
> +	if (spmi->prev_fail) {

[Severity: High]
This is a pre-existing issue, but can concurrent calls to spmi_write_cmd()
race on spmi->prev_fail and hardware state?

Similar to spmi_read_cmd(), this modifies shared hardware state and
spmi->prev_fail without serialization.

> +		writel(SPMI_ACT_FIFO_FLUSH, spmi->regs + SPMI_ACT_REG);
> +		spmi->prev_fail =3D false;
> +	}
> +
>  	writel(spmi_cmd, spmi->regs + SPMI_CMD_REG);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260818-t603x-spmi=
-v7-0-dafebe6e7739@chaosmail.tech?part=3D2
