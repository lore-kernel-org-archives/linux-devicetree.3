Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 017C94C754A
	for <devicetree@vger.kernel.org>; Fri, 25 Sep 2026 15:38:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790350703; cv=none; b=jBBX84sjYkGsvwJJqv9EWs+hzK+oFd7J36QNY+7NWnIMk37mVn5GVYpUa7sRAVmAqDDG/SBeeu9eVLi3EQoCplke/5LG9YDpRByVDQ6+hMZxUmBQa2O/Ybk879rAdNtgXd6ajz3D3ZgYchyD8kJd8wD5pVxZeOEZ6T3inxD9Fus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790350703; c=relaxed/simple;
	bh=raoB58ZXybqnjBD2hzje1gpzOwVeXjsPePLdcK2bPMU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=iJh21wh/CVIXtYvysTHpOMN5z+ISvQEXSy9rT946oE9iCOYIZ7tdUhVKu/+q2P5Hl0UZKTQKRRLPKnfGPBL/GKBISOcsKICrqD+8GN9xBEvgYoy1A4uG2m+z+NUSWpQDO4OgCBcnZZLJ2rnfnbI4LVfFojP6Evz3yrhJL7YbMMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XJqxrSEr; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XJqxrSEr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2FAEC1F000FF;
	Fri, 25 Sep 2026 15:38:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790350701;
	bh=6j7ZauPxOFra4GTSMX4cPaYATZpiJWTb0K4mJMvPGsg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=XJqxrSEr8LsqZNZ5QI3xj1O/WT8EnQsL3n84A82qJCIwC+KJbSGJzL1maxGMqnXFS
	 rYfkSYoFSDkYmoEOgTAL/Ql0BVHBRwpVxAAlLl5puvmZ3N+oksF7AxmD/ff4adgUwz
	 f0HTAsQpRsRKnqiCEl9ohZLsWbtqpK/m0kg0sCeHTZzEmC9M8X9F6erC1sntDpX5nc
	 9/TqxoBGkdrhC2DsHWabSLfU4oJpGURZr9ezghKfKDlgiq6r6HUagodQaAJ3VE1aEQ
	 L0VNlpHjZESCGgCVyxTRBFxfzalFqb4zIk4gWJyt+aj1BOUO8PxEimZpxwWMgCCVft
	 lx0nbTNfmIjXA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 1/7] ASoC: qcom: sdm845: Demystify TDM masks a bit
Reply-To: sashiko-reviews@lists.linux.dev
To: "David Heidelberg" <david@ixit.cz>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260925-pixel3-audio-v5-1-7ffb32c980bf@ixit.cz>
References: <20260925-pixel3-audio-v5-0-7ffb32c980bf@ixit.cz>
 <20260925-pixel3-audio-v5-1-7ffb32c980bf@ixit.cz>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 25 Sep 2026 15:38:20 +0000
Message-Id: <20260925153821.2FAEC1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] ASoC: qcom: semantic coupling of speaker and mic TDM masks
--

commit 69e096818ddd09fdfe14d66beb32de5193e59c35
Author: David Heidelberg <david@ixit.cz>
Subject: ASoC: qcom: sdm845: Demystify TDM masks a bit

This commit updates the sdm845 driver to replace magic numbers with explicit
bitmask definitions for the TDM slots. It aims to clarify which bits are us=
ed
for each RX and TX stream.

> diff --git a/sound/soc/qcom/sdm845.c b/sound/soc/qcom/sdm845.c
> index 6843ab8ba017e..0ce8265ab1c1f 100644
> --- a/sound/soc/qcom/sdm845.c
> +++ b/sound/soc/qcom/sdm845.c
> @@ -23,9 +23,14 @@
>  #define DEFAULT_MCLK_RATE		24576000
>  #define TDM_BCLK_RATE		6144000
>  #define MI2S_BCLK_RATE		1536000
> -#define LEFT_SPK_TDM_TX_MASK    0x30
> -#define RIGHT_SPK_TDM_TX_MASK   0xC0
> -#define SPK_TDM_RX_MASK         0x03
> +#define LEFT_SPK_TDM_RX_MASK	BIT(0)
> +#define RIGHT_SPK_TDM_RX_MASK	BIT(1)
> +#define SPK_TDM_RX_MASK		(LEFT_SPK_TDM_RX_MASK | RIGHT_SPK_TDM_RX_MASK)
> +#define MIC1_TDM_RX_MASK	BIT(2)
> +#define MIC2_TDM_RX_MASK	BIT(3)
> +#define MIC_TDM_RX_MASK		(MIC1_TDM_RX_MASK | MIC2_TDM_RX_MASK)

[Severity: Medium]
Since microphones act as a transmission source (TX), is it conceptually
incorrect to define their slots as an RX mask?

Naming microphone transmission slots as an RX mask seems to obscure the
true hardware architecture.

> +#define LEFT_SPK_TDM_TX_MASK	(BIT(4) | BIT(5))
> +#define RIGHT_SPK_TDM_TX_MASK	(BIT(6) | BIT(7))
>  #define NUM_TDM_SLOTS           8

[ ... ]

> @@ -128,8 +133,10 @@ static int sdm845_tdm_snd_hw_params(struct snd_pcm_s=
ubstream *substream,
>  			goto end;
>  		}
>  	} else {
> -		ret =3D snd_soc_dai_set_tdm_slot(cpu_dai, 0xf, 0,
> -				8, slot_width);
> +		ret =3D snd_soc_dai_set_tdm_slot(cpu_dai,
> +					       SPK_TDM_RX_MASK |
> +					       MIC_TDM_RX_MASK, 0,
> +					       NUM_TDM_SLOTS, slot_width);

[Severity: Medium]
Does applying the speaker playback mask to the microphone capture
configuration create a false semantic coupling?

Modifying the speaker playback slot assignments via the speaker mask will
unintentionally break the microphone capture slot assignments, as the
capture mask now directly aliases the playback mask.

>  		if (ret < 0) {
>  			dev_err(rtd->dev, "%s: failed to set tdm slot, err:%d\n",
>  					__func__, ret);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260925-pixel3-aud=
io-v5-0-7ffb32c980bf@ixit.cz?part=3D1
