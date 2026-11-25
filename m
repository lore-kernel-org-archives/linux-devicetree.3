Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795618290;
	b=L6V7GX31wUZtvRzXztqehljEOBWPoSa9G7esqM05UzoHvgPBYD3OORU/7WhXhdEvEtvW
	 x/QFidc0lDiNJE9+fswJgNnxms7Zudb8TRCIWNL/0GpwcS0VRu6otNs0ts+ka7A79GGoU
	 1FJqK0bEVgUYWy6xQFM/tTu/3uzcN9njcLOBURWwlzL1U8pVXJcEE1J3q7RQo/Z4sA2N7
	 keUH3DZlne2H1FXrLT6/75bfbLrRVkaNP98BjfdgoOQISsmVxaVA8bWGwj9r4zWYwRs1s
	 jO8QQdumLBAJGZiki+eQ8dtbJJE/g/d4oukY3+kElb7bDTWRyHtZZYFMhWsDyBL2MCw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795618290;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=qhCwXvAyXM1RHsJVCIWLLXEAUGswl0Dh6+s1SkrTVk0=;
	b=JujHqhkwn9WfQ23eSfjXhOQrrFuDtXhvPIzMC8Ir6t4y9Qdfs9yNtax2d59DhhzWZJWs
	 khZcICtLaodXEX5nMAjr0HrXWcxm1/t2MSc9XwL6RHbvTyIIYwNBzgsaB+7cgBDWQmFKG
	 7MP9Zu82T0qYD9YEcdpLM2XDmBnUnn6+EjjJvJ853F6wuHXX7nFlhenJTbYvRY4aTz79R
	 dhrfOmrzVWqhXJDA/1S2CIUloQrhJqsQLQXRat4yBxuCjA5CvZDajTlZrqn9qxXm8K9xA
	 4HiMLx35B2FwIW3nOoRNmMQYOAsvD3Z+URKAZqrAdOkxNtIBkFyV8LvM9z9ueR4lpZQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.219.45
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41426606A31E
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 14:51:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 41426606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-9213922de73so4886386d6.1
        for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 06:51:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795618289; x=1796223089;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qhCwXvAyXM1RHsJVCIWLLXEAUGswl0Dh6+s1SkrTVk0=;
        b=P0T/4SYiP+LCPiLHn8KMn5egnGeN93gKlCkRAQlKYQ0YPwQ2Xaw3o6CSoqkBttkCwM
         z0KjOnj5xzU1/lHhrTkGKBWm83JgXndbG2Jarip6DgcmY2V9PNrKqXBJvpePQv+Gfp6+
         8h+p7ctWfUcPVW0kno21T+rRN+j5bw9yUI4Pnc29QxxUn4h8dkilx9rMV2O8aQDL3pkO
         vp2QL+wjH0yTu+Tb+YOgwHWXBTQuB8uC0lDcqJbvu7VKwZQD89qAS9kHjYXhkln/Z224
         KvAHmWb2T0he/lfUqE0qg8oivZEWrU42lGxK3R82Qrh2qo59Is1FB89ikLvZAq5cmKlJ
         bDVw==
X-Forwarded-Encrypted: i=1; AL+hErFUv61CxyWI/qWkYRnk+7gyxgELPVYCfBW8N9m6EboAnUkgzdj8NlQG6GlK4j1JIBuc1OE+x7cgbkg9@vger.kernel.org
X-Gm-Message-State: APuU4Z8AUNr3wZC5c/OXrzGHRyxwKpiZfZU+qqkajd8j0YxiOZO2FDAB
	mzZbB5nV2b7Xy7KJr6jjJEFZn4ndO0BxuPyBe/9e6CpwWTnAS1WgXFT/JexZUfAV
X-Gm-Gg: AZFdTZeIIfG13lSRlUM7g0ORqO5hgjL+Xith8OkXwYCjx8qV2VkT5pqO9Qyg19Z3ABq
	ZNwsZ+jDXg8FhNiERq6w+bGd+/LYEvCDRRY0IG49Rw/K0ocITRpb3+GE55NmUiPgIQC/EM3eTiE
	+uCBhD0ZmvUpYG0B4Fez32NBeTyRYLd6djHVG3aZRnnr/KaqL4GTnSkPCZ+/mPS+M3947emWhX/
	+NXmbMv/a7bAkwDKljNXfFn99RV+ZY2yfQWBFDt5KQTTbpD4TrfgsaNg8ZgxomAiKvpBlL8KZb7
	9bnSgCYuDsYQYmxlGJJmuj7fVS6te2OgovqTRlrcTC43bCENFm2VcwPVh1NS6PVDDa4LVJ+Xbcd
	fuJPRVSCDIN4Qi2slwkDd+wIycPA22eDGE4pyv73cIEPPnDE8NRXO3sjMYuPClEUaIYz4TyxTx8
	GbeIcQOjLzR36Mh1Bth+n80h3o7kUemvA78kI5mXPukoGBS/WvNa8p5/Ijlh1tSzEXAqnwTEjry
	o5DVu+F14PYZ9xw6sE+Qp0RC067VjRWH4mplP8P8YNm+SZji8uq7WzIC33fFfUPDCGzCbTRzcb5
	TZAAtDSy+nu+KAuRP4ApTqp7IwM0mXtLSqpyVnWDYd3BtioKvhtynVEbro2lWMX2epTG3tvCo3T
	RS6wFf36WoL8T
