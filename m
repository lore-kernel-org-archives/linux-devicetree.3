Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6ADE381AEC
	for <devicetree@vger.kernel.org>; Thu, 16 Apr 2026 09:57:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776333433; cv=none; b=G0/5fa4xVOF6+qH/E3/8r7/Y0a0Ns1ZZ635W76ZwvkHzEaPRsCtEd0yQGoYiFfzCEnbsScwj8PPF8XeVL9Mu81iSw8DbzuNsRAmtyBDzIkz/0YfoMXYE/zfUl2m8YXahl9y7rc4BaX38vdxvPWQm/n4pgriC3DKBo0yoPFliN2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776333433; c=relaxed/simple;
	bh=Z93aoZXsS4pPjtrQ7mV0ll0Vqxggd4ubOPS1K6vIpws=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=W89FYXR1GZ+DSugD917ar1JguL5DvzCi2Jhnq2HH3z7QA3jQO/EvsLWk+1tF2Ioem3+UbacDlNViOfJCamUOT0THbfETnJXTKM6b/5OhFbR/xzNi33MW6tWnh5PvDkHEVvUrZf2Vtyi5LyrxlnxyIe2RBPpLzViE1EMbqyNp4gs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=arista.com; spf=pass smtp.mailfrom=arista.com; dkim=pass (2048-bit key) header.d=arista.com header.i=@arista.com header.b=SKtA8mMA; arc=none smtp.client-ip=74.125.82.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=arista.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arista.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arista.com header.i=@arista.com header.b="SKtA8mMA"
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-12c1161232dso328097c88.1
        for <devicetree@vger.kernel.org>; Thu, 16 Apr 2026 02:57:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=arista.com; s=google; t=1776333431; x=1776938231; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=baWnCd3Ai+g3s8cPvIXwZp8BjMnFuTX7HKvOpj4gYZo=;
        b=SKtA8mMAWddFDdTJAsKoE/bDYdP6YzIXa2Si80/c8hlKn3XEJIKYjyOve5ORogQ3aF
         y10h5EH9RrRNpBBkXOVY0KEl4soZCU2PMnHAjHqR180t3E3Zx22+mwQbiAtu4/M4vOyL
         AG4MmH/PkkOcb9HbpdYNIZQLvTeBG7adz04O3NrC1OoM/G9uQ6z4NOxvSs11NhHSs5qw
         rklxZUtrZE4K2enRKL9VDzfpXD/Rn1ThsnB4r9bkvXlcfDMVV2xrg6Cr4k51XLtPrwuj
         VZ9XoEu4giBR3iKVirEIGR5OICJ52u0imWQsBmgA/6uHk8FeX2sU/bK0w/0cfL9VT5/N
         PUFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776333431; x=1776938231;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=baWnCd3Ai+g3s8cPvIXwZp8BjMnFuTX7HKvOpj4gYZo=;
        b=i1vl/mc8pe7Tjd3El1Q/diKP9Vp7NJFO7D1lXuHawvaZAYGDIp0HTt58B5+ku+uJFw
         1sTbiCzGja2uvhCthE3AmQz04KdNNykurjQyXGUYeg+WkRRV+MPmqmpRACL8iQEENqAX
         p2smG8pfWRHpGgrA+DZDrVZ3/OzTfs+GkuT34sLiAUHJ/YLXGl63Ott/yRMY7LLLY5Rf
         9cxhiVH9Sxf6fGmR/QFMEpRcNq0adZZtkvrBucJ84hqu6VtU2wiH+wFmJfAQWaB3v8OF
         VuO0mSEuVqZm3vUZCPQkvCxpeZUB5UR8obOzVBVVfNgHpnBEaaqIzm/3U6tlvY4maeDE
         JjYQ==
