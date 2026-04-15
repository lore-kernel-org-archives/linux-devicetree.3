Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CD4D3D2FEC
	for <devicetree@vger.kernel.org>; Wed, 15 Apr 2026 08:56:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776243395; cv=none; b=A2qeVjY7za5aXGV9fDyiVPodQOGFM67gV8X5tc99eVCC9S8od18nR669OuqOyxo/uvse3qOex2NGVDWPZrkHV+CgBrsOkF6ACuPAEakBz8V8TX7RFRiZ5N+CzKjGXCP0SQkYqqxO/yxDFYm6Mp2OC72MU8kLRhx8JCqgZPSVcFM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776243395; c=relaxed/simple;
	bh=VYwZ55ze69o8u7PZFAwrAHqzRNPJl92Yyq9zPCoHx7Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rLz4parRRnNXoxj4R25Tg3sYBPs6F39hiMNSB+r2QxP2/E63eqSsdz41WbixqP4aw4/LZ8z4qyV/KdObI/QA16iRHaRkNRM2nzjAuUmozjBodHffgSlNHn60Bl7zMcI9/p5WEfhwMDH5pcI6FJeFQhDbwEjgP/QXtV6Xsuexszs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hZ0Uebp4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=j/0WM6et; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hZ0Uebp4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="j/0WM6et"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63F4WNN42071454
	for <devicetree@vger.kernel.org>; Wed, 15 Apr 2026 08:56:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/frILHXn/mBZKU9JIR1yyak2aX5M5anTEZUnZNPv1tg=; b=hZ0Uebp4YXLPvPuS
	TMSB9U4WGf763twYB1B8nLl8B+w/ms8UWc1c0eaXwsLm8JlEI/k3yeAROmlhZYZU
	BMjjfc5BFpsR8gM9c/84Z5kmqyXgHNyn0d0vYTaQsgqfL0aD2BnfKKmC4Cg8Ee3F
	XClWDtXkEClEUROTdCs+42bDVPRmpJ+jso9bgPakXb85QzynCVz+ZkSMDbPcxpDe
	Nw6c+ibDRautVTfWM9YdmMPnxVkBF8H23TW33LHqObJ72kq/PhwSwrLr0VVJQ5Hr
	j/A5C1gB8JTv8v7jkwoxYD3KUaddLB+jZ0IyfPHzH1KOB25wLjhqkK0DgL2WPSpK
	FDKx5w==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dhtc2ah0s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 15 Apr 2026 08:56:33 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8d4c66096e5so77910285a.3
        for <devicetree@vger.kernel.org>; Wed, 15 Apr 2026 01:56:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776243392; x=1776848192; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/frILHXn/mBZKU9JIR1yyak2aX5M5anTEZUnZNPv1tg=;
        b=j/0WM6etUArY8mLMrfObGMLULt4ruZrqCBgumQYYVM0uLsUnYLCOeO8d/Ecx6/AFDg
         DdAPIJMNGiZA5WVvSFOnP26Z2V9iq2ILjYHyLxLlUkEbjW++kdNdmuyWgD41FNkTDHdP
         KE/fHrnEwxBEMxD/rf6vSyIboV4aEB0SkFhfoCGbVLRDnxstyNinZQ6EQP1tC+XAP93W
         YNt67Myxfgi/UtrCqdywHe32+v7mKgcxXQe4OAkufMExJgC/QBbJDPYQt9s80bvVi+so
         sjMYNkEmN+Cym6C86sQp88OAtHl8AoQFORNyDH8aVmFEuINwhAMCg1ik72LFM6s9sHvi
         D1PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776243392; x=1776848192;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/frILHXn/mBZKU9JIR1yyak2aX5M5anTEZUnZNPv1tg=;
        b=Hj8A4f88bSIxPPrBfGuVFltXGmnfCJxWFe4xLe9KJW0Io1Z05WrsGw6ezWzwmsy7Z+
         SVlClRVfZdE/OPk1aZy5n98w7wmidDQAVOCA4gcT39LrEmNlZ9u5xja9QUOkart7T6xY
         sXffGLdGxjwSwXdWm5hvHDoJk0E6wTi5l9OzNMBAfRLRmHt4LJMCfLZdNYL1IkTH/8kW
         mOy75C1mp/1rIccFjNEpehoAc+/eJsFZ14VOmJqfkzER8ftKOayvs3Em8SMWQmyfUout
         pGUap/09a2qNSghQ5tdbb+vSzhNlCsG6laeVzREaFu7w5906R/jtVr0W93oFxp4qK6Mw
         CBYA==
