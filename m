Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7420369D40
	for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 15:42:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784907761; cv=pass; b=YMqVM5iWz82++QcCpkb4gVUiZstO/J5m0/xF2UuB7kHV+f+OB2mp82KsG1m077SyJzHuOSyMApYWZfWNBvzzA9QjcOllgsf1zldspdYM5c0Xly4ReACy+qhuDasabQkJ65C4fMACpgK5vErUXNSYtgPbuSTAY3STFUe89dqiVRw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784907761; c=relaxed/simple;
	bh=ewRyTZoPzPlVOO7bCb8xsEJPyu8wXAbtTcENSiwB22c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MrJtcNmUtGofMmGrhbR2xSTjAqCLs72OudgBKP9aes9Fx5lS+PM9mzk6lG1hq0ibHPd8w/OnlbULS5j5zC6rnVKGtiOp/NUoWytIqPfVi7vRnWX/ZYncUIF7Q2BtF2vM2JMBYYQhsNTAImLnD5LhgatOSQZSZSMkaNGGInMum/M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Sa7wwMgk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Xd874ZXv; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Sa7wwMgk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Xd874ZXv"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66ODbE6A2710201
	for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 15:42:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	s5MCTGGOxKyChbUgvWH4NLTfLK0OcoUmDSCsvphFgVw=; b=Sa7wwMgkHwpI3dYv
	sl4YD2Q6vxc/Y1r7L+pavTEP8cDGMAgXbhRthx17EF2bfolHzCOOgLICDa0FoUAh
	pBdQNit/MXaq6UvOMAJDMbOxsUBfx7PY8UT1wdYgVwpEAcf25qCblWMpGnscotmr
	fVsA8MsTJxky1ImtvJz8kW0P0G6DZYyhsQFuXSpBNciPi1FE1tW1fkU6sbNIDms5
	2jQ8FQemnbfvjdFCsMU/c5Zcv6ufWsxhpVvR7QMPYwVWQOsRVA1ke97T7RULNGsF
	4/Zsb4Y1+gt89LaTY9c0fhGCS4HPGOjQhIwoK7fdcc1Wwb09wbcvUIHjNJ2uxfxz
	uKlnWQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fm8cggmw9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 15:42:39 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92e52306621so74729085a.1
        for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 08:42:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784907758; cv=none;
        d=google.com; s=arc-20260327;
        b=f29FJdWP4XsxDA+CCyLTrOkdhiuisNAWi7/0tr9NSCDc0bF0i36YsoGc98vn8PFsTv
         0t3cp2qJ1odzD9SwxzIRul05qqpQYyDkeyRkgExMP+YdW48EeGmfHeBmBXL5Gs0+rQKU
         w6ag1tsDtJXr7A/4Pj94NNUKPKgKq/uORmiBthF2GZNm64y2t8HUp6G+uUvu55yv6RGn
         q9AmjHwT/r5t+hop2TAIZxnL9mRulKvsEXmdlrSbwE2DS8elKylGFmJe6jYFF7srZwcZ
         xBHPXHZ+30lKrzfb3KrZUs66tlNqHL11YmwykNP4BCiFBq71Fl60ynfVMHj69aRIxXy2
         yF9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=s5MCTGGOxKyChbUgvWH4NLTfLK0OcoUmDSCsvphFgVw=;
        fh=lsXyQfSFHeSWW/CFXYjETYQqYXwCx6Tk3fv0UzjAYRE=;
        b=AbEz7rsoUALzm5NRfnBgrnvKPWBpkkfBv7uSRTz5dppTWeEgS2yrhIpdXdB/AUNtEG
         6sxUwu3dOKZftjAk0DvgnMFioU8bvaaZMCJVO28cPEMn9uUKXHMncXgIHyciXEFYzz4f
         KU7Z+esuz1M4ZWXI4TAoP0lGxKMGWwbO6qf+ulBW1bZYnTVSTw9ykqocfgm5pKwgPrXk
         iivGPcEdBJ30MPv31ugYyVbUfKp0F9rLeu+Fn49wchJt7Riu8/w2oTTloKKIz+wyObad
         VUA6cKWbvUMu8B2jVLlkCpK0GAod0nETmGroWGwhDZ6jG7/YNy19SVb2owbXSYhKVBU9
         6S/A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784907758; x=1785512558; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=s5MCTGGOxKyChbUgvWH4NLTfLK0OcoUmDSCsvphFgVw=;
        b=Xd874ZXv2SMuneWpMfH6E22/H+f+Jdt6QgN8+jJ064yhJPxo5lYHweF2BulPfTAjMd
         FGRxN9WzbIAT/45ADnTkTwdYERxTQ5w+uXSYp1x3bUok5OmJ07g5gd9N49WXeFWyXaXx
         /ivtBURNtZtpav+xze6WxKcRmmDBKHoGzBrLG3Nq0DZL27hPr/VUjWd4n3L9SKSB+5oR
         TD3f7qONq61B8Wyq9mQis1YDIXtMxQ3v+XTyAKPCJNk3XVeGyk/3HqRAGXnsyaCc/83/
         VVojZNIvap2b+7ItX1Oevu3dcfFT5TfqyNQOkdXMnLFDEFkggJxRblewJIyP5o+190bk
         bjlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784907758; x=1785512558;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=s5MCTGGOxKyChbUgvWH4NLTfLK0OcoUmDSCsvphFgVw=;
        b=noTaDsz7+mXAG5M/uhyTNH7mMe2OzV86HTaB+Z1p43ykZ0YD9VSXYZf7TdQAVpe4UJ
         CvLxSvGHMoOSZCOcm+k1bMm7Oo3PYvBM2IDEhy3WceZmCLE2r7zZS6dj9Ddt8b0whJ8D
         U5IuhTaoS6Zn0WtzJ3KSrd5kUgfCUcvd00fiCI7m2uPCCrFAdQjiMYyK36/3/oNu0vjf
         H38fbnCpQoiAhuLuXHDAINN6KotDn0TqIKQW8Ox+clC9pJelhEQ9/ujNADA55Jfq1nQ+
         AigIgDL6SBqiK3EWzXISA36Hww1UuLnWb3E96COV53oyjTeH9bOBdsOH2EUBnQRa/g3l
         pFyg==
