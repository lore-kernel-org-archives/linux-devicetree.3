Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA89C43F4AD
	for <devicetree@vger.kernel.org>; Wed,  8 Jul 2026 11:19:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783509543; cv=none; b=C8vfQhcI/ttkjZtLxfq3vXmELrpHnuM16NOnZfJRfujqS9anzFHjaQ9MqCoHZEp+oJiAys1mRCKXTnVQ5fpDZ7UKHFl9UOtqVT1ZQRKr9h+IRbiSuA4GKUTKSB71O4TyMYn8GfIf1YEbMMMFYCLq9X2B7jZvOU6CFGE1h+lyLcM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783509543; c=relaxed/simple;
	bh=/Vk+NQ46cUjFH2FZV8DlE41cVIvUvSkk9Lp8tzGqWRM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lGZryoXeljdsOC36BCa2iLc1ypfDrpbAZYCdE4e111AOfYyGy9nXyqQ9JHrctljiksK55cefAFCv9pUfreAfNrGnUUY9uRhIHlb23sqghkBo42mRz1pO1o1GHd3pW235Hwyjox+HOb2zXL1ac4XJO5p+bHjNYszqzCUbqfBDbvM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=E1sn3FI2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fuiDGpuk; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="E1sn3FI2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fuiDGpuk"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66889Dh22231103
	for <devicetree@vger.kernel.org>; Wed, 8 Jul 2026 11:19:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	z7ldesInF2vCLleW4VMixqpYdbZMyRDzJUKPQXlSMq0=; b=E1sn3FI2OQRb9Bnw
	/EJv8BM+WdswdvEwKwNBDEdq0+OvrLMBWe/nY67iCorvAt+3EFnpKOCw6e0e4z6O
	iLbcbRkWiMd+SMnllFZf89iCSGy28t0uRHrdH8L0ze1kUFlWkle2761Ztxf0GU0w
	ZrS4lTHCyZ1e+O3I9LbieDZsvDWnqPavD5ohEuYSegGSrtaGykyuKWlvHlJ1XT1m
	VVFCJzq+El8rRLgpzJE60kE4jf2HkghYtOXVWKopIJsbyZVSk5aVzor/AbeUwtCc
	LLzy02YUqJA16K8gYCgM8daWai9j16i8BQlzmo/6MD6TZ0IhsDUW0AAC9ci+D7/O
	9HySkQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f95e5v53h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 08 Jul 2026 11:19:00 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2cce02cb769so8287035ad.1
        for <devicetree@vger.kernel.org>; Wed, 08 Jul 2026 04:19:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783509540; x=1784114340; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=z7ldesInF2vCLleW4VMixqpYdbZMyRDzJUKPQXlSMq0=;
        b=fuiDGpuk609YlfU2CwUUG0YzM0p45AyQEJz8mLdCQUIrG7F46UO9ZykTv1doGuSKk7
         1MpZ3L0hKSQhaa+m9qLcs8BRHpgDXS3pGGejg0JW6CWGmOHrKuT61lQJF1kyRwd/HS2G
         VCDOOnbs033XrfuDpA3OIBeRdEL+6y9HpxQ3+RzoAYVruTmxHnSfA6WMcLl8QecGZRHo
         Tvfvten631W80H2klmjCTWUU5WxLbzqp40PqA2Vq0qby4ShRGO4ShsVcRDRywL5h3xZ+
         IELbog1nJIc6WYN0fCNE0DskLeP3hgTL/YruQuGVITTGUv1VVHo4JC9FHRExbqggSsMW
         Ng/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783509540; x=1784114340;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=z7ldesInF2vCLleW4VMixqpYdbZMyRDzJUKPQXlSMq0=;
        b=F16pARMbWuLruXHnAtAF9VpOEZtze7NTXYczebhV1I8tmpDiK2wjuyRzZjPYW6TyEv
         KTrma7k0LYwHKywE3k+s25REhY66ZlBP0+hJr4EmptUFumq4K4ufQtzrner8LrEy/m+P
         d5fx+8O05XE/PUKZ3UKy97D8L0wMwJ+yrzgp9fJ+UhJoDCTS3t8sCM3KwcdUyIEUk0h3
         0OEqsiQWoxcVdNblk8ehVYtVsWs6fCCH76/rtCxJiHj0JOIBf3Q1fJ5k4ajyXu3Ll0Oy
         7PezNRqYIGadx55FdD9F/lfYNc2TTXyMLIRS+/tuA5oGSsD/sxtfBRDOkGPaCZVPehY9
         ApdA==
X-Forwarded-Encrypted: i=1; AHgh+RpwfLhgjyLHJy93H+oYHuDJOzct5u4fr1x1tSzBz5JUMX4m9Ehgtb8bp7xXhYdHHtdjmFP3hOHYP161@vger.kernel.org
X-Gm-Message-State: AOJu0YzJ3iin3EDVAZVzX5OFAC85CROzyTr8AX6qrQeUDAXQX0LZkvVk
	5IFSo6bs1EdSBGCBum9OOzRpUCJWHcTdgjC/cdsnhfvgBmyryB5AOXH6jgSLkis/GnmH4+1R0Kl
	+ZoXMvikbBAGBLADAxEfe8Fday3qec1AE9NJ3M9wA0i66o2xslMFHC38jyNdN5tlv
