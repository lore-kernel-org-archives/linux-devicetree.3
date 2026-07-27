Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 463732868B5
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 15:17:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785165421; cv=pass; b=Tbnl7aWFN+m8daxKSzPmHF9zNaiofuZmdhhEarkpZeMPh3c5gJ4jfK+LqLIT0u9N1w5+0Ltb38ku2YtAnVT7SsegoflLdCvrfm8dsUTHTJdam5AsqQJjXEJ+h0cJ3qDWZMNFJAsSwHwcOaHgK/yf9B0V9r+bBifK00O3x+xFegE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785165421; c=relaxed/simple;
	bh=upcAxlK/pJxiGNOpFfkmTSfZpXzLTLC4M8zkiBNmxDU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dsasLlM8t7dk71WAfJNiSwdZO+vw/2jCz9SiIzJoIndePDp8Ufe+LK+94r+LI+m69x0RAfuTHf6z2j+KUYdZjURIHczssnhRaZG/1Ayw2r9luDIph419buyu8QhOiFT+uJvALnfvurCLQ2XZ6yNS2LS7zFQaeB55kqZkUqbV4yU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NmgdLGJ9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LpX9QJVl; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NmgdLGJ9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LpX9QJVl"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66RDltPh4115579
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 15:16:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TsB+fBvryEs98glnklrZSnP8jIeujXx+Rk85PKBUBk8=; b=NmgdLGJ9KzuC+ka6
	HPlQzhUJ8doQmfSL4SgBBlkJBMNzucRQyPUocC0K4uufu2yaEP/ZmbWnuL+qbZzU
	Tv+KQE0oKCCURQHJKmGjK0WhkBMZ2GgyE8415jQAAKLiN2BeGothQP1U4M7+Jafu
	MBRQ0SbxxXFjC7BYwWQirbquq2TA9HA+DIYmIzKpsDmxwD+E7Ww4scMMd4LlzshC
	e9jKiFwIwKNEMcAaHtQh2rF0uIWdcVT8Mgh4ZIktbVngPIce8EA3htVKPx+M5Ma4
	cCYpRRRehTOEJMb1l6ZDK9p2X0vr3Z0kij7ZUbX38hBGlxtzt8FX7mDBC36i08+a
	Tg5cWg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fp4mrsdkj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 15:16:58 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-9309af14fd7so307441885a.1
        for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 08:16:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785165418; cv=none;
        d=google.com; s=arc-20260327;
        b=UaRkBPC+U9orLA30hwihwwFaahOftP/devEYUtgzGNOaA7XF4dT0c7myh/EfR/aaLB
         fimwI1enccaMYEHsCkr223Bqiy7y6/2tvgqiM1VtCEvD/Bj/ZBDoZ2CUfXf28cx9wq+o
         +irXjT43cfqKNzuh+cq9a1kTr0dgs4uZ7XHTisHmO2tf2s7bP+UBhdEpn7oSGJHJCNHs
         gLOmYtBL/ghltWjEYk3bjR/iI8swfZFBfiEzpq2eWlFm2VYkxtwZqbMEozPG9izENQf3
         unZsHBNs86CufurTGhWVQBx+OLOdQl0ANaPK3JuVmuN8cGY+UDSfN5b2pcOeACRJeuGk
         eyJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=TsB+fBvryEs98glnklrZSnP8jIeujXx+Rk85PKBUBk8=;
        fh=iNAIKNblI8zdbOH0zVNTo2v+++f7R2+YMOykEmJWt5Q=;
        b=PvJ57uzQijFySrZcuMkAeVshnwe0ce09Sphjo+ghtxtIMcESPKNgqEwlZzyNzubI2w
         MHofBUIJ2Fq90NuobXm/IrOujjK6dBtpb15Lljcx5HGve1LYvjh0vTbyxT97sbP88cb+
         4uwXo8dTOrn+BKlVx82GQ9rfL8tM0CZqIe4aH7wAq0KpHpsj68hlbjTFGb4wNGTO7/2+
         uJngbOc3ecdsE94M0I9qwSw9uiw1OKo3gwEpWCPN5oObv+tr4GkW8s8Y6MLvoJ4ppdW7
         2v3giFy520Wv0riunBZbZL5wvW3DNpV6S7b6XClR7T3PUwVLgps2xtvJc3ZxUU5rwmn7
         +H1A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785165418; x=1785770218; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TsB+fBvryEs98glnklrZSnP8jIeujXx+Rk85PKBUBk8=;
        b=LpX9QJVl7RisoCVOgWXSyDg/UhfyYZ2HZ5CrdOY+TvWAtywlkqL4J7JJNdjRgT5KHt
         YvmfaHzGpD6+x6mGN+OL1vD9W1uiXq4bcfzlfR31/Sp5dWNLCQTne+YeDG7+mJ2pQIyM
         3bwwud4kntiPjjQJDPBPlWD9H3PF8Fl7ZlaXxo01guvL6gOmVoNnkyYXJ9SPZZ+hXbRu
         vGwjlvxHSjxjN/AW0i8Sy3AT1bevQ+husHzcbRaJQMI/AXmrrWqaliLAAQZQuLKYDx60
         1Slc/9ZzvhxW3FW+3nTBdpxiCuPB1IiWBaEOlsD6UlppfgiTuhKISvyb3K0D+0pYtQ9l
         3TCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785165418; x=1785770218;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TsB+fBvryEs98glnklrZSnP8jIeujXx+Rk85PKBUBk8=;
        b=HzHIsG4iXebE3enJVYM7sR5P/0WwxZCUhAeFNwgfBUCoXRyD4uHUteCJ1F9znfcp4E
         3ZCf28SI93czV5AxVmboKHpTqz4UIul8v2faapE/lo61zZXuPyYPzyrGxJ/zofPitTua
         VXyr8E213Bw46eDNDFGY1h1+GAxqHjraOflNe8xX06GebQBOcoEoyac0a8kMFz09oXl1
         rYRoA7wLvBKmkcClIY09o46JwLtLRwl0NWpPnU/Uh3sVptH3cMeANdR8h3rFlddxZ3n7
         a0NoaXAfSgO8CNJnOIEL2Hfgxx/BaGkUJV+JhfbadFEBZ7g6g0vIQgvrz7XE0bsnjqDY
         aZag==
