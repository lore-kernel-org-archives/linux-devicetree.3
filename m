Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D5FC4DEC2C
	for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 11:10:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792408238; cv=none; b=h1nw72+/810qrxVw6dGbqrsOm1B2JauIy+T6zD5uhoVTLmSqefmrYY+emLJZymppiE4OFFEbmukcpZY6rqGG/FyQg5obvy0svPHCQfT2Um5xh2Kj8CV3hD01cxIGv9YOUA9S6/4eSS12/i5gb8l3naqiIFlsGJqdKeIPOeBCLi8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792408238; c=relaxed/simple;
	bh=eLQMV4NI0q81zowtL7rae7nja7cb7zg7erllZqXWpA8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oPjN6ZIevKCccD+lNaNWcDyNCmxCCBWw4spf7MnYQIBsinuQx0bPFuXkgZYxnsLWgMeAjonr/AU7J6+XG6J93SFJhwhTNy77gIz7iquv32aF0myM/fVWxdQPttmY8LouDL6WOSXVOMxtSvTeer8TJjII16c4r6wrK9MAIaNqHkY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fIvRQS+W; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RCVsiV6b; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fIvRQS+W";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RCVsiV6b"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69J8P5jx1896523
	for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 11:10:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eLQMV4NI0q81zowtL7rae7nja7cb7zg7erllZqXWpA8=; b=fIvRQS+WNTQUDsmm
	qGhbkBQxjgT2ei53rLtGJjs34jn1NgtcXRMimISptvqNAFANvFnG/mfoBilch3U+
	oUzJiR2s9MFaFVEciT3WW9f9yspFqZZ/c96u5P/I8UoptZuJlBN0yIWONS0a6YdG
	8M2XepF5mujsbIcAzggQOxq6jh/XkaRhduBdkPUg39RzaL0pbqlPuZeQeSm1VzEL
	zZfpNgb1V+ppPh9y7etWznBo9/MK3q2c/CUNbwRomOT2fS12O+27Qy3ery++wsq+
	3q1RIhxa9PqLtBtCS/Mua3wEjyMd+qsWnfV0FNcNW+0EkBxbvrKyMZxBUTpZdaTw
	oNljvQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdbvr9jmy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 11:10:36 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93ea6b66e53so34529785a.2
        for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 04:10:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792408236; x=1793013036; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eLQMV4NI0q81zowtL7rae7nja7cb7zg7erllZqXWpA8=;
        b=RCVsiV6bAucELPyea3z8I+O7mNMfG+HhkXN/TuI5et+AdSyYF8J6DN+ZIFaeLlAcli
         Vb7ym+hNwxzyE5mVDE6OB9g2NtzT/h8AwztvULdpwbS+lkX6J7xmxnf8qExsJqwtcsqA
         eJg0cM3ClUqVZf5J69X5gyvAhNMxqvhXtRQ6PL1GHnXpeUc1Gv9MX+mFdoNv/3jUaxjN
         MT9lNzKPILCxsJpv4AVZR+0PUsltec5thrAxeRiv2Zc3VagVnNBIjOCrjylADjjSIfr5
         C72l+2F5P6a1cynP2nme/ta2vssve2+RrpNzMeR6xcP68L9PIIOz8WYi9wKpsylZMnnS
         HNIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792408236; x=1793013036;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eLQMV4NI0q81zowtL7rae7nja7cb7zg7erllZqXWpA8=;
        b=ttHUwrVG4TBCHkjwdoOCHmlW/Lm4G+m0FhoD1/IwL3YWY3tVFyJm3kO6XJvxxB93x1
         2qo198URcypOhRgx5SO4ic3TBV7/3jSIvJiQ6QroSU268wMNNOMpkXQL7jwXTlneT9cx
         Kq3WpXlIzx1Xe+WDwGkrg6OjjWYtvjuNoRfvcUL/1I9HYpLnbO3IhLj6qYOZPLss0+bD
         zSibYx9ocwHw1OKXqRy8lV/nWHYZxubMDxRE6IylZTx5d+SPnixSIeu6QfU/riJT63L/
         osIObIBMIu0aXaqbrDGYs5Pprquud+SGbuehp+m5ioSI7wn822bf2eDF+mAwE9XbDOyZ
         TFzw==
X-Forwarded-Encrypted: i=1; AKwUvByhBt4UGmpGVnI+Cl1y3IgN8KmSQsh5Nb35ztvWGg1CUylt/vVYup3IK4BZTc1JSMV7XZREENLCLToH@vger.kernel.org
X-Gm-Message-State: AFq9FYK8s81R3csS3WnOb11IP7RJgreBYQSA5POW6bYAfM/Gzl1OrDSH
	d2t+YZFwVJPv2IMSLkmq83TfeXn7eumAtsrs0xiExVWgwio6smdF+7VwnYLHILGyJtT/LeuVbec
	8v5mJ0ocyXhEcV4MK0QbqvirZGBeZYwd0j5lidcn28WmX8RN9+lUcZKNihFHkd8KU
