Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CEDF406834
	for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 11:54:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782820449; cv=none; b=ZWg7qHV6srKWZ8B2sea6/wBRKug7Gc6X45a+mGxB+wlf0A8bEWBvhHa2Wn8hYIJuuBolYlWXaUjbAcFmtBRLUHkbSvHg0Y1TpZxjK6K/GKIryl0xiEy+KxEwEvaY96XQjrm8tFx4fSwiuV+ALhePghl9bv/szBLzEgamMOPf37k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782820449; c=relaxed/simple;
	bh=sCoOHCdwVpbOi7KCDQwm1bQrC9mGadQApM85xlrOiVk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=H+eNkQvGLbEs80KlxB7yqxz6vXOp+tJWIViG3pJ6rcyB0Gwi/0Mu6oo/36tJlE19K7zIUtDTDM5IpWIgQorwpkFDzcUgCeb5BDk6dPn92axdQX/QspuM+8qM2tQeQ+tYRbuxI0uiiHJZdqaBDbNPy6N76VlSBTA5cZUOgRFLlag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DO3qbbbJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IY47HwNF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DO3qbbbJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IY47HwNF"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65U9muhV1522294
	for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 11:54:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6UZR1WL72OWaE5Ay4jwPanIBNpFEw0HrrP+UEApYoJA=; b=DO3qbbbJwkSukCwm
	SfvW1YqLoPb3PTjY5MjCJRrkenGOqKlMUzkuYy/g952vtKnyvLQF7hoS1g73grGd
	QmGaWuekXEHBGPaLUv/03o1V65sbp3ryVKn1v4KdYZP5vHIzJvanHfTr3s8gl0Wi
	E/PDFVT15nYn7Ccc0hNS1uPw+rj+xEetE4ssogtnjHuJvk21pX/rW+4Tm2zpkfRS
	9r4FNF+I83ZgCyI3SFXjziCSiXGWA7QlOtiYzxyjhCuKUDMepazI6MFbC6hEL92o
	09fS8pgjTci9Se+m7cNXGPkza/NwnjhcJlWATAIH1oZ3dJuAkS1v3C/Aspz0aoOQ
	jLSy8g==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3yw936tb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 11:54:06 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5bda959ebcaso100047e0c.0
        for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 04:54:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782820445; x=1783425245; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6UZR1WL72OWaE5Ay4jwPanIBNpFEw0HrrP+UEApYoJA=;
        b=IY47HwNFyQ3zAy7F0o6BHF7xBVR4TcTr/6BMxrYXcMIsp9evbN6bd6BKM8bbULsDiS
         25E5omlzmFwK8hBvSJCL+vCVt69g2K4wRQuf7sEHjR1/BR946qpA6bpVn3pgesymTlbm
         K4LBNS2p8wZtzsiqG0fx9t/StZIyugv8GPIw8BBFJTezA0cMwMLl47luhmzBvcClmqjK
         GSciIUqtdCqHiHiT6mCu5KMQTQm4AsU6SaKPbF/iIM+8+5yI95iq2tRyrSodwlJv3a7N
         OO0Vz4bcO+LN6lkAUURTjGHEkHHddQxBfrTObWJaEv6QNDC5F2M5gWv8fu/z1mwSciJU
         +IQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782820445; x=1783425245;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6UZR1WL72OWaE5Ay4jwPanIBNpFEw0HrrP+UEApYoJA=;
        b=IJelbOzyUE8LV4CB404xkglQRRR5MFP67nsTu9khbSENFtVNnbUPXS+ly2hdwz995v
         EtGeu9kp1KhvHC9mLcrxvkGVmEVbOBjRYxL/aN4Ufw4xIxgLoGsHilWXrJci1SDGb2Gm
         P5+iHJVqUdZruCCKIkawjsDhQSLzU4hbM1gMGAsKuB4ltGUMnU89jAgNh7bBvNhoBomy
         p3M5b4Vx4hLDoi6Vwcy3rTql7LMGp+XTruBFVoRzu01rwEhjK/r/ULjxxRRWFuXD5HLX
         Cg1DPnR18mAQ1vPqkPfA/BdI2MHV0gJoBFceEShhNbYCZfTXgq7CDXr+XchI+S1BlK2Y
         Hfmw==
