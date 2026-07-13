Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A61E040862A
	for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 12:14:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783944893; cv=none; b=RkwJkxp0SfF6OmHEzbZQxiRtZtmKUPHAlkqkbg32828Iz6DsbGZBgwl6JGYd8rDb0sOwrizGNoXqE2ijMDO5GCRWsaWjuMsX2drJzPgV+yjV5Ja4H6e3urP3S7NfTNHWi0JMCu/GaBegl8OjRfl8RRmYMvP9Gwjru6XmYAIyADY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783944893; c=relaxed/simple;
	bh=b5cPk/8TTFRh8c69aoCwpRLmg547F0aWw9DtTVQXef4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qusxKqjHObV/StxaCDdJdKV77fAwxYA20QoB43yzn9U7gv8eNozGIasGP/QZdV+e8hjFewaHjO8EcotCe/Rx+DMHG05HdLpHF633+2QeVoqkVO1msZg/CVf3hJKwluBZxBhAjqT9hS7CzRdiu1CMc5JKg5ohvDIYizK6conIvNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TK40pqQi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KTQqdUvW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TK40pqQi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KTQqdUvW"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66DCDvR41428308
	for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 12:14:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JyxSXEtF5jsDzlt/U5zJMxAHTaONNDF+J4xpZtkdAOE=; b=TK40pqQinsRDQ9B8
	WUGGrb4qX+0zlMucwIBNV6/edXG3PF9zN+9PCtFjZWxzChQEl5jUSwrh9iJc3e9h
	XCTFbYxB1IcfCBTuGAzWDgdgNKWRuIclWZVkDw+FDTu+TE/DYoqTSUMllOwm680Q
	BnG4A+to5fmZx63ljS9hk65zMHXG6qiIgYWQawsk2NDW7cqwRLdXa2SmQdSOS5ZY
	DmeB4aH1MLQiU4Jbux0BxIDcoKPni3LdQcgiHkOpwS1gXyUwZrA5+/F9YONuSq75
	Ngf0YALRvBjxX8n6ZCQ1ipb0obrjn+yirMGYEKyyIoWrQE7pkHyLdim8hcjmWhnm
	LAHT4w==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fcurn1096-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 12:14:50 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2cc640dfde3so41759515ad.1
        for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 05:14:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783944889; x=1784549689; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JyxSXEtF5jsDzlt/U5zJMxAHTaONNDF+J4xpZtkdAOE=;
        b=KTQqdUvWUwHjaUdMFaeuTy5zCZ2QJfoKp+pICHBEYW78suTkN8YNmxaOkteLQR17Zo
         2qSwuHHITYABGJ6xoHfgIr7nANFM/udiGd/nbfDkSn9XRn2JbN1eykefV49DjHeqXo/V
         TGIJIDgZbp1vhK05nd72Nd8WSTJddT4XwLuz2bA4i2yIaF7mfBIMBbTGe3VezaH3tta4
         Bpls6rUk4o8jRKio35UI20l290rF1bqsPQDydvwGpjTkK+UIcqQy6PHkflKrXTv0QynS
         c8UuKizJgs1N8L+AGiRkEwZFeT8atAvBmJHv1ybWT9EGSUiEQd45Kbw0w8ZuwCY0bCYM
         Z4Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783944889; x=1784549689;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JyxSXEtF5jsDzlt/U5zJMxAHTaONNDF+J4xpZtkdAOE=;
        b=rZI9+kd6OqtNdwI44NQ1EVA6sOH6kDBG5VsbwtNb0gC15k3g6y2ngitWy5DIGD1gD6
         /sFxq6MuY2lvVwUNXGqPFnlovtjhh7uc6cg1ExnMsiBqOHlKNPZgSsiVnPtNTPAQ9Gc4
         XuHERNFTSRg6WTkodiE58Ty5aW6DE9apgnrInyzozL1q/ENsbGITlMm8GYJOQ6PeZPIF
         v9aCQNAPu2cv1YoFbkyF4yoXHmTQLU4lZKQ4B9W61ss1dFQsquQUSMi2XSpj5no87Kk9
         P9N9HKX/dnxeGgsdNh4xpbK+oaPTzWaMbiQabiBV1aHUtg9qDMQ1rF8aNnWjgEG+e7FK
         Vf5A==
X-Forwarded-Encrypted: i=1; AHgh+RqpAQlKk0EbK2iQkHuqzrSpRxt0XK8ejGuUIsNE+oX3J1pK5MFafBeHq74RR9fZGf15XiW6iOWWxcZO@vger.kernel.org
X-Gm-Message-State: AOJu0YzAF2btGN/Cd4IiXT89T6Gq1cHCa4eqIPBkUwiSoK4vTIdNRyFL
	NbmITdOI1D58XG9zxhiUire/XvhHZmVH/FOaZH9TnvnaTs+4FseVgu322NHZYKPzyOm/N5+tI6e
	CONEogstkbY838TNajKO7i4sRjrf0dQ4FMU/ker+Vq3Evzrt7dkwB9EsMXvSeX9t6
X-Gm-Gg: AfdE7ckfAII8UKHcEmSc0Hw3hY8ZWHQeMcjGTAJEBV7jrg18hL52xZ9K+hAJw7wm7WR
	ehw8+KB5G0c1Tqd1umxQ3v6/XVnNLGJKsw3Mywu5V0kCy0DTJrkDT1ercDFwMpE1SgQIbTVOyO3
	yiyOpy6Y4hQExJs+book8SYzfN/b4ywwo8FEo218Z9WMeKRZifB9Q2yfspfHMoHrt3X9THXFIMl
	g5AyGEDl7GEipenAcF8CYVpBTCTtik51qm7+KPW+1oWXvui81XzCZm8MQHaArZbVM4w51+mjtO3
	dPTRWAqTSE/KzeLlVgiTYj6pCTzCH1ymezfT3tU/Zv1ZXB36nwuSWx7bB0YpWLNJhtp//i9Z88Q
	E1HO6EcOeurn7JLhfP0vozDF9Qw9KsfG8gaxleA==
