Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0BCB364943
	for <devicetree@vger.kernel.org>; Mon, 22 Jun 2026 20:52:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782161545; cv=none; b=KxBLVr1Qr78qavAW8nHXA1KcIavtH5qAS3xBlbd6qONptflhDkUTZWjSptuq/dP5MtmCmu6b4U0lYra5Ty5M4sEMJjaIOrFr6Kz6gtOGpR9FScANithS/VmwoMuCMFs0TyboJprNMc3rd8iKn6FQJNuYHq+NB7GLU4I4nvLB4Q8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782161545; c=relaxed/simple;
	bh=sptxQiOk2uc5U5lO1vn+poc8mRLH5/HRYMfY4hvAv5w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=c0H3Bn3UHdK3d5fjDU2qWP4f7fw+LcKRC3MxYPja+XH0B0OUFdy6FOyquxft5qsjzl3L2oaRX/px2duL1tbwAxRvgott7QXSF54MRVl/6fa7RYxmJRYZFnI3RzuD3XMQORwSYKHvBlDKhj+cw3A5fJ6qm+dGVKw0OqarJBp1vLQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X86jw2ND; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X86jw2ND"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-490cf3000f0so51207005e9.1
        for <devicetree@vger.kernel.org>; Mon, 22 Jun 2026 13:52:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782161542; x=1782766342; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gjYoMdtdcI4yC90S9fK4NzlMv7Qu0CeURuck5n5j7G0=;
        b=X86jw2NDdx9im1h5gMeol1qkRrQS1aND0kK9l7yT6KjFJh8AyGUuFPVrWhCis5dWvA
         6H0Pv3yn9OJrDDs+ZaUtlCbdczgkWfZLR/xZIs0Iko617t1oeho6SH92rBaNuqZFt5OX
         n/o5rnUVMI2Hr5t+0u1UFxG9nBHjoto5QmAqFX0pwlnh0bhOlcESmE2Ffb8eqy2pHz8Q
         Zb5OV5vRhuWykyXAC/ebW5eFDWWDPZw14M8Us+v2HUxLJiwuJiHfrGtjeDo40Gm6n4EU
         /uG9KiRWxSASfLXYNTP8EdoqOTFQhMwyNKscZoZsK/4qOMnWL5uSVOKEZJUUPTFLW/ls
         WbAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782161542; x=1782766342;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gjYoMdtdcI4yC90S9fK4NzlMv7Qu0CeURuck5n5j7G0=;
        b=mHZkkBCDytAf/k2DpSFH6Pew6NulypzU6seBOZikIk3ndYDejRzlf54apPXePSVnnx
         Z7lNsrZ3/odnc8zANBLGTTwcgG9tpwztlC2yeAaEgTcSA91aNO8I55VE3fV7nla3xL6y
         QrIrMqzgDUkNFz8JYEVqp23v7OjPw/Pp6D2qP9xyUDSTZ+mGUPj6sGktOmrdSdhRhHRS
         QFy2BO93K9SYt9XSESJxxTUpXauDpj6tDBWsfoe+q2oX0Wi7SFKVniNw1Ij34i0nD4FK
         /S01o1XECZ1ZO3ZAXO3HxYj3tUNnbIXS4wGTcSZWKlmCWzRqgahCytiHwvvRrhQfDTr+
         MMww==
X-Forwarded-Encrypted: i=1; AFNElJ+Q8fNr0N936ywG88rztMWAo8X7CnUTZzWOzGaU7deLyG7BIjFjj/QX9RQ9zXmYUOflMV0f4dIlRNJO@vger.kernel.org
X-Gm-Message-State: AOJu0YxUYoXzEYw1ikifCKVlVc+Z2fmeTT3RTUJOoSH0s8op5ehXAYop
	UkbMFogMLk0fWL0DnwR3stlsUvuf39HuDlC/7wGqdSaT3G+ANxzOX4pz
