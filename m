Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CB303B6342
	for <devicetree@vger.kernel.org>; Thu, 16 Apr 2026 12:11:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776341477; cv=none; b=I/Ztr6A67OeeWXcXfOXDzFj7lE7XJG5ZXuaq8Axf1pOrgdMszrLyqbvW+ts3GAggexGK0Ly3QaE/2yt24M1Iq+sokc954d41g9gcWQ9MFJzRK+oedQ0IXHQX17unN8WRTal2OHCYO+UyI5E0wqy2RW22sBRv1iqwQ+l7i6cQrVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776341477; c=relaxed/simple;
	bh=xY9spHG0I9k/xKdB4Jnf6G+YyGWpjiQAq+78b3S6yiU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bjMQPKZCmNzcbjiM7d/DOMqpW/DtjY3l7M5mtrY0dZG/kqO3kncKwbZcg6usrpMuj/fVDyY1xapVPE2kF2pZdXdr8H9jGI4bOHumvcBy3SqqYbOf/L5zfQqAzDY2Q++i36/AHGAbBgivlXjwgqt6hHxy6+hsvL9sNHlt8Lu0YgA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dD0jjHU3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GJ5MCSzw; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dD0jjHU3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GJ5MCSzw"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63G9cc6q1553253
	for <devicetree@vger.kernel.org>; Thu, 16 Apr 2026 12:11:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vA/0TTJ3KmuwOYZVhVuxVyXB2dY3lD4/8d/ncnJuhb8=; b=dD0jjHU3UoW3eblI
	6VeCNmxInpAVcu57oIlsSmEHJfUc6fz/GMlDDsofyo6G/nCw5sWslaMkjJw96gY4
	QOmjgj+U2Y8Nlsq0uOXS3DYUo3C+52suM97IIIvh5LO6SALswUYVJwRnoPwTTrsh
	TVgLP57WYIKRDLlTdOo0OezgjU/9AwySkN/fLnIrxN3sEL4U4f+7KnSZT8Ic6eqH
	1GAHtQbb2quT6lK23Mi6uxXyP8A7bmxT365trjtt4xyLpUtgCpkW5t7OqsrpIdEj
	O7SiJT3quCZPKxNRiqZ1HZMW22uXS9R6CSc2MOFiH8eyptaWB0E7xuyoyyl/Zcg8
	d1yuiw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4djrsn9k80-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 16 Apr 2026 12:11:09 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-354bc535546so7516628a91.3
        for <devicetree@vger.kernel.org>; Thu, 16 Apr 2026 05:11:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776341468; x=1776946268; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vA/0TTJ3KmuwOYZVhVuxVyXB2dY3lD4/8d/ncnJuhb8=;
        b=GJ5MCSzwM30kTjbyZ3BjZB7ofl7O5G6TnANjyZiAd2vuc9N8UhF7xzy5Wl5cIYNHp1
         f1Mduq6Rz299/I2s+qFgvePeWlvprbf7A+J+fYEchOQBA830duBC4bbby++KvZ1YlQAD
         uOZ/6DVw7tNbBrEbhU787G0ihQO+1E2p9IMmdXnDKXrEV89Vikht/2ZfY9Mh3rS+YJZ1
         HT3SFGkQvmMf6Ag8euRAzhkzXiQSQxSI6nemAN+KLpvl2L8J0JbYL8R2VcqoO18zDln9
         IsP+XKLkMONmIsAMmYKK/cGXkV6CAUUbAYIlI51KeRFSUTUYVCy0lh5XjEkcaGFhs86S
         vU5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776341468; x=1776946268;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vA/0TTJ3KmuwOYZVhVuxVyXB2dY3lD4/8d/ncnJuhb8=;
        b=OdJkQ/C+eoczCQHvLssEafnoUGDeDDi+RPOKVk99jIh+zrYX4QTIsVe13Fc4KAPFaO
         U8c4lq5fy0jZR+I3lPhbQuvvXPi8KOWmMYCuxS2Qi2XxUQABFzOiwGiOl2permfqSpLm
         jqbNEDAg/1KJzLb/7MxHiG+YYfTyyoLzgkDFHogcOL1WUmsAYeHYacLZqrzKdyG9Io2w
         1/vJuUdWO+JvNxcdG1DsCZ19PuwzkBM9B79SgamRPE2+Ig/iDiPdJJR42HhMT7tdXTiy
         4iV7xE3+LrM+/oJ8OnoC6DlMSmFBtGdYNa0rN8aWwR/AYfbdWh0b8w6Y/4f6Ra30M2SD
         tjsA==
X-Forwarded-Encrypted: i=1; AFNElJ+OIgskULDLORh06t0AlcgPK9Nb0Wmyghc2lbJljitEu6cDAnkuiGNuyNwpg8KRHzxKRkmPccLAzjDb@vger.kernel.org
X-Gm-Message-State: AOJu0YxEXS29ZzJlwPWr3V3px9Y3Cmm3DMw8ds78m7Xh3gV2vqI9GwiD
	fWIFm1LYFPDh0RWAKVLUvOdQJkCP4Jv8gTEdfPj9M7g/1CFNR7aukccnWCgnEzEiM0WzMR51iqm
	bwB1ZRlyczTvx4LFYTqbior7/jFw67t35gK6iwYC6o2MAX8DcquSRTf25EgLMBsgy
