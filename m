Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAAEF2FDC53
	for <devicetree@vger.kernel.org>; Tue,  7 Jul 2026 09:25:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783416354; cv=none; b=CBjeWPuORGu1vJuACMUxMv1GxhlYeP4KQxGppHdDAReH66a1SDNemYHhWh+W1dKKSpp6NEByToguFvYJMgq5qS6iMvDdc5WgnKKBWW0zdbG0mIo0NTBFuZcz80bNPLJQzODY8YiGVGL/+hL1LccJPKfpBjEJ5bQXDgpStBq/moI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783416354; c=relaxed/simple;
	bh=8u5TXK8TOMHPdRbgVUVk6ykiI7ce1wWjUAbPMM7PSNE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rxka3ZNlId2r1m5U6KC0r07t+IlnLQqSixToixvPmVRF2bcjYLjHlwF0/rIVZWMThC/ZvrTmz1tdgcdo193Pm/FpgromYFXX2Fa0nxY4Jy53Ygvljo55S34dGmIKbYRplcqKne4q7e7NNqYY5tTIdEp+mjljiiocoAKpYtEj/TQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XIdYgaNr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=csGRIu6O; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XIdYgaNr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="csGRIu6O"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6678Dj5N3138631
	for <devicetree@vger.kernel.org>; Tue, 7 Jul 2026 09:25:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YwwEDgWEuwlmaDa5fWfSopuuNkC1OD8HXfqxYTcIzFQ=; b=XIdYgaNr0+eQbL8d
	rIaqxwIajMkmWM5XtQZVpT+9M2MTy9+N039DxzeRdbXBeuTFsG+BSMsyJ9TN/yLY
	RQPlomap11GJGvVIA88EG/my5sJWZ/EaXAXYsI/sSc8luzZcWYHOoPtGbV65+pJY
	hObbMQDYNPo2lCsVuCCXkJDOISI1QHA2vkdchVkdHry1hiLtm7bbZPS7PW0HjIhR
	wEkxg8DZeuel53oeDkdapO/2f+2iD9o/sBPpvzPEXECbsykNEQXhLl1quPDZTPk3
	2M1bFD3z2ySY17Fvgp+T8GN6doUbBtckN1c8x5aHERq8NrtYND+vb39yec7x9FnZ
	vKQ9iA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8t159833-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 07 Jul 2026 09:25:51 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92e7579ded2so56447685a.1
        for <devicetree@vger.kernel.org>; Tue, 07 Jul 2026 02:25:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783416351; x=1784021151; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YwwEDgWEuwlmaDa5fWfSopuuNkC1OD8HXfqxYTcIzFQ=;
        b=csGRIu6OvWUxsiMxE+E4xVx3TE0Ytn8kQq2LjpDRvtr4wROQXp76mPjrjBXTeGridT
         oNRFloCHLssrlNHQIc5wnFn2Yi5p7i/ono2joQ+Hfudo9ypBEQrOG48n70/9QMpLRrO0
         QVNypGftxpDiIhaJsnPm80tQqeBhl/6YOPvgeaU0jMG9OyAOHvAWBtCFxSAioHp4qBpU
         xDK6pBkIycfher2c8FnB+vRjmKq2oo/H8/Gn59ja9PJv/D2L4UdzrTcIgkCczoXGc3On
         V7dmLqESi8NZzrzB0haRV7fJcXL4zICO1MuiHFBHPJ3eVJ5PXZAp4lYsPNU5At6VZdB+
         PlJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783416351; x=1784021151;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YwwEDgWEuwlmaDa5fWfSopuuNkC1OD8HXfqxYTcIzFQ=;
        b=BG7FoYtc8aTvAThr0wVHvWPoo+jdMBdEmU1z/fnELoiagAP11pde5h5Be4N9fGEl13
         8PE8f8bxq2iyMRgayCEh+lTLOFfByru3OnaBXRCfsuXvhklBpTFkCqRHAKAa/aD5R7yf
         vjW3GyG50qDI5uBGEbgLXC3J67lOZ75oSVefWcbJTV9GFsFTAmRtEZvrugGDjWmV+m7P
         LHE49dB8679rz1ye3GDBuSOSZ5JyZqdfa96VBFreoYZsH021FjnE/+yYcjZY9xo8/4NG
         1vLDy8dinT6HSH0hCVt9uk/mk9bwXT1MPZbKb4y5rsbidJbWv5jmI+tBYiNCbCibsc9E
         iv7w==
