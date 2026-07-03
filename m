Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4757F3815F7
	for <devicetree@vger.kernel.org>; Fri,  3 Jul 2026 06:51:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783061494; cv=none; b=E9EgYueTaXPtq0aDev1s/NbDytXwrfHfYDKk23/NssLklX8EEG3w2wYtEw7TS2UFCR8MCrPl3KvMBmF+KXTnQggvABLnAjahFgquyRWljIesI4b9XXZF14fhP5HHdoZfBCodvrwdMpq08TsepmbHMI5k+b+9/2wgQ6TqaevvV/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783061494; c=relaxed/simple;
	bh=5Uzl29QTCrj5VKD83cW4UxcKrN9I1xXI5DXz829aub8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=F61DHGBHZROciC/jJnu8b7MdGXTu2U8hu3TgLTcg0B7iYkRf1p4G0WSvIgvomaCWaQJLo4V+JC/LIHEqzLerV4wUIe6nqJ3ulLagnyCoBmWHcqF+TsrA/plZ6EaM6qTeWWcax+uddYk9K0wu7TYuS+Q/j7wWw7kHCMKR4/dOaZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=XO2TPUbm; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="XO2TPUbm"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-6986578d8c0so330239a12.1
        for <devicetree@vger.kernel.org>; Thu, 02 Jul 2026 23:51:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1783061492; x=1783666292; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XAn+sgOJ//YpFHFCj3wQ7fJwCRmUnKUhDxx0gbmShJo=;
        b=XO2TPUbmPGTrJYBmiTY7sIKowPqDpu9G9ZmT/cfYpZ69mHFKLcleBZOuTqbeEVLiLF
         cADzSq2AeAsrz9hclkjdIf0wCSaEWzBZGxOiePFXOsnRZsH3Mo6dFdp6q1hFcDW8xhnV
         waO7ANPYxgX+GF/NM5hWRdK5VUSwR/epbqgrw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783061492; x=1783666292;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XAn+sgOJ//YpFHFCj3wQ7fJwCRmUnKUhDxx0gbmShJo=;
        b=kaaFXSEW/5T/IxbsKey9ERKflO8hjJ/GyO6J1Uam4aF4Lm//F1W1bw5sIhFJ7TfRAq
         H8WBhVoiBCNipPnyM3kXad7mFP4sthz3HTGciIFjswhQ3ipbex1I/WdWVPRFpos72dYh
         YLw2Do5lE0zGC7Zke0JVW0XCfI997b9p867iiDQPSLcH8885GZzi8craDoIYgvAm1ibU
         BdRdwaYHG+DD/4mdcQNHBszjT3pq4M9kphrVjWAVt3kqWmqsoSKXk+tIVh9u2oSXFj4K
         NPxUdytlj553p2hGpMGkiGpM2tqa4MOVLCnxr1fbYyzdmou/qVfGpFgbS/p0DEu3YFtd
         OlOw==
X-Forwarded-Encrypted: i=1; AHgh+RqQp91zoyh2125KZoC8PJ4DgVVYM/r5Z65FsXrnmqvuySKLYnSlxMa/T8GKKptiT5798CRxMR/3DqUQ@vger.kernel.org
X-Gm-Message-State: AOJu0Yxl8ZUn4lkf+5/Qqn3N99XRgXvRzIn2qkyI15QEeUv3WXuIMpIt
	09AFeL/HJNXxCWGDes0DsjGrAvUglULXYU3vVFX4IJPE8Lz/aMyWBZ0ofsiXWGmgjrY=
X-Gm-Gg: AfdE7cmQhcH2Q5wcwvbudLuH1/K0GOiUluXGxBKdbBDrQHYrX8Fv8ga7IWAr9WoePGH
	XH+yIreLC1BKAuxkDxZDr6Zf2bj3kgLxuyvElyoezQ+r34353ZMZvuWkBap7JsaIPrpB/zKacRr
	x7PVSwoyH7N/um4yVE01vbZLUDReyZWOrBgTPgcATifXd6puvM3/qzCjt+kk5DlbDFTvFL70VzI
	TwkwP9BpMjeRVJdqde/0STsv1YV3X8LLzvaR5R8Ydex+av2Mh1WS32EcpiRSO0quNuVhTWO1fxr
	EjprM2egyJJAeGO9ZxyobgwPOi9R7ogikFnvVk2NKa9hmnBMIMUuMYLs3t3E87oHlpoMmkzGP9z
	uc0K37JKE/7X+FYZWU+ATX0m+skwX/tvTgZJ1ffTHHs41tdd9OVAVYrN6zD2s1JgVvcA049wDG8
	uN6kY42X3awF1yKkL2yAQB4Ei589wmKA9kDBn7/bZHn0JAPfUoK+RYnyOkdx+QPb/oNapeCWJsv
	UBqogW3XP8=
X-Received: by 2002:a17:907:c589:b0:c12:4988:f0ba with SMTP id a640c23a62f3a-c12a9d6ba2emr442460466b.11.1783061491651;
        Thu, 02 Jul 2026 23:51:31 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.. ([2.196.43.95])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c12b62c4695sm235462866b.44.2026.07.02.23.51.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 23:51:30 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: michael@amarulasolutions.com,
	linux-amarula@amarulasolutions.com,
	francesco.utel@engicam.com,
	domenico.acri@engicam.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Amelie Delaunay <amelie.delaunay@foss.st.com>,
	Christophe Parant <c.parant@phytec.fr>,
	Conor Dooley <conor+dt@kernel.org>,
	Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: [PATCH v7 01/16] dt-bindings: arm: stm32: support Engicam MicroGEA-STM32MP257-RMM board
Date: Fri,  3 Jul 2026 08:48:51 +0200
Message-ID: <20260703065110.1433283-2-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260703065110.1433283-1-dario.binacchi@amarulasolutions.com>
References: <20260703065110.1433283-1-dario.binacchi@amarulasolutions.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add devicetree bindings for Engicam MicroGEA-STM32MP257-RMM board based
on the Engicam MicroGEA-STM32MP257 SoM (System-on-Module).

The use of an enum for a single element is justified by the future
addition of other boards based on the same SoM.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>

---

(no changes since v2)

Changes in v2:
- Add Acked-by of Conor Dooley for patch 0/1 "dt-bindings: arm: stm32:
  support Engicam MicroGEA-STM32MP257-RMM board"

 Documentation/devicetree/bindings/arm/stm32/stm32.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/stm32/stm32.yaml b/Documentation/devicetree/bindings/arm/stm32/stm32.yaml
index c6af3a46364f..c5ce81e3ce45 100644
--- a/Documentation/devicetree/bindings/arm/stm32/stm32.yaml
+++ b/Documentation/devicetree/bindings/arm/stm32/stm32.yaml
@@ -203,6 +203,13 @@ properties:
               - st,stm32mp257f-ev1
           - const: st,stm32mp257
 
+      - description: Engicam MicroGEA STM32MP257 SoM based Boards
+        items:
+          - enum:
+              - engicam,microgea-stm32mp257-rmm
+          - const: engicam,microgea-stm32mp257
+          - const: st,stm32mp257
+
       - description: ST STM32MP235 based Boards
         items:
           - enum:
-- 
2.43.0

