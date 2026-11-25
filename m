Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.228
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795630865;
	b=d0TkmaE6PbU/+YqQUah7s7T0MDb77IqXcEXAcayoGc7Ia3iO3YOIimOvtQirOgcYZ8uQ
	 UIhRYJYYnvKm6+K1Qzdl9fZFu3wVOxdXT/IXPPDyKgh8cwPObb2/uXhxEHTABhwLvBDtL
	 eQqzmZQiaCwSnePlK74BQMhZe5sNrvuF7ilJvIsstZHIV8EEZXMSTd8PeWyEkHvJ+J8W0
	 FJ2wXYUUQPeaa3li7LKaxuAt8d0xxI+aL41ro5wWXi10sQtJszlmf4EQ8BxjSBdwOAVKj
	 9Nz9V448WPQbqeEzIoNdJQF2z4uApeUMSwNLLirme1Y/qas9DYpiG47QJ2bEFiDZLPQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795630865;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=6b8iqkpAnic8aYFUTWit4E+L+/N2cQqDU3rU0AhCuwM=;
	b=RpTwUnZJ6eUJnyn1C1OP28dZxSdRrdkWdflmHMcYPUL8vgQdxSm7ygkPKznMGjrXhYAP
	 RMoFKIOSt1TvMSWR70U2lIWqhs4DtAtjZkDJPzLWST/Tj4VFwWP4EXKmVxU+tzg1LsSX6
	 bX9D9cV/ZO2RwpF8hM94BzsKu0ZFe+8tk1+huXIGENZoLWgmQmeumEh4t5TfcHxomepQO
	 e0bulFxp3mhcPpqSf/6Y3DrdwZo+c4IWU16+03IeiH6M9NG4/ztt7oUZ9AvtzzQjoMBJi
	 GtbtV6lcR47i1L9qA840nRGm3y8WNvfUCgpCVNYxonpkYQaJu2meYb3427yN0+LdM/w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b="gOl/P67g";
	arc=none smtp.remote-ip=209.85.214.228
Received: from mail-pl1-f228.google.com (mail-pl1-f228.google.com [209.85.214.228])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6F56606A338
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 18:21:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D6F56606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=gOl/P67g
Received: by mail-pl1-f228.google.com with SMTP id d9443c01a7336-2f041f88577so34366315ad.1
        for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 10:21:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795630864; x=1796235664;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6b8iqkpAnic8aYFUTWit4E+L+/N2cQqDU3rU0AhCuwM=;
        b=FL3E+NbJOI6NI1I3oaM1WBKXgv9duv1ThgWuiRRpaOBNZYNxJVCctYPN7G0oAreGS5
         k2wpafQkLqXe2ML5BYBslZumQ/GK8Km9EYTzga+x7v06ymzWLUEKSQGSsbAvil9eGpts
         13qkR8c85GazqpSMmW37Q9BIbGOuh0BF9laPq4FQXgbWO6WNcphaxdtS+ZsjEfAIbwYt
         4H+bVHEpdIcHpiAeaea7npzEqH0Fu54MPPDHGf4ljcuAsdKYYG+/epnaDG3H4xjs47Uk
         K5NzmG5QRAjaPWFlM3TYgKdqfErsGVS7y8VlqSkEjZS5rESpgH2QapzJEVYTiCcrVU6R
         IWYw==
X-Forwarded-Encrypted: i=1; AL+hErFTbChy9gth/prhuv/MRtcV8HeC0bQpSg/QYj2F0O1fiKwk3ZuGduVe6q6EjJYINQnZNV6kujnBTam/@vger.kernel.org
X-Gm-Message-State: APuU4Z/O6MVxjEIr4RNsj9nuO2RmlvfKjKsSyJhpEWgQ1QbF3/54PAAm
	G2crUdEIIP4m8R8kXCBqwtCaOyJaA7pv6/rxzD4P7UKMn1cDf5D1GdRFG0jCkbkB7sRZhd0uJ/z
	HSQLodMYe0kPedSK1RxRMKhYOPqA5b5p63ViE7zLNIjoBB8DzngJlywI/uE8c3r0cE1J09R7MG/
	QBaseiHDQhQf786bcWbDu3xgraE+eR/bMCjqExISeg/QwA4zhoffuc4DAsJK5pQtCoN+2U02WyS
	BgMGpaLRZRbkA==
