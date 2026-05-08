Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34D04378D92
	for <devicetree@vger.kernel.org>; Fri,  8 May 2026 07:14:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778224466; cv=none; b=NLjvo/g7NuN2PGyM8WUShLlx+DHC4uJ9jtjtPFLreKsYH6/C1eJ8h1y6qz0pil8LbcNGExotdwjUMjbiY+TrzQSRxx34Vpu1Qex478Mn/3XtiLvOhyevdJA4d+hMIV4BS7Op3jDkBxwUeuzpLNrFfPEtII6HoZBzHcFgVJgHQnc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778224466; c=relaxed/simple;
	bh=msbctxBoZmuS/F4jhIkGgLNMRMZ7w5FEKCHPbLLM07A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=N22/rhRtp+PAtgWhofAjPrSdUxm8e6ilyDJaIguRsQ0OsrXPDSXjpHWeR5RsCBH0QGOopcevbCNlIWA7ctvO+cNiDPXW6apQpoBRUjSXUfQ+M/mkMckCQ+is6XuAWvSuYAU0i7Y+lQTvCTNofwr3nhc57FunM5pbYINbxuhqpiA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dNvSF2hA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jKTyRHXe; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dNvSF2hA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jKTyRHXe"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6482248d2384216
	for <devicetree@vger.kernel.org>; Fri, 8 May 2026 07:14:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	w3kSoJruJXLM8bW/sjer3Rq7RmeKRWg8kDV81DFxbUA=; b=dNvSF2hAOCPkxIfu
	7KNM2L7kdpiBpelwEKfIJ0sN8S8psi/efDbQFjzBkQCnrN42PQ2u+1G0Xar3rEY5
	jQeYlezhHGA5qxVz3q+Jb57lK/Kfe+MHDnCw6/qU/CPVoZY/8slQ94L/XZHTXm/a
	IjhwfBcW32S/Dd1ulWJASr0HVFXfFAjddz2hVWKFoBj0qVWmrEo2X7fcQVYVcwu8
	Jb4a48TGf8r8CU3uqGb7gRuTfPWsZCO8/WNTXH3aXxt7mPbIFW7E49jN/1qozY3C
	Ia0JLPh6siy5TnKEliRMZkyg/1XcUQ7cdTcjW3TsBTwZFGS+kRDt7kq9BVBDOWF1
	w0iawA==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0wwujwah-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 08 May 2026 07:14:21 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c81ed67fcbcso852856a12.3
        for <devicetree@vger.kernel.org>; Fri, 08 May 2026 00:14:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778224460; x=1778829260; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=w3kSoJruJXLM8bW/sjer3Rq7RmeKRWg8kDV81DFxbUA=;
        b=jKTyRHXeAPSu0dHRXbTQ/YxFaIsUkYqchG80Y0b+45L5yWFm5GTVuZwDH7KjSSrZRo
         RMzTvABTuGhIKP4xDFsG0W4Fut8t2BgCCZJUjrwwJtrAtuQ/QtPZFJFL/wqnXpVbtBoq
         MVYoCLatplSYxhbrcj8deqmh4hqRliC1DZww3YsYI5JkYmWHDoMjWZxRpuqhghCn01zq
         iSPfSlnbCvsyGRAu24N5yS4MCqcvdGueaSq1NluLnO92d6ox3ZfHlzYgsJASva/Gyb47
         WLD+mVleW/aWKJZLrkyptgYvOklAH1ztncrm0KUwlnHtyoMV3phRt/o5OKBL9n6+uIoW
         Q+fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778224460; x=1778829260;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w3kSoJruJXLM8bW/sjer3Rq7RmeKRWg8kDV81DFxbUA=;
        b=CPCGcRxlc+gSXa5snESQU9xKw0HYvLQCxF5dAUrcmU0o9nYp3VfLql00Vu6aA6qr5B
         pP1/TURukB4e97A1/HwH6euLwtVF9vkG70FsspMkuNDLNHhdf7Jd7I5G73sK/OnZXDwp
         A0xrsj4rLLPbb+z9pczAa1MDmxGqs0YtUYgKSzhhyHeVoXEEEJxmqVVtk9LdgxNQyN2f
         75T+4AGRYQFXj4uP3tf5222QYpxgaL1VwNlVDth0wKPVN8Cs9/Z8VJQ0sU0Q1YZ+no7c
         Aj6knQO7cjzcYDNaqyebT608kNhKHyeKWzpli9YTzdXp6wB2cDEm4aRe6/1Z8eRmKQbV
         Yx2A==
X-Forwarded-Encrypted: i=1; AFNElJ8bDygySThnPO56ocmJsiHSUxOc8NZJMmepwjEMzyPuz5shYsvcT9EzVKSuvuOrtPBkBvAySO+yxx6p@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4jJmUn9XaG8ztaH51yNKd2LFtHdWdjgnElXuFxdVzhIZdZLGi
	JyoO7QCqW8n4i5Bhg3zb1fvfHe7Cy7OOK92FWUzXmnWz1bNIQ0KWr1Vg/rt6277OOYM65jEVPk+
	+rShziJDhkUzc2lf9THRgBAAhtf1VFEBPLIN4BZDhB/KIibEv9Q2qkRTYg9dQSJtz
