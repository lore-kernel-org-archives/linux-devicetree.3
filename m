Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F355E38B14C
	for <devicetree@vger.kernel.org>; Thu,  2 Apr 2026 09:23:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775121793; cv=none; b=aOLHFwsLFgO3cZ7zv5az4qiLvdBv1NjN6xPzO8m3RU/wpqXCAVcsq+YuMjk58fcoXvtXk2O/4lBKOHu3t1ua6xq6pjO66AoesKN9I1nHVgxMYSH0k+Xhya5RV0WGKZHPLdoBdj+0pc+nbFOD4TKvpGXlIcihC+znKYVybaaHd9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775121793; c=relaxed/simple;
	bh=q9j+367l79vYQecpLmaLpTtH+va4Wtpz6t3r4tF7vyk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Pses3bqnzJDSsv9qlqgUAEUVoZp/K/stDr0JgLH+xyuBhsbD8aNaRz2P3tvHY64gtIHkNst1OfZZr3enaHeNbpNn0JzvNsKAcjSAvg716+uada7rPdomx/1wauRFlBjJQ/Bbtv95QVT+SDmggj7FGtPpKdUbHQw6g0NPkDILOfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YWV/tnlY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RyB6PIU+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YWV/tnlY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RyB6PIU+"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6328SEFW353578
	for <devicetree@vger.kernel.org>; Thu, 2 Apr 2026 09:23:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CvBiLwxg7AThsdO3zDQ/KZkqwxu86EBPRQfQ963Utkc=; b=YWV/tnlYRJfUMLIy
	TtfMrPl/X9K4U9R2hhggX70fmeuj6hM48rj0ijQQ2B6Wq2K5SMtGijcEJukjAj8M
	lVuF/OIetpvHMnQ0Hhf5THmXOxvQE6nmf99mtqySBVKD/pKjmwDWU8mf/HPWEpob
	iHQ8f72tHMNybvcn9j6lfoA90SRSp2IjmvtxwO1Umz+udXJWJUMSsLebEr4V/NJI
	PmhSIlz+eEMHAdVOTSwqULAaAXwccXutUPY/gVS5gAY0skDcc3ja+dhCzK9TB647
	FCPunDFOkpJ52jdlYZaq+NETM8ePB5ZHo/MRACM2yfTyScRzLX4G9cYSaCp+Dlxm
	6aVKzw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d9myh8730-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 02 Apr 2026 09:23:09 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cfe29579d5so20442885a.3
        for <devicetree@vger.kernel.org>; Thu, 02 Apr 2026 02:23:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775121789; x=1775726589; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CvBiLwxg7AThsdO3zDQ/KZkqwxu86EBPRQfQ963Utkc=;
        b=RyB6PIU+8Z75WmgIYMOW/t0EF/0/ulbziOBxFX5/0xI1AUFVEgZnUjurh0o+Nr2hjj
         5zk4XHDvC1k51q4EzSZY/s4ehOsVd9vjZULZVWD3E8GxKJ4YcvKuxZuUK7uM2Zyl2z2/
         dTpgXQQQqtoUZDYUhYWJ25x90z38ZVeYFAHlb6HxfPi7bjfI+oY6oifLFhVyF2uCzI8j
         Ym/FvKVRpVb3FoxK9THdF37BdtaCYuX6puCXlz+8fqVBY/D8ko7/NE7TGI+18PfITUMd
         uBoUiwZFqfRz9C+aNEtZOCe605I7xoDGkaeRtlxgtv/Nv4o4QfbVSlY1Jko+NpEHKH9G
         rHRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775121789; x=1775726589;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CvBiLwxg7AThsdO3zDQ/KZkqwxu86EBPRQfQ963Utkc=;
        b=GqS6yIYrWpNI5sFS9TeoSzOjrbRR8SdjOS/y+UO9skYSIwl2dZC7Ifdr1ZY3jR0nXw
         6j0+g82WOZu2pxMXseKN2hi9w0XNvMyiATTb1f01pkz5O5bNUaJQD8KavVfsxndyd6MK
         JaWrGnana6cpB5NGWnhelMGyxe/kvQwMFKNTy/ObQu0IcD32bsm6fOP3lUCQOzS6oNkz
         XEEv1SUH6+3LH2pWzJpmRvlDkdsFxiSfqIio2KCKFEEaQSY7hofIloMZA0G5AGbP8UUh
         VQOiiGps60Q41Kdgpqr9VtnpswHfNJVwJzHe4eO6WwKsvwAgRS1RlVSEMPmiWdfkHo0n
         MoPw==
X-Forwarded-Encrypted: i=1; AJvYcCXkokJaLyuqJOkXv3GU7caEoBrZidn319LhbJywbu9PgR6Olw0fpyQLw7NuDCjxjF3vk+a4RV8rGAFK@vger.kernel.org
X-Gm-Message-State: AOJu0YzWrQWi20Vl5mTiwpHjja7vQA5PD8o+7c6LDtzli36Qv/zRjiTa
	jFLLQbpuFkKqWoDA3B83PNPKaILWZWHD7B6GSbMJY81nS2vJ3+HSZcOnjtoeMGJEYXQf6HnnTDJ
	XgGCJXR4KsP++VlYWmW8S19rkPQ/C3BxoACXlDymxgBChIqHq11gtZWszTkTJF5zJ