X-Gm-Gg: AYBFou3Z8jp6bc7BHd+RRoMeWXjcqedhBbtTu5DeeP1AfdkifOp3aNYdaFQoiDQg+3M
	siyoNr663n1wVsILEPPgVPT/bZxMsft6vfCwZwft7l2NAWjvjQxah/EguUFNOM9YHKLbNPyyrx3
	5QtUk8gcbu0oDBXRhsiVbfgzf1IAUtXHEC3QuZeP4nKQawoZ0Db+a12Kq1nk68NzNn1Lg9bhaOz
	ALm3FgUmSv8gItp4ib5KzGaAz1x3eUjcUd1Ixa8ACVzkEDAhEpVYMxTMo7OgMkbAOuPWsRy5Y/6
	uM4ysQtpQPaz/P3oyJtC50vUhgD6cab1v8Pnt1O7In55Gf4HmtIgt/qQ+oUcAwWunZxVLYh9S4Q
	DCArPTqdK2xX06davCiftag==
X-Received: by 2002:a05:620a:3904:b0:93f:977:5d9 with SMTP id af79cd13be357-93f29a13be3mr1306150085a.0.1792408235697;
        Mon, 19 Oct 2026 04:10:35 -0700 (PDT)
X-Received: by 2002:a05:620a:3904:b0:93f:977:5d9 with SMTP id af79cd13be357-93f29a13be3mr1306144385a.0.1792408235247;
        Mon, 19 Oct 2026 04:10:35 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4091eb39a3sm348351166b.81.2026.10.19.04.10.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 04:10:34 -0700 (PDT)
Message-ID: <be076bf7-52fa-4c93-9d0f-46a8d06ae920@oss.qualcomm.com>
Date: Mon, 19 Oct 2026 13:10:31 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/9] irqchip: irq-qcom-mpm: Register MPM with cpu_pm
 for RPM notification
To: Sneh Mankad <sneh.mankad@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Shawn Guo <shawn.guo@linaro.org>, Marc Zyngier <maz@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Anna-Maria Behnsen <anna-maria@linutronix.de>,
        Frederic Weisbecker <frederic@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20261015-b4-shikra_lpm_addition-v2-0-ac7f1a0d5638@oss.qualcomm.com>
 <20261015-b4-shikra_lpm_addition-v2-2-ac7f1a0d5638@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261015-b4-shikra_lpm_addition-v2-2-ac7f1a0d5638@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDA0NCBTYWx0ZWRfX6kHAV1/rbudx
 yQvCImPsSX6yCJ8VId2o4yiDXS7q0hGExYeXIRjvOzZpty2w3i71t2Eh7BPsPkUuIS2DOHDMV+k
 /Yk6Pp7/Pgm/o0x5Bod/6OcyJ0LfM/jB0e6xYMRIQTi2D1auizc/A85fI4cK5oXpZJLPA3BiMB4
 npKpBttpgcQhoXqjc5Tyr4nPY+/YQTl8uJfy6GTxJqUC8aBsmaZfTvt02eVpa8vmTaD7R2eaByu
 In85HLEdyBdtQmPBMywSD2KDMY6RgRFBkKLbPtipkpjPePk8GEzBIjP3lpg3r14/gsVXIhylLUg
 rW0QwTGtNH9qJBx4KtYxiRwnI/FV3LVPyMHSEsBct8CiIuh+/D63dOVYv9dvadJrLdZVjTZx+QU
 oNJm0keV300VJFQade0fHJt8tHIcj4Nrlq++6CHGBu+7BziPAq4wrnPZZ6hFsmzxsY7NDuvmvFZ
 B/o/yn2521RXrqNzdsg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDA0NCBTYWx0ZWRfXy7MLWbGuAoLQ
 I3xvlA03e7qsdYVSmCtejJMQTBPaM6D9l1iDPhpT52XAe2mHOJgcNubcHHGciB366Ev5WAbqhqZ
 ZuNpiQ6OxEMldEFnKrUGSheO9inLnnA=
X-Proofpoint-GUID: w6KjlFetMGKwOb9PmDwp_CA6B3sM5UXM
X-Authority-Analysis: v=2.4 cv=K/+3jCWI c=1 sm=1 tr=0 ts=6ad5faac cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=qE2Ob0BFYF8f0NDtHPsA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: w6KjlFetMGKwOb9PmDwp_CA6B3sM5UXM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_03,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 spamscore=0 suspectscore=0 adultscore=0
 impostorscore=0 clxscore=1015 bulkscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610190044

On 10/15/26 11:55 AM, Sneh Mankad wrote:
> MPM irqchip needs to notify RPM (Resource Power Manager) processor to read
> the latest wake up capable interrupts when the CPU cluster is entering the
> deepest idle state. This is done by sending IPC interrupt to RPM and is
> implemented as .power_off() callback by registering MPM as parent power
> domain to CPU cluster.

GPT suggests to register the notifier later, so that if
mbox_request_channel() probedefers we get a clean unwinding.

It also suggests to skip pm_genpd_remove() in the non-legacy
case, but the API tolerates nullptrs (although it does return
-EINVAL, but we ignore the value)

Konrad

