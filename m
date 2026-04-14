Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71417282F33
	for <devicetree@vger.kernel.org>; Tue, 14 Apr 2026 05:08:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776143308; cv=none; b=KqxSgb42/3VllG3AlecG3VRyAwhYMYTXpZjUErUVqkPRu0J9WiwCXt4H6QEQHgZQ43xrHBWgpXj+bv6XhaOYGXe69XJQi2BNkFQTCP3LTLDQJ5VW1HHfH9HntZ2X458Ndj36AXt2VNYgXQ7FahzymJkNOteElpyJ00U7iUwJDns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776143308; c=relaxed/simple;
	bh=lI71pR7b1UtY+HJX/qJKan+BvKisGJTcDsTu9l2I034=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aU6TZY3NZWuw28unwtjQ6MCKXA6ZKFNCri8y2dpacfUvz1EZ8c982PysR31gfMwDmaxuiJ0FkxDfPAFQvK5hGv+ADtaE9X4w2DOaH/gxzSPrsxd5X4HZiuhGLUlb0Xl9jNTB5aYpKtUXsy5mjQoPa4Tbg1j8cZUND+0WIzchUjM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ctu95rg2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PvNaZi4D; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ctu95rg2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PvNaZi4D"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63DLCi2v361811
	for <devicetree@vger.kernel.org>; Tue, 14 Apr 2026 05:08:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Fend+ODuKiVJMX0bQ/3KqhrC40puAzg7wd7+IABXEz4=; b=ctu95rg2oTUEsUgL
	Ydvj+yBEuZBteguOdTX1WmL9U/ZkXJaXdvKGocIODuY+XIDgkHkthkgllg1aOpQO
	OXv35QY/+GOGGAcd0lPaHHnsbHIlQ2XPrNtUwxK7fPJnPpq4Bbjp/mnAq5LgqNpm
	Yq8UZ8s/5yk6DWRr7wIgEtfD38FGfhhvbmnEEOIESI+rsDD1egOCzRj+Z3A5w3we
	ZdxyD6XbteYim90U95MQ1bnaxPt+6Bo9uuxFJqUZfzZ2Z5MckgJnNA41zgDyv6bV
	//63wVZTCm4osJyNWc5A4F53SBxkE4YrfIQkkOhB7MH6p1HJnnDHUIqkYHPzoNFw
	fYldZg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dh870s324-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 14 Apr 2026 05:08:26 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-35da97f6a6dso5459696a91.0
        for <devicetree@vger.kernel.org>; Mon, 13 Apr 2026 22:08:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776143306; x=1776748106; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Fend+ODuKiVJMX0bQ/3KqhrC40puAzg7wd7+IABXEz4=;
        b=PvNaZi4DeOPLtU7OzLKT95sp+1jAPQQd+pZCphy6Rlrzp8vtNtzTsJpKwO17huMRO0
         uoGUbvnvNe30pnWzEK+FChRBzcZWRGcXlOVuiPDnw8EvvNlsTharJxn2qsmUlSk5G3P7
         uaDpFkR/wnvT15CD2iFV7W71+gmQYuPXU9XTy+ObO1I6AjwTdKR0bcGbSenh59ipqhnE
         zEt4/YGIYTdwOPeM3VgRGLPIjzLJP5RNFihz6BarCtCthGM6+LG8+DAPNCQGsRajp5//
         NsKvn9hCvPR/iwW2YLRFk95cPlvL308uROV7uhDK68IGdOzwvX3qx1L9mHrX4Zmso4U1
         HW1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776143306; x=1776748106;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Fend+ODuKiVJMX0bQ/3KqhrC40puAzg7wd7+IABXEz4=;
        b=YiXNlgrfP/zaI1txiiCAiQx7JV5dXGO2yOPPkBxLvIqbCiOUxp/FGzzOsrglwx3utK
         eez07RweUmiKdmr3t/Oof15L47WOIwntVQMRn+Op+tZj1jfNawlWWpaa6Ldyl/fgLWsQ
         cOH/WFfnsPBV2omli5NC9787V18xPBPmgNgQKv3O5dvK81lNkD1O7qQzmBwZachybjeN
         BcqwxZyANxmvWRri2QcFSVfKqbvtq59DNDvLBdDcoB+uyNQ6RUI8UHLQJjWKE7LfNEGA
         UFLRXSLIMDhlasy6F5np6ldIDA2KUcYA29fmwCw44d/T3V9LToGTU4rf2apFXaG/imy3
         BCBw==
