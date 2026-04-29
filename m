Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 673B93859FB
	for <devicetree@vger.kernel.org>; Wed, 29 Apr 2026 15:37:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777477034; cv=none; b=jNZaYwHB/f8rKz+oD+hYEQUrz+tSfV9C/wlmtolNIW6qK/XOQO2xI0OI2BvC9YdJP6Le6x7uToe/a51CBHt9tJA3WUcaQR7eGau0+75fHI92IefA8bhCj6fQfPZ9yZoolncBy2FnoSCrMPN6TrBDRLqnwP3DVaXtDJ284iqY5O0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777477034; c=relaxed/simple;
	bh=ZcFypg/iBdGOtUJoMDDi0uJSfpc3s+lAHkhP9pI2G5E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bGBs4+aZwT74iPJoVTqXff+o7B1FDL96xh14f5LObThbmDH60VeUHXIqXFI8kAm+Kzns29qYV+ZhaTWM6Fz7jAxqLWv0IA81S8h3wJz0bFAHInIJpzFSzDIrdM6r/e3izBzLhvXQ4ll2rQZYBzb9oGz9cFeyn1wUA3ghvRLAKl4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=B5m88xAs; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iIGeSk0v; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="B5m88xAs";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iIGeSk0v"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63T8q0aD963254
	for <devicetree@vger.kernel.org>; Wed, 29 Apr 2026 15:37:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QCzJG1U3gtHMSyMO3pqR881GCcha8Uzwk+QlLR8h4Tk=; b=B5m88xAsD6DN57Ez
	E7h6ycOi5W4o29U50EqZau+EFOpZBC2j9Wue2s8g0/W2viCCnwlRfBKBAbrZ+AOd
	gE/wtdb+7byiot1ef5T2XCYAK7h3fF044Fuqnz0bawQcXb5knbDOH42lWcTKkno9
	EPe6M7vuUoISg5qxLb4B268EI3wBrGBT4w8p3ksz0TjjwZ6CajvwGnMnObvg0Yec
	WNvsWJt/7gxUi0kdHXMQ4UQrS7mtx3AERg4E44ITuoJlBGQduTBWdVBstA19JsEG
	f5OAz8rdV2Xa5pvCfPlqUzlIYSa2Y0d04bqzLEfbi68V3PIBv4C3FRMRv+Cx79sx
	b4MymA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4du2m4v30q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 29 Apr 2026 15:37:11 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-35fbb5779e8so13145652a91.3
        for <devicetree@vger.kernel.org>; Wed, 29 Apr 2026 08:37:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777477030; x=1778081830; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QCzJG1U3gtHMSyMO3pqR881GCcha8Uzwk+QlLR8h4Tk=;
        b=iIGeSk0v1nQ0GLNmz3k1j0ifvnYahfucy5Zx9G7veg639h8luBIpltBgRN3VMCbUBf
         UWtSAWC6EO3KyOA0ykeZBpWuaORfkTXNoB0QG8EgEDSg4ahNZtQf0cS+v/dKkSvbHQmS
         vynhmyihqUen+QopX6AKigLUu5dlv/spmPALIghETdD3ysIGNPNnJWvBpwTDC0catfsA
         XqI3fi8XihsiQlGYa+Rn4VmWOhn/td3/xSuBge6TszA2RyfGOboI7Ompg9IaKXH+aHEp
         k2EPzjHI5QQAW0GvajSR0iSi5kRfYZDO55KO3mcg+TWX54Q+cXq57L7gxzEU7G4PDmzW
         sP0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777477030; x=1778081830;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QCzJG1U3gtHMSyMO3pqR881GCcha8Uzwk+QlLR8h4Tk=;
        b=rueNhGdml+2qPCSxfUgTHmr2QkcG+wllazB2rKO0IZrmPV8ztmFHizdS5t3DyN8SIC
         Uzu48y0llqrKg/1Zl4CeNN/DGVUxA8+KdQjkQ12pL5skURhCQeaoE9l+TQJEbtbJ1Q6B
         Q/6HMp56jgjBLOWaBlxlDKaZx3dIutMT5oXu79zjpvlApo8EmlDfk5U9EMNjdPefMeJe
         sXvO5ro7CgGRzLmjIGHI7WMDLhAhNF37mg1OMFTLzX/K5PN5ESl6nSoYJwkj7T70mSp0
         5I8BJpou+sPckVGOnVor995EEAY2WkOa2/zH2CchRLs2Th/Po1/avyapEeKjSE+E77/p
         F45A==
X-Forwarded-Encrypted: i=1; AFNElJ/pyo0mx4DNDv819I0+1zuLHqM8oWtDzKfBuH86LWNr6xgtaO7ubY9XxyDiFmw6gCYpCLFE5NJDxBRC@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0QdfSjnP3yySMWlJKWXZ4WVC/YTxK4Sri8sBnNM3I9/dLleqb
	TR3xY6AAfSI+T536D6Rk9mJtnpp2T8WjmR99RQNhcTYMykO/N8uuhdSW9t7M5OMV5imDFdQeDqB
	TXXVJF9nyyfEnJNwyuglveVR6ufADAXaS0TOLLXddpMtAznIfVaLZvU/eAGG4mq+e
