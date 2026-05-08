Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B8343451B5
	for <devicetree@vger.kernel.org>; Fri,  8 May 2026 10:42:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778236980; cv=none; b=B4+Nipud43Ia7ff8+hcXtwS+bXdP6/IbAda4HBPyS7kPwhfTibfbtYDPJ3hWZap/xPN1bB5M159WhMr8ELsAuOUtAz0dXzTckvj2n/+O/qMJ6kgD9lxzCMBQXHWjK71fjy2pvgyDyTWPPyFy9axlCMW1lX3CDJpQlZ8mKWWSogg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778236980; c=relaxed/simple;
	bh=w1p2ZKpeDIu0yqJaCudzdk6CgNOlD5fS8OxE1qIbrms=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MDar7XCdxbRIrlVA3nH6lMdGjnBNhEYFZ7O0SOcOKiCRSs1NsC7ENlFIudn5Fyh0tYlL0iMhfHYNeURhKSxYgEwrBrdZ3WXm4FdVN7FZak3OLrO5iLPUeK2IGhjHZ69GJNx7ax60L6c4aHKQAiqdUZB2SqsEaUCD5+YNSvzEcSU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BgwqTUVi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=K1MwCYk1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BgwqTUVi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="K1MwCYk1"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64857AhR2183367
	for <devicetree@vger.kernel.org>; Fri, 8 May 2026 10:42:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cxZOQbgDsT4SSfVbvrstk18EZILNq5oPkVhwWFpQr4U=; b=BgwqTUVic9PpvUST
	9JaVKcHpmoL4hGsKHrTId5nKOxVwE6MZhmJldUPf3/uDlkjR5YURSUXwJOB+zK5r
	+vb5o++pvP6SwybAYY2M5yBNLTVCqZ0qC29dF63GDcv2rA9ePV4D3ZW4poPS97sr
	axb3jp7o45n11lZvG145xhj9NAYEvnx0GDUmU5fRBjT0HDGAKNr0gymj+rrWtmEi
	juhvGJtSdi3RNABORoxQrSVQBHtHC9KA0hXs/3xAYRCY5Jgn3b9j0iobYYMMM3Rd
	apvIrjBj+fkGk/9xzLXzJrDw8MRdXmY0mYVtPCCOXJD7AwGb1RXFsAHdUDMWZiSC
	d7ToJg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e10pyayqy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 08 May 2026 10:42:58 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50e5c781193so2863161cf.0
        for <devicetree@vger.kernel.org>; Fri, 08 May 2026 03:42:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778236978; x=1778841778; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cxZOQbgDsT4SSfVbvrstk18EZILNq5oPkVhwWFpQr4U=;
        b=K1MwCYk1bb3KEBCSUfeI3nRTVSo9PxS4oZVau3kqwDOZolpCRH7/qdZF+A89SfhJrf
         cS8ytMhSjEu4vB0KerXHuAw3v9/wGfnvONdZwCZTAXZm8Z/G+ceI/bRqfGGR99RsZS1T
         2EZJIk9I0JAofhjK1ftQ+DJxTb0Y2MlehMNG4bUNGbQkhapq2wmWwR0QJPh9iR0YdaUU
         fhiqf6FZFAucbQGkO3V4wyNufPbfkdWToyRnbJzaEWOFTl8qhxQHnlhqIswpJAo5RES4
         06VcoJEzGl+0/Prd1vXc96rdLF4+0JKH0N/I3HacbhCmODWxlECbK52MehDVz/yye6mk
         T8Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778236978; x=1778841778;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cxZOQbgDsT4SSfVbvrstk18EZILNq5oPkVhwWFpQr4U=;
        b=OpoQx5Op0vVWAZFpwwo287YaFVAZLAbCGEruccLzrHXXP1dTlPZB5z9YtcDRoR+thI
         4ej88hBaMc3FYyMjUjoonDMGClf6ns21fSTIHwXvJW25O5iqyCTjl8oek9ZZ2NtWFE+p
         5MiUSzKMWRM+/GXhhadJQq1NEwKvV42TOquVVTjWh4SEyrpYbd9fpmQiXk0qgNOmPnpV
         WoEMHix/NualIAXr6+JVLcJd4JXAT9Kn4ssHPIQihEPGtBjWvPs6egPWfEPUJDUlYtVh
         KL52nyPAaoBDvkDCifwWLRZyv/KqYvpqULOuhDC0yMdINPzLpJzVdKx3yWYI+WQGZeGO
         XNUw==
X-Forwarded-Encrypted: i=1; AFNElJ+ldp+WVJfy8R2qXrivNIdk8YKcqJtIaugWCjkl271NB0yJqXqPXvtvgFnTq7ABC5I1y7P+FLHuA8Sc@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6u2kr7a9Q4qQFIayRax9cR9PIBQYkUnSQNY+tzuZg2ZDMV/Dg
	vFraknHZHWZs9xjhV2ok23da6OQTsYgRRqTW18HHuIncXLSHJhFubCtFEfo6UGouFLM00pPr1s2
	zzG5XuOPNEGlcY0qvyO2JVi84gUSzv2SuzhFfYKRmKDdGnHNE2K4WUrc332Qedj8Y
