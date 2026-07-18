Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61B21384CC2
	for <devicetree@vger.kernel.org>; Sat, 18 Jul 2026 08:57:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784365074; cv=none; b=Qtr0isWW/PtAEJZ/cvVqLi50jvypgzSOMIlw9oWpQdN5zGhtjmHYdhi8bAGAOSC9uUnQnjil9PSm0bL9UAtu8okw5WmJk5K+YsU4RtoC2K3Yok7BfFBK94bzrH2e7eY26Ys16oVATgquXiu/W3pKX4xS0TSGgv07xkAf75xyXb4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784365074; c=relaxed/simple;
	bh=og04sSBm3wAKBXPeDuda5ze9nmSKybKCjjyV0RwL3LY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cNjodTxKGFZ+DYV2jObazKJqbsReNxgnhJebCp1ATrKuM7oXfhy+U7ID8A4zSCUjDZVnESu9FglOhPhz8TQ6iaI2HjnFjd0wNVO4c/86WoRR3Gv3LVREVRPHsraE8NK7zdjeRmkf4ZP28IiIaF2Fs5kXsS+wXBrkfOado+4sfsk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bxVeuD9C; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bxVeuD9C"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-494049206c6so2170645e9.2
        for <devicetree@vger.kernel.org>; Sat, 18 Jul 2026 01:57:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784365068; x=1784969868; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IVdUc4K/IhqrOMLTX+JPmZv/Y1bCw+s3TFSm96hNeQA=;
        b=bxVeuD9C27aI0nrUaD6Mf0aKe+hxBj+IDtlseurS5RoXQPNXBMU7B0LuI/uPCc6kVd
         VBjzbUM5oLJwJ43sh2GBhJCqXry9pd99hH1XGxkyHhzAL1xvOEaW//gGtBHgQGLHlG38
         qgaXp4NcQNL58/BXvtmZR0QFRlobkwvDcoIP0S4dTarMGu4YJ31noOcOdm3Zw7PILZgb
         DHBj2QJr3SC9YF+kvuvcQsBSFcsShq50CiYNVskM9SbaJNU3YB9MlO1rvLs99IYguEuP
         VkeGc9fM9h2WdPspMVV8TCRMU18MVRHpciPGhWN7Q0cE4wPV3rygVQbfxRdmCPatz48C
         Cqnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784365068; x=1784969868;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=IVdUc4K/IhqrOMLTX+JPmZv/Y1bCw+s3TFSm96hNeQA=;
        b=a9A7y6cm9w2jGcfU5ZseDwn7Jol5Pex8+S6ulhRBQuG2tISI69kbPIVFgpkW9UFr0v
         JpW/bfRznFDf9aCLuiw4rw3pTeB01n9W8ADC+x3d49JqA5HXDa6TzwIfPZSfN3luPfqK
         L7AXH3cp9XJwi3YM1gwlctAyKS0fZQ96y1OYZKgiZY0FLpvcCwEN+eD4kCSwh/PJ1yF2
         ZbJqMsJ3QcG0/5FIZfgEcjeR0YvLlMsucaY1KObJkkN3NHoHOvo0cuvxRjbIRL5Yr3Sj
         4/gO4sqHYgsGWuEA8mi3KB5sMxUmZ41fe00O/EIwtwDrutZT6VdK3QwbR7sG2UOQ4nbx
         UFQA==
X-Forwarded-Encrypted: i=1; AHgh+Rpf/hmWcNiLOxKqeiemmRQHDHTIKs8f6KsU+ENotMvEl23SaX19NbZ8BixBjculBDQEFw/c/Iz0t4DO@vger.kernel.org
X-Gm-Message-State: AOJu0YxTqyYtM/AlMgYqm0HckO5GV0DcZAtg+KcvnKt6ufaHbwiVXvOE
	QEKYePOIIrW4JQ70WYYM2hHQd8WCF8vUB27ocHDpaztBiftjlCyt++85
X-Gm-Gg: AfdE7ck8xKYe5tmqtjjRtv6HBoJI1kSIjgMSrDt5kj85kNBnsJm7X+uAoLw9lg4BXTE
	0T89m1OiVVA1QAwJda6aMUg0zV0QEca77DD+cqdpQSyS+jww1RQ28RTU/x3ep5vQEEEkcGsrf4s
	qc/M8zmXtvMbVxax6CwtuQbU9+x8kiN7YtJik8H8VlR21nmDRAAHZVaSWXX2QDFL/UP6Kd9G+Pz
	A4Vv2RGsnBfsnoAfodfHF4puf2hw0yuW40kJrEiXi9txH8QqMeMWv7lZSjDm+YL/IGebf4qDVO1
	DH4+ELnghO/Nz3RdGisqaEhNPgn1WuoZC2Bg54FrZ/ECIoAlotDFnn7eU+D/rsc6YeqimOt++aq
	8fZcqw3HYvZhsEa5BXrfR5wWspyp7LEXgn0zZeTuZnl2JWfBudGID3SLtQp9tl2cCCztVVVcRFF
	eX/2ZvV8vdE0oAsdEQxsRT+n9H/m25pgmma7pcwCWhBTMh3Z7xlGfDpaSjlwt4bBlTLwpZzApBt
	8+sxKnzKH/ZN92Mv3S/
X-Received: by 2002:a05:600c:350a:b0:493:f13a:3f74 with SMTP id 5b1f17b1804b1-4954a51df12mr39497985e9.5.1784365067516;
        Sat, 18 Jul 2026 01:57:47 -0700 (PDT)
Received: from OrangePi5-Plus.BB-HOME (20014C4E1B8D1600206D23E70680CBAA.dsl.pool.telekom.hu. [2001:4c4e:1b8d:1600:206d:23e7:680:cbaa])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4954834edc3sm91477455e9.0.2026.07.18.01.57.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Jul 2026 01:57:47 -0700 (PDT)
From: Igor Paunovic <royalnet026@gmail.com>
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Sebastian Reichel <sebastian.reichel@collabora.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@collabora.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Igor Paunovic <royalnet026@gmail.com>
Subject: [PATCH v3 3/4] arm64: dts: rockchip: add #sound-dai-cells to the RK3588 HDMI receiver
Date: Sat, 18 Jul 2026 10:57:27 +0200
Message-ID: <20260718085728.6797-4-royalnet026@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260718085728.6797-1-royalnet026@gmail.com>
References: <20260718085728.6797-1-royalnet026@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Synopsys HDMI RX controller exposes two digital audio interfaces,
one for I2S (0) and one for S/PDIF (1). Add the #sound-dai-cells
property so audio cards can reference them as a codec, as documented
by the snps,dw-hdmi-rx binding.

Signed-off-by: Igor Paunovic <royalnet026@gmail.com>
---
New in v3.

 arch/arm64/boot/dts/rockchip/rk3588-extra.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-extra.dtsi b/arch/arm64/boot/dts/rockchip/rk3588-extra.dtsi
index a264001..fa100e3 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-extra.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588-extra.dtsi
@@ -338,6 +338,7 @@
 		reset-names = "axi", "apb", "ref", "biu";
 		rockchip,grf = <&sys_grf>;
 		rockchip,vo1-grf = <&vo1_grf>;
+		#sound-dai-cells = <1>;
 		status = "disabled";
 	};
 
-- 
2.53.0