X-Forwarded-Encrypted: i=1; AHgh+RrVoB8qyjruLcLl5GZ+wZCMZQHC2ZF5QIJUMJ9lfmljN1djNo6rsIbgf6o2k59OXUn8fyFwZ4IwAzC2@vger.kernel.org
X-Gm-Message-State: AOJu0Yyfl8gtIZPjfvgEk8Bi4DliFVZbokASq6Bsg2mXTZFF3rsMZwmU
	3+qS5ratDkVymY1Npezp9gyDQtMJFgki3YZw1PB9/2X2+l5x5ehYVvZ7I6HDDqx/SM4ur/7eDzM
	SqkV/W7bsqEcww88YtV4tWLzUMTDEATFfsyslVBVlwTTHAkKLWK1s+RqjLb3n+9E6
X-Gm-Gg: AfdE7ckt6cvWAT/8Gm8ruQ60o2vULOsxU3GKUggbgta5h9PeBEdznA9Bt+cmIV8IY6V
	hIuNdCW/PpNJLaqLM3L3BlEth2haPZCgTq/3OMCgIzW1nbu8PGQ3wOhtJmcjFMFG9RGd6xw06fK
	FVrJxtTVkFEmrr4jyxnmwMqnEqqVj2Kn72IU0wSfwp/Di/WZtmNW/Hdp0vMZzzha29ZMg4N9svq
	IymaT2cLdyi9rzWXytyhfq4UsuHskSUtvR95Buu0fxsAFFvzaQl+6HPxGgLz3hgI3Qeys+3FDIj
	fGasoR99V8k7SQthwJyNQmDE8mfuEIOuxxpPscchkhYyFM5/1Vnbqyuf/GuDk/hzq4jFxCDyGor
	4dJ4fLJJGNc+ij4BksZOymL5nIQxRgvmU5bw=
X-Received: by 2002:a05:6122:860e:b0:5bd:9cbc:93c6 with SMTP id 71dfb90a1353d-5bdbe9a7662mr469996e0c.0.1782820445440;
        Tue, 30 Jun 2026 04:54:05 -0700 (PDT)
X-Received: by 2002:a05:6122:860e:b0:5bd:9cbc:93c6 with SMTP id 71dfb90a1353d-5bdbe9a7662mr469991e0c.0.1782820445026;
        Tue, 30 Jun 2026 04:54:05 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6987c988e54sm1020131a12.29.2026.06.30.04.54.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jun 2026 04:54:03 -0700 (PDT)
Message-ID: <e3d73853-c547-4db5-bf65-cdd6dbdfaa9e@oss.qualcomm.com>
Date: Tue, 30 Jun 2026 13:54:00 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: sdm850-lenovo-yoga-c630: lower PSCI
 cluster idle
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260428-c630-fix-idle-v1-1-29d0da326eb3@oss.qualcomm.com>
 <57696ca6-42ce-46d6-9b30-cd5ad4378e25@oss.qualcomm.com>
 <d10fa5ef-4d2d-4fa8-938c-6ec74a823bba@oss.qualcomm.com>
 <e2c54638-2849-40dc-9c68-636c04719814@oss.qualcomm.com>
 <dc88df0c-0be0-4a29-9893-032d6c65a45e@oss.qualcomm.com>
 <574a1ab4-293e-4daf-bad5-8dd886a8178b@oss.qualcomm.com>
 <10f2cd7b-4f87-4581-8065-3c140ee473c1@oss.qualcomm.com>
 <nkv3q4nzsoew52ti32x3oy6tokjxgtjeyvq7kvwsyr5w5ztm44@kitmsxty4dqs>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <nkv3q4nzsoew52ti32x3oy6tokjxgtjeyvq7kvwsyr5w5ztm44@kitmsxty4dqs>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDEwOSBTYWx0ZWRfXwZl0UncQZdoO
 dSTR1I76H0pEzupVXmW0xmMgJyVVxXrY/xj431F0Y5aM8IsbkerjGICGYZBi2cOanWz611nXEt7
 yqA5ANtO1HycVNnXteE9yfqaQjUV/ZQ=
