Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 828B73F3298
	for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 14:18:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786371514; cv=pass; b=UuJqV1G6CSETUeIfnItu6K5MR9AZePfPvtiHO5qFhGijbhrNzZgOqqOQpkElMk8IFWiUEsTHTZ2B21BXRmYXP8DRBsGBqXj8BHYDYnCfVEKRNVvPkYR42SzIW3RNdK1uBvf4C4jIiJg05EZyaGDSosYHtmM6vB/zHfVWBOITDKI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786371514; c=relaxed/simple;
	bh=N7XTeoAtVgCjUbyUhH6HLUqT7VK7d+dE1+VQTCpWBb8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=apz3994npTzmNUCLkrVefu2m1Oxl9sELrt9ga0jrOTjnqKa6TLlN8NFloMlAyea5GneDbNW9LYgna1dYEqnCvXkjh8s62yVhJFsu7TFIF2AQrhw4B6B7ING1nsj7GJm49UH/mqjyaujPEcqieSZd1WbfYqVo1V7RTMKcwp2Ck84=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OsMXW/8K; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Tsbm7O7q; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OsMXW/8K";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Tsbm7O7q"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67ACjC0s1367894
	for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 14:18:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CeUXRKNvrjHpJenJaRbLI76VL/niBIfa6H9KqtDK2ws=; b=OsMXW/8KgmMjHbZe
	AoyvJSO+/JhnfbuDbQ3oyZaLWo0zwkbPAE92jJ3Gcl2Z4Lyh1s71hM5J2MK86gxl
	yQ5J968Sy6B8pvKwAkUzmCImTUoyzjD8uc/RFc2yMqmMEGzxJ73unFlywxF3s35j
	fm6D112FbvpstBUAzFhOqwGrZGbwu6N/dcYRlqDNM2Rn/LI72bCvWOEJ65FlpXru
	umj1WBkHDQauhGpT7E3QmSzO2M+xDGp2mPW4jFuEtSvQuTBUJNcB+0xHks1HwLYU
	IUI7CPLh+giwbX8KwYlr1Pb5szWOTEstMLKUvKQrNiw2AFC2yImIgtvZqkZlGltt
	ltiA1w==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fy8v49wxg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 14:18:31 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-907c59bd65aso9101516d6.0
        for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 07:18:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786371510; cv=none;
        d=google.com; s=arc-20260327;
        b=T86y5LMoSopkN0HchgILXiAAFZk/nJIZ7BskS9jI25vtTzH5nd+DBCg2K7PILRsDis
         oXi4ix2Cv3CPnuSvVKxpF6h+rg9IOXjkXXeZGNvV6fZdJhK6tlDUkGdnEEHP2p8eocfI
         mesSNf2hyo+9ZnEBocsarnn3+JEBazn7EY8q82F5ZZtOQlnYJGO09GY1Cpe31q+mKB/3
         mrc/QVI7xPL0Dy1T+TQMAsNVYoNznofSjlypUsaFU65SAOqrUtiMNJLefgr7+RgKIWbp
         Gzld4wUfrxG5KENAFiEtc5Me8bY59kdBjH2GOoS4s4HsvPEoSXH3YeuNgeuO03Dzhy5O
         Qp2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=CeUXRKNvrjHpJenJaRbLI76VL/niBIfa6H9KqtDK2ws=;
        fh=9HqSaeVG3FQblywaL00xI2arVI3jzEVesRXIoB2yBao=;
        b=PSKr4b7jfD8Fe/4lu1ihfqH+njoIWC/Fw3WRYDjgDILPWbnUtuEwqousOcTkwFDB99
         CBItkCplkxK0h50xMiaX5dU5kFHpA0lJDblHIvxq5KrwVnbOl1p9zV7qKQ+fHU5GgCgT
         qPJlf0u/KXlz8qdIf8aUdx6wzVb1c8BYKqcMsYG6Ubx3BAi+oxjcCBqE4kDPyjB/xCGj
         xPL4hekKiIC6Q8zsDNuoxMRX7v5l7G6vq2D0SB/IDz9EW10PMUpZn2/IpsXoFVtCfYoM
         aDYHMlh6EAnsv+CRiplUPKeiNQUjpOYKEe1pJ1h+GMJl0JbvE8dkjgw0a6cca8lj/VfS
         7twQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786371510; x=1786976310; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CeUXRKNvrjHpJenJaRbLI76VL/niBIfa6H9KqtDK2ws=;
        b=Tsbm7O7qLBKUQbZI8wcGSgMuSOg4QFgN64WS6DnBSYe41SdKCPE6dXYprJ4yJAH9D4
         zI4WBizjdOxAhs0hzvhbNrMaTUPLiuCd1yHBclvm9p0ZJrYnUVc/+dqqDiSDvfjXrP2h
         wClc2AewpDR/j1Xu4JV+Spf8HjHbJBx7uZR1TSmUMa+zo/vnQuUd0wcDZRFEPkPkIrUJ
         fYsqicGSz3DKLjSiEQa4mLuq+htg23e2eENkd4cXUGtYhvEnsRh5vh+IQyHjkNBw8R/S
         9nrnhZs/+TB7IFCX8dKqjUSvZi4AT8MlsTWWAYLWBUKov162YcHKoaQ97k792skMTuvB
         r3Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786371510; x=1786976310;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CeUXRKNvrjHpJenJaRbLI76VL/niBIfa6H9KqtDK2ws=;
        b=ZbbkzpEjtyeh3d65StTnBjgLhkoOlSSr4RgsYTH2VWrHnGeDUy3MmrXf183VtjYWEm
         cGVdTu6eULlqaF+0bq0XGaAIQPXZPIBmhR/mxiLhbASjmFhavWZ9y1A/HuvS5HYTnNfb
         do8yvc8B+ubbDZrlnRzi3uGopLvXcqJV8+5eIgWJIqPGQImiAgb6yFVF+3rRsAVB58OS
         AagcU+yI3iulwmDbATeU+u/nbZwgRk3BvVYrBA+ptawVfjICqMB+0t4RO+/0opIYdei4
         YB6liR9ZS9ouBaMPg60BwFUcvRwoehAT0CUZvTjv3JpglCR8FNqgholOpkekaxaWXgl8
         J/bg==
