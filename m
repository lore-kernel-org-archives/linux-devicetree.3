Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794652480;
	b=kKno+QCi0ZTvBTj94cXDKTge5Hl2xCKx7DVnDs+FFPRR74JsXCvOOge4Yf2eZdjqKFtD
	 SyA9jcFiViA1nhKUhGhOnE1ek+qVfTMjf2Burb2TRoqOqG3JmIUWg1jOXYrZ8M58t5zKm
	 2XFrk1iW9PhH6FQLzkyOtk8cC7/kf66TH9DhiHNy7SDgn3jts0MLQqya50DeSg2EkKRjB
	 dnLVRMeALFCv6xnB8qopLGqlr8ZvbeICYJAIZYFgAQgyRr5vJub7+35FdBxELRyMLkobG
	 xFCp5eh9SHh4lBQQVofRpuw6Pp3gcL1C412CZQo/YSmKlEHeKNUvXz+uj+zWQa1skZA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794652480;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=Dh7Colfd+Fpplt6I89BdRicnbNHfXKnIWNbhbS/Qr68=;
	b=QmL5vnX94pHlvvgnNcDGv/LO1yRxuCsZVkhEgm5gN91nkX1hr3I8LPD1mWl7CyJsypOI
	 somwzPmkhXULa5egabbq0QG6dKjyKHJIdJdoaoyMNsKgFsyISmD10O2NRQLnuqRpteP7G
	 3MfhGY47kd1TQ0BAmScolKX4cGxHxY/63h67Mfxc0Z3N2svrJs01+JULBUsWjH8cYn8T3
	 kOU2A7hczRdd+7yWUNh1BAJlPBoNeZwGcJvu8PAG4r/vcGYWS99FMGje8xdrlWGDCpF3V
	 5hIuJax6njKoIXAd5SkrbD5E6PP7N3J37cEjjdLTPp3TFih7JtCryrZI1FUnTHi68WQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gxYcyGch;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="E3+SG/RJ";
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C7DB606A331
	for <devicetree@vger.kernel.org>; Sat, 14 Nov 2026 10:34:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2C7DB606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gxYcyGch;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=E3+SG/RJ
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AE9wXGQ1750559
	for <devicetree@vger.kernel.org>; Sat, 14 Nov 2026 10:34:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Dh7Colfd+Fpplt6I89BdRicnbNHfXKnIWNbhbS/Qr68=; b=gxYcyGch9+cPb4FH
	n98Ykn7pArnMkE2S4TViKEWtLROj0U6F+5LSs2MypMrJ9piRF6B+uyk9zXP5jDmW
	xotKFL9aJnmtl7IH/urvnpgIsSzbraNwclKh5Z7YlRdTcVdgOfLx/n1Qw9KD/AIj
	ppqANTaaq3U66TUbjDncG51BXDnjOsNfj4TMJoE8ep6l/46nqH2sYjtQyf8eg3VR
	0ns1BP+RrdUeGXjY8Sq3h8RR6pIyLDl7RcBwMM1feabPnWfhA2hXMnzdoaRDljFM
	xB3Ivpy9eD4KqFJ6pfjjlWa/5uuwotNXgxw87TU5+tE8CI6yQrrMcJUd4Ev16GNH
	hJukdQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxhj40hvc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 14 Nov 2026 10:34:38 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3b08364cdc7so1358364a91.0
        for <devicetree@vger.kernel.org>; Sat, 14 Nov 2026 02:34:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794652478; cv=none;
        d=google.com; s=arc-20260327;
        b=XzV7xIeRrikKzqr/HCiVX7I340JL2SZkWbO1nUJEuclrLV1jzdldVxRKeVWPuhXKi5
         awklKvsEk30GLAhYSHBMhKffR8Wxlu8gbSKa0sjwdSFX2RRa42T/RrP/AtLO6OfCcDRB
         IuG/+02lWOzUWHodWhZtoN/9vBK7ymEqBAkrG5jRWN0MMHFcCAeOH8jBMZE4eGjpiU26
         tgVCnVTt1r6my4K22/KWevknB9l2wb06JNuDJOQXyutZDrN8VnIfeSP87vWL4Uz3Hlt/
         ODvgcI4FirMa+0a3R9qy0EIHIGfGUw4AirfHnQA9JmqWRZIqo5P61ONAURVkHOcEuc8X
         f8uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Dh7Colfd+Fpplt6I89BdRicnbNHfXKnIWNbhbS/Qr68=;
        fh=d+jnvR25QzLlpijTrjlVdcHVy6heExUZpmyz4TqQItU=;
        b=CTpMu3h8RTDQ++SxLtpuaXHBbsMD38u4+6p/2CHHlAxQnK15+oZmQKnpdg9m232njv
         imAsSgjk/f+Y9awr7ZndZn3husiD8uX+V3s5XcsrIqm+N3n0Dg1oYEsyowLOM4q60hd1
         ej3t8MI98VCz0hLEn+vJsi+4ea+5FAJ+UgfzAy5Hs0WyquRzKHd7tKgwx2LPc6UlaY9N
         0wy6zcPu2cMgHpFwuOXRnd+h75SV0biywV4NynvERsbwgyJx3axs3cyRUE+NtnGlDOki
         TMlW39wBDbnZB6PiwJYllU8OpVUKJ/jF+12Bq2z6wrAVw8r5t5xsqdc2qwjkAEogDq5c
         m7xQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794652478; x=1795257278; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Dh7Colfd+Fpplt6I89BdRicnbNHfXKnIWNbhbS/Qr68=;
        b=E3+SG/RJ2JxmlzOHIO12KV2I/S6Ei/aMtTZaHQLrKIBfLF4IJNhHoiRiJVKgcVUxD6
         CHw3OtXcIBFAkT7V4cZ/L7L6//1MyjhstIqWaN0hr+riCXY5OFIjuQ6fFZsGRQCHetg8
         9/CEPH1uiyeSzWqp/6WhBboivlLJG3/LMmnxtzrQ6Kxr9rWU2NEl2mqjLB44Md85OMKV
         HGK8D1Dpp5qT5OVY/wuoAQYdJLyGmJABOp8f3s6EWrTqB7NTEJc1iqhLqRJCEVSgD9AW
         nUbD4MgAB31VM0FL7b6bi+F+pXXuA0/TG1stGLMxsy1nD55CNYVtpUFJ4v54N50lA1g1
         CyMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794652478; x=1795257278;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Dh7Colfd+Fpplt6I89BdRicnbNHfXKnIWNbhbS/Qr68=;
        b=GlKTARXDcBbMzfCno1rh74vHoAYy1nzJkYjdy2O9/XNrOCQXt95kFZQtYVm61CshWy
         za3eHU/HxFy9mMXPVM/vPJpwa860MPjXQ6f4Yz8hn8/JM+/zdDShnbX5pX9selwNKLsB
         XDPHZMIgFCmnMbgTmSjTSX+eX9iMwdwN5h/12HEm56LxR+LRf4rEMf2Gipsfx1Wpv996
         fDnEYLktdbyO7KQrowC9RodencCEYNg2iE3PPdMp+JL6Z/Agcs+286dEHUKYe7oIn754
         2YKIWCwNtIsWs+uuYBdXmAVnFWIEBuhtFUR+Hgs9VSoTHt5Lq9vocRbwBAa32PNuBOd3
         l54Q==
