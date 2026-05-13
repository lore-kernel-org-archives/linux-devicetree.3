Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FD223A4F4F
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 19:55:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778702157; cv=none; b=s9Ni+VjDTj04GyEpPAQaI1aAIdH4ZODoVqj8K3shX6tPf1dKI30JsPxm2fvZCm6RVBLF7uuH0MVe1/PrSxfSzLT45c7l5Q7s8ppDDo8YeiK5J5RU0Nzj6cD5nJmvWT4CaytoHIuhlmEWknmR6VAzw2PMlbkRBtbeS+K5j9k85WM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778702157; c=relaxed/simple;
	bh=H8ogDzWQWVWuR3yODZfa5a2cK5JtHyD/NWLabGkLGH0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=s68NCa/HhNqYLhZv+Jr8VpVdNJfFRKqCLFUkSg/17RF6l7bPu8/EqsW28kyr6vXfGNJYjruDiiY/V3x1kOHOSPJ2XMKY7IG4rTcdhzFzDALgx1CC9mpWUauYXJnfCbOWBT4lKNVMFQNUf7G8lWSuw5Ez0PtoExKvCyfm1Wga+1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DP19xA4f; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DP19xA4f"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE038C19425;
	Wed, 13 May 2026 19:55:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778702157;
	bh=H8ogDzWQWVWuR3yODZfa5a2cK5JtHyD/NWLabGkLGH0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=DP19xA4f/SHtQ1cxfA5gZ2SYYsHNOFceUDlspyLccLx4FSf8iwpnI8TAL4q8au/Dt
	 P6pPR5X8NiAe0wZPFx4QPRMmotJghM7rY/6BtEfp+BnHhvU9OdhNT7XcJlOxC8r6cY
	 hTrfqpkZlB+qZ1iAlv6ZO4/HoxFMBjmh3GZ95O7wxSBYtvpux7kXglhW6BQcV/Q4J/
	 QvxOEQPZKPPo256dfVGSnT2+kP+yvE0O17OUx/jwrkw28gG3L6QUKxwHAUleagAI/R
	 WxsJoMdtN+/vQoSn+9/QUX9ccx2FCPvKzVaXi963t58cT4u3IEY66UvXC73Cl4IL9u
	 7vVz567AxXAew==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: lemans: Enable eud support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Akash Kumar" <akash.kumar@oss.qualcomm.com>
Cc: krzk+dt@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260512091422.1395490-1-akash.kumar@oss.qualcomm.com>
References: <20260512091422.1395490-1-akash.kumar@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 13 May 2026 19:55:56 +0000
Message-Id: <20260513195556.DE038C19425@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [High] EUD OF graph insertion breaks Type-C dual-role discovery and creat=
es uncoordinated role switch contention.
- [Medium] Missing `status =3D "disabled";` for the `eud` node in the SoC `=
.dtsi`.
- [Low] Missing SoC-specific compatible string for SA8775P.
- [Low] Incorrect Device Tree indentation in the `eud` ports block.
--

commit eb22943ea779d0aae264ce0f40299849c69660cb
Author: Akash Kumar <akash.kumar@oss.qualcomm.com>

arm64: dts: qcom: lemans: Enable eud support

This commit adds the EUD controller node in lemans.dtsi and updates the USB
HS endpoint routing on lemans-evk to pass through EUD instead of linking
the connector directly to the DWC3 HS controller.

> --- a/arch/arm64/boot/dts/qcom/lemans-evk.dts
> +++ b/arch/arm64/boot/dts/qcom/lemans-evk.dts

[ ... ]

> @@ -54,7 +54,7 @@ port@0 {
>  				reg =3D <0>;
> =20
>  				usb0_con_hs_ep: endpoint {
> -					remote-endpoint =3D <&usb_0_dwc3_hs>;
> +					remote-endpoint =3D <&eud_con>;
>  				};

By inserting the EUD node between the Type-C connector's High-Speed
endpoint and the DWC3 controller, the DWC3 controller is no longer an
immediate neighbor of the connector.

Standard Type-C role switch discovery (e.g., via
fwnode_usb_role_switch_get()) only checks immediate remote parents. Because
the EUD driver does not register a proxy role switch, does this cause
discovery via the HS path to fail?

While the Type-C Port Controller (hd3ss3220) on the EVK bypasses this failu=
re
by finding the DWC3 role switch via the directly-connected SuperSpeed
endpoint, both the EUD driver and the Type-C controller will independently
acquire and attempt to control the same DWC3 role switch.

Since the EUD driver unconditionally requests its interrupt handlers during
probe, will an EUD disconnect event force the role switch to USB_ROLE_HOST,
clobbering the Type-C controller's state without synchronization and
breaking standard OTG functionality?

> --- a/arch/arm64/boot/dts/qcom/lemans.dtsi
> +++ b/arch/arm64/boot/dts/qcom/lemans.dtsi

[ ... ]

> @@ -4003,6 +4003,32 @@ opp-384000000 {
>  			};
>  		};
> =20
> +		eud: eud@88e1000 {
> +			compatible =3D "qcom,sc7280-eud", "qcom,eud";

Device Tree binding rules for Qualcomm platforms strongly require providing
the exact SoC-specific compatible string first.

Should this include "qcom,sa8775p-eud" before the fallback compatibles to
allow for future SoC-specific driver quirks?

> +			reg =3D <0 0x88e1000 0 0x2000>,
> +				<0 0x88e3000 0 0x1000>;
> +			interrupts-extended =3D <&pdc 11 IRQ_TYPE_LEVEL_HIGH>;

Hardware controllers that depend on board-level physical routing (such as
the EUD, which requires Type-C connector OF graph wiring) are typically
disabled by default in the SoC .dtsi file.

Leaving the eud node globally enabled in lemans.dtsi means the qcom_eud
driver will unnecessarily probe on all downstream SA8775P boards, consuming
resources for unwired hardware.

Should this default to status =3D "disabled"; here and be explicitly overri=
dden
in lemans-evk.dts?

> +
> +			ports {
> +				#address-cells =3D <1>;
> +				#size-cells =3D <0>;
> +
> +			port@0 {
> +					reg =3D <0>;
> +
> +					eud_ep: endpoint {
> +					};
> +			};

This isn't a bug, but there is irregular indentation here. The port@0
block and its closing brace use 3 tabs, while the reg assignment uses 5 tab=
s,
misaligning it with the correctly formatted port@1 block below.

> +
> +				port@1 {
> +					reg =3D <1>;
> +
> +					eud_con: endpoint {
> +					};
> +				};
> +			};
> +		};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260512091422.1395=
490-1-akash.kumar@oss.qualcomm.com?part=3D1
