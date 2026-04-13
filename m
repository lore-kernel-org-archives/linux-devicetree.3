Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6B963932FF
	for <devicetree@vger.kernel.org>; Mon, 13 Apr 2026 08:29:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776068984; cv=none; b=eGmwioKX4r1kw1VI2aKZWSsV/dqmWg5YOm7S4J0YdxLxzMmDxYUaFOvdYqbGn0gTnpBL2P9KvLKeAvKJQ7cIczHBrgsa+1jQhl8gC6NqPXDd7yTye3cSB/qee41O2KSKF7WHsPkPWXN+dYo/LjefGLdtEVwa0iNFSZown2mRwCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776068984; c=relaxed/simple;
	bh=TJzulDCerfcNW6Rn2c6DZX7y/CO0U9cq3MJmwJSy5/A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CdNWeQCEg+qAHY1DZiPAPHotf+CzJNOwOUe8rrNniXel2ELxQOjIeAstN6KvuLAaJl5f+HkaNBhkQcIA1Ma2P+sa7Z75m+WJqGyexDfrCbi6XjVUOHcBks88/JvqKmFW0cqhvb/kxxOTrA0kqDqI7BGi6aGJEo/EPRS4XJ2FIjg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iDwKkfDm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kXXpDrhm; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iDwKkfDm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kXXpDrhm"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63D8Fr2b677692
	for <devicetree@vger.kernel.org>; Mon, 13 Apr 2026 08:29:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NZ8sf0ggPk1h1s1lmsOsg44DsYWsUVjfMtXc3A7gmWs=; b=iDwKkfDmV+yafUeV
	52KlJYPkBhp0h3cej3HIMU8lE1n1iJ8n7LqdRC97GJX5ieIOESfiXBCDZTiTvV3q
	2/i8dg+e/3wPdAqtWWkDHL0wxbNgw5U5UGgG08M06xA0DKbtdBqnksBrhKGIO1du
	4yJaBaQ/ahGOkmfy4/NkASFXVDocFiR80SfHFZAZBxDP/d7z8BZ0dhWioms6pVK+
	A8Bl0DP0vXUnaYWq28ZS2zGwZg+5smxpWCOhV/1He3oEWk9FUhr657qKmomIdUZo
	VKdR/ESzBta4MrY6NPPYxkyoz9ORNpfp7g+Cn7IEm1JFdtTUdUU/Onm/LrDb+4rc
	k+NcXw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dfffhvd86-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 13 Apr 2026 08:29:41 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50db373cf13so6198341cf.1
        for <devicetree@vger.kernel.org>; Mon, 13 Apr 2026 01:29:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776068980; x=1776673780; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NZ8sf0ggPk1h1s1lmsOsg44DsYWsUVjfMtXc3A7gmWs=;
        b=kXXpDrhmZWtl/BiPMVf7z0h01ZrBSLITAtSCAUt6g7ZhdiTi5aoMrUGx4M2bTlROZo
         EGvO6L3W0i9Q/kxfBV1qi+Dg+oc1fM4HVo8zd0xMzPgN6xZQNM5XUD957xNA7jUWp8AX
         tr2DezWrUOryjw9nnMmudhylvgMl9QonK1lOamogLhg0H+CK7Eaxfl50Oz7Bu9hJ+Kc3
         WYmZCbvi75XDH2vCWkJZIgbyiuKPMXg4O6IOVon75gGXUbZ97uJO5OViVuMbd8KLVHHw
         DA9CSQm8iDQ4DTjaKru6l/gHsbiFUwdjFuP2PoAMVIME+Td4aGDpXMQe1eukZ0+chlF7
         jgGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776068980; x=1776673780;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NZ8sf0ggPk1h1s1lmsOsg44DsYWsUVjfMtXc3A7gmWs=;
        b=eeercBnUEtEqBhUxdTga1F4q31o4+1t9lT33zK0wo4p7cwY/U9F0dVP9646b9R6YV0
         uyStYuwfpiZ2t6udmtNc4MCPvQsNqSt17UbsWhfrZQUu+HyY2lvKZUISsbj6oiNB4uYF
         FgEoHPOTpZgJcecwI1LA0Vs2OrkhfI5nQYYixN/cYhV+x7npUrA3IhyIhtkzBr0I3Maa
         aHlkAvEumh+aPvtRl8/AtxmeWAkQlUlgak3glmSRd/g2Hapn+wrBWu9owSIBlVZ+S4yf
         u/Y0mt4+0UKO/yB7Ks5p04I2W/0XzaLm1WYY6fZVLxTe8dK2LGT26IR6S8+/wtG+Kqg3
         RBKg==
