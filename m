Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794988082;
	b=sbAO9+sPHuDTeRTSfwoPhw4ZupkLn0RRGK1xr3gwMNgIGMGAI6BnA/lzxvq9Lm09uXcb
	 7GBA/jAnpPUceDtDUMIhK/fYLbhONFpL/bLAynJuqY22oEAyta5aMC+R/B0JfBGJF2Ynk
	 RmfP+NASEy3XYd8nrcp2wpBj9JWivq3EQIMn98BAfD7J3fKtKT7EOdk1ypunMIpMQS/L9
	 TajPZ8b6uzPZ3qUiy9q3Wx0uWB5ftsdIYtSBOhKZgGsN7Lqk7IgYoNRVJnT4HgW7LCiAc
	 IhNq2tr0heJO3aPAYZWo+XQdhAopOIh8gBK7MV51X5sij+z4oecYG7q8VRkG/7DRDUQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794988082;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=cvc+bBzzP+Ja0Kt8fwKbYhV41RIku4RbGFRhXc5aZdU=;
	b=gqwO0wj4kARHPc47QwXUrZUvuAM0sCxWygj7XzM2h1EflqJe3uOSnB3DIgVh0DqUqTsT
	 RHnL5YgLQ9EU/cYHsXNswnZLGfhABEXYw6xvSw5WNt8pghoKY5wnYiItVCFIOwcnOMPge
	 8uOsJ2DnsIHx4mv3BadYB2M0JfvzrIqrBCy5hNZCYVvHEMl0rx6Nd15OQ3DYwa69m7Ic6
	 aQUt4ZxRGF6SlUEOM4mzeKuUcUN1xLU/ZupNrlqBx6vYage1TtQCBZULCZUT8GWCDCiTX
	 oi8yuEciF8RmpiwBMaHSZGcH4quq+Oo1aEz/67Iag3SPhdxO1jP4q3yFu6qRKMXaBMw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=EMoIJ04z;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=d3fkUXF+;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E943606A31C
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 07:48:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8E943606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=EMoIJ04z;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=d3fkUXF+
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI2Vwkb4059979
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 07:48:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cvc+bBzzP+Ja0Kt8fwKbYhV41RIku4RbGFRhXc5aZdU=; b=EMoIJ04zMJ+x4Dur
	nu7Q/vwSXSXeJKheGCEBsks/aA+GpUdVImCiuZVi3wxG20q/5ZOYDrXXAFjeDjXR
	OoA1G7ECZE7RToacBh8icG5ybTSecc1YpHmDMRW/Sceh06Jw4Cb5s5ovCS6VKwpo
	/Z0H28YESEnq4OXfEEkf1HBqRLMERmxCyLgPAfFnEVsQYaXDXIVl8aTygtFZbBCU
	7v5rmYjDRDv7rig8zWVNNfTiM+/ACeyKV4VcD4aTKH+DvQXr7TLzopF3p+X9omlm
	ddy2HNrMeTrVtMD+O/2cvkdOt2AJNzYCky+/b0WNfmBvKIbrYEOUWvIOzfN0Wqsd
	uVIFKw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yvchwmr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 07:48:00 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2e9995cea88so5761335ad.0
        for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 23:47:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794988079; x=1795592879; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cvc+bBzzP+Ja0Kt8fwKbYhV41RIku4RbGFRhXc5aZdU=;
        b=d3fkUXF+ZLAxxSNtVEgZj2anaoSBLWKE/Yu9dhup7B3r8S6Uu5KqqsiHIb2jjsVQbt
         rQfj020+Bry+R3F8dL6SSxlh3BOaANETfUqHMsREsCfAydWXtBz24XDjGWksFbKjTf/B
         7UYYvu0EHnPvUhuTRHXAhPj8+bVZj4qVlzycuMOpMCNlYqRFJuKc7aXqcfA1uc+gvT/w
         UywYk4N75Qx71eDl+C+rBEHuuzv9PEpt2O6s3vW5q736lCbEDfhc58qN2wzGBableaq9
         2ZR6zVS9fIGGGkdipozViZNp+2HSyaEBDDf95Dl1fJ6+BNG/R3sSs3slsYjV7J9YXSRZ
         JD5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794988079; x=1795592879;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cvc+bBzzP+Ja0Kt8fwKbYhV41RIku4RbGFRhXc5aZdU=;
        b=E75NBie0z2O+1Rnge8NBFHItSR81mG+FUB+mE/ezFmgGvOM+K3oQWOLVSAi8SPzD5L
         NebrX8g1nWQsf4Y917Z+Ejrr2Eh9B4VNLPLPovYqsllqobx/g70RPi4iFL8FZHEEfIxc
         g4m4msp1G/Upf3leNQMNSNWcYmTLMKoyHSSAEyFXRdv1cnKxpNbrKHeYVS+EqYyr0y1O
         9y+tMDNJgOVmwptgXhJm+1yH4g0rfLne1A2FJyavmzGfwLMn42K2ubxSSra+mGFsbOI4
         qShm+MuMP0S2kyOXzczh+gYCtYuxrEoI75O2dzKRCNz0ImXdEUHWIMYoA/QXE3/oFqRC
         jHbg==
