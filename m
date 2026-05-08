Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02A3B3603D5
	for <devicetree@vger.kernel.org>; Fri,  8 May 2026 07:43:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778226230; cv=pass; b=IEZUqSoXCDH8HRNI/Jzd/o+OyrPTpCUJWsGhdItsRlYZHRu1gIL7XLkDvEvQSEJd52Er2SM7p1qDSLkCPry10mWdhxI68K0gmOeGpE7fs9/4wzka5tYp288LjW9X9H1OlpzCMnXqi77FU8takafsfBu0cJy4oPO9gyHwk5cWdCk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778226230; c=relaxed/simple;
	bh=Iw22eUoGp1D4r0AHZTcHg3b+hM9yukk2NIOisBGH+5o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Fvok9srogQ7mkj5LOAt6rKfhhQTgBytfB8ha8QO/ZJmfV8ec1QmP3RTNUk1joYAfyuAI6giDvwyZ+3hbsu21ihCfMyR1eGfuCJ/zpt33Y7nUqr0YHHIYuC9oK2QwORb4jPH/jlNHy2vMOlgwKhlXiMzORyqTZs8jfN4PSbJmhTA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UPDZEWAo; arc=pass smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UPDZEWAo"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-65c0891f4e9so2690772a12.1
        for <devicetree@vger.kernel.org>; Fri, 08 May 2026 00:43:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778226227; cv=none;
        d=google.com; s=arc-20240605;
        b=ZeddDlfoLDibIT9vzSTRIfnvv6+eYT9Q1+v27sfYkQxzRG6YBIgLhISAbLpi7ZLyOB
         uHlJnaBCQxseWO7W/0ZqVZGGN+PrLOtcC6D7irlDK+X2WQbh1Ug2ck9OlfNIKAB/E+Bi
         3QGyN7HqH0M0zF/eXcW/Gm9DdgyoVVKYr/WvZ/dp1bTwIfrkeI7LHqE6caEvyP3/qZWU
         fj/KIJuO6RzHb2NWPy4YlTUYzf7RsWXuQqBpiEUG4t/pyj8dcXJ/kNQPvntJopz+CfWp
         w/SndJMqRH2aBNLJQvcaaYJovk5MZNCjm5aAaV2Vadu7mme/Yuj0dlFv05r3zFXM1ydU
         nv2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=RvfEhNCkx1Dd9Nb7GO1+BBfvDbuW9Tnr5NBRBlIyPKU=;
        fh=zSn6dwmZBDflZKtZRqTVY9DpRfjD5YioSqzGPBwGVIU=;
        b=ak5gLJ/JwT0zJBxgGRwQKWhPusR+2xfg540KAE/lAyBuzxXP9jIJUfiK68QQ+91ZdD
         t7A7B7SL9XGkYwuLYneP/NuUApW9u3o0uqbIwMERcQemFDfOtm5xb/r8+tRyegFVlZwv
         3VcuJCXcu2S5ZYEe98LFAvvgCknMA1zVHOTh7R06EV+PRutHo6jevg/s15w1ytHgbiBM
         zqwYMUx2OTab5iw0pS7ek8vhg6GeOIy2BUTPtidy2d03eruvbu9OXexUr/CeA17nUT3B
         bGsZSLXqhW8OtjNTMqcLg+MAfJ6RuQCBgBqHSLFOyg+/Ms8x0PKZUKaHsSScNzfjMwU+
         6GHQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778226227; x=1778831027; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=RvfEhNCkx1Dd9Nb7GO1+BBfvDbuW9Tnr5NBRBlIyPKU=;
        b=UPDZEWAoXOtVVYxF+2KzE6KkWvP+clogDzsODuEzFLxe5ecOcIu867kNCcaf7XdNqK
         FuEOzTvWNwlf5x6DoPIS/43WUbuVZ0nSH44CwYaoCCcgQyGcRf4vvWioLkkzcFZ7c5oz
         z8OAObjMng2PB+Klzg6rxZ484DhgHZJ+rSczIffupBuNPeAJYmh2HIQpJfNp/EJBg2Jv
         PTx5I8aPZPkPghyCc54PyoredfGhsSKvfwQ4JPKw+Ko7HZcK95hsSoRVY4TeQbUlrHJF
         wbD7S93xhy4K54UefPdkN/YPXrjdoF8LgwA+sXrpHPMiTggVAvCSTTXoVIfcCR8qwcbK
         g9+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778226227; x=1778831027;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RvfEhNCkx1Dd9Nb7GO1+BBfvDbuW9Tnr5NBRBlIyPKU=;
        b=hwPaCMP51OMN2jeUhRB1h7ZnMnvD1coRAwT0lq4W9sD/Xr4Cek28Wg9JxOem+V/5JO
         3YI2UuzUUf/Q8jRm2WmXaHPWqKdl/+E8rLiTJ1p39ZEZgnZ6TVIR3G8ehc2rgpVruRpy
         wnV0LVefkEZP5aweU4OF3DrnPP7NQ+uemJNxXu+vWBlW4sxDhe5S0bWaJ4sU5ahTDKgl
         5WGssuiEnego1ZYLwzCBg3NgbKYZoEuT2EY00r/9gzXduK32Go4aGVFBT+LqLgx/ql7r
         VRI8YMiN2peWbnN1Pgi4Z3dzEgyXOn/dJSghDLnNbZoGDEw73cPGNHrTGvAC3AEL+UzN
         8K0Q==
