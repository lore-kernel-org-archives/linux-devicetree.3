Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794736966;
	b=d0DuTyQ+KcqtVnHcF/+lne+rNb1ihHBQ+BiroRuEe6RhQL/uObmXTM70e8RVKa/9iq8Z
	 tebA9ppWFX5u2d+id1+8qER3VtucL3WYxEfL+BkHUbogndyXQfv1naiuI6r/v/xYSnR5x
	 44tUH0icwM4lVpEjLjj4SHTkPhYKoN/j4t88sYQ0cVX9Hb02/PS0L0RvsQcNswyP3DGhl
	 KxnLjjCzL7W+PJbsEEb2KS2iF972SnkQjQAKLkBgIRJZ7fExrDZkl7PG8G+S7pymF6gRi
	 J3dKAvR146Pj6/JiNFbSHPDHsohbZ0P73J4maQOi+j2Too0uubtq0X/c4KEiZ37lQtQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794736966;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=5o4pY2wXroSbGGGCyclcMAo2fhTRQLykBlTxy4hcPec=;
	b=ybUNC3EYl9UeNVtwUW9jDB8Z8O+q7n4dj5Z9mQfF0WsX4gEBtU+9mppIQs95WcRXjL0I
	 Rbni1tEZEm77V/5AQCsvMo5MHt/qdHZLpdVHipdxedjLnNtSUmzKeScF+4YpSvpqI1kSu
	 ig1qtAG8DempNwUJi8VsW7LQdvj8stQEfUrZikKSSHM6PWFQqpYRhhrEhdYlVNoLoc2v1
	 nJT8Vmz2Y4VvbW0iXzEjB+woAG6ShiUkfHTweBXDXv4fouV5bEHFr90RSo2bd4ZRWwx6L
	 0p0Id+BSH5ckKtAEERWGd1k1zazT6DzMj8Bijfw514t33EDBHr/NoQpu/zeGRyzODhQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="Bol/AyWC";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JdOul042;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73D22606A32C
	for <devicetree@vger.kernel.org>; Sun, 15 Nov 2026 10:02:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 73D22606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Bol/AyWC;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JdOul042
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AF7wFPE3140612
	for <devicetree@vger.kernel.org>; Sun, 15 Nov 2026 10:02:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5o4pY2wXroSbGGGCyclcMAo2fhTRQLykBlTxy4hcPec=; b=Bol/AyWCN6ZEcdfs
	TxAVv1dMooit387uEFZrlTAWoYmIC7f4+2zetFuBDwAX0Auiv0YX6W0tpNzpkQmz
	/UEOH3GbokV0tBawBrRfq9T8I+w82cbS2HqCAeahx761WqhEP6n1mCcj7NGVOCl7
	+AvbFV1vKPHAhT4ypjYXdLIRdlmwpl1PTW1P8aS9pvs/+/h0eGQk/bmTUUW0zbi7
	phkonx69CBS+g0k8Ce10pxYfWBh2QD2szta8TuKq5HD+o+ypQ+aV7LhLPafPg96u
	nVUafaGQC30hF4hdMCLLJ9QJkE0/JJs20Zkd8lFI6yz4HNiNmLdkq9fVuyyFBlVV
	GtIcLg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxhhdtq94-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 15 Nov 2026 10:02:44 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-9308eafb465so660932485a.2
        for <devicetree@vger.kernel.org>; Sun, 15 Nov 2026 02:02:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794736964; x=1795341764; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=5o4pY2wXroSbGGGCyclcMAo2fhTRQLykBlTxy4hcPec=;
        b=JdOul042eRxfGjWV1XZaVl4Ymnhwc3l7L8X2wrEUYTijlqJmnWZKEgoldSbx9yPade
         NAaMHGMqJILpAFDb8dNVFoqx3nLRor/VHiSB//3jRAwiDs4WysKiHO5zCT4KYVfhPT9I
         WUrgZWv+EAXK6xyC5tYP9PiiN05h3oIOaSAEFg8q4FHPLMV2ozr4G0hz8GNiDhPefpxQ
         vssPxmQ+zDUhflpvp3MFYkRo2CfThUBZUdoNZAmz3/ca4Nh91hwFkvlmIteSAGYz+O8d
         OJfoPqLrQv92McFuZ5oBKUiCZJVFjJrbDa+H7zZM0rsSI9CDxRvuLSOqNVbHkDpDjT//
         blqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794736964; x=1795341764;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5o4pY2wXroSbGGGCyclcMAo2fhTRQLykBlTxy4hcPec=;
        b=B77KCEt/vGhkDX3jXaa13qie9F/GYBevHK4SpUIr1PMJf4YUUA9TICPZXkmpBR4c9x
         aECpRDClwyBFkFI3TCBkVKk2qLn9szIHlenvt5JXlTA7fLbeLNx/1Psq7qQdGTFQDob2
         UHA9tk4hvAtZ/cOYilrGQeaTWhdLV0Qwv/gcbDF6Wnz68upPymqM6F8X0Ft8MprtUVNY
         ACe4SGl3KfwYQNlmn8+WW5GBRRNghSTeMiAitRKkTKcZUwiaOhLREGS3jN8mesZGBFWB
         YJQLqRtv/0E8kM0do962WJh6wIxOyHX02PRyP96l6G9T3Gja0greRF/Pe6z3bXB2d9wm
         7zCQ==
