Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44D0F1AAE28
	for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 12:15:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792152947; cv=none; b=EfskpkZbIQbHwFkb/LQg0vjyTUkdSS8hEKuAFR8+AiQvTG8u4yxleaQumqqLpMM8xQzX4yEleWxlyu0mEFpkJHElb9HjcAjOMUPJvaUP3EtvfsSXckv/VJ2n1ojNVNpp38/ocmn56nW5WQtkd0JlztTam7ibFjrx7pYjnBpx638=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792152947; c=relaxed/simple;
	bh=vGIIm/l6PqOQD0D80ys+x+Zadlrmm1Ea6QCypojg+4U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pOmo/Tn+KTNwlgSB4B6agZmX9z99BFzMy8UBct7VpDQ8uYFZyp3Te6eFxZfdd1Uta7l2iQOHKzJDpERBg11enLsQnWpR/dJlula2sY6GVmtcM5GzAAL+ObVT0H5LG37Jkdi8+QEKz2tPn4hcPNiv4i0rc8O1AsTRjAsFG3ykTac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QPC7kml2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=H4Tl+dbw; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QPC7kml2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="H4Tl+dbw"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69GAA1tQ1945567
	for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 12:15:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TNpPPGyxn1DpxOGZA92s1GsOApCTBihQPd/vIfBU21Y=; b=QPC7kml2saoVqKmV
	7Hta0d32FzRYQBZ7KkFvmpC4fZttSih7o6JyzQYiIKAyP+1olonh19kFobNca8dk
	yjk21OEedNeh6xxkRGhIj+NeAuKhKjFf7QMHpBqwQS2eAs/dMlaCoRvKZ7KyPOo9
	mikxxoTFLZjAupBQ57ygWhW7B8MNh2b1ZOAqTtI1It0zIFOebeEkr8beXA+qtJg3
	1gMyeDL+3/bWLKKlIj60B7bwcjqgLVLl1FvNUETmsnV6g0xmmS/0DCb+nq6+A7Bc
	2EI5YudfVhSSj1ygQ0PYUarUvyhgi/JBgMQQjI7A/jEbAhG9zuF+1DPEgiXXL9ai
	5AZpfw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hbg5yrvpk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 12:15:45 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f12bb489aso20442085a.1
        for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 05:15:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792152944; x=1792757744; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TNpPPGyxn1DpxOGZA92s1GsOApCTBihQPd/vIfBU21Y=;
        b=H4Tl+dbwluvoIQbWQ63yHGGy0WCwbHfuc1Pjnmnyi6mNgSVb4KhmTPgiMWmvkxb+4J
         8ScHCEWPSuQomYf8TyY37/popycq4RJ4qlUlRNv9pw8U8E0IfibN0PY5K7soEqM4Zhxh
         K72Nai6K+TtyYk6lsUSyWYxxQ2lh4czlK1p9BSO9s2bgn1qbiY3uHGsEZ/G+wCBFsLSM
         wOWdhN7mHuU/EF4PhsYEVilTtp19fRxtgXxmRU83H3UzRC6ShelNNUl4ZqDriz9JY6W/
         BAcES7CIWIF6pcySTsPKxm6+RbGmJ6Kmt0KxIe0beaG8Zd8hmNcvs7K2kKVjCXtI+2Em
         IPRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792152944; x=1792757744;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TNpPPGyxn1DpxOGZA92s1GsOApCTBihQPd/vIfBU21Y=;
        b=o+d77zuVs52/KSL0OAHtAAsISRaAXdDJppasZGX4Bd1uQWhOnS3OBx80K4/H/R9ioE
         E9USWGvBeiGdlR6c7u7MBevEVj1EnENjgoSYvG18Gmv0AAaCLVJWEVG6bKoGWX4JNPMI
         +dOqau1CfvwJK4qAgo5H5SAQcmS5Q7UpIOnUKpk3CJk8TvkfusS5O6slpYoiEfCnjwwD
         IzwoWWiHnBBJrVCRN7iXPCSPsL3W7hwSaEk6XRw8m5WYbqEzEW6Y/ToURhNY2O/FXY7W
         nGt0irxysBwAvM81c6lP95xQXvoJlfYvMcuyu1DJgMOxdARKD93FnBC9/D3ld/PoIWGg
         kopQ==
X-Gm-Message-State: AFq9FYJPS6AaV0ny16J4DJ9evypGiy5HSYadEpgNv8HFMiCIln60vNAo
	UGIcmU01mwy+ouQkjHRUzQ6lZ7ZrsE04MPCy65kVduWq4pK7+fWcYO551jLswMHr3XknrwX9wn6
	SmuGB8KfRxC8xuP2UV24qEf18R8epiRbPBgLbqyL/UMsqlGgrNzXbFwI5BqZpExBe
X-Gm-Gg: AYBFou3j3fGW90LqV7WQLdGXIRWUgz8DHxXhPq9UBQSRJOfIgkgfTLDnyR2NcEGRfED
	9AMlF70jRUA3/vAFif9b5CNC/qpvp91lP4/O5BPYB7TlG2ycWYUpxmktjE3AdNwbG5KItrPVSj5
	4b78pLFtt4NH74RUbGPi7p37rtVDIgkLzk94s2NNaG9An0EH1ZqJ3onInf//7QXoCFWecc2WhKf
	UvhPFjhegO9aQVdPvtgEaJww0HxjehHuriGPNZaSd0VgcVco2Qz63UMcJgX7SRUPWJAGbnvF+xW
	x4PvdCXTFOGWJYpkHfKowUHmFsyQ8Nl/kkNakIN0Al49AVcFZ8TteUXp9lsHbsgl/I7EyqH5xMn
	kFI5PcdpfQDiwhNRJ76rEtg==
