Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795883355;
	b=LGVUhn+En+vTUsy/pv9r+PrsewWmlLSVTm8FNFsjaVuWZdL9Fo7cA2W769S6vqQKdPKT
	 j63Cjo+lJt2QFS2AXmiaUum6UhpK27Ztv4kWWENuJLDQoRuPHsKttC1VLBd21EN2zcuBm
	 rrSMu6Eub+NDDD97Els+fkTnh2CwMkv0Uku3iYi0ZiWo1WgjMf5k0PVMQA0V8FPnQDuwn
	 d6MPa24TG0rZC9oD7o5utrZIO9NpBI/RowvILZGa+iTFfB7D4a4k9+AELu9vFL7TlMvri
	 hcxvmL8KyNJlqdz6f3AH6gHNPvNQAVPC8NtkEMMLIfzO3sNT+nC03ZYR8rEfRRvs5nw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795883355;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=LFJzERN2VLt9fPmk1K7aSoPfto3qxkknuNn2tRoxvfc=;
	b=fu5GVFUnHgl3ZeQ2FRdHS9hNWaKNQV1VAaOsICRxUAmaIHgr5n3UifIVabD1ay3ERPGr
	 Kr514IzYbQ/tFaVloSZwBIo5Spt8xy1HSaHqyA7kzxai+mubhfy35+pz5fs4twF656KNw
	 Cl9yIDCieKT1Lx8MNsb1AmKb73kx+/F+37nwi427HHV+prGDvZTg1sBHx460dLG+WRmp6
	 Ax0LaOuzgAEbiJY/jFwpLRLUyfjQzyXQcMxTr6w44uf9kzqm98FQdwmc3uEcphMDqNKwi
	 JnNyQOZZZkOu6okcdUeNc7mzqn4R/C9g2Avre/+oMT57PDiVgnE09EEWkBwL8eYtTNg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZzuawVIE;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C30C0606A339
	for <devicetree@vger.kernel.org>; Sat, 28 Nov 2026 16:29:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C30C0606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZzuawVIE
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a9a8d6cea8so115288935e9.1
        for <devicetree@vger.kernel.org>; Sat, 28 Nov 2026 08:29:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795883353; x=1796488153; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LFJzERN2VLt9fPmk1K7aSoPfto3qxkknuNn2tRoxvfc=;
        b=ZzuawVIEqoOtwVKzR8+w8mszNFMHibEotHrq2aJaOnOn/Vj2bVZkt1pQvpwdcm7Odt
         e6SbeUMavyPiQBhSabB50iGAK0pyC63vk9ydNPT0a/SHTaRqLznkLXb/UHeB7zyF53UD
         0Jlt92nLqf0UhivRRLQoYEgWa3GTibamHVXrFo0jHaiosF4ZhAAuBU9J9r59xFceOWyr
         AAWEAPGWRoL1VU4oL5FVbFVelgtiItKNF5SJmgkmgCvKc8wR6V5xDHK12H+Zk2zuIrpi
         3XfYtxvnYINN5Fi7nKVf0rz0jP9saAXjy4OBYQQt7uI0XVj7LCY0yHMuxpwAeKvsU8KX
         a4Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795883353; x=1796488153;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=LFJzERN2VLt9fPmk1K7aSoPfto3qxkknuNn2tRoxvfc=;
        b=j+Jn9BIadXRZsDO47XOl1QZ8DsDRvPco8luVOIifE/IYwb2jxpqMyKUbxKtTvqzt4P
         TMvd0GSOfLgD5Yk9tQOh6niGnwlNDR8Rx4k3COE9emKHvNA0swCwwdki0TKTn3nogs6k
         vhmYBHC9mGWDve4qpqSf+ixUUDcOSNkNjJtfP25CXomgkjCnWQxARvjz2HtHOiMsghwW
         O0hB7UUS2Gp6d0g9MZz2IAPplXNz4ODeFQlABUJIUI39zDdXzaRjo2kxwoJCbXTv6u1P
         3hkrgTWYrLmL9UUrhyaybvkXEXO7H8Zu1FYrqKEIGkaZTpQuRDX1eocpQANybhADca9G
         nI/Q==
