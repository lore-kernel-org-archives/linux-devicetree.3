Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DC5E4E9C26
	for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 15:55:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791993326; cv=none; b=Z4xRhWe7YRcTtaelVGg0iJDFsXn59B/n6JbXHF/kwRxsL6PBlvIHLO5q4AzcipvaytHCr0WZDWXasiS43TjgF1p/ImwqXvUe5QIZu+8leL8GrEiOtLTK8BEyOunTdHqGZPrKSoREPvzov6z8GpxHkwO6ymax/f4Ojp870tavcpo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791993326; c=relaxed/simple;
	bh=rwH+vdceSleIqKUqXbgH5DPfQMmo2ZUh+NLZ6kh6qGk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=amdats7bDo7d8v5TJ77728edISx2bOSchJHe7fh/FhkP3Bytu/1YvhEVInaBR1IeqQsHtH0CGRSLIAa1F01Ogx8YDImfYz3Rv9ZUFvJlUgTFs5bi1zxGrco3Fsm+JWTdHm+JcYGFFl3dkcz1BzaJekP7AwvkxLnzgtjWRp8xV4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fAFqYUt/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ICB/71Mc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fAFqYUt/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ICB/71Mc"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69EF4dj14167548
	for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 15:55:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uPGeQth9uCLH66RWzaLiHg+7uRpJJUsd52ttuniNAo8=; b=fAFqYUt/JfYFnAtx
	Dkyqbrl4NrsTFgK+R19kuW5T55w5V2dZGOyWE8H0AyWAXq0xKxBRWjfScFXaxPZx
	V1rDcu3SuwYk3uwTMnGRvkBObFV4+F55eLklmceCz1vl/jVHWZSYinmm5n4Bt1iB
	+GJQIvDtBNcsz2SORcG71Uny0zJ0h7Aou7xi0TfbTa/EILYRibFc5a2cSP/iqrXl
	p/3Erq7UM1FnJjUQbePIxHrwAYJAhh4hIP33zxd9QBaDUUPt2eAEUiXEBrrH4GZW
	LbrbzvUXcG0mthMAtkeUamSvboWHwm4pfziwxG1lhWezp8PR9ajgcglwrRqrqBXl
	p1bAGw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hac2306ak-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 15:55:24 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3a46f0f158dso4624410a91.1
        for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 08:55:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791993324; x=1792598124; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uPGeQth9uCLH66RWzaLiHg+7uRpJJUsd52ttuniNAo8=;
        b=ICB/71McWjWcK8kOt/dxVbSevNIN71/Pwu4XOkpDuERpmZafnLkYhP2jpFeqGzS/yw
         dAHrxSYtiEMp6YP9B6otRtE3pBYS2LoqER7HbNkvxTXGIGZ3DlH7ZC5kJK46Vme/FyyD
         kzLOE05DCIBbmaBVdevodgUfadELs9d3xkrYOZa+yUs1smVsIvW8SqionvTKnb4g/TOD
         Xzo93HEUB3H/9n5PI5ASy6e8r2yL1ifMqZv0S3buEWnieIGbDBmWs91WamRavx2TKycs
         l9UANWFkM66zlwKIiUq9W+hmPpnZtc72RjaX/iVZY8r0ZF2ihCBDc86UlZlJzCeZlW/u
         0auw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791993324; x=1792598124;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uPGeQth9uCLH66RWzaLiHg+7uRpJJUsd52ttuniNAo8=;
        b=F+u6rao7I0tnsoswwqbYWq25DSs31+rCnq1znihj6JBy69x6os/l5MC9ISyLXZibqv
         gL6PaXPy0BVG7CVVx5LtsURK6+e1QKcF5XxQ0K5fTuVHSsQCfh1M7XsPzFOOdNyxa+P/
         VPhQ7L8iCiqwFTMdoMNVI9Ju20tTToO5hvCQkRHOb8nIv9UiYkNQv/jUlrJNABLcdfAM
         jwUb4cYqgInJVCO1v/yU5F6X0FVCvkgHbKFomfqkIh5O3EZYdDrEmsCDCGYX8DUGgFE1
         gu9XtPi6GwFx1EAEZnGCKbBx10ZeF2ps3Khw5Jl0+Z5noyAWq9ZBNgnH5SzPjuKMmmWs
         KN8A==
X-Forwarded-Encrypted: i=1; AKwUvBxDMiPfEwgE2PpjzWaDIiYmg+rXwjfBr3y6CEw0e/EX76YnBJUcNeHdTBpqZ/1I1Wih0RqNKZm8B5y4@vger.kernel.org
X-Gm-Message-State: AFq9FYKLPZQG8OQ9Ns0zpjEODKn7H8bbIRSFGokBKDrcIgm+rO6v8SxV
	hp3ylNsJSlCkXhOk8/2bdvIHAnDcJLPR+tOIpqO/QabUd4Hqr9wx8jkN+Lym7izRtGeb9QMbJyA
	0pP56MJqqQEoFcWYdb9Qgu8OnebpF0XZNkBrt4/Eo7pGqzrceW52hAzFe1Sw48740
X-Gm-Gg: AYBFou20uqgvGHlY46DG7uRya0tnoRC5YzoCYxR4plKtKpnH1Zkd8u+ypNBXxAeK0D8
	ORFgJ2CTHL0H3Ckimu2UudpayqnsHfvU2DNd2rN0BLdoACDm9UOethNXYY3T29MJQXz+z34iWYP
	5maSoJieRbOCzty9x+6XahvYnPFOePNAYaOkVwA0tu6BEA0ABsZxQwt59LROvTCVKWYmpQHIa3u
	TBkVr3Js5g+gd2rgdDa5qNLfUcy/OKYoXQUZqNt6kjMyUiN87JUKCCdIVO7vY2aM0gbRyXne/N1
	WVBJFA0zkWrnZYphUvSSOf73RXuQbOdocd3g31vgHYCaxSPqMBx7kkTuuaI/uCayQND5TwbWGs/
	So3RJNkrx6V2vKoh5XlH+YJjKdhR/iMT254mM0T7YJZw=