X-Gm-Message-State: APuU4Z/e9rpNfwAE7e9hp671gkOcLfpKc5A/mriUG7cx7NJdV7jQlFJE
	FJvBpW3AoK7Ay4J/sFBtDV3IGC0kyvcGSKcRw7Yrm0BAFLTa1bTx0fQOYUsqXmkxLbuX/L0jt7x
	EXnCeugRN+4YWmxnv0/jxCQAf0bo2VMUJYZXWQ9MmU4nqE0JTjeTAhoaILsQVS2dT
X-Gm-Gg: AZFdTZcrzaHS92+qfjTrMQifTrQ2wL4YYSlozmbeuzDvHZZVPlNIvxIox+WisQvjeG7
	ZOzjsg7YcsVwQRFcv6X5kh9aCHbGiHqcenCqmPy/2GYtyk3875vRF0HcZepap78yq3V5htVqwkI
	iZMscV5wYGG9rGhVZFfItdIYEDMh9YYxnIuQCgZJZtZrvgZlp4wkz7m4uxqZqZhn5CTs2nWEbWK
	djTJKtz2vTeOb2CV5mVPyeCjMd6dmeuOqg5ke2grav+aJQnrgysyjPrsCmIP/rkqXqdDxJd3jNb
	DMIWJdhtcOBHtf36i8dkdB1pAcxq3+Orvg6K4RCKyUZEl6XR8gvRWQfGMmKl/13vSOHt4D3tA98
	EeWRJJUxRdxrcmX+AdK6t0l80Rf/WFSdcEa9e46RAubkjZilc9DPx5mbsDaages8RER5YGcPB1i
	8nUYYtZrdHs7XQWs9f/f6FZWsuoant
X-Received: by 2002:a17:903:41d0:b0:2ef:f51c:7b09 with SMTP id d9443c01a7336-2eff740853dmr17435635ad.28.1794988079016;
        Tue, 17 Nov 2026 23:47:59 -0800 (PST)
X-Received: by 2002:a17:903:41d0:b0:2ef:f51c:7b09 with SMTP id d9443c01a7336-2eff740853dmr17435445ad.28.1794988078527;
        Tue, 17 Nov 2026 23:47:58 -0800 (PST)
Received: from [10.133.33.36] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eff611630asm8883545ad.17.2026.11.17.23.47.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Nov 2026 23:47:58 -0800 (PST)
Message-ID: <d5a60d18-b467-49e1-8c1a-809803c4ca66@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 15:47:54 +0800
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] arm64: dts: qcom: maili-mtp: Add WCN7850 WLAN support
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
References: <20261118-wlan-bt-v1-0-18bb1b059a17@oss.qualcomm.com>
 <20261118-wlan-bt-v1-1-18bb1b059a17@oss.qualcomm.com>
 <sashiko-outbox-220055@kernel.org>
Content-Language: en-US
From: Yijie Yang <yijie.yang@oss.qualcomm.com>
In-Reply-To: <sashiko-outbox-220055@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=R5OWitRX c=1 sm=1 tr=0 ts=6afd5830 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=lllB74_2-GDN1I7oraoA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: Y5YxB6zTJqJExrnpLL0Tcmo3jb7_BEgW
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAzMCBTYWx0ZWRfX1zw2FUxH3NUX
 vLXKrbqfIPlENiWtpMOJLQfRXGKpgAH71CHqEktL85VJABTAWPsCdQtXvQGYsmCdnv/PqUhkskl
 b2Rq44qtXwLSWQ2LRi3GFhgDETrJpMA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAzMCBTYWx0ZWRfX+pY4Giqjs4rn
 GtdQcSFwjUIjPV44vJQSWW/B/6tnvLFsHVEOQlxq9mhFyaE5d3MxYtHr3l7I1D1fhxPNByEpdJP
 yayHcL3ppUeN3qHbVn8MTciHxl3QkNRN+tuQreAGX2hED57sU5oziVbOu/oZcQriVDDKszmEt7x
 l3rsxQUeAK77aUx8oVAeHOTS0iWdMPZHloVhJxsXCc764LT8ymWGdJd9Yjeb+by55tSiH2mXeYE
 EKMBGpHwlWLaM4q/U8n8OFUNH/tBZES2eKXxJBR2Z5HzpcVsdatAXZkBcbbvvPE3c0AvUZek3Vq
 WdQPUIVPU+dLxM24HPJa9vUS4e4tDxapQ1v0trxwF5oydN+Ezd2Qz59Vh8CtUMWif5du6nixygd
 jklfBTxxoyMieJDapgCJTsjD/+FX2YN6a6IfmTGmcZVoCOGQu6153o1kMiSa3gLqC/jpFgFkQxE
 +n3KdK7kWPIgxPrkk3Q==
