Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795675498;
	b=gI488BiWw18HruGKAfwuCTdS7dfuPb8u80/43TdGKsjJpgMKHTEg5jn7kwopAbOS6Mij
	 P1bbx45Sxudvs+324/ZK6FX59Bt1MhIjmKRubixUM0M1814+MSWhJpRzsLQnQDs+wEsXa
	 YDox/qGksqrbJsPNjHyCFKvvJJY/8T7DACm4MCQaNG/Uhj6TtU+cWnDpZmHK3R+gFdnsK
	 IaXr95nqedIeMS1XaWefrFaHjJr8YUfJB1aP5oHTGoQE70s645QZcAlNHCobvQE1xNkva
	 Z1iT7hYleG/+FWU3PFT2C3JnnmIzzLy+a5/6ID+SJxpRCR+wyQiBHGp5HyKnjmkRX9g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795675498;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=UJFC6Y+nb9Ne2tyaG8UOhCpLdvksHFDqRMq0C2pZPhg=;
	b=LH4HzXCF+WARFcYqgpXSsZm56lB4Afnew6a5SnCGwSSjb64Z72Z+A97A+3maxNiV3H9s
	 TnTy9R2YzxgEyvdnXtxQu5l+ZdC1vXRAju0wuw5mFGq7SvHZR5a0ToGe7wzXO/vpJ5Kc5
	 7LPn9Rf2f9FRnTXKu8ssR1DtEaPOo1y8PJTA34zYtWvxuGB3Enk+sx7eBb+Hd+xwhC9Ya
	 Fuw80GcoR1tJXfLLf9zxhiPPx5DC+wyNZpY5RtoCX17cj5HFYAtLbuKBwxANBCzTh7WKN
	 x1Pl5FdDseVtFFZge4xrYFnE/ul325JE/SZPUfHchpeL0/xLe9apd7jyDdG1lBzLLOg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kj+S6PFj;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86236606A31C
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 06:44:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kj+S6PFj
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DCAC31F000C0;
	Thu, 26 Nov 2026 06:44:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795675498;
	bh=UJFC6Y+nb9Ne2tyaG8UOhCpLdvksHFDqRMq0C2pZPhg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=kj+S6PFjmkqdtidHqH7M+0eud7MC9jmb1bqUH+tkpdfg3wBX7zoczXkaVb3mDyZvc
	 vHq38cjhUePG9HqVx8xAQV8atHUd2FnsirNR8OgNuGSL9rAkRAsMz0epE2bS7hwwtu
	 utxs5BHZY/eJtXg/hEQ7ET8SGFv6KaUUahxLQbw9tpycAnWN8fdzurbp33qltRYraf
	 za+o2cpfX1uabtlSDec6JOjTt+eAX1OStX3mO4VRgXA/8REu8F1Pe913rxttWv2kfn
	 XSGaQy3T+gNfMEAGNBdrd1+ChODVBZ5FWqGxKGlm8k0QdNJmk3b6F3F1VyvNh0eP/a
	 mv1IxuQXfaSfg==
Message-ID: <sashiko-outbox-234896@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 01/21] dt-bindings: display: msm: Add Qualcomm DCP
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jayant Shekhar" <jayant.shekhar@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, media-ci@linuxtv.org
In-Reply-To: <20261126-jshekhar-v3-dcp-v3-1-f1e9d7505039@oss.qualcomm.com>
References: <20261126-jshekhar-v3-dcp-v3-0-f1e9d7505039@oss.qualcomm.com>
 <20261126-jshekhar-v3-dcp-v3-1-f1e9d7505039@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 26 Nov 2026 06:44:57 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential
issues to consider:
- [Medium] dt-bindings: display: msm: qcom,dcp globally claims generic
  virtio,device34
- [Low] dt-bindings: display: msm: qcom,dcp: non-canonical property
  order in interface@
--

commit f399de20b9c1b05effa463501fa719abbb97394c
Author: Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>

dt-bindings: display: msm: Add Qualcomm DCP

This commit adds the Device Tree binding schema for the Qualcomm Display
Co-Processor (DCP) VirtIO display function.

> diff --git a/Documentation/devicetree/bindings/display/msm/qcom,dcp.yaml =
b/Documentation/devicetree/bindings/display/msm/qcom,dcp.yaml
> new file mode 100644
> index 0000000000000..ff7dc4e5c5eef
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/msm/qcom,dcp.yaml
> @@ -0,0 +1,159 @@

[ ... ]

> +properties:
> +  compatible:
> +    const: virtio,device34

[Severity: Medium]
Does defining compatible solely as const: virtio,device34 without a select
rule cause dtschema to apply this Qualcomm DCP schema globally to every
vendor-specific VirtIO device node?

VIRTIO_ID_VENDOR (0x34) is a generic device ID shared across all
vendor-specific VirtIO functions, and virtio_device_of_init() matches child
nodes against virtio,device<hex_id>.  Without select: false (assuming the
parent transport schema references this schema directly) or a device-specif=
ic
compatible string, dtbs_check will enforce Qualcomm DCP's required properti=
es
(iommus, ports, #address-cells, #size-cells) and unevaluatedProperties: fal=
se
on any non-DCP device using virtio,device34.  In addition, commit "virtio:
Add vendor-specific device ID" notes that device ID 52 (0x34) is only propo=
sed
for VirtIO TC allocation and not yet formally allocated, so hardcoding
virtio,device34 here ties the DT binding ABI to an unallocated ID.

[ ... ]

> +patternProperties:
> +  "^interface@[0-9a-f]+$":
> +    type: object
> +    properties:
> +      "#address-cells":
> +        const: 1
> +      "#size-cells":
> +        const: 0
> +      reg:
> +        maxItems: 1
> +        description: DCP INTF index matching the output port.

[Severity: Low]
This isn't a bug, but in ^interface@[0-9a-f]+$, reg should be listed before
#address-cells and #size-cells under properties to match the canonical DT
property ordering as well as this node's required list and example.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261126-jshekhar-v=
3-dcp-v3-0-f1e9d7505039@oss.qualcomm.com?part=3D1
