Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6C92397321
	for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 16:57:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785430641; cv=none; b=q2JdOE5XysgHGRQSt0zjBQRGx0YNIrTa0sUL/ancczYQ+HLlbXJ0EqxVNiWxyMk0VFA9CKCaIfCSGipQRylWqKQVzPSp1mkxui49gczJF77tmDsbKSq98iuavAyUVEX6oBW+EDr1QnwHw7jxdUx5ALQwhH8jT59cl008n31roIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785430641; c=relaxed/simple;
	bh=2nZ2qmSUU/MnB94cfmHg1eSaMUWHizRc7cA68LCxT9Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=j3mS2c0Ft7SEecy+yHpoUfI1dSfqQNAIQGwK1zAvvxJ3hy5qQnqezE9tTeAuhTD/Vu2DMrdvcnbf2+NJ5NRkh4AKAKd4CEpJsD7DN4s08ePf5gNMCRqYHzN/RRTIIIoWbPoTBlRgtaoSWqnygLsRaDnoCobOYNGaIhrYh5aANO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cSu8ug3w; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XNe2TGTZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cSu8ug3w";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XNe2TGTZ"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66UGXWlW1571708
	for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 16:57:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tWXrkDm8PYw+2jYpqr8pQTpNKyoYlnom1vxlAG5j1HA=; b=cSu8ug3wIZTzAzod
	bQw3ku0SroEOOqa5YoO+aA10UeSstk75AzkvdT+AQTnGfU9hU5gdub0ShM4f+OE/
	z8x7+ay9Xn6G0bzXC0TGixTZxfXV6P8qiEk74l4AdYzrPz+AH4COqeugfq96t+EL
	zP6ksAtrOCnbEJtXdY5DMEVRhE6STpGQdDzt2NydbexPLlFSPRPkarfx+n3xoxqo
	9HOL+CHccGQpczkCm8EdgaugRQDZWRI1w8G+5J/DP8hEUTCY4Ra9w9Cq/ioNiZaZ
	CgGjAmCYh7CCH3iNLeLi2nraEp1bXiBiWLoXIyvVVK7oT9ByBBXML6/ebqbAKIKm
	KBP3zQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fr891gw77-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 16:57:19 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8ef4a54f86fso169196d6.0
        for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 09:57:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785430638; x=1786035438; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tWXrkDm8PYw+2jYpqr8pQTpNKyoYlnom1vxlAG5j1HA=;
        b=XNe2TGTZ2C9fF8H1UTWBw2FXfhL3O3+ROzZP1JUf5oCKzHsDJWK2omQQweACpSWoBK
         H+Tpq7B6DlKCAGYykQNg/dYKPlpfspDLChr3Vd0k7nzSMWSA0z3tm5163cS2gx9Tn3QT
         MbMXPOrzKkta0nCLb40YI5MWoLuAWSXDLupbRLkzebHK5oI/B+ZY/XeK2mc7XqVCKfrn
         lgp1deOH/qer0FJCnnN5ED75nKzbKlaK/Wh9U32os48UI5krvDbrDSK+IfBUjUvXGmd/
         1Z2btjSKw4qayPnnTFU54WaOKGxDe/kAbuTyMRnUf68jnCb1ybPGBA+UHC/hjQ6ZQ35d
         RgiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785430638; x=1786035438;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tWXrkDm8PYw+2jYpqr8pQTpNKyoYlnom1vxlAG5j1HA=;
        b=ECepPvBEtiyOIXWCh0Z1Y2jWJ0bR3QktOP5yLsVQEufN04SACCvBHjIE5nZxHfUERq
         ZOuQnx1dHtX3isr2ieQM5GtKJY12RaCOh+P19IiKWEBWCj9EycnSg6kYi6x6Y3LQQPLJ
         DukO2OyJzvxGNKLw+XqqvdDofn7OKnxaV2I1BdGX9c1zUAArfZ6zt7Uw2RN3cMKtmjmw
         yOG+SX0jVxxkv6MPXIsQQU4soi6iyUXl6HDZRIPhvyj1gNg2coHcgLPZZVhB4USAbWMX
         89vURdxCGMJI6Ck2h0aYZykdhaMY33EBHfVjd2XCpSccnPH7DYgyJn2iMab3twvILxug
         ezFA==
X-Forwarded-Encrypted: i=1; AHgh+RqqIeG9GtRgrgEsmpUcc0qnfLmuHqr7E02V5OprxWp0veA6D9Yoe3J8FCAEc1fLqoRaIjUO+Py4OJx8@vger.kernel.org
X-Gm-Message-State: AOJu0YwiIi1ldCWPFqkhmmBaYvV4Yt1DjZhBzMD4FIdDvDdOkxKDehW3
	aTGubvLWiXhx2sFW4kiXgwG2V7P2IvMnKnrBNJwPZtbzpmdv0lgAy7zaNyl/ptaH4Ew7Ojdj/H1
	hUjEkYEZQCEW7hAetYrrpG0wRpAkTbI3ZSD04RMGGGtBBe2Wrg3lb0LYDjQXFg0rf
