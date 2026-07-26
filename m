Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7204433B6F4
	for <devicetree@vger.kernel.org>; Sun, 26 Jul 2026 06:04:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785045846; cv=none; b=EddT08sgQnL2By5bGh78Am/i1SDrP/iQ7NcIs6OHgX92XIvK7iyaiMWI571WNoEJuhNjFbiy+mQRyQK3Kt3zbpgvrXc3GLbY/lX+6qzi3bxOw0MkdJtc8NTJGN3e8VdmyYC77hRSZCXf0KRF8TUEo7PCtQWwf9r8UFnj9nSn4xQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785045846; c=relaxed/simple;
	bh=i0axAIOdnWy7kaUM9xsqDJz10jxvLmhCHlXNFaMbGjk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=S28Oy/cLALNZOZMn8nm29aMKT0XSsMADo4aJfIvTGs7yZB7UDkinXHbUL7U3EIriYFK3YyoYkBQU1lWPM3orNBL22PkFMinwqU9aZP4AC4F5es3+9eTlq42a7ZFLjJbO8gA3su2F1OWQ7zl6GomzKLqfr9o3VkeX5mkbVETiypY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Vq8p/IeR; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Vq8p/IeR"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-c96b08cdd1cso1246399a12.0
        for <devicetree@vger.kernel.org>; Sat, 25 Jul 2026 23:04:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785045845; x=1785650645; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=V+26Pgn5yyytqUfGY957+3+8j+6xWmgyw5AfMu8lBmw=;
        b=Vq8p/IeRcF3YlRTYzHkc+iEPb5GZgdcn4rURupRQ9uQYdIZOy0N7inxAnnGNf/Ip0a
         zB9AvypCD+lhV0Pj9nAW2E2LDFV3Tri/1Y5BTIAnrdEUaSjbEJudLrBWB7YxWa/xw6tb
         U02HlzdWPF7lsnkygpU8uEdBP4ibMaX2bZyFL5OPdBvXYswTAx3Z1GD0ubgGdCtSwlSq
         TIhvK/HTw9kwFQlimPFvJQ0SJCd87xKGjaHDjrqyRNhHjH+ZNnHFOz7qioKuHCKgDw35
         ZnmJ3AXRdzcsTRqzdiwKg1IGp7kwwT5uxjelXsa5/Gmq/dqbr0D27RCnYrCeHaeJcHJp
         hJyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785045845; x=1785650645;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=V+26Pgn5yyytqUfGY957+3+8j+6xWmgyw5AfMu8lBmw=;
        b=RN5P3nF85qqRF595ReleDf2BNSYnZf4AN2l8r2NUNG/lzy5dmR0ziY7pa0hyX6rY5Z
         imCzZ98a5Azx5wjy2S30a+8H6bNk8SddA3kJwKqXjP+zu+IAY39s006HEzp/DxsRgbYN
         KSZ0+chDtnPxwZJ40EsRJgJl5JefRJZ9WROoZ4u7CIWTYTkRCC6BNtzxpOhJm1Khg8JL
         8gHqHLMi5uOJU6AdOStHJKny8uoVjKfP8YJxFZCtBKJeZIDs6jXQZIuuy80zzyZ/p6aG
         NcgeidbWeAlFdeM5CV+k84xD32KOOumajBsLdbV4P4u0a7aMygesqT8UdVshf5LbkKGJ
         OVyg==
X-Forwarded-Encrypted: i=1; AHgh+RqrNAEaExmdzrCO4Q0eQm6vvd07NbiDBUBdTqhdv90vqHRIqDbmiVHajaR2DgdxpugrUglvzP85UWzF@vger.kernel.org
X-Gm-Message-State: AOJu0YwkfcXc6Vghm9J2b1GLfsDLX35YV4nA2/iU6MtK5SCe5jFZjgMT
	R3ijNACwdduLJagu6T+v7AX0nVrSNutIAu1VQyhsJoCrxo3ABsV8J/IQ
X-Gm-Gg: AR+sD10JrZbp+6InLhXJ16wSKWjJX071CtTCQHvftmY/8+u7xev+NSawE2IEy/B+6Yh
	7AAgDEkY4nxkMAN+/QZjzcr7s4PZOzNzVYZuHiuLW0bvZY5A5BZVozVou2mdMuQxYfkz2h0d8QR
	on8wagI03t4tmmLQ0hMvCGOW3krB0PkgwIrMfKgCkdVOJun3PY6B/DWab+V++J1kEAUM3eUJXHZ
	/pMyy8y515IjO7Ja3LdRqWV9uN3iRpGeaLBK3heiguybh5e8BijgHio7MNtRodCQIphp7b03Nl2
	4jXGdUvKiUgO9c8rhQCm6zJ9aR5D6hLaGmrml1zZHlYQzYzKxARVagcGQ92M5zzRjcVABwNvYvH
	/XgahT3zGfNUGUv9egmoENynKGK88AzxFTM2CXd8ZYH03nTY4gRpnvGL0MEKI8zk8VbyskveVwz
	GTs0k7/mpiPmtAWV6rDqMmaI4BuIIV7j4j+ZOiFsbCZ4BZz9nUo88AryERSDCuYwfUpOUBVL0vJ
	ShzvLNSa4RpG43xqA==
X-Received: by 2002:a05:6a20:9186:b0:3c0:9c19:65ad with SMTP id adf61e73a8af0-3c67e16413bmr4106101637.69.1785045844721;
        Sat, 25 Jul 2026 23:04:04 -0700 (PDT)
Received: from acer-nitro-anv15-41.entro.com ([118.34.230.2])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cbbb6623294sm1781164a12.10.2026.07.25.23.04.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Jul 2026 23:04:04 -0700 (PDT)
From: "shaikh.kamal" <shaikhkamal2012@gmail.com>
To: Andrew Jeffery <andrew@codeconstruct.com.au>,
	Avi Fishman <avifishman70@gmail.com>,
	Tomer Maimon <tmaimon77@gmail.com>,
	Tali Perry <tali.perry1@gmail.com>,
	Patrick Venture <venture@google.com>,
	Nancy Yuen <yuenn@google.com>,
	Benjamin Fair <benjaminfair@google.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: openbmc@lists.ozlabs.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: clock: nuvoton,npcm750-clk: fix 'suppling' spelling
Date: Sun, 26 Jul 2026 11:33:54 +0530
Message-ID: <20260726060354.18755-1-shaikhkamal2012@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix spelling error reported by codespell: suppling -> supplying.
No functional change.

Signed-off-by: shaikh.kamal <shaikhkamal2012@gmail.com>
---
 .../devicetree/bindings/clock/nuvoton,npcm750-clk.yaml          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/clock/nuvoton,npcm750-clk.yaml b/Documentation/devicetree/bindings/clock/nuvoton,npcm750-clk.yaml
index 694dac68619c..b46b4ffb3501 100644
--- a/Documentation/devicetree/bindings/clock/nuvoton,npcm750-clk.yaml
+++ b/Documentation/devicetree/bindings/clock/nuvoton,npcm750-clk.yaml
@@ -18,7 +18,7 @@ description: >
   There are six fixed clocks that are generated outside the BMC. All clocks are of
   a known fixed value that cannot be changed. clk_refclk, clk_mcbypck and
   clk_sysbypck are inputs to the clock controller.
-  clk_rg1refck, clk_rg2refck and clk_xin are external clocks suppling the
+  clk_rg1refck, clk_rg2refck and clk_xin are external clocks supplying the
   network. They are set on the device tree, but not used by the clock module. The
   network devices use them directly.
 
-- 
2.43.0