X-Forwarded-Encrypted: i=1; AFNElJ/dw0MXYtjFCJnqRuLsdwv5Jia6DiuuYQ7E7RK/TP3yZda8UHLbiUMNKrUZ3cLr15ZIv6h76l9uuKB7@vger.kernel.org
X-Gm-Message-State: AOJu0YxB2Xy/J72vzaaIe6BUkJNbTc4tfu8LJ0AdyajiPCxzYe0c59SC
	cpXnzRbkGIfSsqiUMGtx0Sjko7MsBT6jMCo0O49OSnQofKP4hsIQ37NdjmyKFrwozujTXqH3JJT
	QnYrOACJK0fnqmYUjAOwBDGT2/m/RAyvjEOtsX2lWVxtT9IbgyIxIS1Ki3kdkUVPf
X-Gm-Gg: AeBDieuyn2+MI2TjyKQ1G4tNGBVpIi3RE3MaBYK2GPknCNrItCnH8OMc+LPkIVHimXA
	QKpXRusBMTx/Wnk0Naqw5EWKs9WXXXUJc6WdT30HQBd/eTttW12uI4byfHQIkveKMIYLbp7FdfN
	qYbhSizngNUfpcBEMcoEwDw5BuV+ZZKr76rt/Wdy3M1/BfIIhunSbwJxWGJ9ghq4cWcOMiYfOr7
	/GVazJ9OMjuGDU7vucGtY+zJ0eiedBEJMxl6JOIAHDsOBgKqxmnzhR/wg+6nl8HswEOfgtu88i3
	/+UkZEgF7/dNzCIeyxpVRhXdIRr7stqBucH/uEpL9Q9SeaMpGfoTn0yQ5ouOL09m29V8BqwXtxr
	Jjo/lm9ch5XR3sjXaqbTwrTmylBL+bccZ8AGS8QGka9Y/qlB60wyWpDJuPcc7L3QXPNzljD7J4D
	9GeFKJQWerYP2cdQ==
X-Received: by 2002:a05:6214:da4:b0:8ac:8337:ca0e with SMTP id 6a1803df08f44-8ae6a92e620mr18291546d6.6.1776243392405;
        Wed, 15 Apr 2026 01:56:32 -0700 (PDT)
X-Received: by 2002:a05:6214:da4:b0:8ac:8337:ca0e with SMTP id 6a1803df08f44-8ae6a92e620mr18291296d6.6.1776243392002;
        Wed, 15 Apr 2026 01:56:32 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ba1773c381bsm33817966b.40.2026.04.15.01.56.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Apr 2026 01:56:30 -0700 (PDT)
Message-ID: <64ddaf47-d780-4058-9788-7e734a7070a0@oss.qualcomm.com>
Date: Wed, 15 Apr 2026 10:56:28 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] arm64: dts: qcom: Enable CAN RX via GPIO expander
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Anup Kulkarni <anup.kulkarni@oss.qualcomm.com>, andersson@kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        mukesh.savaliya@oss.qualcomm.com, viken.dadhaniya@oss.qualcomm.com
References: <20260402105253.3009382-1-anup.kulkarni@oss.qualcomm.com>
 <tuanv2szadq5pnndy4zfxg4mo73pplfv3omanpsc3mcjorpmbc@itd2hayrix5h>
 <9cf3b035-79c0-4e9b-8ab6-a81f8d27728f@oss.qualcomm.com>
 <lghedhcnuh2fm4mp64mkgsgtpkd32yneftjazgrye7bovxxaby@uscrda3wtyoj>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <lghedhcnuh2fm4mp64mkgsgtpkd32yneftjazgrye7bovxxaby@uscrda3wtyoj>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 2QVPsjIk7wx-6VFpjyjcwg5Q0t7Xz13b
