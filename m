Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AAFC3446CC
	for <devicetree@vger.kernel.org>; Mon, 20 Apr 2026 17:46:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776707163; cv=none; b=dxubUoknpqqNDlj0b0tmp4Lpoz14qAq16zR+kEX9ZVraaIbCcEih47SPOmbEesuTEhW7+uywtbawoYZ5ZfwM2vU5Fc58zFL/L5awWvlHnVA2b3MIFi/wDNwGMGnUTmKZeX9RDnzF9P8kYzpz20SrZQG7j0b0o5pqmCzlFRRn+hY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776707163; c=relaxed/simple;
	bh=PK3Og+Wr7SWodQIPe7b9VhqU2ni5wqa2k0fzpY/+vuM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T6y1Ma3N34dT8K4IqfK1ZvoYFtyMTi1bZNX3utsY7G01szTfqywy46eXwXgFTUH5NLcYpOMjiXRIzMeOixBU51U7rmz+7CjLszm6AvdJv/QqAD+rP0wgohf6aayRpJ3B+2OJfsnFdqza5EGBpBzooFmEQ8Evs9pBaFmOUVaDWxo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SS25jlsb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=V++CCTRE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SS25jlsb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="V++CCTRE"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63KFpLcI2281651
	for <devicetree@vger.kernel.org>; Mon, 20 Apr 2026 17:46:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=JTG3cvdPMdhP4qQMHJXwSELA
	V02IJif0JhtB+/RFegQ=; b=SS25jlsblDDx6UNZewZFwpFAieQRVxRF6z1IAh6J
	OtJXbGE1Y0EIpf6Qrou/50N1lTDMesF2nvemw113zsZxxp/SWhHVIDXvelLkFgb+
	ETW4hA/PPYfXv9qEYsUeI11uVegNo1j6FXTXUjcXy6BcYzeFz4G0Rg1JfEmsoqbt
	pMpKM70SlBafkyBe6UAqNwkw4si2cN+MMK335Xv4A7cK2ra4QUxhBvYUMJA6DjxH
	yhPD4lb55gxuJFHQIv7q2QTgjXccHTUy99ofzJVKBO8cZ7uFXlAooSKxetBnlM3I
	/CWNiGOunzkbYoTli4czzOT2nuuEk/vAxUuILD5wGp9p6Q==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dnh599xwy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 20 Apr 2026 17:46:01 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-953b90636a7so4081171241.1
        for <devicetree@vger.kernel.org>; Mon, 20 Apr 2026 10:46:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776707160; x=1777311960; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=JTG3cvdPMdhP4qQMHJXwSELAV02IJif0JhtB+/RFegQ=;
        b=V++CCTREZFld7phVlYZHkDHOeanyaoRj4Tmr35WaF0FJyI4SnS5YIcqrZS97hP4d+U
         JQFrfJHhY8+BRuwEL7HgS+tgLygmb8EDe3PBygAH9sTrIZXnbUkPDaAY62WZmz5SaHgL
         slKcL/6Q0knnb1EJEgMklQaSnvfQKRfqauZQ+qIb9fsxGqI15dkawJGTuUyX7IJPeznV
         Xl6d5BLHRd2T4D2lVGWyktNRSd9wSgQ7PdIqjY1MqCP4PebV+hM47do2sNpc9hnf0LpC
         +Gd9AFuaDdfIoeWgbJdXSJRvoxsNECS+KKHQPidM/5qP5SvBRElehxINBRolnHcdvPbB
         eHgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776707160; x=1777311960;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JTG3cvdPMdhP4qQMHJXwSELAV02IJif0JhtB+/RFegQ=;
        b=WzDyHlYJrtqT7WxN+RGDHFVG+TrTbbmwFUH4HB+qt1kY4bnyb1mn/wRn/zC5IZ/saQ
         0JK8x9d+p5dFgPQyjyG1U0MCeBv2P6OZVoCrIdEZQMAqUNeS8mbLky5Ley4eGPXquJL5
         dYO8YgLcrc4OXI05Z2AY04BiBW3nMWmJ94+FjHWLXOZkUZiFekTL6wEI2HZX/4ZCl9xk
         9UwfDVFwfBlbWI6OwgnHtCEMxJQaop+VVyytmxxcxeiKHDFwzFiGaOl5BQR6H0Ad5mBm
         PCJRW29dMQv/h4pFSEan9Yq68FM94iUkjuYxm5RWx9qemKHx+o97J9bpvMJmw26VkTgu
         HicA==
