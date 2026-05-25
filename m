Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E424F37DAC0
	for <devicetree@vger.kernel.org>; Mon, 25 May 2026 11:13:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779707601; cv=none; b=p112GegyILYMrkIi/TKuq7rzLULs11GEuxdx/LGwshpNT9x5esMXFsIXZih7bG4UBydsrGSH4wshiLm8QnS8n7Z4ZSPW7X+ScAp4UqiPl7SM6wZferUugi+i+k2jrOlMEY2UiPfscy5/20QFQRt8GlMnTrtzU4LMg7sftT7oKHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779707601; c=relaxed/simple;
	bh=+NxNyrIsbXGQxnCdkWuyCIpL6w5IfhLl10ImMpqgRNg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tTgbGqdLkQDCM+NKPi/TQYgX788fwG8pYu6RucC0yrqbOUJ4D8fV+Q3mqz6jg14IJ6SnSR0x1fq5Yatq2A7oYFY2Vfig8bVNR5aMkuuPjtFA2nIO/Gx98TBHV5qS/NOPKWXQmP21Y5h2L4Jo1wcLX+mIlXHwVQci248tvbtfLhU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=N2yHIfND; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XG6SE1gO; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="N2yHIfND";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XG6SE1gO"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64P9cg831802407
	for <devicetree@vger.kernel.org>; Mon, 25 May 2026 11:13:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=lCcY67VRp26KG8gUmXkaFmQN
	V0bN6FhsAAQbVvffwoE=; b=N2yHIfNDPCAoU0qJJ2fS+P/o1mscfVDZ+owL1O4v
	Y+7ouHnArUgFXSk2rhBHYgWlhK03pGP5KcHUcXpPMw7E+aasiyFr89PIYkRjWBcC
	uKjqRp9CjY8ofZFd0/+8BsdFrcvQo0avU50tH1CuxzGhBm4qcyxd870uHVu95xCa
	XtQl3Gqc3H1ePAJ+WFqfXkBbtY/biq2K1NwCPdoscGDceFTjyKyP/w5StkiyogYc
	LbgiVCB5SgFcAQFhBtiv5aLMEk3nOoaQlqY7tcnLPorgW3fc78PnAknMcLQLm8Wa
	s9s02nwk+R8Fv9ac+UcsZ+kGO6g7THNY+WjkTGG2Fg3E6Q==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eckyqga8a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 25 May 2026 11:13:18 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-95fd0a49df1so12611855241.0
        for <devicetree@vger.kernel.org>; Mon, 25 May 2026 04:13:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779707598; x=1780312398; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=lCcY67VRp26KG8gUmXkaFmQNV0bN6FhsAAQbVvffwoE=;
        b=XG6SE1gOo8jqcdZ4ipeYAfIf3ZnAX2mvgJNhsViQ9UT+uGWerUrf8itHMitLtck2a/
         iwvFYY6jwFkHvzQdBlpEHfPZ9mMRUZwxWwo3V4mrsPdIlkvtnE8ePLqS9HFnvrlE3sOA
         QYz4koaGPKu4tboHkRH58IwDq7PJSsPwH0V8etbVmmDsp7ClPJ7am0QeenQHNpla2cI+
         dsAXGKFFLqoeJQ2wemyxR0LXd5p2UtcwtagbKdQaXE5XbbY8Q+L6cDECO9Mx5orcZpv8
         RU/sZLX7Mpc0O3Aa3bRWlChqdKtdPnB/LYJSvmxKRWPDkrjUetW1G0Ti/G4uJ7pZIB39
         cTKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779707598; x=1780312398;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lCcY67VRp26KG8gUmXkaFmQNV0bN6FhsAAQbVvffwoE=;
        b=amcynq+FjQRsB/DVFcYndsyRE9QN10BnGuxj8tWpm/Zr0240hU9DJXuRl875HQIVqb
         BefzWKnDSdNRw9muPfY9zTvPmkHC9HnynggmKWTaaH4y5XtJR5GEUKj2NHYIDSrxvpGZ
         DomEJn3Lag3xDW/cQNskUCcvATWuTdGeSyct9/6quosAveSpiTqgsgG2WCN6kKToLHkf
         WsSDTH7QRFmuGQ+bMGAl42PlrCi+ZkQm5aGmsIuVcRJot7iylovj1PEJIqCjelIawSjl
         78ho+CLB/pe69k1LOOFuU4OYJuN7SzJ77eivW3JwR0v6V5wOdEUT/W6udvEUh+3F+vS+
         BV0A==
