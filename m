Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 343383CFF79
	for <devicetree@vger.kernel.org>; Tue, 23 Jun 2026 11:38:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782214713; cv=none; b=PtTBis2gAc2CicfnWJCLYgK4y53SzTXvXuFGizuFhDdby7/gDM2/gvU9os1p5j3mVfVOIBmVILvhDW2QfDwT0j3092SlyuKyyURe812jsUCwpXIzH+MapmEsd6MSw+UE5sByFPq5o4VwIKwuyoHL/ocYH7HGjXOs1ZCEEZeZ6lA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782214713; c=relaxed/simple;
	bh=bdRZvFUFJ6YdCd3H1MQvxbtY6BSzx3TZaBhgZfRgU5s=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=U3tF7w64nwPB87L06n6MOTpeLWPf8KBQX4Qy7djnz15Rlwqt7WIFQTXuLwnpAi3E3X5r4JhNItnNZx5A+olZbN+A3KZq19rTgPuEcoBQQj+oHLYzkrbo+frjcOm1rIQGlDYJED25BGpN/+jEMq4K6yizOaLgq75G6Hl967wU/b8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=N5jUbw4W; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iVW50ysg; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="N5jUbw4W";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iVW50ysg"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65NBYgvt113422
	for <devicetree@vger.kernel.org>; Tue, 23 Jun 2026 11:38:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/F1/g2zzEa3MI7jpnvVCZoXih7VzPKL+dy50jsl4S8I=; b=N5jUbw4WTS1evJtv
	AC0MinG78L1rroW/BJGzj2HeFeVWoPNGPcFQ5shoGNl+P+i6EOUsSwm87yhIMbtB
	5nNQsg0cbdOjQ6BRLJJDTlC1zAy/63waclOwHmtqZ/EZxuBwjbgUq715+/T7yvvF
	AyTuZLN7BCME09ts/Idg01YgUsebNueD9nttXY2mv4cg7WfuvFYt4ZsvJAO+XDL3
	L4PzzXkldB6PY7me/pUjV7eFWe8l7XmNey7MfV7aP0fTXrmSa/Nu2k/8t/J7d7pq
	2DR9g1ckE4rQ7K2ZPYMTReIQqTtFHVleumkxOk1EHy9BpkFfCIxlEq7OPDgA/i5n
	Q9hQ+A==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eymnvs9g5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 23 Jun 2026 11:38:31 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51968526a68so14072611cf.1
        for <devicetree@vger.kernel.org>; Tue, 23 Jun 2026 04:38:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782214711; x=1782819511; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/F1/g2zzEa3MI7jpnvVCZoXih7VzPKL+dy50jsl4S8I=;
        b=iVW50ysgJpmJxUvJntFCFcu9bNyfjEk78dYOzTnyGHOsGN1hj8OcmP+siLIA6XGe4h
         aFjU4OJNJrXnKD45Rznxt/f6LoJtIdhd7rt9mXWZ6HrDRlz0c4Uv6Ctk+uvxO5gK38vA
         5R9RCBY7bUaxq+rk4rVyG6PWOTbiv6pawWOJP9D3n+uCZrCYu/JFkVmL/B8WIOTYQwAU
         RPa1Tny2rUp12YGbgM7broDEiRG2tS42m8/NnEMrSG9Bg0PH00n7lFFQpJwEO5ulJyt3
         zKZXORtmaSNnq9FNlepplw4kh/KErMkmo4ZY9hD5xdzKg5TayRChSdHWjA+VnruZCua3
         EhxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782214711; x=1782819511;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/F1/g2zzEa3MI7jpnvVCZoXih7VzPKL+dy50jsl4S8I=;
        b=KGx44I3Qp4AO83IRzD91a0yVh1ZuZ5c5DXZBElOMQXBh4jpf9i7CUNaBT2SeIcaFrR
         VHoS6GidAnuB90P6X7/Ijv8BEf5TKWWBkj2CjZOc2XYtN6t6wyic2rRnTkitjLwfKtc0
         FjeWUtPaB5Ae7du7jJBrCH5wCXzaN9smdCYrBVutasf6dtdXaFQczGVxYSfNzKaf5QdT
         vZLP+NkCh+R0eCmtY5SktsLiXpa6rj6+USDPyoDUa2Sqce5Vkx/uYEBGdOJcxJHROS1G
         hMmAMdFE+Fjuui57DuQIhrzbQ4bc8R8Vy3Vaeri/+HMqiHuXKkv/uK1x33jKnjHmSunF
         99AQ==
