Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8577636A364
	for <devicetree@vger.kernel.org>; Sun,  9 Aug 2026 17:16:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.219.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786295812; cv=pass; b=CeLrXQbB/EztpPCoPhhD0wNFdjwIf3K0ERshEBoXmviQsQ4ubrhZ8gLV9G+1BLHcwa8GwwDTu+Vyfwq0ZICucm3i2RvENba8gYJSHno6tS3WIqQA9Tn1Dirq7TshiF+DrAxdhBxp5Cz//T1/4/5OPi2aRC+JT7h7vFxoVKFLBMs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786295812; c=relaxed/simple;
	bh=Efke32iAl7xjj/OoYm7zTUFVlvQ+VHNxMFhnETZtBQM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lDhHn7JX+j+CN7PFd0MiZQTlAdRHPsCP97OWdSFCxcS62WRfPHW/dhqxFV46wlLyJO1972qsIrQGhqwVg7CCqYSj3TK2UAOkiV4H49Zkv+wYkXbHH+UkzYg2uc7aW/WB+a4hTsuemAVstMYz/k2zkMo5xmtiihX8SAd44jJewjA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pueMUg/7; arc=pass smtp.client-ip=209.85.219.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pueMUg/7"
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-8ee43b3e5abso6436106d6.3
        for <devicetree@vger.kernel.org>; Sun, 09 Aug 2026 10:16:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786295808; cv=none;
        d=google.com; s=arc-20260327;
        b=BRLI661oZodWRzRx4WhK9ycsyzM2cNBa81fRDm3BaMkKjkjB7fMyCOM8+WTMYEjT2Z
         WG/8mUHyaG9QvowhEpc9hI9Es/WYV19KS/Pykt7Z7nGnMBpLt68aSMQPQgGAW4OBJZfM
         y48ItgkMFi9hzPOZWvVxw8JJPtIOEB/U+0ygqkdet3LHG9tw3OeL+tITIDWYEuBSpJTT
         XwAqQAdvW2RmJ4PGvUFhZAVtNUznVlmjyTAdDrRjQJ85sVBLa4yh60ZuI10aQU+pxwG+
         AotqrY2ysVNPUIFJgyVun3r9bjtkUWZoTogB7DlM2ZMT3s4TloCahzUmHIgX0F1FfxCT
         WEVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=rU7Duwnzym7o6H9C40VXv2V+HHIGH6Z448XVA54zyEg=;
        fh=sVjEhUyq7ijrBeat8ztupk/l95RyYz3OKtDU3Y0sd0U=;
        b=cs/Fzm9Kg30aT1BuZwG70vrbpmJfQDpLo9jCeuO9zP50InCbJV8qtVGDRfQMPkPhRp
         6SQvbDMzkxGOMN+wD8+Tu9zIsD0rl55lcJkPPq/SGmQWc3bXi2k5/x06ineiPSA9NIQk
         XDe5jYiL5quA2Qmv7x4+A3iHEI1ITB3XJQ6kvfCgn2mpeTFwfNT+kxShsM+XT+2zTz1m
         ZxBUsWwcnNjrmtAVqiWbiOA7FDBZc4XLvZmwOT3kY/rYRc7DsY94Yv/hiKaXNOU5uDtF
         wY8VbTmbglUAhxOGag/jl+W9CkiqKLnzTRv7zwT6zMo3Iv0J6l2kXc6dk7sFsrnErab+
         zrjQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786295808; x=1786900608; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rU7Duwnzym7o6H9C40VXv2V+HHIGH6Z448XVA54zyEg=;
        b=pueMUg/76MmA2YRSJ0t3bZs3CsAreGDQPYcn51zX5ZZhhi9H5A2xIKoKansKKT5Cfw
         zO9deLoShIBR7zAinfsdYrM9cmUYSbgUc5L/yh6A5fs8sTakg8T3ZGt469dkd8UBoINg
         T0cArpSdLzzHpcoJvVhWyAsHBn5Pzw7Z2QuZMy91AhtuqoHfFEIH5Z0g98F9qsVlKKgF
         e/TLEGaQ8ixj5R4h5M2oMRwzpYOOIoU1frcnD1Vp1pPZbXEINz5Fyaay2KpUUmjeFHYN
         Us5pK3KpAyWrTGP4LZv+uin3RnabGkIc9RvubtaP83Il/EbbICUW4aR4DfhSkAyUxM+I
         7HnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786295808; x=1786900608;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rU7Duwnzym7o6H9C40VXv2V+HHIGH6Z448XVA54zyEg=;
        b=CROlzhsq0VnBh6alwOvkKVrxbkkDWL8B4xep7RNIEg3xsH+7ZRe+dY8wW0hkrj6k1O
         sAnEoe5hYivdkC0Sl0QPpDw5odWwlI0JZfnqNK9CfWa72b1S2o5G8VdxHEls6I1+ZC+R
         1n1EVedXjvrOv9HU/gymIaLmQyJUuKAJe+Dw2xXRnkutrXWV4zZ4snaXO1MTUAIZJUTA
         GhU8NpS+XFAkoYAt0JDpphFDsJKc1VIr8k6JWUDXI0IjjceVGmskwbc4XgBAJhqoKVC0
         4E6iKfY+u+1nkKQ5UmisbdAmcT4oiLtIQXbgs7zlP9ym2CedZtClF7OubR8C5a+5JJyh
         lmTA==
