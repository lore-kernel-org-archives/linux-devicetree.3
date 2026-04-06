Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDBEC336896
	for <devicetree@vger.kernel.org>; Mon,  6 Apr 2026 12:22:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775478132; cv=none; b=O8fcHzZsuhi42GYrCiTK+Yy/itV0ELLpuesyTvQnn017EvdOsrv7dLfytzRyrs7IdkB/xo3rBbOQwhY/rCS+GR0v02yyLaJ9KVkGRQnonYSTs9EmrjxCl0DkrPTuVId6fA1rKkyhQXBwDNxamf4EKZQITlCiUlrovXpR0mYqD38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775478132; c=relaxed/simple;
	bh=FGICL6rCnzR2xBx7znjm8kay3nHJtrtjUE8oTd6G4ec=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ksO3k3qHborzbgnfAXhpoCEv8p/hNbSkm57KLCggKLaozk446gomB/an5f6VvZ9jfrBqwADvYsydqzwM1yr1HOjrT/HNoi1cqg3YKHaM6AE7j3Z/dcp6kdLrtEuDekOtYYuuUOVVye+Ma0l6XCyFjlbheLy5P97L1mMV3jPDuYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IrC7UiEA; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IrC7UiEA"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-488b0046078so9336545e9.1
        for <devicetree@vger.kernel.org>; Mon, 06 Apr 2026 05:22:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775478129; x=1776082929; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8VseLj579mCf5xJUoXWavgASRskM+JIsaJ/nTASKO84=;
        b=IrC7UiEAC5Owf3pxqIwjDw8VVlc9HyFALXPHYSdmykqqQcd/6i23sVqn026W7m+8/g
         uYdyUisOJZg0KRTxLRvOl8SbtWQqZ6zgn7Ap49rpduSv0KgFJBmIOtnuqAoEs+6AhcgQ
         WsYjWwJg5LHxrCC1KdmuP4MIhkBycAI1wvgBDYZ/kIOQ6uSEOKffgzhV2NHv8fFlpr0Z
         yNUwGyELsMmxZ/jCOxijFBE/9W85Z6tZhaoTWZTg0Cav9XNUHNg72pT3E/vCgJwgyoNy
         7QgrK4vNyUiTLLMoW4ynlZHahb+es3WLpWPJoTt1t8BBt6idJ52OT+fkSdxPOkSMP49p
         KdgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775478129; x=1776082929;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8VseLj579mCf5xJUoXWavgASRskM+JIsaJ/nTASKO84=;
        b=YAhr41ikLvFntiTI4QWrHWAQzerRqz2ykuRkhk/T5Qr5Ma3WWkGCGd1MLg8JPa1i8K
         Buk0opHR3jO9yUiuhZzeUOLM7svERV2uIXR8/4YBMXOeDJJQ/lLAtbkTX18e8vlD7L73
         e4xNhUwJO6mws7I/i3+9gqJG3Usb3uZaBK/8X2KUxNIQmFfzJvrPZj4h9SESoFfK2JLn
         0F3Si2KPnKTJ8MRxOnYt7VQLih7DnefgGjuxTxcuW9vTjp8AD+3JyLLWX5rgc5XY4zap
         mB7zMiPk/p1M/tpUzkwrsi/bVMxAkW8cmFizToRnFPuue8nDGlD5QEXRPJb5GMnnBGG4
         SWNQ==
X-Gm-Message-State: AOJu0Ywuit1hW4fBVpNYEznWU2HNqK9EIat7BWN2BfKKApKgpUuaVylR
	c2WA5UbiWRiq8+13YZ4E8IQMZtjBnBgadspeFbXctpTOewxd39NbFL5F
X-Gm-Gg: AeBDieuhXDV1iNQadxaRFbDMSNKomRCprIkrHcpPEUfhgLlgOiIWuJeFXMkP4+IdI49
	+wgbtPZoDet4z3npC0URuNvz6P8JIG7jTMbqSZ3NTjn8a7sXLgpXhUjUCZ9Uvu8I5MqG+L2Orel
	OJ1D0a8inb5moKDVY5Urm1EdTxaMdgR5jNddgjUmyVfq4Ryck/s3L4YRneROqjEWhliocPxYg2c
	Xvs6/hOQJ8nGPtxS0+lwLITTZp6XQ9PFCupP9YvF1RVmtM6zU90BrjPixqpnjnCUuWF65WO5fM2
	R2TRJ9+ik7x1zl0AdBbNP8mW5XMieCRW4/ztIWMdQWJMiQtFbWPZmZ9W92s4V7HUmxh24vLsDIV
	QncqKrTLZvWKdEBfRnjtmvMGDZBLrYU1RMQ4+G4bKU/mVj7kvpNLbk1Z3RJNM3csZxuto5MvdCk
	Bc6pcaWrVMyHkLadVKs9QEFfIc2TGdj6CeHVWmTnYsXdYfHmGvtg==
X-Received: by 2002:a05:600c:3b23:b0:485:17a7:b9c7 with SMTP id 5b1f17b1804b1-488996ecd50mr171236535e9.10.1775478129078;
        Mon, 06 Apr 2026 05:22:09 -0700 (PDT)
Received: from SMW024614.wbi.nxp.com ([128.77.115.158])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48899d1c148sm138541595e9.5.2026.04.06.05.22.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Apr 2026 05:22:08 -0700 (PDT)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Tushar Khandelwal <Tushar.Khandelwal@arm.com>,
	Shengjiu Wang <shengjiu.wang@nxp.com>,
	Daniel Baluta <daniel.baluta@nxp.com>
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH RFC 3/3] dt-bindings: dsp: fsl,dsp: remove descriptions for common properties
Date: Mon,  6 Apr 2026 05:20:25 -0700
Message-ID: <20260406122025.4515-4-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260406122025.4515-1-laurentiumihalcea111@gmail.com>
References: <20260406122025.4515-1-laurentiumihalcea111@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

"mboxes", "power-domains", and "memory-region" are common properties,
which should be already documented. As such, descriptions referencing
old .txt binding files provide no additional information. Thus, remove
them.

Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
---
 Documentation/devicetree/bindings/dsp/fsl,dsp.yaml | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/Documentation/devicetree/bindings/dsp/fsl,dsp.yaml b/Documentation/devicetree/bindings/dsp/fsl,dsp.yaml
index 65ed26aa3308..d483a229c292 100644
--- a/Documentation/devicetree/bindings/dsp/fsl,dsp.yaml
+++ b/Documentation/devicetree/bindings/dsp/fsl,dsp.yaml
@@ -44,17 +44,10 @@ properties:
     minItems: 3
 
   power-domains:
-    description:
-      List of phandle and PM domain specifier as documented in
-      Documentation/devicetree/bindings/power/power_domain.txt
     minItems: 1
     maxItems: 4
 
   mboxes:
-    description:
-      List of <&phandle type channel> - 2 channels for TXDB, 2 channels for RXDB
-      or - 1 channel for TX, 1 channel for RX, 1 channel for RXDB
-      (see mailbox/fsl,mu.txt)
     maxItems: 3
 
   mbox-names:
@@ -64,9 +57,6 @@ properties:
       - const: rxdb
 
   memory-region:
-    description:
-      phandle to a node describing reserved memory (System RAM memory)
-      used by DSP (see bindings/reserved-memory/reserved-memory.txt)
     maxItems: 4
 
   firmware-name:
-- 
2.43.0

