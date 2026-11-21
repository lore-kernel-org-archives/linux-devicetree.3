Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795296819;
	b=wDalw27Bq5sVaooRNtrI2sxWgOIJUZY79FiavCAQa86JeG0NQRGk8ZUagJTroR/TegEM
	 hrx08sAtpaVHX0X3iv1nuP1Pt35Y3bOhxhO6bu31iuYeyyTVS1pdGgTSjKkt99l9qLsDu
	 gi0hM6kp8s15WnSGR8AB3Yo58nEhChfrKuq+1AMK2RYovcZImjHZNy7WLdzviUMy1VvmJ
	 mPB7jDZB7IyzkzOIV7w1/IMGU8+jPjYBD0c7Cv3BffE148yk9vZbFjycsT2rLY+gDiVmq
	 CNzBvjDjOyV8n+h87juiawMr4E49cM2qOhl2GSqjbxdYwWdvsTeEhmmgd9oAeGoOY3g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795296819;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=lxD5zixKw7Tr1W31Lc/kVqjisXnCxr4/jEW2jAJqxqY=;
	b=rB1ozHWBDl8Det5u/t42ijOxkduTyHLu1w66u7/53X/fgHKSXsNqXGzeMk0VfuEjKBmK
	 MDepNBS3qHFUD8kAxI4XI/XZ1eEUSVi76L4HJ1rM1c/1DA8mJF4xqFEgipTu4TlDIOKSs
	 fAw7fcNpd5ObhsgHi4LKGGXdkN8qUZ1hQ9Veg8GKXIgogzD3KTM+wDIrREogR3EKP/ven
	 aoYD47vjaEqOOfmCs1KUjFVzaCLpz6cNU57OInDoWcPmqtw7+JqfxWR4P5i2Xjwxt/41a
	 rCzpoa6VxKNKb5zFux3lcUf5eO0CNPkhPTiFzUU6Cv4bwhOYFpAXlrc/1HpyidQlsBw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=linux.com;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.214.175
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A1C7606A686
	for <devicetree@vger.kernel.org>; Sat, 21 Nov 2026 21:33:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1A1C7606A686
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2f04244c3d0so17251695ad.3
        for <devicetree@vger.kernel.org>; Sat, 21 Nov 2026 13:33:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795296818; x=1795901618;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lxD5zixKw7Tr1W31Lc/kVqjisXnCxr4/jEW2jAJqxqY=;
        b=osyB+Zu/+aD8TlUVUtsFg+3AGtZ48qvAGD1hMTrSsxWSISjoFF8O9Thxmv1r5mG3gJ
         WSBCIzrtSV6At16sloI/0V5bjfi9tAHLF9eSp/ZzxrWjgFydYVx8IjDla4zZFRG0jZbT
         Q9haXfic99X/FHhmHcDf+mn2yyDEENhxQ3uMw2s0Ri5H26J+Pa0DE8Yf7JjLfkTv7B2F
         XUPHujGCShiN3ASA5EjThwTjCo91OXaYdMB5X5QQQQuhMCnlmUnSe5NAa0k0BOxgv82i
         uiYKQsLV61dItXWtSJsteKEsaTa+MCrrwZ/1Ts47AH3EL1zSrbxMlx503M+70NCBAKzD
         VIRg==
X-Forwarded-Encrypted: i=1; AL+hErFbPIyKwBBZM5egf/1xWBZDuxEnXuNrtYLEYuL2Bd6/XdX/siL25WrFmH+7y0oFuTRV1sMEdMz3Suoj@vger.kernel.org
X-Gm-Message-State: APuU4Z9k2GM/ldLR0NWdU+OaXEojNpeLcpSnVZDgG85tFtCtOW5QDxeS
	xhOLU+oQGtJUhchFWFcLUEjDNTZSATmS68rcqxxaPgqtlm1rCBuevoq9u08IrSlK
X-Gm-Gg: AZFdTZcig/B0oAe3MojElKl3vkzU64iyjiGGVYQjlVOA2shg077vR6aYQSCaYESVhv3
	H+5k4h/JUdWq0txYcNB2wzuJgdINJQX+hNeKcTS+9Hdhdngi76Lx+F9A9iwuUE4Sxjyi8lDs3ur
	pEBhgtzbAnG3ZfMq1/vUnvO1QfNCZ/qic3Tb85RXD1CUFr7hLjyzDa6rJyrK5iys3UT3frVfsfD
	66TYCXslh3T55OYV1/u6cbpUy3gGn4rTL7askw0cB8mJJg7Bnc+Rwu2DfvPrAqIMItN3vzR8+dh
	xk1MXOiIUJ8q6zu6y+7r8PLWMZ+QD1zQ1YeNiUaXwG6ByqUNekOvFmMewfJ0rorK6OBnvyzb1gq
	WAzmpv32yDetav7gn62zKtmqPPEQzoaIRo+WN+BBo5ZX0LF00ZQF9nfFKZ3AuD3/eJTIuZwI15I
	gk56crfkPNCtM327aNz9v9HdK+z7Z4PNPrpOkSwK7gxorEBsWHZ4EQ7mcLccplje43WFGo9A7na
	ltE1o/zS6M0eYJllstEUrX7cl//Yzu9J6pe4Q2lStCxjSatfkeqGmuz3RW24Nwc++f9ke/dKd9q
	5BJwzSr9edFTQG3ZZ2edvEOrNKkKuNLH31IyvsZvwxtwfCjh6Hub+RP9E0erV5JGP/Q/akBfvZI
	ae8ukjRzOA/Zzwa8DVuH/0cMdffb6gjTam3rOkyatDFsUnVanx85lTPzZWg==
