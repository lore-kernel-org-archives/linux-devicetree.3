Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6887D409E1B
	for <devicetree@vger.kernel.org>; Fri, 22 May 2026 14:29:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779460195; cv=none; b=uukSs2aj1f8iYtKMxzOx9cGvS7c+9CR2IqSrpRaC/GKiJR+ZX64ieiTeXbMO3qnTDvqlgftzqT8rbnE+VZ4Re5KYb0Jsh+2zJtTqGGq2awKotyLPrmTzHH42GvHa5Qt3gLXUN2hhA6Zwbzv9QZ7NdUm4u1RufC0LsUaHaQiIlmA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779460195; c=relaxed/simple;
	bh=g7YJh6S3LOw4N2D0kOgN8qAMoXO76noYCCbV3Z7SoKw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mg90AXPq1F+7TDBiGp8GAmamYLpMUaWuLlnw/2+mgzps6rilUAYC3prjGNT76+vmJXJmBLRzTJalNpO2faWjkVzmeK0B/0v4dlhot3GaJDPo+/uigYgI+oY3hcFVhAXcSH+UzetSVupcUXAyXpRIf34D0v6xXIOlhOnFEhDrAbo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fQGjtB+b; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TbmX4QM/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fQGjtB+b";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TbmX4QM/"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64M8tQSc1816086
	for <devicetree@vger.kernel.org>; Fri, 22 May 2026 14:29:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	g7YJh6S3LOw4N2D0kOgN8qAMoXO76noYCCbV3Z7SoKw=; b=fQGjtB+bC9wPyIXf
	jE2JEr6EZab8eezHxz5Wvofhi41Zb1oT5FYhFigpWRCGTMQMoZnGoolykRl2zYtS
	UPAiqcxedSUPm42BzGtyVYXmtdeHVrCnxjvDAr6kIRlanZw08nq4J+lGpRfKGHfZ
	nBOqcbqk0OPBXIJdwJeHbxc3iez9BfamD4DW0hayb7zK/djWNUfwjkZTNK0JGsgA
	fZhJVfY2zZ/dBUDtpcwTyMVNhGII569jz7yumZQxqbWx0SnkKetN9QfIvr6Hs+lY
	PJypSsVdoaym6Ehj2Cf2EWouqR47dO76kIF/IBpIl3++Sva+MnIqzXPzB/p+vQHe
	OWBI2Q==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eafrm2crx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 22 May 2026 14:29:49 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2babbeff9e4so80514245ad.0
        for <devicetree@vger.kernel.org>; Fri, 22 May 2026 07:29:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779460189; x=1780064989; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=g7YJh6S3LOw4N2D0kOgN8qAMoXO76noYCCbV3Z7SoKw=;
        b=TbmX4QM/ScQTDyR8eIGQR8cILH3Vb0q9AAmO184YSlZOsylyLWhnXi5M1Iuoq0eh+t
         udarkDjGXIDOKCLzzj351yVGKaqFIEu1lCyTaOTo74Y63exNr1tO3j8VTqRkuVPNOwjA
         65AlL7XfAgoE4n+s2fTEtw2VBzStwssKGspKUILJMVvbBqUYmFY8IKBXlM1AEG/3GLkg
         LQcckxBk3P0BOg7f3tGk/k8xN4FcnURPTaCZrv9nSWjjne1ACcsbdRDGflhqjbCzW5f6
         S0jW/sVVRBFbn8aiSEUSEsVWlAJQl9XtJVJXp3dJGXZXP7XNp4ZaYp8VFe7OkJBWBkom
         WAVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779460189; x=1780064989;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=g7YJh6S3LOw4N2D0kOgN8qAMoXO76noYCCbV3Z7SoKw=;
        b=WRwyn0mcgrh2I8zYiEMTywMbYNuAa5JlRmv1AyUNni+/oWHDJXL42p/Z2LoQdxbfeD
         lwMWG/O7olA7ZcuS66SfrPcyB4QWsUdVGaIef/sSC+lOtfHUGg+ajvlnXgn3bonXGbV9
         4TThOUec1i70nkBRD20MCDawiAKGqpgvfyrKRxjm16CgbCvEvi9aQEzv8NojVx2RuAAw
         wmMM+q7NbaalxPeaWJexmH5eMUL4+x8/GhCM6LSdvl45iQLmbGav8czZqibiWn5L5mWW
         2zsHM1cwDVfIJ+CjF9nRhsxbbK+rm8/yisD4G57GBY7YIsn9cuJldA5oHAzirM26fuUV
         8NxA==
X-Forwarded-Encrypted: i=1; AFNElJ/pib6riOLuNPVdNFSdb37I8X+4wO0ZZrzINmK5FCKQKa6cTJU5U0IUDl7OBevzefiCGtn8k8Qmh7gT@vger.kernel.org
X-Gm-Message-State: AOJu0YwMweD7xhdTNb/vbN8FpSEqAjALulo9mxtjcpMXLJUMFF1DF9hD
	b4R9BNdYGD9WC9WKUBqqxijz4KIVeu0KNzWIr98D/Avm4EH5hls/yuEcD8sIiFBXTf87n3gIgpY
	Mj9k2vCyxqLFsqnXe7+UbR8m30NM1PUMnkE3EfUX5M8+gwiLRdsG24+IF2z9Cc8sc
