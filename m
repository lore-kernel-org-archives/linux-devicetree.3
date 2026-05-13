Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 674E1357D17
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 22:14:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778710486; cv=none; b=SZ6cxJxx/eYfBeJT5MUZR5B/TNSslWZjZz2hXmVjA8sqWF63HqHZte2gl3l1Bi0liV1Bd8BbjU1yFIUaAjzb055xk/gdYC2yyF98EJ/PcpJtiY7v57YsYz2MYb3soU8MCNL0jyEyrw5yN6e+FosJZFkd+yVub258dAfrXdt2r2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778710486; c=relaxed/simple;
	bh=FkpU+izbfNFR6eB5lC5Xgyp2XPb2rH2q95rmVTdagBs=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=QRH60tPIJ0sPjw4zrf66K/pH64WMfBLI5xIg8M/WSb02pBSDDHhqNU+VA25o+Bwv4vSs78mwLfTZJ3yZ2/MqtpKobo9fSmv8az/oUPmf9kRjYrX4XhTbv6WRg7tkrJ1peJIjsZspSozx7pL7IRh0UwZ2PqGh5H1/ch8QxgH/9NM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=I5cLBH59; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="I5cLBH59"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B3BCC19425;
	Wed, 13 May 2026 22:14:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778710485;
	bh=FkpU+izbfNFR6eB5lC5Xgyp2XPb2rH2q95rmVTdagBs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=I5cLBH59Y/Or8wk0WIemEuq6BXgvHPyLVcLWAp8gwr3i/uc3yijuX+rHyOKVdbewE
	 fibk+5o9cO3oUI2XxCgeF++CnXQz48Wu9K+TS5eWwtVKkp+ogqYumPmuC61nUuxXIx
	 JgB5dWMEuKMkAfgGNihj6Ny/rFPptAnfcIi9UwkdoEp962NZf03UWHHzJGOJtNqcM7
	 UHSpEqxvpWGJHEil+7trLGAbrjBMsXYpO2ifnsAvFQ1NYFcOrlebZdqFoHv0GWzkIT
	 +U91MybyIWRNiuwYQF7jpQeeudgK9ea6eai75zG6a+nLu7RSsz9iKMHodqyIV9fA1W
	 y3TVNCJ+R1sDw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 5/6] arm64: dts: qcom: sm8350: add Iris device
Reply-To: sashiko-reviews@lists.linux.dev
To: "Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>
Cc: krzk+dt@kernel.org, robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260512-iris-sc8280xp-v5-5-8cc251e83b58@oss.qualcomm.com>
References: <20260512-iris-sc8280xp-v5-5-8cc251e83b58@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 13 May 2026 22:14:44 +0000
Message-Id: <20260513221445.6B3BCC19425@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] The `mmcx` power domain will not be dynamically scaled by the Venu=
s driver, leading to hardware undervolting at high frequencies.
- [Low] The 'power-domains' and 'power-domain-names' properties specify 4 i=
tems, which violates the maximum limit of 3 in the dt-binding schema.
--

commit 046ca095899786006b3cdd62f346ab47c7c8bd55
Author: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

arm64: dts: qcom: sm8350: add Iris device

This commit adds the Iris and video clock controller devices, describing the
Iris2 core present on the sm8350 platform.

> diff --git a/arch/arm64/boot/dts/qcom/sm8350.dtsi b/arch/arm64/boot/dts/q=
com/sm8350.dtsi
> index 5c8fe213f5e4e..eedf677a7070d 100644
> --- a/arch/arm64/boot/dts/qcom/sm8350.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8350.dtsi
[ ... ]
> @@ -2745,6 +2747,85 @@ usb_2_dwc3: usb@a800000 {
>  			};
>  		};
> =20
> +		iris: video-codec@aa00000 {
> +			compatible =3D "qcom,sm8350-iris", "qcom,sm8250-venus";
> +			reg =3D <0x0 0x0aa00000 0x0 0x100000>;
> +			interrupts =3D <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>;
> +
> +			clocks =3D <&gcc GCC_VIDEO_AXI0_CLK>,
> +				 <&videocc VIDEO_CC_MVS0C_CLK>,
> +				 <&videocc VIDEO_CC_MVS0_CLK>;
> +			clock-names =3D "iface",
> +				      "core",
> +				      "vcodec0_core";
> +			power-domains =3D <&videocc MVS0C_GDSC>,
> +					<&videocc MVS0_GDSC>,
> +					<&rpmhpd RPMHPD_MX>,
> +					<&rpmhpd RPMHPD_MMCX>;
> +			power-domain-names =3D "venus",
> +					     "vcodec0",
> +					     "mx",
> +					     "mmcx";

Does adding four items here violate the dt-binding schema?

The schema for the fallback compatible qcom,sm8250-venus enforces a maxItems
of 3 for power-domains, and restricts power-domain-names to exactly "venus",
"vcodec0", and "mx". This might cause dtbs_check validation failures.

[ ... ]
> +			iris_opp_table: opp-table {
> +				compatible =3D "operating-points-v2";
[ ... ]
> +				opp-444000000 {
> +					opp-hz =3D /bits/ 64 <444000000>;
> +					required-opps =3D <&rpmhpd_opp_svs_l1>,
> +							<&rpmhpd_opp_nom>;
> +				};

Will the mmcx power domain be dynamically scaled here?

Because this node relies on the fallback compatible qcom,sm8250-venus, the
Venus driver will probe it using the legacy sm8250_res struct, which hardco=
des
its OPP power domains list to just "mx" with num_pd_names =3D 1.

Because the driver uses devm_pm_domain_attach_list() to attach domains by
name, mmcx is ignored and never attached to the device's OPP structure.

The generic OPP framework will therefore only apply the first required-opps
entry to mx and skip the second. When the hardware is clocked up to 444MHz,
mmcx will remain stuck at its lowest static voltage vote.

Could this lead to hardware undervolting and system crashes? Does the Venus
driver need a dedicated sm8350_res struct and updates to explicitly support
and attach the mmcx OPP power domain before enabling this node?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260512-iris-sc828=
0xp-v5-0-8cc251e83b58@oss.qualcomm.com?part=3D5
