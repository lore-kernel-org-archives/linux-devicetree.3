Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECE99357D13
	for <devicetree@vger.kernel.org>; Mon,  1 Jun 2026 06:15:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780294514; cv=none; b=NNOb5MgkylZalWmwuVDd1wWrB/Ge6DKfvqQ43FBAe+8i5WSYg767WfTxwMGGd287voUsHTtXjkJrnYS3EwmdSUNjJZnyf0ReJoaWoJs8v+21iuD+5WzxZSEAg0uAGO2OC0K8kluLepblUX090JPN+8iN+lOr8diMb+IV52yK2Zg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780294514; c=relaxed/simple;
	bh=BYInH99AES8l6GOH74UMUsVD2nICq4mqXDc//+JCYIQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rDqAfhgPIWcttl6jR4e7cDTl6oZcHG9TlaC1Hu9wIxys1swmpmSLOfwHa8W1E4XGE1eMZqsRIK9U+02QFmjOiFh+IlQFhiwJcIftUwBHcbcT7bUXlAU9empTDjlK6ThFxsUFWNr2q5q2qbC1d484uNfr4/jFMagVk0PpyarpYB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=b7D2e04K; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NrStXR0I; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="b7D2e04K";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NrStXR0I"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64VLgdaW1375308
	for <devicetree@vger.kernel.org>; Mon, 1 Jun 2026 06:15:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xfeYcVH6YJHbtfgsbpNeqbgrkd3UR64ekVNjwW2FoaI=; b=b7D2e04Kz26XzWCr
	bsPCL3rVZCm8slMypKGbUCBYyICgr2WAb0+IKO6HY+iAU6eJCqQl6a2WsysdwVLT
	IqOH1G7ORoiuqESxKULs8sLQCEz73KrigZa/6ONgXd84l4Mj58PMHm3kdn7cB+AN
	+ji+aUIHMWP9I9f54SLErCUPvB3JHXqgCsxi9+oGI20Yp/hJ+D4uelZDNMsXW+7u
	H1Xbz8MgbpuebslZIn2j6Zx2JldJtXvuPiLdHc5/z+guva4Q7VS80hBYaeSKgai6
	5VYcl0zrBIIG3CEAGRS0F6vxn+2+AC5vEybE7yjhoo9ZpuzLa55gsfsU1wZGnvP7
	xv+4lA==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4efpw7p4hk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 01 Jun 2026 06:15:11 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8422875c676so1244229b3a.0
        for <devicetree@vger.kernel.org>; Sun, 31 May 2026 23:15:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780294511; x=1780899311; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xfeYcVH6YJHbtfgsbpNeqbgrkd3UR64ekVNjwW2FoaI=;
        b=NrStXR0INnAIWcW6LooWnKviSuXXIq9SGT201eNfYLR0zxwpzk2RwqtUOMDGrqjAlN
         irhXc+ceKfkPy9snAZYJCYui5Ob6mvE2KktrK9kLAfpelWmqKwVxgWVYIWnO4yGJrJw/
         sEPODh3bUcOOGGDnH5YF3PY6tP2i+B4sBkeGjxFwSnMrc4MhFH2DXo1fS1sFu47g0GDH
         tR5qIIrmftpZMcbMVq/BimqQWqdouyelM7oXl7u3NLGplVPszvXHmc1gMTn15+mMSo7L
         2Nb0mdTLyduKM/vNK//kXEjQVfMVuWOCTJIRVfHL9HVqQFtO+i1k8hhRr44zjQZ5WnzU
         mlnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780294511; x=1780899311;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xfeYcVH6YJHbtfgsbpNeqbgrkd3UR64ekVNjwW2FoaI=;
        b=F3wNWXx0rUszTYM6eEHg8Bqmu1ZX1eSYXAbXpJ31qYliJVas2Z/lIRMfuBrS4SNAy5
         TR/H2cafdt4qmw3XduADf4IEKrj2ygWY7MS/PLngtCfRYLJVAcjypWBJGt9XpV7bjLBj
         Yf6ft7rwvE/erJBy2sq3Xrh7eqVMhp73FN5k8tjxVvyIBa1jAuU7sKPDnqlTCyJr8+M8
         hrHT5N6zNOWOYFEb8EjNIFp8JXQ4hgBIzman26IoVEpfA8y19yvdETeCMul6ySF9q8SW
         jSM16+x0SHDxBDuoAClfsLFazj/HKw5yMBOXOHm5DnhICz4F21Sj+GTK6KOXDhbpzfiw
         Gt6w==
X-Forwarded-Encrypted: i=1; AFNElJ915gvLtDane89HvMRQKabhAcCfQrF9yQRt0Zaq+te58S/NYvIRLphexwrL8CDtaf3zsHS3oOB+364l@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+CGouDwEqajaPE6xEZEhSBvXG6ZY+YSQ0XzlHDhRB1nWDliti
	1PhlE7YGcC8EC7B3JXKQ2Wnt8dfOzWTEofEtun6bX4M9+g0G+IjyJGo74VFxUkvwpA6XdJfnSUW
	2q8GPT8aaxGfWrm5F+ch6IUuReayxtv5JhlREBoLjnJxgY+/sYhH2EEs6KgM3DNNa