X-Forwarded-Encrypted: i=1; AHgh+Rqd2doI7+N6k3mwSLO3jfcZ2JWQ3bxmL1J6+wBqBdPCwq0Pxf83WYWoAdp2CBDqh48b8DmHPJ5i5A0e@vger.kernel.org
X-Gm-Message-State: AOJu0YyAS9Z1qrNDBwKYlDMgrdJH8LAwWB5Pq/wuxc6WObd8zkWUmGr8
	EBBfV9HHs6TxWDlom68uk/Vx6OXNgJZyBc0fYDBiJZCIhTvVfnidXsyd+TtKOGlFC/hjBMh54O7
	70Du+iPa3YM/N5ZiKmZ71pIBmhlb7pMM9svo5YdUGToPQYsPedbyu1BeS4HU1Fcd0QA1sn5uKm7
	GtaJkXiZYI3dOWWWeRPgVZ1EZAN3sTv6/YJ7P8nm8=
X-Gm-Gg: AR+sD11T6Ifa3+2/XejWgLlmHrj9cvUIKjcuc8Qy5YOuqAwbxVpAjQ6qSzFpjm61JuY
	/FSl7Zlg7cP1DTwNi7xTfme1yJiKKYeTQf9jDeV9SUyoPlLQHUO3d3MRQEcWlExnTkKx9FkAoKX
	JyZb1krwBaEcWbm/BWGDXcYwjfPRKy8WiF93DUhY7DXwXROSGdOEWvmzjqPw==
X-Received: by 2002:a05:620a:25d4:b0:92e:bd6f:b166 with SMTP id af79cd13be357-9310375096amr784274385a.63.1784907757985;
        Fri, 24 Jul 2026 08:42:37 -0700 (PDT)
X-Received: by 2002:a05:620a:25d4:b0:92e:bd6f:b166 with SMTP id
 af79cd13be357-9310375096amr784270785a.63.1784907757475; Fri, 24 Jul 2026
 08:42:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260722211417.3702709-1-kamal.dasu@broadcom.com>
 <20260722211417.3702709-2-kamal.dasu@broadcom.com> <20260723-venerable-infallible-oriole-434b75@quoll>
 <CAKekbevxiN=8q60sHkRLKzEwc75PYHO7nJtMEahLF+u39g-FBw@mail.gmail.com>
 <1a9d18ce-e6dc-40e0-aa2a-e27f694e1217@kernel.org> <CAKekbetBskYyteYn2bMG+fNZrGhEQziZB3p+bKOvjx1CWRZA8g@mail.gmail.com>
 <5021dbc6-35a7-4af1-bc7b-d918faa2c4fc@kernel.org> <CAKekbeuMtzwYWax97DRo89p_UnG-Gg0ALnhRNFjS-XP9-KV_WA@mail.gmail.com>
