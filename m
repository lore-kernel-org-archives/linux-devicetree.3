Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44D8A3CC323
	for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 06:48:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792133289; cv=none; b=KIavfNs9xJr/CI/iXcQfJ/UP/L2/ZLNLKYi7Aqlj3uLXMmDENo9GuP10Eo8P984ZdDtf48aufslZJUySQQkj9/v0QBslB3biqMa3UVeICdpsYs9NxW83EjM/GwgvQP2LgdmKolYts+hk+yBG9oFG780jtV9eR8uLKzaWjBRzVag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792133289; c=relaxed/simple;
	bh=ArpyCUcdXnNRQly4XkQ4s9u69ZZAMn3+U1oycCt3GcU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mvvO2n/c9C/u+mRVkghRKiH0DIPiLxPcre/QYR8P5ZghwNHGiPODgNxVItURTOTPKlBxJDoUvzgWJ9vgyDky1+5BPk/SqkVxGN6mTej0tuLe1c5xVuSZLJrm87eVDVlXpmASPtuRFhWVlCXkYWKXbCsapR/5hPd4Bm3enHC81sg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aMaUenMM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NZu+KRpu; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aMaUenMM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NZu+KRpu"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69G1CG3g1890815
	for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 06:48:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Pz0Akbts6DsXYURHmG6DvfbIIYwLAa3UJO6NTzI6f+0=; b=aMaUenMM0yE9Z8GD
	VSilD5dwzySdYN3/WbxhBBK0m8yHCTstbeuzdIElOU7fuLHS63bM4BIXsZrnY7+3
	aohuNchyVOgWW4shZu2qa6BXe6LV0kSem9A5Lc9yswyBmeJ6nOxDa9Shsne6D/JN
	X+iGQNoqKzSTIxGf7xVeI5GoAvSdiGnDlj01PNm3AiNa7P4ajFY2EyQ44xkUOguy
	7rbOL5B1z6aYL0Vd72qrMbwJdlKAyfKxnf7EPLRhkp20fXXEG51g2mEiqQARLbyv
	NYBtWhWZhg6S4388hHAhUeCZlzu/YTHkf/pAI0lMJyv03Uaq4/GHZY/JNToq2zep
	f/lOlg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hba2610sg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 06:48:00 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3abb4c24125so5460807a91.3
        for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 23:47:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792133279; x=1792738079; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Pz0Akbts6DsXYURHmG6DvfbIIYwLAa3UJO6NTzI6f+0=;
        b=NZu+KRpuIc/16w+J0vobgMs4LfGog2/NN+8WLHq999EDxXg+SC8Cam9tVXCNOq6nJT
         sQZp3qy8PpKB93TV5uMKUHaC2+m9+xk9wJZeiPGFW2G7l+O54bWRNhCDgJxrK4MYSooc
         GkAY3JOfd+TJKcxeocm1XcaDOyBwL9jzSo+4eKpqRxEaUd4YYsvPWr6LkS9h5iPl2M6A
         YMhl/Cf1HNBdT6prGhkmEk2IgYc4+KV7JPGkFxFsTH1c+3Ytar7HEEZ996SiuNGPN7mw
         BOYXN/N8/t8Har4lguI6vGl9ogINOaZzUmRZOS9RFRZZ+uOOuWNdWUro2ddeOeiMTbZl
         X5JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792133279; x=1792738079;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Pz0Akbts6DsXYURHmG6DvfbIIYwLAa3UJO6NTzI6f+0=;
        b=LP5PIA5hKHDziD+TjIuSLg5Krgc1soLOAfELo3X/PfQwLuF0Hh/qC4VxljsszepwyP
         PXLkC2PeVHqI7fleksiHG2sIBXzLK5w3XoWQmej/zXUbzYL7KAvXgyrWdbIYbmuBnLIT
         m9cKZidPlNC3M+x4x633dBxPCkZcVkJVfWM2a+iJr9u3Xx53m2CnbT9qv0ssN+sEqfW6
         AaZdvz8jSZ92sS3E+JrHg1HoBJXHlKyHvi3XoS4qkf3GLJ3i1kXqK/hOMeU6pU0Mu3cd
         9d8w4UBajiEAjO+htgw+G/SNKqcvwcDZ24dCarBZWpQ7FZ/dFeKe5Z9h0tqysxOvUdbv
         5fpA==
