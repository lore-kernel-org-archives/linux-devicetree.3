Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73F12408001
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 13:13:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781097188; cv=none; b=H2hpJdb5UI7jWs/3mfupudkR+Za4NZxcfbS5am50luYSVWMraAOEMYdsHEm25TY4cBLCjZPTdppW0UlUD0CsqK/oxsTDyVoa6m42q1xf9HRlQf6uO/6CCv2YFwNZ84+tOVujVzkRGKB9qiEWXopXzfRIeHpf+N26AAoh76w60y0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781097188; c=relaxed/simple;
	bh=bsr7pJ5YEZy946+9gdtl1hv8ZREddttX2UY5gd/ijJ8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FxL7CBjvlFi9E+kq0m68d4j68BCd0PLim9OImucvTxLf0/7ubD0KpFiF3A0GCXsyYsmfq/K8pjQ40vNVe9nzd2rBFaJWFElhfEkQnypXnw5UwNkuzSpsEwnblBPS8tfrcVP+qOkQPe5/Afvp8rci/0x76MiQZTUGAzZ/h5d3E3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=d/kx6CLg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Z145d8NS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="d/kx6CLg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Z145d8NS"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65ACBfkv1134949
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 13:13:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qaSgPTMhlo8CQK8cSLxNg0Oqjf6PBr9dF4U4OY2jF/U=; b=d/kx6CLgd6zQUrwP
	hhmIoyfQN/yAa2wZXHYVkz/3dhUpgTCsVM+nQKg1IPOs5JJJH8oTtfO7k5PnRorA
	5yCO8l1VyXHXODD2wT/S+AwqJB/BT2lKltdKCr/wHTEZfvD1FQpmGRoIhXoRAiPy
	kHXlzJEUqdDpt12JphD5zOB6gleeQghxeC/XDQrKGMR8GrDDanDlC6650ZrKhkrd
	VTUg8HdWVQ1OqNWtHFAnc/eMOI+JnvtmpAi/mIw12441z6PrXOSpuetNP5nLcerX
	hcFniXgNBUzZXF2F3HfiWq1V6yk4T1H5ByQjyU/gdEVpdy8sMeKAKth6zloxMMZ/
	tbC2Rg==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eq0m1sx7v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 13:13:06 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-6c4271166f3so302199137.0
        for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 06:13:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781097186; x=1781701986; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qaSgPTMhlo8CQK8cSLxNg0Oqjf6PBr9dF4U4OY2jF/U=;
        b=Z145d8NSdErqQr1e08mcoeJPFi1slbIDCLcxCwsSkw04GLrpe9NoAeiWtpb7wWs+uh
         0J4sPBBKxExbkORkCnc6rvJ+usSGnMtHzJT512GdRuub8jyX+xQ+aWqsVcfPBYBYrj/u
         W8qMRI85rE41hI7dLuBH+3EBspbvfa3sIz4E5bz7G07soYZP5ff9/JPQ+RbV2FknncFV
         gE1Wp6cqkgbm29mMoA8LwF/V7RE/kVJSkh64u/g+/uTCSLZvrLN8QsotQ+saAHl8jcP8
         TLYn4o88QEpJWz48GBi/Uokxc9sUnbo7+LfIzxoEQNh64BI5AGNZc6UgMnFmVg/j7iQG
         9VUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781097186; x=1781701986;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qaSgPTMhlo8CQK8cSLxNg0Oqjf6PBr9dF4U4OY2jF/U=;
        b=ro+Bo9/GHp20KuGDYJIyszKDCNhfaKY0yz8A1xdYfyXZRtxX984+RRyoEmFMyj8t8s
         doj7YyLG3CXM5DVByZ8pEAXjWXGSSKYz6csnJBmazFouJu+RUrti/4ZIkSEfGGOACLA2
         86r+kHK7E0rFjmO4IvRZxscTEee8HSbj2mu2DedSDl73Uh+CYuxLnY4mAmUzp7gBBF37
         iw6k4uIJsUhhRsIylHiRpIrFuss8TOfrWLaoOvJOVmDmY8eLW6xTm3qOjYr876NEMpUf
         Lou9ZhacKm0ElChB0LzrcrFVA4DVemlGUneSxtF7AzzkgP2tVoO1gJwXIwUTfAYMlV1n
         M5Wg==
