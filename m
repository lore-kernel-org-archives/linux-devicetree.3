Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9223148F826
	for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 15:40:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789141250; cv=pass; b=Lyd+VqbUxswYuN8Vc1o/O5zV2DQ8UVqEAqC7eplb10UfwVf+5ZxEmWGey4tzHC2koLVbdhSko9qqtIgXKssIFC5a+zP6mmhkaCgXiskzZ+hEQ/2mlq7/8Te1fi3gVhnQ/nQo8WL+DTMqFSOZc1caQGKO6Kcvcun3QD7VTg7n/vg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789141250; c=relaxed/simple;
	bh=kQXQO0oghS8R0ta0G4UMFCbDP7svrBfBTLWTZIZ07no=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CqlNFrvr5um+zR6PEXgI6JLWWBbppgHHBBPHTwQqZtBexDKVAVgtN6Eon6ZN11X9wQiqzILlAH8rgQzkzZNgOQtOaLxmNrzvYQHHv28zkkOQ5P/S6SjlmPzHgR4EzF0J0amZW5gbg3kBrMes0Z6tH/UcqgMMLne8JzXptor+chU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=I3TZVEPX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GorZ9wpV; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="I3TZVEPX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GorZ9wpV"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68BEmAws222575
	for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 15:40:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9gVRbTQP7+HXM2XZul7tJ0soNXDAB0XswIPF3ZiIrx8=; b=I3TZVEPXZXd1Os5M
	NrODBZZh7T1xCUBzKFyUjkEAOKX+RRhB0xUdUtqnXOD7wpDfJgVcM0P8ZAzbzvJL
	17AjNsRXhsgYC5/xF3Hz+eo0TceSARvcGYLMIQwqFJRdfdKtgutrri/KzKcvQE7q
	28Rok/kNb+0XzN8xl2dgjNWrDHiJ/ENoqsceZe9haNYmE2I/eUyUlVT2J1t8q6QD
	SLrrbQEDq93v0gaYF4B2SeI1gp521usXrUP7WHGlDJXSRZNOLmz1u4BX4hHyEwrx
	XGTXtD2+scqMlbuWYo/tagR/1XZRpd1B6QX0sGpdvpj23BhXJClvEu8QAj32QnDw
	vQqPkA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmbdragka-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 15:40:47 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2db0a41434bso18090715ad.0
        for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 08:40:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789141246; cv=none;
        d=google.com; s=arc-20260327;
        b=kfOZw1fJTM8MepCerwEd0o0RPfJXmijaxwJpPKddbhhDgBWrXJPRuUziwFYwzzRn/B
         HDgxn+o93mv33qJ6ubbD0+cBtluuXOrTYiJPiD0v4unSYeBh3eMvQZ0b7TQK3XolV8Z1
         o7z0CEloG2k2uBBdP7ZbQcxhGCWPDEGvBd8gzcL+0UVXQIe0sT+Dux8yPXCbjDnLHOX9
         XqgJX3HFM64SecJdrB0ybFlDMD7vVIVl828tne3PzmAgp4fHwAQqn8/I3oFimf6f1k58
         jug2TB+nCwVDyGn43BilOfr2mJG51QbpFVziuw9b5LCMV319oN6nePx5nWJ6EGrJoMRI
         jZqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=9gVRbTQP7+HXM2XZul7tJ0soNXDAB0XswIPF3ZiIrx8=;
        fh=QpUkxBDdUhU0QMxY59Fyq/IyzNjfX2L6XW1okOaUKKQ=;
        b=TPblizx2go5pqyG6IPQxhSsPwQcBfxSyXCBomn0sCQ0BkT3leAt0JwFeiQKwBAxDqc
         42g4zCgSSxbaOXg5baBDmSiyEQcXzMGqprn6dvxX8C315QpzRe6RiAyytclA1K9/4yS9
         HFysu810AeYg12d771LPRbvH29MiOEgvH7Ti1aZ9KP25xlr1AJ+QGg9MNxgkBYn0GI7+
         4FO7mpqSusPJ2yuDaHrwZqFZ21u6MAYbqvgt/n5FmrJ+kh1X88T4uB0bLtJcRtJmETeJ
         e9OiDqbf18HBVSMl4BuQdiTzcsCmUIHoMqS22BpMZDQ08dtEoilqlEOEjCrJaIH6gEwV
         fzEA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789141246; x=1789746046; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9gVRbTQP7+HXM2XZul7tJ0soNXDAB0XswIPF3ZiIrx8=;
        b=GorZ9wpV9CtedjUZufW9tj8EbQQJ8CzKEV18Q/7f1bIR44tG+7SNNZhetOCFHOIcR5
         5lC+6Ds0UF26E+PhZn6lXLc2S6NeGra1tfz61Id5aOcySB3yaJ9Q5mC12yOkknCFObms
         yC6BpHUvgIAm07j0kL8rSQzl9uXvi3ohA85uZQbdzACnI0/lBpal5B9yCkNESAwnEieV
         zEPBzCcjrGuhK9r26EqCpWopMe2mNKPJZiQnvE/W7AOt447QQ7RyQad7BYFHuzAMVhZc
         82blQxB8yicaJiJNE/cJMXfvQde/+zDmVhTVJ2ftTgm670AImChN24bX1/qzw2WEWGxb
         63TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789141246; x=1789746046;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9gVRbTQP7+HXM2XZul7tJ0soNXDAB0XswIPF3ZiIrx8=;
        b=PCpNEy4zGVZyZq1PZuLII0z7+DB49gIm16Sa41jjA3b3TpMClY/9uxxM9SnyEnEHXN
         W4dL95jYHd+TEd2V7q3ReXbyD+bBwTRLI43b/qef2wwh55mILm26p5hx7B7GOsydy3gC
         UK/iofdsTC68jx9GMDqF7LolQGP2K19F5XOQ/xXRwTyJiXyDC+5sqNDDV+BVh/JIx09V
         psva/Cl0wxo7glpq97mJ/DZFtWKLyv56IQ3j/92H34uI0XQYisbmKW+vhjaWigViQ24u
         QucBYNUR4fKVo1acdalJ+Y8uALIgm34YjOIKAIIMPoaNbetYsnF5woU8NsjDmYLQyYtf
         0J3g==
