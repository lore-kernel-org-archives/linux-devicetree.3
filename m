Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795496483;
	b=qR7rEa+uuUGhJLBxaOkS+nTNmct60piJ0hGhJ4MiAsMVvYsGg7+Gxovi2zoAUi6BnMaI
	 1BPoduxPln+qcsdXxev8qaArX1h+fXYIjy+4mD8bUT1KhXE+gW9Nk1XXLnpygaB+VxFEk
	 6VR2qJmkHYyP1eaeX0jNJdbqs8Gvhy6W+9rXh0f945gEiFZp1rlzWEQWS4bpGeS8lI2ga
	 hNKasGsm5PbFCbuRW9P8jYIypu5xwu77fwxH8g2nh1WQdHvQ/L2Jm0OmbOZidWGxnu/6p
	 PpHix4eWliJzKDl+ymOclZZ+C2UR+EIdUDy/SZS1AJMS93g2id9stpPQ1lQ/FOwqLVQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795496483;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=ktgJZX8JcFhhcfmNRdxV4CsSaV1czgWtlUVf7nzy85g=;
	b=E4fIeaT1bP4Wb3t6xCBKC/E4P4Cfj1Hsx1U+iMW1dvrh7HPZVfld8jWIC8M7SRecoD1O
	 rc9CTPtH/hGS1EyeWsG3C8B9N4T282r+8ZKg+Aytrs0EiaELARoJlJKdmIFbUXv4NisV/
	 O64W4BHKOjAhf3tnRNWQYdoFirEQU7+C5p/QmjTpHtSHS0mGE3F57O/80mc2UcR024eeL
	 CgqmlAN9HpgEGyKRl4QFcfIvjUOvbFxoJpJTIsEYUGydnD655swAPNjqSLi36qh7jZHtE
	 jQU1rbDdVmPDZ4KcGhK8J/hFbKywiGcK3C4L9CdtVLhUO6z3eYLTfr4NxKQEQQO50HA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fFwW39wk;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 909ED606A32D
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 05:01:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 909ED606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fFwW39wk
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a35ac4475dso29688855e9.2
        for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 21:01:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795496482; x=1796101282; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ktgJZX8JcFhhcfmNRdxV4CsSaV1czgWtlUVf7nzy85g=;
        b=fFwW39wke2UeMDCDyevcDa0QjkORf9/JkWrBApvM1whIeu/MT3idKy4WebrycEYBil
         tC+PUgojm8iYFB5tml3gP3Q5qoYXeQZLfjCRIcTphSyDUmzKxadrvPT3vj3QH3QQ/6f3
         DigN9ccmvY0F7qid5AISIGgJ6jCHfwK5u7s0G01YvulQAgnFvxZbnWptKFZbge5hkMy+
         30OCIlQMWrmeabbQ4o0X2dvLQ/rY7Ecz4yFfTIZPx1Z95fkIKxUY3cPHHJtjjpUwQWTH
         vGCluAYEbrh30LWxsvE4Jk1SBFOZFMa23dsMc4K+wj1Ixf9CaxWfROVbATpuhAxiwU6L
         ozdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795496482; x=1796101282;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ktgJZX8JcFhhcfmNRdxV4CsSaV1czgWtlUVf7nzy85g=;
        b=lSipK2Ueo4EvB6AhS/+TlOiG/PTe5nGNqTcTaRGqVMuua6hslE8S/RkIYyRC2peF3G
         Uva1ekqDpqscilzAjo8c4AIARrnlzqWqmBKoAcZpyCBhLUG/OnuM/qRqrc0clVwDawzo
         URIQc80+BLvWw1cigRb+H+8fYg2zobmVNI6PlfQmMHxf/nGnnM6t8rsOMHODhSuacDNd
         zpR1g9yIXKHw7Qq4rH6LHJiiMS2wcbKcUWx98+IW65wIJExEk9leNquM+zzxxLqcZ7rI
         jVI2RC44eIgeINpIvaIJCilZsM0Q+sLDo7xtkJTnBS3yFSg+johFZvcATPYlOv7BQKZE
         f+/A==
X-Forwarded-Encrypted: i=1; AL+hErFwCPBzTuiIg9o3qAesAB4ofcBml2geiLp3SYD04tuqTlR7FmrMBkTKDdr6fw7unAIB4rcxVfio8/es@vger.kernel.org
X-Gm-Message-State: APuU4Z+3iJIftdSEG5WMo7OUcvrLAKJHH2mXjjYOlCtxLH3xhviicT9D
	8j6vSypvYGDrAKFGZ2WRsmNqzzoKZ9zLbtAlF99ZUp034cVIDMeBQMOT
