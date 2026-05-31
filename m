Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 300193438A2
	for <devicetree@vger.kernel.org>; Sun, 31 May 2026 16:44:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780245898; cv=pass; b=oEOso1NpZjDnMNEVcdWryXKQ3aeK4eAxj1q3Oys/JV6mtQxC25fjmFtQYG+B63A4+Zzl3W9yc3JbeZhZr/QbsMyyAyrHNxGy5p5DOCxfjfUSUmk7Dguk7XA3XBejCMh8HwvgI7F+AP7wJkws1Uf9vOaL6hJPnVCXlIfwtqEh//w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780245898; c=relaxed/simple;
	bh=H2mgKNQkYp6H7DYMqrTNMf/m1vMJdc3rUBfTgqvc6ts=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=olI7TFRFXoNNAQuF9mmm8ZE7J8zkkG4aFbi2W8DrQZ/GI8Drrkrc7+6Kvq3zmmz9qHuevZ9vNIrodhWL8vEtidF9KW/lSplJDmfSXex7i3iba8yKlzRMFI/H6iqZ8eWQ4RMRIxAO/6z8dphUB3eegh4EIXomhKxo53jbYN4rpPM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NulEGFFQ; arc=pass smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NulEGFFQ"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-45eea3448f2so1834702f8f.2
        for <devicetree@vger.kernel.org>; Sun, 31 May 2026 09:44:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780245896; cv=none;
        d=google.com; s=arc-20240605;
        b=AHSAhwC8H+ukn2JKK3XzrYB4Stp+8Z6eSChJsh+D5UwPcbz4v+Lvhri8e/9ajB7Pbj
         xcBH6Y6zJk2o0szipkg8rmxIF4ksCGNryaCKiFHgJKXRk8IR7+QisoseEZzVmgWRX+Og
         /nPg9HC55S1asdm4Unwo/Hm4wMUYmo66JFnl9h8oQgGvUhf5A3emqRF+MzK01CNjL3cU
         ST1wDoLlizxOsNUlnflQXkxp0OM2HqZMpc+679KIwLit8Y6v+vr+OAYXjfPpYutFkNmf
         793vfA8aMtxWI5rHa0BxCZbJQdY11JIwvtoIfPrW7pHjqNqpBLefGE4IMwybVw0NqieZ
         PS7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=fiYVeZKekUGFPbINGFuEkdQrx/jvxw/Pnx8Ccn+WmcI=;
        fh=/C6HqFm30ymWTNe8ZMvK3cSUsfRws8zy86hR4t5rdSE=;
        b=QJr1B2noP3mg6su9s+cJRMTqUnWaWoUCmnB8Vpu5qzUgw8RKVIWaqNYtkYslQCkXr7
         0b9aqA8oFjBxu37qURxqK5gzBeoPkByaRzaYeVPItUfRVtL0CemubizVWkZ5VTrIyIhp
         7unGYI2eLBzAgFwCcMfgnrVnmVelv6HtYcO4pgKkhw4nwEqOcEnsMZWGxV0E/0dpFwzh
         6R1GMC2agHguPXljDCHql6w17pzQ1HNovLQBruKtC1MdvQO2CpJYC9M2C+f5ONoFtQby
         WOzx/Cpt8hK7+vgCsHZFxYr0LHoyZ14eZmZeVG9LB2eLvJltCVUG1fkDo52aPld0H42j
         yDDg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780245896; x=1780850696; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=fiYVeZKekUGFPbINGFuEkdQrx/jvxw/Pnx8Ccn+WmcI=;
        b=NulEGFFQo4cWDsMAY3xD3lmPzAWjky8zZMpJhb5k6ptQFMjaZEobOlsXr/q6zze2J5
         V7SUDAeMVOfgq+niuWHFEVyJk7xyoxdeKP9zT2naGnfB48BqXmMnzkipAbQL1x7zdD8n
         E3tGpRVaDW2gpZ3ReLXcAzE2g4CNol19F4M/TP6QrIi3xOyngasGpgGR55GU69nxRMSa
         X0x2sBiIJUGgOrvTPMyKfXhjmFnNkpMRYFKDjEodqs6IuiVvsJQgOaw5eG3nBqD8YXBk
         i0e5QciFE/4ARKfW5eQlBzxCsx9JzODjOhafVE3C5y716SBhV76Df2EJCdAFXeQEuMBS
         VZ/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780245896; x=1780850696;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fiYVeZKekUGFPbINGFuEkdQrx/jvxw/Pnx8Ccn+WmcI=;
        b=o8Uy9d0t7ZlhuSrYMU/4wPe/EKeouAeuhYDzFppOe1RLFIj3IxHvZr4sGeSm2bqard
         Og4KELBYvI3aAD3UYx17atvW8eEZHkutr1hI7hT+Lu2r73FH3SJGZ+QE3u0W6MrKNbek
         dGX3QWzxOCQ8vlsNBm2qsRGT4R28p3jaYhH2oKLpLRA58ZTx8ocRdhYHYxBYJDSrHx9D
         kZyICXbeYabhCJ/vMYIj9jMKsaBFdHoZmRaBxvoFcQsodQ9voz7oiOpSCCSFesDnFsrZ
         VcBpUFUahWXxrueeJf/VYXfDgpKPdDEqpTQtYSeSX9C+SP+1GuADuHHzv71O/l5HieDw
         v/LQ==