X-Gm-Gg: Acq92OFpRVhVTFGkKUThD1Likb5YSnGFQdRaqjbDEbLhJKO0vYJHCapjlrSMKMaRtSW
	URTz6OLl/W4QLU7QzIOw4wU6JKdn3I1yTkVlJkVOtQousY9v2Wsn6GGHjLQkYVhAByhioDRBE7m
	c/3caHGZfeIeWF5IfMT4luM28Slxv24v/pxFNgWOlszNLspfg+Vqmmbxp0WEm1mm8ssjzm6nG5W
	JdZTEZ/tmNM5hk3MSAaW+QD8ZPdI0KR44zhHNm6IFaBWxpp+8aSwDOmTKINgjR6Xq0hkjBwbYz4
	OxozA/nHj89ApZYFLU6C/68ba4cYVMC3G9xw9WKuefLgVHf9yOtnH7CTvWkVJzY86o7P4QqyntE
	XCPzFYwYyiPvTYy0GcBiqUb/9dyWFlDGaqltWQ3EPj5tl2AZi
X-Received: by 2002:a17:903:11c4:b0:2b4:6597:44d9 with SMTP id d9443c01a7336-2beb082545dmr32146915ad.8.1779460188792;
        Fri, 22 May 2026 07:29:48 -0700 (PDT)
X-Received: by 2002:a17:903:11c4:b0:2b4:6597:44d9 with SMTP id d9443c01a7336-2beb082545dmr32146545ad.8.1779460188216;
        Fri, 22 May 2026 07:29:48 -0700 (PDT)
Received: from [10.219.57.29] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb5695c4bsm18520165ad.15.2026.05.22.07.29.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 May 2026 07:29:47 -0700 (PDT)
Message-ID: <293cd6ff-3b69-4448-a493-d2e72a358cbc@oss.qualcomm.com>
Date: Fri, 22 May 2026 19:59:41 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/5] arm64: dts: qcom: Add Shikra CQ7790M SoM platform
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>, Ulf Hansson <ulfh@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-mmc@vger.kernel.org, monish.chunara@oss.qualcomm.com,
        Rakesh Kota <rakesh.kota@oss.qualcomm.com>
References: <20260519-shikra-dt-v2-0-c01b90fb4395@oss.qualcomm.com>
 <20260519-shikra-dt-v2-3-c01b90fb4395@oss.qualcomm.com>
 <0b1c66ba-d841-460c-b702-8b4530d56f73@oss.qualcomm.com>
Content-Language: en-US
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
In-Reply-To: <0b1c66ba-d841-460c-b702-8b4530d56f73@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: wOLypdjd0Sy-KVVRTRvrpSv3lxwgbz-s
X-Authority-Analysis: v=2.4 cv=Zekt8MVA c=1 sm=1 tr=0 ts=6a10685d cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=rqZrXzn3qAiNiV10lkEA:9 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIyMDE0NCBTYWx0ZWRfX6BP3+vNsJ3Iy
 S4bz5mWm3uhKRAtSCjfchNJ+d9Dhz4mji25fKUVbzcydReJdsDIfJzuxfMwFIiOL2ys3eOGD1Jq
 9ERkIL/Or25nAZW7cHGfmNjwsTobscYOO+tCoVmH/SiHI8Vi0yMXPIollrxcu46TwG10ZxeVUys
 UvK3Dqs//OcsdSGDAKySwRXLBmblTYyEspxzg+XgRNrEl0dHnBIGkAg+9tEA0lWEXWz4jG9GJT4
 ud93/XnsI5MALACjippjsc+v1nJ+kdno0i5V5NFpdICsmwgAT0rJ68OLPIWO0cFFYN6sq8qU8tY
 M59f8B3frON5cC2BeVh3ixugJ6p+O8Twhht7UaRF7bmmoI+aeVL8MJqxnPYHp5uLXj2BEfwdUfo
 upLlgPPMCs8ZCYs7rynSGa9J8q20vPpWY4bKSxrb7cSp8yuuoG9bSF9l0WAoxMnfHWRFFxK8Sn9
 YwMWLO+wZanjjeNmXMA==
X-Proofpoint-GUID: wOLypdjd0Sy-KVVRTRvrpSv3lxwgbz-s
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-22_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0 phishscore=0
 suspectscore=0 spamscore=0 bulkscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605220144


On 5/19/2026 5:21 PM, Konrad Dybcio wrote:
> On 5/19/26 1:21 PM, Komal Bajaj wrote:
>> Add device tree include for the CQ7790M variant of the Shikra
> I don't think CQ7790M is Shikra

Thanks for catching it. CQ7790M is Eliza. Will correct it.

Thanks
Komal
