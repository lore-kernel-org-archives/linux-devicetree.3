Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDB2A3859C7
	for <devicetree@vger.kernel.org>; Mon,  6 Jul 2026 20:06:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783368382; cv=none; b=jr4KZUKoLZeXwjnOSNsG0TM7K/lOnqvI263iqEYoCfTPzXrWbTnHWdGSMsRd1lQYuN9/ALdWKjY3Mv7sUgicMRzQ/rtS2vN+HVFcRUxG7efVkk+1tEyOzpKkYbKaZsGe4MbQL4U5+LtrgmKq13Miw3i4BSl8Q7Eh11O2ZpCXhT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783368382; c=relaxed/simple;
	bh=l8heLlrrTPYNvH6OlXPMwBbUF/B/QIXvGRy0A8EXBPw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TyMcUtJA3r9FAeXN3EF1kVKMju+ak71ciHTVro0b2o28P0Iu++JYuJFf2MVc5QR3AaJfDoO5qS9TOOehwRtYocjkWfevExNadW1basw6YhjD1O1nAl6uYVJ9eq0gY9k5N9LaS6jbXlkImhCoy/+6RAFVyN6Dxx65kL6V/muZeGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=A2+sA/pf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KLnTrwfl; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="A2+sA/pf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KLnTrwfl"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666FF5Gx947310
	for <devicetree@vger.kernel.org>; Mon, 6 Jul 2026 20:06:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Wf1YrJ/RXa7Do+NSaW/+5hNmmnFSR5P/RAWYq4RDJg4=; b=A2+sA/pflXJxmGj9
	59ZriII2fhNp2WN0kzFToRm19PyG1ZzN3ZtAxwpUgIULN/i4b8olLkZucYfJgs9n
	sOH3W3gsdYm1pifuiPBorvFjOIT4YWzjDMPX5chFwUGIKJMYF/vipp7Bj3PlW9Ab
	Wd9+U4wfP23RFtxGBNJCzF/hErbix8L3deUOtvXK9tTCd/1NLObqo/xJ6rrsYGnp
	W0OfZyGPiohlFIowqWLlfwjN7wjQJXAdzAEDDe3OASOZm6ojJHPUiDrWHaiQJNqV
	mkfgSG4xC3pHLYsBvRTUTfOb9S/M6dND7ItLTZnSwktZgkxMrSPgpu8BwcVVWywr
	aAwSCw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f88h5349x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 20:06:19 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-37fca5f21b1so172600a91.0
        for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 13:06:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783368378; x=1783973178; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Wf1YrJ/RXa7Do+NSaW/+5hNmmnFSR5P/RAWYq4RDJg4=;
        b=KLnTrwfl5QR+ffO59Sv4kBSiB0Q8yTbPyZJe3DIzgdfWST6Gv9GzAxPjbXLNSEWmIE
         7meI7hrH/7STNE5e59T2jHIo+wIawhpSD/ilB7JYuAb//wPPQVpVKdi/WL8IM/95uwb6
         QguOKdFDgTTNm139RubXL3/NaXDOpblJqbqkVWyqeLcyVaOSCgNo17BrGWH6IyVG0KtQ
         muctU6aPY6kho6U3ci3Mu58R8TyqqLLkdbL44mGHVJwtPTQu9bvd42/OS4dvDmH+Katl
         yZjW9fW05S/x4fYWWK64Or2ueNcTsxk5yvaVjpsb4ZCmYiNttPEDuoHYsVhGYEdVWmdw
         pgBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783368378; x=1783973178;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Wf1YrJ/RXa7Do+NSaW/+5hNmmnFSR5P/RAWYq4RDJg4=;
        b=C0g3fBK7J/Wdz7eRI/Lp87Ry17YwM/16SXu6axtvbA3jkYKpFhuXCQeBimhQqQKDHh
         4esAoQUSg5y8TAiIxd1hGAz7n0tgUU1BYVR48uCDu0aIksKLy5Dme2XFaWBV7wCAbN42
         ghrk54HHq6oBDATrTvzfriFDruvFBneijjBe/OVaXvDLiIxKFLNNKKsh6A0e5dnj+SDP
         mIEyOsK1LiYsqSb44QaMLUC+71GzWPtIYrzi1qQw7uIMxXFz1Y6WvO+VzDYU9c84AmWY
         5OohoGDszFEzLXZSZhk9IN1Ib6iYivXaKbeX/zNO9pp5Sv0BaFgEwKbpRyTQPcifxaRa
         1SvA==
X-Forwarded-Encrypted: i=1; AHgh+RoGUGkBUWkkevqloEU5eOJS4aR5FnUYLK16DZjI/cw4on1UHWW4ZWGQXTteWwV5Hz3cxBpnTEEZbDxU@vger.kernel.org
X-Gm-Message-State: AOJu0YxbI85xydCwcac9VY/UmfTzNh+nVo3f67qvGDQ4TyrylN3yPRgA
	33yAdKwQFvJPbsJljxmYII2BPPfBQmZ4zoOy/VVVQCPEaObhCVO9T2l/MPNCZzrHbFq8erOCUBG
	Fdh6dCediMy0No5u4icyK1/JRNf7Ria8PFPyBA1a2LIRPYRxjQq3rnrLOIhRPtyDW
