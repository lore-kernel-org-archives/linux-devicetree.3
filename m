Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 171F62EBBB7
	for <devicetree@vger.kernel.org>; Fri, 19 Jun 2026 15:30:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781883051; cv=none; b=IaFv4DaaJUvh5B8OXe9qWCWxzspjFe8TkbahVJF66eScXXPgSMXNSMH1Q4JjUUmPoFf+oq3iw2DlrgpDP0imS4l6tya1muyAELkPa2zM0KudS8Wn/NVR0qPqLYsDLXY9LRSEehIuUEiAWwax4jElRX5jt/mLY8SAQKrnmlHCC3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781883051; c=relaxed/simple;
	bh=7DA+ZlpROtZMgl5n43M1+4Ej++u4EG5kW8jRO6LhhBg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rusuAo1dvoZcZ4ZLqvXpY+Y0RoFi0qzo1ZLkBgtBtaCvgXkOzQISGWmHdFONrEblUn9JoF/7R5TsQknz5nzxsopAZ3IGE3Bdn/MF0FQs8BGXE4ZZYGZ94P1TIkqibjk4wHU6qXNY+atBvK26KCm516UqsRInu5ide5W2ilIbz5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=a2RxEn0L; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=f4eVTeD6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="a2RxEn0L";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="f4eVTeD6"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65JDC9ml556795
	for <devicetree@vger.kernel.org>; Fri, 19 Jun 2026 15:30:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5XI2GUY/TLCeni53ZesH8WgajiW7mP15CJRq4DcQC+s=; b=a2RxEn0LKwBubNu9
	xUjy7NQk6iAoJtZCBqtlrRo40IT8Wf/9r9GBCaz/IjMEkiGi4Npemc4IT+kQ3CDe
	Bv/fawMaLwr4wjiQKbajtZA0PwGwwhDW6BbuYj1cMAcTJc4NYuP9BdbUdDpVY2GP
	Fw3TStHhW/2ycOdFYK+ZzB0lPteIRYNmsA7iOCIyP87ZWYHs9usOgMUTtxR4n/Da
	Kdu2AaGB+KCpUBgSq55VArncmkiH+AmAO9f4q/heeHF6EZ3V0Gq2ldKuoJEAyiyw
	Vj9FddzJ9v9TrHgPPaK1M0wKXPy//l5OMqP3eErmQ8TQhCwECyFrLW4f7QvFUkMB
	8y0J4w==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4evpyuuh0t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 19 Jun 2026 15:30:46 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-920f826bcb4so14202685a.3
        for <devicetree@vger.kernel.org>; Fri, 19 Jun 2026 08:30:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781883046; x=1782487846; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5XI2GUY/TLCeni53ZesH8WgajiW7mP15CJRq4DcQC+s=;
        b=f4eVTeD6ob5ZPlgp+U+DKgbt68fjj6qwW8SZakXIWFOCWUeDEJ76TBQ/JeoCgBCCrb
         yF8xKXKWPDIIhLnVTCZTTLym3UO4h8nIgs8Qgi4ABeVdpd5ZZscnAL81kbPQrt8wuGev
         cq7kDc/N6bRO8j5MzWV8IeGEfYc8BLt3BAPncjpl7CouMTd4FlqzJ247CdzqsQ7xIdqJ
         YWqnZPIRnsb9aXSReicJXRkBUZA9uuxbb9jo5EcpONDC96Fjwm3PPynKAnZMYn7ozaJL
         iTGLoAi8cstFz8rNDkaLxd5sV5e5zW9ln2jdZKX7BiXvDEGh4SoUQt+T4wDs/9Vnw5c6
         WZEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781883046; x=1782487846;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5XI2GUY/TLCeni53ZesH8WgajiW7mP15CJRq4DcQC+s=;
        b=Vptw2w1+XIM1+oueib0N4+DPaWryPGKc7ac/6NzM/SXDI7QrSJfXJwKT/3f9Z9cmdR
         uB8g4xsrd8WLFA79l6uLtjDe6s3MTke1F6bctCEGuOpnyHob/GGrbkbW1dTwA7EjqWoV
         WPYHmrj/Mul/SfBAJ9QbRDeYMJgodISwrbcQdsJm0d5NguIzXqjpkomg375GpmAZ6fJF
         GO3VzyFIscRqixvyv08e1A/eqODmJ/T+uEwMnJx5Oqw3AO1mySxOO3a5samNmsc+IrmR
         P0dTmWbT+1r2efCpgn/GqK4sadjwYvP11miy05NPUfbaPIfy1p71Fs/P8IEd1XgJ4XDt
         sg4A==
