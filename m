Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 332A547DD59
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 10:17:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784629070; cv=none; b=BE+lmQcnls3MEf0HQYZGvWvVaK108sNHubUZ3Fpo3QFhHCAsd1bD12rbuPn4qA0wi2ZorBBADnTuUKwHT7lpASNNIGpyErwX2409rn4hPMTO7lsCBJrNg33yk9aIKFT1WeAJp37a/Y/Pq/GjqqgqOxBGsBD2AUPS1P4UuOUnOOA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784629070; c=relaxed/simple;
	bh=4L+Snyn/wLEFjlqYUN27CU4KrGVShe99HLvKNBAmlDs=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=iXP85ryIH8n+Bp0asaMsq2N8sUYzoe8BQMnrN1+kVB2MwQC4gNa/rvEbA9A9XhHKAhoTH2FX9OGcA5KG9cUJD9ql7/DIkuABoZZc/x7mFJQzwcd98QB50bpoH89+g8A6vS66faKG/hOXUFYF5EvyqtDjQeLn0Keeh+BkNXsQnMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dZu5z9PD; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dZu5z9PD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F46A1F000E9;
	Tue, 21 Jul 2026 10:17:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784629068;
	bh=7uh7ycJz3qoaN1oRs2HNFIfJUTl2v/Jsyyv5bBG+G1M=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=dZu5z9PDfdBHIoTnynuFqtWRJ+M4qZ+mlBsQX4UrVTmUwbigck2rGwC37y9m5VoM8
	 OHvBqcy4ITu9ock7ev6CszZ+SjdEMz28vOx/Zhfct+r9j8JeNYpb2FUdessC2l6Hao
	 wYC0QjjmTJIXMyrWPiauU3pDoNlb+l4rhKG5CS0Vmf3L03Ue/1WFLyVCG9neg5ENW0
	 devhRvJd0GCEvrfTadoZ8gwd/4eFSS469thxvP0eOvRjKZt6Ap0LJtWo6ok3p0G+hA
	 uXRP5ENFRxCj6TDA8ZP+JroJW0tfZxsOxABz206clQ4AEL3eWDN/HLxuaHu36331zX
	 8EV12XZ+YpfnA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 1/4] arm64: dts: qcom: Add support for usb nodes on
 Shikra
Reply-To: sashiko-reviews@lists.linux.dev
To: "Krishna Kurapati" <krishna.kurapati@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260721-usb-shikra-dt-v4-v4-1-2e7a092d7f27@oss.qualcomm.com>
References: <20260721-usb-shikra-dt-v4-v4-0-2e7a092d7f27@oss.qualcomm.com>
 <20260721-usb-shikra-dt-v4-v4-1-2e7a092d7f27@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 21 Jul 2026 10:17:48 +0000
Message-Id: <20260721101748.7F46A1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Missing `interconnects` property in USB DWC3 nodes
- [Low] Device tree nodes are not sorted by unit address
--

--- Patch [1]: [PATCH v4 1/4] arm64: dts: qcom: Add support for usb nodes o=
n Shikra ---
commit 9fc8f1d9119cfd32b07a66f8220c54e03c7caa27
Author: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>

arm64: dts: qcom: Add support for usb nodes on Shikra

Add support for both USB controllers and their respective phys on Shikra.

> diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/q=
com/shikra.dtsi
> index 4e5bc9e17c8ed..7f5d584fc17ba 100644
> --- a/arch/arm64/boot/dts/qcom/shikra.dtsi
> +++ b/arch/arm64/boot/dts/qcom/shikra.dtsi

[ ... ]

> @@ -442,6 +443,85 @@ gcc: clock-controller@1400000 {
>  			#power-domain-cells =3D <1>;
>  		};
> =20
> +		usb_1_hsphy: phy@1613000 {
> +			compatible =3D "qcom,shikra-qusb2-phy";
> +			reg =3D <0x0 0x01613000 0x0 0x180>;

[ ... ]

> +		usb_2_hsphy: phy@1617000 {
> +			compatible =3D "qcom,shikra-qusb2-phy";
> +			reg =3D <0x0 0x01617000 0x0 0x180>;
> +
> +			clocks =3D <&gcc GCC_AHB2PHY_USB_CLK>,
> +				 <&rpmcc RPM_SMD_XO_CLK_SRC>;
> +			clock-names =3D "cfg_ahb", "ref";
> +
> +			resets =3D <&gcc GCC_QUSB2PHY_SEC_BCR>;
> +			nvmem-cells =3D <&qusb2_hstx_trim_2>;
> +			#phy-cells =3D <0>;
> +
> +			status =3D "disabled";
> +		};
> +
> +		usb_qmpphy: phy@1615000 {
> +			compatible =3D "qcom,shikra-qmp-usb3-dp-phy";
> +			reg =3D <0x0 0x01615000 0x0 0x2000>;

[Severity: Low]
This isn't a bug, but are these nodes sorted correctly by unit address?

The usb_2_hsphy node at 1617000 is placed before the usb_qmpphy node at
1615000, which doesn't follow the convention to sort sibling nodes
alphanumerically by their unit address.

[ ... ]

> @@ -493,6 +573,11 @@ qusb2_hstx_trim_1: hstx-trim@25b {
>  				bits =3D <1 4>;
>  			};
> =20
> +			qusb2_hstx_trim_2: hstx-trim@25a {
> +				reg =3D <0x25a 0x1>;
> +				bits =3D <4 4>;
> +			};

[Severity: Low]
This isn't a bug, but should hstx-trim@25a be placed before hstx-trim@25b
to maintain alphanumeric sorting by unit address?

[ ... ]

> @@ -640,6 +725,142 @@ &clk_virt SLAVE_QUP_CORE_0 RPM_ALWAYS_TAG>,
>  			};
>  		};
> =20
> +		usb_2: usb@4c00000 {
> +			compatible =3D "qcom,shikra-dwc3", "qcom,snps-dwc3";
> +			reg =3D <0x0 0x04c00000 0x0 0xfc100>;

[Severity: High]
Does this node need an interconnects property?

Without interconnects specified, the DWC3 core driver won't vote for
bandwidth. If other consumers drop their votes, the system NoC might thrott=
le
or gate the path, potentially causing USB DMA transfer stalls, device
disconnects, or system freezes.

Since of_icc_get returns NULL when the property is missing, the driver
will silently skip voting without showing probe errors.

[ ... ]

> +		usb_1: usb@4e00000 {
> +			compatible =3D "qcom,shikra-dwc3", "qcom,snps-dwc3";
> +			reg =3D <0x0 0x04e00000 0x0 0xfc100>;

[Severity: High]
Is the interconnects property missing here as well?

Similar to the usb_2 node, omitting interconnects might expose the hardware
to starvation if the system NoC throttles or gates the path when other
devices become idle.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260721-usb-shikra=
-dt-v4-v4-0-2e7a092d7f27@oss.qualcomm.com?part=3D1
