Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 924513F65FF
	for <devicetree@vger.kernel.org>; Thu,  4 Jun 2026 09:02:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780563721; cv=none; b=DMleSA2NhE7RoH8Cajo5wEp5sJcZH0YmrBzvfnHtrA+CXENZi/ZiGa0X0CMLnCo1AiJMYiqAGFZUVEr3u5sRIsAaKRCdl/ag6Wdb4iv354ROvT1J9vKUB0+VZ6qcF3Ae7coMwyR1K9n5rKgVW4Y/EmdtVpj/8BLYohuy4Ko7SeA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780563721; c=relaxed/simple;
	bh=uPk6FtmVWMI7jTXHIH/rPB8H7e/eCSP33+M3NBqIOF0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PVjJcZNShPI0PaFMXghLdtEnin51dv8I5ZA0po8swdaUOMiTaxcEfIjiEs7NhRom+OrMs2LrgZ2QOBYaSCVidbt8R4rZr6X/bCTcPlittH4ojTYSOM/ushSHH8EBwWmB8tOy/t5wJOwOhtL02HQENEexghTrJBWjjEQRuYIk4g8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=p3a6ujdW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=D5JRFZMI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="p3a6ujdW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="D5JRFZMI"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65452SA31039343
	for <devicetree@vger.kernel.org>; Thu, 4 Jun 2026 09:02:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UmVGnrCXAkShVpVSqIoifGKYR2VrcsjStPpiVothuy8=; b=p3a6ujdWj/i6PMLX
	EJ4CI54NxwYkTB6FNwKcs5sxZcdjmW2pUME8VlRMWLl5zj756B/2Exc1j9xWYf5f
	/rwUvH4II0SDerry2erIY9rJgNOPkvpmVVHGCwiI5rLarZ+/dPRHfPAsdEiiqu3b
	ig6JOetF3CSgm5P6nEtyo2S44rV+QSJIB7qDRzubHGuC3hP2kZt/ZmRTP6l9crSu
	y7tXNx9eb6WcvsplETvE9KCh76Yy5Ckak9ia+LGkPazqR5p0O1gl1LvS2EJ/EV+0
	un4ip97ZLOqRYpjSLpv/pI21q2wvQkgeigd2PVtqWQ6vWybBZrRj8U8pqN06oDd1
	2zU3Mw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ejtj8jhr0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 04 Jun 2026 09:02:00 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2c0c3315d31so6515145ad.3
        for <devicetree@vger.kernel.org>; Thu, 04 Jun 2026 02:01:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780563719; x=1781168519; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UmVGnrCXAkShVpVSqIoifGKYR2VrcsjStPpiVothuy8=;
        b=D5JRFZMIofrJDYnja7uLSnAymJ6FwuXQdDqdkVlLE6X7Irvefj5Ikw+3lXKHu7tucq
         1UP+DVlSWHh0nxGN+Kyq/Pd19r6KDng0Uc4ae4dkoHCuSGv7cW3k50ZPcUNUQol0e996
         1vlWWVliX/6e8aCVrLfS7KDHdQLi3AkO8KlEM5LRE270BKwGBs1Y4E8nSzZPGfl15mYx
         fZfIZLveErX3aNNgrCvaSzfcAUXdIR63Cd0JKUCAs0A1GAY/oxfyNW89QAQwmgqYZEUX
         e9H0LPU0Fs854Zsa9AIs1E4zIIoR6961KJ7h0ei8MTBHO97UnBnAzSFwLJKHYM/ztPWW
         C/Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780563719; x=1781168519;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UmVGnrCXAkShVpVSqIoifGKYR2VrcsjStPpiVothuy8=;
        b=rl5Gbuj5Z/e/rQR0HZ+ghTQoofx7R62+A2nvb19P95oKJH8aNBN2hIWpQ+3tSC68lA
         9+LNdD9EJ9zajLq3I6iLk8zoV9XxNCvTceEdoSAAJTTuDnOVMrKd08Jj+E5Ppvz1L2Io
         36LOabDro6LcAaG5h2P81UCM1rKTUaVDz0zYacJImlUsMeJ9VLmC3PvH9FKVkTuMAQ7i
         lK34mzfACRngydAx7N4tRhJc6vtMCLiqazwtC47XhvyBciWHESYsp+DZm9P4JmtyWrb4
         gzG+P4r1Gy9wNJvUBaCs0UgtTLzVJmWUnry7J/my69BlWm9rFFbCJGwLSPu631xPIjxb
         X7eg==
