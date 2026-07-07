Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 656443E3D9A
	for <devicetree@vger.kernel.org>; Tue,  7 Jul 2026 10:25:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783419937; cv=none; b=j7wb183LwfEgF9UCaR5AQG2FxIKxyep9r775A13AkPvza2iJsx07Pgi7qAH4rW5yhqxyYyNLSwqlIHW/iuIIXBoPPd3GlDAHDsRcldsIrJ/dP/86DyhOiP8lbCVZaoJ1VN6nagkXgJlCY6aW8AthhOS+0ABYbUszz7GDEGUaTO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783419937; c=relaxed/simple;
	bh=aFJyEAd7fLdZP7Qmw2JuEHqWRa7vlaOX1ArmGPPTbvo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=fxSf/pHA8tjS3YDGuT3m9tP1ejhNpcTMG7Z9NvxOgalv06mx9uqiRuZXMXe4inj6YSwRF8GAScdOZSy9M5v70mYo5MAta47z8ltNTdH0dj+K9PCIYEPXEgs1lGJGU5paoBVnj62d+pqwMdbLYXozl50GOUCOBYdA+d7hMzgTftw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ipp75zgt; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ipp75zgt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0055F1F00A3D;
	Tue,  7 Jul 2026 10:25:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783419936;
	bh=iGZ0hAgzdy+cS/B1H+ZKDuDrB5atlVASBzRYWYvAT74=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ipp75zgtCdu/pE6SCGniYfD/sIwmxSdhVDZQNpbkjt29MrvFRLmscrHWru3t974ik
	 2oiYZF7gjDk8NPNogB197lu31Nf9Jp8Wu1Z+iAJCZkWE2dp+pZnIpq+PzS7kryJwph
	 EvopxiqVmT0C14FbnMawTu+kJz+bk5bYTmncMbNLy2IIuKLmE2G/1Nd9Hp3K+lEXU/
	 NU12gQ/62d59SUfHiCXROuNvUK9eTl35+3vfvCHkzU0I8VWXEtOpDrAypTxEuFWUW8
	 5gr9Espn6cOSAWb9Nl55yiJ3g5W0Blp+cRzL2fcS8gg7WEXVMOrhJFu+MbNFqFCAZa
	 oFQht9KYCj5MA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 3/3] arm64: dts: qcom: add SoCCP DT node for Glymur
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ananthu C V" <ananthu.cv@oss.qualcomm.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260707-glymur-soccp-v5-3-053993f0c6fe@oss.qualcomm.com>
References: <20260707-glymur-soccp-v5-0-053993f0c6fe@oss.qualcomm.com>
 <20260707-glymur-soccp-v5-3-053993f0c6fe@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 07 Jul 2026 10:25:35 +0000
Message-Id: <20260707102536.0055F1F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] The 'qcom,glymur-soccp-pas' compatible string incorrectly falls ba=
ck to 'qcom,kaanapali-soccp-pas', which lacks required TrustZone memory con=
figuration.
- [Medium] The `remoteproc_soccp` node is missing `status =3D "disabled";` =
in the base SoC `.dtsi` file.
--

--- Patch [3]: [PATCH v5 3/3] arm64: dts: qcom: add SoCCP DT node for Glymu=
r ---
commit ba22e521690a1cf89042171dd1def802f653ee49
Author: Sibi Sankar <sibi.sankar@oss.qualcomm.com>

arm64: dts: qcom: add SoCCP DT node for Glymur

This commit adds the device tree nodes required to enable the SoC Control
Processor (SoCCP) on Qualcomm Glymur/Mahua SoCs.

> diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/q=
com/glymur.dtsi
> --- a/arch/arm64/boot/dts/qcom/glymur.dtsi
> +++ b/arch/arm64/boot/dts/qcom/glymur.dtsi

[ ... ]

> +		remoteproc_soccp: remoteproc@d00000 {

[Severity: Medium]
Should this remoteproc node include status =3D "disabled"?=20

Any board including glymur.dtsi that does not actively use the SoCCP or
provide firmware for it will default to status =3D "okay". The driver will
attempt to load firmware and boot the remoteproc, potentially causing
spurious driver probe errors and kernel log pollution.

> +			compatible =3D "qcom,glymur-soccp-pas", "qcom,kaanapali-soccp-pas";

[Severity: High]
Is it safe to use "qcom,kaanapali-soccp-pas" as a fallback here?

If an older kernel lacking the Glymur-specific match binds to this node via
the fallback, it will use the kaanapali_soccp_resource which does not set
.needs_tzmem =3D true.

Since Glymur requires TrustZone memory configuration to prevent faults, the
Kaanapali driver cannot safely run Glymur hardware and may cause a fatal
SMMU or TrustZone panic during remote processor boot.

> +			reg =3D <0x0 0x00d00000 0x0 0x200000>;

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260707-glymur-soc=
cp-v5-0-053993f0c6fe@oss.qualcomm.com?part=3D3
