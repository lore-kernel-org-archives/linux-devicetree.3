Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.180
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793815674;
	b=U7a7TSYJ9ggwIhrfEmzFtw8O/AAThgO2gX7E/An0dXOmEA/dsfpqud99vCj7jmHkc0Ba
	 FZYhIHiGAzxY7xxKqbBBWuOX6uFJ4pdyG1X2EIbRta4IHGjYj38Lih7yxmMVkgqFSnVtx
	 Hrq7KQc/msYEXDoedEzI/owgHD3btQnz3Xc5Doyf7usXQYO4IwL5mIwi5SfWubjsTxR/5
	 3fcLtgPWy71AOtTDt6BY+NyKandCNVr8x3HlGB0aHCcnnML+WVo/JM09tL2NazCrW7xiE
	 Jh3COrijHylA36m3ByLOkUeiNZuQrOUdSgdTS1YDu5d93YDqIVRdCrmVM20in/Gkw9A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793815674;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=+gQ5Cuyj8b/949TwI5RgIKdEjddDg3DiMb9qtnYfCaQ=;
	b=jgcODIr/0b9ChPvUcvfGp03bE0VXnZMPg2vnDs1NAeZPmRJqKvhSq+NE1+Z/i3X20pBl
	 RW+MCWjIiECXsJWET9tYl2x8q3xsiqg8nKNafYOH6wCAQhMU39uPm1OHzuw3rtsohvraG
	 MK60QMOCfiTQSNwH4l3uKg57fvJPKDEekwuFeRKAvWARTSyUh0pnlcfU7HyH26XHxyoqz
	 jWG9NG3eKO+/9g4CeQprQcAJHSUuGWmltzG0hDQlQ50XlJq8M34ZTP3GitPAoOQGtzbf0
	 aWvUUXqWxpWkujR97TEOK4z4o1kmczuZxb3zUXq3sRwEB7KtzvonHs7Xh9CHbjjZ9jw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OC0GfPy8;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.180
Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com [209.85.221.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92412607A3D1
	for <devicetree@vger.kernel.org>; Wed,  4 Nov 2026 18:07:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 92412607A3D1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OC0GfPy8
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-5eac6c5f927so440153e0c.0
        for <devicetree@vger.kernel.org>; Wed, 04 Nov 2026 10:07:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793815672; cv=none;
        d=google.com; s=arc-20260327;
        b=JcFAppiUGUGhAaJQDQS+Ts+Em9bZaukqU19XyCtap0WgVxo9Z8XpkewZF02oksVV78
         ocBYFrOMDq/OPljqhc08fxOXcyXp9l1u4Nd2P4yaOlIelGLN09450eHL04XINKcnJa8T
         Lu+47vgK65okr+P7pahw48pKbw/aGQM+ZmkD1vRW/IqdLrMH769K0hqxM6jNq1zVAIEj
         ftIH02DzRb0t9m1oraWrF0nLdVOMJQM4LPBi2KCTmAl9FTUE33ZtYhaFTz8SQT9oqwuR
         LjfSkEwYT5Q9ofuxadTBe2DmlUJnA6yYoyrtwnh3kYcYfZDDy8dEDo8OtvCUHAq4ptPT
         SGPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+gQ5Cuyj8b/949TwI5RgIKdEjddDg3DiMb9qtnYfCaQ=;
        fh=9Kt7SyBMsNIabzCOq8egW4UHP+GwB0W/fkGvLG9rS34=;
        b=GRAc/7ckOaBpu9DgNOEbl36ezic3REHal1TcucR1BR7KpYcriHVJFPRvrf3d2/QJ31
         lWbPNvKU2meW2gtixoyS3RiW6GIp2AHXwbARt3Apl53ME2zv87lFU4RVVUG1ponBQc2w
         LHNZDYrZy/1sBoIrC+D4ixiSv5ZMYG3XhEogjJeRugoaOxj576iKTBttW6Hyih6o70LU
         bniwFuJGK1fjFqI6FS1A6K8RE89cP6lcwfn1B9Wq4mhTgiVawLHtpmW01Pm45WnmqTOr
         o9aC/6JpLnNHnbiaM/NLXtxrIC9EQ0qTAeLvwVDOKnyfobvEzNOPPr8gDF0Z8H9RrD+F
         UZtQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793815672; x=1794420472; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+gQ5Cuyj8b/949TwI5RgIKdEjddDg3DiMb9qtnYfCaQ=;
        b=OC0GfPy8B6coBFfqqPUhLTgXstjsDDCFbNUJMZTVIqso3hvWFKF0azN0fCUDbJCAAU
         wfCT/GZi5JrYt7lLimUB14AzLYhqnKi4F59ReUFe3H2Wqu3KJl1X3yj1oYD9Gw9fHvqo
         qAHOEnBm2uSSdcMiOEflwxmtfXlFNzD+EsyHYZY5Vt5h4ZYcy7uLUmVb+3jq4a4wL8wR
         MD+Nt/Oe+x8mwWyqP5gaQ6ziv6Sx5dsVMCc3yi3OBc9th0Lq0RA4mVEcC9UWE20fBQGg
         POAUoS/anoBEGQPi8B4zcNI2L65uHATBiLA6pGDRKqHH2RyPejN6je54qH189TLi3g9B
         nW+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793815672; x=1794420472;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+gQ5Cuyj8b/949TwI5RgIKdEjddDg3DiMb9qtnYfCaQ=;
        b=eiOSlDBb+1Os9YUEWALz0rnIxGPqlycnLyQjpmdYy2EV6ZSjaMsdDOcpUVP1qjLGBy
         Lpi0KJF8jVwhUDfYP4k5iPoQhGd8BICa7u23sQMRu04xrGTU46iSD3qLkHh/onZnsvE5
         LKQhqFfL8gm0UkGsKr3rwIRttUtqpZNz4VLNcjajT2UcjuhGROXPPySDIvRfCFRkU3lm
         3ffOkSEMhErQxqz2JrbQj1viL8T/ha1yrDLO41oS0YQik7YKHQ1D7fNnDF2UfEB5M6d8
         0Z/wPD8ePyE+E7r0sCujaEEcygIuB30t6fc4v01uCr1MoV7ODoWYUtVGW1VSnWNxz4pW
         cdmg==
X-Forwarded-Encrypted: i=1; AKwUvBzIfgkhGm1nwBK3nsdK/Rv1+RSYnmuJscZj9q3s4qivCJr0GJ12oOacOZXzQAzgcyWyxQlCsaMpRYF7@vger.kernel.org
X-Gm-Message-State: APuU4Z97noF4Nwj1j09KctqWnklmyzdGWUsclt2Hb7xNe6dB+fQS3rHl
	X3yMtnhF6OKQHeV3dn4qP/PGUzdeya3cWMqevNsqaFTffETDGqcrvwhEGuUaIkVAxttaKNmC9Zg
	cpMYhAwuZ75esUvsSXAt9zEOtuvzDb1zo4Crf/Tk=
X-Gm-Gg: AYBFou247/l6RMIo04mDNVMn6L5YdqzsUnD6Kw0huEV520+A4luTmjGOkbjMVAQ7oXf
	RmXtw5FNE0ixIrMQ5egB2btmwRQHc2C8BX7XOsGZErHUur06GLhan4dj2O9yq4l8+iqSWDyZB8/
	bq2tXDUkJhiEB6oIiXf6IaTZvfONJBgU5G6/RS8DAjOXn7pBxVPq8Qo9lxzNLdXk8LffVjbdjxA
	TSQDr7L/lr9NsBrj/rI/6aH/syYyuf5OCFpN3YSRJ4WMxuL9PTjIHjZTduqL3SkmSrD9aJKYX1e
	ApQitD8gaC0aoA/WT0dnjqOW6rR0NzjSrdoEdWN7oftdtcFhEqUkSZB9Do4JTrnLU0JjYmavDk+
	srpaex36NVhC6yIeFaSUYZK7C8i59++XBe1UzXDigVLwG6IScNKr26i/6hOkIaJl8WCCJ1oMhT6
	YtbNuimXS0w0aziR7+nsLs1QHgs5RenEZWt1GaiNmWSy2VDF0yApq4wxrACyuNAcoxTUvydDg2g
	cH74+eo2ZHRn3QvtKbLYgZN9S6HHZZJUXFSjSjS7ESCWS0oQZc=
X-Received: by 2002:a05:6122:1794:b0:5c9:a60d:3275 with SMTP id
 71dfb90a1353d-5ec6894bafdmr7258349e0c.9.1793815672343; Wed, 04 Nov 2026
 10:07:52 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261103-submit-h616-uart-fifo-v1-v7-0-c9e248d685c1@gmail.com>
 <20261103-submit-h616-uart-fifo-v1-v7-6-c9e248d685c1@gmail.com> <32461e0e-2512-451a-8eca-f2df63553379@arm.com>
In-Reply-To: <32461e0e-2512-451a-8eca-f2df63553379@arm.com>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 4 Nov 2026 11:07:41 -0700
X-Gm-Features: AclHuK8w6f78lagZOCqY3kBXvDEG6Z5rWFvxVoRwnTwu0OTjK9VJe-pup1TnDtw
Message-ID: <CADvTj4qPfWo=w0khBM+vPfT4vxCJVBQsqzAE3C9V+2J7fwq9gQ@mail.gmail.com>
Subject: Re: [PATCH v7 06/12] dt-bindings: serial: snps-dw-apb-uart: add
 Allwinner H616
To: Andre Przywara <andre.przywara@arm.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, linux-kernel@vger.kernel.org, 
	linux-serial@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 4, 2026 at 3:59=E2=80=AFAM Andre Przywara <andre.przywara@arm.c=
om> wrote:
>
> Hi,
>
> On 11/3/26 22:39, James Hilliard wrote:
> > The H616 UART has 256-byte transmit and receive FIFOs, but its DesignWa=
re
> > component parameter register does not report the FIFO depth. Its option=
al
> > register layout also differs from the generic DesignWare integration.
> >
> > Add a specific compatible to identify this fixed configuration, retaini=
ng
> > snps,dw-apb-uart as a fallback.
>
> I think we should not focus too much on single SoCs here, all the
> Allwinner UARTs need some care. We should have had SoC specific
> compatible strings (plus the fallback) from the beginning, but we
> didn't, mostly for historic reasons and because it just worked (TM).
>
> So just from looking at the Allwinner A10 (the first one really
> supported mainline, since 2012): the manual reports a FIFO size of 64
> bytes, and it has none of the DW config registers.
>
> So I'd suggest:
> - We add compatible strings for *all* Allwinner SoC's UARTs in here,

The current series covers H616 and A523, but the setup is structured to
extend to other integrations. FIFO-depth discovery is separate from the
shared DesignWare RX-trigger calculation, so adding another compatible
does not require duplicating the threshold handling.

> regardless of whether we currently need a quirk for each of them or not.
> This is now regarded best practise for DT anyway, we just catch up on thi=
s.
>
> - The FIFO depth is all over the place for the various SoCs, and most of
> them do not implement the CPR register to announce the size. So we
> should use the already existing generic DT fifo-size property to

v3 actually used fifo-size for H616. Krzysztof requested removing it
because the fixed 256-byte depth is implied by the compatible [0].
That is why subsequent revisions supply the H616 depth through platform
data instead.

The earlier discussion also covered UART instances with different FIFO
depths. The feedback was to introduce the property when an integration
requiring it was added, rather than require it for H616 in anticipation
of those devices [1].

A523 provides a different way to handle that variation: each UART
reports its depth through FCC. The current series reads that value,
rather than putting either a per-instance size table in the driver or
fifo-size properties in DT. H616 does not rely on FCC and retains its
fixed depth.

Linux already reads fifo-size into uart_port.fifosize, but supplying the
capacity alone does not handle the other integration differences. The
H616/A523 setup also avoids generic optional-register probes at offsets
used for Allwinner registers, and installs the FIFO-relative RX-trigger
table instead of using the static 16550A thresholds.

Older integrations with a fixed depth implied by their compatible fit
the same model as H616; they do not need a discovery register.
Compatible-specific data supplies that fixed depth, while FCC supplies
it on integrations that expose it in hardware. Adding fifo-size in
those cases would duplicate information already determined by the
integration. This is why the current approach uses those two sources
for the FIFO depth and shares the remaining setup between them.

[0] https://lore.kernel.org/r/20261027-nifty-reliable-octopus-6cbac5@quoll/
[1] https://lore.kernel.org/r/18f1e637-48de-4962-8a13-65f6597eb2dc@kernel.o=
rg/


> describe the size. This is the simplest, yet most flexible solution, and
> avoids hardcoding implementation specific values in the driver. And it's
> friendly to other users of the DT nodes, be it U-Boot, the BSDs or
> whatever else is out there. IIUC, that should already work out of the
> box with the current Linux driver?
> Since we need to touch the DTs anyway, I think this is the best way forwa=
rd.
>
> Cheers,
> Andre
>
> > Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> > Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> > ---
> >   Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml | 1 +
> >   1 file changed, 1 insertion(+)
> >
> > diff --git a/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.=
yaml b/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml
> > index e2ca126d58ba..fc1289073241 100644
> > --- a/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml
> > +++ b/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml
> > @@ -60,6 +60,7 @@ properties:
> >             - const: renesas,rzn1-uart
> >         - items:
> >             - enum:
> > +              - allwinner,sun50i-h616-uart
> >                 - anlogic,dr1v90-uart
> >                 - brcm,bcm11351-dw-apb-uart
> >                 - brcm,bcm21664-dw-apb-uart
> >
>
