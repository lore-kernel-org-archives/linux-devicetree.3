Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8CE93C2795
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 18:58:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791831514; cv=none; b=ZrpYWQj4LeHn6w1HmnRyNg2cebRNfX6LeU99m9ggP1/Ppkqs211t5U26OVwn1ArLtd6j4yRsi3qG94MlyjRpsvLaD3gdWIdn09LQzcfi3bM+8oWuSl31Ugdu2qgobPPCmzdYqqUL9olaf+Z2EVxNQfGy6NjOInp1A6yIKb7iu3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791831514; c=relaxed/simple;
	bh=NBSMnbPM1W36hu/yHVHtW29ZlumpRPrEdi13YOl8g8g=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:
	 References:In-Reply-To; b=IK18osM6zpnHwsW4Uoyfgv4POyKifQ8pGkfQ65918NMd4keFNKaIU+bWgiPL0x79Jv+DJf3TbHcmiI6rDOeI6ZGxg2O8faZJeA/Z3VP7asCmijLpoxy7+V8tOpORT4j/Nm4jVOBmEV/BrlGJ26fASmgmw8OVFhSqcoe6LOiUZwQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TgTJFtvg; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TgTJFtvg"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-c2e62319cfaso218255466b.2
        for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 11:58:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791831511; x=1792436311; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CEpxS2BqSJXJl5+I6AvkY7ywhTC6yC4LVyF9hL1MSqo=;
        b=TgTJFtvgl3933XLabcoNzo57A2oyy0ZPYzrFZY85SskmoE8/AuClWWQr7xKRW5Hq1w
         XORCAmTl/Ftc3yr1uwv7YMLzbDcHm17aKMbSqOjs85rOby+252ZVkFEx8nBP06QXPJPA
         Kc4guISjtpB4PCEQQjZ0amZ/WjG7VeeM/SpkKTxc718mqEEJSfxo1ZZPYN8n+JyAtE9R
         ntTXrCf1DfIhjdSMFMoYCbEC8Egub3NDIifUUYE6eS0wferEGotXUotwNpya2HRA5k8G
         l9niSDbxX5dM4n1O8PmWvVBzbm0lgKFLNraeb2lLQSoc3Hb5vGQbAgMy1Jadw/yqM676
         O6/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791831511; x=1792436311;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=CEpxS2BqSJXJl5+I6AvkY7ywhTC6yC4LVyF9hL1MSqo=;
        b=jowxa6OsmwCSfKUMYtYXp4QLpDpF5zOmjGwwzFjRI3B29zyulV7H8iGtTYpxTreb14
         0UPOLxLhTUvg11fzlGZhEHwEQe/MVZL4llFEsUITk6nb+ctPJUQ5U/9bIuqfrdeYMyFx
         HaLfb4srf7oaTjo7szcbfUVe1l8SQtj7WlxiPhzFpnfw5UoOhlP0I2u2HczEXK3WB59p
         Jim2kS6sT8A6rI4RlPAiZnMdYTFcWegp6+o2RT8LR+F4wXv3kdQL4WM7/rQh1NloReBI
         5v6ADc8FJrOlY0kqF4cgSXyb3Vqga8/SP/pdSFRXaoCwGsI0W/KLYDVq/N7djxjDpy2C
         C+3Q==
X-Forwarded-Encrypted: i=1; AKwUvByXFZufS9qVNMCRDNaYAx8nQL0YNmfCdIJzLa7d8YmL1CM1vO8DighkSHmQ76YNR0NK5ma8L3a8icS6@vger.kernel.org
X-Gm-Message-State: AFq9FYIUZAez9sOVgpztTjEcYzA+OqXBjv6pzja9ud3zNhEcCJOYNiOW
	xaMgKlJu3W/uBp01zzAEWKkve6fGnHoGRUlyu72dV3fOHYHj2GG9Nocj