X-Forwarded-Encrypted: i=1; AL+hErGGrxo6KOErdi2zIuRyNYZLQaJzktU4O+qXz0jchCoFOnivRI4wYmP8x+skIuf74wfMXMuOZL4zg/VD@vger.kernel.org
X-Gm-Message-State: APuU4Z/J1TOJRs1ZRUAftQy5exii8T1fYWpRSJxJvz8NYZI5FMMEWy6t
	V0+9Hws763cwi3mumuqMrGYvPtiSXGE74+H/lZQtPh13UGhZhJvM4JLywdfWLfZIZuEOYONCNCJ
	//4nTn5YZFhTpxooHB9+fui7noavHU7tvHqYxj7YFXtcXslaIXcCMfDL/EOFMMSUb
X-Gm-Gg: AYBFou3CsPEciSY4wrJX07KZzPWrZiz2DleNStIB+B/DjOjEo/Vc4USsmkh2MKh/Fei
	TsILikXeixIkDO7xWUN1cf3OphJBYJ5w8153CTkrr2AhVp6u51uORAn4/AVhLxImyH9FpMhrAhr
	wirzC1tCCGAeKL+k7/hSd94SElQiNcqA5pz5qvcqhcMlkKQ78khxGRYY2QFgRxaa6chSKE1sU/V
	2nlW2ZT4+vthhG32jUB6m0IPu0rpPvZtoKdRew8TZUD3AND7ixur2aaMIQsqpJu5Azf4HzazKDd
	Wp9pDEtgkKZADZsWISCMVkORlNYKw0NCQlOK+ySk7ngQfnMUkmEetFgatvtkmx/BSt2o+BD5RtF
	/UWSG/yjSfeVQKWeSP0dmhkBn8mjdzVq9y9AIEiYP+0PGwwBcGxB4XeXRKmPWESNYvoTtqx2pE+
	9dhfpEvtBz68KLZuJqNQ==
X-Received: by 2002:a05:620a:4043:b0:93f:5519:5e87 with SMTP id af79cd13be357-9494b9c444dmr1229406585a.4.1794736963535;
        Sun, 15 Nov 2026 02:02:43 -0800 (PST)
X-Received: by 2002:a05:620a:4043:b0:93f:5519:5e87 with SMTP id af79cd13be357-9494b9c444dmr1229401885a.4.1794736963104;
        Sun, 15 Nov 2026 02:02:43 -0800 (PST)
Received: from [172.20.10.5] (82-132-234-47.dab.02.net. [82.132.234.47])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-c5095b6091dsm295722066b.57.2026.11.15.02.02.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 15 Nov 2026 02:02:41 -0800 (PST)
Message-ID: <f8e1ad25-f2ea-47eb-bb9e-79ee8dbbe598@oss.qualcomm.com>
Date: Sun, 15 Nov 2026 10:02:39 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/3] soundwire: qcom: check clk_prepare_enable() return
 values
To: Daniel Carter <yass27106@gmail.com>, krzk@kernel.org, andersson@kernel.org,
        broonie@kernel.org, srini@kernel.org, konradybcio@kernel.org
Cc: robh@kernel.org, conor+dt@kernel.org, vkoul@kernel.org, tiwai@suse.com,
        perex@perex.cz, lgirdwood@gmail.com, pierre-louis.bossart@linux.dev,
        yung-chuan.liao@linux.intel.com, abelvesa@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <2dc9301fc1ec46cdb66dc49a85f721b1@gmail.com>
 <d5888e6336644236bcb3dad4e28fdb5f@gmail.com>
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <d5888e6336644236bcb3dad4e28fdb5f@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=VOVIDNPX c=1 sm=1 tr=0 ts=6af98344 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=AI3hfGQ59aOwaD8qyfpUrw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=JloCQWs77Wql-FaIygoA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE1MDAzOSBTYWx0ZWRfX79MT+N7o2Fxk
 p39cAuEaty+HZj2Q7BKi7tG51/uXOklh62H8K5Z+v3M5bT6eASdq1Kl2fMBLv8WhqpSC8J+lGHJ
 cnirZ8CC0GPwunQS+KdVllSaoib1H1M=
