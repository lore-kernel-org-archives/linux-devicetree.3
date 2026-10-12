Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EB1D4746AA
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 10:09:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791799804; cv=none; b=F36kuBHQnhgAb5qywMIk8UCydazYtyCcJDpFqtrbNvCBKW9lAQ2qnfv3kunyrV2DDgjLBYy8k9SY1uJ7fxGWNvHSlZOq5mgw4LGh9aCTP3nodxViN4+IjbRrWNV0ofTrJ9RsfsgQgMuzENnla5tTxcKln1pmCgH32Obj8g5nMh0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791799804; c=relaxed/simple;
	bh=nSeIB9SqI3YR3qh8EwI2spWM6L+JrfQJZacP9d3kjTw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GcoXuGOFnrNWv33m5BBRSyitukmKXKGF16qwXBGpvpkWbUSM2kTKF8eFImp9p4zj7gScrqLNVV21y6wqShcy0+wQbVmH86w4EUWbRPbAbiLK0Xd/rsSnI3oOAIVMa5URZ1YKjn+GXe4+PgkmouBFPZE+6KUj3L/Z1jOHm2x5RNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZkRyoNHg; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZkRyoNHg"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a16bc2278aso11360215e9.1
        for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 03:09:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791799785; x=1792404585; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=J3Qc6M2FWp5fQpmardGXk9w7HUQgqdCLyizNZPwG574=;
        b=ZkRyoNHgNyyo0IlpmZuLBpR63GTqRGSzrr0RDJTEf2Fjs6PH/8BeRRW1fW1HWjUxZi
         gl3hhLU5wDKKwVQsAaHBNFfUDwFyxl/vSzHSfQPIT/X76Olk3pX1bpX5HVKXf1OB+EvH
         nHXvWemUtxLcGAmQuOhrlped4Wupm5qYgJgos/ZhOjSA5+fkXKxcaDoYwQDPxF7/9b/N
         C0zO2nmM5f2eRbELhUPxKWUG7hqBq+wUsC4CxB4zCqfDjWCTVmK4ylX11JUwH98rl37V
         ++sB9f5JIpfHtIHFA/TFRKSS4kHfZiLL+EnUg2wjNNyhIDqj1c0DL8ypPwvVe74upqeT
         8mAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791799785; x=1792404585;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=J3Qc6M2FWp5fQpmardGXk9w7HUQgqdCLyizNZPwG574=;
        b=K8rS3yL8idEBTK9xxe+uGXjqDqejLs/zfpskZ5ijbDgiHXcyaCwTT+MeVLHTE3LaS0
         7cU3Rq92W+KupQ9+PH6O6mtX36OtUuTWZfx+5O4g4E39w3DJYxx8bmfK2o1Gz1xqpjPe
         tXPYJB6MN4Tz637VkuPnNaVBWxCZ+Hx0iVN7Xx3qek9uR6IPagX3olHnJDXxYstkBAxd
         Ec6sB2h0GXWSxdrF2BZa3z6Klkuuwf9cFDZVwvz7w2NWoWp1FlMuSxnfDx9+o3obYxd0
         mqpAzB3EJB6uiXogtTnPtZm2GT/e+eDiMl+jCYGAEyeXqW2efA9b8WCu/uUmQvJ3FKxx
         wpjA==
X-Forwarded-Encrypted: i=1; AKwUvBzl94XCh8Jmn+b8SAA87U3rsUXMLQfWcssbiEpNzL3Uto/hanXaF8JRpBhgbg23IW08Fyfr2OdTPUSj@vger.kernel.org
X-Gm-Message-State: AFq9FYKDvDao55q3hp+W4JDcoD3htTDLGY5kZ8gVC6HCWGM05ZBx0ffy
	W8sqd8UobBb8Eradn1mXRGFdZaYyR72Py4wfisOM1+2lvBo9k1CqyTi4
X-Gm-Gg: AYBFou06kDbaX9/nH8TH9iqn1yZ8V6OA5fZpm7ZX6KcctpRnqbYQfae4Hy8zuYrzyGC
	R3UI/mCuoAS4l+x19qLmYIyJPFB2/Tt7YtHpcdbGeiuLHfhBIX7D4E9vptB5jFhGJY3ZFmzop1k
	kWVXGABqxOSJuVn9/FEdbniIZwiPR+BBsFaWQ4yz3bAJfJMmvpD0rg6U5V7CE1Y0EOPDkBqtdUl
	yms22QUFaq2Qe0QHDYYXG3GUHt18+0oHb+pgiK15rPlTYxEusx1Ct5WuRUIEjd+CebkOEoPudfq
	1kwMZ66gBDq4rMNrQBZYzg6S4vkyQodRuWNGdJBtHV7z4sfr5G7wsEXpaL9wwtRYqj0DeyEOcra
	0U2Avxcuhvszt3qQ04uezsXYZn36DsrLa1qJz67i8OZVzZOjqBXaZ7aP27YNG2Usqd7SZGma25S
	9w/O1A5cEHTKeFyDrrLCqv+QwPD2ZcHvAAUIDPssHH5762RfWq3U+W+z1m0fBFpzsIduyB167qm
	dW+NqUSQAc5kagvzlr6j3RKJjKXTJIm
X-Received: by 2002:a05:600c:4fc1:b0:49d:2536:402e with SMTP id 5b1f17b1804b1-4a19a9cf1e6mr56555745e9.30.1791799785371;
        Mon, 12 Oct 2026 03:09:45 -0700 (PDT)
Received: from debian (ip-78-137-176-146.broadband.digiweb.ie. [78.137.176.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a192d3efb6sm166229885e9.1.2026.10.12.03.09.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 03:09:44 -0700 (PDT)
From: Pablo Mazzini <pmazzini@gmail.com>
To: Chen-Yu Tsai <wens@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maxime Ripard <mripard@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Samuel Holland <samuel@sholland.org>
Cc: Pablo Mazzini <pmazzini@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Andre Przywara <andre.przywara@arm.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH v4 10/11] dt-bindings: arm: sunxi: add PocketBook Verse
Date: Mon, 12 Oct 2026 11:08:15 +0100
Message-ID: <20261012100816.331033-11-pmazzini@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261012100816.331033-1-pmazzini@gmail.com>
References: <20261012100816.331033-1-pmazzini@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A 6" e-book reader built around the Allwinner B288.

Signed-off-by: Pablo Mazzini <pmazzini@gmail.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/sunxi.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/sunxi.yaml b/Documentation/devicetree/bindings/arm/sunxi.yaml
index 28437c47ac01..fa34786f0652 100644
--- a/Documentation/devicetree/bindings/arm/sunxi.yaml
+++ b/Documentation/devicetree/bindings/arm/sunxi.yaml
@@ -811,6 +811,11 @@ properties:
           - const: pocketbook,614-plus
           - const: allwinner,sun5i-a13
 
+      - description: PocketBook Verse (PB629)
+        items:
+          - const: pocketbook,verse
+          - const: allwinner,sun8i-b288
+
       - description: Point of View Protab2-IPS9
         items:
           - const: pov,protab2-ips9
-- 
2.52.0

