Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA4E8480DCC
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 11:57:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778846262; cv=none; b=KlVm/KErUNzQctdWPdwpL+2TSfwlrHCpATMmYmAhzGvCuPpnwEr/aUfn3u7g0Uov1bvtmLeOFqr7bhgyDSBgJaN8bHbbW4bRbK27k7R8xwH7y5bdqNRyxtp1X976R8ettoAddhO+20ABCzSHcNVsuBS1UXjMuMW9pixfmrWWFUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778846262; c=relaxed/simple;
	bh=Hu8YhMpsxtkt8kG4O2zdPvhE0pyHxdVlB9UKK+8xIfs=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=e3YfbzyOlH5XxA3TV/affPlwe5+bylOgP7uyNfDitudnBZ7rVeJOdPMuhYqV397ag5GMi45V95OAue3mHcSUo867OL9+J0bk3FX87eh9ui/JDVbEfCAUXeKZngRbIkuYKzDGSNGcvu/1Pb8ZiHbQQH7OVS+m8LMNKmS7pQC8V6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MqWyzt0v; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MqWyzt0v"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57E07C2BCB0;
	Fri, 15 May 2026 11:57:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778846261;
	bh=Hu8YhMpsxtkt8kG4O2zdPvhE0pyHxdVlB9UKK+8xIfs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=MqWyzt0vHFdGLCsBEGj52edl1DGsKcU7/C8CDkZATAJl+nD0+7Foj+kX03D08YTz3
	 titFRIAE6pOsAIGc4+zr2kxrrrVWFWqmqUqcSMkEVPZGf88PF/FrmAvThjI8hyNRT4
	 +NWH9hOO2SgQJIOae1D9KUAKatNLU7/PZNLWn1kGd/G6pKKeCqnRZeSA0s5STYB/p/
	 MjldmD2UrhEH/C7T6E7wPVrKYsDG3vk/V13vPiFIl3wmZ8fmVyrWKBQXcgRAgKVNXo
	 ETDkaqaFr1hfw1g99mrV4VloaXlkrJB86Y33iiMNKjtfkI8ERYqtybmo4PDt7Q80B5
	 MN3FjNeC6tRjg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/3] media: dt-bindings: qcom: add JPEG encoder binding
Reply-To: sashiko-reviews@lists.linux.dev
To: "Atanas Filipov" <atanas.filipov@oss.qualcomm.com>
Cc: conor+dt@kernel.org, robh@kernel.org, krzk+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260515-qcom-jpeg-v4l2-v1-1-f38c2e1b3555@oss.qualcomm.com>
References: <20260515-qcom-jpeg-v4l2-v1-1-f38c2e1b3555@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 15 May 2026 11:57:40 +0000
Message-Id: <20260515115741.57E07C2BCB0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:
- [Medium] `clock-names` is omitted from the `required` list, which can lea=
d to runtime driver probe failures for otherwise valid DT nodes.
- [Low] The `cell-index` property is used in the example but is not defined=
 in the `properties` block, causing a schema validation error.
- [Low] The example uses C preprocessor macros without including the necess=
ary headers, causing `dt_binding_check` compilation to fail.
- [Low] The example uses a non-generic node name (`qcom,jpegenc@ac4e000`).
- [Low] The `reg` property in the example uses 64-bit addresses and sizes w=
ithout a parent node specifying the cell context, causing a schema validati=
on failure.
--

commit 8198eafe99ce53eb80a55ddd2b50d88c47749ec9
Author: Atanas Filipov <atanas.filipov@oss.qualcomm.com>

media: dt-bindings: qcom: add JPEG encoder binding

Add YAML device tree binding for the Qualcomm JPEG encoder hardware. This
binding is used by the newly added driver and describes all required
resources, including clocks, power domains, IOMMU mappings and interconnect
paths.

> diff --git a/Documentation/devicetree/bindings/media/qcom,jpeg-encoder.ya=
ml b/Documentation/devicetree/bindings/media/qcom,jpeg-encoder.yaml
> new file mode 100644
> index 0000000000000..fac3e654458d3
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/qcom,jpeg-encoder.yaml
[ ... ]
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - interrupts
> +  - power-domains
> +  - iommus
> +  - interconnects
> +  - interconnect-names

Should clock-names be included in this required list?=20

The binding mandates exactly 6 clocks and defines clock-names, but omits
clock-names from the required list. If a device tree node conforms to the
schema by omitting clock-names, the driver might fail to probe when fetching
clocks by string name.

> +
> +additionalProperties: false
> +
> +examples:
> +  - |

Does this example need dt-bindings header includes?=20

It uses macros like GIC_SPI, IRQ_TYPE_EDGE_RISING, CAM_CC_TITAN_TOP_GDSC, a=
nd
GCC_CAMERA_HF_AXI_CLK, but the headers defining them are missing. The device
tree compiler will fail with syntax errors because it expects integer values
rather than string tokens.

> +    qcom_jpeg_enc: qcom,jpegenc@ac4e000 {

This isn't a bug, but the node name qcom,jpegenc@ac4e000 does not use a
generic term. Would it be better to use a generic name like
jpeg-encoder@ac4e000 or video-codec@ac4e000 according to standard Device Tr=
ee
naming conventions?

> +        cell-index =3D <0>;

Should cell-index be defined in the properties block above?=20

Because additionalProperties is false at the top level, having cell-index in
the example without defining it in the schema will cause a schema validation
error.

> +        compatible =3D "qcom,qcm6490-jenc";
> +        reg =3D
> +            <0 0xac4e000 0 0x4000>,
> +            <0 0xac40000 0 0x1000>;

Will this reg property pass validation without a parent node specifying
#address-cells and #size-cells?=20

Since it uses four cells per entry, dtc will default to 1 for both address
and size, interpreting these 8 cells as 4 separate regions. This would
violate the maxItems: 2 constraint on the reg property.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260515-qcom-jpeg-=
v4l2-v1-0-f38c2e1b3555@oss.qualcomm.com?part=3D1
