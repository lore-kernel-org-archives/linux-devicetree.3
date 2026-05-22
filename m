Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0C253C3457
	for <devicetree@vger.kernel.org>; Fri, 22 May 2026 13:33:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779456808; cv=none; b=FzFsPtJ1H0oBzyntHXzUG4alyQwwYL3HERR+0HaMGUkM4pJsz52KMOcEiP1nOXtdHofIOkK72+k3By7MNjWFyZ7DiBMAjKBbKmVaLvq5uNB5oiFrPWFPOgUIdK2GRhquSTjTAd4VkRHfkitraGOzAfhCY6KUxz1T1HxpUjNeT9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779456808; c=relaxed/simple;
	bh=O+YSnJNtLxOvpkIQg+8Dz1Kk+iYNQvDSYab4ZWAxsGU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TmLjKajWTjPL6CI1yAM7WSVx8zq3AQNUCNQSUxNijY2b4+rRk3eQKo6C93vziWmH2URRzpmJHAVFdVoYH8rMXdPUS2JfdzWdh6d9ZmAgABOm7iM7seG6XhyK9n/LLVAYR7crM3ObBiWB0XJdMLjeJ9KeKz0YTeaVREiH22BnsaQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WVsj6q3b; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TmHBNgVN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WVsj6q3b";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TmHBNgVN"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64MAIiK81800728
	for <devicetree@vger.kernel.org>; Fri, 22 May 2026 13:33:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7AQ+7Ja/GHakdcs1Bu7eELxDh+aauHM8hieyf0f30X8=; b=WVsj6q3b+Q6Zrfr4
	Hn4WyzT58zbJeZ0suPCYh4TSxDdrjA/5brpoxMzY/sKLxZe7tLgzrTq1ryTNetME
	3dz6GInNF43OiV9j4mtVpcfFYtIuDELIZaJm+57Wuc8XK7EkIgZQnqtNpYfgXt8b
	TchwXbR05NtbVSD1Sy6zL7OHEl7C0PwuDlQqpMoqGKqXBADxmARUHymkB8RMa/gK
	XAXWdnX/vnR1kBSvpIdQwy8m8T98jsPDhsBE/SSRjxOVJtfOVjlq2J8ei+hXHwaR
	EvW8FhPhxlYbPRs7+u4LvJrQ/5wHulOO3GivZpHeHiYXZFeAuW/S6w89Dxz7N8xn
	813TaA==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ean9g0mvn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 22 May 2026 13:33:24 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-83544d05c5aso3614495b3a.2
        for <devicetree@vger.kernel.org>; Fri, 22 May 2026 06:33:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779456804; x=1780061604; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7AQ+7Ja/GHakdcs1Bu7eELxDh+aauHM8hieyf0f30X8=;
        b=TmHBNgVNjnyzBjPasAsMvJx4Uje5SHqJW/oVSk1fpK31wktovINFI/ClxrR+Ml9dSe
         g2B71x1prrLdDVqYkllMUfmJFKdTDc66viJHycXlpy74nnx+gj45B9OHG/PDhVRbufno
         IG9jj4T/bGT3y1XGo9Iozxrj7rUBwv6ZfOt58qZrXVZOqEFmZPjTdJiLvlXc2C7O+V1P
         KSP5C9C9fY1/UcrB46y6w2bQswLuveKgXg8uQq6/+SnaXPvLrVrNDb1gTSx9w0IWe14q
         j+1UeBKV1J1ZIwSxkDvGwqh0hb3g6+inBJA4Gy/VtcA8dDPzWrJFiBVDCz76+0oL51OZ
         5/xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779456804; x=1780061604;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7AQ+7Ja/GHakdcs1Bu7eELxDh+aauHM8hieyf0f30X8=;
        b=R6qrrshhLSZ6/6mj+z/duKYkDrq4RPNxVijR4i4vwahB512OBCpdc2itXSwqQkK8S+
         o4Oc8kFwHkHcamB2aGriiS57mV6G2utd6OBy78VEFbFAgNYR8eJ5C26NMXL4Z6YEVMRn
         bHlHMeu7r5yBkkheRTMV3zp+vdp/uKCAeJ9c0N8BkG09sAuEESIQCXeE9lgziwAbsyp6
         siGEUukAkfAp/vL6m9q0R/XGBcbgJD3ZqVpW6JmS6aV23gSRajG7KYQT0Cuj2iJ4jMDt
         fKIy0KfeFIFjiLjlwSvPzw1g5XVoPZy0U6BXCUnZKa8iZ3nKWKdPZ15Yxr5i+EJO/WsH
         zv6w==
