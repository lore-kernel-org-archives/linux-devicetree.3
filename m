Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794371013;
	b=ZbXIByX0dy/f6Z06h0zOoeUkg+UuZjGXL16FO5gjEN4vqCLEnp2H/LeWyY3EKRKdr6FZ
	 pbnTBPCKANNcWPV/byicZnfF584+N3sp2ftNELWgSsYx2Rc7tm3nNSSWh8FQYw2pQzmHO
	 m4u1Sv4qni2THN3QrmfHzLHc2ljH1pEQ7C4E+ZT5V0K2wYm+mqqooGUBdbJd1I22u93dn
	 tsA/aYjASauXsPJQskdkIVS+WtidfnACxdUPPQZ1PloGzI30pQxzLs3+Bq3Clvqc7kNkm
	 8f2gPxpZcxMCaQ5Ld32zK7qsH+YY1pKq4SHUwZqud8DIdeUG2dfQH/qKWkhGOGoKoxA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794371013;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=ayC3CpAJ+w1gLg8ZGC7t0DNDXcG1f857sKm7nJttkeU=;
	b=0mTHnyG8nZUOLBsyyFn1g07Mkrckz/xCF7gbMwkChDtAnJP3Tq7kR96mczPB5maFh3hs
	 GBMZR5Bh6G1oDcD77vQHUHvLeqmgbP1HQ/L2cSh8AkDzPmLviwS5d8oFjXDgX6wJBCN3q
	 m9LPUqJD7BvjpWjTp17mNEtuawrvJFd0rE2HEbSu5+GMnDZiJHDGSRMjWuwpQc/vr5TAq
	 DPXTvQziVHBGUy7dKB1ya4Ynofz+kmdgW0KK83nbxtOaOIZbLasfIYcJn1c6qvmqzEzuA
	 TS1ttktWuWfKibgBGNwcg6w3h99LPW1VJmG75nG7zVGqU+qV7Dm5T/pcFeykTN0JCUA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hJJyMtT0;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23C7760A2604
	for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 04:23:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hJJyMtT0
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80EE81F00A07;
	Wed, 11 Nov 2026 04:23:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794371012;
	bh=ayC3CpAJ+w1gLg8ZGC7t0DNDXcG1f857sKm7nJttkeU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=hJJyMtT0NJgJhfUAsowFl6Z85AFf7hQBZldVgTy65bGwFGdVXDh80n1Bfx4UUYlgW
	 T1I8mugKDbMsTJ9wjBkZVf00+5vL4CtLQ3FS8pcSy+xl+JC9/bZ2oGPEuNLc84EmTr
	 yAPGl1qf2IiDsRAiSbqZJXZ1M9Dbvw1g0BichraY3G74yH313Icdtpinc0XPWDvH/q
	 lbyBD7YywWPaxyoQkTFvBCk9/p4VEj6dIUgRznCmCBhILRqYRVmrScmT9tEXriPW/N
	 tc4cC3db0PdIl8K2bby+F87qoLLtLY+7M13lRXMVAvjAOFV8Rw9FRs171TbQn2DnTK
	 DO7ECXh9AvzHA==
Message-ID: <sashiko-outbox-208276@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] arm64: dts: qcom: sm7225: Add Samsung Galaxy Tab S7
 FE LTE
Reply-To: sashiko-reviews@lists.linux.dev
To: "Vishal Balasubramanian" <vishal.bala.nps@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261111-master-v1-2-07b4f06a9dd5@gmail.com>
References: <20261111-master-v1-0-07b4f06a9dd5@gmail.com>
 <20261111-master-v1-2-07b4f06a9dd5@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 11 Nov 2026 04:23:32 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 5 potential
issues to consider:
- [High] arm64: dts: qcom: missing PMK8350_SID causes SPMI SID 0
  collision
- [Medium] arm64: dts: qcom: swapped vdda-phy and vdda-pll supplies on
  usb_1_qmpphy
- [Medium] arm64: dts: qcom: broken chosen stdout-path and missing
  display AXI clock
- [Low] arm64: dts: qcom: missing sdc2 card-detect pinctrl and duplicate
  ipa props
- [Low] arm64: dts: qcom: undeleted cont_splash_memory and knox_reserved
  mismatch
--

commit 40269d8494daca48cf8a14a66c04f07d121893ba
Author: Vishal Balasubramanian <vishal.bala.nps@gmail.com>

arm64: dts: qcom: sm7225: Add Samsung Galaxy Tab S7 FE LTE

This commit adds the initial device tree for the Samsung Galaxy Tab S7 FE
LTE (SM-T735) tablet based on the Qualcomm SM7225 SoC.

> diff --git a/arch/arm64/boot/dts/qcom/sm7225-samsung-gts7xllite.dts b/arc=
h/arm64/boot/dts/qcom/sm7225-samsung-gts7xllite.dts
> new file mode 100644
> index 0000000000000..f3e3529277414
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/sm7225-samsung-gts7xllite.dts
> @@ -0,0 +1,575 @@

[ ... ]

> +#include "sm7225.dtsi"
> +#include "pm6150l.dtsi"
> +#include "pm6350.dtsi"
> +#include "pmk8350.dtsi"

