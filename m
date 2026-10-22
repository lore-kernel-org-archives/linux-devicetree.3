Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792670020;
	b=Xm47Gbx4U2RJWM1SRAOjKK63kHj6hdQgkXGwFpDCy15fMhixFOH4I1ZpfZS15VopvQQP
	 5ruxdEffvBhztrLis+dnZOgwy1LHCdJCuRp6KZEQSEagXX6/Vvyd6jC91/2I0R4hXxCPt
	 zkI1kEzDJ+WZJh8JxpmzIgKHkwSVdcad+4c+9mSdA0MWpqCMw/BEXoaavCwMk1RAtrheM
	 btWjWb5JAf1ZFWdjxJonOXOEP7kKp9An8JDl10JZ9yeRfv17gGXPVRuq1m0DkZFclNpVY
	 /u3+/XuDBhMRZZouKK6DEtgAeIv2LkLYvV8qgjtTUn41QOs8xzx7pBxkmzAhiMOyGxA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792670020;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=jpj1q9f0g2oFl2APmtyBtG5ANolPGcbCYidyFJJBOS8=;
	b=daehcRU7RGiqgoy49nAEmoZ4EuuXgaAofQl8rH+DA6MsdZEdHJafs5hkopHyrewX0E1M
	 SCdrLq9UjBNz8+iP1j24eQshzcFJgBtzXgwKLGzKQAdRAfRUwD4EiYS/U62pU28j1Prmc
	 ennXqFbiSFyOFGvWQoPcPdgWjUyAHfnOT/GM2+14Gg8H4F85C0fiXS6fnh8qSuMl06/BV
	 PS5S+JLJZmrLH7vCbavYE0RH2a0tgxNmbyg+yZQtH9BL6ZmAEqv2MzOb3B2b27jIlaVnk
	 5a8BnlsiMAdznf3Toua38ES2YhhiRMl25xOvUpwsbEESTO5UKon/DItsISVoQOngQRA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="RBp/b82F";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD8E7606A319
	for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 11:53:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RBp/b82F
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3FBB41F000C1;
	Thu, 22 Oct 2026 11:53:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792670019;
	bh=jpj1q9f0g2oFl2APmtyBtG5ANolPGcbCYidyFJJBOS8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=RBp/b82FhD4QY3f/ZzacmW3iaIVV6eo06gpFt2ROCKHoakMox+vITnaf3jxOZf7BT
	 GJzeXzdTZfvlI04nFPM/YrrsrxME+YcQxdWM8LXiO17+dGdNSbTlp3XSyf9Y95p7Bp
	 Z5Qd//0yPBNPCRouPApJ3TUQ8pOrsULOEBKF56/WZZrRvHqpVgie5SWU8rqgjOFXL+
	 bdk0HaTb/KH4MtJD6oqzoRvlIVcDiL5omb7X8gXIKtCU3IPaQXrsRgCSrbK9VhQNOF
	 fYHduNKG30cvgqNJBSFIKCXkM2u15kY3DoHc2h/A+6lB/W2XwrIzH+YcFUBYRNFLr8
	 u2wBb5I0QrwTQ==
Message-ID: <sashiko-outbox-181401@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/6] arm64: dts: qcom: sm8250-hdk: Add LT9611UXC HDMI
 bridge
Reply-To: sashiko-reviews@lists.linux.dev
To: "ShiTou Hong" <redstone.dcity@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261022113601.2320940-2-dc_redstone@outlook.com>
References: <20261022113601.2320940-1-dc_redstone@outlook.com>
 <20261022113601.2320940-2-dc_redstone@outlook.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 22 Oct 2026 11:53:38 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] arm64: dts: qcom: sm8250-hdk: pinctrl node lt9611-pins violates =
-state schema
- [Medium] arm64: dts: qcom: sm8250-hdk: unlinked mdss_dp and unrelated ads=
p/cdsp nodes
--

commit b1dadd1c8b42a901f8e62f9b3d2367c950faf2f4
Author: redstonee <1516235445@qq.com>

arm64: dts: qcom: sm8250-hdk: Add LT9611UXC HDMI bridge

This commit enables the LT9611UXC MIPI DSI-to-HDMI bridge on the SM8250 HDK
along with its regulator, HDMI connector, I2C bus, pinctrl state, and MDSS/=
DSI
nodes, as well as the ADSP, CDSP, and DisplayPort controller nodes.

> diff --git a/arch/arm64/boot/dts/qcom/sm8250-hdk.dts b/arch/arm64/boot/dt=
s/qcom/sm8250-hdk.dts
> index 5975878ea0fd2..d92e569d87410 100644
> --- a/arch/arm64/boot/dts/qcom/sm8250-hdk.dts
> +++ b/arch/arm64/boot/dts/qcom/sm8250-hdk.dts

