Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793886001;
	b=cDUlYcFtf6ZIsqB3s16dr759OnHf2Xma/nDtvykAu88ZkNSDToRElRkCfg5n193V2VZr
	 KXO01t8mM5V0tprmCAbUj4LTbY51kVJ921Vy/l9e2hrYM93Dn2nKPH4+74+DmRcXbF1Nk
	 ac3BYRvfarnrpq5kCEfzVZ4oXXrJXmy1Ur9KPcpZcswmrPaij0+HFwWDVH7ytyvugPcMw
	 WzK6umy39JqSqVHGcWMQa7cAOgggewngTHt0Ba2zTJ0OjhWbIoCYswf0Gr7gRP76cL6Z+
	 ra0ocMlrKLnsaqC6i81k2uxVomEOfGKmCX1OG1GGub5Z8BHyk+rGIDZxutd8uhvQSkA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793886001;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=Zm6TMXmi9ebTqld5yDJqwV1KRDoKAgG1LtJKW3+78Cw=;
	b=rK0SJygOCszgzOX+wETOIdOIYeLZaKyvMYZD1NL2rCCFEXWAd53slrL7YYAilEfADAoB
	 q0AQOgcZeE6tP6nreCK208Xa1mKb5yFLOEP7rvgovE80e1m+IJQ2lleFW0AZkyfWXgLnO
	 iHYwTNfuZjYPdLFKFfYh5UMySIGwJ+8paZBCxOtEUF7USbpxaZAO2eXn0h7horTwgGX4z
	 QLIFrTN4F6OtaRAQAMXTp/zH+9L7JAQLEgtTeKTQt11HWa+exKpm1UoPgMPA+V24/3PCI
	 8mnilbgLIx/yWnSYMIbRVDASGTFAnmQ8M2nfVFRdty4gRG/xkIKinD8CCQNDhTDoosQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b="c0I/AgFi";
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54F91606A329
	for <devicetree@vger.kernel.org>; Thu,  5 Nov 2026 13:40:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 54F91606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=c0I/AgFi
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a2153c8525so12580985e9.3
        for <devicetree@vger.kernel.org>; Thu, 05 Nov 2026 05:40:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793885999; x=1794490799; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Zm6TMXmi9ebTqld5yDJqwV1KRDoKAgG1LtJKW3+78Cw=;
        b=c0I/AgFiN03ahU6GZCs1367oOlFtvqtGWOmOreL+helVxrrmMeS/2mnp62I40u130t
         z7NFKbJ6IOV6LD/KmLHQSVkaEZeXkxgY6UCxvcLaaGaKBsvlGgq4RnKnSc5EYrKXvhTp
         wBC4onNHoDxjlFYuvofYuefFuFfLf7kOOc+uhtA9uiHTHqKDtXzb5+apZ+5590Tc6aWG
         3gSX1gRUWSh1NNdOKvkn9fdgMoFtmPc2TfmXQKa3ECGVJWQ69d+rRnZME7XYM2t2pjrg
         YSOmEnKWtuHh5qwN96YU+lwFVTMGpGzzG8nAjlEOwIGtKtQigL7y9oDkVDBMCbR3crP9
         fRRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793885999; x=1794490799;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Zm6TMXmi9ebTqld5yDJqwV1KRDoKAgG1LtJKW3+78Cw=;
        b=LtOjdHRahodgBCPKk9FmDm91jkNwIPZPyJ2AROFvggWb2BZ0bA7s2q0oiosQIbvd50
         13dYl0WCw8Z0L2LkQvpVRK/Ykdi9sfFsIKgIvLGZNCsZHBsl8Nfyaq1KAMbxTTRbXG93
         xsr1xxAEKjDrnfQtGp4gYGfqhwfmPGf5Mn1c9TwKgIIPeopCGxeROZguXVy0MQdjmWvb
         7aZb2jS6SuviQb8Uz2dCz68gGh0OYupgGlT4jPvBfawOqz6XkV05kFnymisb+8ZSaPCT
         3thI9RlGq2ul2C/pZvGKVKn8ys8riZEGcCPwy+cyBujpqBvCqRGNmL9bHp+ljLpxFJox
         /A5Q==
X-Forwarded-Encrypted: i=1; AKwUvBzLODOL2EG2qidIbxfGE5oHFK4IowWTI+H7ShPx1F3pExDBi10r2qgCsTWdMJY9DScyJ+KSLcA+i0FA@vger.kernel.org
X-Gm-Message-State: APuU4Z9VAtRvXi23907l4pETAdPQz/j2CkYYClc5sq6zHVRmnjPODEux
	KYz7ZuupELWhQrkSiqB6Hd/AEUGup69fE/rx0w5g35s5s/PwMRYHOHEYme4UY8L9B+0=
X-Gm-Gg: AYBFou0+fC8zm6d+TWgjOCn48cMFruSwqxBSElwm5tfREdW6Q7j63CcsjvgfRLFDCXa
	YIF4tk64plnJWp4xYoWpQcmMQmIoNhN7RLvhJcAvD9vAs83uCNorMkjGlBNlqc4p0wU6v26RfKn
	McIYFmBFkvt8bbaMC8Pc1z/KM9pMwH0dMvk24bnoIiXEsZzbgywPZLpgXog3DBHw7AAmADzgfW8
	uRSV628amNrvqxF5A/eM0LqeEQcAFL9MGaoDyRYvHA7slW4JVU1R7ULiCrYtthFxsGhGC4ZIGU5
	EXIxzk9kynsqAFlUvRFiaSMEHx7n52D2CXQLgoA0B3V0fcmB5WIFzMvhMBMfNI6dmObCGjWAMPF
	Y6D5L5cmOOtpbG2i+AEKHB0Zx/ZnygyYYr1rO2U4dB/pqSnNLpAgKuSflH+e89fmniTO7NacDhF
	YyTjMRdcdluFLvlg/X6PAMyy8CG4+2VYKDMklM6A2NsuQNX+idJVFUz4+339KU3eu8QDW6546gG
	MRCTxSibQZnFhjN0bbj6eOyxxVvQxFYhFruIIs0hJHIqcX07XmQUNUZC3O676g7IDuroXMTTUET
	/NuNYcQv++UIoQ0kWFldBPlIrH9vq1sExXbh4FK8QT9YCh5x
