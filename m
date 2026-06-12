Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3E823911CE
	for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 17:19:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781284787; cv=none; b=Y+eM5Vo+ZHUrgez6VPIhxguHpMC6mh5INLXeaCQHIqLxBKj1+wMX9rvU/RiLcR4DyxcnTF18nLOv8vDnJ4COR+jJHHX1NJbns183dFW3z7NXMC8bO2HH801oaq23f1Mp4l/MF9kBnyk4TzCdXfhVzSiTJUgigcp/Z54PAH59FsM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781284787; c=relaxed/simple;
	bh=q5vTbGXIbsd2Eh2VvxJhzRPgxjad4gTyGkH3gSYi0o0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=S/mlPpBfYpTt876yF29U6e80Dvht0ubu7uIkdA0tjQC7/SDD4T+qptwXwqkojpIzFH2SJCkkHtTcZBMu933J10fX67pg8f3IkiAQhfbaAW0NNbdZmQhKw5ZvYlvDsNQluTs7sPfQrGgXPdZX9GZuvBt9Io45TjXWQJKTTHP7aIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZR9ssblJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Bn2tHA+I; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZR9ssblJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Bn2tHA+I"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65CGVDDH047401
	for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 17:19:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+God3BGRWfxFPoDCTks9XxJk+bGqwi5qZ/7Vd+kYARU=; b=ZR9ssblJ6aPVHIUx
	P2Cz0TM9MyVxeIhCu3t20i3/FGY/m+zHbvEyILtzONNgvv/o2uSw1E1/axPckAL3
	t9M6CaaO8oxaJc0aw2hS2NZnShsqNoL+v50ehGdxxiKBuGkgzFevwQyhOGXKN4ra
	UYcS9rczffFTMdezCFHxB190VAebSqQ54rKPF+uevuwlYxpNs6P2XFtf2jp/LvAU
	+6BhTZGHfwIWxJXpx8SAwzhDtog0FElROZTKEJvg6ogmBC3JGUG+IT/iOl6a9XxO
	MuZMGVbwrJSgU2/QeeTo2RUPj5llh5Ier+zjHmNfeRJhry3lxhFf6syCFpAKji0/
	eKK31g==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4er2u43sfa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 17:19:45 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c85a2cda4d0so618192a12.3
        for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 10:19:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781284785; x=1781889585; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+God3BGRWfxFPoDCTks9XxJk+bGqwi5qZ/7Vd+kYARU=;
        b=Bn2tHA+IYia7e3spnIEnGgxxTcmqTIcfuAi0WRmaxdgN7Oevt95T/bngNC5GBOG3fR
         3/y/omdyc83DCzg5QcHAM2pfIaCu75wGkK7s3RIYVrfM+0oSxGycP0PFum/MksJtsSc9
         6gE1dUM7TdwLdg0Wk+oAUqa89wvGbY6al65pjcDPRwAunUBXemndMwKGBVuHQaJ9RSJr
         uxJTxWWRcwlM1sFFA+MQZcAbJc0AyISCLy6KLKmyrnVDVWqvJgfiYJII9HwGzQbzlMuo
         BrxdJP6qnzSDom/X8xTQvTRjb7O2JIhw7NFu9HTSRAiQd2V3qf99GY110mrLQ1FLuri1
         4pEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781284785; x=1781889585;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+God3BGRWfxFPoDCTks9XxJk+bGqwi5qZ/7Vd+kYARU=;
        b=lM6ba5simULcTolilTrlX/WntYHLOBPO1zbWptl9NJmqlIDh7BElC/bkIfZAqCDjzH
         HY9Y/K57tImPnfrVQHL24KRjLwT0O/1fMWiXfgQNtJp9uZFv9a74FhaCkvBsLP70/m5q
         YECz0WDW5MxMAu544sakzFkHEUssWKuxJ4N1dEEqZTqyFV0So8EvrOK3Q2GgcGgaXQi4
         3STKozmoQOHlJJXnoIytNU0Z1G95MPkMzYVZEJqwJumTtaSvtki0Hdjqv2PvW30STJqo
         OU7w4UGnm5eH7TtovfwSQUUbtEBDG8uWoqCXfGAcQEImAiUbFAJhxVzXbM24J4VJjeEV
         u0ww==
X-Forwarded-Encrypted: i=1; AFNElJ/mKR5kU6k//SU1T06CmN2b4P8uYho8+WwnfxMAZpYPA8hkYCP1aWggeTT8OdxtOvyG6VWODILCxiH3@vger.kernel.org
X-Gm-Message-State: AOJu0YzE2nOHhp2fR5mPOzg6lDJSxUfiG8Ue4wdzm7Eqt5OtBmKOALA7
	R4wqAN302xCt04aoVOhu8iH7kXTsbgfgfXbj4CYpTEL6OplKHEV5XfX+2+PyocTY75y5/7ajedi
	//HEYVs0AWlvtshTQ/ll96THknTpWrWlEzdaAW70nVk9S6T2WN+nVVwmGF2vDU+f0