X-Forwarded-Encrypted: i=1; AFNElJ9kDnwO6NNKY8hkimOnrOntVPWt7QHe1zZKmrA+SP4KndpBmgjw0Ef9yHDy2BMYnNSv+CBR43o9E2Oi@vger.kernel.org
X-Gm-Message-State: AOJu0YxUEOsB4CrtrxxEfGKkXxFEFyqJrc2F0T3+kuW8GXYg3zDH+wpp
	qs0ARs0dxEzcMGvjUVYFy39GEPA7NX/YRwE4s4DKs9QYHbvPuvb9vMBQ+umHOM4kPE+pMquwT5E
	u97v2UiMKk506NVSLsX0G4shM2ronlfGpoT4+pMgNt1YZRsff7YnbBdY4L5aV+nTF
X-Gm-Gg: Acq92OFS6V0+Iyr/yCiP34RN/+Z8lNNRkB1u49l+Lu4PpG1WE+N/JkgIIHbqQgY4SCq
	Cotbav/LQzFwMRw65qnY5HT0JM6qYLm7GQwjui3TDOy8c4AD3z9XyUYxrgUozmHZxZvo/X5l/Fb
	SBpUIsFMG1BcsFuJQtqHcXcYwWe3w7sU54+oA+oT05psbKwmDWE8P6VnwUs8k/s4a1Bc19ucL7Z
	5W+zyhwYwd58bVbP+vRECJ2P2xDmPckaCiLXCAt63f6iG1lPyCgGRQVQWPNSeH1Gw28sjAMXESk
	iQcfa04lOvzK1Fd5Py3WRfs8a4sIT5GNFUvZ2TrXgM5YsX+GW8hvXgtVmh+6rqCE04P0WtZEfXA
	FDnGziKghljt8fbGYJFVq3S4JXki54uV0YdyqS4gave9nbC/LzU7qSTNE
X-Received: by 2002:a05:6102:f07:b0:632:8717:e553 with SMTP id ada2fe7eead31-6feff065149mr3913047137.7.1781097185731;
        Wed, 10 Jun 2026 06:13:05 -0700 (PDT)
X-Received: by 2002:a05:6102:f07:b0:632:8717:e553 with SMTP id ada2fe7eead31-6feff065149mr3913032137.7.1781097185087;
        Wed, 10 Jun 2026 06:13:05 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bf2f2da4447sm912289566b.10.2026.06.10.06.13.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Jun 2026 06:13:04 -0700 (PDT)
Message-ID: <852caded-eacf-4ac1-8fe5-83dd9285ef11@oss.qualcomm.com>
Date: Wed, 10 Jun 2026 15:13:01 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/4] Fix up QUSB2 PHY description for MSM8996/SM61[12]5
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Iskren Chernev <me@iskren.info>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260610-topic-8996_61x5_qusb2phy-v1-0-d7135980e78f@oss.qualcomm.com>
 <b05e860e-ace5-4399-bbd9-493f7bbfe74d@oss.qualcomm.com>
 <cnyhnyoce6v4d5roijrceuzd3ujvvw7ozklulaxkibptvjancm@cqbqu2aa7bz6>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <cnyhnyoce6v4d5roijrceuzd3ujvvw7ozklulaxkibptvjancm@cqbqu2aa7bz6>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEwMDEyNiBTYWx0ZWRfX768uIDtlBBbq
 3VVeh0b1BLjpYqZ7Dlige8adF9DQbONpxYPBllk/S2KGjXdfxrC/NMjCMHhOc2VmXfYJLYozLtA
 TaoHEDnog78W2hTfrwpuk0ut6aYFM7IJG07gnNu7n1TPl1APk9xhNf83NSPicV/r2sId8w3mBhQ
 QX5qrjAF83d8W7lgwdaRR3RsENP4LT993JwBWr0fDXE+wuHrzsbuKMpEUgarydzvJT9K0GC0Rnw
 nF6YcHx94KEL29mIr+OzLIc5hEsKR7ovLmTgv9kZUqssRgL0k9LEIx808mI5JbPfR0K6ucX9+b+
 HcSAghpFhYr1vQ1iofQJTBFZ/Io+rLWHPtiLDL4ypZtgQOH6O8iOKXLmLb4Mwn3Ycfs6MgygK0k
 /95oG/T5+HK3zpZYhI1u7ozbRhNN9iXKsOn16gMEQBEt/biZwDFw7w0dpVee/ryJTfDRHTeZXqs
 2JcIEp6kZkk7o3uksWw==
