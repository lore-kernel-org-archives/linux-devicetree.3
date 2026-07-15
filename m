Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB6B3341660
	for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 14:22:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784125345; cv=none; b=Od8QeARrF5v4986Jwy1RmG61jnlEGF11NtZCTGC6E/aHv/6stY+XlZFt0za2BEF8DwPyGsSvnJWqzH9zYk3f1umLzzoCtq5/FHUqWhOV0J8EXmAA4Up76B2DIJVJAi6qL+hN5jMoHWqrAEOhZP7f2y1Xagdh9pfnQv1YTHyj1G4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784125345; c=relaxed/simple;
	bh=P37kUQ4vs1u7Grxe+A4HPyCFhRSUVIeLGmF2JEnTgc0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=uy2/Tcf3urcZAsG6/CpUDK868R5jvAy6x658aQiPLGoQheHSw2/070t4J25mS43F4d/Ynew0YqrjLyKLLEKL2HEAS8Lyk8wFmeziSRgD4y6ftoLATKUj1SHzvOuvDYWb+6dM1xQtiNc71l99ezJnGYm95YKkmB92jJjGKNvzp7A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Mn0ssgMg; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Mn0ssgMg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5FA721F00A3A;
	Wed, 15 Jul 2026 14:22:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784125344;
	bh=C74ppi/aF2wD3K36a/1eTvUuHBCv2GTf1Iuw5l272oc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Mn0ssgMgz07zKJj/mk99fez7rR+Uka+C8MAPTiAf4dBQpi7pWenO5a9cZMRcMTIRR
	 hfzq+V6dVgyxvrYzZ+heMOzICZcflDw0bH7hyDHSNzq0GixSKpiNXlzpC4UPL0qdzc
	 T6+iypHMgWXEv7OSvkpeZL2ejg3+yzf6q0Ozi47kD1BOA7n+yiDN27pkOqgJpoZKRm
	 Wyxl4sdzCGWEKNrPPaToIECUMg7UDAQnqpTvFTD4neHxr/VRP0bz/0A97p9R4nXxEr
	 9P5Ev3um+4aEzAEToqSnU560dNSLe4ygc9haThR+ZheBQ6WzEtUzheBQ3ikY5Cmzd2
	 gGSJ9zq0wIUBA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v9 01/14] dt-bindings: media: qcom,glymur-iris: Add
 glymur video codec
Reply-To: sashiko-reviews@lists.linux.dev
To: "Vishnu Reddy" <busanna.reddy@oss.qualcomm.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260715-glymur-v9-1-8cf2cbe12a07@oss.qualcomm.com>
References: <20260715-glymur-v9-0-8cf2cbe12a07@oss.qualcomm.com>
 <20260715-glymur-v9-1-8cf2cbe12a07@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 15 Jul 2026 14:22:23 +0000
Message-Id: <20260715142224.5FA721F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Unnecessary `#address-cells` and `#size-cells` properties on a node=
 without addressable children.
--

--- Patch [1]: [PATCH v9 01/14] dt-bindings: media: qcom,glymur-iris: Add g=
lymur video codec ---
commit 8ca344fa9395fcf1d13bd1ea93de8bee21a5c176
Author: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>

dt-bindings: media: qcom,glymur-iris: Add glymur video codec

This commit adds the device tree binding for the Qualcomm Glymur Iris video
codec. It introduces a new dual-core architecture requiring additional
power domains and clocks, and updates the maxItems limits in the common
venus schema to accommodate these changes.

> diff --git a/Documentation/devicetree/bindings/media/qcom,glymur-iris.yam=
l b/Documentation/devicetree/bindings/media/qcom,glymur-iris.yaml
> new file mode 100644
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/qcom,glymur-iris.yaml
> @@ -0,0 +1,255 @@
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

[Severity: Low]
Are these properties necessary here? The schema strictly enforces const: 2
for #address-cells and #size-cells at the root node, but none of the child
nodes (non-pixel, pixel, firmware) define a reg property, and the parent
does not define a ranges property.=20

Will this cause the DeviceTree compiler (dtc) to emit an=20
avoid_unnecessary_addr_size warning when compiling device trees using this
node?

> +
> +  non-pixel:
> +    type: object
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

[Severity: Low]
Does the example need #address-cells and #size-cells? It demonstrates their
use without any child nodes containing reg properties, which directly cause=
s a
dtc warning during dt_binding_check validation.

> +
> +        non-pixel {
> +            iommus =3D <&apps_smmu 0x1940 0x0000>,
> +                     <&apps_smmu 0x1944 0x0000>,
> +                     <&apps_smmu 0x19e0 0x0000>;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260715-glymur-v9-=
0-8cf2cbe12a07@oss.qualcomm.com?part=3D1