X-Forwarded-Encrypted: i=1; AHgh+RpIJZPvQrFP47O9nUs9ZsVkCtd9953nNMjY10jtwQD0n78+SLh43uVbSSTIAuUTuJzmH1G9xoycAwsn@vger.kernel.org
X-Gm-Message-State: AOJu0YyrFnBD+GCI6K62d88T6HwsluppNuFchZ138Ogkrm4YYvIU0YvP
	tb9e/CURGrFQc6XxD3p3dD4DPNxN6eJd4i4LDCpPhuzbpXzX20co7X7oSTymXVG5Fm4xEj3/B73
	G8cfe2wK+hFvMbVeemhQISPWjlCJgTEg91NB+DCI5x13WgQTfv+31Pw6vfmC4Exyq+TuldfVNoU
	WHDpabaE7yjkQ2DT4xu1W3nd2764Tch1niTJCVGAE=
X-Gm-Gg: AR+sD12zkM8v4asYb7yOse4p4xawHFMosXfOdmRK2+v4ATtpG0DX/I9HO7xTSRiCaHN
	ZqVafsvtRUnCkj/6KUsvn3POJFQYFK8uSmwkQpUhPxxlJ31uyXNuANchtnHNJNbblC9UPE9R2j7
	B5WZXjYe9PaKs3hkDSoJYQxU1YCZgLPtdZ5MFQGnQB4ulTtjpURfmZLdUxzA==
X-Received: by 2002:ad4:5c8b:0:b0:8f7:40b8:e8ab with SMTP id 6a1803df08f44-9088108f7dfmr495729246d6.3.1786371509682;
        Mon, 10 Aug 2026 07:18:29 -0700 (PDT)
X-Received: by 2002:ad4:5c8b:0:b0:8f7:40b8:e8ab with SMTP id
 6a1803df08f44-9088108f7dfmr495727846d6.3.1786371508926; Mon, 10 Aug 2026
 07:18:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1785941595.git.geert+renesas@glider.be>
In-Reply-To: <cover.1785941595.git.geert+renesas@glider.be>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Mon, 10 Aug 2026 16:18:17 +0200
X-Gm-Features: AUfX_mzXC69ugD711wUFTUYf8_epBYn0SrqMBsnLPgmbzyeuCwMrcI960ZDYq8Q
Message-ID: <CAPx+jO87d7H92KSR7R7ObR05sM2JcHBCo+YuUf_1gE-KwhR7CQ@mail.gmail.com>
Subject: Re: [PATCH v3 0/6] R-Car X5H CPG/MDLC support
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Ulf Hansson <ulfh@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Marek Vasut <marek.vasut+renesas@mailbox.org>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: YH5lPTPzJK4VL69N0x5njANoebem3u4t
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEwMDEyMyBTYWx0ZWRfXyMM/X2cMBDod
 XXhgVCNPPrjOD20cupG6L60SJtw3MGIfVvFJVcKHGEj9Gmk/O37SGVwGpSnkGLEc2epMIANTjFN
 NTDv2h+LFWwADEt3Ctem/3tvyKBUKwg=
