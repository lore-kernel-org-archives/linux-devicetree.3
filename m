Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.98
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793383877;
	b=Cs5GeAeI136eoZdTiIQpPkK8iSY8U/dzQuEkU6gvmZeBK8rrNyfHnd5A6UemeRF8WP35
	 wYWrM4P4nxbPhfa8yOzqE6RTuE9IhqLHhMbV6CSlWhcNxDK2c7pow3fNRw8LlljuPc8Ev
	 O364s5Skuh7B152bLi0KK1gC/kkGEtOXu1yLbL05du2f9OkibDc9DNXoa8xKpZQPuQzxi
	 7cy86asSkxw/H3lJutp6oJcFXsBa5SyRHAh+uW/ueZ1PKknKCKZ5A+7DQaZexQbuFfvmI
	 Q79UtDNhqemc3U/EMWiY1SC99cuXfTLTwbpFSaKUmgLsdBqvmeIe2UKps3ePJJbGCZw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793383877;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=xJErFKYPU8d+wmmwqjpCjFo6vbn7aqgwgH2UyvNH/5A=;
	b=YGSrHHGrevz6nk4yT4uQF+Cls5mWsl/n7+3wk8LNbXhTzWG3COV3MIaBa9wxDbqLrzKG
	 tNFt9zKakEO3qlexD2ytZPBjLaZWmH1bql+oMCfACagl4MVSL70L8oEXaTdJEed6nMpNX
	 dEQ4UG/j6rAAXXX44uXuCMZUf+tAWL6wJxE+gKyPGL9/Y72oENU7ELp01ZywuwSmsvkt1
	 P70h/oqiKkbpmgtkid3g+gohXmz4RnbJnacpNf/W2UDCRAwDkFPl0BiwMK+7mxeD17Tv6
	 I1GQmtBYq4Es/fdFJ/fB+2vu5rcoX0nZejKMhpG3smAiN69RclFnPwjC8aHD7H9Ji2A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=WXuArCAN;
	arc=none smtp.remote-ip=209.85.216.98
Received: from mail-pj1-f98.google.com (mail-pj1-f98.google.com [209.85.216.98])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AE05606A33C
	for <devicetree@vger.kernel.org>; Fri, 30 Oct 2026 18:11:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8AE05606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=WXuArCAN
Received: by mail-pj1-f98.google.com with SMTP id 98e67ed59e1d1-3acdcfa2bd3so881080a91.3
        for <devicetree@vger.kernel.org>; Fri, 30 Oct 2026 11:11:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793383876; x=1793988676;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xJErFKYPU8d+wmmwqjpCjFo6vbn7aqgwgH2UyvNH/5A=;
        b=a85W/CNpoJzXw+4NEW1qqG/GsDTw23auSd4MsMtGeBsU/zUMnj0BPifz2WK9L2Ff8F
         uRhjIIfo6RUnFRPrBZeUX5rITIGVbsS4B9dSW49kV/HVhYTp9NQWJxMOvzL0Eq0Wj+TO
         0WQEFYi9QkEJR00J1gkDSyasxMVA5loOXR99QkmmgzqkddZhYRggNp8UcMVukZsMLRqU
         tJm/eSr1UyzApoL/HihTMWsPAAz6/93iaczDAUahcFHo9A++VyXZmFAGz2reDW+18C4Y
         HOsWkqv6YDpeT1nxompdR3jTmHCwRrGDy+5v5dMiNjsHa2OSbPGG2g74doh2rnf5iAcY
         2WuQ==
X-Forwarded-Encrypted: i=1; AKwUvBzWXWLZ9Wsy8mA21owB2VYsfYc6f5SZfLJ5WOGBGIuycdUzWiCdf1J8aJCA/quXO+hAaj+lwPYB2hlg@vger.kernel.org
X-Gm-Message-State: AFq9FYL68Ym6tM4UZlM1FflSwjqMkOFvUErvo3pSQ4eC71kFy8S4Y7OY
	l5UflXmEFg/EnqUrrPUk07LzzXmhhFBZO3+lpeCNbWH6101ihVEB1zGcQg9Bj6Ah/0slPm3/KtB
	n8LK4TkrMHXYk/PBN8SsGDPeoQdRkc83V4W8iQsOZxPALpHm1twTYTy0zwnO82h0obk8Kuf4/Oq
	i44zYLex167g2TPiMuTckfNwkVmYiCGq5F6dipZlH6Tp03+Ea+a+g2WJq+JsTRzTdl73xrzICBN
	i0AmPToigqCTQ==
