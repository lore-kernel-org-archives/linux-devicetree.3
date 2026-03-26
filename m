Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C3C03B893B
	for <devicetree@vger.kernel.org>; Thu, 26 Mar 2026 09:10:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774516252; cv=none; b=fYgy53vq9PIBLuCZlMVC98ztufCdPHiFttRpgAMz8DA6Asx+na4PGaaJ2xO1d9Ixm5E78ESBNZ0wJtPj5qu3rKT2XvXDZdGCowvV9H4Xy1N+szxkUb37UQHnS/u/mbnvOYeH88yS9MA9bWdGRGB8Oey5B8ONJvRcqwpYTd3/RHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774516252; c=relaxed/simple;
	bh=jlfzUqL5XaI195zD9OLF2Th7Si2B8ruPet0hTv9v4Ns=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=QLybys5Sx9NDnGQbrmHHz1fBVFK0tGYvMkzT8pcLYifu7AIluFf+5Y40zyO8Rzqa+fSw9Ow5D6+lkytF8ZtPJwmtoj+nguCSdqrDkg5wZbLM9J5QFSCvwp65mjmQp0VZu195peuj5bZySTbXs0s2khN+LIjxjAWZK/QaJlOSWRY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OZyQpkn5; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OZyQpkn5"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-439d8df7620so478224f8f.0
        for <devicetree@vger.kernel.org>; Thu, 26 Mar 2026 02:10:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774516250; x=1775121050; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sMvbvGrl3e3VBg8APBt/Zd4LqlkyH4JNJs+/pCZCmgc=;
        b=OZyQpkn5FzvoPEFNDwTrBGjW/fgxRCufxDhh9yGPZtbd4ZFkkqWVt5HYb58IeHqrOT
         DJi5Y54CkJG6n8uLOukJ0iVBhJS+E5GC3znv1CbCozodUgjfeU/zdHFdZXteQRS8fXdh
         8QCg15By3Q+YzB+yAOLFb/e8Zqw+9TiAbfFaRqTGBhvyImKXajUBTIzp2A30UHchQXoI
         L5OPrnM7qlwH/b0bADnSS+uOsD/a1aKsRaYIcH2PXUK8rIz4VY3DaeZikU18Y5l2RMVD
         9zV2hhaz2yWuaLUuqhDB9tcQBNBG1YYZr9AINs01Y2yDPwbGw/fvKvC5X4ptdaQ3OWoo
         nsmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774516250; x=1775121050;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sMvbvGrl3e3VBg8APBt/Zd4LqlkyH4JNJs+/pCZCmgc=;
        b=AGjpv5rxuC3nQ6IKfz0aX1h4i/FIAbOMkVDyRDmM7wKEUqQierFbIf+kBHKdj4yRyL
         mLYEK5MCB0omsvG4G559GZ9R30wOUx0VnE1+lzECFCQK4fFSAsc7rBirYMgpRIud8bTj
         7H/9C6PvXsnz67OqcpIPNlL5R11+Ef7IkdwriWClXGxEHzOhruZVkMQMqEx4xx7ny/p2
         EymM+gktMQ13ebCL+ALvcCgZ05V7wyBXIzMe+ezKQYhzjCbBbH3ywYYjyzXJOOuMBfd7
         focc+vGSDk/ATy4rcQSyNDXokKY+SRh6njW/OkNVXTp6Bu9L7CtFWpZsTOvs7N8UgLxQ
         rPug==
X-Forwarded-Encrypted: i=1; AJvYcCUffly4lm7c0TKTcHeExdJL0Olny8Rlzh9kHU5tbeYwI+Zm41PPMvvJDh4BGb2I+C96WdCfryPn1Np6@vger.kernel.org
X-Gm-Message-State: AOJu0YxXhEnaJsWceBYBdRg9r2Bx8Ms3mYFMzMZBAiXgm2Cw7cmGqY+/
	e8AJ4Za3Fi9hONTHf0+gDLRev4WfEXYecYAvn8THiE5cDSvQ2L1/ZXDtv+QgQeJW
X-Gm-Gg: ATEYQzzGaRgl2UXAcVvzi0e5tobTukBXrwxOjJfZBW+M8lxpS/loqfytlRQY44tvpwS
	1NBY3xtzlSSZrmvorL8ushabdQvj7F6y0NDbxcGTABvmWgL1585wKQ1sK6NRq0kdo0510bYBuZ7
	rmChkFeJrBPJsxyW/SGCEoh/HmHIddOpBa5+3GSP0sTODzytt4bbEE/2ANNe84/M+nQq9qTFc2I
	lMfabwxeg+VqHIfB82MrtaFRQglvoLLmq562Ne3DqxX3qZRtBW6RlDQNnoPTtvEK7/q4q3cdint
	X/FMlk+avbZP4lXCNefTzR03yUOZ+fht4jxGXXiIqbmlHMOPc2XxXqvEhfxct0vjbk1+e2ftPfx
	t/eUtV/n1JyisezbbKOOqRaQhCp2NdiylWXCNBPEldmH2+/dl8z9YHmICu4klGOUstCRGoEdsoR
	LQ+62AsnNLaddtTPQ0rMlJhcRDjCeR3gQyNwDNPVpzftbnk374/EKAtvQrzu1pMOVXPTYmDXcVS
	3XeP7sy2Q==