X-Forwarded-Encrypted: i=1; AKwUvBxhP2q7+83ptIaIa5SE9mDeph/CfscjxgLeCVXngSGn9CvVJ67WCcXG+660ciB73gR2r3zTtOCPUWTC@vger.kernel.org
X-Gm-Message-State: AFuF++mfkV9V3Dialrsv57rx0iLuH6z1E42gsCMq/7RfkailcqvlGhmg
	gViRHvHKJaWHhX93DaOTQ8VEqQQeRstosDSnamruHJLHWYVw0fr5V984wybP0U4TjjfSwhPA3YH
	LsGSnPOFqBKKXOkZpPV/Riopkg9irPgQRMYw32AZLg0RLFlW5d3SAXzx+dtV+XkZaurzo+CrxRf
	s627HuWDf1sNFCuzdyb61Wv6aIaCNf6DaDeQjZdIE=
X-Gm-Gg: AYBFou1+lMZzvBIOdmZaIq2zBEvs713FsZyyGjxfbjOzRQ/S2mg00XyKwiRipYhN+sH
	t+YxsOjgYqtVojoa7lOGpzRl99CzL+n0aqYdnxQt8ICd5RA8nocFeFy5OF+Bz/FEsV49Hq4sSGl
	3/EnAKqslDk0AyBIFWyXxpKkhMbwsa2ySJc2y0rAhaUBDbkHmv9q1eDS8oyw==
X-Received: by 2002:a17:902:d551:b0:2d9:4871:393d with SMTP id d9443c01a7336-2dd2a45aef6mr95924835ad.21.1789141246350;
        Fri, 11 Sep 2026 08:40:46 -0700 (PDT)
X-Received: by 2002:a17:902:d551:b0:2d9:4871:393d with SMTP id
 d9443c01a7336-2dd2a45aef6mr95924275ad.21.1789141245940; Fri, 11 Sep 2026
 08:40:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260905153234.133217-1-tanure@linux.com>
In-Reply-To: <20260905153234.133217-1-tanure@linux.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Fri, 11 Sep 2026 17:40:34 +0200
X-Gm-Features: AcwNN1XJiqHpLAh6BkLXLC9WoOCg1aSLupw2Vf07ULv13DKT3f9hOH1d-RT7-pQ
Message-ID: <CAPx+jO8oWZxgkWTv3v5odp8K2oWMY-KhJVR3U+iqY4mQ9LrG9w@mail.gmail.com>
Subject: Re: [PATCH v2 0/4] amlogic: t7: give the MMC bus pipeline clock real consumers
To: Lucas Tanure <tanure@linux.com>
Cc: Ulf Hansson <ulfh@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Kevin Hilman <khilman@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Chuan Liu <chuan.liu@amlogic.com>, Jian Hu <jian.hu@amlogic.com>,
        Ronald Claveau <linux-kernel-dev@aliel.fr>, linux-mmc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: jEbfIm3emoCXjfOX_HXPwYrzMd4Tq11z
