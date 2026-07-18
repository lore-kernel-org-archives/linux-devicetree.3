Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 545DF238C2A
	for <devicetree@vger.kernel.org>; Sat, 18 Jul 2026 13:33:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784381589; cv=pass; b=l9uAz5vC/whXXaYyiGUNKOB4Q9XBnsxvDloRHZtShUsX/14CX/LkWTivsymlz0D/GOYAUU/o0xSC6O6NczayfmHh203yj1pKZaNLsoxqgR7DRqySTMNkkwXAzICUUd05FID9w+UC5W3N9BwRIVzmbbN25NYanj9TMQKCQESij5s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784381589; c=relaxed/simple;
	bh=HanH8bEZTzNYtaOvaRRl5NwwwHhb8nLc//DBSm0XnGo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=H0VUsPVYdvTbopfsVMwWieCE3odB5KepoF4T1UGYnvtDDsFx/a5sBYKZZzn/BdW0zOn2JPMgmgqlnWr314T9tmXe7M56G9GHtXJZRCnCngYU9xTwOU/RUO6lahjDZtQIf3OG+76v+IWW1oEEqBOB9qKsa71wRvHF/yIp/QfxVaI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UBcGQ8FA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XwBHQEPY; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UBcGQ8FA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XwBHQEPY"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66IDDJg6385745
	for <devicetree@vger.kernel.org>; Sat, 18 Jul 2026 13:33:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	42FNr3At/x5ESx27Y5yuzAt/FdNQD761VHVo+BbeSUs=; b=UBcGQ8FA39UiIjgf
	sFfg/Jmjmhd/Xb+N46OXM+rdu3MdVNM2w2CfmUcEOf5CdQPliKo+WoRBIGm+3upW
	8HsbnuxxLHZQwq/UFkp7S9dl6QsNWYKLP/USny9okq3veeJLwUEUvrenAhGfYUj3
	geqATmnspv5wb4KyMLXgw+bix056uxlZFFq1A5LhWkApyQssJFiNVJuLr5PdMe3O
	e6j5y4tsB0CvnfeHZfWJdw+QZ6buTfiU2N2rKE3K4+8la3P/PoNIywyXbH9LvqCv
	LlYwm4sfaF617+QPeu77d65Cq8PGy/7OsUIJE4O84e6KsMcCJfR9MGONmnngJ2a9
	Hoh6Yw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fg2nhgsh6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 18 Jul 2026 13:33:07 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92ea24a2db9so1571725285a.0
        for <devicetree@vger.kernel.org>; Sat, 18 Jul 2026 06:33:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784381586; cv=none;
        d=google.com; s=arc-20260327;
        b=NbxHJTl6VpvKMQirK+qlv5t0GO1bfEzn2TkNxaT779Rgp1r29LKi6O856W5X4AYCN3
         Af+jaYylb9eQb+yTycGhxpPfPscBV8MDAkwqaPRQaH7rTZFHU8tWDVCGn9zZjqYw/NRk
         QvsVTXbkRt+4EMTiYaxQA0Q66li+s0+BawMJ+eh9J+5p5t3UH+oPn56HaD8EbYUZFDJ4
         UVxPnIk6AtqG4gXqlvP4wzqYlIc7r+xj318SbEx3PqGuTvY+/jo7Xyu1maw9ufMfGtio
         PTUugT0GaaYIS++/FrxTFZBOkeHorxtafPMuQGVQ5iYJYvnh7ozmhS3VE9weCgAb7Fuz
         0OgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=42FNr3At/x5ESx27Y5yuzAt/FdNQD761VHVo+BbeSUs=;
        fh=Fm8771SpZAnf7uR0jnPZOqxWo5LaR/rDTGQa5Icg75E=;
        b=M3HUdzsyIJblqa3hlUDSExBV2McrHqKxU5pjwPLfmjXtVgYqXnseTLvdayD3TjZxdG
         jzXD16ZEkyZ++9xDILL7JaOhe7p8nzwUOg/azRcFb8/s8QntO1jtagS411UDphH5Vlqu
         HXjXOKgtMPVvS/HVF7bWGRroCZPFt20E9YIGhfAGFRTX9EqwklGguHYQ8OGXd8GqHXqg
         dIo/vSnDk3eXz7Efp4eAM/p70m71L/r3mqHAXUbpvOlSgTIMnOkY/KP99ghtJcoz0PNK
         8Wyf+pUveyFANo8t8cufjknRqfhGERc9O45GRTJYaKaDn+4xT1OvTqTJiOzVMaT5W5Mj
         zW8g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784381586; x=1784986386; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=42FNr3At/x5ESx27Y5yuzAt/FdNQD761VHVo+BbeSUs=;
        b=XwBHQEPY7ts6p5GDfczBU6KfKVzL+i1M4OKfjFGC6JwE+uHtB1uAYhWuwsuQl1gxl1
         pf7fyPQe9tGOe39BYGREjZQHwVxtU4oHE6TvUbkyLcQuwDIyXBWxtQjjke2XHJ0JGYrp
         XrD1UdQ8QbBJ8LF0Y6he5wCQAPO0ZFQHFOEyQR2xyYxC8pmZDjUb29AXNvOo9g2YdLPM
         jsdADQd0MlzzyNlRfs4Mb95aa+E4rz/CVXCzhY4oE+RXWvVOX0jpaF+FCwLD3vaLp7Gt
         zqToUOMPl4m2B8i83QQoqEcA7aLT8AGfbVu1/vr+ySJ9UBkblTOqNbd6Bw4r2sbUG81b
         OPoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784381586; x=1784986386;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=42FNr3At/x5ESx27Y5yuzAt/FdNQD761VHVo+BbeSUs=;
        b=JObOPQYBwyDtteCC8VOkfP/yH8jJumcT8H/dHMmnYs4Xm34F3MsC/LcsQVjPAVXAYM
         Fca/OOqqSCvgh5QItp6KFh56zNxYRz8uDisaDB175/UOaMkjJPji1C0Ccon3DCYtz14r
         Y9p8iulsA76laI01uohoTRVQDEDBO8QkLLWp30iCx6eOlN8ECeTTi8glss7xH+JosZQ3
         23PJ4arAg+VuZk6ToKmifMnOH/adYEokXuX29IO1UhrGfGPQcT9jAsG0uXhunYQVzAEP
         V7lTSgVNVqXzWYBsOJctVulCJUeAkbAPITEnNSEw/VCLvce70KOXesGLhP3SC3WgImmc
         auTQ==
