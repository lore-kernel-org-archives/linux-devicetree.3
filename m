Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E83D0388364
	for <devicetree@vger.kernel.org>; Mon, 20 Apr 2026 08:32:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776673980; cv=none; b=P/O5JScqocYH9cfB2a6RmG58lvFEUgLpBCPtlU4Q3sQkUkph+niGuZ1YflhJZ4mmVNifzm9YcCDtRHG5DD8PKpc5YSHDCE7eWpqj9TPqhZ4xD8UusFjdt0SO5ujZ28d8M5WMLygOMfM9PnBBfWgChPIutUmIwOxVKQaaijaDe3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776673980; c=relaxed/simple;
	bh=xXJN7wNUIwVyo/iOBq582NYI6uG4Q07+NX67P1HJe64=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=L/c0xq5e2Od3kxJFgmhRmbJEIFhMYctomQYWOFBrYlI+piLzDfeCEePjww6x0vHWAhpc3D9XeIEw9vDrEsJno48vw1JoEtgKvYp/sQojAdvDZ8vVFtRrboItLMVkXp4f+erNSP881xDOLZ4oDqVr4u9k88kPrbHVVgwXLj2hH6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=f+P6rgi7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CQNNjhgf; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="f+P6rgi7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CQNNjhgf"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63K79FYa1598282
	for <devicetree@vger.kernel.org>; Mon, 20 Apr 2026 08:32:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MvO0uuWYdMUzqJjYcJ2rxcG6gv2UzRF/Ik/LfOP+nPE=; b=f+P6rgi7wQfhamgz
	H7VLlJu3kE8+xk26nuwyMMSlarSR0Ouvc6eRic53CUAlabK75pEfMblFWVzkNJ2b
	tQT8Bk2o8OHP17GIIqdfRi14A5CSDELXDVPFmpHGqEaUUTB9fMzFZGkbSrOhKN/4
	gXoIX5Tp+5n3ha4kY369RsU98Hg8B3+f5p2PbpVi7i7HerKuwM7qlGB3SBMMKXqz
	Wx+WOf/yaaKWhC9OE/iM+7FruPaqEwGr+mQdTPbfxCMwvEWvkfYowVCI3nNTGpFi
	FLWrDMlMmbzST0/hu+OdTUlbDZDKsy20e9LOFx5xX6craDkvzI8BwwPIEipYeTU8
	bcoMBQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dnfgnge8j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 20 Apr 2026 08:32:58 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8d59968444aso87171085a.3
        for <devicetree@vger.kernel.org>; Mon, 20 Apr 2026 01:32:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776673977; x=1777278777; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MvO0uuWYdMUzqJjYcJ2rxcG6gv2UzRF/Ik/LfOP+nPE=;
        b=CQNNjhgfHwrQbeSjttkLSevYsk06lh5nMzmjdZswRclwHUz5EQAYz0A7UKILoBMPNN
         MwBr46enWG2AeeokOo34Km1l82DUvttl20Dfs7b+J4tolm5vdSE10wtnkyyKKoDFVJt4
         lfAFjHQ+lMWnTMCHvRNmMy+MhwcZBSu4ASrUQt5MiIipXA/7DnqQqvF1E4heDfPUf5l2
         ONxO7CzopIc05lYFfPZtyQ2BJvC5Yv/Cxo0pQXmkUkQ6uhWX792zpBanSY9EoX/HhKGF
         dxwql/GeYY61CoitU0Tv2tia071l7MJna8nlYAcXtQ3i6GqIavZjDDg45Pv/gPKxlHi7
         DicA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776673977; x=1777278777;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MvO0uuWYdMUzqJjYcJ2rxcG6gv2UzRF/Ik/LfOP+nPE=;
        b=OrjByRaukubBIHjrGBtV1P+1TEzYg8YmP2iwfg3LM8+tRqXZy9Ah3OPsqxyA79TpVU
         wvpFBRoGefyQp1pp5Z3ayhWlG5f1GiUC+75sdXV4fjLJM6xqZ4rYpDZqv1V+M3wIu3lI
         kLSQxdsL0V77GudiTlVAuVnAfpExYjhrNLCpz800a2LA8trh94HB/b4agzKrESV0n5rI
         NIGmq9VqfjX1WW8gmw6gsuR/ywng1tXeNP9Whg5rLytCjzVFuHc6YNxuv0Z1tmjmRwfZ
         PEKXh/+GSG2XEYz8JlS7mgtbpBkorFqbVReF8KijJmMdV4bv4IH1xmFHOM9SbDQ4Oor+
         nvjA==
X-Forwarded-Encrypted: i=1; AFNElJ/mXidlDuqxm56kcDFrL65UTpiQ40JxRQu1EdSHtLcpb2S9cQKzMDr3hAJ8cH2dNLIuZki9Stl+TgBq@vger.kernel.org
X-Gm-Message-State: AOJu0Yxp19Pld9/lm3/oXkJXYsiXXJfNlJnWk4L1aSBW1hkojf7n2knR
	jWThBbKPWY3B1yFsnv5ZoGl/qTKVTJXanhQQADTYiMKDs0ZDbHMd06Qsc9lz6cbTHzCcYgzt8Dx
	tDQ7V47vwqRwxpFZ32Jzhh2nVlSEFLQyzfEmze6TdyEE4GO7axcHYH1V678U/JeEt
