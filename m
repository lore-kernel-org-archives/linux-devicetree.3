Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94C493822B1
	for <devicetree@vger.kernel.org>; Mon,  3 Aug 2026 03:54:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785729243; cv=none; b=AQoqFIiViMdYCt1T0EMGq/2W66DhHH5RhAZsOt6kk+jYbCB9eDL4aFp1AEf3M3+Bw7qwHzEEUY8ZATCP2iYzFW8gObR4WGl7wn7FrKZNC3WaN9oqWk0ad4GSEFIYS2jxFQm+hSUIDt52PPQSZs4HtwFiu56kC04lz7bgqQqJzVQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785729243; c=relaxed/simple;
	bh=XDF5ehSEOMKu+HZsN2fYs1BKTqm9iFlcrdiWb9P7LU0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=blu5lropaawR6nkS44sWnxXDFMGFXav+YL4zT5g23LaQnWez5ysv6hrPTTEIYK+iGzoW+OyPTji/8JYNvfgg2wN7mgMdP/bR0QkTooG3NpBl4OT/bQ9eKuz8aLnR3HNEUWj7VPPr1qhqn//hgzD11Wmtk5QiM0eg30TgrfN5uxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MnWxx9DL; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MnWxx9DL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3FCA1F000E9;
	Mon,  3 Aug 2026 03:54:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785729242;
	bh=ooWtoi2HHcjF68EH+zJGOvxQoX4g8eg68ynvitqCP+Y=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=MnWxx9DL97S0jWGBhhAfh9iYO/R/pK61jRGlxWMHfTk4baRE/jEnnJMlpW0AKzTxP
	 WZBziIFKdnYL4BO4CHKiOAXYSI6GhjRowU3HTT7m/XS8Wy4SSkaz1ldW24DAIRlIp6
	 eCV6oJ1u+hI/DfJc2yXqiDK6WwO29RvvVXTGNk6+GV1oPQtxXmNsqbbtLt+dQpnm9s
	 FVe16Y0gyeeVgyq8FkwdrFTMmhtXEHBFG9dOpQ5FjFKHHu8Q65zx+KnlAywoxCfS/7
	 JNEpzYkLBvE60DkhFUPey2wth5uurbgbCRYz4GwwNQlY/kKbfWkNFWYlgbdEvrUT80
	 IV90asR9jBAlA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 8/9] arm64: dts: qcom: kodiak: Describe EUD UTMI path
 using child node
Reply-To: sashiko-reviews@lists.linux.dev
To: "Elson Serrao" <elson.serrao@oss.qualcomm.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260803031534.2942628-9-elson.serrao@oss.qualcomm.com>
References: <20260803031534.2942628-1-elson.serrao@oss.qualcomm.com>
 <20260803031534.2942628-9-elson.serrao@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 03 Aug 2026 03:54:01 +0000
Message-Id: <20260803035401.F3FCA1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] The patch creates a broken (asymmetric) OF graph connection by mod=
ifying `kodiak.dtsi` without updating dependent board files, which breaks U=
SB role switching for EUD.
- [Medium] Missing mutex lock in `port_store` allows a race condition with =
`enable_store` and role switch callbacks, potentially corrupting EUD hardwa=
re state.
--

--- Patch [8]: [PATCH v5 8/9] arm64: dts: qcom: kodiak: Describe EUD UTMI p=
ath using child node ---
commit 6a20db16eb123d18691f3748fc7fc0dc057b3d4c
Author: Elson Serrao <elson.serrao@oss.qualcomm.com>

arm64: dts: qcom: kodiak: Describe EUD UTMI path using child node

This patch updates the EUD description to explicitly model the topology
using a child node and adds a role-switch declaration. It removes the
USB endpoint mapping to the secondary controller, associating it with
the primary controller, and enables the EUD by default.

> diff --git a/arch/arm64/boot/dts/qcom/kodiak.dtsi b/arch/arm64/boot/dts/q=
com/kodiak.dtsi
> index fa540d8c2615d..be9d02760a985 100644
> --- a/arch/arm64/boot/dts/qcom/kodiak.dtsi
> +++ b/arch/arm64/boot/dts/qcom/kodiak.dtsi
[ ... ]
> @@ -4736,16 +4730,28 @@ eud: eud@88e0000 {
[ ... ]
> +			eud0: eud-path@0 {
> +				reg =3D <0>;
> +				usb-role-switch;
> =20
> +				ports {
> +					#address-cells =3D <1>;
> +					#size-cells =3D <0>;
> +
> +					port@0 {
> +						reg =3D <0>;
> +						eud_usb: endpoint {
> +							remote-endpoint =3D <&usb_1_dwc3_hs>;
> +						};
> +					};

[Severity: High]
Does this create an asymmetric OF graph connection?

If downstream board files (like qcs6490-rb3gen2.dts) override usb_1_dwc3_hs
to point directly to their Type-C connectors (e.g., pmic_glink_hs_in),
wouldn't this leave eud_usb as a dangling one-way link?

This would violate the OF graph specification which strictly requires
symmetric bidirectional links.

[ ... ]
> @@ -4972,6 +4978,7 @@ port@0 {
>  					reg =3D <0>;
> =20
>  					usb_1_dwc3_hs: endpoint {
> +						remote-endpoint =3D <&eud_usb>;
>  					};
>  				};

[Severity: High]
Will Type-C role switch events bypass the EUD driver entirely on boards
that override this endpoint?

If the OF graph connection is broken by downstream overrides, could this
leave the enabled EUD hardware permanently waiting for role change callbacks
that never arrive?

Additionally, looking at drivers/usb/misc/qcom_eud.c:port_store():

	/* Port selection must be done before enabling EUD */
	if (chip->enabled)
		return -EBUSY;

	writel(port, chip->base + EUD_REG_PORT_SEL);
	chip->port_idx =3D port;

[Severity: Medium]
Does this missing mutex lock in port_store() allow a race condition with
enable_store()?

If a concurrent sysfs write to enable and port occurs, port_store() can
interleave with enable_store() since it doesn't hold chip->state_lock.

Could this allow enable_store() to perform role checks using one port but
configure and enable the PHY for another port, misaligning the internal
driver state with the hardware?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260803031534.2942=
628-1-elson.serrao@oss.qualcomm.com?part=3D8
