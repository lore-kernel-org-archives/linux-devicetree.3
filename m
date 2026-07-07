Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D13A32B11D
	for <devicetree@vger.kernel.org>; Tue,  7 Jul 2026 08:41:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783413675; cv=none; b=gJNtfN35AW/zRrQ0xIAoPXsPC/pBTTZSa6MSuhKkt3dVaLf2az/UEd/3EcWG4Xy5CjvD8fgbORBr5xWd7at4GKq39CNCySGKiRI/55JJgA5bs5r/0g0sgV2SyBJUAepsAqw2dcImQ2aSZfvqGFkKom4bRYTBSgpSr5x9x6JI6tI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783413675; c=relaxed/simple;
	bh=nxdlAM8SSdlHFFHuZI2VlKm6oVz2NUgcbsHniHjemQU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=u9NhNcO8vGUdZdr7L8QglD2p9r+4Zo1IdBU6inT36ZFylI/tLrWU0+fSPdXYz/+pbfTw4Q4bU58+Par7yLkxkfMHYC3jX0FvlzSl+p2MwOeoMdV+E64jy6pYw9i2wzdPnApX6vRhHvI37Tf3OyMRf7S6QEOdqA7NnEWeAZEI2AA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fWN242TG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CNal5i9F; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fWN242TG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CNal5i9F"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6678EE4g3203460
	for <devicetree@vger.kernel.org>; Tue, 7 Jul 2026 08:41:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RNN0OhIdAL9mAqDWFKwov/DHAFlnKx2nEt/u+oSQymM=; b=fWN242TGxQ0YJDEH
	iftdiHghH09l+4QucOwQcf82GNLSuXhIRT+d/RoQ59Kt3TpYLlRjL1Roumx86ejE
	tZ49LJ1ISsOfcd0/XnQA0GfA3K+LNM3HQEZc5glpPmGUP6YDv7XkAy6CHRxc7BuC
	k/3oYQjb8RHqMp4U+SORy6/XEMDN87LS7zkX0vNgB0CtOZN/KPANlrRA4aGoGYju
	qstTAeczzXSuvrY3/kaS8v16gh/Ghl4ZSx5vv2sp6hXl7Jybkg5P/5BjTJQ4C6m7
	AWtB+ekk75R+nt/TS63ZaNQTJuqls2z7htuPt0L09vavRXPqF9CYUrKEsbuGqgUT
	4si7YA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8v9a8hjh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 07 Jul 2026 08:41:13 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2ca3b314193so8020085ad.1
        for <devicetree@vger.kernel.org>; Tue, 07 Jul 2026 01:41:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783413672; x=1784018472; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RNN0OhIdAL9mAqDWFKwov/DHAFlnKx2nEt/u+oSQymM=;
        b=CNal5i9FCYySHXSzCoKZu4CmccWtJiX9KNDirMY4wxivar910SmqN46RrUgV0rL32Z
         OsQpVIkFOyFS2k5tVQlVvOwFSwZpqR6YocJ/wsjiXDXqitr8+GRUPUPONOLOK5YIs3xR
         8w9yUBQfyYJkZ56bY90PEtxgHI89X5q+CsNQOxlXgaqDo9ql5iNP7Oc0ej1eX4De3BYs
         Utoqq6g7kItGXIB775mIWUmsOsxHBeFKVa5et/T9LiWotDljoy1PlYpNa6Gq/hHncsD2
         QW0Lw4WrpkZRCyjEv/JvCNVB1O8vvOe/Lg4GsqBTccrthmpJOh/xb2hWlOEeblP5xmxv
         hJ4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783413672; x=1784018472;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RNN0OhIdAL9mAqDWFKwov/DHAFlnKx2nEt/u+oSQymM=;
        b=KP6tBfppeEFa6ZHTHAozWwjh/MZyS/OCHfsAy+D0xMV4kjGeTt3CplnF0eZUz4Wvwp
         mMGeGkiazRDrorZxGJIx/Ikq5xVc7zuGZEsQR+HcCV361h90NaOn9+hZKuJhCQetv17z
         eYAKQ13B9FzJWNLJMcDCPUWq3wOJFWIkM48FnfIKtoaI4cneX40iuzVXWU+l1/lUtxTm
         86t4zebPFgC3vqo6kQbPI2uJPsRFaTjlfZprPydbGdUflR5bnPzK+mX8ENHrVbwGVUbf
         bpj8a7lhdHM/Bl7K5Zo9UPEOyIo4YTAIMWVNlbHwz/U+fin0BV2KMMDAPpqY85jQfvnn
         Zysw==
X-Forwarded-Encrypted: i=1; AHgh+RoqsyrIhxyEt6vul4ghrQmtXroB9o+Kjyz8renOXNKwgTxavAmoF2kW+w2NMSjLrmMet5ySX3j3kPe+@vger.kernel.org
X-Gm-Message-State: AOJu0YwSraoBC8+hXu46iaWCLfYIdtQQrGro3rqON40mTCIWsx0a4nw6
	ZQRMsOei7YkZ/O9rh/L5im/NBbCqlfjt3HprycUJGsHbkktHTxng/+r2r4D0kMYkXC0gkzvHRnB
	ox3tCPlSkVk8tZXuhBjHh3D7XBgUWTniUCg9eRensNG2jEAbO4AOeGSY/m62DAMch
