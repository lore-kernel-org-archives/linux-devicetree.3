Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795296902;
	b=4iWTQkHFeHIzgh8JiAWDYazPTBGAaQbrpJTO25vI0rmxX2X84/YwW3Zw+QBI2VnWiRzW
	 ZhbkNgTXFR1GF/jB2r/kPBVq2EZenNx6Ow+PxTw4dZw2oEnhCiF/AGCaUol2v9tEX9QRg
	 Y5wmcnT9sRWNc4h7O/e86XIl6W208Yz8Mvv3Phl0IgaK7aDaiQllka0NH9rywgXaCuzXU
	 sOo6RS0Fil6Tewmy20dh2lahC7YUo4PS35EFtAzYpBP+yOYrnumb5oS+eMca3ImL6OvYh
	 zoHTN1BOb/S97gluPtwELCP946G/601Nf2cjimO5JSPwdAg8V6T00EO6kydrdyftNiw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795296902;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=vLPdwXc/aJvHEChEYmLlCcJA1K0ap0UNibPU2Yd3+IU=;
	b=Gzm03/z5cLtM1JDJXw27i+AFO80hN3vulgWHPL9WXR3YHEnrtpL7lFk6P34HFl0FDBwO
	 YoY+PSw52jSr79QKUb3er9SIoLrjF48pB6SPP2UqdhAdG7JtdiALS5pht7LV+heElJPmq
	 kMYcsZtsotxnRmUwEJgrb639ACJ+PQaexcTi2x/hVQ1lBQwg8IqM5YHjA9e1I0h1yIYYx
	 wDbUB/uNknhIb/+wD83hQxecDQ5WIFQTe53El4q1jojgVPlxP/4ESeuvK/VvNm8s9PMcu
	 ufytTI4j33lTKExri9jJqghTqxEl/RNr/iKoEkF+lWhLslmvspiYGzMGCPhOObv7acQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=linux.com;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.219.52
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8F88606A320
	for <devicetree@vger.kernel.org>; Sat, 21 Nov 2026 21:35:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C8F88606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-921318b2eb8so28308886d6.1
        for <devicetree@vger.kernel.org>; Sat, 21 Nov 2026 13:35:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795296901; x=1795901701;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vLPdwXc/aJvHEChEYmLlCcJA1K0ap0UNibPU2Yd3+IU=;
        b=2hjtgRXcVYI13g9ir8z233PpYTahGw+pUBP0H7j5MGKYzX3WJP7RSROfR3Fb9iYE6d
         LdBapp4iZ4xvxj1NY9ham+qJg2fqE/FpRyrV/jyU8Q3let7qwYtltK9+n8kSuJ8fcGcx
         mnTEZWHayARzyXd/rewzrCBfJcsrLBL+tgnh6SVSpXpa1PZsMUOGRa+tcv+fUdcZa9qT
         otorOqRLgfRPAxaTRxQhbAvLL5NTkPBK86f/17QZZGLZXHASeMCDV5vxp0saK+JJBhPI
         tAbuHC8ciwFSoS+Kg7+358+RJzOzot0SqYGQRJWypx/46AckQ/rz/ZBDOX0STQMX0LJf
         VZOA==
X-Forwarded-Encrypted: i=1; AL+hErHBJm9NT9pB4HgON18J/RvIsnoBae9/oF4+lPvxctx2q6QsrnlilC3x3B4Aqg9851akTGKMky9bVYtB@vger.kernel.org
X-Gm-Message-State: APuU4Z+cLsJyZNwVFb4fLcT0cWcPwnzl0tMR/56iVrefQvPtSbucFIJU
	q6duUlTHKeUVOZ4eMwsq/dmq0tGgptw49qtB0PDHFs7HuIi5wXMbBybRc5qommTS