X-Forwarded-Encrypted: i=1; AL+hErF80MCGu5Q3QYgtlv+uAaAr+3ZvJNbE+2yaCr57K7DuI7WG5FzISnyIjqTGo3DX7HcX0YZb4u7BRQDF@vger.kernel.org
X-Gm-Message-State: APuU4Z8wF/6bcROMdsFAGBUFdtL/pJ55wueJQs1wg5pIfhc7bUZJJeIO
	DEzg30wydH+xlFkgRgOVbdOQJXScFX7LSEjt6dnTeKceyU0bRBOfc+IJfSwxR7WVGgv1P+WGEIa
	kQ10l7L2jdjb3vqcBt0lT+zr/m6FISsVD3tm4A5Od0n638Dpn+EnYW1SynroXdG881FDQ35yIQL
	WfQDyOc4HKCmoHUIb1qH9JfsHOFXRs+3n3YArNmaU=
X-Gm-Gg: AYBFou2LtWIM2KJdt3As5IH9FJfyZrzYSUOAM8m7n+5zxooI01747LytwwfLSmwJQu8
	aOHUIEe1pwSZ1wmOLsvAaxG42B90iHNEuK3OUdZyKQdbK3dOu65a2s7IeK4JrGpdO00+TLbrB3B
	R+5rBKCePbMSGCXyaGxlmUArPz7InN29nLtTUm2b9ofbDjRdStPGw4gyksjQ==
