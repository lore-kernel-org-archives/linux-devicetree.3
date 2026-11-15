Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.52
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794765531;
	b=XV0c7GZdwtVN+jQhGiZ5NjCdrJJWNZznZ3qEqJ7wDSIwE+qaAEFwCizLYpy7bQ2mZcwN
	 jupeXUgFEtm+mAbSEMV1xV/KViLJKWedeasAFe9PIjAJ4x8vcyA+tEg5Bgd3q5GQxS5r7
	 ILgDmi/70c2+xB+v87Jyg5i4DIsTdHAEyBkTysahY0SD9CbuiwnjsLUNu9yoEpxstG0UX
	 BAU0fq3b4guHFNYz5FAC8r1qfUJY+IxD4XxODi0wexbmkCrly371BxzpARQ0IRunJLFeI
	 2qNFmyRe3cfxSzO3L/uKS9s+ZaKtGNLAkNlhJW43nSCtQE6OBmnlwbD32fLXtXK5qFw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794765531;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=OWp2aJVNli7UAjXW6hoQg5j8XmpNfGNSR1QLPhqZgnU=;
	b=1R+dQLjGE2McuOlJNqX7i1uzNWzIfKZDOF365G2mYaV91wKYVGE51SeydIhEHyVgnwnO
	 sZY7IGdpRFbXLvooKI3dyTj5AMIeu+NTG0tUMwYDOH1HSbah5eT8QkMtmbqlAdZfhMATW
	 PyrTIshcm7/E3Hwb6E/J9SsAZy//8LhAS6SXgKNBCyzSVxZM5o6lIUeBmr8h0x3pnphiV
	 Wiq09GC6W5wOI/2sR6SUTtzYruD671hlrNv2FM6SSVKw5xh6iX9znDH7sJyuF4aMuKsC8
	 Q6h6bQIH49rhBedKusSU5C+EE1h1wLsYb7abi2W2Vixh6H4tS/q7RjUOHCBeuFzjWZA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=googlemail.com;
	spf=pass smtp.mailfrom=googlemail.com;
	dkim=pass header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=XPWWAxNt;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.52