X-Gm-Message-State: AOJu0YzVGbXU2gf1QQoYvCDdin+YvuP1VsgHjgBdjDf1QktfDbVT1/6q
	sDfeJxAeUTPy+RS7pd6SJtp1O6CdMVQ50Gbg4gy0n/6YAbRbZ9+E6Z9SgPxoG+vJ/FUnMKvKENj
	nTGccjAlQ0Cs2RypIOB6STWThu/0Rq2nDcCVJJtZK+sZh87UNoWe8dIIayXNa/A+4
X-Gm-Gg: Acq92OHdanqlyI8uJz6heLjZUWIPrtDqF97IukQHpBVlwC/tN5MWlIViKBEpDGDZSeA
	NWw8dBgcof87dczmXf5LKMWhgE4asrMVDhvpxAGGwcwSUwBEgbHyFkd9k1fKOLmvqXAiD6S6SrW
	s8Cyb2qHqeD1jxAxcASh63iNoZHyxe8/11Kay8SNmHB8iRi7GeuGQkwGT0QUc8tSR3vKd9yr1sy
	46XqwDovCSKd+1Yl4TSvdP9UpZ5XyAotSgKCHcwDog/ytBrBZWpIAG7LbaQxY/nWWiBJmYbZjlI
	Cs1dKCfeQKA0bW/ekeX/fL8SSL8FUu40GajBor4Mnz/4tkboKDve9YixhZC2e8c6ChofwxQx9u4
	NXhSVhVfG3v7K8t5NJuecp5Jo0l28chWmm67ChBos9oDVLcSSZGN6DHU+cbAjoHvj+OJUCEy9eR
	O2
X-Received: by 2002:a17:903:41c6:b0:2c0:af09:f3d9 with SMTP id d9443c01a7336-2c1644d1700mr75453395ad.36.1780563719029;
        Thu, 04 Jun 2026 02:01:59 -0700 (PDT)
X-Received: by 2002:a17:903:41c6:b0:2c0:af09:f3d9 with SMTP id d9443c01a7336-2c1644d1700mr75453015ad.36.1780563718551;
        Thu, 04 Jun 2026 02:01:58 -0700 (PDT)
Received: from [10.151.37.217] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c16629cd24sm66003285ad.57.2026.06.04.02.01.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Jun 2026 02:01:58 -0700 (PDT)
Message-ID: <af6a1de0-47f6-4ede-aacc-d5411f295e5c@oss.qualcomm.com>
Date: Thu, 4 Jun 2026 14:31:55 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: qcom: ipq5424: Move PHYs and PERST# to
 Root Port node
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
References: <20260602-move_perst_to_rp-v1-2-8ee5b80316da@oss.qualcomm.com>
 <20260602165241.5D8821F00898@smtp.kernel.org>
