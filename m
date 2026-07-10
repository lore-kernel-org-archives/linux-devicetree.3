Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6F2242316C
	for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 13:25:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783689945; cv=none; b=h116fdhOiDcj5dnUZ6NNtVvIRosbSF1uSP6eEa+8vY7brEOfODbGwTTCN2+O1Flvw9BdYfBSZ5Mfm6QHv8DoPC0YyH9Nh41orZYfeoiJ0U0ZO8Jvk/8A0x/lldFcbyKLrt4P5WdFROztMjiApeuJzu+B5aVpVUMG0PIQliebmr8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783689945; c=relaxed/simple;
	bh=kNoGRkrXSexDoLIXzxRTcUzbyek9qkP4JKL0P9V2Qzg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=my4Y3JEcgf9hyqKJ8Y28BD3T86yjI+JXiixXg7rZG2486uwoIqy4i+mUFkLqSgR20yTdn4Y5BHEDPrTxElqxG/+DE2FX9J1zQnnaVqjBHPQJi7eUUgrdqoThDgT09C+rDCi2tpXkLGnrO0XxFC0JzyN3rV8npg59q9pgoWTOSJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JFrGLyTK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DASIEcSY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JFrGLyTK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DASIEcSY"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66AD6VEl874209
	for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 13:25:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FBF3onLMzZRTUHdMnf3N7vvKlSUcundPt3GHZSnwV2k=; b=JFrGLyTKe0GzNCTV
	69/HesZMfdEvUyfl/L1J+JFJ+Ot6aqQBpLM7kHMUDKnSFj5ZpC3GnywVyIv3ul+f
	VbFWhuzvJYI/IDLM9qtD8zs2Px0nFPR8mIIUiGeKjPVp3S9WD9oq5RgZE+GAAqlR
	MuYj3xIa1Y7KojhN8sFlBajy9obeufFnb7AKcJ4GmvXqp7FQu6hUQF9LwuP52Biy
	uBqqm0GBglu0kyrUiAcY8FDRFCWbD6NaXnd1tCA88LBfaogRZBQz1wCbGUsxH/cw
	cAcuSXOj0dyHAB/VoTVBNexqmmc7fDR9upeQU0/qyjFDI4WEMeSFDYdyIld3c5A4
	CiqxOg==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fax5f8t8u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 13:25:42 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-903694fd3bfso977536d6.1
        for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 06:25:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783689942; x=1784294742; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FBF3onLMzZRTUHdMnf3N7vvKlSUcundPt3GHZSnwV2k=;
        b=DASIEcSYkK5s+vqZgbVcijkl2vfZOI8djTbDHzoS7paUz92wpKePmF6tALGUDImFci
         NFYEDvFGf9GqsHBX9i+5QyY7o5Ca6FAPPNMpTIoNre13AqORTO54xWWHSzXboSLk4YFG
         gIy1oKkESKrBHHec6vENeOAbQ/X5CiffBoNZuUafsY8GhlVT/wlWy/U4kcl/T7/QD4ik
         pBH5zg9yRMQpgwX942R7/QwIo9PwnC8W0x78+OPKXvST6OmFY51Osu0O/dauRY1nWeK/
         r9/KRotZ4bbQcit+i4beAfDhlzhwu1DmwLAAD9aFHV6TzXrorPPa7G7H0h4r0okau8tY
         adwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783689942; x=1784294742;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FBF3onLMzZRTUHdMnf3N7vvKlSUcundPt3GHZSnwV2k=;
        b=SIcAShKZhXi926ur1Wq6FPSUjZqInfD2iyxEb0Jv2OK4hMPbM74p3iVId8xSWvNCSO
         wFOWJTwEOpT1yIykQlsTiCDIWT66O9gLGVqCVXGChaCOUoQNCSMNiaFqWbQd5yz9wi7y
         8qDleYohmc3dtgyEY65aDAEqta4C/tac1gHE1nSHcUaiFLX5Faz0PqKfASaSvo1rdHi/
         mdQVtNon+aolyYmOCfcY6xANR/KsQsO7RGmOZl3m9kKzszyF9jJRDW4NeplCvwSGt1hV
         KOsAsdMvvbJi2tGBeYDXHCdHeMcMzzHrZF54YIeJKDWUkpc+oeYx6TbYazWfVLaOoP3a
         iGBw==
