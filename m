Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71E3A448BA9
	for <devicetree@vger.kernel.org>; Tue,  4 Aug 2026 13:42:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785850979; cv=pass; b=UG69DDTzSs282lUJcosIX393Z26wVl0LyBU11XLdUKiy4Z7BUXr/Xda6m7Bdlz62qqRHECJkQOF2ckIFnueUdguUBF6vLNSIbhANZLjUnu56Rh/Ws8Rd0cOhAB/Qs0AxhW3W0BCPW0qNsPJJHoBRbrhLPV3k2KobXRZke3wv7Qs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785850979; c=relaxed/simple;
	bh=O7wUWXDsY3uEeARPEMMNmbRY52q+9eneHeaJu75kFmU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jJcGmF2/fDwx4/ewlHpPOct8LrsNuTF3VpOy0yHJ5dqVn9SYJFclhtw73PnxVOgTaWzRrlkar0Z/T06AL9NpPOz4bW855p2qhpl6fc3s1xFM57ODt46+zecWKO8y9q7UnLZMYdQTyz9KPOgoFDlO6CntvpC3fBCAAAS/gCCtMHc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=beU9q1KW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=S2PIy8xy; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="beU9q1KW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="S2PIy8xy"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 674CXTWR3830741
	for <devicetree@vger.kernel.org>; Tue, 4 Aug 2026 13:42:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+XvvqE13EntW6712+NVvxyzFymgdbvIBVB20n97Y8Rg=; b=beU9q1KWcc06i6JJ
	HtF1fUhq3CAtPEl8gOjF9N4gv0zfw5Ow7L32WO5Nyb6JTSQzThP08uw1bvB+jB9H
	p72I+2joIZO7aJpHdXSyN7a84jSRcUB766b9UlYe9tNfPsssLbsSvXuBeSb6fvAi
	lqnAGOlTolGbaARO2zONpEP/kGWuocvmZU37VDCMSHHET21PnCcpRgwGxlYIb4bl
	daB0Y91CdGDn0h8plEws9tCV22C1hF0xXI3hDBB8/2vXMvWSeTKRAYFO82jToe9u
	7Pa8wv3cnpqFvOvhp3/tTangOX6WVpgDFF1TfeY54eSoCgFo8am6aEWAUrsmaVXG
	qGffpQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fu5hqtvcw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 04 Aug 2026 13:42:56 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51bec738909so36780581cf.1
        for <devicetree@vger.kernel.org>; Tue, 04 Aug 2026 06:42:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785850976; cv=none;
        d=google.com; s=arc-20260327;
        b=qNyT/4h/xhor14ZB9aMRd/8vmwQ7hl6OVNp27O8lCceO3Q7V29LBoCaG1KMRw6cpCU
         QO4sVFRAlpIAWQDFDdhE3t9vsr0Oism/etjG+tIAz0+yP1au2/bTL8NvbH3Ym6QnVyQL
         qz+vIiEVHO0RuOFBeMOUSB8ZSvsJ6F5q2tWYXOaufoyYWsahN5PjNLtZvpH9m6Jaa4ui
         uOmpYa9Hvsnt8qoDZmvi+7xAQPtWu7l6h2ytP1sjDDclLBYd3kDGixmqPbGrSFnjaZT8
         BrnoLPpUHaEu72aQQAIdUlmRpXsV/nN/2wm98oD75NCiqO6Hhw8HFEcqA8qGom+1ImAy
         DVBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+XvvqE13EntW6712+NVvxyzFymgdbvIBVB20n97Y8Rg=;
        fh=jZyEzOrBhynye4ke5TROTHXmLJwqCrrl5Zd8o0czp1A=;
        b=c00VitWvtSyqOlDrUmLqjtp8gMrZS412cZQz+bKv/cKjQVfCQPHE9jd9QIGhx/ESmW
         4CHkvN2JP3HViJbmkjL9YQPGxWpmt35QN6lFfX8ezjaxKIbjjFQEMxSyYNTwhDt44+y/
         MVmgENPs/99YEbzTcEXK8c04LRETRIhBeiksovQidRX5sK3ZkU6qe/e01PdL2Se1aaEZ
         RY4uw6iA61tFuitBUEJ5I4GGPxkOyUZJV0e2EoZcVSjygsCH8pWeIYdKQhLudZjsRvAz
         HEIw3xpHQzgDz2PrpzBPqCLViX9KVvbhBF7weBHz2T/c9at277NzzjYLsTCYeEqFaf3/
         WYog==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785850976; x=1786455776; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+XvvqE13EntW6712+NVvxyzFymgdbvIBVB20n97Y8Rg=;
        b=S2PIy8xy3DKbBKm+u++aPUWcYTQrV6hgEbRu1lIXDVObWle27Mm2fs3eibctxGEgHb
         jdXn5IB10OtlWHFJSQJqO67QATDoktdVS2aCIm01SoBvJb+9KXPFMoB0MxFDYvHnrqm0
         bYCg1jhKJ7McjZu9CuhHxrR7A+gYAoF4wPJmoD1+eaEbu8DbtFwNa7bWB2D+g95pG9at
         BUPSwqyJV9oyGfI4dxvygulZAgcmHCcnWzlwdn2hfh1qmTN1ylcJ1NtWxgrdwI4TWWoK
         AyDRsG29MH30pVLWn1afiI6h5rpL7o1wqWFqJvWV8/Pcnremt1IgNZ8B/0RmxF+TX26C
         hO/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785850976; x=1786455776;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+XvvqE13EntW6712+NVvxyzFymgdbvIBVB20n97Y8Rg=;
        b=Y/DaUk5KZcL0BKUynCLquj4gZi0OHvvR6WWYsf+7reOljuFEeo/moK1FA4kn3sgO/H
         igDxkbfsJrzJLiqjgcFJrKnyRfFg+EZLFmC5t9jRwLdvJYFt1Tvbpwji9T5VJ8tFTIx6
         wTu0iKPVrRA89dpWcudMm8TUoDGxtEWOzpDjQBCCkVAy6ZWZ9vHmcx1iiikgQuHr5ypE
         x8bpzZYEYBB1QPqs672R1KTnxguuCpd4Vr4Y/ykkJAJOHCtduTpudevH4Fou/PqJLdti
         ngAGY1UIcJDAtJrLV9S9pdZvdpNsMteqMHrt5iEIK/+B/t2nPkvwbyDABlDx+iL07qgB
         00BA==