X-Forwarded-Encrypted: i=1; AFNElJ/DbS9xRBLV7sjwmEeYBmxGIgmTMlvT4qPfmudCdJMIqSnSg2B+XHuV4kuuukZv4FeSCQ0o7S9oSwhA@vger.kernel.org
X-Gm-Message-State: AOJu0Yxks99D+YRPq5irREyysIVfgUH1drok1Y3CjRI5BTpQMsU8DyVJ
	QL175qwbjxTu4DctqNQDe+Fsa1C9o33J40d+yHdG7gHMPX7B5YSl0H0jfJuKrlc1jTPHEcapYNv
	ftQLpNnGhNtMmGJ/BOZnJnbAlIgzixN9T7mk+/TgWypevGiSFt8pUanFKKSK/9xBK
X-Gm-Gg: AeBDieund9W+6ohL5r7pFraQpLVDEO3anJwoO1vorajxE6ZsjWueJx5Mhc+pmbefBQg
	RXRLPA+yVY4YwwzW+LgHYxzNFip5Yf3z4qlCk5mmfTuhwRYZXVKtiv0KwLRUzwV5nf9FCfhjGna
	B+wCwhgpGgKxDUrHrk32v5aIg8v8XNA7TDbmQkAaDa2MxF/YCnH9gf6RD3ZFhCAxRPXgDEVK9ud
	W4JJx3HV3D4kM312gPU5KHThhlgu60nI/GJgU7v4bFUL/kfS0cra5veyJ4I/zANB+8VB/kf7+F1
	fciCa+5mV619D3eOTMLpfFdeeVP3DbLHjhVzquv5B32iCjGpNaqqlCxQ3yGonF0/pK0iecJJs24
	pB6+wiOSwlyA23Pw82/SlCkKRnRdgEzb6TlQb4pU3neXhRK+PANl943UOUzmLl+w28SDPjRAwZy
	7Oh0d9lCHqhHFPiU0Mr7muPipwHeOYu2oeRWdtpeqMl2SoEw==
X-Received: by 2002:a05:6102:3581:b0:611:b9be:1199 with SMTP id ada2fe7eead31-616f6ee96damr6894877137.14.1776707160454;
        Mon, 20 Apr 2026 10:46:00 -0700 (PDT)
X-Received: by 2002:a05:6102:3581:b0:611:b9be:1199 with SMTP id ada2fe7eead31-616f6ee96damr6894846137.14.1776707159957;
        Mon, 20 Apr 2026 10:45:59 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38ecb6f0d49sm25711771fa.19.2026.04.20.10.45.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 10:45:58 -0700 (PDT)
Date: Mon, 20 Apr 2026 20:45:57 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>, Lee Jones <lee@kernel.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>
Subject: Re: [PATCH 02/13] dt-bindings: clock: qcom,sm8550-dispcc: Add
 display CESTA support on SM8750
Message-ID: <hpun2wdw3lnthjfwmycufzqrwl5ssiohdjf73kxcpm2reuyqqf@oc672sww2pqe>
References: <20260420-cesta-sm870-dispcc-v1-0-eb27d845df9c@oss.qualcomm.com>
 <20260420-cesta-sm870-dispcc-v1-2-eb27d845df9c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260420-cesta-sm870-dispcc-v1-2-eb27d845df9c@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: fjSqBbfjmQFSUVcyHlf_Nva0BHg5BIO2
X-Proofpoint-GUID: fjSqBbfjmQFSUVcyHlf_Nva0BHg5BIO2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIwMDE3MiBTYWx0ZWRfXzkhnsP6ajLUg
 vzupawYPJqlzioWMl2v4AvmfbpjfQlkAcuNmYMb21BBAwDACI4SeDG1YV5zz2I1o+9LOWmmK+Uv
 kOKZ/vJnMvWAp4jCS5izi3HqDKi4gUXtZju8yFQZ1Xi3k5wQKx96IwKPRtZVmzRXEP+qiIkKt0K
 ocgvVBjwjGJjZpEssr77HXBB9jw1Os8pdfa5UTPs0gubwVsftVcxp4zPxJpCnNv6Sdoa4DgHEUY
 gkROttvtFXH8+sH8s/3FFJnxzZj5CHj2MUvdEUT9u9ykRQYb1UOHEC9exSUo9O5WGjAnvNSc96Z
 WCF+m75v60ipZkOUNJKT/HMG02gMcFgCo/3q3k0vKUJUZcs1/raR1qYnI8OtNYDxzrS31UppuqA
 syrfLChW2ZpGOmdOwbLbtFY623H7Set0kTMYF1xkRBvlZg+hINKiZyu3j+Mry2kWmadkw2bdHFO
 ienVrSDeOLgqRIqHEwg==
