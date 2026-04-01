Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBA363BF669
	for <devicetree@vger.kernel.org>; Wed,  1 Apr 2026 16:35:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775061325; cv=none; b=gFsGTZpuakyr94XmkQ9OptC+EuP+E4JsPFsBQHgibMXCm0/RMMA/eWIZNK8p+mERZRWmbJpoC7DX+dfWC6MzWoCwfEqAMVDps70TBpimvh6uXXbsB16AH79DXm6+EK5/BW8lmryDHqFphChdKHT7nyehyPG5+pQgLH4J70H65fo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775061325; c=relaxed/simple;
	bh=7N701LTx9bJ0sc4tJYW2zwmhMyTG1gcsh4UxcNggmXg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CXFNLtEZ3ZPbCLYUFJq2RSdl2VYTD9GSKpk1Y4oAwVwjPqQmI/oZWdNBNpI6CHXtBXWVgOVc7UkfyrfT2Z86qd84pJjbJ2VbPT27PbHnz852dcF9O0AIXwG30JEq5+Dwd2o4hnkdU6hZxPpzGA2SjRhB/mYOstsXnnnXclunlHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pt6gn+Yl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FVJaNKI9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pt6gn+Yl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FVJaNKI9"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 631EPt2R1881827
	for <devicetree@vger.kernel.org>; Wed, 1 Apr 2026 16:35:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oOH6Gjls3CqWEpA9mqTKUhqgpzoClPrvgbLT+iZ4b6Y=; b=pt6gn+YlNCcP80au
	cWyjxIZ6zwykIJftcfntN/LeviWS/FMUn63ziH+UDapF9hwYZjD4Rpqo/JTmUn0h
	tCp/9zyR/IUUkni7/agAr4cKUp19VlOdmOm3mZq/VuMLFvejE5U5niqX6QOOPccP
	DGw8slxEXiaNQQoo3bMNJX8joAPf3BokVC1/NFWl5VZSzm3WlS1mc8jGA+rOib/Z
	8PPsH4sH8JDJoYL/hYfSpPKse1LVOCilcWaNLY22PI4bZ33JSymEdBiWleJvY2uL
	Tp9zP4tu/YqKkwEJJdK8cVBWuiLs9R+sfJ8wFpsHlaPi0NGiry4oUV1pc+vcX+ZQ
	IQGUPQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d954c8njt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 01 Apr 2026 16:35:23 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2b241be0126so157659375ad.3
        for <devicetree@vger.kernel.org>; Wed, 01 Apr 2026 09:35:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775061322; x=1775666122; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oOH6Gjls3CqWEpA9mqTKUhqgpzoClPrvgbLT+iZ4b6Y=;
        b=FVJaNKI9L5BBC1HJ9d16dCrEKZQYpR7MUtSojW/TgzbkaxH2AO4kvrGw2+0hs5J1DK
         HFMur7WCkvjzrRVYtWz42rmLA4B6XvSlw/Gq3w820CpUqD+NftYTvT/zAWcyd56GAT0K
         NkV/L4p61ZrSLMD5MW8ceqaCmDWVRpom/0a4ldRTwCaq1Xt8JcPZXVyPKaXtNbtY0yI7
         5ZgUKRv0Nw1HMxiWAgM77Jp6kJjR06bRvdOZLUjNNUykNzroImQ6lWC6Bx2bnZUQyEjp
         rnJer4xa+8sk7tTDYaWoTDO35ZDXdQoqX9wub9m5Y6NN/Y/A/WPSPKHOKUlR15OPAeJe
         0uNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775061322; x=1775666122;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oOH6Gjls3CqWEpA9mqTKUhqgpzoClPrvgbLT+iZ4b6Y=;
        b=doQQaRz3KGJxs0wWE/E/0Y5G1J1nuStsKYoE8OeBDxyfBRUCpUzrbeerFbUqtw8EBH
         LHkGYmJj9me5BntNG18Sz/xT/ypLcEO+s8niY5s33js2cbZtn4i4+LkRVw9Uc7HImQtN
         pDNZg3iRHp4jcem7X4uEz1K7X1l6Ok36fGLDtrYW0s63lRRIR+eC1V7i4JxAVMZaMHjK
         oKKyL2HsJNjkbOIWT5uU9u/I/BqH1AXUWhec1knsHCHqzCilE8tUOfrkCdXTgdDdj7wC
         NcuonntJoxcphTACgCYyG9f2ahlH0x0q6Q3eum+JFudGvSh6G84W7c/MWRDk0mez3Hn2
         5DBg==