X-Received: by 2002:a17:90b:3ec4:b0:3a0:4668:4cb0 with SMTP id 98e67ed59e1d1-3b1b0b83494mr5437866a91.47.1794652477739;
        Sat, 14 Nov 2026 02:34:37 -0800 (PST)
X-Received: by 2002:a17:90b:3ec4:b0:3a0:4668:4cb0 with SMTP id
 98e67ed59e1d1-3b1b0b83494mr5437854a91.47.1794652477282; Sat, 14 Nov 2026
 02:34:37 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261104135604.907283-1-patrick.delaunay@foss.st.com>
In-Reply-To: <20261104135604.907283-1-patrick.delaunay@foss.st.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Sat, 14 Nov 2026 11:34:25 +0100
X-Gm-Features: AclHuK94u1eOHPpWE8nBMTRpf4tqar4SIHPxdb5PqkdOcIBUQwLxrM5M47Vzypo
Message-ID: <CAPx+jO8ByMju7HofLyZywRQRW4W7_15LoRVDn4K5oM+vsmrSrg@mail.gmail.com>
Subject: Re: [PATCH 0/7] arm64: dts: st: add STM32MP2 power domains
To: Patrick Delaunay <patrick.delaunay@foss.st.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Ulf Hansson <ulfh@kernel.org>,
        Linux STM32 <linux-stm32@st-md-mailman.stormreply.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE0MDA0MSBTYWx0ZWRfX/rYC/Byrwn1n
 jG7HO4XTjPM7SGpORvxvxuT7i+Jxy6H2iLbdngAg373IUyZGmQSIi0jJMoWs2oyduoRmVlanI+r
 1qjUn/p/94fx7RF4olsFNVYe+llcM2ee+cc+7ExLoYiXI47ZdZZHoGcL2ozFMs/wUjxQIttCHvK
 tK9ZlsuF/CtK22gKUyrcQL2Ee/DlTmm7osZzGi+Q/E7E1r+km54Atssz/hMYhybhvSKtzZCZq7C
 s/GFk7SxSPbIfpj64YZHcWOQf+IKtyqH6kRMcbAq6Pzo0Ca9JxsnqS7JitzYS8Fuie9C/ltbLX/
 kA3+U7qJm8NczNSdCoh5Ku6qwvSP5H7Ftc0srbgMA3dYpcnJWnGRE0p7FzIi7Waj3WdZ28PlBhm
 y2L8WgAdEtAC+1Vdq6c3PEZlNOmIRI/hbaWZy4utmxDP1ur21jdglgT2qTDsnRSEbxcKSafqE26
 Y96bCUbIpNaVQYQzrhA==
X-Authority-Analysis: v=2.4 cv=av0nmiZV c=1 sm=1 tr=0 ts=6af8393e cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=rJkE3RaqiGZ5pbrm-msn:22 a=8b9GpE9nAAAA:8 a=UgPYzwtURW4JLmgtzPsA:9
 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22 a=T3LWEMljR5ZiDmsYVIUa:22