X-Forwarded-Encrypted: i=1; AFNElJ+rYYi25+oT+5+Tn0qwwtY5TaSi2JSlcxVuD5twAdwKGEZoThjgubBA9IEcXMsA/0T5FrFGuYWGfPw7@vger.kernel.org
X-Gm-Message-State: AOJu0YzNZ1Z8uZ9mA0BSE6jjTdfqSM1miq4HZEyfBr1WaBVVj/INSit8
	KRjori9ijIhxukos327crateTj0z0jzISG2N8g8ZdhDVm2EQ0aMRU/uUx8zfEbd7zs9/Cz6WmbJ
	OwmbvzOiMWGIJJVeIjMOrwm8yEooZajrdAOfuuUJM3SUFZXQCiBfLP6qeD/HtB6sK
X-Gm-Gg: Acq92OFXO0bALpqxNCGzQSJKTrqtaxtEl8KZMLPLfBA/W0qsWXFczPMBMkG5PZ5NF5W
	rNrxPn+Jk3eC+AyWkk31tWwAY22DDCp4WS+p38CxqG6w8M8moV4TuFgeqvib3CggUbjejcYd6a6
	D7Y1aVeIPIivGEdTPqASeGWOca1kF3w/aWq1EiP/vmb9XRArIqcMmT3/Qhdtjl9xFfVb7YyNbVC
	L05AbnGEk9n0LJIyDu+UxlOt4EJ9bXz7bd4XLeyOXL8qSTHNFaVtrkpq3mblX1MiY1OM0GVSwjn
	Y43G3g1fRs1LCFE42Kyyorge5ctpjy/Zg/eBXD35RM47acdIG0V/fo1EOdNEF3rp2zTrW0i5/wr
	Y88BxA5CCeII0fIgB3cVHswYcTOhrnrWYHwdj7Ad5X01Q4fvdh5dvz8AzTB8=
X-Received: by 2002:a05:6a00:10c9:b0:82f:70a7:4a25 with SMTP id d2e1a72fcca58-8415f3640d3mr3788992b3a.35.1779456804148;
        Fri, 22 May 2026 06:33:24 -0700 (PDT)
X-Received: by 2002:a05:6a00:10c9:b0:82f:70a7:4a25 with SMTP id d2e1a72fcca58-8415f3640d3mr3788947b3a.35.1779456803587;
        Fri, 22 May 2026 06:33:23 -0700 (PDT)
Received: from [10.219.57.29] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84164e9e7cdsm2198292b3a.34.2026.05.22.06.33.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 May 2026 06:33:23 -0700 (PDT)
Message-ID: <af80ccf3-b26b-48f7-ba94-0830c0730a94@oss.qualcomm.com>
Date: Fri, 22 May 2026 19:03:19 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/5] arm64: dts: qcom: Introduce Shikra SoC base dtsi
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, devicetree@vger.kernel.org, vkoul@kernel.org,
        linux-phy@lists.infradead.org, olteanv@gmail.com, conor+dt@kernel.org,
        neil.armstrong@linaro.org
References: <20260519-shikra-dt-v2-2-c01b90fb4395@oss.qualcomm.com>
 <20260519114737.70CD0C2BCB3@smtp.kernel.org>