X-Gm-Gg: Acq92OHh+7cNX4K/goCNBU4ZJ0blF1CiMrjbq5I5MgjVNO9Yuzd8xBK5mj/EAj5ruHK
	IaW4bIFWPFM5HhlyfyaZZ2f5BoYh2GOe+C4elQevBADdTkFw/cyeZXbZVbT8tz/BmochR+Q8+fg
	tAqMCMiDT+KFewXEjt+zJkBisfBAEr5g1NxvK3DPflMmEsGA9sV6J9jbS9tu/k67bYi12WQcFxB
	Tju344cSFzLIZzkWKP1VOiaoNtGgj39iWa5Ua3VBsBTkYo9ifbtI89e3IYBRRLP0H9oxIULDvLa
	U42WwBALX1aUpoqWJBIqMf4peNteQ0HMBBujogL3rEPUmG8vSGazXOlCQdu7UGKgth5WpzS+F9u
	hkjJFZt7q+5qwvl+a6tcTTpFa+2gFx1nOUYcBfwDE2nRi6LPWrh0=
X-Received: by 2002:a05:6a21:4d8e:b0:3b3:223f:d3f1 with SMTP id adf61e73a8af0-3b7962bb2e0mr572023637.18.1781284784263;
        Fri, 12 Jun 2026 10:19:44 -0700 (PDT)
X-Received: by 2002:a05:6a21:4d8e:b0:3b3:223f:d3f1 with SMTP id adf61e73a8af0-3b7962bb2e0mr571975637.18.1781284783791;
        Fri, 12 Jun 2026 10:19:43 -0700 (PDT)
Received: from [192.168.29.166] ([49.43.232.97])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c866518677dsm2627178a12.19.2026.06.12.10.19.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Jun 2026 10:19:43 -0700 (PDT)
Message-ID: <d47c504b-1aa8-44fc-831b-d09739b59ea5@oss.qualcomm.com>
Date: Fri, 12 Jun 2026 22:49:32 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/5] arm64: dts: qcom: Introduce Shikra SoC base dtsi
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>, Ulf Hansson <ulfh@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-mmc@vger.kernel.org, monish.chunara@oss.qualcomm.com,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Monish Chunara <quic_mchunara@quicinc.com>,
        Rakesh Kota <rakesh.kota@oss.qualcomm.com>,
        Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>,
        Sneh Mankad <sneh.mankad@oss.qualcomm.com>,
        Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>,
        Xueyao An <xueyao.an@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20260611-shikra-dt-v5-0-103ed26a8529@oss.qualcomm.com>
 <20260611-shikra-dt-v5-2-103ed26a8529@oss.qualcomm.com>
 <zzveallrfaeaclkes4dvexcxacyyew6mjgar5ctmhevh6ld4c5@caxx3gdr6g6v>
Content-Language: en-US
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
In-Reply-To: <zzveallrfaeaclkes4dvexcxacyyew6mjgar5ctmhevh6ld4c5@caxx3gdr6g6v>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: QIoXYfbuQd42ByTpDpNWeeQSzsOq0MjP
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjEyMDE2MSBTYWx0ZWRfX6Z9j21fidjY1
 jZnjgh7t79+Nx6XqrYR8ydr2G4z92lMBmMctixd43Api8z0BkB6JmWWozWAEe+NhHKclWPz6oeA
 wp194j1+1dto2N5LZw+Q/1xdStBqwvk=
X-Proofpoint-ORIG-GUID: QIoXYfbuQd42ByTpDpNWeeQSzsOq0MjP
X-Authority-Analysis: v=2.4 cv=N94Z0W9B c=1 sm=1 tr=0 ts=6a2c3fb1 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=g0pf6In4uVe9puqoFIUS9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=ZCscK8iRdYwrpkwA4MQA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEyMDE2MSBTYWx0ZWRfX+Ec03/cNBOSZ
 R2DAcwsBcytikhYNmta5PwytwoJDIm+GhXuncR0N516F1GY/No41nB1dIeApMSymY47z+MoKTEY
 RUgKGGuurw/TkmEVQcnLPwK6uS8IYufGkKNwGM2aj50C5v4njDmiS5vONg/Pl9DTJeNnhZUuwhg
 AKK0qtCpYkM3IVYLwPZ4KkBk9e58KmVdDYkM9nfWOk9oTOP6E2RPHfReaHH+t8Bg8Zlwc2ChS51
 PqvJVDUW7XB604q7oiHo6qXEmrzzPusz/FApV6jV/yRHSRYn1zv+z2WvlBdPo//ZpUp1shGpZ03
 S/hvhWxUrTVt/GFWhxAV2hqw08GyJ6EoXJo0wwh22z6rVlf441qMFF/fMpIyIUvOsmQP/rq227+
 /Z2mbwCVgNwuaNH197V94e8A5PFDT/nHVqss7OlGZr6FSCn1uj0n7XZt0actod7X/oowYAgskxj
 OfoqjK6djfkP0ihzsmA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-12_02,2026-06-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0
 priorityscore=1501 adultscore=0 suspectscore=0 bulkscore=0 clxscore=1015
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606120161

