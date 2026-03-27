Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BD3F3D75C7
	for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 09:11:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774602686; cv=none; b=Md9ZNcCgjUuYxeuxsidsgsJlboC9U3rSG8W48MysZgHCkXAVAZkFTHMC9czYesbpsTR8oNMXCYcfHTHKcXspBsRx9hCfhgT6eEMVQ7QZnZJG0rBparmaPOOe2PbYDp2gq6Wuns1nzw3IlW4AYV9eAIECTnUPwvudJ2J6tU/oYSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774602686; c=relaxed/simple;
	bh=uGozACJjJMX4KDbiacyy679zPy64q8SfwO9CEBpk+tk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nGSBSV2oFaPMFLkIvarG2tePdw4CfYJGBHUh9J4SH3xc7ll7yznz8csuYP/si2xO2qcvP50MlOWivwjbdf5GvsPjxs7t2hPox+jzGp/l9MT7L299bqNimDWdN7qgkXZEs9hCVtmDZhxiuOM2/vZY6tT3yb5wO+iRslTdcYZGoCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Zu5LjdEv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Tvhpv9tn; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Zu5LjdEv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Tvhpv9tn"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62R6vpvS298526
	for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 09:11:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uGozACJjJMX4KDbiacyy679zPy64q8SfwO9CEBpk+tk=; b=Zu5LjdEvkNdaQE7m
	0avCjzdpdia1zX2iph2xFjSvIgvDwUNyQVXQjcQ3BeDcbFjpgAiPFcKcjJThvFuF
	Zc5UiJpVpHJdWdlVigz5i76brJwpa34NdjNPTBFRXreHW716GhZLkv9QPC50fG9O
	5aXkL8c//o3BbOOsFAlQuvHXO+aOdtK/9azBx69+WaMCmY+2rwaGfrwzyz8Ee00o
	hvDc1ZtvJHlxKtwiYYBWeOSP39UGDtg9Fl9ppiACE/yDCq/d/3Cdm/3SAnfTuMcf
	iEqNp+xYQ5KxMlE0sNY0VZVYt+ZpD3JdQM24eza7O3+GT5evxkYSMdw5B/uMzUbI
	K+r8Pg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d5bd8tdgk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 09:11:22 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cb485c686cso64369985a.1
        for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 02:11:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774602682; x=1775207482; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uGozACJjJMX4KDbiacyy679zPy64q8SfwO9CEBpk+tk=;
        b=Tvhpv9tnV6jGXr1unO2Cc1788oB+uuhYDO10MzIw3j3Frlp934bJ8R0au7KUDoZ05D
         ZjTD/PfZKMm2EUmfmTJWf1Yk/SS0fVPJZUraRm+mCYPXx9oUiHa51ferhsSX2ESr2CLy
         UQRxAZ0gvva1nCu4CPEIp8E8UDY1Dm9ndA6LLO4gZvNkXzbeHq2HwbCCAkeoQHIinK+f
         77V7IVCX9cRgR3u9X+oK4ejwVCaUvsrO+G1mX+qKZwpfD/vuKSM/BeilWplSaIEoHKa8
         YknADw7pFpFNiYi0XMahg+UgY32BYE/G6r6aAmHc7IcvfPnNzJPl1A84Sb49nhJjpgw0
         FL9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774602682; x=1775207482;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uGozACJjJMX4KDbiacyy679zPy64q8SfwO9CEBpk+tk=;
        b=cLH3fnGlYa+Ptjff8ym8TycMT2icHoI3OsC1me7uwjqlc2oKU8OodP0pjlr/eI5r61
         JDn3xB8KxKvuP/yH84lnO52v7ni6J3mwVGpAxPsu9LXohlt/7UDDiYY+MERc5c7QWw4V
         deB28ENzZxi//YwrSGRjgZrwVDq5ve2wC/THKp7zgmzLEYmCeg8I6wsqERWVAL7tpSaB
         Cf/JmOdbdl4bfOLuJ32a/yq7qSeXaS1El9UjDtlyoQowf6GFt9iYguWenNwQLtP61YLt
         0FRfOJN9GpNQLMrR1Nexb7c9/1eDJZHEZ2RRPYVBnTTHd3tFcGgE3dQ+3K6f8AcXJn9u
         KNFw==
