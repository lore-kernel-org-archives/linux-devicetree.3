Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DBFB38E8B8
	for <devicetree@vger.kernel.org>; Tue,  8 Sep 2026 08:11:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788855104; cv=none; b=o77N3rzRWgRc5tHAxjm6j49klK/vUq8mhI8hqTqued/ST4LCnWqJ0PFqV2z7wUYjzKElyx7n2lcuJzYjeJGy6Ktvh16QsNmwD4VNa3LJRwCp0sHk3m3yr3eTBPc1HSadpwWPDzantxHPaCVqJvlNHZ4ckREQz7oBJblZ0IDONMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788855104; c=relaxed/simple;
	bh=UDAVNzxyX9ieN/d/0afP/fZWor+tWH8YUjMIEJ1gNLM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=cuyaEniX9WxWi88HI2aLRV0MFP0xAHjfmJYgDMEx7f/Am32DqVBu2SBCINIw+HjiVaVzMwlXAnGpvag/rWdhU9ECjSxvngZ5Vy04XOiuK3vAPekfNgvfPxhS9Ylu4JYlX+7EXm8Hq2I5toSgaMzfH8kcLWlWKY4oxTiYOUF+0KQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Pv4g5Qu0; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Pv4g5Qu0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE8B91F00A3A;
	Tue,  8 Sep 2026 08:11:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788855103;
	bh=UDAVNzxyX9ieN/d/0afP/fZWor+tWH8YUjMIEJ1gNLM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Pv4g5Qu00r24ShA4k9ohQVAFuIun67W0VfStrnCO3hWxDSDcXOY4Bexa8sUBv0DCf
	 BgpMhkqcTyDhp808Focp7aOsAehVsOHQDFpEdFNfeqkJUUEiu0Xvq8Horsi35+iY2s
	 r4NZ5phM7UTpEjbE3RoFcK9YUPQzXs6fJ8zUEdRdicT8MMkzQFMyFMzqZAw09i3cA1
	 wVsh74x8iZGt89TwiwfwPoYV9/6vaWyIF8OEkA2YpETYa4RCvvjgsHWQ9e1Ppbkrjs
	 7Jti9moZdaHMibqGX/0kYhetJ+S9Ypx8EE9yotSEKmVwOU7RRkTgj8CSOCA3n4GG2s
	 Vk4V+ucg23Nwg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v1 2/2] pinctrl: qcom: Add qcs615 lpass lpi pinctrl
 driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Karthik S" <karthik.s@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260908075854.3015560-3-karthik.s@oss.qualcomm.com>
References: <20260908075854.3015560-1-karthik.s@oss.qualcomm.com>
 <20260908075854.3015560-3-karthik.s@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 08 Sep 2026 08:11:42 +0000
Message-Id: <20260908081142.BE8B91F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Unused static arrays (`gpio0_pins` through `gpio31_pins`) will caus=
e compiler warnings
--

commit 72e924992eb3de90f14daba573a913e0c3530e32
Author: Karthik S <karthik.s@oss.qualcomm.com>

pinctrl: qcom: Add qcs615 lpass lpi pinctrl driver

This commit adds a pinctrl driver to support pin configuration for the
Low Power Audio SubSystem (LPASS) Low Power Island (LPI) on QCS615.
It introduces a separate pin controller block specifically intended to
control audio pins.

> diff --git a/drivers/pinctrl/qcom/pinctrl-qcs615-lpass-lpi.c b/drivers/pi=
nctrl/qcom/pinctrl-qcs615-lpass-lpi.c
> new file mode 100644
> --- /dev/null
> +++ b/drivers/pinctrl/qcom/pinctrl-qcs615-lpass-lpi.c
[ ... ]
> +static int gpio8_pins[] =3D { 8 };
> +static int gpio9_pins[] =3D { 9 };
[ ... ]
> +static int gpio31_pins[] =3D { 31 };

[Severity: Low]
Are these static integer arrays (gpio0_pins through gpio31_pins) necessary?
They appear to be unreferenced in this source file and will cause unused
variable warnings.

Unlike the top-level MSM pinctrl driver's PINGROUP macro, the LPASS LPI
framework's LPI_PINGROUP macro does not seem to utilize these arrays.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260908075854.3015=
560-1-karthik.s@oss.qualcomm.com?part=3D2