X-Forwarded-Encrypted: i=1; AJvYcCX46imX+yzyz41NEfApk4jEeDjqa/11+1KcII94GObeCGUdnbWSIWKbcdX8mE6dUYIhrILK9Nc6TdWH@vger.kernel.org
X-Gm-Message-State: AOJu0YxTlJj4rQm8HwZDFgl4jYDKYoumZ2gqxZbh5gGltyyhR062tVuY
	AInSX1LK35Eq6qWokulfTPT7Zt1ibJ8clRPIA2zkpB1xjvVm2o/v6zMTV1NEpO0eOrxYQ8WuPxS
	R6GQr1PYPi/9TmxVgXUIFYAGhZ+/FYQqEmKJrXg85ed3VE09cQslelUvjdeAb7gbH
X-Gm-Gg: ATEYQzzsBePlYaMPPQ0cF7F5RuozLxsXHrW+sv+Zg0CN+VakN1x8FR9Oz1X+fVbFZLg
	S7s/vMkvENVQ7TmgWMteweqpboCe4G3/qYwZcjYZFpDGCmzLZPI33PL3iYeMuCa/7P7pCQ3bcp4
	Z4+zD38RhYymu2K8nK2ajfwJJk3yKVZrK1wcgpsMzCLKWh0ltWQfnb1jMIcD2StiSh3GNK0YZNA
	gLYyokM9qEaRL9Wf4Y+OrLUR+x5fGal/a2afpZUgle89feb4e87YOQ2bE6ryILtYcEVvtYY0a13
	iO5a+6sYaVuDOmO1DLEjj1GFyMIIjpbKO04VlV1E4389GEhE9PythjxkeWgWzYb1Xnp3j6iM5Nb
	lIp07CgAV14pRZffvU1yfx/lBiWz+Ikv5sMqSLz/jnVuNzp3o2Q==
X-Received: by 2002:a17:903:2b0c:b0:2b0:ac1e:9720 with SMTP id d9443c01a7336-2b269cffdefmr43544525ad.23.1775061322250;
        Wed, 01 Apr 2026 09:35:22 -0700 (PDT)
X-Received: by 2002:a17:903:2b0c:b0:2b0:ac1e:9720 with SMTP id d9443c01a7336-2b269cffdefmr43544125ad.23.1775061321745;
        Wed, 01 Apr 2026 09:35:21 -0700 (PDT)
Received: from [192.168.0.195] ([49.204.30.146])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b27478b658sm2609885ad.31.2026.04.01.09.35.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Apr 2026 09:35:21 -0700 (PDT)
Message-ID: <ebce5979-0ab5-47ff-963e-68e27216821d@oss.qualcomm.com>
Date: Wed, 1 Apr 2026 22:05:12 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 3/4] clk: qcom: tcsrcc-glymur: Migrate
 tcsr_pcie_N_clkref_en to clk_ref common helper
To: Qiang Yu <qiang.yu@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, johan@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260331-qref_vote-v1-0-3fd7fbf87864@oss.qualcomm.com>
 <20260331-qref_vote-v1-3-3fd7fbf87864@oss.qualcomm.com>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <20260331-qref_vote-v1-3-3fd7fbf87864@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=WMlyn3sR c=1 sm=1 tr=0 ts=69cd494b cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=UX8sLPG5SLFWA/DeEh7vkg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=1wW_Jg1dmpZ7RQPaF88A:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: _UWOH0pBlavwiisU4jeD0emKoLWN4Jzc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAxMDE1NSBTYWx0ZWRfX3hr3rATsxs00
 CnPnmaf93AOae4MmA8lZmBWwuxe3Ke+ZacX0tqINreHnclmiOYy8i51CTWA5+v4PUl6NTR26P6J
 ukEGkoXfNNTdQDJUjsPkC4ABh24f8L8HnqLs/E2XPbxiIVWqMRs8WHgRND0pKL4mU+Utw8t8s5+
 RjZdusVyA+EQe6G7MkeIDszvcP6jUuH5icJV5gdqhPE+qtQ1x/Sdt9I8270FRvDOKYVa2N6hiZq
 znQp5LEDJjeBzZ3B988c8i17tjtLSULHZhxqMkjV9jkkVgZabDvJhUOna6T6FL4EHS1fcTPMAMt
 5SjbontAMtTE5xMTmQF943Q1OGB0BoRnQKDxyxozGEwfHgOHtZRohw3OMtqMPusp7vzNCYv1slm
 aSD29brnD5DLvGGFlqV1NEutFgnKWCfyvL4Axo9Q1I3trB5WuQ80olW1qIs3scC4MDVU1lEJL0M
 cQfxJ2vY5ERtg++uL0Q==
