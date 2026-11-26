Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795693504;
	b=CFQJNglggpprTgizs6z02XNvD3epwYrHAsneHf91G5zzOsTNVuVt9EDhpnLznqrAdJE7
	 Ni7KNWOsh0nATt08cfpAHlBRGg1FCwGoOioUTj1CPv7xzOqJy+5yuDXD2gEdsxFBXwdRX
	 L3DX6sUkYEMIRCQSPmwD0pB/YmhhhM9bK6gbxoccjoBmWhAL1fncj9IpjPxE9wNrEfxtB
	 /8e17GhJdoYmMqX2RADAg2HvVhhtRX6N3rUcAh1EdDxvvQw8EqHr5uhOyHN0+j7Lmcc19
	 0Y0yK+A8VoPxyVlKNe/PvGZHFsGFsGOGThbS23QaHO6xZt0BK6AyC85K1EaS1dTyx6Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795693504;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=J/w9woKIDcG1KIzz6jIjSge7TDzANIjKjukbxSS5bGE=;
	b=2mIRLZrmdUHczfujvJ5J6HBE10YnOGYi4eG5Il/L+0b56bbsZNP1j1zCVdYTf/stOZp9
	 5TRT6dKIUqHi7Nmr1XIzkOKHXhggspoNtiw7lfexfPdFcHv3RYZNEhWUSl8qipZEjU5wk
	 K2mGM5F2GAKbiQe+yKNePwdRk65Gl61Weiymur5l9O9Ilhk4o/xxxW8usLQMJ7Rw/ISly
	 D2AiHdNcs8spLH7gV3B9f7c9iBIsCkiAXAHIhsf3BukbHVYBBCg4QbFuSBEsJ9wLxk9Qt
	 I5tkguGnnwQGUXsJlPJvTjeaq4tG6hYHYm1cHIMgRYLdG/8mR4NSLHZbmGVIwy5bi+A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=linux.com;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.128.173
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA9AD606A333
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 11:45:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BA9AD606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-8b4e18369c8so41253177b3.2
        for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 03:45:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795693503; x=1796298303;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=J/w9woKIDcG1KIzz6jIjSge7TDzANIjKjukbxSS5bGE=;
        b=qtpWgojMhf2UgOatnc+1JZ7wPMaczGxTT0Mnfk2+9ikUyzVkwSHrPinpSFckNZ/tuf
         BtLKRk59JjiOKfr5GtjKOBm9o6ZMim9bQ7n2vRXNh4EYdSay6wooiespWMJAb4GVjKNc
         KWl1EMYoyyNdjA0RW0xkH1Q947mI32N9ne/eL6X1PYffH5GsDH7VdfTtE20MjhKusqQb
         etnE0MEMPlkk306L8WTgGhBnY+WXogV5ZUA9Jihx5ITRYa6ym9yFJ6Phv3kSaTqynF9U
         1XMnMtEZi/BqyL7Oeg+2fWObtvG1nLy1rQ3YaHay76HRrF9cpt67S+CLadYnr+zTs89q
         cSTw==
X-Forwarded-Encrypted: i=1; AL+hErHdLMSUGKWVWKYx/ir595YSS0bmB4amx4cb4r5WMDwXeaJFfjmG5rObqv7aCJkanHFcTWJOeToVLm9D@vger.kernel.org
X-Gm-Message-State: APuU4Z9IHW4T2z4qSNoleuCCz+505oYagKiq5npOcIgwhQhbs//KnIMh
	Rnjzy6T8QS2EZ/nRZTt2Ro7ydjUW77UFpVcR0D6uiWYJWjlmpy7u+9QpF/sl9DfN
X-Gm-Gg: AZFdTZcQIJk7Wo+7U4aTwRCe2iLUg1BeSvBXRDrg+egUzbjzOPx4NK2qlNMJw5IVgAS
	H4qktW9n2OEz9O1Srz9nwcv1TdZOmcL/v29LxUiBJ0t3v/M6mrX4y2dEyDgH6UR/ZpBvLb+xRuU
	chOZcz5s+Ai+lOvlrXG+xwqBeMk2o/AZYmP9q3sAWhbrdSGg4c8fpD2S5cnsf5pm/XJmPNm2Cst
	MTAgtNDyGcIoa+g+CU3xVfpNDLsnLtdS6QO7y4BHnsi0d/fL5t+4Bdk3R8nreBhY7weQEYmGrY9
	nTnMIXA8z2o2T0/3NEG5LLITAZWGf4+lVuQfWg1aL2KcFSzm6tOxkJ/O91qgq4oRODryL74b0+n
	0cW6BhB8hTYXEc1BeEDBS0vgaFgs8LJrkz94vBMMFHg4CYM2dARjHH0ClzNZiDRUV0oTA2k0Vyp
	HjkIRUTc4X6S7XSi/nxqIWk5veCcphu1rraIWbpwCA18HgMgKfsWguaUEc6eT9JclZI1/Qx5KyQ
	wFBQI8XgmskWzSl/ejW7l2VLsKZp1cw/A+FdJ9oyfmND6Hbw1qBIN5own2wd5Wziid4L5yhYZhH
	JlINvhi+PcOANlRC1PvbbzMvzbuoLQZnpt6xEPn7/fLgT1zVbAEPTeHaoH0KFUBpsjL9HEitAov
	UWAuYfvK2fnKR+CpqZI7EbLqWiyzNOxQGcxjnwHHuAiDOqHYKOrPAajp+Bp/u6vLxV5WGI2IVbK
	scqiE=
