Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FD62288AD
	for <devicetree@vger.kernel.org>; Tue, 28 Apr 2026 17:22:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777396924; cv=none; b=LvhQEKNjwf+engdDNZ98L9DSRT5wMh+cbLmgfsQ0EgnyujRsvdeKOalDyUrkZaPYHo7fTlojt4BzhtS9uBLh5U7n0Pjgzh0LYbK+mmzoP8jdYh14jayz3vz0M/4z+uPX/J+0IzKH2WwK4PwTobqo6VLwE0LtKCwgrLCK7BNUtFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777396924; c=relaxed/simple;
	bh=+BJebmGZv5L+CpcsUlKbX9w4WfPuB/kmCkcyzr5U4rU=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=HcFLQn4g8/mKFO3OY/g5QiDO29c5+k/N23hbBP0KbW3A2re94IaQF5pX0LSaIGeD1QK+h8mowRT+XwAWX/P7SbJ5Oj6S1rVgb6b0JxGXZh3RTZdAkyGTF4EZq5bSC/G2eulIqrB+umTFlQ+RjcrmH4dH2UappogXasbrnNlEqOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Zgj/vBq+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Q594Efyg; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Zgj/vBq+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Q594Efyg"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63SFsZsc4070724
	for <devicetree@vger.kernel.org>; Tue, 28 Apr 2026 17:22:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/nf5AFsvxio1EyhxmYZXYG/870QpVsN8VTlvuOH2LcQ=; b=Zgj/vBq+4V+Yaxx9
	U7L7jp2rL0oMJgoZBAXmDE+9S2Y4ivv7elhWum/sN4h8ntIVj/EIVs/zmqd3Mp4M
	x0zLV/54Wh6IZSxfJsbAO1rieRfFxbjVyxnju25+y8yoDEWbW/KvYAzccA4AHgja
	bi1G5jADU2/Yxi6KJB2q8oQSQ/GM15uLsNOHIIBG1PXqrmUHWFDHfngHoq4ghzbE
	Olor+IEkon+eWFjqPb8ZQtBpj+E2jlyDBBm65oWg4XPz4Lh92APBkyBuzZewAxsQ
	ohQISFTuPKk5VGcbVFC5F9zHKrY66vzneX7oLTytTBvieDbzSEQSI6TpsBm5Hmfa
	6VGl8w==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dtttjhqdu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 28 Apr 2026 17:22:00 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-35e5791871fso15194226a91.3
        for <devicetree@vger.kernel.org>; Tue, 28 Apr 2026 10:22:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777396920; x=1778001720; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/nf5AFsvxio1EyhxmYZXYG/870QpVsN8VTlvuOH2LcQ=;
        b=Q594Efygw1zVoG/EABmYc1qPCsCxcUPJiCUSkzbQML+Tc55fOyAxWVHz5m6AuNMyil
         18WgmD08Birdm7/YeBFkqsgxT4KlCXjyEx68m+5Ol3KXnOgG9vGVrgk9NFOVOdPtcE2I
         k+5b49ZR+dXdhb5UYUHrDKvSwYOmx+4cosl7sKFg+OU05+57vriQWhfDi8hUZfIa3iDk
         udTTmSu8+aYVnE762jrSmi/RfAope6GeJ7swhsu+XauddES78C7b/zbsZJtH/FO8CgaI
         ZtN1f1bJDkTC6na6R2qcIlIB59x6xpWn7v+QqaHBPoaO0ZT3V5hxgTzW/NxEtDr0qRYC
         upJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777396920; x=1778001720;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/nf5AFsvxio1EyhxmYZXYG/870QpVsN8VTlvuOH2LcQ=;
        b=R2v6Og0aeCyhKdRsPAqbyNoi0n1iOl67YA9LRfL3yABgXcJYsC8gTHdi+7XcWgNIvd
         lDZRzT0DcMBqYilV1ysZvxhgK9wXwaYpVGwJPLcgh3tsviLN7pQGMS3Ku0Abyjunqe2P
         d/Q1AXaDJCr0Z+H6PQgEaSsz2sPNppqgo0oGVb93F4AQkqcGohmK77iPqqYqf/nKZJXT
         EkvQ7Lh/VriY4w41akeC77UpOiNejU9De9hBm+F0K43lVxb0IeTJQQU36yeVKwYlkp7d
         3YiuvH+UcebJ54Vb6waVeB5yRDkR7YZyniSKAXKAdYkZ4tfO6/Or/+VMK1u2ow0kpVFW
         zZ9A==
