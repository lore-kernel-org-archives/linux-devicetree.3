Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792424779;
	b=2xpjaU52Jzg+Jw2q4yALmORdNklPQ0U8cgbH2BJ9lHfkd6SbvU+FlJ1XS/CIuGAQC9to
	 k0k6yyZMdqwAiAqMRJ7zsAsk7beIVGF6IvEgridp094v50DCDxMzuE6PmLkys/olVfYiA
	 3rV1XWHQryKpjEKL96YfIHCWyjbFPHybq/zWElrO8ReA+AZOZVd67M4qyc8CP1nTNhAiY
	 /+ay7REBKuHgnkHw+invfNda8eVJXhh7RYBw8FwlsohzA3ahBhgSxh8lQRufxWXkXwqbo
	 0wl2Jm05Xos1swSNsq8nTU9MTAEpmh+jf7YE93REUXJx9sPOFh8IkVqwCMGzqP9gUsA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792424779;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=0mncnk6uXlG0geugZtvqjzFLKiEjYWgUPexAXKMn3ro=;
	b=SJ6G3QU10+7gukT5Ss1eV13OLBMcq76ICa0gfGrZJ8SnxORT29JwEwLn76FlEiQkcJPX
	 CziKrLaAIqKMDO+BfcDnmMDFvNoEKHRe+V6mpWP//nSk4TItTbZnibdQgKDxInIILvt+l
	 /eV6+Rz8Uv1XRlB4i2Wjyb0A4GRHcMa9mItFmoe7gfBK+Ele2Qfb9s98qqlGvKofwFR3V
	 QJBhEs4Xl5J031iUVg37dAJV0rojlLmL88dcBVT/fmijtL13e6maEzdyrJ/W33cOwJUVW
	 myXJRpMIh39ByQrEIoCp61fPptWNEePQiEV/dlb2SFPkU/CA/6658uAzy92Dx04VXAQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=is8Uq4jO;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54B11606EFC0
	for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 15:46:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=is8Uq4jO
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB77C1F000C4;
	Mon, 19 Oct 2026 15:46:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792424778;
	bh=0mncnk6uXlG0geugZtvqjzFLKiEjYWgUPexAXKMn3ro=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=is8Uq4jOfkyTQ5BD50dFBDF/ECbRNMHhpxp45zx1Fo6Fs84GhdyW2HO281pWcXNDJ
	 JE7v5uVmXPTa75nad7IN5/GCBIuvr68BlMP4J27TqnWHHkZjqNKsc/Dl48qHkCoFN9
	 6rAdQfpRvgAbDgY7DZDgHpf8awHKZNUbFAV/+o3ZxGCoBrbFaLFfkVQgdjb/gz5qQv
	 kh6MYZLssPyc0M00HiaehnFMgwt5t0/ok14rHC/fwdZW/Dj7QDZV+q6aLfLZNEHiRp
	 06IwhlyaBorZcvh0YpKuJQq2z7CEmIcJCbiQojf2yv92q1KmAYKsPpdBpFMPQK75Rt
	 geTyLaP8MmKfQ==
Message-ID: <sashiko-outbox-177785@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 5/8] interconnect: qcom: icc-rpm: Allow negative QoS
 offset
Reply-To: sashiko-reviews@lists.linux.dev
To: "Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261019-msm8998-icc-v1-5-c2da3934b6c8@oss.qualcomm.com>
References: <20261019-msm8998-icc-v1-0-c2da3934b6c8@oss.qualcomm.com>
 <20261019-msm8998-icc-v1-5-c2da3934b6c8@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 19 Oct 2026 15:46:18 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] interconnect: qcom: icc-rpm: qos_offset left unsigned in struct qco=
m_icc_desc
--

commit 3e9f9997842746ad0c0d3e4f86234e2fec24e800
Author: Konrad Dybcio <konradybcio@kernel.org>

interconnect: qcom: icc-rpm: Allow negative QoS offset

This commit changes qos_offset in struct qcom_icc_provider from unsigned int
to int to support negative QoS register offsets on platforms such as MSM899=
8.

> diff --git a/drivers/interconnect/qcom/icc-rpm.h b/drivers/interconnect/q=
com/icc-rpm.h
> index d2c5f45eeedf4..d0ffc042e926b 100644
> --- a/drivers/interconnect/qcom/icc-rpm.h
> +++ b/drivers/interconnect/qcom/icc-rpm.h
> @@ -57,7 +57,7 @@ struct qcom_icc_provider {
>  	struct icc_provider provider;
>  	enum qcom_icc_type type;
>  	struct regmap *regmap;
> -	unsigned int qos_offset;
> +	int qos_offset;
>  	u16 ab_coeff;
>  	u16 ib_coeff;
>  	u32 bus_clk_rate[QCOM_SMD_RPM_STATE_NUM];

[Severity: Low]
Should qos_offset in struct qcom_icc_desc also be changed from unsigned int
to int?

Platform interconnect drivers initialize qos_offset in struct qcom_icc_desc,
which is still declared as unsigned int in drivers/interconnect/qcom/icc-rp=
m.h:

struct qcom_icc_desc {
	...
	const struct regmap_config *regmap_cfg;
	unsigned int qos_offset;
	u16 ab_coeff;
	...
};

When a descriptor initializes qos_offset to a negative value (such as -0x300
on MSM8998 BIMC) and qnoc_probe() in drivers/interconnect/qcom/icc-rpm.c
copies it to the provider:

	qp->type =3D desc->type;
	qp->qos_offset =3D desc->qos_offset;

leaving desc->qos_offset unsigned causes an implicit negative-to-unsigned
conversion at initialization and an unsigned-to-signed conversion in
qnoc_probe().

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261019-msm8998-ic=
c-v1-0-c2da3934b6c8@oss.qualcomm.com?part=3D5
