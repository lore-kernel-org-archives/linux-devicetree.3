Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D897E364941
	for <devicetree@vger.kernel.org>; Tue,  8 Sep 2026 09:55:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788861331; cv=none; b=NQggMLLqPaUF5MGBQfVj+kRtN5O215MIDvYCTrjJknpNHzn+CZW+18NgDnC4JS/TU/cCQHiM09ZzNzeClEyseAdg0Tv9CbU5Yd9RUEwmsDo73sfhi+fiOtpVra4rutEGu4KKxHBgz02tcGQgmrhOPv1HSjJAwn5ggpS5XjzMPXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788861331; c=relaxed/simple;
	bh=3uo/m1hgwSPgx+yiWp35h0Im1ubflPc49wyPFhlrWW4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=nH0Db+8j7tV7qwW+zy0fpB0cEOcwFj9Wed2QO+Hjd5tyr8fz7obdj2gANCmEiZHfu8q9GLr+Kdnq/rPIfQVs1ANF7sAFPAt4KOIKs7OD05iNTu15DaPsyTvgQJGIQkkwwBEikHTFUKZOTJiOYhA+ZBLspNoqeCLbRQ2tLP5T5tA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hpZOOTI9; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hpZOOTI9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47D591F00A3D;
	Tue,  8 Sep 2026 09:55:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788861329;
	bh=3rsR0vfPqpKX/m0gC5lVtYpSF5cbRTsjp/Jj+XkSNRA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=hpZOOTI9m/Xg76V50CV5u0q6iaGcBrwb4lYtXcC+84IL/OqtB8f91HKLHoZrEOAXq
	 ZtjgadVaV11xFklxkNaFQ9rS6o+Lpc+ysQEcOJAvpTvDEFXtPmqyzSB9SiVL+5fGVP
	 xiydIj1Ldu4nKBMEXWhZWRQc6p0KCpYT2yo+RlE+AyUsSRojUQZ86IOal8ptA8k+JJ
	 KpSDmZoEk4+et4S/X/2XUQATfoc5CHNuc/YmowAuA7luiyaEwoeW2lzy18s+65PuA6
	 ceXqTbMNXD5e6UuCWhzLTwaLAEDivdMuHIhqV2DdZwzEduV+/obH0mZHyqwVDCX8++
	 1d+D2DsDELxUw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 3/3] i3c: master: amd: Add hot-join support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Shubham Patil" <shubhamsanjay.patil@amd.com>
Cc: "Alexandre Belloni" <alexandre.belloni@bootlin.com>, conor+dt@kernel.org, Frank.Li@kernel.org, robh@kernel.org, linux-i3c@lists.infradead.org, devicetree@vger.kernel.org
In-Reply-To: <20260908094257.3196120-4-shubhamsanjay.patil@amd.com>
References: <20260908094257.3196120-1-shubhamsanjay.patil@amd.com>
 <20260908094257.3196120-4-shubhamsanjay.patil@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 08 Sep 2026 09:55:28 +0000
Message-Id: <20260908095529.47D591F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Hot-Join ACKs are not suppressed during active transfers, which ca=
n lead to aborted transfers.
--

commit 358c5431178f52c8aa53689fcf0396bc127e9e05
Author: Shubham Patil <shubhamsanjay.patil@amd.com>

i3c: master: amd: Add hot-join support
   =20
This commit adds hot-join support for the AMD AXI I3C master controller.
It introduces a sysfs entry to enable hot-join acknowledgments and hands
hot-join events to the i3c core for device enumeration.

> diff --git a/drivers/i3c/master/amd-i3c-master.c b/drivers/i3c/master/amd=
-i3c-master.c
> index 8a8ab3cd2fa40..6214fef14081f 100644
> --- a/drivers/i3c/master/amd-i3c-master.c
> +++ b/drivers/i3c/master/amd-i3c-master.c
> @@ -55,9 +55,11 @@
>  #define XI3C_CR_EN_MASK				BIT(0)	/* Core Enable */
>  #define XI3C_CR_RESUME_MASK			BIT(2)	/* Core Resume */
>  #define XI3C_CR_IBI_MASK			BIT(3)	/* IBI ACK enable */
> +#define XI3C_CR_HJ_MASK				BIT(4)	/* Hot-Join ACK enable */

[Severity: High]
Does this patch also need to suppress Hot-Join ACKs during active transfers?

Looking at xi3c_master_suppress_ibi_for_xfer(), it suppresses IBI ACKs to
prevent the controller from ACKing an IBI and preempting the master's
transfer:

	cr =3D ioread32(master->membase + XI3C_CR_OFFSET);
	if (suppress || !master->ibi.enabled_count)
		cr &=3D ~XI3C_CR_IBI_MASK;
	else
		cr |=3D XI3C_CR_IBI_MASK;
	iowrite32(cr, master->membase + XI3C_CR_OFFSET);

Since Hot-Joins use the same machinery, leaving XI3C_CR_HJ_MASK enabled
during a transfer allows the controller to ACK a Hot-Join request
mid-transfer. Could this abort the ongoing transfer and potentially
confuse the response FIFO state?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260908094257.3196=
120-1-shubhamsanjay.patil@amd.com?part=3D3
