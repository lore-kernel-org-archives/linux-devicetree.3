Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D67C3E559E
	for <devicetree@vger.kernel.org>; Tue, 26 May 2026 11:38:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779795541; cv=none; b=d99ocU5XXPZN72yuBeGm7f2vwKNzGuK8vv4wna2QwJClydBPYqH4sN/GvXkJkouvHxwBQJaWEevcjb6X/5g+uRj90Lfuy/kNd1lrqZPFqgxMjNijXDpLLkjG68vFaTOzk16thYwuF3gJOvGd1zWCr0OGzreuvEu7M+YXxEa87X4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779795541; c=relaxed/simple;
	bh=X75W7d8cnqe8jud+yaQnaegaZgTe5QK8rutBJviYQxc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KZ6rK1zIOs5dm3gTqX2MDJ4Su9TGA1pfHwKsiDI1FsHUdJy/N/j2Ih24fwqUEkuEwfe7p+HK8slaX+Pi9O8b5+nzQO67cu/pMTIsI5OOab1eHgLm8MV7kL+UixzZa5uKG8DKjDRkrS8F2PgKDtR1tAGrnpZAMBHhaWa/AZcQWHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ottv7G/k; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=H42p3UUA; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ottv7G/k";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="H42p3UUA"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64Q8MD9i3604073
	for <devicetree@vger.kernel.org>; Tue, 26 May 2026 11:38:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4TCr0Fc2ZSclrogE5U5UpT35PvH58phtaOZheUxp7cg=; b=ottv7G/kaQYn5ADV
	+FQYimnhRSKOYIkxzJOVcCAzUycn1xlCnMgNvLj5KiZDfi+KqDyBCne6aNMf1HIx
	LYxoIpoWhsKWMoWvmh2J5Varb+0x2Uj5ncLlEaHn3vs3xXM/Uiib4uUdDgDWERwe
	qIM4WwqlxuGuTA1g+8HYE401aYWpb08/ivr2VXPwTEcgfKJoDO/mS8ffpTTcP81G
	8Nn5zl1p5tJuLwJ1dUYhLxeJ11CIh/LvoAa34tvuCUZyxhW1M9FYCZwsCAwb57QY
	aSDenf09drCCITyvSMlAJFN/1BiU03PFuy/5U772//2e6XkfpIzRai/q5j/55sCN
	IVbxhg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ecpyqkv8y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 26 May 2026 11:38:46 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2ba838d3fa4so105325215ad.3
        for <devicetree@vger.kernel.org>; Tue, 26 May 2026 04:38:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779795526; x=1780400326; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4TCr0Fc2ZSclrogE5U5UpT35PvH58phtaOZheUxp7cg=;
        b=H42p3UUAq1g/zlwwf/aEHECLf81eZaz7XhF1Cbl2GcVHm1I0Flp5qFanjoyd7p7/qb
         r8l5pszYOMk9WBWNwoB+NOG+vNTvTr7P6fjMNVK3gfzog+bPxX+EnOy0pJHP5x2S3hhM
         rCWe9m8cNZmbbpDu+WjSj8cJ1DSvaqxL7KdkHB3Qd7HpQfipSUOTyEvGpjeEoIQE/ksf
         sQdTJudvgvyMcDWm1g4DYpC6R3W/yAedg8QSQFFNHC/wCEkd4a2kCGjdlpuRYAjuCepc
         SawTLrFVlHOstDNIC6M+qeNtg95V1lJjg7tTVLrOP4ALA+6Aka9rUcVANxeGyKSzBj9L
         Pcuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779795526; x=1780400326;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4TCr0Fc2ZSclrogE5U5UpT35PvH58phtaOZheUxp7cg=;
        b=F6TsMsmAyND2h4pl9Vkh/G569kgfZ5OIIHSkZ/5hognz7oCQ77x6rHHKdXWiAqCbqw
         gw3SzzZ0/I0UiDADZcy68nBKtV2ZQIaBdHx0MWSG35aCo3bhCofJ4fN1D16GQL0UzAHW
         Slk6a4Xo1jJmMkUpvTwsfowEqwaFtnQ/iO1KVookjcS/9zrAjK7Ox6DPzp0T2JgIMV9F
         g/c5QWai3C4DBpJR8/Zx44XLLvEADlWhmJOHx5RMadikL3jNHrw5LH3FqzCr/Xx9SzZY
         n1k5LTq6WfDGsn/XIvgFXkfEjEHJp43sbbcJLUVoIpuNr8CVs1SaRwY/TIYUxh7Q2229
         O96g==
X-Forwarded-Encrypted: i=1; AFNElJ9DG3uaPRR6u8i3XScO6FIW6nnGbIQcIDxlB2aoeniRTgdtzGdjTO4y9kSq7ebxqLhERlpFIVNSbEo7@vger.kernel.org
X-Gm-Message-State: AOJu0YxKBfSCGLr3SNO2Gp3EkfnVBWoyz0e6eJ70ocwh5D/aT4uAEnsD
	CQTdrH8qj/anAC4uSsEqGENIsNbPpK1RtmqyY1JPRgDaPT14+oI3USOphgulsFxN/9b6giQLnv1
	IXoJEJ88UsKebp9VcsH3XcjL4wrXxJmYIsIk+eFzjvDtt576dT3K47qD7yaxHditd
