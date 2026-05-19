Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E21632B130
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 10:58:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779188295; cv=none; b=NoifoIg/QFnc7SvWUmzhzcx0hWJ8hwOvFcbBjoIqfC+imCY2k+DPBbOAgKfxy1fNJEiI6uQs2kH5mf9mECMoksPjA0B23kC63crZax07vixU5YZlqFk2p2XM2cB9JfiyB165JghjUp9OOnpiqm0CyU2kVuJYWek6kUL7xWz7Dvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779188295; c=relaxed/simple;
	bh=ivr9ipTg24AkNx0uhFxVMcVmRDcV9XkgIZgCptTgJn0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EJXqb7PHNzQqNe8wW468mx3z3QHbAJcm57lOyB88ruRVAvLVzACeGYbqAzKD91R5k5zyxQlrMRI1u/57RAOl9XUe8bJ3mcWdFOirUui8f46+cLy4koljbm7knh4EQpkXdG4cnFo+/ZbmX6YAy2YXjoE4TUI5YXTC6xJjKNf92aA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kHWGZnTg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Bp1/29b2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kHWGZnTg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Bp1/29b2"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64J8EVAV3612653
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 10:58:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ivr9ipTg24AkNx0uhFxVMcVmRDcV9XkgIZgCptTgJn0=; b=kHWGZnTgt24P1dYQ
	5rF3LkhUQ9IFOSwjG/8+t8ftWHWM4LDIf+YfR3hWDbCEjgdevrqxRnB2DR8K++Ye
	1YHDAotxK/QOD8mfCgTb9ImQ5MeVNGwnohyb8i4u6UBkTGCFP4lEhssoaAg18mwQ
	LlTm+zgBWMpzRMfDyggWgL8FGjvyRE3DIb8KR2gi1GngK/OTymSrgUH6PrWe6FX7
	rRLNGPnXucuCYdK1BrxGeDJvg5npJdemhw4V3P9PsFTt5sizMyPO2lRRFqPAOWDr
	2nn+6DAlpqzQy463XYu4w5WWqeoNQraEMZqXFABAlunpQtkdBTTx9ZOmtF9S+u4R
	d0O3Fw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e8m64rp84-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 10:58:11 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50fb98b09d3so11616241cf.2
        for <devicetree@vger.kernel.org>; Tue, 19 May 2026 03:58:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779188291; x=1779793091; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ivr9ipTg24AkNx0uhFxVMcVmRDcV9XkgIZgCptTgJn0=;
        b=Bp1/29b2dEjOujv2tekEzh0sqmbVhicX+Ypw0v78ZBs5z8s/qc49NJDbTQZj90VrAo
         qB+P/PghgH+DAwqhCilVJ7gZKt3zSt0F4g6CRj38dsrgeHghOwQkdIuFEOjqQJOC83Sj
         pQYiuyxAv8FbgGSH0vBrwi/7nfQ8X6mhL6Mb6WWnqoTc6XbEnUvqqJ94kFNo618rpQ2n
         gRrZVDMW/sbmte74R3dCsj1vnx3Mp944qN4Qj3NUVuxbShxFe/pNfEbugdqYrjnKoxfE
         bwuZwnMN7ZExisTVJnpotd3b/Iu3vUtON+OIlwcuZMSOT55tdu356gINi1KEJluoFnVl
         PqPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779188291; x=1779793091;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ivr9ipTg24AkNx0uhFxVMcVmRDcV9XkgIZgCptTgJn0=;
        b=GBufKidanLmdN/jl8CBx+Api+GYwF+cFSjtkCbe+FoPDc9/miEtdUxfxELheh+ebdO
         XUJIHl4jrjNXQ/4IGgcePnbhkB+sY6GzWQ+mpbia3s76iey57X9icHBWDF0Lq2DqVHod
         kHF8/UhEYSp0oKPsgOCDzeR8ZRFEpoTn2ID/gMCXHZWSAm4AqhZWp+1rh4HEoeA89b0t
         czwP6UwUH0aXloEuVsaRtniOvEB59Rpp9mHEicOrv3OjO69o98AGAqN21QRs/jHQundF
         +GsVg4aIXxVkg1YsZHykYs0qESAtO2fYvGFNi9i4uu9es0QkqEXEi/4s1PVszbcl4qj/
         o70g==
X-Forwarded-Encrypted: i=1; AFNElJ8Fd1k5ND6chu5N4cjMhpms/VJIQsKFYMvehFlTdKMARPYkbSUysoFN46VODBtsRhBCOEORCF6A+DxH@vger.kernel.org
X-Gm-Message-State: AOJu0Yy16TT9pZ+H20r2gGF8H3B9BuJfLxwA6d3rPko5P1zTYd9Q/2DG
	+4PS4FyLIqeVP2wrAb2iLUAr1mPhN1htFRYKLNzbdqOqNcOJfSIaEOQU1F1sF+0LMk69zwwOprr
	iyLy2MsE8IQoPaJo3VdfzMaDalh38U109fU9xqqgFOnfni8BHukKrUCJf7mIE2fhm
