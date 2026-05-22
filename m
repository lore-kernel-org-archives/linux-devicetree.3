Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5613358360
	for <devicetree@vger.kernel.org>; Fri, 22 May 2026 07:52:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779436323; cv=none; b=TcICGjMH079LIglNZ1r9GT9TxrjycJy0sp0qX4z6+QamvKOFAzaPkRcEsHFFenexJGUtOz9GUU0BMPL1kq1pwUKoZKkXT3YoYscxh/PXmThzufJGhrJPTIce7K4qQzy6DF1oZhdKP9FJV4es4Qe7sbVOv1fPFicQIXWPF1Fy5mY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779436323; c=relaxed/simple;
	bh=JuZoznb9TEKnrlZGjuJ+jtBySPoG6mHnrpkZSDLC54E=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=mp5lo+QCiKkLY8FIRduq+6K9dqhTssdJwXRvFoed75qHPQrItgPu9AH36zTaZHdsKNIE2NRD4P7leMwdokehXjOK+R0C9EIMecjylmcDAH9VFj/aqDBkloGfhn29JLTUAmes1ZXJ0Agl7g9aIAj43MowE7pRGeAqbrQM5jx3GeE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KOvAsNJl; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KOvAsNJl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC7A41F000E9;
	Fri, 22 May 2026 07:52:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779436321;
	bh=f144jHQmGJM1FIMfpf5hNTNtM1jWZSUH6xtaXs7pJPc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=KOvAsNJloftUb9g/RR1rr8pnp8JwS4/ecySTV5nJUX5WR2jfevIWK4nNGNgEvyH6n
	 a7P7KM23aMyEubFLnRKG/xWAl3h3ctM3gCJ73WvyN+FlqjPjTSXq6dl7O1DrLFXvCA
	 EkGf+oWmQTpVqd2HB+YB/IiYVNtR645g/XPxQvn403JXjC8T+G/cX51fhkVuNUxRVb
	 GrFuqizOUHL2TwRZKsD86+5PpVM6podNrtEcjprIdVFtFqDkeTw1QbMpknLWh4nmQd
	 2yepp4ZlQXodFW8GzkwJ/uQHdVOYnuTrNBlzagjyu9kWrghOQUW97bzZ907TJwFNqd
	 Iwl8RknsUg8Qw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 5/6] arm64: dts: qcom: qcs6490-radxa-dragon-q6a: Enable
 GPU and display pipeline
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?R3JhaGFtIE8nQ29ubm9y?= <graham.oconnor@gmail.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260522060645.4399-6-graham.oconnor@gmail.com>
References: <20260522060645.4399-6-graham.oconnor@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 22 May 2026 07:52:00 +0000
Message-Id: <20260522075200.EC7A41F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] The `hdmi-bridge` node misuses the `dp-connector` compatible strin=
g, violating device tree schemas and breaking the DRM bridge chain.
- [High] The device tree references an undefined label `usb_dp_qmpphy_out_d=
p` and defines a unidirectional OF graph connection, causing a DTC compilat=
ion failure.
- [Medium] The DP HPD pinctrl state is incorrectly assigned to the passive =
bridge node instead of the SoC's active DP controller node.
--

commit 92168a3bddd844517ae0cec7b663112085ad6837
Author: Graham O'Connor <graham.oconnor@gmail.com>

arm64: dts: qcom: qcs6490-radxa-dragon-q6a: Enable GPU and display pipeline

Enable the GPU, GMU, dispcc, and MDSS subsystems, and wire up the DisplayPo=
rt
output pipeline through a passive RA620 DP-to-HDMI bridge. Disable unused
DSI and eDP interfaces.

> diff --git a/arch/arm64/boot/dts/qcom/qcs6490-radxa-dragon-q6a.dts b/arch=
/arm64/boot/dts/qcom/qcs6490-radxa-dragon-q6a.dts
> index 4003837ad5756..e8ad6e666f5fd 100644
> --- a/arch/arm64/boot/dts/qcom/qcs6490-radxa-dragon-q6a.dts
> +++ b/arch/arm64/boot/dts/qcom/qcs6490-radxa-dragon-q6a.dts

[ ... ]

> +/ {
> +	hdmi-bridge {
> +		compatible =3D "dp-connector";

[Severity: High]
Does using the dp-connector compatible string here break the DRM bridge
chain?

The dp-connector binding designates port@1 exclusively for AUX signals, not
downstream video bridging. The Linux display-connector DRM driver acts as a
terminal endpoint and only parses port@0 for its upstream connection, never
searching for a downstream bridge.

Because of this, it looks like the DRM pipeline will terminate prematurely =
at
the hdmi-bridge, exposing a DisplayPort connector to userspace instead of an
HDMI connector, and leaving the hdmi-connector node completely orphaned.

Should this use compatible =3D "radxa,ra620" instead, which the simple-brid=
ge
driver supports for bridging video to an output port?

> +		label =3D "hdmi";
> +		type =3D "full-size";
> +		pinctrl-names =3D "default";
> +		pinctrl-0 =3D <&dp_hot_plug_det>;

[Severity: Medium]
Should this pinctrl state be requested by the &mdss_dp node instead of the
passive bridge node?

The dp_hot_plug_det configuration sets GPIO47 to the dp_hot alternate
function, which natively routes the physical hardware signal directly to the
SoC's DP controller block (mdss_dp).

Tying the SoC's hardware pin multiplexing to a downstream connector seems to
bypass the DP driver's ability to correctly manage the pin's state during
suspend and resume cycles.

> +		ports {
> +			#address-cells =3D <1>;
> +			#size-cells =3D <0>;
> +			port@0 {
> +				reg =3D <0>;
> +				hdmi_bridge_in: endpoint {
> +					remote-endpoint =3D <&usb_dp_qmpphy_out_dp>;

[Severity: High]
Does referencing the &usb_dp_qmpphy_out_dp label here cause a dtc compilati=
on
failure?

The label usb_dp_qmpphy_out_dp does not appear to be defined anywhere in the
included device trees at this commit, which will cause dtc to fail with an
undefined reference error. Furthermore, the reverse link from the PHY's
output endpoint back to the bridge's input is missing.

While this build regression is fixed later in the patch series by commit
"arm64: dts: qcom: qcs6490-radxa-dragon-q6a: Enable USB3 SuperSpeed", each
individual patch in a series must compile to maintain bisectability.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260522060645.4399=
-1-graham.oconnor@gmail.com?part=3D5
