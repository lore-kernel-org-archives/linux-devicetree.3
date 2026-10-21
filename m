Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792595305;
	b=RhAa4o0f3O4KNptUq0/ynWyXAdDRw4/Dl9RYJfgMdXWd3APdQuic3MnhmWskMlvyWaNj
	 nn/V6eZNrmMszVdjWAmtFEPU98u+ofGI3vA4ZFp+U/aS4V+ryAvF2NbdfYgMoNmsQw9rH
	 uOYBcp9VaN9UGyZ/sBF1RwzIaA5t3PoUbwVWfSnsleuPQAkbseMGo9X49jL/YPFDX2vAS
	 EDslECA0sR8jHHuewMlOeZQCWdCwwcbygy0zRsZlSPAzhFuCWQO+OcZmMlg8b51isv+k2
	 M0qjosH6L/2iaijcKA0wmYobPzwgTHlsEOEB4YmZsAGlQSp0iTDNvbiDWnA8ZmMfVNg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792595305;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=8OE6HZ58afzSrCKfxYeVUqdKEpFKAmKlQXDzm52PrLw=;
	b=kDlm6KU9CjYVbYKNTlP0fOpeJSZcDYfc2qQweSs+N8os8hZXi6h0yny07Zl9jr6SiTAo
	 ee57Flke5ES54GvfjiHl/Q1i+227FC3OqepdS+6s+6F5k2EzSOcJLV/4h3AUIxMFwiB7g
	 toCZOVpZ79FQmDhlSn7r7+AeaMIXoKghtsRGJUzwG/VFwzJu6NpAeQH9oRyDD3emiNKFz
	 DZB2dWjkmgGcivD4y2v3tCT42ENQfYpYdPGDUwF2DaD+qhEcDM8PjA/e9xMLoDXP/ji9n
	 894d2wVyY05kXaB3HUvZ6oeFzdTmHnJn90Rx6IczbFAm13wGlmAy+/Ax+YsCbipbsZQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=piUDd26S;
	arc=none smtp.remote-ip=209.85.221.45
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B48C860A4ACD
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 15:08:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B48C860A4ACD
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=piUDd26S
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-48afcd7ba9bso610254f8f.3
        for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 08:08:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1792595303; x=1793200103; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=8OE6HZ58afzSrCKfxYeVUqdKEpFKAmKlQXDzm52PrLw=;
        b=piUDd26SiHJsttMQlpJF2RFcZTqVsNgoVjeOxs6QUlmSk2QvOxsnQe8Ezy6yQxygv9
         bp3/hR8JIyALcdkS6SSpS2AHB4HdBi7PdgvYLqbsQRIf17orPMnj4ifgCQk5cHr+sPPm
         tXiTnTTlcltLlPAu+s4rrXOfdiXteziwQdPn8dZSiCLWnzoztKR/MGbNflI0MIE8+Tyd
         Htj0ZF4Jh9LkCr0Cx8FB5KGXm3CipfZl3kU2Ovndgb+u3Vd06mfWkbeZpNEJ/O/06DFM
         e1m8vcZdExPaf4EvuTH9Uuw7fw7NVZXJUGQdVpYUNMMz1bcEHVskDrelamoQClz0Gbjb
         /eFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792595303; x=1793200103;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8OE6HZ58afzSrCKfxYeVUqdKEpFKAmKlQXDzm52PrLw=;
        b=UowWtoicIp92QTtIR3X/uqPMHAvmTbH6uoP+XaoXW4Ma4+egNHH3QwOaTF9Wyekkvy
         IbZY2apkpRXncIZGUVyTE0Nl1Fn78gBZsYRyjTAYdV4F5ZVxNrONIDYS+u58MTJcETb4
         QQ7yNBh32ddw+U1BDE3qLYmUvakJ6wP+vYPlUNXyq58jf8U+VDw8VosP38n9xrMpunSb
         Rup55xXgDzeBSJBJXEFVayUU/A7p7kXHtyYchyKp8ZVDbRyTlXqQu6KqfIVvs+f/rGpX
         4gEeQZADrpNXwXSi2DNEy/dGM73cUf/MgqF5Lle69TDgqF+wfJJdgNLcWiLqFRKOqU2B
         RLvA==