X-Forwarded-Encrypted: i=1; AHgh+Rrs7kFTKm5fKvbygjyC9p0yqL9VKVAFwPVEH2C6FfhiPZM3/3q1J9gV3dy7gaQd73XF5+Qw/KaQIOoP@vger.kernel.org
X-Gm-Message-State: AOJu0YxVcf35/zVovMH4r7GNjggs6+keq/Q6Z7wEW4CPKxQ3rDZJNbhf
	MqyKQmy8VR9ySRmlfBhOYjarUapFVPmU/6Ka56br9r1GW7Nn4OR+YaAD+4O1I09fPf2JZAVmIME
	Ds/6P+2FRELzCOrrTYnweSdaPPwgfuJkQHgsrPyPSfrolXTmkMu2mQyY/s2Nlk50F/Pa1SZuaxu
	kGiyU8IM1SD1wPr5H+j8vwDL4Ke1AljFIcUmnW3NA=
X-Gm-Gg: AR+sD13hslvBCvt74LNCHCoTCcndjH1EP3wv3LgugCZ16vBJ6CSPWGAVlldvZBCDGNE
	qCKtACCY14/FIVQpXZmrQ1hm1XcayyKmguScnjQEUzx2Dq8C/TYKFtKZ75A0uwUfMh2w2k+VWZQ
	26GNT4dXYeZQDhEeY0PR9oA1CkOneVUY/+mei7sSnrhO9j1ZGUn/qkwmY+9Q==
X-Received: by 2002:a05:620a:4101:b0:932:e030:dd26 with SMTP id af79cd13be357-932e030dd67mr898067885a.8.1785165418431;
        Mon, 27 Jul 2026 08:16:58 -0700 (PDT)
X-Received: by 2002:a05:620a:4101:b0:932:e030:dd26 with SMTP id
 af79cd13be357-932e030dd67mr898064285a.8.1785165417981; Mon, 27 Jul 2026
 08:16:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260722205701.372789-1-jm@ti.com> <20260722205701.372789-4-jm@ti.com>
In-Reply-To: <20260722205701.372789-4-jm@ti.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Mon, 27 Jul 2026 17:16:46 +0200
X-Gm-Features: AUfX_mzbZaUBnQEX06GqMrpHJi7Vn1gpbWl7sEjT3spkw5OUl0dS0c-9S2d03G0
Message-ID: <CAPx+jO9w0utg5BhsKnUSgdCWeM1prOqoV0gCrTpaeuaWZouXoA@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] mmc: core: Add power-off-delay-us support
To: Judith Mendez <jm@ti.com>
Cc: Ulf Hansson <ulfh@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-mmc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI3MDE0NCBTYWx0ZWRfX1slq7D266IZL
 MBiswXOlO3EjhixxssPSejk5GDt3d7TDjAjUVkjUXWQocWsqV2XrSg64pxYl17kCd/JaKdIYj0m
 HBNK2qVOWfkSs3YcKk10b2f72zrSg38=