X-Forwarded-Encrypted: i=1; AHgh+RoBBVXDxSWO/lQv8FZyWagHB2PQCvh6/e7F3TjvSn87WMwxBOT7OoQwfNYnYZzd3P2CBlt3XWX+U8JN@vger.kernel.org
X-Gm-Message-State: AOJu0YxrYJ0HR5WvBd+Qf4YPuNzfN5SfA4O/6C8GCIcWP3BunqnxdJYU
	KrCs2xbU5VbiPhCZ18ULgAYpiLjSUuagnUi6u5K2CUVf99pdRyfh39NOGz6tpgbdBY/UXm6LZg7
	kh29D4z5BT4IhgYx3rBrLahzKwuJRbWcB8+ep2agRAVGMHCuADUFfB9XHdjj9BHqlS8+nHoZ3Q1
	1vrHN3tD9xSF9ORybY92uI3xNDuC3YKD4D7ADgg6i/LryuYNX0qA==
X-Gm-Gg: AfdE7ckjXFNkvXcfyskddPnSGwIa6zIt1vnksUVlebV1NooW1viwms1LILqEwcoAaGG
	gkLgrVKc2kSp6NLjhq26cenQXo8SUy8lf77WEb2UNtI0Okv5t43T/gh6dW3ynh7vj35laPCm5i3
	nk6aA4hz05cLxGaa6UO6hROYI4akKy46V9QPJNQeVM15YJHEdh9cPzdZCzqA==
X-Received: by 2002:a05:620a:26a7:b0:930:adac:1e99 with SMTP id af79cd13be357-930b3eb2277mr693996585a.38.1784381586349;
        Sat, 18 Jul 2026 06:33:06 -0700 (PDT)
X-Received: by 2002:a05:620a:26a7:b0:930:adac:1e99 with SMTP id
 af79cd13be357-930b3eb2277mr693993385a.38.1784381585942; Sat, 18 Jul 2026
 06:33:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260717180536.1757204-1-kamal.dasu@broadcom.com>
In-Reply-To: <20260717180536.1757204-1-kamal.dasu@broadcom.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Sat, 18 Jul 2026 15:32:55 +0200
X-Gm-Features: AUfX_mxbJEWh0yyOj6ankKJdP2Pwv9z2F4va8Rdwv4_vds1PeyzxjEZjeR5kUN0
Message-ID: <CAPx+jO-atdUN1=uV=4GpRScWaRJ5-TOBhaGo4hnwnX=xyPpohA@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] mmc: core: Add a host capability to skip SLEEP for
 cards with a broken resume
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
X-Authority-Analysis: v=2.4 cv=Le0MLDfi c=1 sm=1 tr=0 ts=6a5b8093 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=DJpcGTmdVt4CTyJn9g5Z:22 a=VwQbUJbxAAAA:8 a=Q-fNiiVtAAAA:8 a=pGLkceISAAAA:8
 a=XiturQijqk7JkzwUXrQA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: y05572tKA8ec3e55lt7xZQgCO7KQYdt6