X-Proofpoint-GUID: 2QVPsjIk7wx-6VFpjyjcwg5Q0t7Xz13b
X-Authority-Analysis: v=2.4 cv=HpNG3UTS c=1 sm=1 tr=0 ts=69df52c1 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=WNm122a_XVfSPSTBZdMA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE1MDA4MSBTYWx0ZWRfXwoO4ynH6cEBb
 Bn0P5W6TBObo9z55270IJGPCe1CUG1/2YD2T4AaLtjE28Fr5XqVuATBoJTfseSmwQ4eZAKHKfCP
 JWAAyyOxexsyBR+La/N+gkENbdHXSuRQ3sGCupsiI0mx6aEFFIiAFloAzNcyK48j+n9BjgND9sY
 VA6/pMIbSC6aKLxVZs/5ZOu/pcfOWSBqGaIq/wfiLG2x0dVdK5nr5tqXkyTAf2gNiHv9860dn6/
 TU/w49RpoeP9SU15128qcVBjbLYH3iqc2FHtLSvkVYIVvmWQDPgMPbc8evOg8SQaA9JC2/kwN9B
 UevtllgKGpg7ANZwDbkKnQhOApXGHjCGcbbArgc67PVrsrE7sllgK6oaczBvcE+Dv/eX8T5dPXS
 g1bt7MwtXa0Fz/s8pAdl1/7jFhq8+nUgRZARKeZgRK6JAUQb6T1ACLg8NY9Q7D72/cfBsAFIU2X
 tv3TPRSxxGjmP+50cSg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_04,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0 suspectscore=0
 bulkscore=0 adultscore=0 clxscore=1015 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604150081

On 4/14/26 8:09 PM, Dmitry Baryshkov wrote:
> On Tue, Apr 14, 2026 at 06:20:14PM +0200, Konrad Dybcio wrote:
>> On 4/14/26 6:08 PM, Dmitry Baryshkov wrote:
>>> On Thu, Apr 02, 2026 at 04:22:53PM +0530, Anup Kulkarni wrote:
>>>> Few CAN controllers, part of RTSS sub-system on LeMans, route
>>>> their RX signal through a I2C GPIO expander at address 0x3b.
>>>> RTSS subsystem is an MCU like sub-system on LeMans with independent
>>>> booting capability through OSPI interface and supports peripherals like
>>>> RGMII, CAN-FD, UART, I2C, SPI etc.
>>>>
>>>> Describe this hardware wiring by configuring the expander GPIO 4 pin as
>>>> hog with output-high, asserting the selected line during boot.
>>>
>>> Missing platform name in the subject.
>>>
>>>>
>>>> Signed-off-by: Anup Kulkarni <anup.kulkarni@oss.qualcomm.com>
>>>> ---
>>>>  arch/arm64/boot/dts/qcom/lemans-evk.dts | 7 +++++++
>>>>  1 file changed, 7 insertions(+)
>>>>
>>>> diff --git a/arch/arm64/boot/dts/qcom/lemans-evk.dts b/arch/arm64/boot/dts/qcom/lemans-evk.dts
>>>> index a1ef4eba2a20..b8371bdf9933 100644
>>>> --- a/arch/arm64/boot/dts/qcom/lemans-evk.dts
>>>> +++ b/arch/arm64/boot/dts/qcom/lemans-evk.dts
>>>> @@ -615,6 +615,13 @@ expander3: gpio@3b {
>>>>  		interrupts-extended = <&tlmm 39 IRQ_TYPE_LEVEL_LOW>;
>>>>  		pinctrl-0 = <&expander3_int>;
>>>>  		pinctrl-names = "default";
>>>> +
>>>> +		rtss-can-sel-hog {
>>>
>>> Why is it being described as a hog rather than a pinctrl used by the
>>> CAN device?
>>
>> My understanding is that the CAN bus is managed by SAIL ("RTSS")
> 
> So, Linux can affect what is being required for the safety island?

Seems that way!

Konrad
