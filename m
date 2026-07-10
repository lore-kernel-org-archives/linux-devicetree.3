Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CBC5378D7B
	for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 09:01:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783674096; cv=none; b=LUvAONyO9ubWNeHU0A9l0AOV/TpIJNo8/jYkca75Ts4GAW8Mmkq/MPhAypcJtF7pWQ5tZ5qiB34AEYuefz0J6x7jOq3bZrtLu15OqVi4NSAE1SPHcM2pnleFeGLe27m/zqluKXF5rTms5kB9GRrJAgPlq1A/rn8Ew1FYpsfp18M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783674096; c=relaxed/simple;
	bh=2hU5vlqn/46hnJA5UcucEoZwkthop1XHo76k/5pv2cs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Lzhbe90yH9IH5HA+WNRtM/nqHgh9VHc4eFcZs31bBe6fqHFLLhadkuRW3/VG6I1doVGhDzCjBXhU5GMd07xyotiipVRTZgFVC5bGPLfyyrlufGZKynFDxXE480kFMxBlNMD7BMYTRYn3eYXSHphyp9gyIhYea4uyuh3Gpo373KE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DFg+EsVW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=F4ZFEV+g; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DFg+EsVW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="F4ZFEV+g"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66A7dqfi183375
	for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 09:01:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wuzMI49ssy9A7XP1S29dJe48fWRlUqZSEkKR0Ps53jk=; b=DFg+EsVWXNaVWPc1
	jba1FyX9qMwaMoOQNdh/HUEeqIlOIW9Zs+UvHhgTrHtA53yc/0jcAlEP5Sc7vhdz
	WWtXaBNjOSxz2bjQ1dpkZqghqEArRBMX1u3KII2dp30gZiqROBkzVAGn9pvgCVkG
	6ALHxMFjCsmRpI2ONVsAlmaLcxcIiHMg/OTIYrdTeuvbcKS2t64gVsnwkW0gVK3l
	GulZArBQBrtw6zgAl7YRRA+jePey8M5SAmtcOfUmvyXrHXDy+Zo6nl6+KbJU7qeF
	Dde/M6FiauuaIvvLKOkz2xc4cs/lZZeMea8ZnuR28OHU312GKw+LsubiablzBcSJ
	TB2PQA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fajte29rf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 09:01:34 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38c7e2730d6so930538a91.2
        for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 02:01:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783674094; x=1784278894; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wuzMI49ssy9A7XP1S29dJe48fWRlUqZSEkKR0Ps53jk=;
        b=F4ZFEV+gJ/F5hz7N5Ne206gnf0gssTzt8dEdI6Lv80ZDezONPEUokqqNJeweX1PUep
         5IfM2NR4JqNky875USYQEboLz2jIs4ryeXHYSmsTzJXVAtDXWhMd2B4j9+vYdQDxqRRI
         khF/em7jtLGFevrRx0L9V5Nu9JtYE64aYfSosBLQUqLBmuQxa2y5U8YrsSu/ye9AlDrx
         zu4UblFjZSHB+5w7ofXr5x/AwsmT6mCbg1vX8OyEOYa9UQy6COmELdnOQFb6Jbq04NXC
         5ggV1yXxPv8wA1VBP2q63vSi8wReCciCZGl8plSIXIVXphaCF8i9+E3rI6nXDjexZziQ
         /VBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783674094; x=1784278894;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wuzMI49ssy9A7XP1S29dJe48fWRlUqZSEkKR0Ps53jk=;
        b=bx3r8uRmPd7YzOt+TUyNGjf93610jVnnx98Cao+0BAlau0hgviWBnQ73AvOtiAkLuc
         +gXp94Ff4gpEEJyNm8FQP5zCpsOON29NaCszck5e+HrXhMWkXys72MNrmKMAWqLofbXC
         Gw+UiIclL35GKPVZSaw3Xmh7caYdVDNRbT25ecVl5nPrxo8R86hbiCOt5osxWkaN1lIz
         TG62UYHfF0Ze7aI2GWIpjK+So+R9N4xAqcMPEOHVd3RIWkOUKDjyASqkkwHDHAjpXZc1
         LPgKdlZDjwmg23JJoyWKcIcjhbOjy4yE1HAt9njohxOn4Amdmt54RwJk+baPXILvUIMt
         piAA==
X-Forwarded-Encrypted: i=1; AHgh+RoopH2XA+87T3jkcM0WJ91sZhPgdH1xziEcK2akWcDstVSlZCxr8eIf8Ra36smIq1TkxVwPFT8Xxm2Y@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9ly4wMYiCvylPZFtL5s6FWxCSGrf6+WujORlLfB1OHjsJmsyT
	7LMLAZTmekv6eaKLTRYJKSQG6GXuqUEEDykBhztDfoRZHesyCHL7a/rTWnJjlTkkH2SEE/GWDpG
	2E6HgfpFh5JkXAger8ynKmfg9kr8UuIAavx1jKUel8HmqQrIdviyRBfvPUoK+c+Rh
