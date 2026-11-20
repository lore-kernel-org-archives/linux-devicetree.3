Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.170
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795173328;
	b=ioXIC6IWnUKocG0qTMjalW7+p8hhrTW2Jt/q6JaUt9GmPyoCZ5UT+zjZ52IMJUodgIxk
	 31w/qm3DgM034XlAHF2Kl5Z8nfHT19cDrjkpvCfFGc6MzsQV8Lf40jbf6h5OJxmsw/cit
	 OrJa00jj51z55mO/3xW5n7fXu3BU66XjIlhTAJRg6eWSZbTY2OFk0AtuasIo99Gll+2xi
	 0JjtMLQQKT2ifFL34mirhY22KBo89rWIo57i0h4WGoqKrRQemg3QPTILyLx/JqJaMbP4O
	 r/0bJ7hH10mIrGKxCfP98CE5hcIXw5ciNKvd+fkEUsjUAfgoCIIGbFMRG1YX089EOSg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795173328;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=sPLFwhIcT/MvzLNNSK/4rlL74eBqG/2kXsTllYHm22A=;
	b=JWb3V0v0rhvfDykeiKE3xpCzm8xdGn+H5GGDPxaZCUSxi+vvk/2x7OSbhvlrpeuAxzP4
	 aImxAK1cZl9i32QouHRSry6xKv9dyrKPDVaRwHaT7of7lwDv//dtaApUe9u/FUpyc4iq9
	 +I2QeJQHyRuhFE7/0NXqAH5jV+7E5JA/8JCqOhlW12fEh2pbGE2JD5heyCC2O9SLCp+Bw
	 i6NPm0PT2i4IsLE/ge9TfaV29/VQkUDFc1eECu3klr/vVQQAfofUng5Qy/deNW9oPhys2
	 1WDKPue6GSxNuSK8ubk2WMNOXl1a2aCRk8VMRUiMDYbtUJqWQNtmgLoNmB21AAWGeZg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amarulasolutions.com;
	spf=pass smtp.mailfrom=amarulasolutions.com;
	dkim=pass header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=JY3ZWdh9;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.170
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFFF0606A32C
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 11:15:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BFFF0606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=JY3ZWdh9
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-8b30cbfa628so5550197b3.0
        for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 03:15:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795173327; cv=none;
        d=google.com; s=arc-20260327;
        b=cfHoT5l6jPJJxsRUUHvkABMyMTNKIIQ8iIBE6oVsdAd8qD+j2yP74062qM+VMMj0cG
         TILGkzuYyzc+7ORGCv1pvPpCRlniEEEH6vEte2uBQyhzlOuULlDjmINUzv/hA2bZdA+z
         dhxNwQ4Y7FiG3wz2QJSRK5Tw3qZMf847uEhUY31HV2PB5NQAkJ51TlCM3qOKUtFX2LFB
         T4x+WGTLen0gSbyaoPl7plIl9o7FEpbldns2yfrU6SofvnfiosMn/OnTzoiM1t7wMOo7
         HAOXKv4uPRUS6CHPub+gk3/EkMgqpunhdknphgNsU4tMk3Drho+EFcWvmGaIKZK9thsU
         I5LA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=sPLFwhIcT/MvzLNNSK/4rlL74eBqG/2kXsTllYHm22A=;
        fh=dYMjNBcQGMrifD8n/N5KoXEIGw41IM6gaZdQO9k3obg=;
        b=qtd93Ulsx05keEm12MYM02UINRMbRejLOpF6tPyjac0YkTR3dQz6zyjDCwHCjto5TB
         hNwbwJ8PIClkRB5ooKwtpgoAMDHSt0fM9ctzg0fNuiaqkvPYypKDYrRrxs/UPFiyCF9d
         kIFwPtqdjg7NweiaHSJhC2HsuhPpuCnsrEcwurNX5VfwF3XiBS9fkfloBSC1zLuzeH80
         57JF/SVU2W5vksZncsr0ww4YEZ2bXpkOlrc0hMBfdSgfDMYhGXzYtdl05ZEA45EoXWuo
         bejEIUjjyCXan1mzF1no4mClpilUbalLQHILc8WXDYOaWdpIfMZXW9Qjm3bAa/Ohv44v
         /rng==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1795173327; x=1795778127; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=sPLFwhIcT/MvzLNNSK/4rlL74eBqG/2kXsTllYHm22A=;
        b=JY3ZWdh951njZ9iamsk8qCyeR4LJpvY4QzOsQU0Z1/9fsl8gjOhf+NjPzsKLsTtzKS
         S28y/JBu3gbrX0c1S6FU/D/V2tczzIHs5cx9Ryad5CDgvGc8AWJD6vEfGpMSGqMVpEaN
         aUCQs/Bk6FB9oYc8RDwH1UprPksFb/pW4GoTI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795173327; x=1795778127;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sPLFwhIcT/MvzLNNSK/4rlL74eBqG/2kXsTllYHm22A=;
        b=n6/tcZWjXUmH8qCV9jJHPM94zdZqUCB3aPnRaRM24eAaBlGOKgJtbiytFxCjcuA5vO
         H+SuKOe0gRAtTLLqUUd+GjIPhIAOeAa4eRw1MmV+5Z8bpR4pxTmdFj/Sjvi8PQz7Rxfr
         3iyOGIn5Ks7WSODoQIIb+DFTsJ9nRL3O7ElWBrIccfEcJgaTQLQ4S2r11hCDOmUmthLw
         cE1bfDiW3nX3B9x2IvIkEb605XLUnLejBbBR7xH5i4uWcXKpeVE755hnpGF2cm5CeCpr
         9FqRvaTBRIRZ626tzuqCtpL4e7JfZVhsVK+3hWo2ndvGPFnIa56IvECAQ/5+0NhIZpiK
         FPVQ==
