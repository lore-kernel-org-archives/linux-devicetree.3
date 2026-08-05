Received: from mail-qk1-f225.google.com (mail-qk1-f225.google.com [209.85.222.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBC7336196A
	for <devicetree@vger.kernel.org>; Wed,  5 Aug 2026 22:25:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.225
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785968718; cv=none; b=Gm2ZaIEbLtLJjdCguiPc0oKk3dOI6coBGPX9rlsK6zWAlWSOqgee5L7QlwjD8zzV8w5xc4Lue6+XbHBvfEhwpriqlwWX7/D5WSqNs0mTSFgPZ/qCHjR7n2wdFIPfwWG7Cx/jXHkYAD+/AU3GuEDXmRffUz6SwpsKpSLkCeV/Ehk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785968718; c=relaxed/simple;
	bh=6qwL+yfFZcESUNF5HiWRkDnZTCmWLZVhdGnov/uFMbE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=oA6DZZru3j4I+alITI9f8jOT2OJQzy9Ubsi1bcRgXrPhupOftF8PFQ8pYDq7bSO3GxJxuvC2+5a7TCtFslDY6i72+r2ANoxg+sgZHRtC0FPNLVt1VJvUBxS6ad6KJkjMtFd7O8ydKEj3pwBsLRJu3frOKvk3An156fxyL4+VmKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=erIc+Auj; arc=none smtp.client-ip=209.85.222.225
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="erIc+Auj"
Received: by mail-qk1-f225.google.com with SMTP id af79cd13be357-92ed3993c1eso84373685a.1
        for <devicetree@vger.kernel.org>; Wed, 05 Aug 2026 15:25:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785968716; x=1786573516;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aR+KeTjwxOC6HIctWVlnauptoumuvtPEgsVHqo6aA/w=;
        b=ZXocOmZbqIulyoh3WeAbWZqV4TY7vK8qo/DaZUz4eJF7NRlCThI9AeM674rJ91dQNi
         2iaBAKfp/TrcJBb0u+XyICF3oFKsWHFF5poOu8NLD7Lu0hGLxE9sKYC0Mwgv7IqscZL6
         aB7Hv/WRAI+lIxwKTV9ONFz4V3tK+KiVKB8ONIvN5AfreZ/Ib0WnOkD9D9bAQshUnNbk
         Tqvhgv2sOxrYhPG3utpevRRWDNoS9y67/GBKaU91wdpxifMDMrX05QnouNXnciOSu8mp
         TXMOuoJo25sZjFbL+0YgAQcqFxLjQX3ObKV3cZuNVYtpLLK9hYXB5KWswPuWknPyL0uQ
         804g==
X-Forwarded-Encrypted: i=1; AHgh+RqeQfz1KOK0vebO1381k9jynkQlo2Ft4dEv1iGJB0NS7mmml2Y6WGxZG4szLmPUm4TWuS68SnyENmBk@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9eM+fz0aMu/pVRe1otLpC5bOS7EC/LEtL2lUcFRx4qIoZxGlH
	/uKqzOomWgVrvQ5pQxrG/+OB3Ot6lBAGlRgMDh2L3PHvftLBoTjt/AZwh1rVMvVSqT726eAuO6f
	6/XbO2hBcMSqvw3qh/lqObVN9660/hb26Lev7hdwmBsCgYZ/+go+/8KuY9GWuun85P7YSHszuoR
	+8xfIqh+SuHSVUbOo8GTEY9dbGrALSnkoMOHiYnHfqv4a/CUXB95zY0KB0anUxKts4vWRI2q1mt
	UBZlaQT7OH1SQ==
X-Gm-Gg: AR+sD13fMHUSF4jygsR8EFOssT1UNKzG7gxW7quGwZ3+W0nxQ5HcoN4bMFY6SMIRD7T
	igsBc0UDDa4lUR914Egm0LEMZznV7FuBPw8SGQWCaQzCWSv2KegVGN0HYun9JRbJkWJa56xfFCp
	mdPRn/TZOINtsWGH3GingyRlYaaX8HaPl1pMWNZFbzurexuM3Vw4vXfoEeZpeFGVHOFUNoY6CAR
	ziUy2mqTI3dqDzTNsmNlDZJCC3iMOhNSyGR5Z5PAm/Z5n9vKfM60ZutSaysn9l5joKXQnTgVzOF
	uYuufIFZOJr2qq9Ky6YrlXOEeSgOHzirbiBqXqJBGmQWAJvbHnRUhtE6Js2+NY65tZk4P05m/+s
	XJNOuKd5Bj0IL48w9ib+03gTwJ/wp6euzApOCVEdeD/y/UOohPCGEgbzjoAYoFkhBFKTFz0xvdl
	2uoP7DPxs+SE4k6r0CYZm2zzjG3NcARnxJ
X-Received: by 2002:a05:620a:8307:b0:92a:a400:df70 with SMTP id af79cd13be357-936492f1ca4mr786016885a.47.1785968715582;
        Wed, 05 Aug 2026 15:25:15 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-26.dlp.protect.broadcom.com. [144.49.247.26])
        by smtp-relay.gmail.com with ESMTPS id af79cd13be357-9364a2c6c89sm63851285a.0.2026.08.05.15.25.15
        for <devicetree@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 05 Aug 2026 15:25:15 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2cfbf3e4a63so38378045ad.0
        for <devicetree@vger.kernel.org>; Wed, 05 Aug 2026 15:25:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1785968714; x=1786573514; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aR+KeTjwxOC6HIctWVlnauptoumuvtPEgsVHqo6aA/w=;
        b=erIc+Auj8TsMWxfKzO/qaB51lq+FRDe2ySmLtB1kkmg+4NheD+WSCR3CPWQZutvjv0
         ep+xGAGy/3M1uAp8CHxrTkvzieik/ORrfYzr2gPAPXa69jGgG2CFr0hObhyD7BARbgX3
         DrAcb0+gaRMFb8UQInSZ7iKg3fMJZTKoUOInA=
X-Forwarded-Encrypted: i=1; AHgh+RprBDb6Ah1+wehGoOuWdW5i89CoqT+dvBy0wsGz5C4sMIvB+SMFm2+1zjaNbCIBUOWDC3eAHbISaL9e@vger.kernel.org
X-Received: by 2002:a17:902:f644:b0:2c9:b2c1:13ec with SMTP id d9443c01a7336-2d0ca756f9bmr18188775ad.11.1785968714403;
        Wed, 05 Aug 2026 15:25:14 -0700 (PDT)
X-Received: by 2002:a17:902:f644:b0:2c9:b2c1:13ec with SMTP id d9443c01a7336-2d0ca756f9bmr18188235ad.11.1785968714061;
        Wed, 05 Aug 2026 15:25:14 -0700 (PDT)
Received: from mail.broadcom.net ([192.19.144.250])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3158676f579sm18526160eec.20.2026.08.05.15.25.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2026 15:25:13 -0700 (PDT)
From: Kamal Dasu <kamal.dasu@broadcom.com>
To: Ulf Hansson <ulfh@kernel.org>
Cc: Kamal Dasu <kamal.dasu@broadcom.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Oleksij Rempel <o.rempel@pengutronix.de>,
	Avri Altman <avri.altman@sandisk.com>,
	Pedro Demarchi Gomes <pedrodemargomes@gmail.com>,
	Erick Shepherd <erick.shepherd@ni.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-mmc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v7 2/3] dt-bindings: mmc: Add reset-card-at-resume property