X-Gm-Gg: AfdE7ckjR5Z/McC5ys9W75oKulCNRWRG31RNmA53ffJhADQbpt0PpZVg6jyST7ZsNE6
	CveGYUikTEb11hw6KIoPmXILg5MTvZapg8otB/GpXDUW59eKciui8HZiXtYkwo8fpovUXaZyF5Q
	mnC55RRwXfdRVOtS1jKgC/oVZG8Hp00Q2KvxGVIVhBBDHLRKE+4IbMQut51J1PrOOh3W+55ghY+
	shJzpb6gi5WkEgksscp8Rzw07e82vvHwPzYcBbgkSd6NqyCWGH+UlpiZMEdthXraLSZTRG4a2z1
	ezSmsme6RA+4hdySIquWjyzdFq0JKBE/Zp6fJ27NkYNXrO84EvO0V60O6hYQPjCAWBj62VV0AI8
	mRUzSIPmxRq5x4hHo/p9sLYsTTN61gmLLErqGyMZvINs=
X-Received: by 2002:a17:903:120f:b0:2c9:e9db:8167 with SMTP id d9443c01a7336-2ccbe3feb88mr40585775ad.7.1783413672266;
        Tue, 07 Jul 2026 01:41:12 -0700 (PDT)
X-Received: by 2002:a17:903:120f:b0:2c9:e9db:8167 with SMTP id d9443c01a7336-2ccbe3feb88mr40585475ad.7.1783413671714;
        Tue, 07 Jul 2026 01:41:11 -0700 (PDT)
Received: from [10.217.222.146] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9c100adsm7731085ad.32.2026.07.07.01.41.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Jul 2026 01:41:11 -0700 (PDT)
Message-ID: <6af98083-a102-4614-a853-76d27d209118@oss.qualcomm.com>
Date: Tue, 7 Jul 2026 14:11:08 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 1/2] arm64: dts: qcom: kodiak: enable inline crypto
 engine for SDHC
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
References: <20260707-ice_emmc_support-v9-0-701c86f3c25b@oss.qualcomm.com>
 <20260707-ice_emmc_support-v9-1-701c86f3c25b@oss.qualcomm.com>
 <20260707075554.BB8E41F000E9@smtp.kernel.org>
Content-Language: en-US
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
In-Reply-To: <20260707075554.BB8E41F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: OvZZw_SHwWuE1DF_UWs-CuIW_tmhSNjH
X-Proofpoint-ORIG-GUID: OvZZw_SHwWuE1DF_UWs-CuIW_tmhSNjH
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDA4MyBTYWx0ZWRfX8o2dLzu6tmBu
 jc3hZ/px6PyvSh/GNcpZP57lcaSjoNhk+OGTAN2OZM91/d/EuN3V7gs9xT1SK6IKNw+XozcLP1s
 u6U9Cryas919wF+jYAhlMVBKwmCsxyY=
X-Authority-Analysis: v=2.4 cv=b9yCJNGx c=1 sm=1 tr=0 ts=6a4cbba9 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=mTcq0AEEaod-KTxo8kgA:9 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDA4MyBTYWx0ZWRfX4HvL3ivE/fiD
 79A6xde8O/wHpiOugWHiUurCA9cGCo9ONe/NbCw5D/9Vh8HoXxT/lK5XMx8kDEC0iK+shlnP50v
 D5Hn1GhUlHL95gmQlDSjSy9k3YD25nZHTC0SBUgO5ohxjDWUbo8D0cSSlMzounAXMHJBoo8PqbE
 d61Qs9ed5HxgBXt/qJvNlphBNRwOGkKVP7Xn5kf1nuG4rgNtYCJSo9ME0DAXV2tfh82Si/B+11x
 ytoIz6or+19s/VvQmBUn/N0dhHGshLAhddBnReo3RdWGVN3pRT0Y7rBr0I3klxcQ5RayeDWWHir
 ozIfkcdBeKqq8aRNLPx58WnNoLb+TVLFDP6I7eEb/hEqMT/iUTXsOq+UxE9LIZexj9bcwlz3W+P
 GKcWBLWsYPVM161Zsnzc20MZTTfmtkyrB+KHg2nOUB0E5ksXzWgaLLDQEWUiS8u+RvYmzGfGYt8
 inIj4QuI1+s/7SVFkDA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_02,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 priorityscore=1501 adultscore=0 malwarescore=0
 bulkscore=0 spamscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607070083

>> diff --git a/arch/arm64/boot/dts/qcom/kodiak.dtsi b/arch/arm64/boot/dts/qcom/kodiak.dtsi
>> index 90e50c245c0cb..3692be65cc21b 100644
>> --- a/arch/arm64/boot/dts/qcom/kodiak.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/kodiak.dtsi
> [ ... ]
>> @@ -1050,6 +1050,8 @@ sdhc_1: mmc@7c4000 {
>>  			qcom,dll-config = <0x0007642c>;
>>  			qcom,ddr-config = <0x80040868>;
>>  
>> +			qcom,ice = <&sdhc_ice>;
> 
> [Severity: Low]
> Does this new property trigger a dtbs_check validation error?
> 
> The Documentation/devicetree/bindings/mmc/qcom,sdhci-msm.yaml schema uses
> unevaluatedProperties: false. Because the qcom,ice property is not
> currently documented in that schema, adding it to the SDHC controller node
> here causes make dtbs_check to report a validation failure.
> 
> Should the binding schema be updated to include qcom,ice alongside this
> device tree change?

As mentioned in cover letter too, dt-bindings with qcom,ice property is
accepted hence, sent v9 without bindings change.
Validated dtbs_check locally, taking dt-bindings as base kodiak/monaco
DT didn't give any error.

-- 
Regards
Kuldeep