X-Forwarded-Encrypted: i=1; AHgh+RpkhAPWwBEVn+ak88qsfz6Bl2P/5OkDDhAdluh8jC5FKFwu32AdLnlz/e8sHmxQhkEIuDzS2F1ud3s9@vger.kernel.org
X-Gm-Message-State: AOJu0YxPtJlG3Tt/mKzMC/NltKHoFRjSo1ewv2YGuFMhy9gtHq8eBaxL
	qQrvr9BTq5VZwwx0M2ac4l6hRmmyl19M0Dh1H1FuV2P3ehqZDuFOzu78BoC4nF71Pgemf3PI4nn
	NCoPEClZGbq1qJ5dVq4lKBDiyyv42I+0lQ/Z7FBxSqnP1DQTdyk9rIbi3z6fF5KA2aRS56Bl84o
	nDQhll1WOUtbgaQFcjUXngpQv33Ra7OTaqxvfBGMc=
X-Gm-Gg: AR+sD12WOT4QvC5SizkvwEUnG8x/PjdXW4h7drtjfVj0ZxB/nnj4L/FBieVhz6Ex+qx
	LskupBSFwey+GJ88ZPdtNyTVK5PBQa90nssXjPrhSpEUpxaqLL8H5k6uhJRROzpmGm0uXna5anK
	HV72PVKq2gRW8iDYeruW1UH1dA0yiuLW3gXpSMLY9Imz3vZ8QA6mrWodLhBA==
X-Received: by 2002:a05:622a:d5:b0:51b:fb4f:afdf with SMTP id d75a77b69052e-52b56670980mr263922701cf.9.1785850975633;
        Tue, 04 Aug 2026 06:42:55 -0700 (PDT)
X-Received: by 2002:a05:622a:d5:b0:51b:fb4f:afdf with SMTP id
 d75a77b69052e-52b56670980mr263922111cf.9.1785850975193; Tue, 04 Aug 2026
 06:42:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260724075700.714261-1-pshete@nvidia.com>
