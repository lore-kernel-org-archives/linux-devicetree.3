Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795333963;
	b=tE8AyWdriKBoSDzQwyM0qwshJA4LljTfupnuGypcM6wIAvAxFGTAyMJ8yx8+gcPLwlvG
	 ZotgBShwc4njpe1GmzSSxVcl8hjnA/Kb6IEHqHFQitaoD5PfD6YQ+/2gxgoDt5D3EFm06
	 GhDZBlwW/bTVfU9BpG4gXRI6XczblOwAdPhWq4aOwogFyejAC6D5cVuOVtNDMYjz/gxX3
	 44vmqDfC1zUr8niTqOVdVA21d77tt6eUh7QS0Rdhxv+al1ypbePzpkPRYUe+g+PAUvaY9
	 boR4h9H8uL4iqzsu1myFCyVNWc4njBjsmg0b4fB40nNj00RGER6EP/XkKCgjFYngfVg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795333963;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=/xbKBOQ+2sn1cOusP4Ybo/C0ew1hnRxWONbAKH11Cm8=;
	b=FPoSas4xbechvWIJR2a90EHSdPvmSnrmsv9SMtpggSQfPOa+/uGmIdDIrFVdMMO2cXT8
	 Jn6oEeVvRqK4/ojhCpUiTqK8vawjZCUVNNxrNpswqBcfStVfP7C7gadcxF6/tep3A9hWa
	 ufvIzzZgqcCU9WVyLl37z7Qd0ySQ3SFgH3M8w52cvk0/srVZ26hYCcMZ9lp9pooZbfUpC
	 APEKZc1IlIVTUOdBusHEu5lQ/d3I/TWG7B4Hu08bBABo9k88JTK2/Ez06y5VxfiXxC/CM
	 GIFXlh3/8/OSiaxnLkLw60EittAizu9rvSoQ48jkwVbChFPqqMmVAsxA8qGFGjabE6Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=m8R5qLvJ;
	arc=none smtp.remote-ip=209.85.218.51
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CC1A606A32C
	for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 07:52:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8CC1A606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=m8R5qLvJ
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-c4203bbb1e9so368844966b.3
        for <devicetree@vger.kernel.org>; Sat, 21 Nov 2026 23:52:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795333962; x=1795938762; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/xbKBOQ+2sn1cOusP4Ybo/C0ew1hnRxWONbAKH11Cm8=;
        b=m8R5qLvJwnBLK+o9R0WVEq95QI9gDJrbaGXirXaWjgk4/GwfdqjzJOUbw2A/aJFZDH
         sHkBM8RJm4FlA4mq9kajGiqRVsiRqDoFjmS7rEmqEENIJtcxvliptlDaZXv1RC6AWxDq
         /LHPjG2OYQWyFuBZFMwRwKgaVhmcchUxB3uEoXwETrwwWx9KADd3vye5nCQGEulHoFJo
         IOnjoXUqmaUCQYlFC2jEBkxI8pvNBV82OrjqjXTK1FlNY4Sc8ejvJFsVx5VzNNDuLd43
         NrkaIBNgvPF0MWyL1X31b+LM7u+BiRAYXcVmYMZXq1VVOJ+SZoQrTYFM3wsziKqSewTb
         rihA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795333962; x=1795938762;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/xbKBOQ+2sn1cOusP4Ybo/C0ew1hnRxWONbAKH11Cm8=;
        b=MnbLknlZSfRlL/EUc5axVKLj61GUfGHd2fnLxQKOMFKAg++ZzLpFGgDQUcl8BqR9YC
         FAkVnIZbUzgnqb0TexMQITQzli26e9JEKmviYYuTMLmeREMvLQkBv8CMy1FuvD3WeQAj
         3dS6S25wI1p0eU4eb6kYu5Vx+OWmrZC8amX3Kng4rjGl67w1F9NjPC4ZeHVabWBMvx1v
         8jNa9RDZZKWAbLWaAsSkOy5aYHNKYZcg6jbTPUE0+vzwFh9CDcoJb+3Vjq4ezhjN4fXe
         NgdDndGocRCufMkO3ucW8+Dl/fuwyBBEs2E+YvHRK81F+Qo/C6sW+mk5Mc5FRH4pUB0U
         P1OQ==
X-Forwarded-Encrypted: i=1; AL+hErEFxuFAszTEjUaNsXXfBL2pyG+rwFWhokh+xNiPfrD+6tp4C6eSKVyLo5oLVjvALUlShANSswyvbEIz@vger.kernel.org
X-Gm-Message-State: APuU4Z+Zq4f8Vtobl5CTINtrjZHOvBvL4zwIw8FKXcKu3fL0F5eqGLa/
	hZfWJx5yhr8yjqbDpOFFZV1d8OF8ngT1wqHtJqzeieO1JbCLnJtdPsAI
