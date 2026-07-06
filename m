Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63D2C2BEC43
	for <devicetree@vger.kernel.org>; Mon,  6 Jul 2026 10:03:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783332205; cv=none; b=pllj7QQkBfdMa1yW6V7xhyy5mn+dRX/ZxSo+ruZZyVJ7yIadlhGagCms1/5afSRrS3uH7ZsuycvMKE3yYNIrxlBnVpt0Sq+kd0prnkbP4hTDtWJBFmXvJgQtjexfvyOTMSeSAiQ4Mm4ZE72vs5H24Jn+qEQzojgXk2PDna6RZHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783332205; c=relaxed/simple;
	bh=j7I9FJXLK61qC3Hc6JfeOMWvZiX9lNEoPUMZtvCSydQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aG1D091V1ao7Vk4n6aq9BuKmrvZAVIT5l+QoEB0tXfL2ix0LtS4WgYxgCTghdrRX8vKEnSwYVgAN1+a5V+xSWc6Ux0yZP7TRJMCCPJVOKk9y230O7Btxofa8sHx0Kyd7bFoY1cyZ2Z2s/V8vGNmzldrTgOTDWjxkan2reQxrq6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XLRY5U+j; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Vt3I5l8P; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XLRY5U+j";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Vt3I5l8P"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66693vHe4151609
	for <devicetree@vger.kernel.org>; Mon, 6 Jul 2026 10:03:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6y5xA/sY0H8rxmBY7v6P2nx5v5uK8DJodTOynLPQvqQ=; b=XLRY5U+jtsVRq1B0
	KE0axftAWwNHaWcA7gqtBQpcVJS4j2maia0uusa1hjL16uiH9/WzFe1o3F0nHIe7
	J/qAzLVUGnk+5pcUQEKcAN7VDRcjKkhvW7UlnxD5VAlRq5hI9VetT/pN3ryhge/H
	MBkQYTK0CLh/tMsV2KJRCT//dptysD1AEw3koHNVTAR8YgRer0UFUDEurke7TjtG
	o8gBP/zKd8mfTf0Pwu2eSh11qhtxDU1NMQ9uHhIOLr3XNSQgvXshhdrblRMcOzzA
	wSfdaVSL0Mym2x/bSIolJip9woP2DXsotTtqaDWf0nBNrvIUeTkEP1QILqs2BFh3
	0dZNqA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f88hs8gd1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 10:03:23 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c15c77619so6624651cf.1
        for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 03:03:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783332203; x=1783937003; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6y5xA/sY0H8rxmBY7v6P2nx5v5uK8DJodTOynLPQvqQ=;
        b=Vt3I5l8Pr9XGQVP+uQkwA2gT3+YIEAe5eGjj4itCWp1Aoj/5yioXD4g9/zcODjVgWJ
         nIiVjgLhk1jwmCn+sOkfG1PmntsCaeHM120kn3Ki7tpVcMJ5VC6OO1/ghYrna+dhAnGT
         hzYNET2bBbBArF0qT6ONp07x9gRB72a0Kc7xybMARC1ArrGtuMHF+e3fVy8B47RWBJoU
         rAO62daCMlMdWRO5//yKjYRcrKaWQoJI1JnenaB5SC190zLD/5pW9OOTLIKN0rKcxC60
         lH29GFxeyScFH13RFrWpZS4LaIcBM6oGJKmj7OoT8oQuAbdMG88qx5e3+1R732i29reo
         O/AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783332203; x=1783937003;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6y5xA/sY0H8rxmBY7v6P2nx5v5uK8DJodTOynLPQvqQ=;
        b=n1nU4ZADKltBtf+1KCxYT47f1ahXY4JIW7RZ1RiEd8DwkkvQb67UaBaco3FyKlBF+7
         NNCKqrsP+EPIDPBVjR8MbB0GA13ymRCLzZx61I2MmWnznFg0gjg4ibHU+EM9MAk6TwE+
         Rzyi3mpOKs2b4ElTPkPSiLkSQewK1v1ySrYO3TfhmJJqyY/D9z+RXSels2AL9UsBQyv9
         kz/qsAPZrXTAhV/RUOwCRezJtWSmpoH2unREP+cUj+JrepJi0Pvc3bJpM9md4LFGQOrU
         OoUIS61GkaLuD4SfXIQj2pT00Hg/xFOEoH0FRhDcjK26M1oGfwhQJqcXdTSmF7awf6ny
         rxJg==
X-Forwarded-Encrypted: i=1; AHgh+RoT1TSGWMNckZwrOR1Ws9DSP9hgpqI0qpAYuhCAB+JG9nRTcyX82U6S4n4shjJr0m2UDhBYJR5rhX5x@vger.kernel.org
X-Gm-Message-State: AOJu0YyiojZ1OVrHJ107dphu+ldUvTkXUCKdFDM9PUrWLa7LER+ytupN
	I3mrBukPBTExf2YpcRQY/O0W500Mh9RJDW4AeRACGMOfFiuJ52TrE6XehMQHjY/evnbCLdx0m0k
	isj/04LkzFlx6lvRom6woZ/zbbJpxaHA/FPFko7/8hgsEjpywneii3LUsRoQgmD4J
