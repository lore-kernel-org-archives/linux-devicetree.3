Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C08CE3A0EBB
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 12:30:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774269031; cv=none; b=lxX5gIlsQBp6j7nvblU41zLJ4Of+rHXIbf0ZLNzupr7QyslE6ECeVpUEXvJ3o+gVk4ysU64Zd/36S//3iO+i65G7L0zik2dVZ5QbD/CpZxclcZXBrNlOkWrvHa6sJBmxtxxkncKTNs+f8Xqh2B0uk1Bxuvx0fu9U3jz1PqnwsiQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774269031; c=relaxed/simple;
	bh=JNZQGnyEmTLIF+OXF5pPWrwQQZ/h29es0mu8yHIp1No=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=f+FEfAFo31gzgBnSyrBdYtcbl22H3U5Vs+IBx80drUSFJ/eBTxEFKyUyIXKHu+Ovv9gXNEd5XZRQS6HJfzNZZc5PLk1utK7crFPlAOCYOBIMEjGplDuum2gcf5wRqyxHxX/MC7FByCL+cm4nR7vgquhxqrSUCFLe8e9tNodfi4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pDD3O77e; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fRRoVV6W; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pDD3O77e";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fRRoVV6W"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62N7trIE3468141
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 12:30:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YeZR8yJekgJqWCu7/TSknbU6cbZzEp4i9GcMqtBAXUc=; b=pDD3O77espmO9ySW
	LS2VwvkiByk0AHZoQbHwX2mwDdzCqhfJeJu4/h7iE4L8vfYg47TYPcMw3tKgyMjK
	iq05VWzm4m00fIUnolc6VBYTLaK5k44RFjwHPgJAcF+a4NxRcT+p/uCmSmoVgbJw
	4LmRqKLnm/tFIaBnDFHt5fk/pqIeoLEqhTO1mD0kRG+/ZhRhiN8Zq7q4cxM8PjFa
	HlmkfuG3QgidhiQr3iaLmaON4407YBgrp4D+uIKJQRhdqM3+xixPus1c/0TjgaXb
	Ip6Nq2/JCrSRwaIYYfI7kzF5pkXixLd0OYzTtj6stRGKQoaEStsT2BwvFUuwLnz+
	oKzwew==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d31jggxq8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 12:30:27 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2aec07e8aafso6009235ad.1
        for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 05:30:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774269027; x=1774873827; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YeZR8yJekgJqWCu7/TSknbU6cbZzEp4i9GcMqtBAXUc=;
        b=fRRoVV6WNqck4hPv0GFJusUYrTwqzTS/s/dO20tbH9wzYmACnVNhhj1TWBk+jhAD9s
         vvHRT5jUadtVpiPzxNnlauoaP6WeHgAG1Ea/bjiCaDC4DgZ9Et0tKMNTnKWvOLud6B56
         nRKl1y/QCzs8078qKFNpHhrD7FDdoI9QJ3KDSh5KzNllqgq+a/WdTQlESRTU6FUmgmEK
         gRqN4UqwYL7qLbHoqYL50GXSiqHz7lQceISe2eIrX8mbzCQF7zRUrnn0VhVdb5OfYKsF
         6J6io2GLHTyKciE1sqAJIwyxyhXD/ktNHjNnnaBKCanokWLn2W9DyBUiBn+v3PMpDJiB
         mVhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774269027; x=1774873827;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YeZR8yJekgJqWCu7/TSknbU6cbZzEp4i9GcMqtBAXUc=;
        b=XVFtgXqMBzq0H6sUp34IqqFT3X+p9w1wLcZnWNqLKCicBqTH0QNGh7qa+BtOYQpoia
         hPqzbWpNxhDjqM0J4/bxgtg+kaogrsnfYsr4MgsLTEVNmNqIKRc0wWeUo3akBGClTeIs
         LZk5HP1UBcYRbyriUGlqq9BmqEbVhAQR2m95M/dgCDNApTrAmGikDiZJRyj5W1Ngqqk6
         uENbvTIpa+BJbVr4jaHn/SOJeRzcBObRd7JL92jiZ2TdjRKQ+CctLxXLtedHYN74DKYK
         ZZYZchW5XcTLeZU6/FjFWqGapNE0jWs4dvrBTAy5uEkYTZkWYwLMfluCTg7BNEr8thRT
         Gpvg==
X-Forwarded-Encrypted: i=1; AJvYcCVaewTckppiKQseH50eW+6zpNne6p997W4G6j7scvPzV2vzN7iQsIzMVVnYzak3rparI/Mxko32i0LP@vger.kernel.org
X-Gm-Message-State: AOJu0YzewYdssfimyrpSBPAkXvxLfnIlzuk43yf/Om1AuxRz4xP8Rz/S
	SQ0Vp4bOmekmsrhaaCRAT+DkT/rIJBTeIxfTWFtMl45hRhn3xT5+B0GY4mOmr7f9lOh8B0hbq5G
	eeydLFbFoe2CU0wJK27C/g8lv39AYHAklp5lJE3CXiUId81OiNXelPsF+EAFhFnqM
