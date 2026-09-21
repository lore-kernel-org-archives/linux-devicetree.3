Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CB0F377011
	for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 19:17:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790018226; cv=none; b=lX29+YcAgxCYjXOCKAZZdLzjShnn8Zv3s8LLaLq5HORL0ddHzFWhzzqSOzLNuco229yu/qCmKAEIGqmCF3b/8z1iN5SUp/vhsgkxN58uSlxI/cpZKBzisFnqK2WMn6vw7oRV2zKgEN0L0L5wlmWv1y5HGJvhyx9x1geaZ2PfG3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790018226; c=relaxed/simple;
	bh=n5oHkYc/kCA+40tigWgEkxwrn9B9Q8rofM2uGk2xwgo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Td4aoexJzMzTNzpPpKU7VopM9c2+mhLiB4Wex6AGKYZsW/p8LlFJi9rEGi6xNC0kPI6J73/E9QkN8nKTmmcxHOD6Rcgi6rVYqLooiDDAPwQVYpNtWdLnBwTbFmoFrBm723Cug4g5cQP13r+qiconUX5E/I1/N8mwBiNQXVUX40g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=in4vk6m0; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="in4vk6m0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E18391F000FF;
	Mon, 21 Sep 2026 19:17:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790018225;
	bh=CnSR7u23xHFH0NnMmCJKdA8qTdSjM7QPN+8aNONV808=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=in4vk6m0YFWwyO5qYcTgYqSEEoQzozeYFYGZfln5cjykVEEMYHUweVAEA8U4yf9tb
	 ppB+KEqMvX+l7xhiz6U1R1CPICLOa2IAjBdXQfCGrljyjmbMEDhl/RjAF+c0nr2GyF
	 mGrvwqa0lDK0jGn4cNOT++BxMBMbsUf0K0DXtgSLCeV7N1KZcKFC0lietiKV2Ktjp/
	 W3fXClaLT5wXsjs1hRF0nd5Sx09lYWuFIpVRbmTRghOmFnRPRT7Sg22/hdYgnuq11Q
	 VWMnhGCSu5QU21K7ziSVl+5y2mb9/rBryhCx31sNxd2GwsAJnurCfHQI7nTfkn0dAL
	 ho9gSFgpmaRAA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 3/4] dt-bindings: sound: qcom,q6apm-dai: add
 memory-region and relax iommus
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ajay Kumar Nandam" <ajay.nandam@oss.qualcomm.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260922-vmid-v4-v5-3-e79cfd7af5b3@oss.qualcomm.com>
References: <20260922-vmid-v4-v5-0-e79cfd7af5b3@oss.qualcomm.com>
 <20260922-vmid-v4-v5-3-e79cfd7af5b3@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 21 Sep 2026 19:17:04 +0000
Message-Id: <20260921191704.E18391F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] dt-bindings: sound: q6apm-dai: schema allows omitting both iommu=
s and memory-region
--

commit 0ba7ab9d36bf919ab318abe00f3ad28279a11313
Author: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>

dt-bindings: sound: qcom,q6apm-dai: add memory-region and relax iommus

This commit adds an optional memory-region property for control-path
and data-path carveouts on modem-DSP platforms. It also removes iommus
from the required list because mDSP platforms lack IOMMU or VMID device
tree properties.

> diff --git a/Documentation/devicetree/bindings/sound/qcom,q6apm-dai.yaml =
b/Documentation/devicetree/bindings/sound/qcom,q6apm-dai.yaml
> index 9e5b30d9c6e62..7d0415f2463a5 100644
> --- a/Documentation/devicetree/bindings/sound/qcom,q6apm-dai.yaml
> +++ b/Documentation/devicetree/bindings/sound/qcom,q6apm-dai.yaml
> @@ -20,9 +20,19 @@ properties:
>      minItems: 1
>      maxItems: 2
> =20
> +  memory-region:
> +    minItems: 1
> +    maxItems: 2
> +    items:
> +      - description:
> +          Control-path buffer (audio_heap_mem) for platforms where the D=
SP
> +          runs in a stage-2 protected context (e.g. modem-DSP).
> +      - description:
> +          Data-path buffer pool from which per-stream DMA buffers are
> +          allocated.
> +
>  required:
>    - compatible
> -  - iommus

[Severity: Medium]
Does removing iommus here without adding a constraint like oneOf or anyOf
allow the schema to silently pass if both properties are omitted?

If a device tree is written without either iommus or memory-region, it looks
like it will incorrectly pass schema validation. At runtime, the driver wou=
ld
then allocate normal memory, and when the DSP attempts to access it, it cou=
ld
trigger an SMMU or stage-2 translation fault and crash the DSP/subsystem.

Should we add a structural constraint to enforce that at least one of the
memory protection mechanisms is specified?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260922-vmid-v4-v5=
-0-e79cfd7af5b3@oss.qualcomm.com?part=3D3
