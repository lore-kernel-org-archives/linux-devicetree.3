Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5134443DEAC
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 10:45:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789382747; cv=none; b=maKSib+0WP22al2kFD45oY6ydxvqcTz7F4UWInEBssvI+/60ggEmStJij69hbcoIbeo5HvYv/xzteFU+st/ytQXrSJ/XeRFn4GBKNGAKDevdwUqwOOcr+e2nsKxGeGuzzeu6PvXaReNKnZtY7UMEMEbuQU5/T6E+bmyu2OyxG6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789382747; c=relaxed/simple;
	bh=09bElBSp9ky30rD5p6g5MgNvAR3/QKYinJ5MW8haZE0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eEJ+3oOkIDGToYKTN2uzi0/3oCZP7dTtRDOQjY+eob51fAXTJUtS7rb2Q0DNn741uhueNy+i7XKv+5lKP+slqMSEIZv2czgDa1poxpZMbENwUmNVT8mr0ZsmkXq9wbVT+3L4BHnHG5FKmOpRh3VW037FPOIkRisu6cnCoRlrzec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fGG/q5/l; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ahJl3482; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fGG/q5/l";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ahJl3482"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E9nlHf184685
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 10:45:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7c63gGyRDtYB9yo/soPMoorPIcHdgXPKZyHHMFe5skw=; b=fGG/q5/lJHIsPKP6
	8Sh0gK8NfrffriC3Y8WFqBMwkq1F2xstIxpSmQNWIrIAG32UPUlNWypW5Q20kMYJ
	jpQ4RGR8MHrkZt52OSBQxYvPU2erWqaWOXRxK5nhg+Gjmrm64sJxJ0u5YrREZZXw
	CBwgQS250yx5jb1msqfvtYZ6mE/cN5J738MPuaCI50XKu+PqndspAfdxVIgB76Az
	EFEc7Wwh7KqVw7buLC0Ot2Patwkk3KBN39FjirpcatKAKEt3tTl8xVNH6N9rsL5d
	W33Ukd5HGq3PKDOwH3s/M4t5ia+fMhBa65NbXap6KcELKkbUFV2YG7Xjs63wtan0
	zO1jig==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmy9c66uw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 10:45:28 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93821883e26so85989085a.2
        for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 03:45:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789382728; x=1789987528; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7c63gGyRDtYB9yo/soPMoorPIcHdgXPKZyHHMFe5skw=;
        b=ahJl3482gjBbGtlKgPZo1J3+9vfgt9jBvn0RZa2QciBU/tmUGbg4/+8l6zPNB5sy/a
         rAYtPPnt5SgwGASTfYM3tc8BU1eD1FSVexS55VX6pO2c9B3HYUg3CU0GEvAOgyt1kr0i
         xGm8wyj5OfMuK4QAVxbnntYowBwITxm6am4RPBTuaYTZ/tAauDduyINAHuMFCg1oS6Da
         kkXa2gDWWSQij1MH7jT4y5Pul/hh01PqhSGBqSluBNAYv2AuHoobT0LnY8V/FrkyWSUQ
         f9NAQG854UFcOGcSQsO8AL+Ad8D0cOMuxs6OVEf/TBiziVcUaTkZMdMD7XO7W9dtVd/T
         2Log==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789382728; x=1789987528;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7c63gGyRDtYB9yo/soPMoorPIcHdgXPKZyHHMFe5skw=;
        b=JRvwwFCOEGZK5gG8QN8dgrm0z8KzZ0n30C5D4nNHlEsKJIcy71v7sWOt6D3l3VK54s
         S4Mdx1iicaG1J8lxDOyyk96irHjdC/5OCzXcsgRxnUtB/Nw5TyRhT8i594mI6h/Rmdny
         wC0DenpDGQkAb8KCh2aWCK9kilOqUlSAgKBfiVhuhHrUJZfoB9jHERWd9csfXHcFRBro
         7kI9O5hkRN8DQ9HBJgcGmblworqvn946zjhA5TTH2RPbLprMPAu1WiY+3fuqLxhsIyQr
         MM60G29x+gh1sa0Q85xNBFke9ufWGf4a9VrWu2H8eIw8V77or11GQBL5sG2xGyUlo9gf
         2fgg==
X-Forwarded-Encrypted: i=1; AKwUvBzYnzua6ENJbG+hxro9Z/UP7VM8bFU3yp8+UFl/mqihRQHa3Z5IthP4fGysyLQBsqIwDjoIABwATLYG@vger.kernel.org
X-Gm-Message-State: AFuF++m4v0nBGsmHtLlmsVwwPHyCArM1Q2N0lNCmgDiwjpmaIHIIVFm5
	KNB1bT43iMz1TW6zo3wwH61hJUSOFVaRGBkeUSCcdaj9hySNWhdN+aC5TUE2rvPCYkWzDGC+GS5
	K1rt0FJN2KQMCrUm4nNws4d13YvzCRU1v9PSz6SETA8iS8F4glvyrMOgY46iszWm/