X-Forwarded-Encrypted: i=1; AHgh+RoEaXHo412bU34fc8u5H4vswGdhwWUOPVGs/n7SQ+zgd4I/rZznCkO71h3HnOlMeBtrIpjR4CEH+5Oa@vger.kernel.org
X-Gm-Message-State: AOJu0Yyl3FVX39IzguY9+EfRfLNBGbRDGSb4fUhWlQSqVwnIWIHfJU4D
	hwsJZEDW9Yyfoxw1TCOrJinrIYW9zrkbuxPxn66BN5jdMrYnJaYkkyntBbAg6EBo+VKwSlaRUix
	Rpv4zpZSdTMXNS66egKeEe8yu4dnzIwI=
X-Gm-Gg: AR+sD131SpmDFFjA0wC+eAZpevofJ9sp1i5x05sbe9SSn9dOmDjWXC84IAjGuIxEFxW
	R91FWIPIvdjbA5Ivlzmjy23s6zjYNOfDNSx0l+YxrLLX/BOJjSInHK50ORSSaIki954TY+dRdH0
	774Hb+34j7f+cuAGAdmaJjhPUWE5+Ko4LaFtuJAXrvYQAB7jhX1vmNQVeOvWS+FBgS36cNmylpl
	dVF2f4WSD4HCvj+gbENFpkMSna4dOjNPU+6hCoEEAWM7UeYRRE/xH1madk1OV7gGE1sBw8jiS1m
	9rWGAlCcD+bda28Tef2Kpl4ALgfmGczmrS8TxzXtRiyKAi1ZKQ13MCE58uaOras=
X-Received: by 2002:ad4:5945:0:b0:8ea:fb8c:2e0a with SMTP id
 6a1803df08f44-908813800camr422497886d6.28.1786295807862; Sun, 09 Aug 2026
 10:16:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260809160643.33991-1-l.scorcia@gmail.com> <20260809160643.33991-4-l.scorcia@gmail.com>
 <aniv5B4jz07mI70D@buffalo-ssd> <CAORyz2KJMY6OvFQEB2GU0P7CkxothuXOCXgCcRvtiUhhPaK1ig@mail.gmail.com>
In-Reply-To: <CAORyz2KJMY6OvFQEB2GU0P7CkxothuXOCXgCcRvtiUhhPaK1ig@mail.gmail.com>
From: Akari Tsuyukusa <akkun11.open@gmail.com>
Date: Mon, 10 Aug 2026 02:16:36 +0900
X-Gm-Features: AUfX_mwSw9EQyRpwAxS44Dmd7O80H1Xy4wdfZq_kCKddFw7XIYHyFdFWMPL0V3c
Message-ID: <CAKr_iV5oi5VbnXZD-7b4XCaUuimavqYNBDO=2oM39JvYwzkwmg@mail.gmail.com>
Subject: Re: [PATCH v3 3/8] arm: dts: mediatek: mt6589: Enable toprgu reset controller
To: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Cc: linux-mediatek@lists.infradead.org, 
	Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, linux-watchdog@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Luca,

On Mon, Aug 10, 2026 at 2:08=E2=80=AFAM Luca Leonardo Scorcia
<l.scorcia@gmail.com> wrote:
>
> I apologize for the mistake - if a new revision will be necessary I'll
> correct it with the Acked-by tag.
> Thank you!
>
> Il giorno dom 9 ago 2026 alle ore 19:04 Akari Tsuyukusa
> <akkun11.open@gmail.com> ha scritto:
> >
> > On Sun, Aug 09, 2026 at 06:03:27PM +0200, Luca Leonardo Scorcia wrote:
> > > Enable the toprgu reset controller feature for the mt6589 SoC. This
> > > allows generating reset signals for the 12 subsystems managed by its
> > > top reset generation unit.
> > >
> > > Signed-off-by: Akari Tsuyukusa <akkun11.open@gmail.com>
> > > Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
> > > ---
> > >  arch/arm/boot/dts/mediatek/mt6589.dtsi | 2 ++
> > >  1 file changed, 2 insertions(+)
> >
> > I provided "Acked-by", not "Signed-off-by"...
> > https://lore.kernel.org/linux-mediatek/amEBgRmQktZ44jc1@buffalo-ssd/
> >
> > PS: I am also fine with this patch carrying my Signed-off-by.
> > Signed-off-by: Akari Tsuyukusa <akkun11.open@gmail.com>

Sorry, I made a mistake in my previous email.
The Acked-by I mentioned was for patch 1 of the series, not this patch.
I did not provide an Acked-by for this patch.

The Signed-off-by was not what I originally provided, but I am fine
with keeping it for this patch.

Sorry for the confusion.

Best Regards,
Akari
