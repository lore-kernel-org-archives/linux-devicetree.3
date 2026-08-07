Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9BEC3A75B6
	for <devicetree@vger.kernel.org>; Fri,  7 Aug 2026 12:03:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786104218; cv=none; b=Fk53UZtAn8VjGHVUodFiNx7NIEjiSUex3Ed3kfpPy+2bNNfQ99VRTxY/hKYsp8Sxb5EMPlij1+qM+3QpF830yu0yJfQxE5VAvT3PSMBE6nIQsbtJpU/F52hegzpWXyvLtGLiA00YWVp4XcH1M7CXpaYUmSIQ5ythEcPjYVWzG10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786104218; c=relaxed/simple;
	bh=UNZyWHMjDB00/WmJD2Y/7xaGdll7FEt1L1dX63ShGxI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=h6Y0Kkj1u+jwkbl4RxZ2Kz97Qcp4O+r7lhXRPqtnjuqwzcSGpu1dCf876qGj6t6YRaAT2HVl9gzcQ3OvSLsMr6NGB9z6eINKc9dgvATIxYBnXjbxNjYuBV/lTQc39SgBENy2V2D7KS/iBNouMuHoqrZRWdLk80SL0jXsi7OEXL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=g1aV9V/l; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="g1aV9V/l"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C5B11F000E9;
	Fri,  7 Aug 2026 12:03:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786104201;
	bh=WWQBC/X+LMJCDrKjTAy/Wpgl5vR5A248VdRZudFC8BU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=g1aV9V/lPDrVRQXAElCFPS1v5Pmbng2z8SADRpBq6WwZeKqvqhdejnNjUwMs//6lH
	 vlCkk27gNBfU08mZBA0p21UYlcoAte7jxJVkuN76ej6nTdBKDEEyMHd2P/mduLolSk
	 rNqTck77RoCB/V15cxSyd8Vt3in30Zk787HjRJt6CAVhfcEHSyK3tTHmX44Ipxunmy
	 5gtABoX3zox9evSg7ZoCrQsTy0xH++4cXfO6Tk71Fd3BR10XoNrlYmv1s6VixPvXTa
	 Lio+BlZbf/hgCbMhtdnu1a13vGgH37vnrClB+W/frBYIylwYhciz7TOUv87hlaCAx7
	 6srG5vDWt6n4g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v1 2/3] interconnect: qcom: Add CAMNOC interconnect
 provider driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Atanas Filipov" <atanas.filipov@oss.qualcomm.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260807114951.4164439-3-atanas.filipov@oss.qualcomm.com>
References: <20260807114951.4164439-1-atanas.filipov@oss.qualcomm.com>
 <20260807114951.4164439-3-atanas.filipov@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 07 Aug 2026 12:03:20 +0000
Message-Id: <20260807120321.5C5B11F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Missing return value check for `icc_link_nodes()`.
--

--- Patch [2]: [PATCH v1 2/3] interconnect: qcom: Add CAMNOC interconnect p=
rovider driver ---
commit 210368acb417d0d403f4fd95176e70d2684711b8
Author: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
interconnect: qcom: Add CAMNOC interconnect provider driver

This commit introduces a new interconnect provider driver for the Qualcomm
Camera NOC (CAMNOC). It aggregates bandwidth requests from camera
sub-devices and adjusts the CAMNOC AXI clock rate to prevent a
last-writer-wins race condition.

> diff --git a/drivers/interconnect/qcom/qcom-camnoc.c b/drivers/interconne=
ct/qcom/qcom-camnoc.c
> new file mode 100644
> index 0000000000000..a5a4844915153
> --- /dev/null
> +++ b/drivers/interconnect/qcom/qcom-camnoc.c

[ ... ]

> +static int qcom_camnoc_probe(struct platform_device *pdev)
> +{

[ ... ]

> +	for (i =3D 0; i < CAMNOC_NUM_NODES; i++) {
> +		node =3D icc_node_create_dyn();
> +		if (IS_ERR(node)) {
> +			ret =3D PTR_ERR(node);
> +			goto err_remove;
> +		}
> +
> +		ret =3D icc_node_set_name(node, provider, camnoc_nodes[i]->name);
> +		if (ret) {
> +			icc_node_destroy(node->id);
> +			goto err_remove;
> +		}
> +
> +		node->data =3D (void *)camnoc_nodes[i];
> +		icc_node_add(node, provider);
> +		data->nodes[i] =3D node;
> +	}
> +
> +	icc_link_nodes(data->nodes[MASTER_CAMNOC_JPEG],
> +		       &data->nodes[SLAVE_CAMNOC_AXI]);
> +
> +	ret =3D icc_provider_register(provider);

[Severity: High]
Does this code need to check the return value of icc_link_nodes?

If the internal memory allocation in icc_link_nodes fails, it returns an
error code (such as -ENOMEM) and the interconnect link is not created.

Because the error is ignored, the driver will continue and register the
provider successfully despite being broken. Later, when consumers request a
path through this interconnect, the path lookup will fail with -ENOENT,
potentially causing consumer drivers to malfunction or fail to probe.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260807114951.4164=
439-1-atanas.filipov@oss.qualcomm.com?part=3D2
