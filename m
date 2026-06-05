Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F37840626C
	for <devicetree@vger.kernel.org>; Fri,  5 Jun 2026 06:29:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780640950; cv=none; b=Pkpl9zDMAE2H1R82WEqh5/QCbWFP9ST+vwSOwna9w4l/IWDpdbEzhC5datCmjZZ5s6xF0Ee0Fh54WDiJYTTwVonza29BVfUXPUJpA9aklZUbglNd8pWs6QM0F2Pw2V772tmbrT5f3DI1XF5i2HHFHH+u/q51DHkBWRMOyFZihHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780640950; c=relaxed/simple;
	bh=5Uzl29QTCrj5VKD83cW4UxcKrN9I1xXI5DXz829aub8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=I+X2hyFYRooNP63kgEWK0rKta+w3VGtiE1rzIpHiY8CwSyreIO8Q0mNn+Lg09OWhhd0MNUuSsvp2r7uTmTdVBFLA4yb1QtHaKCWoSpJ3I6qnvbYiIAHO7e5VoBlKHjwDFNuU+nXxqak6ZDIXeByiOut3wgvQgi+KPUV32R8bIjg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=fXpGuh9Z; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="fXpGuh9Z"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-45ef372c58aso872504f8f.0
        for <devicetree@vger.kernel.org>; Thu, 04 Jun 2026 23:29:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1780640948; x=1781245748; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XAn+sgOJ//YpFHFCj3wQ7fJwCRmUnKUhDxx0gbmShJo=;
        b=fXpGuh9Z2p8N6dqKd5QHbR5UFUDija4VDrQ0ILmH7UnakkXePnVTwbzCL68qUAIJsD
         tlAkMShMqnIJiCsPGvLHwPiGR6+mwCid9frX5Y+CWi03RBrVwcrdkQZP82FY25Sw2AIY
         gUeiCmZPBs37YNogsx1/5xYnamqggLQTW2fs4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780640948; x=1781245748;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XAn+sgOJ//YpFHFCj3wQ7fJwCRmUnKUhDxx0gbmShJo=;
        b=ktp6hKNDnbDPctnKUftNOwlbCndGcgTKvkure6+em+WlkW9M1Q7QeLdatB7q587Kfu
         JETZ87VG97a4oiNF73gtRpksqkXzDG5HUIlf+RkFW7S9D92xyRtHlZF9zITNCd9rfXqB
         ezmMCsKi6EHCT2s5DQy128sB/TAM0jjBpe7Oa/mrRm0v58evZju0Kv4KJEpV7JbQsr/H
         Bz8ThzSB7jsXBGQu023RvPyF+45zCKVEeYA+V0qxJrgKRzH3azHldMe93O0+gXgwgLtv
         Ou1diK1vj0p4tYadgm+l+Oq5UD36cz+XUeZuR4w1aQr5PchErJV6cRju9Vu2CRNNDRQg
         0Sug==
X-Forwarded-Encrypted: i=1; AFNElJ/ms1e4J7KUt38Lh6treKkYt/ShmNlIJaFyA3vBotAsEoMJyu7OBo9VAgImGsCWP14pksBt/bpO5Ou3@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9mfniqKbKXKHXlXc0gAiarY5Vz3u72V5MplHfOilTZbfSPdJB
	dD+KoweVprhu7XMAe8mF4hBOsRJ+oDCXed6PsooDL8qoLjLffsYoY4tNYeeYzoreTr4=
X-Gm-Gg: Acq92OG1A2KECMpYHu2WBabKuUOAtgJ0rbg4CGhRpEgJ1Eo8Vy7hGh09jw0AFpw1JER
	vE2MQEJ06zNJUlS0Aj1C2k3orzJRiHd9VGr5BCqdfafMIwEm+bQ335qgvmomZMivr27xku1GhqU
	x5J1WBv364kELCUk48yTFEWD66Cfy1EmdwQxk8Ph0fmKUYd9UC+4o8WqL+HTMNMwUdNIuSoTZcU
	yWaK5opuz4mrkBwxAitWGNQtSaPMJBhUXfRPodjzN/ymoSPZq2LIRYyeFaJHtW3a2sS9LNHlyNM
	HQBqqsk5H6ofHdvfGPeBJvUiDpan7Qm56pBkabNPJ5SiXTrMDHts9mPk7/7y3qmFBirqB5ZJ/vm
	/0DxZGqTqPOQuDYVnA26W/INVvYVJI60nOqI/idSY+zkAXpHZs+aOGoP6Gt/0Pzqbhv/3WvrlLy
	dksQWUPHW1aIGIauqnh2GiZZe3+buSFOH8uZXqku81HAhIUGUhPiqdpahmAoKjHqEJO0Did9E+D
	PK931+Vb0gf/oDRPYozEBFxrz4FDylIiA4qiyNkvbYFrzYdqX6ANI/HgJHBjJppzkVLn0BPnhmo
	ayitFB5nmKTzoC4RT6d0xYVX8NgopBNae4E=
X-Received: by 2002:a05:600c:3f0e:b0:490:b3e7:4614 with SMTP id 5b1f17b1804b1-490c25f9e55mr28705485e9.25.1780640947625;
        Thu, 04 Jun 2026 23:29:07 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it (host-82-48-44-238.retail.telecomitalia.it. [82.48.44.238])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f344148sm23022648f8f.19.2026.06.04.23.29.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2026 23:29:07 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: domenico.acri@engicam.com,
	francesco.utel@engicam.com,
	michael@amarulasolutions.com,
	linux-amarula@amarulasolutions.com,
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
Subject: [PATCH v3 01/14] dt-bindings: arm: stm32: support Engicam MicroGEA-STM32MP257-RMM board
Date: Fri,  5 Jun 2026 08:27:29 +0200
Message-ID: <20260605062900.368376-2-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260605062900.368376-1-dario.binacchi@amarulasolutions.com>
References: <20260605062900.368376-1-dario.binacchi@amarulasolutions.com>
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

