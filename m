Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795612949;
	b=iM5Lq8dPKun0M3qjmyCBZy3jSR/kn1tx3U1l5GrFe5klpUJx5dxmmZ6Na5bg5qh3hvyC
	 0W74Vwe0TuacCKbZ3WclT0MLGNj5bED+Ee9xOgMZ9ZnOBHW+25O/CoSLrkWmRpFafUrEN
	 7jgwK2NzQrNKoEjoMYYyIVabVpB2N3uLj4R8boSvkV9xV9GG7OE+EzoTxGFdgFg3k0M9G
	 1go7rVLc294yKzpX1vut2Vq5XPEFrIhkHHLTJmxa/x1PWBvYrnhjm2PG0lTxxdEjxS3ML
	 ILufVAq4rpU2DDuRcHGyp/aX04bOnXw8GRf3tl9uTTAjOH4RGICDcogAykWglwdu3UQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795612949;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=UVK4cLpPIwtEhsLblH7lP2xDsWsx2AvOU7sAlFHXFUs=;
	b=aA6XLzrLLqPoDeniiXAFflGe2Ua7ZkKCkVdRwWjDCgJkXY+cXRBAkBd+pVzPen86/M6N
	 E2lKdaIih1biepAMsZb/2vhpWh+8l8l4g6iXqYQYGQDh2Y8ZnN+o5x8ztphj4ZSvd3sL7
	 viAo9lvHkJr3QjGtdmxwLUdDS118wSPI+/6ZDZjid2VpoZwRt/E//nywszaNaHyGLU7Wv
	 iJKj5CCWPTsa9VazMrItX/DRTPOLWGpFZDLvJuBw3Kt/QtLoAT3HMEIeVlcfFuv5nQ5O/
	 2+ub+BwcC85OhnNIEuAbtiRp2nq1+anAnkjTXLdhG2i2T9Vg3YdOpdCAQG8pyb1SaEg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=teslabs.com;
	spf=fail smtp.mailfrom=teslabs.com;
	dkim=pass header.d=teslabs-com.20260707.gappssmtp.com header.i=@teslabs-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=Owsxi05b;
	arc=none smtp.remote-ip=209.85.221.42
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62949606A326
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 13:22:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 62949606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=teslabs.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=teslabs.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=teslabs-com.20260707.gappssmtp.com header.i=@teslabs-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=Owsxi05b
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-4a5024b3c28so3946878f8f.0
        for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 05:22:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=teslabs-com.20260707.gappssmtp.com; s=20260707; t=1795612948; x=1796217748; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=UVK4cLpPIwtEhsLblH7lP2xDsWsx2AvOU7sAlFHXFUs=;
        b=Owsxi05bGJecVcIiAGZ+4ED1feKCQnToQnFTBCwRIrzLtED419+RmH0CahaB9tYIoe
         QrrClNt3GHNcrMeuzl/yAJySh3ZCQlQh9vil7V2nKHqQNAVjsWE0OT78PPoqT2DltN8/
         Y4PG8ewQQfvoNe/v+MqGGpD00LOhFTNubOg9sK59nKRZcJCn6TDBpmp+zZqoeX60+iRe
         Uo4pXtnAU5zHSSEq3rEXS/OXZ54Lp8oD2FCt3ctxnQII3SOFgpfzOeXaSM4t47sm/J97
         0Aa7PY2NFtspd25BG3e38Sw3AnFhpTgSJEtNBepuXqf39XSnPV0cbZdwkqqlyWT8GpJc
         eHBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795612948; x=1796217748;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UVK4cLpPIwtEhsLblH7lP2xDsWsx2AvOU7sAlFHXFUs=;
        b=B2f5N7g9VfUuBERWIFNYqudKpVtF0E61LWTDb5lyosmDvvi/SfPQMLVV/gOL01uW4p
         2hdyfeLnc4AM+gBqoWaH/7VYr3IOqg6aLdO3c6PBS3xucaz+ud7Eh84AJCKFwNigRS7x
         QQ9pkkBU2n7LE1cvIJ+vAQayYNW4wmYAVC6mQMOhWPbOQCGwze6mdGp06dOMC09w37+H
         cM0er5gNDytuJ2giDXr/mt+2DfcCe/5j7yDhEsNn/g18AYkN8l5ANQDY/9EV0V6rNAWu
         u786SGSWHtRjK4e34OdND6vSZCMeYWdm05TwXxODe5IfgXdWLV+XyRqPcQBlbpuwPCzQ
         GSvA==