X-Received: by 2002:a05:690c:998c:b0:8b5:341:a12b with SMTP id 00721157ae682-8b5204c991bmr75920357b3.44.1795693502905;
        Thu, 26 Nov 2026 03:45:02 -0800 (PST)
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com. [209.85.128.180])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b5202b09c6sm85610737b3.17.2026.11.26.03.45.01
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2026 03:45:01 -0800 (PST)
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-8b4e18369c8so41252987b3.2
        for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 03:45:01 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErEmWKY4C12QnPOYjUrqPCCptpuWIOYSNEecgFTgop+YAsy7XPzSJiwtsA+mlKNyw+MDCFjsmgRG23wA@vger.kernel.org
X-Received: by 2002:a05:690c:4985:b0:8b3:3854:c28b with SMTP id
 00721157ae682-8b520435d1bmr62048027b3.22.1795693500919; Thu, 26 Nov 2026
 03:45:00 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261121213102.143130-1-tanure@linux.com> <20261121213102.143130-4-tanure@linux.com>
 <CAFBinCAzSgCGfXb_Q3FuwEmPAEiHSxzVR_ceyqMNp+LEZ18u1g@mail.gmail.com>
In-Reply-To: <CAFBinCAzSgCGfXb_Q3FuwEmPAEiHSxzVR_ceyqMNp+LEZ18u1g@mail.gmail.com>
Reply-To: tanure@linux.com
From: Lucas Tanure <tanure@linux.com>
Date: Thu, 26 Nov 2026 11:44:49 +0000
X-Gmail-Original-Message-ID: <CAJX_Q+1or5Eqe46hdtv0CtekSnLTJkfZ3UQY=RmfmYGeXd7YxA@mail.gmail.com>
X-Gm-Features: Aa3M54p7abSX0OPwjSGJJWzx2W6fGgqfMqyz9aVR061y3YOch6bS5dv9yFIyoYk
Message-ID: <CAJX_Q+1or5Eqe46hdtv0CtekSnLTJkfZ3UQY=RmfmYGeXd7YxA@mail.gmail.com>
Subject: Re: [PATCH v8 3/4] arm64: dts: amlogic: t7: add the ethernet controller
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: xianwei.zhao@amlogic.com, Andrew Lunn <andrew+netdev@lunn.ch>, davem@davemloft.net, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, Maxime Chevallier <maxime.chevallier@bootlin.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 24, 2026 at 9:37=E2=80=AFPM Martin Blumenstingl
<martin.blumenstingl@googlemail.com> wrote:
>
> On Sat, Nov 21, 2026 at 10:31=E2=80=AFPM Lucas Tanure <tanure@linux.com> =
wrote:
> [...]
> > +                               int_mdio: mdio@1 {
> > +                                       reg =3D <1>;
> > +                                       #address-cells =3D <1>;
> > +                                       #size-cells =3D <0>;
> > +                                       status =3D "disabled";
> Lucas, Igor (+Cc) has taken a closer look at the MDIO mux, see [0]
> What he's saying is that (in my own words):
> - status =3D "disabled" is unnecessary
> - if you had problems without status =3D "disabled": Igor's patch should
> fix it, can you please test it?
>
>
> [0] https://lore.kernel.org/linux-amlogic/20261124-re-martin-g12a-mux-t7@=
iav.lv/T/#m240f885979c7c3a84af26ee8b60d38f3092f0c0a

I never saw a problem without it. v1 to v4 had the on-chip bus
enabled and the VIM4 ran at full speed. v5 disabled it after a review
comment, so that a board enables only the bus it uses, and Igor calls
that ordinary practice for a new SoC. I am fine either way: keep the
line, or drop it in v9 if you prefer.

Tested Igor's patch on the VIM4 on linux-next (next-20261120, which
has it and the T7 driver) with the on-chip bus enabled, the MAC on
the external RTL8211F:

- both buses come up, mdio_mux-0.0:01 (RTL8211F, the MAC's PHY) and
  mdio_mux-0.1:08 (Meson G12A Internal PHY); link 1Gbps/Full;
  ETH_PHY_CNTL2 reads 0x0 after the attach
- while receiving 942 Mbit/s with iperf3, I unbound and re-bound the
  internal PHY driver twice (phy_probe reads the PHY through the mux):
  after each bind ETH_PHY_CNTL2 reads 0x40, SMI_SRC_MAC only,
  USE_INTERNAL and RX_CLK_EPHY clear
- the stream kept 941 to 942 Mbit/s in every 2 s interval, 0
  retransmits, 0 errors in 2.4M received packets, and receive keeps
  running with the register left at 0x40

So the data path stays on the external PHY across an internal access,
on the T7 as well.

Lucas