X-Gm-Gg: AYBFou0i2legOkMkX93JLONZDKG6iU9ihFvvEwP6ivdGnx/UEhXf/siIX72g0S5hfGr
	APFKDUa2a7bmqYM8pvDi/p8fxzB4RYqmq8X9gbKj1Jn1nqWNonHyZ9hMw82hwZ0laV6dnh/Kbyi
	MPvMWcRwxGO9yPylZ+v0S8Z8jIRzpFAmNbavAcwAzti4gCa3T3yWTqISJnmiEIgBA/1qL18qOtn
	ejfl92VnQjAZlnTgwQPAEmKwfCGOzOo6aGAr7gzjx4HThcr3cO7kcX5pWMiwhIQZAHwo2Wh4R4A
	amMFPOR2KeRfb78xkVpAFQ9t6M0hgcvqbmOhPsfwb+M0AObou76XyMSZXHRcJyfjh7b/Ur2VaNg
	5hK/kOIjEDUavlKU/zUYKkSn4m25kRAGq1jQygA5YbOWEFc/okTEWgFlJLOwO1iQmeiXwe+Yyj4
	+C6qsIql2Wf0LPVzNikq91cBy0GKWCk42C
X-Received: by 2002:a17:90b:28d0:b0:3ab:36c4:b500 with SMTP id 98e67ed59e1d1-3ae895743ddmr2637212a91.5.1793383875648;
        Fri, 30 Oct 2026 11:11:15 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-13.dlp.protect.broadcom.com. [144.49.247.13])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3ae6e874b16sm4535163a91.6.2026.10.30.11.11.15
        for <devicetree@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 30 Oct 2026 11:11:15 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-18eb2616974so3039441c88.1
        for <devicetree@vger.kernel.org>; Fri, 30 Oct 2026 11:11:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1793383874; x=1793988674; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xJErFKYPU8d+wmmwqjpCjFo6vbn7aqgwgH2UyvNH/5A=;
        b=WXuArCANuNRrlQXK1MvdXaHrH1tToNgzIMKsqHm0o9nSqld9JthB43PP4jJoGpmmOQ
         LOBjmTXh5el8wW78viuBWgDnH5yF03eZvLT4XNrcs7VM852QWZiAoIrLpDLCUn3SD8Gs
         k7l4J2GBoX9q6cfm08HdVzSK5mRAgNa9rFm6s=
X-Forwarded-Encrypted: i=1; AKwUvBwC7nY9Urhn2DFz1Gq6a2TUlXxsbc3Lk54h07u9r2X0pBZJFCpl1mHtXjuYcTQ8tM7r5mdg/WWqPTdI@vger.kernel.org
X-Received: by 2002:a05:701b:4181:20b0:153:4a27:4ea5 with SMTP id a92af1059eb24-1ac5b7e02cemr4125487c88.28.1793383871498;
        Fri, 30 Oct 2026 11:11:11 -0700 (PDT)
X-Received: by 2002:a05:701b:4181:20b0:153:4a27:4ea5 with SMTP id a92af1059eb24-1ac5b7e02cemr4125437c88.28.1793383870764;
        Fri, 30 Oct 2026 11:11:10 -0700 (PDT)
Received: from mail.broadcom.net ([192.19.144.250])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac193b8179sm9974062c88.11.2026.10.30.11.11.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 11:11:10 -0700 (PDT)
From: Kamal Dasu <kamal.dasu@broadcom.com>
To: linux-mmc@vger.kernel.org,
	Ulf Hansson <ulfh@kernel.org>
Cc: Ulf Hansson <ulf.hansson@oss.qualcomm.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Oleksij Rempel <o.rempel@pengutronix.de>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Shawn Lin <shawn.lin@linux.dev>
Subject: [PATCH v11 2/6] dt-bindings: mmc: Add reset-card-at-resume property
Date: Fri, 30 Oct 2026 14:10:29 -0400
Message-Id: <20261030181034.3811225-3-kamal.dasu@broadcom.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261030181034.3811225-1-kamal.dasu@broadcom.com>
References: <20261030181034.3811225-1-kamal.dasu@broadcom.com>
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
 .../devicetree/bindings/mmc/mmc-controller-common.yaml    | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/mmc/mmc-controller-common.yaml b/Documentation/devicetree/bindings/mmc/mmc-controller-common.yaml
index 2fc8e06d5ec9..c824b95f2ae2 100644
--- a/Documentation/devicetree/bindings/mmc/mmc-controller-common.yaml
+++ b/Documentation/devicetree/bindings/mmc/mmc-controller-common.yaml
@@ -303,6 +303,13 @@ properties:
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
@@ -371,5 +378,6 @@ patternProperties:
 dependencies:
   cd-debounce-delay-ms: [ cd-gpios ]
   fixed-emmc-driver-type: [ non-removable ]
+  reset-card-at-resume: [ keep-power-in-suspend ]
 
 additionalProperties: true
-- 
2.34.1

