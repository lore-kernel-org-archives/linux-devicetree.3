Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8A5B3DB64D
	for <devicetree@vger.kernel.org>; Wed, 17 Jun 2026 10:12:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781691126; cv=none; b=k2Ffq635wrQzA0EgBlnNA/9zYQ5S+wt2d/iLfuxR8zbjA5+TgBBBtR46xP0bld3qhoSCSrzrchR8hz3s9rw2ZWNbXV/N9I4YbZA4cScKucI3F3p+utLGs2dL6K6cPSq4CguFFuADPFf60OdmG/OI4KX5wv1jKNnoSIFrAV0pAcM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781691126; c=relaxed/simple;
	bh=IofKbrrqGGgguSMKcoRuaRky6ui8uyAcE3dtMmTC6bc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OlX42kdJFAvffXQndgGwqz45gLOszUFlBKglzi2Q6ohW5gycEgf6Tnpp60TXL3IQKGMmuUXKqtnFzD3SuAS1rstMhtYMq748xf9lcenhNwySPVIDrPcZNYqtI4i7GhpdAr7J6Wy7X6aPlX0DmLFIzcTpFsGK6K7U4MLdT5EQG24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VOjbLpui; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=R+1u1+fa; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VOjbLpui";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="R+1u1+fa"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65H8VxSJ2056617
	for <devicetree@vger.kernel.org>; Wed, 17 Jun 2026 10:12:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lx8sFvctcVsILHzUm7KFAzcrIbXLjkatPOBEx/N+528=; b=VOjbLpuitUJlclLl
	DpPI/t75ma52BQI3d0GkuGHzxGTKdxZ8Na2obN+P97jORWUKafa3ysze8YJz+Cic
	NaIFAWfMTcISVfcZpoS3NlN21Ko53KDNfC5Q77KI/8KeGsgaUJPUILRP4Rm9rmqe
	fMYrii1zfmTLFV0Sarh7Jk4EQ3puzjALNYYznzhUBz8qeobIGzlJ9318LI2ihSGl
	k5a43Y6ofrgYSBU3naTnpmpmkyVRDf6rObJr+Nhx7NAi/rmINNa16n1VsrIXMtiJ
	tjdkflnDOPyVVPHxo1K9hFs14HWoAovpu/nrVuuRw+JLhnHMxbYGQ1Km1z2FV/6k
	dIovbQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eueesam03-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 17 Jun 2026 10:12:02 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-915ccc2d4d2so118803485a.1
        for <devicetree@vger.kernel.org>; Wed, 17 Jun 2026 03:12:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781691121; x=1782295921; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lx8sFvctcVsILHzUm7KFAzcrIbXLjkatPOBEx/N+528=;
        b=R+1u1+faoMt7OOehRHt172JTTKBsWXeAHaUUmXkjqdFOKnUWO2P+GpLWSQUUU8iks5
         Hv8b6jzY4XudZ/nuhL1Y6cONhpbhroRgfNVU8vWGLukVop1pq3HKiV7GfZuCtvOZPOsL
         jE47e/rsIqo6dcmt1bFLY7EbyCnDM4JBycDSHAdUguYazL7MupZv9rIYAMkvxS33xbYS
         af6WWZs37kfEzqQQZAB8sGxl4QGE5nyntilf+KyqtItqAlCtHT3Gg9C0ALRjXlxpBggi
         NO4PPfkckiXdJ76j4lwXE510yJhd86aufiavqy5+1EJUurFhpysT4mFMfstdsm0INMnJ
         sDGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781691121; x=1782295921;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lx8sFvctcVsILHzUm7KFAzcrIbXLjkatPOBEx/N+528=;
        b=mfT2IQTlklUDNzneC9VM7PLXOqZs+4jr5u9edhVFZfirqMadtWUD3PJldnMpvygaYS
         qXLondFNtB6k1pJ1wZJvL8TOJN/d2OkpW3SZqpEtgDYtCKfqPw5sfxSgqWNXa9lENd6E
         SA+mSuZSoTCPANRF7W1LKz3wm/2/Y3MOVoK0qJRHU659jLFLvNyCBQ1NZh2yelWs3sdM
         vyf8S/fPXgpmJXnHnyvH1whorJKt4ZupLfSF4DPdAW/axnfC8HTjOK8MdCC9CV87CnVZ
         JIby5KVwkXY4Td2X3myZDtZI1hVnN/05dgAkq82Xp/q7Jgb9qBXllUDlhBiFDol2BD4R
         1DlQ==
X-Forwarded-Encrypted: i=1; AFNElJ8Dq57LnWk/p2nNha2DTl3sd9Rm7wgXjpJaQfb6H6YU77cSFHIeIqmdTbA64rILX+KVkr9No08Wynou@vger.kernel.org
X-Gm-Message-State: AOJu0YzvBHv21pKs2/FN+2dVgamOcaLMHfr1xzT4BHpaCbzonVY7KwN4
	aXdFaS/7gNYmFw+lwibhxFaBaUSQTicxjRqC///o/SJVQPzSE85BPkITv9hXn/iOyDP90MFBW2D
	ids1OiktOWr8I43DArN8hW+fjD04bdM41b2WEcNOli3ZXitNUL8GekAtwCaZDk9O7
X-Gm-Gg: Acq92OHZ3M4uO4yQhueep/Ma+i++my2RIrYK6w442yQ7ykIcgftKSWXZNlmG+wefpfZ
	xs+FkZeR2fjMBFDXf2JHKwwCGPXvraD0qXeLCD6G7WAuTufkHGr9XP8R3GU48EZP9dKtZSDz9Ob
	OS59PI5vDPFDFyS2Rpf1utZj8OIsXB9jHclvX1XwLZydff/up9jRox+BdQE8dgVBOAi6P1LKNrG
	QM7UvssCvKq6Y9UYgIJTN8+UDE9zBZsXUHHJ3PRRQmq3LImBnGoOWrWfraTydBz5bKA1bXBvgw0
	cmPpsvbnFXPizhAa+2exbP0PzkAPMm8bqChFulC8aHmPGTYfz2/cExUxHsksg23WEGoZpf5DFOG
	Z8N50iepqY1TFOvdkuoH++9uExBVCSSEDbVI=