X-Gm-Gg: AeBDievJ7hEnBCTPCBye3aqcMU0eave/yot9jgi0R925syv7zpPXQX4K3A7UrW0hHbh
	9Xo2sUukhHqPaY9PVzD3tK01Gf+5EoL/JKxhYvK0eUcJa6oCEFEmUvePArNJ27WJCLp3cu5aKzF
	PdPOO/t3AzaPDOVNQ2ZYZ7PzvRPgdnbh9zAjTdafhvx5KZAyU0fWmihhQHl+h9Q/DMri9gJyGlx
	/URYAcZWqc7vmsXmCX+Qmupb+PjKoCq1kX9FoW9mLY+j7diVXKU2QrMGhQ0pTZytW+DR+JqJj6k
	P4ubwZUOWkdbb+S9BpvEC6Eyey3GdevUtemhHOVFqt4E1WI5gHN7h4koReN3hTZruOAD+++yDi3
	kgN5LFnWH//ttTY/8iVWAxl2gSiBDDbDpSRvScjyK5DSUcb1Q1okOiCJ2kvut9bGLx5kNo/lpXe
	9OS+M=
X-Received: by 2002:ac8:7d47:0:b0:509:e68:22cb with SMTP id d75a77b69052e-514628b1019mr118549791cf.5.1778236977976;
        Fri, 08 May 2026 03:42:57 -0700 (PDT)
X-Received: by 2002:ac8:7d47:0:b0:509:e68:22cb with SMTP id d75a77b69052e-514628b1019mr118549611cf.5.1778236977562;
        Fri, 08 May 2026 03:42:57 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-67ef0b6a534sm541199a12.9.2026.05.08.03.42.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 May 2026 03:42:56 -0700 (PDT)
Message-ID: <27247bee-0c82-412c-995a-fcc0c717abcb@oss.qualcomm.com>
Date: Fri, 8 May 2026 12:42:53 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] dt-bindings: firmware: qcom,scm: Add minidump SRAM
 property
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260507080727.3227367-1-mukesh.ojha@oss.qualcomm.com>
 <20260507080727.3227367-2-mukesh.ojha@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260507080727.3227367-2-mukesh.ojha@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=DZUnbPtW c=1 sm=1 tr=0 ts=69fdbe32 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=7bsxUpGyA_mMpvjpU5sA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: ses5gTLZxB2sRYIlcU9wqW_8Qt11Nue5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA4MDExMCBTYWx0ZWRfX/lzQFre4gHwC
 LJq29Zo6DKOVtI0ejVmfrnIyNk6PmDw3LVvaLRnvLNwWoHtFPOuOsuHFtQuRU0jGWC22ZAiloZr
 UsY+BSfI4phBpFWlBEMaWuxh4cp3pQsyRGi5FjWAjxxbmDO+UuraNgXkHXxhwZrD7BGKHwTynZJ
 P71WHP0TYM7iIzSZHNeIIU3Ajo+6a11n6szqaBcqqLC3w2Xp4897sjq8FPV6Bo6pjkBC7ZnIYLn
 5Ile3MGAKCt65BPiWqbnTPKqbU1U3QvUOSNte1EnqMjrsS1CJEdUIpZM/gbjpDrkMdUn5s7rVPb
 ndXDLWbmOLd1h1mzWgVfusWI3Q7Tw0x7oUnnYauVOJqgKL68kwCw/NBhAO/K7sCtaSylFN2oIsM
 TOvmEv6ud/nvuslHzp7gWu55vHL94wTez8BYQ0yJWn9pXWqNPBxxYUof7OUP1yhAk8nv4In09Ia
 LFB2LFeYRHKhzI7sC3Q==
X-Proofpoint-ORIG-GUID: ses5gTLZxB2sRYIlcU9wqW_8Qt11Nue5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 suspectscore=0 bulkscore=0
 malwarescore=0 priorityscore=1501 clxscore=1015 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605080110

On 5/7/26 10:07 AM, Mukesh Ojha wrote:
> On most Qualcomm SoCs where minidump is supported, a word in always-on
> SRAM is shared between the kernel and boot firmware. Before DDR is
> initialised on the warm reset following a crash, firmware reads this
> word to decide if minidump is enabled and collect a minidump and where
>  to deliver it (USB upload to a host, or save to local storage).
> 
> Add 'sram' and 'sram-names' properties to the SCM binding to describe
> a region in always-on SRAM where the minidump download destination
> value could be written. Boot firmware reads it before DDR is initialised
> on a warm reset to decide where to store the minidump either to host
> PC or to on device storage.
> 
> Most of the Qualcomm SoC supporting minidump supports this, added the
> kaanapali SoC for now.
> 
> Suggested-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Thank you for the attribution, but I don't think it applies here - 
Suggested-by would be fitting if I said "hey Mukesh, could you please
do XYZ ABC [which you weren't planning on doing]", this is more of a
normal review feedback

Konrad