X-Received: by 2002:a05:6000:60f:b0:43b:5765:96a9 with SMTP id ffacd0b85a97d-43b889af1d0mr9982897f8f.24.1774516249379;
        Thu, 26 Mar 2026 02:10:49 -0700 (PDT)
Received: from [127.0.1.1] (cust-east-par-46-193-119-166.cust.wifirst.net. [46.193.119.166])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b919e7111sm6381199f8f.37.2026.03.26.02.10.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 02:10:48 -0700 (PDT)
From: Fidelio Lawson <lawson.fidelio@gmail.com>
X-Google-Original-From: Fidelio Lawson <fidelio.lawson@exotec.com>
Subject: [PATCH 0/3] ksz87xx: add support for low-loss cable equalizer
 errata
Date: Thu, 26 Mar 2026 10:10:20 +0100
Message-Id: <20260326-ksz87xx_errata_low_loss_connections-v1-0-79a698f43626@exotec.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPz3xGkC/yWNwQrCMBBEf6Xs2UBMair+ikhI4qpRSWS32mDpv
 7vqYQ4PZt7MwEgZGXbdDISvzLkWgfWqg3QJ5YwqH4XBaOO0NVbd+L0dWvNIFMbg73WSMPtUS8E
 0ypxVdBscHJrYawtiehCecvu97A9/5me8Sv2rhmX5AGYdrFmHAAAA
X-Change-ID: 20260323-ksz87xx_errata_low_loss_connections-b65e76e2b403
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774516248; l=1968;
 i=fidelio.lawson@exotec.com; s=20260326; h=from:subject:message-id;
 bh=jlfzUqL5XaI195zD9OLF2Th7Si2B8ruPet0hTv9v4Ns=;
 b=S/roDsVN3Wq7zvzTF/aHCH1/5dfMWW/cty9n3DjadfYyFJRUSGTSmsQ7sEQzyfLTGePzH4qFA
 C9n3mmOj4v1CP05vTUtTDjYs5aj3KsTim7BTPyQuXA3t5uKvt8HucI8
X-Developer-Key: i=fidelio.lawson@exotec.com; a=ed25519;
 pk=866eH9Bmmpjc+ctgkr5T1uXxBefZzob3tEEuiVWZ6BI=

Hello,

This patch series adds support for the "Module 3: Equalizer fix for short
cables" erratum documented in Microchip KSZ87xx Errata DS80000687C.

According to the erratum, the embedded PHY receiver in KSZ87xx switches is
tuned by default for long, high-loss Ethernet cables. When operating with
short or low-loss cables (for example CAT5e or CAT6), the PHY equalizer may
over-amplify the incoming signal, leading to internal distortion and link
establishment failures.

Microchip provides two workarounds, each requiring a write to a different
indirect PHY register access mechanism.

This series introduces:

 - Device Tree bindings to enable the errata fix and select workaround 1 or 2,
 - driver-level parsing of these bindings,
 - implementation of the indirect register programming sequence required
   for Workaround 1 and Workaround 2.

If the errata is enabled but no mode is explicitly selected, the driver
defaults to Workaround 1, following Microchip guidance.

The feature is opt-in and does not affect existing platforms that do not
enable the errata.

Tested on KSZ8795 with both Workaround 1 and Workaround 2.

Signed-off-by: Fidelio Lawson <fidelio.lawson@exotec.com>
---
Fidelio Lawson (3):
      dt-bindings: dsa: microchip: add KSZ low-loss cable errata properties
      net: dsa: microchip: parse KSZ87xx low-loss errata from DT
      net: dsa: microchip: implement KSZ87xx Module 3 low-loss cable errata

 .../devicetree/bindings/net/dsa/microchip,ksz.yaml | 18 ++++++
 drivers/net/dsa/microchip/ksz8.c                   | 71 ++++++++++++++++++++++
 drivers/net/dsa/microchip/ksz8.h                   |  1 +
 drivers/net/dsa/microchip/ksz_common.h             |  9 +++
 4 files changed, 99 insertions(+)
---
base-commit: 2d1373e4246da3b58e1df058374ed6b101804e07
change-id: 20260323-ksz87xx_errata_low_loss_connections-b65e76e2b403

Best regards,
--  
Fidelio Lawson <fidelio.lawson@exotec.com>