X-Forwarded-Encrypted: i=1; AFNElJ9v0tPmfR4ANP7zGY1rshIAeb4IgGDPIPgwlO58M9Uy7RzMBNKESqYJ90ITHHM3QL1hz8ppDphTyk20@vger.kernel.org
X-Gm-Message-State: AOJu0YwuxUwFc0DnL0sISceAGDfpIlLJSByZTQkJn2COUWrvrLpWduUg
	4EQ9B1MVPLyGdrkdtArXu/1MoeIGrSvgMB7TnpKL495dPG+IDGk3NjPCY65mW3omXKUeCdZrKck
	0vdlLQQhFjmax/f+RjUGlCZHADuh1FetHLnAPp3sDHVH/GPoGWUQ0za0WUO5MiwyH
X-Gm-Gg: AeBDieuAuLtfjbh04i+Xs2+gy3RAvlUD7ipmy8gK0W9cj9HeGY+dMSUoI6/xsF+E5HL
	M4gZ8ep4rcUwd41Vf+73zXGZPW7YSQPX2sdQklzEaVB1mA22iag6UxQ1zfrmwY1q8HDH2AcwEsN
	AoJdCoUM781eSaCR4cOfcPGuBxLLEoW1FWIPyllf/Kbyx5QSRimQLQ/6HJBi8c6ygwtbayiR9Zu
	LLLTiWOtGkqrxaZDdARaPMrNk0sLRTv7Zf4go0qfff8ZopTDwmOh2gdGg2w7xYLFQWRo+MkjGMG
	OvWxMzAjVQVEiH5HZjrwaRDW/9BzpZ371ZEpdrRfJrYSGjhWfnwwOHPb/0jwHHEEQdU45FeEPkN
	yJgZafteGkbpyQhY+sTwH4UbaUHHQYGQ0ZDQBLrdXAYPpP0/Fr/GZCwu61Kc0I9tmvKBz88uqTS
	KxiKNQfGvq1WY8rDs=
X-Received: by 2002:a05:6a00:808c:b0:829:6f7d:3093 with SMTP id d2e1a72fcca58-82f0c27862bmr14821331b3a.48.1776143306156;
        Mon, 13 Apr 2026 22:08:26 -0700 (PDT)
X-Received: by 2002:a05:6a00:808c:b0:829:6f7d:3093 with SMTP id d2e1a72fcca58-82f0c27862bmr14821264b3a.48.1776143304792;
        Mon, 13 Apr 2026 22:08:24 -0700 (PDT)
Received: from [10.133.33.94] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f0c371825sm12754570b3a.25.2026.04.13.22.08.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Apr 2026 22:08:24 -0700 (PDT)
Message-ID: <4aa94982-bcae-4335-b70d-4b0b4cdd697b@oss.qualcomm.com>
Date: Tue, 14 Apr 2026 13:08:19 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 4/5] remoteproc: qcom: pas: Add late attach support for
 subsystems
To: Jie Gan <jie.gan@oss.qualcomm.com>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Bartosz Golaszewski
 <brgl@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Gokul Krishna Krishnakumar <gokul.krishnakumar@oss.qualcomm.com>
References: <20260409-knp-soccp-v5-0-805a492124da@oss.qualcomm.com>
 <20260409-knp-soccp-v5-4-805a492124da@oss.qualcomm.com>
 <ca268d5a-f55b-4f6f-ad35-1f856446c261@oss.qualcomm.com>