X-Forwarded-Encrypted: i=1; AFNElJ/06bZu9GGGCwL7kxL+g47swbJ0v4QO+Cl9DJjtDnBTU0E8ZWKl0npJ0GRO+Copd+gxbW0zpCjhgFRt@vger.kernel.org
X-Gm-Message-State: AOJu0YwvyaOqZGBWj7yuz4DlJnaoRpxaXxmBlyYAVZKrLqHXP3I5UAvY
	b2/cXraHbKpwSM955TIsTyxY2Gnv5SYRVgBvvurBrT/3LQcWWisw2LW6y6R/IAm1BdfoelBqEYw
	3z4Eu3gT9n5G4rPuaU55WuXN7lKHD4iw=
X-Gm-Gg: Acq92OELm3WJqStQ7GCwvyYjCPcOyDCXk/2yfQFqVfcS3PToU/MkbbkM0uH64yYGVih
	DJBI5HWAVBdc4mDgjYxiFuhu9oAd4kAvNlu9gnaRJei4Z1gh5urFqe9S27s6B0NkvPKBFrz0IK+
	s6X/ztCpb/P3njkWol1Fv0KEVS5904hcC8GP0AVR5joBFQnILZ/MzoApChfuD8mtqElvTuUysFt
	tPjy2pZykWkQz6nfNcQ1Lc7rjhsNaNrd+V/MyPbunNpW734OmRksi7bxQOtle49h8sAGZyB+Srw
	wsgvmh8OYMT08mqzo0yo38MDp0Uq7vdwwsAkm8WJGX4THNX0Kn95ZD+4txfmKPkVH35UcnVmwYH
	lCixVkdgn/I8xD7POFoUFScwxiOOULWyd/L7ybi4Bbw5V4I9ekIrJzD8ox6q7wUi4o/KPTiljmG
	ExrsG34+y7uX6rNZYKhRiYq9X/w0Yw+dx6spDSV3qA0tvp8+j1XQ==
X-Received: by 2002:a5d:4a81:0:b0:44a:be4:d0e4 with SMTP id
 ffacd0b85a97d-45ef6b536d3mr11131308f8f.25.1780245895408; Sun, 31 May 2026
 09:44:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260530-veml3328-v3-0-dd562eaee8d9@gmail.com>
 <20260530-veml3328-v3-2-dd562eaee8d9@gmail.com> <20260531101940.037d1d7a@jic23-huawei>
In-Reply-To: <20260531101940.037d1d7a@jic23-huawei>
From: Joshua Crofts <joshua.crofts1@gmail.com>
Date: Sun, 31 May 2026 18:44:43 +0200
X-Gm-Features: AVHnY4It0Vl6KYs_5qHaqiLySvxocVoP8lEfpKfo13Ax6I3NesJva7qOhi0JhCQ
Message-ID: <CALoEA-yEA5KcvXqZCCg76qFAgyNq8BQ5+gop442mju-9PiKaxg@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] iio: light: veml3328: add support for new device
To: Jonathan Cameron <jic23@kernel.org>
Cc: Javier Carrasco <javier.carrasco.cruz@gmail.com>, David Lechner <dlechner@baylibre.com>, 
	=?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Rishi Gupta <gupt21@gmail.com>, 
	linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sun, 31 May 2026 at 11:19, Jonathan Cameron <jic23@kernel.org> wrote:
> > +     pm_runtime_set_active(dev);
> > +     pm_runtime_set_autosuspend_delay(dev, 2000);
> > +     pm_runtime_use_autosuspend(dev);
>
> As per other thread check this results in power down.
> If it doesn't, try moving autosupend calls after devm_pm_runtime_enable()
> and see if that is enough.  Otherwise, you can either manipulate the counters
> or I think just call pm_runtime_idle() to force it off immediately.

Just to confirm, I've tested this on the actual hardware and it did autosuspend
after probe, so I'm going to say that Sashiko is a bit off for once.

-- 
Kind regards

CJD