In-Reply-To: <20260724075700.714261-1-pshete@nvidia.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Tue, 4 Aug 2026 15:42:44 +0200
X-Gm-Features: AUfX_mzFueV34L91xtuABsfkzdKLs6pi3RDoAgO7ALwwTVDO2DS46FaYhxnqSHc
Message-ID: <CAPx+jO--kLFbs-khz9UX4OUq6yFHTpoZpjwaKdbKoXZwZhm7LA@mail.gmail.com>
Subject: Re: [PATCH 0/5] mmc: tegra: Add Tegra238 and Tegra264 SDHCI support
To: Prathamesh Shete <pshete@nvidia.com>
Cc: ulfh@kernel.org, adrian.hunter@intel.com, thierry.reding@kernel.org,
        jonathanh@nvidia.com, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, linux-mmc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA0MDExMCBTYWx0ZWRfX52dqHXPM9Plj
 ilgWm1RWkVMMUaUtCmQm+l3gUmCeNloR42rW1Ugb/MBZTPfAcwgcUzWIWHkdKK25nTXKOVKTaHP
 cDxVEiHsNz622PGrk4TsOu4DfAFeTnE=
X-Proofpoint-GUID: G9Zj4GMPpkj5od03dPK6eIvbm0XVBZ1v
X-Proofpoint-ORIG-GUID: G9Zj4GMPpkj5od03dPK6eIvbm0XVBZ1v
X-Authority-Analysis: v=2.4 cv=EoniaycA c=1 sm=1 tr=0 ts=6a71ec60 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=ZpdpYltYx_vBUK5n70dp:22 a=Ikd4Dj_1AAAA:8 a=DZf_on3a76gVNrxzGB8A:9
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA0MDExMCBTYWx0ZWRfX+n5ohgktsZvG
 kIT9Q36ufsSyZyx8lC7ya1cS8PF5Il12q9Xj1B+gZigZ1hmYnWW0PHyOjvH5DYhp6wUdj+Bgx6E
 m/QPckokNljgZOnx9sV1FTc7hVdRN2V206p+7iuJGBfsMPkbKReo9Z7J7fEOc67zksT6HEI1QQK
 gAwJlBLW8zmS/HmvxNf+5VPop5wzfVA3gIIO8y93o/xaS90tnmhcQ5jRNaLsh0zj4dfBVAFlTFB
 MFsy4A52LV9dWS57F7h7Voi9ad0A1CaxnWHBjkBxtoUYmfVy1rigG0deKrJWjOGDgY/1deMhyRf
 UZ8O1YK1eaq+X5BU5XEMhJ0h1/TNAJ2CIGqR0EXid1EzrE03o2Q1oUGyHnQKihvk7WuOGiUgw9c
 Hyd2luM2mqMOGcPxnZlHMLQBgZgnIBSV277P+eqZ3PHq71+prcU4eO14eJdN/OC7akYoVVYnqm6
 G3oDVXsYFw26DuCqFGQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-04_03,2026-08-03_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0
 bulkscore=0 impostorscore=0 suspectscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608040110

On Fri, Jul 24, 2026 at 9:57=E2=80=AFAM Prathamesh Shete <pshete@nvidia.com=
> wrote:
>
> Add SDHCI support for the Tegra238 and Tegra264 SoCs.
>
> The series documents the compatible strings and adds the corresponding
> SoC data. It also adds the Tegra264 SDMMC1 device tree node.
>
> Prathamesh Shete (5):
>   dt-bindings: mmc: tegra: Document Tegra238 SDHCI
>   mmc: sdhci-tegra: Add Tegra238 SoC data
>   dt-bindings: mmc: tegra: Document Tegra264 SDHCI
>   mmc: sdhci-tegra: Add Tegra264 SoC data
>   arm64: tegra: Add Tegra264 SDMMC1 device tree node
>
>  .../bindings/mmc/nvidia,tegra20-sdhci.yaml    |  6 ++++
>  arch/arm64/boot/dts/nvidia/tegra264.dtsi      | 34 +++++++++++++++++++
>  drivers/mmc/host/sdhci-tegra.c                | 30 ++++++++++++++++
>  3 files changed, 70 insertions(+)
>
> --
> 2.17.1
>

Patch 1 to 4 applied for next, thanks!

Kind regards
Uffe
