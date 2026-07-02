Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB83E47CC83
	for <devicetree@vger.kernel.org>; Thu,  2 Jul 2026 09:45:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782985516; cv=none; b=PJbwgpZox+v2X7CHCqtiAzxIGI4pT80772RXyTa/4eY6ygEvYWs4WsXBScijzeS+yUlQZ2WZrfc7nWA5FOfvr1t4Mlz07FdM+GozCZYqh/7VxxskT11zAVF1ukvnHgkJzqn6atahe+XDQ5gHedb74BFuS5QQTnMV6jMVy+L4oO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782985516; c=relaxed/simple;
	bh=ZKDLIcKB1c+j0lf43DF4540JPKcxwPi/cNsd2nYX+Gw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Y9nNphmRyKUW6j/B2OSHcbKSTN/CvedoGFOY+gg39JtuVh7gXSH7rrHEwKuODA1bMzlr6584PIoTyzyd4OWNnHbXvleJRnY6wyWK7L9oqqmioNF7grUpgbcLBraLnnFN214zSNq0bOZf1udfzmURg9BDguU47RWH69TMjbiwR1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=S//qx+K2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CEHXu9kX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="S//qx+K2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CEHXu9kX"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 662431FG3460503
	for <devicetree@vger.kernel.org>; Thu, 2 Jul 2026 09:45:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	75oo061kGdnMpV+QVfjOx2lEQa4UxftsWU5NqlyJvwQ=; b=S//qx+K2JeYWbA42
	SX45kklpLjUijD6UOhpomFD97lyS3s61zwcu0J5ymJLy5TAu7T/Y7x2gyzdILJOz
	Cl114X3t5ojyGkKchKfDCuCM9v7mk2Rqzmef0SvhcdmemF2omYUUzQLNqn08sGS2
	8uQ5mJI4pqvBpAYadfEEs+s0QkZiQ9gcczyuw7dtzrj0DUv7DvPeMfDP1EqXobyD
	9RdIin/HklYkNb0JhSr4jgbCVcH7GnYzOY5+p20KziZuVATXxrECsmlvXqEFdWDU
	UbfPtoDghhiCIRJMCRnJOhqmbeguLMyunocg35jtozfnnpLj++eHxIFjjSOe5OUa
	JQUeRQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f5gmb174e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 02 Jul 2026 09:45:13 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2c6a20348ceso23924415ad.1
        for <devicetree@vger.kernel.org>; Thu, 02 Jul 2026 02:45:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782985513; x=1783590313; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=75oo061kGdnMpV+QVfjOx2lEQa4UxftsWU5NqlyJvwQ=;
        b=CEHXu9kXGEv/VsOSBaM+zfyd1+Co596lORejZaq4pkBC8DXZEXMlnf9JaXDS0VaCO6
         bCS/Fl0EGonalTsyBpHKUhMPRyKIGJI+DW3NeDbCdUvOJE39FGklmZZlvKHmKBzBAIlE
         O5CkUYNCJFy7JZkv3Tn4mWdBXhO6hw0pif3JKmOtb0M0/3Ok0c/IATvoB7KxmU1OF+NR
         6h1P7BlhUgSbA8Y2zVHeDen5buDtqKMgxZmt1mVUfC3xx4fKIOeXTnK4gtDAw0tp6zBM
         J4Q7M9ZTZdUqiIDFid3S3XNa7cer4YKSQBqy0E+0ba4OepMCPX3Wrja7ctwxObYFLKAX
         YB1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782985513; x=1783590313;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=75oo061kGdnMpV+QVfjOx2lEQa4UxftsWU5NqlyJvwQ=;
        b=bJvB8xWGKKiTE15BYTKR/4HWCozpugsVz4EApCdtzVnSSjEPSeOF/bzRi2abQvGPsY
         O8X4KjEzxgYJ8ejM+uO+lPuCQPvwnU1++c+jZCPkPcEQIxfdPZ9VDxwUZS8gNWlCv8JU
         sXMryzY7sQKj6on25OGCVyS6bXOVoMzkq1+ec/RBRp99Bsewa92GntgQU1RqauVFtrpk
         GVaglzidbVAv7eC+59aYb/wuyaYwKAtfMK2tUXVtmjBLGNzVWP4SMMblFDyWOL5l5mXx
         DHmCod3yW4CAauXPeSHZNbcO7lmwN9aTMZvPUL59aYZzXwawJwo/M9zRYT+QLBa2j6BI
         Gkxw==
