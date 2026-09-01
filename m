Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED89A38CFF8
	for <devicetree@vger.kernel.org>; Tue,  1 Sep 2026 08:57:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788253046; cv=none; b=bI5MPAzQIc/jq5GApisJ47zxpF/k9C6zAKDYl/REGH+fiCLEDRrA/vf7QcLLsC1BBrlo2yYBi1vpcqwqRgOblH/ehOdM/lFxDWET+6RHwW3ML54l8beL3BSH7naXOXhZhAPd5/xuLgfwmfOFzJN/RpBHeoP1Fdgg4daJSN9GuHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788253046; c=relaxed/simple;
	bh=5EN9gj1NuJxJzKBR19pdp2IOB3VptHKZV61+tHNfah0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=DD3mckUz2ckYFW9MBpuyXsNw/Gwz2VmL3vP4aCvTXDCt23udgfP4ykU/jKfdHH9Q9VIraUPh5VVFY9TCF3AfCfvDznZve/5W+/aPvv3QL/RvQwpIcouMgX4/019dgVHRhxHk8Ppm3VfuJD3pJHVr2QqayuFlHLDYzJF1PIwVM5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=synaptics.corp-partner.google.com; spf=pass smtp.mailfrom=synaptics.corp-partner.google.com; dkim=pass (2048-bit key) header.d=synaptics-corp-partner-google-com.20251104.gappssmtp.com header.i=@synaptics-corp-partner-google-com.20251104.gappssmtp.com header.b=G14ku1Yf; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=synaptics.corp-partner.google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synaptics.corp-partner.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synaptics-corp-partner-google-com.20251104.gappssmtp.com header.i=@synaptics-corp-partner-google-com.20251104.gappssmtp.com header.b="G14ku1Yf"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-38dc4553f62so6221032a91.0
        for <devicetree@vger.kernel.org>; Tue, 01 Sep 2026 01:57:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=synaptics-corp-partner-google-com.20251104.gappssmtp.com; s=20251104; t=1788253044; x=1788857844; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5xzW0n7QNW4SkJResUk2G1u5HyRDJbdbqCtfNYhy8Ys=;
        b=G14ku1Yf3V9slbi7Vn7zwcbtsjmNoXVWhuSJaR8eJeWqciMo/BCjZZSgGGVSQkFPqk
         zKlnmWsdFmti6YN630HHzMgMYpdQaAcZvWN+fW6ABcLv/qoamp5dQf+Vro+53GBZQkj+
         z/KhEtV+UVwFt4UrOprFJbtjmmLY9Vc2pCl5hCWI7mLGTo7bZoMSbfu4rlA83CH5rcKw
         rFVZKQMdqoxtsVXRTePYXmiaPvyI2A41fGyfGqd8V5NWaqv560td1N9jPhc95cIJQCRE
         2mlAR+AYoFOxRglEzpeRFGZkmjO2PBlQUSgufl6gOqiSegfNzKn//pn+4b9aJwLvJqiB
         TEMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788253044; x=1788857844;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5xzW0n7QNW4SkJResUk2G1u5HyRDJbdbqCtfNYhy8Ys=;
        b=gp6JVl7xdd/eIJ7CVRe/74x/nucBEl8/oXhUZodJzTov9g9WDhCBRs8ozIwEMWIqI6
         bFH/DEdWDXguTCOJa7Kul98RDwRgHuQ/oy/AVwHFupthyvQ0zsA4OJjivr/n0lp6GmEi
         sLfPBrfzra2knpvz7lkM+n0OxMRUslo1vBKwbkP1NoXk9I+pplMODpvEQED/HSc8hOZU
         IEUoAgLgU4Z8VwGUBsrpyMvuFvEVGbcxVWw7cZ+t7F/jIrQZawN854PHlAwPvYc2fHs/
         piR/0w+i2EPB6DaaZdi8u/oU6Wrqsgeb1hML51HP+5tb0LUG9HLY8hjvw63aw6CizHEE
         PBfQ==
X-Forwarded-Encrypted: i=1; AKwUvBxsmVv1UH7GnSktiXb41X1Si3UQEwClfzFNIoVV7zc8erIDCBagb2BEqp/C92Y0LcVdcaCVuwUXOmLt@vger.kernel.org
X-Gm-Message-State: AFuF++kkIuEuwCB8o/SHk43nxYr7PTFqkC+xQ/5za3V2IHDXASLV0lDq
	6tQjSraEV4UscB8bQWsQzcgqNRlkZ/YTPwohRoYyzGhHk+TQZay7LHf5+bvF1BprOQU=
