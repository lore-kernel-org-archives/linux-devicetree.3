Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792579502;
	b=XFCXFmSIRxaq26+Mwgz0xWKE8wmnBkE4O8owsA+qTjce49hZJyE2jZR34uM7m55/m6Uo
	 DaGMOqCOSnOgXrGWnPgTUlxCe2vuiMyrp8b76CTDUBWJiNWFgl95YlIUWou73lGFxoFox
	 Jl6J5o48+faErVH/8GY4Dve55brtSEWPZuaLUn/B4tPvcbAixiYs/rww/HQvmVCKxsNbx
	 DNWcvQe62cMDXceuh/UL+DWXt80arePBhmd22z1u+HVr1fCdLz8gIJBMxMmgkHEfx4Npk
	 P5fvS1mmGQCnJr5GFh4OfKl5MMzm75P27FHrY2em2s53oyH9aergv3Js8E2eCVJzjTQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792579502;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=ik84gjJhQXZyxzqpUBYq3dSc7Euo+Avkq4FYME9dfpE=;
	b=aa76IhSTH98AHhTvPJ5biEKvTCBUPiyrwUDnN5rOf7JREzz3UQ/PFqVPu/h0s5fkpGtj
	 nHbyXKWlgxiKlPJ4dRCFv3Wenx9jsnWOXOCHLkKCWvgb1GU0UPMcYCDR/POUupq84/bbP
	 npJN4J5+Ljx4eIddJ0GGTKZ5r7vbzjjaNXWbRE1rLTqynm1WzgUiKncqFlzP0vYPt4V0Q
	 SfaMgonU9HPvoliKpy5yxj+h25H8ZJQK/k3gPQVgDCE9r9KEtS9sirnMFp7fAbkfVJWMI
	 0d5TYSLouEBdce/vE6vmMcX8WJUeK3cNsttxJha9HQVgd73+fd9JFBnLEyNag2SLYKQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=c90OVmmj;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bw1t8EXw;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC581606A31E
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 10:45:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BC581606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=c90OVmmj;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bw1t8EXw
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LA6925117875
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 10:45:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ik84gjJhQXZyxzqpUBYq3dSc7Euo+Avkq4FYME9dfpE=; b=c90OVmmjPQw+bVBp
	JuYLpaUHzF8pry/dvoE4zMJMbkN0UdZ51c/FJja3NdSEUtUiah+V2X+l59iOSQ82
	I1+hlzYmRIlQLt8wLJk/qxQsQW9rKylm6h4df5Mi5lRnYKD9JSok7UkP3ppu9QrL
	yyNlTyC0FYPRTvzJKJ5ZqnKn/bTwWDUI00TJpmwhuMo3+XP1NlI3Eq5zEtYpCTFO
	RrNlyuExnTD101II9Vhn17xbwC6Loz9oFFoXmByLZKB0z+pphx3352XtZ75+sOQm
	8YT1NhLx+wRKQDCSbtZF0XaIiodo19RhocKwEPp0oBmaG3Lx97bfK36RzXIXCTGI
	8l1ziA==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hed9v3jxj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 10:45:00 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-89e96c03cd0so476364b3a.1
        for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 03:45:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792579499; x=1793184299; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ik84gjJhQXZyxzqpUBYq3dSc7Euo+Avkq4FYME9dfpE=;
        b=bw1t8EXwLOSNRpyRpCvDwYhaw2z7ocnwv79u5pYav96n5AEBLfIqcjKCz7wTuPBh9G
         EmttSRs+od83ComViNlsYeD0k7AqnMKSAy6+GWkdk3L2gwbep00WUTJQU6qf6EEvHZm4
         3me8GAZ5CXIPanejx4iGaoEgggUITbsjyZxNf8tmjx3p+tClD+E1nIGTf4iqZTTQYIO9
         IJ7eId6/4gQ4lL3OIhsaCTT3kMgm04j9Cm1+RVlwFpgTquiACvQ3xoYTfZBqh+iEDxS7
         UNn0IpEQB/y76BOOKlK+xLb0TsI3abme6mO9LhuvdnLqqbERQTi1CQx3nc8/Jd9bmmkb
         r+lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792579499; x=1793184299;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ik84gjJhQXZyxzqpUBYq3dSc7Euo+Avkq4FYME9dfpE=;
        b=0YLA8g9EqeXg1kRNcVGVZJLgTEMKGeeF94lJpZibjCtdI9cULpdm/iNE9Ca73mYvFw
         WSgvC4dX+uWxM1Ww73Ex6mks+BLRs/9HK2giULAoO2D4Zh48VgE5pt1x+xuBLnRo69qT
         aw9rLU9rVc9pEcWIHgCgQHDFJI7b3Yubl1pcmWsmt/J3Ou13nM4P6olhKiKJsUbo9mO/
         iPg/I0B0oyBs876sje0SYVTQAAQ8MEdrB0vnCPjMuVTFihO6cxqXRBSg5votiMDuvU8E
         Z2z9GS8VG+2y8UtuTY7NAeZYfzi7O/PQxcmVqjCs3x/DLxoYgKDxbILoOEa8NrL/YLap
         TG8w==
