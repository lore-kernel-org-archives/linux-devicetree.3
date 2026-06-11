Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EF0F3603D8
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 09:04:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781168676; cv=none; b=LfmzTHwnpMUOqWntQrpGEggFNoSzgVIE45iXjR/1gmyDivVKQTc8vTSvrwDPERq42mfjAQD1CH1W5mQLcG0zITBnNDfrfx7952Vu4kMsVIWNZS9vv6IzhBZ5SvNYqX7+4jd2rN7IXX4EeNYK2nYmeRYlmHKzn9nVY8eNmLGkvLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781168676; c=relaxed/simple;
	bh=/AdZWHYhLwWVo5OoYwNQWqZPl4Dl50Q7xgUMHMZetvI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hotoz3KyJsWrR6Gsiy2eXCV0I/bHquW7OTMrDdJdhpDLBcshIAPCeuR8wqcLmGJDWWl5jevRfjxzTySKTHQOV8p+w0mMq9DBKK8QES1BfygLzMontRMwBon4NhUJ3Xi5cJZa27EcghYqHnye4uGi17lmGue65Ymv0LiCc7kpeIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ues5SqUY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hHQzHOri; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ues5SqUY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hHQzHOri"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65B5GO753712016
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 09:04:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oLylx6RET1C6BLRSx4uIEDpkfcTf14FTcGVjhzwW5Sc=; b=Ues5SqUYuWVsI8kA
	dBKOww9BskKCPxoiHE7tXF+DqMoRGNFHHtwVZ/D0vlx1AF4RB9mm0stDB0EJKSf2
	QYPrPeXeirCggPQc68THmcP5xGze0mO7g+kPIVhAGmFHwpv8f7zD+fUxRIQmDD/V
	JqU5ta9NK9g+b8mXfHNkWOoxmyaY8HP0Dr7dBvWC2LZibu3ydUfaOt84JoKvIZ2A
	oVpmdtPQB0l3Xg6wUjb4Ipf5TNRoG684F1IYeSFhJdkniratP7RwVt4zWfXQfnbX
	GXXdHSIvGRXf3hQtWT9gPgC/sBov+nhi7Qb6MnKeKzTt5GkWMaZ0egvcraT3vYya
	aqABHg==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eqe6uaktr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 09:04:34 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-8ccee12a34dso16124206d6.1
        for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 02:04:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781168674; x=1781773474; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oLylx6RET1C6BLRSx4uIEDpkfcTf14FTcGVjhzwW5Sc=;
        b=hHQzHOriNb3y6d+jFsx5znlo6VyU7qU0ITswuZyLqg2O0kYxhMCShnhXaVv6Ki405p
         rhPq3TzgDoav9OywK8a3ckiEYJLITIb1YrqvPNMZf5hyuFMuLTDjTRJ1Gvp9NDsgqqW0
         syLC51tpB5i1Y1wCpqJbsqQmDbZaNR1X2VqfshTVIQLdnxAHGa5DZTLOejqpAEdWrf1b
         yEBrEKTDGnFFaq/O2VtPjrW+A1mQQs+hhX4m2K/CCOnVObOnbjxvt46Q3gbLyd9//krN
         2+uv0JJPYJEDhryoBD1mg2FJEi/YkAjw1UHb65iwjUtZCuYQaPe100Cp5tfFUq+jShdL
         zZZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781168674; x=1781773474;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oLylx6RET1C6BLRSx4uIEDpkfcTf14FTcGVjhzwW5Sc=;
        b=gWI9dwMnwhE/CygKVhbTHaA7/W+OAyE6o4xHqTs4dYh6QlkXwbEBnYftWEP8Q8iR0r
         2UDPwyNAqpCZ0KmIsEZEP2ngEFtPh3p2J1/UhyP4fi+KmX2q6NPc0tI7JGEH+HXKFffD
         3JV7N2Ia2KQ/CnBPBB4FAfQttkOVJKmxwSFbaVB26ycHwq4as5CQZWDNdXQbyRESpfq5
         ZPeLqrFymbQ6VP065qHAJrWiDQxOEFXnBzfejk1fuAjCH6MzCS8yqqYEAE7jYzN5CNA6
         uVyFx9KVA4Ry6YxiEd5EQPjgadJS5ZPU03KL2/WxMR+dc8DaQyLXoHMWFk6x9C8ISyHs
         rtwg==