X-Authority-Analysis: v=2.4 cv=W5EIkxWk c=1 sm=1 tr=0 ts=6a79ddb7 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yx91gb_oNiZeI1HMLzn7:22 a=HDY4BLWKCFmduH3Fo1AA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEwMDEyMyBTYWx0ZWRfXy+UcfdI9wjqj
 +Pf93cx2B3hAgzQHngmK3y7A+RPGU6otE0mOBJzfgJcE/D/5gthpMT3VuOYfdVM+vzx1OJT+cJy
 6euUCux+Zv17AGc6TB4d9K3bcmC+SCzOXwqrpwg0qGM9nehrr2ZEjMLqKdwMPxniIRf2JWJV4E7
 aiEuPqikeNnaunugm8R/52/O8ercNaRGFr1Dq7Hndj3iJCuxQBY36uIGiffhOIkAtbpPWBlPlLw
 L5XB/lk9ulMK986aD2Wdoxj9dl9TVd4Pvu8M7ZPn458zjT/LmdYwG1R28NajO0gucZuemGMuo2O
 veF0Wyaigo5JgJj62rI1Ng9ODoOZ4ap/f7szVOAoqECVCDGbdg8QtsWJ7bUJ9zlQpPVAgJndZTq
 r0akAhz1YAsXWim/vd2oUgdkNpvp1zslPut7oOfmLkMRyTz8reMat/U4iOv1/Oas2kxc5dsP9KQ
 Kt7ALr+F1TVzBPDvptA==
X-Proofpoint-GUID: YH5lPTPzJK4VL69N0x5njANoebem3u4t
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-10_03,2026-08-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0
 clxscore=1015 adultscore=0 bulkscore=0 spamscore=0 impostorscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608100123

On Wed, Aug 5, 2026 at 5:21=E2=80=AFPM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
>
>         Hi all,
>
> This patch series adds minimal support for the Renesas R-Car X5H Clock
> Pulse Generator (CPG) and Module Controller (MDLC), to aim for replacing
> the dummy clocks in r8a78000.dtsi with proper hardware description.
> These two components are closely related, in the sense that they are
> both supposed to be accessed through the ARM System Control and
> Management Interface (SCMI) on the Ironhide development board.
>
> This series consists of three parts:
>   1. Patches 1-2 add DT bindings and DT binding definitions,
>   2. Patches 3-4 add minimal CPG and MDLC drivers,
>   3. Patches 5-6 update the DTS.
> Note that this series depends on v7.2-rc2, due to the use of
> <linux/device-id/of.h>.
>
> Changes compared to v2[1]:
>   - Add Acked-by, Reviewed-by,
>   - Add fixed-rate clocks to kerneldoc of r8a78000_cpg_priv.map,
>   - Use devm_clk_hw_register_fixed_rate(), drop unregister_fixed_clks(),
>   - Drop fill_clk_map(), as it is not really needed until SCMI remapping
>     support is added later,
>   - Replace <linux/mod_devicetable.h> by more specific
>     <linux/device-id/of.h> in v7.2-rc2,
>   - Add a comment to document only always-on domains are supported,
>   - Consistently use /* sentinel */ for zero sentinels,
>   - Drop trailing commas from sentinels,
>   - Sort MDLC nodes (alphabetically, by label).
>
> Major changes compared to v1[2] (more detail in the individual patches):
>   - Add default support not using SCMI,
>   - Drop everything related to SCMI.
>
> Note that this series does not use or rely on SCMI in any way.
> SCMI remapping support will be added in a subsequent series (old version
> at [3]).
> Full hardware support without using SCMI could be added, too, if anyone
> would care about that use case.
>
> For testing, I have pushed this series plus additional work (including
> a rebased and updated version of [3]) to [4].
>
> While I know it is getting late in the cycle, this work (especially the
> DT bindings) are a dependency for about any R-Car X5H progress, so it
> would be good to have it included in v7.3.
> Hence I plan to queue the clock patches (1, 3) in renesas-clk for v7.3
> (Stephen still hasn't merged my earlier PR for v7.3 anyway).
> Ulf: It would be great if you could take the pmdomain patches (2, 4).

Patch 2 applied for next, but I left patch4 for now as it didn't apply
cleanly (drivers/soc/renesas/Kconfig had a conflict), thanks!

> The DTS changes (5-6) can wait for v7.4; they have a hard dependency on
> the presence of both drivers anyway.
>

[...]

Kind regards
Uffe