Content-Language: en-US
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
In-Reply-To: <ca268d5a-f55b-4f6f-ad35-1f856446c261@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=C9vZDwP+ c=1 sm=1 tr=0 ts=69ddcbca cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=OYuZKRwE9jNIGw8p0IgA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE0MDA0NiBTYWx0ZWRfXwCp0JCObp0E5
 RHvP53yqHLftbcAetfA4Rtb5SJGRK1VnuVpP7rgrjQJEQWQBEiUZuCaNUatKqlg9myX2lGrxJCR
 UPrtk5jL/xwi1hCpGXO0tOzfZDl0n3AmKUVKwovLX3Gm+SOcL70MWYrf36mP7w47qntiGnfTU6t
 v5575RmZAswA7ST62fdEiBWJWu0X7HFlTMlNuGciRmz24Bry1u1OZIHwzJ5TQ11jkN6ucCv8FQm
 0xcCXk6nxRcLLs/aPg7Mvc9VjJ3RkGboxdhUqAqVBUZjqbxOJls25FRgk8ZH5nypR3l2U2kNYHA
 jbpIX2QZe2PYtGRAJwS8G3afrtIhfap9AP8PabFrnt8Q2hDch0ge+KeWr0TUi/wM9pGxDXkORAA
 q4qEpPuRmQTgjDpoOz60Zj6PTmJNrxl+Qp+YMXj4YDniHBurqAEm7jX/7sFC76ZNlvYiVgjC1Jd
 zS64oQT1soYK6jFWOFg==
X-Proofpoint-GUID: 0QZUzYbKLQRq_0n7PYFG8KlM5old3k-W
X-Proofpoint-ORIG-GUID: 0QZUzYbKLQRq_0n7PYFG8KlM5old3k-W
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_01,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 clxscore=1015 malwarescore=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 spamscore=0 impostorscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604140046



On 4/11/2026 2:04 PM, Jie Gan wrote:
> 
> 
> On 4/9/2026 4:52 PM, Jingyi Wang wrote:
<...>
>>   static const struct rproc_ops qcom_pas_ops = {
>>       .unprepare = qcom_pas_unprepare,
>>       .start = qcom_pas_start,
>> @@ -518,6 +582,7 @@ static const struct rproc_ops qcom_pas_ops = {
>>       .parse_fw = qcom_pas_parse_firmware,
>>       .load = qcom_pas_load,
>>       .panic = qcom_pas_panic,
>> +    .attach = qcom_pas_attach,
> 
> Possible issue in the future here. The kaanapali_soccp_resource does not set minidump_id, so this is not triggered today, but it is a latent bug for any future device that sets both early_boot and minidump_id.
> 
> qcom_pas_attach is added to qcom_pas_ops but not to qcom_pas_minidump_ops. When a device with minidump_id set uses the minidump ops table, the .attach pointer is NULL. rproc_attach_device() checks if (rproc->ops->attach) before calling it, so the attach callback is silently skipped. For a device with early_boot = true and minidump_id != 0, the state is set to RPROC_DETACHED in probe, but the attach logic (crash check, ready check, ping) is never executed, leaving the subsystem in an inconsistent state.
> 
> Thanks,
> Jie
> 

ACK, we can add qcom_pas_attach to minidumps_ops in next version.

Thanks,
Jingyi

>>   };
>>   static const struct rproc_ops qcom_pas_minidump_ops = {
>> @@ -855,6 +920,15 @@ static int qcom_pas_probe(struct platform_device *pdev)
>>       pas->pas_ctx->use_tzmem = rproc->has_iommu;
>>       pas->dtb_pas_ctx->use_tzmem = rproc->has_iommu;
>> +
>> +    if (desc->early_boot) {
>> +        ret = qcom_q6v5_ping_subsystem_init(&pas->q6v5, pdev);
>> +        if (ret)
>> +            dev_warn(&pdev->dev, "Falling back to firmware load\n");
>> +        else
>> +            pas->rproc->state = RPROC_DETACHED;
>> +    }
>> +
>>       ret = rproc_add(rproc);
>>       if (ret)
>>           goto remove_ssr_sysmon;
>>
> 