X-Forwarded-Encrypted: i=1; AL+hErE8SKsoWcBO7OM2PoMRekV9Z1VJ4jzqyZmYiPe27sK6VK7IMl4f0xVxstc0N4XojRbAQo6cWG1Asz61@vger.kernel.org
X-Gm-Message-State: APuU4Z/ZkLAohoJ+KxpvcsqQFQYVIDLk03OErzKz+KglXs5rZtwCZWzv
	BpzvS5uO8VYz1tMphpr1dFLSdFT8ghb3kKMita7TcHFvULHU/hgRgxt2
X-Gm-Gg: AZFdTZcfXDi1M0RPj8HKON2DaDXZIv5SHBp5+BpbiJzi/3Q4Tzcgc9hhjyywh1v3BtZ
	a8qyhiRNymT4GU6HFw17tX7GcLup4SS/bh/MmkDlPxHhQ2/CkYRvwpxAqI/ZxCSpaw5NvbvbEp1
	g/9dR2JRn8oKf7S5tnkroRAE8cBAu5pZoT9rBBymfFY8vada9mt0raUA8mCPNXrpYL4prj9OCB5
	0R9cUeqbKoKJAPieZrtlNiGmUcssFqZlz2zi+y01OByYCOvHag/Xy7yDug3aB06wraiBh/lD8Ax
	4iaVFQ5/qYrDI6uFo6QNFQnGSP8F87nwFu3YHCm2ca6cwVn1sqkwtiTUSJX+PBCToYAzQPXxQpB
	rSY5UN7MFQdwgoJa+MxszHWlTO8dlzOAl2dUTdw4w2d1VcM5X6V+INk/oLnK5BfgJOcHm72s7Zx
	2rpR7JP75nLh4sNfpDsJneBV79mT+15YGoOimA27tqpde0VhEao2AYedXhvXCKl0d4dA5uYjzS4
	nDlYvdI2oX91NFwfJ1FXg0k4bXRTruvO21qM37y1WAuSh/TVhtD+5eUU7bkfX3dEneHNM/ifH8X
	vz9e+DlN9IrPeRYrsfU3/D7qM02K+VknmzKGzHKkAAhyjN7hRsoZ3P16hPZWwP/kAAVPjyV1SU5
	h5a30lVXaMXETcjSbQ/X0WGQB4ZGCC0+l73uHBOC8idcY/g==
X-Received: by 2002:a05:600c:154c:b0:4bb:6a78:7c42 with SMTP id 5b1f17b1804b1-4bb887c3428mr561273925e9.1.1795883353086;
        Sat, 28 Nov 2026 08:29:13 -0800 (PST)
Received: from romain-ThinkPad-P14s-Gen-5-AMD.tail433d9c.ts.net ([2001:861:39c2:e340:7966:a38c:a84a:d91c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884a3a3dsm781525525e9.10.2026.11.28.08.29.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Nov 2026 08:29:12 -0800 (PST)
From: Romain TISSERAND <romain.tisserand@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>
Cc: David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	sashiko-reviews@lists.linux.dev
Subject: Re: [PATCH 4/4] iio: adc: Add the PocketGo S30 analog stick MCU
Date: Sat, 28 Nov 2026 17:29:11 +0100
Message-ID: <20261128162911.2534778-1-romain.tisserand@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261128023333.5873929d@jic23-hlaptop>
References: <20261127012612.1589039-1-romain.tisserand@gmail.com> <20261127012612.1589039-5-romain.tisserand@gmail.com> <20261128023333.5873929d@jic23-hlaptop>
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

Hi Jonathan,

> I'd guess this is swapping ends of the pot to detect shorts or broken
> connections? That has to be on consecutive samples.

Most likely a transfer check: the MCU sends each value followed by its
one's complement. They come from consecutive samples, as you say: they
differ by a count or two at rest and more while the stick moves fast.
The comment says so; I'll make it clearer in v2.

> Does this actually happen?   It is fairly unusual for a recv to fail.

I have not seen a short read in testing; the retry exists for the
complement mismatch. In v2 a short read will be a plain error, no
retry.

The rest (loop variables, state in iio_priv() instead of drvdata,
named initializer) will be in v2, whichever subsystem it ends up in
(see my answer on the cover letter).

Thanks,
Romain
