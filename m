Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 513264A2617
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 14:28:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792074482; cv=none; b=Ih9ZRZsOY8BEDhuQJ368yzqv+LnuqfhnTiPRlmWo/8dzR5ZHUxFUJJTqo172CSVPWHCPcn9nPAQQSMJ6dOEmjd+IxspF5vcC3bGso+ZRgeJI5KWFJLDsbgl56GNSafQJBhbvOrj0u2PMbSXVicIoRuJDiQ55O9F5S74xoUrHShQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792074482; c=relaxed/simple;
	bh=2Wanu/5+jU4+6Z40Z2wUy9Ilv2ALiZYQG362ZkGSFRw=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=n51Fx33B8cu8bNdGOQTaJawNYbBGbV//zwpkiXSYxsMK9XWlvxY94ho8D7um16BqhlboXza+TSwD7nC7ypADcETFiGOa/pwBteOhtaiCPkQ1XR4l+8KriIc2nlflJDEo6UGijdzKRV7C07FP8gIAVNkcG/+Keqb4YedDeGYzvfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Q4dWNNn2; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Q4dWNNn2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B79D51F000C5;
	Thu, 15 Oct 2026 14:27:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792074480;
	bh=5RZ9dfbAzVRWRPUpVWWQCaHJTdKy1fOLUIkyGsAhExQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Q4dWNNn2qfOVBmO8nzUN6sGSVnqH+SgTiyChgnT2a7nh77RH367ydWP5QJ9s/L7Ge
	 Wnoh4qNlHcj0ToFYyNCb2VrNeCEy9Ow+jZweWcC4mDm++L3rq7fwwSPi2i2qPqDqio
	 kxpoRTvAixMa03v+Uh95A+OZxFvKOuquh9Ge9mcT8tVG1yM9MnJMkorH9l97KHVwzN
	 N4948axn4kwFd9dfimRpzEta1Mt3Z5fArCpRvk1d4hM7T1aZMfOZz6hD9XuX5fM0+p
	 12LQKqJ/AeXcfNdUjHHdJQfqaGijHgnsgyU9Q+jX5jgDCvAjq/gt9kDACdBSc+hnbn
	 mhmPngDLBQWuw==
Message-ID: <sashiko-outbox-172959@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v1 2/4] ASoC: codecs: pm4125: Fix MBHC button threshold
 programming
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mohammad Rafi Shaik" <mohammad.rafi.shaik@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261015-pm4125_mbhc_support-v1-2-8bc1212db6f7@oss.qualcomm.com>
References: <20261015-pm4125_mbhc_support-v1-0-8bc1212db6f7@oss.qualcomm.com>
 <20261015-pm4125_mbhc_support-v1-2-8bc1212db6f7@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 15 Oct 2026 14:27:59 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] pm4125: out-of-bounds register write in pm4125_mbhc_program_btn_th=
r()
--

commit 2cce30fa45a4f0c5ff81fb48ecba9f5d3b9f5681
Author: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>

ASoC: codecs: pm4125: Fix MBHC button threshold programming

This commit fixes MBHC button threshold programming by removing an
incorrect double shift of the threshold value before passing it to
snd_soc_component_write_field().

> diff --git a/sound/soc/codecs/pm4125.c b/sound/soc/codecs/pm4125.c
> index 674a2fbc4edae..923318c78d261 100644
> --- a/sound/soc/codecs/pm4125.c
> +++ b/sound/soc/codecs/pm4125.c
> @@ -981,7 +981,7 @@ static void pm4125_mbhc_program_btn_thr(struct snd_so=
c_component *component,
>  	for (i =3D 0; i < num_btn; i++) {
>  		vth =3D ((btn_high[i] * 2) / 25) & 0x3F;
>  		snd_soc_component_write_field(component, PM4125_ANA_MBHC_BTN0_ZDET_VRE=
F1 + i,
> -					      PM4125_ANA_MBHC_BTN0_THRESHOLD_MASK, vth << 2);
> +					      PM4125_ANA_MBHC_BTN0_THRESHOLD_MASK, vth);

[Severity: High]
Does this code write past the end of the button threshold registers?

The pm4125_probe() function sets cfg->num_btn =3D PM4125_MBHC_MAX_BUTTONS
(which is defined as 8). However, the PM4125 codec only has 5 button
threshold registers:

sound/soc/codecs/pm4125.h:
#define PM4125_ANA_MBHC_BTN0_ZDET_VREF1         (PM4125_ANA_BASE_ADDR+0x060)
...
#define PM4125_ANA_MBHC_BTN4_ZDET_DBG_1400      (PM4125_ANA_BASE_ADDR+0x064)
#define PM4125_ANA_MBHC_MICB2_RAMP              (PM4125_ANA_BASE_ADDR+0x065)
#define PM4125_ANA_MBHC_CTL_1                   (PM4125_ANA_BASE_ADDR+0x066)

Because the loop iterates 8 times, it writes threshold voltages into offsets
0x065, 0x066, and 0x067. Can this silently corrupt the adjacent
PM4125_ANA_MBHC_MICB2_RAMP, PM4125_ANA_MBHC_CTL_1, and
PM4125_ANA_MBHC_CTL_2 registers?

>  	}
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261015-pm4125_mbh=
c_support-v1-0-8bc1212db6f7@oss.qualcomm.com?part=3D2
