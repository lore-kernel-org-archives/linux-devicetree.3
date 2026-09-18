Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 078033EEADE
	for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 03:13:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789701231; cv=none; b=ONxtlxMzUmcigDqJh64YfFXualTwdNPRlmsmlTWz52o4nNCMNdGtq2Qm0ew2KdLCFDBnOa8Kq+mnjnEo10m0azBPj7nLvAfaEGa4ZqwpVwk+tZj86SQ/JeXCItiJLN6g8C6Ac0zj7cmdbGV2HfM2v2DrKE4NyeQyAHbXzqmOO2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789701231; c=relaxed/simple;
	bh=3pUyyD39CAfpY6VKEgAB8JHfqZlwYOv9LPCjxeEJFT4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=iwOVrIeXSCQ0KXTGWJXfiHH+saFDHA4g9OsackFBBWKjXrSwm3uwvU24dnGpJJdYtO4JBclfMOwUDn2IOcKJwfRuoO8FYfKMefpSwhHqBwB9zDzBQbdWd5Gbs22JTcqyRrFCw/6zW91HRwjmys3oyerllfsaxnDNB8HQuFLBZ6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=asseily.com; spf=pass smtp.mailfrom=asseily.com; dkim=pass (2048-bit key) header.d=asseily.com header.i=@asseily.com header.b=Mu1a+vCK; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=asseily.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=asseily.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=asseily.com header.i=@asseily.com header.b="Mu1a+vCK"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49d1fb0cf5eso1724725e9.3
        for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 20:13:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=asseily.com; s=google; t=1789701218; x=1790306018; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UB4p6nqgB9EJz4EKrWNfvZJy1eYlyCEmUs8uOozwbt8=;
        b=Mu1a+vCKr5NQT7bgRoC6SbdeJAPB+NIB58JLHjmO+iipHVB9/DsiIRBhvLlyHXXYQ9
         mUYXwJaTGIad5TO2zpb1J+Wec0FqAhEKliCNIbJEch0yVKo9ww/1JJhegG0BBWsZcELO
         Hf4XRUjRG1pIASaa8NLLJJ4hGorcnrhAEKgsHt8qd5fhPlyswncsEjrVNBqRCasHr9ld
         xT+N0kxLPeeS+ni8PbUjjkqT+HzTMZeXVUC3W4rKpVlXINrOkx7VWZfXIdjcpenc7wbh
         rxui1//v6fr4Tb3bFzmYkk630uuwaMT7ElF+WXYiXpF8eZlvf3YEkXVkVfYnvRDmfNoB
         pR2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789701218; x=1790306018;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UB4p6nqgB9EJz4EKrWNfvZJy1eYlyCEmUs8uOozwbt8=;
        b=jXD/s1OjXBvoyJQ0kms+EdNK1J8pFrIeDzWIlmWa2zKqttnKXCJb90k3c5rrj3lH7r
         16D4l7koDzE+9hwXWyTrmaM2SgRxuNT3w2/76l0wOJV0pLMZ3h+Tu8ErPEuqUOWawoo3
         7wxWvhKvEVKKRfYlW2PKDI6by5vkiIDJGZg4q7dhv+s5jtHMmWTlahr3heIFspFE4AuO
         YmkHa3xc2/XDQjf13RsSHs1rpjhWfE8hrm1LxaLMuNyRrbvrYaXE2LxgZwwECF0jaUPF
         PhaFDXUKcRv4ku5jzL/a2wHSc8CqErHfLl1B2xzibSzxlyIOmBkOHTolgLorYwzz+688
         sgAw==
X-Forwarded-Encrypted: i=1; AKwUvBzjn9Htv5MtVKNsKQlgXbmAV3EitskmKH0+NZHWrA0Wd5l6T9KJvxuoAePo8Ob+xIi1HACI+WbWL7Ku@vger.kernel.org
X-Gm-Message-State: AFuF++klaYldT2CxtGWRbl0X/zVXDBsXJpPDZiN3pBZ80Nz6OFTrE7Yq
	IHnuuWoyd2g8T/rTOK0QLDjFAxQr8lbDPL+kA/WOWzmJAFi3N67uDQLw5OrzYY1jB3w=
X-Gm-Gg: AYBFou315vUbUKLr/3ZlWouYPcMUC/KHzURVYRHGbX1q133yggIJZLF3KMfxUoGqoGK
	kTxDzkUDd7Xi8RctePtTEUczvrAQAtPGwql5EQxHtShOPjIahsQm1UNBZKmV6P1OtKPQzQWe0dR
	LTv4/KIejGn3V0nVU6UsYEWlaCidihG/eqeCgpL2cvLYezTDiKlwqFDGrgXE/KlBw63D8SiK0cV
	PZlkz1zGksyiYGA3Vws+qbTZ9FKIceR14Oz3qGT0mzLkueMlr+uUIu+UjsYjZhpDjEd1csATZUS
	U9OTTht8pWjmyf+UvqJDwkKzaqskz2F5taiu8zCBBgYhUScAoDcj0Qrbk7OemXVXa2m3u6QNmKM
	M/9O4lx1MmrINaMXJJuoq66mi/rl7kX69ijYidO2Mw7rtZn+n8e0t0m0dfWQ6EnfXZUIlQVRMPG
	nfJFlJtaZUSL9axyRRnKGme1Mct1QPe0LP90TmDd+YCBsvbbXSnxs83oGDkoo9kqvEEkGEZ7J3m
	9Eh+x5CpyucWw==
X-Received: by 2002:a05:600c:5487:b0:49f:bd3c:bc1e with SMTP id 5b1f17b1804b1-49fc573a0damr10486565e9.25.1789701217944;
        Thu, 17 Sep 2026 20:13:37 -0700 (PDT)
Received: from Behemoth.triland.local ([178.135.16.163])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fc79bdc35sm14533685e9.0.2026.09.17.20.13.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 20:13:37 -0700 (PDT)
From: Karl Asseily <karl@asseily.com>
To: broonie@kernel.org,
	lgirdwood@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	perex@perex.cz,
	tiwai@suse.com
Cc: linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Karl Asseily <karl@asseily.com>
Subject: [PATCH v3 4/4] MAINTAINERS: add entry for the ES9039Q2M codec driver
Date: Fri, 18 Sep 2026 06:13:26 +0300
Message-Id: <20260918031326.68542-5-karl@asseily.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260918031326.68542-1-karl@asseily.com>
References: <20260918031326.68542-1-karl@asseily.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add myself as maintainer of the ES9039Q2M codec driver and its binding.

Assisted-by: Claude:claude-opus-5
Signed-off-by: Karl Asseily <karl@asseily.com>
---

Notes:
    v2: follow the binding rename

 MAINTAINERS | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 20d67cc0e7a..1095476c1d9 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -9699,6 +9699,13 @@ S:	Maintained
 F:	include/linux/errseq.h
 F:	lib/errseq.c
 
+ES9039Q2M AUDIO CODEC DRIVER
+M:	Karl Asseily <karl@asseily.com>
+L:	linux-sound@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/sound/esstech,es9039q2m.yaml
+F:	sound/soc/codecs/es9039q2m.c
+
 ESD CAN NETWORK DRIVERS
 M:	Stefan Mätje <stefan.maetje@esd.eu>
 R:	socketcan@esd.eu
-- 
2.34.1