X-Forwarded-Encrypted: i=1; AFNElJ8x0VI1L3uu27WJtMZ3PPH3AOVXCTs+8z2O7oUCgbUi45pkXaDCwTMCoxj3FWzTpOmegnZKCrDpZ3sX@vger.kernel.org
X-Gm-Message-State: AOJu0YwLcoq2GHVlhzZWr/0ol0CiSSfiPJYotrUq2FnAUmQj5ulgAXjN
	oQ93lgy7cpiHoFA3c5CxfbFMc64qWOKsBvgYoJtaBG4WhAyt13yUmk1jOWywKqa9Dr/IcmpJIgb
	Vt7ikxJLd6cwG5s4zpE9xwcQE1Lq5ETrX92pJ/5CXjXxiKp8CrnswboOpW00Dtsky
X-Gm-Gg: AfdE7cmUJFa5IeJTV7bGFQbwQ60tTojpgvsRe0wCGSXfV9J5T8+IvdFW9OvpX2j/1sN
	y2xBfiFeEJMm3zGHhGsnNis2nW7b7yIQ8aq/5PDKSfVLaOv7Mjxp+EHXmEzpqRlFH41wdbrYiKU
	jMKlsjljG4R36XrdbUx3zo0+dyaqEr2PYWdgxmgTKtU9dM9qOZpNLh70Vk5W9vpXFWRYCHNH/a5
	ynHwLO2m0oLFfCAUVrAlrhkUT+v1vO6PM5AC4lmoUFhsL7UIfLIRJ3GP4DtNWyjqGihHvLVoeDg
	95s2YXptzq+bzZaVK0v9NttxF1NYOVwHvjRQKGQApE3tXS7AzXogpTI+q6/y2iZdrIf9vMByVsK
	PqCjDnjqy9UU+J49y+ACrP12Wh0HsTK9ax5k=
X-Received: by 2002:a05:622a:650:b0:517:62f4:e3d1 with SMTP id d75a77b69052e-51a4f42cacbmr48709371cf.2.1782214710756;
        Tue, 23 Jun 2026 04:38:30 -0700 (PDT)
X-Received: by 2002:a05:622a:650:b0:517:62f4:e3d1 with SMTP id d75a77b69052e-51a4f42cacbmr48709111cf.2.1782214710160;
        Tue, 23 Jun 2026 04:38:30 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6977b86de31sm4344561a12.12.2026.06.23.04.38.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Jun 2026 04:38:29 -0700 (PDT)
Message-ID: <be95b95b-dbcb-4b80-94dd-a7e97ef4c446@oss.qualcomm.com>
Date: Tue, 23 Jun 2026 13:38:27 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: eliza: Fix disp_cc_mdss_mdp_clk_src RCG
 stall on Eliza EVK
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260623112755.317180-2-krzysztof.kozlowski@oss.qualcomm.com>
 <de941d2d-df5d-44b6-b95a-437e35917cd5@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <de941d2d-df5d-44b6-b95a-437e35917cd5@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=dOWWXuZb c=1 sm=1 tr=0 ts=6a3a7037 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=Ktd-FhGVB0-9PFP5HxAA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIzMDA5NCBTYWx0ZWRfX9wbBLyzcOZUQ
 nStdqKX9Sce0zVpl2DP2p8dZwJJwbF859L5i3rth9eAcQAYIQFpuH2pTcuDljydOgP9jLupMc5f
 iLS1viRAtzjBFUr1Q7dlBLOV6vb3WKA=