X-Forwarded-Encrypted: i=1; AJvYcCVVwanQIKr1O6aTMqrrnH392mCS9gTXBb8IA+trY1BxwTlzoenCa3pl8aUTO6IBnF0vJ1SVmftqPPd4@vger.kernel.org
X-Gm-Message-State: AOJu0YwuP+DxmERhaVIOsd0XIhnpYPaTiZq7w7gvpz+kwIP7J6sJXgp7
	q0vHmgJQHwKkhbrDD2xkhSts+acZu1Cm0c3Zyy65LVtvFVIktGxrR/Mz+1ouEWMPe3GdBQui5Aj
	YYMG3782T51kBaOxeOUk2zFm4RDTTJUxAx3/D/dCzcnkopJ5Eo4Clojs1wsUhI5DY
X-Gm-Gg: ATEYQzw0r/H0koU59mNGvAx72hwmZ1U/XNJ+KA0h8E2qc/FLA2DlW88NNv+WM2p3YF+
	rdrk2QikbQy+3eqndK/JeqWp3ZTQnL4erwJ7SVIvpQs1W2tGgIpGdxBkLHbT1ZZUBxCGm2f4LSa
	UMq8M1jcZvEuFHbusvl/3AHn5PzvIp0H6/4+a01P2vDXxgznc3X9ILV5B72iogwX59jmwwk0z4I
	9t5tsNEpcBKWLGisDKUciZ1zgmN4liUr5ubqUF8sTTlRz28GcRgZf1cA+hARtjxlGOM/126z+nM
	+WLyyTwnr2J8JsndJ8i3OVaby65eFp8OyShNgtuDudK8dJdHZ47LXQurbLflcGXPb03U3qcuQb2
	YkqSq61kLdYy605w3lkPWxiDf+BQGpAuftKfAJ2Yyjm9cfc8JciQZdqi9ATe8C3MEyFnSvb8M7F
	VNM3M=
X-Received: by 2002:a05:620a:3181:b0:8cd:8b9b:4581 with SMTP id af79cd13be357-8d01c39ada6mr134834985a.0.1774602682183;
        Fri, 27 Mar 2026 02:11:22 -0700 (PDT)
X-Received: by 2002:a05:620a:3181:b0:8cd:8b9b:4581 with SMTP id af79cd13be357-8d01c39ada6mr134832685a.0.1774602681682;
        Fri, 27 Mar 2026 02:11:21 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-66ad60361c6sm2072794a12.7.2026.03.27.02.11.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Mar 2026 02:11:20 -0700 (PDT)
Message-ID: <e063e7b3-e72b-4a2f-b307-080748cae2c8@oss.qualcomm.com>
Date: Fri, 27 Mar 2026 10:11:16 +0100
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/7] Add vibrator, IR transmitter and USB-C handling in
 xiaomi-ginkgo
To: barnabas.czeman@mainlining.org
Cc: Biswapriyo Nath <nathbappai@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Pavel Machek <pavel@kernel.org>, Sean Young <sean@mess.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>,
        Martin Botka <martin.botka@somainline.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org,
        linux-clk@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        phone-devel@vger.kernel.org, kernel test robot <lkp@intel.com>
