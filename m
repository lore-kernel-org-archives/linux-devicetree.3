Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793024830;
	b=1D9lu54NaOdmX28LnrJOcLKualTODM8b/WyxON11NSvjOct6ZfNxgzeg6Se4CqL4Pjyr
	 yrtUMV5B4PraPBKRkTXh+qxkLNcFw2dez8XJ1xKaT62iGNSClaALAT3rclZsTXs9tRCHb
	 8ZYHzFlYv4lsb3/VXMI1nEpP28RbkiBtVraK3u50Ja99mF3UII79grq2j0aQIKu/rXuxO
	 wHzjAGMzCuz5DLaSeEE3zVvAfu9c3E+zSQbF9bvZiRGkIFJndV0U0ALeslRQkrZQ+Mgqx
	 nLqQC2wvCd8E8PC3LS7ef/Yarmu3K/9uM8L8Z1BrsyCuCWVYtgCbrkDCJ7RcUAi/SgQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793024830;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=i018fVxtGTIXL7t0acZx7UyQ/yTWV3DDtBO9UCel/XQ=;
	b=e+H801oUsUuCbACkk1gCoCypEJzkqN94yxNRy8B+CWQ6CtR8SJRnC+VutrRCXy8ZchTr
	 WKusKNWAGwlu4UcpLPXykkF8ZbL/BusOEVhjrq3wguHcXjsksmhfVxwt06OB5bT/PvBiN
	 tt7lE8En5mKkkXlfH/gEQrek1JCyapZUb2QVALfRfRdasHnO8Ng3aIu/R+QA2eONK8Zoy
	 ildPEQlZRL/OkfQ7f1HyzwXOyFBe8Z8alG5W7mg4x77IRPo2rqJ5OJTg8xp0Om5X8r3y4
	 RjiL7j/4qjSzHgz2B7NpZYWLK14P4EnJz8G8+ve6g3GiGDssAfOV32Ikrl7BAlTI5OQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=AwZIzzlE;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="JDo/xBF0";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20C90606A32C
	for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 14:27:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 20C90606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=AwZIzzlE;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JDo/xBF0
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69QAt2P33632933
	for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 14:27:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	i018fVxtGTIXL7t0acZx7UyQ/yTWV3DDtBO9UCel/XQ=; b=AwZIzzlEeGhTQmT6
	owKx+fKavOPPVwB5kkhFl1jcf2hHNJNiEAqmZyxcbgoeicgnfNQMdIbhowSw9GOH
	SNrjh72i4zTJoP81Un1VYXgoxXqxdslYn3jvj8x7/YtLDLBBXtksRLTIwsdMhS9+
	OOpVn0NnyDuEi0CNREPns4f1eAJlQ182qBc6IALASd5Hg+Svdbwxk9r522N0Xx/D
	IQudgErFZUOqPea/DSjCHBV5Bud0JvSHvsa2tiCEaK6WMVd19Mr444PJLAC9eSHv
	LlTv8HJyGMQKTm7wSXRfzMGVpiGLkn74HkJAXimNF6JE+DqJ+UDWjdjQ1gZ18Uwv
	xpt8Qw==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hj4sf0y70-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 14:27:08 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-7c100f6f8ffso85672137.3
        for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 07:27:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793024828; x=1793629628; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=i018fVxtGTIXL7t0acZx7UyQ/yTWV3DDtBO9UCel/XQ=;
        b=JDo/xBF0KPxvMm/bZNWhuz8db0UFfPkt4Ce5P1SOkZIr1KfmK5RHZr4Vi9Zro0YymR
         Lgrlnkf8xcXN0OUGAu1Ts6z6J69ulODJMc5yR4MRAUU5ggHx8peOa6kPMRzoO0xGm0ZJ
         2lhgxPRU5CLhAV0jVG/cD3NZI0zzBjka9Ckn13b0wWQ5ASdhA9cZpZIyYT/pLNpJtYHz
         fjUo8K4sfiBf7OWPG99/cE4vI42d/Lm1Vc3KaGEfk4zpB5feyG4WGEI0pJmn8rjRtcvS
         A1Ae2/GQB/Sd/rGgBLrUdk9gQdTunQgv3F45Z4nALrXL6t/lywpCRmcBHg0q+vQ80oyT
         CSfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793024828; x=1793629628;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=i018fVxtGTIXL7t0acZx7UyQ/yTWV3DDtBO9UCel/XQ=;
        b=KueAbZdh0qVYdYnECCG/cdwDM2JwddxCc917Lfhhx4ZmZdvni/kQXMfg3rX2Le5FhN
         WRW3GedXjBg1i7eiuabRHUX1Q8cyUQtCev5qh4MLokJbkxtpRmRHcPuwvbuGChjWYQZn
         hVCRtlxmXyw1ru5b/BgBYYz7/BtWwE6x8RPopR+m+m3tqxKzaCqLd9YQ/tDqflYVkvWk
         lWp+sEdf5/MQsBzORYGTnaPDegYgwgLwB+95YaW8aYrO7Dj14aavHyuQhJ1eqg3qFcK7
         0lN1j01MaA3R9Jrv+aqF7w5GqcjzMfzw3vhh+OPZkWtAv6aq1/gxh9OkQmNBU1AXwOLN
         3R4w==
