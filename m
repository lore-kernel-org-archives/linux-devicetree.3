Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6901D2E7F0A
	for <devicetree@vger.kernel.org>; Sun, 26 Jul 2026 06:00:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785045633; cv=none; b=MwDZatE7TxVYylYPjqiBO0Biq68JU8Lc3f07cpC0kSnMtPWdSiGzoOLHrszy1t40+GwXDZOR9Fhk2kWSfqIl+NQ8vY1bxbZmr3ggw9vSUS8auqFxCpJ1I4V1kEPfOak6irtlpz2zmAPfE/lyGBDH+CXSx36/qUuYdOSlg/jbsHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785045633; c=relaxed/simple;
	bh=bKOXqVDyOlIbEVPkYUr9iPJswmC8BymGTfdcKp+U0ZE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=bq60npKv7SZ/Jc/3C2qIOT7foV+J03ub/dNOza8s3vj4icyOG/SSCJ9cN6Kq0deACNUrt/p7bZocQ6L0b5/aWC9T8MZ3sjFH2syqF0z3/wXZh73Tij6143Dd6/fe4CTvunllULd853qbineNfh9rctLLB15qc3RGL+hMuLy3+1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eO+rrTAo; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eO+rrTAo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 861C81F000E9;
	Sun, 26 Jul 2026 06:00:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785045631;
	bh=ubyruswcslhK433T6jWyYvXlSQEkAqWJmPo0bVoyQtw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=eO+rrTAoGyB5GESkZwtBwILw8YVAlmZ7fa/Wg+R36YFnXhei6Xyx6Tj+tMpbdRH7U
	 men8jtMW9krnS9xnmpPViEP/Mok0VKMfhUAq7B3Xk9EGWPCeMqXy+bxYYDQyfwMjPQ
	 yB59fFs0KjFT4AM/ngpDm+NPkXAb9VzSGbl9EItASepnv4u1SdO/UDJ2aGoUiHQOGa
	 5twy5cb74swy8TVsppOF+xn9GFzj8akRxnMScXfOCoGUD+/exh58zUeiafVfLRlLt+
	 EH2sN9c9RW22EpfVU+1CaCQV9Z7RuqD6nVxOQExtr+uLSq+K0kWBL6pec3QVWixX/r
	 PMA0g8P0+V6KQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v10 01/14] dt-bindings: media: qcom,glymur-iris: Add
 glymur video codec
Reply-To: sashiko-reviews@lists.linux.dev
To: "Vishnu Reddy" <busanna.reddy@oss.qualcomm.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, media-ci@linuxtv.org, conor+dt@kernel.org
In-Reply-To: <20260726-glymur-v10-1-de451559e88b@oss.qualcomm.com>
References: <20260726-glymur-v10-0-de451559e88b@oss.qualcomm.com>
 <20260726-glymur-v10-1-de451559e88b@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 26 Jul 2026 06:00:31 +0000
Message-Id: <20260726060031.861C81F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The device tree binding incorrectly defines and requires `#address-=
cells` and `#size-cells`, forcing conformant device trees to trigger dtc wa=
rnings.
--

--- Patch [1]: [PATCH v10 01/14] dt-bindings: media: qcom,glymur-iris: Add =
glymur video codec ---
commit 6a8af4611de5993b1c0f3d458ae92b3f17956b81
Author: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>

dt-bindings: media: qcom,glymur-iris: Add glymur video codec

This commit adds the device tree binding for the Qualcomm Glymur Iris video
codec, a dual-core video IP. It increases the maxItems constraints for cloc=
ks
and power-domains in the common venus schema to accommodate the new
architecture.

> diff --git a/Documentation/devicetree/bindings/media/qcom,glymur-iris.yam=
l b/Documentation/devicetree/bindings/media/qcom,glymur-iris.yaml
> new file mode 100644
> index 0000000000000..1bb16206d859b
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/qcom,glymur-iris.yaml
[ ... ]
> +  interconnect-names:
> +    items:
> +      - const: cpu-cfg
> +      - const: video-mem
> +
> +  '#address-cells':
> +    const: 2
> +
> +  '#size-cells':
> +    const: 2
> +

[Severity: Low]
Does this binding unnecessarily define #address-cells and #size-cells?

Since none of the permitted child nodes (non-pixel, pixel, video-firmware, =
or
opp-table) have a reg property, and no ranges property is defined, wouldn't
enforcing these properties unconditionally trigger the dtc warning
avoid_unnecessary_addr_size?

> +  non-pixel:
> +    type: object
[ ... ]
> +required:
> +  - clocks
> +  - clock-names
> +  - compatible
> +  - dma-coherent
> +  - interconnects
> +  - interconnect-names
> +  - "#address-cells"
> +  - "#size-cells"

[Severity: Low]
Because these properties are marked as required, any conformant device tree
is forced to include them, which will result in the dtc warnings mentioned
above.

> +  - non-pixel
> +  - pixel
> +  - power-domains
[ ... ]
> +        resets =3D <&gcc_video_axi0c_clk_ares>,
> +                 <&gcc_video_axi0_clk_ares>,
> +                 <&videocc_mvs0c_freerun_clk_ares>,
> +                 <&videocc_mvs0_freerun_clk_ares>,
> +                 <&gcc_video_axi1_clk_ares>,
> +                 <&videocc_mvs1_freerun_clk_ares>;
> +        reset-names =3D "core_bus",
> +                      "vcodec0_bus",
> +                      "core",
> +                      "vcodec0_core",
> +                      "vcodec1_bus",
> +                      "vcodec1_core";
> +
> +        #address-cells =3D <2>;
> +        #size-cells =3D <2>;
> +

[Severity: Low]
Are these properties in the example block propagating this pattern?=20

By demonstrating them here, it enforces adding properties that aren't used =
by
the child nodes.

> +        non-pixel {
> +            iommus =3D <&apps_smmu 0x1940 0x0000>,
> +                     <&apps_smmu 0x1944 0x0000>,
> +                     <&apps_smmu 0x19e0 0x0000>;
> +            memory-region =3D <&iris_resv>;
> +        };

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260726-glymur-v10=
-0-de451559e88b@oss.qualcomm.com?part=3D1
