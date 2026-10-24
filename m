Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792818994;
	b=k63/Nw7U91pC5638qRB0AgR7+82EfdsEqaJV0sOdpKnYUxvmWdY0E13MP2o6GiperhWp
	 rHh/NQe5IsyF+Ck6mXSyiIW3IefP66M7gyS5VjlufdznCRoLgfgrpJ2J1lPmzC4bUDw5y
	 fQ5ld04kxoIRdfEKFbPdNgdSFyZXvfoT9uhTM4mKZOiKiTXYPu/dB21zJs/yOfjFEGtzu
	 aSe6T4J3Cmylj1tdOFcsIhpbHlwH2lrUoPLnfILrfm63q85maegKJMVljgH71NjQUeznz
	 mr/+ukMo36jfh1lYqcjmCVHPFPcHQ9jD+dSoiujC7vGPZS9qCCtTTZWgaSU3oYEu28g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792818994;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=9+/gnD5T4Kmt2Ygw6Q5XDsq45pHCg8xCx1/EjyDNaxE=;
	b=5HuHm315qQjgr8ZwJ4n36OekZyt+V7mY/NFj+ba4NnC4wQnVQfl9PXCYgMt3sbPQypRw
	 meLnT35zE7OwYan98T+DE49285oqlCoQWCdUzMTFSu4RUAmn0N7BumRLgbpf+JibrkctC
	 HD5vU4gr/Qds+cmtpNpAf0YscZ5UPIn6Ms6GhiDWx7LkwN2EPGvkzSO+RqzGT9gFckVVJ
	 69Ovhb1Li5M/EvSLELgLRcrIZmO8kuW/hEU2/gFv2pGGB+6ZMutJsixPNr8EL+bEjfkvT
	 YiWegp50nYySQ1/GjfOfFzUnJEhLtFIdhilCVAzT+Vby3bHdWsuQsqBi3YyI5noTijQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=mgcrea.io;
	spf=pass smtp.mailfrom=mg-crea.com;
	dkim=pass header.d=mg-crea-com.20251104.gappssmtp.com header.i=@mg-crea-com.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=Zpb9xE3h;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7AB3606A31F
	for <devicetree@vger.kernel.org>; Sat, 24 Oct 2026 05:16:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C7AB3606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=mgcrea.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mg-crea.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mg-crea-com.20251104.gappssmtp.com header.i=@mg-crea-com.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=Zpb9xE3h
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a35d5d4a20so915215e9.2
        for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 22:16:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mg-crea-com.20251104.gappssmtp.com; s=20251104; t=1792818992; x=1793423792; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=9+/gnD5T4Kmt2Ygw6Q5XDsq45pHCg8xCx1/EjyDNaxE=;
        b=Zpb9xE3hXNHuQ91xzOw8KF/MyOVXXGXvlmMaJHXkCFR1YRFO12S5FFNknzg2rWNz2F
         OGL2FEA1Cw7SZkQTMtjqF/a/5OwBTMC2E9ejXgl5qmRvp3+TTbHK2IXKr+789NaBnPvz
         Gu9YEza4izl6a/89OK9iTLn7/Jg0yOCl3+yMTgv77b2OgtcorSjGO5f5qoP2KoUOovMf
         72HP+M7hGdqorY3fLEseqhH8pJKpjR5bYkCwmabJPAOPalSZr7mguhggUdJPmUj+X5uM
         cr9PmgGydfXqgWymBYKn4+PhNd75n4uJF2U9X+VBwjdhQAKYg6B2Fu3ccq9FKaNmNzgH
         T1dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792818992; x=1793423792;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9+/gnD5T4Kmt2Ygw6Q5XDsq45pHCg8xCx1/EjyDNaxE=;
        b=QMnL+FpPxdYseu8anuNUC2UYQyR1dqO+o1hmqcFhcEiqLNRAbm/BgvNb+F2YqRR7CA
         zU8JywTMPzf9dCytVbhx3UjHWUiBzof9VfCR5yGNxQtSSWvCwoKUYr2bY67P92CYgAoT
         uZ+wV5y9tLIo1zquDc+OzaBvifok80zFKtdN2ool94KVHKLKZMGIQFOEF21bOR0VyosX
         D2/3nBJ4VIoHkqZtGV8zGDizgaNvCtxyvonXycSTbWU8QS4VFMysmFch8oVZQGVue3p9
         pRbvbat7yoboHShaCRlN5OL9Xesp13FTdXhLQ4pl4TNvx1+T4vwklIYoAb4BTM9sDOl7
         JG7g==
