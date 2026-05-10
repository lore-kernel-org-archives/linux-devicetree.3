Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E04C2F9984
	for <devicetree@vger.kernel.org>; Sun, 10 May 2026 20:16:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778444212; cv=none; b=fL2x/Ef/EDoCaEaIotN5YqrswxsORGA0N1Q+GAReQhy0bCoksk+RmhYf3xUraKFmnbzkwIdjwKfAfWEcYn1vHi2FhreJhldlx4zcPujTfIlMUeSwmG7iSubKQGeTF0m6tp6erWi1wzWU1YoYgr/3IZB7WKZXlDDlL5V6urJGkXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778444212; c=relaxed/simple;
	bh=OWCEmsRz0qAl88C6oETHRWXimfKd+7tWIWARlti8lDM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dhBAnl5h4WQuQJE7LDa1gWP9mqLkbdVSmJvZgxhimPJEoEQkVOGdwOuYyWiM6lNsuFM0thYXNo7zgg5aXtuSnd9fBDdrbV4bt1mPnhwPznbWQ7nNCyybnYEUVPuGVkPf8Ba/QELNIZsindcMi62FEqEsjnT9OY/dD0DRrRmla8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CKnNzCOX; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CKnNzCOX"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-48896199cbaso33151165e9.1
        for <devicetree@vger.kernel.org>; Sun, 10 May 2026 13:16:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778444210; x=1779049010; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Qekc3CBVxjBSgzBYIYcZVSh3VYMZermzOtzi6JTCBsU=;
        b=CKnNzCOX+JV4+H4x/vJCgqp5mJD1Ki6303AC4hXDWMHSS1/uwwVt5X3Tw3x3z1qnSG
         ELon0aKotBqcjeSM93wVEPQzOOguObsdggsyYy2x8NwyceZ7Gx0wWSGco9vuMgh3TLBH
         jbyYfd/p2qOgrO/JzZCJXsv/O0u6Nri2r4PmG69mOfAEctT0FmNrBXQjLynbSHdcm8Hl
         jypZn6JIYm8skCAx8vs8sSPtSip29Knw7nkAuiCE0UwsFPx8WMOoTL3LgePCWbVJB8+P
         6c+sHi58ePFdz98ttaAJcP/Qz8CMFNmuU6Ds4u36oN5xvlFE4KHbpRrHXl/0qNJWfSmI
         BoMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778444210; x=1779049010;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Qekc3CBVxjBSgzBYIYcZVSh3VYMZermzOtzi6JTCBsU=;
        b=HSUQ6VCiBRvlsNgCgCpMspOKX7akifChxQLyDLZwai7hyGabuswgo58hYWXjin+lHQ
         Qnfyo8+shjMnP+mEwiO6559Bfk69p3nOsWX/ELOhX1tBlPLMRiThp9PVnk3grEgvHfbW
         FKkbTmxXQvZb2CNvb2emkgM1DujD2kFfzC19+UXf22Qb8LslTtDSgHBCijBxxXuKuDwV
         /JvmzAhOyi6pUcL9y3uDQxQNuB5ZS0lGJPZrPtEYmRN7/Ox3f6ehKlQr4pzqEZPsmc38
         P4bTaNONrrdGIs7ke8T8mj4MnxjaEfJjnTAqy/gSMsAkdN+Wr9mZLlNfg16bKnM2kxUa
         rQTg==
X-Forwarded-Encrypted: i=1; AFNElJ9bwJuIV1qmxAhmJsBKC8+mSxAEmUjVY0wtv5fcWdUYrmgcx9jOemihbV8kw/ZjiY5MeUvh5kIADeQQ@vger.kernel.org
X-Gm-Message-State: AOJu0Yyxcek3SCBIUDSxPs1MMG8lIp1zjs0h5HaLXDQNlL+xPyu7uCX2
	8UsKbBAOBh7X4N2jHBcjtjchiEpfo9CjQb1wjljBERraDmTnwydOlfi6
X-Gm-Gg: Acq92OF6jio8UDq/pEK/almtMu2/gaakMW2S1TAn831ygpTpJqID29VryXxiQaDNxqk
	1o3zk7nJaCWKDWErx0BT/Wj1U+w8HiJaH1/EX8De/4dwvJL+VfqDUJer+p408yH0QW4AirrN/N2
	khN7PrzxVMT8PfwklQcS928SNvUA2eHYQyGelgiLmT+jOO29hQD42r9bmSNd6sbvToyIWhLAAu5
	t1jdW33wxV1GDv8svZaqXGr3lANLCMqSC0rl2gj0LPeOjXjjaRU6zbPpCR+8b9+jlnKsuynx23e
	QCxQW1fgJMjX4Qs8TN+pGaMjOVjytoi3aD405aZ18WdxynQAu/qvM2UjyOL9ZvdzhBMBFGx2UoA
	NG00qyTxmlFhmGQlFTtzkNw8JoUnkgAiPywjJ7hXNarL0tP1kCRGpie8Eak4wOTTphyOEfB6Nlf
	oxFpNZWCJ9iEoL0JD1j6i4wiQ75L26dUvS6e202u35f/yI46OJH+m/
X-Received: by 2002:a05:600c:1c26:b0:488:9439:880d with SMTP id 5b1f17b1804b1-48e51f5c282mr362332415e9.29.1778444209945;
        Sun, 10 May 2026 13:16:49 -0700 (PDT)
Received: from localhost.localdomain ([2a02:1210:8642:2b00:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e7040a8f1sm127667145e9.11.2026.05.10.13.16.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 May 2026 13:16:49 -0700 (PDT)
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: linux-sunxi@lists.linux.dev
Cc: Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Andre Przywara <andre.przywara@arm.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v2 1/3] dt-bindings: vendor-prefixes: Add Shenzhen Baijie Technology Co., Ltd.
Date: Sun, 10 May 2026 22:16:38 +0200
Message-ID: <20260510201644.4143710-2-alexander.sverdlin@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260510201644.4143710-1-alexander.sverdlin@gmail.com>
References: <20260510201644.4143710-1-alexander.sverdlin@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Shenzhen Baijie Technology Co., Ltd. focuses on R&D and production of
embedded products as well as customization of embedded solutions.

Link: https://szbaijie.com/
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 28784d66ae7b..095cf654787f 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -229,6 +229,8 @@ patternProperties:
     description: Azoteq (Pty) Ltd
   "^azw,.*":
     description: Shenzhen AZW Technology Co., Ltd.
+  "^baijie,.*":
+    description: Shenzhen Baijie Technology Co., Ltd.
   "^baikal,.*":
     description: BAIKAL ELECTRONICS, JSC
   "^bananapi,.*":
-- 
2.54.0