On 6/12/2026 1:46 AM, Dmitry Baryshkov wrote:
> On Thu, Jun 11, 2026 at 03:40:09PM +0530, Komal Bajaj wrote:
>> Add initial device tree support for the Qualcomm Shikra SoC,
>> an IoT-focused platform built around a heterogeneous CPU cluster
>> (Cortex-A55 + Cortex-A78C) with RPM-based power and clock management.
>>
>> Enable support for the following peripherals:
>>    - CPU nodes
>>    - Global Clock Controller (GCC)
>>    - RPM-based clock controller (RPMCC) and power domains (RPMPD)
>>    - Interrupt controller
>>    - Top Level Mode Multiplexer (TLMM)
>>    - Debug UART
>>    - eMMC host controller
>>    - System timer and watchdog
>>
>> Co-developed-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
>> Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
>> Co-developed-by: Monish Chunara <quic_mchunara@quicinc.com>
>> Signed-off-by: Monish Chunara <quic_mchunara@quicinc.com>
>> Co-developed-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
>> Signed-off-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
>> Co-developed-by: Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>
>> Signed-off-by: Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>
>> Co-developed-by: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
>> Signed-off-by: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
>> Co-developed-by: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
>> Signed-off-by: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
>> Co-developed-by: Xueyao An <xueyao.an@oss.qualcomm.com>
>> Signed-off-by: Xueyao An <xueyao.an@oss.qualcomm.com>
>> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>> Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
>> ---
>>   arch/arm64/boot/dts/qcom/shikra.dtsi | 842 +++++++++++++++++++++++++++++++++++
>>   1 file changed, 842 insertions(+)
>>
>> +
>> +		rpm_msg_ram: sram@45f0000 {
>> +			compatible = "qcom,rpm-msg-ram", "mmio-sram";
>> +			reg = <0x0 0x045f0000 0x0 0x7000>;
>> +
>> +			#address-cells = <1>;
>> +			#size-cells = <1>;
>> +			ranges = <0 0x0 0x045f0000 0x7000>;
> 0x0

ACK

>
>> +
>> +			apss_mpm: sram@1b8 {
>> +				reg = <0x1b8 0x48>;
>> +			};
>> +		};
>> +
>> +		sram@4690000 {
>> +			compatible = "qcom,rpm-stats";
>> +			reg = <0x0 0x04690000 0x0 0x14000>;
>> +		};
>> +
>> +		sdhc_1: mmc@4744000 {
>> +			compatible = "qcom,shikra-sdhci", "qcom,sdhci-msm-v5";
>> +
>> +			reg = <0x0 0x04744000 0x0 0x1000>,
>> +			      <0x0 0x04745000 0x0 0x1000>;
>> +			reg-names = "hc",
>> +				    "cqhci";
>> +
>> +			iommus = <&apps_smmu 0xc0 0x0>;
>> +
>> +			interrupts = <GIC_SPI 348 IRQ_TYPE_LEVEL_HIGH 0>,
>> +				     <GIC_SPI 352 IRQ_TYPE_LEVEL_HIGH 0>;
>> +			interrupt-names = "hc_irq",
>> +					  "pwr_irq";
>> +
>> +			clocks = <&gcc GCC_SDCC1_AHB_CLK>,
>> +				 <&gcc GCC_SDCC1_APPS_CLK>,
>> +				 <&rpmcc RPM_SMD_XO_CLK_SRC>;
>> +			clock-names = "iface",
>> +				      "core",
>> +				      "xo";
>> +
>> +			interconnects = <&system_noc MASTER_SDCC_1 RPM_ALWAYS_TAG
>> +					&mc_virt SLAVE_EBI_CH0 RPM_ALWAYS_TAG>,
> Please align on '&'.

ACK

Thanks
Komal

>
>> +					<&mem_noc MASTER_AMPSS_M0 RPM_ACTIVE_TAG
>> +					&config_noc SLAVE_SDCC_1 RPM_ACTIVE_TAG>;
>> +			interconnect-names = "sdhc-ddr",
>> +					     "cpu-sdhc";
>> +

