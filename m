Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794468598;
	b=A97tkQfIKEjTIHW2HTEGDMuzMqHqy60bN74sYxbo5a4PLOTv1dFyej24QZPFAzqdFexr
	 dmcUnM8TW//r4o0LHbzUw50J3pe2aR2UHqWPRBE/TM/VspS35ngRgoD3/2ULe083eEldJ
	 mw5esZYIgJ+N/uFXUfemN/uxH42f/Ba1ZUJUSYdYXdPnGJTIYarjNYSw2nHGOfYj3vScy
	 UkMIcgEtl/XhilCmCPUtW3tLsvWP4cm9srZ3lzCzwU/Rm+WhVPxdMWwKhYA5oTHIoylDa
	 FEWhpx5VjRu1aDWSlUJZZUYGaFwWthm0Rlk5J7vVvk0nK4j4EVrgXtAbBNdqVjWpE1g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794468598;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ZQvD44KeZjr+VzuppKySH8R2T6zUJQt89oLFes9hTD0=;
	b=ctdfjdNUi/mCLjO9drDWazhhc7DGak/xkBYRDpbW2Q90W/Y5+eUtVgKJEv3dPocRT+VY
	 +aJX1gH0qDdqDvdGw/QXurdxIGpQexyvHDX+JjgKx3vVH7WtTtkgGqkNRguVBB6CKMywU
	 ZUkpongn2qajBWULrkQdWP/mg7hLPaOcDvEmSXEMKVAKepID57Nkv2nlyJB+6vcp1RrXR
	 JXSVBAJ87Qvy2hjAZ3lirr9zFg9GUY4QGV7HqlfjCL7tT/Mp+wi+Ey1m69ni6Zw+PCV2+
	 Zj5LbFRuEIuyEGlCjKx+HvLWGYunWW5TJeP6N9NuSnUokvgL4GxYd5hjbB1+DJPvI4w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XsXo85TL;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D5E3606A885
	for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 07:29:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1D5E3606A885
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XsXo85TL
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a5036bbac7so24890455e9.3
        for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 23:29:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794468596; x=1795073396; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZQvD44KeZjr+VzuppKySH8R2T6zUJQt89oLFes9hTD0=;
        b=XsXo85TLf73OQfyY7unCjLeRGit+/7k6enEnnBVMA6tDJdrVg46ABvj+RJd5cmgQpo
         v710ok0Xt9oP4wzT+CwV1BwNDyEdpN7WU4kpDLXcmyYj373sa5wrg4zk3aJHhSId8P2c
         6v8NNSL16XZX/Zk5voRvFnuZJZLyIOHMCXKu3mJEcgW65dvOsukAgYDCpp0mP6SyTBul
         nYgaCHHWfn9wSTxFDFzPmnSlda4HHU1TBeBVVncMmk9O1obvFJf1ZauntD5A5vMMXYBV
         wp/iiTyZINFqXAzmTB3XTp7MHoWi7/OfMXg1wm4zk72HR7OZDJfaOMyxZXX4Ux383K+n
         2hgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794468596; x=1795073396;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZQvD44KeZjr+VzuppKySH8R2T6zUJQt89oLFes9hTD0=;
        b=gd1RTX2dzT16pwJGDEK9pN4n7nTVDsx8YOiykTrNw8DqEX610ibqHn9PVoLxGWxTEA
         mEMG1VLe8TVw72wAlndJ5PXcIujB1Xv/c1OOyNBe2x8s4CSTMCuR1QScxCvpvT0h6j8V
         AtWpqasFTeZFwcuFBfZ8w0TQ8mxngZMcP70uRJ4oU6LP80JHBK/g+NSj8OpkU03l2Yj2
         RzA4cmR9T77Kv2vjCc7PdOZN+hoNFD+H0Xuc+gIYPIhGv6RSYNMRjIE9hw4NoW0q65//
         +9S8umRsxcqNHpOlN7zI+AI6Ufa8hGRwn8ktg+5m9HT2Q97Gz4a+qR+CeU86c3rRWsgY
         iPEg==