X-Forwarded-Encrypted: i=1; AHgh+RpBQmmz1iiQfzG8S+rz4BODWEaTg6PIsI7OJD33cky5WfgJHdd36pZqJg5PBoF3jPjNse8KoUqkQF2v@vger.kernel.org
X-Gm-Message-State: AOJu0YyBVdb0U/1lr34+JUgvxhIgqVSpVRMKPwf21vOtFWf5ViAoRF1u
	ngLYG3Ng2B6YcyQxJu9YRUlxHP3JHZNr2fmcOXhCElcgvM1VfWc/aeEFFzcovsfhV301sW64hN8
	5rxd67cHZNATBStuDNSpjpxlRfi4Lri+ybwMnOz2421rLsSXfcaMLo9VVT7z4CiyR
X-Gm-Gg: AfdE7cnutdcQoa1F3qwK09b/qvbo9F07lDRgnRXWBZcI3EGAOUQuq91oHQHn+4zHI4v
	wdX9oXaW8n/uJjhba3TpSHyT0XITESF97lFLzmG6i389bzk3jB0INAFYRIHPQtVv2TRrT3G+zmp
	iHurjZ8Hs3686WJ8LU3KkWrEc82bgaTOn0kivGv43/uds0cfAydskm90xXi5eS5w9Z0h4f07F7A
	MtSrT6IkQnnW5r6XNvb6Sn3F+qZnyqd6OKpz7CgiCIekY3VuqpS1bUipJxxnyJF9sagfoDn1yCT
	px64pFotdFnu04llOxtzOe2j67g1ctYcJwjG2l0vKDsmfM2+U865lfu0VFLZx6Unp+BCfrfsuXo
	NG2JSEq8W2CTb1DOAzjt2be2mPT37wYGOuO/O86bQ
X-Received: by 2002:a17:902:ea01:b0:2ca:26bf:1e4e with SMTP id d9443c01a7336-2ca911f4ef1mr41757745ad.33.1782985513006;
        Thu, 02 Jul 2026 02:45:13 -0700 (PDT)
X-Received: by 2002:a17:902:ea01:b0:2ca:26bf:1e4e with SMTP id d9443c01a7336-2ca911f4ef1mr41757415ad.33.1782985512360;
        Thu, 02 Jul 2026 02:45:12 -0700 (PDT)
Received: from [192.168.1.6] ([182.77.29.27])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ca9a8dec35sm10975865ad.15.2026.07.02.02.45.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Jul 2026 02:45:12 -0700 (PDT)
Message-ID: <be2d4b2c-fd7e-45e9-bcb3-b907a6a345d9@oss.qualcomm.com>
Date: Thu, 2 Jul 2026 15:15:06 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] arm64: dts: qcom: Enable SD card for Glymur CRD
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Nitin Rawat <nitin.rawat@oss.qualcomm.com>,
        Pradeep Pragallapati <pradeep.pragallapati@oss.qualcomm.com>,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Sachin
 <ssachin@qti.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260610111508.3941207-1-mchunara@oss.qualcomm.com>
 <20260610111508.3941207-5-mchunara@oss.qualcomm.com>
 <logxz4exkcj2k6ocqhbl352u3kmnpi26wgm3mh46cmsa5336ux@6w4uq2wori75>
