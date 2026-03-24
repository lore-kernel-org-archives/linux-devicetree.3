Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEFAD3DEAF4
	for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 09:55:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774346155; cv=none; b=aQkqeEnwvSje7WVMzUikUAgIEyNOHEEGD/06ZvA3UU5nhqYkK7Mw+Wfc0t1E25NrH+WT6muYoQnTMMi476AYvjNEsQ+g2gfhdpq6KHnqzFaKmee6mHq4QAahHr3+fj6AgCaAXNr/0/KJAlFLE1TqkYSMtTXQQgXYCMQR7wMcUzk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774346155; c=relaxed/simple;
	bh=oVgkaVtz91mE/xiVmVh0hQLbCceBPd9+07em93yhzqk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ap44MYAGeyPjJdNHmdnMslqADXd2fuBqf9/PDJhv2e/+xSxqIwDNcK+s264V0XrxGwVVCgxxG2x9O1jgo6km/JOgid2XcGt4cNhKctENnZBW6bMFqsYRyMM6j7GwMJSbERMKNdhTHIey7p+LOsb96gVWQny1A1B8mvB2CEDsCTE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=E2hle9oH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=i9yoR5wL; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="E2hle9oH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="i9yoR5wL"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62O99aEr2930489
	for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 09:55:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	U5iYBqMNKJHnassGYoZORWdJcd9t1QyKBPk8wMftn6M=; b=E2hle9oHSOsLdty3
	1bu7QFMAWOiSpmhAA8OK8BxRgb7INovQpp9q7D35wdDtabolb2feI/g1nAOLlk9u
	AP2WNGUZaqP/OIOidCROvlPKJIrYSGxgTwQsT9zydg4Ny1XmFUe9wI34FG6zSRJj
	DEePFqd+V954xmabIuvwmjRr0tAj/OZ1UzVAJ9qVzB3/W+5nIhN6qB+l0JDx5Hg7
	NLn9vMmTNQeTmudewGE5R5qQv2jtnvz+BQ1hwlwKQ7/uJIY81Q2QMarDjkxVQHBk
	67t42Yz8in0xLnneC4PjHf8zUc15VCfRO7Ogn1jv+mndbWZESQgCbj4gflftEhtb
	BfekrQ==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d3qr385jy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 09:55:53 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-1276e71652fso3638963c88.0
        for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 02:55:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774346153; x=1774950953; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=U5iYBqMNKJHnassGYoZORWdJcd9t1QyKBPk8wMftn6M=;
        b=i9yoR5wLdufRBi8iVHdsvK7QZOC6hma4x6uFPsd0k1zi0dGx4lnQv1nhWxLiL8E9Jo
         8ur8+mfMdSNDb4gLcGREdi8d4rTnHwi461lZo4A75LLLx/bw7aKb1y7fKVRmrHB3fM2f
         DY/GwcGu8a3nWbWucM5Nt2Ba5yP7qFqy2ol/yVmzhj9SFRbO+AHySkXe5yk5RWfLSQYu
         3kb7bx0u248XDTBuEsiGFG0xuT9e3GqfQ0UehYSZl3MeTBSZQrsOkTTOSpZRgGcQr6X+
         eSoIMkW3FP/24HRBxkplfpXwRzmJstLCo53DjsTIKYzXi+KK3eEMys7l5GSDJQuOPTFY
         TpOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774346153; x=1774950953;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U5iYBqMNKJHnassGYoZORWdJcd9t1QyKBPk8wMftn6M=;
        b=VlfQYnPrBw+I8/7QdEcWtNf5bnFr5nWCXya3FTtS6iycn8Abu4LUARKeO6ew84VJh2
         MQsBiIn/u1XBljsRYdI/TdPnYAmThO9G+XH7Q8vPB6HehhP9hTS+wBeBhHvAYSCIH4zY
         WJrp/F8+SYUzacQ2VckBksPzsIXL3U4ue7eS8sJEr4HDyeqT5wlzFS7pAOidKXRW4cU6
         VWPYeQpd9VFhzFjcetPdIE/BzpSzIhuw+k5eQAxS9o0aOvfmeU2pWEjoG26kdHwXk/Y5
         qo9HCr/4LP4nr+nXaW1C2WRV9UoGRD5RnjUwT+OjnrVV3U2jDwRcsZFR9CMfWWUKv9Mr
         e+PA==
X-Forwarded-Encrypted: i=1; AJvYcCWbKmMw0G4kskPu1QeVMOrTbuNbAvenTDqpGmvWOBkKrb1Ft8XlzdkorPu7G4mjnX6yc72bp776M8mV@vger.kernel.org
X-Gm-Message-State: AOJu0Yxt4oQg7w9lkCuY6nwDNwwg+EkTuascYNvW8HwT/YJXcXw+AhT9
	NAAOVfFAUscZAYAxVlfEFae8hGm14uYstQifYlRI0RgdwOZxGTE4gLFkKznyJUXgvHFTcn5mh7n
	Y/I8Ovu3rAovoSepyUMKawJuEXs5mMs9AnyDIyxho1lsXTNvTIfcxRR3WRbiDh45k
