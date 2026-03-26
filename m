Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1C3634D905
	for <devicetree@vger.kernel.org>; Thu, 26 Mar 2026 09:39:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774517998; cv=none; b=AGVxbZeWTDFP16jqDQxn+cnkW1bWyE7yL+SA/PkRUNQ7Y7RhrO63RyuepJ85s/aUNYteEAHuY6UyTfdAeqRbwqrrCBnr9q66RyCMaHqOhvAWTTFxaj9nX+OtS/za8PlONbJqxeCZOJkmg2f12Pgjc0LUgSV+/tkS4Ae5+803OZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774517998; c=relaxed/simple;
	bh=X0urmZHdfzvXbY8NoOrHIuzCFP2iZaoFZvgdfLjlu1Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eN8NKHhhHm7cyREK1ZFVs83WjwlhNr8TaRjU9Tt130n6jooRRSRFP0K1ZE+Hfa+3WmC4rTfSJRb3H35/vCmY4FsYHANiO8CowCeVGpcHCc0YNJQkI0Ra9MaPU8AIrc61XFQCtRA3rPAxWUGPYBLW682/P0RfsQ6Ss4vh+pcjVRI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PBtpIHcz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=V/Y5cSgz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PBtpIHcz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="V/Y5cSgz"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62Q8AN7M1554524
	for <devicetree@vger.kernel.org>; Thu, 26 Mar 2026 09:39:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mR8ASKRWnoz1OPhG3zfVHMmRoxmkWULo04LqB45vlsc=; b=PBtpIHczdyrevmQl
	BeL9I8yTP0fa/ArJfwHQ+AnONo4FydKH1//vkEq2e4qY4CrJWTKcLPFrbZwVr07K
	9vhvDgZZd/Ol4u+H/bbv3irdDXyLbrpMnPuGJDJblSqZpY1Z7Hto0pPlj2S/Wo1x
	4Sh6WiQJtnIsd9j7aNuUWFTMIEZt7Um6T6vhwclUfDWZG2xrAcT8LBVg57MuKUsg
	XrfO2Wjasn4xR8GgSLo+EH1xFRD+4q50LStqGMRKrApnkNo4vn+We6wgZInY2I2X
	gifpAueI/+YHKpslK6QX/QZaU1Mo5TMPQfz4+AJ9hxpBU97rs5uYA/fq4tYnOdmS
	S/knZQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d4gj7buy0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 26 Mar 2026 09:39:55 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cfd003bfe2so26534585a.0
        for <devicetree@vger.kernel.org>; Thu, 26 Mar 2026 02:39:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774517995; x=1775122795; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mR8ASKRWnoz1OPhG3zfVHMmRoxmkWULo04LqB45vlsc=;
        b=V/Y5cSgz1b+arjKTut5rr41OZ/XYglUY3XymGErlrWyg5B5gIYYsVLetXOrrFHiMGZ
         7yw1KTibAnhnJI4juhswn4A0HOHItYRVs+ckx8aeK+NL9IMBcvEeWnAa75S/pPp73v+z
         ElgJX6/fOB/HJBbRkkvicnaWLENu8wFoNlLl3LRIYmtVklwdzqKOUzvM6atN2l8CY+Lx
         DnIlVGRB3bHbIW5IEn66QVnjWwipyUiI4wTytG9K8hLPys5dl02uD01URBiECRl51qvT
         UCuaEOuftr07H4gOfd5T8xI5KdhlBIp4rviafJmSl9HHUsLQTyJBMasc1lNS3EDZghrO
         5QJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774517995; x=1775122795;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mR8ASKRWnoz1OPhG3zfVHMmRoxmkWULo04LqB45vlsc=;
        b=UHNnx69bkF64nL69A1omXinCkmlLbEQ1AycDdyQMpALmqXskQLhGkregX8Nz1wStD3
         RiUY/GLElU/trZOR6O7XP/cO9ARKTT96af3fKCWJaQNGTFqk2yoz180GYOCXolhWn81z
         7R3Fywkf19QdF+VzCLn+SYlpHPmAdLJ2jCoWAcwkDgyH7mfnlvGlEYKLBvaaXmlgq64p
         mYjSPm0g5ckL3IiWXTtA8qNpEj8H7/c1lWri1tnKdfJnHNmOyqRBW/P1Y/K2Lk+aAwbN
         P0sgI+y6sewGZRKVDVHimM81C/0v6rxBY9ZScdvY37dlPrUIhgdZN0d8fSNLnuwGDFlu
         W+Eg==
X-Forwarded-Encrypted: i=1; AJvYcCVA1JKBwfDy1Cg/Z/iyQ857e++B6ca+DGsohlI0oXnE/P8Fjyoo8eLlYQ2Afd/+bzShYyLY6jUJ1181@vger.kernel.org
X-Gm-Message-State: AOJu0YxzEUq6prP7ol8bGuneRZmS6t6iGMgxWaX0u67hMM69Zat6r6QI
	Nkwvtd5qS3j+a653ebSClGF5hYCU+12fUdUUIWa+g0nvDDs3iHTCS1nJqto9fTBXPo8u8NzjcY/
	x+6Ls6poKinaKFxAZG1zosga7Cc0LMdLR7AEXS3pIq1wuNymH7LKMuAZTMjihJPzz
