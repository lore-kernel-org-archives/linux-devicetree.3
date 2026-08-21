Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E405392C28
	for <devicetree@vger.kernel.org>; Fri, 21 Aug 2026 07:24:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787297055; cv=none; b=KKwkHNeDZHP+t4hgevqkXdMcuX/hJMVRbYrKRXggFMkWlFDX1BH4RaRq++9QDkUsXbJxo10mrsi+SeVdv7XlzD2ujtcz68z7w2evJVIemVOO+ym4Y8usI/PYU8QolrUhgmNFdWGNLQkppEMfb9aPIG2gZHZ7eW8eOWosHIOZqkM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787297055; c=relaxed/simple;
	bh=17fSlbm7pxYTp31XJ9NiKYMDekO6qPToLoc0S1EfVZg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hFQ7bGXk4AqNt8TqoEMjKrWnoOG+K+IG0HBDwcX94qhdxcpk2oX4E3lmcJ6Fu0TauNDNXSoKT5VWZyxibvcwzu0NI9f9AZsSizc9x+BNdwr0KeCar73CD0RSluo4E7apfrCrdm3QFiiZU4zb++7/TdgsMJDQZmWramGloBw73WI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iEK7dbHx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jWKhnYTB; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iEK7dbHx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jWKhnYTB"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67L5TkE2260332
	for <devicetree@vger.kernel.org>; Fri, 21 Aug 2026 07:24:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ckxta0rprjTfzU9Y2NCXvHIWxpiv7evDC+YXVGofUnM=; b=iEK7dbHxswvDlmdg
	YkROHaTGPHtmPb3MRoGthhuiWnld9l0dNDhpbW8Ea+IN2xj8aue8/xkVIeQiekdE
	Bz5ZjJKJFPss93atMySLEZU0bLcS+uIeTlhioGWzws1HPaC8qfuVlwhKqHqko3sW
	MxHALgCyL5YGau9UKeLTf3eVFs4G7UJVNO2Ahh+GsLBiz3MhwfDAuifRuFuB43aN
	pqlZwbHqk7wYEBmtg11ADbUR+Iwcu2nL0yJAEco1/TEYeGrlhRL69Qf+K6R/DwKI
	Swpvph3M/jWum9AyrVQ0qeGJlE251Alp0s664eY2OHEytNaq9TowjrHKu+EfhcAh
	Ucdleg==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g6ebursfb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 21 Aug 2026 07:24:12 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cb11535e6a1so691578a12.0
        for <devicetree@vger.kernel.org>; Fri, 21 Aug 2026 00:24:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787297052; x=1787901852; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ckxta0rprjTfzU9Y2NCXvHIWxpiv7evDC+YXVGofUnM=;
        b=jWKhnYTBlOox4FC8kljI60HlYbc/wxPEOivLWkgzMVSKJnS+swDGWvFaLXSsJNuOj0
         FZ3dcnat+TQxajte50JF/BbiP60j3Ii3VW5Rbmjt2fHxSEtLD/9k0lgB/RZ/2mThFuET
         BTvQFBUFJLhDlyMytOMhp7S1+rbjhlN+bQQOOwe3hv5OlADutpKzTiVyNPNbagkKmxh/
         TgFDNvt8Uc/67S9JwujazHLzIGUh3b7oNSpIVfGyQIn1XxTcqt3/BjChjmS5VZZrBCb/
         gvgONCyxtlGMqeQvIgved7V3PYug0ApH19LzppNAKpgwcWLStud11tE7Un7SsNN39cno
         q48A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787297052; x=1787901852;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ckxta0rprjTfzU9Y2NCXvHIWxpiv7evDC+YXVGofUnM=;
        b=Q+OTGDtTFIEVCfHKs0gZP4eKHtkbePWJFgijLV58fxYPSz/YCgH2rvRR74qbgFxytu
         MHVfjAeQb9Vqp9OdV0SGX+WIXBWKyljSszs0Q+VtotJhhMzK6aQA4IUFKw7BFSvf/P3f
         z0Oegs9PmM+2iunz6LPkHLZJ5rnhbRFp4z0hgwxc6BJ9XBaiJHZ42YeTBcJou4zQ8Ie2
         qMLAwSRb1sD6h4yq3CiUv4K1IDlpgtdHHF4t7CebP08kD9lOX6NrhhuTBc8cmWcojf/N
         mwC8D9vRbSKhHSChJc+shCZ9HjvqiFhVkdSe/UQ6Yh7lp9vVRBDfn1VARn6y8fOT0A8k
         UulA==
