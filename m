Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B46433939D2
	for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 10:03:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774864991; cv=none; b=mLxhk4cReK5tgvkyJApzWM02fplzNA3iGfAq5f9YQL6fidp+iMvOIJE7NklmSVgqfcdaoLKAgFYtEIqZtzZMKTbaPmjnz9+u6eLGtNVo2BwS0D+Bt8OCEijEafQ38VxeCcZ8gUNiXiX033mE2fKAn2i4u64Yuw5CoGdClAyjvEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774864991; c=relaxed/simple;
	bh=C+6FooB89Ea8VtnjcQENsnOLuZW8/XBpEXiI1xf1Ixk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ere5Qi5Xx71XtZYrQdKWbqjn7TjjsaWKJGjbX3KvObc8xplEu6ruACn4aeDRNXxkZd0NM/dbBJmxZ3LoJyRBhTTmqCJRVXtGPrp/2pzpxQTw4RKdyqqO+IRCkWUCa98FBJcP4NupTaM51FIGH/Jdl6m/HYh9vIN9YhhcTPfQmr8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bvmv6XYg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kEsTdghS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bvmv6XYg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kEsTdghS"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62U5CqUN1972782
	for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 10:03:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bPHKEQELSsYpRldROQs1jZjxzlapr8PtvfAxE4pQOGM=; b=bvmv6XYgCTGELuX4
	jy2aqWy3cu26/2r5Nn/LqafAEwUnzwq3JJRLUrFriRwLvogRRWNZ/4Dwu8sXfpr7
	rnR6XkgaIMxk0YTZDld6PGDpAwnx8M9Uo3E8Smqn3z0Pddd2LjfD5FeebU3B2OpB
	P8yKiv0TV/6YPwa1T9pZeLnGSGW6BvgwkeUNEAuPy2nWw7O1zdBwi/JCz2xsUOzd
	vZpflX6L+mzO8jsTVt5vZSM9ienYO4TaP/1G7Fdm3yLVVCWdN9Xb29rnrAgjLIdy
	hsxWbH90H6RbyI7XAjyJCiqTXyVAwh3hB3yNldXz68ZOY0+EorWg0+YNy1ChWx1r
	Ymap5g==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d6ufmkpw7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 10:03:09 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50b33a19837so17731011cf.3
        for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 03:03:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774864989; x=1775469789; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bPHKEQELSsYpRldROQs1jZjxzlapr8PtvfAxE4pQOGM=;
        b=kEsTdghSaJEiZgiqu6ZyYAnumVHORUDXtz5g60NRkMbroET1AXrLFXCncaklJvsWw8
         oo5w/3ia0EYykhQx/tYNuVLOTtcajWZM9Yo+lGHaStI5EjbGLoHW/jKiT5IdS1xZNV8l
         ZyoKiScq2q/w8VJwFD8by72+PU2/UXqw/I5wt8AUtUuhqvm5NSPR0bqhj2QZTYl0Syzz
         oburqFyjGYkSrHAhDjTFVeb0EvVUL3wG3cSoAJugXvQipeDZx0QGTIiamHuqgVgnA55S
         8Uo8c79j1mDVNG8qLpVURK0XyeQ9+kIlqF7CuLM2Ko1qd0JPx5hjb91f72iivd+PcdUs
         gHJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774864989; x=1775469789;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bPHKEQELSsYpRldROQs1jZjxzlapr8PtvfAxE4pQOGM=;
        b=TFzSU2W47mvzBYuE7o+q3lG46e5XQSInqwPuQ2Z8AcPUTNPMyq8NypzjmnkZ2XoiBd
         VncpSOSzc9IVj+AA9OPWkDc3p1hSZamL3ovemIJQ1s2lre85aH/s8EbXbvNu+Bg+Vvat
         Y4b4m9kkaFoFjUa5WjnFve+Yq/SxWyq96iNg7oCgCngzI7i89YkBYtcJesqWl42Nfc9v
         r/vJlE1WBDWb2wexpevLhdnsAXL20jYitKOSsDLM0zW3Ggl8DQyTYFOIc1Q4GwG94SLy
         LnIMUJQUejTOZqY1mymBd9tMuGzsO8j4e/+h8Qmb2p/Ub8mMAZDPJyz/DlfpFcJnnlnP
         iHwA==
X-Forwarded-Encrypted: i=1; AJvYcCUf3b5sz4PExMvGCJyEiAF1l8LK++zidgaLeIemxA1fF17vrNZ1ougJIQFvGybFyUZEiLAyHHK7J0sf@vger.kernel.org
X-Gm-Message-State: AOJu0YxqkyXpHul0wF9HS790z/4R3ZQV/enUbCtVKTKs97PVt1oZ/DAQ
	UrEAzr0Yt7ef9bso9Yh43MduR4lFBqALy/2jgmAr/Ppw0f6XVY2mpwokIX/RhxUaRTOcrkDH8XA
	kdf0WbVrfpSvfkR808RuHFudvRRVUyigx864y0lYrMv+In3/h/Ur9nnAz3Y/usTq8
