Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792767362;
	b=SSnToEaNSCyo0eBBudjbPd3dPeTgdp8zGAQEayIWWi+Wv090nHwgBzpjmb13wjrQPFyl
	 KEI8HPzuuF7t8PwpF520gKp3J11KgWIm0S6bvABnhpVsrsINK2U+uiWFiPHccBrxEYMWt
	 3ohEKmRR9hGWzGE4J5Xz0b7RDZMZotz2Nzq2uXC33yV2T6h2vXTMza2eLQdLlEO6yP7ns
	 ysdk01YRvaX1vZhSPr/FnFLVOyVenJtjfE9koLpWzWqTgetqiB9kPljAMF5/h4ithZOBT
	 yGFn+zniAU65AOGZki0M9hM9iXl8iQwZT5lP9mtY4AUzhAMlwOYRUt4NCPElkkcmGDA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792767362;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=9bdn7JZKlrSe802I/W49m30XlcFM4hLN7khRfrE0PxM=;
	b=W8OujKxJ2UMgjGiTDJToLoGsUgl0x8cDjjnS/CvF2OXb5IvjidyFNli0Q/5ZgedyNNWk
	 Q1zpsYkcpFC2F+RiqMMNZ4NmPgDcY0Bf9HAfoNEFbL0XktM37SKDWF1k7ta9gXlhsNEis
	 87Yap8YE9Hb/U9I5Bl3kYYwt0qzDbvyCfF3T5HMFJVjhZsh9lqEWlxQIglLvp95X7YuPv
	 0Vpmt69xMK2YkSW0LJqtrcNJBqLlMaqtHFS4kRahjBC+3U17ZiqphUrSONaafLEJPjxya
	 qimzavm6KY/cU5AgSJtpDbWguQZVh44uVEoilXEarwQdlX8pUzjpt+yvEuPuQvU+FmQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amarulasolutions.com;
	spf=pass smtp.mailfrom=amarulasolutions.com;
	dkim=pass header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=JS4slTlj;
	arc=none smtp.remote-ip=209.85.221.52
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29F44606A331
	for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 14:56:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 29F44606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=JS4slTlj
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-48e3b22e971so354052f8f.0
        for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 07:56:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1792767360; x=1793372160; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9bdn7JZKlrSe802I/W49m30XlcFM4hLN7khRfrE0PxM=;
        b=JS4slTljmmDFN9zzqecOutQb4/qkaxdkf61XRiBOYkMWrNjBIwFAq8E/4eSrH6FkI7
         bLlG8vmt8xQ6eSlB1oyroh/DhTdXl4Nog3M8n2SFkCbOWnnYYf1dc9X8ThNjRMSwLX9V
         JTSYWtL6xt+KjCJ/OJQ+GxTh7uV+2j/OQlCb8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792767360; x=1793372160;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9bdn7JZKlrSe802I/W49m30XlcFM4hLN7khRfrE0PxM=;
        b=M5P0R/qg39KhLaIeohG7HqOFR3y7p78NUEgHenQFZjE8oQsyIJlxAoo4dsz7ObuTao
         dRjC7WbUgadsKATvEZ01DnjUwBKqKhUfnWqlHp1rXCQN5DjO4zHwBa31xD+07awwgfRs
         En6XP+91NA1U/EwfQ+ArPx+VhRt89WjsXkbJ3W9OXKbTgyLdvBymz7snab7VYLoG+bNz
         idnMeNW770qKIEty3u17wNpnrdgHewe5NJcqMylpSkxgjadVU9yqVs0RtvvQZkhItjWH
         YvhN18EFp5ZVvgpk03fiB5u/205egXmmcgAW4Hjp31H7qyInq2EVPiBkX5eY4fM7P4hH
         MTSA==
X-Forwarded-Encrypted: i=1; AKwUvBwHxTg37RzEn8/UO9SrssoB4/cN57Pnm+2WfHnNVtxQcuEfUp1r60IK4Js2QLV4JyyZ1jbdxHOF1tNg@vger.kernel.org
X-Gm-Message-State: AFq9FYJ12PxIkAqopcrCmYKPEDuethSXDLwaC77zKkxe29gufKGzs4OY
	neb732JAv3ETH/MtbPB5L3TIW/U/7bLQhkVlNH0hWxuFmHVnf66Nze+eHgmyM4lsIsI=