Content-Language: en-US
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
In-Reply-To: <20260519114737.70CD0C2BCB3@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: jjAk_gYBfMzEhlBZB1FACh0thN5DmU25
X-Authority-Analysis: v=2.4 cv=B/qJFutM c=1 sm=1 tr=0 ts=6a105b24 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=RLylhfQl9M-TdwYxiz0A:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-ORIG-GUID: jjAk_gYBfMzEhlBZB1FACh0thN5DmU25
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIyMDEzNSBTYWx0ZWRfX7mV2h4/FLLiy
 gHhYa+So/nhMPfQqmYaO5IpHv92A5IQihHoegRTqUUhcBASvRs+j3R1QvhoK6PwTYJnT4KOE8kt
 NqtDnmm97PPW/FKAYeQNDLYEJ9BA+KJcdbwP071RlBmkqrfs7ou+1Mts2ctgnXiUqrnaxRLbanO
 1ASAZmZX2TgH+peKhPb0GBlonKnJd2vA5iahUD0+Ut6MDyq6MvbpWRZ6ENb0A5h8FNs6JNgkrX3
 Ddkkn/oeLZmAty+zCOo+9+PPp7WeePtgVkT15JX5voKlUhKvYtP0yEEWBNlkmxYGmJPU8VBPxCK
 wZkYSQ/Id1gn8KX/4Sc1SLBq3de109AlXTixw6RK2O//RgNT85/gpy9yiLyEuqS8S+oCkgnjM33
 qn+iA77pzI0kIVI2W1U7k7FK3JCsraYd1QTC1CTKM3S14muUSstCjzBiRaCnA0yYc9iJXW/DXyI
 P5WjOh8tPnrYdKO+ecg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-22_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 clxscore=1015 malwarescore=0 lowpriorityscore=0
 suspectscore=0 adultscore=0 priorityscore=1501 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605220135

On 5/19/2026 5:17 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 5 potential issue(s) to consider:
> - [Critical] Incorrect PPI numbers are specified for the ARM architected timers and GIC maintenance interrupts.
> - [High] The base memory node specifies an incorrect start address, obscuring 512MB of DDR system RAM and breaking reservations.
> - [Medium] The `sdhc_1` node incorrectly references a power domain specific to a different SoC.
> - [Medium] The logical `cpu-map` splits CPUs into two clusters, contradicting physical MPIDR topology and shared cache.
> - [Medium] The `usb_1` node is missing MPM-routed interrupts for USB 2.0 wake from deep sleep.
> --
>
> commit 32b9841bdefaa72fe3d5267070711875edaaafa0
> Author: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
>
> arm64: dts: qcom: Introduce Shikra SoC base dtsi
>
> Add initial device tree support for the Qualcomm Shikra SoC, an
> IoT-focused platform built around a heterogeneous CPU cluster
> (Cortex-A55 + Cortex-A78C) with RPM-based power and clock management.
>
>> diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
>> new file mode 100644
>> index 0000000000000..31d0126e5b3ee
>> --- /dev/null
>> +++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
>> @@ -0,0 +1,981 @@
> [ ... ]
>
>> +		cpu-map {
>> +			cluster0 {
>> +				core0 {
>> +					cpu = <&cpu0>;
>> +				};
>> +
>> +				core1 {
>> +					cpu = <&cpu1>;
>> +				};
>> +
>> +				core2 {
>> +					cpu = <&cpu2>;
>> +				};
>> +			};
>> +
>> +			cluster1 {
>> +				core0 {
>> +					cpu = <&cpu3>;
>> +				};
>> +			};
>> +		};
> Is this logical topology misaligned with the physical MPIDR topology?
>
> The CPU reg values (0x0, 0x100, 0x200, 0x300) have their Aff2 bits set to 0,
> meaning they physically reside in the same cluster. The A55 cores and A78C
> core also share the same L3 cache.
>
> Does splitting cpu0-cpu2 into cluster0 and cpu3 into cluster1 violate
> DynamIQ specifications and confuse the scheduler's task migration and
> domains?
>
> [ ... ]