X-Received: by 2002:a05:620a:8084:b0:93e:571e:94f0 with SMTP id af79cd13be357-93ebd1eabeamr4089553085a.3.1792152944234;
        Fri, 16 Oct 2026 05:15:44 -0700 (PDT)
X-Received: by 2002:a05:620a:8084:b0:93e:571e:94f0 with SMTP id af79cd13be357-93ebd1eabeamr4089541885a.3.1792152943447;
        Fri, 16 Oct 2026 05:15:43 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b38a1c633asm834421a12.16.2026.10.16.05.15.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Oct 2026 05:15:42 -0700 (PDT)
Message-ID: <929e67f4-8006-4978-b14d-507161e7e6d3@oss.qualcomm.com>
Date: Fri, 16 Oct 2026 14:15:40 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: dts: qcom: monaco-evk: Add suspend-only power
 collapse state
To: Maulik Shah <maulik.shah@oss.qualcomm.com>, Rob Herring
 <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20261005-s2idle_state-v1-0-3c402c66f388@oss.qualcomm.com>
 <20261005-s2idle_state-v1-3-3c402c66f388@oss.qualcomm.com>
 <0afbd549-3e9c-4b06-928d-34b2912754be@oss.qualcomm.com>
 <406a393d-56ec-4143-bdea-2d46c5a4d1bb@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <406a393d-56ec-4143-bdea-2d46c5a4d1bb@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: K_9eHL7ibv-kfMU6ZTs-Y-9WvPeiyNMf
X-Authority-Analysis: v=2.4 cv=M+HYuCws c=1 sm=1 tr=0 ts=6ad21571 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=c69CFNmdBQlqmWoHYt4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDA0OCBTYWx0ZWRfX68GRXLK5Qlqb
 lojcm8PFWDYwPlSlaho8/yZWImS3QsEZSfJLZHrykhHdSRFLRXdcceMVS2ebcAt7M0Rc9Tmi72P
 gZaYCNg8RGejfHaW65sojnQiKamY4oY=
X-Proofpoint-GUID: K_9eHL7ibv-kfMU6ZTs-Y-9WvPeiyNMf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDA0OCBTYWx0ZWRfX2xvZfVfdBqYZ
 y/O81Ob1yvp83dZUb8EgyCpedLnpRUw4ldJUTiQGOkDET1lZ78vxJ/3olmA7JKub0w4yER0CVM7
 8vst7VzUpYVnDti5m1eQhgSyTZbeY4HJH+yykzk7+kY+fd4OM49zImK6jPBwauCvdPfCSXuf3B/
 U75U2y2X5Mc6X+7tTtaItaJNdpxj7Z4o74PrgJ69yw7MfmGoe3Z2DoWWZev9iPVyhI2Pyldb/my
 osEb4p1qRY8bRhCFowIjW6NmIf5jTs3k6u0miOmE9VRYFHO8gugbUqNR/+t5o/RLJE3I2meNLc7
 f5o9zR+FTkLb4ljG6NfeJbhcwxhoa9+fWt5DahV0M8gtLbtNn1mbDRx1wxKNtEW1pQwG0itEz6S
 fRDUj6iCDaodE5/NL8SUpjQtWRpVjesNQXzxr/68esk3RiY5jTKJFWL1nKD6Tb3N3ibLD+yhG/w
 +TggVO1GuBl5606W8BQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-16_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 phishscore=0 suspectscore=0 clxscore=1015
 priorityscore=1501 adultscore=0 impostorscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610160048

On 10/14/26 8:15 AM, Maulik Shah wrote:
> 
> 
> On 13-10-2026 14:38, Konrad Dybcio wrote:
>> On 10/5/26 5:29 PM, Maulik Shah wrote:
>>> To achieve SoC low power mode like chip rail power collapse (CxPC),
>>> the Monaco EVK board with four PMICs requires coordinated power-down of
>>> CPUSS and the Safety Island (SAIL) subsystem. This deepest system power
>>> collapse state is reserved for system-wide suspend (s2idle).
>>>
>>> Add the system_suspend domain idle state, mark it with system-state,
>>> and reference it from the system power domain.
>>>
>>> Assisted-by: Codex:GPT-6
>>> Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
>>> ---
>>>  arch/arm64/boot/dts/qcom/monaco-evk.dts | 17 +++++++++++++++++
>>>  1 file changed, 17 insertions(+)
>>>
>>> diff --git a/arch/arm64/boot/dts/qcom/monaco-evk.dts b/arch/arm64/boot/dts/qcom/monaco-evk.dts
>>> index 539c9c80a808..b2978be6823d 100644
>>> --- a/arch/arm64/boot/dts/qcom/monaco-evk.dts
>>> +++ b/arch/arm64/boot/dts/qcom/monaco-evk.dts
>> Why is this board-specific?
> The deepest state is only supported on the Monaco EVK board with four PMICs. The monaco-ac-evk.dts is with two PMICs and do not support the power down of SAIL.

Nothing in the commit message explains that.
In any case, this should not be specific to the EVK, but rather we
should probably have a monaco-ac.dtsi holding these differences

Konrad