X-Gm-Gg: AYBFou16V/aQJJ1jWbaXE2PmxYpQ9QzC8IuhXO1ubH+fU8Uh13rzlLG0kf8nSdpa1QM
	xQWaKfyO97Qjo2nS8ORsULiho6rOpxfVerc+NsKeaoyZhUaj15V1kDhMuY+7vgfa2PdcqrE1yhl
	AcUUo54L9Lkus5BNPKt4fz5avbbhGf1WoOWr+WLJD1fPE+C+2QrMMq7hZSEAnilE6Z42zDJ2T0S
	tsIOIIQ+xeswseFA6fjQaXa8GRKFKutC/HxBBqF5dIZ4FA62G4i6EkJ1K9Su9N7dqd0S7de7HfE
	MEkhTHU0yzVx9CWj+///DkZg+Ygz0ZjfAf2HdzG56mBMQQVDcp6kGXBDLxtDnRlCdOOUP+YiZl4
	gBUvvmFxk1Wh1jY679htzgIRiUQ7mt5vA/CNUryDok8xuywnlJcC7erFDrtdp3rVi53dZlBEXa8
	+zvYKd55Kspye2+Plz473be3qYfowM4bJ1j89M/ML0/jAZAhJLlI6ZD9MkQ8cW+Hs5
X-Received: by 2002:a17:906:4786:b0:c2e:513a:e964 with SMTP id a640c23a62f3a-c31aa0e1b8emr1079340166b.49.1791831510652;
        Mon, 12 Oct 2026 11:58:30 -0700 (PDT)
Received: from localhost ([46.205.201.71])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c31a9ae4a94sm499682466b.82.2026.10.12.11.58.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Oct 2026 11:58:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 12 Oct 2026 20:58:28 +0200
Message-Id: <DM339BDR8JE2.1FJ5827JZIBWD@gmail.com>
Subject: Re: [PATCH v4 4/5] Input: hynitron-cst816x: time out gesture key
 release
From: "Oleh Kuzhylnyi" <kuzhylol@gmail.com>
To: "Daniel Golle" <daniel@makrotopia.org>, "Dmitry Torokhov"
 <dmitry.torokhov@gmail.com>, "Rob Herring" <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>,
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
 <linux-input@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
X-Mailer: aerc 0.17.0
References: <cover.1791233147.git.daniel@makrotopia.org>
 <d73d26d8c9d75fa230e3dd64058acb65f45da64d.1791233147.git.daniel@makrotopia.org>
In-Reply-To: <d73d26d8c9d75fa230e3dd64058acb65f45da64d.1791233147.git.daniel@makrotopia.org>

On Mon Oct 5, 2026 at 11:12 PM CEST, Daniel Golle wrote:
> The controller reports a gesture code once and can then stay quiet
> until the next touch, which leaves the gesture key pressed for as long
> as the panel is left alone. Release the gesture keys 40 ms after the
> last report that carried a gesture code, so that the release comes
> from whichever happens first, the timeout or a report without a
> gesture code. The 40 ms matches TSC200X_PENUP_TIME_MS, chosen there
> for the same want of a lift event from the controller, and has to stay
> above the interval between consecutive reports of a held gesture.
>
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>
> ---
> v4: follow the keycode lookup and the single read of patch 3
> v3: use timer_shutdown_sync() in the devres teardown action
>     (Sashiko AI review)
> v2: skip the release when the interrupt handler re-armed the timer
>     while the timer callback waited for the lock (Sashiko AI review)
>
>  drivers/input/touchscreen/hynitron-cst816x.c | 52 ++++++++++++++++++--
>  1 file changed, 49 insertions(+), 3 deletions(-)
>

Tested on Raspberry Pi 4B with CST816S panel.
Reported coordinates and gestures are valid.

Thank you!

Tested-by: Oleh Kuzhylnyi <kuzhylol@gmail.com>

Best regards,
Oleh Kuzhylnyi
