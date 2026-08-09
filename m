Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDB461799F
	for <devicetree@vger.kernel.org>; Sun,  9 Aug 2026 12:32:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786278749; cv=none; b=FRxfCtytwZgVwsvXLsMvUkG6jSiVdFcxiBxJxWAE7ijyBkq2mleZwFszm6NIlCIoBvv+BCrxrDr0HB1JI7XyF7Vw8vYlrldnLvmPwlbLYtzkLlDGs8ZzQpqNbYNs5SpVX+FAWs/7oUZwfBoOLJLHJpchrD0Qd3QJZXGgWaWScxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786278749; c=relaxed/simple;
	bh=h25Al3YV9d9cDAlZPKfZ0/iWPXeyX1vX30AkLuHyAEY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JAur2lYsBRi6u/ruC2Beo4nImcug5OatS9nempitj2i7VdyeI9EQSS24DLImDlw2F7ysFFZDnG6AKHjhxpMSU86M8P7nsD6wqg6h6UW4q8r8iAP5vi0Fj6YrDE7r707kbtdx2KTL9Vcv3sk9ydwwM7VwTl+UlyhHWPqF11aWwM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eu+VNBVZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Otlxat4m; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eu+VNBVZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Otlxat4m"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 679C1NMU3838385
	for <devicetree@vger.kernel.org>; Sun, 9 Aug 2026 12:32:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	s4u4WW6Emq7DmRx4bgmyS5ORnD5TRmpSecDumYKBQYM=; b=eu+VNBVZDCCCDrc1
	G89rIrycF3L6SXPDFfuMVIb4Gd+Alg6IwGB61jrmMEtOrKZr5sD40ZoW1jb9UNBT
	N4HOyhIIZ2ghcUYpP1Khuynur6WI0sOhBGHB8q1N2EA9IW3MhaWpBSPd/Fl7qwMB
	3r7TSJGcmQ7ZbzsaUFIJkhrLFo/h2OGEZokbUgSwQ3Szv8Ar5UFMLSo9TiRAtNXR
	8pbNJBy6pGGTBfZLGjwWND9MZEvcwpKCtRH2T7943+qSf0Vb8TSffF7Lyxnk0rzE
	bPlcEKz0DEoA4ndrPwPjoYzb4lCcovB8I4nWoDhgSTaLE+CZO/Qb6dCiQkp0oQPt
	fhWmVQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fwt5gk31j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 09 Aug 2026 12:32:26 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38e7ff7b375so1119678a91.1
        for <devicetree@vger.kernel.org>; Sun, 09 Aug 2026 05:32:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786278746; x=1786883546; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=s4u4WW6Emq7DmRx4bgmyS5ORnD5TRmpSecDumYKBQYM=;
        b=Otlxat4miozMglV6+MJTowYIBwJAv3l831dtjImqTkuQ1QZEX8r+LUzA2bZSFOHmDB
         CKgcgKm7zznRFAueS1t+sMHkbBYnKRoGqqbildifrMtsgU+pQkh/RWjhL/JACkp8ySwy
         4F8snH3wSZh+nmaxDUj/QYQ+1f/MuiB3BdeKTC5oxLxr4DtqYFBT7VK7m9dxfDZhS58h
         fd4u1v40+oS+OJLPYVMRLWKpfbx5CWWzotapYdhPiA++qIHat8zbwOerAwXNSO3pdUEd
         Q+4P/nMPbmIdnxaGR0DLmfSPTF2txmx6XR4fcOKACkO/CCIZwToRvewv5ABjZjC+aXEa
         cvBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786278746; x=1786883546;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=s4u4WW6Emq7DmRx4bgmyS5ORnD5TRmpSecDumYKBQYM=;
        b=j9c23tVTxqt7qWEWsobxbZfq/mKbXmu6M+Nj/m5DCAGV6rIhnjv35DF119GfzkYESH
         MCzz14+qONnK8Qz4YfPBLoiMiunfP4wb7+WcN4nD1QNUDVUwpys7gWMVeEm7+Tifz5Fh
         Y+FcKykLEdyumXy57JXti6UJJ2ecy409moBGrAdxeqyM4ySuQflh9EaebwMC6LPjCc3d
         WVm8i80YSUnfh6b6SqiMVBtCPCMwRmEvqwZdifdDJlweWJyTDfVxKOMy+BOVDhD/N3jZ
         LbP0kJxke54uNGebzKhNSZHX6G7qoJA3USR+O62IjRJKaPO5Q7vVcx0GxQPRrvZRYrEp
         qcWA==
