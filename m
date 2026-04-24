Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C36982139C9
	for <devicetree@vger.kernel.org>; Fri, 24 Apr 2026 12:11:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777032721; cv=none; b=KFDOY74CCTYoyyRlSdIWg2Rs/f5gGL5bJ6Kfb+RA8nHdYiEBYvSxTOLZlwCI2q6dZH0YfiBB6JzKLfPdn+/jBQIdkH7U6GOLIKWlJ+1wq+TBLfizl4PcSFyX5xxfik4WE/R2IV6izjLnD56ojVbmQQCl+qHbfRTUm9FUNekBLvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777032721; c=relaxed/simple;
	bh=H1Bq2JCd/loHLBUg6D2e8MYj9Z1jJAKfSptt326NEw8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=d5rR9vALwg1E+ZpYOKbwY5i65DGnQEeLNgI+Yu0dHc/j/9aNHBIqq5sLfSWJ7rpmlAU/sW+3UEpHZf+sqUWTScfko6gZo9qpMyrofkaUypPnZb9yZyREW1AnM8U6KLLFmVPusSRUy5FnewiKCHVRIi1RrnYkjqubApIQTNZtEkg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gPHph5Om; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hL8T1SJN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gPHph5Om";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hL8T1SJN"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63O9ANdw1533272
	for <devicetree@vger.kernel.org>; Fri, 24 Apr 2026 12:11:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kxwXFmbu6qnj8uhNBxLJ+V0C+GzpicEK+P3K4wNFbkU=; b=gPHph5Omzw4vLOGt
	bENFkCA2LJZ3qgd3kXQnydDzLRpg6Gj/afKiXPs/RjW5cSjPmKv6XQchB9gRjFS9
	uMFg0dkt/yFwZyNT8xbrDfjhnXvOXmj42m2KSrMaJ6BfnR5XE7oCINcRKgu47wOy
	FL5kO+hTeyF1gZsRjce3jZp5KZj6Rp5MFpZcFPOVGjB0OdsPlaYfW+3wdFeu0Zzk
	z1zTzjTawWOhDypgjGUN3/gvIOQVMoNN3zYKUcewx9GtJVbH+pCWwdKCSiK8IkiQ
	sht2KT5S1VhBl2QFJnsMWoqEk2gSwFQgCkGvk1+b3aZlMflf3wJ0Rf4nVXYTWYTo
	OBHHXQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dqr26m3kt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 24 Apr 2026 12:11:57 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50e429ba4dfso12192071cf.3
        for <devicetree@vger.kernel.org>; Fri, 24 Apr 2026 05:11:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777032717; x=1777637517; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kxwXFmbu6qnj8uhNBxLJ+V0C+GzpicEK+P3K4wNFbkU=;
        b=hL8T1SJNuqgixFgsuHWy6H7gajkDStQSjkAW4fMFYcVOK4fcF3+tuzcVMJ/xoWSyUM
         z03W95A1wadgUy4ApasO/mHAUKzJvHgXK4q/QEXudkyivIFSLp42TlstDcX9Jhp6nBLE
         zCBaaI5Mvgl5sNl73v+tsxeckeE3WKR4kX2sUuLhhAH0JIUVcgO4wfuK5gVxBCDK+0ep
         e97QGQ9hTWjxPeEEN9504hbAqx6qB0hjFJ6Jtdfrj/+J3FEc3RYPX/rlwNe+zDfSd/8z
         IL6J5rovCTnQD0RvpZfWviXygoeIYoTKCxg2Cz6EF0DKGTEzOTvyF54aE/GWVmCbkJ5X
         XUIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777032717; x=1777637517;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kxwXFmbu6qnj8uhNBxLJ+V0C+GzpicEK+P3K4wNFbkU=;
        b=AE0D5q7t5er0ad/QNG5K2cNlkanZgX0xIqArGxekEikD85FV0S8jvvyLSFFRuMFQpo
         aquCK/4B5NRsqk4qF0b6NGQB2A5WBBYacsWFx952CoXzi9/iFnhdR4EkAa2WgqDfuFuN
         w2Aa7IMr5T7ixa1ecZrigX5o+patgz5ncE2HRcOcpZuXHYLP1taeeVmfSfm+9cPdLmcp
         ewgUazIDlPBU3rfxaqJfskYI8IrQwe6N2saNjJoKX+pcNSg8RnYST98OnQ38HRHTHXJK
         jAqlk4gYaEqWjGoNzWHO3ERCv/Ecp35ZeMz8G9huc7f52cuWiKaC/D1DAD9wxRCUuf3N
         lOGQ==
X-Forwarded-Encrypted: i=1; AFNElJ94/Ncjp+Om1aHpM3hnB9XPCMWvDFFlsAgSA/pPct9HbhDLn1t9H1ZqKv474bvfaHLV3L5GiXp6H4UI@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4dBBzUECfbwHxMM58I+G6lKyQUzJqoQhvs6VItWjNRH3/ccD8
	yyGbE/r/d9fUf+H+L8f9S5C/y/giUwN37DtpiPfAvmZmMNxCdvlxIqL+nlubTk+PGgHeaCQ5jsZ
	z9fRGv666RuhoPsT14k3uZlLKSqDRm3zegJu6LgnpSXs9mxNLlxbH837IF8A55MwFG6gcGAFO
