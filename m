Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DEC63A83BF
	for <devicetree@vger.kernel.org>; Fri,  9 Oct 2026 03:31:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791516718; cv=none; b=G7DASx7I+GnEOACWYJIZeLy50BR5AbVUsDPwwAHYwKE66SAYEMP+dXI0B0iQzVnjzl5ENDrTdRsaB4QzA5hj9OrLLEgwlHnvz1QBny6gvswoGtOfRF2GLMlAX05quTpJJm7BeG8EYzO+lwdqm/rBAU95xyJLIyaSR9o/qkWK4B0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791516718; c=relaxed/simple;
	bh=rNak045CwDCOU451ibRemMagPDtfh/3R0XJ1GMY76l4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TPItogVax3JYa6Q5QArrNg+QpGX3TfPYsGTEjCvd3FC4/86fu1xfSu5NF9LryO00i9lXTlDp2CDTibvj65A/hsed9vam6kWv4YbJPglOiVG+IbithQcPO7RIU6D2gwP5epdiFimZ/NNo8rAqaj/ijYdhzfyqjGG+zeKUzXLpD8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CqW79SLn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=K71OqO+8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CqW79SLn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="K71OqO+8"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6993Hgd3250718
	for <devicetree@vger.kernel.org>; Fri, 9 Oct 2026 03:31:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wEnLDH2m6lUj6/37jS7qDQEqUbgy6NmPp9J9mV/0Wfg=; b=CqW79SLnNJ76LSVJ
	c8qVNjY/8Pd3x9FdTYUeCaWsgUEXYETX/jkd/ulF0lqYcXkRmzSIUJU7yOzvcFYR
	BPFW/ioPgLr2sA3neAt0c0XrpgfAYvcv/8xNTTkb0xjGx5pH6H9sUyXxgfuJUDaG
	fAOVA9LJPeNdeIjM1mvoc6PS7bihJqf2NK7I32enRpk/cQVan/Nu/w0NI6aqZxtL
	kSg6inFBQtAcFjfM+44f6Y/3AAIO+P884U8rKY5GkoOjVnknTzyuM37mEAg4olpW
	rxAXpJAJrjRO5WkC+3fmtDrlKRxD76RIo/HV1ZdyOTyLYA0G347+pft+ZethtqwD
	vOs2xw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h6fmqssx2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 09 Oct 2026 03:31:50 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2e601800e58so42547215ad.2
        for <devicetree@vger.kernel.org>; Thu, 08 Oct 2026 20:31:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791516710; x=1792121510; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wEnLDH2m6lUj6/37jS7qDQEqUbgy6NmPp9J9mV/0Wfg=;
        b=K71OqO+8kHZO1TagIWrRYputoK+sg6AFpBCW0zcRImsM2kGTTyc2ZJ3DV8oBG2//yk
         G7vqAjrl4tMYEJm0v6arRm97eavvorEL8SvYwlO9eZEKt6iJQ+tZahs+gjQugXMd6SbG
         g1TPhS3o3oESJQF299W4vr8dlJVwi3pvTgRzVigGyo+v7ZTojQz7j625K0cLCkIKEYix
         qiWojmlRhitwErqJmOD4f3qcW2dfbvmHt2avpQWA0r4m6VNqErxBGnKvwdCGI3IW+Hyl
         g6jj3vRfaHDZBegj74GRLgMc/yanyzaYEPeHaQUoXBDk0Innf/F8pBJcQn2xYszXTIao
         vIGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791516710; x=1792121510;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wEnLDH2m6lUj6/37jS7qDQEqUbgy6NmPp9J9mV/0Wfg=;
        b=JQPkF6LAYksm6JKEfgW9mqmogUQ47qmxSsMbikyytSh1LdtZ9MK6p++31buZkV79g2
         Nm7XOsItn8i/9M3QryXXEl17C6tJ2gB5VBQUzq7uNFGe3Yc/SOSbZGJ66JaKpJVBAA8S
         9KK7wxaRbyyTX3sqFEPjO7VjZX6i8iZidk+Gc/ploidKhS/VhK7SMzisFmLzj04u14pW
         zj4xgoqYI9TtB5QE2Zd40G9H2a/i86dEHli6OhTJHAnXFwli9o4u7zUls8K4pDwNI7rf
         DDHtB3j+drVp4TNnn4t1AYHc0Hct+JkvdavgPUQDgRQ8/V8wob4H+Omo5Ps0U0QZcWTP
         4cfQ==
X-Forwarded-Encrypted: i=1; AKwUvBxYg5z5FWDo5nEBxh7uy3g66A8sJa2L1/JIYXWH4ZPshGPy/FgKneeg1rHgkb0vHRFmiOuTwgLd+qht@vger.kernel.org
X-Gm-Message-State: AFq9FYJU1+tzUJp635An2zYZ3Hc401HU9zH4UNooZE2fDrvtNvo/WDds
	Y7l9D1W0FF/nSeSDLRZ4PUx62wZgb+TusRXYk4G/gD3p3tRw3cnmRT6VBGbL5ror3yXSVCXcJxW
	ehJakXU8+7NAxCrUno0BkuOpxkLhlqKhcdU2usPZmP+HhAmyFDH3tIhvzZnShUNnb