X-Forwarded-Encrypted: i=1; AFNElJ9p0iWVjBsBqxROXTGmRqtDnAvjJRj10g8qZYvMUM3mKZb6+5cCeXFpGAFZjAoMLAwjYXqwaAZJwuK+@vger.kernel.org
X-Gm-Message-State: AOJu0YwTp/HF+DamoH3kYMrQP+lwx1tRDOy7e/PGMjKd+NG5Jj9LftRq
	Ba1xD5OdyLjLm5QAgSkDrwKQq3X2VsgDjHnFh/vP0p0dIaszeBLNIYUgtwH/7MjgDN/RTppv+No
	9YBVyjleKRADAkdLPBZ1NcShfAe5iyZ03aDkVmOzctrwLNF3E6e3Cx2rJxpRgO47C
X-Gm-Gg: Acq92OELXK8Yi2jMIz4WWodwFcB9UAXFBTpS80POelNZ19mop7QBNDjV1/62QtbVgqo
	vVGE9VZ6F8q39xp79kBfJJzzgJjqeRL+UP3+cYhAMknGuujmFxQRAtTEhSfc41IMOrROCH5oHa4
	QmpzjSwl0B9MthmpGPp3iRi9bkRXeZB0h8iTXu1UywUgAhLsZzGeW1yeO8azL9UKWwaRQVIce27
	Pe47bJXOoxBctgCOOqimEZ9luC0bXs1minlUdukfYXYGiVP36GuBsCen8hx/F6W3znSr1Jn6mF/
	sRWBMff4vSjMhi3ndVbBWlsBf+sUzuJkP0W+etGh9pz1kj2OSA+slcBh3PD2FNikz/VBTjr69AV
	PnXwNsHn6vLOmSSrwfJMsW3EjQ1KIfm4Bcsd3scTy5qpiPjwAbxegv5Dl
X-Received: by 2002:a05:620a:710d:b0:915:f92e:86 with SMTP id af79cd13be357-9160ab58ad4mr148963985a.2.1781168673624;
        Thu, 11 Jun 2026 02:04:33 -0700 (PDT)
X-Received: by 2002:a05:620a:710d:b0:915:f92e:86 with SMTP id af79cd13be357-9160ab58ad4mr148959085a.2.1781168673107;
        Thu, 11 Jun 2026 02:04:33 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bfcb0f14315sm37209566b.10.2026.06.11.02.04.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Jun 2026 02:04:32 -0700 (PDT)
Message-ID: <6a1fdadb-6a52-427c-b65d-70dbe80ccacc@oss.qualcomm.com>
Date: Thu, 11 Jun 2026 11:04:29 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] arm64: dts: qcom: Add SD Card support for Glymur SoC
To: Monish Chunara <monish.chunara@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Nitin Rawat <nitin.rawat@oss.qualcomm.com>,
        Pradeep Pragallapati <pradeep.pragallapati@oss.qualcomm.com>,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Sachin
 <ssachin@qti.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260610111508.3941207-1-mchunara@oss.qualcomm.com>
 <20260610111508.3941207-4-mchunara@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260610111508.3941207-4-mchunara@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDA4OSBTYWx0ZWRfX0//tT2PtXlYb
 pkmyLFGTg0FXb4tFfywBrrE7ntOeolXcWOQfy/IQq1owvCiHDEPZrBV5H9mnpYQVTOKM+RTa7Ma
 U25nNFmqcdYBt4ULE/J7SEaHEXNZNbA=