Content-Language: en-US
From: Monish Chunara <monish.chunara@oss.qualcomm.com>
In-Reply-To: <logxz4exkcj2k6ocqhbl352u3kmnpi26wgm3mh46cmsa5336ux@6w4uq2wori75>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: n3SgXm9h-TTHEY5_rYrWTTONVDN8leXE
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAyMDEwMCBTYWx0ZWRfX9NXtN5zNzf5q
 EuHZNVU3zRmddoTwStEV1zZvUy71+3z53xkNtXtSAo4vH1bbqRfzWrzDnypH55itlSnvrr3wMyA
 Yj9SQVurvCvJ/NY6ujwcY00+ZUL3NJ0=
X-Authority-Analysis: v=2.4 cv=aJ7Ab79m c=1 sm=1 tr=0 ts=6a463329 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=1qKOYMtCOh3zOq8T1Y2cZw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=81jcH2gtoST0syqoSCYA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAyMDEwMCBTYWx0ZWRfX6vCHpVHSBHKs
 y6dxYIdDox1fUg+dueMA0FMGY64sUhIAvQxY5hwqHWDTdrz0yCAuzx9t2yZigR/X4lgt648eBaA
 USwinTnVdI8GLOD1dVxeOIsocisPZToabvBEzNIWmxczMt9yM6KGkUXKD+FXX+kOz6Wx3aHXTMg
 GSI1Gt0algFzRZbVNF1PpDrtEdPUUP4zGbrQEqeoNsNqa1xUwVq8HsND+/ic50F+zElpAGWs+KE
 03CKtJeWYTgMHsMibhezQclkdYDp6a2Qx1LpdRTJgADdT/xm7CFw8dD+IYIVB5pWaSPdSVloL66
 DabVgvcPHB+4RCoDf9ie/XvSiActUbYCLjeZVNK3yT5P/tgUwt/Xl4gYx4j5T/uLH3X9W4hMG+Z
 eo2HGSvx63gf7DUAeg0RY8qBnLnyimZW6BrZijQspxC0DBnahArEHMTGP4ZW3i86iPJcC7FHxWB
 b3LLTf7wMtYq6YGOCkA==
X-Proofpoint-ORIG-GUID: n3SgXm9h-TTHEY5_rYrWTTONVDN8leXE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-02_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0 clxscore=1015
 spamscore=0 priorityscore=1501 impostorscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607020100



On 6/12/2026 11:37 AM, Dmitry Baryshkov wrote:
> On Wed, Jun 10, 2026 at 04:45:08PM +0530, Monish Chunara wrote:
>> From: Monish Chunara <monish.chunara@oss.qualcomm.com>
>>
>> Enable SD card for Glymur CRD platform. Configure the vmmc/vqmmc
>> regulators and gpio-based card detection for the platform.
>>
>> Co-developed-by: Sachin <ssachin@qti.qualcomm.com>
>> Signed-off-by: Sachin <ssachin@qti.qualcomm.com>
>> Signed-off-by: Monish Chunara <monish.chunara@oss.qualcomm.com>
>> ---
>>  arch/arm64/boot/dts/qcom/glymur-crd.dts | 25 +++++++++++++++++++++++++
>>  1 file changed, 25 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/glymur-crd.dts b/arch/arm64/boot/dts/qcom/glymur-crd.dts
>> index c98dfb3941fa..f68d27429440 100644
>> --- a/arch/arm64/boot/dts/qcom/glymur-crd.dts
>> +++ b/arch/arm64/boot/dts/qcom/glymur-crd.dts
>> @@ -427,3 +427,28 @@ &usb_mp_qmpphy1 {
>>  
>>  	status = "okay";
>>  };
>> +
>> +&sdhc_2 {
> 
> The board file should be sorted by the name. So these two entries are
> wrongly placed. sdhc_2 < usb_mp_qmpphy1.
> 
>> +	vmmc-supply = <&vreg_l9b_e0_2p9>;
>> +	vqmmc-supply = <&vreg_l2b_e0_2p9>;
>> +
> 

ACK.

Regards,
Monish