X-Forwarded-Encrypted: i=1; AFNElJ+g70KcAvLaOcfrBJrAkmhgOVY9UclQJRC5Kr9LCvzgOEd2tAkT4mNEmySYzlez+t6sqRYlCPaLITAY@vger.kernel.org
X-Gm-Message-State: AOJu0YwJbHVGlgqXDqqxSzkaUtKc9CNp05uGsC8P5J15jXbNdAoiXiTF
	Ok9TFe8g1J6u44mIzTq4vFe0vZ40LF7ONu+kUwhPGZHnxfnl6QtNnpkyuVSnzc2iOTPJPkKU6Vn
	MG/FNiLna9/L2kMXzCbD/2c7sXrWpjdrjlZAStCILJLWI0KwYB6HFqOlLinrF6OLp
X-Gm-Gg: AeBDiesH0pUsKUOW5CGZstn1k0mGJV7xC+/9WhavW1pbxdKjEjwYMMdC2M/ONzY1qpl
	93XWxnRujhXNldlT1leyLO8OZoFgXTZ8yv2YEDeDwOmvhFZK9L9eq4P80/JBUMvhwzZW3MN7pQ+
	P+ZUWpKHvy8gyRv59qAD0g8WKA8RkYGx2qv+XXbW57zKjRRacz/xbfsCtRJKglLIKX4gguv7aeE
	NNX7wjCSV4E/TRsPBh79NgrrwlPuzNbbaFLg/47X6k9oRjS+eUmGljqwOwUODjDEeyg7uX0DtOh
	NvQE00Fp903ee6qzvQyZ1Ew7ROl0vVuVMUgAsxFgDoSipMfbgJSeMgvdxlqtf3VT7CnWEMCbRRX
	H6yyMo4JK14dbdsWIEdjcURGjnOuxnmbsh2eXQ79GmTh0ECX00N/fngs36CWqqvzP
X-Received: by 2002:a17:90b:3fc5:b0:364:74c1:53b7 with SMTP id 98e67ed59e1d1-364a0adec05mr299379a91.2.1777396919763;
        Tue, 28 Apr 2026 10:21:59 -0700 (PDT)
X-Received: by 2002:a17:90b:3fc5:b0:364:74c1:53b7 with SMTP id 98e67ed59e1d1-364a0adec05mr299334a91.2.1777396919181;
        Tue, 28 Apr 2026 10:21:59 -0700 (PDT)
Received: from [192.168.1.4] ([122.177.243.58])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3649fe8990esm349871a91.0.2026.04.28.10.21.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Apr 2026 10:21:58 -0700 (PDT)
Message-ID: <008f2f0a-2367-4d8e-b6b7-2421a4de88cb@oss.qualcomm.com>
Date: Tue, 28 Apr 2026 22:51:47 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Subject: Re: [PATCH 10/13] clk: qcom: dispcc-sm8750: Add support to control
 MDP clocks using CESTA
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>, Lee Jones <lee@kernel.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>
References: <20260420-cesta-sm870-dispcc-v1-0-eb27d845df9c@oss.qualcomm.com>
 <20260420-cesta-sm870-dispcc-v1-10-eb27d845df9c@oss.qualcomm.com>
 <vnil4gbkpenxo5o2a2df2ziuygqyyrzsj2bygqewm7n2rq5kbv@qbntqftfpsky>
Content-Language: en-US
In-Reply-To: <vnil4gbkpenxo5o2a2df2ziuygqyyrzsj2bygqewm7n2rq5kbv@qbntqftfpsky>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI4MDE2NyBTYWx0ZWRfX8J5nveGAl0CV
 zWukRhULo1ajMUwOBoE402Q12nwdXTIT2tQifTAk9IWu9ZWJvlJv0BhSeS5ttwZDtRKuyWXpNSj
 xP6AHMjGxBDmiDntXzA+s40fAIWVCk3MFfFl2ypkbcHjIB6SsvOEkEm50/ysALjY2Kxeexvy/KM
 se48RtglyPl7LnSE/Z0Ut42mQS9jpHFP5uv93DiWbIHRFqNgG3k0N6b5uxIVMjbA0I/mT9pGiss
 0lpIM74Ih+o88SvPCgMRq4qoGQvgBiFI8s+5W/qBkD8K0weK+6I4vku9Fx8H3z+92X84ZLw1slG
 BoAT4nSivJ5EwW9eEtehCV1j7ZEmC/YkfMh4CfJNLiWNLpeKiXVMkXWKLURh/MAyCldUQbsA2Ez
 hIsncJpjP12J+SvpvdEc11Dbe5yWn4X3bcn6rpwJHWMGQdPzU9+MOLEP/mBdFBDM3nC5yWX6CEq
 MUonmULvSDobOz6q8OA==
