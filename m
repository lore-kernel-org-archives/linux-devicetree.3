Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF41D3A875F
	for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 05:35:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781501708; cv=none; b=oSjA4NPxxVjLGR7lN8MJkFt7GNS+R9pNv7mWE67WxZEF8n5gRvpv2KhzwN3eJ4WusVsz7b5QltwwfuYf9+ULl81Tkx92TyIQ/1zmg8CxEtd7Bcp21kXcHvmdB7j+7sMP/MQ/2fm6NUQYqSue8jOLZuIi3fkiXvTFP3mJP7TYR7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781501708; c=relaxed/simple;
	bh=xAVH9CLbHxCJVbEkFG+t/rqI6FJKD21DENEMJdE0V14=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BN3Hm7x2PO6dMmIwwPCgbkk1BQNEoWB/It+YV/GJ+TQqvi9r6STZCRw8wgAfCGthpfOI29jBynYb5ObkxdCW0+ZG1bvFtYgCQSefjAv3fmn5mjTeLHBWOqosMotkHW2LDTjrrPzpJrJnv68AjisGg1PqEb5UfNdlar0QRF71+ps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=im+Ci/qH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Xnfjhqd2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="im+Ci/qH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Xnfjhqd2"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65F1jKYm3244349
	for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 05:35:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LU+hghORQXDVk0u4Z9joMyesALG5eF+oWNtk79xIUXo=; b=im+Ci/qHDG1GNJ6J
	kwnjPeIp+16ST/V0lX8/8g87hVOKRdXvdfk2NoAWA6xFyYfg1HLYn4jzW4PH9dZY
	SO9qjtCe1Ie2d/9MVAh7aqJ1sEPVi7A6mBhAwXDIwWJ/k2lWU5002X563Weohr1V
	A8fLg0AO0+YqtLzubPZ7t2x9LqT4XOlsMI7z4rpB8OFOZglJENu9B2wJR7CINp/i
	UXuECgssRzSBUfRJX2m+NQ6i6osprZz2AJ56VQ1lqd6jjfS/aqLixNeG3sH3VUeQ
	/ZE4XxfqnnhP9mZLoa4vtRtBd8x/UchzIFP1sL+R5n9ZG7iiuDe4QYzD1D0JhZoT
	F/dr5w==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ery7gwr5e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 05:35:04 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-36d982d932aso4017693a91.0
        for <devicetree@vger.kernel.org>; Sun, 14 Jun 2026 22:35:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781501703; x=1782106503; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LU+hghORQXDVk0u4Z9joMyesALG5eF+oWNtk79xIUXo=;
        b=Xnfjhqd2MItOXeNZd1blUi2Io5rRDEc0RNAwTwT0cDn3CgkiRRPI12jXXKKwPwKQ9f
         h+7UG9QvZZ9pJB1212mL9hnU/gDKfdQre0G87yhdy+USMMMFOhhreNf6M28BRi2nqWBP
         ERvzHH8t8/dVKdISs+uczcPjGiuuKO0lwd984SEJLwgUROTLqJBO/OQqpstr8adJS1Lp
         SNkm2EP/E4cwDH4W4Xh+kaMxBhQrOafDIJyZiMd1xjtIviZ+u48SCPe+MJPFuHbxGvBQ
         wszh7dZzqFZcbAs/5IuLhrnV3qlz6k9XVnj3auCLK328AwPZ+sSpoIUGLMNeBK6kuJ4q
         t7Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781501703; x=1782106503;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LU+hghORQXDVk0u4Z9joMyesALG5eF+oWNtk79xIUXo=;
        b=IsaLjVh3JF6Qo9ZgNC5FDjxKg2aVR9kuFnCybABIJeGQOU6Sk+LUpLMZ4TK0JnlPW4
         B0313aIV629Nr+RaY/Lg78qym3QcLTo0uHU03Q8vBdQjJ6AaVenCYFwNt68BhlWh5C5A
         rdH4F9LAQUynkZZj8Yw/9emzxnysaTs1qt8hi6Q7A0U0zycCmgMmIQy30CGW5BTA6yzp
         YdaAjBMgtLoCSHZzWRf2227AwOZj5LSBQklICLGnF1ZOogB5vSO+SX8vgFKUeQ5CWnTF
         u0RuT7IbjejEn41MS/KpjM0+iIwc4yx0Le+uKGzpJzaLdpz13KwaBThWgNgjuhvJRnME
         D/YA==