X-Authority-Analysis: v=2.4 cv=atOCzyZV c=1 sm=1 tr=0 ts=6a2a7a22 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=wWqRLLJhWDTYxtXTZgcA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDA4OSBTYWx0ZWRfX8pXZl5VfQclc
 HdV3OEF5ZhVPwzyN1umKJsjXLQLphbjp0qzAXeecoFNFlZ1rJ3iGQB7bjuShW5MN4DNOh5ov0NZ
 sNLFwqxOH4hWACv7/8ytO5Gc1v9P5QC6lfdZPupXiaJMRLP6uQapLHL3d0tTveAnNEKs9ojOYuW
 drNJw50Qrx57BRWsh2cECKzKVmvRlQdYBL5Kfa+YXym/WDC71hrbcZQ7X3mQ/7h0RdayDjV09i/
 HGEfJW8M84vhQcrB1nFCzysodj97FjRwcWf26yDATSAsmGU3xideSxUv77dAaHSg1ZTZvSsHWfj
 kdBG5AUgJ9USXARMxQbKZiJ1vRk6nOdama4YcwOoOY6zJkVMpiD8wosN7a9vgxVLvIRoRCs2fJu
 kKiOBEKLhC4F7x874SxUck5gTEmVS9/j4OQQvzsEJoAJu5E3crOAXeg8Zh7QoaQV1z/3zP+vzi+
 4ctf4g43D85P7RWQ2/g==
X-Proofpoint-GUID: -0z_G5gtTVYqxwfvGaRGs0ELJOdrdqZf
X-Proofpoint-ORIG-GUID: -0z_G5gtTVYqxwfvGaRGs0ELJOdrdqZf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_01,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 bulkscore=0 clxscore=1015 spamscore=0
 malwarescore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606110089

On 6/10/26 1:15 PM, Monish Chunara wrote:
> From: Monish Chunara <monish.chunara@oss.qualcomm.com>
> 
> Add support for SD card on Glymur SoC and enable the required pinctrl
> configurations.
> 
> Co-developed-by: Sachin <ssachin@qti.qualcomm.com>
> Signed-off-by: Sachin <ssachin@qti.qualcomm.com>

Firstname Lastname?

> Signed-off-by: Monish Chunara <monish.chunara@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/glymur.dtsi | 91 ++++++++++++++++++++++++++++
>  1 file changed, 91 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
> index 20b49af7298e..0989fe39e7ef 100644
> --- a/arch/arm64/boot/dts/qcom/glymur.dtsi
> +++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
> @@ -3927,6 +3927,57 @@ lpass_ag_noc: interconnect@7e40000 {
>  			#interconnect-cells = <2>;
>  		};
>  
> +		sdhc_2: mmc@8804000 {
> +			compatible = "qcom,glymur-sdhci", "qcom,sdhci-msm-v5";
> +
> +			reg = <0x0 0x08804000 0x0 0x1000>;

nit: Let's drop the \n above
> +
> +			interrupts = <GIC_SPI 207 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 223 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names = "hc_irq",
> +					  "pwr_irq";
> +
> +			clocks = <&gcc GCC_SDCC2_AHB_CLK>,
> +				 <&gcc GCC_SDCC2_APPS_CLK>,
> +				 <&rpmhcc RPMH_CXO_CLK>;
> +			clock-names = "iface",
> +				      "core",
> +				      "xo";
> +
> +			iommus = <&apps_smmu 0xd00 0>;

'0x0' for the second value as it's a mask, please

> +			qcom,dll-config = <0x0007442c>;
> +			qcom,ddr-config = <0x80040868>;
> +
> +			power-domains = <&rpmhpd RPMHPD_CX>;
> +			operating-points-v2 = <&sdhc2_opp_table>;
> +
> +			interconnects = <&aggre3_noc MASTER_SDCC_2 QCOM_ICC_TAG_ALWAYS
> +					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
> +					<&hsc_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
> +					 &config_noc SLAVE_SDCC_2 QCOM_ICC_TAG_ACTIVE_ONLY>;
> +			interconnect-names = "sdhc-ddr",
> +					     "cpu-sdhc";
> +
> +			bus-width = <4>;
> +			dma-coherent;
> +
> +			status = "disabled";
> +
> +			sdhc2_opp_table: opp-table {
> +				compatible = "operating-points-v2";
> +
> +				opp-100000000 {
> +					opp-hz = /bits/ 64 <100000000>;
> +					required-opps = <&rpmhpd_opp_low_svs>;
> +				};

The SDC doc says this should be 50 MHz> +
> +				opp-202000000 {
> +					opp-hz = /bits/ 64 <202000000>;
> +					required-opps = <&rpmhpd_opp_svs_l1>;

And that this should be opp_nom

But the clock plan doc has info that corresponds with the content of
your patch, please check which one is correct and file a request for
fixing the wrong one

Konrad
