Received: from mail-ua1-f97.google.com (mail-ua1-f97.google.com [209.85.222.97])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EECD038644D
	for <devicetree@vger.kernel.org>; Tue, 14 Apr 2026 21:41:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.97
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776202872; cv=none; b=f0CmpHoIIwPwb7Qyx9N7BHR98rfszfUtC3Zc0fmDZQD7sbDrs1xZPLNcAUXPElm0BTUGlAJ4QK4UAuwqiAojCFlMBwzCnTTszeag6iAHPfMeeuoP94JZSU5bJXMTlaJ6AwYhXj8i3/eMCkCNsVS+uJXWQbl+BmgbOkqbzsP8Myg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776202872; c=relaxed/simple;
	bh=krGzQJKr3TEtbFv7KqRzEWMgBO99YFAtdQaOdMgGqRY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=n7Y76gyvCHIyr7O7vstzujwk7Qiowu3YMoDdMnV+Tsl74t7yn6+BUavtpWiGmfhITxyt1kcE3zp9DrbCYCf+2gCV9AK0FXBN8VbwwY8Uf0mxnwlk5/ZlTCY5x+e6tJ5ASz5UGUHWlrU/cNbirjeWniNMfIVR0JE3zVvCTZPvb+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ausil.us; spf=pass smtp.mailfrom=ausil.us; dkim=pass (2048-bit key) header.d=ausil.us header.i=@ausil.us header.b=L1wbKVDV; arc=none smtp.client-ip=209.85.222.97
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ausil.us
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ausil.us
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ausil.us header.i=@ausil.us header.b="L1wbKVDV"
Received: by mail-ua1-f97.google.com with SMTP id a1e0cc1a2514c-9539d9f1675so3611938241.2
        for <devicetree@vger.kernel.org>; Tue, 14 Apr 2026 14:41:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ausil.us; s=google; t=1776202870; x=1776807670; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Qyy2EUSFHuUvP8vn408rgcFPQdBTOKcJ9K4PyZHCKk0=;
        b=L1wbKVDVLRhZJDz2Ftc6OB4ibrxalIt/CJTn0d77L+1ZCE791uE54ScC3qwMMvdf2e
         GBuFlAMLcPWI8K7vlLdJeVhAgzjwyiC4390r9qwHgULtrmnM+ScwdqYY2wBtK7SUtroe
         csIe4qZEk32pZgkHMZ5WRCFVC6EDOnLUjdTbdMjwbiFTell+SNQHBtCvwOg+t45hNmau
         VxEsnEI2X3LhzsUj+K4waEC5GOD0aEbGkMkfjzyC8df2fe4IBvJvXpTDVmczsfds1MEi
         EEmXdLSHQcbOHyUZXy+JLDD0jaQt9nXYMl6HHtTs1jECmJxR2sdB3M1Cy8MALvK7Ecqh
         25OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776202870; x=1776807670;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Qyy2EUSFHuUvP8vn408rgcFPQdBTOKcJ9K4PyZHCKk0=;
        b=iF8QqN5LCOyE7hJLKqjZi9RuoLD/kbFX53lsrlHQ0VjOAFAn5AswlH8g/GNgXPQN7M
         pUb7XZwIhMoQ7mQ3/oxYp07a0E3M13tKmSBopW2oQlGytUzMQzMafm6hmdv3dWV0aHK+
         IhOpF8RRJRgu0JMvf38oRAiBLuc40CZw+ZiU2TW/4bP2oHyt03FDskbhAAKgP3KlMFCr
         B5K8w4l5WdaWhmPDcOWNCVZAVI6GZ/49vyvTKcpJguwOeYPSh/w7AZiFpNRVXKIf22TL
         jMCUVXGiJk+H+udpYJsge4pFDmIZLEMiN3xM7T8mru6HfVuy7AjUAjJoatwFLh6VjRm5
         BE/g==
