Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC6353AC0FF
	for <devicetree@vger.kernel.org>; Tue,  7 Jul 2026 19:43:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783453397; cv=pass; b=oyxMWqASM4TdaAxB+sYu5IEzPGxHNMQqXJGcsDagMP7lG85KUqCwBMw1qgXfRy4AO92dVWLt0j64+vt/wkXxL/CQzsNeBQp9P9M/huatbDmNawWira4DPZTHp56lvleCESiV14K0RqSaX8qWkIngH7zqdvbxr2OjDk9/cYAsPYI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783453397; c=relaxed/simple;
	bh=QfT1yL0KZE9kc3QIXQAHQN2bdjQ2tBY3krHPlSith7k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OyEA+DgCcghCr9P79PTN+D93gRFQps5iIiePrkKcA6B4H5wpycq7vC/lHKxONt+jp7bVSU1s4u89iDTs+AJOD+HB6gmr69iLHDmziTL8B8iLjN3n7g5XFP/nC4Efdui+Na30W0w1od5f+VpCYTgX3s+9NSUS962o+cSCPMFdNKk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com; spf=pass smtp.mailfrom=googlemail.com; dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b=oJ0B5Zbr; arc=pass smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="oJ0B5Zbr"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-3804e42ad5fso5786405a91.2
        for <devicetree@vger.kernel.org>; Tue, 07 Jul 2026 12:43:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783453395; cv=none;
        d=google.com; s=arc-20260327;
        b=AZ/EdFrLkZSgeVvTiZqAiO6mG8nZzMDqhn83ezXXDeZEchKwL6Wb8vKY/PINsRhpKF
         haaN4IJMwCOFhauJlZOhApvWbf38nM5zI9zA6gL5cfsVi+LFnI1OOMvCeh4nQugVFl/j
         jaBvqwyTdVc9ejqfAHuSXO/3ds4IXa0X/Cju/WqvdOIHG8fnnIQUZAl90kHMkT3KgjA6
         oFBKU9YVPizoGdKkdqfefSYqkeTNCqJmRrmYuHjH7fylw04qzrBZ4QCb7X4Q8TwPJi3M
         gWEC9cVwI3AJq7I/+eLEv1r1d+SbYPqjZY60OKXPoUDqJa5WYB+cWnd0zo0X5XN9ecOp
         Lxpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=QfT1yL0KZE9kc3QIXQAHQN2bdjQ2tBY3krHPlSith7k=;
        fh=Z9FTw7xzkqtEP637J3QF+znq6g6/Xe2hGU7gm3z745w=;
        b=ksDjdRcXfCoT3kmHTZp6tH4cBhL7RVhzNRmRzj0VodctulSSz8mSjaphAql2dTgCr2
         BPOSc40KdJ+eMWnc0ptP4boCPP5RbkPB4Trs9Dl5l2UIRBGcuiNEOP/nhz9iQEXTmDZq
         AQu2SNQOruOEk6+ZFVxucako7dO5XtjBKraEj0Xmf8xOwJ658CpdfHZzJ/NSYn6otJWH
         CYkqZnQmj3wF8XWS8y7bIRo5XEVzMeLnHsvqSxjey3xpsY84MxvDGGD2IkEXdnEHT+qx
         cSHkpa5hOVbUUzC3SqupQMTue+SsnqhFSamqy6+Ri47kzK1hvwPj93Wj9gUucCsMAy8S
         fG2Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20251104; t=1783453395; x=1784058195; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QfT1yL0KZE9kc3QIXQAHQN2bdjQ2tBY3krHPlSith7k=;
        b=oJ0B5Zbre6HTT3jrkz0hMxuvszMlU63D2dvVJ2nCJQdJ3SVYK6M/ulhU2/cVj+q7Lq
         ytwtfaPsV/tvSD3kW9iH/kNmENeLEr9e7wBa1/D02dArtChwOQbbcnX9DpZlipM3JSg+
         ihsI9nUyb9X5AXsVSX9zCQQwLMBvT5hnUp19dtng5omY4FeF3/+xYRW2Qat8/XTIeYkb
         ab7F7pyqLSMTyPbfE+8Qicxys/NRw/OpM42t1zwrLZWxu9hJ/+6bgDoEXQcZDd9f6EiE
         SetiSVfHtAsl0wPRXdzYtX0kYE+P3FbCpseZ4p153m+bHYvESuVkwWSciyBh78/OSwOO
         9j3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783453395; x=1784058195;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QfT1yL0KZE9kc3QIXQAHQN2bdjQ2tBY3krHPlSith7k=;
        b=byciJGbD1tDhmefO0JOtf3CEuYU0WUWo50yIynHNO9TYG0lHDjmDb6Q3kCOuiSvdPQ
         qAqL6s2Cennwn45lznfkhLqopOFD3jsLhwVzdH7Rn4K9C1N8QRqwjB3dO2xRuVzphisJ
         nn3Cw/t1SyR5LndjiIfPXfHd8jvhlRm0iBLIzpHvZxH90mmuBI3ofxpG4zSAIICdmGSe
         58/4c/ufXZ6ttKy1UyYwjWwEQd1b7IKmZ1roySUuavQJvyZmeDhoRvV8p3atrdnCudAC
         2gicLkAiFCh3u8GI8+VJ/zwHVlq32iLAF/svklMtLM/6SfpxzJnEW2sx4oofIvw22R/k
         Hi3g==
