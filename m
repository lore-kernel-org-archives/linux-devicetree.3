Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.178
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795556328;
	b=p1AEg+jPy1CyBpVMp7tRMfHYVtGk1ewfJb7QDn9IgHBk6cBFBCpEkMJtgBLegk0IE8E7
	 lJWqiFx7rigKQ9sjFdvx53NVXEVwiO4JYUmturGnuNPm5ofmU3O1tT0BryQT7vZN5senR
	 ccMvQJ9tfMLgArNkgRj8YI59Fpc2697aVMfvws1KqMqhPYUxokJtsar/Mv7UtmDv2poma
	 5ureGrhZ0AWmVDyQ4O9yuHMqCbFz66dvBbxu1PKShD55TyM0WkUpNHmrMhQXelMhUDgYy
	 4c0vNTThC76fhfqSY08xKgpjGIB1b1MUZLjDSG/88mZg+Yd/Gn5jAe5fgtBNoanWgAg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795556328;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=+yhNDtVkGsB34hsrY/DrTfudZWn+Znetsqsket55Xcc=;
	b=zPcU5lkiOIeM0u0dLUcXvfre5k7keaeIRKqj6gP8iykfMxEoxzuNW1zk4hw5LFBb0v2b
	 FXSMoRh2mUxW+HGFO3r+mOxMtrBrWswDqYC7rJ7u6gSyfkD5WgfL7a6/QwIUvHdqeOXUi
	 PdZfnMYi6jwDxT4IxoUKpejQvXexOuAbzzWjsT/6TDpIwV7v746YDZpro5H5EP94HehRk
	 LspRndGEQErCqT5xJsyFZr4YYn76UkOz8acvMHzMo1tegcmg2fyzTFZupPYC6wHt7gvPk
	 3coDXayrw4NxPGEinnxtjt+6DOfMgTB3sp2wUI0iSN4eNunimzK9QPq2feqG3h1go9A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=googlemail.com;
	spf=pass smtp.mailfrom=googlemail.com;
	dkim=pass header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=MRQzwtKc;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.178
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE795606A6A5
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 21:38:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DE795606A6A5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=MRQzwtKc
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-8b0ca1ebc8bso44335207b3.2
        for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 13:38:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795556327; cv=none;
        d=google.com; s=arc-20260327;
        b=bPUemCA+LjkIo8+niNlDh5y8MXhoXt8GqSn9wqn/m6o7Xyape4NJLSXp8F7p1gTv0w
         1nl7Kx0vkZmnpdvhdfL2PULyeTXShhVLb+GLaVi37YgH5A1x8OjXqTeqqp8qzWDAGF2i
         ADM3jZbT5+YXP6vL+Y9gWw47o/6JXcnO2NbfXC0kDhdxTl0q6fLMgfaL5KuJZCVbyMCU
         c0pd/ykP8VMR08ZjP1dISeGpztH2d+IzAD+Jugmcv3eVnP4bghJKPxzq3BLGX+oA9PcM
         gR7wVt3ThaHEygF7RMaMo2FLvLE8ZDw87nvyqpN/G+n2j+ACRitlnpeNL4HPiL/67szH
         rfbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+yhNDtVkGsB34hsrY/DrTfudZWn+Znetsqsket55Xcc=;
        fh=Kdveqv2kZliqZdkFTtY0C3MTNM68FP2im413ORVhTz0=;
        b=eaQs/roItoKFK3bRjHRldbG+1xyZRbpViVKgEdI0kJn4gTFTrFdS3QAZA4AvlPAPIX
         0amk/EKn2gw7kMuuOBImpJ72+Spj1vVUUP73YxQ+23s2itcOARllkUI+Qs3uwkuvaJUD
         nhVJwVxrSBtYC2kZhZWf48voUI3OIC7f3O8Wh2WoLraB8bOIKm0b2ketn+HFebxnYim+
         uE1t8LWjdP6C11GABLEyqc0/TTI5OoXvf5D8CxlW05yi2gBIRBr8j8NPxQ68Q3Q5H7iH
         Ovd0jDy22AJvHsnNAL0g51eUkxyXuRpEfwK5hOu4rTAQ9zorTYlw8Tw+b7E3xM8MHd7I
         jc8g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20260707; t=1795556327; x=1796161127; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+yhNDtVkGsB34hsrY/DrTfudZWn+Znetsqsket55Xcc=;
        b=MRQzwtKcpvuLUX7gVFRmvaBf8z7TwF++fqSkjnaqL1tkiZF2n360rRhGPODzSqMsnz
         zS37yyGaj2vH/anO7WJ+uamepQe28WsybHNyBjInK1z3ONzdi2zK1+uppWvMUg7wik0m
         gcJBvoj3c5yvQ34d0DjEotBoOJUdjYa8+PP5o5lvgotgvWd9/6I1uk+Ii284UD6vy2cB
         w4mqTszc8iSfhtwpprCcjmziMe72Tivt6bN/SKVnsWn4GLlcPszevwZc2jygNhGIO8D3
         CzuSGzzrhmPt9HboLdYrw/LCjRk/imUgqoxKarwk38lmHJ13AjqTP3iCI/G96LY6lW2H
         Weaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795556327; x=1796161127;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+yhNDtVkGsB34hsrY/DrTfudZWn+Znetsqsket55Xcc=;
        b=wp2J/gWJlkuQPxx67TlOF0CC27NYRCKCW/1h7jA1gF1EYT8sij7bAOCZE9RJ1Nc1xj
         dPPgWA0gBEWBHJIT+mqYiHq17KbvH/1dLqQMh1B19yal2YXenAgGRTRkJQotX6xTUu5U
         YJTVUzqf8kzhhfT32sV6Oz5UNNr6k2JQu3QmZL5f9h7RBeenXs2I58tllZOdIJMt49Mf
         nw0twxXYmRJ0v2rjY+2lqNVwNuEMhincWS0i8sEg6y7TJzkvm3xKaHy5Z9Om11IR8OSQ
         AVdICAaY52Z9znp79k2W+AkNx8AtmkWf9sxB9IvlNmB5S1QhpnXN2mWpPPb2YAW8Ta03
         NxIw==