X-Gm-Gg: Acq92OHQvYZQPGzV7R3pjRPNrmRaW5MpgGAE3jvLje0nF8rTD8OfQLNwUdDTJjsPsGP
	NAu2YwoXMmeuixwxdqJZ3JnY0ln7L2ywKLH3DHCxLbgt1xAttwUQRBwznKxJBKNV8rgDpbWxOVv
	6ndGqtO7NFb1YgiWo+YRnWVmhq5iWp1AhNC2LSomII/Y9xxN7KG7L23f8Py0M/fPsDXkBTGj6G4
	upN6PwjBcoi1Cw0MQEvjl6tAqfUY+yE1z81rklHHimPoOf3JBCXY3hZTRADUhignQHPZbfJsLcO
	0tErBbKkjVykALM/bp6jHsc/V5Q9dKx/a55qb8AkfYpYzUc4F7gdgCNly/4Uz6H7/PxdsyKuXn9
	i75LY5Z49yBLTZDIrjSu3cugBIz04j3pFHa8pHbCn4TLr+9xpEi2VZqygYtR9CXg/7HgJBb3x8V
	pSNOuNe59WXCPft0E6G0oTaobNIQ==
X-Received: by 2002:a05:6a00:330c:b0:842:5f67:eada with SMTP id d2e1a72fcca58-8425f67f7a7mr526135b3a.5.1780294510652;
        Sun, 31 May 2026 23:15:10 -0700 (PDT)
X-Received: by 2002:a05:6a00:330c:b0:842:5f67:eada with SMTP id d2e1a72fcca58-8425f67f7a7mr526114b3a.5.1780294510066;
        Sun, 31 May 2026 23:15:10 -0700 (PDT)
Received: from [10.133.33.72] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84214b000ebsm9515214b3a.11.2026.05.31.23.15.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 31 May 2026 23:15:09 -0700 (PDT)
Message-ID: <c7b5f9cb-09a4-448f-8f49-bdc9570d6b29@oss.qualcomm.com>
Date: Mon, 1 Jun 2026 14:15:05 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] pinctrl: qcom: Introduce Pinctrl for the upcoming
 Maili SoC
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Linus Walleij
 <linusw@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, aiqun.yu@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
        yijie.yang@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20260522-maili-pinctrl-v1-0-0a6636f5c277@oss.qualcomm.com>
 <20260530-primitive-encouraging-quail-ee8af1@quoll>
Content-Language: en-US
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
In-Reply-To: <20260530-primitive-encouraging-quail-ee8af1@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: xEAlfUzMMzobGipqnXyAdKeMhmdV6YUb
X-Proofpoint-ORIG-GUID: xEAlfUzMMzobGipqnXyAdKeMhmdV6YUb
X-Authority-Analysis: v=2.4 cv=bNIm5v+Z c=1 sm=1 tr=0 ts=6a1d236f cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=jTSDsdX6X7ecxBhJIo4A:9 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAxMDA2MCBTYWx0ZWRfXxV9Jd49fB0ME
 HyHxjf5nVBvOIE7F/AamkZMD1MMq1dIfcGRSpf0cDF3SPsXs0jzg1vc/uSqsOq8TNwRJsjbCkY2
 NJRe7HzviWN+zM61Wy6bBOpWxA1vrSYLO+Kmtkv6/CQVxXAVQcsVCU/nDfqyxRhSRUwQk9y37fH
 FWglPX6w/xE8b1BVU643oz944wkIEV5bfX6E9AfpDW4ynBd5fidyJKEAIbLkwggsGDyQQPKNFhO
 QBTEJAE7JJJc7vfic3VC0kN12tRQsi7ZNjWYPphEnLBl7NU8FNvrKoD6A0/SDi9ovNn58laQnfr
 AVyEjMl9oztTjVvwv20dUyYljg3wmykcaskVwPwtn3/Or1oN2fBgWnkJeuQ3sU7vlaUV56HUkaL
 tu6/Mu2FQ6isw9z3u8uVQkc6YXNGrRwK1KmAaR0eE/Ftc6m4ivdlb1TR182AC/zajLGjVZW3Rg2
 kjteAwtFbnp936L9N9g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-01_01,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 phishscore=0 adultscore=0 malwarescore=0
 bulkscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606010060



On 5/30/2026 6:42 PM, Krzysztof Kozlowski wrote:
> On Fri, May 22, 2026 at 12:42:07AM -0700, Jingyi Wang wrote:
>> Introduce Top Level Mode Multiplexer dt-binding and driver for the
>> upcoming Qualcomm Maili SoC.
> 
> This is the first patch where such name appears, so same comments as
> before for other cases - describe what is Maili somewhere.
> 

Hi Krzysztof,

Maili is similar to Hawi which is not announced yet, so we refer to Hawi
to use "upcoming Qualcomm Maili SoC" to describe it, shall we expose details
now or add info after announcement?

Thanks,
Jingyi

> Best regards,
> Krzysztof
> 