X-Gm-Gg: AYBFou0qbXvSCFSOxEP9MUIMp/kXianp1CzTOytcXMuw9TcdsVqZ+5gzTINjd+W5SsF
	IE/DW9Knx4cVDZ7VwoYcfUMVjV/m1JKNTrR1GGBFh4FBN/QO5oqeAnpyjykRyTkBbjkrAJeviPO
	T3DTxRo3Zfhkridn1OPqXqGYiqswI52ED5qlJXsIzQISaE43qa16BK0YgJ/KFBqGNDXP58Xca8h
	Jd5JYEfUIwHU7IzGAMKVUt+/SGdDlDa4moA8tn6ZvWCPoD1PJdA3SWnvgBJSaGMnJ6bIIIO6TTe
	riA01eMsbXBRJV8OPy81cmokNdvdlqtT9iJcDEaIzVyrD7oGDigou4YG5NeivLlmNQDVeivWNFb
	U+U9frfM6dnHKp6R7UXjGG+AEFRtQ9ZY4LKGLGtaMwfqeubRQUp3ASaCFDsAkJQwumkr4cSlXob
	961F2ZPojcWuarS847kZDWtUFcvJibisTM7vhiF4FSI70VJx+2GHnkYruodMThdbgoJA0QdYu2A
	/Nv+bzMIt49kwTrTCBnbcUAJGidpfu5ZVDFLw6zY8a70u64W4KWwbDluNV83TwmsvR05i1ic7wJ
	w2hYlTVFd/7Lq7KH65M6dxhvRSD5q4i+cgP9Z16OWrAnJT721qpOtAyMCe17r4Z49S/XVnFRCCh
	iFmmVdb1h/yNPGNsg0QTT+nux31DWnEWjp8hy7gAxSeUO1OzFLWU9
X-Received: by 2002:a05:6000:29c8:b0:48e:3cf5:71fc with SMTP id ffacd0b85a97d-48e3cf57222mr508697f8f.47.1792767360463;
        Fri, 23 Oct 2026 07:56:00 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it (host-79-14-29-58.business.telecomitalia.it. [79.14.29.58])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3d42f884sm226760f8f.57.2026.10.23.07.55.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 07:56:00 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	michael@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Brian Masney <bmasney+clk@redhat.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: [PATCH 1/3] dt-bindings: clock: ti: dpll: drop the ti,ssc-* properties
Date: Fri, 23 Oct 2026 16:55:30 +0200
Message-ID: <20261023145555.3578469-2-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261023145555.3578469-1-dario.binacchi@amarulasolutions.com>
References: <20261023145555.3578469-1-dario.binacchi@amarulasolutions.com>
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

The common clock binding provides assigned-clock-sscs to configure
spread spectrum clocking (SSC), supported by the clock core since commit
a7f16660af39 ("clk: conf: Support assigned-clock-sscs"). Keeping the
vendor specific ti,ssc-deltam, ti,ssc-modfreq-hz and ti,ssc-downspread
properties would leave two ways to describe the same thing.

The properties have no in-tree users, so they can be dropped.

Existing DTS files using them continue to work, with SSC disabled,
until they switch to assigned-clock-sscs.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---
If keeping the properties as deprecated is preferred, I can add a
fallback to the driver in v2.

 Documentation/devicetree/bindings/clock/ti/dpll.txt | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/ti/dpll.txt b/Documentation/devicetree/bindings/clock/ti/dpll.txt
index 14a1b72c2e71..ffbe50f46e68 100644
--- a/Documentation/devicetree/bindings/clock/ti/dpll.txt
+++ b/Documentation/devicetree/bindings/clock/ti/dpll.txt
@@ -56,12 +56,6 @@ Optional properties:
 	- ti,lock : DPLL locks in programmed rate
 	- ti,min-div : the minimum divisor to start from to round the DPLL
 		       target rate
-	- ti,ssc-deltam : DPLL supports spread spectrum clocking, frequency
-			  spreading in permille (10th of a percent)
-	- ti,ssc-modfreq-hz : DPLL supports spread spectrum clocking, spread
-			      spectrum modulation frequency
-	- ti,ssc-downspread : DPLL supports spread spectrum clocking, boolean
-			      to enable the downspread feature
 
 Examples:
 	dpll_core_ck: dpll_core_ck@44e00490 {
-- 
2.43.0