X-Gm-Message-State: AFq9FYJRnXeO/2gHycMQV4vLI6JHsiIRLiUKo1r7PGospPoqMChwbixp
	YA9B+XWqbf9IR+qsoWTk4Q4LtMMx7xuRXrA6pqBqT/rb8GcM9AhAy4N+jBGb6dRGkalhjRaI3gR
	mu1PvS4kJbeQuPgktjustt/O360AUQMIwd8x/pqjRx/cqFzT3lffWiVuLUfYNtyhSSlhXedRw
X-Gm-Gg: AYBFou2LPfo6dxwsiZWq3M8v1o6WQXJXlV1ml8+hMmJF5JOYgYdtzjU8kRnXYr9wu6i
	G+B642uLmnZK3ohylfLMBoOiCDjxVGWfE+RCg3jyOeGoPmvsZaavjC8BsT+Br8fM6oT8x8iuQjV
	QxUryV9C5rgI3dPNU75gF3NwZxcOqMYzbY0u4e+8mJ5fIu8cl5E33rFgXtVpAX+hV3FJKUJCnbm
	lTv1kwT0r2i2lJPaeRaqBo2Lqk8wNYRxtJsg5qOn5Dc4sYOgj00ifzaGBBOFqku7bBR0jyi3pkn
	3Rm824ePrVbuXDULMVi5uDIJuU8rG25Ojtf7dV2IBsy532hItbwNXUVFREJDJEtx0kRjaQAbT8y
	QrDsvBSKv/fA/GiKA/x5zDe5KYP4EgPS6fA==
X-Received: by 2002:a05:6a00:3687:b0:89f:28c3:aab0 with SMTP id d2e1a72fcca58-8a089d43a8fmr1242642b3a.40.1792579499380;
        Wed, 21 Oct 2026 03:44:59 -0700 (PDT)
X-Received: by 2002:a05:6a00:3687:b0:89f:28c3:aab0 with SMTP id d2e1a72fcca58-8a089d43a8fmr1242630b3a.40.1792579498886;
        Wed, 21 Oct 2026 03:44:58 -0700 (PDT)
Received: from [10.152.193.243] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a0895dba2bsm729437b3a.36.2026.10.21.03.44.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 03:44:57 -0700 (PDT)
Message-ID: <3fee0897-a878-459d-89c8-c9dd772c1976@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 16:14:54 +0530
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
Subject: Re: [PATCH ath-next v2 12/17] wifi: ath12k: Enable MSI interrupt
 support for DP interrupt
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
References: <20261016-mpp-bringup-v2-0-f510c33bfcf5@oss.qualcomm.com>
 <20261016-mpp-bringup-v2-12-f510c33bfcf5@oss.qualcomm.com>
 <sashiko-outbox-173689@kernel.org>
Content-Language: en-US
From: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
In-Reply-To: <sashiko-outbox-173689@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA0MiBTYWx0ZWRfX2QYBroNjDDML
 nHWQXS4dbHaWbgfdnhkeC+4dRqZKnZ/K/dARKUDDdiMOSaW3Oxf9D29EIFhCLqcZWRIPDJ2S6ja
 dGffZWdBfB9YCiJA6ALMqgHFppBep0Q=
