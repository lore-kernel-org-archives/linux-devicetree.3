Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.228
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793042289;
	b=AJQSKhVCIjucqbasEi5AMhmW84vDPSCctnXFkh3zdSf7fptswGU1cAWe+enDBWNxVq1q
	 eADgVntkJd1A+jsJ8LMqetxRxAhYWHzPLNHx/fOpD7/O/YZxVvm3NWWo+vlixQQqg9oQH
	 0Lnpd9wBCcUTFkT8pBZnz6+vbeM3WcwpFyO2+YxlQTPUjsiRYALluphPRdIoZOoke8jRg
	 rQNV2V7QwDQBSxzKRYH9UnSiyw3p20lsZG1lgYLsfhE1y5O7iVzltv/CwDRxPsguryC9j
	 FXdJl5J6mFaybBZWiPfvRxz8ai1szn0gSEIoOMWv5DgF9emPo7J4e5IOQxqkKRrietA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793042289;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=MA5/QmONgwci+C4pVkhkGywYbmpIkNjdx6wsVgaOess=;
	b=NV3ZoORADkqUKemLh524dcUo+um6d2GbC/TNecy1X3jTj9z54GvFTnj1PusvOVdc3LCi
	 btjKDhW7f/HmQx2LqWzMaoZzIAZ8B0COqtfwMQcKq/CqcwSMKEq+3irIej2bql+s2hcR8
	 SOkGUIwZNUdhYE8zwGFmHkPs2l2H3FC32JqbF4aUVBKRe2p7m1GCRH04u4Q+wBPhH1j4M
	 RvB7IhWH7OKLnaQ8g8fxGMVvDUFh3OFCDhizaNVv/XItGe8xVMJgl45R4uE3C8Stw8oyE
	 yQcEjLP38U8bT2f02EL5wGBYIKDOCgi2D3GIumq3eum+txEtkNzmUIoQDkrlxuWZbcw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=Gxvak8Yy;
	arc=none smtp.remote-ip=209.85.215.228
Received: from mail-pg1-f228.google.com (mail-pg1-f228.google.com [209.85.215.228])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E6D1606A327
	for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 19:18:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1E6D1606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=Gxvak8Yy
Received: by mail-pg1-f228.google.com with SMTP id 41be03b00d2f7-cc4dbda1e5dso1046000a12.2
        for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 12:18:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793042288; x=1793647088;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MA5/QmONgwci+C4pVkhkGywYbmpIkNjdx6wsVgaOess=;
        b=x/9kXInxqH+1Ky3qmhHRBFOrm5iC2p1sQIsMiSOaKccNPV8MONI/IymDGmIpeQLMxU
         iWq6hkUjnlzLXZGGOd7vcfB4l4pDuk8VBC5UltmZLc3+VjnQOEtaRnmomf1o8KqjTT2e
         kjcojbHgpbIvAexU33p++yQ82Qfnz7xm1hdJvOg/G6OMv7f+URsmgyYCWWz92bMejBFp
         hG7Yl8/P1JRQC/dnV98Vhslthjqep+MEN8skBGVNXOvb92vAlP8kQo3mqkuxu17hunbq
         waPvtuYNFRNROFKcLpClDlnCSu8EaM8q20YY0jOnfSz6T23otjCYwgi0sn9PVEuO1mua
         ugoA==
X-Forwarded-Encrypted: i=1; AKwUvBwuRC5KcpNIBwM13JSfu+W/LNRLbtcflg4Z6Ro3fshYeVt3yrruOJ3cMPg5M2034bp23kshTFng924Q@vger.kernel.org
X-Gm-Message-State: AFq9FYLn85jO4CxSWhhfzFT/n1ZNmy3bNOBXmXMGj9rqKtNGFZe9WWGg
	avDyN+EkS2YwwCZxLqVQqtxVnRGizPKmsrYT9rF+1giERIu6sIUFXXPOGCGrQW4XGuOqQKCOl/c
	J4TOTtYhwEsgyvGBwJQnAb21Rx/yk7zbBzO8J/1l6eNRQghlXLQkZwnMNqBwbatY4vVnCbjrS/b
	5Oa4z2huZPMWt5I67UhxOYrKJPvdqM6X/LLJQZI6hGjSUObQVJdFEMOAZ1XzjUKaufYHcjljhIw
	j+d3yNZV5zRCtJE3PKOsA==
