Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794210573;
	b=VoxbWnPToPcaPKsf17jz4Dx/cHVM6fnrovGWMNhg820PxdSvUOSCJnTSXwEGCF1ur4Xc
	 U2B8DAz19D01cCXmI4ylp2POy2K4QHBI5UIliob8rlEuPzNTu9kgjV/g1MtsWZ8C0kv2/
	 2Yc7YyoNcNMC3C8srCQ/4OnikZYwjqITtZQ2rhjcDca2ISMQOGQbUM3UlMmxzfMhW54im
	 cB+6Wtl4JnnSVXOSwfrkySRlvV5IEUYaCX9Rs8iI9FpDDbXqHmAhpeEWReaSOzXXVe8GC
	 8nrHce+XkQnp8ONsUoLQQethKMB0YN7WlxvDvSqI0YGpd9Wp8WFS4Ty++Tj8qYJBTMA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794210573;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=qDe2ce+Ek0Yzko5s6AlNc0B4Fxdld4KLI1y6EiIO2yk=;
	b=3qDRB+Td7KjXYD07YUaUawVD1uYJLAiTfJeDk7fMnKPUBTlYDnzXMdgMIaWeWK0s3QpQ
	 uukFpWvV668WBg1qSFMEw9odRzRIr3tbgTv6gz7xXF2ORYqkayWxj6eC1bIds6MWavYOi
	 heqsYbW96JIuovDqcH9ihNEeakgI/Nrd0g4yE9bjLaqxeeWQclPHfHsJm2QyGva1hNMkJ
	 xtSH5jrxag+7nwGEHudlIPXaQ0vEmLPcbr9jZMAFXQik5jKgx4M8q6oFoAiZcJUJnEkv3
	 ax8/KbpfS0C66XOoI9fbQwUTjPbN3kwjTGtOK80/oVvmyh5W3dWXCciSsCmbFboz59A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="PVd/TSEC";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=P9LSvBa0;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89123606A321
	for <devicetree@vger.kernel.org>; Mon,  9 Nov 2026 07:49:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 89123606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PVd/TSEC;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=P9LSvBa0
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A969wfZ3611035
	for <devicetree@vger.kernel.org>; Mon, 9 Nov 2026 07:49:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qDe2ce+Ek0Yzko5s6AlNc0B4Fxdld4KLI1y6EiIO2yk=; b=PVd/TSECefMO65S2
	2dQwe6AfFV1D3yxIAIvTeQEn9ecvrgb4Ew8IJluoZySBvMuX9pgYBQzW99Gb8wq7
	XTxdGKAQNBl0CVp6lbkhAak4JKDcUVfet+Ocu/chEndTwDbKzahMhgSVOLGs3o3m
	o0iu5wpPtwDIcySUTbBO7dMzFcUxXk5bx5wZjGDcU7RCZULSOd5EBJflmFRh4wsB
	YmCujcXMJFCjsBji00JO3jz2ePEgSuA/gDhvioTwKEubLDK6QbM6n4crc1XxLAaX
	1lZNeBPNxspl0hFQG/eq3UGmDErmHRQzLFsFsgaGnhgmjLu4Q8IBewCdiFj1XVTI
	jq/dNw==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hssbnwq4u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 09 Nov 2026 07:49:31 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cdd77f53db5so258717a12.2
        for <devicetree@vger.kernel.org>; Sun, 08 Nov 2026 23:49:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794210570; x=1794815370; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qDe2ce+Ek0Yzko5s6AlNc0B4Fxdld4KLI1y6EiIO2yk=;
        b=P9LSvBa0JSBWS/gs9L11ryvgUSs1+SkD7D1BkgmVA6Roq4QRkHV+5nG0RzkEl3XFP8
         NrriSIxoVNQCF3cc9/3sEiNnDhyoFEpwo7zw7W6RXcKMuyXwG7xbquFaIrvA7idzf4TI
         i5YVtwDF7JhmzD+0p5t2p9rdLzXPvMb+FDnGNGz9K/4+NP9XIiK+C5qvQxXNliKEugPN
         3PDTbyoxnwgNQSxULM/BQGF8iy7bVYXJuZTDjjTIdoGe/RjYnaGd0v0nxkwUss2FT+Qq
         D2EFOViUfAlQJTsTstcS6zimy5Z7naJJKm4BIBU1rnRuqLQFPv7SFCxQLvDqW/pTKLB4
         R9Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794210570; x=1794815370;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qDe2ce+Ek0Yzko5s6AlNc0B4Fxdld4KLI1y6EiIO2yk=;
        b=hfEZsA/M5vETVQ9MXae2ABvXNbAES39vwdMMQutSr72F/GPbfwd/d7vUGPJbVqcBjH
         bJR5sDuDRaBtIxE1bizSpax/kgUP8tUQMsb/KfOL0KczMl/do8w9KqC9TXPhG6WQpzsT
         GKxogDDLpd7Q8/vVq+7p5jGvY0DrnYR5q0H7m5g4oKLZtraCDldCBdPMwas8koMu9o8g
         1FkEeoW4+8/0x9fSrmuOICwZDF+u0uPk4Voh0pZE2cz4Z8Na9UmprEWFcwn6NHoCkWH4
         eCbWRaPACOAXCggjWf5GG4F7kJx91eCyrTHRKFOOCFfLJvR3CqtNuqaesDulAxBfa3Ms
         Amaw==