X-Gm-Gg: AfdE7cl/lLI0qdJCZl8VtxJnV+XWGxXUTjVe8dMMJ/UAhZYF+RmT/0GSqdbUWCC5PVC
	ZJBQWQC9uNaN/NDptGGAEFAB7sHs0ENiGoYOMb6uRl2a2kVhnkF+qcTNsHtIwRGLjBorySHpISw
	Hlmnn5XdGREhWh9Dz4JlelPYCyLvLeaQEclyZtCsLVevRrSqRhOkz5h1maWCaZGSB2IPC4g2l0a
	JvXhBiPDQD6APbjoFYF9uZj+ZDMXKlIRHZSkL09rTC/swbJZE3Ds2jYhZSeKJRw/qv5nKIfTNcV
	frvB6AZnq5xv+yFXPs2/k9izZCDVuvATRzeKQvQ3jbPYiQ40AgaR47BBY1RSqsWW6KS1jVrF3ep
	0oxzeObIdTNqsxQDOTdFiMA/WCbq+274Tqlh4t0w=
X-Received: by 2002:a17:902:ebcd:b0:2cc:ed57:c7c with SMTP id d9443c01a7336-2cced5724e1mr17400765ad.32.1783509539794;
        Wed, 08 Jul 2026 04:18:59 -0700 (PDT)
X-Received: by 2002:a17:902:ebcd:b0:2cc:ed57:c7c with SMTP id d9443c01a7336-2cced5724e1mr17400115ad.32.1783509539361;
        Wed, 08 Jul 2026 04:18:59 -0700 (PDT)
Received: from [10.92.199.168] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccf797ebc4sm318125ad.83.2026.07.08.04.18.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Jul 2026 04:18:59 -0700 (PDT)
Message-ID: <a99edc48-d429-4523-a446-5908ce24b307@oss.qualcomm.com>
Date: Wed, 8 Jul 2026 16:48:52 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 07/19] clk: qcom: dispcc-qcm2290: Switch to DT index
 based clk lookup
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Brian Masney <bmasney@redhat.com>, Dmitry Baryshkov <lumag@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260703-shikra-dispcc-gpucc-v5-0-cc13826d4d5a@oss.qualcomm.com>
 <20260703-shikra-dispcc-gpucc-v5-7-cc13826d4d5a@oss.qualcomm.com>
 <f76c745d-9bc8-4850-8776-45e8b04710f3@oss.qualcomm.com>
Content-Language: en-US
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
In-Reply-To: <f76c745d-9bc8-4850-8776-45e8b04710f3@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: xTIKt5mEKCJEJIzb8FOfG5I_bNDiSMFN
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDExMCBTYWx0ZWRfXwNSIEuXk9uo1
 uL5J2VIVLlEtMx1dsVcaXshka8Tig160K9+t5Y411NoHHgHAH5VQq5NxADKan4wQYOK2+lWGSuC
 JNyV1eyvYYhKuaJnPu4hRnDz6rLhZfQ=
X-Authority-Analysis: v=2.4 cv=CNoamxrD c=1 sm=1 tr=0 ts=6a4e3224 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=dgSI8aGl1U6gYZos47QA:9 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: xTIKt5mEKCJEJIzb8FOfG5I_bNDiSMFN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDExMCBTYWx0ZWRfXwKwMYHpUNshk
 yBXDP4KeRMid/PbrcXHXlgXFBfKl9azdANscUOIAus9DJZwM7tOWLRKdKMQESBR0ItGAWktczDs
 krXmlstdfx5ogT+QXvLMbzMWBgR7De/Gc+M4T1mHtnGTS+mQl0pjFzaYw/Hz/sMhJQyY31MkEAM
 Zrg8Zgvgc15D3h3Te3h7qhLWcs7IA4gX+GAUqwZqFU7EoUPoVYX9+EyMpVSOJRv1gF1mOrY9ggc
 Up/VZULfjcqGfULPXxxw25GqTEh4forUJ5u1lsEMUI26ZxEMLpF8uKOugv2vmtgVfgTuMji4L4F
 k7VmS/oeyVW46QSWd5Syfl0kVj7sw8JrJd6yqWIVALSu0AYZ/2obrSZKy8jq5HilV3urt3Cv/OZ
 E5ubGUuHJrmCyl+Bw18GCsmsfwItD1lJJneeGVru7HDK/6rq+JDI99hvXm72JMkTdjsDr6sObme
 jdHvJSMTgdPtUwfEL7Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-08_01,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 adultscore=0 phishscore=0 impostorscore=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607080110



On 03-07-2026 12:45 pm, Konrad Dybcio wrote:
> On 7/2/26 8:31 PM, Imran Shaik wrote:
>> Update the QCM2290 DISPCC driver to use the DT index based parent clock
>> lookup to align with the latest convention. While updating the parent data,
>> fix the MDSS MDP clock source parent to use gcc_disp_gpll0_div_clk_src
>> instead of gcc_disp_gpll0_clk_src. This parent is currently unused by the
>> frequency tables, but should be corrected to match the hardware clock plan.
> 
> That change is invalid according to the agatti clock docs -
> DISP_CC_MDSS_MDP_CLK_SRC RCG leg 4 takes GPLL0_OUT_MAIN as
> an input
> 

The HW clock plan naming convention is slightly misleading. Though the 
DISPCC HW clock plan specifies the GPLL0_OUT_MAIN, it is actually 
sourced from external gcc_disp_gpll0_div_clk_src(300MHz) clock.

The above mapping is correctly handled for the mdss_ahb_clk_src already. 
But it is incorrect for the mdss_mdp_clk_src, hence fixing it now.

I will split this fix to a separate patch as Dmitry suggested in the 
other thread.

Thanks,
Imran