X-Forwarded-Encrypted: i=1; AKwUvBzqBJITTaNxW4a3Fc8/fgFWT1vugIFTPTpn656hWXo6lbmL2fnBpFjkrdQeF/MbirlvxGsvSCR96uzm@vger.kernel.org
X-Gm-Message-State: AFq9FYK4g0PhGb7dt63EV1nOWFUIYZIcmwxNMmWVnSPJTH2kBfQrAlu/
	U3plfnaW5eioipUT/RpXAFmO/9H8ktIxC51OZnPiRk3jwAz4zlEd91Vgiq9F3EXb3mTMCxpR/pu
	wlvX8YlqpJN0yCLeaaYC/XG4dXinU6kIMPZ6Ql1Xa6H2jczLqNKtdy3J4y5JO3z5X
X-Gm-Gg: AYBFou0kLbtDLBPvuimWl/Gvgt86EXcfNiURiCCKsPQlgfQ7o0QW3Xq/30Nsfpb5m1x
	xJZ8MftCNAjN/P5T1L7GXSefUv5g4hM9/0REW4axQILVVjvylAVr6Ti6ELda9imIlHxhmbFKPWO
	hmzaGCcFOiz2hYnRbI05t/B7+IVf9asDc9vfHtyrl7LKiDEhQMljgCqOpEMZxE0ezOB4u1HjD2Q
	vRsiJR+9SveFWAj65NU+TfSoVPg2tVCQIsKKF2HQYwWaup8JcMN0d2PMCVWxyUjManZgRmrxRcH
	GC6Q+9R01PdUFaAw67ucasAnV7gWkuj31DYSUIa5KgpeR6HiAGEgmRqrRQcIul9bIBr49O1VQcA
	klyf5hvuYx14hlE4aXDnUbW0m/gM=
X-Received: by 2002:a17:90b:4d0f:b0:3ac:97e3:73a3 with SMTP id 98e67ed59e1d1-3ac97e3ca4bmr4148877a91.6.1792133279153;
        Thu, 15 Oct 2026 23:47:59 -0700 (PDT)
X-Received: by 2002:a17:90b:4d0f:b0:3ac:97e3:73a3 with SMTP id 98e67ed59e1d1-3ac97e3ca4bmr4148830a91.6.1792133277770;
        Thu, 15 Oct 2026 23:47:57 -0700 (PDT)
Received: from [10.218.18.193] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3acc487e509sm2669257a91.9.2026.10.15.23.47.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Oct 2026 23:47:57 -0700 (PDT)
Message-ID: <b907dea8-d2eb-4237-b316-6d96c81a5b33@oss.qualcomm.com>
Date: Fri, 16 Oct 2026 12:17:50 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/4] ASoC: dt-bindings: qcom,pm4125-codec: Add the MBHC
 jack properties
To: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Alexey Klimov <alexey.klimov@linaro.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        ajay.nandam@oss.qualcomm.com, ajay.nandam@oss.qualcomm.com
References: <20261015-pm4125_mbhc_support-v1-0-8bc1212db6f7@oss.qualcomm.com>
 <20261015-pm4125_mbhc_support-v1-1-8bc1212db6f7@oss.qualcomm.com>
Content-Language: en-US
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
In-Reply-To: <20261015-pm4125_mbhc_support-v1-1-8bc1212db6f7@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=bsHZl0ai c=1 sm=1 tr=0 ts=6ad1c8a0 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=xz_OTyItpRnlL1KGmssA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDAyNiBTYWx0ZWRfX8PaLfJrQe3GV
 Q6/fwlmV4nOvuO4eGNe7tBzeqje2TrFqLOxecG/BpY6kXzDEZXYMdKClMkQ95X1luGKplRMSCU9
 wP0Sm6OiWvgo/m4umiK89y7aEKgvE/5lZrXWOIDK43B5hEtO82SmL2UXugLLXsxbif+h6JY6rJp
 T+lvCh1VhksekSDuPsvCSFN7VRbD0YUXaNz6kchWrn/e2oHYd36f+C6HH3iOByh3z8ewAd8FjhX
 MEzvcyXjq08XHqen1ao3j8iCiD/bfmbbEBOq5F21aFWTyZ/ApXLw1+y7EeEjtPBQJFsXUlcypUM
 k5LF3mQA/F+vzDfCDh5U2VQrhjJnJrn3Rx47YH3yXVnyHztqyt0aHOMSpBxKPWzYUpTFZvH3cOu
 8xS3Ql6YoTAI0gKdZBs2jx7VqQJ6Ly2pkL+WTJy5znAEVnA+UXwmA9gXjSpK6J/UJhVGXs8iIty
 sYoo8X7UkpnrYlKGfTg==
