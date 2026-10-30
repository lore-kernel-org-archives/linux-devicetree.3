Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.98
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793383873;
	b=NKnYKGi2XRcluKxjXkWbajE/428d703TwuLgKeHf7BTt9MaxBJp1Zu93A3U2tdLo4ncs
	 ZFvRXvqqqEOyNERRHFqcGTTOVSAik5QGDH04w/pRJ8NnVfEAG5uDHQmoQ1EJfqzfsIPNf
	 Ofd/alJjZqAdelIQuApCgqKzTar+4uUJRDFfdX6ULuvVrnnthFNwQExsUhMiGB7uHcVm7
	 YdWg6eX1d2cgZSEOnBbXabTs0Gqj4rNHL4ZSUOI9/2hCnR/Z/FOxhHb3ZAZcByKNOf6K/
	 JxZlLo0LGw2nVRgAWVLtlmQ+EmZlYF/vNifglqEqJgI0luIg64bwFAKh391tY+QP/IA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793383873;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=yBI12lOTPjK6azkSJoV3g3WBDvgCLjEWrbWWzUZMmOM=;
	b=Uj100bWrZlAPsNxLGNDWyuRDGSBPyPBHa/YoaZy/g1bn3BClGOdGwD/0LH7GZRBBMSsK
	 0Wh/FRWACFkZvUZkmOzUogsNeywI8tchFISVgmlbrvsSVsfJY050QHVPBB1STbS0akKKf
	 HFHRgYaPlt42j+iuuIJWrgIGoX5m1HoDHudLjT6MCBk10OQdbbHcFs2tCgh+V+TlLKfNS
	 ctdWWgIieT8BXsrawGscwbTuRrmuNDgOkfms6pvdljQPLBZSRlW2TqgZIEmsusJHKgO5S
	 4k9FYYlx+/u9e0Qpenxo0trni8B+P4RrhcOj/OIDLfISXynjbnIvMoybE8B1pjgOePg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=RkpZXiKt;
	arc=none smtp.remote-ip=74.125.82.98
Received: from mail-dl1-f98.google.com (mail-dl1-f98.google.com [74.125.82.98])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7975606A330
	for <devicetree@vger.kernel.org>; Fri, 30 Oct 2026 18:11:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D7975606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=RkpZXiKt
Received: by mail-dl1-f98.google.com with SMTP id a92af1059eb24-14394530ec6so1376155c88.1
        for <devicetree@vger.kernel.org>; Fri, 30 Oct 2026 11:11:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793383872; x=1793988672;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yBI12lOTPjK6azkSJoV3g3WBDvgCLjEWrbWWzUZMmOM=;
        b=L5LD5qYtqBuKqaou0GLBC4/QU732wHn+vmQL2BiWLiXIpj69YgoXtgc/QkVdoXChfe
         QBZyEiWWEy+WgPSlmRDQ0/g4lCJF4SgMFN3euhPug7rIyOx16Z9mSK4csR8g4om75pKK
         EDkDS1oj7fXpBnCnah0LZMqSn4jR1Uji8YumQNtx8X/BLCb19QvyJokVCVdKnI06OAIX
         lIz602j+b7EA8lkfdbTzVx7LQ6/I5n3BoplcBxLHIJNiqzx/8WODsHy3V960Wx9gwHYS
         d6wSFQbxKtaQg/5hWjO+gQFu2wsZdae3R/U6DJ4a0R69ZLFBNw9bH1rv9axu/kPAKJN4
         +iDw==
X-Forwarded-Encrypted: i=1; AKwUvByyAVCQ/D7wMA/ZJOzMqJsbjaKl37cEXJffJPYmvkjP8ojhDrGbS+K2W6rHLlDrJqcj8KLYxMneRhLO@vger.kernel.org
X-Gm-Message-State: AFq9FYI4BLQ8XI+WgEAMk/3X5id+4gghC2lHTH+1VdofBC91vwalG/SR
	mk0WcGVQkc18abG6jb+e5m1vH8OPGJxLMZebSTPdByACyiew6+CWM5xh0PsB/axY/MHQi6LpvxZ
	XVXceWyeSN2q28nAsl20eHUnGZ3ULEhS+47hLavoxHC1xf9CiM6bIufzbys2LWzGBkYdh1M116X
	YNI0KJQusxoTlEAMLez8QzCnkwz4jiwCvnuRQzRdfXa9qK12L42PufDrSAC/i9dTd4Dwy4+j3gV
	Sncp97t1dhbCg==