X-Forwarded-Encrypted: i=1; AFNElJ9by0lGXlEAI0QWwxvXSTLjqgukwH5Ax9zuWiAlfY2ISn00iCbWsfj8XEEeqHDGDbDF8XgHG3FqHXa0@vger.kernel.org
X-Gm-Message-State: AOJu0YzJCTovxDem8q0dwtjtxdtJ8Wwrt9LcCie0490hYUOzNjt8fcJ2
	qKkMZADRhpl4WZHVdcfNTh3i6ElcFUbmp7YU9Ebn3gP1T7qC1uURKjPO296wNZltRlyeeL5X2vp
	WNgrK1vhA0+VsvY64CHHWtLHMG7xbNMyo5SmUfral9mErzHWlzIseYiz4QzDlEgy0
X-Gm-Gg: Acq92OFEPZHn3DkzKUsNVsbrvRR9r/yhe04Sd9OJpU7o5GVcIroxFvgE8TnJd/BuSfu
	qGRS9/A8eamGe2p6SNLaWWWaKj8pZao1EMHOefh2M5/w+I7bZh8FRjTXtjVCWb6RlSRAQ6uGa9H
	mgWwtbDmUd2vXP1fMJg+ajvy5/it5+0K8H8yzWiLfJMX6H1zduPaQ065W2GnL9T8bCICdmIfgJf
	3R8NyqvlYkP8DKMgVjLYTqMwrnXKeOzMRbGFSdb1a/GE8r4CplMDPIbJHlaGY5+aq5g5Du1ezip
	JKY7X7XRHQ+1EdtsEpK9nS34wQNKRc4L9Orbcza2x7rcAXyWITB7N3ee5oFIJkEGSgjMRMVMZVR
	6k7tR/bSkIPLDf5Tl+KFJcTSlLykNXRNaTEM4OYOrtYeAFDwT+6DenCXnKjo5vvcU1boV+kS6eC
	MTdGqv3HNLPb0ZyWkOMEOnvpXARfrplqS2Yoo=
X-Received: by 2002:a05:6102:688f:b0:631:81d6:e158 with SMTP id ada2fe7eead31-67c8fcbdbdfmr6786140137.27.1779707598218;
        Mon, 25 May 2026 04:13:18 -0700 (PDT)
X-Received: by 2002:a05:6102:688f:b0:631:81d6:e158 with SMTP id ada2fe7eead31-67c8fcbdbdfmr6786125137.27.1779707597811;
        Mon, 25 May 2026 04:13:17 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa32cf2ed7sm2648170e87.68.2026.05.25.04.13.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 May 2026 04:13:16 -0700 (PDT)
Date: Mon, 25 May 2026 14:13:14 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v5 0/7] Add support for Video, Camera, Graphics clock
 controllers on Eliza
Message-ID: <27l6r6gp6zpddgkxne7jasjxamy4dmdkwg3xyp6hrmdbtk7mxj@jxsgeq4yvfhh>
References: <20260525-eliza_mm_cc_v2-v5-0-a1d125619a5a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260525-eliza_mm_cc_v2-v5-0-a1d125619a5a@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=RMyD2Yi+ c=1 sm=1 tr=0 ts=6a142ece cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=iCjoXWfrZ2YzCb4Nau0A:9 a=CjuIK1q_8ugA:10
 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-ORIG-GUID: OyB8Zh-248PQDJZrKIp0RuqGI585m5yO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI1MDExNSBTYWx0ZWRfX+ST928ks88Kg
 sV7knhUyDl4cGTcYSckgqyLxq/Xbak676Or7qeoDCCmATyx3hZJOAzW/PGJ3FQdLYLH6Ye6hJu0
 GhulPBsQk+Xtn4WPE6bJ6vLc10QEcOyZyXZng320xKEj0jRqCBog8ROIB44snUcyNnO6fqGfP2s
 iaNVb17K2LA7wD/4kzSWxfmRzZnxjMRRP+JRaQu3P9tKFoUXqRiy7cOIZPhqN5fJItKduby1ciR
 YtDocG3VJEA4LXg00tCHffe5AKQiAL8QytpaPRnZPrzr3tjzuDk2Rpm4/v3cUGGK/Yvat5ExE2o
 iLMrcuZNUqYdk1ogGTA6OG7MfGVmduKG3WYzAPIhNIfVJc7YkMwkkiYJJ+/Nbg17Hn55xztHbQ1
 jknmeaIswFN8YmLSlr+ZwpAH4DFGEbAxIG1cuMJk4gmxba0Q0T3UURwkkfvxm3nGFEdqgyJgJj+
 IFnlZPZekh4XHSVsuZA==
X-Proofpoint-GUID: OyB8Zh-248PQDJZrKIp0RuqGI585m5yO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-25_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 malwarescore=0 suspectscore=0 clxscore=1015
 lowpriorityscore=0 phishscore=0 adultscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605250115

