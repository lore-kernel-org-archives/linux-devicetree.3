Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2890F38228B
	for <devicetree@vger.kernel.org>; Mon, 25 May 2026 13:16:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779715006; cv=none; b=P86KTcfiEV63955fhFAypZXu6x/CJVLrMx7VxkYaJHcrJ72Pz/vP6TBcXiZIBrI9QcxXftn3j2Zk3+BYI93kQiAqN6hW9SRiBNq4vuI8VgRpqg6lg5jCYD0hPg82a/6EOLJ+viX5Xs31wHAobh6Mmo7j7O01mIP6mVWmh+yHasM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779715006; c=relaxed/simple;
	bh=S852ehqBfb0/5Ul5U+y7lcBRcWUwtf9wkT0ZuTEZgNI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kYM+KSXdCyps+Fgrrxjf8yeRU73pxpfVT1etZiyf5YfxSgCtgajZk6OLRpmd6I11H/PlxvGeN5Boyy2qwGfb0Tf7gJlgo4jdijf4fFOZqDCYoUei/7ToznhUuK3Ud4dGcoMZL86m86wCjyvAroLJoTmkZNa7gLYMdYirS94dwHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pGUebKqh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Q49zbmVj; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pGUebKqh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Q49zbmVj"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64PBPgVT3263677
	for <devicetree@vger.kernel.org>; Mon, 25 May 2026 13:16:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	u97YqLbcmLlh10lDQSuWmKtQsqDRCwVMztT7iDYcshA=; b=pGUebKqhpMtm76GN
	PkCzhsWW3B2/l2VJDFTjuneFWyarLhRaSyY8PP8GOiFzGcR8v7mn4M6SbCBDo6sX
	vvFrQ425kV/00V/BOLOLaZbqeObzbbm/xImzFRc+mECF1ygDNcvMh6Tpta2KLxsi
	BpWTVMQDHTJpDpmUSLvCJ3+InbnTMy9kWHP7ByoU3lkFFo0oWpik7kPmneIkIZnh
	xQrcpO+eysQcryLvMjnvKw46BEQ2MHiJcVy11s17VksXFOUKONQC/adETAtVKhpW
	p2opz1ulAE5ley0WGUObrVekuyuEYJA42q6doNi0TfAENVzwxAGLSNM3L35WZjq2
	oOY+mg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ecnhs0bbt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 25 May 2026 13:16:43 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-914afae89a3so62076385a.1
        for <devicetree@vger.kernel.org>; Mon, 25 May 2026 06:16:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779715002; x=1780319802; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=u97YqLbcmLlh10lDQSuWmKtQsqDRCwVMztT7iDYcshA=;
        b=Q49zbmVjjxplv6t6Yfm55bJgRLAeAzsCJqqb/MFQ8YJD0JFA5RzpdQDX169r4L0DUi
         lMTjAeWznlCyYZFqQicN4gPb2jUHPkDgAsw4j41Sqp7ll6GyXmPyAb3wqh0INWPnHvp3
         By5Dm8RjjTPhNb/5TUTWkk+FTHaA4r1aFTd/I7WmnSVWPm/Dqgy89+u+TPM4NL+z4kTV
         3k5vMO/+NkEahHpnt8ZxKyIbFncgyYSggXc5q4olr/iaZvWrB6SZt09qEF01a2cWd7XB
         hG5YOfFT0MQGdxJnlrJuXbQ6fJZE/zIJ+VjzzISrhZMuPfwFaCGW5iF2STxnFqw6MGe8
         5d2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779715002; x=1780319802;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=u97YqLbcmLlh10lDQSuWmKtQsqDRCwVMztT7iDYcshA=;
        b=fNVSRXUimQ50ONl08fBFWcgh19HmzMq83oZVhwCrXoznANzWjBc/qTOBEwsCy19DQi
         UEjDKcM7iOKAY9C240fWajdGhwYbNw05bYO/kemnp4yMYRBSEVR+ydgV5ZvqYjDLyMaH
         CawZ5LuZH1QG/SiqxUozRv25qXoor1qiygqy5oGAPnHlC86wYH2I2SPDgzixHtskxXpY
         wdbyewrSb4I3WM1/UCxEi2O+ZfUuFx0rUkFyamjZTDy5cHuU7NVz/2mcNbH6GJTW1Pw4
         2llNhus35oFa3D+jN9ESbn7pZqJuB1YHRJosBM/eDSpK3xl3vahBuJl6MT+lU8Rkq4k7
         35vw==
X-Forwarded-Encrypted: i=1; AFNElJ88LAEWBafcOZfIccJ8rKD8eHn4107vdZkbIxx5JngS5/e2oV3Sz59tnP1z+mrkLSyz7Hh5aZpUfSSK@vger.kernel.org
X-Gm-Message-State: AOJu0YxiQcJ245sxx12MpR8CWDzlISDn123vV4TD4vnju0/B/1CYMdDJ
	F0ivIOtf+Vvo5op0Zz5v1KJUmjcbgt1/c70ogNB4fDAZVn7WTheVLaIixSCqz53QdM1fL+GCU1K
	MbleVMSdAOPGSV/xEAAbFoFnFYAky2U91kfFV8yk5LlIBqi9UA6Q9B3FFwvVuIHXb
