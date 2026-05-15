Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 398073F8898
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 17:55:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778867733; cv=none; b=gCCsHBRLMYuGAdAPk/CDpd9FdTIBL0vzgDnBB2WsioH9veGOab/MWvPF5NcdWuUbHifxTbXZER4cQpUI11l/AW+jtzzvjU1p3GE5xeKjfoQW3gLCElBKZ98+0xVdZRac0xBp/rZ5VMw1YZS9RRpQ4N9Q/tNM5CLAe+iqPmi9izI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778867733; c=relaxed/simple;
	bh=S3yfhTtH5XH5khWn0pXwlApFS9Ms8su/pVkAV09sskM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=NJDULwdUYVPhJvdFly/GUWXNPurg2mKed9PjPkHgvDyXqug5UM3Kc0OXm02vnAb2mGQ8f3DF5S071bjc+XCcTAJyAknrFGdfoOW03SmgaVrj8MS5igZxiHUK/ZfB24+cXONTy1dhoeRZjYTLFyKuydaSo1SEgiaL1n/78XETATY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aLZ8iOxs; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aLZ8iOxs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D48CC2BCB0;
	Fri, 15 May 2026 17:55:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778867732;
	bh=S3yfhTtH5XH5khWn0pXwlApFS9Ms8su/pVkAV09sskM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=aLZ8iOxsVwqa4XF/gRxV9p6dYOoQqpV3pm/3t2BYxYY+p0w1PUuxN+lBccpWkFkDB
	 n5JEG8vLaqqizifl8TReHsblGk0cFF+IpkrWWLKqKgpilHRUPSFpe92uO0JSGWlshN
	 /Zp4Jcq4ft4jpGncQdt/pjCW35s2c/Tl+9UiUESa5ANURwJglBhblGRjiBvjiWagte
	 I4E5nNedB4BCDis9rMPOsGVXgWpGfoPUAbHqXS7flInurXeR9vlrzvjrys4/wVDXmr
	 w58+sRI+RGpEr9Khn/mZKlde04zJDn0Py18H9xgI3meVXOm7wmb7cnIymVT3+zKl8d
	 rUGzI3Lli0vkA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 3/4] arm64: dts: qcom: Add HONOR MagicBook Art 14
 device tree
Reply-To: sashiko-reviews@lists.linux.dev
To: "Konstantin Shabanov" <mail@etehtsea.me>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org, krzk+dt@kernel.org
In-Reply-To: <20260515172926.16597-4-mail@etehtsea.me>
References: <20260515172926.16597-4-mail@etehtsea.me>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 15 May 2026 17:55:32 +0000
Message-Id: <20260515175532.9D48CC2BCB0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] The PMIC GLINK `usb-c-connector` nodes (`connector@0` and `conne=
ctor@1`) lack `port@2` definitions for SBU (Sideband Use) routing, and ther=
e are no SBU mux nodes defined in the device tree.
- [Medium] The sound card `model` property is set to `"X1E80100-CRD"` inste=
ad of a unique board-specific name.
--

commit 8c00a576dbb39e5e379a22f05075db6f00396289
Author: Konstantin Shabanov <mail@etehtsea.me>

arm64: dts: qcom: Add HONOR MagicBook Art 14 device tree

This commit introduces support for the HONOR MagicBook Art 14 laptop,
including features such as sound, Bluetooth, DP over USB-C, and more.

Link: https://lore.kernel.org/all/871px910m1.wl-kirill@korins.ky/
Link: https://github.com/vamanea/linux-magicbook/blob/x1e80100-magicbook-6.=
19/arch/arm64/boot/dts/qcom/x1e80100-honor-magicbook-art-14.dts
Link: https://github.com/alsa-project/alsa-ucm-conf/pull/755

> diff --git a/arch/arm64/boot/dts/qcom/x1e80100-honor-magicbook-art-14.dts=
 b/arch/arm64/boot/dts/qcom/x1e80100-honor-magicbook-art-14.dts
> new file mode 100644
> index 0000000000000..803f2614ce46a
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/x1e80100-honor-magicbook-art-14.dts

[ ... ]

> +	pmic-glink {
> +		compatible =3D "qcom,x1e80100-pmic-glink",
> +			     "qcom,sm8550-pmic-glink",
> +			     "qcom,pmic-glink";
> +		#address-cells =3D <1>;
> +		#size-cells =3D <0>;
> +		orientation-gpios =3D <&tlmm 121 GPIO_ACTIVE_HIGH>,
> +				    <&tlmm 123 GPIO_ACTIVE_HIGH>;
> +
> +		/* Left-side port, closer to the screen */
> +		connector@0 {
> +			compatible =3D "usb-c-connector";
> +			reg =3D <0>;
> +			power-role =3D "dual";
> +			data-role =3D "dual";
> +
> +			ports {
> +				#address-cells =3D <1>;
> +				#size-cells =3D <0>;
> +
> +				port@0 {
> +					reg =3D <0>;
> +
> +					pmic_glink_ss0_hs_in: endpoint {
> +						remote-endpoint =3D <&usb_1_ss0_dwc3_hs>;
> +					};
> +				};
> +
> +				port@1 {
> +					reg =3D <1>;
> +
> +					pmic_glink_ss0_ss_in: endpoint {
> +						remote-endpoint =3D <&usb_1_ss0_qmpphy_out>;
> +					};
> +				};
> +			};
> +		};

The commit message claims support for DP over USB-C, but the usb-c-connector
nodes (both connector@0 and connector@1) appear to lack port@2 definitions
for SBU (Sideband Use) routing, and there are no SBU mux nodes defined in
the device tree.

Since DisplayPort Alternate Mode requires Type-C SBU pins to carry the
DisplayPort AUX channel for EDID reading and link training, will DP over
USB-C function correctly here?

Without port@2 and the SBU mux/retimer nodes, it seems the OS won't be able
to control SBU routing or handle orientation switches.

[ ... ]

> +	sound {
> +		compatible =3D "qcom,x1e80100-sndcard";
> +		model =3D "X1E80100-CRD";
> +		audio-routing =3D "WooferLeft IN", "WSA WSA_SPK1 OUT",
> +				"TweeterLeft IN", "WSA WSA_SPK2 OUT",

The model name is set to "X1E80100-CRD", which typically belongs to the
Qualcomm Reference Design.

Since userspace ALSA UCM configurations rely on a unique, board-specific
model name to apply the correct audio routing and mixer settings, will
reusing the CRD name cause userspace to load an incorrect audio profile for
this laptop?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260515172926.1659=
7-1-mail@etehtsea.me?part=3D3