Date: Wed,  5 Aug 2026 18:24:59 -0400
Message-Id: <20260805222500.2567801-3-kamal.dasu@broadcom.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260805222500.2567801-1-kamal.dasu@broadcom.com>
References: <y>
 <20260805222500.2567801-1-kamal.dasu@broadcom.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On some platforms, firmware or other hardware accesses the card
during suspend/resume, before the kernel's own resume path has run,
leaving the card in a state the kernel can no longer assume it knows.
Add a flag property so such boards can tell the mmc core the card
needs to be reset before it can be used again.

This is expected to be paired with keep-power-in-suspend on boards
whose firmware needs the card to stay powered and live throughout
suspend: since the card is never power-cycled, nothing else would
force it back to a known state on resume.

Signed-off-by: Kamal Dasu <kamal.dasu@broadcom.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
Changes in v7:
  - Added Krzysztof's Reviewed-by.
  - No other change here; patch 3/3 now requires this property
    alongside keep-power-in-suspend for (e)MMC rather than treating
    them as fully independent in the driver -- see that patch's
    changelog.

Changes in v6:
  - New patch, per Ulf's suggestion: rather than fold "needs a reset
    at resume" into keep-power-in-suspend's own meaning, describe it
    as its own independent property, so the two can be combined only
    where actually needed (brcmstb sets both; SDIO's existing
    keep-power-in-suspend users are unaffected and set neither this
    nor a reset).

 Documentation/devicetree/bindings/mmc/mmc-controller-common.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/mmc/mmc-controller-common.yaml b/Documentation/devicetree/bindings/mmc/mmc-controller-common.yaml
index c18bf0d6a56e..6929969ed5a2 100644
--- a/Documentation/devicetree/bindings/mmc/mmc-controller-common.yaml
+++ b/Documentation/devicetree/bindings/mmc/mmc-controller-common.yaml
@@ -293,6 +293,13 @@ properties:
     description:
       Preserves card power during a suspend/resume cycle.

+  reset-card-at-resume:
+    $ref: /schemas/types.yaml#/definitions/flag
+    description:
+      The HW/FW may have accessed the card during suspend/resume,
+      leaving it in an unknown state. Hence, before the card can be
+      used, it must be reset.
+
   wakeup-source:
     $ref: /schemas/types.yaml#/definitions/flag
     description:
--
2.34.1