X-Forwarded-Encrypted: i=1; AL+hErGq0a6RObdJ99crqyJOP6Dezd7arkfRQeW4FxKGnsFaN9yjyVoULcZji5syZTFHrhB5wVqrv4Ej1E7/@vger.kernel.org
X-Gm-Message-State: APuU4Z9vb+QgWd3e0Vicqyt0GHa550ZozsfPiTncTcHmQlr81Vj6Kbjo
	lC4i+zUxT2DtQrkzexTHWthGIMY3Kgekz0v4G/KwCvLBqhB4TC6dZr4z531jE4cKRr+PUTat2uw
	en6zfk5T8/IG5NKClittHq/RYNt2IcZo1+OAZHlVanw==
X-Gm-Gg: AZFdTZenWAZ1yHSn9SyzCLyZ9Bx73Y6nDUMX6aTEUFxhGjGZ/1jUY+KRLLSpwnuJzzE
	7M34ucPDlDIFUie/RYJ9GeFiprdwLojzOvojWhN78csK5c4eMf9TrovrudMJChMB1GJklg+zmNB
	5zLpKOKPvrICntQ5N7GVfY5TFDV1BytCwZDfwQiCu40/rnsyC70R8TJf48QlePHnQN8jEINb6LR
	UyW/QawmBllZXsFEi+a040zHk3Q1s+BQvggK12TD5B6W+cR0pQIeXkm3Xf0qVJcy9guVKjm8P+g
	PZo1lpOQmhRuLBLyZCS8jS1Xge2H1TRh4OxC67yvfQ/wRs9qGni8DmofSrA7JWqYqlYxRHWWhR/
	S7zcETfUEPm1yK0uNG1gpxXpYCL2cv/FdMqKH0H4h3PV5YSGWavauLxmNdh+CNo9bp2A=
X-Received: by 2002:a05:690c:f0a:b0:8b0:a8c1:b203 with SMTP id
 00721157ae682-8b5204a4d62mr11865107b3.29.1795173326740; Fri, 20 Nov 2026
 03:15:26 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261028105807.2567225-1-dario.binacchi@amarulasolutions.com>
In-Reply-To: <20261028105807.2567225-1-dario.binacchi@amarulasolutions.com>
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Fri, 20 Nov 2026 12:15:16 +0100
X-Gm-Features: AclHuK_lul2WkB_GKijVQqX2Biher4WJINl3HIKsyICsb3rvDVwYFNAUZr7v3UE
Message-ID: <CABGWkvq_iUWQCVphJa1yuCJpekseUEHwme-Uj2Wpq7z8A2TKag@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: st: add firmware reserved memory to Engicam MicroGEA-STM32MP257
To: Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: linux-amarula@amarulasolutions.com, michael@amarulasolutions.com, 
	Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Alexandre,

Gentle ping on this patch. Could it be queued as a fix for v7.4?
The SoM support went into v7.4-rc1.

Thanks and regards,
Dario

On Wed, Oct 28, 2026 at 11:58=E2=80=AFAM Dario Binacchi
<dario.binacchi@amarulasolutions.com> wrote:
>
> The first 64 MiB of the DDR are used by the secure firmware (TF-M,
> Cortex-M33 firmware, BL31 and OP-TEE) and are protected by the RISAF
> firewall. Without a reserved-memory node Linux allocates pages there,
> and the first access triggers an IAC exception and an OP-TEE panic:
>
>   E/TC:0   stm32_iac_itr:197 IAC exception ID: 137
>   Faulty address (IADDR0): 0x80000060
>   E/TC:0   Panic at core/drivers/firewall/stm32_iac.c:212 <stm32_iac_itr>
>
> Reserve the region, as done for the stm32mp257f-ev1 board.
>
> Fixes: c5ce8d7bcc78 ("arm64: dts: st: support Engicam MicroGEA-STM32MP257=
 SoM")
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
>
> ---
>
>  .../boot/dts/st/stm32mp257-engicam-microgea.dtsi     | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/st/stm32mp257-engicam-microgea.dtsi b/ar=
ch/arm64/boot/dts/st/stm32mp257-engicam-microgea.dtsi
> index 5b4287e86def..6cd64587ecdc 100644
> --- a/arch/arm64/boot/dts/st/stm32mp257-engicam-microgea.dtsi
> +++ b/arch/arm64/boot/dts/st/stm32mp257-engicam-microgea.dtsi
> @@ -19,6 +19,18 @@ memory@80000000 {
>                 device_type =3D "memory";
>                 reg =3D <0x0 0x80000000 0x0 0x80000000>;
>         };
> +
> +       reserved-memory {
> +               #address-cells =3D <2>;
> +               #size-cells =3D <2>;
> +               ranges;
> +
> +               fw@80000000 {
> +                       compatible =3D "shared-dma-pool";
> +                       reg =3D <0x0 0x80000000 0x0 0x4000000>;
> +                       no-map;
> +               };
> +       };
>  };
>
>  &scmi_regu {
> ---
> base-commit: 65ba8f34ec886ec72b2c07ddc8cf3d815c32869d
> branch: stm32mp257-engicam-microgea-fw-reserved-memory
>
> --
> 2.43.0
>


--=20
Dario Binacchi
Senior Embedded Software Engineer
M. +39 328 0625246
dario.binacchi@amarulasolutions.com
=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=
=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95
Amarula Solutions SRL
 Via Felice Cavallotti 25D, 41012 Carpi, MO, IT
info@amarulasolutions.com
www.amarulasolutions.com