The hardware MPIDR for cpu3 is 0x300 (Aff2=0), confirmed by PSCI boot 
failure when reg was changed to 0x10000.
The cpu-map two-cluster split is intentional and correct for EAS 
scheduler topology (separate performance domains for A55 silver and A78C 
gold), even though all four cores share Aff2=0 in the same DSU.

>
>> +	memory@a0000000 {
>> +		device_type = "memory";
>> +		/* We expect the bootloader to fill in the size */
>> +		reg = <0x0 0xa0000000 0x0 0x0>;
>> +	};
> Is this base address correct?
>
> The reserved-memory list allocates memory regions well below this address,
> such as hyp@80000000 and smem@86000000.
>
> Does starting the system RAM at 0xa0000000 cause the kernel to disregard the
> 0x80000000-0x9fffffff region, effectively losing 512MB of RAM and
> potentially causing the reservations to fail?

Will fix by updating base address to memory@80000000.

>
> [ ... ]
>
>> +		sdhc_1: mmc@4744000 {
>> +			compatible = "qcom,shikra-sdhci", "qcom,sdhci-msm-v5";
>> +
>> +			reg = <0x0 0x04744000 0x0 0x1000>,
> [ ... ]
>
>> +			interconnects = <&system_noc MASTER_SDCC_1 RPM_ALWAYS_TAG
>> +					&mc_virt SLAVE_EBI_CH0 RPM_ALWAYS_TAG>,
>> +					<&mem_noc MASTER_AMPSS_M0 RPM_ACTIVE_TAG
>> +					&config_noc SLAVE_SDCC_1 RPM_ACTIVE_TAG>;
>> +			interconnect-names = "sdhc-ddr",
>> +					     "cpu-sdhc";
>> +
>> +			power-domains = <&rpmpd QCM2290_VDDCX>;
> Is this a copy-paste error?
>
> The gcc node correctly uses the generic or Shikra-specific RPMPD_VDDCX.
>
> Could referencing a QCM2290-specific power domain macro here result in the
> hardware attempting to scale the wrong voltage domain or cause an
> out-of-bounds array access in the driver?

Yes, that's a copy-paste error. Will fix it in the next version.

[ ... ]

> [ ... ]
>
>> +		intc: interrupt-controller@f200000 {
>> +			compatible = "arm,gic-v3";
>> +			reg = <0x0 0xf200000 0x0 0x10000>,
>> +			      <0x0 0xf240000 0x0 0x80000>;
>> +
>> +			interrupts = <GIC_PPI 8 IRQ_TYPE_LEVEL_HIGH 0>;
> Is this the correct PPI for the GIC maintenance interrupt?
>
> The architecturally mandated GIC maintenance interrupt is PPI 9, rather than
> PPI 8.

Will fix by changing GIC_PPI 8 to GIC_PPI 9 in the next version.

Thanks
Komal

>
> [ ... ]
>
>> +	timer {
>> +		compatible = "arm,armv8-timer";
>> +
>> +		interrupts = <GIC_PPI 1 IRQ_TYPE_LEVEL_LOW 0>,
>> +			     <GIC_PPI 2 IRQ_TYPE_LEVEL_LOW 0>,
>> +			     <GIC_PPI 3 IRQ_TYPE_LEVEL_LOW 0>,
>> +			     <GIC_PPI 0 IRQ_TYPE_LEVEL_LOW 0>;
>> +	};
>> +};
> Are these PPI numbers correct for the ARM architected timers?
>
> The architecturally hardwired ARM core timer PPIs are 13 (Secure),
> 14 (Non-Secure), 11 (Virtual), and 10 (Hypervisor).
>
> Could specifying these incorrect numbers prevent the kernel from receiving
> timer ticks and cause the system to hang during boot?
>

