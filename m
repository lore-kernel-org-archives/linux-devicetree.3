Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AA7636604F
	for <devicetree@vger.kernel.org>; Sat, 18 Jul 2026 13:51:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784382696; cv=pass; b=UolnmnZ7ioQ+ULsUNU1VpLapyKd3NvosrQvCQoLIdtKT+cKRyjyC1A6EWfG6jSIoojdaDCXN0MfWxSumOfVD+FUl88jxUSGkEDX625qiAObE4ANf9jzZocXu0J6q+hS/GJ9QrrA9zM7pyad/LZhwVRHH3caPKAU4nObOYaVGjV4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784382696; c=relaxed/simple;
	bh=GJ4vORGIIxYlkFxuBUrulEsEPpSa1FrKLmQhJR2qMqs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OMx1hYCo7+tArCsPA4b/sn6qI0xZcPzWLe2R+XybB/65hu+RF57PE4VhnzsvxncYxdcq/31h3PNCimqG4Ut+R3qkYe1ZtXn7cMe7YLxsTK96M7z68z7ocUi39F9/pYK6NZ/i8ZzKZHnug2SY4b4XRWUuy5Fue0OihuEJ5uu8cLw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kmTBvc+1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LC+a5okK; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kmTBvc+1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LC+a5okK"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66IDCqUf568766
	for <devicetree@vger.kernel.org>; Sat, 18 Jul 2026 13:51:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	h0LDzrFeoD1nIFRMbEgilOOiROtLflOBJXGsK//Ifdc=; b=kmTBvc+1/9f6UNrO
	d23OjEK5WYSmDHRbVMmd1y4jwpFepf3ggubUcAjN4zu6WB+XhCFEVkt8/StOqy9O
	7nh8veEBsiNHyfk9Hu3YDagsEsztvUEWPgil9CFGG2sI3SIIow7RCDfAT/iLOZ2C
	MfvNvKMm5zVeN3fRwb2CRKOya6C4BqDch/OQFV4O3l+o+C/V0J4q86DE+bQH2pHV
	2XTxt+SJ7C7FvMSD0KCJi9kvMwGblvbK91Jc9qMZUK1qle6V7oUwt2DbY4xxdxF5
	v8LGx4KmdP/MKf7bzteeJtbXQuy5lSoYdFNxxW5GSomFXeQ0y9TVBz7UsVOVEG5z
	mB1FZw==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fg2bvrubq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 18 Jul 2026 13:51:34 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8fc92c5373bso158471986d6.1
        for <devicetree@vger.kernel.org>; Sat, 18 Jul 2026 06:51:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784382693; cv=none;
        d=google.com; s=arc-20260327;
        b=lrR/WlktUI8tJDR0S/Jskellslqv+VwNDjebpIIO+Jc1wapWfYqzicHDeqFqr2jBxJ
         gaZNnAEV+YceSxPtjeNF9rJxsBnzqrZS4VP4vqO78oiuRTdVWbT02+NrbnapCw7JGzBj
         3UMl7zHQOemUR9umer5M048HVUfp59tqiJ/AgUaZRCPMRb5fKNJUruSTUTLj8Z1lol4k
         rsc8wTwOwgSscMZAww7S3D1LnrfqIJ3RHeAfuSEiKHIybwdXhmVWFAFKQeie/s0Gy5+8
         Ff50kb4wMsZQocW3LgAI8ztrcbDcqTuanC9lNoBkmlWAZDMqgMEfGmF2H4wp9pbub2NN
         3wNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=h0LDzrFeoD1nIFRMbEgilOOiROtLflOBJXGsK//Ifdc=;
        fh=IqsFNY+H8fczxOPLza7ub6z3NPBM/D+nRkDdcFHtgnw=;
        b=DZwa3tEFmpxn6njWMp9TzZv79lcboDq4QkbVmEgB6rff3znCqTpaH1DESjqSVIk6qs
         c/CK2PuWHNLhlo1RR7ntOutDUG4BwPzGQtdhi7KHcr6hsOD+DY4h3UNZKJFJhq7Vs9y9
         4HTpD1HnbpMjEw+nOw0kcrKdZWsgQBqUuIAtbD9qWUj0D/KzsRH7UDEaM0ljNvaUHeOp
         VJckxlIhiO1AKejYIM99kP3RhMqXE1zV3gRbEKkdihHZBr+12rlbCtrYPLAFoMfPqmm9
         cwjvJ8l3TZxxCUz5e4iJ1t6QovdK5YmCbvW/lAkAXC7WiTVpqfpzo3+Y9Q0Mm7akS67V
         v7gw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784382693; x=1784987493; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=h0LDzrFeoD1nIFRMbEgilOOiROtLflOBJXGsK//Ifdc=;
        b=LC+a5okKkGqc1i5jDxtxvxsP7w1JXjQaQgbiPnIXpKrlordVkq8bgXhatcJVUVDXqk
         5s/qpRWl3daxhIXgjMnGX8mE0QMjf9YXLhJabkiMqNyk3yRbeSXNjReghx4qJu2ziRlI
         Exoup+hRiV17US2cmNtbnYztFhM1RgSkZG9S7kB6FSGG2FfTfcUMjG4TCGuuArGnrQ/k
         4zhlXmqnP4Guk0RZDwuoQOB2z2BGBk2MxdZmynlnS/gnE/W59avSnlXKqxzVn00dfNd6
         aR4XrAjY/QHi4C+CBgUnY6SJtVHQalDVKLaxfa59HD/PCBgnPWuAEUoUwPbcY3d/oU16
         VAQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784382693; x=1784987493;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=h0LDzrFeoD1nIFRMbEgilOOiROtLflOBJXGsK//Ifdc=;
        b=kp6ws26yEfecMVOKwnacpbPf6Aj7vz6LJJnElsiMcDYmDT6GSI0rC62nomrJyILsy7
         H1sBaz81m/oeGRIc6ZROULhppgxAiOeP+u5yqoBOo9sN1e+CwarRwa4SJwXxw9A1X6by
         KblmevAN90iE+I58QRYjgseI/l5vasmD3/7lrKfwntf/9mrlXkh2esVaZRUR5XaQsN99
         GZtI3KFDgwtVnqn2RER0pyBDI7vpogt8ZGfRIC6LLFweiRG1OZIshRK2AtEHF287xyyJ
         vOJgGow9PYP02lUHadIEx37S46+5+ZT2Qa5goDO1wkX+90rfN+SL9tK1lTrUkb4VdM2S
         mkDw==
