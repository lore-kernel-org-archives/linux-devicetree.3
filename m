Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794699761;
	b=ztxRysIKIhlfJ09oOVC/WkxcuH2CrwgGSv9iE9MlCK8gEjkKmN9Wvk60rNn0Nyz5PYxE
	 7ohPTiSXFxwguJyKpB3kLUBQoQV9pcfhMuHxk5OOreSuQrvxm0fCUB8UNqXg2OTE6u0wI
	 Dx1lhrCd7eUlrXqQphYWr/WYycrSSlh8UnJ2I0PbnE7UsI5iDq63YasUlA7DgH+pvy/qi
	 4xRytPiY3ixwZtoA6l29bvbMl0vMh/YIAnRxxSTNXRWXkXbzKlHCdseXCjOC0n6rzoB0F
	 63dqSG7qM3JDO0fMLiifG+g0YfFklY23gVr0ciXNctm14JQr6BQlDXNG+wRc5BSP0Cg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794699761;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=XYsHkPjzQgIm8rz0/nzpRXGmbbQyC+wUFRqtQMI5oUs=;
	b=YpX9Q7XQHPTAU2w+SthlRjvPF1Wi4Q9eOMgXVSK7VqqXQoYyQKtwfNYhsdTB3j9pgL0Q
	 kdOwvn3kAVhXcLrh4KZj0mfPmXbKR/BoFwZ60N1BBOt7Q7QeqanLoso+/JsdDwk4H4trr
	 uYT7lAwjN8ulgYQcg++J4CDECXjTMn2YeCYyp6fSROWxH/Cz6822AE1uGnif3h2yVeuJq
	 e1zg7CT1UfhRc5WSsk42oJxouRCn2TD9G0hUMpOTs2PzQ1X9CijK8DbE8xd7l3XGZ4haK
	 j72MlH50oL1HJAVJuWiaZLXo0ufXIsonYHCOK1kkTRJixLueMTerNs3CeeBPgtFhMgQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uciOJSd4;
	arc=none smtp.remote-ip=209.85.216.51
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E067B606A330
	for <devicetree@vger.kernel.org>; Sat, 14 Nov 2026 23:42:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E067B606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uciOJSd4
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-3b0a519049aso2787005a91.1
        for <devicetree@vger.kernel.org>; Sat, 14 Nov 2026 15:42:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794699760; x=1795304560; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XYsHkPjzQgIm8rz0/nzpRXGmbbQyC+wUFRqtQMI5oUs=;
        b=uciOJSd4DLcxi5tp7UFydIx3C4EhdZs/GAMHtBiuSi9pmmcpWyswkIexI/S6kLR2N8
         2Le90ZgKylQHdTleR8Xv9Yd0HOEGCaGaHqfZhbtT5RcbpIfz+e6uxDSV4zn+VdBKsvyJ
         d5q7TTht46VFaKlDsBUY736imYOS3xY2du73MdusYM6SCH6Sm6Kjl5zyYFuwaJ/zUWO6
         Lr+yr2laygQVKQkL9Yl+9lv6KhyEjevj9HDc5vaeiZVKIl7u1R0/Fepb7MTpcJ/hP+bz
         Iba1z6IiUxKqXfUAO0OU5MibmUjXTcQF3R6YyK6jd/n4EIpxa49XxgKwGqSDZIOmsCkl
         M1Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794699760; x=1795304560;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XYsHkPjzQgIm8rz0/nzpRXGmbbQyC+wUFRqtQMI5oUs=;
        b=Lf5vrZjdfqlXEC47eXs3OVaVwSbN8Veju7z4qXsKqj+h23ftjKuyW1cGOWdVTTcfgx
         erAcHgIYTwQ4WGDfKzxi+GWJlaAlxDtlUuiuAFvP1hnCj9l3i2hzyenuBomwg/G6JsRy
         kCqwAMvbyVMxYzmNbEq3qKAIkojJECQQWN4vG2KdV+gtbbnRcg9di7qlqQjO6WGdzJnM
         6anv3RD5y+Nb5ejk0T3dayPPoBQfNL+1xp6h6GqcpVBpC0EOIW4qBqc/sxlmcTTE9JBT
         xCB7ULCJ2hO8CcOxmqf7J96HlAI+AYSzPqXjMwrgcXXPeEaa6e9AoXx333LzbXEpWErf
         3/Yg==
