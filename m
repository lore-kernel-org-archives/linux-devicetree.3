Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FAEF3C09E4
	for <devicetree@vger.kernel.org>; Fri,  3 Jul 2026 11:15:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783077342; cv=none; b=mZ9E2gCx6+BSFsu868GYtuBcpmBtl3H4AUF2WPCwrbkTKaKsMBIw7aFbobQqWLBrTun7w2e/iQbrCvnU/DbFtzUXBL/Awu80V+8ALEINbMEuA/W8LcI/suJOUYRVYSyz1zmISGcz6IKK7Rd+29Sq26ODTKKxs+ifjxllvTIwak8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783077342; c=relaxed/simple;
	bh=6+8anx7ZeT5eEobYXLCvVKBGOsuq8YLhumkfxh1cprQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZqEvA54CBo67FfD9MfyN3Th9o6Wk85McUnXbTR8qo92PbTxUYdxEjULksbvrkYg2kShJ6YTAoYrUg5kxEuYNFQ0s4oPZhEHjdnoTEm5fvRnxxwPSXbO2429yGTPBXM88+I+T6YGWYckyCqWwA23Z9sDBVapKIzWGUe2FCr5nSmI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WWxNFwEb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=a/Hn1KLg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WWxNFwEb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="a/Hn1KLg"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6637ZgmO3410053
	for <devicetree@vger.kernel.org>; Fri, 3 Jul 2026 11:15:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	v3QJyHRa1NqPOMjsxEzu8DRdanlcPy1iog4etxanpVk=; b=WWxNFwEb9O/XHM4C
	yhDVARpN+BdzepOdiJ9CQU2qC9NLij6IyweYrQzebJzcrFU0hAuvzXCBe5UchY+C
	Eh5zutonWqUpIZjFbzDDMexQ0cCXPpgO7GgLuB45tXmHEwLhgn6Rst8h91WwJF8E
	vKpwwLohy9F8xTgO1s3U0TO/evtj40g7Zz1DGryd1E6aSdNtaFjlaP6sR7PZXp9G
	uYiFg6fYiP5GLb1ZGtEGA3PxmbRbvtr8AiOHpeNYEQ87T1o2j//mPONIyoAoFm4w
	IthyuRJR1Ym+i6bjaRd/pgrJtE0a71sU/Q1MT57l9h/drxfeYD7anOD2QnzcXGzE
	/yo4xg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f68u30t4h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 03 Jul 2026 11:15:40 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92e6b97afe7so14015285a.2
        for <devicetree@vger.kernel.org>; Fri, 03 Jul 2026 04:15:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783077340; x=1783682140; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=v3QJyHRa1NqPOMjsxEzu8DRdanlcPy1iog4etxanpVk=;
        b=a/Hn1KLgBKM497kMUyCkC2XTRBQB088I6D9t9L8cULkz6MxH3HDXDg1VnUWYeXYdfB
         EmwIxsCy9ZXwuhJ5HbpNWmicrc8MEXaw+1pEVUoBx2hesabAOFAG/JVLTbYDsOIdHUAI
         oi54AdXRAT/23YDFte8xO4RNwdRt/Gh0V3lYebadQL1U8iLjB4XDbu937pDlyOD99B/i
         51KZ/3q1/rt2Fot7Y/rPLddDsxyeJW3sSJu8+3K4J83SWKwol+YeG2f6DzvmR7lrgy0i
         VwAh3Vahl5l4u+utE7qzq0/rKr7g08g3Sinc7l6uRHD9qq5Smc8hqpfIAfNJ/1AQqiTz
         P5wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783077340; x=1783682140;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=v3QJyHRa1NqPOMjsxEzu8DRdanlcPy1iog4etxanpVk=;
        b=eb/gXkLxA0cEqZEcmFL/ITkQMyUUY5UhPqtuR7xHlgGcGtNo8fV0MFYQdZteaqNBKs
         q202UTQTJQMrrDEZbzrVc6H4Tx/lPQ2ETr4x4Rag8bPMK70xkf1y/de2X/PgFYkjPukk
         F8u7WVWyaUPClXPV3oeBRKeymqmIz6gpwPi12C6PkQClHswAFVjbwA2BRx7x+CclDBDt
         MOwp/1A3TL3FxwJlSOor+b6IYNTDcf6qKSIFzdQiGuLr/qh3mRr03S/7HhoP3eEgy4nl
         cjwrzPjRLjze/7d0QN1Z04PIo9+n2rfMAfxuFcUq1xyXoeUMRAl9KJCSLro/pWsVxiUv
         X3gw==
X-Forwarded-Encrypted: i=1; AFNElJ/yF1rHsKOFHhAiHyemJwJfZHs0VJ7ugvrp8yqkCrfZL6WKIWxMw1tM0S3G4S2AksXbkYImnOd8faZf@vger.kernel.org
X-Gm-Message-State: AOJu0YzSDBbU8A4O+HH1Gd56dKG8l34j1ichhXeelH+/6UBs4jRlBtnH
	jMppwP1OKDJFrPQo1x7i6sssswZK4GQSUW0dNvcQ76u8D87PHT+k1F/vnwMaW2RBFFRskpsNV0F
	S+KlQDHz/v0m3zFP/XJkyrNwP3wIrHGHVdfdKObAY9AmDSKTXUk4D1XC+GqlJ1C9F