X-Forwarded-Encrypted: i=1; AL+hErEnuJraIkfUgXqp2HIY6Wt9M3566lJri7mqVW6ddWaWs33YwkirjbbuOvCEst/i7dFv0e4aOnbdK2VW@vger.kernel.org
X-Gm-Message-State: APuU4Z+UullMTvWkn0SZ5Q8Zp+NpYyhVzU1oR64rH5C+Xy3Mxy55nOiQ
	85W68ZffEKrFCQHG1CiQZWxWBpB0HmCaYls65XKnhE3OQrqLeyvrcBaSdBBvsEm0YaCnvADvoas
	NIR9M5OawyUEQK/p3xkTSohgV2ewN3YE=
X-Gm-Gg: AZFdTZeCn8LQEwzuhT/SV3j3RcMaIe8HGjaP9/orMYv4k8Wh5SOyrVNRZpOm4YDLvyO
	7EGAT8+3nT25gGGU7N8P6TvM/pUCFAXXpvFUktUysot7MesG9AFS3F19RJzyT0s26DQcM8iY20U
	MrIef/34TdwcfMR5vAN8MorvGdxdO5eqbEX+XWt/ORMlscKCotr75ENC7xxfpl4lNbRnlhDSggh
	+j2RTupdG6jDMNaeyNz5rjUs6GjMTqo0q+V8VK0TkzODL90s4ZxUZTUy3QWbVT0qDZFp4ybjOn5
	SePqdyvfbp/airNndtXRfO4H3Ewk0efUAmmxHEH06ToqsU2iIOsN0m1VFnuwRONuczRrncOTaRx
	z79b43q+n+TD9lnmCVhPjkx4f22fLgKYSJn5sXY8cHXrlSrT4KmWjllXSqUk6qjFKTQ57/g==
X-Received: by 2002:a05:690c:a89:b0:8b4:c1ef:db88 with SMTP id
 00721157ae682-8b5204dc558mr63502567b3.40.1795556326911; Tue, 24 Nov 2026
 13:38:46 -0800 (PST)
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
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Tue, 24 Nov 2026 22:38:36 +0100
X-Gm-Features: Aa3M54pH5ipmAt51OQad9aGPrJTAjEJ236HllU0tqVNlknXoe88HjErnJUF6ArA
Message-ID: <CAFBinCD+JwU4mdgE54r0_XT8K5eMt2rjKQ9+3Pnt9V2nviH-fw@mail.gmail.com>
Subject: Re: [PATCH v8 3/4] arm64: dts: amlogic: t7: add the ethernet controller
To: Lucas Tanure <tanure@linux.com>
Cc: xianwei.zhao@amlogic.com, Andrew Lunn <andrew+netdev@lunn.ch>, davem@davemloft.net, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, Maxime Chevallier <maxime.chevallier@bootlin.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-kernel@vger.kernel.org, iav@iav.lv
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 24, 2026 at 10:37=E2=80=AFPM Martin Blumenstingl
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
Sorry, I forgot to Cc him :-(
Now he's actually looped in
