Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B0E4443E4A
	for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 11:09:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785323397; cv=none; b=Em/3b4P+NXNLdeZ7vVT2HjbvDFYh64VgMMED6cxw6WHBZ0EhNgXnntEhKFke8M9VtDaQ6Cu8YE6eSaN2nqiGbakn3mnpjwHBy37sasJCRJuWpvFGVPIfkk6XUgY5LYfvcGmAJTBU7MR1I9+pkhW5kiDL+YeNktGcfkGKmAwVGL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785323397; c=relaxed/simple;
	bh=0Ui/ZYcBNci5/ncy0KAudCDjTSBCmc3Xmu/aU3q6Jvk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=SBMKKc5kwBegD39ataakdJsEti6AHFRpXMU/EqleeTVQY4kjOwB+1SXUb/C/jVD3886x0ARkFhNPDOzT2WPxNtwdYiERk1u1t9mJKrSiGkoK9/Bk+eJ96ARfmcMdINpFUA8JGrb6yxXIQ+54Q1TKPjUdEt4PaDXgJ2pspCefYic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=P4nSuFRM; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="P4nSuFRM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0BEF1F000E9;
	Wed, 29 Jul 2026 11:09:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785323395;
	bh=eY1cndUhu07b5ZmSD7E6cnuPwNk4nW4d/HTkux98kG8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=P4nSuFRMyMtO16W3sWjGbPJcJmq8kfO9NgOrJAsX5DHTIFusd8JI6embtZ2onOfGg
	 TfiqUlzTr6vKarkPio/QUGcM5DE3Orm4lE+vth183V4NzxX3ybBRQdteorVg4RyG1g
	 bYBCXPJSf/BRrrsUq1JoXzA+dPTUCHqtRSUGOWi/z3lhAbhlH8EoBAHnVLpnRv/Pio
	 bC82qet2UquQmJmbC3bIDNa0q1rhGVAG+AhJRq8ZNwj162tX1aAYBnKAEhdrtG2ZY+
	 Mb7LjdETgEScjb+w+g4+KOR0F+jsvD+zzGZRio87KV4J3jTYkrYNlkvcAzwHckbkE1
	 QBKvZxksqJzTw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 1/3] arm64: dts: qcom: hamoa: Number usb_2 HS port
 and add M.2 endpoint stubs
Reply-To: sashiko-reviews@lists.linux.dev
To: "Wei Deng" <wei.deng@oss.qualcomm.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260729-hamoa-m2-dts-v2-v3-1-4d7ef9274575@oss.qualcomm.com>
References: <20260729-hamoa-m2-dts-v2-v3-0-4d7ef9274575@oss.qualcomm.com>
 <20260729-hamoa-m2-dts-v2-v3-1-4d7ef9274575@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 29 Jul 2026 11:09:55 +0000
Message-Id: <20260729110955.A0BEF1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] The M.2 USB 2.0 endpoint stub (`usb_2_m2_ep`) is incorrectly map=
ped to `port@1` in the `usb_2` DWC3 controller, which violates the DWC3 OF-=
graph schema.
- [Low] The commit message fails to mention the addition of the PCIe endpoi=
nt stub (`pcie4_port0_ep`).
--

--- Patch [1]: [PATCH v3 1/3] arm64: dts: qcom: hamoa: Number usb_2 HS port=
 and add M.2 endpoint stubs ---
commit 83adf4d287cf5b2273e244ab2fb06d8aa0806c46
Author: Wei Deng <wei.deng@oss.qualcomm.com>

arm64: dts: qcom: hamoa: Number usb_2 HS port and add M.2 endpoint stubs
   =20
Number the existing High-Speed data bus port of the usb_2 DWC3
controller as port@0, consistent with the snps,dwc3 binding convention.

Also add an empty port@1 endpoint stub (usb_2_m2_ep) for the USB 2.0
interface to M.2 peripherals, and an empty UART endpoint stub
(uart14_ep) in the uart14 serial controller, so that board DTS files
can reference these labels directly without re-entering the port
hierarchy.

> diff --git a/arch/arm64/boot/dts/qcom/hamoa.dtsi b/arch/arm64/boot/dts/qc=
om/hamoa.dtsi
> index 4ba751a65142b..dbe1bec0258ce 100644
> --- a/arch/arm64/boot/dts/qcom/hamoa.dtsi
> +++ b/arch/arm64/boot/dts/qcom/hamoa.dtsi
[ ... ]
> @@ -3843,6 +3848,11 @@ pcie4_port0: pcie@0 {
>  				#address-cells =3D <3>;
>  				#size-cells =3D <2>;
>  				ranges;
> +
> +				port {
> +					pcie4_port0_ep: endpoint {
> +					};
> +				};
>  			};

[Severity: Low]
This isn't a bug, but the commit message details the addition of the USB and
UART M.2 endpoint stubs without mentioning the addition of this PCIe endpoi=
nt
stub in the pcie4_port0 node.

Could the commit message be updated to mention pcie4_port0_ep as well?

[ ... ]
> @@ -5189,8 +5199,22 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
> =20
>  			status =3D "disabled";
> =20
> -			port {
> -				usb_2_dwc3_hs: endpoint {
> +			ports {
> +				#address-cells =3D <1>;
> +				#size-cells =3D <0>;
> +
> +				port@0 {
> +					reg =3D <0>;
> +
> +					usb_2_dwc3_hs: endpoint {
> +					};
> +				};
> +
> +				port@1 {
> +					reg =3D <1>;
> +
> +					usb_2_m2_ep: endpoint {
> +					};
>  				};
>  			};

[Severity: Medium]
Does mapping the M.2 USB 2.0 endpoint stub (usb_2_m2_ep) to port@1 in the u=
sb_2
controller violate the DWC3 OF-graph schema?

The snps,dwc3-common.yaml schema explicitly reserves port@0 for the High-Sp=
eed
(USB 2.0) bus and port@1 for the Super-Speed (USB 3.0) bus.

Since the usb_2 controller is a High-Speed-only controller, attaching a USB=
 2.0
interface to port@1 incorrectly models the hardware by attaching it to a
non-existent SuperSpeed port.

Could this cause dtbs_check validation failures or incorrect OF-graph parsi=
ng
in drivers that expect port@1 to strictly represent a SuperSpeed link?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260729-hamoa-m2-d=
ts-v2-v3-0-4d7ef9274575@oss.qualcomm.com?part=3D1