X-Proofpoint-GUID: 9CuyPdeEpiapKmO5yT1P1MKu-uIayRl4
X-Authority-Analysis: v=2.4 cv=UdJhjqSN c=1 sm=1 tr=0 ts=6a2962e2 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=nlUS1CZQJJjccDyTXbgA:9 a=QEXdDO2ut3YA:10
 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-ORIG-GUID: 9CuyPdeEpiapKmO5yT1P1MKu-uIayRl4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-10_03,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 phishscore=0 priorityscore=1501 bulkscore=0
 malwarescore=0 clxscore=1015 lowpriorityscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606100126

On 6/10/26 3:03 PM, Dmitry Baryshkov wrote:
> On Wed, Jun 10, 2026 at 02:49:31PM +0200, Konrad Dybcio wrote:
>> On 6/10/26 2:04 PM, Konrad Dybcio wrote:
>>> The MSM8996 QUSB2PHY was not being guaranteed a power source.
>>> The SM6125's QUSB2PHY was believed to be idential as the 96 one. It
>>> wasn't. This series tackles that, freeing us of some dt checker
>>> errors about vdd-supply not found on MSM8996 boards.
>>>
>>> Compile-tested only, but docs confirm my findings..
>>>
>>> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>> ---
>>> Konrad Dybcio (4):
>>>       dt-bindings: phy: qcom,qusb2: Straighten out SM6125 and MSM8996
>>>       phy: qcom-qusb2: Fix SM6115 init sequence
>>>       arm64: dts: qcom: msm8996: Add VDD_MX to QUSB2 PHYs
>>>       arm64: dts: qcom: sm6125: Fix QUSB2 compatible
>>>
>>>  .../devicetree/bindings/phy/qcom,qusb2-phy.yaml    | 31 ++++++++++++++++++++--
>>>  arch/arm64/boot/dts/qcom/msm8996.dtsi              | 10 +++++++
>>>  arch/arm64/boot/dts/qcom/sm6125.dtsi               |  3 ++-
>>>  drivers/phy/qualcomm/phy-qcom-qusb2.c              |  4 +--
>>>  4 files changed, 43 insertions(+), 5 deletions(-)
>>> ---
>>
>> Note that msm8996pro may need even more looking into, but that's a
>> story for another day
> 
> JFYI, MSM8996 Pro is being used in the DRM / Mesa CI. If there is an
> important difference, it would be nice to get it sorted out too.

reg   96   pro
0x80 0xF8  0xD0 [!] QUSB2PHY_PORT_TUNE1
0x84 0xB3  0xB3
0x88 0x83  0x83
0x8C 0xC0  0xC0
0x90 none  0x02 [!] QUSB2PHY_PORT_TUNE5
0x08 0x30  0x30
0x0C 0x79  0x79
0x10 0x21  0x21
0x9C 0x14  0x14
0x1C 0x9F  0x9F
0x18 0x00  0x00

apparently this is indeed SoC-specific (via docs) but also apparently
may not be very important (although should be fixed regardless as
some designs may rely on this)

Konrad