X-Proofpoint-ORIG-GUID: xezuKJwmjPuM-LIKNplerWhnrajMaKvA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA0MiBTYWx0ZWRfX3dx+qCktJorc
 yX+debGJBFua7YwEzZnhop7Xt5JUQpm+CFT5dh6wcOJkmaC0CepPKii0at2zI7MYPQkBPGRI66D
 cuxs41liPKxi+kOoNkrtmPcAiQNWFiQkO3UUNXqeLBIZBN6X46EiAGCrzAkhpUFRzWlZFv873UU
 jaYODi5In7UMirIujavCAazNwtEcvRNUko+9SXdvSobk5Pmg43qAPeRnvi1pt5x9ZnLpiUHo+pT
 1ksmzH+sqnerULs+RRD1b7hQhHpGmRvQajiy2Yybw9VBG6IDfPQuexGaaW/JWRiEwaXwzGP9J9z
 xPBHuVFxifwvL9Eyq+xiy1jpJt+gZH/42VNY+k3GqA5cP9gZO9cSsIusC4fUefPyqbuhjvqaWZ+
 1VTYdfRTe+M+hgkKMlk7Be8Nnrm2Sh5Kh9NA2tFtlwhSWnQqQqDoJ9KXFKzz/UkT6Ipett9Jomd
 QDgpGGlAlvRCu8jT3FQ==
X-Authority-Analysis: v=2.4 cv=I6zw19gg c=1 sm=1 tr=0 ts=6ad897ac cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=JXgSEGKP8_NlnuhlkvkA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: xezuKJwmjPuM-LIKNplerWhnrajMaKvA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_03,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 clxscore=1015 bulkscore=0 lowpriorityscore=0
 impostorscore=0 spamscore=0 priorityscore=1501 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210042



On 10/16/2026 9:11 AM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] wifi: ath12k: TOCTOU race drops edge-triggered MSI DP interrupts causing permanent stall
> --
> 
> commit d922087bb1f873dbadddf00fcba276c1d612d2d7
> Author: Sowmiya Sree Elavalagan <quic_ssreeela@quicinc.com>
> 
> wifi: ath12k: Enable MSI interrupt support for DP interrupt
> 
> This commit configures and requests external MSI interrupts for DP ring groups.
> It creates a NAPI context for each active external interrupt group and disables
> the corresponding IRQs while NAPI polling is in progress.
> 
>> diff --git a/drivers/net/wireless/ath/ath12k/pci.c b/drivers/net/wireless/ath/ath12k/pci.c
>> index a26fdb3c0ad27..4bb14a95aec98 100644
>> --- a/drivers/net/wireless/ath/ath12k/pci.c
>> +++ b/drivers/net/wireless/ath/ath12k/pci.c
> [ ... ]
>> @@ -1118,7 +1122,7 @@ void ath12k_pci_ext_irq_enable(struct ath12k_base *ab)
>>  	for (i = 0; i < ATH12K_EXT_IRQ_GRP_NUM_MAX; i++) {
>>  		struct ath12k_ext_irq_grp *irq_grp = &ab->ext_irq_grp[i];
>>  
>> -		if (!irq_grp->napi_enabled) {
>> +		if (irq_grp->napi_ndev && !irq_grp->napi_enabled) {
>>  			napi_enable(&irq_grp->napi);
>>  			irq_grp->napi_enabled = true;
>>  		}
> 
> [Severity: High]
> Can unmasking the hardware IRQs race with setting the software flag?
> 
> In ath12k_pci_ext_irq_enable(), ath12k_pci_ext_grp_enable() is called just
> after this block to unmask the hardware IRQs, but the software flag
> ATH12K_FLAG_EXT_IRQ_ENABLED is only set after the loop completes:
> 
> 	ath12k_pci_ext_grp_enable(irq_grp);
> }
> set_bit(ATH12K_FLAG_EXT_IRQ_ENABLED, &ab->dev_flags);
> 
> If an MSI interrupt fires immediately after unmasking,
> ath12k_pci_ext_interrupt_handler() drops it because the flag is still clear:
> 
> 	if (!test_bit(ATH12K_FLAG_EXT_IRQ_ENABLED, &ab->dev_flags))
> 		return IRQ_HANDLED;
> 
> Since MSI interrupts are edge-triggered, dropping the interrupt without
> scheduling NAPI leaves the hardware condition unacknowledged. No further MSI
> will be generated, which could permanently stall the DP ring.
> 
> Since NAPI is already enabled for the group before unmasking the hardware IRQ,
> is it safe to drop this interrupt, or could the flag be set earlier?
> 

The expectation is that ATH12K_FLAG_EXT_IRQ_ENABLED is set after the IRQ
configuration and enable sequence is completed. NAPI is already enabled before
the hardware IRQs are unmasked.
