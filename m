Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793723441;
	b=lqJ9hlyzZSfgbCazVIwvhDuKGALNF6QwI9WGz/NCPiONswTujd6HjR12r3iXAVO2+XwC
	 o4lKjjzzqSiU30YQUL2muXKCMfmDqpzKQ7XuTeRjc2GWAr5wdjInfXAJE6BMTkSf1JkOu
	 KjgJ2T6jj03e06lYG+MnfZTx1oCMF3r83hb6Vz+fjKxf/MLsgHJtqGHJYYrqFURSW1sYI
	 9Yn0bvGntUY6+5COWYfJsTC5BnisU0IqlmYd9c+ddEKfF0IKdoxbPUvfZk6RqpmonjUmu
	 y8rTy6suVB9Ck4vCbiX4ugPhomIeqgciqQAP5qF/O5bwkWI+ix65HOuig3MQNW0MypA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793723441;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=QIKLXmDhQNqLB4Y+YR2V9D04+lvxRqYL6EpEyVAWUjQ=;
	b=L6gFeGpvzu6epa/c1LFxzx8SkYVLjFl4YVfJ0OUUnsbEvK51GJy5skFbAtsdTXKYjnzP
	 CDwA1F/zBLhBtJf8TNVPo8bOiJpgwDy/uFEs8hW97OuNixpuPsv8EAR+rVPRrWpOdehSq
	 myBJ0ZH+VtDZUVyKAYZne6y6XEwX2WKn/CTpGfOcty7//BBiNrBWGSdIRcOoXZRphxLzj
	 nxGzO+mVmSu5CSEnLwYYh9sdtUaVxiwOsA7dBToKnUFXykjZ6gXEcMguR/ykBXU4wIFMd
	 kb6Whr2R9N8TVRfYkvdtAXVagJXFqMWnm2yheI5iGp1k/LSWkizUPTywMju0UGUoI9A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=linux.com;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.128.169
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93F84606A32D
	for <devicetree@vger.kernel.org>; Tue,  3 Nov 2026 16:30:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 93F84606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-8b06c0794cfso40632917b3.0
        for <devicetree@vger.kernel.org>; Tue, 03 Nov 2026 08:30:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793723440; x=1794328240;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QIKLXmDhQNqLB4Y+YR2V9D04+lvxRqYL6EpEyVAWUjQ=;
        b=W/JYUS8Ozz7URboQkkWYvQkeOjV+qUEf+S/ZFOG7x8lPlEimYMCJjS+E7XIYeKAmOm
         0fnKzhsmjCx5uDGisaIXcP7XMWFHR1sTtqUj06TNWvJSxy7dkxfNbgn/k4qzKJQMlIGd
         5g+FObNs+ZF1auQJnYj/USkAxmr9g3ycsN/eAkU8dxRU1l8A+Rb4fCvtoglf76kAvw/r
         ETTXfqWt6m/btNFz6BoOa6mt5Wy4ZUoJeuTbfzDysCjX3jJ+rk+cNkByfaomRRTTiOoW
         N5h4jbdyZt8QEqP72Pi6mq8Isax3j0cWoBF3ZwF3/MUeZi9Col7HorhIBjky+rgxGI4r
         I4pw==
X-Forwarded-Encrypted: i=1; AKwUvBxmi1KwdVRp9U0IV2sC04FyG7650OWhd+WjU7JVRNi1Piy0aFXgjNmaxO4S573KcPOo2kpv14eXfAt+@vger.kernel.org
X-Gm-Message-State: APuU4Z/4gWG/yWuZf1yCI6FxqR3pidru7Qrz2IneKN9qw4HhDTvB0hzK
	HD84t8QWBRXsvZ7QWDv8BsMmaxhqjIzH7JhSRfswcfuMIoapksCpws32jGM8W6itBkI=
