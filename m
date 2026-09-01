Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6967440637
	for <devicetree@vger.kernel.org>; Tue,  1 Sep 2026 15:46:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788277590; cv=pass; b=pUTd7KouL6K2t0J+a2JaOqXItrZV147nCNYd2WGMqDEjcXElCmKZ5GBs5R8zOJdz7Xhzfk2nO60v5P17tNBNYU0dCZnjXYYrfbWv5f4D6FsDRa9K3RXWP8RTlp06DaIUppRT3HuAcaeYa05H3Ql5s8V1kVeFCRAAaasxakbZUaA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788277590; c=relaxed/simple;
	bh=2hiFglIyELsVUiYPyeBzEQYmuk8ezgG0ZJ820CL46r8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FcLFsGmTHLRO0dJF/CYq+u0Lbwfx/dbTJGUn9En11e6/H97qLaAjj6tV6+z83DfX2TuroAR6PrMuHtrVECEi1Cm6KMVmsNlpW0fTObCh8Y5ZTTc/QRMHvPjh4Yyp2JDv7NP/5ISLgaRPB13oDfaxKEu7JkBrNW/N2xgwXKtgRqQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Bt5M0ggt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Mc8G43FP; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Bt5M0ggt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Mc8G43FP"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 681E8cZW3913698
	for <devicetree@vger.kernel.org>; Tue, 1 Sep 2026 15:46:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FeaQdHnyQUVUR9qe3Nys8gzsKwJQV3ZOdTi7d9wCiuI=; b=Bt5M0ggtxbG89sc+
	BirZoRkIMnGGCvu9cLn8DtXIJcsb4LpkHvHlb8fzIUERmgLg/QNZAbGchT/zBlta
	PrSTgamXN8kbQDu0MY00sHlSx9ejf1v1y7jUjEW4ks5UEZ2CVPglweqDJ6Ep8bta
	HZjX/gZA7COIc28EA/LeazfE0kAWNDftfjmc5qy8Hah/K2VHHg3Z/yporOq1cPa4
	8+WeM2u6qBRbjQvFUspS7xo+wQ6k+Sl5AeuVKwKAyC8Eclm6W1yzoepIgnUxYJon
	LLMaEhbhKh3SNPn7K/D/Hs+OnBBqZsp7TqsUvK3Zy5a/Th6ctxBxN0kUcZqIfhLU
	fCD67w==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdsnu2f87-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 01 Sep 2026 15:46:27 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-396638f9a18so8341340a91.2
        for <devicetree@vger.kernel.org>; Tue, 01 Sep 2026 08:46:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788277587; cv=none;
        d=google.com; s=arc-20260327;
        b=a7DNmo29Z/qlGFn70EqX7ySHyGeZwQoRn3Ib6nx3107rE4yn1R/bcNdDOLAkRhp9Wb
         7uyBKMSrlOnIeyc4RzgXTA6HYlNY2pnTIREtiwWxccXCcN2rydJO4hNY+M8OFmzFJn7f
         E2igh1PW7Sn34DAWHZ5c3T6AfAKbnc4yJOiExQDYFA8/lu5kIz6ZMPEYVGitauC0u7i0
         kQ1DjM8hVXTd8zoiARtEl2q6ZcuEeM05gZA1nphFhOzyYevkiCY0vASnAKmqVsJEEhRk
         jbegUoOax1C1DC9LUyoeZ7okncfgcoyTIxOMyvfY+Oh+jnXE+6L8YqlDSWUuWlKvNVvb
         H24Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=FeaQdHnyQUVUR9qe3Nys8gzsKwJQV3ZOdTi7d9wCiuI=;
        fh=ubvNRnr7m7v0dHI+bRZg3uqt92OchlXPoR9AA0vu1E0=;
        b=hC7tnqk6VfD5U0OPcxvbDoU1mOvGS3+GoxBIF9m1VjudFDbzpQ27W25kboPbMwFchp
         zX92obDXdZKeAiTSfE/QxFG2Acmr28NCBPoCf1m2rMjIptw3SAIG0t/HZjE4f3+Ac3WL
         XRiU6vBNNZRvQD3W55Bw7QiqXUholWTRU2S4jZchtNP8RlsndOvzje6UqZA9CJwPXUaE
         tjw5AufCNwOZv+B8y7pBse1UvuQ68JY4ZCVg7CaTmu36NmE47s2XFF+qLDQGx016nNCr
         a6PsQbM82JKEAgel84C93SGMBp3rFK96ewzp6AHCLzhng4f3UwGstcL60a8kBjSMENjz
         SU1A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788277587; x=1788882387; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FeaQdHnyQUVUR9qe3Nys8gzsKwJQV3ZOdTi7d9wCiuI=;
        b=Mc8G43FP4LGrtYT3+YtNrSlh4wylYrOYZGb4BZcrKVa/vt2zZPhysJW9zgr2lVmCBI
         Hu/XLkB0dJjFSMsEKWpc00o+1H2lKEhvegd3QIOMn1aHFe3rYyw6Ngu94YLOYOeRTIKU
         mSyzINRcfHZiHksJov9d4VBU55yO7itgqeWThcO/JlP+kQZHMqT1Q+/xpopyWxVfboLY
         iBhKTnylozXCCvbaYUTD9QXLSlDSSwiTU5YVnJnqYeeeD1aPxlQa+tv1KbYaQbuerbpe
         fCYJ+x+4ty1LhZtH4qCXn2MmJAQUvnjUdflXbwEyoUq7o9uQcSWEqnRqa3Ia/oOPOSkH
         By+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788277587; x=1788882387;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FeaQdHnyQUVUR9qe3Nys8gzsKwJQV3ZOdTi7d9wCiuI=;
        b=hngxfBLpnGCJ3uptlvHPWnAi6nm5Gc8qQvm03XElOBke9PsLwblOOFRhNH/D+L6Zaw
         mk+ENWf5g6+W/9vQLSdorJ1Q/eaH8KwCDKcYgP43rHFXD6QKmFWrgUCntO4g5Mx8AKFF
         QIP0pzeSL/IqBNxtEsXvWSYhWHaQEh12mpVjWIsaKX08lKSXDNq9xj7Z0+w2ztoZR0yM
         fC8vG3M2zX6EHB/DgDPmxSBfaOnPzaHYnAiJy1fKBm56bWJgtxXzC0OU5XC0oszM+bxU
         xFEh3EDCA0YhogzMhETddSQZulT85rQeA3Ghk5QTT0tQ2JDB0CXOriaPtoh0p54wOgF0
         A+cQ==