X-Forwarded-Encrypted: i=1; AHgh+Rody/W23oTjeeoPFHTPyAQrw7kMZPW+2Oz8dFQtMLYbA9fLkfaw9bVab/+Dp9a617W3/AvFoR9XNJQL@vger.kernel.org
X-Gm-Message-State: AOJu0YzNchfXlclVf3MTxRyjtH14ONsYMawIj3u4/iuMy8++lvsMb85y
	T35dyWDZWLuy2ePUSUXhKo+nguv6/lR5g9mf4kzn/bCBVFPf2XaWm5DHYcUwm+9rRj3b3JoQy9Y
	8TUOkYRZVi03aa34Aos7LsEp4ozZrDa8=
X-Gm-Gg: AfdE7cm/jCubAtraPjr1/p92cP8hO7T3uzPhOFNR/KRcMkYdoexONHrH068kRj7166z
	jnMgFQNSdrNncYWw7xn9czLbxrge/3+9Ljg2JmMzFzUGc8kUk+odJHJQpvjTYkjZeV0RuWkOJs8
	Xo50Qe37cMTrpuq8WTeBpNZRbUtwPOlxjnIE1CKE5MFw17Fp4iALlZFaIWDJOMtv/z90piKGjc/
	WDIrJelp6+/QHNCSRm8f5t7SEiCxGiv0pGCRsTz34uGTO10Q1hV2FCUUXIjVafWmz0aJXagY75N
	c2Q0rDDfv/A+/HSY6HQySP7PhQ==
X-Received: by 2002:a17:90b:538e:b0:381:792d:f993 with SMTP id
 98e67ed59e1d1-387581641f9mr6285677a91.17.1783453395185; Tue, 07 Jul 2026
 12:43:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260702-add-mcu-fan-khadas-vim4-v8-0-244feee91a36@aliel.fr> <20260702-add-mcu-fan-khadas-vim4-v8-7-244feee91a36@aliel.fr>
In-Reply-To: <20260702-add-mcu-fan-khadas-vim4-v8-7-244feee91a36@aliel.fr>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Tue, 7 Jul 2026 21:43:03 +0200
X-Gm-Features: AVVi8Cedwny1fGm0XunQLag-buYK9YXt9UTwEp4HfqUu3ncRpwQYM0HDkqsD-q4
Message-ID: <CAFBinCAejsnBhUy6TZwjgNzuVp8Pa-vTB88NBgzNVcDSAyyenw@mail.gmail.com>
Subject: Re: [PATCH v8 7/8] arm64: dts: amlogic: t7: Add i2c controller node
To: linux-kernel-dev@aliel.fr
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Lee Jones <lee@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Andi Shyti <andi.shyti@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, Beniamino Galvani <b.galvani@gmail.com>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Daniel Lezcano <daniel.lezcano@kernel.org>, 
	Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 2, 2026 at 11:57=E2=80=AFAM Ronald Claveau via B4 Relay
<devnull+linux-kernel-dev.aliel.fr@kernel.org> wrote:
>
> From: Ronald Claveau <linux-kernel-dev@aliel.fr>
>
> Add the T7 i2c controller node used by the Khadas VIM4
> for MCU communication.
>
> Use amlogic,meson-axg-i2c as fallback compatible.
>
> Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
> Signed-off-by: Ronald Claveau <linux-kernel-dev@aliel.fr>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
