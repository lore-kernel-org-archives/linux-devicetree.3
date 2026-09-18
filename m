Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C71544F85B4
	for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 13:44:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789739042; cv=none; b=MaobbYhtX4NnEtrNka1WqjxVX/U6ErW8Q4LcVt3p/d/Kymrs1mIluaToiEhSCR4U+0BQTQiWDwYNHZzqY5/cwEKk93AKpkzRtve+f/aVQnFZ9Tvul7yblJDDRSlpcyeG/nreG2Y4yVomyG1TuMRn3lK6jkuuOT3r4jlQBTEQv2k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789739042; c=relaxed/simple;
	bh=C6rDwUvjmjOqpt4wZEMxf6encxALlNrtz7gB4Dm+IQw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pwuatwsAXeZ6lNI6Ao7Z2Ys6Sgz/oCHomvWek1/nPo6vCCuUVCQIyr/tphytyO5CI1dS3WcFnlmwFSzkX4j1fPthFWpFjwgk0sySxWOUnAa/E8kQcuWhBecowJOsHcJGTb4jNJGAOwhW7mijjVIfIH5HLNS4N77NKEpo11c8VRY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=H+ZaDLda; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VS/iRASm; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="H+ZaDLda";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VS/iRASm"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68IDOb1d1017013
	for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 13:43:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	R40LNzW/2/QtfddysHfgigjJCHidHFz25WJIuDBATmo=; b=H+ZaDLdayhTXvZUW
	MbSqPzkTlUSGS5ywuvjjmtIyDAYrOhehSGdtDSVY7EYK1JKK7QlLB4wZGw4ssoii
	OLLnKp5RaZqyVt+2qyVDJTyXTY+sSY7T2cG5vVQOiaxMdfP6NZpWHkcR1YTKgDJa
	VzSYh5sj4fG9O2Xzv1CwGHZ/PQULh6sHcBGckNEj4Tu+OK+nfhxE/hRIGD6jLCeG
	h5RNQeAhqXMphzwKdCsZk/Rh1MOU49n7l+a1LWGwnbQC+Qq9gXfJ9yuLckTX1+H0
	7QI7bOKgP/xR47cNPzWZD9Jmd47owVyqAI7+naRxM197qTphehlmh95zk6pPlw1r
	qYqi1g==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4grnqec6ux-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 13:43:59 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cc1bbd7d6e6so745502a12.3
        for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 06:43:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789739038; x=1790343838; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=R40LNzW/2/QtfddysHfgigjJCHidHFz25WJIuDBATmo=;
        b=VS/iRASmulVKUmoJ5qn1KubNS2IhcTDWxo/NTHd6vp/ZkpA89HVvxWgTCYmJnIt0q7
         q04cR5iE8Bpd5RygMT614jjxSERfvMwjU4FJ6LBwbJpXike9RG0QPwNTosZG6kCVhg8g
         g+MHVxdTR5fXmvn3oRhod4C9IVD+2oPlOAXTo5HIzvq5E05UYBI1FJ6yMOPrjKHjNsJj
         MklD6THbOwRbZ33ye1IDAqPh6N9wAzOG35BDnj+P9xn9VeQ7yJ5HGryIyz8dgl0AJWBQ
         0KhXy8VmS0LO2RLJ3Uw7i0EJIA1ReMaG2wck3ag25sbgY7aOpHJlt/Y+Y/3So+GVXaWz
         rJNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789739038; x=1790343838;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=R40LNzW/2/QtfddysHfgigjJCHidHFz25WJIuDBATmo=;
        b=AE5xHgs7yazA2WhfQytqMrJrJnU5EAugACrliwc2LbIqY/d7Z154mhzdtTxc3d+M41
         RpovDZuRyD2gP62IOPkrM9/GZHGb5356roi6BknDmUNoRQweWNlRVLDq/5Ldqhl5VGjy
         LhdsApqG1p7oAAbAc+2DZHmXpHozzNrwFy9pdrPBIwM5r98PENGs4VYbxcXThz7aPxQT
         EnG8/pI/SXu2ToYZ1g8LpI0iYoMNKFTGP51OuojGKSjyj3dAkcxn28mCsmA3mB1bgmrB
         wi/0AZ/0IDy0bcpNVNw21Zpf5ZfJcQ+xAcn1Xl48WIMOiEJJE4zkzMASq5BbCX6wHdl1
         SNFQ==