X-Forwarded-Encrypted: i=1; AFNElJ91jCl2R6jbyq7zZVF6cgkK7LQPIm44BqYydS4oX0/9J3QJ8ufpU4BqCEZbHP0qLLOyPICSTse0OSKZ@vger.kernel.org
X-Gm-Message-State: AOJu0Ywz0f06szicjZiovikp/uXRNwyjzImSC2WMEdALsvnUusMRolzt
	FYSO4Oj/fweeYhaUNu6dnAtNmyeaB6iNqqn+UwqHzDtWCoWijmZ/jtj8b1Mm9h+1GRZDADxWwzH
	4Ph/a9H8VFsszzD6OF2TBN4IFqmDi+FryUhxrdHCtSHZUtUH8PfRoLHWLKuDCCKA2
X-Gm-Gg: AfdE7cnXIL0cU2EJCY56Z8eCctb36AqxUE3uOU21dsHyGFHIwUBSyDlcAlTRVJj+NDg
	RhoK302o1bq2O8QE7/xkKUK+aEC+VEUM7psTNZPCA0AVKWCZlhq4X+UKunBesqN1QtsgkHADOaE
	OVsR1geKO/dEvr9oMbqaod6F3X0HGvnCpYHiM27OwMTcStXlbo0oGpkq1cBYu46wweU0TyBWru8
	feNy/cEUe5rL5/eQtgR0LdkB7KjfefrholhdxOu28EwAFw6UdvxQovH5GhXULyfp6PeNmA3NHpS
	QCq5/BEi/TF6Bj3F7Z4RAKMyQooP5puG5QPi/FJzn8O+gXMG7LXSiFitXEDH9pf5MzqnWmkvdOD
	0uGCEz1s3UutuSg+rNJHPvwjNCB7QvLZAUUo=
X-Received: by 2002:a05:620a:46ab:b0:8d7:ed38:8189 with SMTP id af79cd13be357-92088159fbamr405098585a.0.1781883046131;
        Fri, 19 Jun 2026 08:30:46 -0700 (PDT)
X-Received: by 2002:a05:620a:46ab:b0:8d7:ed38:8189 with SMTP id af79cd13be357-92088159fbamr405089385a.0.1781883045370;
        Fri, 19 Jun 2026 08:30:45 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69711f3114asm978456a12.18.2026.06.19.08.30.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Jun 2026 08:30:43 -0700 (PDT)
Message-ID: <c16a2837-4b04-466a-bf4a-3717436c25be@oss.qualcomm.com>
Date: Fri, 19 Jun 2026 17:30:40 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/3] arm64: dts: qcom: Add Vicharak Axon Mini
To: Ajit Singh <blfizzyy@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260607113658.25117-1-blfizzyy@gmail.com>
 <20260607113658.25117-4-blfizzyy@gmail.com>
 <39228ace-9404-4ade-bcb1-28e763548b7f@oss.qualcomm.com>
 <aiuGjH4qeOIXXgqq@page.local>
 <5c80c430-8bc7-4d03-be7e-c6dd518705e7@oss.qualcomm.com>
 <ajOO6bx3KmYzhVdy@page.local>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <ajOO6bx3KmYzhVdy@page.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE5MDE0NyBTYWx0ZWRfX+uwDugesnkDs
 LsGWunPeGOARivNWueRxkqV5CtRTrdeyDPvPIm5pGjs3GCxhgon793XBvZ4flNtJoCWTJsoTCiI
 uJLxPWna3UBm21Bdmt/TpMJenlAt5/s=
X-Proofpoint-GUID: sQTj9NMPzItTY5b_CiGd1wS4YfaPIdrN
X-Proofpoint-ORIG-GUID: sQTj9NMPzItTY5b_CiGd1wS4YfaPIdrN
X-Authority-Analysis: v=2.4 cv=cY3iaHDM c=1 sm=1 tr=0 ts=6a3560a6 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=pGLkceISAAAA:8 a=U1D1AZZLGyz8rvu0M_EA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE5MDE0NyBTYWx0ZWRfX9KXGEloX2w1W
 uylgA2lEL2Guxnhg+UBeBSa8gLublPHPPTnZTzCxWWFQybFcY+N4dWMrKQauHOsIV64Odh02WN8
 qumS/9mCDvcJtFgI1VySvuOn/kxfIkYAwoeeJvAeTjtJ4TE/w1qqBZ5xLrhrNsNSfYnhbu7qQOU
 s2PFTT+69yizj3WvWCqamWDns/LXwgUC9Bjn+d11rcMrGSLKcmvYctbqt5CxFKTk9A2Gi/9I+Hq
 IIkb6wapcuDdA6Awb2bded3q+KRsS5NGFdJrG/xd2699bz02l2tOjLIRl3Bt3S9urVj6GgOGKRo
 CDF1iOpDesPSrrmInQL3LCb+J7oYQgg4vVmtUNwzMNO2Du49IomWX9YbOifJQMovqV0jP5nmprz
 rL8og2xInF1NQ++/+UDIvUj1jIZDh6V+ik9sKQDGX+0hcBks2bI6db3oue3IquMiBPd2RXrEouJ
 8RzstKVjqct0PEvgcDA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-19_03,2026-06-18_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 clxscore=1015 suspectscore=0 phishscore=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606190147

