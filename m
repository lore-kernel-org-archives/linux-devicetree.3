Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB89537E2EB
	for <devicetree@vger.kernel.org>; Wed, 12 Aug 2026 13:28:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786541304; cv=none; b=i/w9k655oc/IYDpBks6igrXc9QnkX0EPcTx6LDzdqvdfSpx8p7no6nVsBFv/UzNNJSLjVUOP1oEAz35nmPmu8zZBxZX+YokPZydSQDr4obtBFo/wPfFyIfZKRorVQrrv/ljD2FASQd6dp/mpmw/fPUiJ/UYGdNQKT2UqQPSzY+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786541304; c=relaxed/simple;
	bh=9QTT3L3Pu9w2O25uxcDUaGMg8uCVo2PoWmNv0ctZxZ0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cBD6iDbOSNws7fl5aJNK7WowClX2W19i3cfLlbD7ZeUc+Z5F3pWmrKHYoag7xJ/C+RnuMAJSfsdPL3j6JJhBHjGj9ihkvyUPmAEKabHTt8Wz4BolBja8EmWDIH86gY7ZeNzchSRk/BL86wp/869R9QArQ8a9FQmaIYqqU9TIw+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PZmJN3/B; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PZmJN3/B"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-47f7027ca11so611247f8f.3
        for <devicetree@vger.kernel.org>; Wed, 12 Aug 2026 06:28:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786541299; x=1787146099; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=u4+1ivRLPQ3G7Kv8GU2D8AHDkWXF6MhoqD65+o5xLeA=;
        b=PZmJN3/Bh09iNNhZJZZw9cIaaz4y1ziZXNP9dgzVV6usNSr0hMzSSQ1cD0fIc4G1ZF
         Z8wD8SFyd/paUvVeDkI9x3UOB/dtwcO2XZkjbOTDoT7bPGtK9pIZSIG6/ej/bZIVz+p7
         LliSB2L9z3C9VjWhIwG/UGN9cHaBtBR2vgCHHCkNmSK142BxMf/cRz3670+ExF8DHaS6
         N/7wC99Kc6Rc/U5/3k2rmu4gcxSEBAr3R1Nilr9kwpi2Rjbo9KhFSWET6yLrluNQ1EuS
         TuwxNstlMpSFYvj/fMUwyFvDqzrCMVOtTugdbZapVeVqTYq0ujtJxNlB+I3/YjE6biEr
         bpow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786541299; x=1787146099;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=u4+1ivRLPQ3G7Kv8GU2D8AHDkWXF6MhoqD65+o5xLeA=;
        b=LJ99S2tk2l+QANj6V0CEbRuAOrhNzNyPt/QUS8W2yGb4aildlpifqTjpS0uekDVIM/
         89iqvi6FEi2yqjSTeXCsg0QQ0kL7C5iepzMMARujmtbU1KlmQlvqHKx1K7rmFWn7RNpD
         owKHcd3Hxzx966cvkwhCYi7ataALLc+MUNFJVbzpA/575zivydsoBdepet7jXwc5Jxw6
         goSg/vDxEAtaK4o2vcI7/WcSPIInwNYY1IMXT1dMaLvEinjxPJ1U0NO4rydbS6nwBY4x
         tJp/jKjW+vqPKbZFKFU0MnbCZsJjMNGeoA/sG7aoPHDoZpsOzSAmblUwc+8L0IS8WfZF
         tECA==
X-Forwarded-Encrypted: i=1; AHgh+RrGElisS+C2JkPwNpCsZpwj2Jg/6UddkbNBOOIxoojeVVfZR7q3YkAlDNARv8vLNhyfbr+T+BwOTP5Q@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+EdCFppxmhdaQoR4x8dN9/f60mUgzSV0bxK4Dz+ndhJT1NC2D
	BSGljDXbYH9RPF1xbEgYnVYGaNPw8b0VgppkkGOKuoup3QNpra6j/H0H
X-Gm-Gg: AR+sD13jUYOuXa8HtWbQAmGN2EW+0skrjKYdry96R7gkv2KEEbM0RfavetQwuOJZBSh
	Ve79yaVQ5q3WbVY/kqCOc3K6jNaXd4wzJ4K1lyL8cruQiDeMQqN6MG75qfkVbC5g/8RCktEmkDq
	OX3SC8W8Nof9TR1J1PWvUQKOkpUEOnsh9BbCswdG8c1LofwiMbJr9DG44SxE1Q2MibFchSMQ5t7
	1dfDngtFWFc6eQ5n4XIAPZtq8Rnj+qTx6DxOoRAmFaU+y4m301oAzrENMTpjD9rqGLOk+ofSzUK
	KPhns2wIQqvGIo9oXHnL4J9D7wkOa3UFhdPg/3qE6L992neIgiTbeSfICoMyOIm2+gROafvzAMg
	+N2eQgTaPc1YVI7JriGYGtDGYyFHYya2R36YOdcXK4bbSXARVWqxCKeBl+Hmh9VVHlZCF66+tAa
	Y8GpLlV6oAFqTyCBA5wmI0BhXsvNMNfNJmStf8Ih72rPIVPG8vQ7iflFn+/gECiih33INuhddt7
	nr5Z/Q7Nea/rWQr2P14SxiD+TteHw==
X-Received: by 2002:a05:600c:821b:b0:495:3e08:ad19 with SMTP id 5b1f17b1804b1-4997c1459cdmr73221095e9.9.1786541299017;
        Wed, 12 Aug 2026 06:28:19 -0700 (PDT)
Received: from localhost.localdomain.pl ([89.151.31.85])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4997abf917csm87818995e9.13.2026.08.12.06.28.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2026 06:28:18 -0700 (PDT)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Jonas Gorski <jonas.gorski@gmail.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	netdev@vger.kernel.org,
	Hauke Mehrtens <hauke@hauke-m.de>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	bcm-kernel-feedback-list@broadcom.com,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>
Subject: [PATCH V3 4/4] ARM: dts: BCM5301X: Enable extra CPU ports for Netgear R8000
Date: Wed, 12 Aug 2026 15:27:55 +0200
Message-ID: <20260812132755.32585-4-zajec5@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260812132755.32585-1-zajec5@gmail.com>
References: <20260812132755.32585-1-zajec5@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Rafał Miłecki <rafal@milecki.pl>

Just because port 8 is a preferred CPU port (because it provides a full
switch functionality) it doesn't mean other ones can't be used. Let
software decide which CPU port to use.

Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
---
After some extra research I discovered we can't blindly update all
BCM5301X (Northstar) devices enabling all 3 ports (5, 7 and 8).
Sometimes extra ports require fixed link but it seems to be device
specific.

 arch/arm/boot/dts/broadcom/bcm4709-netgear-r8000.dts | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/arch/arm/boot/dts/broadcom/bcm4709-netgear-r8000.dts b/arch/arm/boot/dts/broadcom/bcm4709-netgear-r8000.dts
index bbb6b869507e..ef8f3b41d696 100644
--- a/arch/arm/boot/dts/broadcom/bcm4709-netgear-r8000.dts
+++ b/arch/arm/boot/dts/broadcom/bcm4709-netgear-r8000.dts
@@ -226,8 +226,6 @@ port@4 {
 		};
 
 		port@5 {
-			status = "disabled";
-
 			fixed-link {
 				speed = <1000>;
 				full-duplex;
@@ -235,8 +233,6 @@ fixed-link {
 		};
 
 		port@7 {
-			status = "disabled";
-
 			fixed-link {
 				speed = <1000>;
 				full-duplex;
-- 
2.51.0