X-Forwarded-Encrypted: i=1; AL+hErFRAysdwY8Uemi58BVPaK1zgbJqch6ng0IT6uW7WlInhtjre8VCKggpPa4MbTp99nzSR/F4urmuUN6M@vger.kernel.org
X-Gm-Message-State: APuU4Z+kEXO4FRcvbef5QX8mUaMgvtY3APV3H3cafGxRaX6v5GcMNR+i
	ajDbuWa0K5Hg+1YebxvOTGslm8RbK3BBzLgzq6F6Ciw/NUJh8xC7BrDV3pXvXxebM+/5bi1rVuR
	ylh2jWLqMt2hfYVHt6LFD3Y8yWhpc6eRTPEset79iK97djS1tOn/wI1uZuCDkV9TR
X-Gm-Gg: AYBFou1f5iuhW//N0kR4SX+c9SG4BsUocAeU1h0N+fcIo3u+o/0gdJznfFccOiK14yJ
	S96vxhR3BwcqQHZ7LTNfPoVM3wJI5tSfNIMjKtDzAhEsFcojFiaonmTKRBvsl0yyh2kblx0Z9Z7
	UhTJSt6IxxlrslNIudCR10RRGNlLfd3wrH9/M8U+NWPB/aISFn9B5huptK3BiypQjthoN3fYG0C
	ZwlNWgPzBfcQbyt93p0xtAVVliM0QcS4d8plvz/yJVTnHmb5eE7LnrAuE7jEFZrpB6Bwx2kTqFs
	HpI7lbhDxDXVo9IX1xMrfXoieengGywsd9zzzrG3Mc21HBdX47IoMN7fxtGajwqr5D8ILtLNMV3
	n/vIPNhgFcPhxDgEGlyyKRIpRMFC8M3/7+CiuE0lXnnFKmR/BePhV/FnNnZiRur2ABQ5QokPn34
	I=
X-Received: by 2002:a17:90a:e705:b0:3ab:de4:7fa5 with SMTP id 98e67ed59e1d1-3b12d5c4412mr3197705a91.56.1794210570461;
        Sun, 08 Nov 2026 23:49:30 -0800 (PST)
X-Received: by 2002:a17:90a:e705:b0:3ab:de4:7fa5 with SMTP id 98e67ed59e1d1-3b12d5c4412mr3197697a91.56.1794210569988;
        Sun, 08 Nov 2026 23:49:29 -0800 (PST)