X-Forwarded-Encrypted: i=1; AHgh+RrNWzRqOrPb5YyuBg2IZGS440a0GBm43BexS7TVcwWBzbKPvN1rtUN+VZUJMIvPfvTyuvy684aDiwsL@vger.kernel.org
X-Gm-Message-State: AFuF++nQElVEvXnwFJVhMFs6TobNnsGs/qwY7frG20BbEYGFQHP0hlr7
	TGL0K4fCqGfTWYvG5MlZB3syucsNvFs4h+v9VNnbJ+IYcaPz+VNZxLZMp4eQFwWOir/HJr3bf8J
	iYd9gompfj3KBpvRzexDLcswRanFVGqeByqHSj/GAgZGTPGQmbqtSrixntDIl6Ivh
X-Gm-Gg: AR+sD11fNhG1ubbLLkAaVl3BA+7f+JLbUvdtL6NOKmOWG+WieSTnL2fjVk5SiJ3tP6Q
	HoBcDGg0jOGF+bSL9d50toRE1gydVHdv7i6vTaPZO12DjNWDhHFFCNN7gSPJM3/FyH130wQVhTm
	56mXSQcpv2xyDQCOXnyWPYw5J+N2Sq0ihafz/7DEF/4Q8V1AggHohFiANUKNmh39tSHYxzQrvny
	E+YtTQfJHaTwt76Ce4BYZiz2FgKn/pqpgXQFKyapB7oLaXQvDp8GmbsqHMI8N/wUVC9REFeoWNR
	6DqNV7WdcgWNAKM13eEiw5upvX3+KfFnTrqqECarlGfCXym8VMh9pD/hxoY46JzIfi6qPJqSDXO
	6rlfGJbp/LsoUMbNCEbViVRbyfuv/hcZ8f+3fRSXaNYi+v/S687oPpWE34XOudzXZDotEay+Cso
	gmfj3RH+Ie1CXXxOXuIdZMfhk8mg==
X-Received: by 2002:a17:903:2b0b:b0:2d5:d9c2:bbe0 with SMTP id d9443c01a7336-2d64ae39520mr93638435ad.4.1787297051799;
        Fri, 21 Aug 2026 00:24:11 -0700 (PDT)
X-Received: by 2002:a17:903:2b0b:b0:2d5:d9c2:bbe0 with SMTP id d9443c01a7336-2d64ae39520mr93637705ad.4.1787297051356;
        Fri, 21 Aug 2026 00:24:11 -0700 (PDT)
Received: from [10.149.121.190] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327cb5a9831sm17387279eec.21.2026.08.21.00.24.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Aug 2026 00:24:10 -0700 (PDT)
Message-ID: <6ae07fc4-fa79-4c05-9958-67154e850563@oss.qualcomm.com>
Date: Fri, 21 Aug 2026 12:54:03 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: glymur: Fix missing SMMU stream IDs for
 ADSP
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Sairamreddy Bojja <sairamreddy.bojja@oss.qualcomm.com>
References: <20260811-adsp-smmu-fix-v1-1-a596d284c455@oss.qualcomm.com>
 <40c85916-6694-4976-95be-6ce2a2f19732@oss.qualcomm.com>
Content-Language: en-US
From: Iranna Mundaganur <iranna.mundaganur@oss.qualcomm.com>
In-Reply-To: <40c85916-6694-4976-95be-6ce2a2f19732@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: b4AjvwSL8nZdODtFZ5Jvxt9REJM_4-cb
X-Proofpoint-ORIG-GUID: b4AjvwSL8nZdODtFZ5Jvxt9REJM_4-cb
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIxMDA1MiBTYWx0ZWRfX4H//9tWC2uWo
 KUdUNl8B8O/EDmQhm33oq5RTTG/dBHhPXec54NtdwN8HId2CZE1N3gx1I421m4SpQUSUzO3oQvn
 wWafb/Uh5p0ptUoyZGCR1IGrX1W+Qys=
