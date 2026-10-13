Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 426EA3D8121
	for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 09:08:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791882531; cv=none; b=KULkaFSd+Fx/WlxP75qGOEiGTk+tsHdx8Y+lIDasd8oIar49K2n9ZW+S1+XF1KL2qkMSPJWqfNi2Em5SlWfjgHYdeaQ7TT7mNZ/oxdzgP/NkWRaGx/ko6dmktj2aeAbD0xpTFCxHaDfTKycCho2GENG+UuoSYiR4++RhRuk4+l8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791882531; c=relaxed/simple;
	bh=ZAyWoPFfctddUuPphDNAJoMEw4Bt+RcOIxpY2twczyg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fbIII7LkHSIJ+jBsBY90hLeDLvhRqg/HdFh2X9VlqWhXrvqiE5UMTh5W3C1+hv3EXSEjXKVAWUL1tUI6QRxy5yxqtbBpjsBCj1sIYvzAImnH9vuW7K6EPdTXFt/ypfSgpWnRBNAWs8niJeHQaFtHzA4/alacJVKrXf9W3bR5yjs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JHg/k9FQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Q2H3590F; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JHg/k9FQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Q2H3590F"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69D8xwoc790997
	for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 09:08:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Osl5MDk3OlUb+S44tTiya8LuoqHaUchW9RMiNgBRO4M=; b=JHg/k9FQQIxL6Zme
	V+B7tpU/dSampviXP3Opg6zIBx36OSrx+MAg/0p1StyQn/W/fspLPpxPxmwsc48p
	fwlqjaaRm2atIsx47QAvuty+lZur1dnYOczN6JY4qAu6RoVFzchuKjMWRkjy7JmD
	gdArz3Qh4zBpdN05SYsmhUUPTABl7z0Ju6VnFej9ugCwm7wHG9JbO3FML/vGvqjr
	D+CcrdHKkgLgw4NDWaG9tSl1P5Q6+b9iNnFFfmrwxvfxeXJjtkyyRtgBdk9cN1LQ
	ecRiAxDH3eYAgvWcqlZXDTcLJXk9V0tb1TX6APpTMraygQUxQuv9MYg9eO6aZ5e8
	Rvb4bg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9hmjr1bt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 09:08:49 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93cb1091fffso18976585a.3
        for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 02:08:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791882528; x=1792487328; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Osl5MDk3OlUb+S44tTiya8LuoqHaUchW9RMiNgBRO4M=;
        b=Q2H3590FnhpTNnGmJUEO91PaUEvjsSe/A1ztLt1m8s/4xrYLp2g7GPw8X6dOVTHImk
         Pus0jhrJe0F2KehwuQK0A+fh7P1eAIupeNUeewFLRFK8xm7XKW+Luy+5+AkmmtH6ZBTW
         IxQ7qD8ItNhmqkyE9kfDs063dRpBmraTa51OUTSXTgvbK8YDqC41P40gTrx2Ew+0tro3
         b82ukO4VrZbeEjw6SUrUto1SobFSA1YfpdNgxUsl37byAiZb6eUeJtL3kC+m9QCvNiMN
         IIIMjvCx7IpQb4HPqy5JYeSqNARk5GT0dNpVZ8P3xfSyPiWg1XZXuC5CGXtE2HDiZblC
         sK8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791882528; x=1792487328;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Osl5MDk3OlUb+S44tTiya8LuoqHaUchW9RMiNgBRO4M=;
        b=nauyy/z8oHPsxvxylOJLH6C3TK9YtHfwLh9vJfm0lB+AXNwZG7Ch0dKu97MPwyKhSK
         EZjfqN8ZcMAXqtNlmqUY0Ps9dxl+JKU9XSrLPO8o6zPFJjD8KFMlDpXO+M0CBIWZARSB
         J9ArHkCLiLM4dFILDdjIS5o2pPy3E+5GItXYxnjSMYCTvPWGHOUVUA6sep9rKmG7G6Pr
         0k3rCUSu0De7WOQY4wU/F8YkcJSG1gphYHwEAXErRJHp03DW7kTwY6IqgCI3LsHb4eXH
         u4z6QA+3DXSkkl0iih+RcjQfIGdKiesWrtDZrb8zulGA5p0rW39cbX3imLOZqvOtfI4H
         8ggQ==
X-Gm-Message-State: AFq9FYKbfeG+qCbFlH8CvznpmZqCRTTyMoO72vvlnyQGYcWSUILfRkPV
	Axo4CEXNC41AL8pDgoCxfBW2BvivIU4/X9caeQ3ez4b0+Sz2Is3Ww3ErsH3t9QlqLajN7HYIVd7
	Zio2G+6t9vu++5rozH95L9Mf0T9P/Z8NL5OMKWSs21rHU1kzCilMOsSdaKbAyAXgE
X-Gm-Gg: AYBFou2W132lTaiPVmX4nR+TZOZqzd3Cj7lFk01QBRVpumYF4ehW7FSE8eumw4lhMQf
	wCb13ZJF32Wp155BdO6Yb7F58mgObE0FsgMYKoqYBjbu8mQdBKjXjsVehaykqAxEZGukHCdzpd8
	hrHLQSRQGTwctgqRb/63NmRiWoeUgHXlJEzgvgW4GlDIhk7hXRYFlW/2WBgTWyXvUWHFh7cxzSA
	EcLc676xTVFRHIB9qw3rzNYXw5XxBzdfcELoycji7qgZ5zIC8gkbDb7riRzz1bMOE7GmBWSuWs8
	vmxvrR8Ii57dfo9p83yPLOCf4Al1aALzHGeUaUK4RTi5R3oYjcsDOthjXx/2kruYwgTKR7mm2kS
	2R40MlevwH/8oZJfvx6YkWA==