X-Gm-Gg: AfdE7ck6vOuzoUD/9xh+4DkSFiaRBio00dIb7DZPUYlYwyD9Gdg2y1rGx0clzs+Meq2
	co4yFL8ZlLwB4mOm2lsEsb8WadxOa7hVjtDs2QgmwDFzyjEiRIvXchnJ1jk5/3iWBhqk0X+M5Cu
	peVd4h1jBfX6G0BxQDQykmdSk6iJBEjobCMDkeP83JCeBX5tP6/rGd0H29yfw3Uwf5FNjkSvwxr
	i0Gdczb14W4ElASI8+Jh82BReZuweV6jCaYXD2I+VNGR4DtzcCOLHkAuOPnIXC/IbQOAI505mE6
	ti1H7AQ930x/draaFSnP90FCjtSg5lWMTat1B8EHtYErKhx1D2U47KQ04iqcra8fiykYzU+vx2j
	pUbwFrxZcxr+H9b/0FPFv4yZPcJjX6FGrx54=
X-Received: by 2002:a17:90b:2888:b0:35f:bb17:39f with SMTP id 98e67ed59e1d1-38112066822mr17984569a91.1.1783368378551;
        Mon, 06 Jul 2026 13:06:18 -0700 (PDT)
X-Received: by 2002:a17:90b:2888:b0:35f:bb17:39f with SMTP id 98e67ed59e1d1-38112066822mr17984531a91.1.1783368377972;
        Mon, 06 Jul 2026 13:06:17 -0700 (PDT)
Received: from [192.168.1.9] ([106.222.230.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-311747f5982sm47949eec.5.2026.07.06.13.06.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 13:06:17 -0700 (PDT)
Message-ID: <b11cdc41-e88b-4815-9349-453f1bd5f14c@oss.qualcomm.com>
Date: Tue, 7 Jul 2026 01:36:07 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/8] arm64: dts: qcom: Add GPU support for Kaanapali
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Sean Paul <sean@poorly.run>, linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux.dev, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
References: <20260705-kaana-gpu-dt-v2-0-6ac53de56314@oss.qualcomm.com>
 <20260705-kaana-gpu-dt-v2-5-6ac53de56314@oss.qualcomm.com>
 <e2b7e03f-911b-41cd-8ac4-044492e2bdbc@oss.qualcomm.com>
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <e2b7e03f-911b-41cd-8ac4-044492e2bdbc@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: Idr0M57NBuzl3dsOQh3WFkrnYK5FGMam
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDIwMiBTYWx0ZWRfX95Tusyu3qNiE
 oeoBsxsFxhhcKSEcAGHc6fY6mIDb4xVyRnBiHOuJU0Rb/2PsfwoF+TC1bKigRjvZwZsxiy+BxTK
 Mo2UZkCRjk/+uyk/a86WzFeALohjiW8=
X-Authority-Analysis: v=2.4 cv=EPU2FVZC c=1 sm=1 tr=0 ts=6a4c0abb cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fsdq8dFr2Uux402FS9br8A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=ZaZH7ke036cbytEKeQwA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDIwMiBTYWx0ZWRfX9V694H+usSkx
 HLsfpl0S72oqiYU9zIQNlWL12HGhItGeuteO1Eg9KcmHlst6jQmtX4pQsROXd6SvxLpcerQnOMR
 dctgc8yGfQNAEQDIAKpcUNa79kIRb7iTplrbQ95OhONzdQPa0nGrm1L9WONkoqObBZEI+woe7Cz
 /xJQMs9wgJQuq2+CpQyBcotNDuf9HbiOCscr2IuF9oHngr+BCBPGAlSqzMcE2Fhs/I7Mnek9NxI
 AhiV73W2ue/nhg+pNsr0jqmNWGaCJrrsCQRY5qI2RcND1ql0D/OjfjdbeYfM9lxrAeN/2ObZb4k
 ZVj+Oybz00F8GQxby3LEWxEzXXDJrLLp/G+51xwN79IDxByg0E6VRJRYqWv2pmHmjqaJeZu594H
 E8px8y8lhjAmXLZV2Ds9+LpHuC3MPoS9IyT4+QQNOhhO797CrsO6c7kU6tbiRE6EFNEF2sr4w05
 o6wF1eadbD2krGP+YaA==
X-Proofpoint-ORIG-GUID: Idr0M57NBuzl3dsOQh3WFkrnYK5FGMam
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_02,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 malwarescore=0
 spamscore=0 adultscore=0 suspectscore=0 phishscore=0 bulkscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607060202

On 7/6/2026 3:07 PM, Konrad Dybcio wrote:
> On 7/5/26 10:00 AM, Akhil P Oommen wrote:
>> Adreno 840 present in Kaanapali SoC is the second generation GPU in
>> A8x family. It is based on the new slice architecture with 3 slices,
>> higher GMEM/caches etc.
>>
>> There is some re-arrangement in the reglist to properly cover maximum
>> register region. Other than this, the DT description is mostly similar
>> to the existing chipsets except the OPP tables.
>>
>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
>> ---
> 
> [...]
> 
>> +			qcom,gmu = <&gmu>;
>> +			#cooling-cells = <2>;
>> +
>> +			nvmem-cells = <&gpu_speed_bin>;
>> +			nvmem-cell-names = "speed_bin";
> 
> This looks good to me, but I thought that on a8x, we're supposed to use
> the freq limiting register in CX_MISC - is either of them preferred?
> Or are they just hardwired to the same thing by chance

I believe the other register would work, but I don't have a fused hw to
test. OTOH, this is what is commercialized.

Btw, the CX_MISC register is not present in all A8x GPUs, for eg: Pakala.

-Akhil.

> 
> Konrad