X-Gm-Gg: AZFdTZe4nIzqM4vkXslBwOmPq4ZvJ3CxO2CMVTFVnCHZ2+iZ7nPDqW7TVvNBqbQF7Wl
	HyaDaO+ElxEcUfEoh22raigFoeoF1dfyAIS4ZurCdR3zL2Wx7Sv56IDhZSrvydq3BmWo8+NMXPh
	FmJz6qIe30yU2Yn+kMhoOEfdT151wRFDuyFwg0Ms1jzcB1hx8Wii0X0RzAhC4nobXXe1dFFbt+H
	vu1Ms7CAucrH9vz3keqeazEWE+3/7oc5n3Dvhn4L9N9xtm8kl7in7PGW75YNjjVwyWnS2fqI53B
	hztlzvk7PEuerfwPwh36L88QkRk9P2KHfeYL7LDNZA4rS7XBlSAfw2wUp48gkrXggWSC9eZxghj
	6156BwzcoKCyrkaL6x4LL2kwWz6RjQXtV66uuyoy6Ugtpxim3ZvkUjhTclxFhDwVEpPoRC4WRCz
	id/u+nF7IFAAPqBnn96XSseBoX+HZtOFBcOuruozb59X1G/QTg/zZ2lziuy6vvMiJPhPZjB2cPt
	gpqss+HUZBa0kwAfM/kwlXPcQWVAK/FJ9yV4EeJqKOL+jdxBzRebbyRy54T++4Kq1z7PYwa64dM
	2Q2GPGcFGhSd+xN1aBnp3KghoQ==
X-Received: by 2002:a17:906:2dd8:b0:c2e:3ed7:7db4 with SMTP id a640c23a62f3a-c513a840ebemr531051466b.23.1795333961712;
        Sat, 21 Nov 2026 23:52:41 -0800 (PST)
Received: from dl360p ([195.155.168.55])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513ad026a4sm290470366b.2.2026.11.21.23.52.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 23:52:39 -0800 (PST)
From: =?UTF-8?q?Adil=20H=C3=BCsrev=20Tepe?= <tadilhusrev@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	Michael McAllister <me@michaelmcallister.org>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	phone-devel@vger.kernel.org
Subject: Re: [PATCH v4 1/2] dt-bindings: display: panel: add Novatek NT36525
Date: Sun, 22 Nov 2026 10:52:35 +0300
Message-ID: <20261122075235.2915534-1-tadilhusrev@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261121-brave-adamant-caribou-b01daa@quoll>
References: <20261116070212.314228-1-tadilhusrev@gmail.com> <20261120114100.978148-1-tadilhusrev@gmail.com> <20261120114100.978148-2-tadilhusrev@gmail.com> <20261121-brave-adamant-caribou-b01daa@quoll>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Sat, Nov 21, 2026 at 12:09:21PM +0100, Krzysztof Kozlowski wrote:
> Still incorrectly threaded.
>
> I asked to use b4 for a reason. If you insist on not to, then at least
> follow standard process and standard guides of upstreaming work.

Understood, and sorry. I was sending each new version with
--in-reply-to pointing at v1, which is exactly what buried it. The next
version will be prepared and sent with b4, as a new thread.

> > +      - enum:
> > +          - novatek,nt36525-xcover5
>
> I don't get it, what is xcover5? This claims it is Novatek device. Why
> isn't this actual panel manufacturer?

You're right, Novatek only makes the controller. Samsung's vendor
kernel names the panel vendor as CSOT ("CSO" in its panel table), but
it doesn't give a part number, and I haven't found one in any public
source. I'll try to read it off the panel itself. If that fails, what
name would you accept for a CSOT panel whose part number isn't known?

> I don't understand why this cannot be part of other bindings... looks
> exactly like nt36536 or nt36672a

Agreed, it's the same shape as novatek,nt36536.yaml (three supplies,
reset, backlight), which already carries a CSOT panel. Would you prefer
the NT36525 panel added to that file, as a second compatible item with
a novatek,nt36525 fallback, or a separate file modelled on it?

Michael McAllister (Cc'd) has a DJN NT36525B panel on the Moto G10 that
would use the same driver, so I'd like to get the structure right
before his panel is added too.

> > +  - port
>
> Drop port

Will do.

Thanks,
Adil