X-Received: by 2002:a05:620a:3725:b0:939:94c4:b799 with SMTP id af79cd13be357-93ebd25945cmr2264361585a.5.1791882528414;
        Tue, 13 Oct 2026 02:08:48 -0700 (PDT)
X-Received: by 2002:a05:620a:3725:b0:939:94c4:b799 with SMTP id af79cd13be357-93ebd25945cmr2264359285a.5.1791882527992;
        Tue, 13 Oct 2026 02:08:47 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c344ab1451esm268591366b.32.2026.10.13.02.08.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Oct 2026 02:08:47 -0700 (PDT)
Message-ID: <0afbd549-3e9c-4b06-928d-34b2912754be@oss.qualcomm.com>
Date: Tue, 13 Oct 2026 11:08:44 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: dts: qcom: monaco-evk: Add suspend-only power
 collapse state
To: Maulik Shah <maulik.shah@oss.qualcomm.com>, Rob Herring
 <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20261005-s2idle_state-v1-0-3c402c66f388@oss.qualcomm.com>
 <20261005-s2idle_state-v1-3-3c402c66f388@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261005-s2idle_state-v1-3-3c402c66f388@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDAzNiBTYWx0ZWRfX1z5ERddAFDEV
 bIR+yp22ncu0Cjf3/xdzmdnYFFDNreGLwB9D6S6el6lJtVDuLbk3o8Pa+kKBkkccBwnfVKqWNBN
 hlcrw2CgQCyFWGEA/1o3BWMcUCxAc0Q=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDAzNiBTYWx0ZWRfX/mD/Hb2SHXfi
 1UMVqL+OOQk4T668QyGFxVIFOMB1mRFeOZRNfNSoOFhkpJHw2yde25W093hu3V7L/Kj2mEf9h7i
 CBRByVQ73UtA6bURT5h7qK8dMN8idpT55Z9B/PM/NDSsd/4Io/X0mtx5j3FThB06Z32O7b7rh7V
 AjMHxRsamLtmimlKCoIJYF8/VrBfXJ/Cxq70IIDAGPyR83F7Py1DWkuBEnlAfKXTjSi/MFcc1Da
 EfYnYIxjvkEueGEvhn/g4Fxp8qBIi+w+/FJQ97h2jVAa9o+bvJmA50aYQFqg5rOJpaTMYWV9Lzg
 YZnZpPXJzmFKtuF1T8PiX6lNrZJKg8pKIPO0FjbMhPs/40KY91dw/w/L7wd29S1EyXGEpacyFLe
 mW0oNeLFM0Us2G9V+BWSAefnm4WG4LL6acdJPZ2lG2KB2u04pTHzUxiJdzgJRPDChKUlropro52
 qxuWliLfXL5aOVlDaiA==
X-Proofpoint-ORIG-GUID: txfMC4UQh-32ODW4JBRiYCYsTHz87XiO
X-Authority-Analysis: v=2.4 cv=O5+sLx9W c=1 sm=1 tr=0 ts=6acdf521 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=qJe4qTQoNDkUl2DoRwIA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: txfMC4UQh-32ODW4JBRiYCYsTHz87XiO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 adultscore=0 spamscore=0 priorityscore=1501
 bulkscore=0 malwarescore=0 lowpriorityscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610130036

On 10/5/26 5:29 PM, Maulik Shah wrote:
> To achieve SoC low power mode like chip rail power collapse (CxPC),
> the Monaco EVK board with four PMICs requires coordinated power-down of
> CPUSS and the Safety Island (SAIL) subsystem. This deepest system power
> collapse state is reserved for system-wide suspend (s2idle).
> 
> Add the system_suspend domain idle state, mark it with system-state,
> and reference it from the system power domain.
> 
> Assisted-by: Codex:GPT-6
> Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/monaco-evk.dts | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/monaco-evk.dts b/arch/arm64/boot/dts/qcom/monaco-evk.dts
> index 539c9c80a808..b2978be6823d 100644
> --- a/arch/arm64/boot/dts/qcom/monaco-evk.dts
> +++ b/arch/arm64/boot/dts/qcom/monaco-evk.dts

Why is this board-specific?

> @@ -80,6 +80,19 @@ m2_e_uart_ep: endpoint@0 {
>  		};
>  	};
>  
> +	cpus {
> +		domain-idle-states {
> +			system_suspend: domain-suspend {
> +				compatible = "domain-idle-state";
> +				arm,psci-suspend-param = <0x4200C344>;

Please keep the hex numbers lowercase

Konrad

> +				entry-latency-us = <706562>;
> +				exit-latency-us = <706562>;
> +				min-residency-us = <709987>;
> +				system-state;
> +			};
> +		};
> +	};
> +
>  	dmic: audio-codec-0 {
>  		compatible = "dmic-codec";
>  		#sound-dai-cells = <0>;
> @@ -772,6 +785,10 @@ tpm@0 {
>  	};
>  };
>  
> +&system_pd {
> +	domain-idle-states = <&system_sleep>, <&system_suspend>;
> +};
> +
>  &tlmm {
>  	pcie0_default_state: pcie0-default-state {
>  		wake-pins {
> 