X-Forwarded-Encrypted: i=1; AKwUvBxGfZZpvltdOg7S775ouHMV19jKFyIG6Vv3tqhDBCF/3aOfTcWwLB8g3ryVnWWq0egXCWdFU4dzK9IH@vger.kernel.org
X-Gm-Message-State: AFq9FYJqpgLXG8alKCOI0g5VzqPv1uE9WFpbYYD3bDifslhEov+t0uUC
	YQH02KO1r3ZvJS4/m90gYjzzVnh9b6ZJ4Jx2S7buPi2+Z3vY21GrGADfk/4Sm71ocpA=
X-Gm-Gg: AYBFou1QpsiMnXdmA/GXdWoaqbHWcc9H+EUqcvU04GM4COVNwzOWShD4xCZDVobLMsz
	uARElw1aSFuPccj6kdqjwglKpJ9UmugIGDzsmEQTFdCcxzXOjhW1gVAtmp0R2QQRQIRFSPGamqI
	L8omVVee7+zymSgJ8XXWq2aS9QW8q+p7qnzWHT7vB4cK6C5hl4z7xDlTx77/tN3rP7wKA3PaCCN
	ASIktyyoOQplqbfSy7GNoio+BfZzgQWFz+tm8IGDKCxMMmSBs9hR/Zg/FCQkBhi6AbxSJPunSGh
	sZDAlFH+cmisJ76jEit3vDShgHLG9YYKl3BP/Q3NPQSuNxeUMsHuO2Q3zjSZVPgQruUkqLvP32l
	pyDGYr6dfa8vp31SdFLG5Ald6ildJHklAWXoqXacDSptG5X2bNNVN2JKLILprj+P4TzAJfwSibO
	jlRqN/j09WqdjhHhSHdOrx/rBBLk2aCn5sS6T81KL/EVhZOWeRI3otJZpeZ1h1et0rU/lTWmqwm
	J6wzSZXYmaGGeUP5Dzv2RedU+Rg+Iy9jY8fBey/c/hLdG2XuL1IY2RPeE9iYQ4PBSDW3KYphvBy
	QkpdN3z1w0k=
X-Received: by 2002:a05:600c:a104:b0:4a3:5c67:55ed with SMTP id 5b1f17b1804b1-4a35c675a4bmr4907615e9.12.1792818992114;
        Fri, 23 Oct 2026 22:16:32 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:9c3:9990:89bb:701c:1852:56c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a55e9aasm27604415e9.5.2026.10.23.22.16.31
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 23 Oct 2026 22:16:31 -0700 (PDT)
From: Olivier Louvignes <olivier@mgcrea.io>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Jiri Slaby <jirislaby@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Cercueil <paul@crapouillou.net>,
	linux-serial@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Olivier Louvignes <olivier@mgcrea.io>
Subject: [PATCH 1/2] dt-bindings: serial: ingenic: Add the X1600
Date: Sat, 24 Oct 2026 07:15:14 +0200
Message-ID: <20261024051515.55639-1-olivier@mgcrea.io>
X-Mailer: git-send-email 2.54.0
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

The X1600's UARTs have the X1000's registers as far as the 8250 core
uses them, but the driver has to tell them apart to set their bit clock
count. Add ingenic,x1600-uart, with the X1000's as fallback.

Signed-off-by: Olivier Louvignes <olivier@mgcrea.io>
---
 Documentation/devicetree/bindings/serial/ingenic,uart.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/serial/ingenic,uart.yaml b/Documentation/devicetree/bindings/serial/ingenic,uart.yaml
index d5f153bdeb0d..635342d43ddb 100644
--- a/Documentation/devicetree/bindings/serial/ingenic,uart.yaml
+++ b/Documentation/devicetree/bindings/serial/ingenic,uart.yaml
@@ -32,6 +32,9 @@ properties:
       - items:
           - const: ingenic,jz4725b-uart
           - const: ingenic,jz4740-uart
+      - items:
+          - const: ingenic,x1600-uart
+          - const: ingenic,x1000-uart
       - items:
           - const: ingenic,jz4755-uart
           - const: ingenic,jz4750-uart

base-commit: 1184f87e2790e8af9be3116f608d2e86b4792d7d
-- 
2.39.5