X-Received: by 2002:a17:903:110f:b0:2cc:aa36:c04c with SMTP id d9443c01a7336-2ce9eae29a7mr87590355ad.1.1783944889560;
        Mon, 13 Jul 2026 05:14:49 -0700 (PDT)
X-Received: by 2002:a17:903:110f:b0:2cc:aa36:c04c with SMTP id d9443c01a7336-2ce9eae29a7mr87590135ad.1.1783944889099;
        Mon, 13 Jul 2026 05:14:49 -0700 (PDT)
Received: from [10.218.5.114] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9d1ecfesm98917475ad.47.2026.07.13.05.14.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Jul 2026 05:14:48 -0700 (PDT)
Message-ID: <23f9caf5-d992-48eb-b41d-75833770f4de@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 17:44:43 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 19/19] arm64: dts: qcom: shikra: Add support for
 DISPCC/GPUCC nodes
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Brian Masney <bmasney@redhat.com>, Dmitry Baryshkov <lumag@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260703-shikra-dispcc-gpucc-v5-0-cc13826d4d5a@oss.qualcomm.com>
 <20260703-shikra-dispcc-gpucc-v5-19-cc13826d4d5a@oss.qualcomm.com>
 <3ad818c6-39fa-4b8c-ab82-f5cce6743cbf@oss.qualcomm.com>
Content-Language: en-US
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
In-Reply-To: <3ad818c6-39fa-4b8c-ab82-f5cce6743cbf@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: ht0GymOqcZIO_mU8gFduLldJslgyoMRu
X-Authority-Analysis: v=2.4 cv=IcK3n2qa c=1 sm=1 tr=0 ts=6a54d6ba cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=Kcuzh8V2oFltqVObT2gA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDEyOCBTYWx0ZWRfX1MSBtYI6AsHk
 0qxGBsq7NBSRpe3MS9a79ZyH5dxBxNrNB9jkZi4xKeGoFsEZGFPdXXLwsEXtvow08d/MxWtcQOH
 gizAsyW84y/X0rKWxZqOrrOHw+qlL8g=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDEyOCBTYWx0ZWRfXywitPanOjo3R
 IX3vLcU3ca3gVPnvKRQaofhXn4+PWK+q4I2mdoX/Igg6q/6Wmg+7CVAm8rL6mYY4nWC+8XX9byq
 8FHnPHR1eoTZ5JNmbozp8wxbZGSYQTh9gT5KaxZIg3ahjUVPNKIglw152XHjIJtiXuRL0aLffRY
 q2wOyxmiGUEiMx3ZlM9IpbgpM8R801BWf9ZyI8F8SK2JEION2a0KQkhMTIhnaq5FlpwNx7vr01D
 VKasecQ8MnUNwURNZ75L1xh55rv0TAhWpiXzVKpBqYR0i31DSiEF68ryatvM9fC5WVAXcQ+qALG
 pkR6J+kfoXt3gYzaO5yIixHqE9pNLHviv1p4mYiDWAggMPrcsOmtB9ktWZeU3gM9r9fppoFB+1h
 x3vXGzVNlofhzilBsY+/L59SmoFBoLuXwnc+5F2/TAhiPEzhRYZLAWiGmmdITio7Nj29hTm6ldO
 h5094H/29nbItqNR4fQ==
X-Proofpoint-GUID: ht0GymOqcZIO_mU8gFduLldJslgyoMRu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_03,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0
 clxscore=1015 impostorscore=0 suspectscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607130128



On 06-07-2026 06:30 pm, Konrad Dybcio wrote:
> On 7/2/26 8:31 PM, Imran Shaik wrote:
>> Add support for Display clock controller and GPU clock controller nodes
>> on Qualcomm Shikra SoCs.
>>
>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>> Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
>> ---
> 
> [...]
> 
>> +		dispcc: clock-controller@5f00000 {
>> +			compatible = "qcom,shikra-dispcc", "qcom,qcm2290-dispcc";
>> +			reg = <0x0 0x05f00000 0x0 0x20000>;
>> +			clocks = <&rpmcc RPM_SMD_XO_CLK_SRC>,
>> +				 <&rpmcc RPM_SMD_XO_A_CLK_SRC>,
>> +				 <&gcc GCC_DISP_GPLL0_CLK_SRC>,
>> +				 <&gcc GCC_DISP_GPLL0_DIV_CLK_SRC>,
>> +				 <0>,
>> +				 <0>,
>> +				 <0>,
>> +				 <0>,
>> +				 <&sleep_clk>;
>> +			clock-names = "bi_tcxo",
>> +				      "bi_tcxo_ao",
>> +				      "gcc_disp_gpll0_clk_src",
>> +				      "gcc_disp_gpll0_div_clk_src",
>> +				      "dsi0_phy_pll_out_byteclk",
>> +				      "dsi0_phy_pll_out_dsiclk",
>> +				      "dsi1_phy_pll_out_byteclk",
>> +				      "dsi1_phy_pll_out_dsiclk",
> 
> FYI neither Shikra nor Agatti has a functional DSI1_PHY, so
> unless you're worried about some incorrect bootloader version
> toggling them and want Linux to clean them up, adding them is
> no less than unnecessary
> 

Sure, I will drop this patch in next series.

Thanks,
Imran