X-Received: by 2002:a05:620a:44c4:b0:915:7a64:cb68 with SMTP id af79cd13be357-91d8885c02fmr344513485a.2.1781691121702;
        Wed, 17 Jun 2026 03:12:01 -0700 (PDT)
X-Received: by 2002:a05:620a:44c4:b0:915:7a64:cb68 with SMTP id af79cd13be357-91d8885c02fmr344509285a.2.1781691121203;
        Wed, 17 Jun 2026 03:12:01 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6954fb225f4sm749227a12.29.2026.06.17.03.11.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Jun 2026 03:12:00 -0700 (PDT)
Message-ID: <fdf9782a-d5e1-426b-89cf-813318e9a1ba@oss.qualcomm.com>
Date: Wed, 17 Jun 2026 12:11:58 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 2/2] arm64: dts: qcom: Add Xiaomi 12 Lite 5G (taoyao)
 DTS
To: Stanislav Zaikin <zstaseg@gmail.com>, devicetree@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.org, andersson@kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, linux-kernel@vger.kernel.org,
        dmitry.baryshkov@oss.qualcomm.com
References: <20260608143329.252033-1-zstaseg@gmail.com>
 <20260608143329.252033-3-zstaseg@gmail.com>
 <8b8fe93b-3df4-4dd4-acd6-3e87401071f9@oss.qualcomm.com>
 <3bc5c1f5-8994-48b7-a376-39afc7e429e4@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <3bc5c1f5-8994-48b7-a376-39afc7e429e4@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE3MDA5NSBTYWx0ZWRfX1RGswbzSBLh6
 eJ1EUe99BMljLtPWFR3GBVyqGOVu7/+18nl0fBqOS/P6z8k+nM4W8xYYc2UgIRyX34Ut9l/R+yv
 ozHq6S2gEs2mhVURf8T9PceLPj9vdW0=
X-Proofpoint-ORIG-GUID: u0nTAKU_sgoCsvVSim80c7SS_DaQVCLA
X-Authority-Analysis: v=2.4 cv=R6oz39RX c=1 sm=1 tr=0 ts=6a3272f2 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=Hr9uyJ6E012qHgJgGN4A:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: u0nTAKU_sgoCsvVSim80c7SS_DaQVCLA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE3MDA5NSBTYWx0ZWRfX3vcqKlMOeKvV
 ujTdFsXpXY8C432e7sqD7uYsoAOqvlwm1EnTsDVh1SrM0EJvrvFyCSh0GY/9ZXUnFVZPSQn8vdm
 vtvrmH0Vwy2RMgmZyU1694SGEJz6DsfhnXgRS+EQBP3B39URKKPfhEcZZoFqYEdQ/mMDesbEWwr
 pwcsivY6Kh1gxAlA+zb7L94BmXYzF+sKnbzmB7TRiU/GlRj/E7DigFR+9v0950MkyUvq2Mnizno
 +4sR99YaN+jhsgAMro4kyZj5O7JufjJUzZIzuIlnIk4Lp8ER/mMBdxdF5vIT4Zg+5XQiqHJFfTh
 1jKoZUN9LuxoGtwRzolePFe6PZTiNPoIQk5wMY4dPcSnEDPROwxF43WGlImAHMUO3SU2f11/Gcq
 qHs2u3nSXPZgBkyRFOQur50k7w7LTRvFVAZkuwURRXbkNbuUyLhvKgXEpRzjzvI8WflbtKyR6wY
 xvZml6HIiGU1WIgI9kA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-17_01,2026-06-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 clxscore=1015 impostorscore=0 phishscore=0
 lowpriorityscore=0 suspectscore=0 priorityscore=1501 malwarescore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606170095

On 6/17/26 9:55 AM, Stanislav Zaikin wrote:
> On 6/16/26 12:01 PM, Konrad Dybcio wrote:
>> On 6/8/26 4:33 PM, Stanislav Zaikin wrote:
>>> Xiaomi 12 Lite 5G is a handset released in 2022
>>>
>>> This commit has the following features working:
>>> - Display (with simple fb)
>>> - Touchscreen
>>> - UFS
>>> - Power and volume buttons
>>> - Pinctrl
>>> - RPM Regulators
>>> - Remoteprocs - wifi, bluetooth
>>> - USB (Device Mode)
>>>
>>> Signed-off-by: Stanislav Zaikin <zstaseg@gmail.com>
>>> ---
>>
>> [...]
>>
>>> +&ipa {
>>> +    firmware-name = "qcom/sm7325/xiaomi/taoyao/ipa_fws.mbn";
>>> +
>>> +    status = "okay";
>>> +};
>>
>>  From make dtbs_check:
>>
>> qcom/sm7325-xiaomi-taoyao.dtb: ipa@1e40000 (qcom,sc7280-ipa): 'memory-region' is a required property
>>
>> Please fix that (or disable IPA)
>>
>> Otherwise:
>>
>> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>
>> Konrad
> 
> Thank you for the review.
> 
> This patch depends on [0]. With [0] patch applied, dtbs_check passes w/o warnings.
> 
> [0] https://lore.kernel.org/all/20260517-ipa-loader-v1-6-3c3764c1b4a3@oss.qualcomm.com/

Ah, I see, thank you

Konrad