X-Gm-Gg: AZFdTZd9OoQEWJ03crHVIdMha9nzZh7e4s4S4XXibABK7HCPePdXaJQ1KPWoZhjSobe
	rgLdwnLmcXNjh6VzI7ZZ8aZPQ4790LG6/Ft3vQSRVtOdjLmF+qJ278D0sI9F0/eFxp7KEPmqP6b
	4YyxhRq5tDXXaxxQZskaFHoEDmpidYqtqwRUlP0K/62W/vk0/FQuin923lwdYGNB65SlNhqBAoV
	w+HRNela998AX+xOtG87gH7fpKgPfBa5ABJgDUccqL8UIkWzjb502WIvx/+6KjRM9yXXXA0V7gZ
	O2kl9n3/ZZ2hY3/6YcecDNQq2QOzfoyB9iAmhe8bRZ6IXjvxJ2np2PVAhqCS4c1XI/ghA2z43AQ
	AMrutigamZT4ZTl83SVgluT7R1ejSEa5J08MP7zWOb9F6ET7AHBLOv199Oarodda3ZnwYxlp/L6
	uhiAn3S/ulybJGV2gFHTOezP0wiODT/myCRCNgaQOxvBHfR74v2hr3M/zApGHUYcPFZ83UiTeER
	rL63Zb6+scMCxUaMXDqC+hDEFYnFqXs7QKWKa5N/xxA7Ps0DljdnvaR6MRPmUSrNpUI7Ja7fNEH
	Uy/bqXpcCOkScZlQV9d/Aeosgt8zz2bTXoC2XttP21FsbqxlPW0iXiZsV+3zedWV4ShWzYpFMJg
	Qmm/rI5EeEPFPGnHqWiiJonUj7hIUFpK5oTMnEC8zvK2oEmI4cSeKYA==
X-Received: by 2002:a05:6214:8620:b0:921:420e:aa1a with SMTP id 6a1803df08f44-921420eaa91mr69932326d6.33.1795296900763;
        Sat, 21 Nov 2026 13:35:00 -0800 (PST)
Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com. [209.85.217.44])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-92134a058aasm61677436d6.33.2026.11.21.13.35.00
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 21 Nov 2026 13:35:00 -0800 (PST)
Received: by mail-vs1-f44.google.com with SMTP id ada2fe7eead31-7d2d18f1bf5so1297073137.0
        for <devicetree@vger.kernel.org>; Sat, 21 Nov 2026 13:35:00 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErENWdiVDaq272U7B7grtqLTuQgSAkxbydRMsBSHo4br0/poNtZfoMEnPWah8vBEF4O9pVlk8VCz+dNA@vger.kernel.org
X-Received: by 2002:a05:690c:6c92:b0:8b3:7782:675f with SMTP id
 00721157ae682-8b5204bb6b2mr23239647b3.66.1795296429324; Sat, 21 Nov 2026
 13:27:09 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261113121852.334604-1-tanure@linux.com> <20261113121852.334604-7-tanure@linux.com>
 <CAFBinCBFfs85ZgYLq0Hbx-E22twLYMZztk3inRuRLaBB+MXsOg@mail.gmail.com>
In-Reply-To: <CAFBinCBFfs85ZgYLq0Hbx-E22twLYMZztk3inRuRLaBB+MXsOg@mail.gmail.com>
Reply-To: tanure@linux.com
From: Lucas Tanure <tanure@linux.com>
Date: Sat, 21 Nov 2026 21:26:57 +0000
X-Gmail-Original-Message-ID: <CAJX_Q+3eB5K3UjfPHnsD8OrCg6GA8zOLWVdfFONFT_aociTCrw@mail.gmail.com>
X-Gm-Features: Aa3M54q0-4I4quSKRWB1j7w8Nv6x5L8DyHdNe8I0CVnAIjNuxS8ecYBkoD_MhLQ
Message-ID: <CAJX_Q+3eB5K3UjfPHnsD8OrCg6GA8zOLWVdfFONFT_aociTCrw@mail.gmail.com>
Subject: Re: [PATCH v7 6/7] arm64: dts: amlogic: t7: add the ethernet controller
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

On Sun, Nov 15, 2026 at 6:02=E2=80=AFPM Martin Blumenstingl
<martin.blumenstingl@googlemail.com> wrote:
>
> On Fri, Nov 13, 2026 at 1:18=E2=80=AFPM Lucas Tanure <tanure@linux.com> w=
rote:
> [...]
> > +                       eth_phy: mdio-multiplexer@28000 {
> > +                               compatible =3D "amlogic,g12a-mdio-mux";
> I think this has to get a T7 specific compatible string (dt-bindings
> only, no driver change needed):
>   compatible =3D "amlogic,t7-mdio-mux", "amlogic,g12a-mdio-mux";
>
> If we find differences in T7's mdio-mux compared to G12A then we'll be
> able to manage them.

Done in v8: a new first patch adds "amlogic,t7-mdio-mux" to
amlogic,g12a-mdio-mux.yaml with the G12A string as fallback, and the
node uses both. No driver change.

Thanks,
Lucas