X-Authority-Analysis: v=2.4 cv=UYBhjqSN c=1 sm=1 tr=0 ts=6a67766b cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_glEPmIy2e8OvE2BGh3C:22 a=sozttTNsAAAA:8 a=4A_6DvDk7c3mpj7IUuEA:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: -OSNJda3GizaAw1F_sLiVVNFEqo2cSAZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI3MDE0NCBTYWx0ZWRfX26lzNlDdwVDb
 Vitnr9JJNz/DDpse5FoRLWZfFYhfIKrZaI3dy4ojfUzKAsSEeRVkhUJ/0+uUJSQk6H4OqGoFurf
 Ov1Z6ZJg28iPlzPG4k3BEr0sA2fdbkGeTps+iWkioiRj7DAYMl6M3KhGDodUxJ3PpjO5UFNVaxW
 S9fr5Y7nqz1Q2flo5GEb7yC1CdSLvm5xx19nEqTttDWrttyxYJ4wuzpANiOsaYmC1hQt/hM9atF
 Jj6LRt0m+i0lvdoqqLfy0ekZYOLIDluprJ4qUUpANEBrddHhuKLUTNWZMq8qNGn8imsLF538VVe
 cUqgFGDWjfA4/EuKOCjAsxxMNpZ5qKiKt3hBkyiMQNAIkQ37o3uSnGcP1pJEs9faEicSb1R6Tvr
 BS9/Y1YHmBqoZDUwLBYR6DN6wG8rBgUje6gGM8mX5elWxvqWI4c4mKlHUkEca85nITa89mk06Cl
 A4B+Fnj4KK6werwCZbw==
X-Proofpoint-ORIG-GUID: -OSNJda3GizaAw1F_sLiVVNFEqo2cSAZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-27_04,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 suspectscore=0 bulkscore=0 clxscore=1015
 priorityscore=1501 phishscore=0 adultscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607270144

On Wed, Jul 22, 2026 at 10:57=E2=80=AFPM Judith Mendez <jm@ti.com> wrote:
>
> Add support for power-off-delay-us which shall be used to specify
> value of delay after deasserting power during MMC power cycles.
> Default for delay is 1000us but custom delay can be passed in to work
> around hardware issues such as slow RC discharge on MMC VDD rails.
>
> Signed-off-by: Judith Mendez <jm@ti.com>
> ---
> Changes since v1:
> - Move delay to mmc_power_off
> - Fix dt checks and remove print
> - Move from mmc_host struct to mmc_ios struct
> - Rename post-power-off-delay-ms to power_off_delay_us
> ---
>  drivers/mmc/core/core.c  | 2 +-
>  drivers/mmc/core/host.c  | 8 ++++++++
>  include/linux/mmc/host.h | 1 +
>  3 files changed, 10 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/mmc/core/core.c b/drivers/mmc/core/core.c
> index 29e80e5f928e9..9472041fe1c20 100644
> --- a/drivers/mmc/core/core.c
> +++ b/drivers/mmc/core/core.c
> @@ -1388,7 +1388,7 @@ void mmc_power_off(struct mmc_host *host)
>          * XO-1.5, require a short delay after poweroff before the card
>          * can be successfully turned on again.
>          */
> -       mmc_delay(1);
> +       mmc_delay_us(host->ios.power_off_delay_us);
>  }
>
>  void mmc_power_cycle(struct mmc_host *host, u32 ocr)
> diff --git a/drivers/mmc/core/host.c b/drivers/mmc/core/host.c
> index b7ce3137d4529..fac50a2860211 100644
> --- a/drivers/mmc/core/host.c
> +++ b/drivers/mmc/core/host.c
> @@ -421,6 +421,13 @@ int mmc_of_parse(struct mmc_host *host)
>         device_property_read_u32(dev, "post-power-on-delay-ms",
>                                  &host->ios.power_delay_ms);
>
> +       device_property_read_u32(dev, "power-off-delay-us",
> +                                &host->ios.power_off_delay_us);
> +       if (host->ios.power_off_delay_us < 1)
> +               host->ios.power_off_delay_us =3D 1000;

If power-off-delay-us is specified and the value >=3D 0, I think we can
respect it as is.

This means we need to treat "0" a bit special and bail out in mmc_delay_us(=
).

> +       if (host->ios.power_off_delay_us > 10000000)
> +               host->ios.power_off_delay_us =3D 10000000;
> +
>         return mmc_pwrseq_alloc(host);
>  }
>
> @@ -574,6 +581,7 @@ struct mmc_host *mmc_alloc_host(int extra, struct dev=
ice *dev)
>
>         host->fixed_drv_type =3D -EINVAL;
>         host->ios.power_delay_ms =3D 10;
> +       host->ios.power_off_delay_us =3D 1000;
>         host->ios.power_mode =3D MMC_POWER_UNDEFINED;
>
>         return host;
> diff --git a/include/linux/mmc/host.h b/include/linux/mmc/host.h
> index ba84f02c2a101..714417466707c 100644
> --- a/include/linux/mmc/host.h
> +++ b/include/linux/mmc/host.h
> @@ -23,6 +23,7 @@ struct mmc_ios {
>         unsigned int    clock;                  /* clock rate */
>         unsigned short  vdd;
>         unsigned int    power_delay_ms;         /* waiting for stable pow=
er */
> +       unsigned int    power_off_delay_us;     /* waiting for power disc=
harge */
>
>  /* vdd stores the bit number of the selected voltage range from below. *=
/
>
> --
> 2.54.0
>

Kind regards
Uffe
