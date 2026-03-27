Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDCB4378D9F
	for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 17:42:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774633373; cv=none; b=AwmMwJ7hpQwD1oHURk3s0K4d3YebX8q6NTRUrPMiDnULCpwfdzLUxbQM6RfFAlryUhKp1PZCwAbYJVrPB/ZW97V62p5NkHG2tm7ZQhiqK6SmOiBnCJAT6UM5A0GrnU5mLvAPW36XXU6NW5UjMhVnOKAfkaDTwoAk2a2QSHL/jO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774633373; c=relaxed/simple;
	bh=rkgiPTNK4wJ0bIJI5clmxZqKNMgXqfaXzD1JDS/WFM0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oujJGKE0/oGq9MBobA8N6JV8OS8+4zG395Ycw20TPy5B2Fg3gNgc0yBoqwhaF6DdCQsBkvsbDlJDB+T8liaxbJnmiNgtdaSouwvf4ugv9zpYRDquy5uLKICuKFCn/98kBmRF7J1zZHQWMZFxCbcK/7krnVoX49gCL41GrhdmYLk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UGY3PbqW; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UGY3PbqW"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-483487335c2so26144775e9.2
        for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 10:42:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774633370; x=1775238170; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+kH691RpikDb6X9g4K/wrujahyFXI0sMtAOZYtzMJ7Q=;
        b=UGY3PbqWk779Y2pkvS6r5Vkm80uVxN/vpof7crvTWCDQ180jkZmmxXHd64usu8h3Yr
         pzGQE/yIzfaMIrfT5tKh6BF2s5NDs3TSPVoOsaVLiHcpf3CR/g8eSqn4v7sDO3w94yqS
         ocb9RUAkdUWgiZ/cRAbXgwjBTKSd6BlbPmYFKKjfz0+s5lF1P9d+6hh0z8NvmKwWqTWd
         BTuccpmPHSablvEptlaqNWuNulYd3l/7F73SP+rSVm3YHgoBT++p3JVSDdI2oeQsbpdM
         nIlI66auqgjFehyCWKITmfencp+4dCMNl6fVX0pI3yBnwgTg505wl32c2es4peRYgy6z
         0qdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774633370; x=1775238170;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+kH691RpikDb6X9g4K/wrujahyFXI0sMtAOZYtzMJ7Q=;
        b=UjWHAE21zh9M9d91sMmiF3I4ZZ1+t+0KrrITwVVa3bxgFBMgd/zmjCu+FF5SveVHpl
         XMx3jmOaKW7y6LPR8FbDXjZNaQ99cvptMWYgcRVA8KNiqtw8pStFyawwjKE14XeQjoWR
         FA89qvRYMXxlFEPbpXDpXbA0dFi7qJtgqSZkNHSyB/aCQCNZ78TP6OS9RaV1LXZMQmZn
         loVmqrb0EIE0A/C0ClCkVzoLQwCzDuqFdRPjAsakLM/necSk4mICedgdGVi6ZfmhAnLJ
         5UEIIvYrdsV/yS7EtY57q5A1sTAfTLglMeujID5tt767pXc5hx8673HNDoHXdAf2HY6k
         N14w==
X-Forwarded-Encrypted: i=1; AJvYcCUBsOoJBCQXA1wIniQ4lP8cr7oKwOO4aRJV/y4PRk38M/Fpk5lNr9D26v3D9mO72cbaheIpGYm/f11o@vger.kernel.org
X-Gm-Message-State: AOJu0YxX+oaY5ks5QQSbE4XVTrmrnV0//hWKxxtjtzC2t89nDbY5LcRL
	M0749IA83/YG/1nMix8uFEB+J06/AD/u3tWNMtLrY7u5V983lZV9/uQ4
X-Gm-Gg: ATEYQzxtDUX+s/KnsgeVib/OA3ZG50B5+vg3+1r5Q+AN64egqC0N7fRM4cDvIaYj4sI
	mBjeU4XcWV5baUrscahEnt8+BYb3XCMSqdb9CbAuV9Xud7EX5bdpRNzhfscnXDS+2ligpAIAczR
	dHpRWZ+zQ+5lOLaPzzJSZoO+3q3PBRVjGSk3xADbBmi4VZNVkIFHOzx5V+tk1+CvfuBrY9AmuK7
	4xt0GWs48eJr9lP4Lk/UQ7JhD+nCQO8uRaP9+BZZuzNobX1dgihAG+d+xQrQbzSoAYEO79NUWcq
	ba3CHVEXwZaTT+PnUwvpr/7M/27VE56OQSbOsBtFgTzLaN581l4EZB+u/fSMudT/5LBOsjH5+LO
	ABnKqLHk5d6CRUjiTDiYdpGGGwbhnwy8BskdEcuBbxV+A54opJBP2aK+1RrJRPIwaVkY02iqaUE
	+V9TJWKV+65mopoLod9uHhZQjM4aUXBlwAZsHV6vYIvZHi9jax4OWHgO19PpLlZLsvrjNaPKuF5
	eCzr/nwEWtMl84FWuCdLf4oNbmVaqbMvD6wx1ZAIzD0ZsY=
X-Received: by 2002:a05:600d:8:b0:486:fb0b:ad79 with SMTP id 5b1f17b1804b1-48727f7b951mr48655495e9.20.1774633370224;
        Fri, 27 Mar 2026 10:42:50 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:cad3:5596:28d0:27e3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b9192e528sm15965933f8f.1.2026.03.27.10.42.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 10:42:49 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2 2/3] memory: renesas-rpc-if: Fix duplicate device name on multi-instance platforms
Date: Fri, 27 Mar 2026 17:42:44 +0000
Message-ID: <20260327174245.3947213-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260327174245.3947213-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260327174245.3947213-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

On platforms with multiple xSPI instances, the driver fails to probe
additional instances due to duplicate sysfs entries:

  [   86.878242] sysfs: cannot create duplicate filename '/bus/platform/devices/rpc-if-spi'

This occurs because platform_device_alloc() uses pdev->id for the device
ID, which may be PLATFORM_DEVID_NONE (-1) for multiple instances, causing
all instances to attempt registration with the same name.

Fix this by using PLATFORM_DEVID_AUTO instead, which automatically assigns
unique IDs to each device instance, allowing multiple xSPI controllers to
coexist without naming conflicts.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
v1->v2:
- Add RB tag from Wolfram for the rpc-if duplicate device name patch.
---
 drivers/memory/renesas-rpc-if.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/memory/renesas-rpc-if.c b/drivers/memory/renesas-rpc-if.c
index 0fb568456164..3755956ae906 100644
--- a/drivers/memory/renesas-rpc-if.c
+++ b/drivers/memory/renesas-rpc-if.c
@@ -1034,7 +1034,7 @@ static int rpcif_probe(struct platform_device *pdev)
 		return dev_err_probe(dev, PTR_ERR(rpc->spi_clk),
 				     "cannot get enabled spi clk\n");
 
-	vdev = platform_device_alloc(name, pdev->id);
+	vdev = platform_device_alloc(name, PLATFORM_DEVID_AUTO);
 	if (!vdev)
 		return -ENOMEM;
 	vdev->dev.parent = dev;
-- 
2.53.0

