Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A77034C140
	for <devicetree@vger.kernel.org>; Wed, 16 Sep 2026 15:37:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789573029; cv=none; b=X7Rc/ybDacLIDeZgG06hdu3vZVRqyCOlhKq7fBUlEqNcvz6p+Tu8RHVXOMdzEWjLMkKKtTfJdD355BNlBUuEsdjpy2xThFa2EaGQL9MK85/8PidINT7mxqrpgiQPzvae+8TgaToxARzry7YuAhy5HPbPQXZT6vlyqTcfjTzGr6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789573029; c=relaxed/simple;
	bh=ZwkseMV6FbbwphPv0uGrX/aYoUPUYRh5WltUTfvDOZA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rzIAM1ruFrpByeVA20RdER7aEm7nSU6R3+fG4Oh7eyMUuBOYvRyDDMjZDxGlM8DAMydmSu/IlUhj/H4A5nKYTCR2QTDSDacXS16OQzbfhAUv+xfQW4tVyh1//ylL9VBYrxJoTZwN6KLTuPH+DZuygqF7QN+j0c6huzYfci8qp9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iksRDBTL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LRxBcsI3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iksRDBTL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LRxBcsI3"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68GFAl9M2405288
	for <devicetree@vger.kernel.org>; Wed, 16 Sep 2026 15:36:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JdsTIVTs0KYsy94zRrHjZ3fCdvLEW0KfasUbrZWJ/vc=; b=iksRDBTLWdel5adO
	38M/fUJ5mmG+ZK7EZVBvbaCloehNAPJWOFG3HJI8ZlAtCnB123XaRMGvvBePspvq
	bJypI2FIjqSRtkNxFUGK2yyLgy8bDTgkmQlE7V6ic9P3GCBE0R4QllPFRVECsxVN
	CX7D7fP7XRjZQWhwAZ5yxIsp24q3uiE+Ed7/V33aezLDbAfWkt1DBfvVsDEcsGoU
	Oc2IJMDOMtGxkfvHpXoW3BkVwqMsSVttgQqeuGPB/rt9PHU7FvX5wyWGMW1a7ygo
	uOyGNFsBXtjK8DgFSQ8pAfycg9pUnU+ji5GN8xjUQOZF4d7PyGKSb6wp4C+DZIhr
	iMYcLw==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqtn50x9j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 16 Sep 2026 15:36:58 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-9830f2a8195so1035063241.1
        for <devicetree@vger.kernel.org>; Wed, 16 Sep 2026 08:36:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789573018; x=1790177818; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=JdsTIVTs0KYsy94zRrHjZ3fCdvLEW0KfasUbrZWJ/vc=;
        b=LRxBcsI38asErWduQHfACnACVkZksER123Z4cVPw+ha65dm6X7AWqEWN35mgtxTe6F
         IyW0PraqiOyZs2mX9/dgUXzb2qFy6WSGzRD2K3p5PmHtNIMKX55nH7ef0Wv1c+vwDLK6
         4OH/eelPZtuZJPOjlryj5WV3hQIu1SAdGHVL2yYx32B6I7aj9jlsXfIdJUoAtLjddqzP
         TEAeZW3KHqLtooINqbWS7zDfad0OD8zluJshEg5jN4yEd1td+g21MszjTL7Xr4pNIT8i
         h0yftgKKnY2m5rO/t7mBnPmrZHQ5U9D+7ilcBenQ2IHOipE5t7TPlv/KQIUOi2tlgofv
         U4+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789573018; x=1790177818;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JdsTIVTs0KYsy94zRrHjZ3fCdvLEW0KfasUbrZWJ/vc=;
        b=G323yK2qbvVJ3O24Twm+wT8nxv3b8CbsJiIjx04JUtobt31OYNoKfG/PoEaPEZOkZ4
         HNq15WI15AJZk+N3j5CPqoFCJqsW5gYX3dpHJOYA7YV3Z6Lr2g/yxr2SofhAWP7sackR
         m6vJctA7xbwjL5MxyNwunCnpK8FAnvn9BuLsKxlUCysqjXqeykEHi2c35GC2MmSYDJHx
         VnZCgoXJmsz1K8H987aJypZ/dUK4nAcgAxiSeiYNOgsjBpWr51nMa0CTjzURbsyhM59r
         chHOFpowQ+mQmPg8FPDSklP3EByGKJKLng5bmZyymSMOkhO43So0EtVCVK3YIcCN7W4A
         9aPQ==
X-Forwarded-Encrypted: i=1; AKwUvBzz1joZTkqtgR98+JvGYFf4eBrAb+iga3D66oWrzFGqNC93RQUeW+RviAysgA2KAYU6boExlJZO4wD1@vger.kernel.org
X-Gm-Message-State: AFuF++lwK9vk/Jz5K4vBVjWFUUHVU7DLDDcCZJfWY2md9tW5nElLsd6t
	5k5DBfuOGB+pZmZ/H4TzA3IF4Nd6++oerefMAZMyEby8KRkElJta3a/vOyIfDCefoLrWdsDr/NS
	WOg4zJNa4XNB1csykDMQMZsavOziYo7wFNfp7EWrDoa2AyixEhwe8DljlXejWqTMR
