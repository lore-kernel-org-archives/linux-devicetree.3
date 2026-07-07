Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E58ED32692C
	for <devicetree@vger.kernel.org>; Tue,  7 Jul 2026 08:27:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783412860; cv=none; b=a/Qz4OoMvAZuBbSArJXiONfMtZsGCK7TL9npvvbSALdbtmxhzXWroRD6EMNSEG9mooEZZuPCA3XHoIC8wGw80hIzlWZ+PkYo7unwGwsF1t2ZJXzkbwSEDmrH6ox0rtZ3/Lx2UDi1JF71Yke8+5rbmWcEs+14es1P5U/c9q8hwPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783412860; c=relaxed/simple;
	bh=rVjNLV8fcin1IfLO3gAv3V8tbKv67Km9LTOAjwI0Df4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NIh4qckqwN0f5dkyT4MAohXQRkCnKIJI5aamfG1tw5piPmWaLcVHKOIyW8eqi48j9ViFFEbCsfLHmG3ART844izp6FgJuFHNy/Tksk/AzR6CHBhKS3L8uK0thN69gEkYbYTKg0uhJgbZIYXESVl7K6IqDdk1dUR/o9TccpPyFDQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Hd6olM5O; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GhE3vjZ+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Hd6olM5O";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GhE3vjZ+"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6678EMVt3231539
	for <devicetree@vger.kernel.org>; Tue, 7 Jul 2026 08:27:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	V/ZgBEwLyfyIVk+OdidjeJ6wnAs8OCnD38pl/d4BiaE=; b=Hd6olM5OvIkTE1Cc
	3IHxUJsLzoapbKi5IvVWbpt9Di0LLrbGe1Q0+zR8pSMt8/JsGBPtVlxI54IxVk3h
	yLAmZdmnehhBSvVGyxpFnWL06iIUb5+9PdjBqQL70ngtwcTbfqNomy9/ay5UcBNr
	wxFkCc8J3pSwwd5Vhgsk2gk/PPuGh0MeJjTSQ9eG3SE/2Uf6LLs5bzSyTfTzV55y
	9zjTDo+doOmTRuezCNLmpJPRHxDpiAqyIj0ceSq3NVJw/2GuMK1sylikDMtJ/K9a
	FehGr8ut4LaZk+xXixOKeyLrThP1YFLkY9fSAXz24PiL7V9no6x8XRULiO/ANSU/
	Ao9xdA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8qj79f3q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 07 Jul 2026 08:27:37 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c15c77619so9116671cf.1
        for <devicetree@vger.kernel.org>; Tue, 07 Jul 2026 01:27:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783412857; x=1784017657; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=V/ZgBEwLyfyIVk+OdidjeJ6wnAs8OCnD38pl/d4BiaE=;
        b=GhE3vjZ+KpoXM/pAMjWGUIiUUvgvQhFIV8OyCW1K4pYCQI+qMW7SeQQMcfXfIgOsp4
         mIfO5tkSo11uELzsyNOUyjqlWQObXJ9SnZHBWOnF7GTOUcPs6dl0MyLUn1bRn88Uyc+G
         h3JGZeWLtTKxwzzIQ9+ALoqvvSIcNFtuEwU2a39vhfrr4Jn3kbPT+n9OtNHh/wTfeW5N
         G4EzBXb1yMd6L/nn+5p2cbhk28bvspegTwQ8tJdgcvdYnKEgRkL/C3Wa6pEtw9yBX0OP
         AxdfstdWf6ftm7X3u78o0zyPbUZJSuNGqYKpThxc/a04kc04ZzK8TKvfu8ELFPJ7Awni
         VKcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783412857; x=1784017657;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=V/ZgBEwLyfyIVk+OdidjeJ6wnAs8OCnD38pl/d4BiaE=;
        b=Yg28YqigruRxSuVweouEJbNFfaFFCO0z3cvS8RHm5k34EJCLf0FhaEVlnsopHQhNiH
         WtALZrpWgDKf8juYKOVnTPW8+wd/xMoBJaUlFinDamkGdpyQSyjZD9G+4045EBDPW1E5
         N7njNALu1+zUT0yE86T1x9KVa08/CWRCe7vvrrO43FjfvpUF8laboF3Tbvw+NC1+uR1h
         +kjNCFt7cTyHKONC7/n0knc+I3QUA4cX4AMiNV9AXeg/SEsPs5xLMdEiq3QymXbCmgL7
         d6gaT44AueLNGL+rd+OhfYAaN/+7MwNdWfw9rlup08Cbp0koCTYsGuVqAOLTFILfI8Pd
         d+KQ==