X-Forwarded-Encrypted: i=1; AL+hErEy8BEG40Hi+isM/6TtVLvgksyZAlyGiFGZJDrO9gZqlCAvQcfCVDRBTd5AyQl0yyQpipMXHKk4y0h4@vger.kernel.org
X-Gm-Message-State: APuU4Z9Rzc2aDBh9r6miNMxSA8Hd904a5hzVWmSA05zdCyX5pc6dzROA
	jVssSQl5WwBfJDwHqyMEiqCbWuyR6YXcSSI0mI9EzmE7C6FB9HedvJHS
X-Gm-Gg: AYBFou03ETTX6MS8gygmmsEgXlaptQWMiSe/IievX0L13pgyc+7SrvjzCQ/x2UNy3CN
	5OfmvT/YkSq0Z/AXSdJXK5xg775mDXn+ib8Lt8O04Q+O6mN//1kZbZzx08VtJqTHm+hf/htWXlT
	9/ot+caaNPWJ8I1m/T4YN9CLowruLl3h7NQy5VofvL65G84N8O0oY2GOuKTT+2bfDZcDAeS8zPG
	Tg2DwUj4n3WRaCP1QqPPjEue6gW+SbAQSiRR+FqURfJV9wvsREJkhggT3F1f1z47f+lyn/GXIgt
	KG8EkqGvAD/aKzOGYTfVwJjlGuH7a9RZCKliGPyGLZd5LRA2GKpuu9zmPM3D3S7DR2Ig/dbeXG2
	GAtJhHNU+PAjIgeyBikshcvRII5bLmzmckZuWgtdDgJiGuoswvuc+mtWiQsYpe1zvyfxEcgkygx
	kMeDxDSzkWcoKBRTPrwpPDim11Y64KNs5KaN+d5tR8fqWERvHrhTS5HmdG7OSeBKjvIimWOgQfU
	hgNx9f/JNlzTLrUxsYKbWzKHGXtdWUl+qDhXkowqni/ypm1ycWw429Cho90XYoXdOCHGrCjL+bV
	xB86fBBnWmJ1bT6lAp7qZoXHc+L6qxPozpgPvomHF3WBwJFy0Ixyie1H
X-Received: by 2002:a05:600c:4e41:b0:4a1:78c5:79f5 with SMTP id 5b1f17b1804b1-4ba09383c0fmr77333275e9.33.1794468596348;
        Wed, 11 Nov 2026 23:29:56 -0800 (PST)
Received: from dev.Default ([86.127.229.203])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba0951bf2asm81897575e9.4.2026.11.11.23.29.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 23:29:55 -0800 (PST)
From: Agustin Santiago Isasmendi <isasmendi.agus@gmail.com>
To: Russell King <linux@armlinux.org.uk>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	=?UTF-8?q?Stefan=20D=C3=B6singer?= <stefandoesinger@gmail.com>,
	Navid Ghahremani <ghahramani.navid@gmail.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org
Subject: [PATCH v2 1/2] dt-bindings: cache: l2c2x0: a disabled node is left to the firmware
Date: Thu, 12 Nov 2026 08:29:52 +0100
Message-Id: <20261112072953.989664-2-isasmendi.agus@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20261112072953.989664-1-isasmendi.agus@gmail.com>
References: <20261112072953.989664-1-isasmendi.agus@gmail.com>
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

l2x0_of_init() is about to honour status = "disabled" on the L2 cache
node by leaving the controller alone.  Say that the firmware must then
leave the cache disabled: the kernel does not check or change its state.

Assisted-by: LLM
Signed-off-by: Agustin Santiago Isasmendi <isasmendi.agus@gmail.com>
---
 Documentation/devicetree/bindings/cache/l2c2x0.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/cache/l2c2x0.yaml b/Documentation/devicetree/bindings/cache/l2c2x0.yaml
index ee604117ffb3..15b5d8c1ebdf 100644
--- a/Documentation/devicetree/bindings/cache/l2c2x0.yaml
+++ b/Documentation/devicetree/bindings/cache/l2c2x0.yaml
@@ -24,6 +24,9 @@ description: |+
     early secure boot code. Thus no need to deal with their configuration
     in the kernel at all.
 
+  Note 2: A node with status = "disabled" is not touched by the kernel at
+    all: the firmware must leave the cache disabled.
+
 allOf:
   - $ref: /schemas/cache-controller.yaml#
 
-- 
2.30.2