X-Forwarded-Encrypted: i=1; AKwUvBywE5MYgHyKQyKuGeozCvNsmO6dDXNMKuK/vFZBysqLocNCOivSUOcZAcWyH0AxS01ys9erMwykLurV@vger.kernel.org
X-Gm-Message-State: AFq9FYI60tTJ+PCGl63yZiSfSsxQfhapyZ5KrYaIPFl5phuGD64LZWPL
	mvQ0dwQ+6OyU0tgJhVu1ILHr4PfdppXeQJK/vLUgWRldeRmWG+1DIL178YUqqp/D0BI=
X-Gm-Gg: AYBFou0oIAqzF4keGmRJkYJtaARv5jE0IKwMaaHuWNAIWyr8ogMGGvMNlDAB+1OJ4KH
	jujUeeXzq+7Orh8ZzVDUF7u4bECnAeoS7soi07g1jZdgAJTUsqzqFCIVYyRqjPSVNYBtBaN5Q7D
	Le2UfaLHfwJDUyD+3zVb+S/EXR/wbcfJyu9JWWEucYwj4ms2QlXOsWi06/bHFrzREZ1i9Os6xWe
	1Ne0Cy2YCn4pcpJNkjsD0XUhH0n1eajKLFKhTyhW7TVupmM7fwPLLnEJ0t6Wb+sqF7qvkRiu83b
	b32S7qljWS2i6S1jsSxsTkcdSPr0OnKehLfTC35bfOkEUjO1kkGoaQbCtvDy8yGfDz++CSmseyR
	Q4tttm+mXKeD2nJLTZhjCnsKBl496ocqh1zVpuHJSZ37THxHTJ5Yz53ObcOgXQCqRnB1FKYrL9w
	IOenjvIGFEzjzWtPojmxJkwjkPyzp0+tCgY2tsS4xdrE7Zrq+nXV2X1A7KiMzzTvvDeZF9aFfND
	kV/S7233BtiS1Tx/BUU2K7V34iydOS7pTuRtUtn9TKQxHGoqTITAtcLOR/YVHekTKJtaxtuGJo=
X-Received: by 2002:a05:6000:2301:b0:48d:e61d:68da with SMTP id ffacd0b85a97d-48e264ab2a1mr4944600f8f.20.1792595299491;
        Wed, 21 Oct 2026 08:08:19 -0700 (PDT)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e25835404sm6652761f8f.42.2026.10.21.08.08.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 08:08:18 -0700 (PDT)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v7 4/5] clk: meson: axg_audio: add S4 support
From: Jerome Brunet <jbrunet@baylibre.com>
To: Jiebing Chen <jiebing.chen@amlogic.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, linux-sound@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-clk@vger.kernel.org, jian.xu@amlogic.com, shuai.li@amlogic.com, 
 zhe.wang@amlogic.com
In-Reply-To: <20261021-audio_drvier-v7-4-2b9aeae9cb8a@amlogic.com>
References: <20261021-audio_drvier-v7-0-2b9aeae9cb8a@amlogic.com>
 <20261021-audio_drvier-v7-4-2b9aeae9cb8a@amlogic.com>
Date: Wed, 21 Oct 2026 17:08:09 +0200
Message-Id: <179259528986.4070168.1199000664504589178.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=437; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=YqvMrgag+SS1YYwbYaYO3LQNDj+WNIZgZH/cwchSYXY=;
 b=owGbwMvMwCW2VtK+WnvWU3HG02pJDFk3rsar1wWxnVjfVDGxa747u6jg0rYvk7MLdt3qiLDcW
 xS2IKGyo5SFQYyLQVZMkaWGu1r8naTWl1nTdW7DzGFlAhnCwMUpABOJUGX4H71gnX/nHxExLkv7
 tJyUPv9053drfe9zHuE8eLKWy4RpN8P/osR9DJwFEsw8Ljx5/LkOB3vFmap3fj1ptnpub2r9YQM
 GAA==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

On Wed, 21 Oct 2026 15:08:31 +0800, Jiebing Chen <jiebing.chen@amlogic.com> wrote:
> Add S4 support the axg audio clock controllers, Compared with the
> previous version, the selection of the audio's clock and data pad
> will be designed in the form of pinmux control. The purpose of doing
> this is to distinguish between clock control and pin control selection.

Reviewed-by: Jerome Brunet <jbrunet@baylibre.com>

-- 
Jerome