X-Gm-Gg: ATEYQzxx+mHVoi1BK4n6MKWUCCPhKy+9a+3mgqzcVwYhDB5unlWwhdY7e8VFpCZjnvq
	AP1Vla/m8p2BZ8mHdcdfx9jwfeva01mecXf4QveDRXhugJ34zK+m+q8nxj8lR3XuenfmAh0zJMy
	AuF6ecqAKm4YxbRnbriC5UIpGWuU474wRX03kl9vwpVIfD7KqIwv9FSlAgduKtSFZz63pDY2b3o
	yPZi6ZbyaDZRN5XFnnOMXbIClwSjEFpLJpIu6x5cSWHMqd5PJeTa+a4JaR6QqtAU+4Iv6HicFOl
	2J9D0+TjpBA1/sJpoNt+wKVpy9GJVEg7HhyEVHSPryz6yQjXWDKZ7ZxWvk1wBSyi8fE4VL9XLuq
	/ubBQjXaGUp1G4K4rjKuJyZpJJve2eMOGnDWqReYi/O4z+X1SXr9I238=
X-Received: by 2002:a05:7022:2224:b0:128:ceac:6db1 with SMTP id a92af1059eb24-12a726caecemr7430229c88.28.1774346152577;
        Tue, 24 Mar 2026 02:55:52 -0700 (PDT)
X-Received: by 2002:a05:7022:2224:b0:128:ceac:6db1 with SMTP id a92af1059eb24-12a726caecemr7430217c88.28.1774346151966;
        Tue, 24 Mar 2026 02:55:51 -0700 (PDT)
Received: from [10.218.1.199] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12a733dd8c0sm10952644c88.5.2026.03.24.02.55.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Mar 2026 02:55:51 -0700 (PDT)
Message-ID: <0af07be1-ec91-4c18-a7b2-ee1ba5dc9e78@oss.qualcomm.com>
Date: Tue, 24 Mar 2026 15:25:45 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: qcom: qcs6490-rb3gen2: Enable uPD720201
 and GL3590
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, krishna.chundru@oss.qualcomm.com
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260323-rb3gen2-upd-gl3590-v2-1-073514bf9ed5@oss.qualcomm.com>
 <774ef0b6-e3c9-4613-967f-617ff03adb7c@oss.qualcomm.com>
Content-Language: en-US
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
In-Reply-To: <774ef0b6-e3c9-4613-967f-617ff03adb7c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI0MDA3OSBTYWx0ZWRfXyFeu2G9tdcJ2
 ME0x0voM0fS7eAd2feOdgfsS3bPG0pwLzOy+r3Z6Y/yXgToiaKEU1pwMrnxYzkPf4ZSqN3qkV0K
 IZgyp+VghCnewKZpXfSYGIYVhDfDdN15QPUq60Mf9r/9vvgrh4ZQ/G5PWb7FpH4ILszeIt4BpGs
 L2gBHaFUHUUL61PYFDBZVc1dAYm4eYkYOgMSiisWgtSK9KzoB4Vk3qT1ZkAcRhUr4+UfuEZMFwb
 kcMdTJtaEDFNLtOXSk4hGrBufLS5riuTkNL2UiSUHnrjfdjvrNy8GxmnJ3RWD0hqkpTQsWG2RYA
 uMjAWTAX8ZSBCeDsnvKx8zqTPLR7uOAJvNjL0ZRoD0sQ4xPo2YaAQ2BiVsBD3L9JiGwBC2J30/D
 41lRzdime5woWVgXdRGEhh9dSwBbmgvANa3MJjjZrgN+TwXDkKtt8JwKx/mow/N/lI40lRbTaP0
 AdzyjJKvn8C2/oNJEig==
X-Proofpoint-GUID: 418XEBx5OW1q-J3mreLiY5dRGvZ07Hm3
X-Authority-Analysis: v=2.4 cv=Vpwuwu2n c=1 sm=1 tr=0 ts=69c25fa9 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=mkSd36kOS-caLY2HFoEA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-ORIG-GUID: 418XEBx5OW1q-J3mreLiY5dRGvZ07Hm3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-24_02,2026-03-23_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 malwarescore=0 spamscore=0 suspectscore=0
 clxscore=1015 bulkscore=0 phishscore=0 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603240079



On 3/24/2026 3:07 PM, Konrad Dybcio wrote:
> On 3/24/26 3:32 AM, Bjorn Andersson wrote:
>> The QCS6490 Rb3Gen2 has a Renesas μPD720201 XHCI controller hanging off
>> the TC9563 PCIe switch, on this a Genesys Logic GL3590 USB hub provides
>> two USB Type-A ports and an ASIX AX88179 USB 3.0 Gigabit Ethernet
>> interface.
>>
>> The Renesas chip is powered by two regulators controlled through PM7250B
>> GPIOs 1 and 4, and the power/reset pin is pulled down by PM8350C GPIO 4.
>> The Genesys chip power is always-on, but the reset pin is controlled
>> through TLMM GPIO 162.
>>
>> Describe the Renesas chip on the PCIe bus, with supplies and reset, to
>> allow it to be brought out of reset and discovered. Then describe the
>> two peers of the USB hub, with its reset GPIO, to allow this to be
>> brought out of reset.
>>
>> The USB Type-A connectors are not described, as they are in no regard
>> controlled by the operating system.
>>
>> Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
>> ---
>> Dependencies has now landed, so this provides USB Type-A and Ethernet
>> support (when renesas_usb_fw.mem) is present.
>>
>> Missing from the RFC/v1 description was the mentioning that unless I
>> pass "pcie_aspm=off" to the kernel, the Renesas controller fails with:
>>
>>    xhci-pci-renesas 0001:04:00.0: Abort failed to stop command ring: -110
> 
> +Mani another quirky piece of hw, perhaps?
> Maybe +Krishna has the datasheet. does the it talk about ASPM?
> 

For PCIe adding, Krishna Chaitanya to thread.