In-Reply-To: <CAKekbeuMtzwYWax97DRo89p_UnG-Gg0ALnhRNFjS-XP9-KV_WA@mail.gmail.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Fri, 24 Jul 2026 17:42:26 +0200
X-Gm-Features: AUfX_myPitbhtSAYe2pom2RD7VyQs4h4gVWgL8zeO5fMVxeiyxb3lksKqQ7Nr4k
Message-ID: <CAPx+jO_3hThwL+VMuY+5FzRMtWz5rHiQ146Ut5BXhJqSs7z5ew@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: mmc: Document no-mmc-poweroff-suspend property
To: Kamal Dasu <kamal.dasu@broadcom.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
Cc: Ulf Hansson <ulfh@kernel.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Oleksij Rempel <o.rempel@pengutronix.de>,
        Avri Altman <avri.altman@sandisk.com>,
        Pedro Demarchi Gomes <pedrodemargomes@gmail.com>,
        Erick Shepherd <erick.shepherd@ni.com>,
        Adrian Hunter <adrian.hunter@intel.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-mmc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=JOMLdcKb c=1 sm=1 tr=0 ts=6a6387ef cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=DJpcGTmdVt4CTyJn9g5Z:22 a=Q-fNiiVtAAAA:8 a=VwQbUJbxAAAA:8
 a=TKXKUnsDEaH6mrR59pMA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: l6k1qk8R5HwBL-wddLi7ri-vPx5q11iY
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI0MDE0MSBTYWx0ZWRfX/wCT9dapKwST
 +GtFKU6ndU8812JLYhWRSJXlhmQ5DUjKF/X9tYK0+qcCA1nDeC8hcv82aKwvNxkmHojW9nGfUqx
 TvdjDGuGeY2nkOH4vMCpABrEgK3UA4M=
X-Proofpoint-GUID: l6k1qk8R5HwBL-wddLi7ri-vPx5q11iY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI0MDE0MSBTYWx0ZWRfXzQGm1AaHeN/H
 tIIq+RFu87zyN6GqLyxEQjXwwZAGzV0mSm5Xe4cC5vWxtcukOgf2Kld1bXow9GNHC7IzyiylQUR
 jRIEH8ce+sphLiOksP5CjNDdDIcZn2Hst5pT13ZObdsE7svTQjbVRbPz0XvS5w6LaQTcJdhDBb4
 GS6+FxcOtYlwmVj0I4R8rakvIzgzE1cNLce+M0MGetclEheJMVIsnFFMvivDwbLa3flVqUA4UsC
 2Z8yiZds4eTCW1KrF1CNbQgHX9mUCP1w5R/TNuSslQvQNHgwl0SZBFi7stEUbkZgDYMNghW2QpM
 c/xTypo/vF2SFeNfHTu96hChB1ViVQ8zIw8srlWayMo5ZvheVkIOyP+W9JBsVpp7IM9V5CHIiFU
 gzYMSiLbgNz3wfy0xxoeQS++Z9YNWixz7A+dCWomQFS5EfHKuogUF8TCd56QPseE0R8IgGX+Nse
 ihfUQhWK1i7iAIzqIDQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-24_03,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 impostorscore=0 spamscore=0 bulkscore=0
 clxscore=1015 adultscore=0 lowpriorityscore=0 priorityscore=1501
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607240141

On Thu, Jul 23, 2026 at 9:51=E2=80=AFPM Kamal Dasu <kamal.dasu@broadcom.com=
> wrote:
>
> On Thu, Jul 23, 2026 at 3:36=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.=
org> wrote:
> >
> > On 23/07/2026 21:24, Kamal Dasu wrote:
> > > On Thu, Jul 23, 2026 at 3:01=E2=80=AFPM Krzysztof Kozlowski <krzk@ker=
nel.org> wrote:
> > >>
> > >> On 23/07/2026 20:53, Kamal Dasu wrote:
> > >>> On Thu, Jul 23, 2026 at 3:51=E2=80=AFAM Krzysztof Kozlowski <krzk@k=
ernel.org> wrote:
> > >>>
> > >>>> On Wed, Jul 22, 2026 at 05:14:16PM -0400, Kamal Dasu wrote:
> > >>>>> On some platforms, firmware accesses the (e)MMC card directly dur=
ing
> > >>>>> system resume from Suspend-to-DRAM, before the kernel's own resum=
e
> > >>>>> path has run, in order to load boot code using hard wired logic t=
hat
> > >>>>> is not field updatable. This requires the card to remain powered
> > >>>>> and responsive throughout suspend: it cannot be put to sleep, sen=
t a
> > >>>>> power-off notification, or have its supply removed.
> > >>>>>
> > >>>>> Add a no-mmc-poweroff-suspend flag property so affected boards ca=
n
> > >>>>> tell the mmc core to keep the card powered across suspend instead=
 of