X-Proofpoint-ORIG-GUID: _UWOH0pBlavwiisU4jeD0emKoLWN4Jzc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-01_04,2026-04-01_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 priorityscore=1501 phishscore=0 suspectscore=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604010155



On 4/1/2026 12:05 PM, Qiang Yu wrote:
> Replace local clk_branch-based clkref definitions with descriptor-based
> registration via qcom_clk_ref_probe().
> 
> This keeps the glymur driver focused on clock metadata and reuses common
> runtime logic for regulator handling, enable/disable sequencing, and OF
> provider wiring.
> 
> Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/tcsrcc-glymur.c | 340 +++++++++++----------------------------
>  1 file changed, 93 insertions(+), 247 deletions(-)
> 
> diff --git a/drivers/clk/qcom/tcsrcc-glymur.c b/drivers/clk/qcom/tcsrcc-glymur.c
> index 9c0edebcdbb12816d1be5249e4f04bcaf02048aa..585f87b23af2d92daef1787b2f38911681c0d8ee 100644
> --- a/drivers/clk/qcom/tcsrcc-glymur.c
> +++ b/drivers/clk/qcom/tcsrcc-glymur.c
> @@ -4,265 +4,115 @@
>   */
>  
>  #include <linux/clk-provider.h>
> +#include <linux/clk/qcom.h>
>  #include <linux/mod_devicetable.h>
>  #include <linux/module.h>
> +#include <linux/of.h>
>  #include <linux/platform_device.h>
>  #include <linux/regmap.h>
>  
>  #include <dt-bindings/clock/qcom,glymur-tcsr.h>
>  
> -#include "clk-alpha-pll.h"
> -#include "clk-branch.h"
> -#include "clk-pll.h"
> -#include "clk-rcg.h"
> -#include "clk-regmap.h"
> -#include "clk-regmap-divider.h"
> -#include "clk-regmap-mux.h"
> -#include "common.h"
> -#include "gdsc.h"
> -#include "reset.h"
> -
> -enum {
> -	DT_BI_TCXO_PAD,
> -};
> -
> -static struct clk_branch tcsr_edp_clkref_en = {
> -	.halt_reg = 0x60,
> -	.halt_check = BRANCH_HALT_DELAY,
> -	.clkr = {
> -		.enable_reg = 0x60,
> -		.enable_mask = BIT(0),
> -		.hw.init = &(const struct clk_init_data) {
> -			.name = "tcsr_edp_clkref_en",
> -			.parent_data = &(const struct clk_parent_data){
> -				.index = DT_BI_TCXO_PAD,
> -			},
> -			.num_parents = 1,
> -			.ops = &clk_branch2_ops,
> -		},
> +static const char * const tcsr_pcie_1_regulators[] = {
> +	"vdda-refgen-0p9",
> +	"vdda-refgen-1p2",
> +	"vdda-qrefrx5-0p9",
> +	"vdda-qreftx0-0p9",
> +	"vdda-qreftx0-1p2",
> +};
> +
> +static const char * const tcsr_pcie_2_regulators[] = {
> +	"vdda-refgen-0p9",
> +	"vdda-refgen-1p2",
> +	"vdda-qreftx1-0p9",
> +	"vdda-qrefrpt0-0p9",
> +	"vdda-qrefrpt1-0p9",
> +	"vdda-qrefrpt2-0p9",
> +	"vdda-qrefrx2-0p9",
> +};
> +
> +static const char * const tcsr_pcie_3_regulators[] = {
> +	"vdda-refgen-0p9",
> +	"vdda-refgen-1p2",
> +	"vdda-qreftx1-0p9",
> +	"vdda-qrefrpt0-0p9",
> +	"vdda-qrefrpt1-0p9",
> +	"vdda-qrefrx1-0p9",
> +};
> +
> +static const char * const tcsr_pcie_4_regulators[] = {
> +	"vdda-refgen-0p9",
> +	"vdda-refgen-1p2",
> +	"vdda-qreftx1-0p9",
> +	"vdda-qrefrpt0-0p9",
> +	"vdda-qrefrpt1-0p9",
> +	"vdda-qrefrpt2-0p9",
> +	"vdda-qrefrx2-0p9",
> +};
> +

TCSR clock refs are just not for PCIe alone, they would have supplies
for all the ref clocks. These supplies can also be shared across other
clock refs. I think it is not the correct way to handle the supplies, as
TCSR does not have the complete supplies map.


> +static const struct qcom_clk_ref_desc tcsr_cc_glymur_clk_descs[] = {
> +	[TCSR_EDP_CLKREF_EN] = {
> +		.name = "tcsr_edp_clkref_en",
> +		.offset = 0x60,
>  	},
> -};
>


-- 
Thanks,
Taniya Das