X-Proofpoint-ORIG-GUID: Y5YxB6zTJqJExrnpLL0Tcmo3jb7_BEgW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0
 malwarescore=0 priorityscore=1501 bulkscore=0 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180030



On 11/18/2026 11:53 AM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue to consider:
> - [High] arm64: dts: qcom: maili-mtp: wrong vddrfa supplies in
>    wcn7850-pmu
> --
> 
> commit 0117df6375848f6603dc465badcac7a530d4ecbc
> Author: Yijie Yang <yijie.yang@oss.qualcomm.com>
> 
> arm64: dts: qcom: maili-mtp: Add WCN7850 WLAN support
> 
> This commit adds the WCN7850 PMU node, PCIe Wi-Fi node, and associated
> pinctrl configuration to enable WLAN on the Maili MTP board.
> 
>> diff --git a/arch/arm64/boot/dts/qcom/maili-mtp.dts b/arch/arm64/boot/dts/qcom/maili-mtp.dts
>> index 5409d0a7ec2e0..a3c2016eb9053 100644
>> --- a/arch/arm64/boot/dts/qcom/maili-mtp.dts
>> +++ b/arch/arm64/boot/dts/qcom/maili-mtp.dts
>> @@ -142,6 +142,63 @@ sdcard_vdd_3p0: sdcard-vdd-3p0 {
>>   
>>   		vin-supply = <&vreg_bob1>;
>>   	};
>> +
>> +	wcn7850-pmu {
>> +		compatible = "qcom,wcn7850-pmu";
>> +
>> +		pinctrl-0 = <&wlan_en>, <&sw_ctrl_default>;
>> +		pinctrl-names = "default";
>> +
>> +		wlan-enable-gpios = <&pmh0104_c_e0_gpios 7 GPIO_ACTIVE_HIGH>;
>> +
>> +		vdd-supply = <&vreg_s1j_0p8>;
>> +		vddio-supply = <&vreg_l2d_1p8>;
>> +		vddio1p2-supply = <&vreg_l4g_1p2>;
>> +		vddaon-supply = <&vreg_s9d_1p0>;
>> +		vdddig-supply = <&vreg_s3c_1p2>;
>> +		vddrfa1p2-supply = <&vreg_s9d_1p0>;
>> +		vddrfa1p8-supply = <&vreg_s7g_1p2>;
> 
> [Severity: High]
> Are vddrfa1p2-supply and vddrfa1p8-supply shifted off by one rail here?
> 
> vddrfa1p2-supply is wired to the 1.0V vreg_s9d_1p0 rail (duplicating
> vddaon-supply) instead of the 1.2V vreg_s7g_1p2 rail, while vddrfa1p8-supply
> is wired to the 1.2V vreg_s7g_1p2 rail instead of the 1.8V vreg_s4c_1p8 rail
> defined on pmh0104_c_e0:
> 
> arch/arm64/boot/dts/qcom/maili-mtp.dts:
> 		vreg_s4c_1p8: smps4 {
> 			regulator-name = "vreg_s4c_1p8";
> 			regulator-min-microvolt = <1808000>;
> 			regulator-max-microvolt = <2040000>;
> 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> 		};
> 
> Because pwrseq_qcom_wcn_vregs_enable() only calls regulator_bulk_enable()
> without setting voltages, the mismatch is not caught at probe time; instead,
> vreg_s4c_1p8 is never enabled when powering on WCN7850 and can be disabled
> as an unused rail by regulator_late_cleanup(), breaking WCN7850 bring-up.
> 
The supply names vddrfa1p2-supply and vddrfa1p8-supply are fixed by the 
DT binding and only reflect the nominal voltages. They don't describe 
the actual rail. Which regulator feeds each input, and the voltage the 
PMU needs, can differ across WCN7850 variants and board designs.

On Maili MTP, the mapping follows the board schematic: VDD_RFA_1P2 is 
supplied by vreg_s9d_1p0 and VDD_RFA_1P8 by vreg_s7g_1p2. This is 
intentional, and vreg_s4c_1p8 does not feed WCN7850 on this board.

-- 
Best Regards,
Yijie

