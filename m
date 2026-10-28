Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793154182;
	b=JEM7Ta0WdZ/3L16fVX6c/8jxB2Njnb4XB/rXkU8LYzUR86xEmtfjSlBStYPcPbkMuxFz
	 bOkDl+FA2FxnqesIe1JILJ10XZDcUShEfvdHNBYQy2sWTwgQ81itYF/76PtkcNREsN7Du
	 MiOfUInReeXByR2V5LDUsl8cXr85SoiGCNaDHDdbnwuFtjIY/CSt0sce40FKc0pHQnpoB
	 KfOM+Gd6HOkqlLCvCAhiLTr9sgflDmDMQiWSQrpSkICcZsjF5ZOxSraUaCbzFKYwGv3eG
	 +QTuFsSOTZrS/9YowelE3er8rjoVN0zaUddu2QvBErQkWwFZjcMmCZvChEopscW7qlg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793154182;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=g0KBJHkcotWZ5pbwfJssjN2rt/eD5H7NBoxiLo804zM=;
	b=Grm/MosvGgg7VjAiKMZ3zfXAHYHGovPJQ6BdTZQ+ogIaGrwJZWBmyJ39RXbJ+ZcMmXq9
	 0sFNX6lsWL3vTifH8GMMwggZHpqPsRWlBKU28L+Y84xePxPU35PcI+ThSRBqmvo0o9KSw
	 LQeylnfiU6vOUNg1oDMcm6Qu15bFC3G8Ge9jib/AVFcI3JyNH+R3HG1dh+JMGTQWkR6A2
	 uXH7y+eiPO14OdN1aT/aVN3U12tivfv+LNblghqK85rfMi4ui9csnBSi0MCz1CWd4LU0k
	 Uf24jdWabEV/gmVamn1zmaBnLwf9/P6dLcuEzKvTBkb5HxNuThoadoZKpsBu+EzS/yw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=X0vXpkTn;
	arc=none smtp.remote-ip=209.85.221.172
Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com [209.85.221.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D266C606A31E
	for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 02:23:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D266C606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=X0vXpkTn
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-5eac6c5f927so237935e0c.0
        for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 19:23:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793154181; x=1793758981; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=g0KBJHkcotWZ5pbwfJssjN2rt/eD5H7NBoxiLo804zM=;
        b=X0vXpkTncO0c24ApbUJZYem4GIl8iQWduK/bkG26GR/UO7EXmUkft+ww1Tb75uaqcg
         fRDfq3P5noIcxXovYJO0g/h3oyY2Hh64kGK5itnmtsyyJ0qv6nS1ueBTjYKFwkeSxPXH
         NLattyYQ8cfA2i8ISYabPgyNybVL2Fyq41JoW+Hy2tq5nQli3KvNNo8a8eMbEJO5B1+i
         srMKZT7AIVHCgryI9mNjOGC2FZuD+NlME1j3APWs62uLEheQ8/aB0Ex50U4uxoiSJLUX
         6HpHaRh0ZQnxw1ykxtaS7M4SEO/RKhbLxIlQhytiGFJiyuukg30bxOpRazyZg860/Vq8
         G80A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793154181; x=1793758981;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=g0KBJHkcotWZ5pbwfJssjN2rt/eD5H7NBoxiLo804zM=;
        b=AdAvys4PqmALEgcx6yib6JzTx2kgL6hrEaaCTiKI/0HQ0RLvitkySVGfZGQoO1P8vO
         anW6dhp7X+pnbqmgZViPlzZpFYDk2g6bRoAtQXKIKqymxW4EpAbd+Yxu+tFx4VvN0GvS
         ichYscNiyZsA8IrKcVYtPPIQAUxEzTytYpfiS8+jC8KFxzDTnB6D24KfLfRdQ6B5dIrc
         kiaPuTqyAeEkKCJpuWrbrbHe5MP/nXztNBV/o9yzpgbwAMA4r9d0rjGp40WJvN92qUr0
         12H25IYBQ4r7o/WQfXmUCrhdD5AI0leTYRLDWGIVbEnAO+TWbXgSuAx6WwaT/nWLbh3b
         Jlgw==
X-Forwarded-Encrypted: i=1; AKwUvBzblxqo3EYIjGsX9rOPIQznjf40dfj//hXYR+W1TfDUJjP+Cva5ywnTcCS/TlMvwqgVpZM57TJf7F2Q@vger.kernel.org
X-Gm-Message-State: AFq9FYLr8XYf7GUiJvTp1CXib+VRrCYE6aYPriYk3EDJMk+MOkRa8qRu
	EKw81j8diZEBJG4IfEjzsW7Dpstwngzyt2q1IRuLXfWF0kLQT2C+P/BQ
X-Gm-Gg: AYBFou399D0m8rCVkLisHmr8y0qewEULgIuuwTAvrUr6Ok88J3Z9HCiQI54lp/iiu1I
	seHashTiwz1NOceM8DN2NS1x/MEkshSb6emMDPrXdyKI/91I5oYfeoV1hx+1w2SdhbPevJcBC/g
	/W4nVV8rwna3rA4n4Og8Y/J5AZaYLxv/cixM9oLhj+0NCWVyxRKETlAbiLb+tQb8Rt/0ahQ5l99
	B4VtutZPxPWHBwT+1n4dX6DDaQxign2pDF80A7cvD7zF8Xd5XUN9l6U1lEU77yZDTDAMF0+Y2Kb
	6zcDfu+fA23216DFZwihXAjB7o/Tl7zPnhK/6lLuHX9kS5UmxiaVJ3gU3kCyRVtn901o8QfZ+ig
	N9YjPClHSkOebwDNNQ+/C6Nag4zr+PUgl85bSfJxKScDQKwf/lqJLCMcBH2/x+kAMXw6bgpCjRf
	6Gellqu77FySWjhSStDfgFpmKklrWkbxt+DIwY5PgKbGzxxM9JcASiWeHRf8DIFGAQfw1n8qflA
	TMcCkqZmpA7+7BuH11FZ+88ak1VxNc0lcIJCMRANMFihJgSiPzTb2zaAQap/AkRZ6pZ+HkNcOAp
	eN6ELHiorQ/n9CUkiP3B2OrxrbsnVC09d0PflJ4Rc7yjSVOKLTxO
X-Received: by 2002:a05:6102:1626:b0:7cc:2bb7:131d with SMTP id ada2fe7eead31-7d03a4eabe3mr460742137.9.1793154180806;
        Tue, 27 Oct 2026 19:23:00 -0700 (PDT)
Received: from stephan-Inspiron-15-3520.. ([2804:5d20:6009:6701:4df:52dc:4559:394e])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5ec4f8e0327sm414520e0c.4.2026.10.27.19.22.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 19:22:59 -0700 (PDT)
From: Stephan Costa Barros <stephanbrrs8@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Mike Looijmans <mike.looijmans@topic.nl>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 4/6] iio: adc: ti-ads1298: prepare for more chip families
Date: Tue, 27 Oct 2026 23:22:52 -0300
Message-ID: <20261028022252.30530-1-stephanbrrs8@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <at5mQNfPsoQFyraj@ashevche-desk.local>
References: <20261024231335.280955-1-stephanbrrs8@gmail.com> <20261024231335.280955-5-stephanbrrs8@gmail.com> <at5mQNfPsoQFyraj@ashevche-desk.local>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Sun, Oct 25, 2026 at 10:27:44PM +0200, Andy Shevchenko wrote:
> > +		*val = regval & ADS1298_MASK_CONFIG3_VREF_4V ?
> > +		       ADS1298_VREF_4V_MV : info->vref_mv;
>
> Can't we assign the default and always use info->vref_mV here?

Yes. The ADS129x has two internal references (2.4 V, or 4 V with
VREF_4V) and the ADS1299 one (4.5 V). In v3 init chooses the reference
once and keeps it, and read_raw only uses it.

> I think this patch is overloaded. You need to split it to a series (to make
> chip_info a separate preparatory change, for example).

Agreed, Jonathan asked for it too. chip_info becomes its own
preparatory patch. The _mV names, pahole, MICRO / MILLI, -ENODATA and
the single line: will do.

Thanks,
Stephan