X-Gm-Message-State: AOJu0Yx5nS0RoDK4alhTJBih4wAIcvnhyIJGZDdcKmLzktrjlznh57EB
	kxi/KF70a8MouERpw7C/krgrsp3qukrFARLLOGcqto0zKxWrLfjqelAqePiZCd9tmxwU5pzwvi0
	RMPTDGvIh4O8gUdJmyTpJ4IHjPpm7I+327jxg5g87+qoxKEDjsXf6DWNe14V4tcj7
X-Gm-Gg: AR+sD13EA1hvHZWJqTOQm4o3KOlLk3165Shgzj4i8mtHeEh+52Bunhm6TE0LVdd7m3k
	TNDkS47GmIcJAIjB7xVwa3XQCaSJAW+Eljg3T/h3W/jMFYvypW4gHh3eibb+nWxrDf9OecVWIkZ
	dydlcTOXYfVbzdTP8fh2HWS8+ZEO8tUwkn+I/5j30WOpTqdHyrnAI5dx+bjHfY4YR5RUe8gFYPh
	emu/e8sefQm8/pIn+3j+Z4FkjVPOiFaeACbGGuzDk2YNXBMUV4kyrX6xmmTYQe9YorpfjfAMw75
	6HRAI4WQdbrMe8TfHbnPsqqfAiwqMEYnD/fTC4MnNH3ab+r0Bto5Ydhowj4/4Aypq1VCZ1AGFtT
	PgKu3sCcTQA+CwP3Bk0KPLI9cW3MjZ8LrhOE=
X-Received: by 2002:a17:90b:3b4a:b0:38f:23d6:b4ad with SMTP id 98e67ed59e1d1-3909d8172edmr20607240a91.8.1786278746134;
        Sun, 09 Aug 2026 05:32:26 -0700 (PDT)
X-Received: by 2002:a17:90b:3b4a:b0:38f:23d6:b4ad with SMTP id 98e67ed59e1d1-3909d8172edmr20607205a91.8.1786278745623;
        Sun, 09 Aug 2026 05:32:25 -0700 (PDT)
Received: from [192.168.0.100] ([49.204.17.188])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-315bec128a0sm34782357eec.25.2026.08.09.05.32.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 09 Aug 2026 05:32:25 -0700 (PDT)
Message-ID: <fc97e786-dd1a-4f3b-a843-55de6cbb193a@oss.qualcomm.com>
Date: Sun, 9 Aug 2026 18:02:21 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 4/5] ASoC: qcom: common: Distinguish missing and
 invalid TDM slot configuration
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
References: <20260808181948.2489187-1-prasad.kumpatla@oss.qualcomm.com>
 <20260808181948.2489187-5-prasad.kumpatla@oss.qualcomm.com>
 <20260808183953.492F11F000E9@smtp.kernel.org>
Content-Language: en-US
From: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
In-Reply-To: <20260808183953.492F11F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=c6Cbhx9l c=1 sm=1 tr=0 ts=6a78735a cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=/JTPBhwEQko7YaD0RKblyA==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=c92rfblmAAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=F6mPVD8IAMgZXornHRsA:9
 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA5MDExMSBTYWx0ZWRfX3jLUI5S2V11i
 kqvfdF6iIhFYm3v72JVRfKGDYgON6BoUA25n60NQGH5Rh7Vnzbwmfixom4RTbUYLT/93EV9q4De
 1ImsOwH65czfRMZmzF9wiQ77Wm0NNjk=