X-Gm-Gg: ATEYQzw+iXn0f67Non5RLeMSYxZjxgRV/UMEcGfKroLhBxuCqInwXr8MJr/YFYq+RB3
	vdYrg45D8JtW3rNjtCYcMZFyPh7fE821VPoh2nlLsWhrpAW8DKJj+d1kkzWyiinDJwuipxyJcGr
	3QxyCqR8vEoLNcYVK/gHA3ZqleLdBaiEZ86FvsRhRMCmds9cQSzmn6k8gCWUAieprDQX0MCYD26
	I66k3z9vzJKYe1v8kLF/80a69Vs1ea2HhCKa7MHA2SndpqJYvfcalFDFycXSeTKNxz3QFYpZGob
	UqD+tzKlehthiVdaNLrXpfmmTJOisHCCuRE0YiIB2ajg94RGjgN//ZvqDf2B+EZJlZaGjqMBtO3
	+lyuQMUEq+2TdEdDALj6rfx40iZwm66JCDTSQOx3tFJY1cAoOyPq1s0mMAe3YjzVgTKAS3N/b47
	eblMI=
X-Received: by 2002:a05:622a:1818:b0:50b:8ccc:a41f with SMTP id d75a77b69052e-50d3bd5723bmr73354221cf.6.1775121789014;
        Thu, 02 Apr 2026 02:23:09 -0700 (PDT)
X-Received: by 2002:a05:622a:1818:b0:50b:8ccc:a41f with SMTP id d75a77b69052e-50d3bd5723bmr73354031cf.6.1775121788564;
        Thu, 02 Apr 2026 02:23:08 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9c3cec6cc4sm65225266b.32.2026.04.02.02.23.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Apr 2026 02:23:07 -0700 (PDT)
Message-ID: <a5fbcb92-dedf-423c-8721-59838da60980@oss.qualcomm.com>
Date: Thu, 2 Apr 2026 11:23:05 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] arm64: dts: qcom: sdm845-shift-axolotl: Enable
 sdcard
To: david@ixit.cz, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Dylan Van Assche <me@dylanvanassche.be>
Cc: linux-arm-msm@vger.kernel.org, Petr Hodina <phodina@protonmail.com>,
        Casey Connolly <casey.connolly@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Alexander Martinz <amartinz@shiftphones.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        phone-devel@vger.kernel.org
References: <20260401-axolotl-misc-p1-v2-0-f3af384bbb50@ixit.cz>
 <20260401-axolotl-misc-p1-v2-1-f3af384bbb50@ixit.cz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260401-axolotl-misc-p1-v2-1-f3af384bbb50@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: jIJBeWvHr3XIyl2n85AbEgMtgZIDWMQI
X-Proofpoint-ORIG-GUID: jIJBeWvHr3XIyl2n85AbEgMtgZIDWMQI
X-Authority-Analysis: v=2.4 cv=JII2csKb c=1 sm=1 tr=0 ts=69ce357d cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=Mtb5h6N5A-RCbQxWbuYA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAyMDA4MyBTYWx0ZWRfX4m+LRHMqv08l
 ldDfDJMnhNj/ltOJpESMM97+uAEh/CXavwOzBR6ltuPNPaNzghaaWiiOKa/J23CoPqDmbtNWm00
 QtRW6sdP+kEuFxztSaIVBov8Tixe6Gomu9k+yNyg/psLZFAUAMozrqtZOP4rsPtbGEZtV/XaOll
 AW+hKMrDwMTn00IuM2dIKKlSUJWWdmhmDS3E1pmS/5pNM8QdsQWHrKbDj7xcPki8f86Ue2vFc/p
 z91gBnBrlPpxLdU2YsiTdEhocNFAhx0Gn7fdgTrDVGMVYTMG0eHpciIs7ci3xFVrz9bwuY8yFcw
 CgkYs1DWhDp8DKrPRue/77vafOnNAmSXE0tZPjAVnAdaO0BPwxqX3Rt0w6+UohNYGAAm2ls+cSL
 qGS9cDDaICxGjx6E4tncboeNr8U4SQfI1mbR506YgZ7C6qIxArRItDTcTa+ZxZWOY0yZEucbEDV
 89FK0i/BrHXLV1WvVuQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-02_01,2026-04-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 phishscore=0 priorityscore=1501
 lowpriorityscore=0 spamscore=0 clxscore=1015 bulkscore=0 suspectscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2604020083

On 4/1/26 6:51 PM, David Heidelberg via B4 Relay wrote:
> From: Casey Connolly <casey.connolly@linaro.org>
> 
> The SHIFT6mq features an sdcard slot, add it.
> 
> Signed-off-by: Casey Connolly <casey.connolly@linaro.org>
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>  arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts | 44 +++++++++++++++++++++++
>  1 file changed, 44 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts b/arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts
> index 740eb22550724..c394350998c26 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts
> +++ b/arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts
> @@ -600,6 +600,24 @@ &qupv3_id_1 {
>  	status = "okay";
>  };
>  
> +&sdhc_2 {
> +	status = "okay";

couple nits:

Status should be last, although the file is all over the place 

> +
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&sdc2_default_state &sdc2_card_det_n>;

preferably in this order

xxx
xxx-names

[...]

> +	sdc2_default_state: sdc2-default-state {
> +		clk-pins {
> +			pins = "sdc2_clk";
> +			bias-disable;
> +			drive-strength = <16>;

All other pin definitions in this file have the bias property below
drive-strength (like the card_det_n node you're adding)

other than that

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