[ ... ]

> @@ -404,6 +431,20 @@ sd_ufs_cd_pins: sd-ufs-cd-pins {
>  		function =3D "gpio";
>  		bias-pull-up;
>  	};
> +
> +	lt9611_pins: lt9611-pins {
> +		irq-pins {
> +			pins =3D "gpio1";
> +			function =3D "gpio";
> +			bias-disable;
> +		};
> +
> +		rst-pins {
> +			pins =3D "gpio2";
> +			function =3D "gpio";
> +			output-high;
> +		};
> +	};
>  };
> =20
>  &uart12 {

[Severity: Medium]
Should the lt9611-pins node under &tlmm (as well as sd-ufs-cd-pins from the
preceding commit) be named with a -state suffix, such as lt9611-default-sta=
te
or lt9611-state?

In arch/arm64/boot/dts/qcom/sm8250.dtsi, tlmm uses the qcom,sm8250-pinctrl
compatible string. The binding in
Documentation/devicetree/bindings/pinctrl/qcom,sm8250-pinctrl.yaml sets
unevaluatedProperties: false and restricts top-level pin configuration child
nodes to names ending in -state, while -pins is only matched for subnodes
nested inside a -state parent node:

patternProperties:
  "-state$":
    oneOf:
      - $ref: "#/$defs/qcom-sm8250-tlmm-state"
      - patternProperties:
          "-pins$":
            $ref: "#/$defs/qcom-sm8250-tlmm-state"
        additionalProperties: false

Naming the top-level child node lt9611-pins causes dtbs_check to fail on
&tlmm and skips validation of the nested irq-pins and rst-pins subnodes.

> @@ -486,3 +527,85 @@ &sdhc_2 {
>  	pinctrl-0 =3D <&sdc2_default_state>, <&sd_ufs_cd_pins>;
>  	pinctrl-1 =3D <&sdc2_sleep_state>, <&sd_ufs_cd_pins>;
>  };
> +
> +&adsp {
> +	status =3D "okay";
> +	firmware-name =3D "qcom/sm8250/adsp.mbn";
> +};
> +
> +&cdsp {
> +	status =3D "okay";
> +	firmware-name =3D "qcom/sm8250/cdsp.mbn";
> +};

[ ... ]

> +&mdss {
> +	status =3D "okay";
> +};
> +
> +&mdss_dp {
> +	status =3D "okay";
> +};
> +
> +&mdss_dp_out {
> +	data-lanes =3D <0 1>;
> +};

[Severity: Medium]
Were &adsp, &cdsp, &mdss_dp, and &mdss_dp_out intended to be included in th=
is
LT9611UXC HDMI bridge patch?

The &adsp and &cdsp remoteproc nodes are unrelated to the MIPI DSI-to-HDMI
bridge and are not mentioned in the commit description.

Additionally, enabling &mdss_dp here before connecting &mdss_dp_out to
usb_1_qmpphy_dp_in (which happens in the follow-up USB-C patch "arm64: dts:
qcom: sm8250-hdk: Add FSA4480 USB-C protocol chip") leaves port@1 of mdss_dp
without a remote-endpoint:

arch/arm64/boot/dts/qcom/sm8250.dtsi:
    port@1 {
        reg =3D <1>;

        mdss_dp_out: endpoint {
        };
    };

Because add_mdp_components() in drivers/gpu/drm/msm/msm_drv.c skips disabled
interfaces via of_device_is_available(intf), &mdss and &mdss_dsi0 do not
require &mdss_dp to be enabled for the HDMI bridge. When &mdss_dp probes
without a remote-endpoint on port@1, msm_dp_display_probe_tail() in
drivers/gpu/drm/msm/dp/dp_display.c sets dp->next_bridge =3D NULL instead of
attaching the QMP PHY AUX and Type-C HPD bridges:

    dp->next_bridge =3D devm_drm_of_get_bridge(&dp->pdev->dev, dp->pdev->de=
v.of_node, 1, 0);
    if (IS_ERR(dp->next_bridge)) {
        ret =3D PTR_ERR(dp->next_bridge);
        dp->next_bridge =3D NULL;
        if (dp->is_edp || ret !=3D -ENODEV)
            return ret;
    }

drm_bridge_connector_init() then falls back to msm_dp_bridge as the HPD
provider and calls msm_dp_bridge_hpd_enable(), which calls
pm_runtime_resume_and_get() and enables internal HPD via
msm_dp_aux_hpd_enable(), keeping the DP controller and RPMHPD_MMCX power
domain permanently resumed.

Should &mdss_dp and &mdss_dp_out be moved to the follow-up USB-C patch where
the DisplayPort graph is connected, and &adsp and &cdsp be split into a
separate commit?

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261022113601.2320=
940-1-dc_redstone@outlook.com?part=3D2