X-Gm-Gg: AYBFou1eJDsN4Su7ifFe0Db+IwcHFetZDuFbvA7c3ZsZVxoHT6qN58YZ3wHisppxyZ+
	qK+fBRTCVJsI9dyz+TrnRN3p4Ue9SzAAwSjfkGtt+n06Z9oFHmUWfqN8nTVe82RjTdhtT4wxftA
	KTX4GdAbLlHr4doqmEVZ8LMklHELObVs0rvCHsmnmS2uManQVCSBTSo+ebt/bmtX7I/aQdZQVqt
	SEqljCtTCFwDfa+/gnUXSxjblFPCQDAyBToFKG1xwx/S8HdkyTpaaXxeD/4s1w441U9QufCkBHI
	5W5eXi2TERULhoiD8AcLfsT/hHBim8lT/Scl/4lKYek+qf1o16kadDGPCwmsyuVnNRa4PDiLzv7
	GtcHPt9JlU7m+Q0RZuv+mkGlEtIDLAxPft2PD1Jex8aODD0G/K6tEmWjtc6ZEt3zESBdUruG4kv
	T5uhNm2bAKaNThoGz1VR2bhCfDtCaoZyTQBHs8N/VaRerELnsv+9mSDUetYZVQdI+5Z7zjQhm66
	XXjXtXxlPU0C+aGf0dMPLhxA0mcZh6Bp+RpbMknITwKDCUiajlr3HdvCVWElpbFxIboNiHhBEFT
	a/WBdg==
X-Received: by 2002:a17:90a:d887:b0:398:b71e:60c1 with SMTP id 98e67ed59e1d1-39907df015amr9550349a91.12.1788253044304;
        Tue, 01 Sep 2026 01:57:24 -0700 (PDT)
Received: from bt-tpe-server.synaptics-inc.local (59-124-75-166.hinet-ip.hinet.net. [59.124.75.166])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3990bcf6800sm5934432a91.3.2026.09.01.01.57.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 01:57:23 -0700 (PDT)
From: Andy Chang <andy.chang@synaptics.corp-partner.google.com>
To: linux-bluetooth@vger.kernel.org,
	Marcel Holtmann <marcel@holtmann.org>,
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	Linus Walleij <linusw@kernel.org>,
	linux-kernel@vger.kernel.org,
	Andy Chang <andy.chang@synaptics.corp-partner.google.com>
Subject: [PATCH v3 1/2] Bluetooth: dt-bindings: net: bluetooth: add BCM4384
Date: Tue,  1 Sep 2026 16:57:01 +0800
Message-Id: <20260901085702.1515378-2-andy.chang@synaptics.corp-partner.google.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260901085702.1515378-1-andy.chang@synaptics.corp-partner.google.com>
References: <20260901023300.1382808-2-andy.chang@synaptics.corp-partner.google.com>
 <20260901085702.1515378-1-andy.chang@synaptics.corp-partner.google.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the brcm,bcm4384-bt compatible string to support the
Synaptics BCM4384 Bluetooth controller.

A fallback compatible is not suitable here because the BCM4384
controller requires a dedicated firmware patch file (.hcd) matching
its specific hardware ID and revision.

Falling back to an existing compatible would cause the driver to
request the wrong firmware binary and fail the controller
initialization.

Signed-off-by: Andy Chang <andy.chang@synaptics.corp-partner.google.com>
---
Changes in v3:
 - Fix typo and GitLint failure.

 .../devicetree/bindings/net/bluetooth/brcm,bluetooth.yaml        | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/net/bluetooth/brcm,bluetooth.yaml b/Documentation/devicetree/bindings/net/bluetooth/brcm,bluetooth.yaml
index 95501e858e6f..612d21123aaa 100644
--- a/Documentation/devicetree/bindings/net/bluetooth/brcm,bluetooth.yaml
+++ b/Documentation/devicetree/bindings/net/bluetooth/brcm,bluetooth.yaml
@@ -31,6 +31,7 @@ properties:
           - brcm,bcm43540-bt
           - brcm,bcm4335a0
           - brcm,bcm4349-bt
+          - brcm,bcm4384-bt
           - cypress,cyw4373a0-bt
           - infineon,cyw55572-bt
 
-- 
2.25.1