Content-Language: en-US
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
In-Reply-To: <20260602165241.5D8821F00898@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: mDyEcl1urfsf1LGtF6XRRQjM0QbGTcb9
X-Proofpoint-GUID: mDyEcl1urfsf1LGtF6XRRQjM0QbGTcb9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA0MDA4NiBTYWx0ZWRfX6I3MNMJYusse
 N3uO1EfkaVPzisw22XoVMhGuqGsUUNYS7TuKyPnhostwsjBxicLmlSyXrTtsfDBaeMhqH727/+j
 qurKV6Kvx4HA3emPRYRTBdsmPz28E0JhJ2j4jOpD9609ovA+sihdAWw8vKklHo7IeIJOfN9apnr
 /qe7fQr15mCDwAUzMDgSHjt+umk6j0Py9gZoc2o1GsVhpOl+zQZ1GPDdezhDp+SJGa4uFKG/T7G
 SUKU3aADNEDngmrrjaMtFZXf7knQyBqHEALC0ohkZTVJ3U/oMC5aE2dhdVdoRT5nS5pHvA+NGK8
 soWXZ4bUk6bimdmeNMn8aSh7GdekBbUI/01DWyxeSoaN76CoSvsDJTNTZp0qoJNTl9WxZY3lYk5
 NARCQ8rMIg/a0IogCu86Kg1yJw4pFoYx2yrff0iQSPgbdO2MlxjTH4Nw8SPb7zCNWJusv+TA1rs
 uLvS1m/qQEhpWJBP4OA==
X-Authority-Analysis: v=2.4 cv=f4p4wuyM c=1 sm=1 tr=0 ts=6a213f08 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=yqHa0Pl9yY5Qe_7Dn7UA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-04_02,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 phishscore=0 bulkscore=0 clxscore=1015
 adultscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606040086


On 6/2/2026 10:22 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
>
> Pre-existing issues:
> - [Critical] Legacy device trees fail to probe with -EBUSY because the 'perst' GPIO descriptor is requested twice without being released.
> --
>
> commit f286f42842ba6bb45e869489bbe2830fdd9be93c
> Author: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
>
> arm64: dts: qcom: ipq5424: Move PHYs and PERST# to Root Port node
>
> This commit updates the device tree to define PHYs and the PERST#
> (reset-gpios) under the PCIe Root Port node instead of the main controller
> node. This aligns with the new binding style.
>
>> diff --git a/arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts b/arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts
>> index de71b72ae6dcc..be8657239c46b 100644
>> --- a/arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts
>> +++ b/arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts
>> @@ -86,8 +86,6 @@ &pcie2 {
>>   	pinctrl-0 = <&pcie2_default_state>;
>>   	pinctrl-names = "default";
>>   
>> -	perst-gpios = <&tlmm 31 GPIO_ACTIVE_LOW>;
>> -
> [Severity: Critical]
> This is a pre-existing issue, but does moving these properties expose a
> probe failure on legacy device trees?

Along with this change, "phys" property also moved to Root Port node. So 
qcom_pcie_parse_legacy_binding() will not be called for this platform.

>
> When parsing a legacy DT, qcom_pcie_parse_ports() successfully requests the
> "perst" GPIO:
>
> drivers/pci/controller/dwc/pcie-qcom.c:qcom_pcie_parse_ports() {
> ...
> 	pcie->reset = devm_gpiod_get_optional(dev, "perst",
> 					      GPIOD_OUT_HIGH);
> 	if (IS_ERR(pcie->reset))
> 		return PTR_ERR(pcie->reset);
> ...
> }
>
> But it then returns -ENODEV due to the lack of a "phys" property on the child
> node. The probe function then falls back to qcom_pcie_parse_legacy_binding(),
> which attempts to request the same "perst" GPIO again:
>
> drivers/pci/controller/dwc/pcie-qcom.c:qcom_pcie_parse_legacy_binding() {
> ...
> 	reset = devm_gpiod_get_optional(dev, "perst", GPIOD_OUT_HIGH);
> 	if (IS_ERR(reset))
> 		return PTR_ERR(reset);
> ...
> }
>
> Because the first request was never released using devm_gpiod_put(), will
> the second devm_gpiod_get_optional() fail with -EBUSY and fatally abort the
> probe, breaking backwards compatibility for older platforms?

This is already fixed with[1] which is not available in linux-next yet.

[1] 
https://git.kernel.org/pub/scm/linux/kernel/git/pci/pci.git/commit/?h=controller/dwc-qcom&id=1a23bcb452d95f099e530414504c0d99ee076b3f

>
> [ ... ]
>