X-Gm-Gg: AeBDies5pjEtOY2ni6vzbVpKRY80UXesoqVblC6/FzcTQgboBuY3Gr1cHinSGzLNWvB
	H6UAAQxzXL2lsyUa1GkMQa4PgjqHsaFA6EF8BymTQ/8cEAVPeR9gk49NpYCmUuFZ8paeCk6ZhDt
	dJi7e7mgmbJTc42nlM+N74jrIj/ARRov+GQE/8vn+g1vT993JxTvKtwva9XX4ZhxR5+F644C5yF
	BmlkX6x6ezBltgmzISw6m/TFdywD0DSTaMnUBAiGT9rBNuqIuIRe3WjYRXk0jDUtqPE4jbw0scM
	+jzxHtWZ20PuJXRm31uMWU8azAjEM5N3UzeS5v8RqkfInEgOLGGnwEPZll5iqeB15BOlC4OpYqE
	Uviq0ys9mwKaStzFfCr4E56q+Wb6AfwawH3+FOaQ0+ObLsv110mO7
X-Received: by 2002:a17:90b:3950:b0:35c:1695:24a3 with SMTP id 98e67ed59e1d1-35e4281374emr25473733a91.23.1776341468351;
        Thu, 16 Apr 2026 05:11:08 -0700 (PDT)
X-Received: by 2002:a17:90b:3950:b0:35c:1695:24a3 with SMTP id 98e67ed59e1d1-35e4281374emr25473672a91.23.1776341467609;
        Thu, 16 Apr 2026 05:11:07 -0700 (PDT)
Received: from [10.217.218.94] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36132dbce55sm2084793a91.13.2026.04.16.05.11.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Apr 2026 05:11:06 -0700 (PDT)
Message-ID: <220f1f5d-6382-4aac-9af8-bba11a87cc92@oss.qualcomm.com>
Date: Thu, 16 Apr 2026 17:41:00 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] arm64: dts: qcom: Enable CAN RX via GPIO expander
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        mukesh.savaliya@oss.qualcomm.com, viken.dadhaniya@oss.qualcomm.com
References: <20260402105253.3009382-1-anup.kulkarni@oss.qualcomm.com>
 <tuanv2szadq5pnndy4zfxg4mo73pplfv3omanpsc3mcjorpmbc@itd2hayrix5h>
 <9cf3b035-79c0-4e9b-8ab6-a81f8d27728f@oss.qualcomm.com>
 <lghedhcnuh2fm4mp64mkgsgtpkd32yneftjazgrye7bovxxaby@uscrda3wtyoj>
Content-Language: en-US
From: Anup Kulkarni <anup.kulkarni@oss.qualcomm.com>
In-Reply-To: <lghedhcnuh2fm4mp64mkgsgtpkd32yneftjazgrye7bovxxaby@uscrda3wtyoj>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 2tDB_XU-EkV3AXFo9ZE16_7rGNscUDik
X-Proofpoint-GUID: 2tDB_XU-EkV3AXFo9ZE16_7rGNscUDik
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE2MDExNSBTYWx0ZWRfX4gsiuLLSwww3
 BEPabaUY+S7cWkYkL9qXhrFKqJcsQJDarqjmQSTjWCZAOEhcSvT8+5esJfZcrBBGN0N3nKfZHJr
 H0KmYOs3oyLTjGragGjX3BLGc+g04dujJYYDyiafi2Wu6A52wtncw4zW8WNeCaR1uT4Bc0fzziA
 G9a9mAnCLEok2MFuxarU0wXp2vNKEk+LaBF/9J0fNzRBrKpdrcPS8qgktzVYSw9eVKGGFv/1Ptr
 5zPUD1mCfv1nB9mr0lXNoKAnX/ajZwpjBq9QVuh47NHMuXlcyjzFuWvkj8CkyLRPqLZ2BRIZZ11
 rfWp3HGpAERaH1609UOHn0efKyCagu7NBsSWD2od7QS8KG+IQ3PXKZwUb/FJULz16a3ReCREQ4g
 vIzWsNTGNpAH/da2DvogZlzao7YwPpPpf21AkDHh+/Qg5xqEHeYzgijNE/XVKfuenEc6WmfI7Gb
 i0P7v3H27Y9aLOCSFJA==
X-Authority-Analysis: v=2.4 cv=EojiaycA c=1 sm=1 tr=0 ts=69e0d1dd cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=6NPFZmL_EsXISEHCnmcA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-16_03,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 adultscore=0 spamscore=0 phishscore=0
 impostorscore=0 suspectscore=0 lowpriorityscore=0 malwarescore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604160115


On 4/14/2026 11:39 PM, Dmitry Baryshkov wrote:
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
>>> Missing platform name in the subject.
Will update the name in the next patch.
>>>
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
>>> Why is it being described as a hog rather than a pinctrl used by the
>>> CAN device?

The RTSS CAN device is active at boot-up so used hog property here. 

>> My understanding is that the CAN bus is managed by SAIL ("RTSS")
> So, Linux can affect what is being required for the safety island?

Yes, CAN bus is managed by RTSS, but the transceivers are

outside of RTSS. The RX line of CAN device is connected to the transceiver through I2C

GPIO expander on board level. GPIO Expander pin enables mux to connect CAN RX to transceiver. 

>