X-Forwarded-Encrypted: i=1; AHgh+RrZSQWPpbn3ZciTwoq98gONQqolNMAMANOCeabOBSnkITEjxB9eUCLFgRX+3CCpygzw0W743K1j94md@vger.kernel.org
X-Gm-Message-State: AOJu0YzbwnorDN5fkEFfBtDaLPgNcRAhmnvgbd7t7U8iCZZzz9LBXIsL
	z71OWmk+Vj4Ha2GDQnZ4kUyAFZPDhSNkEPQ4gnqHbKPbppU5ksY1XPNfTJseHcBgKbDmFHoqO5/
	BiOFKB+xPMryNag+uNcgVW6qIeayHxlhPIjOkJyf+ozIMKjQxEC2C0uJDWmeen8i+wvDwC7J8od
	fUAok+Ahc0qOr3eg6tt2OAdiX+0fxzhZWvDehx4W0=
X-Gm-Gg: AfdE7cmxNpF0uVM0gyZjWfTd8BPOvEmRy2NisYEpKbtQaLscxIv6TQhuChDoOLazDio
	SG8pg0Utbpto5raz7DiE+WxWkbiVGVJpA6kb4HrS/ufXnbxR6IZjkPD5pMarrsV6dUP93vQxhDc
	Zb8KC8CMNXvtamxKjbK8rP9UEqCzoUs4oQMvni2y75lPy0hbxvGmYjHjJbUg==
X-Received: by 2002:a05:6214:3ca0:b0:8fe:40a0:7cbb with SMTP id 6a1803df08f44-9077836c2c3mr78395286d6.15.1784382693496;
        Sat, 18 Jul 2026 06:51:33 -0700 (PDT)
