Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3B963DB31A
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 12:58:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781096306; cv=none; b=HPU01JsV0MKt1Ii516OYmNXXmGErogvyx7MQ5qL8YA6tRDxEJX4qIcgqCTJo65s7jcegVN7heFd4iSmM3kQiNwcUffrQHN6V3eD1MYJTd1+zeTV+KbRny5oyK/T69G2rHZCYXqYmJm/E5D/k8rPhGPdL8XzHnOqQC3YVMelWrR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781096306; c=relaxed/simple;
	bh=BQcj21xyV8tXkcWtKqOgke5puur6EQll+RwlpA0DWuY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZHz0+lAAzQCXEMaBNdfFNhfe9cUywCGrlTYrjD5IFzmQR0AH57W3ih6MopeQMs6+nF86weIsMbHml49OxpwPQYqLF8vABo5p/yM3LxVWtU8pJpdJBm9gEvUaf3olP99I6YNCTECvga1JyZpxt/htNwrQw2UcmFGVFcQc7FZPFMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=G1bJQ2Lq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eWHkNcB/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="G1bJQ2Lq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eWHkNcB/"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65ACBcem3763299
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 12:58:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Z+VeEg9PrVmbu7EYdfim8Ahk5oC4j4do75SLwlniDx0=; b=G1bJQ2Lq1jHSs5Xf
	v1wmvcV3mS9FercPz/W0ppGk5HQLWVfpUuPRCgBJEajolDnCNFIWX+WErCc7vo1e
	9RFux9bjtrJKWanG4AFImSXVh3erUrhLG4xbTbX4hcNjAXM8ADCcJ4M13cLuowEN
	NhGyfehLcu1ntefdrgZ3AJqbObjwoPeKS1NvIs4aeMoPo9aYzMrnqkJJQX/zGa6j
	+olwv8SEmLT6yZ59V+96uh53IKbif4h014uFzPY0S50GaW9mJMcvIq8jGUcHaQCS
	9o00jmMRIMo7TvnMB+xi3jNGuMoXgAVdTmQtkdCM75ORiIl+o8PML4lX+c7WLhVo
	7HNXcg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epwneth6v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 12:58:24 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-517bdeceb54so8610651cf.2
        for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 05:58:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781096304; x=1781701104; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Z+VeEg9PrVmbu7EYdfim8Ahk5oC4j4do75SLwlniDx0=;
        b=eWHkNcB/KjtGFV4CisfwV5Y0TtpQeMMu5n75mCwV1UFzakFePWWhkLy3jm/ovfAEke
         LqBgZ7jfaqgEy6icKOl5g1fkM7LNPOO6obxpeNNT1AgRTFboMpN6hEehYAH93uLNKlAD
         6HijytmFCcWnNGQ1ZQkIHaDJr+DCEJkmfMEBdYPnuwrrEN44if2jkTn/dBztzIlDAAOQ
         xE6mFSQ6lG1abYpubi1xuGQaVQ2YHkqV1LFGt12pQUWKv0y0seTO7ip0Eg6C7LlO4esp
         Hy72TfYpI/awr3tZJRvVrpKjkV86QkfJ3apch3eFVGjyVpZ/RI24RoLO5I/PIO/UZ444
         Xouw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781096304; x=1781701104;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Z+VeEg9PrVmbu7EYdfim8Ahk5oC4j4do75SLwlniDx0=;
        b=HtZQFLHXnZdEErPPQy/dUE/p+ESmDBDscFl1C3T3OPc4MWQ72ZVOCFmMOhFoM9xLvh
         CU327pV2cb0+ZQA9sZ+I0RZD9Q5hGaKVfLI0t8kLhW2dOSUOwF+NLPB+N2iAXdKMO1sa
         VOU2KJUJHEUGcsCaAWqsSilStN9rM/HvNoHE/oIE3GrYl/GEGxlvOQfXnpN4DAjhgRSy
         bQqXUjhXR/Toq+DHBW4xmh4fIgZoxT+giU6fCPo4Kz4wsyHC+P0Qhq6R1uveyyuHX8X+
         vCHWh0oG+8AAcgMPn9mkXrVHaz30tnVb/AiHJ1fCFa9z3volrgo/4aQREX4nt/SdnauG
         wG6A==
X-Forwarded-Encrypted: i=1; AFNElJ8bBACbJvbVVljaKIvh/7Mx0wsQTMmt82RDdGWXGZ9lip61d6hIn0aT2uY93NlKqRPJyeC982ya0tRj@vger.kernel.org
X-Gm-Message-State: AOJu0YyHzvsj94KqIWYPeQK9ZEr4KCHMdV2HBQf76eqCJKan0NxVuifR
	AzOnc+B7NhXiBj57UVP/dcHaQqdlaWHDDpVJWyQKYw0x76Dwg+7SMmiiyB+5CvRD7Jf6ryKqcmM
	F6d45kO2H/mriZYXBfa1jKsSRU8p/l9eMeVKIo2wPYYzGMV3rXQFhHAPoUWPPjBw6
