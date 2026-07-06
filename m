Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3FAD42088F
	for <devicetree@vger.kernel.org>; Mon,  6 Jul 2026 13:00:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783342828; cv=none; b=RP24F9+eT72+IZRO2A2mqrD2StPevHHT9o2JvZX8i9TLZxO9pHydCu4KLgYJJeZSpaPU/zeZ/RBDNpMIOsS+NMgtpw/4eh3TfW/6RVcKq0/jbA1wOmAqSif2jHqfArhVO28zIqO30oBAgT5pZK4z+//nLgBULnk0e0esMIvooHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783342828; c=relaxed/simple;
	bh=PFL5j3TOs/5RUWWKBQWglpjHpi8U23pfidgWiscwBvg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hQKX9NbEh1Xdc0fAr8veO8W73r7KhB5rUVfUeO04ZY+4YPsggdEDZwLwn/aDJMaDyEBA7sBokU44M5ZEq8pX0lrDDzTGhKuQdV3iQ1ZVMMTPh2Q2PnSGI0K1HIA7/gR4THxoeG6Y+5SHpvatGiq7hISVXWa79N7iE6es9oCCXU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bsr7BpIN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LYiy+r78; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bsr7BpIN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LYiy+r78"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666AxLkT395413
	for <devicetree@vger.kernel.org>; Mon, 6 Jul 2026 13:00:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ADeTWQBt9148buPdrdbo22KWlh4VM7YJwJh0PS9PtUc=; b=bsr7BpINFB7732a5
	TZiyT6s6kG1k2MRD81WFcM50J11VxwmbIeqIOaXjyfPvvTMlPq01NRQajK/YXoiB
	vewBJKo3GT/2HqqwTEfheyqoK4zkDVWtStJxFgaw++ollWqeK+PDTVLROLYUTG2F
	ZV1A3t68Pek70CZDoQ7mbKXQsaEFWUsPNpmMOrKgxgYAYUzqXvmeU2P5qmJ5BiXA
	sFkUvBEx8scn6dcq3it8ILlwnMXGi7glvEddnGGz702xv/U4cQ8wYzxTlsHfmFcS
	2PE/o1INBqGSlS7otzVPrOeF/fU2q3AgQymJlAv8o3kYM9mHoPuxUbL8QdmrjRjm
	mIG9gQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f89qpgsf8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 13:00:21 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51bf9df2eabso2056801cf.0
        for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 06:00:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783342821; x=1783947621; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ADeTWQBt9148buPdrdbo22KWlh4VM7YJwJh0PS9PtUc=;
        b=LYiy+r78zB9upFYZy2gR8Pizcf1i2xZuURCL6lWRX8OAcw0QK5f2gZ6FruMTXpjTaO
         qgiVsf777KrS/mJ2z7CRvFeChC+sKuobAIDyHZtJVg03dSlTEZsoHBLC9muFjTjZM7yw
         2rBkdeUFbGB8qRCKYvDf05kKImA/Aci4MfluO2azjB99hHIcg3zSZnRsSCEQJbYtxQdm
         S46P+mJYKzhK9O7OvHlKrwIrbbBFquHFZJxSZKM3Be5LIGL1vCk+tai14NkEWONU0tWy
         rVsVjyu+EayxPaA6VDeadBWOiklhCBb7+2gRz+lenh0/hI8DsAmhDERNVFnmVl0tfCU2
         vTng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783342821; x=1783947621;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ADeTWQBt9148buPdrdbo22KWlh4VM7YJwJh0PS9PtUc=;
        b=An/BvdiVGUAor2kL9xtCw6oimfThAGyaP5DSO2LsLVQ+v10AOjdVfpPIWOfvQMnRZp
         GECsJjgkZkB7urHLcEUoR2Vgh5YLVGf1UpGuzmx7OEKuKDI7XSAehCkkYjFY1mt5GqS8
         cDRtRM0bV8rCDsrTQ9S88Ph5aMQybcFn9/aWgrOM3u+2SG9GgqN0t8FOOYBoXtkg5jgq
         PONsIBCf37taBoujVEVUeYPOnhxFxi0z9K0kJ+9kBWjDOyuhJYwsA0wVtTMH3TFjpmCB
         dd66P9URb88JpELQ3QPPa0MVi8CM0wBInnl6TlY6NvF0884ecRh7am0ExynlKH961RdJ
         FSoQ==
X-Forwarded-Encrypted: i=1; AHgh+RrukpHLNP38vQNCCmw5U6yIVLEq11GBfinvBFJry0N97MJCRc/l64PSwPsT29AaV8l9pUmk+urxvnrX@vger.kernel.org
X-Gm-Message-State: AOJu0YwE9FCdITfR41Qw8PGlDU98UeYoYEASiib63JEQDo+gAyeh192E
	jzhR0jArQ+cSAG79l56plCUWodxvAZ23ed1Iw4r+zyu8qmzq0VdScW2buCXTsoVzrjtugAKIdGA
	g74xoPYV+ed9pk9uQ7DJvHLQLyaDgh37aC+4BL7eBhSfJp9/oCFzkD0wjtcUPVdRU