Received: from [10.64.69.173] ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b12797095fsm5758248a91.16.2026.11.08.23.49.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 08 Nov 2026 23:49:29 -0800 (PST)
Message-ID: <13c25823-0adf-4ad9-83dc-24ebcba39ca9@oss.qualcomm.com>
Date: Mon, 9 Nov 2026 15:49:20 +0800
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
Subject: Re: [PATCH v4 1/3] dt-bindings: display: msm: Add INT2 GDSC to
 Kaanapali DPU
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Yuanjie Yang
 <yuanjie.yang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261023-msm_gdsc2-v4-0-40b6a71d4e3f@oss.qualcomm.com>
 <20261023-msm_gdsc2-v4-1-40b6a71d4e3f@oss.qualcomm.com>
 <20261026-vagabond-macho-sawfly-9c02dc@quoll>
Content-Language: en-US
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
In-Reply-To: <20261026-vagabond-macho-sawfly-9c02dc@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 1Vp4VJt1_3V9PJHuQCofn1IVm1GJiBKR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDAzMCBTYWx0ZWRfX7STOpfNayS/I
 CqNGdlrMG56rEVvJ9dcMky4E5mIDtEO1VX45tGLOC8daqdMWKjesJyeS0+cypJnBLqhvl5WbjsS
 7C4GgKP11jux24O5W8tLZbbKaXSm/2M/1BjezWhluznOm9F7awKiVzCeWUR3WNgfLcoYgIBAbB1
 6Wy1TyPdM5xG3RZ/FqwD23dNAxJTibDIGzdVsLqbD3jrmlUC/T0pmP970u3dpjmm6taQhHQMIDs
 zJVWedAdih2RqLEGvXI7ENsiPjIv3PvM1smb4z54m+0b85YituInzAxNtT+G+SVfYrtP59ZuC9s
 NamI83LawgrcCNYGBlSzJqvLgH/7ET5p+Sg1+z3VKbNXNlQsx/MsVgSdBFGYJ2M2hWPuKNSOtrR
 +KT72OuPBQD1uB4Kfv2FnCBBDo3aZ3uqGI1UZ+0Qj9DW/nRAPRYOlgDuAoYYvRQeYIGQIiBJ2vG
 zPLRjb3SBuYLbAMBBfQ==
X-Proofpoint-ORIG-GUID: 1Vp4VJt1_3V9PJHuQCofn1IVm1GJiBKR
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDAzMCBTYWx0ZWRfXxLOblIJ93JNr
 Gh2J5YTG42fYehwMDISrF8OuJZnvLWKEUEbiRqy67A/cPY4LGDllOusjwGXeWjw4tK64Bcw15aN
 ZxdAkk5iNcU43iabVI9mc1C/hRLNz9U=
X-Authority-Analysis: v=2.4 cv=JtBkP84C c=1 sm=1 tr=0 ts=6af17b0b cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=msBFRUBLE_5BgBVHHWUA:9 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_03,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0
 impostorscore=0 phishscore=0 adultscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611090030



On 10/26/2026 4:09 PM, Krzysztof Kozlowski wrote:
> On Fri, Oct 23, 2026 at 04:13:11PM +0800, Yongxing Mou wrote:
>> diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml
>> index aa0cf0ec5b93..7f8e52d52078 100644
>> --- a/Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml
>> +++ b/Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml
>> @@ -61,6 +61,32 @@ required:
>>     - clocks
>>     - clock-names
>>   
>> +allOf:
>> +  - if:
>> +      properties:
>> +        compatible:
> 
> here should be contains:
> 
Got it, thanks.>> +          const: qcom,kaanapali-dpu
>> +      required:
>> +        - compatible
>> +    then:
>> +      properties:
>> +        power-domains:
>> +          minItems: 2
>> +
>> +        power-domain-names:
>> +          items:
>> +            - const: core
>> +            - const: int2
> 
> Drop power domain names or move it to the top. Here you only provide
> constraints, not define new properties.
> 
Got it, will move the items definition to the top-level properties block.
>> +
>> +      required:
>> +        - power-domain-names
>> +    else:
>> +      properties:
>> +        power-domains:
>> +          maxItems: 1
>> +
>> +        power-domain-names: false
>> +
>>   unevaluatedProperties: false
>>   
>>   examples:
>>
>> -- 
>> 2.43.0
>>

