Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11DE347534E
	for <devicetree@vger.kernel.org>; Wed,  7 Oct 2026 09:54:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791366853; cv=none; b=M8Q2FU3J0rHpSR4HzUNcR8ZrCb5yhoPPHwt5QuArX/5cP6SfW1K+dkdhGIZC12xHz64E6HsgcMkBsybwcjERb51GX5T1IH9nIVp/jbTRXsBRoRmnuiIDjF1egRPV1e4F2A/U577WSZZi3Wm3vG05coaV0cWqFyClG7tLmCUE/dU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791366853; c=relaxed/simple;
	bh=zMI+4zCyrb7LQgeE4kh9a0cBbmnln2wXw7smUdJGXdQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UKbKX+Yfpqz1ileEdMMAd3EnNXlE+JsnCOb7fWBNhXBRT1jb25H+FOYVWDDFDRAyPXiGijKw3Zthc/x/+2DogklPlaele4kF6uPaiLm7bOXB+g44BjSp/1KpyYlY2G++EdLXBn16+0lsbu6la5rvtrdr1CaMHeNOzgj7SVW/K6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TPy+Cw5Q; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FX7y++Lc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TPy+Cw5Q";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FX7y++Lc"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6977jaqr1873499
	for <devicetree@vger.kernel.org>; Wed, 7 Oct 2026 09:54:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LEY1HiXG+k0FBzAZcmArh1yUEuv93JP9npYHqIESvQw=; b=TPy+Cw5QB2vpNE2i
	5NgyeChwcjy5BH5Kvs3fL1GlKecMT25SK1OkvkoG4gJZmI67XYjtxOSXKkwG8suz
	vtqOuHAisUxjRc0EgL9XgVdyxKJirjBe6+KJjDUs31+Ujt8QPdqIiM6aKSKe9J99
	JNyMTeQoBU0WnyXr1HzrPt3KcIt6iQFEefR6243Q2srU43UuPROUpuVzZAeJtUzv
	d2lmM4Z3MRzZo8ZiOScasAY1IRWOyQRC6tZw8bbBGcMRwT751Q6ELACfjoJakz4Y
	oe4eoVyZD+iRrk4Fxwqdg9lhtWJw/q3ED4a4tbr4cj2Hv0MYd3T9KCz7E+8r/ozI
	vhduDQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5fw8ru7m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 07 Oct 2026 09:54:01 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3a6d95d6e08so3023190a91.1
        for <devicetree@vger.kernel.org>; Wed, 07 Oct 2026 02:54:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791366841; x=1791971641; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LEY1HiXG+k0FBzAZcmArh1yUEuv93JP9npYHqIESvQw=;
        b=FX7y++Lck37L97KppKD2VgKsAGsC6LC2mXh/tSK6hk/ozJ0t9BIFk0hCmfiYu3PuFx
         voJ+lXJHtGeZKUOtuleUSlLwIJ70BJ0aSjmXyN7O+bTRm6PvInleDf6Lx1uvqnTUcA+p
         tvtSvCH068QVQD9dbxnUTvYQyoTaLVMNBMJt9oHDq8M3p4Cb0z8OUmoVmQoNz9gnexTi
         8jZhNq3LxreWW9q0IIuYgitaaSvnUe9/w94fCgBwTqk5F2jGTDBfQX6Hev+WH1Icxy0D
         XKmoHStuL8yMz/VSxM+1ftBR9feMNENEbaXsw4FIftHbvJdnzh8L03lwX+Myvs0SxetR
         /8BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791366841; x=1791971641;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LEY1HiXG+k0FBzAZcmArh1yUEuv93JP9npYHqIESvQw=;
        b=h0TR7xvi7cM6DThDTCQZL1QSJXfLdpMSq9MYKLcfo/kjoTyLy3n2p416x+vwxikPpP
         NwCOGIQHltWCq2sB1PJMcll2gUj8BxkuiLwGRwsy90s4nQ4oZnyD3eWvIQo95kZxdNeE
         +gjdWZAI7UTK0x7F+2364Lb7PgqPFOJPtJhRuTmfWlazPAb9bz2K9gs37sEhYCfi41Mh
         itABiXm+bb9pwqPLt/GP+9k1MJaPSolrAIusi7OUEUYx0FtegzW9BkFjTm/WVoo3869x
         75XgOrK0efEM3y4EWjueUj2gwXWjvC2BpzBKZVvp6bgK7Q6Ke7SeI1xwC5X1h5WEsM0u
         Bc0g==