X-Gm-Gg: AfdE7clxGrVMUQ5TFP4EGvXpKEKxPUqzaIq8qM22UU5z0DxA3x+3ISuns+azhOlyDbp
	pYXiS1JP+Fhm6ynIsgjQHg4QDp7xkN2mAYx7UL9BCcRn13Z8PXRArurNHZ2r8Lrgr+2g7Q6Yi2J
	h+BwKxEuFzqbqCpaNX8c4jh4sh4zG6ZjWJ3sw1yfbJ19DxeNdri4jDcsDJPOvdqZ36gByzRBGfT
	rH6rs+Tzgsd0FvlPVYk0F65i6rq73BY4Td8cLBaq/jPmXkAC1E0qkbZNJcZoK48F29phYuQ5Xoz
	6ettLsm0JfCRxDX0fiPr+CZvq4mpwbvJkFdE9G5gx3BKpmXLnaQlLNm37Hvcoh5K3TsaOj5NntL
	CJZPBCz/W86RtvuiJqalFYdbLqE1hMbFL1vBxmNy4
X-Received: by 2002:a17:90b:3fcb:b0:387:e0db:bc2a with SMTP id 98e67ed59e1d1-389426928aemr10826691a91.42.1783674093782;
        Fri, 10 Jul 2026 02:01:33 -0700 (PDT)
X-Received: by 2002:a17:90b:3fcb:b0:387:e0db:bc2a with SMTP id 98e67ed59e1d1-389426928aemr10826636a91.42.1783674093347;
        Fri, 10 Jul 2026 02:01:33 -0700 (PDT)
Received: from [10.206.100.243] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38a5213f28csm2445496a91.0.2026.07.10.02.01.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Jul 2026 02:01:32 -0700 (PDT)
Message-ID: <ec5017a5-8af7-433c-a011-9ad7c6cd33b7@oss.qualcomm.com>
Date: Fri, 10 Jul 2026 14:31:27 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] arm64: dts: qcom: shikra-cqm-evk: Enable display
 and add ili7807s panel
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Nabige Aala <nabige.aala@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260706-shikra-dt-changes-v2-0-56fcd1659ea4@oss.qualcomm.com>
 <20260706-shikra-dt-changes-v2-2-56fcd1659ea4@oss.qualcomm.com>
 <8a3cc857-0b1c-4bd5-a5ce-a564823ca614@oss.qualcomm.com>
Content-Language: en-US
From: Arpit Saini <arpit.saini@oss.qualcomm.com>
In-Reply-To: <8a3cc857-0b1c-4bd5-a5ce-a564823ca614@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: gR-l9o5kyzyOvzDyupILsi-p456KyI1W
X-Proofpoint-ORIG-GUID: gR-l9o5kyzyOvzDyupILsi-p456KyI1W
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEwMDA4NyBTYWx0ZWRfX3gg0ncXpbEDZ
 pnOy32PeMAD6/qe4ysjjf9EjwxADty4yiQ1/g6qX5N3JVkNgsFv0SxH5p8r+JUsyc5nzyjFmbLa
 NecnEnc/XY+0yVoUrktV6A0Nc3twzQBGlIeOokbymh4A4N33FBu2fqOiBWFHhvsq4lPZMVs/EbY
 v0PX1sVQf7ex1VB/sFRPS972Lq4cdWK9S3E5HqqeAUFdEIrUCjc221RiAnBL79gNMENjWBeNFWK
 Hv31B7No33pH+NmoqStN2o4uCOIqTngzhXuZc/TAKWXEJ99V5wk89RRnrrc8cJdPWf4btap2hBS
 4+okjflfTvVDi8ddbrLgnCGkdpnCoWSbLHG063ofyc1RgeWKe3kBKE7jmE9YE1NZ+kD3fLjxHHi
 1K400bdgYdVtLh4GHrHojodtFc+CBpka0W6m00RXv6N1ow0c2jxHYkZRibuWFE9UQEF1G8QIsuC
 9fKrvleEoJifVWGXI1w==
X-Authority-Analysis: v=2.4 cv=N7MZ0W9B c=1 sm=1 tr=0 ts=6a50b4ee cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=WBgsH_M69gYJ2YN3IGUA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEwMDA4NyBTYWx0ZWRfX5KoLhXHeseIS
 oDJj8R19OT4uH84TV0caVVvcv+Xo7CdgtSDVApfe/yDHWOyFe9v05XEos9isGwMfzttdCYypxh8
 /sHoujg+st7DpQySWIo3ePyxLk5T3c0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-10_02,2026-07-09_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 impostorscore=0 suspectscore=0 adultscore=0
 malwarescore=0 phishscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607100087

Hi Konrad,

On 7/6/2026 3:33 PM, Konrad Dybcio wrote:
> On 7/6/26 8:04 AM, Nabige Aala wrote:
>> From: Arpit Saini <arpit.saini@oss.qualcomm.com>
>>
>> Enable the Qualcomm Shikra MDSS display subsystem on the Shikra CQM EVK
>> board and add the DLC0697 MIPI DSI display panel node. Pin pm4125_l5
>> to 1.232V with regulator-allow-set-load for DSI PHY PLL stability.
>>
>> Signed-off-by: Arpit Saini <arpit.saini@oss.qualcomm.com>
>> Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
>> ---
> [...]
>
>> +	panel_bl_en: panel-bl-en-state {
>> +		pins = "gpio91";
>> +		function = "gpio";
>> +		drive-strength = <2>;
>> +		bias-disable;
>> +		output-high;
>> +	};
>> +
>> +	panel_bl_en_suspend: panel-bl-en-suspend-state {
>> +		pins = "gpio91";
>> +		function = "gpio";
>> +		drive-strength = <2>;
>> +		bias-pull-down;
>> +		output-low;
>> +	};
> output-foo isn't necessary, the panel driver will assert it as
> necessary
>
> Konrad

Ack, thanks for pointing out.

Arpit