X-Forwarded-Encrypted: i=1; AHgh+Rq8xgnV7uT4ruIB5hDhfGsqrBH12Mwi6TPiuKADwrYGvKmOdNanyxMDmHU3B8YEq0naWdjqYkkshr2b@vger.kernel.org
X-Gm-Message-State: AOJu0YzJDHSmLxa/iZk1cypZteJXUYYDgK2hxc0EE8LXEI9qKDK44YMj
	pEaBV6fhFOKWtRN7y8emUolT56UD+lnNfAJqPAxbq4LPKzhnJbx13DgJ/UjLc+5UsEKNCPGZhWB
	+zi3lstaw2/Ie++PSMy8Xm9xV+RQdy9y8de0tB+y35HDEiTn4aIeyXrrCN1As0evw
X-Gm-Gg: AfdE7ckFhGqnfer0tTLQDYF5Akjujxi7f88NM1C7yHAqCcZrptKdt44sZrqvwW8YJCp
	tdpekmyARdTnQCsBFwnrheJctDARo3+XY4TBe/6fueUaC9rAZNeSXUrE4tKGy1s/j12DtnKinRb
	OPrETrb7cKeeaN69raOJORj2iK69iatQ5dgaSoZrPvHiop8JPkmfVCHGVtqS+jSJeny3+Uq7vXC
	IHeSea+M1qQPY36c3HxmSy2ELOjcOmBam6kze8TMVNVJKKqvOOfSdWuaYOaK1Dduu+knlF1huOB
	uGffylbuRj8SoDiIs+u2eFlLIY+Od/R4/VMNrCy0gwAVo6lJdnlG6dS3DGK7aX5RimkuNvPjCUx
	lImPGLKk15oCjoJVuXiUdT0OiGkKbgneX/8k=
X-Received: by 2002:a05:622a:3:b0:51b:8543:cbbd with SMTP id d75a77b69052e-51c4bd94c36mr122379391cf.1.1783412857081;
        Tue, 07 Jul 2026 01:27:37 -0700 (PDT)
X-Received: by 2002:a05:622a:3:b0:51b:8543:cbbd with SMTP id d75a77b69052e-51c4bd94c36mr122379271cf.1.1783412856618;
        Tue, 07 Jul 2026 01:27:36 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15ad82311fsm81296866b.8.2026.07.07.01.27.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Jul 2026 01:27:35 -0700 (PDT)
Message-ID: <edb2a1ad-4213-420e-b494-af71da00a213@oss.qualcomm.com>
Date: Tue, 7 Jul 2026 10:27:32 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 5/6] arm64: dts: qcom: ipq5018: add nodes required for
 Bluetooth support
To: George Moussalem <george.moussalem@outlook.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann
 <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-arm-msm@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