X-Forwarded-Encrypted: i=1; AKwUvBxFJFKSPSwsVUvnXZhdOWzpDZsss7AfauHIYGK6UZhAWgJ63Q1bl5HWm4z8zgIXngEaW6595TqqxVpc@vger.kernel.org
X-Gm-Message-State: AFq9FYKrV4G2BkdW6SBJ6p1qvDvlAbkH1tcSPfZHt7ziyEcuaRDd6nSd
	ifYHasLDTWqBfQHUn0HJ3Y+DdVprCTNbxG/N2ZDQEey2oMLMaFzNMblu3TJOHtSmQn5C09uK1LP
	H60LYLNthHpoLps60aVB/1Si8XY3cnxa/12RBFkzn4EjSsKdMD8Do7cp/whxcHd7j
X-Gm-Gg: AYBFou0Hei5w2MoZ/vtGPQCZ1wJxPC8vHQV5UxvEjIZNeXsHgzqaQW2D23hOSQ+aE/E
	b0dpJTvkQ365eWPjxg1bseZdWBCPqRkrVGLhr6z35Z15ZlsJaf56iUvUkCDrNhqsFWI0LXnLTKQ
	R90S5mGQY55KmkKGUFkToDapc7l8ZoBft0saJosRNav2Z4lMDRiTWhpjEhfXmXW0O8Q3N6Xd71E
	SvJkAgyY2hAH/B0gQFSVhJDHQcUnaZJ5hmIPKNxmGr2/PzHia428QOhTtRTIf3RaQ0VWtmY/opa
	RYpP2W0hwa3hunmLybMARyrNXUYzcAvpEZlvCoBfbUNBn55AAtV/5qOTNptXsMFtaneLY49wgsr
	MG/aSN9bpJ534Wnzu+OWWy7GnFZQ=
X-Received: by 2002:a17:90b:4a41:b0:3a0:4384:adf6 with SMTP id 98e67ed59e1d1-3a89f43624amr1437333a91.0.1791366841124;
        Wed, 07 Oct 2026 02:54:01 -0700 (PDT)
X-Received: by 2002:a17:90b:4a41:b0:3a0:4384:adf6 with SMTP id 98e67ed59e1d1-3a89f43624amr1437320a91.0.1791366840551;
        Wed, 07 Oct 2026 02:54:00 -0700 (PDT)
Received: from [10.218.18.193] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a8a60e5166sm1300131a91.4.2026.10.07.02.53.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Oct 2026 02:54:00 -0700 (PDT)
Message-ID: <8f75db55-66b2-4b94-b0bd-ccc52f08d197@oss.qualcomm.com>
Date: Wed, 7 Oct 2026 15:23:52 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] ASoC: cdns: Add Cadence I2S-MC controller driver
To: joakim.zhang@cixtech.com, lgirdwood@gmail.com, broonie@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        perex@perex.cz, tiwai@suse.com, p.zabel@pengutronix.de
Cc: cix-kernel-upstream@cixtech.com, linux-sound@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, ajay.nandam@oss.qualcomm.com
References: <20260928053613.2158446-1-joakim.zhang@cixtech.com>
 <20260928053613.2158446-5-joakim.zhang@cixtech.com>
Content-Language: en-US
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
In-Reply-To: <20260928053613.2158446-5-joakim.zhang@cixtech.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA3MDAzOSBTYWx0ZWRfX8kgh2D/Yj9NF
 hYF1nQah3eE5NpYbGsVoJPUaqkPFnDsPLxOkmT30YFqnbOLcVSe9xNhdwhSM5ObU+mspADfjkbf
 scEfmlIRf7lIPud2foNMX5vesf1gX+4=
X-Proofpoint-ORIG-GUID: SJPsnxunRykKc01bQul3j_mHnoyC1ANy
X-Proofpoint-GUID: SJPsnxunRykKc01bQul3j_mHnoyC1ANy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA3MDAzOSBTYWx0ZWRfX6lRMCvUiVvos
 RNXK/wUdzkDhU4gOqzZQ3pYcMFDwzBVzqcg/2vlayPkDTTdQaJ+LiBsXgMF1/B3D0HdSxV/tj0m
 odv/pHVVXZiK7QLtT2X00nDjSfXqRPmo5AxD8V1qQtgM8yWI1fERXNMGo1jvXB51RQHx/WtYFIS
 gbJGTfiONkcfuFkMHu39ATsWxXqW0tnfL+nhmsFIHKBX5L8eObDmIU7R0UjRHjeQMNq5OsN4k7X
 qHZYrlZadpn0ywIY+Wh9ibkjEyUpk/yF0hvq33IQbMpnIaDiheKPoLjymghnshfKUcQjqzhw21B
 Dp6AvuxbdTKRCbtTycG3m7rs9e+/pj6SopmyTe18ZXxVcyWa9oA4ukkvGFaMxMQ5CpF4EwE3ZCn
 LpzHrnFE2a0pcU0DEHSR7xTM/bpxfBUnxN0U5nRjH1+guNlDRLXAKcTGHGOi09iHT02AwZ8r9Sy
 XJVITQPwvvL46zUt7JA==
