Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DE1B37F002
	for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 01:50:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787017810; cv=none; b=r38CGDYJEZ+xEmyCcNvwr8fhVn5ukqW9Il4V5LYx09ScyDG2XasjRhaOp9UDZMQY5QS1WEgL03T77phErMMqNpmYuNkVN/oJJwEDgvdtpKATOw9RHJ8Bbea0obAQxXR0VgvvSli5ERYH5maWx1eHrBVIFbEMwXEu/3zCHqYOM9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787017810; c=relaxed/simple;
	bh=14ZJCz1b3PYPlQZdK+J8ksfvy5pPcXd3uJYOzeBcKww=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JNErOtFLV2tpLmFJGGuxo6V07GQ6QsDT8gjmBGLklvLjO89Eig+EZaVrk8n5vo4f0xFzdGejl02UCsD4yXIUjVYMJxdzhsKJoQo5XIOvihBV7pdwq+pxJPXl3jnZ4hLcrIzHC3VDLNcj2nwcqSIYLMAVjlfsfufby7BMr0SdTRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=synaptics.corp-partner.google.com; spf=pass smtp.mailfrom=synaptics.corp-partner.google.com; dkim=pass (2048-bit key) header.d=synaptics-corp-partner-google-com.20251104.gappssmtp.com header.i=@synaptics-corp-partner-google-com.20251104.gappssmtp.com header.b=e5ZaZE6D; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=synaptics.corp-partner.google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synaptics.corp-partner.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synaptics-corp-partner-google-com.20251104.gappssmtp.com header.i=@synaptics-corp-partner-google-com.20251104.gappssmtp.com header.b="e5ZaZE6D"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-38f620399a0so3557810a91.2
        for <devicetree@vger.kernel.org>; Mon, 17 Aug 2026 18:50:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=synaptics-corp-partner-google-com.20251104.gappssmtp.com; s=20251104; t=1787017808; x=1787622608; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=z4xDj0w3ozT3KZ9ITWnqYhsyzdEsf8N4l5Lp5dY2A10=;
        b=e5ZaZE6DY6oddnVCiVxe29Xwvfcn+XQb8R3RGQDCgRMDn7cPsS+pWKxljNUj+EgMW+
         H7ICrR0yXN9bSXXtaqoOCyzr85DFtkZdQqM26yJDmDA1dN77iWwGR3K59aLTc/Spcsu1
         VH/ZVjGFHk7g0zAvRgJ6PxyCnjRa5ikBh8upa6jMPDNEa6EP45xFNdIPUJgdEGDKLkIz
         pb3K1BicbZoRkeTXmx/vZvPhdACWLnu7iiSnweG1dzWd+czrrb7/4mcnpN+rgwuy7ShG
         k3vH8Jb1iW5xATkBl5pIpd52Vdlme44BOjMVKo5940kyOGq0D4dU8rOYM7KerBYL5zbF
         Y7qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787017808; x=1787622608;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=z4xDj0w3ozT3KZ9ITWnqYhsyzdEsf8N4l5Lp5dY2A10=;
        b=CkLLNlxoly2YZZI1q9VFIis/DcQ56jQmnZ2rlUaF11zETw74Af476ckDv3EIld8Mq3
         3K7T8xRA4b1COxBfknYzzfoHvzXDILW133THGem3Z5Rpqp5p4v+1ruVqNsSrpW3Q3qcN
         jCG4XSQtQMuC8PGhPzqw3/35LJAVNWVb5LhR0Fu4bGhp9zrdp5n+GDjttng6INx8A35b
         H2hX+qDssQUK/Wgw+S6XDrE4D2jNw3XVehADh3DQJnyHrNzkVP1p2W67k1U6qZwGuno4
         3LwX2cp2WL4YTAjd4i875cwbwmz4gljShneVeQp3WXtNirItMTBPUVV1XZUqQhKWDjli
         cN9w==
X-Forwarded-Encrypted: i=1; AHgh+RqfAbGRjjM3drqd2Qa05FtAENWoFvkU7SaBV08NpDrdjxSZAIOsgFCc19E5jxZe2WjKzTsHZCJU0J7m@vger.kernel.org
X-Gm-Message-State: AOJu0YzJ4onQqwSk2FfunXKEdHth78nFvZBwHjYSzFhPEXw6yIwtNAvM
	Fn9v5cRk0eI29MCJyLcrNiveIsAvPyHjwMdKKKcsB89xClNQqHG1Y5cISm86tGw2Ig==
X-Gm-Gg: AR+sD107rgSIXW0O5pObX24ncMnRH+ooZT73pW5Lg/a4BBhnW3XhumJe8IHB1aZGsuL
	MRPM+D8x7IzFEFKyV5yciTF85pW2xNgUaW3JFgFc5hLZSG9/s6BxyCDuVNlNzDQ/Y6q9ZQhK+my
	ajl27B7F9dF3ivGc9lZsGUJdFsMCxArMEYpRnpGd3+xcFct4YzNaqMuCt1mjYBeMd9Tq1kFaziL
	Kp1M7tKpcjfeK3PruxfT3AHoW2ciUCdX3XOcfaZS3luOFft1jB19oDdLvggxscy62mSPkLzW/YS
	2Yys/W4wbw5hFms+XxIVGkQfWWFW37/JAej7kBc7zNWBfehPrF5mUz9HpuTZJtGpASlf3EoI0gd
	yHiFM70/Gba5Q6FeRgzauTWS3ss3v18q2MjXDdZ2Kl7NRGBESN+T/JDkQEo/YcipNPS98L34K0u
	ROy608THLr8S717+sE1bdBJmoiUAUBM0d5cNxaUeU/15hIRfuBHs2SXT+B7FnfafhtO6n/eeX44
	prjEsUt9A9j0S2zQZCww6Amb6wl4sbsld6iDoGJ21RMnV3f7Lp5vSkE223vlVap1YHOH/vxb6pt
X-Received: by 2002:a17:90b:4fce:b0:37c:6910:5758 with SMTP id 98e67ed59e1d1-3955a3dd55fmr5823371a91.1.1787017808425;
        Mon, 17 Aug 2026 18:50:08 -0700 (PDT)
Received: from TPE-build-server-2.synaptics-inc.local (59-124-75-166.hinet-ip.hinet.net. [59.124.75.166])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39531e84118sm7364750a91.5.2026.08.17.18.50.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 18:50:08 -0700 (PDT)
From: Kaihsin Chung <kaihsin.chung@synaptics.corp-partner.google.com>
X-Google-Original-From: Kaihsin Chung <kaihsin.chung@synaptics.com>
To: linux-bluetooth@vger.kernel.org
Cc: marcel@holtmann.org,
	luiz.dentz@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linusw@kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Kaihsin Chung <kaihsin.chung@synaptics.com>
Subject: [PATCH v2 1/2] dt-bindings: net: bluetooth: add BCM4384
Date: Tue, 18 Aug 2026 09:49:47 +0800
Message-ID: <20260818014948.996739-2-kaihsin.chung@synaptics.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260818014948.996739-1-kaihsin.chung@synaptics.com>
References: <20260818014948.996739-1-kaihsin.chung@synaptics.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the brcm,bcm4384-bt compatible string to support the
Synaptics BCM4384 Bluetooth controller.

Signed-off-by: Kaihsin Chung <kaihsin.chung@synaptics.com>
---
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
2.43.0