X-Proofpoint-ORIG-GUID: ojafEF4vp9hy93D39a3gtHjUUQAObXyh
X-Proofpoint-GUID: ojafEF4vp9hy93D39a3gtHjUUQAObXyh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA5MDExMSBTYWx0ZWRfX1rH61u/NVgSQ
 +Y2OXRDuaVW0CKMdE5vyY1GWmA7J/E0wCrc+KcarbkfWeHKL4k0jcvdTgjnuy4iMO2V9XiCAgC+
 sPv7DLcnBhcCouSu3a7V0l2MN6jUw28WsOV6dDjzl+eZ6bG8n/RyBW4Up4S+5p9OXQit98nEV7I
 LIIcr+3jAMvA6aqyttaDusHU7kwLXNSMyEaAj0IxTgPwOHj1udh6HKkc7FSfoVpr/e2ehdtkqb+
 RmZjV8/PYbxHD5T01iB4C1sItC2VatpYLg86AM+iveUAcvtO9ld8SG7QSIWfg0+CqtcTmHADfj7
 8PkyH92X5ApuqUohgFylEY6bjJEb9bq1N3JGtaSRV2D0ijexLv8CvKkTwCe8KyUSVcJ2NLAcQHF
 o8m1P8yVg5AyyjH/EHvBrsJPgqky8NbZO0k8SWgSyae8hEVPiVRckWu/MJMlAx1vvSmbeYMGN0c
 KQHcGmKdyALfvE342og==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-09_04,2026-08-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 phishscore=0 impostorscore=0 clxscore=1015
 priorityscore=1501 lowpriorityscore=0 spamscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608090111


On 8/9/2026 12:09 AM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] Incomplete API update breaks TDM configuration parsing and error handling in the sc8280xp machine driver.
> --
>
> --- Patch [4]: [PATCH v1 4/5] ASoC: qcom: common: Distinguish missing and invalid TDM slot configuration ---
> commit 2828c15bbb01105bac7c7698b0dd46a75894895f
> Author: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
>
> ASoC: qcom: common: Distinguish missing and invalid TDM slot configuration
>
> This commit modifies the TDM slot configuration parser to return -ENOENT for
> missing DAI-link configuration while preserving -EINVAL for malformed
> properties. It also updates qcom_snd_apply_dai_tdm_slots() to handle the new
> -ENOENT return code.
>
> Link: https://sashiko.dev/#/patchset/20260804070307.117119-1-prasad.kumpatla@oss.qualcomm.com
>
>> diff --git a/sound/soc/qcom/common.c b/sound/soc/qcom/common.c
>> index d231024206dbf..d9f256d519733 100644
>> --- a/sound/soc/qcom/common.c
>> +++ b/sound/soc/qcom/common.c
> [ ... ]
>> @@ -172,7 +172,7 @@ int qcom_snd_apply_dai_tdm_slots(struct snd_soc_pcm_runtime *rtd)
>>   
>>   	ret = qcom_snd_get_dai_tdm_slots(rtd, &cpu_cfg, &codec_cfg);
>>   	if (ret)
>> -		return ret == -EINVAL ? 0 : ret;
>> +		return ret == -ENOENT ? 0 : ret;
> [Severity: High]
> Does this API change break other callers that were not updated?
>
> Looking at sc8280xp_tdm_hw_params() in sound/soc/qcom/sc8280xp.c, it still
> expects -EINVAL for missing TDM configuration:
>
> sound/soc/qcom/sc8280xp.c:sc8280xp_tdm_hw_params() {
>      ...
>      ret = qcom_snd_get_dai_tdm_slots(rtd, &cpu_cfg, &codec_cfg);
>      if (ret)
>          return ret == -EINVAL ? 0 : ret;
>      ...
> }
>
> Will this cause hw_params to fail when TDM configuration is intentionally
> missing, since it now receives -ENOENT?
>
> Could this also silently succeed on malformed configurations that return
> -EINVAL, defeating the intent of the patch?


Hi Sashiko,


Thanks for Reviewing.

qcom_snd_get_dai_tdm_slots() has only two callers. Both are updated
in this series to treat -ENOENT as "configuration absent", while
invalid DT properties continue to return -EINVAL. As a result,
malformed configurations are still reported as errors and are not
silently accepted.

Thanks,
Prasad
>
>>   
>>   	return qcom_snd_apply_dai_tdm_slots_cfg(rtd, &cpu_cfg, &codec_cfg);
>>   }