X-Received: by 2002:a05:6214:4704:b0:921:21ed:f9d5 with SMTP id 6a1803df08f44-92134af8629mr278702856d6.38.1795618289016;
        Wed, 25 Nov 2026 06:51:29 -0800 (PST)
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com. [209.85.219.44])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-921349eae11sm164797486d6.25.2026.11.25.06.51.28
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 06:51:28 -0800 (PST)
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-9213922de73so4886216d6.1
        for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 06:51:28 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErGwG1coGA5KRuF8q6k1dyPEPZ/GuFx6eu4Qupq8aTZmPBY/hsswDkmwh1xSL4z1Gfz41ZFJsjtPgZ9f@vger.kernel.org
X-Received: by 2002:a05:6122:2192:b0:5ec:7589:f9e0 with SMTP id
 71dfb90a1353d-5ee8af4a3d9mr11210352e0c.11.1795617963345; Wed, 25 Nov 2026
 06:46:03 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <cover.1795029012.git.geert+renesas@glider.be> <1e9c5ac3-d82b-4af9-9946-0302cadf7404@baylibre.com>
In-Reply-To: <1e9c5ac3-d82b-4af9-9946-0302cadf7404@baylibre.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 25 Nov 2026 15:45:51 +0100
X-Gmail-Original-Message-ID: <CAMuHMdX2BEAK27P0Da7Nei=DLaHgTdi=FiC5ZMhVegNuGwM5_Q@mail.gmail.com>
X-Gm-Features: Aa3M54o5mrxb1PGlHbFHaQn6zx-fZm6HZYf4SleH1VTd0nBeXxZvXoTTF6NrZag
Message-ID: <CAMuHMdX2BEAK27P0Da7Nei=DLaHgTdi=FiC5ZMhVegNuGwM5_Q@mail.gmail.com>
Subject: Re: [PATCH v5 00/15] R-Car X5H Ironhide CPG/MDLC SCMI remapping support
To: =?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <clegoffic@baylibre.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, 
	Ulf Hansson <ulfh@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	"Rafael J . Wysocki" <rafael@kernel.org>, Marek Vasut <marek.vasut+renesas@mailbox.org>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, Kevin Hilman <khilman@baylibre.com>, 
	Vinod Koul <vkoul@kernel.org>, Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
	Paul Elder <paul.elder+renesas@ideasonboard.com>, 
	Sudeep Holla <sudeep.holla@kernel.org>, Cristian Marussi <cristian.marussi@arm.com>, 
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Cl=C3=A9ment,

On Thu, 19 Nov 2026 at 15:47, Cl=C3=A9ment Le Goffic <clegoffic@baylibre.co=
m> wrote:
> On 11/18/26 8:44 PM, Geert Uytterhoeven wrote:
> > TL;DR:
> >
> >     Describe hardware in DT, and perform mapping to abstractions offere=
d
> >     by SCMI in Linux.
>
> A question on the approach
> An SCMI variant DT could mark the CPG and MDLC status =3D "reserved" and =
point the consumers at arm,scmi, while the U-Boot IPL keeps the hardware DT=
.

In theory, yes.

Status =3D "reserved" would work fine for a leaf device (e.g. a network
interface), without further dependencies.

For core components like the CPG and MDLC its different, as every single
module on the SoCs makes use of them.

> Since v4, the series assumes the SCMI ids are stable:
>
> >   - Remove dependencies by making assumptions and dropping disputed
> >     items, to move this series forward:
> >       - Assume all SCMI IDs are stable.
> If they are, why not using them in the DT directly?

Because:
  1. They are not stable!
     We only _assumed_ they are stable, so we could relax dependencies.
     With that assumption, there is no longer a need for the (contented)
     addition of scmi_get_base_info(), which would be needed to
     distinguish among different firmware using e.g. different ID
     spaces.
     FTR, without scmi_get_base_info() we're at the same playing field
     level as some other SoCs vendors that don't bump their version
     numbers at all when making incompatible changes ;-)

  2. That can't work for now, due to limitations/deficiencies of the
     current SCMI firmware specification and/or firmware implementation.

  3. Last but not least, they are not hardware description.

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