X-Forwarded-Encrypted: i=1; AHgh+Rok/JW1wpMTdsLHxQ4/NUxomh6whP0SOB/314a9sdOmok23EcpGShu76YQRHaWxXFEPipfk/S86hx5E@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5HVxz9he47Sos2DjAx+DS0KjyldpjaiQz3hBLnmah/BKuuE3c
	3E1BoB9RVmvoPgXG7w+x7OlhL+LWa00QoQnNjAUB49K1ho04f5nv0QnBkkSODggx9FpTRRgzrhM
	3OfnCfcqCn2w0CaX40v1eLYmK67ovhpIlCMVfR+A6whNA7JRDTPsJNF5X8XQcjcDF
X-Gm-Gg: AfdE7clX9dldWp9RLadMWVDaUQBXPWc+wZmq5bBq+SjCtdo/cybwwiw5lhWBRXkyljP
	3Xs99X44Sv8O++1JRF4pK35a76hZTODfT9TfOY7LyM3zoL1KmxN+DYcV7eSvyV1WJ7RA7cGyJ6b
	trNdWa6s8pssNh/tPi3GQNQsss/vbkuTz+ySU5CifE+lrvhTuxIZUP9YgjjYUQBkiGMCNhxNY8j
	laBkchdTC3yxeRvuT67MFq6+CY1tbXAjiqwB41HgXOX3HO9keai4FAbgLa14tamp3Apej29fUM0
	vb5A08cycMIUdnnHtEgbF3LCR/PJ5WnTTdQRg4eCAYBVX1ptO7hnbDGrwcG4eyXyM54QP0K1+Aj
	fPi+ZJSJwp0qEPKuiKhvLkpBJTIMQzRkMRTA=
X-Received: by 2002:a05:6214:440a:b0:8f1:ce6c:1385 with SMTP id 6a1803df08f44-8fec6244c20mr100585536d6.4.1783689941888;
        Fri, 10 Jul 2026 06:25:41 -0700 (PDT)
X-Received: by 2002:a05:6214:440a:b0:8f1:ce6c:1385 with SMTP id 6a1803df08f44-8fec6244c20mr100585036d6.4.1783689941392;
        Fri, 10 Jul 2026 06:25:41 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69aa6dba523sm5449418a12.0.2026.07.10.06.25.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Jul 2026 06:25:40 -0700 (PDT)
Message-ID: <f83556e7-dbb1-4926-a2a0-4690cdbad941@oss.qualcomm.com>
Date: Fri, 10 Jul 2026 15:25:37 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v4 9/9] arm64: dts: qcom: glymur: Wire PCIe3a/3b to
 shared Gen5x8 PHY
To: Qiang Yu <qiang.yu@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong
 <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260518-link_mode_0519-v4-0-269cd73cc5d1@oss.qualcomm.com>
 <20260518-link_mode_0519-v4-9-269cd73cc5d1@oss.qualcomm.com>
 <ab21f1c7-f861-4961-9287-84cae280d8c1@oss.qualcomm.com>
 <akH9LKxqhciznM2x@hu-qianyu-lv.qualcomm.com>
 <ae2e1bdd-59b0-4ff7-bd6f-ddd57267c2d9@oss.qualcomm.com>
 <alBWrK8X7fW+UC7L@hu-qianyu-lv.qualcomm.com>
 <6802dc29-d783-40df-bbb8-8b2dbd94be29@oss.qualcomm.com>
 <alDvnSiplhEg2yhD@hu-qianyu-lv.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <alDvnSiplhEg2yhD@hu-qianyu-lv.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Ab2B2XXG c=1 sm=1 tr=0 ts=6a50f2d6 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=3ei8xVDPt9LJxyTjLcQA:9 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-ORIG-GUID: IWSs3pcDPoI9MktQssbMgLkQd6K5hHeo
