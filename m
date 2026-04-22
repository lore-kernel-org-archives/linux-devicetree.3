Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B03CF374170
	for <devicetree@vger.kernel.org>; Wed, 22 Apr 2026 12:04:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776859497; cv=none; b=AnOExZhSr8JZlLO/1qdYlkrduyNfeYlsogUrA6fNVq7m//5G58fe2qX743GATH/mTeVUmvJomqVqh6cfkiBz1VwtGnpqOA1F2EFUdsnfTCyt252sEJJLc962V0yJnzJ6+tyaciYHM8X4JfTfLJqygRrkkldPItKllD1GOU7q6JQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776859497; c=relaxed/simple;
	bh=idjlWeUhNdX/k77A2WmRf7vhEF+hmm3TROSvAzIm7kM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fLRlOToFRSSrRZe9qOTGKzNIZg5SPcQhG6DlfM85u5mXhffOKNJPipccJ1KUrebtThCwUD63ZYtE7P9L80D8irdLlEIpWNotYEoKdY2vBNxJDpGmnWT/vprHaecEslKsC3G6i7YFkVQavEDQk9oFZp8y7FyBFHpB2FLLcF2kahM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ecjlMuZg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Cs1DhOKZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ecjlMuZg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Cs1DhOKZ"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63MC1iio3730894
	for <devicetree@vger.kernel.org>; Wed, 22 Apr 2026 12:04:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	c8liTbH7EF5TWwLcShnnzAb4AWRQSogCfCpBFLO8lVI=; b=ecjlMuZgnNCSKNzT
	ypKF03rH/a/D43MbigX0cLJxhy9Jp10XfJCnH1h9k9EyWZ9SVZZmY/5HIhxtA6uR
	oFsdxJ//ulTq7te9DsK1TZHETWn3pn6ewe3ylWObokplf14Kpc+ylldEXZZ4QUiD
	P86E4LUaOzotFaobksCKIrvqtSf149TLN+0l3ScjNgC883e5nJGYhST9NZtqWD28
	zTtcq8rK5WWlkXDqr5Mbp1VfBhY8arCYg+OzWUCQwqhgqGyUQnNDtntj8N1jwusg
	Laau2ZeiLICbsAbSBUmzSQwVKc24jDttIqrDH/IvXa3/AigXyxa6DR1CLHnyarh3
	iSh+Tg==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dpenfu637-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 22 Apr 2026 12:04:55 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-6110e7e82b8so383969137.3
        for <devicetree@vger.kernel.org>; Wed, 22 Apr 2026 05:04:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776859495; x=1777464295; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=c8liTbH7EF5TWwLcShnnzAb4AWRQSogCfCpBFLO8lVI=;
        b=Cs1DhOKZehjihK2/MfzBF5RcBFKCyeg4AuEvuJEqr1El0ypvnyfjuWhN93afGz1QVg
         scYMzRqZ/kKWUotwdorcXBYAHiii7U4aXwGjuaiJk4yZKMZjwAJv4MxIXoFpEI7LEHgU
         y5B2FlWu38biY0exkrtupuQBaA3ftuaUvElsS5Mt7dNPUAZObGyK6HcZpoxsFyYNZ53D
         TDfRYa40ttjJYN8b3q6a+Sg7nZLSnpzhPuYdsKsNRwlEdYb+2uhHkVUkW/Z+wb93GFkR
         VVkv/gGLx7V+fCaEv2iAZU81RNvBg6S0vQQko4xyj7mqNqlnYg28eZc/6T9QQ4GKy4Kc
         1ecw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776859495; x=1777464295;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c8liTbH7EF5TWwLcShnnzAb4AWRQSogCfCpBFLO8lVI=;
        b=Knqd1Q3VjrgBQrrU7+/Q76Kg6DbNI6dX8FizfgswMvPcsdRQYDQPWVLApoRPeui9AR
         X0v0gHkeh3Nhre64kooQ7sAP6asoiW+mlr82QKxSsEFwi3FJregVfWl2UmNAiBfaskNB
         wpqDc3B5/fvw6MrwOmiBDjTqIrRmfU4ReRn6M3nsmIK63iHhl0O5bz70O+9zdGoudpbH
         zQQXwpNGEfYbqh2gqWbQY9nSidauSAEfiu+u1UmouVR/6+te2O+dwtfujFgOsvHJ8y+7
         a5pQ+VcB3iUedz+raMLDeev34oXr/14LKA2uqjmMQxZ0huSF6vXWgaeyQY6IvfnExZt1
         TK8Q==