Received: from mail-yx1-f52.google.com (mail-yx1-f52.google.com [74.125.224.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E1E0606A329
	for <devicetree@vger.kernel.org>; Sun, 15 Nov 2026 17:58:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7E1E0606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=XPWWAxNt
Received: by mail-yx1-f52.google.com with SMTP id 956f58d0204a3-67db5e13b0cso223169d50.3
        for <devicetree@vger.kernel.org>; Sun, 15 Nov 2026 09:58:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794765530; cv=none;
        d=google.com; s=arc-20260327;
        b=bJc6Pk52WLOL8i2WMiZW2IpCcGkSKKUVOSLBJ3fSeqzGQ6Tf6wJhyAzlRRSjaLbxjj
         vjq9B8bgVj6uphpnmAR7qu+pX40FdzyVBivsAFOatMSEuojTJeeoqPz+YaQ3P+D0+xNX
         2YQcuYn18z+2GFUpc0NLOz812xEzI0mzbxOEC+P788lp3DyP19ixhnmauot+svQRTcIj
         ze31Vym/XPq7ypwP+tlVB0qNKmIIklaTgY3C+zGo80F1Fr/7v2S7bjwQ5fwkOdtJFzPh
         5ngbmjGxvCOSQ6R81Kcv0zUA/uHWqlbTLGKDBnUpAzv5lQlTmmaKP4bDXjIVedsKmM/q
         VIhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=OWp2aJVNli7UAjXW6hoQg5j8XmpNfGNSR1QLPhqZgnU=;
        fh=TMQ5fCiPVxzE00/B7GvY9hwUErW2rzwdjI8QzBJJvgk=;
        b=fZ9ukZf/iKRCZmzEJIvgvSsm+/VEnO2sAPuw6z3nn7TcVyBxIy+AfvCYMTmko94AC6
         lFuhhpNCHWqIhcfHnH2dZkW2DvnvU0j09OgaRqkVnmJccVsrch4mBnU9gfV+aPllvhFW
         zeCoHk5j0PibUc+iz1xZFphr54f5drbf6rgA1xhmQRCrgKuOJf9WloiGR+4R6468gasp
         BLCc+A3MYZmCLqEBXxAq3SrOvA49CnygOUDxYSKCpX3skq1fgd7Yro3gTW15audErTPW
         TUGwtUjVuDZRgrePCxcZjlYRDIQ//qz+mlm7KmyK/zdsXpB41S38/u/dbJ9GZzOyRgTy
         yh5A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20260707; t=1794765530; x=1795370330; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OWp2aJVNli7UAjXW6hoQg5j8XmpNfGNSR1QLPhqZgnU=;
        b=XPWWAxNt+Env286Yntq/K2JIap4Kn9A0wPQ7tm/yBRaK2JVC2a85qlbNrRRwiFS1eq
         rzlJ7NnIsHBdv7DtFwG+MAWE+xYIoHbmECwek3wSKRZwEK/bzaGXXmHTCP8g0C1LOvMW
         izatP19yRmpsv1AhkVO39qy6GJ0EgyiQgGi2ZvAn2jKlJQJIMEOY2ZnQVQuxGKv5zuzj
         A3/3a/rmUeMo3ytH/gDnVwaYJcOlne0xmKIzCKyaKfdAHbpTcKSnUBrSP5+/WEGXMQ2z
         tP8EitL/OdpmKWF2Ugqu278BoaAGRT38R3Q+S5oEB0mOq5WaSQiQu1OdNuGvwTfLB/lE
         2V4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794765530; x=1795370330;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OWp2aJVNli7UAjXW6hoQg5j8XmpNfGNSR1QLPhqZgnU=;
        b=q+51a2zPG4pM+ZSnEOojLIdDNwVAFxhaYPhjnn1Xb045pJvcNve2qzEdO/FXPUAvGs
         RvcEgNorf0qQGh4ht6rzFvEnw4jQItDUP5XoDfSXGd2aNC93udFtkJsrimL8OKK7N90C
         mjgDTEWpg/y+MXjwFq73JGfCXcAHg9p/hnnugU1bhU/+C6riYki+YTvNiZXB6oZw0MJF
         zF1lUfxYuuhufJaluA9bwy3mV8UC0AEtxF1D9oPyaWS2iP3M3mJcsirQ51JauXi67Y/E
         V+epxQEpxAs67ekZrM6IwIQgGehQ+NGxUXeBj4deWOc0UE/8hOssTv/4Utit5uK1U77C
         xiqg==
X-Forwarded-Encrypted: i=1; AL+hErE2rByaGplrh7ANqQxlOxT3r1uQVhrZGXoPESI3APvfblnG5XJMYkNiIVsujbFBvuAKmJfyQm4pv38t@vger.kernel.org
X-Gm-Message-State: APuU4Z8b6HxKKhJLQFCb1Iccj/9pASAAQ4nXV1Fvcw5jL7IQgfrTg8eJ
	TLPUBZxUpC46510aX2jkFhap6m17M/hqbSpFu4AfXfZZXsth+qr7HFoK5olimpuMql7PFNUpYsr
	14IImByX2Lykk0MI002VH4SzmOlMiCsQ=
X-Gm-Gg: AYBFou2cQfDoi/0p759+Hn0SaIxo9dDmpRiheX5kJtTtZoetQBXLyKHmpVLGlex0hM4
	eL9QxoOZp8eaKBw8EgK6ekQYjHynk+JeUlUU3Y2sY7KrdlhU0kyzzX25HUbz/xktNBqGoXJNrto
	TIRGgAcK2zkKUleZ8GS92AlXwAavXchd3VxjqNnN+Bdvk1IaC5cW7j7H/FVQzS5Sq2D5h/NmHod
	SzPKtm7Veesz83gtVALr3VtngOeXV6FzsHTB/J2F51sds3nNfnB7SzHXhc1cNi4JNJ4xo2wygct
	I28ARTR8gC4HEr+ToaCEgw/Rd4aaOePMdChOovrGEwYOLKyH2urvafchlW/7l5wwmKaI79LiJo/
	BZqjyVa6sOVflPqe1lIDDWYIbka8p/5Kihf7HjReeGLS12kaX1uCU3I2jpA9HE26me+vP/mo=
X-Received: by 2002:a05:690e:118f:b0:67d:9fef:d61a with SMTP id
 956f58d0204a3-67d9fefe1a1mr1954166d50.8.1794765530625; Sun, 15 Nov 2026
 09:58:50 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261113121852.334604-1-tanure@linux.com> <20261113121852.334604-6-tanure@linux.com>
In-Reply-To: <20261113121852.334604-6-tanure@linux.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sun, 15 Nov 2026 18:58:40 +0100
X-Gm-Features: AclHuK_i44pvTA9IYISQzdnNKpkNilY1KX3H0SN4TaP7nH1OVG2B38AEZw9Q2Eo
Message-ID: <CAFBinCBbL0F=2Wx66Ef11gUKHdz80vYrwjniMFRzeK-uiu5-rg@mail.gmail.com>
Subject: Re: [PATCH v7 5/7] arm64: dts: amlogic: t7: add the ethernet pinctrl nodes
To: Lucas Tanure <tanure@linux.com>
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

On Fri, Nov 13, 2026 at 1:18=E2=80=AFPM Lucas Tanure <tanure@linux.com> wro=
te:
>
> The SoC brings its ethernet interface out on bank Z, but no pin groups
> were described, so a board had no way to hand those pins over to the
> MAC.
>
> Describe them as the two sets a board actually needs: the nine pins the
> interface always uses, and the five extra ones RGMII adds for its wider
> data path.
>
> Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
> Signed-off-by: Lucas Tanure <tanure@linux.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