On 6/18/26 8:29 AM, Ajit Singh wrote:
> On Tue, Jun 16, 2026 at 02:10:44PM +0530, Konrad Dybcio wrote:
>> On 6/12/26 6:16 AM, Ajit Singh wrote:
>>> On Wed, Jun 10, 2026 at 02:58:19PM +0530, Konrad Dybcio wrote:
>>>> On 6/7/26 1:36 PM, Ajit Singh wrote:
>>>>> Add DTS for the Vicharak Axon Mini board based on the Qualcomm
>>>>> QCS6490 SoC.
>>>>>
>>>>> This adds debug UART, eMMC, UFS, SDIO WLAN, USB 2.0 host, PCIe
>>>>> support along with regulators.
>>>>>
>>>>> The UFS ICE block is kept disabled because enabling it currently causes
>>>>> an SError during qcom_ice_create() on this board. UFS works without ICE.
>>>>>
>>>>> Signed-off-by: Ajit Singh <blfizzyy@gmail.com>
>>>>> ---
>>>>
>>>> [...]
>>>>
>>>>> +		vreg_l12c_1p8: ldo12 {
>>>>> +			regulator-name = "vreg_l12c_1p8";
>>>>> +			regulator-min-microvolt = <1800000>;
>>>>> +			regulator-max-microvolt = <2000000>;
>>>>> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
>>>>> +
>>>>> +			/*
>>>>> +			 * VREG_L12C_1P8 supplies the Ampak WLAN/BT module
>>>>> +			 * VDDIO and the external 32.768 kHz oscillator.
>>>>> +			 */
>>>>
>>>> Sorry for the long review timelines on the previous patch, many of us
>>>> were out for conferences..
>>>>
>>>> Is the oscillator used for that WLAN module? Would you ideally like to
>>>> be able to turn it on/off?
>>>
>>> yes, oscillator is used for WLAN modules. Oscillator is powered from the same
>>> VREG_L12C rail as WLAN VDDIO, so there is no separate regulator control to put
>>> in pwrseq. So I think this will work fine?
>>
>> Probably? My point is that you marked it as always-on, so it will *never*
>> turn off right now. For e.g. Qualcomm wifi, there's some timing spec that
>> needs to be met wrt delays between toggling various regulators and GPIOs
>> going to the module, hence I suggested you may need some pwrseq inbetween
>> to achieve reliable powering on/off
>>
> Right, I checked the module timing requirements.
> 
> The module requires VBAT to be present before or at the same time as VDDIO, and
> WL_REG_ON to be asserted only after VBAT/VDDIO are valid, around 2 sleep-clock
> cycles later.
> 
> On this board, VBAT is the shared VCC_3V3 rail and is enabled by hardware, so
> it is already present before VDDIO. VREG_L12C supplies WLAN/BT VDDIO and is
> kept on. The WL_REG_ON timing is handled by the existing mmc-pwrseq-simple
> reset GPIO/delay before SDIO enumeration.
> 
> So I think the current sequencing matches the module timing requirement.

Since the sequencing is handled, can we drop the always-on property,
perhaps by describing the SDIO WLAN?

e.g. in arch/arm/boot/dts/st/ste-ux500-samsung-codina-tmo.dts there is:

/* WLAN SDIO channel */
mmc@80118000 {
	arm,primecell-periphid = <0x10480180>;
	max-frequency = <50000000>;
	bus-width = <4>;
	non-removable;
	cap-sd-highspeed;
	pinctrl-names = "default", "sleep";
	pinctrl-0 = <&mc1_a_2_default>;
	pinctrl-1 = <&mc1_a_2_sleep>;
	/*
		* GPIO-controlled voltage enablement: this drives
		* the WL_REG_ON line high when we use this device.
		* Represented as regulator to fill OCR mask.
		*/
	vmmc-supply = <&wl_reg>;

	#address-cells = <1>;
	#size-cells = <0>;
	status = "okay";

	wifi@1 {
		compatible = "brcm,bcm4334-fmac", "brcm,bcm4329-fmac";
		reg = <1>;
		/* GPIO216 WL_HOST_WAKE */
		interrupt-parent = <&gpio6>;
		interrupts = <24 IRQ_TYPE_EDGE_FALLING>;
		interrupt-names = "host-wake";
		pinctrl-names = "default";
		pinctrl-0 = <&wlan_default_mode>;
	};
};

most notably though, it seems that the brcmfmac driver doesn't even use
the regulator framework, probably because all of the SDIO WLANs that
Linux supports were wired in a more "embedded" way, where the V(Q)MMC
supplies were enough.. unless it's the case here too?

Konrad
