Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DDEF404BE9
	for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 15:16:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791904617; cv=none; b=m9sy4bhfMlOlMfNvFjvan9wYZGccD4PbMdPtf9e39+2kt2yZHyZdzqB99VYYmPA4vSy/tNPICWkdd8dDwChLD7g2cr8wxQ17KWTlanJuTnPfZAgkk61fO6dmk31hrnMkhzxfZN+ZkVGppC4HKpRzWBdV655868wVPSZkn045Uzw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791904617; c=relaxed/simple;
	bh=B7ktLQJ/pNrrqvewQaWggDr4aYPF+wQWTdWkQGGLAWc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nMlLjwwrf5Snxn7hDejPVTHXCLf1ge9AAnR32ctf8v9suvBEEJjsso2I3X1yKBuTt/Zte2mqr3mnsFpMwguwrbFmo4gSzIlmfH/6SQKxQPuUmcSnGsEsqRJ8v05cX4D9zrIPrlzuH7VkXh/mmcG/HVnjZEJ8m2/a86HzJ2tTbg0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IkqT7zeJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LJmnbFQM; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IkqT7zeJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LJmnbFQM"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69DE3w0S1492075
	for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 15:16:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	El24uVnSEY32uH0Qk2AIcyciDDvjht45ElBt3XamHQc=; b=IkqT7zeJ/WV6RFxn
	8ALb8LMf3Z3JLflpolgcgstanzuAS+DR2dMKQ6gbYFPeD7WiD4dLmHdg1veRtWDi
	3mpI3GRfl56GPgiDFBEEykv3qsMg3Apej9+si01FB+BIq/AwXHahGqhvF2qjRaCf
	QA4VX2Yqk2HdJKEc5Hyi+qBzq+GOKzdZ0FgIVSgY9BzIZ1HTyi3I6EMuMO7eUfoB
	WQmP2KXMfg9ljxOHrXI/kQnPSvhXDeax7t4DeIjZmiv2b5mRZMKNOVyWjEFbY1g4
	u6miMTzH/O4oITWgqCAUD2aAVVm/lg8GZl+loXaWXh8IJMZCwEDa5+ApIDXdwVrU
	vAD1Gw==