References: <20260706-ipq5018-bluetooth-v4-0-350262a30959@outlook.com>
 <20260706-ipq5018-bluetooth-v4-5-350262a30959@outlook.com>
 <6d8c0326-1b3e-4eae-b528-22ca77dbaf6d@oss.qualcomm.com>
 <6a312986-49b7-483b-8253-5bb3b842ac34@oss.qualcomm.com>
 <SN7PR19MB6736F66FB96D6A43C128AD719DF02@SN7PR19MB6736.namprd19.prod.outlook.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <SN7PR19MB6736F66FB96D6A43C128AD719DF02@SN7PR19MB6736.namprd19.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: ig5JQS0psBbZOhNpHPbc72QOWw_UXTVw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDA4MCBTYWx0ZWRfXzbzFdntGgVNr
 2v7FMulD5RDTczK6SFHRMz4Y+k/1fEm+2lOMAe3VxWrYCv65Stl9W3Jpudf07I98eP355/3nxVj
 Sxz58K2/GEoWvA/JL0esFegyPV+jESEPfju2S2Cmg8pXqnVMnLA5VRa7qrGtgcJpRoglrmgC4nM
 6MT/0vRYAHMBjFwjXQit2gGHr3hcOJ967Gn7BkCy5PqXiBg8jdahnYXrOPVxmIiK0BMAaV8s9ua
 vWEieqchTROoHEG8YMpubISpW0Ehgq8D12tRFozY9uRBEEv1MM1SdF6H87qaOP/WpnL8anFjkwS
 jLylvuPyAgUgkGWdcmJI8FupCyqjUAmk/ZrpxyVG5u5Tc8sWkSuDPQdUertNbgst6ckxL8ITM/o
 LBv0RK5Zk1ouvs4l8dWNHbvGSuFb2MXO3ngQlIk+e8ckSy3alWC9089NgWK30IPO+ykycfz9pO+
 dUKIMsGJRgk5rjRzJYg==
X-Authority-Analysis: v=2.4 cv=PIM/P/qC c=1 sm=1 tr=0 ts=6a4cb879 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=UqCG9HQmAAAA:8 a=EUspDBNiAAAA:8 a=5lF2iwBCjgZWocWpIzkA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDA4MCBTYWx0ZWRfX5Tn4firQKu/z
 v/ooCUm+mOi/rhktAcKlEbhLaBzRbHlv/fKFsiOVrJjh4OJ4Kb50wyQQKFRWsRW0FNX95y/33cv
 ars5O8JQAIPvUCC0L1LsSoAjUFFTxEA=
X-Proofpoint-GUID: ig5JQS0psBbZOhNpHPbc72QOWw_UXTVw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_02,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 impostorscore=0 malwarescore=0 adultscore=0
 phishscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607070080

On 7/7/26 10:12 AM, George Moussalem wrote:
> On 7/7/26 11:51, Konrad Dybcio wrote:
>> On 7/7/26 9:51 AM, Konrad Dybcio wrote:
>>> On 7/6/26 7:26 PM, George Moussalem via B4 Relay wrote:
>>>> From: George Moussalem <george.moussalem@outlook.com>
>>>>
>>>> Add nodes for the reserved memory carveout and Bluetooth.
>>>>
>>>> Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
>>>> Signed-off-by: George Moussalem <george.moussalem@outlook.com>
>>>> ---
>>>
>>> [...]
>>>
>>>> @@ -136,6 +153,11 @@ reserved-memory {
>>>>  		#size-cells = <2>;
>>>>  		ranges;
>>>>  
>>>> +		btss_region: bluetooth@7000000 {
>>>> +			reg = <0x0 0x07000000 0x0 0x58000>;
>>>
>>> FWIW RAM starts at 0x4000_0000 - I'm thinking whether this should
>>> just be the 'reg' value of the bluetooth node. This makes even more
>>> sense as you write to this region using I/O accessors
> 
> I wasn't sure whether setting the unit address to the memory region it
> uses and write to. Perhaps Bjorn/Krzysztof can provide guidance?
> So essentially, the proposal would be for the bluetooth node without a
> reg property to look like:
> 
> bluetooth@7000000 {
> ...
> 	memory-region = <&btss_region>	--> which starts at 0x07000000

I was proposing that we remove the reserved-memory region and define
this register range only through the 'reg' property.

> };
>  > FWIW2: The region is called "BT_RAM"
>>
>> Konrad
> 
> Thanks, I'll update the node name of the memory region to bt_ram@7000000

Node names (between ':' and '@') must not contain underscores, use a
hyphen there.

Konrad
