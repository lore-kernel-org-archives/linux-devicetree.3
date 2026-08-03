Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5E1D2D8385
	for <devicetree@vger.kernel.org>; Mon,  3 Aug 2026 13:36:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785764191; cv=none; b=g1W6LnaTyjOD6IvGsrOgX2dxTjm0AtQHOUz4tlSpTP/Kz3npHzcbhA/TDik26HV5sVfBHBP6JM67ZbRDvH7q8yZa2eFbFgdxcu//+194Ji/TnhBHzPmoqu7ux3AjRJzQq3yI+LCgO7Ni+QkgxyEvaH7usSZSHDbfib4HuXVWpUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785764191; c=relaxed/simple;
	bh=e7iHy4y50xbc9ee083QD6NyxpmZ/tJFwQieA3NxFYgk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=EBNOIqiKpohK/rSauNJl72iV99vcHE+IoS1fslmFyoz2VAUZGRJi0oENlekALVdGOzSC9LFdg0/+B0OeLz7H8zvGh3uhFFiYQ89HygHXSTQ2Lkls6/K7aGq17z8IddbEnfJnmrI3QitW0u+/otYATgGDf4XnQX8Ij4nntRE3SiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BOyDz/GB; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BOyDz/GB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 235A21F000E9;
	Mon,  3 Aug 2026 13:36:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785764190;
	bh=kuMw0fS7Qekrcf5WDZBw9CimVXDr7m5fIiOu0aBPHqA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=BOyDz/GBb/hGuBGtYsshXXo38mcXeDk94PJQDArp0eyAa9m6BVpythG9zhC0ciqrM
	 QsG6vZJgfnb62MKtD4BkNUKm4EGq1d9qiAFa+31kO7fULRIHY/qbxoNADXFC5E8jFF
	 9ulpfHbjv4eEXFSh3ns8OCKhVPcAG0dI/X1hSBI+be0VJHhiCl1APy99A9/mmb4Jt2
	 XxapIdaM8hjw0OpBtkOlCGF6tnIQovgW8A8Uyc9FW4/C8JOmgRiYUKsXHtvBt+Q4Qk
	 8XEw98OiXW1H2dtfUpt6Zgvegc/i8tqSBadlkbFSQAm5hOLwNgFG99pQgy5/JvSoWN
	 hR7GJZ3/roG7w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 5/6] spmi: apple: lock around FIFOs
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sasha Finkelstein" <k@chaosmail.tech>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260803-t603x-spmi-v3-5-c17b506d91a1@chaosmail.tech>
References: <20260803-t603x-spmi-v3-0-c17b506d91a1@chaosmail.tech>
 <20260803-t603x-spmi-v3-5-c17b506d91a1@chaosmail.tech>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 03 Aug 2026 13:36:27 +0000
Message-Id: <20260803133629.235A21F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

Pre-existing issues:
- [Critical] Out-of-bounds memory write in `spmi_raw_cmd` due to an unsigne=
d integer underflow when calculating remaining bytes for SPMI reply payload=
 copy.
- [High] Improper use of `memcpy` with `writel`/`readl` for stream I/O caus=
es byte reordering and data corruption on Big-Endian architectures.
- [High] The `flush_extra_data` function uses an unbounded `while` loop tha=
t can permanently deadlock the SPMI controller and cause a soft lockup.
--

--- Patch [5]: [PATCH v3 5/6] spmi: apple: lock around FIFOs ---
commit a147e75e08f9462d0254d993c5221a8c13ead6d5
Author: Alba Mendez <me@alba.sh>

spmi: apple: lock around FIFOs

The driver was missing locking around register interactions, which this
commit addresses by adding a mutex around the FIFO operations.

> diff --git a/drivers/spmi/spmi-apple-controller.c b/drivers/spmi/spmi-app=
le-controller.c
> index 8c9a70ba04221..74d4b5d98b113 100644
> --- a/drivers/spmi/spmi-apple-controller.c
> +++ b/drivers/spmi/spmi-apple-controller.c
[ ... ]
> @@ -87,6 +89,8 @@ static int spmi_raw_cmd(struct spmi_controller *ctrl, u=
8 opc, u8 sid,
>  	size_t i =3D 0, j;
>  	int ret;
> =20
> +	guard(mutex)(&spmi->fifo_lock);
> +
>  	writel(spmi_cmd, spmi->regs + SPMI_CMD_REG);
> =20
>  	while (i < len) {

[Severity: Critical]
This is a pre-existing issue, but does this code have an integer underflow
when calculating the remaining bytes to copy?

Looking at spmi_raw_cmd() in drivers/spmi/spmi-apple-controller.c:

	while (len_read < ilen) {
		if (readl(spmi->regs + SPMI_STATUS_REG) & SPMI_RX_FIFO_EMPTY) {
			dev_err(&ctrl->dev, "FIFO lacks reply data, controller stuck?\n");
			return -EIO;
		}
		rsp =3D readl(spmi->regs + SPMI_RSP_REG);
		i =3D min_t(size_t, sizeof(spmi_cmd), len_read - ilen);
		memcpy(ibuf + len_read, &rsp, i);
		len_read +=3D i;
	}

Since len_read is less than ilen in the loop condition, len_read - ilen
evaluates to a large positive integer. As a result, the min_t() call will
always return sizeof(spmi_cmd), which is 4.

If this performs a 1-byte read, will it blindly copy 4 bytes into a 1-byte
buffer on every iteration, leading to an out-of-bounds memory write?

[Severity: High]
This is a pre-existing issue, but could this implementation violate the I/O
accessor guidelines by mixing memcpy() with writel() and readl() for
stream data?

When writing to the TX FIFO in spmi_raw_cmd():

	while (i < len) {
		j =3D min_t(size_t, sizeof(spmi_cmd), len - i);
		spmi_cmd =3D 0;
		memcpy(&spmi_cmd, buf + i, j);
		writel(spmi_cmd, spmi->regs + SPMI_CMD_REG);
		i +=3D j;
	}

And when reading from the RX FIFO:

		rsp =3D readl(spmi->regs + SPMI_RSP_REG);
		i =3D min_t(size_t, sizeof(spmi_cmd), len_read - ilen);
		memcpy(ibuf + len_read, &rsp, i);

Because writel() and readl() perform implicit byte-swapping on big-endian
architectures, placing bytes into a host-endian u32 with memcpy() before
using these accessors reverses the byte order on the bus.

Should this code use the stream I/O accessors like writesl() and readsl()
instead to preserve byte order consistently across architectures?

[Severity: High]
This isn't a bug introduced by this patch, but can the loop in
flush_extra_data() cause a soft lockup?

In drivers/spmi/spmi-apple-controller.c:

static void flush_extra_data(struct spmi_controller *ctrl)
{
	struct apple_spmi *spmi =3D spmi_controller_get_drvdata(ctrl);
	bool warned =3D false;

	while (!(readl(spmi->regs + SPMI_STATUS_REG) & SPMI_RX_FIFO_EMPTY)) {
		if (!warned) {
			dev_warn(&ctrl->dev, "FIFO has extra data\n");
			warned =3D true;
		}
		readl(spmi->regs + SPMI_RSP_REG);
	}
}

If the hardware misbehaves or enters a faulty state where the
SPMI_RX_FIFO_EMPTY flag is never set, will this unbounded while loop run
indefinitely?

Since it executes with the new fifo_lock held, could this permanently
deadlock any subsequent SPMI transactions and block the CPU core?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260803-t603x-spmi=
-v3-0-c17b506d91a1@chaosmail.tech?part=3D5