X-Forwarded-Encrypted: i=1; AKwUvBwZFZk5piUkkK4A3pP8EwAMUSrJWY48KiZ7zpDEu9DR3ZsExoXRfrRb2eeo1W9QmRvDCcXJiFadNRqy@vger.kernel.org
X-Gm-Message-State: AFq9FYJsL68cDgMAmqt+VPl42LgY2HuJQdMOD0RTA8U7J/v/NOqQlYff
	E7snQ+ijjeYd3ndiKx7Vbk/8KUy7sPfdimuJV6lMUwMneJW+2t5VBUCMuJi00KN6w1Bvm/v5mWM
	dUDNpY0fuhGEaKSL7RNaSM41BlHwoPIXe9JCpP0opjXmr9aPpKAVy58Wm0EY/zgUZ
X-Gm-Gg: AYBFou27lfQ+5nzBi+j1cxNeBAlOHBqKuxUJpYXvlWkTki/CJrd/ePKR9/D50bucJfu
	JChHvNKU18mSBWZ7ps4Q9St5yAVmNCZ+yZEv6wbJ/HSqxb4bimsOw7+P7omuAaAx5n3KQ2PCJdu
	GU7a6jqJRZIMnWkflovBLLUbavQAXotEKoekc7QG+RIk8mKJd7M6zCUjIQ6ClossTn17+2dqbdN
	KOqZIxqyYPIeYaKk+Y+j1fLOEjDxLEjA0yC9x/4OMIg14B7tWDdECl9mqpXOQmVgJ+72mx/8viZ
	UVMzABZpGm3J+bioFiz3C6UMlQHh3RYYuzaW1Mgtt/puI/BD/o7yTwKME25qWI8S7T/M4CGPe4y
	8E5CGNjpLvPQz5kv/dNH9ug==
X-Received: by 2002:a05:6102:8648:10b0:7c3:83a9:edb2 with SMTP id ada2fe7eead31-7ce5cabd66fmr1677007137.1.1793024827955;
        Mon, 26 Oct 2026 07:27:07 -0700 (PDT)
X-Received: by 2002:a05:6102:8648:10b0:7c3:83a9:edb2 with SMTP id ada2fe7eead31-7ce5cabd66fmr1676924137.1.1793024827225;
        Mon, 26 Oct 2026 07:27:07 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b44598480dsm3584442a12.24.2026.10.26.07.27.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Oct 2026 07:27:06 -0700 (PDT)
Message-ID: <a603ce1d-6664-4c28-8f07-f8697d833e7a@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 15:27:02 +0100
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 4/8] usb: misc: qcom_eud: add per-path role switch
 support
To: Elson Serrao <elson.serrao@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Rob Herring <robh@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Peter Chen <peter.chen@kernel.org>
References: <20260929213513.2401005-1-elson.serrao@oss.qualcomm.com>
 <20260929213513.2401005-5-elson.serrao@oss.qualcomm.com>
 <944d39ba-6e1a-46af-b5ee-32140947f924@oss.qualcomm.com>
 <ba7e8dc5-a5a3-45de-a1b3-ca200faf1ed5@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <ba7e8dc5-a5a3-45de-a1b3-ca200faf1ed5@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA1NyBTYWx0ZWRfX19NOq0TPfXqi
 VGk41hV8HhG+F/kRWKGNeScKt2wXkPFHpG3J+dygVSz65z3CJ+kAm4Rc6IoRcv2wvhJKbJKaPMn
 otCV5o0hM1Je+nA7QaqeZmY6DqJ47kQ=
X-Authority-Analysis: v=2.4 cv=ZOdCCn7b c=1 sm=1 tr=0 ts=6adf633c cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=xHC4QZjwoU4ybDikHDkA:9 a=QEXdDO2ut3YA:10
 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-GUID: J_F3m-YsiSnmnrKLeUdSTrKWy__UtCGh
