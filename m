Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795563301;
	b=AKsspfnLSVHwpNM9AC2CTjKJuEpkBi+aRmISUR481qRpSeZzjgCzmWsJfYt+Kx6H81Xp
	 Gk/bAQYw+ysvvKwQ5uhnBktNbl0pLIRnQ8TKL6b5zmseezS588114I3tzTpBVM+eJuscH
	 W8Xy73su/ciPYxAiJhQ0XM8XsSHKEqGRv0ymwixresKpTZqVibjcGefb5hVhErtaArh+f
	 2PgsWzVMnBRWFRRPSd6y61ovPAIfbuTiJbW8/ppKdhP7YYnWH0K+PMIxkJpuiEmDnjsWO
	 xIHKxdc8ST8oJgLVHIU2OKmZ0ShHkRHGUvKuENgwrRIhSzrQjPIVc9Q58V8LN48N0Pg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795563301;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=5irmr6dz8sZhaUqo4G+HqkXcVe5osBnd5b3h465PGK8=;
	b=S1rMlHsEoSqx4/JrT68x3+SLLwY2eklrjnhe8emZt5+3+9r7W3A6QJzhFvtL295996Bj
	 60TAQzoy469pMp54cGBT2QF7puy747ItGT1rC/nVITQyLgtjRcdRDPwWrNxTw0pLZ9rjO
	 4zZCVAMC8IyqvQe+WF9evaKfxLxWB2P3MJ0hfonbYLBIcryQ3sLJuTsrITxRgJclWiL/B
	 IXiIfuXaPjBQoeYLE8fAifXbOvDMB877xek0sbsejxgWPP1veOuldGbuPABjdn7TE5NfK
	 cumzbXxqaO1aLQkGfUgEvkQFzUSvZj+PMVXudbp/dZyHzxm73LRBI2zvkVQkLA5Qduw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=C0AL+ehY;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F6B6606A31E
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 23:35:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=C0AL+ehY
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9906D1F000CA;
	Tue, 24 Nov 2026 23:35:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795563300;
	bh=5irmr6dz8sZhaUqo4G+HqkXcVe5osBnd5b3h465PGK8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=C0AL+ehYqcTvb4/neN8DnwLa4dvrjipb06Ff0RmRI2BGbXDRxa9Q+DM1/Lw/qCbTv
	 wqXbbXBjKPITqTgQYs+Kar0+2L6MGYmm/MzLrDHO624JvkwPPahxgG14uVVHfHgzMZ
	 tJbkaiD8rnSsmPlNXByduxnEiAd1Hxu8G32g08/RPbpqE04wAZReuT2Lr3TlSO7EDY
	 xjAP+wR10wa4f6liorasQ0JjpEKKDa7THI0HSyrADNrane4IgIRVytEGdCY7X7ArNg
	 23Svp0ek4YxoDUs6OtmyT2LgzUYlTwm3upKztM98QK0m1MDOhTSC2FUJ336s7xk4cN
	 I1fD3T4CxjCuQ==
Message-ID: <sashiko-outbox-232233@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: nord: use "hpass" label for adsp
 fastrpc node
Reply-To: sashiko-reviews@lists.linux.dev
To: "Anandu Krishnan E" <anandu.e@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261125-nord-label-change-v1-1-0d6292feddcc@oss.qualcomm.com>
References: <20261125-nord-label-change-v1-1-0d6292feddcc@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 24 Nov 2026 23:35:00 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [High] arm64: dts: qcom: nord: unsupported hpass label breaks
  fastrpc_rpmsg_probe()
--

commit 6e2c2cf46ca4dbe24b8cc691c2aa1d41ba3a3c10
Author: Anandu Krishnan E <anandu.e@oss.qualcomm.com>

arm64: dts: qcom: nord: use "hpass" label for adsp fastrpc node

This commit changes the label property of the ADSP FastRPC node in
nord.dtsi from "adsp" to "hpass".

> diff --git a/arch/arm64/boot/dts/qcom/nord.dtsi b/arch/arm64/boot/dts/qco=
m/nord.dtsi
> index 56778dd444e4e..5e15cdb2496da 100644
> --- a/arch/arm64/boot/dts/qcom/nord.dtsi
> +++ b/arch/arm64/boot/dts/qcom/nord.dtsi
> @@ -2224,7 +2224,7 @@ fastrpc {
>  					compatible =3D "qcom,nord-fastrpc",
>  						     "qcom,kaanapali-fastrpc";
>  					qcom,glink-channels =3D "fastrpcglink-apps-dsp";
> -					label =3D "adsp";
> +					label =3D "hpass";

[Severity: High]
Does setting label to "hpass" cause fastrpc_rpmsg_probe() to fail with
-EINVAL?

fastrpc_rpmsg_probe() passes the label string to fastrpc_get_domain_id(),
which only recognizes "adsp", "cdsp", "mdsp", "sdsp", and "gdsp" prefixes:

drivers/misc/fastrpc.c:fastrpc_get_domain_id() {
	if (!strncmp(domain, "adsp", 4))
		return ADSP_DOMAIN_ID;
	else if (!strncmp(domain, "cdsp", 4))
		return CDSP_DOMAIN_ID;
	else if (!strncmp(domain, "mdsp", 4))
		return MDSP_DOMAIN_ID;
	else if (!strncmp(domain, "sdsp", 4))
		return SDSP_DOMAIN_ID;
	else if (!strncmp(domain, "gdsp", 4))
		return GDSP_DOMAIN_ID;

	return -EINVAL;
}

With "hpass", fastrpc_get_domain_id() returns -EINVAL and
fastrpc_rpmsg_probe() aborts before initializing the remote heap or
registering the FastRPC device and compute context banks.

"hpass" is also not listed in the label enum in
Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml, which only
allows adsp, mdsp, sdsp, cdsp, cdsp1, cdsp2, cdsp3, gdsp0, and gdsp1.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261125-nord-label=
-change-v1-1-0d6292feddcc@oss.qualcomm.com?part=3D1
