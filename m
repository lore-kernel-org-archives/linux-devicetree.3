Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EDA3391848
	for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 11:23:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774869836; cv=none; b=GyfwvBVGOf+LNZc/NQgjgaDAzfUsIwo881DSM2732fx0sgHqIjValTjozso8Czw8JvhxxxiP9IxBx07vgK0KdvFHOARtSMrGxT+ykpNlukjHBoXNFHL8mTF05WdgTFIXb5koAGyO840atIili0ECFS4bFAQdh1x0JRnblVUBvwQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774869836; c=relaxed/simple;
	bh=XNSFdpfM2bR32VIL/Pg72BqKpzv1k5qHNf3X+rW3gcM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Z1lABa2equM29SlJAsjcEJ90GAEFeZqODq/NIULdOmTRZUFxpaycLgclxkSiq7g8ZhIFRpGi0AZMAIYHsuAwT0kf011e3I4CSsCWCd86olcPrL9J7L1DoUdHCx8tGwOm0q9V3E6vrRzX9dR07gcvu7BsrIBI37YJ75qyZ/aWnGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=k22DrDpp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=j0e3V0bY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="k22DrDpp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="j0e3V0bY"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62UAqH6Z2724837
	for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 11:23:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/B/dlQtYbpnYFICsQED7Vf8n3G5q0NzZv4+0ckMoCzc=; b=k22DrDpp6dykv5Um
	6eVOK9Ohrszxsb9mAphHmQ73KOyjP2+fQoqqQDW614ch/+9W/B2IrtE0EP98kFYw
	q+NL7yaay59gqCdS5CBz4UUNc2t+cQgHWyS1HJEsL4xHVk/D4jr1c+pYelKhN2ZO
	QTftm/qbf6DSRGwby+1HO+Nb1Jyzk5Yem3VBfZ37sFfPEzU0VTzDfqt/bUbVuG5p
	yDCaxJ9tPq+1MZBGa1glC5yiallFr5H0IuVOq+zsRbSxPNdHPCU07mRZ6QH0Ryo/
	u4hVXevpDaDAO3OWe4neb7VIi9A2i2BeqIeeejV5O3KoWPxvv2hTiKarttlQdq2Y
	zPeP8Q==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d7qt0g39j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 11:23:53 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-354c0234c1fso5098326a91.2
        for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 04:23:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774869832; x=1775474632; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/B/dlQtYbpnYFICsQED7Vf8n3G5q0NzZv4+0ckMoCzc=;
        b=j0e3V0bYUVn/Qji5ER54kJDydi1uTO+OCOEAvkp6BmjbaQ7oeIZsrF7Nu2dXP6Xl0e
         TDimJi3Fz+HICBV7drYlpaL7Dpru1KZWa01jioUPL/u70umTaf+SMoME/0Kmo4yHQnCi
         sHNdlHnygLPVTRgv+K+SiVLcpKka4wcwaRsEqGHT/rSiEqq6GK7Ar5uOHEweeGENczUZ
         sjCaYyMMiSAM6ppamZmQv+cqwaSbXOkhkKuKCm+aywH+/vwj/mE4+ijUzMBgUBHq0TH0
         a32irDW13XWSQEhRIy1tzX0slTddPsdvEus778c1Hhm4aTUcJl6Alj1+fZ30z6DwlIxU
         oqcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774869832; x=1775474632;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/B/dlQtYbpnYFICsQED7Vf8n3G5q0NzZv4+0ckMoCzc=;
        b=g3m4UbGB37U0HcgOnPqJKQZ7GdB3gkPh9XlIplQ8WXu+o0kgd0vlCCqVeRfUxk0CJU
         22wIYbJ4DrdRxTeHmidNOcEX/M2jeTFl/WR6GK0lR+c52ZTjqE4hZxwHVJ2cnfzMDl/b
         TapKQQF5tBDxYV1k2oW2XuUvuv1XXc+wNWWteZglDBNFBNr4mritRwuczHVP3Kco7yX5
         /yU81Hb3MP3eo3X5mPpi9+AwcQavGw3chc4dOJ7WdsvuJMKJhA21VSoni2ZPgLu6koTZ
         LU/omd+xldzEBRBu+qZ3Yv8TNBXX0Rpl0FIZHYIQ69wh1brXiuGz+8HAxF/w5R0Fmg8n
         Jg0Q==
X-Forwarded-Encrypted: i=1; AJvYcCWBnVvmnEugVfWRWRdE3RxzvnqbRCcXke8iCkB8JM8MfrBdbdUs2KyKScua5Dl6se7gsTc+ykjIeNVG@vger.kernel.org
X-Gm-Message-State: AOJu0Yyqs9FxEDzO/81XcDQtzWOVwDc/v30I9hNm2wtivjETpV0qWlzo
	ToPDm41+mqRcYMy//UYTz9xbfceWnlJcwCFZvErBDO9v+GD6skmI5a6hQL5RGrGgd0h2j/t0KzA
	mKcYEAISMDEpBC9BK2P7516pARvjWih4Nbju75V5eMgD8pTqsRevFzsKEZCOmpjJyW4TluH6e
X-Gm-Gg: ATEYQzzxcTC0KeIVVPIRicoP693WUzICuxMEHpyN/8i7+ydSNNELgLNM4sgmvz3CQgh
	08g120yb25wZ+v/AUryuI6qMoeUG72UlJDjnBilMJqhqRwPk8s1qyeWyV+wOBgebpzH08VDjQ9G
	uWrQIJrDKPfZjg8N56nnGamGJbiKRDrFB+UUXbEQfG6f03MgS0/A8E93vk7LY6X9bmwIg4n/T7S
	PAv4q27aXrz81WWugVr+UIxqs1m0Ve/ujDJKWulSorIWhUtrqtKiJDJYRGDdOPadHTeb5LsDs2h
	jpsyUrf0cKDLGBVDM+s0/7dLFHHdTPBl6bVo0RPDT8otTHxmrHGQNpWzntV/0cdCYdVc6UY6r+p
	uHSKhSueeTBp/Kq2u/+sNwneYdtP1cxr0N4sMez8rLIai3s8ASDEemg==
