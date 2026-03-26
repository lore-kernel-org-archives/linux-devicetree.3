Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AA703603F8
	for <devicetree@vger.kernel.org>; Thu, 26 Mar 2026 09:10:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774516253; cv=none; b=d0VB8mo+BTiqwwR6bysWFt1PQex0v/xMFjgZByQj7VaogrFsqFEyEUtLZ8JvFWuM1QVAec66Zc+Nw94A0cQ9KvsyWWwVP79A5YuYPDtRbDRHG7wf3peX0gpmdKPRYWAtMYZGzLJ5GMA0iXO0slRxOKQ/1xR1VjuO8xsvEC3YAlM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774516253; c=relaxed/simple;
	bh=c7lQdgxqQoIzJtukGcni61BhLUSZ/QFFuAEFNiGJ1gU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=C/11GE5KV17Zh8dl/sTIMlQDYARbwTpBxkaeGQ9+qavsMuAcLYgxHxSFjbig68NYAjUGErAcBqDkj+sLRPf28jv6m+g54V4G1J2xfmiG9iaIUf9Nwnms+L6dWKwSbrbuNC0idplHOBq7yC2fxciDs/ApurFQ1OSkuvj+Z54Fcis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=THZNkVBU; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="THZNkVBU"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4852e9ca034so7034365e9.2
        for <devicetree@vger.kernel.org>; Thu, 26 Mar 2026 02:10:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774516250; x=1775121050; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lE/tNvEnDqlfntSdOLMR8SVF3nj3f/cbm60tbKz/3QM=;
        b=THZNkVBUXosTQ98f7Dh5Eb3Npy9Wjipjcw0/hEyTIaAzsd+MK/gjp+MW60I9S86K1E
         BNjCZ5RfKhxp9O6oHy5POfc9WgcclG+XTeAe+m3BLqjs100HRzpolFLPh8FSj6YTbBEQ
         NHcRVPOq9BltsKxdZxP+UTWv1dmLRqjm0wRTtvMYLpMTF/iXsFfgC1Buu2yZ4YV38EFE
         15JtqWRSs6xLQa2FSWZXr1Wc4dx0hd1CaC7G7ECc0B5tXNq0LcvCb627ph15vRmwDHmi
         5DwX8U0k0yRp6hRraOO3CE7BpiSdY3brcq9/oMa212uuCtDaIkQuQimfvWoboTrwXSI6
         n1Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774516250; x=1775121050;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=lE/tNvEnDqlfntSdOLMR8SVF3nj3f/cbm60tbKz/3QM=;
        b=nMljzFTUJGuv+Xdi+vQ/w//boY/lfEUWZ9xaXys14URGENMYQ9HSVYdLMt4Q/VYI4m
         +n3S3e7BqkWNOqVGZW28T9OGNWpkHVssX8iHBBpbPkrTTe1BcIroAJMu/r+QpjmkQc3N
         S0d8zfMZKh6GBqazraqAoRAFAFwcEhjuCPJhbmc0Wui3zJzgTw/F02+H7gCjoNAN7ZBJ
         85UMNWRGHP4nVSESHy7vHhTLIMhldfSC57AEtBLRmyZ/wROOwGE9Zel8Bj5CkeeznfvY
         bRIBRGSRCm6+ShSMuz098kH/POmV0zvEGi3PZGL7MJl/Ur4tJIviYi6dXkQghQ0LWRAp
         keSQ==
X-Forwarded-Encrypted: i=1; AJvYcCXar8JxZkF44Yy7uPY9e7wFMWaRODobbEXgWuU58WeshYglw4sfiOmdugWxXX1J21p7kV/a1ORrtROf@vger.kernel.org
X-Gm-Message-State: AOJu0YxPHlE7fu1mON8OFdhnKjSCyoRy9n+2/ILXYVjg9ZRo8YToPYNz
	ZVN0OoiCH+dvKo0+I87P/F7dpGDQXu+NDz92RLCgZr+nmb69zZ6gMvFmlQIsKnHa
X-Gm-Gg: ATEYQzyKrTMgUIulOO7F4EkmdfxWZ7/bvNc1WSaxCwbf9KipQHFCBAlt5vOB2vLq4Kq
	x1vqGB2CtvwC7ruqY6goMwrxbOBIN65i+0ih6zuENTZby9m8nyRHFvP+P/6fbpcIU3XZ4rvjqi+
	ez8yX0WQ5wRlPJmJF+Xt7UFHRHoCw3YV7mKYpZJbKgtznTumJycpyqeyKv5i0tQgBLNa++2fwpj
	hWHlbDjzoZUm6OYoSWmkXD89jQnZ+aC/9NmoB3jWlGo/MBjm1bxK5rpTjpVFbvOPigyBMsOgDyq
	oKIfaKw4y2Qg1qmkTnweUyGH0OdtoMhvI+7VyjxqlLW3enOMcZZirdfO+T8qdVdJevn0iQVcjP3
	RhBPr1AeFi8TffkILGOiF4+tFNu3eWpP30oT9kZ1vfAhpGdVgrpjjJMrfIO05yVxDkv6fcTIf1J
	vh6OGWOwLWzfTLyhdUjHGUvUeuXvxcGqMirQoEuup7478ydRCIBthL6w3IXBK5vhdQsq518cpWx
	TrCU7hQYg==