X-Gm-Gg: Acq92OF5a1BQzaVeb+oryGqpMxI6wiQsB1jpqK1BmOagP/4+/03Pe3PtYTfumIEMaYT
	+2d02I0T5I7NYDW+KTkf4WXM8ZzrSo+N43duNNhigpym+Utc18VBmDxie9396Zi70Xen1edZbuF
	GfArJ0Oe1H5zvsvvPxbUzKspI+blurY1fooSIoi1xMRy/ZVrG5m4TZuPRBmrHXtmJsK57p4KyjD
	bsMBGFoU2mAKwNbgF1v2bjdq2BVoN9p5YAI4DuK2/HNsMCk9pc+wESLMCr/ktPsN233Ph47Cirm
	fbl8/IT0qiYPe3Z20BePIFj8c+MKTY0dlY9Mjlplyyomk38aqfAN7hpj+Ip0Mgib9VlNrK6YzKP
	eHZCMgTuCS2pl7513P+XI5ED4A1YKmuda4tR5dgr+QnpL+lXDVZzR/YseyBY=
X-Received: by 2002:a05:6a20:7488:b0:39f:a8fb:3354 with SMTP id adf61e73a8af0-3b328cb6faamr18622502637.17.1779795525598;
        Tue, 26 May 2026 04:38:45 -0700 (PDT)
X-Received: by 2002:a05:6a20:7488:b0:39f:a8fb:3354 with SMTP id adf61e73a8af0-3b328cb6faamr18622473637.17.1779795525054;
        Tue, 26 May 2026 04:38:45 -0700 (PDT)
Received: from [10.217.216.23] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84164af10b5sm11685360b3a.15.2026.05.26.04.38.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 May 2026 04:38:44 -0700 (PDT)
Message-ID: <bbc27f64-cf24-48f6-a577-5c1cf46d8117@oss.qualcomm.com>
Date: Tue, 26 May 2026 17:08:36 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/7] dt-bindings: clock: qcom: Add video clock
 controller on Qualcomm Eliza SoC
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org
References: <20260525-eliza_mm_cc_v2-v5-0-a1d125619a5a@oss.qualcomm.com>
 <20260525-eliza_mm_cc_v2-v5-1-a1d125619a5a@oss.qualcomm.com>
 <20260526-muscular-skylark-of-wholeness-6ef2a8@quoll>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <20260526-muscular-skylark-of-wholeness-6ef2a8@quoll>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=dtfrzVg4 c=1 sm=1 tr=0 ts=6a158646 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=9AdMxfjQAAAA:20 a=JnjiVvBC-mdIheWOmMIA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-GUID: vOEibeb6oo-HTYf840SZhnxiol-ypse4
X-Proofpoint-ORIG-GUID: vOEibeb6oo-HTYf840SZhnxiol-ypse4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI2MDEwMSBTYWx0ZWRfX6L8riyQtpZO8
 xMIG1gU8f7jWzdeC5NnbE5uCT7qFphgWLkfh/TgI8otHv+b6BtAgKNRitWwr6+aQl96ldRra+uw
 93gfN1mPZACXSej3jJn0s5voPqtjHlFjlqyP5gi7fv/dDM0+epjknaql98zudMiDgVgE9gBJddD
 ntnKF8NCC6+kfEa+8UhLH7jxH86aBffMH/HDzGH85SKrGb6twDX7LKBxJMwkIwwFcEBYlue0KD3
 gaIy9DoGM1sXsgWr5zVg0Qc1+ywppegU5bTlAty9vvcQx731Nw4oi5Zbjb2eTsGiBHivskFtQuU
 gZ4Z6FhVrgrASRDP1ZqbRUoPREi/AjRCpsC7tuETSLdIhWItg5JCe4QxlYoQ6dR0wbZi+Y41eWk
 84z8TRhWeyKV4slwNP+RUw06qAhkwmZ1ER5zzCQohw/0c0KthFdV0G1h/+6tDQNfC95g/k+nzNj
 uh3zjtqjfyZ0t4lcUsw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-26_02,2026-05-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 suspectscore=0 bulkscore=0 phishscore=0
 adultscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605260101



On 5/26/2026 3:07 PM, Krzysztof Kozlowski wrote:
> On Mon, May 25, 2026 at 04:16:03PM +0530, Taniya Das wrote:
>> Eliza Video clock controller is on CX and MX rails similar to Milos.
>> Add compatible string for Eliza video clock controller to the existing
>> Milos videocc binding and add the dt-bindings header for Eliza.
>>
>> The video clock controller exposes power domains, so '#power-domain-cells'
>> must be present in the device node. Add it to the required properties list
>> to enforce this in binding validation.
> 
> That's ABI change, so you need to explain impact on existing devices -
> Milos.

Currently there is no ABI breakage and no impact to the existing
devices, since the nodes [1], [2] using this bindings are already
specifying the '#power-domain-cells' property.

[1] videocc -
https://github.com/torvalds/linux/blob/master/arch/arm64/boot/dts/qcom/milos.dtsi#L1849
[2] camcc -
https://github.com/torvalds/linux/blob/master/arch/arm64/boot/dts/qcom/milos.dtsi#L1918

-- 
Thanks,
Taniya Das