X-Forwarded-Encrypted: i=1; AKwUvBygf3HAk/fvBKoGaPM0vbZaabUFKYqFtymlFgLa2sue+Swzkk9YWGioMHlvRa7D6cYK8oIS6WshgvZ3@vger.kernel.org
X-Gm-Message-State: AFuF++lZa6YXuPrJoHFNlYD1SoAW0ha4m2yaLgRdMudEVMNhtk+IlaxO
	BE8LHafSvTBGltxIkcc2bhtXJL5C5VilbkdsIi+Q2ZWBrrS2KssBokh/Db/0iYZaSyhpL1Dyt/e
	rDAl7kQR9lMcHoDJgps6xAwaqkXA/paQ13dFRki7mcSS5WgytVyJ4fvyOZ/JvSwpjlUDX8M8kA4
	HAsP1yb6eO+c+uN6F8QP1xWQ2a7GsB7bmXkRUYJko=
X-Gm-Gg: AYBFou01ron1hEEY9AGKhIsCHc1MFp1bh/RHRDv3ahNQeonVkeY4bTBWQk74ZLcD/pP
	fHoXL7cVYv/6h3cI/Ly180YXqB/jqj9RWpYoQ5zaSDMJl55gVXjplNfAV95H2Ga51rlWdrwBF6H
	krpq2W8kEGQkhxAJm2K/GJhEYAKQkZormuFq7CaHFrNhonPZ3eyU6jF7R+cQ==
X-Received: by 2002:a17:90a:dfd0:b0:38e:b400:a860 with SMTP id 98e67ed59e1d1-396d0fccf78mr56207755a91.13.1788277587264;
        Tue, 01 Sep 2026 08:46:27 -0700 (PDT)
X-Received: by 2002:a17:90a:dfd0:b0:38e:b400:a860 with SMTP id
 98e67ed59e1d1-396d0fccf78mr56207640a91.13.1788277586732; Tue, 01 Sep 2026
 08:46:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260901092447.3028-1-sreeshankar0910@gmail.com>