X-Received: by 2002:a17:90b:3c8a:b0:35b:e4d8:e21d with SMTP id 98e67ed59e1d1-35c2ffb7102mr9816233a91.2.1774869831819;
        Mon, 30 Mar 2026 04:23:51 -0700 (PDT)
X-Received: by 2002:a17:90b:3c8a:b0:35b:e4d8:e21d with SMTP id 98e67ed59e1d1-35c2ffb7102mr9816210a91.2.1774869831315;
        Mon, 30 Mar 2026 04:23:51 -0700 (PDT)
Received: from [10.218.4.221] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c769d8337d3sm3739077a12.8.2026.03.30.04.23.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Mar 2026 04:23:51 -0700 (PDT)
Message-ID: <20062190-609a-4977-99be-c27df90ff321@oss.qualcomm.com>
Date: Mon, 30 Mar 2026 16:53:45 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 3/6] arm64: dts: qcom: talos: Add QSPI support
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-spi@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260324-spi-nor-v1-0-3efe59c1c119@oss.qualcomm.com>
 <20260324-spi-nor-v1-3-3efe59c1c119@oss.qualcomm.com>
 <34cifkyw3pgky4nhcu4jwf2uveszre23kvesr7ksyjvmqhfspo@avsvwa3quvsp>
 <9d7c5d36-c981-43ed-a08b-3b75c25fad1e@oss.qualcomm.com>
Content-Language: en-US
From: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
In-Reply-To: <9d7c5d36-c981-43ed-a08b-3b75c25fad1e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=XN09iAhE c=1 sm=1 tr=0 ts=69ca5d49 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=x5R1qbOTbg2SGMIGZqsA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: k4noVTtCMpyN_13EnVS7ijD_osJ8b_Pd
X-Proofpoint-ORIG-GUID: k4noVTtCMpyN_13EnVS7ijD_osJ8b_Pd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMwMDA4OSBTYWx0ZWRfXxRm4EonpzoYZ
 thMt2lbfQB0dgDaNK907Av7BaooEoTqdseDorYnXhQByMak+I3wRch9JugVilLi4OpEyC+uG9+T
 Cqccne0cvIKftjHit1wvlJL2bWAl2OI2kbZMO/llEzQfxzUYhq/X9an5yWOC+sb10SJs1/P2+s0
 0QfXJ5wPNEUyyfKXhGFYR5oPkyCglHQ0rytq9KmYCyTTaExXSLO8ZBljiocZ/3qYMOdBySq4j7n
 jwUhVL6CXpz88laoegkg6FH5tGCAJ5PL/kPVyp0jvPmjfcAmhN8jlKD4wsDkoBvdUmDVEdpzbwS
 LBuUxM+9yRH5KO+aUvz9OV/C9olbu6QsQ3W/xedFAe8n5v60ClxF6geLWxUIQRbrtvpEZzBESr2
 xkmop2mOeZREZubYPMl0N4b5gFpOFkjImnak8j3q44jdqFZPaMi5j6rqHWk1uiocMF+nPPfI7Y1
 juSxvrxDe5nCkESq6hQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-29_05,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 phishscore=0 impostorscore=0
 lowpriorityscore=0 spamscore=0 suspectscore=0 bulkscore=0 malwarescore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603300089



On 3/25/2026 3:02 PM, Konrad Dybcio wrote:
> On 3/24/26 9:51 PM, Dmitry Baryshkov wrote:
>> On Tue, Mar 24, 2026 at 06:43:20PM +0530, Viken Dadhaniya wrote:
>>> The Talos (QCS615) platform includes a QSPI controller used for accessing
>>> external flash storage. Add the QSPI OPP table, TLMM pinmux entries, and
>>> the QSPI controller node to enable support for this hardware.
>>>
>>> Signed-off-by: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
>>> ---
>>>  arch/arm64/boot/dts/qcom/talos.dtsi | 80 +++++++++++++++++++++++++++++++++++++
>>>  1 file changed, 80 insertions(+)
>>>
>>> diff --git a/arch/arm64/boot/dts/qcom/talos.dtsi b/arch/arm64/boot/dts/qcom/talos.dtsi
>>> index 75716b4a58d6..fd727924b8ca 100644
>>> --- a/arch/arm64/boot/dts/qcom/talos.dtsi
>>> +++ b/arch/arm64/boot/dts/qcom/talos.dtsi
>>> @@ -530,6 +530,25 @@ cdsp_smp2p_in: slave-kernel {
>>>  
>>>  	};
>>>  
>>> +	qspi_opp_table: opp-table-qspi {
>>
>> Why is it not defined inside the QSPI device itself?
> 
> The QSPI device has #address-cells = <1>, so we'd get:
> 
> Warning (spi_bus_reg): /soc@0/spi@88dc000/opp-table-qspi: missing or empty reg property
> 
> Konrad

Yes, I am seeing the same warning when the OPP table is placed inline
under the QSPI node.

Given that opp-table nodes are not addressable bus devices and therefore
do not define a reg property, what would be your preferred way to model
this while keeping the DT warning‑free?

Would placing the OPP table as a sibling of the QSPI node (for example
under the same &soc scope) and referencing it via operating-points-v2 be
acceptable in this case, even though there is only a single QSPI instance?

Thanks for your guidance.

Best regards,
Viken