X-Gm-Gg: ATEYQzyJLjZjcdLDrAx8DdfUGLmJvBijY6aXbYiPSWWviGmU48LLEdmSk/DSjzulREO
	wuhx008nl3Kq9k97CfuueDgF2AfEFZwHZaNS43wFRAe4/YDcSglrsUWrCEblC8lEHUivp8zvw/p
	M7I9qNmTl+H37ghKvygdBsMrp4w+B8wAeqLMIltbEj0pToH3d+Ok94FJ7xng/xLSUkQ/W+eJOrr
	S4P93Kbia78wm8OHziBINOP7Zm1Od/02GGYyGGKLd5ojjFhnCzDJMaEuymdoJ6+QhutrcxxyssR
	cbcpcn+KzL7YOjCrkh3Hq2av+PzTmOxrcYYdzYXnx3Qm1cXJqayPxW5L7vhFcuCHB0OZQ1sO/0x
	feJ5onzhJAV3CQe29/2mAOD5hpOMlQoORd4zVvicoW9UBO6+08BcM4fXOp8EHUQkY4ano9iJmD8
	eE9/I=
X-Received: by 2002:a05:622a:1386:b0:50b:92cc:f879 with SMTP id d75a77b69052e-50ba39655dcmr115390701cf.7.1774864988832;
        Mon, 30 Mar 2026 03:03:08 -0700 (PDT)
X-Received: by 2002:a05:622a:1386:b0:50b:92cc:f879 with SMTP id d75a77b69052e-50ba39655dcmr115390321cf.7.1774864988191;
        Mon, 30 Mar 2026 03:03:08 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9b7ae522d4sm275487366b.22.2026.03.30.03.03.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Mar 2026 03:03:07 -0700 (PDT)
Message-ID: <5c0747dc-f0de-4b78-b0fd-8f6a6690e86c@oss.qualcomm.com>
Date: Mon, 30 Mar 2026 12:03:04 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: qcom: Add Motorola edge 30 (dubai) DTS
To: Val Packett <val@packett.cool>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>,
        Tony Luck <tony.luck@intel.com>,
        "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260329103055.96649-1-val@packett.cool>
 <20260329103055.96649-2-val@packett.cool>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260329103055.96649-2-val@packett.cool>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMwMDA3OCBTYWx0ZWRfX8GcaKI3zkdFK
 IU5n0SWYjhcpy8mTrZl5/2oMLsnr3eGEqQYw1sCRlh7xVYZwpoxy50mL83wb/BjYDDKK1IcEp2W
 W2dxelOYsf6YSCn+t/77cEaXScSZfmPT+2EHfdJyCl4KZ9RXL3KXvXkoiMtjp+Fcmn2xMniIg4k
 I9YjGVdjU/983vhBZSLYdz4IIeY4mOuZqvzBkPC58Lju7n/AmzKCGLg8ndhCPP10dzcIOKIQP70
 jJzcAX6ziPpiKz3UwVO0Plm8Qq4vLqcUzSqaLECcd8176UWXxwVn1YwuruRH6/mkZmThhbp1Deu
 wDu4wDnrH4VD2BVQbusWARDXVdiZAi6UMfFRM4HAS7P3AkJAI5Y2S+1gjwezuaBfSpYawuamw7w
 Tq484IpkwENMmumvvm5XPgMjAaVFOCAeqweSrjEHyaLYmYOdKvGdGzlojAVDpbsZlEIZH/wukT+
 Tcw/z5GpVnxwucvQyrQ==
X-Authority-Analysis: v=2.4 cv=aOT9aL9m c=1 sm=1 tr=0 ts=69ca4a5d cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=6mXsR_sTwsZj-yjp6PMA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: zZdBcZilGo2xbQLx-dtceG2Ut6-DZNn6
X-Proofpoint-GUID: zZdBcZilGo2xbQLx-dtceG2Ut6-DZNn6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-29_05,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0
 clxscore=1015 suspectscore=0 adultscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603300078

On 3/29/26 12:16 PM, Val Packett wrote:
> The Motorola edge 30 is a smartphone released in 2022.
> 
> This commit has the following features working:
> - Display (simplefb)
> - Touchscreen
> - Power and volume buttons
> - Storage (UFS 3.1)
> - Battery (ADSP battmgr)
> - USB (Type-C, 2.0, dual-role)
> - Wi-Fi and Bluetooth (WCN6750 hw1.0)
> 
> Signed-off-by: Val Packett <val@packett.cool>
> ---

[...]

> +/ {
> +	model = "Motorola edge 30";

nit: Google tells me the 'e' in 'Edge' is uppercase

[...]

> +		framebuffer0: framebuffer@e1000000 {
> +			compatible = "simple-framebuffer";
> +			reg = <0x0 0xe1000000 0x0 (1080 * 2400 * 4)>;

Let's drop reg and use the memory-region binding (also drop unit address)

[...]

> +			ports {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				port@0 {
> +					reg = <0>;
> +
> +					pmic_glink_hs_in: endpoint {
> +						remote-endpoint = <&usb_1_dwc3_hs>;
> +					};
> +				};
> +
> +				port@1 {
> +					reg = <1>;

SBU would be @2


> +		cont-splash@e1000000 {

framebuffer@

[...]

> +	thermal-zones {
> +		cam-flash-thermal {
> +			polling-delay-passive = <0>;

that's the default setting, you may drop all polling-delay(-passive) = <0>

[...]

> +&usb_1 {
> +	/* USB 2.0 only */
> +	qcom,select-utmi-as-pipe-clk;
> +	maximum-speed = "high-speed";
> +
> +	/* Remove USB3 phy */
> +	phys = <&usb_1_hsphy>;
> +	phy-names = "usb2-phy";

Is it really not wired up in hw, or do you perhaps have a fake cable?

Konrad