X-Forwarded-Encrypted: i=1; AFNElJ/vDfx9f2Ps+FUPpcaFsAVfmB1MoU4diliuRynNGdN8pC10mrawTLscPSyIkBV0Lz7la1utgqZrnCTP@vger.kernel.org
X-Gm-Message-State: AOJu0YxcjjO451jyNy6rMc5CMrMwAsNYVKPmSiIk3ztL+y8w67tV/mfw
	imr6Gn94fq3JzCtWIf8q9cSrFKwntcSKpjjahTY1CZULQ3214N+Yf7eCDRYA1QbAK07UgSzE8yA
	va8vQRYkaD8GBogqwbNcjJxLA4AX9APA=
X-Gm-Gg: Acq92OH2WX2Sh6aItDKtAKh8bUDQ/NOP7/38ODdGFTlDGsEMp8TTp9BLG78FRiIWahB
	N/1hR+Wf99cxKdS1FTD8ezzGNZoIbxbh6gQmooe6vz5+Gi3w0ECvwXxCr2jKfKcpKwvnV2oVCzd
	Ag6Z3ypeEkuRMj3vg4gi6/oai1QbLZca8bdPeQz8dO9J5oO1wvVoo6ZExp1i9lRYb5DyZXTMTaQ
	2Z8uFfxw8dvYVdncg2r4B5s47+SlTEyrWSpcCymylV0JTDv2GXK4ETxwEkd+PZ/ucOfmVnS/KBH
	9ZFA
X-Received: by 2002:a05:6402:3137:b0:67c:4e1b:9134 with SMTP id
 4fb4d7f45d1cf-67d642c320fmr4048316a12.14.1778226226925; Fri, 08 May 2026
 00:43:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260502051906.8160-1-linux.amoon@gmail.com> <20260502051906.8160-5-linux.amoon@gmail.com>
In-Reply-To: <20260502051906.8160-5-linux.amoon@gmail.com>
From: Anand Moon <linux.amoon@gmail.com>
Date: Fri, 8 May 2026 13:13:29 +0530
X-Gm-Features: AVHnY4JlnCRZnKTvTMdYqQJwi8x36a1HcWfn2B5BacrqHqsRYonr5CXEMpLcf3o
Message-ID: <CANAwSgREs-Ai5RxuiD4Ue-8OGGdrhnLSBmSePBrjN3x9=59zrA@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] riscv: dts: spacemit: k1-bananapi-f3: Add
 vin-supply for PCIe 3.3V regulator
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, 
	"open list:RISC-V SPACEMIT SoC Support" <linux-riscv@lists.infradead.org>, 
	"open list:RISC-V SPACEMIT SoC Support" <spacemit@lists.linux.dev>, open list <linux-kernel@vger.kernel.org>
Cc: Han Gao <gaohan@iscas.ac.cn>, Ze Huang <huang.ze@linux.dev>, 
	Chukun Pan <amadeus@jmu.edu.cn>
Content-Type: text/plain; charset="UTF-8"

Hi All,

On Sat, 2 May 2026 at 10:49, Anand Moon <linux.amoon@gmail.com> wrote:
>
> The PCIe 3.3V fixed regulator node (pcie_vcc_3v3) lacked a parent
> supply reference. Wire it to the 5V system rail (reg_vcc5v0_sys)
> via the vin-supply property to reflect the actual board power tree.
> This ensures correct regulator hierarchy in DTS and allows drivers
> to resolve supply dependencies cleanly during probe.
>
Plese check power tree page 4

USBVBUS->SY8386J UXXX -> PCIE_VCC3V3 for pcie vin source

USBVBUS is power source from the typec port.

Thanks
-Anand

> Cc: Han Gao <gaohan@iscas.ac.cn>
> Cc: Ze Huang <huang.ze@linux.dev>
> Cc: Chukun Pan <amadeus@jmu.edu.cn>
> Signed-off-by: Anand Moon <linux.amoon@gmail.com>
> ---
> v2: new patch in this series.
> ---
>  arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
> index 3dbdf53b6d8e..6c06480ba100 100644
> --- a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
> +++ b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
> @@ -39,6 +39,7 @@ pcie_vcc_3v3: regulator-pcie-vcc3v3 {
>                 regulator-min-microvolt = <3300000>;
>                 regulator-max-microvolt = <3300000>;
>                 regulator-always-on;
> +               vin-supply = <&reg_vcc5v0_sys>;
>         };
>
>         reg_dc_in: regulator-dc-in-12v {
> --
> 2.50.1
>