X-Forwarded-Encrypted: i=1; AFNElJ/pW+I6BovkgnAZgByjMEiA4BjI6CNKkqNZF2hSNEYtlA8e0aB7cYCi9XtY6Z+Z7oMddRoe4P4rPt2M@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9S4s6rBILHTzoqISpzfxL+QMFyXROuKKf3Pzz0VU3UsTsXZQG
	KApUqAPYTAaZqeK4hu4Vy4/mnXPjiM01IO2qYxFc37u+AfAOFGW2cGS4yCcuuB9XK6+YbYJbooL
	bnY6z11+5Mbp8rFU1GZKd8yMhC+/BHWF64/10MoVEiFwhtNpLFeXCQbpHuSSe9f46
X-Gm-Gg: AeBDiethCh6u7h7GOpYb21sKuYw2yx0CPXfRL0JX8VDcpIJQ3YSX6hUKtZsR/lu37JY
	f+GVjjXUNtUGkV9+zo4jz7d7QTp7tMNEn6+4kV3A7biQw9kk7OA2aRDBk77HZqBxXjNBa4MFnnj
	h/RYSl4PjXKkXchCymbWhla/dnbclcD4Uttqt1l7h41/v6z2FvnjMDiS77lGOFPzmxL1y/7S75P
	YZT0jBTVO+y3PZvR66k7rV/02Ohrjxc6PizGgTwhi+tSwgDC6+zbr0WpqGyh2BqWA8uVNW9JyFU
	Thw4k4wBT5idpjRwVbMPY7Zp4zIOcqFWqhmDugpR72xHHeZWsZ4+jq1Fvl0jcqTxbMD6AXbiORn
	EH4v82Mc27tebGPnXTSieb+BQUMY7+nEJQd1pEMzs9aPwtYNvHIYmAGQE3Yd5+rEqeHNH/fn9As
	kNlaHRt4MHfzc7iA==
X-Received: by 2002:a05:6102:3708:b0:611:7722:a6a7 with SMTP id ada2fe7eead31-616f8072a0dmr4350084137.8.1776859495103;
        Wed, 22 Apr 2026 05:04:55 -0700 (PDT)
X-Received: by 2002:a05:6102:3708:b0:611:7722:a6a7 with SMTP id ada2fe7eead31-616f8072a0dmr4350040137.8.1776859494571;
        Wed, 22 Apr 2026 05:04:54 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ba455045652sm537299666b.51.2026.04.22.05.04.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Apr 2026 05:04:53 -0700 (PDT)
Message-ID: <2ae66b85-8ee1-488b-adbc-0fa3afdf3e08@oss.qualcomm.com>
Date: Wed, 22 Apr 2026 14:04:52 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: hamoa: add audio PD remote heap region
To: ekansh.gupta@oss.qualcomm.com, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Bharath Kumar <quic_bkumar@quicinc.com>,
        Chenna Kesava Raju <quic_chennak@quicinc.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260418-hamoaaudio-v1-1-a92866f744a6@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260418-hamoaaudio-v1-1-a92866f744a6@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: zxahdPooR1kH9q1DipRQFY4QHhVKiBak
X-Authority-Analysis: v=2.4 cv=YJuvDxGx c=1 sm=1 tr=0 ts=69e8b967 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=f6Jk6cNHx7HiOWrMovoA:9 a=QEXdDO2ut3YA:10
 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIyMDExNSBTYWx0ZWRfX0Y2ckrfujKR/
 OQ6xmve4tbtBM9+kUxGjo1XeyJghj8z3LG4ncg8ezGBtQmzOCbi+GJg3WQzUrAbZhdO0PtELlA9
 ZzKBKH2l8dD/a6oSEseLMljvhW+F6rXsFdNM0Jy9IxRL0Y4Uf/kID28VOujLttrbjONdju9cCVQ
 S8vxBnPnOR1KmemzuniXo8ZXCdzPHyFE3PzGhIazJ+Up/QTGpO2KqNtLxJgD+nmTK/h5notY3Fn
 63k1aaujWdxT0aNAcAbM9X57YLNud+3o6dHlwOh7126JX468T4bMaY7cBUk5MHTlvCj9NC9uReU
 C1+O9LT18wu+QnrqoeDKTVrmfu7S+y74cR9soKPtfgBI/0f6ySvoC18N2TyybyrlL22qhXSqaE5
 1TcaZ+2qH9rxQ9+NeiBg5oWWAkpN5p/Vt/xxtXn+4r7J9DYSi/t6VjOhfbc2lAA9Vgj7lysjxZZ
 4oAwlTMZUqFAXH4qjnw==
X-Proofpoint-ORIG-GUID: zxahdPooR1kH9q1DipRQFY4QHhVKiBak
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-22_01,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 lowpriorityscore=0 adultscore=0 spamscore=0
 malwarescore=0 impostorscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604220115

On 4/18/26 8:08 AM, Ekansh Gupta via B4 Relay wrote:
> From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
> 
> Reference the reserved memory region for audio PD dynamic loading
> and remote heap requirements. Add the required VMID list for memory
> ownership transfers.
> 
> Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