X-Forwarded-Encrypted: i=1; AL+hErHsyTK4AHhrX2+CWMTYOJNy99NXE2VSa7EiH90sW0joerKihDosuHzfG51YXUKCtk2NzetUXDdxilqO@vger.kernel.org
X-Gm-Message-State: APuU4Z8+v3XBU/NMaNZ0pmO4bSNtsGqhZbKr5eVjWR6CzR3+HGhbTXmc
	S330XW8q2m/eT5IOCt9Qo7Mz3iyyQ6JhUeH9aWL4/v1/4wYEzwQsjL8m7mfgNTkJMYo=
X-Gm-Gg: AZFdTZd14wkCgBnvk9SC5TQa4jG3CzsEs1Oi/M/6SkwaKOZmFcjvLENCqPg/9XOBBU0
	dHF+a9RCvNwWwVS0AJeOYa7MCo3hTwv536AYYxIq8cX1NaxDHPxz2qBAnmHauNq5yfjptJn8EKl
	vv5wWSibsRXOcMYuBQL47Aqj48CadaV90ntfE/yXoaJppYgXwzbR2+PpXkVCg2RMBGY+Gw3vufu
	McRVo2fSlcpms59qhZA0VzzSqKAQ0dPwk8lTevfu16iUyiNQOXArij6Xqcd4JFJxrqSTNQeVpN0
	2wVPtBEQaTa2LJ+IwJTK78B4tTuo+JML3hbxUEgtkUqXBprItyniJpW/+Zzc3FSydiCRVEBBXhn
	dX62kbKjbYiHFcGiQAyMnYPDX0MHGvXb8IS5x5CdX5lO2qcLiCgh7aNYYq5HVjc9QeKcrarxNXM
	1yFRCPRQMLcsQydS3Wy8bTzBDXcOEfQd+hgifyEhjq68aHgWvyN1XDjIDt4xHcOx+fvKW9+UziL
	WaG3M1LK6C0Xre65rH+7sXIBKq691URTgnpojZFNV7YP7vCgUxYKzEslDaUoEh/WlGQ4i/xGJCu
	hYBk9VABY+aM17h7PWka55boZY8eXPagNXe7CgjVyNqFDfvUUby5raUVHlKdNrJg/j4Hl5LgAj3
	z41xtqdklWQbh
X-Received: by 2002:a05:6000:29c6:b0:4a6:56b1:cfc9 with SMTP id ffacd0b85a97d-4abb41f4e0cmr26210426f8f.22.1795612947363;
        Wed, 25 Nov 2026 05:22:27 -0800 (PST)
Received: from localhost.localdomain ([139.47.121.129])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6bb98b4dsm34944259f8f.53.2026.11.25.05.22.26
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 25 Nov 2026 05:22:27 -0800 (PST)
From: Gerard Marull-Paretas <gerard@teslabs.com>
To: Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
	Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	mfd@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH] dt-bindings: mfd: st,stm32-lptimer: add resets
Date: Wed, 25 Nov 2026 14:22:25 +0100
Message-ID: <20261125132225.90891-1-gerard@teslabs.com>
X-Mailer: git-send-email 2.45.2
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

The RCC has a reset line per LPTIM. The STM32H7 errata (ES0445, 2.17.1)
advise resetting an LPTIM through the RCC rather than clearing its
ENABLE bit, which may leave its interrupt stuck and keep the device out
of Stop. Allow a reset.

PebbleOS, whose STM32H747 port uses an LPTIM of each core as its system
timer, describes and uses these resets.

Signed-off-by: Gerard Marull-Paretas <gerard@teslabs.com>
---
 Documentation/devicetree/bindings/mfd/st,stm32-lptimer.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/st,stm32-lptimer.yaml b/Documentation/devicetree/bindings/mfd/st,stm32-lptimer.yaml
index 4eabafb8079d..412060d3f167 100644
--- a/Documentation/devicetree/bindings/mfd/st,stm32-lptimer.yaml
+++ b/Documentation/devicetree/bindings/mfd/st,stm32-lptimer.yaml
@@ -41,6 +41,9 @@ properties:
   interrupts:
     maxItems: 1
 
+  resets:
+    maxItems: 1
+
   "#address-cells":
     const: 1
 
-- 
2.45.2