X-Forwarded-Encrypted: i=1; AHgh+RoPQAY0x0RzIswKfDjS9M+qJbuXTtXpNgAyNNSmnnahWSpDpcRlG0xdtgFi52S63bi3FUpYlDxAhBdd@vger.kernel.org
X-Gm-Message-State: AOJu0YwxUzT9N6J1RUiqttQFhNR1JW12dklBm6MvwKGH7MNF5aAW7gMG
	EA/SFmgH20Wmh1IV9j7SmJl4c1nouZDdZz6mMnqQcdtnPgvDcsDy+9cCEThp4xAzi1rDe9MOb4l
	ydsOpZ/a+Eu0C97l22i78D5i1tcCRxOHa1P+F5crJnkJClazY28bOoe9ygtxyv+nf
X-Gm-Gg: AfdE7cl132wx6gGpLddJBxGVXcqy3XzwSYql7XP1ot/VJMGIz+3bfr1VJSUt+/7FIAQ
	7nlLPMOIlXnnt0WamI8/nPHiAvTsoTs1QJYURHyNc5KgcRsSBbIJSgP1loN6BHqnB1HfqMsLXz0
	apShvyYiiL94ehLDDWfhrKL50AooFOUx9CgCrPO5QLWrc48VXK7Ep82mUSfTAEWQJqFJhUFOwEw
	2ZR1gqvFPvUVeNT938z3tq/I5Zu8ryeykpkDldDNlOgJh6eWu0R6KT7aHhiA0ZRaXiHivqkmues
	RzBVbYtut3/rAdC1ZThOgLg6KlrpsltcFuPkAYHqO9ZSau46Gpu0h/oke8O2DADKPH+oZ7JicwP
	Wfs0oAwE1R3jGLrz18eJ9uL6WfiLMHO4U0cc=
X-Received: by 2002:a05:620a:468c:b0:92b:55d5:ba3 with SMTP id af79cd13be357-92e99e22b32mr1110581685a.0.1783416350975;
        Tue, 07 Jul 2026 02:25:50 -0700 (PDT)
X-Received: by 2002:a05:620a:468c:b0:92b:55d5:ba3 with SMTP id af79cd13be357-92e99e22b32mr1110579885a.0.1783416350399;
        Tue, 07 Jul 2026 02:25:50 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15ad9bca46sm92339966b.40.2026.07.07.02.25.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Jul 2026 02:25:49 -0700 (PDT)
Message-ID: <abbb47af-732b-45e6-9a5c-6b58b14b74d4@oss.qualcomm.com>
Date: Tue, 7 Jul 2026 11:25:46 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/4] arm64: dts: qcom: Fix pm4125 vbus regulator
 compatible and constraints
To: Rakesh Kota <rakesh.kota@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        jishnu.prakash@oss.qualcomm.com, kamal.wadhwa@oss.qualcomm.com,
        Krzysztof Kozlowski <krzk@kernel.org>
References: <20260706-add_pm4125-vbus-reg-v3-0-999d78a87b81@oss.qualcomm.com>
 <71tt4ete2nCnQuCLAao68H3X1IjhICYvh8a9Y14WT2pr_opABqQnPif_6w1Mmdw4cDCUUB7i6t4ApGyUdHPdRA==@protonmail.internalid>
 <20260706-add_pm4125-vbus-reg-v3-4-999d78a87b81@oss.qualcomm.com>
 <14be441d-7223-46b1-9292-fa73ae326ac6@kernel.org>
 <20260707083319.rwtnt4l6so3kdduo@hu-kotarake-hyd.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260707083319.rwtnt4l6so3kdduo@hu-kotarake-hyd.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: YeubarkaLCxBQPhcClt6zYfa-FTIZcrd