X-Authority-Analysis: v=2.4 cv=HNrz0Itv c=1 sm=1 tr=0 ts=69e66659 cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=RHCnOHRpr3UYmH0CO9YA:9 a=CjuIK1q_8ugA:10 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-20_03,2026-04-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 adultscore=0 spamscore=0 phishscore=0
 impostorscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604200172

On Mon, Apr 20, 2026 at 09:58:55PM +0530, Jagadeesh Kona wrote:
> On SM8750, a subset of DISPCC clocks is controlled by the display CESTA
> (Client State Aggregator) hardware. These clocks can be scaled to the
> desired frequency by sending votes to the display CRM(CESTA Resource
> manager) instead of programming DISPCC registers directly.
> 
> Add bindings to allow the DISPCC node to reference the display CRM node
> for sending votes to CESTA hardware and the CRMC syscon regmap node
> which is used to read the frequency look up tables provided by CRM and
> populate this data in RCG's frequency tables for CESTA controlled clocks.
> 
> Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
> ---
>  .../bindings/clock/qcom,sm8550-dispcc.yaml         | 48 ++++++++++++++++++++++
>  1 file changed, 48 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8550-dispcc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8550-dispcc.yaml
> index 591ce91b8d54dd6f78a66d029882bcd94b53beda..3e049b2160a1781c866bb30b29f0da5c9e156b61 100644
> --- a/Documentation/devicetree/bindings/clock/qcom,sm8550-dispcc.yaml
> +++ b/Documentation/devicetree/bindings/clock/qcom,sm8550-dispcc.yaml
> @@ -60,6 +60,18 @@ properties:
>        A phandle to an OPP node describing required MMCX performance point.
>      maxItems: 1
>  
> +  qcom,crm:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description:
> +      Phandle to the display CRM (CESTA Resource Manager) node, used to communicate
> +      with the display CESTA (Client State Aggregator) hardware.

Is it going to be shared by several entities? If not, can be make a part
of the dispcc and get rid of the extra CC <-> CRM API?

> +
> +  qcom,crmc-regmap:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description:
> +      Phandle to the syscon providing the CRMC (CRM clock) regmap used
> +      to read frequency LUTs (lookup tables) populated by the CRM.

Why is this coming as a syscon? Why isn't it just a register region of
the dispcc?

> +
>  required:
>    - compatible
>    - clocks
> @@ -100,4 +112,40 @@ examples:
>        power-domains = <&rpmhpd RPMHPD_MMCX>;
>        required-opps = <&rpmhpd_opp_low_svs>;
>      };
> +
> +  - |
> +    // Display clock controller node that controls some clocks
> +    // using display CESTA(Client state Aggregator) hardware
> +    #include <dt-bindings/clock/qcom,rpmh.h>
> +    #include <dt-bindings/power/qcom,rpmhpd.h>
> +
> +    clock-controller@af00000 {
> +      compatible = "qcom,sm8750-dispcc";
> +      reg = <0x0af00000 0x20000>;
> +      clocks = <&rpmhcc RPMH_CXO_CLK>,
> +               <&rpmhcc RPMH_CXO_CLK_A>,
> +               <&gcc GCC_DISP_AHB_CLK>,
> +               <&sleep_clk>,
> +               <&dsi0_phy 0>,
> +               <&dsi0_phy 1>,
> +               <&dsi1_phy 0>,
> +               <&dsi1_phy 1>,
> +               <&dp0_phy 0>,
> +               <&dp0_phy 1>,
> +               <&dp1_phy 0>,
> +               <&dp1_phy 1>,
> +               <&dp2_phy 0>,
> +               <&dp2_phy 1>,
> +               <&dp3_phy 0>,
> +               <&dp3_phy 1>;
> +      power-domains = <&rpmhpd RPMHPD_MMCX>;
> +      required-opps = <&rpmhpd_opp_low_svs>;
> +
> +      qcom,crm = <&disp_crm>;
> +      qcom,crmc-regmap = <&disp_crmc>;
> +
> +      #clock-cells = <1>;
> +      #power-domain-cells = <1>;
> +      #reset-cells = <1>;
> +    };
>  ...
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