X-Gm-Gg: AR+sD11YC2d2+5+SxtoAE3v7GVMr7Wn04KEvbdzLD/bdHC35h6Y9d4SmgbRD7Y+0+Gq
	ijP3l6osAPGXiz+MBhTLJNE94ekrZ21hdXAXnn9LMfunIIaIewOu8yP4k0xRPoUnpLcbOhRKDdk
	c5LVTfbRBA3GgSlo+roRYOdQj/ELVYZHLCDhcSkV2dyFNZ5SeAYZtM0Fdb+rvPT5GJSoIUnkQ6q
	JTs3Psl+ArMVb6DTdvj/HcKvCmAUVgHy9OrTU/sQVDl6BISF39PSvDbQ7h/sOEVuLYTHaPVIFxS
	rpGRrLokfJ/Q5yjVObw9X77uMY+s7PILkuXot4SUZfgk/yKBrNek0Sq0Oc/KvMl1P+uTDEfjNxw
	OLZSrg43Ew2rq9n/GmWe3MJtu
X-Received: by 2002:a05:6214:268a:b0:8ef:4749:b1c9 with SMTP id 6a1803df08f44-9083bf38fabmr12450866d6.5.1785430638120;
        Thu, 30 Jul 2026 09:57:18 -0700 (PDT)
X-Received: by 2002:a05:6214:268a:b0:8ef:4749:b1c9 with SMTP id 6a1803df08f44-9083bf38fabmr12450246d6.5.1785430637531;
        Thu, 30 Jul 2026 09:57:17 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1fa851b68dsm95334766b.3.2026.07.30.09.57.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Jul 2026 09:57:16 -0700 (PDT)
Message-ID: <f5516024-15fe-4b4d-9fdb-695d1f2149f3@oss.qualcomm.com>
Date: Thu, 30 Jul 2026 18:57:13 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: taoyao: Drop adsp_rpc_remote_heap_mem
 override
To: Stanislav Zaikin <zstaseg@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260730085422.631896-1-zstaseg@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260730085422.631896-1-zstaseg@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMwMDEyNyBTYWx0ZWRfX/ybuxqUwA5Kq
 3L1Lr+l8ZEk6tPi3O9NJpGqnGRFRSEZ2h+idox71x52HrRWEtcF8c6EpMioCws+7sEsYqTIacIG
 1Dmz1dJ97Mz5UwAIh5XG/u+iyAU4N7EPUGTWCuI2GQBtepspvgvX42FxT4f3/WZ4OounBJw/jAn
 r78/OB3ArEWa/PJeHDVUWCz0LzUItn2Yvm6aPGEVwr09Oz90uZ+wk4R1MmHX7BmduV+3fnqpdrn
 0DEvZ4rQtftjZPvn9m4z2zdXjFncANIeJjWvfHcr4TVydG6ipzd4/p65oAR5jx/oge9PwOb238b
 RkrNovRoMqfNf2Vh3jmL7bzLRAUcKi5n+G53rEGOYnbZBP09gUK1bzzZtX0Ng+o2B32oPLyRt+5
 pqJO2/pjYR/PvHIPcskcJTXw1dFw9wcrwk7LGEjPL1V2S5JpWiwDHEZAsY48YpSLpwaS6b6i7+V
 ADRIU8dsnK++Zz1NdSg==
X-Proofpoint-ORIG-GUID: VaFGZcjP7FZNZJo6MSQD2wxEnFlSBh7Y
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMwMDEyNyBTYWx0ZWRfX/0axv/CbQqRO
 jsNfquLFXEL/nbvCOdIZ7bTQ8bLbQOHfV8MAUGeFq5FV7ZRra2H8LFU1AycJZGATjSrhJfX1t17
 pxfKQi6K9TxiomWckPoWWR7PdIm94Tc=
X-Authority-Analysis: v=2.4 cv=PdzPQChd c=1 sm=1 tr=0 ts=6a6b826f cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=ZbrFkLYBBdIbrGIsR7IA:9 a=QEXdDO2ut3YA:10
 a=zZCYzV9kfG8A:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-GUID: VaFGZcjP7FZNZJo6MSQD2wxEnFlSBh7Y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-30_05,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 clxscore=1015 bulkscore=0 lowpriorityscore=0
 adultscore=0 phishscore=0 impostorscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607300127

On 7/30/26 10:54 AM, Stanislav Zaikin wrote:
> taoyao originally redefined adsp_rpc_remote_heap_mem at a fixed address
> to avoid overlapping with cdsp_mem, since kodiak.dtsi's version was a
> fixed-address at the time.
> 
> kodiak.dtsi now defines adsp_rpc_remote_heap_mem as a dynamically
> allocated "shared-dma-pool" region instead, which removes the fixed
> address entirely and so cannot overlap with cdsp_mem. This makes the
> override unnecessary.
> 
> Remove the taoyao-local /delete-node/ and static reg-based redefinition,
> and inherit the definition from kodiak.dtsi instead.
> 
> Fixes: 28705df5d0df ("arm64: dts: qcom: sm7325: Add Xiaomi 12 Lite 5G (taoyao) DTS")
> 
> Signed-off-by: Stanislav Zaikin <zstaseg@gmail.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