X-Gm-Gg: AYBFou1Um0r2rECRKBFIdu1t6o5WHEfVGAn2SlQaSi/C24DdqO12PaMMlZmNOqLfbAD
	Ut5Wn8vjECCJHY+HxIMuUvLYdlC2wnGrzC0EZXzntklsTad1x++6Ma+DgZqmej5wYg6XJhBkwti
	WdcO94Px+DgGXZadqe/0YboqdEwGrWWv/76T3W8q8gUJG1P+2yUezbBhKcGBBso38CtdZGV4YCg
	eomE7ws9xDlzpa5SvBcg47IH6t5alA1ximY7QhjNbOUjOxHANQRq5SlaE1exXIRzJCHJq22hQHP
	rw2DARw+8JnIccGnCMml+Woff8oHtKIb9/7gPUFvZX04nIB5Y7DbSnb55K3YFAPgYaPNoneS2qQ
	aGpCtq8a+2IVB36c046t9+vF3prkv4mpYrn6or1efmqc8B9o3BKo1YaqJHCQrxyS0QHdO+rwsbM
	zYrCxjZ6Tqp9H6wJ0Ad/MyhdWN6S2Qz9HcX0FSzp52
X-Received: by 2002:a17:90b:35c2:b0:3ac:a521:960 with SMTP id 98e67ed59e1d1-3adea07d5c8mr6227292a91.1.1793042288438;
        Mon, 26 Oct 2026 12:18:08 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-28.dlp.protect.broadcom.com. [144.49.247.28])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3adeba6ac8fsm3472450a91.2.2026.10.26.12.18.08
        for <devicetree@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 26 Oct 2026 12:18:08 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-91bcd0247edso39078586d6.0
        for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 12:18:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1793042287; x=1793647087; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MA5/QmONgwci+C4pVkhkGywYbmpIkNjdx6wsVgaOess=;
        b=Gxvak8Yyx5pIICvm7yrCD9e43FZdm2i6wKYuAyzHsTZaz/opfCV15pPrDJqqvzIxb3
         EGLVGpYTnSBrlufLuRjbNW8fmqp9BQHcdjv3C/QvZC68ggXNAA4R+XZk+SMK1JsppO3r
         miqZV+cXpcnFBukKpJEb3JcMicF2khkPWBKYg=
X-Forwarded-Encrypted: i=1; AKwUvBy3Wvh2aZbeTuRuSYwU6eg0eCB92Wkhz1tBaWsoxJKgTfamwC6CFNpTQGq4NXfUbAqgBTFUJj8ZCAdX@vger.kernel.org
X-Received: by 2002:ad4:5f48:0:b0:91c:6983:8012 with SMTP id 6a1803df08f44-91c69839846mr35564766d6.4.1793042287073;
        Mon, 26 Oct 2026 12:18:07 -0700 (PDT)
X-Received: by 2002:ad4:5f48:0:b0:91c:6983:8012 with SMTP id 6a1803df08f44-91c69839846mr35564286d6.4.1793042286610;
        Mon, 26 Oct 2026 12:18:06 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91c62063dacsm33430996d6.37.2026.10.26.12.18.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 12:18:05 -0700 (PDT)
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
Subject: [PATCH v3 2/6] dt-bindings: ata: sata-brcm: Describe the NSP IDM registers
Date: Mon, 26 Oct 2026 12:16:14 -0700
Message-ID: <20261026191618.3178830-3-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261026191618.3178830-1-florian.fainelli@broadcom.com>
References: <20261026191618.3178830-1-florian.fainelli@broadcom.com>
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