X-Authority-Analysis: v=2.4 cv=KfDidwYD c=1 sm=1 tr=0 ts=6a43ae5e cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=PltcGWh7eTJMZvgHKO0A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-GUID: PKPxEPv9MtTZyzYNkSY4BWU8NX_efd96
X-Proofpoint-ORIG-GUID: PKPxEPv9MtTZyzYNkSY4BWU8NX_efd96
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDEwOSBTYWx0ZWRfX7qVHKx80CAnz
 9PLeVu1O49RMLFBOFQnNBU0Uzcm5E5lWO5IzyYeXXIS2ayJLZFp0YnZYwcDP9AOx0RcHtMQREbb
 +5lZ2LFQtogBuqb8wIardy9Bn3DGrE2lY2M19EqXGVfR06fAS2x0Dm6BuVg1zjZMLQf5MteOSWL
 RSTgwVEGJs7n9Vvgl5VDMnzvn29oiX07VUbFT/XeUKlAvKIPxCLozPDsdcYPqzdojOwTAOcoOi8
 Qo00opWE+K11067lg4inYXm8Y+j8eqSkdoGn5IZgQC9Q+Hkr66upwIKEa3h6yHWE4qwM0xVBB82
 jsMQm+qtPmQK4LKvB9BEqfNjCnWizt4IeDFLREL1JZuhHgug8CsZNbHaPvQ6qugM9a6glZVGuWl
 PwbkaXl1/xN23mkn+CqawqmYqTJ65UBaRxUhealOFVfTxGpVhMn8VeGu7Y6ytvaYxbocfr7ScIa
 1kaLeEvSm2WYO0mlTSw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 impostorscore=0 bulkscore=0 clxscore=1015
 spamscore=0 priorityscore=1501 lowpriorityscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606300109

On 6/12/26 11:25 AM, Dmitry Baryshkov wrote:
> On Fri, May 15, 2026 at 02:15:55PM +0300, Dmitry Baryshkov wrote:
>> On 15/05/2026 14:13, Konrad Dybcio wrote:
>>> On 5/15/26 1:09 PM, Dmitry Baryshkov wrote:
>>>> On 15/05/2026 14:03, Konrad Dybcio wrote:
>>>>> On 5/15/26 1:01 PM, Dmitry Baryshkov wrote:
>>>>>> On 15/05/2026 14:00, Konrad Dybcio wrote:
>>>>>>> On 4/28/26 9:36 PM, Dmitry Baryshkov wrote:
>>>>>>>> With the default PSCI suspend value for cluster idle state Lenovo Yoga
>>>>>>>> C630 isn't stable enough. For example it might reset if display device
>>>>>>>> isn't probed early enough. Drop one of the bits from the PSCI suspend
>>>>>>>> value to make C630 work in stable way.
>>>>>>>>
>>>>>>>> Fixes: a1ade6cac5a2 ("arm64: dts: qcom: sdm845: Switch PSCI cpu idle states from PC to OSI")
>>>>>>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>>>>>>>> ---
>>>>>>>>     arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts | 4 ++++
>>>>>>>>     1 file changed, 4 insertions(+)
>>>>>>>>
>>>>>>>> diff --git a/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts b/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts
>>>>>>>> index e41200839dbe..e6c67016552a 100644
>>>>>>>> --- a/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts
>>>>>>>> +++ b/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts
>>>>>>>> @@ -347,6 +347,10 @@ &cdsp_pas {
>>>>>>>>         status = "okay";
>>>>>>>>     };
>>>>>>>>     +&cluster_sleep_0 {
>>>>>>>> +    arm,psci-suspend-param = <0x41003244>;
>>>>>>>> +};
>>>>>>>
>>>>>>> Is it better if you do hack in a
>>>>>>>
>>>>>>> qmp_send(qmp, "{class: cx_mol, res: cx, val: mol}");
>>>>>>
>>>>>> Any clarification? Then I can try hacking it in.
>>>>>
>>>>> This will send a message to AOSS to intrusct it to prevent CX from
>>>>> collapsing
>>>>
>>>> This sounds like a dirty hack. I think, hacking psci-suspend-param is a lesser evil.
>>>
>>> Yes, that dirty hack is supposed to help us understand why this is an issue
>>> in the first place. Especially since it only came around at some point
>>> (although I suppose you're not really happy with spending a day bisecting
>>> when exactly)
>>
>> A similar patch has, I think, always been in any laptop tree targeting c630.
>> It could having been a disablement of sync state, a removal of cluster sleep
>> or something similar.
> 
> And gracious ping.... Can we sort this out somehow?

Just to leave a note on lkml, we tried and kept finding more and
more issues with missing votes etc. We'll follow up with some fixes.

Konrad