X-Proofpoint-ORIG-GUID: vqhTspn_Y-kv7CorfHf6NkHzLSlaO_7J
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIzMDA5NCBTYWx0ZWRfX1TfvMcfGpcKg
 HegjHGoeDGb/xmlfdT8WeNWiy844SCQyJHZyhG2L96hGv/njx7IL3SM+WggRNyM/P6UBlI2tHcU
 2GDAxoSXj2T/7P69VWjUyUAaTcKiuBslZTiKAjvsM/pMmnkHz4FPd4ezagZMFFqg7AAQ7LiFgqq
 FlGmC2gah0e/fo+uUWnXf9zYJC2N1uu4QqRHZjuPe416pub50YkYG5EMPZQ1nhOmiAoks/sDvnF
 U7JkOWP6DDlINbRnfEkAxYNAKrC7V7svzd9aS3Zsz2QlcYhyIab+vSq/Am/xc4MdeIh3z5krgL7
 qsp4IZjeru/TxLRqJvT5dlE+lBUxADNVBc9WKhV7ghj2afbJONK/0x+BXE4ckeae5iFr4vI8pNS
 Y9FpHNnzVWZiUBp1XrTCJoMnPt9mPwD8yFUqESR6ANfUH34493jjayUl91bcHBtIBbQUteI9jwQ
 PjStB0YbArwQebC1eYg==
X-Proofpoint-GUID: vqhTspn_Y-kv7CorfHf6NkHzLSlaO_7J
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-23_03,2026-06-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 priorityscore=1501 impostorscore=0
 adultscore=0 bulkscore=0 clxscore=1015 phishscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606230094

On 6/23/26 1:31 PM, Krzysztof Kozlowski wrote:
> On 23/06/2026 13:27, Krzysztof Kozlowski wrote:
>> Eliza EVK (eliza-cqs-evk.dts) does not have display enabled, however its
>> Display Clock Controller is enabled and references parent clocks from
>> DSI PHYs.  Devices which in base DTSI do not have all required resources
>> available (e.g. because they are simply disabled), should not be enabled
>> in the first place.
>>
>> Having DISPCC enabled without DSI PHYs causes clock reparenting issues
>> and warning on Eliza EVK:
>>
>>   disp_cc_mdss_mdp_clk_src: rcg didn't update its configuration.
>>   WARNING: drivers/clk/qcom/clk-rcg2.c:136 at update_config+0xd4/0xe4, CPU#1: udevd/273
>>   ...
>>     update_config (drivers/clk/qcom/clk-rcg2.c:136 (discriminator 2)) (P)
>>     clk_rcg2_shared_disable (drivers/clk/qcom/clk-rcg2.c:1471)
>>     clk_rcg2_shared_init (drivers/clk/qcom/clk-rcg2.c:1540)
>>     __clk_register (drivers/clk/clk.c:3959 drivers/clk/clk.c:4368)
>>     devm_clk_hw_register (drivers/clk/clk.c:4448 (discriminator 1) drivers/clk/clk.c:4672 (discriminator 1))
>>     devm_clk_register_regmap (drivers/clk/qcom/clk-regmap.c:104)
>>     qcom_cc_really_probe (drivers/clk/qcom/common.c:418)
>>     qcom_cc_probe (drivers/clk/qcom/common.c:445)
>>     disp_cc_eliza_probe (dispcc-eliza.c:?) dispcc_eliza
>>     platform_probe (drivers/base/platform.c:1432)
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
>> ---
>>  arch/arm64/boot/dts/qcom/eliza-mtp.dts | 4 ++++
>>  arch/arm64/boot/dts/qcom/eliza.dtsi    | 1 +
>>  2 files changed, 5 insertions(+)
> 
> 
> I should call it RFC, because this feels like a band-aid and should be
> fixed in clock drivers maybe. Eventually DISPCC should be enabled on
> Eliza EVK for HDMI, but DSI PHY will stay disabled.

I'd say all of that hardware should be kept enabled, if only to
make sure that it's parked safely

Konrad