X-Proofpoint-ORIG-GUID: z3ubwFm3CyyHoA4GFKIBOS3fTxPhYW_6
X-Proofpoint-GUID: z3ubwFm3CyyHoA4GFKIBOS3fTxPhYW_6
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDAyNiBTYWx0ZWRfX9WkCvtWrvngm
 gHIM/uqS2wfltq557t02K6f2ihP5BrdPnZsoIdUePKFpdRnfridj1ecnwZbsDCvCcs878gM4IdI
 KfLTzAMbZxjVpo3fTtCw774U19NeItQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 bulkscore=0 malwarescore=0 impostorscore=0
 suspectscore=0 phishscore=0 spamscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610160026



On 10/15/2026 7:43 PM, Mohammad Rafi Shaik wrote:
> The binding already describes qcom,mbhc-buttons-vthreshold-microvolt,
> but not the rest of the data the MBHC block needs to detect a 3.5mm
> jack, even though wcd_dt_parse_mbhc_data() reads all of it from the
> codec node and the schema has unevaluatedProperties set to false. A
> board that describes its jack is therefore rejected by the schema.
> 
> Document the remaining four properties, matching the descriptions used
> for the same properties in qcom,wcd93xx-common.yaml:
> 
>   - qcom,hphl-jack-type-normally-closed and
>     qcom,ground-jack-type-normally-closed describe the board's jack
>     switches. The MBHC logic has to know the idle state of the HPHL and
>     ground switches to tell an insertion from a removal.
>   - qcom,mbhc-headset-vthreshold-microvolt and
>     qcom,mbhc-headphone-vthreshold-microvolt are the ADC thresholds that
>     separate a headset from a headphone and a headphone from a floating
>     jack. They are board specific because they depend on the jack
>     wiring and on the microphone bias voltage they are measured against.
> 
> All four stay optional, as they are for the wcd93xx codecs: the driver
> derives the thresholds from the microphone bias voltage when they are
> absent and assumes normally open switches, so existing device trees
> keep working unchanged.
> 
> Assisted-by: Claude Opus 5
> Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
> ---
>   .../devicetree/bindings/sound/qcom,pm4125-codec.yaml   | 18 ++++++++++++++++++
>   1 file changed, 18 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/sound/qcom,pm4125-codec.yaml b/Documentation/devicetree/bindings/sound/qcom,pm4125-codec.yaml
> index 6e2f103be..54e5b7607 100644
> --- a/Documentation/devicetree/bindings/sound/qcom,pm4125-codec.yaml
> +++ b/Documentation/devicetree/bindings/sound/qcom,pm4125-codec.yaml
> @@ -64,6 +64,24 @@ properties:
>       minimum: 1800000
>       maximum: 2850000
>   
> +  qcom,hphl-jack-type-normally-closed:
> +    description: Indicates that HPHL jack switch type is normally closed
> +    type: boolean
> +
> +  qcom,ground-jack-type-normally-closed:
> +    description: Indicates that Headset Ground switch type is normally closed
> +    type: boolean
> +
> +  qcom,mbhc-headset-vthreshold-microvolt:
> +    description: Voltage threshold value for headset detection
> +    minimum: 0
> +    maximum: 2850000
> +
> +  qcom,mbhc-headphone-vthreshold-microvolt:
> +    description: Voltage threshold value for headphone detection
> +    minimum: 0
> +    maximum: 2850000
> +
>     qcom,mbhc-buttons-vthreshold-microvolt:
>       description:
>         Array of 8 Voltage threshold values corresponding to headset

The binding documents 8 button thresholds, but looking at the PM4125
register definitions I only see threshold registers for BTN0 through 
BTN4. The following registers are MICB2_RAMP, MBHC_CTL_1 and MBHC_CTL_2.

Am I missing how thresholds for buttons 5-7 are programmed here, or 
should PM4125 only expose 5 button thresholds?

Thanks & Regards
Ajay kumar Nandam

> 