X-Gm-Gg: AeBDievbh6HmZ1L8+LH3FkWDiJZERKsnmR79O+Ree1dgw2FzXgNNU8l2oj67nz+6pKZ
	/aQCgjGeWNYWT4Jau/RvB9rSgld004oJd3dVkEcbf5QSJOkG2aAC4y/D7ELBe+2PucoxPO2P53v
	jQEWddGcQqzxYFhCrB2OWybWITEgA3YSkoiGo+W00ijk7sF9CVlX+f2eLNeFedSag0XvwdZb9Ma
	et5y+4fSmL0hw0SNDRJiDNjCAfPuiLQVFLezaIvcHLEkSQKaROwP527x0XTx8KkcaOG/kBdvFaE
	yQFHuecsIxoG+UzvN5TG7uaGZWmshsW2B3BmSRsw2P9Nma+IOE8JtcXc21UX+VbvVrB+QIrp/1L
	iBgFSNDouQ+/zdC/gNRb34MRN6emWR8pwXJwGU16HpwLgcsn7BPnv/3U5gc3I
X-Received: by 2002:a05:6a00:a203:b0:835:4447:69d8 with SMTP id d2e1a72fcca58-83cf6a3a65emr1825143b3a.30.1778224460542;
        Fri, 08 May 2026 00:14:20 -0700 (PDT)
X-Received: by 2002:a05:6a00:a203:b0:835:4447:69d8 with SMTP id d2e1a72fcca58-83cf6a3a65emr1825123b3a.30.1778224460001;
        Fri, 08 May 2026 00:14:20 -0700 (PDT)
Received: from [10.218.34.110] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-839679c86b3sm13798490b3a.28.2026.05.08.00.14.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 May 2026 00:14:19 -0700 (PDT)
Message-ID: <1560253b-bd4c-493f-8ad8-3e3be3f49f8d@oss.qualcomm.com>
Date: Fri, 8 May 2026 12:44:12 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] dt-bindings: mailbox: qcom: Add Shikra APCS
 compatible
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Stephan Gerhold <stephan@gerhold.net>,
        Jassi Brar
 <jassisinghbrar@gmail.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-remoteproc@vger.kernel.org,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>
References: <20260430-shikra_mailbox_and_rpm_changes-v1-0-61ad7c57ef27@oss.qualcomm.com>
 <20260430-shikra_mailbox_and_rpm_changes-v1-3-61ad7c57ef27@oss.qualcomm.com>
 <20260504-mighty-fat-deer-fb7ec0@quoll>
Content-Language: en-US
From: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
In-Reply-To: <20260504-mighty-fat-deer-fb7ec0@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: DMM-Hn9lQ_jRbKQMcz1h36a3--9Xmkwq
X-Authority-Analysis: v=2.4 cv=Nd/WEWD4 c=1 sm=1 tr=0 ts=69fd8d4d cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=XHbfe-6sOlyKm2BVlikA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA4MDA3MCBTYWx0ZWRfX5IoiMp49FwCD
 FyemIudCbfIElFtSiWjbVt4YKOBimBeIj9Kg2Sy9krZL+0AnrtMNVdjE52Todx/fN1U838EfeJp
 ghaeyZ8v1PSe1eGv7MaHCwO8Z9BIfc6AYcC1UyrOcatb6kRclJipe9hroOw1+VCy+GK8FO1Ao0e
 tEzeeue8nFnQMi10ytd5Pynhqz3Gnc/iXHuBsUug7xUxpzZw9/KTcgJJR1J/kp24jlmKajQk7V0
 tWvQcZdGg+H/z9FAZPb9JpTI3msP8/RAI8ctLBHOTIggrVNSFsx7EyeFBvTRHjNXwRV6LPC3Vv1
 cRupO/sHX9wX3H1kYmLUL7NpOxzofrY5X6egPJK6RkYEHpERmN5sJp+EibQ16Z/Oo0WfEC8/bcD
 5yVXmHAvWin1RqSMqg9e+n0lCb2hCMzq1yWDovvHl8hzCAFQA+decdXAHi4XKnuuzFMaKGZAJDJ
 r5aRq3lpnxLjtelbnLQ==
X-Proofpoint-GUID: DMM-Hn9lQ_jRbKQMcz1h36a3--9Xmkwq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 phishscore=0 clxscore=1015 spamscore=0
 priorityscore=1501 adultscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605080070


On 04-May-26 3:26 PM, Krzysztof Kozlowski wrote:
> On Thu, Apr 30, 2026 at 03:14:58PM +0530, Sneh Mankad wrote:
>> From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
>>
>> Add compatible for the Qualcomm Shikra APCS block.
> Here you explain why it is not compatible with SDM845 or other variant.

It is actually compatible with it, apologies for the oversight. Will 
raise new patch version

to add the compatible under sdm845 group.

Thanks

Sneh

>
>> Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
>> Signed-off-by: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
>> ---
>>   Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml | 2 ++
>>   1 file changed, 2 insertions(+)
> Best regards,
> Krzysztof
>