X-Received: by 2002:a05:6214:3ca0:b0:8fe:40a0:7cbb with SMTP id
 6a1803df08f44-9077836c2c3mr78394986d6.15.1784382693000; Sat, 18 Jul 2026
 06:51:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260717180536.1757204-1-kamal.dasu@broadcom.com> <20260717180536.1757204-3-kamal.dasu@broadcom.com>
In-Reply-To: <20260717180536.1757204-3-kamal.dasu@broadcom.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Sat, 18 Jul 2026 15:51:21 +0200
X-Gm-Features: AUfX_mxceEM8hrmycaf9FbC3SmLR0b8W_i-GeQO4FCaHQeB9TES-mXrM5A_U0JY
Message-ID: <CAPx+jO9uDjdVBFCmWwiQVL03mwy30rhVF7LaqWy3zzie8MHPUg@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] mmc: core: Add MMC_CAP2_NO_SLEEP_CMD host capability
To: Kamal Dasu <kamal.dasu@broadcom.com>
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
X-Proofpoint-GUID: HRykdiMkQmeiiCaYjlTzP3VbQGE133-k
X-Authority-Analysis: v=2.4 cv=EcH4hvmC c=1 sm=1 tr=0 ts=6a5b84e6 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_K5XuSEh1TEqbUxoQ0s3:22 a=VwQbUJbxAAAA:8 a=Q-fNiiVtAAAA:8
 a=q2u6sfwAdkFWnpq2sQ0A:9 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE4MDE0MyBTYWx0ZWRfX5LlxPIrTMS/R
 llXzKSUEsBAH9Obp09cbdc7j8z4vnf221MmSZMwDMrj6QCddpXufbRIQw+Sa+aNhLdL1ZL1IaXn
 +kGsF4qCIVGe9vvCU9DVTbmA7fUpfalbxdbkiEhhaUPBRU56Zg4nBHtksWw/wIZtvRFYC+nJpuM
 AYvWwJcz7v4YTxcns2Rf+5QFXYg8M87BRwVoWdp5tM4l7faHsJ42/WFZrLLO/g9kOdNoCyUk7+2
 apDFlhRSUy9Pvr0u/MyWRHQrPw0OsN7VmV2trjsnMSnI/gnEUKtvgT1H2HqhJdev/LKzAPDuyhn
 c2UqEq2ktsOXSBx0POAD+4LlIuZercj3ysYWsUssdBCrsvaOvMxNHke+T3L/gq4cIkgQtSWa0dk
 gRm/waowKUYYU7Ns7WvuJ+NJl8G3yP8QFcDt/kirgAfVcR9LktU8BkVBzPRfwWY6kTGkgLWSFXL
 StJCmocI+d+crHIkLJg==
X-Proofpoint-ORIG-GUID: HRykdiMkQmeiiCaYjlTzP3VbQGE133-k
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE4MDE0MyBTYWx0ZWRfX8oxD1i/AXXmr
 bVfgJbR79HdQn6Qv9Q1v1MCR5pNu+7VjX0qQ/k33d1Nkt3ebCEJw4V6atlVwDtsmOZzAyUJ/BBA
 eW8B0WL6NeTGynCJb+odsgxQFf7p38s=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-18_04,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 bulkscore=0 clxscore=1015 impostorscore=0
 phishscore=0 adultscore=0 malwarescore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607180143

On Fri, Jul 17, 2026 at 8:06=E2=80=AFPM Kamal Dasu <kamal.dasu@broadcom.com=
> wrote:
>
> Some (e)MMC devices take longer to exit the SLEEP (CMD5) state than
> their advertised S_A_TIMEOUT allows for. On platforms where a boot
> ROM sends CMD0 and reads boot code from the card immediately on
> resume, a card still asleep at that point causes the ROM to treat
> it as fatal and reset.
>
> Add MMC_CAP2_NO_SLEEP_CMD, settable via the new "no-mmc-sleep" DT
> property, so affected hosts can tell mmc_card_can_sleep() to never
> put the card to sleep, regardless of ext_csd revision. This is a
> host-level capability rather than a card quirk so it also covers
> cards whose bug can't be identified by CID/ext_csd matching alone,
> and it is resolved before the card even exists, avoiding any
> ordering dependency on when a card-quirk table would be applied.
>
> Reported-by: Florian Fainelli <florian.fainelli@broadcom.com>
> Closes: https://lore.kernel.org/r/20260413180551.3683969-1-florian.fainel=
li@broadcom.com/
> Signed-off-by: Kamal Dasu <kamal.dasu@broadcom.com>