X-Gm-Gg: AYBFou3xOv3ZWkQDZqTgfMtRM8diDISzW06k3dERpgnnDhW91zc0GyAuvNv7NqD9CtB
	H48LGg+frrMKa0i0fcWQatKUuDkaZMEdzyDHuqUrwInIN0lFIRsarjUytEc+2whOjgFJZrnkcYC
	YHkcFPBOe3A1Ebbwm+7m/6RC/YZD6zMSduXYTiOtTHpMQvOgkLicVSD9TyOV107Ls2vY5tYmlGF
	kJka79ihoGlREnjLmI5Rf3RNE4nTHXUKTKYE5/9swzXrdiKiNvj0R9TKHOTLTrAi1Jff2s+Ju7b
	/VQ6XZ9KkyJ1cjHag1E5AggbO3LwFgnYAZen8mxZpIiFQK1vJPDvt7pOl4QCXgB/sc5yVYWe0HY
	Ok/u83XSoi+Zv8Wd2dGDt
X-Received: by 2002:a17:903:11c7:b0:2dd:c100:a5e3 with SMTP id d9443c01a7336-2e842dfc284mr5840075ad.55.1791516709845;
        Thu, 08 Oct 2026 20:31:49 -0700 (PDT)
X-Received: by 2002:a17:903:11c7:b0:2dd:c100:a5e3 with SMTP id d9443c01a7336-2e842dfc284mr5839835ad.55.1791516709379;
        Thu, 08 Oct 2026 20:31:49 -0700 (PDT)
Received: from [10.92.18.229] ([114.94.8.36])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e8421b1562sm2615075ad.34.2026.10.08.20.31.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Oct 2026 20:31:48 -0700 (PDT)
Message-ID: <bf446881-61bb-4186-96ae-cab428da6226@oss.qualcomm.com>
Date: Fri, 9 Oct 2026 11:31:40 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 00/11] net: ethernet: qualcomm: ppe: Add support
 for IPQ5424 SoC
To: Andrew Lunn <andrew@lunn.ch>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller"
 <davem@davemloft.net>,
        Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Lei Wei <quic_leiwei@quicinc.com>,
        Suruchi Agarwal <quic_suruchia@quicinc.com>,
        Pavithra R <quic_pavir@quicinc.com>, Simon Horman <horms@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Randy Dunlap <rdunlap@infradead.org>, netdev@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        quic_kkumarcs@quicinc.com, quic_linchen@quicinc.com
References: <20261008-qcom_ipq5424_ppe-v1-0-16caf43e44ee@oss.qualcomm.com>
 <b3863c53-c97f-45ff-bfd0-cdde5bebb176@lunn.ch>
Content-Language: en-US
From: Jie Luo <jie.luo@oss.qualcomm.com>
In-Reply-To: <b3863c53-c97f-45ff-bfd0-cdde5bebb176@lunn.ch>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA5MDAxMiBTYWx0ZWRfX6gkpJLTKrNaP
 jksHd8kpwJVTlSKatFGd+sNK3tnjfDnmdS19vSTq32tfoEOSyQp1xmW7wSkdGo9TKnU0hISgjkX
 g7qkRtcG8/bzkqreVcoRMYPRVcxrCNY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA5MDAxMiBTYWx0ZWRfX3+Rd9CRPzoHw
 0kdljkWBZRC6yya6wH/9gR7yc678sFMODTsZBf8DKpRBoC58o3xgDgNuUlqV3iA/CQ0oexTLtIb
 iGyOeKef5VPZRRy6l4hJdkS6iFU1vA6G808kYKB2ncosf64v9OsoSMfc3rGik1QN94VrwgZ/FNa
 rxYjwge6qU9gORKX1qxF+QOop0t2okcpEep1vK28qCr/jS0QZQ2hmVjtOGS2QE+zcgr817Pe626
 gKj7LbSr0iQVu9+E5hZ/oU7oaV+8QRP3Y9+nGj2Y+l4LbGkGgYbhlpLpiws/WQ6Q0Qa97zBS3Pn
 tox3TJnYlMKu1jDzkqZ2Xb+RqhgctRT3f17iM2nBaxSn8Fvs0KYtrDrgvlnQtdnn/iN2f3UoeGj
 jPbGFO7ft6LztRLm3fa9ww08GwBjjrzphFHqO4Dj3KBCMqLfemmuX2hfwSeiGYfT+UYRqxY8sRr
 PgTIuClVGf+JSEIxxAw==
X-Proofpoint-GUID: -H7fIjhpiQN6IgORJjzTXztEPHKNYdJU
X-Proofpoint-ORIG-GUID: -H7fIjhpiQN6IgORJjzTXztEPHKNYdJU
X-Authority-Analysis: v=2.4 cv=IqCL47/g c=1 sm=1 tr=0 ts=6ac86026 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=+dQloWKbpC4JZN4npCJT8A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=rCs85jqDWIXh2BF-714A:9 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-09_02,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 bulkscore=0 clxscore=1015 suspectscore=0
 adultscore=0 impostorscore=0 priorityscore=1501 lowpriorityscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610020000
 definitions=main-2610090012



On 10/9/2026 3:07 AM, Andrew Lunn wrote:
>> The first two patches are fixes, independent of the IPQ5424 support:
>>  - Split the EDMA reset in the devicetree binding into the separate system
>>    and APB resets.
>>  - Fix the multicast queue configuration table index, which is out of range
>>    for every multicast queue on both IPQ9574 and IPQ5424.
> 
> Since you posted these to net-next, i assume they are theoretical
> problems, not something which bothers people? Please drop the Fixes:
> tag.
> 	 
>     Andrew
> 
> ---
> pw-bot: cr

Yes, neither issue has been reported by users. The EDMA binding has no
in-tree user yet, and the multicast queue issue was found by code
review. I will drop the Fixes: tags in v2. Thanks.