In-Reply-To: <20260901092447.3028-1-sreeshankar0910@gmail.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Tue, 1 Sep 2026 17:46:15 +0200
X-Gm-Features: AcwNN1WvPfOmS-pECGpZIzaJnQAiHHylSoHG1ZWEkcxRplBgBJFHgfUmrIeCkM8
Message-ID: <CAPx+jO8XfaAJzjrO1uL5=0hadRLGtZsvVz7c-9P-+NBFwa-2Kg@mail.gmail.com>
Subject: Re: [PATCH v9 00/12] Add initial support for Qualcomm SM7250 SoC
To: Sreeshankar K <sreeshankar0910@gmail.com>
Cc: andersson@kernel.org, sboyd@kernel.org, bmasney+clk@redhat.com,
        jbrunet+clk@baylibre.com, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, rafael@kernel.org, viresh.kumar@linaro.org,
        konradybcio@kernel.org, tglx@kernel.org, ulfh@kernel.org,
        radu@rendec.net, abel.vesa@oss.qualcomm.com,
        taniya.das@oss.qualcomm.com, danila@mainlining.org,
        davidwronek@gmail.com, mani@kernel.org, robimarko@gmail.com,
        linux@gurudas.dev, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDE0MCBTYWx0ZWRfX/b/LQxJUiUHh
 rzJuuD4l2XpvtW8ITIgdReBgb+KnDMR2DI231oneiqmo2f1tE/hDUvUIVTnjKjrl6NVVJntZo6J
 BSlSJlldW/CSpR+xnpYe5USN/T5c4hrr+eanDLbYFIovn72XAiktXOxToFu70mLTsfmmDUYX1lE
 TwtI18zdSM+HDweN7rzp88/xcBnRFCk+Sv4wzB1RhdZ/N5Z5YCA2w0kwSJXg83F2X9KdyiLxljY
 n0tvz8AZ91OqXFNsbdGrvH3SDgIvrsE0wz80ckGr31MzODM6U6TBO/cSGuNzUEtu4k+KCt9EuCd
 WPHRkxVl6KTe2KMGP9WRKWvYLMd8osvdzT1wX4YWW5h+jR2tr35RQ8ZU/0Uw+rfFqyIuTcBjPmh
 TfblvnZ1eMfNjSeB8l4B8v7prtbKuqU0WXv0HZuhgg8J56fnXNZqHPks55Yy4gzosrCidduCLDA
 IOjCmgFVx1mtKWJfEfg==
X-Authority-Analysis: v=2.4 cv=L6ItheT8 c=1 sm=1 tr=0 ts=6a96f353 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=eoimf2acIAo5FJnRuUoq:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8
 a=Z-QAWnQ1IDuNMEsj6QcA:9 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDE0MCBTYWx0ZWRfX6uRekVg6X0HR
 ZTaheh5JSUKmkg8JE9ORI/+IhjlA/VJGJVclLxRAevolheLbKNOtSYYIIgKLbDSwU0mv6Zot8rV
 g3i8ps7XL1MnDZSU8RUIykMmi1rgI3I=
X-Proofpoint-ORIG-GUID: HeYzCBGn3kneklKYEEzOPko7bcTXwn7r
X-Proofpoint-GUID: HeYzCBGn3kneklKYEEzOPko7bcTXwn7r
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_04,2026-09-01_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 phishscore=0 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 impostorscore=0 malwarescore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609010140

On Tue, Sep 1, 2026 at 11:25=E2=80=AFAM Sreeshankar K <sreeshankar0910@gmai=
l.com> wrote:
>
> This patchset introduces foundational upstream support for the Qualcomm S=
M7250
> SoC (internally codenamed Lito).
>
> SM7250 is an ARMv8.2-A platform manufactured on a 7nm process, featuring =
an
> octa-core Kryo 475 CPU configuration (1x Prime Cortex-A76, 1x Gold Cortex=
-A76,
> and 6x Silver Cortex-A55) and Adreno 620 GPU.
>
> This patchset is organized as follows:
> > Document relevant device tree bindings (SoC ID, Kryo 475 CPUs, SCM, PDC=
,
> RPMh clocks/power domains, GCC and cpufreq hardware).
> > Add driver support for SM7250 in socinfo, rpmh-clk, rpmhpd, and GCC.
> > Add the base SoC DTSI (sm7250.dtsi) defining the cpus, PSCI,
> interrupt controllers, clock providers, power domains, and reserved memor=
y.
>
> Dependencies:
> This patchset depends on the following patch:
> > [PATCH] dt-bindings: clock: qcom,sm6375-gcc: Merge SM7150 into SM6375
>   Link: https://lore.kernel.org/linux-arm-msm/20260817082457.64797-2-krzy=
sztof.kozlowski@oss.qualcomm.com/T/#t
>
> Changelog [v9]:
> > [PATCH v9 04/13]: clk: qcom: Add Global Clock Controller (GCC) driver f=
or SM7250
>   Make all clk_init_data instances const across the driver.
>

[...]

Patch 7 and 8 applied for next, thanks!

Kind regards
Uffe