X-Gm-Gg: AeBDievHVMEwqZ2gBDZKw9p2HgoorHJ52uvbI91Zoh6Tzo9wrEuRHs0udP1cD67y3+T
	c3HyHH6tH2sIsAzrgetJLuNCmF0a0b36P6xnZ2ecB7ylMk3ENjHfBBuslPIgbRTgP+xe+wxGgLj
	/vlCScApjvt3hC7TvHZMdDqaHKIPVA3j0Av4vPIk6x98raoZlKdaKQPGPb6qrSoV0V1koWb4nbj
	RWejKntFFMe7KgjR/70AHsGsM8hFj04dHtJGuIiHk2Q6Z27QPFAtKQRQ3ZsJuShU2yH00KLZ32q
	66wIxbHaIhJPdrO+4QuteeH2HQ9BJmifgDEp09GytmR6F6w5yfU9VbxFUmZJCTpV2k3dYD888Rk
	BmLvRPWqf4Ou57ydN/My1mq2bPO1b89NNziV2DFr82u7YND8FgGxWO8qkLVG8naQeZc9Ard/0Fy
	0D
X-Received: by 2002:a05:6a21:6da7:b0:398:b178:a53f with SMTP id adf61e73a8af0-3a3af584611mr5355608637.40.1777477030358;
        Wed, 29 Apr 2026 08:37:10 -0700 (PDT)
X-Received: by 2002:a05:6a21:6da7:b0:398:b178:a53f with SMTP id adf61e73a8af0-3a3af584611mr5355561637.40.1777477029676;
        Wed, 29 Apr 2026 08:37:09 -0700 (PDT)
Received: from [10.48.22.70] ([106.192.167.99])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c7fd6506e51sm2868800a12.26.2026.04.29.08.37.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Apr 2026 08:37:08 -0700 (PDT)
Message-ID: <5e2a4d55-49a2-4813-b497-367487174e64@oss.qualcomm.com>
Date: Wed, 29 Apr 2026 21:07:03 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] arm64: dts: qcom: add IPQ9650 SoC and rdp488 board
 support
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260429-ipq9650_boot_to_shell-v2-0-9b0dc3d1f3a8@oss.qualcomm.com>
 <20260429-ipq9650_boot_to_shell-v2-4-9b0dc3d1f3a8@oss.qualcomm.com>
Content-Language: en-US
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
In-Reply-To: <20260429-ipq9650_boot_to_shell-v2-4-9b0dc3d1f3a8@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI5MDE1NyBTYWx0ZWRfX/tNRH0Nr64Q2
 WPgXl46mT7k//bzGfK3BzuOxxgDv0lJrFSpjOHTeKzZ2e4dZOu8MoyEUnF2nttc9N/xIpAMErQ6
 mbgzI/Ov1ZQOuqpehKWq9EmZrxxdDmlF7mkymaRiV2Qs0LYwIpMrLpk0iHPJbCD0s3AtS1lBm/v
 lKHqcim9sEGaPkoB73SdyKfjjxW5kplEQ1wOLPR4OCO2Ztxo4JnjKK+LAsKxSjioq8I8uBdvMh0
 iGwkO9bfRGt1E03i0o5/DWlGxFD8npONxf3UmRnOhwggfDUHSc7C8BTWpKmDsXEFYxwngt7YCr/
 wjM8XsT1frkitFO+A/oReZAefXJW0nyal+B7CgLwfXbLmkHgPXYHJs0F2tohSI6AB5yiqa2ByiX
 lfSoTmYY5P6Omavc3FclEC/tu1IkqF9yD7e26+Yuw5tLy+3jTiaxf7Ufe7S8VJhkcwUUdjzZGak
 PwL0B3xyyLWXlWNgfqg==
X-Proofpoint-GUID: iuHlH_VE5G-ELambg8b5MeGVrMOkz0mr
X-Authority-Analysis: v=2.4 cv=MuFiLWae c=1 sm=1 tr=0 ts=69f225a7 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=zcCrjwgepsyxNXemSX8evA==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=LsfjrspxSUTcLO_nfy4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: iuHlH_VE5G-ELambg8b5MeGVrMOkz0mr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-29_01,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 phishscore=0 impostorscore=0 adultscore=0
 priorityscore=1501 malwarescore=0 suspectscore=0 lowpriorityscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604290157


On 4/29/2026 8:54 PM, Kathiravan Thirumoorthy wrote:
> +		qupv3: geniqup@1ac0000 {
> +			compatible = "qcom,geni-se-qup";
> +			reg = <0x0 0x01ac0000 0x0 0x2000>;
> +			clocks = <&gcc GCC_QUPV3_AHB_MST_CLK>,
> +				 <&gcc GCC_QUPV3_AHB_SLV_CLK>;
> +			clock-names = "m-ahb", "s-ahb";
> +			#address-cells = <2>;
> +			#size-cells = <2>;
> +			ranges;
> +
> +			uart1: serial@1a98000 {
> +				compatible = "qcom,geni-debug-uart";
> +				reg = <0x0 0x01a98000 0x0 0x4000>;
> +				clocks = <&gcc GCC_QUPV3_WRAP_SE6_CLK>;
> +				clock-names = "se";
> +				interrupts = <GIC_SPI 380 IRQ_TYPE_LEVEL_HIGH 0>;
> +				status = "disabled";

Sorry,  I was careful enough but still missed the \n. Will take care of 
this in next spin along with if any other comments. If not, can I take 
this up in the next set of series?

> +			};
> +		};
