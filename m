Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7792495523
	for <devicetree@vger.kernel.org>; Tue,  9 Jun 2026 15:54:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781020489; cv=none; b=cm0i/9Kpw2ga9TBpMlW9Qq51NiOasUGsxZcYbmlEJyKwTPkVaGOI8uLwF6RdUA8vShazqn2rR4XTaIK9zrGoy0f3gXfeWdMWpo7PVbJG3WPWE8eyld106MPeUVo/uDl40Gi+EJ8j0GkAVV0kJBmpjyl5ozGCBzSbkbYvGrifGnY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781020489; c=relaxed/simple;
	bh=KhTvHbRmKUEXS+WXMzh2xQpT20B+xE8lLutqnW0K87g=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=UUIVlO+lnS0Q7b0aw1GXYaWgxlR1QnKPRvYMH3kSAIKkv8OGgI9cU773wOI7x65eneKSD1b6IwEdt5Ab/58igHBSRwbklQNK1/PzrRQmtJTB5CD9PdaFuoqH1mo0P+dNEaRKXIt+C4SEa4JLP4FqI2ZSa9Hkki6NBiM/zU+ClrQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=s5s+HQZe; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="s5s+HQZe"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-490be29c1c5so73137225e9.2
        for <devicetree@vger.kernel.org>; Tue, 09 Jun 2026 08:54:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781020486; x=1781625286; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LtLhNP/JYbWvZK0JJLLTL9lcnhVPXd/ZGsnix6syTLk=;
        b=s5s+HQZeJNYJ687v9i1h7WP+QpnxYcZzyo4qjoVquvdAwh9ETVm2RvKZi8SIAy7QI2
         hDby4t/p33Mb+nOGO8IhRf8DwJdZ2Hki30/EKU8Dzw3JsXW9o0KQuTdX5HhCKvY/vFXA
         9LYcZUL4kCkbzl+ysZhETozrJZfi7ZZUY8+m9SI9QADX1b7YFMBuYXxesOR8kWcWM5ym
         swB7oy7RU/IUZlv3IscJ9YmpIokyodVHnXjffv7YpE1Eg/pAMNlChNTJ3crAy7e9rHwx
         75aXEJu9WyrkwWDlIM6KgUZpiXIyb6EZcDs2+M/R181v4vzJOj2ODk0y9eeuUPYK/rGU
         IFeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781020486; x=1781625286;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LtLhNP/JYbWvZK0JJLLTL9lcnhVPXd/ZGsnix6syTLk=;
        b=YdeU7yK1f80J7dfEU3W5hWbxoyYtr/SCxbUC+DH57x4R8M7lwvlZDa10byyx/8aFFG
         g3SpNJTU2vg+qwSsyaGxcQ32y2zy5SztUrHoxcInIHUTOJMMz28+wOjDAu4F51M0zxed
         GuLxLR7dh4f1BvACDsaSDyaJFX6O0R0RlRYvJUKsmfW/QxVZR152UPkqeORsv/p3rKCD
         wHsgdPXPMe52NSwU6x21mojl/jfYFa02K9m918VJg8MMP3BjnsBJS3PZEnZciemE461d
         CCQaZl04pRI2NRBqcEl7+BSV0m0owJ3cAiElcZEotwTVoy/TElwVWiwqhkU8i30h8AVf
         7JfA==
X-Forwarded-Encrypted: i=1; AFNElJ+Ru/EajmRqqf/diOgTPZX0rOuW2mg3LiL4V3JFEii5FZS02V3zz47IGy/Wrt9KBnv45MkmeuuhU+Dq@vger.kernel.org
X-Gm-Message-State: AOJu0YxSQ6HSfJWLBtWtdSHQG7khKV6CXKtwjBdSwsThFTdBEpcfcaAJ
	mILLNWa+w3ZK4wDUEbCL4FNW/+uTgDuoXmbHHnUfLowiWeMs341689Lv
X-Gm-Gg: Acq92OEojMV032vu+owzOw6lQqBztwRgPe0JmFWR8vwU3BnNOsF2eouXr6XtH57K815
	o1yfbLIsafsySDcHYjOJbF+f0FLJLmIcE7KKzuIXO5/lQp8gKoIj0qs3PVRmRGZOJmDZoqPEZW7
	p/9HUwz/NMCzX2qafBGSHTY6a2pkhwQ9DK5qGyU7J23nWHj6VdXMg8UHiE2MBC8a6rXEny3TqWk
	xY82p+mSysoQsILfReRSMrsy98cyaXIo0e1B86vqJo3ralo8rOxNsq7hOTwIQO7atacxfVR7L/i
	RIPpPlKXVNIe1vQ9bvKLEtdAuvMga0yg8UmvFqBfHpdFxjPN8pb99R6H3rHt2de91eaTxpfrkdK
	gQFDiYg7DtkNITh9bGjhNdUspy6tvIAUpFSC89rONoo8nfEpgop3qDfosRTU4a9QYtnkRN5zvyX
	/Oymdkvh6v9Z20j8mBHmFBiaO466A7piOXUA9OoN+hiUsK
X-Received: by 2002:a05:600c:5248:b0:48f:d612:3c4a with SMTP id 5b1f17b1804b1-490c25604demr339249455e9.1.1781020486137;
        Tue, 09 Jun 2026 08:54:46 -0700 (PDT)
Received: from taln60.nuvoton.co.il ([212.199.177.18])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490bc3d663csm545506645e9.11.2026.06.09.08.54.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 08:54:45 -0700 (PDT)
From: Tomer Maimon <tmaimon77@gmail.com>
To: andrew@codeconstruct.com.au,
	broonie@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: openbmc@lists.ozlabs.org,
	linux-spi@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	avifishman70@gmail.com,
	tmaimon77@gmail.com,
	tali.perry1@gmail.com,
	venture@google.com,
	yuenn@google.com,
	benjaminfair@google.com
Subject: [PATCH v3 0/2] Nuvoton NPCM FIU DTS fixes and binding conversion
Date: Tue,  9 Jun 2026 18:54:35 +0300
Message-Id: <20260609155437.3285042-1-tmaimon77@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

This series fixes the in-tree NPCM7xx FIU controller nodes so their
resources match what the DTS actually describes, and converts the legacy
Nuvoton NPCM FIU binding to YAML DT schema.

Patch 1 drops the bogus "memory" entry from reg-names on the NPCM7xx FIU
nodes and removes redundant clock-names from those single-clock
controllers.

Patch 2 renames the schema to nuvoton,npcm750-fiu.yaml, explains why the
direct-mapped flash window is optional, keeps the requested example
ordering, and simplifies reg/reg-names to the ordered minItems form.

Changes since version 2:
 - Drop redundant FIU clock-names from the NPCM7xx DTSI together with the
   bogus reg-names cleanup.
 - Rename the schema to nuvoton,npcm750-fiu.yaml and keep reg/reg-names
   immediately after compatible in the example.
 - Explain why the direct-mapped flash window is optional and model
   reg/reg-names as ordered minItems arrays.
 - Drop clock-names from the schema to match the driver and updated DTS.=0D

Changes since version 1:=0D
 - Drop interrupts property.=0D
 - Drop unused label.=0D
 - Keep reg as the second property, followed by reg-names.=0D

Tomer Maimon (2):
  arm: dts: nuvoton: npcm7xx: Drop bogus FIU reg-names and clock-names
  spi: dt-bindings: nuvoton,npcm750-fiu: Convert to DT schema

--=20
2.34.1
