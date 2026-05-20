Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA004239E76
	for <devicetree@vger.kernel.org>; Wed, 20 May 2026 19:08:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779304089; cv=none; b=VJRi2+lFWZzgJxs3nNMFcXKyXVt74tQpdAXbSFr9N6NqyoRITJu18AeDAgLANr2mRbibDyowGoiCk1opeKWT1IfaN4VK8Z4B/TBVj7SdGNwTmbqpCDuRsC1b24WFWVuKmieMM78OmNu/hKBVGotD0k0mR6svVm6ERuD8Y4RXb9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779304089; c=relaxed/simple;
	bh=q8M/88NsgvWcaWZoCqE8PcQ9T1YIepm8y4D3AgJU9Fo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=SJY8ykIsC6UDtFZOBHENr5WCdHcNorIXFDvBiaDhZdGBkY1EcMILdQZcK3chHVQ2tPzCG3OAN2NgoQawha1aArIkudXdANl839ZNbrlgYegi3FuCEE4oy5zOV4k9AcTWUIwadN7LcAQfP5cZnodWvih3XWXfNJlYoPetm0GHP8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U5q7Hljv; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U5q7Hljv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 509871F000E9;
	Wed, 20 May 2026 19:08:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779304087;
	bh=bGPK79O0nKKLADFHkavFm72Or8xf31L3eIXvjPB8S30=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=U5q7Hljv7G+GR3+zoR4k34pB/MvlBbrMWYjxl9Q1DtTK0TvoSh56TfKt3KbqmMEm5
	 yRyn1gRIDsMHOQGx654YHi5X55SyJm2aDXMS8zMozO0sDV7aJ6wqB4OcNDBxPOeucR
	 JGXKqcLwpIPoailhsR6u/1MANFfXXRBTlcRlGW+2BlssAXb/QbCDG3pYVPa8mOexJ8
	 cyKTksKVL46fFLAzNgIAvUXe2J51SxDoqeOWNZwwgmuItcfrnstWfMeF7taAzTcm1X
	 MLSVoALKRttEIAD7fhEXpY7pzWVkJlorv9FpqOfGPNEwtSU+Scsa4tsGxJJAoohgRO
	 vS9rnyxOyMFcg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/2] interconnect: qcom: x1e80100: Revert ABI break
Reply-To: sashiko-reviews@lists.linux.dev
To: "Krzysztof Kozlowski" <krzysztof.kozlowski@oss.qualcomm.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260520184944.182148-3-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260520184944.182148-3-krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 20 May 2026 19:08:06 +0000
Message-Id: <20260520190807.509871F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Returning directly on `-EPROBE_DEFER` during QoS clock initializat=
ion bypasses node cleanup, leaking nodes and causing a Use-After-Free on pr=
obe retry.
--

commit dc792c2aa6455fa0377849e9d95a326611b7bb15
Author: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
interconnect: qcom: x1e80100: Revert ABI break

This patch reverts the enablement of QoS configuration for the x1e80100=20
interconnect driver. It removes the QoS box definitions and the requirement
for QoS clocks, as QoS is not mandatory for the device to operate.

Closes: https://krzk.eu/#/builders/102/builds/70/steps/23/logs/warnings__3_

> diff --git a/drivers/interconnect/qcom/x1e80100.c b/drivers/interconnect/=
qcom/x1e80100.c
> index 8075e0ff20597..2ba2823c7860e 100644
> --- a/drivers/interconnect/qcom/x1e80100.c
> +++ b/drivers/interconnect/qcom/x1e80100.c
[ ... ]
> @@ -1795,21 +1466,11 @@ static struct qcom_icc_node * const aggre1_noc_no=
des[] =3D {
>  	[SLAVE_A1NOC_SNOC] =3D &qns_a1noc_snoc,
>  };
> =20
> -static const struct regmap_config x1e80100_aggre1_noc_regmap_config =3D {
> -	.reg_bits =3D 32,
> -	.reg_stride =3D 4,
> -	.val_bits =3D 32,
> -	.max_register =3D 0x14400,
> -	.fast_io =3D true,
> -};
> -
>  static const struct qcom_icc_desc x1e80100_aggre1_noc =3D {
> -	.config =3D &x1e80100_aggre1_noc_regmap_config,
>  	.nodes =3D aggre1_noc_nodes,
>  	.num_nodes =3D ARRAY_SIZE(aggre1_noc_nodes),
>  	.bcms =3D aggre1_noc_bcms,
>  	.num_bcms =3D ARRAY_SIZE(aggre1_noc_bcms),
> -	.qos_requires_clocks =3D true,
>  };

[Severity: High]
This is a pre-existing issue, but it looks like reverting the
qos_requires_clocks flag here might be masking a severe structural flaw
in qcom_icc_rpmh_probe() that triggers a use-after-free on probe retry.

In qcom_icc_rpmh_probe(), interconnect nodes are created via
icc_node_create_dyn() and added to the provider, with their pointers stored
in the driver's statically allocated qnodes definitions (qn->node).

If the subsequent call to devm_clk_bulk_get_all() returns -EPROBE_DEFER
(which only happens when qos_requires_clocks is true), the function
executes return dev_err_probe(...) and returns immediately. This completely
bypasses the err_remove_nodes cleanup path which calls icc_nodes_remove().

Because of this bypass:
1. The provider struct is freed by devres, but the nodes remain registered
globally in icc_idr with a dangling node->provider pointer.
2. On probe retry, the driver sees qn->node is already non-NULL and reuses
the old node.
3. The subsequent icc_node_add() hits WARN_ON(node->provider) (since it
points to the freed provider) and returns early without updating the pointe=
r.
4. Any later interconnect operation (like qcom_icc_set()) dereferences the
dangling node->provider, leading to a guaranteed use-after-free.

Does this framework bug explain why enabling the clocks broke the ABI and
caused warnings?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260520184944.1821=
48-3-krzysztof.kozlowski@oss.qualcomm.com?part=3D1