X-Authority-Analysis: v=2.4 cv=PLmaavqC c=1 sm=1 tr=0 ts=6aa420ff cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=rJkE3RaqiGZ5pbrm-msn:22 a=NufY4J3AAAAA:8 a=yCDuxKIkwSfSSdlP9cUA:9
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22 a=TPcZfFuj8SYsoCJAFAiX:22
X-Proofpoint-ORIG-GUID: jEbfIm3emoCXjfOX_HXPwYrzMd4Tq11z
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDIxOCBTYWx0ZWRfX8voqv0CVFTq4
 q37MvbESSNSW3jAAtb6scvV3R4cnhw7C0fTwR5TJrhTxbbyI+ZG1m8nhC3JPs9BogQ48DJsshb/
 YApBVcZB04dpBoqIcvlf/NX8TNXzgJY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDIxOCBTYWx0ZWRfX5uoGU7ZqRziS
 fbXva8ueIWBtYFdguzinkoLXt64rPL7XdBZvNQSkTAHMSj/MM6Fl891l3LGBfPrGI+X7S7Z5X36
 EC10/906DEz9b8pijNS2iNLHKiL9MjnnAUvwOaoxvEB5LZlX1cn4vYXCh5fyVGdNnDMJ9SnMkDi
 BmjojsAMkwZiOhBs9HpAno23WMbsOmbT8yR/frPFMU+u1b85gWSBAlt+jUY5r6hEefChp2daNMH
 7QDiF/MmzmZBJcbypQUT1kki/XmPKSl0Q2hXoFBizFnAdcL3iBAXPNTJ3+ypCN1IrJdvCdO0PHR
 lJYl+shQvnZ6FZ5lENO4R8SEh4QsKFAeVTRL2L/m7aHafbokrP4qolzlzkDHwOaJ6o9GYsDsj8b
 +hVI3tr4eH/C2qT/+T2IOk9NJBcLoTSzulBGeRApPkwQy1+tpYoAN7Jxx2FEyrHIPR6KAJfbjum
 z/Gl6X0W5Y6wTMZnxKQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_05,2026-09-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 spamscore=0 phishscore=0 adultscore=0
 malwarescore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609110218

On Sat, Sep 5, 2026 at 5:32=E2=80=AFPM Lucas Tanure <tanure@linux.com> wrot=
e:
>
> The previous series for the intermittent boot hangs on the VIM4
> marked sys_ampipe_nand as critical. But as Chuan Liu from Amlogic
> explained, sys_ampipe_nand clocks a pipeline stage that the
> hardware design inserts in the bus path between the SD/eMMC
> controllers and the NIC_MATRIX fabric to help timing closure.
>
> So the clock has real consumers: reference it from the three MMC
> controller nodes and drop CLK_IS_CRITICAL instead.
>
> The series crosses three trees; patch 4 (clk) must only land after
> patches 1-3, otherwise the DMA hangs fixed by 43e1705ecab9 come back.
>
> Changes since v1 [3]:
>  - Dropped the Fixes: tag; this series is an improvement and should not
>    be picked up by stable (Jerome Brunet)
>  - Moved the patch 4 dependency note below the --- so it is not kept
>    for posterity (Jerome Brunet)
>  - Dropped the e-mail address from the Assisted-by trailer, see
>    Documentation/process/coding-assistants.rst (Jerome Brunet)
>  - Fixed the space-indented error path added to meson_mmc_probe() in
>    patch 2, it did not pass checkpatch
>  - Dropped the CLK_PIPELINE() macro from patch 2; has_pipeline_clk is a
>    capability flag, not an SD_EMMC_CLOCK register field
>
> Thanks,
> Lucas
>
> Lucas Tanure (4):
>   dt-bindings: mmc: amlogic,meson-gx-mmc: document the T7 pipeline clock
>   mmc: meson-gx: enable the bus pipeline clock on T7
>   arm64: dts: amlogic: t7: add the pipeline clock to the MMC controllers
>   clk: meson: t7: don't mark sys_ampipe_nand as critical
>
>  .../bindings/mmc/amlogic,meson-gx-mmc.yaml    | 29 ++++++++++++++++++-
>  arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi   | 15 ++++++----
>  drivers/clk/meson/t7-peripherals.c            | 10 +++----
>  drivers/mmc/host/meson-gx-mmc.c               | 20 +++++++++++++
>  4 files changed, 62 insertions(+), 12 deletions(-)
>
> --
> 2.55.0
>

Patch 1 and patch2 applied for next, thanks!

Kind regards
Uffe
