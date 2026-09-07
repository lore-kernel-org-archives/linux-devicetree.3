Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF4A5472536
	for <devicetree@vger.kernel.org>; Mon,  7 Sep 2026 15:26:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788794819; cv=none; b=KikOlQbasyfPFF0A8H8hN9PkWy1yQ2Z2QZkZEot5mgCWJj1gNcgOrr9ky9tV1z8YSAShxkuB0c1LM5LUrDHkOqXns9xn61AfSXEXXaZ/ZRR9JGXmA8JMyliYBabY9zD/oAr101IAy3/AMwr/TkcvlyKAzrOwY5tej7YHeZEfEHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788794819; c=relaxed/simple;
	bh=sfJG45jw5W76tQOcRH7iTvkAsGP4FG7d8I2A4Io0f90=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=DKR40T2QthL87/58lBwRnTAQaZhV17tuB+QMljNauJ8BxsPKaVrPwExUPfqb9wK9FEWKdYze0UbBcTlN8stIhqMB+zSNrhGMcBdvQpeOCq+SWBM91o8N6xjYQ5TGVcqLr2PBx2lG0K9hh57UECr4wda9OBsi1XS/2a+nO8ZX638=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=AGplbQ3H; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="AGplbQ3H"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-49b0d8bc2aaso46586415e9.0
        for <devicetree@vger.kernel.org>; Mon, 07 Sep 2026 08:26:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1788794816; x=1789399616; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=+9qbfEVLVVFm/uwZkCVkuCqYtCbBr9OTbyNaynVe7qY=;
        b=AGplbQ3HR7lfQzFZVvkLntLjNTCQ5JdPIeboHWW/XDJ0GlZQVmEgILFpeCqjyHy65k
         guq9Dbobe7BtFAcQt99eZIHgKAWec1RrekK4Gq5xKJx+tHGWxgVQvXL2ft+pm1b4M93x
         kuNdTQm0cC0bqsgNkKyi77b/LdeEwSh7I6fQzZkDeiYBCX+AHOR/05Bx5rXMkBo3oxe5
         Zvyy3Qbjc0YuuEQN5I8saU8ZxpF1BKsoyd2VAnjfMDkpSFdQ+kQWI7yO4fIEtlvhSai9
         Z5pHlCGDgGsnvPD7FV3Te/4KGSBqRXHl2jMCzJB+I3O/g/UgXumppc755af2AymFPOrN
         yOGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788794816; x=1789399616;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+9qbfEVLVVFm/uwZkCVkuCqYtCbBr9OTbyNaynVe7qY=;
        b=EtNBxzsm/j3B5st9Ozz8aCrDAVNkV03Wl3o1YzJ5a7Q0TOulst6otClAqYKdV67W8t
         OiboS+HpdwIpskq+S/LelDpXC69q82D3r4i0i+6JbNw/v/Jn0XPwwx/cvkVxIegul1oI
         qFRGjKgDcBKAX+b46CkzfMCWjL372UXTXmdTMWgPDxnBW4ohzQlzSnE0MfbjrQjL4CT9
         3sMoZ9zB6hYVfq2DdEI2+GBWEntPT8fQldc33oRuTPlJJZ1HhYzQMLx4TCh0iINdT44Y
         ATm5Qm0M7pAgmMhlyqo7W/+O+Tpr9QyCiZEmnyOZ7j+6X9KrbdZOhesrCHStlbduS5jZ
         pFSA==
X-Forwarded-Encrypted: i=1; AKwUvByAppn4RWtD8W7rtUgVAxVYUZ9B3zx8Cmb4xDW6/U7nSXZESFPmEqpRByptuOQhUO9YCl8vmAytOWFG@vger.kernel.org
X-Gm-Message-State: AFuF++nhfkV0kthF7bU60TwBb63MRNmRbSWifcSur5xmkpgb+h+3Mbaa
	VeEkxy2nvNomqEgbeW+lx5BMhjOnQlyDoOYxZBwLBH1NyJm7LY38sgN7D7sAKHailWkvP+6O8ke
	TlU39IBg=