X-Gm-Gg: AZFdTZcbZ/k6szxVx0WTxVZsL5R4+hQFkKRCqXmMU1Cbt+qhyPD7hJ0bIy0+PgloQnT
	sMgcerWwXwpgA2Ekn3s+2ubVFyVtObLPX59xo/iwO9bJUYFzcDrZS6qxBKI8ctRr2z59mK15Q6+
	BmNQU1LtCvzcHql8nOTSfknG+C1eqFLxomKa4ibZThYV45Mx1Am8BWn0jx0wHaPln9vWzmZO6IW
	sxQltbFUbxXvd3wK5AvPx3BpBw5LRkQMWRWmTFjetOpb7HK3EPHVJee1JbC4AwNmzkUAXEXYPm3
	3gFFLULhAlV5zCpvi8LGsr2RbOs2QdsOfY6/cyEgkkBuVHXT6I8Mch9KWflGCeuGX+zM9Q1V9NC
	Pbm72avAuHZ54BIE/3A2L2yd4D/rUCDGvImaDhNh1que+CCWLfYgTxSKZchwlX+NV6SyhGSIYGH
	x0SLamAhsj9uSvN8ot/w/VAhfkgvl+8VaoQMYMLnl+5p9gOEF6kyeYzIylcsWYXp0anD0bcMT8I
	67pJT4njF2PqdsZK4+aiGR9iEWdnDHgRjZFPgSm87RTVt2BWCGZBc0pl2/LmkwtVKNLMRGjXKNA
	q8aNTSOCjjQPHpxuumcSJMIY2VnO+s0TS1CG16uEpQ7qbi68i3BTBoV9SDVNctqxrbMg7QjS/5a
	V6zdgMqfiVO6V88bcklGV2BUMlYsorm+Xap6Kh52Qvc65oZlDWiLFMwVYoksPGXBGRyz31kQPv6
	Rsjrn6UjJKEhoNMxXL3bp9+/ycBKEzW+RIf3xndZ9fAuFd2HVkEX/f
X-Received: by 2002:a05:600c:3b1d:b0:4bb:6991:2330 with SMTP id 5b1f17b1804b1-4bb8881a890mr272747495e9.22.1795496481860;
        Mon, 23 Nov 2026 21:01:21 -0800 (PST)
Received: from localhost.localdomain (dynamic-2a00-1028-8388-a84e-f512-85ee-fdbe-0621.ipv6.o2.cz. [2a00:1028:8388:a84e:f512:85ee:fdbe:621])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb88442693sm353489155e9.1.2026.11.23.21.01.20
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 23 Nov 2026 21:01:21 -0800 (PST)
From: Josef Schlehofer <pepe.schlehofer@gmail.com>
To: Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>,
	=?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	"Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
	Shrikanth Hegde <sshegde@linux.ibm.com>,
	linux-watchdog@vger.kernel.org,
	devicetree@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 1/3] dt-bindings: watchdog: maxim,max63xx: Add wdi-gpios
Date: Tue, 24 Nov 2026 06:01:16 +0100
Message-ID: <20261124050118.87944-2-pepe.schlehofer@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261124050118.87944-1-pepe.schlehofer@gmail.com>
References: <20261124050118.87944-1-pepe.schlehofer@gmail.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Pali Rohár <pali@kernel.org>

On some boards only the SET pins of the watchdog are mapped to the
register, and its WDI (watchdog input) pin is connected to a GPIO. The
CZ.NIC Turris 1.x routers are wired this way.

Add an optional wdi-gpios property for that GPIO.

Signed-off-by: Pali Rohár <pali@kernel.org>
[pepe.schlehofer@gmail.com: rename gpios to wdi-gpios, reword the description]
Signed-off-by: Josef Schlehofer <pepe.schlehofer@gmail.com>
---

Notes:
    Changes in v4:
    - rename the property to wdi-gpios (Rob)
    - wrap the description at 80 columns (Rob)
    
    Changes in v3:
    * Extend description

 .../devicetree/bindings/watchdog/maxim,max63xx.yaml         | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/watchdog/maxim,max63xx.yaml b/Documentation/devicetree/bindings/watchdog/maxim,max63xx.yaml
index defe0401ded0..72f16d9f4596 100644
--- a/Documentation/devicetree/bindings/watchdog/maxim,max63xx.yaml
+++ b/Documentation/devicetree/bindings/watchdog/maxim,max63xx.yaml
@@ -28,6 +28,12 @@ properties:
     description: This is a 1-byte memory-mapped address
     maxItems: 1
 
+  wdi-gpios:
+    description:
+      GPIO connected to the WDI (watchdog input) pin, on boards where WDI is
+      not driven through the memory-mapped register.
+    maxItems: 1
+
 required:
   - compatible
   - reg
-- 
2.54.0 (Apple Git-157)