Received: from mail-oa1-f69.google.com (mail-oa1-f69.google.com [209.85.160.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9daqtq0q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 15:16:54 +0000 (GMT)
Received: by mail-oa1-f69.google.com with SMTP id 586e51a60fabf-4574f1cac98so5341736fac.3
        for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 08:16:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791904614; x=1792509414; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=El24uVnSEY32uH0Qk2AIcyciDDvjht45ElBt3XamHQc=;
        b=LJmnbFQMwaRwmK2L1unfuEP+TCW2WnN+B/XrWkczhbjO3FosrSNt4UV+ZvOJqCvUCK
         RZa1/dFD3dt9ex83UcGDrHnDnrCP8JLNwQI9qR32ssuVnIUTlD6m/rQmi9p8p+zVb0my
         ccys+sfoDJ6c94Mlg6Lb1JVBmaLQgvQdMJIoX+3ov4QerFkbOwSaClHOqFObqTFYb0s1
         vY6Anpe2Tgm7wFmx76nSXyRC1tosy1YmT2WGhJAifF9Bvx5tdqZ6Zayyet3CJzcDTgp8
         T+nN7L+15mp8S1QHK/6T56PDBVoMpqjQb8nW78p2mnzgMka7q/Hzfg6En/E4f4u7NMik
         9tBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791904614; x=1792509414;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=El24uVnSEY32uH0Qk2AIcyciDDvjht45ElBt3XamHQc=;
        b=zEDqK+qMYdsV4MX0dWNnrPBQVi7XqmHelCosC/45aHzU/uHr5PEW8h2NlsTMGQ4Kp4
         ugL+Sra3OcT8dZ6UoYX4vUgMd0WMH/qvi1Gv4Gby9kGfQGU6NKY1j9mQ6Asj7cS+YvfX
         KjQe3vlEju+FX6rzATpUMTOt/fIsJzG7kmcIz+c4ez6qT8I5G2ThLe88vGa65BKGya4H
         nO4eIIAWEBv4jssPNeE8/Xsu3cICf4TcLGwboyR6poblq1/9G0Dm1HD+kQ71vS4uiVY1
         VH4edSf3LPmjxc0vXfeqb+LmxWlfV3fL1GCSm5q/EOVhy8CJ8a8XdvS4N3VGCILXNjJA
         uOgA==
X-Forwarded-Encrypted: i=1; AKwUvBxRxF3dk+rsaagD+5EVL8GJWNB/87h5KrQUhVY4j1k4FU8M67IVcHLM1Wqw/eugBR+7BXbfTVdJ7krd@vger.kernel.org
X-Gm-Message-State: AFq9FYLNt5iBs6AZmtlfcKU2uKQoxXKKTnzIuRjZqHIPcbEvmM301Wco
	J7ZWOAni72QbluM6mKuK2SFaI0cHVEiXyfOy7Qol4EgnSWrSqm7fk7vlnxRqioUTrWTRTl8W7e6
	zu5QYBL2iJOH0QnKa9iWROZKx9BCFpYbUuoL1tq64XWwZ41zoRKPObIjrTfo5MyE/2VcqkDrB
X-Gm-Gg: AYBFou1ttuUkB4CswuSyQysmFq+G7vI9d/PGVMyyX22+ZmAsV0jQZuFQE9qcC7hJVPT
	Ajbc/poEjU0/BOEifM5CekXbCwdh/rNH+FzoGv7/OewzePgI621pnJ8OCq93Fpbz46Jc5wQd99w
	obwNMzcbt4oG1joM5Cg8hnVBmpCDqKrDyjdp1zRuQ1fdGsGfyaQjUYHs34tuZIs8nyKGgGFN6iM
	WYIxoL3CyenrGZ/o9esKGfe//OjaAdbq/O4S1ukdXRsmuU0ySq4ZvB+UaUrdDmYx3462zqruj8A
	UeMDssMP8endWBqvPp5wSP+kNWWzKr8YSdC+bmJqWuioUTmJlAGtDzdV9KHxOW9YwW3unxJSREA
	owETm+zc1zGZ8zz3sX15icRPDbOJhPqnBPM96Af5yz8k=
X-Received: by 2002:a05:6870:8127:b0:494:b587:7fa8 with SMTP id 586e51a60fabf-4a2a896dfb3mr11952826fac.12.1791904613870;
        Tue, 13 Oct 2026 08:16:53 -0700 (PDT)
X-Received: by 2002:a05:6870:8127:b0:494:b587:7fa8 with SMTP id 586e51a60fabf-4a2a896dfb3mr11952794fac.12.1791904613437;
        Tue, 13 Oct 2026 08:16:53 -0700 (PDT)
Received: from [192.168.1.8] ([122.164.80.129])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4a6dfb4e92asm13166fac.6.2026.10.13.08.16.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Oct 2026 08:16:53 -0700 (PDT)
Message-ID: <78480c25-6d83-4e70-a9f6-826760046cda@oss.qualcomm.com>
Date: Tue, 13 Oct 2026 20:46:45 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 02/11] arm64: dts: qcom: ipq5210: Introduce RDP504
 common DT file
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261012-08-dts-v7-0-77bd3d68d850@oss.qualcomm.com>
 <20261012-08-dts-v7-2-77bd3d68d850@oss.qualcomm.com>
 <5cfe6767-9097-4005-a78c-3066a2aef1f7@oss.qualcomm.com>
 <3fff91c4-b831-410f-a151-847ea407acb2@oss.qualcomm.com>
Content-Language: en-US
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
In-Reply-To: <3fff91c4-b831-410f-a151-847ea407acb2@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 2W6ycN0wSyZI6uKmTSYJzg5S3wgNVQ4G
X-Authority-Analysis: v=2.4 cv=FZuiV5+6 c=1 sm=1 tr=0 ts=6ace4b66 cx=c_pps
 a=zPxD6eHSjdtQ/OcAcrOFGw==:117 a=vSQal4Cqo5fxyC+YxRTyzw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=hj7ihxJC1nvnysMjlhAA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=y8BKWJGFn5sdPF1Y92-H:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDA2MCBTYWx0ZWRfXxMrZn5EX8BJa
 TBjjJebJk2/DGXHvK47wWjccXHp6DvlKuS4TzrVkgvHm+UjqIXmypbeuPfq+neCLK59CU89cN/Q
 zzO4v/AkUpsyub0xkbnXgdvrVkIXFAc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDA2MCBTYWx0ZWRfX7+u3X6j7Xk9X
 HwpdgyaApu9y5VGi+gP6KxltqHTEMCAwJfhhTkZYN298Dq06BSZcpMZ/U2MicDTH4Li/90uXrkz
 gWm3zbbVYesBogQYnvgvs6hEklv06N3HgvlFknzxorw+DGAw4AgsbPqfU51f3fT1wNgmIbes7xc
 lox9RtOfSw0L+vzzeThlOuGvwb6+HadVlCU1ge2U7hpKIpsHQGj8IeZQNjX4KMD8sJvfIaPlVXO
 ZQb40erfOQBzJYHwblrxm0aFgIgRS/XZ7R4GwcSE5FgmM2IAsIjH/ZRfjocJUnVL8nt/xf20bPZ
 4k1F7ogimVXTJH5WzywIAcwfNDa8xsAJ6ugZcA3WyI8kliQ083/Zk4KVQPMdeR/JUAFnbBckXwB
 E2f0O6S6SK/QnKBYuhYJChspHKZryT/p5zS1JpZ+l7FgDpvsYh55vF/ufn8aD1e/IhZA0XOpC9k
 +z8fKqp+RJ1HcdCHMBw==
X-Proofpoint-ORIG-GUID: 2W6ycN0wSyZI6uKmTSYJzg5S3wgNVQ4G
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1015 impostorscore=0
 adultscore=0 bulkscore=0 spamscore=0 malwarescore=0 phishscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610130060


On 10/13/2026 8:11 PM, Konrad Dybcio wrote:
> On 10/13/26 3:14 PM, Kathiravan Thirumoorthy wrote:
>> On 10/12/2026 12:53 PM, Varadarajan Narayanan wrote:
>>> RDP504 has USB, PCIe and SPI NAND devices populated. EMMC and NAND
>>> share the GPIOs. The board has to be reworked to change from EMMC
>>> to NAND variant. Rename ipq5210-rdp504.dts as ipq5210-rdp504-common.dtsi
>>> and include it in variant specific DTS file.
>>>
>>> Describe the fixed USB regulators, PCIe reset GPIOs, QPIC SPI NAND flash
>>> and required pinctrl states. Enable QPIC BAM, USB and PCIe for the board.
>>>
>>> Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
>>> ---
>>>    .../arm64/boot/dts/qcom/ipq5210-rdp504-common.dtsi | 209 +++++++++++++++++++++
>>>    arch/arm64/boot/dts/qcom/ipq5210-rdp504.dts        |  66 +------
>>>    2 files changed, 211 insertions(+), 64 deletions(-)
>> [...]
>>
>>> +
>>> +&qpic_bam {
>>> +    status = "okay";
>>> +};
>> NAND is the only consumer of this BAM. Should we move it to NAND DTS?
> Can we enable it by default? (i.e. is there any reason not to?)

I don't see any reason for not enabling this by default . Since nand is 
the only consumer of the BAM DMA, we enable both nodes together to keep 
the unneeded devices in disabled state.

>
> Konrad