X-Gm-Gg: AYBFou05blDr/NO7WmMrYfkSGenz4bTV1Kp3WrhTwFO2YYUPv03c3pqDk5wy+3YkuV4
	EvEVMjP0UUNmCJwSnux/9ReulNLzMvj16EKMeBlzumkMJVp2UyRURHB/WTsoyLQv/gEWzC3htB1
	OLa0/2xMuR+7ynuzJNh9Mrps9EqxTqecnjlGTmRfko1Z2D8bLkU8toja5Azl6L4h8rOrw4PeqqH
	Asiv2mBpU7lrpiFab5OZpHd3XsMc3IiPBHGfi47al99zIJIlRUGHEG0hdAB1wq0A7cbxaRqDaf/
	Uj9Ep5U3a68eoirgsmN15WFCVjyzaHZ4C45NjIneNNd29/8UPfBvtiaLeuBQnIuSJu3hqTWXSt6
	Zl+JSxihLZoGEhoft+GeoIrUK9PGHgA89HENv6SeMqhwT8iYyFyJ675wP+rGikVbvd2kDRzgTRE
	0vm+7LYF+CYW6OaAk78fGiz+UQNgKmSErIXIA2q3NmonKznwXvJoz2j1y4/Ecrv+Ohaic1sZXbx
	RFOOxXg/UszztvJ1zxrQwotbngW29TYncObfiY8R0bxVpujFWdHddYymMN/ipORIMWIEjgwVFVL
	htJ9XZPUjN6OdmTuiis1vk9wxnMUldhDXKhX8j18Vrf9oZVI74XgTms8/7iSoEP/zihlTaliBOp
	2ObUv2DBSjyE0w22QNUgI
X-Received: by 2002:a05:690c:dc8:b0:8b0:e7a0:ac55 with SMTP id 00721157ae682-8b2b674feabmr102866577b3.45.1793723440582;
        Tue, 03 Nov 2026 08:30:40 -0800 (PST)
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com. [209.85.128.179])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b3099ae415sm64437b3.35.2026.11.03.08.30.38
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Nov 2026 08:30:38 -0800 (PST)
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-8ac525c1f05so41852027b3.1
        for <devicetree@vger.kernel.org>; Tue, 03 Nov 2026 08:30:38 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvByfldqClCvDHFzodpdb4/0VZUJrnAQyT3prbYe2gszKFAWHMX+GuFvFb0hUHHdJ4B1EGafttp3CocIT@vger.kernel.org
X-Received: by 2002:a05:690c:91:b0:8b3:2b8:856 with SMTP id
 00721157ae682-8b302b80a2emr8226867b3.68.1793723438403; Tue, 03 Nov 2026
 08:30:38 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261022200640.3101932-1-tanure@linux.com> <20261022200640.3101932-4-tanure@linux.com>
 <c7d703f1-57fa-42cc-82fc-3e0aab05b71a@lunn.ch>
In-Reply-To: <c7d703f1-57fa-42cc-82fc-3e0aab05b71a@lunn.ch>
Reply-To: tanure@linux.com
From: Lucas Tanure <tanure@linux.com>
Date: Tue, 3 Nov 2026 16:30:27 +0000
X-Gmail-Original-Message-ID: <CAJX_Q+1=3ZRLX7B0UG+R5G74S6tVECPJV-MWcYfbU6nh=EOaug@mail.gmail.com>
X-Gm-Features: AclHuK--tXPcmW4jBK-98mKvizjMAJUNc7lOR6WXsrVb58UVKvwxXzerIoleZek
Message-ID: <CAJX_Q+1=3ZRLX7B0UG+R5G74S6tVECPJV-MWcYfbU6nh=EOaug@mail.gmail.com>
Subject: Re: [PATCH v4 3/7] net: stmmac: dwmac-meson8b: add support for the
 Amlogic T7
To: Andrew Lunn <andrew@lunn.ch>
Cc: xianwei.zhao@amlogic.com, Andrew Lunn <andrew+netdev@lunn.ch>, davem@davemloft.net, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	Maxime Chevallier <maxime.chevallier@bootlin.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, netdev@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 2, 2026 at 1:57=E2=80=AFAM Andrew Lunn <andrew@lunn.ch> wrote:
>
> > Without that gate the controller cannot do DMA at all, so it is
> > required rather than optional: a clear probe failure beats an
> > undiagnosable hang later.
>
> Does the DT binding mark it as required?
Yes. The T7 block in patch 2 lists the five clocks as an "items" list
without minItems, so all five, pipeline included, are required.
>
>      Andrew