X-Forwarded-Encrypted: i=1; AFNElJ9X0SxQRIT0tpl7g669J755pnJZUi5L38fjkCcf7ZRa8ZZokTtKd15cuGML5/YTQy9ZH8zeN7F2QWCT@vger.kernel.org
X-Gm-Message-State: AOJu0Ywr7fJbobassxQruNejH1Net+Ispne6VW8HkqWALo8K3IAh8eE6
	zf1n7pCO5oVJf3HKzfZJxzpFygVkN3dCZWgsfjvzqIeI1dszHW2s++UqQw6+iuuSKLfENplsOOX
	qeNjFW1NmzeJjPGj8gongg0S16J/cBDuLlKXO0GOFE0t4BpUTp1f4dLGZ8vRoqlVJ
X-Gm-Gg: Acq92OEpbr9CZE7gS5p9Lem6Kd2U+ssU215Uv3sVkm0p/vqPOhMCSauuyaHTzb/R/yw
	VCqnbHYnRlokolW7UcTFaoOLQeKz7oo3xv5jrnWYJXHfYGSVTvyEFp8ujtLWECuaBnGWDBRalgw
	i9PVj43mEmgyWCYh+GPaTNrrBvPOHaCYDz2YblXnXqv9V1xSriMgNOC4Hipmu8+ol/kpiWrssgz
	sZoT5FYZuddfPHCS0yRIjXXrJq/xRi0RjN0H3Y4WujMYli/fc2pU0ofLlPc1Tm7Rl4yvhPAsx4s
	Pp+A2HHoRX6GyU/TKl4LePI0z4SM9et6vIQHlDe4RQd/SNVEfB599p1AQNNnvO/VepmfMuwxpOc
	Gb72y2Hz1WkAHVyU9mUMTECqsqj9ACB1aVQsmtdi3Kw5sVeV12lI=
X-Received: by 2002:a17:90a:d40b:b0:36d:6315:1de4 with SMTP id 98e67ed59e1d1-37a036ea1b9mr13512470a91.17.1781501703247;
        Sun, 14 Jun 2026 22:35:03 -0700 (PDT)
X-Received: by 2002:a17:90a:d40b:b0:36d:6315:1de4 with SMTP id 98e67ed59e1d1-37a036ea1b9mr13512426a91.17.1781501702806;
        Sun, 14 Jun 2026 22:35:02 -0700 (PDT)
Received: from [10.217.198.242] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37a233f58ccsm9379806a91.3.2026.06.14.22.34.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 14 Jun 2026 22:35:02 -0700 (PDT)
Message-ID: <454dbbcd-b0a0-483d-a21f-df6a33722a5d@oss.qualcomm.com>
Date: Mon, 15 Jun 2026 11:04:58 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/8] irqchip/qcom-pdc: Configure PDC to pass through
 mode
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Linus Walleij <linusw@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
        Sneh Mankad <sneh.mankad@oss.qualcomm.com>
References: <20260526-hamoa_pdc-v2-0-f6857af1ce91@oss.qualcomm.com>
 <20260526-hamoa_pdc-v2-5-f6857af1ce91@oss.qualcomm.com>
 <73f700f2-7cba-4832-bd06-e82a7fd51a7a@oss.qualcomm.com>