X-Gm-Gg: AfdE7cmnXDea4gofcKSPCX/0NLvZX5ssWXoN8bqx7NXxMj3ZhPq/RMcsrDoyWtZJCLc
	zEe7+/k3S1h8+j7QpDqY5HPqAcPl/2B5ljWfxC9r6BBlV/92A+2zR/T1kywDItrCe9m6mD1EekN
	IXhnBzb3IGbzmlY1cHC5lf8CIbdmxqNUq63A02l3lBviA5Y+YjvxdqLMUk+8MZ4rbWGMWZ0dCnX
	Oz9csYekV8MoSQXUDsBkukjy5I+aHkq/ieUinr/5Ww35/JLi/SWEQzN6Cv7BYnvFLwHYiwiK4RA
	X3NP9lC75k2GzAu1h/V5+8hGnQlcwS9QMRrp3NQrGCHHMA7oZnZfd561yJVH6dLMxJoxcJ8pFQm
	VL/+TJCM4zbYiFi9F80nMTrtxtK/I109zg4s=
X-Received: by 2002:a05:622a:8b:b0:51c:1c73:51a6 with SMTP id d75a77b69052e-51c4bdfe4d1mr90901481cf.5.1783342820401;
        Mon, 06 Jul 2026 06:00:20 -0700 (PDT)
X-Received: by 2002:a05:622a:8b:b0:51c:1c73:51a6 with SMTP id d75a77b69052e-51c4bdfe4d1mr90900371cf.5.1783342819707;
        Mon, 06 Jul 2026 06:00:19 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c12b6091785sm772908166b.16.2026.07.06.06.00.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 06:00:18 -0700 (PDT)
Message-ID: <3ad818c6-39fa-4b8c-ab82-f5cce6743cbf@oss.qualcomm.com>
Date: Mon, 6 Jul 2026 15:00:15 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 19/19] arm64: dts: qcom: shikra: Add support for
 DISPCC/GPUCC nodes
To: Imran Shaik <imran.shaik@oss.qualcomm.com>,
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
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260703-shikra-dispcc-gpucc-v5-19-cc13826d4d5a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: fZ6jyDdvLC-6msQ7QPjHH3CWVkVPqJhJ
X-Authority-Analysis: v=2.4 cv=c6qbhx9l c=1 sm=1 tr=0 ts=6a4ba6e5 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=3UrmxHwGBoanhqk-odsA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDEzMiBTYWx0ZWRfXwsQyvtDcf6Y4
 2M9/DiAppj7hLnVZcYTaIHXkVjf6Mj+eroVBI+CZsGPkxyh7tbreO2xKpkqqMhvc96wErnJldn5
 dIhDI+5F9z04G5a4M8K40y23EkrbcDplBWwVwklc6eUhwwo3TWD/cLC1epujd1Zxhqk9nBIBmsm
 TBY0fSAZpNv5V2dN+Yb9LWxQ7D2rPJhxaKf/mc4LprMC/iDNGUQfMyeB45BvcJ1cWabZiKuPrKC
 +bDtbMBydQm/C1kERnORtVu+xs9886HXUVFIwB6r14d724MnGY0j/Xcl56xxiWKn6lBuXckt6/9
 vPILXuN49Rawi1h2UEClLZOeHQ0oGtZEPrE/Vyt6VjzO++3LM9tIa4SwsGu9I2lITXJCylNgH0v
 fspqbViP6FWTBlnX+mmexkuQ+16Huw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDEzMiBTYWx0ZWRfX4d0qGhSD1FzD
 uRDnhnxxtgn3WQ5i4fMK1bi50AOijOpM+uC7+9WY1wrF/il0McJ85VI+rgeQzVKAUWM75wcAUW2
 +BVQQYLmSxRYAP2vh+NMMvDYINStYws=
X-Proofpoint-GUID: fZ6jyDdvLC-6msQ7QPjHH3CWVkVPqJhJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_01,2026-07-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 spamscore=0 adultscore=0 phishscore=0
 malwarescore=0 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc=
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2606150000 definitions=main-2607060132

On 7/2/26 8:31 PM, Imran Shaik wrote:
> Add support for Display clock controller and GPU clock controller nodes
> on Qualcomm Shikra SoCs.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
> ---

[...]

> +		dispcc: clock-controller@5f00000 {
> +			compatible = "qcom,shikra-dispcc", "qcom,qcm2290-dispcc";
> +			reg = <0x0 0x05f00000 0x0 0x20000>;
> +			clocks = <&rpmcc RPM_SMD_XO_CLK_SRC>,
> +				 <&rpmcc RPM_SMD_XO_A_CLK_SRC>,
> +				 <&gcc GCC_DISP_GPLL0_CLK_SRC>,
> +				 <&gcc GCC_DISP_GPLL0_DIV_CLK_SRC>,
> +				 <0>,
> +				 <0>,
> +				 <0>,
> +				 <0>,
> +				 <&sleep_clk>;
> +			clock-names = "bi_tcxo",
> +				      "bi_tcxo_ao",
> +				      "gcc_disp_gpll0_clk_src",
> +				      "gcc_disp_gpll0_div_clk_src",
> +				      "dsi0_phy_pll_out_byteclk",
> +				      "dsi0_phy_pll_out_dsiclk",
> +				      "dsi1_phy_pll_out_byteclk",
> +				      "dsi1_phy_pll_out_dsiclk",

FYI neither Shikra nor Agatti has a functional DSI1_PHY, so
unless you're worried about some incorrect bootloader version
toggling them and want Linux to clean them up, adding them is
no less than unnecessary

Konrad
