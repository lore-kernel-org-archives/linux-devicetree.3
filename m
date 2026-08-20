Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E7042D77F5
	for <devicetree@vger.kernel.org>; Thu, 20 Aug 2026 09:17:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787217431; cv=none; b=dxU9BVhwCvAFuUOuEfE5KkFbLjwLrmhI8gbaYvEJ04XUjuyzZH2PO6jiNFenAecKbm6w9QNUzWcLX6hXBNnVLV3PjPpkyECWGDdc4U1PnZ6FCnosm/jmIiVDATRNtCPqHqFBQGdUpBB9UnJFbSAvxzKfaCz5YGHNsibIQVLU/Jc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787217431; c=relaxed/simple;
	bh=Ae5SvSLD+kTBdkNiZAhBMqiQJzAkuNxU3TIbsnGpkV4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=P5NIW0WSFGdISrnbFpw6TfROBkJTSZ8sdh6S+YfsMeYQW9zOo64KlfuKypKuKbwAaVYDmWYLiVyda5/ihwNV1loY+rRO+ujG9LUlxzQorz8uO5YsAtbcZ9yWlf3RaPM4ex1u0MLiqfmayizsHvKesPUsFn3dz1r7WlipSoeclSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=hTd8XfUF; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="hTd8XfUF"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-47f7027ca11so1213073f8f.3
        for <devicetree@vger.kernel.org>; Thu, 20 Aug 2026 02:17:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1787217428; x=1787822228; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KzDNkLWug3uH06grmI5tFaYQGaR1Dd+azs+zlMWYDkM=;
        b=hTd8XfUFtUMMTfwqaGJrbojvLld1zBg3ItrKJ52VTx61ehJBhC1Y8Et4F/znv4HXYK
         7Mr2Dfwm24PcF8FbcpAhke5gQHohxIcK+uKP69GSWnfINcWlvUP/hNZH7FMP+RA9avxf
         3TJ2llveVdhefw3AMX1RvTHjaEsSaeLxNdXfA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787217428; x=1787822228;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KzDNkLWug3uH06grmI5tFaYQGaR1Dd+azs+zlMWYDkM=;
        b=dqw9gUhYmuSBNshc+wl5qlr2OoGDZYB4vArVcYz0VLmHKtgungHNcL/6Cs6Ig/J6lS
         pgcwzdaPyfJ771fQIwGh0bAFZqfrQ3Y0AEOnnDMMCR1e9uGK3ok3PnSitV7Bt96xAVL+
         /O3kAAMCjrWEdLadfEkr4KAvcebXUa5u2y8AK0JDnV6YPffMzFBcWavSKZezA5fgZvLX
         vTXor1nLn5H9hE/740d6Hjr8VM9MedSXecSHWEK75McYjZABcPgKdtBJqk7ekMjOLC9R
         xVGKCqtD5qkgv4hgVPRhAGIvn8gPHuHIa4RFZPE5n8Kl28QmCR5D9s2eFE20QRsozJNM
         zPFg==
X-Forwarded-Encrypted: i=1; AHgh+RrG+8tTNtSIcd+ACViTvK9F/9FYpL393B6uSwhn7T9YrpmZSz30fkiuACymvvqCKPWNrJTT45dAJOsN@vger.kernel.org
X-Gm-Message-State: AFuF++kLRPzppEOelm5Zl/bMVyBKowOKHaD5i/Ym0XpfaAdm9cat0dc7
	Qx4f4cipWO854n3qQPkF0XlfJSiJbM0l1fIzt8VrWHUVp3J7cZQDCN2eZByV6GblsDw=
X-Gm-Gg: AR+sD12VCxznQvvtwyhGcGxWtmFLIAZjLbBwLTz2xJI7WYbIXjeRRWkP8c5e6xJ80Ja
	b9UDWEhuCkTFXn3N7yII2CE0rySMmr0DH09extDnA8X5FxsUjyndPZPSokRctmg16EkvbYMLNRI
	zXA/4WtahGZLJRY4uqSeyh5L5wMUaXETCb4wV8ksD5JvG8AwrXLD6SlcW29O5cl74govz10bUsK
	VjJQlbdk3QMHCKU+jOJXoLSIPIEDWsm1JPHXNAj4b0fEYcOzMD45+JeJB49j/TgC84pL4l0iZG/
	LKPI63758Q/7FmwlGYkDLlc4YJX0WAQqSDDK1sI4AgDDz/WdIUYj2uWJdXUfvLgVAubSNUFTpgd
	42gUadsIsPH4b+NXEpb43Bo8iuC3GK70BFkyHJipsjMOpBjAtUHFkX3rYgTY0TaBbKW/cURq+8m
	d3O1hPQNTJlhS/tPI9t7m2L8vhzLTzbuQNgB5aarOoMETrxmeVsID19UtXff4Bv+Uf1pReA9+0r
	ggXiMfSCsSIySswVBHOwPX2+t4TiKTP1IsnhcwO9RuMveQex6maXT6sNXj37vU5IsQFE5CfduZL
	xOKl8iTbsKA85kzKkdolx3mUAMVGbbZPMXlgtCju8cOEuBMQ22DWGiN15Fx17g==
X-Received: by 2002:a5d:59a7:0:b0:481:44e5:160c with SMTP id ffacd0b85a97d-482b1e8632emr21244457f8f.2.1787217428095;
        Thu, 20 Aug 2026 02:17:08 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it (host-79-54-86-139.retail.telecomitalia.it. [79.54.86.139])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482b14c3775sm10021606f8f.26.2026.08.20.02.17.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 02:17:07 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: alexandre.torgue@foss.st.com,
	francesco.utel@engicam.com,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	domenico.acri@engicam.com,
	michael@amarulasolutions.com,
	linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Christophe Parant <c.parant@phytec.fr>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org
Subject: [PATCH v8 01/16] dt-bindings: arm: stm32: support Engicam MicroGEA-STM32MP257D-RMM board
Date: Thu, 20 Aug 2026 11:12:09 +0200
Message-ID: <20260820091652.43541-2-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260820091652.43541-1-dario.binacchi@amarulasolutions.com>
References: <20260820091652.43541-1-dario.binacchi@amarulasolutions.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add devicetree bindings for Engicam MicroGEA-STM32MP257D-RMM board based
on the Engicam MicroGEA-STM32MP257 SoM (System-on-Module).

The use of an enum for a single element is justified by the future
addition of other boards based on the same SoM.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>

---

Changes in v8:
- Rename engicam,microgea-stm32mp257-rmm to engicam,microgea-stm32mp257d-rmm

Changes in v2:
- Add Acked-by of Conor Dooley for patch 0/1 "dt-bindings: arm: stm32:
  support Engicam MicroGEA-STM32MP257-RMM board"

 Documentation/devicetree/bindings/arm/stm32/stm32.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/stm32/stm32.yaml b/Documentation/devicetree/bindings/arm/stm32/stm32.yaml
index c6af3a46364f..3ed797ee7cfe 100644
--- a/Documentation/devicetree/bindings/arm/stm32/stm32.yaml
+++ b/Documentation/devicetree/bindings/arm/stm32/stm32.yaml
@@ -203,6 +203,13 @@ properties:
               - st,stm32mp257f-ev1
           - const: st,stm32mp257
 
+      - description: Engicam MicroGEA STM32MP257 SoM based Boards
+        items:
+          - enum:
+              - engicam,microgea-stm32mp257d-rmm
+          - const: engicam,microgea-stm32mp257
+          - const: st,stm32mp257
+
       - description: ST STM32MP235 based Boards
         items:
           - enum:
-- 
2.43.0