X-Received: by 2002:a05:600c:64c6:b0:485:34a2:919e with SMTP id 5b1f17b1804b1-487160a681bmr94261025e9.33.1774516250125;
        Thu, 26 Mar 2026 02:10:50 -0700 (PDT)
Received: from [127.0.1.1] (cust-east-par-46-193-119-166.cust.wifirst.net. [46.193.119.166])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b919e7111sm6381199f8f.37.2026.03.26.02.10.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 02:10:49 -0700 (PDT)
From: Fidelio Lawson <lawson.fidelio@gmail.com>
X-Google-Original-From: Fidelio Lawson <fidelio.lawson@exotec.com>
Date: Thu, 26 Mar 2026 10:10:21 +0100
Subject: [PATCH 1/3] dt-bindings: dsa: microchip: add KSZ low-loss cable
 errata properties
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260326-ksz87xx_errata_low_loss_connections-v1-1-79a698f43626@exotec.com>
References: <20260326-ksz87xx_errata_low_loss_connections-v1-0-79a698f43626@exotec.com>
In-Reply-To: <20260326-ksz87xx_errata_low_loss_connections-v1-0-79a698f43626@exotec.com>
To: Woojung Huh <woojung.huh@microchip.com>, UNGLinuxDriver@microchip.com, 
 Andrew Lunn <andrew@lunn.ch>, Vladimir Oltean <olteanv@gmail.com>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Marek Vasut <marex@denx.de>, 
 Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: Woojung Huh <Woojung.Huh@microchip.com>, netdev@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Fidelio Lawson <fidelio.lawson@exotec.com>
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774516248; l=2567;
 i=fidelio.lawson@exotec.com; s=20260326; h=from:subject:message-id;
 bh=c7lQdgxqQoIzJtukGcni61BhLUSZ/QFFuAEFNiGJ1gU=;
 b=gj7AGcTZYGRoM7Sy8eZ6g+SR04PncDwMsa3hX82B5caMFrk8jBIIfC/yGLfiXNoWrTzH/QhTl
 4xqPPoU+hVDCLFug8cRooDd/V7CsmsZBsmKPrftyKqTH8hY5vJ/yU9q
X-Developer-Key: i=fidelio.lawson@exotec.com; a=ed25519;
 pk=866eH9Bmmpjc+ctgkr5T1uXxBefZzob3tEEuiVWZ6BI=

Microchip KSZ87xx switches are affected by the "Module 3: Equalizer fix
for short cables" erratum described in DS80000687C.
The embedded PHY receivers are tuned for long, high-loss cables,
which may cause signal distortion when operated with short or low-loss
cabling such as CAT5e or CAT6. In these cases,
the PHY may fail to establish a link due to internal over-amplification.

Two workarounds are provided by Microchip, each configuring a different
indirect register value to adjust the PHY equalizer settings.

This patch introduces two new device tree properties to enable and
select the appropriate workaround:

  - microchip,low-loss-errata-enable: boolean enabling the feature
  - microchip,low-loss-errata: selects workaround 1 or 2 (default: 1)

These properties allow board designers to opt into the errata fix
according to the targeted cable characteristics of their platform.

Signed-off-by: Fidelio Lawson <fidelio.lawson@exotec.com>
---
 .../devicetree/bindings/net/dsa/microchip,ksz.yaml     | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/dsa/microchip,ksz.yaml b/Documentation/devicetree/bindings/net/dsa/microchip,ksz.yaml
index 8d4a3a9a33fc..ddfbc36aace6 100644
--- a/Documentation/devicetree/bindings/net/dsa/microchip,ksz.yaml
+++ b/Documentation/devicetree/bindings/net/dsa/microchip,ksz.yaml
@@ -85,6 +85,24 @@ properties:
     enum: [2000, 4000, 8000, 12000, 16000, 20000, 24000, 28000]
     default: 8000
 
+  microchip,low-loss-errata-enable:
+    description:
+      The receiver of the embedded PHYs is tuned by default to support long cable length applications. This was developed
+      using low quality, high loss cables. Because of this, the equalizer in the PHY may amplify high amplitude receiver signals
+      to the point that the signal is distorted internally, preventing a link from being established.
+      A more balanced receiver setting has been found that still functions at the long cable lengths and also supports
+      low loss applications.
+      If present, enables the selected errata workaround. If absent, the
+      workaround is disabled regardless of microchip,cat56-errata value.
+    type: boolean
+
+  microchip,low-loss-errata:
+    description:
+      Selects Microchip KSZ87xx CAT5e/CAT6 short-cable errata workaround.
+      1 = Workaround 1, 2 = Workaround 2. If omitted, workaround 1 is applied.
+    enum: [1, 2]
+    default: 1
+
   interrupts:
     maxItems: 1
 

-- 
2.53.0

