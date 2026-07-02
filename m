Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A07AE47DFB0
	for <devicetree@vger.kernel.org>; Thu,  2 Jul 2026 12:29:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782995346; cv=none; b=isgWkpusNuWGAkPKt99AHFWQ2aZm7a/cZItSlPrNzXjiA7CF6qR9R1ixBnWBWwkX7bQCZOgzAT5oU3t97bXXep7Kxs5Poni44G875WK6AwcfivLx9dhtXMNGbN11Cou3KXFPWJM138GoTyLycIG0wxXDftWS2ugujPX1j8T6Iss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782995346; c=relaxed/simple;
	bh=9K5JFW5Lsn6GMCaRriLOsfvxTffb+aOj+1ga+0C6woA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=tvNgsm6emSmfiwFFvjeHas/NRvq6XBWWCZIBTw2Z4HqR3Q41e8iOpIB0pJNUJOvp/Q3I/ZOUHrfyYdaFGghScCn1aZSahuSY1jt8J/vEvBdTCm8W73ue2SyBYPAP2YFFqQl1Z8jzoFcuDe6MqrVq/TJTlul9sL9NDrrSsNYf7PM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=b8yTqKQK; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="b8yTqKQK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B5B21F000E9;
	Thu,  2 Jul 2026 12:29:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782995344;
	bh=xgNNoo58sBZF+T7Hb/Xc5h1w+4XibnSu/EHww188RQk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=b8yTqKQKrH60xOLZjteGs9PecQFAhkbOSm3dUQMXENR/JlmUpdXsCRYka896PZ0KB
	 kHMcPH7+h8k7qS9c9PMXBlByFEsiHSmUFwGzxUxlk+qdNWxqyGLNIOJ0azFUEH83dN
	 ZhRYiKpOAROQ9DWZLjBMu9OOCKnLFjx39o1ePjKPjGDRgo6S+a9xyOhbLS3tTNktmJ
	 dAlwzP0FUmSsHZMTxbfwMVccVK2F1PQGBqK/hYp3/x/vAIhdcAx48N2sn10CQET3JW
	 Q/mDNhGGeSSC8PutrC4yCl9qdt17g33Pav/q8ifbNRe0js1w/HS0lM9LBc9n3xECaI
	 xfw8vsZkn6azQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/3] arm64: dts: apple: Add pmgr-misc nodes to t60xx
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sasha Finkelstein" <k@chaosmail.tech>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260702-pmgr-misc-v1-3-4f075a3a95c1@chaosmail.tech>
References: <20260702-pmgr-misc-v1-0-4f075a3a95c1@chaosmail.tech>
 <20260702-pmgr-misc-v1-3-4f075a3a95c1@chaosmail.tech>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 02 Jul 2026 12:29:03 +0000
Message-Id: <20260702122904.1B5B21F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Pre-existing error handling bug where the return value of `devm_pl=
atform_ioremap_resource_byname()` is incorrectly checked against NULL inste=
ad of IS_ERR, leading to an invalid pointer dereference.
--

commit 7d3a9b5b08e4210f6d81e35e862b055c17a322ad
Author: Sasha Finkelstein <k@chaosmail.tech>

arm64: dts: apple: Add pmgr-misc nodes to t60xx

This patch adds the PMGR misc control nodes to the device tree for the M1/2
Pro, Max, and Ultra series devices. It defines the register regions and
power domains for these power-management nodes.

> diff --git a/arch/arm64/boot/dts/apple/t600x-die0.dtsi b/arch/arm64/boot/=
dts/apple/t600x-die0.dtsi
> index f715b19efd167..3271d234b483a 100644
> --- a/arch/arm64/boot/dts/apple/t600x-die0.dtsi
> +++ b/arch/arm64/boot/dts/apple/t600x-die0.dtsi
> @@ -24,6 +24,13 @@ aic: interrupt-controller@28e100000 {
>  		power-domains =3D <&ps_aic>;
>  	};
> =20
> +	pmgr_misc: power-management@28e20c000 {
> +		compatible =3D "apple,t6000-pmgr-misc";
> +		reg =3D <0x2 0x8e20c000 0 0x400>,
> +			<0x2 0x8e20c800 0 0x400>;
> +		reg-names =3D "fabric-ps", "dcs-ps";
> +	};
> +

[Severity: High]
This isn't a bug introduced by this patch, but adding this device tree node
will trigger the probe function in drivers/soc/apple/apple-pmgr-misc.c, whi=
ch
has a pre-existing error handling issue.

Could this cause a kernel panic during boot if the resource fails to map?

In drivers/soc/apple/apple-pmgr-misc.c:apple_pmgr_init_device(), the
resource mapping is handled like this:

	base =3D devm_platform_ioremap_resource_byname(
		to_platform_device(misc->dev), name);
	if (!base)
		return false;

	val =3D readl_relaxed(base + APPLE_CLKGEN_PSTATE);

Should this check be IS_ERR(base) instead of !base?

If the resource mapping fails, devm_platform_ioremap_resource_byname()
returns an ERR_PTR (such as ERR_PTR(-EINVAL)). The !base check will evaluate
to false, allowing the error pointer to be directly dereferenced as a
memory address by readl_relaxed().

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260702-pmgr-misc-=
v1-0-4f075a3a95c1@chaosmail.tech?part=3D3