X-Forwarded-Encrypted: i=1; AKwUvBxY/ymHonMM1Q91R9v2Y1uNCj/yclWz9pRfVlxVdc37iklmouRYgyierU8kbdwcQ9yWe5UrvrEutk2F@vger.kernel.org
X-Gm-Message-State: AFuF++kAWni4QaCR+7IkWk7YTZ9pUbdBHCcQeeaPRsR5m9ckB8JCtku7
	eX/cCOTQ/RvddU4eHkWduBtNuN1G7/pUEFhU59VW8n4wUflbTvMtPNh673AVvd7LtS0QGoP2Ix4
	eyI+0dal/E7SQ/H/aYVgE6ZLMXiVKS5qxxOYAC1c4B/ERTsuVNzxVlrIuOreDTvsK
X-Gm-Gg: AYBFou2YcPqZuWtNY1Vbk/maHshZj2oQp8Yx+Bvh81+Nl0nbCt3Kmuk5ztDqrwIOwDS
	DzuNFLIvSIogzAqHVo0VDCwBFtJToSeO8MlFNn3wOI/4cwiJLUB8N/it9rNOCqHN06JYXI5FAfw
	02K6XXovIht+BbvacMNySbxG2VcySPtzRUOUOcvz+NCTsuNrJ9aphAwebajsH6NgQnxQq16bbpG
	u8KG3O8H5xt0VxBZn4l/DvUmh//pDFasdO3oO85bzug5Q7OWGRyc3KFz2wr2vV5tC3hc2rBURb1
	xyS8lD5QSke5A7NcbePRmlwvmW/82xjJ3bG/UyoeATo99ktqHA2i5my7rlCGTsNjjFWF3qPFjYt
	mRrqSUKzIs/0iU+NQNub2XLttt7PyKAqPvzNuIA==
X-Received: by 2002:a05:6300:2204:b0:3dd:85aa:d268 with SMTP id adf61e73a8af0-3dd8c57c3camr6733562637.32.1789739038328;
        Fri, 18 Sep 2026 06:43:58 -0700 (PDT)
X-Received: by 2002:a05:6300:2204:b0:3dd:85aa:d268 with SMTP id adf61e73a8af0-3dd8c57c3camr6733501637.32.1789739037909;
        Fri, 18 Sep 2026 06:43:57 -0700 (PDT)
Received: from [10.218.21.154] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc5c4eae6fbsm1010698a12.6.2026.09.18.06.43.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Sep 2026 06:43:57 -0700 (PDT)
Message-ID: <ba6bcf41-779f-4ad2-96f8-6fcb97ed7253@oss.qualcomm.com>
Date: Fri, 18 Sep 2026 19:13:50 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 01/10] ASoC: dt-bindings: qcom,shikra-qaif-cpu: Add
 binding
To: Harendra Gautam <harendra.gautam@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
        Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Sarath Ganapathiraju <sarath.ganapathiraju@oss.qualcomm.com>,
        Kumar Anurag Singh <kumar.singh@oss.qualcomm.com>
References: <20260911-b4-qaif-shikra-audio-v6-0-e9addb358201@oss.qualcomm.com>
 <20260911-b4-qaif-shikra-audio-v6-1-e9addb358201@oss.qualcomm.com>
Content-Language: en-US
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
In-Reply-To: <20260911-b4-qaif-shikra-audio-v6-1-e9addb358201@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: fhSLLJk-KS8CfTeEGNU1hBYi5mbOpwX7
X-Authority-Analysis: v=2.4 cv=FfiiV5+6 c=1 sm=1 tr=0 ts=6aad401f cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=cBTdkrXCvdqGFug1r-QA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-GUID: fhSLLJk-KS8CfTeEGNU1hBYi5mbOpwX7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE4MDE5NCBTYWx0ZWRfX++Lqgs5m2L/B
 RDoIQ3oVlq1nPBTJEQ5Sb7R2T85N8/Yjdc2TiIQXl7eMzFrh2XPkKtBCpyn8LozOz8sp9bHDaQz
 pvVEwR4gvrOIHLt2Ei/kWLGuuPTW9fjY6a1f57P3iNAhNLN0xu9c92MKpgzIXV+9I1YvCfGBrI0
 zzpH20jOvKMZGt7JzCcFlbipxZI6PJVKbnCUSOPL9C4g4M12G3g3xd0kGwYvfDeHx+bfJHgiPfa
 xTStPnPHifiEEMQQER8IAxrwIYG7VulxxnBNWZsZDS3n4gtEjC4BTZumu1t9Rb2hUZ2PPKit4Mk
 q4yERM8i8ibDoLpuSyjfr+NXiyw5vdmObMTuOn2Sm1qOizvNX46eC2O9E+pQKuect4uLz4X/B97
 uZfHoHBzWqIPSGGD4/w98GzQnaEFjh8JBYNMeQP2IT0a2H++DrfAj7RV0ujg/a/yziVytWClYV9
 b7Az2uRbbqmBuOf3F6g==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE4MDE5NCBTYWx0ZWRfXxDxj7FwP1XeF
 Oxu9dI3vxS33vpyW2kp44qgZL7WHU7kLe6Ma/tBylRUrtFjoDU9bjd8fSVkqNHHihv43hVxo1Rm
 JAF5gzNasAltYgLWC3M5oQDQhtffQRs=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-18_04,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 clxscore=1015 priorityscore=1501 spamscore=0
 bulkscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609180194



