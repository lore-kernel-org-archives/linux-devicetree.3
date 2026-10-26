Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.227
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793039370;
	b=lql7Xz3NCpblQv8J0B27WoZ7I03FdckI7tDQ64mK4QvkKHJHjKICmuJm/vufmqVYNkmH
	 wT4PApPQEJAF4BBRsw6j3uW7WTwF0oSi4E9UpNtU6xVBDyy06BKzD8qaI0d38AU+uU8rs
	 Xa+acRlQCwDVw2xN/oRkoXL6GyqOm9TCsDz8VrihZ1Q2JN9M466w66FIWu9D5n8lPJxs0
	 x3XBzZfa5hHByeNTFq3bpO4Qmtu0QXvkq6I2uk9SETVIBYL7/oM08z6Xgdnmhc7PE1YMP
	 ilvzgQLQNuUh+i/0XS+/l5f19a3rA/ZSvoevmJQ/nsvLlnTeQoFb8d/ngsB50Q/voJg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793039370;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=MA5/QmONgwci+C4pVkhkGywYbmpIkNjdx6wsVgaOess=;
	b=As8x+DdrFTfiUzkCWejUSAe0p1b/GgQKfERzL7pMtqlsHE35Qj4g0Drr5dgUIGfJId4W
	 0JiSLlEENiKu8p2U9rci/GsXo6MqNxcCrchP0GS3DQ4BWU9XcL5SEjrvsSKfwIAy9qPT/
	 d+4TRirdcENFn/eTGPYTOEQ8wgV2EFYmvleEAQBNdKB0IGClqmDOpsD0vflK2YjtLqaDF
	 ZLnliLyBpvb61MTcBftaUsdTLsvrnXHUJ0iYhou/vSLRiiQQ5UV6d2jwTAoUZ/EGcDuW3
	 w/M9TihtRbxBtPkIF7KmJqLtz9wc0outVW+pxjXY767HmMGeyOtPPvizz8UBGXwT9NA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b="MUU4/c29";
	arc=none smtp.remote-ip=209.85.215.227
Received: from mail-pg1-f227.google.com (mail-pg1-f227.google.com [209.85.215.227])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22D56606A324
	for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 18:29:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 22D56606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=MUU4/c29
Received: by mail-pg1-f227.google.com with SMTP id 41be03b00d2f7-cc4c02ddd62so2222685a12.0
        for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 11:29:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793039369; x=1793644169;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MA5/QmONgwci+C4pVkhkGywYbmpIkNjdx6wsVgaOess=;
        b=WY3KNnTW7rceucHPe7s37SNjG8djRHf2+Z79YFjsSbIBKmXXnn6FH+4iIKq/Xk7ev8
         TfNVHgjOD4VnWyHSZCQ33csmgvNNyvZd+Bx0qNMLT3F5Dq6h4M3B6IKoOhZ60QQuq9Az
         owW7Or4oFovOL02gKf+bwThw+CvqC7uO5TnlqVeynA+sBcSXFCGojyzvJEPC5TAvsr6e
         MqChvjuy/TYRceWo8zrl1fVP+6Hkj0mQ9sYvIn8awh5RcP8glM0e3dzPcm/nZzTkStXc
         OXF0iEvAx6yi7YACknOljUz5BcGAXJBNV+qZUimgjJan2zq/BYWKnntqQfzdh/y3jLpt
         +AIA==
X-Forwarded-Encrypted: i=1; AKwUvBziX/FkXE8I8Y0YJ0nNokC4nBKraLOV8QgozsR8mAdZdmKadAnI0X5C7ycBOUz9x6JIuRrpmYx67N2g@vger.kernel.org
X-Gm-Message-State: AFq9FYJJ1j9hNWKT3TRh2XXTXiOs+MoOHvfBbYjWDKc/o/bXyHgciB+s
	GBMrTiHCRC/yoSpng/Bb68AmArJNynjUlMrD3/uZzB9i87SiPBmn8OvEwdG9OmwIeJBvmJ0M7Wm
	/svEbm4bHuy9YL+e0wlwY3je/+4dJbGRWug2nwzUMxjbw89cbfByqw/Uz6X+Jv35wPlpdpy13mP
	jm6YwJzNnVvRTDBMNxrLHFlZBTWyuDaTMEWM0VpfqZkuzBCRSahdsa7YTvOlTBszRQCo7uQ1OtW
	LE4hUQAb6jSS7JN5BXEcw==
X-Gm-Gg: AYBFou1DmrGuqImcfYTjOJSy3ZMRV6jyb9i76V0ULlC+bEJdlT8aiL1wS7h4WR+ZoS4
	4kb3TKwQzWpD+SiJ6W40VCL6BeXlteAuTT5k7L5Rkog/QMyNeNuNtZlhOnfvqRSY1CiKREviGPy
	kcrxIF25XnRn1F6ItgH65ch1PVocrlmFjPm5WaqBzxysxjdokxGsWK5QFxiA36XEFDSgo/U/+1h
	mlDQA1KoQFfSRIr7L/gIEiNasCVi1US+pKtZNvAWYXxpu6PBLy9gP7abi04z8IUWcx1/FDaZOUC
	WtHq998WKl2SEcUl+Tx3iaWD0P5PB68rulhBhGRREstRo5asxeEbCLPrdSASUF6Ki78q5KqvCta
	KZaARNSFUo0iFCETtwnyUbqLDsBok8f0SnMqMvDPAMsWZnv62gcLWVeoKCZFUsqswG0sdS7vfoB
	EHFTHBPCZR/f1C2U9NRkZeMF0MA3bDbvxUvlYazVR+