X-Gm-Gg: AYBFou1GtB1SHvrbz520FH4uCMjGO7UbMHgcc6UsMlSWVm12wzMVONGKBHFGxtclESk
	YqijbtaJLgPeUCBzhM6SBbUo4/+YrkSIaG/o3B4WPX3zVj5jjeH2mkhaIwyRG22tE/Fa+aIfRRG
	cX1YXDNBDapde0b9c5ga0krRYkcPpA+Bfg+K/c44IooOz6lvIwgYTISFwMePd84YR6C6jCB+qZ7
	vhLQFYtw7WruChja1mlwb3qTGUwSbORC4hoPaZqeVi+ok98uO1cVrMdi+1Lw6kZo8GHZBbjeWZ4
	K7ZNYsShDlqWzCMjMR7CsStM9dsLzSkwchn6X7RHaXByHk/Rb6Gvq7/fbx/svB8Tv1YPuoK8on6
	jeUWMCgvVVYZlnimbKWWNvbvw9EFO2ARWD4gmapM627mV1q4pmBo469NIxoyUNjQkFq32YCe8Ck
	cyyQZf1R6ySVZM2i4KWJyeQDVoEUYV5xcqbz2+LKGXaByGoYtN9tcmVz02t+zhvjAHF6OuTuK8c
	dbLXNjXqiksjZWXgI2rBUc=
X-Received: by 2002:a05:600c:35c3:b0:49c:fc6c:be10 with SMTP id 5b1f17b1804b1-49cfc6cc055mr202666425e9.22.1788794815803;
        Mon, 07 Sep 2026 08:26:55 -0700 (PDT)
Received: from [192.168.7.218] (82-230-44-19.subs.proxad.net. [82.230.44.19])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-49cee6024a8sm418419925e9.6.2026.09.07.08.26.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 08:26:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v4 4/4] pwm: meson: Add support for Amlogic S7
From: Alexandre Mergnat <amergnat@baylibre.com>
To: Xianwei Zhao <xianwei.zhao@amlogic.com>
Cc: =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiner Kallweit <hkallweit1@gmail.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 linux-pwm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org
In-Reply-To: <20260827-s6-s7-pwm-v4-4-d28a2015177d@amlogic.com>
References: <20260827-s6-s7-pwm-v4-0-d28a2015177d@amlogic.com>
 <20260827-s6-s7-pwm-v4-4-d28a2015177d@amlogic.com>
Date: Mon, 07 Sep 2026 17:26:52 +0200
Message-Id: <178879481206.2256446.5480566312277687897.b4-review@b4>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=431; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=sfJG45jw5W76tQOcRH7iTvkAsGP4FG7d8I2A4Io0f90=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBqntfBlpqBiszNMgSn7O9l3ii5fmAZzp08XPZnG
 +I6/0zcor+JAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCap7XwQAKCRArRkmdfjHU
 RSSGEACrwfFz6yD1l3vhy6F9taMF3kWSM1xVK9C38V8OvRfuo795o5cb/IMYwvp0C6+MKwhPvG1
 EcrITVzONq66Ie2ZqiLhCqu5O9TrtHq7ajhU1sXK2ScEoT9XTURLcMi3qNi7TYKZvpUI68W8gsT
 bDkbraol8AGgOaCX//qsj8b+KdhbkQJnw0xyAsDPFhL0WaJXcaecJQRd4qwAFgqHdZQFf8tP4a3
 3NirS/fUbuxQizhb7mvswX2eL7jAWNzgh0MHiZoMjuF6pEKmV/DxhkKnAIQn76bZnLDd8s8pSzL
 pCJYhXO8AV97EG1G5oPvR2Bbi0fotGzWRNbEKBoBwxh/zLDVERZ/IkVCBklhGKKMod/CWtXjcDK
 9aOLNbSCrFlYbwY4uMNUddBNkAXoxb7po4O+ObGXszxbKC9ELtigt/7m52hJmqt94O6w/l48DFz
 s6OEU/1rKjzR16dL4S75Bj8QScxgAZizzNsIfihQG+P6q/CTr0THQ+oR9ZOyc7CthJO6wJUDaf6
 I6SeJkINTRwYCA9uUXoRrzRva08+URnqMttKryLsiQAxehiCYuuJNPUfWdQvP9q4KWVb/lAuITZ
 zvENNu+aiL96ohbGYXbzmMeRWnwvrjI8VWtte+G7a1qKOfvdcRIwk9JWlPvf7nepYQLdmpIKmE+
 XP9d4aPYx4YCpNQ==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445

> Add support for Amlogic S7 PWM. Amlogic S7 different from the previous
> SoCs, a controller includes one pwm, at the same time,the controller has
> only one input clock source.
> 
> Also use the kernel coding style for the empty of_device_id terminator.
> 
> Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>

Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>

-- 
Alexandre Mergnat <amergnat@baylibre.com>
