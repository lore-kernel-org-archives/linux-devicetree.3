Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7749E3128B6
	for <devicetree@vger.kernel.org>; Mon,  3 Aug 2026 07:42:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785742955; cv=none; b=Jm1T2kx2t1U0ifUU0r2TCSrLZbmqgtytmThHbZS+D58JjPEviHqVF53xij+j2DnWMJcylht0zC3mWGNqoPDSsA/jqhN4hVBq7EcvKtVi88z3wJiR5zqJtNHpYuf3jXWkYZEhGMFsRYO5QVzFN7ZUsUfPmD1S5NYK/S9F6eUhFo0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785742955; c=relaxed/simple;
	bh=5Uzl29QTCrj5VKD83cW4UxcKrN9I1xXI5DXz829aub8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=X7cUoFGq5bHyHepX5aWRlOUToke7BQNT1qDH/uV4/dFGAVWVhmViQHrqgTSn/UZLQmU3yKiRN7CGkzL1zC8hNIXh4i2n2z+iAgQkJkB2Xr3xILY+eeLoeDtqRxAuinG2a3Wwu0ssZEKp39L5tQ2eQcT4WwJdBZCzuh6HnmdWew0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=IWV+GBKz; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="IWV+GBKz"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-47f84023916so3069475f8f.3
        for <devicetree@vger.kernel.org>; Mon, 03 Aug 2026 00:42:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1785742953; x=1786347753; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XAn+sgOJ//YpFHFCj3wQ7fJwCRmUnKUhDxx0gbmShJo=;
        b=IWV+GBKzeiea1eeiAeAAkYwagp5CdkawOD3sNnAjvY4nWZMDraukPHmfX5TUP1/7t2
         bPYUTUex20uXruOfcaJqvA6qzKoNlr1fehNTatPGNVwI9p+5wmauOeqPcd2sGBqqq0K2
         MopyoXxz4bPv6fxarTaVR90+d+o0hjFu9OSzM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785742953; x=1786347753;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XAn+sgOJ//YpFHFCj3wQ7fJwCRmUnKUhDxx0gbmShJo=;
        b=D8WaJYW9zDzJFAQxKzSgfY4wevvKIhMNONEq3dDV6gtnc7kiu1XqxlUvtd6ZowO/lP
         QlvUGn4KWA1utXqxJktmWg7fJ3LF+5RAuIzeUdvgTEGlKCNmUST+DI6Rhi0mxXWbwuoA
         u4q22aJ83ZtOYWp5B5JM8UlNH6qriTzg0IzElvM8dBdWE6x7mAfA/Yd4EQw026M7SP2B
         nXNr+f8evbFMsDR9bI13rd0uS843DsQnN1CpvKvhIurMLeWGqa+vEXKtIczXOR2bZg5i
         v0WiDRAIQvafiHfhFDTQojLBLgXh1NLePBSo57xm/Z1Q2ujx5tmSRKy3tdREX+z6JvSQ
         z16A==
X-Forwarded-Encrypted: i=1; AHgh+Rqn4jRH5fC3ineYRBzX1h/Hgbqif956TmtjxMLtsqdzQskn4m0oXhj7EjshglHnOOoNSTaLGdIPo4+b@vger.kernel.org
X-Gm-Message-State: AOJu0YxedkrHC1Re+FK/tm3TySdjSVpNzjTXoqQUN9p8ZGRUbWvb1nwE
	MI/uG6VzNkon3B8KetQN9mwf9O+0s4IF28BxU97EtTmbrQHtLZB+bCH3aPzlYs+bFcc=
X-Gm-Gg: AR+sD13cDe5rzm3ga8j1RcncvLRrgczytIcK53uKLY3NlXsvCDziBhEcDa25ihrr17T
	u+jbyoSW9tl9pjXG+y2/rVeAeRQYjwS4QijB6yr9FDgjQQOtunzq2d22IRZX7TTWaRryKrin+J2
	YdeJVMAJN6+jJ6Vt1lzEXhny4AOv6GLPzwMayJVIgU1Wy5NcK33V9PjagT1oqZRiyDrsUIl57Hj
	hiS9tdL8jlJx1aedjWePR24QlAa2lkYcajNZGm8RPWk97MynGmpu51Rfu50ZQH1UdolDLqEAYWE
	s7SDeijz5vIwSAcZA3YjnAG1oz4jxbTfRl2KFzccUrGUvyk8GEexgWkmnuOZLEJrXdW8Xx3Z0Vb
	pThqCHqqgvuMZ9ip3dsD9JaVmRDMhg1f3Ov1DVxf1LQ0l0vsnvWzKvoAKS+ZXMfBmKArDEcd5n3
	EhL5QHPMfaJxRoNjyFrDMrgkYx/vq+NDHeAhncUnRNVBqnEdDynLmqC4rv7FFwgECJe2W6hDSeq
	rwwc0z5PcjQ+pAtQ25+gzGAAERdz9P2Yh0vrk34ff7kOywx1Z07i86ZXvnT7gzKRiO1K/DlIYIB
	S0InutuckoRHJ95WD/NpBhgRQnx6Y7aAPD45OWf2iD9IEAs2CFklQKskIk2/pYT6
X-Received: by 2002:a5d:5a04:0:b0:47f:6fe0:294a with SMTP id ffacd0b85a97d-47fd72dbb97mr15447164f8f.23.1785742952786;
        Mon, 03 Aug 2026 00:42:32 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it (host-79-17-119-233.retail.telecomitalia.it. [79.17.119.233])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fd41d1a58sm30370503f8f.7.2026.08.03.00.42.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 00:42:32 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: domenico.acri@engicam.com,
	linux-amarula@amarulasolutions.com,
	michael@amarulasolutions.com,
	francesco.utel@engicam.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Christophe Parant <c.parant@phytec.fr>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: [RESEND PATCH v7 01/16] dt-bindings: arm: stm32: support Engicam MicroGEA-STM32MP257-RMM board
Date: Mon,  3 Aug 2026 09:25:56 +0200
Message-ID: <20260803074224.3821911-2-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260803074224.3821911-1-dario.binacchi@amarulasolutions.com>
References: <20260803074224.3821911-1-dario.binacchi@amarulasolutions.com>
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