X-Received: by 2002:a17:90b:2552:b0:3ab:1481:69e5 with SMTP id 98e67ed59e1d1-3adea899389mr6529035a91.11.1793039369350;
        Mon, 26 Oct 2026 11:29:29 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-13.dlp.protect.broadcom.com. [144.49.247.13])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3ae406dbad7sm251015a91.2.2026.10.26.11.29.28
        for <devicetree@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 26 Oct 2026 11:29:29 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-36998507c13so2392772eec.0
        for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 11:29:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1793039367; x=1793644167; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MA5/QmONgwci+C4pVkhkGywYbmpIkNjdx6wsVgaOess=;
        b=MUU4/c29HqY8EX3beDgF2bM8mqMCuEwDUnaXImyYV5Dwq67/IiP2H4TlXWhDCnQc3H
         iyvMQgxJi1i1U2i/xss5I3MDw8RHv+u54ijs1u+OCgKtPgfNW/Qfj2e3+1AW6ysWo1Rb
         yS8JhtTvGSpBrWdbWMGF8Bq/I9kHb4dZ9WCjc=
X-Forwarded-Encrypted: i=1; AKwUvByvuhUEsmSjbJdDGd9VJy04YjJFqNckIGB85cOWA4j1O+1wxle2/oK/lWyUKYi5/h+B+OUMNpHvWHZR@vger.kernel.org
X-Received: by 2002:a05:7301:fa2:b0:34b:5ab2:e200 with SMTP id 5a478bee46e88-369e8455879mr10320919eec.14.1793039367393;
        Mon, 26 Oct 2026 11:29:27 -0700 (PDT)
X-Received: by 2002:a05:7301:fa2:b0:34b:5ab2:e200 with SMTP id 5a478bee46e88-369e8455879mr10320869eec.14.1793039366691;
        Mon, 26 Oct 2026 11:29:26 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a01fa4c58sm24657259eec.21.2026.10.26.11.29.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 11:29:26 -0700 (PDT)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: linux-kernel@vger.kernel.org
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Damien Le Moal <dlemoal@kernel.org>,
	Niklas Cassel <cassel@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Tejun Heo <tj@kernel.org>,
	Yendapally Reddy Dhananjaya Reddy <yendapally.reddy@broadcom.com>,
	linux-ide@vger.kernel.org (open list:LIBATA SUBSYSTEM (Serial and Parallel ATA drivers)),
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-arm-kernel@lists.infradead.org (moderated list:BROADCOM IPROC ARM ARCHITECTURE),
	linux-phy@lists.infradead.org (open list:GENERIC PHY FRAMEWORK)
Subject: [PATCH v2 2/6] dt-bindings: ata: sata-brcm: Describe the NSP IDM registers
Date: Mon, 26 Oct 2026 11:28:52 -0700
Message-ID: <20261026182856.3168686-3-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261026182856.3168686-1-florian.fainelli@broadcom.com>
References: <20261026182856.3168686-1-florian.fainelli@broadcom.com>
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
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

Northstar Plus uses the SATA IDM block to enable the interface clock and
deassert the core reset before accessing the controller registers.

Allow an optional third register region named "idm" for the NSP
controller. Keep other compatibles limited to their existing two
register regions and allow older NSP descriptions without the IDM.

Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
---
 .../bindings/ata/brcm,sata-brcm.yaml          | 20 ++++++++++++++++++-
 1 file changed, 19 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/ata/brcm,sata-brcm.yaml b/Documentation/devicetree/bindings/ata/brcm,sata-brcm.yaml
index fe7f091e744f..98529784b1fa 100644
--- a/Documentation/devicetree/bindings/ata/brcm,sata-brcm.yaml
+++ b/Documentation/devicetree/bindings/ata/brcm,sata-brcm.yaml
@@ -15,6 +15,21 @@ maintainers:
 
 allOf:
   - $ref: ahci-common.yaml#
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: brcm,bcm-nsp-ahci
+    then:
+      properties:
+        reg:
+          description: AHCI, top control and optional IDM register regions
+    else:
+      properties:
+        reg:
+          maxItems: 2
+        reg-names:
+          maxItems: 2
 
 properties:
   compatible:
@@ -30,12 +45,15 @@ properties:
           - const: brcm,bcm-nsp-ahci
 
   reg:
-    maxItems: 2
+    minItems: 2
+    maxItems: 3
 
   reg-names:
+    minItems: 2
     items:
       - const: ahci
       - const: top-ctrl
+      - const: idm
 
   interrupts:
     maxItems: 1
-- 
2.53.0