X-Gm-Gg: ATEYQzwKN5zc4WfPJu6QCydhkdl40mukRvaGeQuuVl+MMbOwPOFhbsgxGFpdEaQXsGt
	FdhaC+lXLvjvRVsdi01VfTLDJNc8N2W1WU7llqfd7eo2BaPd2/c3Cfy7asY7/wHe2Xz4HT/SLL8
	en8sj6/m1dlFb4i0aJZYwTaF/FGlkGHbeoeD3PSvJrB2t7fMTYtPv+U7JvkiGGE5/7Gb95KQ/Nz
	ixQ/FcZVufQAmAoc8F2r6tw8vvp9aQ68x5u7ZbvjDma14gZRE5E27+Ik5ff9JGnJBs2+gJDHshc
	CE+2/U37FGwvHaqo+oHDjWbwSQecl061sdxvieULYzeHFblVWQeBorI3xANSHSDEvWUsE/i4joa
	PtJKc4AdtF/IruWcLLS5xheCZ4Xy7RZdkOQrIIX8Nalva9dA8MLAWqXsAX8PHMlxsDH3yDZ4Q23
	tBRWRaAnlr
X-Received: by 2002:a17:902:e850:b0:2b0:4a57:e487 with SMTP id d9443c01a7336-2b0827ddd59mr116899575ad.38.1774269026915;
        Mon, 23 Mar 2026 05:30:26 -0700 (PDT)
X-Received: by 2002:a17:902:e850:b0:2b0:4a57:e487 with SMTP id d9443c01a7336-2b0827ddd59mr116899125ad.38.1774269026298;
        Mon, 23 Mar 2026 05:30:26 -0700 (PDT)
Received: from [10.133.33.6] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b08366b5besm112930985ad.55.2026.03.23.05.30.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Mar 2026 05:30:25 -0700 (PDT)
Message-ID: <7972211e-d735-4401-ada9-b83c7b96b612@oss.qualcomm.com>
Date: Mon, 23 Mar 2026 20:30:18 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: qcom: glymur: add coresight nodes
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260318-add-coresight-dt-nodes-for-glymur-v2-1-d76e08f21fa5@oss.qualcomm.com>
 <ef89e328-fda6-43f4-b40c-8834d16e2cfd@oss.qualcomm.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <ef89e328-fda6-43f4-b40c-8834d16e2cfd@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: A50LHTtCWbT_iCGIjab85oXj_RZkaJyX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDA5NiBTYWx0ZWRfX5ujP/vmz5Rrn
 YylDfWFTWF047tRelAoMZG4/AUYmoMO5QHYbbXX3KtBrC68lM1vRdG/0ns6GM12UNoX+vvPtYfc
 uOXJY73vxDAyEzoqh7ZIlN+PrXq5Y1NVAVRYydUi3Ssk2sxSpd7EQwYY+7ACvIoo08Rz61PCmbW
 6+wYB1LE2lIfVl7AZx8DFq8yQWQNPQV2nswU6oJXJJ/6Ah3OsDMt6GqFo8tmMEx1M5HvqK7xYg5
 qvIsVvv1AP1bD3eWa6zHzR3CHWLwFHlOhurpRoDO91FQVEWpKzJWbOeScKATxMkb3+hfl1Yqgdc
 jzsvacYfwozP3UEekWtriqdKKXGGHGGOwHrmn7+JuTKAVBlYjv/yyHSmCkD/GJq39rCW35KZuU2
 3pLoOGccpCdNqUJu2ULc1Dz617NWrx+LA7v2eVpnsUdQWJigPjEy7GtlxeczQJ8tCjcbcRaffnw
 tJFA6DummJprGQNh0RA==
X-Authority-Analysis: v=2.4 cv=CMInnBrD c=1 sm=1 tr=0 ts=69c13263 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=qzfVlSID98LAkVwMgykA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: A50LHTtCWbT_iCGIjab85oXj_RZkaJyX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_03,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 malwarescore=0 adultscore=0 lowpriorityscore=0
 priorityscore=1501 spamscore=0 phishscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230096



On 3/23/2026 7:05 PM, Konrad Dybcio wrote:
> On 3/18/26 12:42 PM, Jie Gan wrote:
>> Add CoreSight nodes to enable trace paths like TPDM->ETF/STM->ETF.
>> These devices are part of the AOSS, CDSP, QDSS, PCIe5, TraceNoc and
>> some small subsystems, such as GCC, IPCC, PMU and so on.
>>
>> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
>> ---
>> Changes in V2:
>> 1. removed two cti devices due to GFX block is down
> 
> i.e. "because GPU is not yet enabled"?

Yeah, these CTI devices have clock issue for enabling due to the GPU 
block is not yet enabled.

> 
>>     - cti@11c42000
>>     - cti@11c4b000
>> 2. changes two TPDM devices to static:
>>     - tpdm-cdsp-cmsr
>>     - tpdm-cdsp-cmsr2
> 
> They were TPDM instances in v1. What's the reason for the change?

These TPDMs havent clock source for accessing registers. We only need 
enable its ports to output trace data. So I have changed them to 
static-TPDM compatible.

Thanks,
Jie

> 
> Konrad