X-Proofpoint-GUID: j0svnvWJwIH0AWodZbmmrBTw2HJbQYki
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE0MDA0MSBTYWx0ZWRfX72SD5OJJD8fL
 UZttdvXVUiOuBLeUcig1Zhrs229u5sVGpukfLhyHk+NxElaXddUANg2BNgWLs+c1rncu+oXyPbO
 G8T0e+EoU/7ilmba/pa5oXj5wbsT0gY=
X-Proofpoint-ORIG-GUID: j0svnvWJwIH0AWodZbmmrBTw2HJbQYki
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-14_03,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 lowpriorityscore=0
 impostorscore=0 clxscore=1015 spamscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611140041

On Wed, Nov 4, 2026 at 3:02=E2=80=AFPM Patrick Delaunay
<patrick.delaunay@foss.st.com> wrote:
>
>
> Hello,
>
> This series adds support for the D1 power domain used by the STM32MP2
> families.
>
> The new power-domain driver uses runtime PM and the clock framework to
> keep the Cortex-A35 cluster in Run1 for devices that require it, while
> S2Idle wake-up is handled through EXTI1 and retention PSCI power domain
> (RET_PD).
>
> The power sub-domain D1 without GENPD_FLAG_ACTIVE_WAKEUP is required
> because PSCI domains manage the wake-up path since the commit
> bfd5859709ee ("cpuidle: psci: Activate GENPD_FLAG_ACTIVE_WAKEUP with
> OSI").
>
> This patch is a preliminary step to support PSCI OSI in STM32MP2
> platform and the same power domain will be used also in STM32MP1
> series.
>
> The first 3 patches introduce the new power domain drivers.
>
> The next patches add this power domain in device tree for each STM32MP2
> SoCs: STM32MP25, STM32MP23 and STM32MP21.
>
> Regards,
> Patrick
>
>
> Patrick Delaunay (7):
>   dt-bindings: power: st: add STM32MP PM domain binding
>   pmdomain: st: add STM32MP power domain
>   MAINTAINERS: add entry for ST STM32 power domain driver
>   arm64: dts: st: add D1 domain for STM32MP25 family
>   arm64: dts: st: fix power-domain labels DT coding style in STM32MP25
>   arm64: dts: st: add D1 domain for STM32MP23 family
>   arm64: dts: st: add power domains for STM32MP21 family
>
>  .../bindings/power/st,stm32mp-pm-domain.yaml  |  46 +++++++
>  MAINTAINERS                                   |   7 +
>  arch/arm64/boot/dts/st/stm32mp211.dtsi        |  37 +++++
>  arch/arm64/boot/dts/st/stm32mp231.dtsi        |  54 +++++---
>  arch/arm64/boot/dts/st/stm32mp233.dtsi        |   1 +
>  arch/arm64/boot/dts/st/stm32mp235.dtsi        |   2 +-
>  arch/arm64/boot/dts/st/stm32mp251.dtsi        | 126 ++++++++++-------
>  arch/arm64/boot/dts/st/stm32mp253.dtsi        |   9 +-
>  arch/arm64/boot/dts/st/stm32mp255.dtsi        |   2 +-
>  drivers/pmdomain/st/Kconfig                   |  14 ++
>  drivers/pmdomain/st/Makefile                  |   1 +
>  drivers/pmdomain/st/stm32mp-pm-domain.c       | 128 ++++++++++++++++++
>  12 files changed, 353 insertions(+), 74 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/power/st,stm32mp-pm=
-domain.yaml
>  create mode 100644 drivers/pmdomain/st/stm32mp-pm-domain.c
>
> ---
> base-commit: 7b3f3e772d5107c3a59b9f2278e9aeab227b26db
> branch: master
>
> --
> 2.43.0
>

Please re-submit this so all patches are sent to me and linx-pm,
including the dt patches.

Kind regards
Uffe