X-Proofpoint-ORIG-GUID: TdU6ZbMQV-Mw2fvK49ABqkXL1un_uktq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE1MDAzOSBTYWx0ZWRfXyJmaJZnX700T
 saxuIStNNz24r2d4fggb8py8bVOd8pvfctDnhSRDumwbH8PwXjFy1XxeYhxvoRKf5m0yULBBgqg
 1TDJDduhc125IvywZ8OIo3Sdd0G5hP7JfbbiuMD/1kYyg+jiuNPGPtCN22CDZwPhgpWAYyedGP/
 FZq+EReXILwyYpatAbyMNIpJ+KqdyHCqAOmvOF5OjxiELb+CQNLxojyujLizQuSrJyiDdybUQRI
 0E8CptYoyoGPnW/RFSpJIvwXzMV59qi+E5H7cb/5jo7jpX7MdxNMELsjSStMackp2ZIr837kFFD
 DZLRP9nsXyYo8N7mi61FKi26PTze2ur3j2oLVb952Twblk9A5ycvmoLtDhBgiJQDB4Qky3oFEA6
 zXxYbqXm9BqJF2B1S+L1yMnThc9WTe2TKJ54HRwHyugvkL6P43uyw0akAdFzjzZO1SgxYAZ5/2S
 DkxJK2yJC1yt1dQCDPw==
X-Proofpoint-GUID: TdU6ZbMQV-Mw2fvK49ABqkXL1un_uktq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-15_03,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 suspectscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611150039

On 11/14/26 8:30 AM, Daniel Carter wrote:
> clk_prepare_enable() can fail; unchecked, the driver proceeds to
> touch registers with the interface clock off, which aborts on arm64.
> Check the return value in the interrupt handler (returning IRQ_NONE,
> as the interrupt status is not read or cleared on that path), in
> probe, and in the runtime resume path (returning the error without
> unmasking the level-high wake IRQ, which would storm while the slave
> keeps driving the line).
> 
> Fixes: 02efb49aa805 ("soundwire: qcom: add support for SoundWire controller")
> Fixes: 74e79da9fd46 ("soundwire: qcom: add runtime pm support")

Missing Cc Stable.
> Signed-off-by: Daniel Carter <yass27106@gmail.com>

Other than that, lgtm

Reviewed-by: Srinivas Kandagatla<srinivas.kandagatla@oss.qualcomm.com>

--Srini
> ---
>  drivers/soundwire/qcom.c | 14 +++++++++++---
>  1 file changed, 11 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
> index 6e0c5fb10ef..62a44f64dd8 100644
> --- a/drivers/soundwire/qcom.c
> +++ b/drivers/soundwire/qcom.c
> @@ -778,7 +778,9 @@ static irqreturn_t qcom_swrm_irq_handler(int irq, void *dev_id)
>  	u32 i;
>  	int devnum;
>  	int ret = IRQ_HANDLED;
> -	clk_prepare_enable(ctrl->hclk);
> +
> +	if (clk_prepare_enable(ctrl->hclk))
> +		return IRQ_NONE;
>  
>  	ctrl->reg_read(ctrl, ctrl->reg_layout[SWRM_REG_INTERRUPT_STATUS],
>  		       &intr_sts);
> @@ -1675,7 +1677,11 @@ static int qcom_swrm_probe(struct platform_device *pdev)
>  		goto err_init;
>  	}
>  
> -	clk_prepare_enable(ctrl->hclk);
> +	ret = clk_prepare_enable(ctrl->hclk);
> +	if (ret) {
> +		dev_err(dev, "unable to enable iface clock\n");
> +		goto err_init;
> +	}
>  
>  	ctrl->dev = dev;
>  	dev_set_drvdata(&pdev->dev, ctrl);
> @@ -1800,7 +1806,9 @@ static int __maybe_unused swrm_runtime_resume(struct device *dev)
>  			disable_irq_nosync(ctrl->wake_irq);
>  	}
>  
> -	clk_prepare_enable(ctrl->hclk);
> +	ret = clk_prepare_enable(ctrl->hclk);
> +	if (ret)
> +		return ret;
>  
>  	if (ctrl->clock_stop_not_supported) {
>  		reinit_completion(&ctrl->enumeration);

