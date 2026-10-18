Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A887541D106
	for <devicetree@vger.kernel.org>; Sun, 18 Oct 2026 21:24:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792358690; cv=none; b=bT/b4q/jBmd+EtYOplBD1Cse7oCrf8fF5RsSQhg/5tKw1xdcY3l2Q1KVvHc+YI7bV5HX/RxksD4KHodqQmE3zARaKeh+ErmzJFfvH7V4jFULM3SwwrBp0ZhUvEfolrrBK6f6C3mG8go8O+5kRAsHi6jahnyYycmnLaVgSogmEu0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792358690; c=relaxed/simple;
	bh=3XmYZ70FjHnGHrfOAWnQ7gzII7n7IuFAxA/U8VAcIDQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Cx2V6TOdw9SlrZ7H3wSq4aDUriCJiG6okBn2vBHkEP+ITQtZWH/9TweG/sNsrYo35Ns6K0F6tmKQD4qrN62VcKxajR+Bxbl2CF511YlDdoaLvDpOuQ5cLnwwWmoopyQHjME8k9xXqElBuKSlWu+e5DHagsgTzbuErAYl/AlrQ1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=siNqOvmr; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="siNqOvmr"
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-3a595487d43so9344481fa.3
        for <devicetree@vger.kernel.org>; Sun, 18 Oct 2026 14:24:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792358688; x=1792963488; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3XmYZ70FjHnGHrfOAWnQ7gzII7n7IuFAxA/U8VAcIDQ=;
        b=siNqOvmrl13JvTWVucQZ1d1gBww7+u+KoRAEIFGxS3plKkREW0pbq/NT/J4kPdZG1Z
         uyt6/CFsFzPYJVxRj+pG7TDuOybp4nRtg0QPgk+VgYSloA6UtabsD8HxPD27y2NZyLXe
         pvAvRXk9fPPZlijd+B/Tbw0e4UfNl/TXdV9U91WixYz0VLGJt/zHuprexH2PDS1fVGnQ
         aksH4Xu/tkQKqAzttpG7IwQAuwISX5GJ7U1BqaUotV2moJOppppbooA781R770YmDftk
         qgyrExXT1YOQ1tiYjp37ZauJhLsgkTimCWK7Ey+Jtf5XAmulKC1g/I+31qyHjJ3FrXWg
         5QVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792358688; x=1792963488;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3XmYZ70FjHnGHrfOAWnQ7gzII7n7IuFAxA/U8VAcIDQ=;
        b=mwqWXhwjsAEIzJ+nZ6cl8NKN76+p/30f+oTm2aim63qrTnp5k0JsUOxkozgOW3e+Ec
         vc8fuSFzu6xHouyhiZpg9r34SbC1SxkI4qJOGcl4qkzBVJldLugBXHRqlHpoePcv1KdE
         ymA2a/DrduvlmWHc7xvWGbENWHzHFu5RnQoQpXiK+HD0cLAmK808crqX+ttBXod4D5P4
         V4ZTB0G8Q0x8MxZDczI1ZzKu2sxrq6nG18YTVBadW5C1rsh5vH5+KXtc1j56lSfjD3rP
         518f3v8uCbt6xDOkEQ1LIstQCYbAfl8Gg2hkl7dRfPXHYoGcCru5+fhKQiiIX4XyCnXh
         T+zQ==
X-Forwarded-Encrypted: i=1; AKwUvBx/0+cnNu39F5ldcSqtZ9xI6jjBtCGJfW0Z5pbj2wlUAUoygSbBs05o/9DOtYLfur7tOpp3NM+vTlIk@vger.kernel.org
X-Gm-Message-State: AFq9FYJXqX+UvBLH7bx/q2PV2y4337fbxJOSnYWNld3aXtgkDb/MEg2O
	rIXYGomyjXyWnL5T3Onb1UQj7i5CC5J3vrPYa7QssoW4nx1O/p9iD445
X-Gm-Gg: AYBFou1jLk6k3jMK2heB3byz7rhbGhQsbim4oqnPQ03sx1u7vodHKWxjIxkK+oXiawp
	9LJUbTJzsCtkwKGxPJiJVE0pbqiSAICqh7WngOu/1aKssSRFdTBdqQasq/cMx6K28DjejIDER+7
	OCIWc0AD3c2eEBNzS27vCyWoYrewS828X2t5WuzJO3ZIYPGS7jbyBh8KZXdLpnnrlmCqihcKJ4q
	4dXmn2XwGQTko3qU9GaTZeeutfYayaBfz8Eu3VYDPhxsfSuUJSvQXB4UdecHsJp2AaFgAIMibUK
	sBlHwBrPFfRzwFt5HlxWWIrGNdHPDiWt9MH5QLPYm+b4DGoCL/YuQzXrvApNZNa+ZQ2snXpCEQt
	rsKiVvvFwsyGFCoMrNeSJQ7ybPjCWnIwuDr0oSHewqpQnrA55ra2elQr1Xq1QDsdsT6oNNAdBYc
	MX/zRWWk+lAbvbtF2qHij5ITsRNPAlfzJumlSavPEQAnlW0paLxVHrsDcLFHRaJTRCbwwTJS2q8
	o9LytYK4dvIMpRs/6vWHGd/LthuIRJq0F/Z7wh/WeAGnwNw2aHcb4xNkaW6gg1LTcSx8B2n2rY6
	KC9t7tc=
X-Received: by 2002:a05:651c:31da:b0:3aa:ee7a:546a with SMTP id 38308e7fff4ca-3ab29401f65mr12085821fa.25.1792358687613;
        Sun, 18 Oct 2026 14:24:47 -0700 (PDT)
Received: from yantra.. (nekmmqtaaozvmkd1587-1.v6.elisa-laajakaista.fi. [2001:99a:d7d:c300:5185:c9b3:741a:edb7])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ab28023977sm17218041fa.0.2026.10.18.14.24.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 14:24:46 -0700 (PDT)
From: Rupesh Majhi <zoone.rupert@gmail.com>
To: paulius.zaleckas@gmail.com
Cc: Jonathan Cameron <jic23@kernel.org>,
	linux-iio@vger.kernel.org,
	Eddie James <eajames@linux.ibm.com>,
	Joel Stanley <joel@jms.id.au>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	Joshua Crofts <joshua.crofts1@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 0/5] iio: pressure: dps310: add Zilltek ZTS8032
Date: Mon, 19 Oct 2026 00:24:45 +0300
Message-ID: <20261018212445.43544-1-zoone.rupert@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261016153533.3701000-1-paulius.zaleckas@gmail.com>
References: <20261016153533.3701000-1-paulius.zaleckas@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Fri, Oct 16, 2026 at 06:35:28PM +0300, Paulius Zaleckas wrote:
> Based on iio/testing, on top of a22dc7ebb21a ("iio: pressure: dps310:
> fix overflow in pressure compensation").

testing now has the FIFO series on top of that. 5/5 conflicts with it in
the header comment and the defines.

Buffered capture without a trigger now reads from the hardware FIFO
(FIFO_EN, 32 entries, flush through RESET bit 7). Does the ZTS8032 have
the same FIFO? If not, it needs a flag in the chip data.

> dt_binding_check passes. I have no DPS310, so patches 3-4 are untested
> on one.

I have one on a BeagleBone Black, can test v5 there.