X-Gm-Gg: AeBDieviTXG7TCSAOQ5Wzq3LiyBU4UvgH/x4icCGdEzDsc8gH0vruHTufUifFwQumXU
	TCzcXJi+FYMm+etEHtIuzvCFdyz7sgEo1Zo9+w9e8eRm9UnVAt6aamJ1dO/UIFTXDL7U6Bx+CpD
	FGvIw1MquHegw2qPuP/LD693OWfjezh7uI2MbW8vhBxGSPGkMiB4lkXuTAbxheVFPL5SAHPPlW4
	vZk5xkP/l5fO6vpyUpRgmnBnmzfypFYAHGgMrJ9Ql4W6jytcI+mCjPqglwKdoLG3g3ueChf/ikH
	MJSfOu4112AlrA9Br0wm/EM1S3iD9HXmYxtD+f84JRHO/sfFGlnlKt/XjLtzbah0jrD81locyKV
	lUf3QjtaKDUmflOC8FP8duB5VY8vbXiL8BriXJ2Ul5nmwbU8GKC3Ue7i76iOer4L49BaPw3dnFk
	jqx/ktxC9wpmx7sA==
X-Received: by 2002:a05:620a:4609:b0:8d5:ddc3:a3ab with SMTP id af79cd13be357-8e7912c6e5fmr1241728385a.4.1776673977242;
        Mon, 20 Apr 2026 01:32:57 -0700 (PDT)
X-Received: by 2002:a05:620a:4609:b0:8d5:ddc3:a3ab with SMTP id af79cd13be357-8e7912c6e5fmr1241727185a.4.1776673976856;
        Mon, 20 Apr 2026 01:32:56 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-674b7639494sm658448a12.13.2026.04.20.01.32.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Apr 2026 01:32:56 -0700 (PDT)
Message-ID: <4abb1626-a0a3-45e1-9289-fee366a8d9f0@oss.qualcomm.com>
Date: Mon, 20 Apr 2026 10:32:53 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] arm64: dts: qcom: sc8280xp: add several missing pdc
 map entries
To: Pengyu Luo <mitltlatltl@gmail.com>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260419173251.1180026-1-mitltlatltl@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260419173251.1180026-1-mitltlatltl@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 8nuQaA08_cs6TCfqOatC_zBXdJ0wa-P5
X-Proofpoint-GUID: 8nuQaA08_cs6TCfqOatC_zBXdJ0wa-P5
X-Authority-Analysis: v=2.4 cv=TK11jVla c=1 sm=1 tr=0 ts=69e5e4ba cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=8suaKIpJtTEVhA8buzcA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIwMDA4MSBTYWx0ZWRfXxjDnbMz9KXAG
 EZAL8pgTFDvdTQVDjQgy7vtACGKlCfs8m3DtmTrMJ8L/efw5Jnsi9VCTlq+jGZwe1E69+9JBfxO
 5Kkc8svFHpnZSOV+zTPB6FvJokJNKNSACu2W+Mh33Ri7fBTWCWJ3MBI9pnWkQkMLmIcgrrvJd6s
 XU7xrDVWxFGMv5lf1Kd1ecWxoQi3bsl1of2lJZH2MshgdmzF5MzuF+L0heUMxgDDPfXJiQZDxI0
 kuhTBAGMltGA44MAOONElnhzb8j8KlodseTHeko4JatDy9NRO+5b3fdgvo7wxhTNn1O+ZKpfV+k
 uIdVhpzyMca20qLXlG6m8ZIDAJorxlf9s+rp/K8VzG5Bx1L6DHVOTqn3rOBrIzbQ/I+GQFw20j2
 HWcOdq9o9CucbKciHhJK9zWJ05WjJtS/Q+Xzitl96MBb+hErhQKcPq58cDsCc9wLWLrSlauoVzr
 0C9ipjX2VvRa6VjMeFg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-20_01,2026-04-17_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0
 priorityscore=1501 suspectscore=0 adultscore=0 phishscore=0 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604200081

On 4/19/26 7:32 PM, Pengyu Luo wrote:
> pdc 215, 256, 257 are missing, but we can find tlmm pin 103, 84, 90
> are mapped to them respectively, so add the map entries from pdc to
> gic. These entries are reversed from .data section of qcgpio.sys
> 
> Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

The below change on top will fully align it with the data in the docs
(no functional change)

(yes that's a removal of one irq mapping)

diff --git a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
index 761f229e8f47..23e80c765384 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
@@ -5310,7 +5310,7 @@ pdc: interrupt-controller@b220000 {
                                          <66 438 3>,
                                          <69 86 1>,
                                          <70 520 54>,
-                                         <124 609 28>,
+                                         <124 609 27>,
                                          <159 638 1>,
                                          <160 720 8>,
                                          <168 801 1>,