X-Gm-Gg: Acq92OFnrQdmhw437RRx+DB61GKczDcZE1hRWWAv7iPIlzZMHVK9dhFAMbGwVIAhinj
	mwls6rMEfCK9dLRqRPtMZujxFlurxyEAhbecjaA3ni4KbE3FajHkmlb+wUzzBSamOEbmiGPUrjg
	Ze5k7bR05HjVcfaTBmK6FASTHjkvC9FLJATsDbhmK7GDwftHDVqz2WURfXXLXMGLpLVxzhJT1bg
	FImEu2//azAPIFOv2kpXntosK2Wi190nbOu7BW9CHvZ7YPOwMriUcmB2CFpUTAofxajsbQDuev9
	D3+PloQqvLV2JAhDbdPD2RWeojTaiHfB+M9z4NzGoipwXpLeEg8Kqlf2TValEtn/OEAygkPfgl3
	FTZ3Fs4AqWOTzFA9Bh6hvYb7MGi4yHOa0UPsjstwNGUo1eDdfwicOx6+q
X-Received: by 2002:ac8:7dcd:0:b0:517:8999:6c50 with SMTP id d75a77b69052e-517ca4855a0mr69196101cf.8.1781096303912;
        Wed, 10 Jun 2026 05:58:23 -0700 (PDT)
X-Received: by 2002:ac8:7dcd:0:b0:517:8999:6c50 with SMTP id d75a77b69052e-517ca4855a0mr69195761cf.8.1781096303478;
        Wed, 10 Jun 2026 05:58:23 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-68e65867e67sm9878704a12.21.2026.06.10.05.58.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Jun 2026 05:58:21 -0700 (PDT)
Message-ID: <39228ace-9404-4ade-bcb1-28e763548b7f@oss.qualcomm.com>
Date: Wed, 10 Jun 2026 14:58:19 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/3] arm64: dts: qcom: Add Vicharak Axon Mini
To: Ajit Singh <blfizzyy@gmail.com>, Bjorn Andersson <andersson@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260607113658.25117-1-blfizzyy@gmail.com>
 <20260607113658.25117-4-blfizzyy@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260607113658.25117-4-blfizzyy@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 3zioBhsnnSZiq51CGVCBZY6LE5kW1v_b
X-Authority-Analysis: v=2.4 cv=ebYNubEH c=1 sm=1 tr=0 ts=6a295f70 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=pGLkceISAAAA:8 a=gE6viRo3Ne1LwXgZ6bcA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: 3zioBhsnnSZiq51CGVCBZY6LE5kW1v_b
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEwMDEyMyBTYWx0ZWRfX7JNaNowg+l0y
 RnXFGn/hJXDUsxpKSPnyuQU5ZlTscfbzHskJYr4I53N8pqFc3aMPeHkvXYjQ55UW36u1teJi9V5
 J1Qw7Vek98rU7hoqgosO+oaX4HhGwpEhcl0TgIvft8ujyl3epFWzSGKSyoC9EvQlfb7TjkdYP/C
 KEI5Ove+oWfuvVBMwKZ7gbYmRR6r2oeBSWjhOqcjHiiMSI9HB8XXj+ir7UT9X+uD9GkxpL+bOFT
 A+sNdc+xY7701C7fUGovyUHmcFmkEf9x6AFpUrnWQ134mQ1a1sPbqrCWAzX/8Ok7xubpISH+orY
 aZcRLGMifImkBUaeoC1+0qKH43dUc4mxQ4mIBjR6xqkIb36r3UWWXixwpRU1E3Mgp4+xzMrL7CW
 0nLt92JTGXCmLNQ3MwhmXiwbrRrK+6FYecmD1OnGMMDToxkOlb0afKH1LtUoYuJfK3FzVWqNHkR
 7SJCaFhNyeKqem2n23w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-10_03,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 spamscore=0 bulkscore=0 clxscore=1015
 suspectscore=0 phishscore=0 adultscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606100123

On 6/7/26 1:36 PM, Ajit Singh wrote:
> Add DTS for the Vicharak Axon Mini board based on the Qualcomm
> QCS6490 SoC.
> 
> This adds debug UART, eMMC, UFS, SDIO WLAN, USB 2.0 host, PCIe
> support along with regulators.
> 
> The UFS ICE block is kept disabled because enabling it currently causes
> an SError during qcom_ice_create() on this board. UFS works without ICE.
> 
> Signed-off-by: Ajit Singh <blfizzyy@gmail.com>
> ---

[...]

> +		vreg_l12c_1p8: ldo12 {
> +			regulator-name = "vreg_l12c_1p8";
> +			regulator-min-microvolt = <1800000>;
> +			regulator-max-microvolt = <2000000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +
> +			/*
> +			 * VREG_L12C_1P8 supplies the Ampak WLAN/BT module
> +			 * VDDIO and the external 32.768 kHz oscillator.
> +			 */

Sorry for the long review timelines on the previous patch, many of us
were out for conferences..

Is the oscillator used for that WLAN module? Would you ideally like to
be able to turn it on/off?

Perhaps you could get that with a simple pwrseq driver (+Bartosz)

Konrad