> ---
> Changes in v2:
>   - Replaced the card-level MMC_QUIRK_BROKEN_SLEEP quirk (keyed off
>     CID) with a host capability, MMC_CAP2_NO_SLEEP_CMD, set from the
>     new "no-mmc-sleep" DT property, per Ulf's suggestion that this
>     generalize beyond one device's CID.
>   - Resolving the capability in mmc_of_parse(), before any card
>     exists, also addresses Oleksij's concern that a quirk registered
>     in mmc_blk_fixups[] (applied at mmc_block probe time) could lose
>     a race against an earlier SLEEP/poweroff on an under-voltage
>     path.
>   - Added Reported-by/Closes tags crediting Florian for the original
>     bug report.
>
>  drivers/mmc/core/host.c  | 2 ++
>  drivers/mmc/core/mmc.c   | 3 +++
>  include/linux/mmc/host.h | 1 +
>  3 files changed, 6 insertions(+)
>
> diff --git a/drivers/mmc/core/host.c b/drivers/mmc/core/host.c
> index b7ce3137d452..3bc19645ea96 100644
> --- a/drivers/mmc/core/host.c
> +++ b/drivers/mmc/core/host.c
> @@ -400,6 +400,8 @@ int mmc_of_parse(struct mmc_host *host)
>         if (device_property_read_bool(dev, "no-mmc-hs400"))
>                 host->caps2 &=3D ~(MMC_CAP2_HS400_1_8V | MMC_CAP2_HS400_1=
_2V |
>                                  MMC_CAP2_HS400_ES);
> +       if (device_property_read_bool(dev, "no-mmc-sleep"))
> +               host->caps2 |=3D MMC_CAP2_NO_SLEEP_CMD;
>
>         /* Must be after "non-removable" check */
>         if (device_property_read_u32(dev, "fixed-emmc-driver-type", &drv_=
type) =3D=3D 0) {
> diff --git a/drivers/mmc/core/mmc.c b/drivers/mmc/core/mmc.c
> index 05444ecf3909..5e80fa5c1a28 100644
> --- a/drivers/mmc/core/mmc.c
> +++ b/drivers/mmc/core/mmc.c
> @@ -1972,6 +1972,9 @@ static int mmc_init_card(struct mmc_host *host, u32=
 ocr,
>
>  static bool mmc_card_can_sleep(struct mmc_card *card)
>  {
> +       if (card->host->caps2 & MMC_CAP2_NO_SLEEP_CMD)
> +               return false;
> +

No.

As I said several times by now, we should not just skip the sleep
command, but rather always keep the card powered on.

So, instead I suggest we look at adjusting the code in _mmc_suspend()
to cope with this.

>         return card->ext_csd.rev >=3D 3;
>  }
>
> diff --git a/include/linux/mmc/host.h b/include/linux/mmc/host.h
> index ba84f02c2a10..0447a8efed50 100644
> --- a/include/linux/mmc/host.h
> +++ b/include/linux/mmc/host.h
> @@ -463,6 +463,7 @@ struct mmc_host {
>  #define MMC_CAP2_CRYPTO                0
>  #endif
>  #define MMC_CAP2_ALT_GPT_TEGRA (1 << 28)       /* Host with eMMC that ha=
s GPT entry at a non-standard location */
> +#define MMC_CAP2_NO_SLEEP_CMD  (1 << 29)       /* Card can't reliably wa=
ke from CMD5 SLEEP */
>
>         bool                    uhs2_sd_tran;   /* UHS-II flag for SD_TRA=
N state */
>         bool                    uhs2_app_cmd;   /* UHS-II flag for APP co=
mmand */
> --
> 2.34.1
>

Kind regards
Uffe