X-Authority-Analysis: v=2.4 cv=TZKmcxQh c=1 sm=1 tr=0 ts=69f0ecb8 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=EwI1ikYXukqkrg4G3Narhw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=hyz_MBUfSQ2kkO8oYCUA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: C5X1RilIrotl383sDxM9aIrO30lSt9PG
X-Proofpoint-ORIG-GUID: C5X1RilIrotl383sDxM9aIrO30lSt9PG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_05,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 adultscore=0 phishscore=0 clxscore=1015
 suspectscore=0 bulkscore=0 malwarescore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604280167



On 4/23/2026 12:03 AM, Dmitry Baryshkov wrote:
> On Mon, Apr 20, 2026 at 09:59:03PM +0530, Jagadeesh Kona wrote:
>> Add support to control the DISPCC MDSS MDP RCG and the associated display
>> PLL0 using display CESTA hardware on SM8750 platform. If display CRM is
>> enabled, the clock ops of these clocks will be updated by the common code
>> before registration to use CRM specific clock ops, allowing these clocks
>> to be controlled using display CRM (CESTA Resource Manager) hardware.
>>
>> Co-developed-by: Taniya Das <taniya.das@oss.qualcomm.com>
>> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
>> Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
>> ---
>>  drivers/clk/qcom/dispcc-sm8750.c | 89 +++++++++++++++++++++++++---------------
>>  1 file changed, 56 insertions(+), 33 deletions(-)
>>
>> diff --git a/drivers/clk/qcom/dispcc-sm8750.c b/drivers/clk/qcom/dispcc-sm8750.c
>> index ca09da111a50e811481fd862b54d454de024d1c9..328e43b52192702dbbfd1ed65737520acdd4a649 100644
>> --- a/drivers/clk/qcom/dispcc-sm8750.c
>> +++ b/drivers/clk/qcom/dispcc-sm8750.c
>> @@ -71,6 +71,16 @@ enum {
>>  	P_SLEEP_CLK,
>>  };
>>  
>> +static struct clk_crm disp_crm = {
>> +	.max_perf_ol = 10,
>> +	.regs = {
>> +		.reg_cfg_rcgr_lut_base = 0xd8,
>> +		.reg_l_val_lut_base = 0xdc,
>> +		.vcd_offset = 0x268,
>> +		.lut_level_offset = 0x28,
> 
> Seeing this configuration makes me even more sure. There is no separate
> CRM or disp-crm. The CRM resources should be consumed by dispcc.
> 
 
The CRM can be used by interconnect drivers also for BW voting via CESTA.
Hence it cannot be consumed by dispcc alone.

>> +	},
>> +};
>> +
>>  static const struct pll_vco pongo_elu_vco[] = {
>>  	{ 38400000, 38400000, 0 },
>>  };
>> @@ -89,21 +99,22 @@ static struct alpha_pll_config disp_cc_pll0_config = {
>>  	.user_ctl_hi_val = 0x00000002,
>>  };
>>  
>> +static struct clk_init_data disp_cc_pll0_init = {
>> +	.name = "disp_cc_pll0",
>> +	.parent_data = &(const struct clk_parent_data) {
>> +		.index = DT_BI_TCXO,
>> +	},
>> +	.num_parents = 1,
>> +	.flags = CLK_GET_RATE_NOCACHE,
> 
> Why? It wasn't there beforehand.
> 

The PLL rate can be changed by CESTA outside of the PLL callbacks, when a perf level request
is sent via CRM API in RCG's prepare()/set_rate() callbacks. Having this flag ensures that the
PLL rate is recalculated from hardware every time when users query the PLL's clk_rate node,
providing the correct PLL rate configured by CESTA.

Thanks,
Jagadeesh