X-Forwarded-Encrypted: i=1; AL+hErFOT7YLYoPuMiuf2j1ZqgED2iJS92kzbEVFK/DWnifbniLJ+bcw50t/PKHn4upx00MS1IAxnKLikwO6@vger.kernel.org
X-Gm-Message-State: APuU4Z+C2zPbKgpahS1GiPxyzU0qTgNOrS77aihrKU7CJjErIYpQtV1p
	kQnbI3B7+jus4f/qGcx3CYt/hNnpsKoZtydXuSB5N2dLXKLjLCG//hiU
X-Gm-Gg: AYBFou3VtV1P71i6EK7cj23QZbRBNMUN7yDlWrjunhGG4KQFdnn0gnr3evz/beRrBTy
	wup2ZoIXvjk2kswLoQjzvsxRX42T/0/Lns2cinPsNFkUZLF2oI4D8/w+D45Vc8ajnfl1wsTtyV4
	hzdEsdgl6/5iPSLe492dMjuThMffusW+70oqW882F7/myBPNgdp75nFuMaxvx7FC9Fe/JvmV5xj
	+YNIGdfvC/yV4ait+FI7AI/+NcDBWDDczP46JbWN0aouDURRq2DIMLTBvZB0fKkz5iIGcbz+MpD
	AdrI4nWtzaSLDn4OFkz2j8lXa6/1vmxoSxHneQ0MJYbLpBfIvsuzfmqmmDNcnkTXRVS6WANRXu5
	gKB/lQkgajuG4FktGOfd5qgKFgpzMzAwZ7SLuCGjcduvHHMG/oYuofMJo5xNc3uTQ6oiIGMT01p
	ozb5us+TPOJC48pdqadObvX64QGWk1WUs2dY+PfqBG/WFOyQKZUUYKqZrhyKMW9LuoOeoPcDbL3
	8DNdf7Rr0VP96kupB1IJFfnMmzZAodr9cdaUdFqIwsofcIx5yZ8UuWE9PtnWrcFWgxqp3rcZjsh
	Rp3kOGOhz/AFp74yJ2xNbZ7NBMFrgAzpe6nM81Sbpc3T1DOdNSeUDFC9d+UEMY8iROpifn46x50
	KYXRpHSwwsKcaDfOcsmo39oxQABVTcie8+mMp0bc1fFaGBfDUskhkNTzFMRqeGd3q6FifhG0QWr
	wouQ==
X-Received: by 2002:a17:90b:4b92:b0:3ac:97bc:4c7b with SMTP id 98e67ed59e1d1-3b1b0b57de5mr6751003a91.14.1794699759981;
        Sat, 14 Nov 2026 15:42:39 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197d04336sm15755574a91.7.2026.11.14.15.42.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 15:42:38 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Alban Bedel <albeu@free.fr>,
	Antony Pavlov <antonynpavlov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v4 4/7] dt-bindings: clock: ath79: drop ATH79_CLK_END
Date: Sat, 14 Nov 2026 15:42:19 -0800
Message-ID: <20261114234222.88337-5-rosenp@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261114234222.88337-1-rosenp@gmail.com>
References: <20261114234222.88337-1-rosenp@gmail.com>
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

ATH79_CLK_END only counts the clocks for the driver. No device tree uses
it and it is not part of the ABI, and it would have to change whenever
a clock is added. Drop it.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 include/dt-bindings/clock/ath79-clk.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/include/dt-bindings/clock/ath79-clk.h b/include/dt-bindings/clock/ath79-clk.h
index eec8f399b9e6..27e31452544d 100644
--- a/include/dt-bindings/clock/ath79-clk.h
+++ b/include/dt-bindings/clock/ath79-clk.h
@@ -12,6 +12,4 @@
 #define ATH79_CLK_REF		3
 #define ATH79_CLK_MDIO		4
 
-#define ATH79_CLK_END		5
-
 #endif /* __DT_BINDINGS_ATH79_CLK_H */
-- 
2.56.1