> > >>>>> sleeping or powering it off.
> > >>>>>
> > >>>>> Signed-off-by: Kamal Dasu <kamal.dasu@broadcom.com>
> > >>>>> ---
> > >>>>> Changes in v3:
> > >>>>>   - Renamed from no-mmc-sleep; dropped S_A_TIMEOUT framing per Ul=
f.
> > >>>>>
> > >>>>> Changes in v2:
> > >>>>>   - New patch, replacing v1's card-level quirk, per Ulf.
> > >>>>>
> > >>>>>  .../devicetree/bindings/mmc/mmc-controller-common.yaml | 10 ++++=
++++++
> > >>>>>  1 file changed, 10 insertions(+)
> > >>>>>
> > >>>>> diff --git
> > >>>> a/Documentation/devicetree/bindings/mmc/mmc-controller-common.yaml
> > >>>> b/Documentation/devicetree/bindings/mmc/mmc-controller-common.yaml
> > >>>>> index 3d7195e9461c..5f7b3f8ef1dd 100644
> > >>>>> --- a/Documentation/devicetree/bindings/mmc/mmc-controller-common=
.yaml
> > >>>>> +++ b/Documentation/devicetree/bindings/mmc/mmc-controller-common=
.yaml
> > >>>>> @@ -232,6 +232,16 @@ properties:
> > >>>>>      description:
> > >>>>>        All eMMC HS400 modes are not supported.
> > >>>>>
> > >>>>> +  no-mmc-poweroff-suspend:
> > >>>>> +    $ref: /schemas/types.yaml#/definitions/flag
> > >>>>> +    description:
> > >>>>> +      On this platform, firmware accesses the attached (e)MMC ca=
rd
> > >>>>> +      directly during system resume, before the kernel's own res=
ume
> > >>>>> +      path runs. The card must therefore stay powered throughout
> > >>>>> +      suspend, and the controller must not send it a sleep or
> > >>>>> +      power-off notification. The kernel re-initializes the card
> > >>>>> +      after resume, since firmware may have already reset it.
> > >>>>
> > >>>> Isn't this exactly the same as keep-power-in-suspend?
> > >>>>
> > >>>>
> > >>> Not quite, though I see why it reads that way from the description
> > >>> alone.
> > >>>
> > >>> keep-power-in-suspend only takes effect through host->pm_flags, whi=
ch
> > >>> gets set at runtime via sdio_set_host_pm_flags() -- an SDIO functio=
n
> > >>> driver opts in from its own suspend() callback, per suspend cycle.
> > >>> The consuming logic lives entirely in mmc_sdio_suspend()/
> > >>> mmc_sdio_resume() (drivers/mmc/core/sdio.c); pm_flags is never read
> > >>> in mmc.c, which is what this series touches.
> > >>>
> > >>> no-mmc-poweroff-suspend differs in two ways:
> > >>>
> > >>>   - It's a fixed platform characteristic, not a per-driver runtime
> > >>>     request. There's no SDIO-style function driver to call an opt-i=
n
> > >>>     API from for a plain (e)MMC storage card -- the requirement her=
e
> > >>>     (firmware always touches the card at resume, on this board) is
> > >>>     always true, not something decided per suspend cycle.
> > >>>   - The resume-side behavior differs. keep-power-in-suspend without=
 a
> > >>>     wake IRQ does nothing at resume: it assumes the card's state
> > >>>     survived untouched. This flag needs the opposite -- keep power,
> > >>>     but still fully re-initialize the card via mmc_init_card(), sin=
ce
> > >>>     firmware may have reconfigured it while the kernel was suspende=
d.
> > >>
> > >> All this is just driver stuff which I did not ask about.
> > >>
> > >> The property is described pretty the same - do not power off during
> > >> suspend/resume.
> > >>
> > >
> > > Do you want me to fold this change into using 'keep-power-in-suspend'
> > > for mmc as well ?.
> >
> > I don't want a new property if it has exactly the same meaning. Of
> > course I am happy to hear why the property has different meaning in
> > terms of hardware description. We do not talk here about drivers, obvio=
usly.
> >
>
> In terms of hardware description, yes, it's the same meaning: don't
> power off the card across suspend/resume. I've folded this into
> keep-power-in-suspend rather than keeping a separate property --
> extended its description to cover (e)MMC alongside the existing SDIO
> wording, and reworked the mmc core side to honor it for (e)MMC too.
>
> Sending v4 shortly.

Hold on, this isn't what is needed from the HW point of view. At
least, according to what Florian told me from the earlier discussions.

What we need is a property that means: "Keep power in suspend/resume,
but also re-initialize the eMMC/card at resume since the FW have
fiddled with the card before the kernel resumes".

Kind regards
Uffe