X-Received: by 2002:a17:90a:e70c:b0:3ab:1a5:cd2 with SMTP id 98e67ed59e1d1-3ab3ac9b310mr9010760a91.35.1791993323654;
        Wed, 14 Oct 2026 08:55:23 -0700 (PDT)
X-Received: by 2002:a17:90a:e70c:b0:3ab:1a5:cd2 with SMTP id 98e67ed59e1d1-3ab3ac9b310mr9010695a91.35.1791993321018;
        Wed, 14 Oct 2026 08:55:21 -0700 (PDT)
Received: from [192.168.1.8] ([122.164.80.129])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac9307d287sm172932a91.1.2026.10.14.08.55.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Oct 2026 08:55:18 -0700 (PDT)
Message-ID: <0d5980c5-57fc-43ab-bcf4-f72f9e36318e@oss.qualcomm.com>
Date: Wed, 14 Oct 2026 21:25:11 +0530
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
 <78480c25-6d83-4e70-a9f6-826760046cda@oss.qualcomm.com>
 <77b5681e-21e7-4a93-ab35-15554f7637c8@oss.qualcomm.com>
Content-Language: en-US
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
In-Reply-To: <77b5681e-21e7-4a93-ab35-15554f7637c8@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=PYJqFShd c=1 sm=1 tr=0 ts=6acfa5ec cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=vSQal4Cqo5fxyC+YxRTyzw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=vn1o8rcWqlrXRnvXbFcA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDA2MyBTYWx0ZWRfX0t13EajBJ729
 1MhmA+XMdAe8yFLQwt2n7UZkn3xM6unMkXF2XKd7ADgNfPOzVKuxTCu4JR0OCpER3lZatU24uUK
 RTuWm4UxyJ3MVeitPguWJJ2B3xbHJks=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDA2MyBTYWx0ZWRfX8oYdwrFBh4OH
 x8Ejng8nSISEzzNnC3YFjEGL9ftYY7OVGJkFuCB+d50ri8fnqrK9lfAV8N1qi5HxI2nOf+1/cKU
 45CI4drQqdBc0iZFSsvB3IYlBeBNrdGYmEGsTPINMaNqyCMyg9jv9TDXq24ObSqOv/y0W8jBWow
 nBSwCwNyplWB74yXrdnaqYhBot4TGZy7Jg9aH7v47OuoO2zG0sgf8Gkjv9yp9OgSlI/b9YKz1yk
 g4TXUneORnC22s/kBTh94BSAHqcd3Uq+v6TYQLdqH3gJlowXVWjHZ0tPQjU5YfuyzyoSltwnPqQ
 UVcXPQtvQNDqvnT4ko/+X8AmEeBbc9iChQacHJb4lgTuIC4faUZZWwlmTN+KsRoZEs4IGxn93En
 PLZKw7FGCaaN34cRWaqMSLvwK4n1vlhYIurjFJnkRRDJJzoZVxzefL1OfPoSNExzuCun3tT1zgu
 GAjYxA4s3d4PuEijNSQ==
X-Proofpoint-GUID: _BCrOjxEdQlCP-G1ebcqtycG-aozuXWq
X-Proofpoint-ORIG-GUID: _BCrOjxEdQlCP-G1ebcqtycG-aozuXWq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 priorityscore=1501
 suspectscore=0 phishscore=0 malwarescore=0 impostorscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610140063


On 10/13/2026 9:19 PM, Konrad Dybcio wrote:
> On 10/13/26 5:16 PM, Kathiravan Thirumoorthy wrote:
>> On 10/13/2026 8:11 PM, Konrad Dybcio wrote:
>>> On 10/13/26 3:14 PM, Kathiravan Thirumoorthy wrote:
>>>> On 10/12/2026 12:53 PM, Varadarajan Narayanan wrote:
>>>>> RDP504 has USB, PCIe and SPI NAND devices populated. EMMC and NAND
>>>>> share the GPIOs. The board has to be reworked to change from EMMC
>>>>> to NAND variant. Rename ipq5210-rdp504.dts as ipq5210-rdp504-common.dtsi
>>>>> and include it in variant specific DTS file.
>>>>>
>>>>> Describe the fixed USB regulators, PCIe reset GPIOs, QPIC SPI NAND flash
>>>>> and required pinctrl states. Enable QPIC BAM, USB and PCIe for the board.
>>>>>
>>>>> Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
>>>>> ---
>>>>>     .../arm64/boot/dts/qcom/ipq5210-rdp504-common.dtsi | 209 +++++++++++++++++++++
>>>>>     arch/arm64/boot/dts/qcom/ipq5210-rdp504.dts        |  66 +------
>>>>>     2 files changed, 211 insertions(+), 64 deletions(-)
>>>> [...]
>>>>
>>>>> +
>>>>> +&qpic_bam {
>>>>> +    status = "okay";
>>>>> +};
>>>> NAND is the only consumer of this BAM. Should we move it to NAND DTS?
>>> Can we enable it by default? (i.e. is there any reason not to?)
>> I don't see any reason for not enabling this by default . Since nand is the only consumer of the BAM DMA, we enable both nodes together to keep the unneeded devices in disabled state.
> The first sentence says "we can", the second says "we can't"

Looking at the other SoC DTS files, BAM node is enabled by default. So I 
don't have any concerns on enabling this node by default.

>
> Konrad