X-Gm-Gg: AZFdTZfGYLF5BRiai2OXj+pVDelYTv+7HQs8rMcYyf3kTW+b4uIM4okUNrUGydJk0Wm
	9UZL/V/T6ZCBX7g8lkeYVLeggAjqQeXFiq5hD2Q+hAkzqq3JQsB/W27kilqJYKKCAt416/GcCyB
	Xaj69TxgtO9m4AY5GkVyemeqa5ASZu2mj2PeydpznAc395/ary/+99jVXk7d2ZOKaNhQ+WsvNvh
	iWF4unvZMu7kFdPaJb7JoWTezxkLBwiSqaAS8OVNdF0YCJFZBP8KThmllkTLFNjOSKrca8aCZjQ
	huLY1P8d20nDA3/WOdUsm2Xm6z5Jwk5AgEYSquvHhRKcho5vT58tYTYpFLyDT/6siwAcu1SlaJZ
	VVBK7vy8TGhS0DZGxpGad6uq781StYdShR7qDNyC6cwxHv/hdhaf9NinLXR+/aABCA57mL4g+GV
	WjdcGpXtfhawe71mXwq1HUVqwHZtTvyIrU
X-Received: by 2002:a17:903:41cd:b0:2ed:1b26:2bf2 with SMTP id d9443c01a7336-2f03ef5a3ebmr190113505ad.3.1795630864128;
        Wed, 25 Nov 2026 10:21:04 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-28.dlp.protect.broadcom.com. [144.49.247.28])
        by smtp-relay.gmail.com with ESMTPS id d9443c01a7336-2f0de8c8098sm196075ad.20.2026.11.25.10.21.03
        for <devicetree@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 25 Nov 2026 10:21:04 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-94960131b4eso230197385a.3
        for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 10:21:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1795630863; x=1796235663; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6b8iqkpAnic8aYFUTWit4E+L+/N2cQqDU3rU0AhCuwM=;
        b=gOl/P67gjjkFZEW5ieHCBToIlAmjGW+aA3n3HQFvqIFwyPK3VS16HKDtGmovsfWXku
         wSLoKmdoi/cLGQms69DUl1b1SasZr9YOdNTA4brqgF8+aGgDogrpp4yIj7N7SC5WtqIA
         SfMCpOoMOIY3IUSFjHxh+1VPUw2Xb+Tye2TK0=
X-Forwarded-Encrypted: i=1; AL+hErEe/9Xv6NubTCs6qQ9Myf9gYo3N4rnvwRPHZSG4/fuqHER/mqU91mDt+y/1Ucc4FQuaikNTgtjEphPL@vger.kernel.org
X-Received: by 2002:a05:620a:1a0e:b0:93c:a40d:e3cf with SMTP id af79cd13be357-949ba828099mr3342614485a.1.1795630862699;
        Wed, 25 Nov 2026 10:21:02 -0800 (PST)
X-Received: by 2002:a05:620a:1a0e:b0:93c:a40d:e3cf with SMTP id af79cd13be357-949ba828099mr3342607685a.1.1795630861913;
        Wed, 25 Nov 2026 10:21:01 -0800 (PST)
Received: from mail.broadcom.net ([192.19.144.250])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-949bb38322csm1375419285a.17.2026.11.25.10.21.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 10:21:01 -0800 (PST)
From: Kamal Dasu <kamal.dasu@broadcom.com>
To: linux-mmc@vger.kernel.org,
	Ulf Hansson <ulfh@kernel.org>
Cc: Kamal Dasu <kamal.dasu@broadcom.com>,
	Ulf Hansson <ulf.hansson@oss.qualcomm.com>,
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
Subject: [PATCH v14 2/6] dt-bindings: mmc: Add reset-card-at-resume property
Date: Wed, 25 Nov 2026 13:20:49 -0500
Message-Id: <20261125182053.3915833-3-kamal.dasu@broadcom.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261125182053.3915833-1-kamal.dasu@broadcom.com>
References: <20261125182053.3915833-1-kamal.dasu@broadcom.com>
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