Content-Language: en-US
From: "Maulik Shah (mkshah)" <maulik.shah@oss.qualcomm.com>
In-Reply-To: <73f700f2-7cba-4832-bd06-e82a7fd51a7a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE1MDA1NiBTYWx0ZWRfX+XCsedBj0foA
 RJAYBGftbJieR4QmqqU1uyERPeyFuQ8cld7E5fUbyhxJiWwItNrLoEgOGUev3J6j6BUYuK9odRP
 kPa6v7o5Us72g7i9PUjbCTjxk6RE+oQ=
X-Authority-Analysis: v=2.4 cv=fLYJG5ae c=1 sm=1 tr=0 ts=6a2f8f08 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=oNLwIrGxYuMEB2b_hKsA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE1MDA1NiBTYWx0ZWRfX8YC4wOxhSPQl
 QBaLIWKKX1Zxy3gSS9N0uNrMH+uSSAwqMyXthzXWuaCWPESTp+OaEZEagGCBJSsHRP+Kmz9jnjA
 ifd2vaZXLfhyxPBQVxXn7f1gpQ1LiuJDtgj1FQiSlrQTz2VqsYU2D3vFM+kesyVxJwqcBmngqlH
 9KfB3HfKVtF+wysxs8IV5dm+HofkS3k735+hT7n64CIkMqkw4dYEy/U76MaFOo1h26Dk27QITEp
 ug65KNbyjGjT5bxJzpzxxsN3J/xb59//z6sLlsfmm+aieivZ+N5wVM6jc7p39knq8MW2WF683Ps
 Xk4BP4uwK4ENfw8P8Gz6NUUENcPGu4E7GmkbEsrq62UiyJWMvYMKhJq7pTOvTECGP/fRBoO8hK8
 0uidyq34emRE01WP/9iDdl2beT2CD+xDNxC8M0FLKFw8Wf/0dd9CJEdoPgygr2szp3tjbeDGfcV
 gEsnUlOJCkIkVO5BaDw==
X-Proofpoint-GUID: 6pR4J1Th4JiAMacgfiV3GrnQGYbiyuu6
X-Proofpoint-ORIG-GUID: 6pR4J1Th4JiAMacgfiV3GrnQGYbiyuu6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-15_01,2026-06-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 suspectscore=0 priorityscore=1501 clxscore=1015
 malwarescore=0 impostorscore=0 phishscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606150056



On 6/11/2026 4:35 PM, Konrad Dybcio wrote:
> On 5/26/26 12:54 PM, Maulik Shah wrote:
>> All PDC irqchip supports pass through mode in which both Direct SPIs and
>> GPIO IRQs (as SPIs) are sent to GIC without latching at PDC.
>>
>> Newer PDCs (v3.0 onwards) also support additional secondary controller mode
>> where PDC latches GPIO IRQs and sends to GIC as level type IRQ. Direct SPIs
>> still works same as pass through mode without latching at PDC even in
>> secondary controller mode.
>>
>> All the SoCs so far default uses pass through mode with the exception of
>> x1e. x1e PDC may be set to secondary controller mode for builds on CRD
>> boards whereas it may be set to pass through mode for IoT-EVK boards.
>> The mode configuration is done in firmware and initially shipped windows
>> firmware did not have SCM interface to read or modify the PDC mode.
>> Later only write access is opened up for non secure world.
>>
>> Using the write access available add changes to modify the PDC mode to
>> pass through mode via SCM write. When the write fails (on older firmware)
>> assume to work in secondary mode.
>>
>> Co-developed-by: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
>> Signed-off-by: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
>> Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
>> ---
> 
> [...]
> 
>> +static inline bool pdc_pin_uses_seconary_mode(int pin_out)
> 
> Please add a comment somewhere near here, repeating what you said in
> the previous commit message (about the SPIs being mapped first, followed
> by GPIO-as-SPIs)

Sure. Will add comment in v3.

Thanks,
Maulik