X-Proofpoint-ORIG-GUID: y05572tKA8ec3e55lt7xZQgCO7KQYdt6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE4MDEzOSBTYWx0ZWRfX+1MnYsZrorlv
 Fv6PsGBxv7wyEtkVnfOpijy36bEwMLLG/sNFqbIJueZSTaCwrus4NP0eYzG5xCHgUM+w/facgKu
 067slOdoPxzyXp4a19829bOoFtJ997fXg4ZFRkhHDuVxJlvraGER5NtV3++240uiOnxHS8ozLb+
 OC+eFCdVjTfqvqX6eWecAECimD01XYqmMsaAVnqrJrx6LkCKLjenu/6DK5KvD4MxFb9TV7gRMod
 IKfhJNdkb7T6Dg6s5OpKnrV7G4FkA/sVzw7X0er9F02Cm4Sn2sRRgxgIyZHURzU++uSgixVfw0j
 mXFazvVyf8PC6aDFrNIo7dWZ0d+oUhVJmLRQIJTy2nudplZhUtSWgHAk8NNTPh1baP2DtqPx9PF
 oobX+gboYZj8lBpfp/ZGHx/w/yA2+sm1250+GO/UXn+FeTBpAqTaxFq/0TcxrQyaEcdLNYZjac2
 i8FUc3Wo50ttCBaV36Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE4MDEzOSBTYWx0ZWRfX79lQpzyQiCkR
 TqXKmPJ5VsCYONJeq90CZk0Lk2/isEUhfS4Lk6upKNlOizmzrQREeq3nuAbcewT8KF8VT+bpumR
 lrwPfOhhNj2ZynTjLFU/cnMf53jMy+8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-18_04,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0 phishscore=0
 bulkscore=0 impostorscore=0 priorityscore=1501 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607180139

On Fri, Jul 17, 2026 at 8:06=E2=80=AFPM Kamal Dasu <kamal.dasu@broadcom.com=
> wrote:
>
> This is v2 of Florian's original patch:
>
>   Link: https://lore.kernel.org/r/20260413180551.3683969-1-florian.fainel=
li@broadcom.com/
>
> Background: the Kioxia 016G01 eMMC takes ~10ms to exit SLEEP (CMD5)
> instead of the ~1ms it advertises via S_A_TIMEOUT, which can be
> problematic on systems that resume from Suspend-to-DRAM by first
> pulling boot code from eMMC using hard wired logic that is not field
> updatable -- if the card is still asleep when that logic reads it, it
> resets the board. The device stays powered throughout suspend-to-
> DRAM (no software-controlled VCC/VCCQ regulator toggling on this
> path), and the CMD0-before-resume sequence follows the JEDEC boot
> spec, so this isn't something the kernel's resume ordering can fix
> on its own.
>
> v1 addressed this with a card-level MMC_QUIRK_BROKEN_SLEEP quirk
> keyed off the device CID. Ulf pointed out that a device-specific
> quirk doesn't generalize well and suggested a host capability bit
> instead, settable from DT (or derived from a compatible string),
> mirroring the existing no-sdio/no-sd/no-mmc properties. Oleksij
> separately noted that quirks registered in mmc_blk_fixups[] are only
> applied once the mmc_block driver probes, which is too late to avoid
> a race against an earlier SLEEP/poweroff triggered on an under-
> voltage path -- a host cap resolved in mmc_of_parse(), before any
> card exists, sidesteps that ordering problem entirely.
>
> This series implements that direction:
>
>   - Patch 1 documents a new "no-mmc-sleep" DT flag property.
>   - Patch 2 adds MMC_CAP2_NO_SLEEP_CMD, parses the DT property in
>     mmc_of_parse(), and has mmc_card_can_sleep() honor it.

Hmm, this sounds like this is about skipping the sleep command, while
in fact what is needed is to keep the eMMC card powered on during
system suspend [1].

Moreover, during system resume, even if the card remains powered on,
the kernel still needs to do a re-initialization of the card, because
the FW has already used the eMMC before the kernel resumes.

If you could rephrase the description in the cover letter and its
header towards this, I would appreciate it as it would become more
clear what we need here.

>
> The actual board DT change (adding "no-mmc-sleep;" to the affected
> brcmstb eMMC controller node) will follow separately once this lands,
> since that DT lives outside of mainline.
>
> Changes in v2:
>   - Dropped the card-quirk/CID-match approach entirely in favor of a
>     host capability bit, per Ulf's suggestion.
>   - Added a DT property ("no-mmc-sleep") to set that capability,
>     following the no-sdio/no-sd/no-mmc precedent, per Ulf.
>   - This also resolves Oleksij's concern about mmc_blk_fixups[]
>     being applied too late to close the race on an early
>     SLEEP/poweroff path, since the host cap is resolved in
>     mmc_of_parse() before a card exists.
>   - Reworded the rationale in patch 1's commit message and binding
>     description per Florian's review.
>   - Added a Reported-by/Closes tag crediting Florian for the
>     original bug report.
>
> Kamal Dasu (2):
>   dt-bindings: mmc: Document no-mmc-sleep property
>   mmc: core: Add MMC_CAP2_NO_SLEEP_CMD host capability
>
>  .../devicetree/bindings/mmc/mmc-controller-common.yaml    | 8 ++++++++
>  drivers/mmc/core/host.c                                   | 2 ++
>  drivers/mmc/core/mmc.c                                    | 3 +++
>  include/linux/mmc/host.h                                  | 1 +
>  4 files changed, 14 insertions(+)
>
> --
> 2.34.1
>

Kind regards
Uffe

[1]
https://lore.kernel.org/all/CAPx+jO-RJYCwKLLYCPZw8nR0VLVJ+UXPotXwXXRHGvar04=
QyDg@mail.gmail.com/