X-Gm-Gg: AeBDieufytc5BCDFxfOnn3AonZw9E0/fLX1TY8znY/P3ZOEBMhTCuQsXl83MHGTx7L9
	flnNNFT457BCdR1QZpMDcrCbHKGcDhmb95eRnvS6R1zvaRC88ZTVP+0SvhPmkN0TL8V+tFeBHjN
	EPkRjBiVbehBorkefuJNod+5dNMsu6gGKJcaNPcjrgPP1RYjKkb+zFuewRscnja7gjnJYDtXwjZ
	ovA1bgNEUZ30z1pXLrEMaPQ/r+T4nAbFi10PBb77nY601/5z7gd3bexHBK5bwLw4HrHAufgcDKE
	mmXGaeO0lBWbUBBZOodq7gPchflI0QcEalUQm7GTjaOMuZ/O8OaUj3bCLDkxGGry/SJREF7f1XV
	tASv+gloOr88lFK6zbKgYVSnZdzdFLl2Ohcu7g0WTwk7kVuhsr2no0Eh8ZNSwbKAeOmixxk0pQ0
	yCvyYnAuavmCs8Rw==
X-Received: by 2002:ac8:7fd2:0:b0:50b:3489:5495 with SMTP id d75a77b69052e-50e36c9d407mr324193121cf.8.1777032717096;
        Fri, 24 Apr 2026 05:11:57 -0700 (PDT)
X-Received: by 2002:ac8:7fd2:0:b0:50b:3489:5495 with SMTP id d75a77b69052e-50e36c9d407mr324192511cf.8.1777032716532;
        Fri, 24 Apr 2026 05:11:56 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6743fba7321sm4354260a12.0.2026.04.24.05.11.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Apr 2026 05:11:55 -0700 (PDT)
Message-ID: <de40fcbb-f5a9-460a-b9f5-482b0c245c4d@oss.qualcomm.com>
Date: Fri, 24 Apr 2026 14:11:52 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/6] arm64: dts: qcom: Add AYN QCS8550 Common
To: webgeek1234@gmail.com, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Teguh Sobirin <teguh@sobir.in>
References: <20260408-ayn-qcs8550-v5-0-c90abeb7a152@gmail.com>
 <20260408-ayn-qcs8550-v5-3-c90abeb7a152@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260408-ayn-qcs8550-v5-3-c90abeb7a152@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: xsVahZf1nzOeFjbVFWjQ8nQ0JyjNmggl
X-Authority-Analysis: v=2.4 cv=QLhYgALL c=1 sm=1 tr=0 ts=69eb5e0d cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=pGLkceISAAAA:8 a=ExZjEUzYGPi_yzd-oLQA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: xsVahZf1nzOeFjbVFWjQ8nQ0JyjNmggl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI0MDExNiBTYWx0ZWRfX6x6PlX3Cf4zY
 LScoA0ELKUbv1PqjGQcZz/p5tq7OR3BCI/ysxSYpLb8F+RlPfKXVy+rQC2LESoWBwqu/HhaVruZ
 BCoAaP66Vh0r1OpBJ5iNXCzoupjkU0929j6H1RBxA1JmulfEbV+FpisyI/RXzoXLW++sLys6RdP
 SKFJoVCfOuVliO162HuWBo1LM6ZEOTYWBL+IEeo/xfQYsvK47GNPA3wo68aR09fVC1SUKP1opiz
 6pbGcOVThs2ynsFWLfHMFW5FfX8UaswmgYuvJMCBJqkpPQVN6XRth1HwpEVd10l2sVQDOxrqm4K
 gYMJs/3Vkyr1BnpQmqGodzPOsbta+9725wjg901axffBOtfdM4fd5kMWedbWd8DXLOJtLdkmJO0
 J06DHUnk5i4g5P3uNGmSyTp31BPwrQ2uHFw8YDzP81NFjDXVDfWb6Y+Nf6OHNUPeWlYzTLKbHa0
 xzuK2XdrYf440yiOpvA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-23_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 suspectscore=0 phishscore=0 bulkscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 clxscore=1015
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604240116

On 4/8/26 9:41 PM, Aaron Kling via B4 Relay wrote:
> From: Teguh Sobirin <teguh@sobir.in>
> 
> This contains everything common between the AYN QCS8550 devices. It will
> be included by device specific dts'.
> 
> Signed-off-by: Teguh Sobirin <teguh@sobir.in>
> Co-developed-by: Aaron Kling <webgeek1234@gmail.com>
> Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
> ---

[...]

> +	// The tzlog label is required by ABL to apply a dtbo, but it can be on any node

I don't know if the policy changed, but I think C-style (/* Foo */)
comments are still preferred

[...]


> +	// The arch_timer label is unused here, but is required by ABL to apply a dtbo
> +	arch_timer: timer { };

ditto

[...]

> +&pm8550_gpios {
> +	fan_pwm_active: fan-pwm-active-state {
> +		pins = "gpio8";
> +		function = "func1";
> +		input-disable;
> +		output-enable;
> +		output-low;

Looks like this should be a regulator then, probably?

[...]

> +	wcd_default: wcd-reset-n-active-state {
> +		pins = "gpio108";
> +		function = "gpio";
> +		drive-strength = <16>;
> +		bias-disable;
> +		output-low;

no need for this property

> +	};
> +
> +	fan_pwr_active: fan-pwr-active-state {
> +		pins = "gpio109";
> +		function = "gpio";
> +		drive-strength = <2>;
> +		bias-disable;
> +		output-low;

likewise, especially since it's the opposite of the active state
defined in the vreg node

[...]

> +	usb0_sbu_default: usb0-sbu-state {
> +		oe-n-pins {
> +			pins = "gpio140";
> +			function = "gpio";
> +			bias-disable;
> +			drive-strength = <16>;
> +			output-high;

This is probably not required too.. unless there's a hw bug?

fwiw 16 mA is a very high drive-strength - does this come from vendor
sources?

Konrad