X-Authority-Analysis: v=2.4 cv=QJlYgALL c=1 sm=1 tr=0 ts=6a87fd1c cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=DGbidtOziy_G4G9R6E4A:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIxMDA1MiBTYWx0ZWRfX6ZzjwvtOYTO/
 uUWXHipTih3OGxErYwTaRYxudzvh4kbN+gMq8BzGUuJ5RQh4p/xVqvP9Iaz4IHEsZsjHrX9Mw7k
 MstYX5033inLBGPEgTSKAXi3JhjNe80x4vNpX8C0uAPJYrmcPloeYM8kgPZlUQqsc+FuBB01shD
 UzqbPXe2PkoeM6bPJgT0u2ONMysYylEQ6Bg//9hGBggAkyp0mmQjNygs7NPkRb7fA6fVmY27ATs
 yltQ0UUZJwbOgky0VUqhRbxRNfOb+6pGKfcrl4z/t49kZYGHEC58uQKHfdcIFUSBRw2FtFDLoGg
 QU8E3dnEp2SrY85hELy0mavnuDFWa3w4huIeu6/iZ8f9gSFy7/TuPXpERsLnH8v0uO55G0Fbx4n
 R7vnqse7CFnm31cK/chFoI56gYAiaHWSOMitI4l0fxiNXqzSM3Jw3EQUFiXYsb7CKRa3k3wHC2R
 lu8ZVFbvcsOrc7bF+9Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-21_02,2026-08-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 suspectscore=0 impostorscore=0 clxscore=1015
 priorityscore=1501 spamscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608210052


On 19-08-2026 17:16, Konrad Dybcio wrote:
> On 8/11/26 6:44 PM, Iranna Mundaganur wrote:
>> From: Sairamreddy Bojja <sairamreddy.bojja@oss.qualcomm.com>
>>
>> Add the missing SIDs for the LPASS eNPU masters to the ADSP
>> iommus list. These masters are exercised during audio record
>> use cases where Environmental Acoustic Intelligence (EAI)
>> models run on the eNPUs.
> Could you share a bit more details on how we can reproduce t his?

This use case is not enabled upstream yet, we validate it downstream with the
AudioReach application where EAI models run on eNPU0/eNPU1 and need memory
access from those masters.

>
>> Currently all transactions from these eNPU masters will result
>> in global faults; fix them by adding the additional SIDs.
>>
>> Fixes: cd1d174c75f7 ("arm64: dts: qcom: glymur: Add ADSP and CDSP for Glymur SoC")
>> Signed-off-by: Sairamreddy Bojja <sairamreddy.bojja@oss.qualcomm.com>
>> Co-developed-by: Iranna Mundaganur <iranna.mundaganur@oss.qualcomm.com>
>> Signed-off-by: Iranna Mundaganur <iranna.mundaganur@oss.qualcomm.com>
>> ---
>>  arch/arm64/boot/dts/qcom/glymur.dtsi | 4 +++-
>>  1 file changed, 3 insertions(+), 1 deletion(-)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
>> index f04058d2e089..6b06e0acbcf0 100644
>> --- a/arch/arm64/boot/dts/qcom/glymur.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
>> @@ -4084,7 +4084,9 @@ remoteproc_adsp: remoteproc@6800000 {
>>  			compatible = "qcom,glymur-adsp-pas", "qcom,sm8550-adsp-pas";
>>  			reg = <0x0 0x06800000 0x0 0x10000>;
>>  
>> -			iommus = <&apps_smmu 0x1000 0x0>;
>> +			iommus = <&apps_smmu 0x1000 0x0>,
>> +				 <&apps_smmu 0x1040 0x20>,
> The correct SID base is 0x1060 (although the mask makes them equivalent)

Yes, will fix this up in the next re-spin.

>
>> +				 <&apps_smmu 0x1080 0x0>;
> This will bind the eNPU streams together with the ADSP firmware stream
> into a single iommu domain - is that your intent?

Yes, we've been told that these SIDs would need access to all the memory
regions ADSP firmware stream is given access to, so we want them grouped
into a single domain.


Thanks,
Iranna