X-Gm-Gg: AfdE7cmvohOc9ZTe3S/S5cLQupwPNKK8MBvB1BEkfo+eq1+ssI2t76RjF0u2R7eBbAy
	FAGnni1QisKwt0//FmSG2MxpuE2Fg5FCoFCWHCeQT/Fma0KxVdzRFDweooJSmmhkAeoDbxf91rL
	1uvQuT6xYT2UW5anb4DvPYW6LxlAu35bKg06z+8xFD8f1exPIshX2NHbS7e4NxANboHfpk5YaRG
	1J7NVvRO4ZF3FoV9tbyuJ8ScbbQz/VymYVPiUaUq9bNIF7MK1sGdGyIoHuO6Q52HFCpiIR7hh7i
	iRzc2BhTm7Uqd5oiowN42mI9WVydr2Q7M5JeZaMPXuW4tGGbQTgidoI5dcTKBoaAL4v7m7nnhPR
	nxsnJXjMUYFADVsxUrmapwtJnh4ikv3oLay0=
X-Received: by 2002:ac8:5910:0:b0:51a:8c9c:7f58 with SMTP id d75a77b69052e-51c4bf4718fmr85762191cf.11.1783332202799;
        Mon, 06 Jul 2026 03:03:22 -0700 (PDT)
X-Received: by 2002:ac8:5910:0:b0:51a:8c9c:7f58 with SMTP id d75a77b69052e-51c4bf4718fmr85760251cf.11.1783332198567;
        Mon, 06 Jul 2026 03:03:18 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c12b6099911sm706130566b.24.2026.07.06.03.03.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 03:03:17 -0700 (PDT)
Message-ID: <8a3cc857-0b1c-4bd5-a5ce-a564823ca614@oss.qualcomm.com>
Date: Mon, 6 Jul 2026 12:03:15 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] arm64: dts: qcom: shikra-cqm-evk: Enable display
 and add ili7807s panel
To: Nabige Aala <nabige.aala@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Arpit Saini <arpit.saini@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260706-shikra-dt-changes-v2-0-56fcd1659ea4@oss.qualcomm.com>
 <20260706-shikra-dt-changes-v2-2-56fcd1659ea4@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260706-shikra-dt-changes-v2-2-56fcd1659ea4@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: xmGc8rbCyNrKYbKE1AF_ueAvD9Ube29p
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDEwMSBTYWx0ZWRfX2kPtPsxw/ET8
 uWwoIdyLh6dT6QRpk/qdVa3L/SWrwJcCpzuqdfIbZ43PDJTEVn9LJmYGUa1CkoZx6kr4CWUtEyM
 MXW3B5C9FVG2prN5QUhoq3H106K1mpuE7gJmQLPhC82m/+ZyqTo1WSnSXNpzZUNtyckJu1Mx5Uv
 wQFfbo6cgl/ey/oh84Mr0Zex2VPN3tA8t0jUk+jpV6kNIupjqoSSlKEXUyy/uySgGAB8zMqBTac
 kAe1CEzvxLbBPhg+k5eGFPMX079GzHGUE3IyGpaaVewvlvzCOEVCzXOqKNCP5aYjCXO14/x/x/f
 s62L30eIyrYpOxtFYODjSZVzqc6ZUcK5v58Jnt+hM6UmRauut2IgGPeTbhHo0eUpi1VYet5mr++
 0iMPaxLRtYwSCRoHAnUtrwpDXgyiFPJJhQwTdlp8LQ3HzpFtyCHaBFahPP+wtmM/5wtfmC6S0O3
 Cib00lK+NUdRzLGk7RQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDEwMSBTYWx0ZWRfXzcHbXt03gViM
 R3wcpwMdsTTgOnRRZtNFqsLKjwdPLIZkLlqIUNZsPJNko66mPTDFrK+wC895WBs4kzEumNtr0qY
 owFtKFA6ygKu6KiSFMGfRJD817OZ9Hw=
X-Authority-Analysis: v=2.4 cv=XIwAjwhE c=1 sm=1 tr=0 ts=6a4b7d6b cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=Jq6lAVB8MRYJtmNLQKsA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: xmGc8rbCyNrKYbKE1AF_ueAvD9Ube29p
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-06_01,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 bulkscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 lowpriorityscore=0 spamscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060101

On 7/6/26 8:04 AM, Nabige Aala wrote:
> From: Arpit Saini <arpit.saini@oss.qualcomm.com>
> 
> Enable the Qualcomm Shikra MDSS display subsystem on the Shikra CQM EVK
> board and add the DLC0697 MIPI DSI display panel node. Pin pm4125_l5
> to 1.232V with regulator-allow-set-load for DSI PHY PLL stability.
> 
> Signed-off-by: Arpit Saini <arpit.saini@oss.qualcomm.com>
> Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
> ---

[...]

> +	panel_bl_en: panel-bl-en-state {
> +		pins = "gpio91";
> +		function = "gpio";
> +		drive-strength = <2>;
> +		bias-disable;
> +		output-high;
> +	};
> +
> +	panel_bl_en_suspend: panel-bl-en-suspend-state {
> +		pins = "gpio91";
> +		function = "gpio";
> +		drive-strength = <2>;
> +		bias-pull-down;
> +		output-low;
> +	};

output-foo isn't necessary, the panel driver will assert it as
necessary

Konrad