On 9/11/2026 2:47 PM, Harendra Gautam wrote:
> Add the Devicetree binding for the Qualcomm Audio Interface (QAIF) CPU DAI
> controller used on the Shikra audio platform, together with a dt-bindings
> header for QAIF DAI and AIF interface IDs.
> index 3a99703dbc4a..f08c20c84c60 100644
> --- a/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h
> +++ b/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h

Please drop this DAI ID change from this series.

I have posted a separate series for these DAI ID additions since they 
are required by other Qualcomm platforms as well.

https://lore.kernel.org/all/20260918-qaif_dai_id_support-v1-0-ed863c0e5e45@oss.qualcomm.com/

Keeping them separate avoids blocking those board enablements and allows 
this series to remain focused on the Shikra-specific changes.

Best Regards,
Rafi.

> @@ -156,6 +156,58 @@
>   #define LPI_MI2S_TX_5		150
>   #define LPI_MI2S_RX_6		151
>   #define LPI_MI2S_TX_6		152
> +#define AIF_MI2S_RX_0		153
> +#define AIF_MI2S_RX_1		154
> +#define AIF_MI2S_RX_2		155
> +#define AIF_MI2S_RX_3		156
> +#define AIF_MI2S_RX_4		157
> +#define AIF_MI2S_RX_5		158
> +#define AIF_MI2S_RX_6		159
> +#define AIF_MI2S_RX_7		160
> +#define AIF_MI2S_RX_8		161
> +#define AIF_MI2S_RX_9		162
> +#define AIF_MI2S_RX_10		163
> +#define AIF_MI2S_RX_11		164
> +#define AIF_MI2S_RX_12		165
> +#define AIF_MI2S_TX_0		166
> +#define AIF_MI2S_TX_1		167
> +#define AIF_MI2S_TX_2		168
> +#define AIF_MI2S_TX_3		169
> +#define AIF_MI2S_TX_4		170
> +#define AIF_MI2S_TX_5		171
> +#define AIF_MI2S_TX_6		172
> +#define AIF_MI2S_TX_7		173
> +#define AIF_MI2S_TX_8		174
> +#define AIF_MI2S_TX_9		175
> +#define AIF_MI2S_TX_10		176
> +#define AIF_MI2S_TX_11		177
> +#define AIF_MI2S_TX_12		178
> +#define AIF_TDM_RX_0		179
> +#define AIF_TDM_RX_1		180
> +#define AIF_TDM_RX_2		181
> +#define AIF_TDM_RX_3		182
> +#define AIF_TDM_RX_4		183
> +#define AIF_TDM_RX_5		184
> +#define AIF_TDM_RX_6		185
> +#define AIF_TDM_RX_7		186
> +#define AIF_TDM_RX_8		187
> +#define AIF_TDM_RX_9		188
> +#define AIF_TDM_RX_10		189
> +#define AIF_TDM_RX_11		190
> +#define AIF_TDM_RX_12		191
> +#define AIF_TDM_TX_0		192
> +#define AIF_TDM_TX_1		193
> +#define AIF_TDM_TX_2		194
> +#define AIF_TDM_TX_3		195
> +#define AIF_TDM_TX_4		196
> +#define AIF_TDM_TX_5		197
> +#define AIF_TDM_TX_6		198
> +#define AIF_TDM_TX_7		199
> +#define AIF_TDM_TX_8		200
> +#define AIF_TDM_TX_9		201
> +#define AIF_TDM_TX_10		202
> +#define AIF_TDM_TX_11		203
> +#define AIF_TDM_TX_12		204
>   
>   #define LPASS_CLK_ID_PRI_MI2S_IBIT	1
>   #define LPASS_CLK_ID_PRI_MI2S_EBIT	2
> 

