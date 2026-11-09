Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794240434;
	b=jmTCrcheJgBOLYtupoHoBSSqkJpzcKUWZr1kr0HurnVojVKOFKJNNbl8bTOy7BjDPQhg
	 w12IiIfwdIp/szRZ/heOYimTUOUGDSAMdz8eja9J79KCONg/7DuKEo5/H394OsarkY44w
	 Zyw1mQ9v9eU9uJHlC+RHn26Mlw0uiipaSl25gzEEcA7ar97EV1fCKTRY8pnbc+DYBrhSn
	 HdLDgI44XK9rfySXwxy5LEXpGiGoVNnozwwRp3Vd3/2OG2Gh713pZLOepCpMJvKcvvf4Y
	 AxnhegKM4yIekHAVYBDW7CMyRpzBFlnQQDqtoJrbBdyxCCIgQ6yMlVEsZMWB0dzHhOg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794240434;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=GMHTZUTZEeBhMzmR9yLS176DSNdNzj0orFiUqserfBc=;
	b=YD2Ln3VQ2CzAbmtYnDvsPKJw2ptRLbP9jZSwLinjPWFhww0LqpO89W46pEBH214RpQ/E
	 iNQBNtsf+bKSL6nFMNJ2whCrMBK/Ls9iT4PsgoC6IbRNVTgKGfegAKpM1hmOIKb/Q0uX5
	 6VEJPlBZMzNkc+l6heee5bV9U+O79Tzczs5ZNgaXXRNuNvhaAxKxmgKwxcuUlhV10CI43
	 fq58Ujv/WYRsdHCXeG6dLG7ARUoi2X94wzXnfM7BW8KqGdhwk+KjTfpmqpVDS8j3wXSLH
	 fkje4Ija/C9NlyasH7l/VD9IWh+xsuHHoyBSaFdS70wvOljKx9+1R9t/BxnIPJ1IRUg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PsOJVKWO;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10214606EE8D
	for <devicetree@vger.kernel.org>; Mon,  9 Nov 2026 16:07:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 10214606EE8D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PsOJVKWO
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a9a8d6cea8so12893395e9.1
        for <devicetree@vger.kernel.org>; Mon, 09 Nov 2026 08:07:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794240432; x=1794845232; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GMHTZUTZEeBhMzmR9yLS176DSNdNzj0orFiUqserfBc=;
        b=PsOJVKWOXFsmmhSSRVgz48PowWyv/erowuas4M5LelsS/z3b/xxveqOxWVmVXMQWBY
         bvtwywdu241mVSeNTHjVRm8/GHyMofq/TYEV92ZTorOuLCL53pRmVziEJZXzxF2GuYvc
         jx51DWLr93Zqfy4HkqwuYIWJvCCMrmHxBaw/b2rTbYtVcwmbG46gU3iK7utH2354Grds
         Qob3QmTOoolnw9lULm6sl4dVSfYoQ5mjj9W8qj9UzsxEfzDVa5xH//0IOTcm4KinARoB
         Zay4ZXjeJfKaF1LGqdszAdJ8CH1bJQB13Qqa5op3jBha9GvQr+fYfHTYE0oi4Hq/6v4a
         T5nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794240432; x=1794845232;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GMHTZUTZEeBhMzmR9yLS176DSNdNzj0orFiUqserfBc=;
        b=gGmTVbzoYsfGddegScf51cxkOiaXnCqqi3bIljv9ovEqc72kQathl4MT0zlRoe/5pE
         u6lqb7ys6h1Fk8Mu6HLxVJs8mwWMLLoGUOJ6lUXq2ktBOo6ttVyTDu68Lq6h747WsaIf
         zGNo9rkV4YMK55gjP5QBA2DBCatPn1K62BM6QYVkNLjYJMKea5VYWwdoIwAFLodKpfof
         clG/34pep4X42qEYmkkbFIp5wEfv7E0N17Tm7EgQ6XHB5BKwEPRXylSADf4Ny0eVQx4z
         xVzizlr4u6JfD+Kr3TuErydsa+BO74WNjcyYRuObefqVBD1QirS3FRSTZgBMDK8qiCUE
         P0zA==
