Received: from mail-wr2-f35.google.com (mail-wr2-f35.google.com [74.125.225.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DE3537F002
	for <devicetree@vger.kernel.org>; Sun, 27 Sep 2026 15:12:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790521955; cv=none; b=s/qFieU24aDUjZCwgbKxrctBjfeDdSLrWr6cYvmN5LsLX9R6293QSYCOzs2QxtsWIThJBU5u83L+vhk7VKiPclXEiu0oL6r65QWKLtIq49wTn4/xgJQU8mj0b+i9PHDcUMZNbsg1OeHwYD+DTpoh2buf3nxnE+vAFfeRZokgEdE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790521955; c=relaxed/simple;
	bh=9msDYNKS2pX3bRTMRkqLXL2c0qeGUzPeGcRivpd7UC0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pe73L3qYVeDHj9ELdy/kwBxvtzx4oHsrFTrvTQThdZR8CGDKxJMcd34RQI7LSlI8TpWZX0AFjVx9PSTpeMsJunGcMGlyEukYHX0kOqTaJ8VgJkhF0Ik7B3/ooyqCuac2PMhBjjud6DbPfmHoU1htFNEot0HSdH7962HddfzJW1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z7L0XEq1; arc=none smtp.client-ip=74.125.225.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z7L0XEq1"
Received: by mail-wr2-f35.google.com with SMTP id ffacd0b85a97d-4888129c46eso1080672f8f.1
        for <devicetree@vger.kernel.org>; Sun, 27 Sep 2026 08:12:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790521951; x=1791126751; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=K6NdCou4tWyO9h5BHGqM0MWB7dKTxAp68NTU6wlSIys=;
        b=Z7L0XEq1o/yYfa1zYAUiJSF2WUBFSiMzjrTFF4gGlrZrvINqv89DDaIRONcVQPR1LC
         VVwe7a7V0GG2Ipa0OgKmGvrSEYfodmCU5b040IqbfyggbjZamtjUlJ8dHuAJmURAEjca
         jacFWqTEdasf0Vy3vi9KJQcnd341cypKbdWUBPYtYIuPWh4FRKiMPXL9UdKphJTPaAyh
         VSYazSSSdOmmBl47RXtB5SnxSVCGJ3xq8Hhjx0Y9yzu1wf2ZUrsuTVlYb8Zkj6LwbUA8
         LuyNBwfiRK4HpyntC4Ey0WHw8SqZ14BcP3tI8tUD7Y5fd/EOENbJIA/ESpbRqPppRWSL
         A+kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790521951; x=1791126751;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=K6NdCou4tWyO9h5BHGqM0MWB7dKTxAp68NTU6wlSIys=;
        b=YxSz9xsgKAQjNVLCCVJoLH4KBfvMktFdA6+Wx4/lx/Es2NXnC7Rr38TnRYKiKyeMHJ
         Js3c2GAX6jIAuFCc5hAKDLVYVWAwGOqFloYIQK0+na9izdKyfSUj7ryHfYz2HozuNO2V
         5cia5otGnAhOVJXf6OeHyGZpz4JBUsADWHZbxG9ib6dG6n4++QEOGCIm5CZbuuF6hSg5
         drcycA6zZysfV93mwy/trd5EUSjpOz79SipVuIt4p6e5zoN40TqApGcJ2VNEx+YHKFen
         jDJIy2jDnXEhLUy4pdJOAbBgxMcQNhSqpSZBVmY4qhP6a2YGhWQ2t5tA+67okQCgkh3P
         etyA==
X-Forwarded-Encrypted: i=1; AKwUvByMEL7EKcGgkW88UVa5piAxUjLH8Q4ZxffInk0yNCK38CthHG2cROm03p4O6/Udohr1tBzAYDmGb6Ku@vger.kernel.org
X-Gm-Message-State: AFq9FYKf7cP15xIAcpWEQBUhvGstnLacyVon3mak3pCmgWsE6f939jjL
	ho13pt1BPVnXf0DvWjrvLEx+PP/mK1wHcOGgsrXKvzZZqRbBHgtAFLqM
X-Gm-Gg: AYBFou251ZOCHyAp9rwQWr8t6XjRgnGY4BCkuzBYI9trwgt9tO/S9Mabf5C4yMlKGoi
	LkpoSwwRBUP3ylMVWlytJtylqsygW3oISMWYGLoQh73iPxm1VUFcgz6uU0EduyLbtPNFm5zVgwH
	u/0KkpgE7csBDP147tneDLTHoOu2NDLToVRNeCJysBDBTPjqpM/x2IQ/RwjjBg1Nnqk9+C8qMOf
	S9a4iWpb7GwojnCw/tDHlx07MEDl2N38V0R7Sdm/jdRO5F1z/q+QDWwkBCqtg7svhHP0Xo4K7vg
	e8Yf91lrTtXenpAeGzL4WJ2oVg4BfkS0z3JsM4y75VSjlDlneV6k3jR98X0wYVOMqDZ1EAuDVRn
	r75orO3JI9Dtw+R0fIi3naG09SkY/729lT/JYHp4iyervsdrsu66FRHt0poiQ3sIP9Fzz5bUfyx
	lc+Y5JqS4A758srEiPb/J/91MM8zCH2MP8ndOLXpjDCSaTfnjbkTYCWvs22wEwxYOWx3fOT6XLP
	jFQpiQ9C0dqsFodIJ9AVj6zDe3rp66X
X-Received: by 2002:a5d:5d0e:0:b0:488:7f1d:2735 with SMTP id ffacd0b85a97d-4887f1d288amr14500751f8f.57.1790521950666;
        Sun, 27 Sep 2026 08:12:30 -0700 (PDT)
Received: from debian (ip-78-137-176-146.broadband.digiweb.ie. [78.137.176.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a746c57sm19764208f8f.35.2026.09.27.08.12.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 08:12:30 -0700 (PDT)
From: Pablo Mazzini <pmazzini@gmail.com>
To: Andi Shyti <andi.shyti@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Gregory CLEMENT <gregory.clement@bootlin.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>
Cc: Pablo Mazzini <pmazzini@gmail.com>,
	devicetree@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 07/11] dt-bindings: i2c: mv64xxx: add Allwinner B288
Date: Sun, 27 Sep 2026 16:10:12 +0100
Message-ID: <20260927151016.186493-8-pmazzini@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260927151016.186493-1-pmazzini@gmail.com>
References: <20260927151016.186493-1-pmazzini@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The B288 controller follows the existing Allwinner variant.

Signed-off-by: Pablo Mazzini <pmazzini@gmail.com>
---
 Documentation/devicetree/bindings/i2c/marvell,mv64xxx-i2c.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/i2c/marvell,mv64xxx-i2c.yaml b/Documentation/devicetree/bindings/i2c/marvell,mv64xxx-i2c.yaml
index c4efcef59133..d3b6f7668621 100644
--- a/Documentation/devicetree/bindings/i2c/marvell,mv64xxx-i2c.yaml
+++ b/Documentation/devicetree/bindings/i2c/marvell,mv64xxx-i2c.yaml
@@ -21,6 +21,7 @@ properties:
           - enum:
               - allwinner,suniv-f1c100s-i2c
               - allwinner,sun8i-a23-i2c
+              - allwinner,sun8i-b288-i2c
               - allwinner,sun8i-a83t-i2c
               - allwinner,sun8i-v536-i2c
               - allwinner,sun50i-a64-i2c
-- 
2.53.0