[Severity: High]
Does including pmk8350.dtsi without defining PMK8350_SID to 6 cause pmk8350
to collide with pm6350 on SPMI USID 0?

pmk8350.dtsi defaults PMK8350_SID to 0, so pmk8350: pmic@PMK8350_SID expands
to pmic@0 and merges into the PM6350 node from pm6350.dtsi.  That overwrites
pmic@0's compatible string with "qcom,pmk8350", places all PMK8350
sub-devices (such as pmk8350_rtc, pmk8350_vadc, and the reboot-reason nvmem
cell in pmk8350_sdam_2) on USID 0 instead of USID 6, and leaves pmk8350_pon
enabled alongside pm6350_pon at 0x800.  Should this define PMK8350_SID to 6
before including pmk8350.dtsi and disable or delete &pmk8350_pon, as done in
sm7225-fairphone-fp4.dts?

[ ... ]

> +	aliases {
> +		serial0 =3D &uart9;
> +		serial1 =3D &uart1;
> +	};
> +
> +	chosen {
> +		#address-cells =3D <2>;
> +		#size-cells =3D <2>;
> +		ranges;
> +
> +		stdout-path =3D "framebuffer0";
> +
> +		framebuffer0: framebuffer {
> +			compatible =3D "simple-framebuffer";
> +			memory-region =3D <&framebuffer_mem>;
> +			width =3D <1600>;
> +			height =3D <2560>;
> +			stride =3D <(1600 * 4)>;
> +			format =3D "a8r8g8b8";
> +		};
> +	};

[Severity: Medium]
Can early_init_dt_scan_chosen_stdout() resolve stdout-path =3D "framebuffer=
0",
and will clk_disable_unused() gate the display AXI clock?

Because "framebuffer0" does not start with '/', of_find_node_opts_by_path()
looks it up as a property in /aliases, which only defines serial0 and
serial1, leaving of_stdout NULL; using stdout-path =3D &framebuffer0; (or
"/chosen/framebuffer") resolves to the node path.  Also, because &mdss is
disabled and gcc_disp_axi_clk is not marked CLK_IS_CRITICAL in gcc-sm6350.c,
omitting clocks =3D <&gcc GCC_DISP_AXI_CLK> from the simple-framebuffer node
leaves the display AXI clock unclaimed when unused clocks are disabled.
Finally, #address-cells, #size-cells, and ranges in /chosen are unused since
the framebuffer node uses memory-region rather than reg.

[ ... ]

> +		framebuffer_mem: memory@a0000000 {
> +			reg =3D <0 0xa0000000 0 (2560 * 1600 * 4)>;
> +			no-map;
> +		};
> +
> +		knox_reserved: memory@b0200000 {
> +			reg =3D <0x0 0xb0200000 0x0 0x200000>;
> +			no-map;
> +		};

[Severity: Low]
Should cont_splash_memory be deleted with /delete-node/ before redeclaring
memory@a0000000 as framebuffer_mem, as done for the other replaced
reserved-memory nodes at the top of the file?  Also, the commit message
describes the extra bootloader reservation as the fastuh region, whereas th=
is
node is labeled knox_reserved.

[ ... ]

> +&ipa {
> +	qcom,gsi-loader =3D "self";
> +	memory-region =3D <&pil_ipa_fw_mem>;
> +	firmware-name =3D "qcom/sm7225/Samsung/gts7xllite/lagoon_ipa_fws.mbn";
> +
> +	status =3D "okay";
> +};

[ ... ]

> +&sdhc_2 {
> +	vmmc-supply =3D <&vreg_l9e>;
> +	vqmmc-supply =3D <&vreg_l6e>;
> +
> +	cd-gpios =3D <&tlmm 94 GPIO_ACTIVE_LOW>;
> +
> +	status =3D "okay";
> +};

[Severity: Low]
Does sdhc_2 need pin configuration for the gpio94 card-detect line in
&sdc2_on_state and &sdc2_off_state?

sm6350.dtsi only configures clk, cmd, and data in sdc2_on_state and
sdc2_off_state, leaving gpio94 without pull-up and sleep bias settings (see
sd-cd-pins in sm7225-fairphone-fp4.dts).  Also, qcom,gsi-loader and
memory-region in &ipa duplicate the properties already set in sm6350.dtsi.

[ ... ]

> +&usb_1_qmpphy {
> +	vdda-phy-supply =3D <&vreg_l22a>;
> +	vdda-pll-supply =3D <&vreg_l16a>;
> +
> +	status =3D "okay";
> +};

[Severity: Medium]
Are vdda-phy-supply and vdda-pll-supply swapped on usb_1_qmpphy?

vreg_l16a is the ~0.88V rail and vreg_l22a is the ~1.2V rail (used for
vdda-pll-supply on ufs_mem_phy above).  On SM6350/SM7225 QMP PHYs (such as
sm7225-fairphone-fp4.dts and sm6350-sony-xperia-lena-pdx213.dts),
vdda-phy-supply is <&vreg_l16a> and vdda-pll-supply is <&vreg_l22a>; swappi=
ng
them applies the PHY core load vote to the 1.2V rail and the PLL load vote =
to
the 0.88V rail.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261111-master-v1-=
0-07b4f06a9dd5@gmail.com?part=3D2