X-Proofpoint-GUID: IWSs3pcDPoI9MktQssbMgLkQd6K5hHeo
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEwMDEzMyBTYWx0ZWRfX/iT22bPKMWDB
 1dxncuiCb1t8L0FOGVFt4MhY1OETa32J+RU7oBQ4JawszgGr2i7Dn3Xo9w2Hx/03yJz5+ebKFfr
 GD+phf9Ek/5aMQtLAMvntaO/bLZjDR8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEwMDEzMyBTYWx0ZWRfX4kpOrFl/RAAE
 JQfN2bMIGmpPRy5QrQ+JOqOlUl62Ah0CB9ObnrTFKCTEJewokrDpL3mSBbmGYOAjTtBl4bZizhy
 qVr34rfuq5JD3/wFbQ6qSzsdmtH2LUujK5iZs0+tCcoTAU2aub3aGS5AKkeL95XPE5OjouWyrj3
 O2E2oqB6TKuyEpQILHG/gzIkA4rA0uVg91Xo7X4wb2YmR1RF6VDphhuhQYexqqGClnno/kZU4oW
 ygfSCkA32zdTDn/7ksseFPzrxyqblbGpYWls6G1iIz3285FSF9XhO/ILnQTXYdguvNgIZhAZECB
 fv9M6ALOOrNiqoLu0nv1eF4YqVAi/c7s7oQehgBrhIBGhYdeAknQyt62Uw2QJaTNNne2ngCcWjL
 ylIe+RuQyUeSquU8SY1u4RE4gsOGXYv1vRIgfHWyx9b7B8h7DnxQNJBsCqkYHJuW8iLf0g7UdLI
 bkHPc/iKIuJCP1WcteA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-10_03,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 malwarescore=0 phishscore=0 bulkscore=0
 suspectscore=0 impostorscore=0 lowpriorityscore=0 priorityscore=1501
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607100133

On 7/10/26 3:11 PM, Qiang Yu wrote:
> On Fri, Jul 10, 2026 at 10:44:20AM +0200, Konrad Dybcio wrote:
>> On 7/10/26 4:19 AM, Qiang Yu wrote:
>>> On Mon, Jun 29, 2026 at 11:20:07AM +0200, Konrad Dybcio wrote:
>>>> On 6/29/26 7:05 AM, Qiang Yu wrote:
>>>>> On Wed, Jun 17, 2026 at 01:19:49PM +0200, Konrad Dybcio wrote:
>>>>>> On 5/19/26 7:47 AM, Qiang Yu wrote:
>>>>>>> Glymur PCIe3 uses a single shared Gen5x8 QMP PHY block. Model PCIe3a and
>>>>>>> PCIe3b as consumers of that shared PHY provider instead of separate PHY
>>>>>>> nodes.

[...]

>>>>>>> +			linux,pci-domain = <3>;
>>>>>>> +			num-lanes = <8>;
>>>>>>
>>>>>> Is it fine to keep num-lanes 8 here even for configurations with
>>>>>> bifurcated PHY?
>>>>>>
>>>>>> I would assume so, given essentially this is a x8 host, whose 4
>>>>>> lanes may simply be effectively NC 
>>>>>>
>>>>> Actually, on existing platforms, the PCIe3a and PCIe3b controllers are
>>>>> never enabled at the same time. When PCIe3a is exposed, it is always in an
>>>>> x8 slot. But if we have a x4+x4 platform in future, we can simply override
>>>>> num-lanes to 4 in the board.dts.
>>>>
>>>> My question is whether that will be necessary - if yes, sure, we
>>>> can do it, but if not, we can conclude on this early and not have
>>>> to fight over it in a couple months
>>>>
>>> I think we do need to override it in that case. If both PCIe3a and PCIe3b
>>> are enabled in x4+x4 mode but PCIe3a keeps num-lanes = <8>, userspace
>>> will see an 8-lane slot. If an x8-capable EP is connected to that slot,
>>> both ends will advertise x8 support, but the link is up at x4. That looks
>>> like a genuine bug from the user's point of view.
>>
>> Do we know what's advertised on x86 PCs with bifurcated lanes?
>>
> On QCB, it advertise x8. On CRD, PCIe3a is hidden.

No no, I meant to ask whether we know what the userspace gets to see on
e.g. an AMD system with a bifurcated slot. I would expect that LnkCap
may report a different value, but not necessarily. I would assume we
should probably mimic whatever that does, unless the spec takes a
stance on what should be done.

Konrad