X-Gm-Gg: AfdE7cmzb69z/zLgsckOfJT1ClkTUj6mP4M31/d2Jxi4GaTERTU4FGVJHp7mc/V8ph9
	qVAX5obhf1PzgHCktncOksR/xm75vQbLQ9a+TUc8O+CLL1UmlbspRIZVxtURoTRW7+jQRAe+kMP
	AuVEku4+m26eXZycdx1eF57VMMfotDOAt4oMGEDP5G+SyhO7ZB0DM3GVRmndYsDGNLlTilcKNZH
	uZ/Y0dot7kK2B1YYmyJ6Y/Q1dDwANsDEHxuZdQzEXgmGrXL846EwgDyDP1Jq5i8rxLKoQNihW0U
	2eknmrdbTy7Nae2MtRRWOGRBXHm+Xsg1hFhvHjcL/uNcqplqeH9eFZL3iel4xq/9g5YSu8lWlhZ
	wXpixxcXqAUy4MTB07JkLPTKzA89wygrPmGM=
X-Received: by 2002:a05:620a:8391:b0:918:588c:d095 with SMTP id af79cd13be357-92e784f8db2mr829849085a.8.1783077339755;
        Fri, 03 Jul 2026 04:15:39 -0700 (PDT)
X-Received: by 2002:a05:620a:8391:b0:918:588c:d095 with SMTP id af79cd13be357-92e784f8db2mr829845285a.8.1783077339236;
        Fri, 03 Jul 2026 04:15:39 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c12b62f6e3dsm265198466b.62.2026.07.03.04.15.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Jul 2026 04:15:38 -0700 (PDT)
Message-ID: <342ad16a-8210-4dea-99c3-50700f830de4@oss.qualcomm.com>
Date: Fri, 3 Jul 2026 13:15:36 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/6] firmware: qcom: scm: Add support for setting
 Bluetooth power modes
To: george.moussalem@outlook.com, Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Rob Herring
 <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-arm-msm@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
References: <20260703-ipq5018-bluetooth-v3-0-62da72818ab3@outlook.com>
 <20260703-ipq5018-bluetooth-v3-3-62da72818ab3@outlook.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260703-ipq5018-bluetooth-v3-3-62da72818ab3@outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: Zn4aoS-sEaNVILy3Qt5divHg8lK10g5B
X-Proofpoint-ORIG-GUID: Zn4aoS-sEaNVILy3Qt5divHg8lK10g5B
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDEwOSBTYWx0ZWRfX5oDFH4QZOfYg
 IEYjgK9WyeBQGvOmFI8DgZwzL0wOcaECwsOfgl9bgVF3MYQ9zIX8/IPxbE7VXTIeutCwdv6+Bi0
 /eyfNgCXRjYMg3VyHIWNZja7Wcuwc7o=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDEwOSBTYWx0ZWRfX3C3Dya1zXbfH
 s3lYDMiKbysNzwrbcgZW0DNPxjU8Xttw6Ih0R24TYkh8uS1nQEd3TnuP69JM+BVMACpAgGbcx/l
 tmgSghwmxDru+G1tJXwamdQjDfbs8JoZSzmlhihFvUF0s+YlXX/FfApnxDvfn8KjQO57MZPx0Kx
 W0IlyzQQ+MLC1tJYhk8HtBmuURz4/j6o+E7QErmpJBK+jbLvZUI4lP5atT2xF1x8TXhrAwvoJQs
 9IjYSnkFNWGaVJmFndPQqMwJLT5yNKXQKObGWoEYWIJUYC2AWPfo9PC+Unlx3BRW5yxN0FMJVKE
 tJNgH5R75uAJ422VyUBMHCGNKvqRgdUsTOybsTYxcOaxBIQo9xnklanytexJeCG9vRSOYzXFc8o
 bO3sVOr+8dcvyVgWXhamgTagHv9uxT25x9nLbZFBa9f3+eXR6NfOSjEI0f7C6oTtRvF7HmS+5VE
 OcM8+nn6BXFIg9+gOrg==
X-Authority-Analysis: v=2.4 cv=OaKoyBTY c=1 sm=1 tr=0 ts=6a4799dc cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=UqCG9HQmAAAA:8 a=EUspDBNiAAAA:8 a=EFz_iqN25vaghz0NCYEA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0
 priorityscore=1501 adultscore=0 spamscore=0 phishscore=0 malwarescore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607030109

On 7/3/26 7:01 AM, George Moussalem via B4 Relay wrote:
> From: George Moussalem <george.moussalem@outlook.com>
> 
> The Bluetooth subsystem (BTSS) on the IPQ5018 SoC supports setting power
> modes which are required to be configured through a Secure Channel
> Manager (SCM) call to TrustZone. However, not all Trusted Execution
> Environment (QSEE) images support this call, so first check if the call
> is available.
> 
> Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> Signed-off-by: George Moussalem <george.moussalem@outlook.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