References: <20260325-ginkgo-add-usb-ir-vib-v1-0-446c6e865ad6@gmail.com>
 <9a61ad79-b787-4b83-b7dd-2ea36e7cea81@oss.qualcomm.com>
 <cc0d9e1d8f85bf2b67df35b8d9c2110c@mainlining.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <cc0d9e1d8f85bf2b67df35b8d9c2110c@mainlining.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI3MDA2NiBTYWx0ZWRfX4CyZAEWuOwd6
 3LBvyf6RWmLzZ/3s1fipBWT2yrbHLFMgudvWAmHuH2msUO1EcftivtOzIwyS3x30y309/apdbaE
 F6Jwr7HGxIn3kjP/U/pi5wH5jLkBBLoFlmyjuuz7K4afdZclSINgcxe3+pHh4KpKf78ufDe8Yuh
 H1HQeaw2iK8FW0D+WLgp4WrEIHuY/E++digBJlG3qqkjb8OAX9qPukioiEu3JYnyY+g9ff4rwlp
 ANSkB+OvDCse35f4izp7aAohoim+Abc49Q6UAA2g2Lp/cUAMdcSHboSsDqAUEPit0QiBYdQDJMk
 Y/CO8mq0jbbdRkOK7a/w/AaWuWR9EqPzLF5/ZV0lBIqpChceSFIOVlkRD7JNkAtDN8XozwYRvw0
 0FyXMBkrlkeHV8Sfbaw9oG67MkW3zvSVqXjXFpj+FhLNUfj31Soq3qL+AttYIgT/yJzgTceDeoc
 ajQPKmLtqQTwGGmcb/g==
X-Proofpoint-ORIG-GUID: TLlpSxaZx6lPCJTOXEgAQoMnE1fH8ZU7
X-Authority-Analysis: v=2.4 cv=BZrVE7t2 c=1 sm=1 tr=0 ts=69c649ba cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=OuZLqq7tAAAA:8 a=pGLkceISAAAA:8 a=yzi8m8hClloKuEgN4c8A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22 a=AKGiAy9iJ-JzxKVHQNES:22
X-Proofpoint-GUID: TLlpSxaZx6lPCJTOXEgAQoMnE1fH8ZU7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_04,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501 bulkscore=0
 phishscore=0 clxscore=1015 impostorscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603270066

On 3/26/26 6:48 PM, barnabas.czeman@mainlining.org wrote:
> On 2026-03-26 10:39, Konrad Dybcio wrote:
>> On 3/25/26 7:07 PM, Biswapriyo Nath wrote:
>>> This patch series add support for various components in Xiaomi Redmi
>>> Note 8.
>>>
>>> Most notably:
>>> - IR transmitter
>>> - USB-C OTG
>>> - Vibrator
>>>
>>> Also, fix some bindings warning as reported due to previous commits.
>>> These are tested with linux-next tag next-20260320.
>>>
>>> Signed-off-by: Biswapriyo Nath <nathbappai@gmail.com>
>>> ---
>>> Biswapriyo Nath (7):
>>>       arm64: dts: qcom: sm6125-xiaomi-ginkgo: Enable vibrator
>>>       arm64: dts: qcom: sm6125: Enable USB-C port handling
>>>       arm64: dts: qcom: sm6125-xiaomi-ginkgo: Add PMI632 Type-C property
>>>       dt-bindings: leds: irled: ir-spi-led: Add new duty-cycle value
>>>       arm64: dts: qcom: sm6125-xiaomi-ginkgo: Add IR transmitter
>>>       arm64: dts: qcom: sm6125: Use 64 bit addressing
>>>       dt-bindings: clock: qcom, dispcc-sm6125: Add #reset-cells property
>>>
>>>  .../bindings/clock/qcom,dispcc-sm6125.yaml         |   3 +
>>>  .../devicetree/bindings/leds/irled/ir-spi-led.yaml |   2 +-
>>>  .../boot/dts/qcom/sm6125-xiaomi-ginkgo-common.dtsi |  56 +++++++
>>
>> I'm assuming all of these changes apply to both ginkgo and willow,
>> which both include ginkgo-common?
> All these change should work on both, willow is a ginkgo with NFC.

Thanks for confirming!

Konrad
