Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A25CF3DA5B9
	for <devicetree@vger.kernel.org>; Tue,  2 Jun 2026 10:16:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780395414; cv=none; b=fkDN3GaN9zNyRagOXVbn8kP3TMK/PHvta3A6M7JVd2/9W3fdl1SAtuujD+D3XI89ZEIu3BYbUbm9rw5M2lDv2hjnXnp0IsOFS16VCdNuint1MF8NN5Ru7JyDm3RmLP3jDlPHxFdKssAMAMci2mS4Ultmj7uQ3m2GGwIeyUxKv7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780395414; c=relaxed/simple;
	bh=vhEkZTw4QlzQZ3n04KU8Ww88nfpYBe6Oem2sU6WQQ/g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fJmenSqnUg2A4/+SxRm1l/ejh4SBLEXXN27TYTlp66C63klRPg6ZhvlCjN7UhnqiNIBRPYPJ+Gx1EBzYdluodYR7Xnr9IEpDZlOIz0fKgu8l3Bcj8+2/W4zRj3WDe8+yhFIFiz9n4lELSwmigpR/hOQNnLmVUKSolpwP/4YdXLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AKUOceib; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AKUOceib"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2bf18c30bb2so33406435ad.0
        for <devicetree@vger.kernel.org>; Tue, 02 Jun 2026 03:16:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780395412; x=1781000212; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rCb8DxBgLNYKl2se7nFRUFkwYJO2PqG9toAr7Dgva9M=;
        b=AKUOceibMMmAKWnzXZzBgWiyiwi/+OxZoPWK36atW27zLbhPRMVx0xhWqR0yFRTlaM
         RUjS+/5ukYAmwFeliiiJzgjsYcRhmzJXeAseByAuWKiias3jIWcjHYrWVO77VqA++mfR
         LVn2n1+C0eN7goUADfuE5eYtk3Od7gXzFGbw7uFz57RUtX9rHQraym7Qi5tqt42kr09e
         NlUcQ6eqxVNRHg3jdvFmWhBsFhqSJnd23wz3vRjO26Dqp/3zyd8vHxc+aO7/K0tzwxK8
         I8n+r2uVICI4UWzDS7/t2O157yRryCQHMTyxQCz236IO6J1HInXp8byUy4abFdCw+ei6
         BDCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780395412; x=1781000212;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rCb8DxBgLNYKl2se7nFRUFkwYJO2PqG9toAr7Dgva9M=;
        b=qHrZWfryFZmbuvzJoJ482bVZlmIZK6OfexcC8S5p/EGXD5HLfZt4f8RHrq8vQWGg9K
         dNIY5dF1ex/7nK8lM5d79uTTTd+8iU0Zl146lrlhEE53edfBzKaXopuzY47IDYj9LWa5
         Z8LVaQy3/hOntOZcO68QvqaCmkG1a7VV61RzrGVJMDGdKWgM1VhgWOXVJg+jC9eESyAA
         aGzzmr6TcFcViox8D2iDYLr5d7On0ZOj0y/O6UVEszF124ck+OTBfWEThG/47jvNe73e
         oWSOxXW7vk4IQf++75csGo7Hom+wBd3fBQy+I/TsDRmPk/gbhnyPIxI7rAu7w3JDwZzF
         4H0w==
X-Forwarded-Encrypted: i=1; AFNElJ8+oQwArNIrXxyp11UcXiKAVh4ELZNqvQVRi4vaF6tfA+8h5fmZShCTgVvNmvkcGocq1GW3qv/LIq9g@vger.kernel.org
X-Gm-Message-State: AOJu0Yyvbgi9rQYkP+EXkvemvIY0T++cJREO9Sn9JWqdpsfnCMq6GHoY
	OSDg9KAFN+eSy5fHmLYfvpkS+Pdd0bzwyZUHVwtE2Uike4CwgkbgTMRG
X-Gm-Gg: Acq92OFkeyu3p9bpuBBfykh8mOda4h9/H8mzfLGN+V/LK/uWT44I6kO++fJGWC0uq17
	KS7Z5bwfskc6WtGUExJJ49lGN/7a5I/y5uord0HDx7EWc+Bpi23o5A7UGoe6qjWAIMNnI1SWEfs
	itpPVoLJydcyWByN7gjKBZNlX9JWRn2PUt+Er7u3o1xAnD3/7PYywvCYraEBh1yL2eA2yMFwiKJ
	vWH/yQnnotiQR/l8gKhn7ULMVCB0sFahSggkYUtP5fh4H2jLL+50UGugbMzaPMrr3AAnSYAnNmw
	TmAGyDb9NNkLHi8O2/qQZtBrIIP8WCvM4Y8i/ez9DK2Rvns06HT4oH48D3vqrI7WSrf279DbsWg
	p7BsdCgtQbjP3oTbQPhBWiL/MQl17yMfxdkMESkv6UP/H1VIDeirkWTNpMDbSlsMtCpMUZ3tHJI
	QzObDyLSW4cKJW4yypMrseWmYrRKpoHLZUpIM7SPKWnFjbTKOQgBaZD8vgUl9hXvmfqN0v
X-Received: by 2002:a17:903:46cf:b0:2c0:c625:400d with SMTP id d9443c01a7336-2c0c6254383mr111686365ad.37.1780395411951;
        Tue, 02 Jun 2026 03:16:51 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bf239fd84fsm132766305ad.23.2026.06.02.03.16.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 03:16:51 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Heiko Stuebner <heiko@sntech.de>,
	Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	devicetree@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v2 3/5] ASoC: rockchip: rockchip_pdm: Reorder clock enable sequence
Date: Tue,  2 Jun 2026 17:16:06 +0700
Message-ID: <20260602101608.45137-4-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260602101608.45137-1-phucduc.bui@gmail.com>
References: <20260602101608.45137-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Enable the 'hclk' bus clock before the 'clk' controller clock during
runtime resume.
The bus clock provides the register access interface, so enable it before
the controller clock. This also makes the resume sequence the reverse of
the suspend sequence, which keeps the clock ordering consistent.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---

NOTE: This patch is compile-tested only. Please help test if you have 
    the relevant Rockchip hardware.
Changes in v2:
  - Clarify in the commit message that the resume sequence becomes the
    reverse of the suspend sequence.

 sound/soc/rockchip/rockchip_pdm.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/sound/soc/rockchip/rockchip_pdm.c b/sound/soc/rockchip/rockchip_pdm.c
index c69cdd6f2499..8f78f7bc1806 100644
--- a/sound/soc/rockchip/rockchip_pdm.c
+++ b/sound/soc/rockchip/rockchip_pdm.c
@@ -422,16 +422,16 @@ static int rockchip_pdm_runtime_resume(struct device *dev)
 	struct rk_pdm_dev *pdm = dev_get_drvdata(dev);
 	int ret;
 
-	ret = clk_prepare_enable(pdm->clk);
+	ret = clk_prepare_enable(pdm->hclk);
 	if (ret) {
-		dev_err(pdm->dev, "clock enable failed %d\n", ret);
+		dev_err(pdm->dev, "hclock enable failed %d\n", ret);
 		return ret;
 	}
 
-	ret = clk_prepare_enable(pdm->hclk);
+	ret = clk_prepare_enable(pdm->clk);
 	if (ret) {
-		clk_disable_unprepare(pdm->clk);
-		dev_err(pdm->dev, "hclock enable failed %d\n", ret);
+		clk_disable_unprepare(pdm->hclk);
+		dev_err(pdm->dev, "clock enable failed %d\n", ret);
 		return ret;
 	}
 
-- 
2.43.0