X-Forwarded-Encrypted: i=1; AFNElJ9im7zTTysvPYFb9XNJ5lihnjdVvwcJnAg12u6SNpsIm/W89Uak5DyfCg6ApiIjf1ug0ZhfcqVtB4PQ@vger.kernel.org
X-Gm-Message-State: AOJu0YwHm2fbI1nnFNREikhSJtNdxRyuBsGVtJj4leEdHfbNqtkGL9UO
	pRTuyCndS2qeJDmq2MUpYxDJu4EN4sbkcy3DuNTJF2W9kTiMCiAN+66Jwc07KiJTPp0aovdD2X7
	27AlW5rne3C6l0SVso59XySVHUrBu3XPnbdHmowKg7bcbeZ0RmeCbCRag4pnIABgN
X-Gm-Gg: AeBDieuszMZPBW3NOjIT2qP3Q/qqBHtegw9syLf6NJ1IXSU1m3hmE8hXakpG+WCZhUa
	+7ifhhNLbLn+2AAyKIMHvLodbZhD8/t3WzdoWdSpLummCQkQHvv3SbyzifP5YypvsJKeZvjzKKy
	vD3g01Z+lxisaKoGUYIWje8J6AsMcUqFjr1N2iDuoAbFZwzMKoOWMvG4A71Iwz4LXs8FB0jiwEN
	IZD/r0atgYLG5VRDcRTaHX+dFwY8+8gaKsJiXgGuMoUp1Gsks3i2itG/5B3o4WVdMJu4BZ+T4yl
	B46cMWCQ6bSIlj5A2LTmMG4aULSSE8tADqOgyZG3TeV3JPSgWERGj5AuM9iQsX6UQLL/VMzBFwA
	t6nhxIhFfQC+tqoD/jf+UD7pyw1kf0VqFqWFuGyEF5QBWXmauer86sYtRpfqYAIS1kWBHK6XVy3
	lzPws=
X-Received: by 2002:a05:622a:1827:b0:509:a3c:e390 with SMTP id d75a77b69052e-50dd8236028mr119803711cf.4.1776068980138;
        Mon, 13 Apr 2026 01:29:40 -0700 (PDT)
X-Received: by 2002:a05:622a:1827:b0:509:a3c:e390 with SMTP id d75a77b69052e-50dd8236028mr119803611cf.4.1776068979780;
        Mon, 13 Apr 2026 01:29:39 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-67070815733sm2544788a12.21.2026.04.13.01.29.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Apr 2026 01:29:39 -0700 (PDT)
Message-ID: <dd384c65-c89d-4427-9420-47135cbcc0a8@oss.qualcomm.com>
Date: Mon, 13 Apr 2026 10:29:35 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/35] irqchip/qcom-pdc: Add PDC_VERSION() macro to
 describe version register fields
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20260410184124.1068210-1-mukesh.ojha@oss.qualcomm.com>
 <20260410184124.1068210-6-mukesh.ojha@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260410184124.1068210-6-mukesh.ojha@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEzMDA4MSBTYWx0ZWRfXypf+gNzaouO2
 yS1poLyv8uPpHNJyYfYAO24DbGJd6lLmTDp61O0oK+wcNdy1ckmaQrVJkc8q1jCVK8l7FqBjvCc
 QYmCbaCEyvuIwGCLqzGZPzGW4vDzbkL/M+wl5XxhZ9mRuiGxe7VXLU0agLfcfqsJtbX4cd3Uxra
 /nA212kO75SV0T7gnjNEWfeY48reBLS87LUE+yRUp5L1YeOJKveVuqFccRwjKYUFDQGSnuzbdl4
 hDuaeoDkHjDTHn5U/KY3Qi/zxHIb4MCDVDGJRojh6KIy1mcumPFNsqfzlhftOtw+NHPlHK9f3FP
 hqriidRv4KUH7PyvdXH5kjUxbX9fAQQJJXFM9fEUdomkojqPZNgooZArCIGJ9K/9DhkikU+1Fcv
 +EbZ/suo93WC0yGNENIlE6dHA8812yvinkgRn8Ji7n9wI12TsPLkSdn1b5FelQ2yFdaUhs98qWq
 7vjpDF+lH5v+J97DBXg==
X-Proofpoint-ORIG-GUID: i5Wji2OwHQ7W6xGRZRrLamSULvIvkP4s
X-Authority-Analysis: v=2.4 cv=FOkrAeos c=1 sm=1 tr=0 ts=69dca975 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=VbrZmljE2wxRSAa9tscA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: i5Wji2OwHQ7W6xGRZRrLamSULvIvkP4s
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-13_02,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 impostorscore=0 suspectscore=0 priorityscore=1501
 clxscore=1015 spamscore=0 phishscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604130081

On 4/10/26 8:40 PM, Mukesh Ojha wrote:
> The PDC hardware version register encodes major, minor and step fields
> in byte-sized fields at bits [23:16], [15:8] and [7:0] respectively.
> The existing PDC_VERSION_3_2 constant was a bare magic number (0x30200)
> with no indication of this encoding.
> 
> Add GENMASK-based field definitions for each sub-field and a
> PDC_VERSION(maj, min, step) constructor macro using FIELD_PREP, making
> the encoding self-documenting. Replace the magic constant with
> PDC_VERSION(3, 2, 0).
> 
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