X-Received: by 2002:a17:902:da83:b0:2ef:e5b9:5841 with SMTP id d9443c01a7336-2f050c1d8cemr50613105ad.35.1795296818430;
        Sat, 21 Nov 2026 13:33:38 -0800 (PST)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com. [209.85.214.177])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f1059adsm29961125ad.49.2026.11.21.13.33.37
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 21 Nov 2026 13:33:37 -0800 (PST)
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2f048476ab9so13642515ad.0
        for <devicetree@vger.kernel.org>; Sat, 21 Nov 2026 13:33:37 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErGRK4T/yOJC70HhE3HvIgLzNxfNx8R3yCHRALzJ52jMqefS9mcok0QrQkwUn18O8pFlWBO6AtoPCQF/@vger.kernel.org
X-Received: by 2002:a05:690c:7206:b0:8b4:e51a:c4f9 with SMTP id
 00721157ae682-8b52032b68dmr26349417b3.1.1795296389589; Sat, 21 Nov 2026
 13:26:29 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261113121852.334604-1-tanure@linux.com> <20261113121852.334604-8-tanure@linux.com>
 <CAFBinCBZpruWYPrCWhRY146C9fd6ij2cOirJNORqAJFaiGZJ5Q@mail.gmail.com>
In-Reply-To: <CAFBinCBZpruWYPrCWhRY146C9fd6ij2cOirJNORqAJFaiGZJ5Q@mail.gmail.com>
Reply-To: tanure@linux.com
From: Lucas Tanure <tanure@linux.com>
Date: Sat, 21 Nov 2026 21:26:17 +0000
X-Gmail-Original-Message-ID: <CAJX_Q+3X8BGwj5ydk2TN3tDNLrrhgfKx1X1LQqjePYXJwqs5LA@mail.gmail.com>
X-Gm-Features: Aa3M54ryC1wrMtzkfpXZSCYbt8X4yrGmEQflHHmQnHyfNLikt3muwFhwFJm0PEo
Message-ID: <CAJX_Q+3X8BGwj5ydk2TN3tDNLrrhgfKx1X1LQqjePYXJwqs5LA@mail.gmail.com>
Subject: Re: [PATCH v7 7/7] arm64: dts: amlogic: t7: khadas-vim4: enable the
 ethernet port
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

On Sun, Nov 15, 2026 at 6:08=E2=80=AFPM Martin Blumenstingl
<martin.blumenstingl@googlemail.com> wrote:
>
> Hi Lucas,
>
> On Fri, Nov 13, 2026 at 1:19=E2=80=AFPM Lucas Tanure <tanure@linux.com> w=
rote:
> [...]
> > +&ext_mdio {
> > +       external_phy: ethernet-phy@0 {
> > +               /* Realtek RTL8211FD-CG */
> > +               reg =3D <0>;
> We've been following this for a long time until someone found out that
> RTL8211F has a broadcast feature.
> Can you check the strapping registers (or simply see if the PHY
> answers on address 1 as well)?

Checked both. The schematic (v13a, page 9) straps PHYAD[2:0] to 001:
RXCTL/PHYAD2 and RXCLK/PHYAD1 have 4.7K to GND, RXD3/PHYAD0 has 4.7K
to EVDDIO. So the PHY sits at address 1.

A scan from the running kernel agrees. It reads PHY ID registers 2
and 3 at all 32 addresses through SIOCGMIIREG, which goes through the
mux to the external bus:

  addr  0: 0x001c 0xc916
  addr  1: 0x001c 0xc916
  addr  2..31: 0xffff 0xffff

Address 1 is the strap. Address 0 is the RTL8211F broadcast address
(PHYAD0_EN in PHYCR1, on after reset). The vendor tree uses 0 and
only works because of that.

> I'd appreciate it if you could update this patch so we can use this
> approach as reference from now on.

v8 uses reg =3D <1>. The PHY attaches as mdio_mux-0.0:01, link at
1Gbps/Full, 941/944Mbit/s with iperf3, no error. The commit message
says where the address comes from and why 0 also worked.

Thanks,
Lucas

>
>
> Best regards,
> Martin
>
>
> [0] https://lore.kernel.org/all/bc8c7c6a-5d5f-4f7c-a1e2-e10a6a82d50e@lunn=
.ch/
