Received: from mail-pz2-f0.google.com (mail-pz2-f0.google.com [74.125.228.0])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5CA7356A37
	for <devicetree@vger.kernel.org>; Sat, 25 Jul 2026 03:19:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.0
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784949556; cv=none; b=OKqDrRhSCvkszQCyNwlr7dDyxTvmZBX0VLs8sHg6qglT/f68NzwNbYdfavoTJtYZhRvZqFbhi9c9nhoA6w3PboQVW1p/siUBiAlidlXoV8QYR+GSsyalbHNkAp9th56Uku41IcvhyWV6JJmHlrNDnynuxOhfBiRWIa1FW8DUlfk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784949556; c=relaxed/simple;
	bh=sD70Be1EFEVlYgvCDT/fN9L+7DpFEJJVPuxwpoqy0M0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AqkS4kY8gCwYwXzeZs3YOpF+B1zScRvR88B9hiW3WfMQTyH99C1qVMev6inB/JBkY60bx3VjPgrzJgAdolHqA+apGBltOAshChj4lJGuhYaMpqmP6RL6rQh12KSCx3BnxKWI0Um7eD8xublwprLly/bkwtRDvmaAY2FYfT7LJ4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kX1LxYjZ; arc=none smtp.client-ip=74.125.228.0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kX1LxYjZ"
Received: by mail-pz2-f0.google.com with SMTP id 41be03b00d2f7-cb01d87597cso57890a12.1
        for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 20:19:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784949547; x=1785554347; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=R27OrBVO4c+ZRT7KJNQVX6sAFfpZUPUtgxebharHHoU=;
        b=kX1LxYjZz2r74qdFtcrXGADO46F7Tnx+lNmd4eFbNZQlj5m7zJCdXHT/5UN/WhDtXu
         RIfHdHV2pBsqh2/hQicEjPJhA/tww/wao9TPIl4RALj5PTo+TKgJE9XNlEnaVh788tm0
         P6FDlaRaSH6ord1Rc6ZhiUfCmfSoD4jixv6w0eOCJnHz1jt4lE963DcukqvZIo9urd6W
         2oqSES896pk+4iYbXhCJhu00PyG6mxy1Rr0HVTSiDQXmjUD7G6T9Buhng6bIZ685gvnC
         ZnuWv18lVfFN2o7kk/hc7f8eCvjxRMYnR3n1mCAqkv0Egk5OH4iFv8oF7uQMKWxHkeqL
         1Vyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784949547; x=1785554347;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=R27OrBVO4c+ZRT7KJNQVX6sAFfpZUPUtgxebharHHoU=;
        b=d4okMZ5wzzVNKL2VIMLYVI6xEReQDXSMPxZZKaO2lEIaDXbQ2bY2gkJYY7NNUaYJl2
         16EGsiBQVSoX0AscyLY0ebCNOxS7NlI0P3N8nCoG+2w6ssnlL9sAYqkas2boB3RJVSt4
         k/366p9wRJKX4SV+2CFNyGYvkLLwsYCOhvETLUUT4ZODtE18F3evX2YJgkVzg7s1NXDv
         cF8Et3bJAcNKtw7OdsqxajJTi8LAiEATKa/H5sYjFgsns0qSosX0v+NO4lcYD4aETqdm
         /ndC8KOPDZkwffDEfFHn8D3nd+O2Mw8ziKajQ6MV5UtpHNuN9vkO0/YWrWEqf2xddkct
         Dxpg==
X-Forwarded-Encrypted: i=1; AHgh+RrX/8AOhaGnfzqlRmr80zrhgAVrkJeQD5xYFq0CGTAE/jev8ayC9mrxhjar69xB2DedMtH+yIXRy4jW@vger.kernel.org
X-Gm-Message-State: AOJu0YzUf4VVbQGsF25J1W6IycffLCXHixAGG4HDxdsjoH5fQFtC1Cw3
	XZT8REBXIW1LF3a01aletth6TS/LNmNqrOfzkJH1lXR0K4ABwXAMpGyK
X-Gm-Gg: AR+sD13ovKIUVLHAdvmvheV9zreTlXV7OL4AHXjWbOmS/bxfY1WoI0J56R5yyITzU+0
	6qd+V9c/rE+Ti2jAJY0YoLuJIrk5XY9PyFTeac2BmlvWneEzmtm+cKaV3lUGz7RwdLmfzSACpR1
	NWeEkjPsz6ZmjhVMRjiM3PoSmXovyKnfG26dNdvdwA49yJnsLowGvhmzcv2w0LGPBURaqfE80Rc
	mRY65IPaV+To2Gb8wx3glvf41FoBRWMKuyASaxp4T3RMVb72tw0idk3Q7QlVpf1Wqg72cpDrQGC
	u9R3vxedjAKZxmTrmyo7VXeRk0g/OBeDYN4OYvXZDBXVa8NG+AwTlE5RM2hYDnuKt2009WQNwUB
	eA5GiyDyhuUHFv0x3PDBKXh7DiytCe1KoiVPhWYlBjSrNmLRifT3JBgw=
X-Received: by 2002:a05:6a00:852:b0:847:9919:e772 with SMTP id d2e1a72fcca58-84e595426f1mr573194b3a.21.1784949547576;
        Fri, 24 Jul 2026 20:19:07 -0700 (PDT)
Received: from [127.0.1.1] ([2a12:a305:4::403c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84e53432834sm640542b3a.50.2026.07.24.20.19.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 20:19:07 -0700 (PDT)
From: Cody Kang <codykang.hk@gmail.com>
Date: Fri, 24 Jul 2026 23:16:45 -0400
Subject: [PATCH 13/17] MAINTAINERS: add SpacemiT K3 display driver entry
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260724-k3-display-v1-13-f22a10a52867@gmail.com>
References: <20260724-k3-display-v1-0-f22a10a52867@gmail.com>
In-Reply-To: <20260724-k3-display-v1-0-f22a10a52867@gmail.com>
To: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, 
 Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
 Haylen Chu <heylenay@4d2.org>, Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: dri-devel@lists.freedesktop.org, linux-riscv@lists.infradead.org, 
 devicetree@vger.kernel.org, spacemit@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org, 
 linux-clk@vger.kernel.org, Cody Kang <codykang.hk@gmail.com>
X-Mailer: b4 0.15.1

Cover the Saturn DPU, the Innosilicon DP/eDP controller, the DP PHY and
their bindings.

Signed-off-by: Cody Kang <codykang.hk@gmail.com>
---
 MAINTAINERS | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 6dea93a41962..9f2910a17c38 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -25436,6 +25436,16 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/i2c/spacemit,k1-i2c.yaml
 F:	drivers/i2c/busses/i2c-k1.c
 
+SPACEMIT K3 DISPLAY DRIVER
+M:	Cody Kang <codykang.hk@gmail.com>
+L:	dri-devel@lists.freedesktop.org
+L:	linux-riscv@lists.infradead.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/display/spacemit/
+F:	Documentation/devicetree/bindings/phy/spacemit,k3-inno-dp-phy.yaml
+F:	drivers/gpu/drm/spacemit/
+F:	drivers/phy/spacemit/phy-k3-inno-dp.c
+
 SPANISH DOCUMENTATION
 M:	Carlos Bilbao <carlos.bilbao@kernel.org>
 R:	Avadhut Naik <avadhut.naik@amd.com>

-- 
2.43.0

