Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 222D952FE41
	for <devicetree@vger.kernel.org>; Wed,  9 Sep 2026 11:15:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788952537; cv=none; b=b67zr/zz3Bg0ubUVIjCMJGQrI7V9ESW182jZ+S+iDnxJrJU43cddj8qBCNIB7k04GNRP718lfU+YpK2eBy3DAD2gsuK2Q96spLflxj+9HQGTc5tylVvCo8mSwF9LDwQhLup3LDMVh6c/BuvOmFcR/rculwYiZ2Z3DbIgZIwtdBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788952537; c=relaxed/simple;
	bh=hbJn4NRCKD6Hzki2Taev8IkN2yqoPBZLK9XR/9cYFaY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LZIrSjOa3C0I1E8/yWQwQRhiQyvadCVj1QHg3PQNGuau+C/talFZP8ifnSTQBHiALBA2B/GcvsMxf4sqJTB+StWIQ8pHgPCeGwWTktquZHnVC4Vdf8jFL2wDKBo3X0Rd4Yq+995rHY/AK8H/ykz3OUbQ/IGU2FZ7GY6o0S2+tGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=konsulko.com; spf=pass smtp.mailfrom=konsulko.com; dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b=YDOq1PP6; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=konsulko.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=konsulko.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b="YDOq1PP6"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-49d0da752ffso37064015e9.3
        for <devicetree@vger.kernel.org>; Wed, 09 Sep 2026 04:15:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1788952533; x=1789557333; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PR+p0s4HRgq3MsIHDXZsHzRDiZPU8CDwPj6dMo6pUN0=;
        b=YDOq1PP6yAE1iwT7dUQ7Lf0HWHXeHZE0SFz0qt2LW3Tv/0KZi/j0DYJXEnbr7hRaCG
         dOoG4dHhR3UggWDF3iezuYu1nAheYnPIhd5vT9zbKQp/Ut1ilAHlxnJNuTDjxHCFelyc
         OLp8x3nFFzTK74sxUcTbxVP+hFS/hmrL4T7KI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788952533; x=1789557333;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PR+p0s4HRgq3MsIHDXZsHzRDiZPU8CDwPj6dMo6pUN0=;
        b=EY53xgEIt3Nf9mer3RhtaOYtO9eICF2zH1v9q6c8x6hEm38k3BpUh72DnMktqzWPE5
         wiMb9tsgyJQhN0aZHOPKaEJVkcQOLPzIp+m8Qoi9pFBtEESBl5LNeXdcU0fzXNcyEtB2
         TX0oVUH9xcLCuOtIw1dRUV+NuiVIq9De+LS6HVdOCAn85cLTUvCNU9XcCoZvvIfy/E7q
         hN4LAeHkuCa/K5OZrya0uhUSotCGqdwZS0Zayi6O0gKvYWy6hOWE6fI4034bIYua2MBk
         Sr88snrmIBftHEZrolZX4CKNUA171JL8y0UYLtS/GZCVcWvaUGz6uNNzKqBGp4f3mxq6
         n/vA==
X-Gm-Message-State: AFuF++k7Q+yXNR/jQBQIkxwtzc7l4E566iPhZ+Yhjc5dBRN79Y455F+6
	FWR71ZopBwjOP8gX/wtoNAdtBNuuMek9Rx1UyfW3gGmkZk0Q+nQII1FJQ601tc+dYMc=
X-Gm-Gg: AYBFou1rJRL4UcjJ5y/Btw/wqw46tKA0YV+xKtrmnldMKgTNNyGCKcDK+lxdngcpupk
	rFilpEL8BXjMN20uwWN5ogXG6HKTLFI23yQvPk/XD9RQk/HNhOUTgOr7M5xGbrYDrV6wZAWV8TJ
	NPLxOfr/WejB+y3F+m7PkZ+TnMKRuFHcyua/CAjB6BZeYV/BWELazudXvXxkXBZf6dYJpwVbiPv
	Lz6CunBdyhzcVGPuKKLDKxTfg5VL3zER5AnVtI6NYkD30J+ZdjSlM9TyKfOZFtvtYp/cA2QNSHN
	WwNfg2LIIwDQkF5x+uvN0VyX2O4ZWD/E9+00Yo0BUOxbShrMyyPh3PvqquMM1o0HtBk4YkS+qBg
	M2IXpcEZNb4P4GjgH+jRfgYtvv13vs5eJEmmtr4utMEp9aHHw6eqWD1QhDB8Qp1ZK1D4gUGjEJP
	nLJ7g4sxxMZyf6gNRgBXY5CCuYK278d84zlD0scK9FEdacmf0kyr9QI1Fz8txoOfUXkszcX/V8O
	5NdsCCbbzdpXtsm
X-Received: by 2002:a05:600d:8645:20b0:49c:ffab:551f with SMTP id 5b1f17b1804b1-49cffab5557mr212744115e9.22.1788952533062;
        Wed, 09 Sep 2026 04:15:33 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d20fce7a7sm107391915e9.4.2026.09.09.04.15.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 04:15:32 -0700 (PDT)
From: Petko Manolov <petko.manolov@konsulko.com>
To: linux-kernel@vger.kernel.org
Cc: devicetree@vger.kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	dinguyen@kernel.org,
	Petko Manolov <petko.manolov@konsulko.com>
Subject: [PATCH v3 2/3] Add Draeger's M48 board to the SoCFPGA family.
Date: Wed,  9 Sep 2026 14:15:10 +0300
Message-ID: <20260909111513.2259643-3-petko.manolov@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260909111513.2259643-1-petko.manolov@konsulko.com>
References: <20260909111513.2259643-1-petko.manolov@konsulko.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Petko Manolov <petko.manolov@konsulko.com>
---
 Documentation/devicetree/bindings/arm/altera.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/altera.yaml b/Documentation/devicetree/bindings/arm/altera.yaml
index 3030cf46fe74..8ed1ba733510 100644
--- a/Documentation/devicetree/bindings/arm/altera.yaml
+++ b/Documentation/devicetree/bindings/arm/altera.yaml
@@ -47,6 +47,7 @@ properties:
           - enum:
               - altr,socfpga-cyclone5-socdk
               - denx,mcvevk
+              - draeger,M48
               - ebv,socrates
               - macnica,sodia
               - novtech,chameleon96
-- 
2.47.3