X-Proofpoint-ORIG-GUID: J_F3m-YsiSnmnrKLeUdSTrKWy__UtCGh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA1NyBTYWx0ZWRfX6gPNZ2sahUPm
 bS5QQHstyUk9/62MDO/a4UAOlN0mjVVubmUwbzkj92HKHRgYU9T0mZtKzFFlR/1AeCg+r5FoY+m
 Hd0xJqsY53RMFkGuh38BXuah3H71XMkpdplfadVEoKwhZwAE/BAkOesrjBnIiZPmGqgV039xI3Z
 Js196m1eS98qOPfV1kJp3iYMjFGfYnupOwig56t8ID8Q5U5VcjkJaeWkg5KLndjWIXubSQO2gsk
 n5zC1U1GmYO884LOEguYfDlvie5KUqERpy7wAryitJVeVcHdQEiyzouDyHC/UfvbF+8QOtnhPY/
 mvaIRfwsYOQGipbCLf++HRhvs4oPY2VwlQk5MG7LPdCAruVZ1tjtT5oMPjEUb5TYEIs0d/sZJaB
 k7wx6rH+n5EeUvgH0PUq8bRl1s31/gRWLUJxNrh1Rx0ZcE7TIZ1xCWrKSHVsL43Aq4hYECavk4c
 4wQcMm02ec/HcghBMIg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 lowpriorityscore=0 priorityscore=1501
 malwarescore=0 adultscore=0 spamscore=0 bulkscore=0 impostorscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610260057

On 10/17/26 3:14 AM, Elson Serrao wrote:
> 
> 
> On 10/15/2026 7:44 AM, Konrad Dybcio wrote:
>> On 9/29/26 11:35 PM, Elson Serrao wrote:
>>> The EUD hardware can support multiple High-Speed USB paths, each connected
>>> to different USB controllers. The current implementation uses a single
>>> chip-level role switch, which cannot properly handle multi-path
>>> configurations where each path needs independent role management. Since
>>> EUD is physically present between the USB connector and the controller,
>>> it should also relay the role change requests from the connector.
>>>
>>> Restructure the driver to support per-path role switches and remove the
>>> chip-level role switch. Additionally, as EUD need not modify the USB
>>> role upon enabling, remove the unnecessary role switch call from
>>> enable_eud().
>>>
>>> Reviewed-by: Peter Chen <peter.chen@kernel.org>
>>> Signed-off-by: Elson Serrao <elson.serrao@oss.qualcomm.com>
>>> ---
>>
>> [...]
>>
>>> -static void eud_role_switch_release(void *data)
>>> +static int eud_role_switch_set(struct usb_role_switch *sw, enum usb_role role)
>>>  {
>>> -	struct eud_chip *chip = data;
>>> +	struct eud_path *path = usb_role_switch_get_drvdata(sw);
>>> +	int ret;
>>> +
>>> +	/* curr_role tracks the role from EUD's point of view */
>>> +	path->curr_role = role;
>>
>> This should be assigned after the fallible call below
>>
> My thinking here was that `curr_role` should track the role requested by
> TCPM, rather than the outcome of the downstream controller role switch.
> 
> When TCPM requests `USB_ROLE_DEVICE` (e.g. cable insertion), EUD should be
> enabled regardless of whether `usb_role_switch_set_role()` eventually
> succeeds or fails. EUD access is tied to the requested device-mode
> operation, not to the controller's ability to complete the transition.
> Likewise, when the port exits `USB_ROLE_DEVICE`, EUD should be disabled
> irrespective of the controller's state, since device-mode EUD access is no
> longer needed.
> 
> If `curr_role` is updated based on the controller's outcome, EUD state and
> `curr_role` can become inconsistent. For example, TCPM may request
> `USB_ROLE_DEVICE` and we enable_eud() as per Patch6, while the downstream
> controller subsequently fails to switch roles. In that case EUD remains
> enabled, but `curr_role` would still be `USB_ROLE_NONE` (see also Sashiko's
> observation with this approach 
> https://lore.kernel.org/all/20260811215406.7FD161F00A3A@smtp.kernel.org/).
> 
> We could keep them synchronized by rolling back the EUD state when the
> controller role switch fails. However, I don't see a strong reason to tie
> EUD state to the controller outcome. EUD is intended to operate
> independently of the controller in device mode. Preserving EUD access in
> this scenario also provides a means to investigate why the downstream
> controller role switch failed.

Okay, I think we can tackle this if any issues show up in the field.
Otherwise, I think it's high time to get this merged!

Konrad
