Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5661D3C3F60
	for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 20:14:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787170447; cv=none; b=pOkRg585TEyiN6AZ7dPeaEzpJhZrX2FEZVb/sh2mfW4HzKyYIGNNsEpmuzfqiTLtEHW3iNyHBJhrb2pJmWKZyDKiO5fMqezUUwXTQhYjm3xlf5ffLGrDx9+o4iiLgKQ971qhWkp5fllDQ1cFkZAwnfWRlQom1xmvtHPEIanCwWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787170447; c=relaxed/simple;
	bh=ekLJaAFQq89WG4IF/a6svefiMwp9oXl7meItJaYNTig=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EisRPHC5iMxd4CBtJM0gKiPZN9J/VOwT/XFyp2lHDHdoEMa2hs5ne9y0nVesDriE9l6uxDwGbJC6EbZg1TbZV+F9D7R2vEOm4XBLuofv2nKxJvk31+16EdzVwyyo0a443aQdXEfrax0+T4JaqL/9xAz4Tb43Il4LAeTiR9B9fIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=o5d8fbgG; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="o5d8fbgG"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-47f904e80eeso1317569f8f.1
        for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 13:14:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787170443; x=1787775243; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ekLJaAFQq89WG4IF/a6svefiMwp9oXl7meItJaYNTig=;
        b=o5d8fbgGU0guZe+PO4DDCtUg+39SEYXH4k/XT/VBVkJdlm+1JL6s+jWLzliQJZC6u3
         lk9fcIhvnkQcUtXbVKkWJH+TWxFD85sbQE712JEFsuDElyFFs8MQq4IpIrQ8eRa3Zq5L
         z3QQSoCB/WB2ZDdpVgMP2yvtC8DK5TLmbgh4ZL0d1/7sfDfeDOPvQMXJqMuU8TyPXKz4
         yWN37MVxJAHIO6OZUPjsrvDxSqN3P4y7ycU5Rdipb6mAFlajJ6fgVS2yG+N+vTEhqQq9
         3KzJ9tiNSlXmIpNpHA3AXsyOls2h1GfvN5sZ8mBHNk5lTwyKSR8Gfkz3J+vJ6bqRav++
         tveA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787170443; x=1787775243;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ekLJaAFQq89WG4IF/a6svefiMwp9oXl7meItJaYNTig=;
        b=YhfcplqNyPUUtDo7dKEHoLxtlH81fPFZt+0G7v9JueCOyVDBPxdet5x8Dh5V38heCN
         UE6/VfSzTcteFVLIzXexZOTLRsAIheNeDqdbDZILcNQgGHfB6dmAGiLaXdXZRx4sNmTm
         sE7qJyRUB1qdHlTEL+Q8GWNNLBV2GWFfqNqQVkZTCGKRROoT1keO4VkAqimSmWrPgr0X
         HeY0jFpugt1NKxYeOmHWs4LE1pYau2eHxRzUyESP4Xo6HuFPd+hKt45TFPtHVGngDLbY
         6M0Y86IShIa3e7id8/svDTxmR1poG00lDvpZ3dm30UgFWYU//6qJTGfDffaMuZlzyk2o
         1vUQ==
X-Forwarded-Encrypted: i=1; AHgh+RrZk6JMb4fY7LhfovnWx8CR5eziqsgNifQiQtV8QmxoqtTQAkNdYXqHBl1Sqnu5dwr1kbTxw1VJHRwR@vger.kernel.org
X-Gm-Message-State: AOJu0YypqW8qlLlMNByVqgr+eHJITIvvJIxHMleib3soVkEFxMyWpY0n
	LHOX5WXWyFpcWmIUWmkXIcVXrw7ruOdQHvsMhWcxJjPGoZSSPwEpG5Ig
X-Gm-Gg: AR+sD1058JpxlenxsD13AUHcNV8uTrznWghwAfizBoeNPLzrr/NWpT2pZyt6h8IgRtt
	BG+833wiQ7dZrnOrch4ee/0IUSXEIb69Zq2Gm6JW2BEJjLD8wiprY/VYgNukgpwOgPbhND+sIv/
	kH0lKCSFTmJulxQIGeGETxp8A97+BGz7L95nUBEYGPVqzi7w3Yfp6814BiPKXjSqrfB67QAYmnx
	cDV4GeelK6aZ7U36FZcxh6+A1ufSpI/KX2t0o8W6GCnL+0KzQpv/56Z8Q576N9u/N23cefsR2zU
	EpqelPdyv05L0m9cnts+fpBMDbCdnzFQyBJxYwnF7IU0z3ksmVad8plA6wOhauC52HKdCJkpYVR
	+J7mlZr9UvT5FklWXvk9/5zl7LDTjMlbvZCWcDKwNuJbHwPX0cwQ4IKZzSY2S0kYYrREMOYc3EL
	fdNUXuA3T5xiBG/pdMQjOhkF3K1BxlyDpdUldZ4J6CSgpbB0/Tj6STzDuGeutFrRR5i5t1pPJxu
	h3Dh63UO7H2
X-Received: by 2002:a05:600c:3485:b0:499:a685:c10 with SMTP id 5b1f17b1804b1-499aa19a3b8mr150233035e9.4.1787170443145;
        Wed, 19 Aug 2026 13:14:03 -0700 (PDT)
Received: from fedora ([105.74.74.204])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499aa0d6721sm110815365e9.11.2026.08.19.13.14.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 13:14:02 -0700 (PDT)
From: Taha Ed-Dafili <0rayn.dev@gmail.com>
To: andriy.shevchenko@intel.com
Cc: 0rayn.dev@gmail.com,
	Michael.Hennerich@analog.com,
	andy@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	dlechner@baylibre.com,
	jic23@kernel.org,
	krzk+dt@kernel.org,
	lars@metafoo.de,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux@analog.com,
	nuno.sa@analog.com,
	robh@kernel.org,
	skhan@linuxfoundation.org
Subject: Re: [PATCH v4 3/6] iio: dac: ad5504: remove legacy platform data support
Date: Wed, 19 Aug 2026 16:13:52 -0400
Message-ID: <20260819201352.72054-1-0rayn.dev@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <aoWt52LMj5nviqAVe3O@ashevche-desk.local>
References: <aoWt52LMj5nviqAVe3O@ashevche-desk.local>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

> But this is still a runtime bisectability issue.
> Not critical most likely, but still...

I see your point. My plan for v5 is to reorder: introduce the ACPI/DT
fork first, then remove pdata on top of it. That way the -ENODEV case
is already handled by the ACPI fork when pdata is removed. What do you
think of this approach?

Best Regards,
Taha Ed-dafili
