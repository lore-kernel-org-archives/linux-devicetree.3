Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 561F7346E70
	for <devicetree@vger.kernel.org>; Tue,  7 Jul 2026 05:21:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783401692; cv=none; b=J+Bc76ZiFT+qGm1YADPaqgIpAgm3pkdc7EFnhwanlN/BSxq64VIy85GSsqT447QBloGiRLUBWevOBB7u2o2B8KcO33z5IanMTINvadrfNMGl/YvP0yEXcwnjXfDR7VsIp/HZvthLStdJ1EGLs2oLM+aLIn7vznNhTaURWDW0sKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783401692; c=relaxed/simple;
	bh=tt3io8VJ0PIlIT7IA9W2lEhLRmEsBTbaYPKtqTaOb58=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=c7XOPIqMAghEcnar0vJLllEDjgf++BvPUo0i60h2h3LGUHCuHllW1NutdvceV58x9aJuKOaU6drpojDubUWBhmLx8XvOidqn/cHYO8AVGQ8OHnRq70geu1YkDiD8byTCbGYspOAlEaY1cUFfRk/4e8OHM2irlIZRxvnp0FAxUnA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fF6easp1; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fF6easp1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE6E81F000E9;
	Tue,  7 Jul 2026 05:21:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783401691;
	bh=HPlo7RPyG0D1FRDosunqNbyO5S/QLd6uRNfNX+EWT78=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=fF6easp1q5G1ecQCuaKp8QIU8562N11pwiczPmJNLZu0UdLx41NqcuWa6EUSDs0FN
	 NKwOW/XDi84dqTb3PLtrUdJekc5qHjUtH5xIsR7/QAVx3a2qC/s36Rx7G1/yxzw10o
	 9wS+eZUTS1AtzWiWzGnNV0GtqgdKlcUwWhZstF2p3eNnvQtOGPKMffDeKvmc+m3347
	 4yleWXfyNFIp30xhYnK7slAz8I1ZeRtWdmxoB8rc3GaOKzoVvcOW2obO51hcpdRA9Q
	 w3IKTOuAQ7OQb+wGAA9iI/B9EE8isKmRhkBg39tTaeyjqhqheXhel8kDA76XWPe3M6
	 L3p0WdGqPiqyA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/2] arm64: dts: qcom: kaanapali-mtp: Add PMIC Glink
 node
Reply-To: sashiko-reviews@lists.linux.dev
To: "Krishna Kurapati" <krishna.kurapati@oss.qualcomm.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260707-kaanapali-pmic-glink-v1-1-3f7d476672d9@oss.qualcomm.com>
References: <20260707-kaanapali-pmic-glink-v1-0-3f7d476672d9@oss.qualcomm.com>
 <20260707-kaanapali-pmic-glink-v1-1-3f7d476672d9@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 07 Jul 2026 05:21:30 +0000
Message-Id: <20260707052130.AE6E81F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

New issues:
- [High] The `usb-role-switch` property is omitted from the `&usb` DWC3 nod=
e, which breaks Type-C role switching integration with PMIC Glink.

Pre-existing issues:
- [Medium] Missing `mode-switch` property in the `&usb_dp_qmpphy` node brea=
ks DisplayPort Alt Mode.
--

--- Patch [1]: [PATCH 1/2] arm64: dts: qcom: kaanapali-mtp: Add PMIC Glink =
node ---
commit 6286754ebf3e4661a8a09cc98412dbc73a006aac
Author: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>

arm64: dts: qcom: kaanapali-mtp: Add PMIC Glink node

Add PMIC Glink node on Kaanapali MTP Platform and add remote-endpoint
linkages to DWC3 controller and QMP phy respectively.

> diff --git a/arch/arm64/boot/dts/qcom/kaanapali-mtp.dts b/arch/arm64/boot=
/dts/qcom/kaanapali-mtp.dts
> index f9b5b5718b904..3e9d9fb008ebd 100644
> --- a/arch/arm64/boot/dts/qcom/kaanapali-mtp.dts
> +++ b/arch/arm64/boot/dts/qcom/kaanapali-mtp.dts

[ ... ]

> @@ -1328,8 +1371,6 @@ &ufs_mem_phy {
>  };
> =20
>  &usb {
> -	dr_mode =3D "peripheral";
> -
>  	status =3D "okay";
>  };

[Severity: High]
The patch removes peripheral mode to enable dual-role, but without the
usb-role-switch; property, will Type-C role switching function correctly?

When a Type-C cable is inserted, the PMIC GLINK UCSI driver uses
fwnode_connection_find_match() to find the remote role switch using the
"usb-role-switch" property.

Simultaneously, the DWC3 core driver (dwc3_drd_init()) requires this
property to register the role switch via usb_role_switch_register().

Without it, does DWC3 fall back to legacy OTG block logic, causing UCSI
to fail to find the switch?

[ ... ]

> @@ -1348,3 +1389,11 @@ &usb_dp_qmpphy {
> =20
>  	status =3D "okay";
>  };
> +
> +&usb_dp_qmpphy_out {
> +	remote-endpoint =3D <&pmic_glink_ss_in>;
> +};

[Severity: Medium]
This isn't a bug introduced by this patch, but does the base &usb_dp_qmpphy
node in kaanapali.dtsi lack the mode-switch; property required for
DisplayPort Alt Mode?

The pmic_glink_altmode driver attempts to acquire the Type-C mux using
fwnode_typec_mux_get(), which traverses the OF-graph and strictly searches
the remote endpoint's parent for the "mode-switch" property:

usb_dp_qmpphy: phy@88e8000 {
        compatible =3D "qcom,kaanapali-qmp-usb3-dp-phy",
                     "qcom,sm8750-qmp-usb3-dp-phy";
        ...
        orientation-switch;

        status =3D "disabled";

Since the usb_dp_qmpphy node lacks this property, the lookup returns NULL.

Consequently, typec_mux_set() does nothing, and the QMP PHY is never
instructed to configure its pins for DP out. Should this be added so Alt
Mode works properly with these new endpoints?

> +
> +&usb_dwc3_hs {
> +	remote-endpoint =3D <&pmic_glink_hs_in>;
> +};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260707-kaanapali-=
pmic-glink-v1-0-3f7d476672d9@oss.qualcomm.com?part=3D1