X-Gm-Gg: Acq92OH+JsPWPXgsDAi540vjNq1/PDq8uTFy4yosnzoOHU28ejo0VvhMSxT/ss9kEXh
	1LkB2TK6JmtBqpjBb316A9Sqi4Vpq7lS0VSrIuthabrRoRnSeWKU/z2BeLyxqwxND4mgugadxj7
	iJeh1OR5z540/Elfe+1295E6ATqt5yn6vXPJikPXYvY6anAcKt8dgO5ZpyEUHtBUO7e+wx6t0wZ
	WR0y8ZkXjoKz17gYiDWNJiOn73ADNhXxYVluJ2Cbtay/DYGbWIz6jKy4Krs/Nj8lSlqFTzt8tJ2
	aqBSvpoDVaHs4myY8DZop6lTeF8YxASzFGjzM4xfsNKQ14fPLbtXsfCFaGWji5LHwYBM+1FEc8K
	ijutgFHEuD/ICRuTzvB2cWR1S4N4Ad+KPUpSug3cZ2/1Aga/SUmNjPGXAxmYigHbPoj4oUZz+nu
	HK60M=
X-Received: by 2002:ac8:58d5:0:b0:50b:5286:f757 with SMTP id d75a77b69052e-5165a0dc373mr190342951cf.4.1779188290584;
        Tue, 19 May 2026 03:58:10 -0700 (PDT)
X-Received: by 2002:ac8:58d5:0:b0:50b:5286:f757 with SMTP id d75a77b69052e-5165a0dc373mr190342661cf.4.1779188290176;
        Tue, 19 May 2026 03:58:10 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bd4f4c2a68dsm701110166b.18.2026.05.19.03.58.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 May 2026 03:58:09 -0700 (PDT)
Message-ID: <91832aec-22f0-4244-9989-39bbd8defb24@oss.qualcomm.com>
Date: Tue, 19 May 2026 12:58:06 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] qcom_battmgr: Add batteryless DC-adapter MAINS
 support
To: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Sebastian Reichel <sre@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, jishnu.prakash@oss.qualcomm.com,
        kamal.wadhwa@oss.qualcomm.com
References: <20260518-add_dc_in_support-v1-0-31fbaa329879@oss.qualcomm.com>
 <56a54a34-1040-44ae-92e2-ce65a3d3acb5@oss.qualcomm.com>
 <20260519065938.4i5wot72pfxy4m3d@hu-kotarake-hyd.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260519065938.4i5wot72pfxy4m3d@hu-kotarake-hyd.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE5MDEwOCBTYWx0ZWRfX8mHk4OWyJY8C
 jXK1HDLnTUunmbR31qhXB9Rib+2GxSBDMVXfKEwAcqpL5DLLl5OU19GKrHi2vRen58O8LjLvtMZ
 AqulBK24+cVoXVPh8Tl2SxsafzRgE9RD4zWPd+DcbJQy9IF7HH5xknfoKhc2MkH6juEo3AYUQCU
 CzBd6gNkUDiNxkj0F65ttHTC+CsPaciUGGBHqkmVgXUDrgDur0PYJQbvCZMBznRugCyC3mRa+UY
 RD/3ZEPGlQ4E2l35DTGeK6lfyp9rBEBbFJ+te+YamBae1lrbyd6kNcx178ra2LYvG8nivL1PtAP
 DbLgpxqQWdfz0IYyUHXqzIOmanKxr3me3TCFcxgfoWVvq+l8tyazqyNtQBatX7y7gWkfXeO5lNF
 9G2g91rX54MpdUQ9aEJk86rGh9J1uYnsQN/Gmk5bKcZiZyB9rWd516AMuelzd/WM/lHXJeuPsjW
 fgge4vbQodQjl5C7LQQ==
X-Proofpoint-GUID: nc7h2GwM7OVWwd9HhBndJq71ni9XS7S3
X-Proofpoint-ORIG-GUID: nc7h2GwM7OVWwd9HhBndJq71ni9XS7S3
X-Authority-Analysis: v=2.4 cv=J8aaKgnS c=1 sm=1 tr=0 ts=6a0c4243 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=WGUvbcDy2-o6vtexG74A:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-19_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 impostorscore=0 malwarescore=0 adultscore=0
 spamscore=0 priorityscore=1501 suspectscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605190108

On 5/19/26 8:59 AM, Rakesh Kota wrote:
> On Mon, May 18, 2026 at 04:36:32PM +0200, Konrad Dybcio wrote:
>> On 5/18/26 3:49 PM, Rakesh Kota wrote:
>>> On batteryless boards powered by 12V DC adapters, registering the
>>> power supply as BATTERY causes userspace to incorrectly trigger
>>> battery power-saving sequences.
>>
>> Does battman really offer no way of differentiating whether a battery
>> is *actually* present in such cases?
>>
>> What boards are affected?
>>
> Currently, batteryless support is only implemented for the
> qcs6490-rb3gen2(Kodiak) board.

Does the firmware report anything obvious that would point to this not
being a battery, e.g. design_capacity = 0?

Konrad