X-Authority-Analysis: v=2.4 cv=Af0kjHXG c=1 sm=1 tr=0 ts=6ac616b9 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=TAThrSAKAAAA:8 a=Krqe4lgBS7SFU2rUEjIA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22 a=8BaDVV8zVhUtoWX9exhy:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-07_03,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 adultscore=0 priorityscore=1501 spamscore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610070039



On 9/28/2026 11:06 AM, joakim.zhang@cixtech.com wrote:
> From: Joakim Zhang <joakim.zhang@cixtech.com>
> 
> Add support for the Cadence I2S-MC multi-channel controller found in
> the CIX SKY1 audio subsystem.
> 
> The controller moves up to 16 channels through a configurable set of
> its 8 data pins, each pin carrying two slots. Wired-out pins may sit
> at any pin index and are described by cix,pin-out-num, cix,pin-rx-mask
> and cix,pin-tx-mask. The driver exposes a transmit DAI and a receive
> DAI which can act as clock provider or consumer independently, and
> streams with fewer channels than the wired pins narrow the enabled
> pin mask at runtime.
> 
> The driver registers the dmaengine PCM helper, selects the audio
> reference clock parent for the 8 kHz or 11.025 kHz sample rate family
> and keeps the minimum functional-clock to bit-clock ratio required
> for safe clock domain crossing, with an extra margin cycle when the
> bit clock is sourced externally. Runtime and system suspend/resume
> restore the registers through the regcache.
> 
> Signed-off-by: Joakim Zhang <joakim.zhang@cixtech.com>
> ---

> +static void cdns_i2s_mc_rxtx_config(struct cdns_i2s_mc_priv *i2s_mc_priv, bool on,
> +				    u8 pin_mask, u32 strobe, u32 sync_rst)
> +{
> +	u32 irq_mask = 0, clk_mask = 0, i2s_mask = 0;
> +
> +	irq_mask |= FIELD_PREP(I2S_CID_CTRL_I2S_MASK, pin_mask);
> +
> +	clk_mask |= FIELD_PREP(I2S_CID_CTRL_I2S_STROBE, pin_mask) | strobe;
> +
> +	i2s_mask |= FIELD_PREP(I2S_CTRL_I2S_EN, pin_mask);
> +

This patch has the same build issue as the SC driver patch: 
cdns-i2s-mc.c uses FIELD_PREP() but does not include <linux/bitfield.h>.

ret = devm_snd_dmaengine_pcm_register(&pdev->dev, NULL, 0);
> +	if (ret)
> +		return dev_err_probe(&pdev->dev, ret,
> +				     "Failed to register dmaengine component\n");
> +
> +	pm_runtime_get_noresume(&pdev->dev);
> +	pm_runtime_set_active(&pdev->dev);
> +	ret = devm_pm_runtime_enable(&pdev->dev);
> +	if (ret)
> +		return dev_err_probe(&pdev->dev, ret, "Failed to enable runtime PM\n");
> +
> +	ret = cdns_i2s_mc_clks_enable(i2s_mc_priv);
> +	if (ret) {
> +		dev_err_probe(&pdev->dev, ret, "Failed to enable clocks\n");
> +		pm_runtime_put_noidle(&pdev->dev);
> +		return ret;
> +	}
> +
> +	cdns_i2s_mc_rst(i2s_mc_priv);
> +
> +	irq = platform_get_irq(pdev, 0);
> +	if (irq < 0)
> +		return irq;
> +	i2s_mc_priv->irq = irq;
> +
> +	ret = devm_request_irq(&pdev->dev, irq, cdns_i2s_mc_isr, 0,
> +			       dev_name(&pdev->dev), i2s_mc_priv);
> +	if (ret) {
> +		dev_err(&pdev->dev, "Failed to request irq: %d\n", ret);
> +		pm_runtime_put_noidle(&pdev->dev);
> +		return ret;
> +	}

After cdns_i2s_mc_clks_enable() succeeds, the platform_get_irq() failure 
path returns directly without disabling the clocks or dropping the 
runtime PM usage count. The devm_request_irq() failure path also calls 
pm_runtime_put_noidle(), but that will not run the runtime suspend 
callback, so the clocks enabled  manually above remain prepared/enabled.

Thanks
Ajay Kumar Nandam

> +
> +	/*
> +	 * Let pm_runtime_put_sync() disable the clocks, and take regcache effect.
> +	 * If CONFIG_PM is not enabled, the clock will stay powered.
