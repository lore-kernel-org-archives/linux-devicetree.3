Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794459025;
	b=O34XE0IbZtZh67IN+9wrOvPWO1ovU5T6qShXdze7k63R1YJP6FCCILZOF/+PRyK8aaub
	 RH/JHcwRmHq7OMWSv8+XTApQiHNiTKYa1wYy3w7GtDRieK8DzVb9wboDyNMwQ4xjjFORH
	 4WjK+gHeEM9LHvhtnRXWC3aywS/P3xqqSiIqRnl8GarLxIMJsx3Fh++dEZdhGl5s38Xtv
	 NX2gmpe3XBRNgtc7PQrogGlbZDM56inv3tycP+S8qpG1+SuEIaRcdstAFAK7LwceTPEns
	 hid7s/rQEmY6UuoiZ1mncNiyUHwlhbDnwa09I4KGMEaIEujLBI3NTEBRaxfLz1SjBuw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794459025;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=OAhxBzFmoj5M+Y7/W76D/gX/u9+CYrEECQUomOW+1z4=;
	b=Cy/Zs5QWpdnNY8hHPT/nXXgtjXoTal4HhFbGAxwW6ZeU71FTWpJBX2LSJB2sHIz9GeqA
	 K1m/lPPeIGnJWi4tyovqAxtN0UjuYWZbYnn56rXgyYenXizRNiRg6PnYwF6PWWPToLPq7
	 BR8RBRoZNlYLXt9F3DO6WX5XkvmrZwyQAF8+/HhBrSdfZztOXvp4e9thXoA1/YXcpiu5v
	 T6/g18yX/KzM3yr7ESnsjEbAESMwMPB96feg7sG3kAozhIWI+D+dExWRK57DFbY5N/2Fc
	 EjtxTmgHSb+m7tBdhNX1btcWACxw32RZ35aZQpiv3kLU/tUk5oX5iYCh2PhYz1zyQIg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="mbDV/Mi8";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 533F5606A31C
	for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 04:50:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mbDV/Mi8
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E90381F00A05;
	Thu, 12 Nov 2026 04:50:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794459025;
	bh=OAhxBzFmoj5M+Y7/W76D/gX/u9+CYrEECQUomOW+1z4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=mbDV/Mi8OQaDllGD8cBPTimUmrVDAswJ5pjUzgWlaMJkWYEeWb7dO7JkI6NLotq5M
	 ndetbfAJ/rO8YtqMsE6lNANW+FFIhFhguGiVwUa2EXr2PUISy95t5+Sb1K2gLXL3kX
	 PkB0UErmYVh5Bt6gsBXT5coL8T//2EGzDlI188kzq7bVHCOnTaaerPARjAsKiqOIwD
	 pleUyBu2yDrZA8z1PUJ20JN04mkUTVh7hb6D7UdAyPjLeKqpOqh+Eb/2QkbUmnT6Ny
	 CLbeUsTfD7OxgH2a+F/molr9L+w15dNQSiXgHzGVbS84AaYUUGV3R3kLKaNaUEgaTq
	 vuKMY11iFHLww==
Message-ID: <sashiko-outbox-210397@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 2/2] arm64: dts: qcom: ipq5332: add support to get
 watchdog bootstatus from IMEM
Reply-To: sashiko-reviews@lists.linux.dev
To: "Kathiravan Thirumoorthy" <kathiravan.thirumoorthy@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261112-imem_restart_reason-v4-2-3c7177529526@oss.qualcomm.com>
References: <20261112-imem_restart_reason-v4-0-3c7177529526@oss.qualcomm.com>
 <20261112-imem_restart_reason-v4-2-3c7177529526@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 12 Nov 2026 04:50:24 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Medium] arm64: dts: qcom: ipq5332: sram@8600000 size 0x14000
  mismatches IMEM bounds
--

commit 2ebab85765d6af41cdb12da7f09a167a744fb0e3
Author: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>

arm64: dts: qcom: ipq5332: add support to get watchdog bootstatus from IMEM

This commit adds the IMEM SRAM node with a restart_reason subnode and
references it from the watchdog node on IPQ5332.

> diff --git a/arch/arm64/boot/dts/qcom/ipq5332.dtsi b/arch/arm64/boot/dts/=
qcom/ipq5332.dtsi
> index 25c32e966de92..06e08238a12c0 100644
> --- a/arch/arm64/boot/dts/qcom/ipq5332.dtsi
> +++ b/arch/arm64/boot/dts/qcom/ipq5332.dtsi
> @@ -493,6 +493,21 @@ qpic_nand: spi@79b0000 {
>  			status =3D "disabled";
>  		};
> =20
> +		sram@8600000 {
> +			compatible =3D "qcom,ipq5332-imem", "mmio-sram";
> +			reg =3D <0x08600000 0x14000>;
> +			ranges =3D <0 0x08600000 0x14000>;

[Severity: Medium]
Should the reg and ranges size of sram@8600000 be 0x1000 instead of
0x14000, or is the commit message inaccurate?

The commit message states that the overall IMEM region is 32KB (0x8000) and
only the initial 4KB (0x1000) is accessible by all masters in the SoC, yet
reg and ranges specify 0x14000 (80KB). Because mmio-sram maps the full reg
range in sram_probe() and registers all unreserved subranges into
sram->pool via sram_reserve_regions() -> gen_pool_add_virt(), exposing
offsets beyond the 4KB accessible window in the pool can cause bus aborts
or access violations if an in-kernel consumer allocates from it. The commit
message also states that this patch parses the information in the watchdog
driver, whereas the diff only updates the devicetree.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261112-imem_resta=
rt_reason-v4-0-3c7177529526@oss.qualcomm.com?part=3D2
