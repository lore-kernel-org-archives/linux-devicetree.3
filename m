Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com [209.85.167.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FA6048D870
	for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 13:30:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785331823; cv=none; b=uY/uO7qqGamrRBqf/x6R2H5VmrS68Q+xUgu/CFyqID5hc7KjUe/D79ifDXAT8LIUBiqpKxv84/NnCCO8E3Rcb8hCenTV5w/ZTgCA3hVmIvXe731ucremMTqKGPRGtvvCWiAgLRl5C79UnGZdBSHo3x9z7KZ/rju+Ue8FO1quMU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785331823; c=relaxed/simple;
	bh=r8GEkx/GQwyTcnGrrcOzeRJ6fm5ueLCYlgCp29xYf3s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pWobnOZ7D3oC9Jnj8xH6Ef1oksGQ1LzlnokiD7St9yus7LQVSIiJNJE8IlMhvUGWL/FDTlKLtOPzXbPG7MwH3/nIDFZmYxRxyVmYt+flvZRSXYtUzZWtb6sclxRU4YAkANbBWSxA4M/E5Fr3WRfQrwKzKMyzXqxrcuiCX9LzBHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=KpSDGiP6; arc=none smtp.client-ip=209.85.167.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="KpSDGiP6"
Received: by mail-oi1-f176.google.com with SMTP id 5614622812f47-4ab70b882c5so470542b6e.2
        for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 06:30:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1785331819; x=1785936619; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jywl9hNRxqX9/ziXXjY4TdCTiZ0dW2gF28EYukBVWGU=;
        b=KpSDGiP6TszyJKZJ2lIBAnVXzhKhrQu5zRF0/EGsiB2QM/MY5jElcyt/qGD7zP0X7G
         MAbEiC1sOF3e7tK87mU4/xSJosfPvFfi5PDXeqdT4F/Lm8Ec+8oTXiy8DT0vLdKp0UkN
         btVbSrBeMT7SA0zAI6NeGuZzTsL5AeNL5dPfQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785331819; x=1785936619;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jywl9hNRxqX9/ziXXjY4TdCTiZ0dW2gF28EYukBVWGU=;
        b=fZ4a1j47CrmUsV+kM44c7ZNZdQ991H3MhGEf8oT0cL/ya6jL/XQf1yNgxUil+GqeF+
         FCmmnWntht/Td05CevqfaRe2tLvqZkP+6Mohe49rPRL7D8GI3PVfZQboP0JVvdvOpCoJ
         xfSBm0mPBGdqQcnxEqN4heLLgg14T0IYdk7wlhKgLBCtxxhLk0p3wbWvGbQF/m5iFiC+
         ib19AmjN1SvJeXGvNH3PkYR/GJAcjcQ4Rf1+13t2eCG+fS2ua3HxaQI/z2Bh2pmZDX0Y
         iOLpoUTsoiehBeinvdneYFJKB3UxV6uW6hLSkUw1QUjVHmwNn3LNBt0mT9yYqA/tVF6e
         B35g==
X-Forwarded-Encrypted: i=1; AHgh+RpfzY7GKUfrZ8++whcQCY0Y63l/nwwa4S4JK6PLr67ko1b3ZsY270yPJTktP3YbX4wp1n9ZrdawZpIx@vger.kernel.org
X-Gm-Message-State: AOJu0YwxmWChGAg8gIMnlHr4hWfChCrK0LvugBAnmEuunufNPEs+eqCu
	b7CbbTBzzdf4HP34mXopdk7iSa4F0gJkW9qXde3Fg95fjhABOO9oP/XAPM8I2dOZ8Q==
X-Gm-Gg: AR+sD10gocLUF5UWK+a3NEhGzXk8PIVU+/a18I8ltxasnE8g2mWQw7ISu3kxE0JdsNM
	kn1kjUd8JLVEtk9J7HKND/G5RBzE1XwtolZGoma6RU8ZUpNmjbZU9nNTgCOJsKHfJWFW3B223uQ
	mmSZU9Iz3hrXIxBb5Hpu1PnMrdEuWQIjbxdoaVBgINq02b5OWdlJC74p0FtRSN23IQ7uWTskzFW
	sWHtjIy+votp6+jOxrCNfza6pGnDd25hExPhXz38T/i2sZ1fJ5t0LM18n4tkJOgNvyuUaJ/XigD
	4PUyJsxvx7fp7OwMGSg5lhsARgZxjR+3wQiflsmDEB58rGJvXRM9pQy9vkX3b5I6OI7Oq7oRfA9
	K9+K4+g2bj/SSkI9p2OyM75ReQpnReyFwbqQVtBFiGEnFmUmD9YynAomPMGWW4qg+3Kd41VnDe8
	2WSiPKzPuiRJRCuFZEvEvRH2GH/Qai43CAFS5BWgfV1ZoS0Qza77CKFco=
X-Received: by 2002:a05:6808:17a1:b0:490:315d:e0d5 with SMTP id 5614622812f47-4ad5b9dbf94mr4510454b6e.16.1785331818689;
        Wed, 29 Jul 2026 06:30:18 -0700 (PDT)
Received: from chromium.org ([174.51.25.52])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4ad6ef5d650sm1712932b6e.9.2026.07.29.06.30.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 06:30:17 -0700 (PDT)
From: Simon Glass <sjg@chromium.org>
To: Linus Walleij <linusw@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	Jonas Karlman <jonas@kwiboo.se>,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Conor Dooley <conor+dt@kernel.org>,
	linux-rockchip@lists.infradead.org,
	Simon Glass <sjg@chromium.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/4] dt-bindings: gpio: rockchip,gpio-bank: Add rockchip,grf property
Date: Wed, 29 Jul 2026 07:27:26 -0600
Message-ID: <20260729072727.v3.2.d04a89a3849323a0dcee2c701cba43adbb0523b2@changeid>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260729132736.3807082-1-sjg@chromium.org>
References: <20260729132736.3807082-1-sjg@chromium.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Some Rockchip SoCs, such as the RV1106, give each GPIO bank its own
IO control (IOC) register block rather than grouping the registers of
all banks into a shared GRF region. Add an optional rockchip,grf
property to the gpio-bank binding so that each bank node can reference
the syscon for its own IOC block.

Signed-off-by: Simon Glass <sjg@chromium.org>
---

(no changes since v2)

Changes in v2:
- Add new patch for the per-bank IOC reference

 .../devicetree/bindings/gpio/rockchip,gpio-bank.yaml       | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/gpio/rockchip,gpio-bank.yaml b/Documentation/devicetree/bindings/gpio/rockchip,gpio-bank.yaml
index bdd83f42615c..774e9c7de606 100644
--- a/Documentation/devicetree/bindings/gpio/rockchip,gpio-bank.yaml
+++ b/Documentation/devicetree/bindings/gpio/rockchip,gpio-bank.yaml
@@ -44,6 +44,13 @@ properties:
   power-domains:
     maxItems: 1
 
+  rockchip,grf:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      The phandle of the syscon node managing the IO control registers
+      of this bank, on SoCs such as the RV1106 where each GPIO bank has
+      its own IOC block.
+
 patternProperties:
   "^.+-hog(-[0-9]+)?$":
     type: object
-- 
2.43.0