X-Authority-Analysis: v=2.4 cv=HstG3UTS c=1 sm=1 tr=0 ts=6a4cc61f cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=SRwHIEZ_f2MesP5_slkA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-ORIG-GUID: YeubarkaLCxBQPhcClt6zYfa-FTIZcrd
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDA5MCBTYWx0ZWRfX8s5SesrvjZHt
 i2CkPHujRz4JfzRmayvLlksvbCvoogCweSHQRgz5evogqWsqYhmGJ2CvQ21HcZZT3iyA2XKH2wW
 xXKD/Vb7G2Q43IwzlNpTx0OORRlE8jM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDA5MCBTYWx0ZWRfX6mPZiDnXbvDY
 eBO8C7Ulo86C9DrEASwzns6UO+0iZq1FIIRCmd7txb2laSUAKPPaqaSWMHTRkexDAhgVdPLO8c0
 5mWdql+kP6DZAaAsxqYLgO/x4kFzMCBZYWTPkuuW8AjgeBIa1CCAlzGVYPYaMjsdN+/Nm4iojSB
 8H3rZI/H0/JBjDVJC15YDL7tI7xkRRB0B6sEkGN4Nbwtv/2AemfXbchG+WZ38bgMBqagoyOd8xl
 PLsij8xiQdek3SVhMVced+P1DABV9ROpiKhxvGp4vLLpnxFb3P8gqT6vLgGf7W2aMPEwSNj9TAU
 6sCzLMawLBUNwp5asJkbDgo5n41iMSbq9DuqHguIhbdKhflWS4yiikKHODBr9f4bXY2LIRVL0qR
 /QdJzBPrwQitzQYVRBxTV/mSKJoggjVaky0QS6nrqivamOr8iUgKk6k+qLOIUePtzGgHjvJRXpC
 TtSGkafZ8drxzRdoERw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_02,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 suspectscore=0 malwarescore=0 bulkscore=0
 clxscore=1015 spamscore=0 adultscore=0 lowpriorityscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607070090

On 7/7/26 10:33 AM, Rakesh Kota wrote:
> On Mon, Jul 06, 2026 at 02:49:33PM +0100, Bryan O'Donoghue wrote:
>> On 06/07/2026 13:31, Rakesh Kota wrote:
>>> Remove pm8150b fallback compatible from pm4125_vbus and fix regulator
>>> constraints in qrb2210 DTS files to use microvolt instead of
>>> microamp.
>>>
>>> Signed-off-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
>> You should break this patch up at the "and"
>>
>> One to remove the fallabck, one to fixup your regulator stuff.
>>
> I understand the preference for splitting at the "and", however
> splitting this patch is not straightforward in this case. The PM4125
> compatible and its regulator constraints are tightly coupled in the same
> .yaml schema file — if we split them, dtbs_check will fail on the
> intermediate state.
> 
> I've confirmed this locally. Removing the pm8150b fallback compatible in
> isolation causes the following schema validation failures:
> 
> /local/mnt/workspace/kernel_versions/kernel-checkers/linux-next/temp-out/arch/arm64/boot/dts/qcom/qrb2210-rb1-vision-mezzanine.dtb:
> usb-vbus-regulator@1100 (qcom,pm4125-vbus-reg): 'regulator-min-microamp' is a required property
> 	 from schema $id: http://devicetree.org/schemas/regulator/qcom,usb-vbus-regulator.yaml#
> /local/mnt/workspace/kernel_versions/kernel-checkers/linux-next/temp-out/arch/arm64/boot/dts/qcom/qrb2210-rb1-vision-mezzanine.dtb:
> usb-vbus-regulator@1100 (qcom,pm4125-vbus-reg): 'regulator-max-microamp' is a required property
> 	from schema $id: http://devicetree.org/schemas/regulator/qcom,usb-vbus-regulator.yaml#
> 
> This is because the qcom,pm4125-vbus-reg compatible requires
> regulator-min-microamp and regulator-max-microamp to be present per the
> schema, and both changes are needed together for a bisectable,
> build-clean series.
> 
> Could you please advise if you'd like me to proceed with the combined
> patch, or if there's a preferred way to structure this that avoids the
> intermediate dtbs_check breakage?

This change is fine as-is.

Konrad