X-Forwarded-Encrypted: i=1; AFNElJ9Gb3a2Kh1deZa/TahgkjOGkM86IYEyhleulUbrFrGL7DYre6V8A07hHTUIgtrGdMkYGri3UYj741qY@vger.kernel.org
X-Gm-Message-State: AOJu0YzD5JqY5K0BT2kEqi+PcajI/0skrcXXRAM+1Gzbje7IVMsNKwTN
	MTjED1/UkyjfQ10GvH1QZ122CUmwU7Y/eLjF2iM2H4Yt1YvdyR9P6u6xmmvSO5uCd+zeLws70oK
	kwW1mwy60V6eZgr7Keb+TzPnNWRUtO5e/bq7Q
X-Gm-Gg: AeBDieteKKPYiPol7FRdPuU7b0gjiQLl2Q8XjBEVmOcliJtD35Ox4bRZAv+C02cswxJ
	HTVP8J75Fm7/1HHf2ZCr8UvJABeRSbCMrnWc5xntoIbo2BDGjegvaddbCmidFDd7lXkYATrTSp3
	t6nc3X5DR8BjjW7QE6OLeDbvHXsAHBzR1QuicPMPunm1CUrnzbf4MTlTq4tusQ4Fn4XZKfV86xq
	pzoI+8cInGUxV7cRT5S51D4C/LWP+r2xGER+XdY7TMN7owcthZin756m9iBZWL50RBD8UVmGxA5
	+TLUhi3Za4nhDWGtqdBIpoM1M0bNGjqbiXyc+5Eiug0OnRFxlfbQnflwDn8eCnBitNcuM3oXXDe
	GzN0pfuOaGqFb/Bt1BlkCZAN8iBHL0rSIXx0lOvFxqoRRjeKor6q1rjk=
X-Received: by 2002:a05:6102:c0c:b0:608:9c0:4908 with SMTP id ada2fe7eead31-60a01271472mr9236374137.32.1776202869938;
        Tue, 14 Apr 2026 14:41:09 -0700 (PDT)
Received: from ryac.ausil.us (207-179-239-100.mtco.net. [207.179.239.100])
        by smtp-relay.gmail.com with ESMTPS id a1e0cc1a2514c-95691131afesm346899241.1.2026.04.14.14.41.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2026 14:41:09 -0700 (PDT)
X-Relaying-Domain: ausil.us
From: Dennis Gilmore <dennis@ausil.us>
To: 
Cc: Alexey Charkov <alchark@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Chaoyi Chen <chaoyi.chen@rock-chips.com>,
	Conor Dooley <conor+dt@kernel.org>,
	David Airlie <airlied@gmail.com>,
	Dennis Gilmore <dennis@ausil.us>,
	devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	FUKAUMI Naoki <naoki@radxa.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Hsun Lai <i@chainsx.cn>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Jimmy Hon <honyuenkwun@gmail.com>,
	John Clark <inindev@gmail.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Michael Opdenacker <michael.opdenacker@rootcommit.com>,
	Michael Riesch <michael.riesch@collabora.com>,
	Mykola Kvach <xakep.amatop@gmail.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Peter Robinson <pbrobinson@gmail.com>,
	Quentin Schulz <quentin.schulz@cherry.de>,
	Robert Foss <rfoss@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Simona Vetter <simona@ffwll.ch>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v7 1/6] dt-bindings: arm: rockchip: Add Orange Pi 5 Pro
Date: Tue, 14 Apr 2026 16:40:52 -0500
Message-ID: <20260414214104.1363987-2-dennis@ausil.us>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260414214104.1363987-1-dennis@ausil.us>
References: <20260414214104.1363987-1-dennis@ausil.us>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add compatible string for the Orange Pi 5 Pro.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Dennis Gilmore <dennis@ausil.us>
---
 Documentation/devicetree/bindings/arm/rockchip.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Documentation/devicetree/bindings/arm/rockchip.yaml
index ae77ded9fe47..3c6b83a84463 100644
--- a/Documentation/devicetree/bindings/arm/rockchip.yaml
+++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
@@ -1320,6 +1320,7 @@ properties:
         items:
           - enum:
               - xunlong,orangepi-5
+              - xunlong,orangepi-5-pro
               - xunlong,orangepi-5b
           - const: rockchip,rk3588s
 
-- 
2.53.0