X-Gm-Gg: AYBFou1MBQYNVHYtvYrZmmNiOabsa3Iz88r5E6qeDis0Rb6/cTPsFSQXO27C37MC8Ov
	6sHUQmVHQ+aNSdsCAwI2OjGUhPs5Y+WCGj5Y+tBs4UUEr/YFdfsoSfy+5wyweIsUR/TZp267G+g
	wL9hQqy/eB8hPG5FyVp37LNvJ09aLWyF8gLgnSWZh/Q0yox+ZQlsNo96MzgiD2SgKXTs3bC0M9z
	drttpZcEepJbrKNZtYVgl/IYdSzX4RN2m8o/3lnZq5g11Jd1F6wwh8zNLAX7PxJ2SeLbBL+O+uc
	kZCPYmuDeLHTIozpxH6RuIivucGwrbzoiyeDnvEowBiDoGaNVGTzljn/07Skh4UWv63seZQbzuv
	owIkn8yCHWTH5segS9lA6NeBehfmxI0uFKAXCJyZWeu9VpalVexW+fE7HCUNAmuw=
X-Received: by 2002:a05:6122:d24:b0:5c7:fbb5:6ea0 with SMTP id 71dfb90a1353d-5c99ae061c4mr4693031e0c.4.1789573018191;
        Wed, 16 Sep 2026 08:36:58 -0700 (PDT)
X-Received: by 2002:a05:6122:d24:b0:5c7:fbb5:6ea0 with SMTP id 71dfb90a1353d-5c99ae061c4mr4692900e0c.4.1789573017750;
        Wed, 16 Sep 2026 08:36:57 -0700 (PDT)
Received: from [10.38.244.133] (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9123be95d2esm27183766d6.30.2026.09.16.08.36.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Sep 2026 08:36:57 -0700 (PDT)
Message-ID: <5f8746bc-392a-42c3-8ca2-07327e5651ea@oss.qualcomm.com>
Date: Wed, 16 Sep 2026 23:36:50 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 05/13] arm64: dts: qcom: x1e80100: Add CAMSS block
 definition
To: Bryan O'Donoghue <bod@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
References: <20260906-x1e-camss-csi2-phy-dtsi-v6-0-067f2ecc4630@linaro.org>
 <20260906-x1e-camss-csi2-phy-dtsi-v6-5-067f2ecc4630@linaro.org>
 <KE4uG1eVJQ53r3OwBVGp0Yl45AtOqMj-yJJmAq67lq7ze23gLlb-2Ci_I0qYx574oG8woS9A13xt2Iu1TkTMZg==@protonmail.internalid>
 <4c43c80c-d8c3-4738-9a5f-0b3e1c19679d@oss.qualcomm.com>
 <6ca6cacc-3fcc-4d1d-a6cc-cdc1e9a403ca@kernel.org>
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
In-Reply-To: <6ca6cacc-3fcc-4d1d-a6cc-cdc1e9a403ca@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE2MDIxMiBTYWx0ZWRfXzqZ5DzhuBmh7
 jxHWftPDgcgP91cVj14rG0m0abfcwz7nlWsl/zRzQDPCqGw3knnPszqAivWCw1blXRfmBGCdnE0
 11avSfXwSb1zsiTqWo0DiYFw8fcRhi3/nNAUTXrquWCbp93o/mcMtDRB6ITu52ijZ8nLfMHYlBl
 /FqtGCMsEAWjsz8pMoud9Jp12pGKdn6kD5V43fZ1hz94FbMYIdRWeioKTFwxvGMuid11lAr4Y56
 36Xwi3SiziNXLgQcnbGUaiNGjX2ZIZOlv3Rg5meVN6uPGtX+5CeuEWShtIgzcVyYJVQ39w4Izzo
 h7ux4nVJE/f33nVYYm1/OPTBTyeX6iyQrbrBNIFh2iiZcJxb3dd1x8olk+JFoUBRGWilBGjpE42
 IeqBM+o/4lz69qdK3fddtx0sNNQ0TAxFMy16VLMmDJoVohywxhGXU0Il+ms5esYNnSOxUxrFAce
 x5MTHKI+vYq2tiNqYMA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE2MDIxMiBTYWx0ZWRfX8vJxH+tZXJAA
 NIvkfxBo99HRUr9cWSOLXH+yfQ8LlMHRYZSJkyfk+3iey4YIw3g5TRp4tNO+rI6a8rlBFbP0ArI
 iaitZ1ysIxyVr38jpjZVMcWQxgQ2VGM=
X-Proofpoint-ORIG-GUID: KnIpHeYl1Nwar5i1YjzHKZTHSsfqLWm-
X-Authority-Analysis: v=2.4 cv=K7O3jCWI c=1 sm=1 tr=0 ts=6aaab79a cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=8EY4eiAYLadLDWKzreoA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-GUID: KnIpHeYl1Nwar5i1YjzHKZTHSsfqLWm-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-16_02,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 phishscore=0 bulkscore=0 priorityscore=1501
 lowpriorityscore=0 spamscore=0 adultscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609160212



On 9/16/2026 10:59 PM, Bryan O'Donoghue wrote:
> On 08/09/2026 09:46, Wenmeng Liu wrote:
>>> +                 <&camcc CAM_CC_CPHY_RX_CLK_SRC>,
>> I think we should remove the SRC clock.
>>
>> Thanks,
> 
> There's no clock that is derived from this clock, so if we remove it, 
> what is responsible to switch this on ?


This SRC clock has child clocks such as CSIPHY0/1/2/4. The CAMSS driver 
never enables this SRC clock directly, and enabling the child clocks 
will automatically enable the parent through the common clock framework, 
so the SRC clock can be dropped.

Thanks,
Wenmeng
