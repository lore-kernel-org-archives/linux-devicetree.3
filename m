Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A379E3D0C12
	for <devicetree@vger.kernel.org>; Mon,  8 Jun 2026 14:22:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780928552; cv=none; b=CKKrvNdXBh0xgyLD80iTZf1JCigMJbUEE70nHNWYpyH90mLzIO9SXHJ9PJpCm/uZ1GhxCavT8mI24/UEbwtv0ROPldjrC6TQZDjI6rdbqDcP/v42qwWR2sF26YP/f2qmQO94TXRZOBH93eGL2iCO4jwahiu/1byB9vcK2Fu7Tes=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780928552; c=relaxed/simple;
	bh=5Uzl29QTCrj5VKD83cW4UxcKrN9I1xXI5DXz829aub8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nJnIQPdzfoPEXZsdImNNBjCS+9iuwewctrKWmkd10Gcp8yWtrXibbVicAW6ioZmXIAO5BDanrAeAxcUz1bhLZEQSI8c6MH5GkSNgNYgZsyp/U/7NvZMCzK5W/evz0UW2AF91OGXuD5TuaF+fsYFsXw0vKb9ufxkmaVHCL/23zL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=p30GFMuj; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="p30GFMuj"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-bed2195323cso634783266b.1
        for <devicetree@vger.kernel.org>; Mon, 08 Jun 2026 07:22:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1780928548; x=1781533348; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XAn+sgOJ//YpFHFCj3wQ7fJwCRmUnKUhDxx0gbmShJo=;
        b=p30GFMujNL8p1XGzYyowwWNbfB6c+mrEb8m0cTsYrQ4bKJVvYJ7UX8cxHdiAeR/eXh
         su431BjKQzxAGRFvKWh5WEJ7DerUbigdIE3uLBZcy6H5KUlycsoiEBH/gNWIAfaRjdWH
         wM11KYb4g0gWtodmZsFEoeY+tNE6Z3+ghTjjI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780928548; x=1781533348;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XAn+sgOJ//YpFHFCj3wQ7fJwCRmUnKUhDxx0gbmShJo=;
        b=HNLhzHArWaTZ4uZIGPPet8bryUwdJ6rpEENhmzI+/Rkb5G+me5doDf1+jUWctPSnVr
         JeNiJhOjzEkebjQWveRbhn+DuPDuJ/6Z2fztJUXv0CuROfzEWrSTO7UCVMd6c7YWkxKI
         RKr2FUvyWLrwBDi2Sq2XTQ7y5kHuwTfQOn+HIISAD+LYsgn0brSmnxq6N6wzfWA5+3/n
         fdQ47xdcGUa+1AzjkP1qnHdBluEoNO235B0RMo/jwSQViLNf95qe9bg/jbmAbODJ1zUY
         xMXLe8lzln3M3RXPAFa/tsawmz6FSyMtlsMbEAxS79Afp0lCyCcW/BsrUiNXUJa6wwOb
         G7eg==
X-Forwarded-Encrypted: i=1; AFNElJ+RSXvEV51Jp3JwudpAp6c70kvnosyuI3d+M8qrtFSvXgKgnvwaY76oWVjjjnUDIfzWo0YfC3UEB3Si@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5l5CVolRznJmf3dkK2c+HM8OM+QgeRhZhWHN0fGhFL400/7Lr
	311jo4yShvWMtjF0BYvIXMIyXVGx9ET7LMrSCfp5OW3vKzn+uKqxANm1KuvsBrlZJ+4=
X-Gm-Gg: Acq92OF5Rl1Qq7etVo0SY568WO9RXXu4Jy6ICLTfK8pguywIFVHu/lY/H1AUz2ovnm4
	40l4dAc71t4wrd3RGGE9Bvf+M6bkb8KP9XnD6pF/wpYhnBcH8MtJ46ev+BbjvTqYt/gh8yW1XsW
	MFA/Nv+ztzP6yfYSsPCwcIxFWot2upBFQWpF8XjxpT3KK2Jr2oeBDpVRDXqnaPWErAq21MQyxQw
	y9A86Hj08C8wgp6I3D9l3xkziroJln/VFqpWNDah2gmiZKgP1i3buwYA0TLnsAIjuFMaoIl95bD
	N5bfAWWGpB4gm4b7UtFKSbUcpAeP2yBqRRuklaOx9U1mX71Gl3m35OFdKfeAq1sATUt94WuU+gx
	5YfdbHb2Kb5tnc2Xo6Dwoh83Wr3cbRh4TyQz7J9EE4RATgX/3cgENyqOV+vT1axcncN6SQnYpcf
	0iXHFTGcsf6pNmJxxB+BScekJHUUduBFJsgq6pOmKiDryhOqws45GiOLTQMhdOIPu5oxQHWPWfM
	gVfuP1WwEBYAcRoTB0jOnJpOdGXKGeW0SJR+jRv9tHJsjjUXv41RxeS6vbt5oxSpT0WFQ==
X-Received: by 2002:a17:907:75f2:b0:bec:2ad0:cba5 with SMTP id a640c23a62f3a-bf372159cbemr438523966b.29.1780928547685;
        Mon, 08 Jun 2026 07:22:27 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.amarulasolutions.com ([2.196.42.139])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bf055307a35sm881847066b.52.2026.06.08.07.22.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 07:22:27 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	domenico.acri@engicam.com,
	michael@amarulasolutions.com,
	francesco.utel@engicam.com,
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
Subject: [PATCH v5 01/16] dt-bindings: arm: stm32: support Engicam MicroGEA-STM32MP257-RMM board
Date: Mon,  8 Jun 2026 16:20:18 +0200
Message-ID: <20260608142221.952245-2-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260608142221.952245-1-dario.binacchi@amarulasolutions.com>
References: <20260608142221.952245-1-dario.binacchi@amarulasolutions.com>
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