X-Gm-Gg: ATEYQzxgJhZxr6BiwMJpPPOqnOTBnv38BX0ruCfiQOKzYQ3df0j5bPBIo5lCi5/55h9
	XW+tOwNLjRbHS66iTx0yFYB/nCvXJg6l0qpcWH4g/9vS9ZR5+TFiQts8B5yOtoQLlgDUivFA7nI
	X7ST2K1Oarz2zMYiBK64zYZ+cwZLLqtMfaZm53bfQkzMUlWabWwVnbi2ey6CtDeAg1B8mpdkHdC
	dC+Wc8HOwUoTninSGnvX9I90GYakfUj9HS4+pU8H4NNyIDWrqcGeodByrX3VP24H6MJ9LPkkKLo
	73rpthNn2Igr44T3N0QagiFi6Saz9F9dFhNREf2egCJM+HPuGDomxj4vNPh0Oniv5ufalcIaClK
	7h/omVefem5B9uWGetW46Y3sgxGvy244ue4EYcVXrLiwEZrZt6kYdRY60NyxwvxFvmJwWEzdvxx
	XupCw=
X-Received: by 2002:a05:620a:1a22:b0:8cd:b2cd:ed4 with SMTP id af79cd13be357-8d000f37c32mr648081985a.3.1774517994899;
        Thu, 26 Mar 2026 02:39:54 -0700 (PDT)
X-Received: by 2002:a05:620a:1a22:b0:8cd:b2cd:ed4 with SMTP id af79cd13be357-8d000f37c32mr648080285a.3.1774517994404;
        Thu, 26 Mar 2026 02:39:54 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-66ad6a6041esm837284a12.28.2026.03.26.02.39.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Mar 2026 02:39:53 -0700 (PDT)
Message-ID: <9a61ad79-b787-4b83-b7dd-2ea36e7cea81@oss.qualcomm.com>
Date: Thu, 26 Mar 2026 10:39:50 +0100
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/7] Add vibrator, IR transmitter and USB-C handling in
 xiaomi-ginkgo
To: Biswapriyo Nath <nathbappai@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Pavel Machek <pavel@kernel.org>, Sean Young <sean@mess.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>,
        Martin Botka <martin.botka@somainline.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org,
        linux-clk@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        phone-devel@vger.kernel.org, kernel test robot <lkp@intel.com>
References: <20260325-ginkgo-add-usb-ir-vib-v1-0-446c6e865ad6@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260325-ginkgo-add-usb-ir-vib-v1-0-446c6e865ad6@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=M9hA6iws c=1 sm=1 tr=0 ts=69c4feeb cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=pGLkceISAAAA:8 a=2_2y1rQ6RNr2V2Z6SLcA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI2MDA2OCBTYWx0ZWRfX6flaty+Imx6N
 N8z0uous9PA5Af/8xR85UViAKIJqPcZwqIexMYOad9Zw/1IZ5f+UBS48NyK8loeyTOVFWaIPR8y
 +ng+Ca9HEjfxtEG0IWuXx69/sn8yWl0hX90enWY7d8Q9eGlIXvJaRzYHbGe/l1cFFXojCzwBNmX
 qfeTFRIlLtv5eEPNdfhnCE/d6CN+QEkctuRww68B4n+TUlLW+7SLcZWI0xb6svGO5mslmH6I1yR
 mCIR9fGPu3hUTxb9zEX+6FHrDyFrf3zAjCNCmSdP1M9510s7Cx19ZdIRz1PtQ4iAWrK5+ME/eqY
 nz8kt5HV6wchzSi3W9W7J14ILNiOSZOoNmsBi+d5GIDw2h/jkqvUDW74CTmurqG/urMsZJJDrRM
 9EBETI4pIjakxIa/zJhBRoxsHgtfvpK596TjNfyD6cFBXOuxofZmXyDiRj777n9V0L6uUX6aSiX
 N13FS4qQLMXcyvK91RQ==
X-Proofpoint-GUID: yeenkItuF4o3r4criDTkqGYyxDLNIyhC
X-Proofpoint-ORIG-GUID: yeenkItuF4o3r4criDTkqGYyxDLNIyhC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_02,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 bulkscore=0 impostorscore=0 spamscore=0
 adultscore=0 malwarescore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603260068

On 3/25/26 7:07 PM, Biswapriyo Nath wrote:
> This patch series add support for various components in Xiaomi Redmi
> Note 8.
> 
> Most notably:
> - IR transmitter
> - USB-C OTG
> - Vibrator
> 
> Also, fix some bindings warning as reported due to previous commits.
> These are tested with linux-next tag next-20260320.
> 
> Signed-off-by: Biswapriyo Nath <nathbappai@gmail.com>
> ---
> Biswapriyo Nath (7):
>       arm64: dts: qcom: sm6125-xiaomi-ginkgo: Enable vibrator
>       arm64: dts: qcom: sm6125: Enable USB-C port handling
>       arm64: dts: qcom: sm6125-xiaomi-ginkgo: Add PMI632 Type-C property
>       dt-bindings: leds: irled: ir-spi-led: Add new duty-cycle value
>       arm64: dts: qcom: sm6125-xiaomi-ginkgo: Add IR transmitter
>       arm64: dts: qcom: sm6125: Use 64 bit addressing
>       dt-bindings: clock: qcom, dispcc-sm6125: Add #reset-cells property
> 
>  .../bindings/clock/qcom,dispcc-sm6125.yaml         |   3 +
>  .../devicetree/bindings/leds/irled/ir-spi-led.yaml |   2 +-
>  .../boot/dts/qcom/sm6125-xiaomi-ginkgo-common.dtsi |  56 +++++++

I'm assuming all of these changes apply to both ginkgo and willow,
which both include ginkgo-common?

Konrad
