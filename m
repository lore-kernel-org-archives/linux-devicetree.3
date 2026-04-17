Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9282336606C
	for <devicetree@vger.kernel.org>; Fri, 17 Apr 2026 07:11:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776409902; cv=pass; b=ralCN0r9OouXCxwSl+pRE+Fmpu1OkfUzssizSb5HmFL/XxpSx9Htt1WbH4irKuejCFM5HObEz5N8VJj/42Ud63KSQ5YihpFROQgCcm8P8LwRMK4MJ7+KQ4/zbyousH5lrzNwgPhfNwo4D4zvPMitUqOeiXr/vyAf+LjU8P/U6ZM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776409902; c=relaxed/simple;
	bh=jtz7GuhXRP8kE8tZI9mplR5rsQDAs8LrpkdCl8PvHSg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ah+f5/NfPRh67YXGrrO4ZaQKA5pMd+KNUPlRasb2qb9r1JiDoscdnaDKetrsfjHp9XoCcKFE3JkM7qWP6T99OkAhItxvP4mY8le1ilA2uxO9OIlRGY5nYoy1HO8NxaRGi113yfCM0RNQ1jWh7vavFuY2gZcbp9ndc58mB2SFvug=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lRl73Ztf; arc=pass smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lRl73Ztf"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2addb31945aso2294025ad.1
        for <devicetree@vger.kernel.org>; Fri, 17 Apr 2026 00:11:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776409901; cv=none;
        d=google.com; s=arc-20240605;
        b=hjHLfw9w9vQTJ0AtlMmq1TthyTuGaeIiKYeXQe6ZBQrZKcgotn/EhOeGrVzJQYO9tb
         Kzw8yafoLKXC5xZpv7IoXmvLrTlY1BwCHLLSbNCyetcWlvVXGKP+JxpuyW/cwBFwbFD0
         yVmQowgPygu4WziTK+4IALCxRcGSjfLxshl7imalgxMJQyVKF0MblHBqfl0JwI8/rz1U
         p6zHGG8/5zKLGkwpV99BtVpJnlnTsd4fLGurtr3nu0tettiD11WlYqXFQ3UbNR4BRoHh
         ZvJNzC+cmxufhioHlnJcviJDMwPnEu4YXp+3Ul3CrDnA0XrJ91BDGvAxC5G5q1s8sXlD
         NhMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=jtz7GuhXRP8kE8tZI9mplR5rsQDAs8LrpkdCl8PvHSg=;
        fh=j9fUiA5KtuRV8/S5wPn/AML47NmEZ3oP4zIYtYezBPE=;
        b=T+ZX+5wxUJyPsV1ANO/AqCbIXcq840kdXcuzNjWo7J+/NQMFqR+dmCDVQZFENDO5va
         P+ALWPqZNEFWzNbwtYVu9lY63OMLkS80qfoTXqE0GL6zrL08Zw/Uax3QBBPRSUpAlR5M
         EfgPFEtQmWFQ0BjJgflFXq7AA+/E6uFvFHg9X1OtG+S9hlWezG5NJIOt3Z9ea8i1lpbV
         LI88t4QKYEEdFpVUPxrz4O+nEkBJ5++fP1TpJMJVJ7mhey9dVwmvkzLLs17TQF7Y6Z9p
         /rWrW5qV8xb/h5BTaQ43nbHLaqtjV2H3sfr1iATKjpqYNVNEIWdgocFYjuKbEWF4lvH+
         gGzw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776409901; x=1777014701; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jtz7GuhXRP8kE8tZI9mplR5rsQDAs8LrpkdCl8PvHSg=;
        b=lRl73Ztf6vQ+dPDOijkfogT4WK+g9JIxcMkPxmJoY/YNnPqKSm263lgh0BspbfHV4y
         CEG0X5E+FTiKT0FK2r3oCYyJFS2EH8MQIA8cbJ1/+jMsnHLitDUfqrbQtjlYzQp8ZhaJ
         24Jaa2iqS/+FkS/bwyMFT/1+eQHcktkSq3J/yHZPLZy1ps5KQzAq/jD1bYHyWBDACC7l
         I8FJnTP2r8NcjJK3GHA2jsmgdZqNNRL+zSe3EfKjpfrJl9mxDNva+W2Ny1pCuQkmZnEG
         4dWut37vCCRklixj+rUfNe2sUN7UC2KZOgWXe3/D8AGPacVuwgVOaJeBN+tHFN0tmTY7
         D93A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776409901; x=1777014701;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jtz7GuhXRP8kE8tZI9mplR5rsQDAs8LrpkdCl8PvHSg=;
        b=gulO4ENfH781+QSdFymNUDsARXQzlt28r3sGrF3NJxrmQan0Khup4Jk/ZxIRFns2gT
         Ot1ciqIePSRRZjTZD6DRgBYDbD9mHTveN646vXXKdBw5BzglxPFkyaAFw6aC0gGeVoC7
         fubAZrCiSkl/+lFCeq1SLPJHPV8VAsfKZGEfkfX7tCd91t7v3kqb20L9OvacPTj4fR13
         zDwnsPZ5CwHjxcFYf2gwa6chByK0+rBX/M1kaPdFfGLdOyOg/vtZ4xqJOgt+eBacFAFh
         8SIKQwerh7mnjNlRWaIqCBLQpfbEeS+9BcqHhbvztxQ6BIMoBsxmi7DwTszJ/l9QmooH
         SI8A==