X-Forwarded-Encrypted: i=1; AL+hErFFFvO7edC8k1WLapJLIcgh9PbY5QTXSQ0lDdqRqbwoFRwygxtfJ7X9YaoBvSS0WZr1oNdaJPNWwPre@vger.kernel.org
X-Gm-Message-State: APuU4Z8j9GorJMGlxVmUl76cBMhHfP5PMcGteHBna0/TJJ5zzkOxOmCK
	EcCTmqcrEo4AcD25rcJveQuMClgmcVFPu8KrR1yZMBZ2rZDJAMwYHe8y
X-Gm-Gg: AYBFou0Kq1Pacd0pdaHJfJfiBeCOB4hQV9euUSK8OxVJfm1unSbusyRwfBWYyQUW7zy
	2Tyiy/+wYpB35jjQPm42XOfEvienrf99ZFlF+JRVMRAgQPePLbnj4ylZYLplFiABMn0oFFoQ8I4
	8Olvvkp6aA2MQtIhvK/HubitkMt53QmDKWXiXd4lf19oD88RuNY7tcoXqpLbrtYQ+cMRjhtN+zQ
	pj1dtCDEMLK3ot6ljZxSLE66AlvYtomco0Yj+SDU9OTQgWZxpKzQYJQmRTbb7rUqKjuNRya0Vb1
	t1S2Hc1d3tXFlYCxus+Jgo/vD5J7qAHmmkrpE6mhxYq6lvx7RG+3qsdOsZb89UCdM/SvWoLOIqa
	kDB8QO62ygMbuVFC+wyPctfj2TAb2sFxOIOCoWGRh0UI2qBAVI2/pJnE/EjOS3Jb5r6lAouggmu
	5qPP4BTndsoKhymvL0TX9/4ghqw6vukeEePhvTqZVVJGepYZW+gf05G7jXBMMUGgj9ooec5m2zI
	Io+av9ppBKNhnG1Ptzpjof8dFBS5jho7nrWvLKaa249re4WMvUrXC9YukGc0h2ZQzVPIWusEaW5
	EcSJ53jZI7sY6LtmHWH2CWk3l6FCTy7nri+9FR5sDORG+v19rDM9LbKFPNgJ7hTcbhA5NizSO5/
	06kc032FpVckTckMbexmhMI4jrZb4SBpEfWjEjTE/sQ==
X-Received: by 2002:a05:600c:34cd:b0:4b4:a551:681a with SMTP id 5b1f17b1804b1-4b960d9c587mr81960605e9.3.1794240432064;
        Mon, 09 Nov 2026 08:07:12 -0800 (PST)
Received: from romain-ThinkPad-P14s-Gen-5-AMD.tail433d9c.ts.net ([2001:863:742:6109:ac9d:152:38c3:6463])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b90f119b96sm159174245e9.15.2026.11.09.08.07.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 08:07:11 -0800 (PST)
From: Romain TISSERAND <romain.tisserand@gmail.com>
To: Igor Reznichenko <igor@reznichenko.net>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <jesszhan0024@gmail.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	sashiko-reviews@lists.linux.dev
Subject: [PATCH v2 2/3] dt-bindings: display: panel: ilitek,ili9488: add the PocketGo S30 panel
Date: Mon,  9 Nov 2026 17:07:05 +0100
Message-ID: <20261109160706.2272332-3-romain.tisserand@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261109160706.2272332-1-romain.tisserand@gmail.com>
References: <20261109160706.2272332-1-romain.tisserand@gmail.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Miyoo PocketGo S30 handheld has a 320x480 1-lane MIPI-DSI panel
built around an Ilitek ILI9488.

Reviewed-by: Igor Reznichenko <igor@reznichenko.net>
Signed-off-by: Romain TISSERAND <romain.tisserand@gmail.com>
---
 .../devicetree/bindings/display/panel/ilitek,ili9488.yaml        | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/panel/ilitek,ili9488.yaml b/Documentation/devicetree/bindings/display/panel/ilitek,ili9488.yaml
index 016a573893b7..2908808393aa 100644
--- a/Documentation/devicetree/bindings/display/panel/ilitek,ili9488.yaml
+++ b/Documentation/devicetree/bindings/display/panel/ilitek,ili9488.yaml
@@ -17,6 +17,7 @@ properties:
     items:
       - enum:
           - focuslcds,e35gh-i-mw800cb
+          - miyoo,pocketgo-s30-panel
       - const: ilitek,ili9488
 
   reg:
-- 
2.43.0