X-Gm-Gg: Acq92OFSuQCIPeS5s448l/CxX/lM1TiaPbTLS1d1fFEr6zzN0OVZF7KhzzA9cR0Bt9B
	kIR0J8k1mQnvgRh2qN9MYEIjJrTFGpR5t/7QGyS6xxziJiBhQ58HoM1II5fRiPColJjX48jbjkL
	21S2L0h3D3j2mEkAeCmNMKH2WBOCAZvZPkWKeLa9Pu/XZIfyq2P/VQbGe2g4H/uKwiX1miOOAFB
	LnsrWCWjzDdmMsWKaHcGoFsT1fhyy6UMYG1fKaw0H/WpRYkyMTN6APQbyhQY1+PYU4NZtcbiECc
	+HS9TycPd0sK4l1LwpTJyrCvm3Xgm46UbGY7MmJit018Y00n5z4R467t++jfR6MH5YYUKekUN2X
	oLzMAjGJzH3AVK+C7C+1n4a3LFAzg2n5YiIblA6JvgRNUJQ==
X-Received: by 2002:a05:620a:2813:b0:908:a758:baae with SMTP id af79cd13be357-914b49fdfc3mr1377839985a.6.1779715002365;
        Mon, 25 May 2026 06:16:42 -0700 (PDT)
X-Received: by 2002:a05:620a:2813:b0:908:a758:baae with SMTP id af79cd13be357-914b49fdfc3mr1377837285a.6.1779715001935;
        Mon, 25 May 2026 06:16:41 -0700 (PDT)
Received: from [192.168.119.254] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-688b72cbbf3sm3903115a12.0.2026.05.25.06.16.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 May 2026 06:16:40 -0700 (PDT)
Message-ID: <63752557-6468-4aef-a847-06aa39ce108d@oss.qualcomm.com>
Date: Mon, 25 May 2026 15:16:37 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/5] arm64: dts: qcom: Add Shikra CQ2390M SoM platform
To: Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>, Ulf Hansson <ulfh@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-mmc@vger.kernel.org, monish.chunara@oss.qualcomm.com,
        Rakesh Kota <rakesh.kota@oss.qualcomm.com>
References: <20260522-shikra-dt-v3-0-80ffde8a3dc4@oss.qualcomm.com>
 <20260522-shikra-dt-v3-3-80ffde8a3dc4@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260522-shikra-dt-v3-3-80ffde8a3dc4@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Vd3H+lp9 c=1 sm=1 tr=0 ts=6a144bbb cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=I9A3L-BP1q0m1wO2EfQA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: eYI0kRg9cfyJjUFhEPAhA4RTve_sKz3f
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI1MDEzNyBTYWx0ZWRfXyAimORpfLSNY
 EN6SBGkL+pg+zcTj+Fosj5rEBR6GM4jdtClXJelLTolJ8r3HiWiujwWRxk0Pj4mkTShs8SNZf4g
 +ZW/jkXySAHjxVDIWdmrHY6rcvlsR+gZm27e4d5IDPmSzVT9HLE/UhnpcpRyU0cD5IO+hcxc6oR
 YGazO2UeuDG06EbPDeX1nimp/FQw616CDjfDnzvcana0HILcXexY03DflUhUoJBnOu1BlYBiYax
 kWc/UsISNUGpNooD1H+gfMMehfrp63qJw1RSD/BRrZTAoQ7+dkSrrMN3Y+25Y+2WwtV8vZYChy/
 CfWZYkTV07fXkqDogiupXiNDy+FcgF6Mdg3+jlUG3lTIFyKgIcmTivZICv1Dz3ehvNuCMVmcuTz
 ZUZ67NxH2IFarvhk6vRpWjHaGuNnec5WvQjOOjL1LSOjg/AAlmf1eHwU/E88H+GVtOg93wnswKU
 GPnF5/apOAQoGZ8v5qw==
X-Proofpoint-ORIG-GUID: eYI0kRg9cfyJjUFhEPAhA4RTve_sKz3f
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-25_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 malwarescore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 phishscore=0 adultscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605250137

On 5/22/26 8:02 PM, Komal Bajaj wrote:
> Add device tree include for the CQ2390M variant of the Shikra
> System-on-Module, a compact compute module integrating the Shikra SoC
> and PMIC for IoT applications, designed to mount on carrier boards.
> 
>   - shikra-cqm-som.dtsi: Retail SoM with modem (PM4125 and PM8005 PMIC)
> 
> The DTSI includes the common shikra.dtsi, adds PM4125 and PM8005 PMIC
> regulator definitions specific to this variant.
> 
> Co-developed-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
> Signed-off-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
> Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
> ---

[...]

> +/ {
> +	gpio-key {

This is usually 'gpio-keys', reglardless of the amount

> +		compatible = "gpio-keys";
> +		label = "gpio-keys";
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&vol_up_n>;

property-n
property-names

in this order, please

[...]

> +&pm4125_resin {
> +	linux,code = <KEY_VOLUMEDOWN>;
> +	status = "okay";

A \n before 'status' is customary

> +};
> +
> +&pm8005_regulators {
> +	status = "disabled";
> +};

?

(also double \n below)

Konrad