On Mon, May 25, 2026 at 04:16:02PM +0530, Taniya Das wrote:
> Add driver for Eliza SoC camera, graphics and Video clock controllers.
> The camera clock controller supports the cambist clock controller and
> the regular camera clock controller.
> 
> Eliza camcc and videocc are on CX and MX rails and doesn't have MMCX
> and MXC rails dependency. Since CX and MX rails are already ON when APPS
> is active, explicit power-domain voting is not required similar to Milos.
> Hence extended the Milos camcc & videocc documentation bindings for Eliza.
> 
> The patches have been tested on Qualcomm Eliza MTP board.
> 
> Changes in v5:
> - Taken care of comments from v3, v4.

Which comments? Please be more specific in changelogics.

> - Update milos-videocc and milos-camcc bindings to add '#power-domain-cells'
>   as required property in bindings.
> - Remove duplicate clock 'gpu_cc_gpu_smmu_vote_clk' from driver and
>   bindings.
> - Add '#power-domain-cells' for 'camcc' and 'cambistmclkcc' device node.
> - Link to v4: https://lore.kernel.org/r/20260513-eliza_mm_cc_v2-v4-0-e61b5434e8d9@oss.qualcomm.com
> 
> Changes in v4:
> - Update the clock ordering for camcc and cambistmclkcc in milos.dtsi.
> - Link to v3: https://lore.kernel.org/r/20260513-eliza_mm_cc_v2-v3-0-b59c370dc281@oss.qualcomm.com
> 
> Changes in v3:
> - Dropped new documentation bindings & extended Milos documentation bindings for Eliza videocc & camcc.
> - Dropped the defconfig patch and included the drivers as m from Kconfig itself.
> - Update the header inclusion in the milos.dtsi.
> - Link to v2: https://lore.kernel.org/r/20260409-eliza_mm_cc_v2-v2-0-bc0c6dd77bc5@oss.qualcomm.com
> 
> Changes in v2:
>  - rebased the patches on the latest linux-next.
>  - Add new bindings for Video and Camcc.
>  - Remove commented code in GPUCC (limiter code).
>  - Add device nodes for the corresponding clock controllers.
>  - Add RB-by tags for VideoCC and CamCC/Cambistmclk from v1.
>  - Link to v1: https://lore.kernel.org/r/20260317-eliza_mm_clock_controllers_v1-v1-0-4696eeda8cfb@oss.qualcomm.com
> 
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---
> Taniya Das (7):
>       dt-bindings: clock: qcom: Add video clock controller on Qualcomm Eliza SoC
>       dt-bindings: clock: qcom: document the Eliza GPU Clock Controller
>       dt-bindings: clock: qcom: Add support for CAMCC for Eliza
>       clk: qcom: videocc: Add video clock controller driver for Eliza
>       clk: qcom: gpucc: Add GPU Clock Controller driver for Eliza
>       clk: qcom: camcc: Add support for camera clock controller for Eliza
>       arm64: dts: qcom: eliza: Add support for MM clock controllers
> 
>  .../bindings/clock/qcom,milos-camcc.yaml           |   12 +-
>  .../bindings/clock/qcom,milos-videocc.yaml         |   10 +-
>  .../bindings/clock/qcom,sm8450-gpucc.yaml          |    3 +
>  arch/arm64/boot/dts/qcom/eliza.dtsi                |   61 +
>  drivers/clk/qcom/Kconfig                           |   31 +
>  drivers/clk/qcom/Makefile                          |    3 +
>  drivers/clk/qcom/cambistmclkcc-eliza.c             |  465 ++++
>  drivers/clk/qcom/camcc-eliza.c                     | 2803 ++++++++++++++++++++
>  drivers/clk/qcom/gpucc-eliza.c                     |  607 +++++
>  drivers/clk/qcom/videocc-eliza.c                   |  404 +++
>  .../dt-bindings/clock/qcom,eliza-cambistmclkcc.h   |   32 +
>  include/dt-bindings/clock/qcom,eliza-camcc.h       |  151 ++
>  include/dt-bindings/clock/qcom,eliza-gpucc.h       |   51 +
>  include/dt-bindings/clock/qcom,eliza-videocc.h     |   37 +
>  14 files changed, 4666 insertions(+), 4 deletions(-)
> ---
> base-commit: db7efce4ae23ad5e42f5f55428f529ff62b86fab
> change-id: 20260409-eliza_mm_cc_v2-701c34ddb74e
> 
> Best regards,
> -- 
> Taniya Das <taniya.das@oss.qualcomm.com>
> 

-- 
With best wishes
Dmitry