X-Gm-Gg: AYBFou3rubDZdIK5ueIv+Vj0KESwNGJVw4rL3GP5HoKTrMA+g4M/VvM3ureczuc34x6
	9OON5rQgkd/mCM+20cYdhVG1QtXaip11Ohem/13y1ZCQc1pJ0Km/zyWG8tTIX5XzBrMPogZwvjG
	JvhgalU0XKxbuYmyEf0fF1dn5lgY1XpNFfCvh/9eQIJfy7aRFI6cgifwdy6WSRzWF9r+p9lOQnq
	sSqa9ejJfW/neOsXLtV6K6OXEP2XzasFtNuABsSl585pMmhL6l1oJgQWhajybK6S2/55afbRL+r
	0xv2KGtVfgykOrCYf0/Ni4lWSy9fxT81BmMFHXjeWVWsctk6/BhoTzR7NICgN1B+SFcRTa5iefu
	22LG1qDSNWJobYJNZaBKFxg==
X-Received: by 2002:a05:620a:4384:b0:93a:1312:ff19 with SMTP id af79cd13be357-93a29bfd542mr182315585a.5.1789382728081;
        Mon, 14 Sep 2026 03:45:28 -0700 (PDT)
X-Received: by 2002:a05:620a:4384:b0:93a:1312:ff19 with SMTP id af79cd13be357-93a29bfd542mr182312685a.5.1789382727735;
        Mon, 14 Sep 2026 03:45:27 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a9b59149dcsm4125481a12.13.2026.09.14.03.45.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2026 03:45:26 -0700 (PDT)
Message-ID: <38874e77-df57-4254-9d2e-d4109a0412f5@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 12:45:24 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/5] arm64: dts: qcom: nord-rrd: Add WCN7850 WLAN support
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Yu Zhang <yu.zhang@oss.qualcomm.com>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260914071944.164217-1-shengchao.guo@oss.qualcomm.com>
 <20260914071944.164217-6-shengchao.guo@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260914071944.164217-6-shengchao.guo@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: MAgvLcHKtB4sGfFptvfMoneHLHQ70cyY
X-Proofpoint-GUID: MAgvLcHKtB4sGfFptvfMoneHLHQ70cyY
X-Authority-Analysis: v=2.4 cv=c5Y+0h9l c=1 sm=1 tr=0 ts=6aa7d048 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=FkmPcKp2FLNqR73q6TwA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDE1NCBTYWx0ZWRfX3z/lZwog/aM2
 MEi0zkHn9lVEAX2S2V8HwiLWTRKAMFFjL4DjDfbb3QR/PqwiCD0/WlBls34Wl0u52B69GLmOGFO
 pky9qm0SV/TTa4tf3WiTSbeu9RCcCOylggqvh548Rj0cssezlgti+xVGSPM5CZg1s8eUsBoHp9D
 yE8eDxEFUZtgWCxOA6gBNwgJR5ULkFUBIZkHn96vHecYgv6uJwcsHLFvcSsbaS61iOtmRVaOrTX
 d5n4LYbmjcZjNKOrZK19Z/hLiRZi2tmFtrC8+QS14x9ZGrvBfQw4Etf5l1I1PqThkOiro5gDdhQ
 OkkvVHxFRdp10pqfc+gUMEj/1zM3aU5s2J1Xy/8cilrGBUz8kwMW3iiDAwCqmhlLvzA896szMq+
 ULxdlbrxDyo1vgzOopVsu3GLwuDMGG6Z6XepdMwlNc3i6IMqU6ZOqXaAOWBGAd8wDe2M6W6oCDi
 hesk9fRfj5fKp+EEFjA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDE1NCBTYWx0ZWRfXwDWVO/CvTn3h
 h0MVdpcEjWxgG+mpIA3rMikYNIreW7Yj6mh1NmJbvT6q7+EnCPpxgPnRNTm8Vvz6JhSXJNlORiX
 I7TlGdeVASM3O3Ra6oQoRFzgsrDuXqU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 impostorscore=0 suspectscore=0 malwarescore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140154

On 9/14/26 9:19 AM, Shawn Guo wrote:
> The IQ10 Robotics Reference Design carries a Hamilton (WCN7850) module on
> a board-to-board connector hanging off PCIe2, using two lanes.
> 
> Unlike the Ride Embedded board, the RRD generates the module supplies
> itself rather than relying on the module DBUs: three discrete buck
> converters produce VDD_CORE_VL, VDD_CORE_VM and VDD_CORE_VH (0.95 V,
> 1.35 V and 1.95 V), all gated by WLAN0_CORE_PWR_EN on pmau0102_e GPIO6,
> while the 3.3 V and 1.8 V I/O rails are strapped to the always-on
> peripheral rails.  WLAN0_EN on pmau0102_e GPIO10 releases the module
> itself.
> 
> Describe those rails, the WCN7850 PMU that derives the chip supplies from
> them, and the PCIe endpoint node consuming the PMU outputs.
> 
> Assisted-by: LLM
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