X-Received: by 2002:a05:600c:83c3:b0:4a9:18f4:925e with SMTP id 5b1f17b1804b1-4ac174711afmr407422615e9.18.1793885998746;
        Thu, 05 Nov 2026 05:39:58 -0800 (PST)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b4107b7198sm64630215e9.0.2026.11.05.05.39.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 05:39:58 -0800 (PST)
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
Subject: Re: [PATCH RFC RFT v2 2/3] clk: divider: add
 CLK_DIVIDER_INVALID_ZERO flag
From: Jerome Brunet <jbrunet@baylibre.com>
To: Jian Hu <jian.hu@amlogic.com>
Cc: sashiko-reviews@lists.linux.dev, linux-amlogic@lists.infradead.org, 
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, 
 conor+dt@kernel.org, neil.armstrong@linaro.org
In-Reply-To: <02476c54-d8ae-479d-898f-cd89ee2f7c24@amlogic.com>
References: <20261029-meson_refactor_n-v2-0-ff4ac74e527b@amlogic.com>
 <20261029-meson_refactor_n-v2-2-ff4ac74e527b@amlogic.com>
 <sashiko-outbox-189068@kernel.org>
 <02476c54-d8ae-479d-898f-cd89ee2f7c24@amlogic.com>
Date: Thu, 05 Nov 2026 14:39:56 +0100
Message-Id: <179388599696.2573818.3573650064673131943.b4-reply@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2459; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=jY1a/cgO/AsaKMem8B+RlbZOedbhgH1XS158DQz6dbc=;
 b=owGbwMvMwCW2VtK+WnvWU3HG02pJDFlv2nXPrdC+L/KnMu9R1D1tRzX9vYd/SKduvDY96+S2Z
 Tdu393N11HKwiDGxSArpshSw10t/k5S68us6Tq3YeawMoEMYeDiFICJTN/N8L/a3f2p9Iup1qle
 KoeWqkfJv4jpybA4dudj29W9U+WudrgwMpy/8nfisn7WmB+KC1myC7YbqbNEOAjPtn3JYzfjRZr
 FGTYA
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

On 2026-11-04 17:07:10+08:00, Jian Hu wrote:
> On 10/29/2026 5:47 PM, sashiko-bot@kernel.org wrote:
> 
> > Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> > - [High] clk: divider: unhandled zero divisor in divider_ro_determine_rate()
> > --
> >
> > commit 5ec3118aee2f03855552c58a4a8533e035b565bc
> > Author: Jian Hu <jian.hu@amlogic.com>
> >
> > clk: divider: add CLK_DIVIDER_INVALID_ZERO flag
> >
> > This commit introduces the CLK_DIVIDER_INVALID_ZERO flag for dividers where
> > a zero divisor value represents an invalid hardware state rather than a
> > pass-through. When this flag is set and the divisor evaluates to zero,
> > divider_recalc_rate() returns 0 without emitting a warning.
> >
> > [Severity: High]
> > Should divider_ro_determine_rate() in drivers/clk/clk-divider.c also handle
> > a zero divisor when CLK_DIVIDER_INVALID_ZERO or CLK_DIVIDER_ALLOW_ZERO is
> > set?
> >
> > When a read-only divider has a register value val that maps to div == 0 via
> > _get_div() (for example, when CLK_DIVIDER_INVALID_ZERO is combined with
> > CLK_DIVIDER_ONE_BASED or an unmapped table entry alongside
> > CLK_DIVIDER_READ_ONLY), calling clk_round_rate() or clk_set_rate() invokes
> > clk_divider_determine_rate()->divider_ro_determine_rate():
> >
> > drivers/clk/clk-divider.c:divider_ro_determine_rate() {
> >          int div;
> >
> >          div = _get_div(table, val, flags, width);
> >
> >          /* Even a read-only clock can propagate a rate change */
> >          if (clk_hw_get_flags(hw) & CLK_SET_RATE_PARENT) {
> >                  if (!req->best_parent_hw)
> >                          return -EINVAL;
> >
> >                  req->best_parent_rate = clk_hw_round_rate(req->best_parent_hw,
> >                                                            req->rate * div);
> >          }
> >
> >          req->rate = DIV_ROUND_UP_ULL((u64)req->best_parent_rate, div);
> >
> >          return 0;
> > }
> >
> > Unlike divider_recalc_rate(), divider_ro_determine_rate() does not check for
> > !div before calling DIV_ROUND_UP_ULL(), which will trigger a division by zero
> > in the kernel when div is 0.
> 
> In this patch, the dividers which set CLK_DIVIDER_INVALID_ZERO use 
> divider_determine_rate(),
> 
> not divider_ro_determine_rate().

Yet the point raised is valid. The change must work for everyone, not just you.

-- 
Jerome