X-Gm-Gg: AYBFou11OLEXOFcn9Hp2hh/eDl0Qc/yNTbDAdmTOm+LzPvyqKm3DfIcYZYOnRnRCadW
	x93cpUhShEd+1DaQZ3CUs7w3FfKL6fTbzLA3pJQceMEJj+rJmk0UIliLSIQgrkUEUfu45aLL5XE
	/uxTI4tLqaSibaSk3lXjCiMq2/TJw176O8vhxTpe3/dxCaExspsW2/EF0FftWL1I6izrcNMCqJm
	qqR6yt4cwu6FHpTtQZmq0FKGiXtf6IsgAhz29Xi8GSG4zmNnWq7qw1CWwXNwKNw1ecUSilkqC8Z
	6fNVsO92VJj0uo157t4MELGdgdlSWvbS9brD1behLbSGxz117gAYWGVZk3m7xZulklBwdiUxECM
	QRAH5Qq6ApkA+/IWnOOEZVGdB5Fpjg79tHK6EG16Esw1UVuTRYEEm6L7jGbYHDidc/Z87fxa3T3
	GMr/FlBQ5DH5+NOVQthQThtS5fDPv2zq1N
X-Received: by 2002:a05:701b:418c:10b0:15d:fb47:4268 with SMTP id a92af1059eb24-1ac5d88c840mr4133597c88.21.1793383871579;
        Fri, 30 Oct 2026 11:11:11 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-28.dlp.protect.broadcom.com. [144.49.247.28])
        by smtp-relay.gmail.com with ESMTPS id a92af1059eb24-1ac17e90c4csm56006c88.4.2026.10.30.11.11.11
        for <devicetree@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 30 Oct 2026 11:11:11 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-193b5eb133eso1134065c88.1
        for <devicetree@vger.kernel.org>; Fri, 30 Oct 2026 11:11:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1793383870; x=1793988670; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yBI12lOTPjK6azkSJoV3g3WBDvgCLjEWrbWWzUZMmOM=;
        b=RkpZXiKthQ69znt+KdT5ioip39Lc1LpAKKZrCNuAy5gFsz/l/pRzh9L1I2q72PLGGP
         nl1Z5Au2s+0CrnaC2+eYGvWXrPzLwZ3ELGohIY6nZ13kz87IZTQLHb4FmGD3kn0tvD5j
         NmRqCKKlVdxCm4wMDHwJL6fngxzsxwKtQVPjA=
X-Forwarded-Encrypted: i=1; AKwUvBwgN80sWi3Nwffwcd/byY496qaHHE205XQfu1lqe6vO5FdhurqljOcuUz/Yvb3fIR8/HWKeCJ3ceOaV@vger.kernel.org
X-Received: by 2002:a05:701a:c907:b0:16a:1fa:58cb with SMTP id a92af1059eb24-1ac56d95460mr4158703c88.1.1793383869193;
        Fri, 30 Oct 2026 11:11:09 -0700 (PDT)
X-Received: by 2002:a05:701a:c907:b0:16a:1fa:58cb with SMTP id a92af1059eb24-1ac56d95460mr4158658c88.1.1793383868479;
        Fri, 30 Oct 2026 11:11:08 -0700 (PDT)
Received: from mail.broadcom.net ([192.19.144.250])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac193b8179sm9974062c88.11.2026.10.30.11.11.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 11:11:08 -0700 (PDT)
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
Subject: [PATCH v11 1/6] dt-bindings: mmc: Extend keep-power-in-suspend beyond SDIO
Date: Fri, 30 Oct 2026 14:10:28 -0400
Message-Id: <20261030181034.3811225-2-kamal.dasu@broadcom.com>
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

keep-power-in-suspend is currently documented as SDIO-only, but the
requirement it describes -- preserving card power across a
suspend/resume cycle -- applies just as well to any card type. Drop
the SDIO-only restriction so eMMC and SD platforms can use it too.

Signed-off-by: Kamal Dasu <kamal.dasu@broadcom.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../devicetree/bindings/mmc/mmc-controller-common.yaml          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/mmc/mmc-controller-common.yaml b/Documentation/devicetree/bindings/mmc/mmc-controller-common.yaml
index 8b9b3b036129..2fc8e06d5ec9 100644
--- a/Documentation/devicetree/bindings/mmc/mmc-controller-common.yaml
+++ b/Documentation/devicetree/bindings/mmc/mmc-controller-common.yaml
@@ -301,7 +301,7 @@ properties:
   keep-power-in-suspend:
     $ref: /schemas/types.yaml#/definitions/flag
     description:
-      SDIO only. Preserves card power during a suspend/resume cycle.
+      Preserves card power during a suspend/resume cycle.
 
   wakeup-source:
     $ref: /schemas/types.yaml#/definitions/flag
-- 
2.34.1

