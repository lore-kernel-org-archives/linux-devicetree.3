Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F020A3D891C
	for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 09:59:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789034401; cv=none; b=kQcIw4PneuFpC9Qdjw/kijX5+xkSI+qCMTtB61gf+LmmccJT21LJ6jZGggIzLH8K5pdYnFgVMjifylT7Ff/mWLsdt+Pm9HrIBoz03ixwUT79Hb1+jU+RcsxOxSjEZcXYm6qMzfYE1GgSRIowJ6/PCkb88G1rPVbO8TYD+qHJN8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789034401; c=relaxed/simple;
	bh=dMXmfWQLOYuD8UYRnfRTFfu+W5VMod2V+EfLAQ6uhQ4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=pFeh+NVlaavw7V/yG8Q7BwWBwiTpfbSqStzcNWZKXz9m/oA45xYMom3U5BUYI+3/H27ZkxTlW14xWBS/6+t5Eyop03SJyyn9x356fLkKN8Al2lPg1QbY9YLrwr53OtfU/2WJCh+ddk8PaouUJTrK0CHCgZDLPkkJwMtDcQFfL3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nmOjLSjn; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nmOjLSjn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46DD51F000FF;
	Thu, 10 Sep 2026 09:59:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789034399;
	bh=LEaJ1M93uU+A+dmFT3NfM6HESN0ovt/2J3RgsOR2oAk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=nmOjLSjnpzvRLJ7qqKKJmwQXAdmj2FIRsNElMafyc+qnYgUm/AjV7DxWhDLl8+SSu
	 I0Qi321DBtoJI5ra7i2buz3TDr99QPlljd0dcQZgRfvDvmPuhaCxYMqrxeXa0yKPGh
	 iapIDd3B5VzeU6gKHQBply/T65M7xPpV+Ur5pCgI2L6Hy9A8ZeWAl/LH5UzOAGjG3k
	 H6GyG0/t9CObPsJRnVV6kvuU2NNjMIxmry4lq+Vw4YLdexl2n2c/bY3rfPhqbAJ8b8
	 Mv6imp9ULb82NeFDFZp0W4BCE88ONAsSbYxzT4wLymvFamvACJHE1Cg/IlFxXFk38T
	 SbySzvhH5l2ng==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 4/6] ASoC: qcom: lpass-rx-macro: Add shikra
 compatible
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mohammad Rafi Shaik" <mohammad.rafi.shaik@oss.qualcomm.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260910-add_shikra_support-v2-4-fdd2129c696c@oss.qualcomm.com>
References: <20260910-add_shikra_support-v2-0-fdd2129c696c@oss.qualcomm.com>
 <20260910-add_shikra_support-v2-4-fdd2129c696c@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 10 Sep 2026 09:59:58 +0000
Message-Id: <20260910095959.46DD51F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Data race on `rx_mclk_users` and MCLK enablement due to lack of sy=
nchronization across CCF and DAPM contexts.
--

commit 3459bbdd1dba9dbf895d5d3272f789b95e526f28
Author: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>

ASoC: qcom: lpass-rx-macro: Add shikra compatible

This commit adds shikra RX macro compatible data and hooks it into the
existing LPASS codec v4.1 flow. It reuses the v2.5 register access helpers
and bypasses the FS counter before enabling MCLK for codec versions 4.1
and later.

> diff --git a/sound/soc/codecs/lpass-rx-macro.c b/sound/soc/codecs/lpass-r=
x-macro.c
> index 2e74ec1a52f8a..83372123c9018 100644
> --- a/sound/soc/codecs/lpass-rx-macro.c
> +++ b/sound/soc/codecs/lpass-rx-macro.c
[ ... ]
> @@ -2045,6 +2047,16 @@ static int rx_macro_mclk_enable(struct rx_macro *r=
x, bool mclk_enable)
>  					   CDC_RX_CLK_MCLK2_ENABLE);
>  			regmap_update_bits(regmap, CDC_RX_CLK_RST_CTRL_FS_CNT_CONTROL,
>  					   CDC_RX_FS_MCLK_CNT_CLR_MASK, 0x00);
> +
> +			/*
> +			 * From LPASS codec v4.1 onwards the FS counter has to be
> +			 * bypassed before it is enabled, otherwise the fsgen
> +			 * output does not come up.
> +			 */
> +			if (rx->codec_version >=3D LPASS_CODEC_VERSION_4_1)
> +				regmap_set_bits(regmap, CDC_RX_CLK_RST_CTRL_FS_CNT_CONTROL,
> +						CDC_RX_FS_CNT_BYPASS);
> +

[Severity: High]
This is a pre-existing issue, but is there a risk of a data race on
rx_mclk_users and the MCLK enablement here?

It looks like this shared state is being read and mutated without a driver
lock across different contexts. For example, an unprivileged user can trigg=
er
DAPM events (e.g., via amixer or PCM start) which calls into this function
through rx_macro_mclk_event(). Concurrently, the Soundwire runtime PM or
clock framework can call into this via swclk_gate_enable().

If both paths invoke rx_macro_mclk_enable() simultaneously, could a
read-modify-write race on rx->rx_mclk_users occur, leading to lost incremen=
ts
or decrements?

If the increments are lost, can this result in the hardware clock being
prematurely disabled while a subsystem (like the Soundwire master) still
expects it to be running? Accessing unclocked registers on Qualcomm platfor=
ms
typically triggers an XPU violation, which might lead to an unrecoverable
kernel panic.

Would it make sense to introduce a lock to protect rx_mclk_users and the
corresponding register updates in this function?

>  			regmap_update_bits(regmap, CDC_RX_CLK_RST_CTRL_FS_CNT_CONTROL,
>  					   CDC_RX_FS_MCLK_CNT_EN_MASK,
>  					   CDC_RX_FS_MCLK_CNT_ENABLE);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260910-add_shikra=
_support-v2-0-fdd2129c696c@oss.qualcomm.com?part=3D4