X-Forwarded-Encrypted: i=1; AFNElJ+QxwJNRpyVu4v5eluBTVhRelsADPeza25jbWilwywDj18/oPK0en2xfYF8uQqrzo7ncLxydQANekIo@vger.kernel.org
X-Gm-Message-State: AOJu0YySAZekxSd2PtrqlKxZ0JHWwcz1KWrE5wFChVeXNGvT/yZT++B6
	GeNXJQ0XZpYvBdXtDMxQi0c+qzJJbE72Po1cJBlwQ57KJ8g9KojIPjgwDQWrAuhouw==
X-Gm-Gg: AeBDieuqtMTpH470elJ6yl3FGcwML8GH40bz5QFiOYGwNdBuHURRMSB/MKw1TGfCv3X
	fyZ8Va+3YwDZBr11tSmRFsMtkWItuBE+CUFWznG0Ogv3xNIzefgADKOW2FTJt0L2zo0PaNKU7z+
	wIuSndehfOGLMHoRFSpcO6a6wlz+vuT7HMex/Jjtw6SwJeVtQ+yxK7VN8lxoWVXzBtcdBP0pHzd
	6rAHQVCBd8Lndz6Qgvpxjyh3ava2CPXnoewuUzlU2exQg4645iUN3OfT34czKZPvAA9fRe/Le+S
	vya6Y+5Pa5eh+Q/xQ2jjNkyWYbpLfiZ/MLFW9qQfli1ndLcH8ExP92aaDAAYRScPe34dUaUkdBx
	Xi4QpHT5Mc0a+cYgowIJSDv9HsfE0L/HJECtF6HexHxpzVzj1hEKYbjjqh15R9Aqe7Bl5HfsqHR
	3K0npI5XtM3XLk+VGgaIbDtfQ2z6nW2HQz5K1vXKhG3pj+ufA+axzT4zd964I=
X-Received: by 2002:a05:7022:519:b0:119:e56b:c3f5 with SMTP id a92af1059eb24-12c65d3aacbmr320152c88.5.1776333430634;
        Thu, 16 Apr 2026 02:57:10 -0700 (PDT)
Received: from adriana-schoodic-rtc.sjc.aristanetworks.com ([74.123.28.10])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12c5f3f3d93sm4532913c88.15.2026.04.16.02.57.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2026 02:57:10 -0700 (PDT)
From: Adriana Stancu <adriana@arista.com>
To: alexandre.belloni@bootlin.com
Cc: linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Adriana Stancu <adriana@arista.com>
Subject: [PATCH v2 0/2] rtc: bq32000: Add settle delay for aggressive polling
Date: Thu, 16 Apr 2026 02:57:04 -0700
Message-ID: <20260416095706.3212158-1-adriana@arista.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260416092414.3210383-1-adriana@arista.com>
References: <20260416092414.3210383-1-adriana@arista.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series addresses a limitation in the TI BQ32000 RTC where aggressive
I2C polling (done by userspace tools like hwclock on systems where the
interrupt line is not connected to the CPU) can prevent the refresh of
RTC registers.

This results in stale data reads or select() timeouts in userspace. The
series introduces a configurable "settle delay" via device tree to ensure
that the hardware has sufficient idle time between read attempts.

Patch 1: Adds the "ti,read-settle-us" property to the YAML bindings.
Patch 2: Implements the delay in the driver using usleep_range.

Changes in v2:
- Expanded dt-binding property description to explain use case.
- Updated commit messages on dt change to describe the scenario when the
dt property would be necessary.
- Reword the commit messages to respect wrapping at 75 columns.

Adriana Stancu (2):
  dt-bindings: rtc: ti,bq32k: Add delay on rtc reads
  rtc: bq32000: add configurable delay between RTC reads

 .../devicetree/bindings/rtc/ti,bq32000.yaml   |  9 +++++
 drivers/rtc/rtc-bq32k.c                       | 34 +++++++++++++++----
 2 files changed, 37 insertions(+), 6 deletions(-)

-- 
2.51.0