X-Gm-Gg: AfdE7cnkw6Ps3XeAQDarsbxx/G2pt/XzlZ4VYYGntVLE8KmzV8SxwIvDbtwMuvT0sdx
	qFD7finHeU/6k64IXrSP7Wkw2XofhMKOFXsGql6X4kOaXBnxmn3ILopoz2yN7WhN5KNkubeAcRy
	aVnLlufIPMpX+35zQCw5t4pfu/aQ6F0Ojwn1LaEjH3/WvC/iCbPc2eBRAqTX1nDywuMaw1RqKQW
	0CEig6TkdgIaYvLmS0MO0E13K5a7oCsYIYCqlAScOtv4sQF1hTOi8ZLu82KgV2SaqFZwW7qG4N9
	T0KvHQjx6jqRq3GCnU1iTLS78trFV4XKvj99o5yTIVwfcAoFC73UiLTqvkV9PTyKV3gBo9p4v+/
	A5f0hKBenHVVSfhcoGK6ipjiF+B0KPQVn4tuywq+jLohjEGSaYDkWgv3yoWHmKkguyGV/Gg==
X-Received: by 2002:a05:600c:c493:b0:490:5466:8591 with SMTP id 5b1f17b1804b1-4924233c353mr199326685e9.12.1782161542107;
        Mon, 22 Jun 2026 13:52:22 -0700 (PDT)
Received: from sefo-laptop ([2a02:8071:50c5:5c0::361b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-46666c57afasm30101225f8f.29.2026.06.22.13.52.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2026 13:52:21 -0700 (PDT)
From: Wadim Mueller <wafgo01@gmail.com>
To: William Breathitt Gray <wbg@kernel.org>
Cc: Oleksij Rempel <o.rempel@pengutronix.de>,
	kernel@pengutronix.de,
	conor+dt@kernel.org,
	krzk+dt@kernel.org,
	robh@kernel.org,
	linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 2/3] counter: add GPIO-based counter driver
Date: Mon, 22 Jun 2026 22:51:40 +0200
Message-ID: <20260622205210.10317-1-wafgo01@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260617074929.333876-1-wbg@kernel.org>
References: <20260524193846.19216-3-wafgo01@gmail.com> <20260617074929.333876-1-wbg@kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Wed, 17 Jun 2026 16:49:25 +0900
William Breathitt Gray <wbg@kernel.org> wrote:

Hi William,

thanks for the review. Three things before I spin v6.

> One change I consider is whether to make Signal B optional. [...]
> I wonder whether this is substantially different enough from
> simply using the interrupt-cnt module on the respective IRQ?
> I'm CCing Oleksij and the Pengutronix team in case they wish to
> comment.

I want to keep signal-b mandatory in v6 (if no concerns from Oleksij). The single-line case is
already covered by interrupt-cnt.

> In such a configuration, we would have two Counts: Count 1 [...]
> Count 2 supports only increase/decrease modes with a Synapse for
> Signal B.

Just to confirm, plan for v6 is:

  Count 0 "AB Count": A + B + optional index0, all 8 functions
  Count 1 "B Count":  B + optional index1, increase/decrease only

One counter_ops, dispatch on count->id. Per-count state in
struct gpio_counter_count_priv (value, ceiling, preset, preset_enabled,
enabled, function, direction), held in priv->count_priv[2] as you
suggested. prev_a/prev_b stay on priv (they describe the wire, not
the count).

For the second Index in DT I would just let index-gpios take 1..2
entries (first = count0, second = count1), no new property. Ok for
you and Conor?

> Hmm, is it a problem that priv->enabled is changed to a false state
> before the IRQs are actually disabled? Do any issues arise if an IRQ
> is handled during that brief period of time?

I guess it is a race. In v6 I will reorder:

  enable=1: enable_irq();  lock; enabled = true;  unlock;
  enable=0: lock; enabled = false; unlock;  disable_irq();

Plus a mutex around enable_write so two writers can not interleave
(disable_irq() can not run under the spinlock).

All other points from your review (kill *_delta, STATE_CHANGED for
all quadrature modes, INC/DEC both edges, drop prev_a check in
pulse-direction, ...) go into v6 too.

action_write and floor in a follow-up, as you suggested.

Thanks,
Wadim