X-Forwarded-Encrypted: i=1; AFNElJ9q8T7AzFCJpw+eeoRF07xuWxb9EnFGft4QNEFAWL5KDHZC4ot43s3ECiAnZM1T9HKfxGL8aWvQ/kLs@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0ixXhhzmXWvfuQBnjqovXYyfiNiYL1dYn4dCGQ+H8fxVCcyq6
	GyLFmNs0F3ZZOIOg5vxAUiMwS9OpLKLhZ8lE9hOrrUgvvLDVxMwVxT2HM2odPcYX3o2Znv/hQeO
	3rDRvBhpMT7OGAcHa5g5OW5jEJ1el1Q8=
X-Gm-Gg: AeBDietq4b826bzDuqORy6IbyrM1rIZ9MiltcMXdE1zZkHSnTZAoXjgJQjqdl3KGac8
	dK/LSQCdPib1M042rkQREaa9mFGWN45hykm22iYsfcMn/Q02LbNNX4wmYPAYq1Im22uxSn/lCVA
	tg1H+3cIwS4pBgTjfdjfzCw4r2qjcbr3OHKjoozh2kx3XpMxzdz/P1kWfPwN+N77z9+DazOr1G6
	r9vO5Vbk1HxJbYU3XnjDkjdmRYKVPziLkmsE+gavegjX/3V6zQHiXKJQ64ge4RAuyzWQFTMaBMw
	sdf3LX2eylD7SEsMTlJcLslBYFZiSlLZPKhiaU6Kvr9a8XKq
X-Received: by 2002:a17:903:1988:b0:2b4:5cea:f618 with SMTP id
 d9443c01a7336-2b5f9e7823fmr16651795ad.3.1776409900985; Fri, 17 Apr 2026
 00:11:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260413100700.30995-1-phucduc.bui@gmail.com> <20260413100700.30995-3-phucduc.bui@gmail.com>
 <87tstepes7.wl-kuninori.morimoto.gx@renesas.com> <CAABR9nFN9C4CGsaZoWzrHEjibBLqQ1KmM8o5oG2-pSMcrgMsAw@mail.gmail.com>
 <87pl3yzabq.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87pl3yzabq.wl-kuninori.morimoto.gx@renesas.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Fri, 17 Apr 2026 14:11:29 +0700
X-Gm-Features: AQROBzDizsepmDX0MeErlaHCs1gi7_m9r-_da5ZnWboWUDc9-Dlr4ZBcUowHw4U
Message-ID: <CAABR9nGdBVaidxSoPHjXSFZxuiN2-194DKqB-d=__awc1qGGrQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/6] ASoC: renesas: fsi: Fix hang by enabling SPU clock
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: broonie@kernel.org, lgirdwood@gmail.com, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, geert+renesas@glider.be, 
	magnus.damm@gmail.com, perex@perex.cz, tiwai@suse.com, 
	linux-sound@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Morimoto-san,

> > I d> Since fsi_hw_startup() and fsi_hw_shutdown() are called from fsi_d=
ai_trigger(),
> > I think this runs in an atomic context, but please correct me if I'm wr=
ong.
> > If so, is it safe to call clk_prepare_enable() under guard(spinlock_irq=
save)?
> > Since clk_prepare() can sleep, I=E2=80=99m wondering if this could pote=
ntially
> > cause a "scheduling while atomic" issue.
> >
> > Would it make more sense to move clk_prepare() to init time (in new
> > fsi_clk_init() ),
> > and only use clk_enable() / clk_disable() in the trigger path?
>
> I don't remember detail of SH-Mobile clock driver, but yes.

Thank you. I will update it in the next version.

Best Regards,
Phuc
