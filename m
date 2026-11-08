Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.141
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794174589;
	b=5Dqmzn9wAk5RepsvDuAA0kNcvtAB1LlSYd5qjTAwOa4jpfestP0i+BtPg2Wup5OqO0+5
	 bjvEC5/JJLwf3WJeR5J8DytjAlAVypch1SovZbpzyfuaDGsqMWWFYFuwlB8IG3BwtGlXo
	 FR06ej1T0sxPMdA88/uJfiSw71ftCB5TUFUasyDx+cR8KHDt8gsKn9KRs+u2oG8or9/Rz
	 bd8ejgpD9NwiJUkbZ4twv0qAVYapjDWi3GQ3DREGpnhC+r7Cv2MYxZ22ZnJmkqLX3zlyj
	 6/gF5Zs5jH76O3Hrz2zb3knEca5zBuYmR3qdeYoJP7d/+fZTdHBhD0KpBdfwYbmgFSQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794174589;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=ID8aXSDi6DUqVlcBNz/m4nIgtfKw4nmq+cmUYg5AD44=;
	b=1J40VpPEfFCfBn4QJmaxASAM19Cw3iK3wdx+SotoqY+xWu+DhO4iaJe6ZZ1x62Dnn5av
	 fO4yny/nn6yWMNVuTsX+COkbJ2k/AWSMInKWE8C4xs0MYs3Uu2lCb4RVZlFIjvWyKmS/8
	 O1oDxm5jFqRFzY5Gjs2nE/gq95V6PtKGpyfQj6NMBQyTRcilABSApeSxF4pz3mecuFb3W
	 tkfsWfi+guJE81isMQC/Be1EyRJBOE4cvsH/ZVPmEqEgQkZNj2HgPfyisT07KdxVZ7lEd
	 X2FF/IzAZoZFGFjjQVXpZkjL+stRiNwXziHH5SDuPKk0haVGMmPXPHwzSt3Hali+aIQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=postmarketos.org;
	spf=pass smtp.mailfrom=postmarketos.org;
	dkim=pass header.d=postmarketos.org header.i=@postmarketos.org header.a=rsa-sha256 header.s=key1 header.b=nCS3Yvu2;
	arc=none smtp.remote-ip=91.218.175.141
Received: from mta0.migadu.com (out-141.mta0.migadu.com [91.218.175.141])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01BD1606EE95
	for <devicetree@vger.kernel.org>; Sun,  8 Nov 2026 21:49:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 01BD1606EE95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=postmarketos.org header.i=@postmarketos.org header.a=rsa-sha256 header.s=key1 header.b=nCS3Yvu2
X-Envelope-To: devicetree@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=ettSwBxSa5xIRDiOTDO3cSPU46l8tVUsC0Q7wr2qb8U=;
 c=simple/simple; d=postmarketos.org;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794174587; v=1; x=1794779387;
 b=nCS3Yvu2Nm4bNtFZcUTcOfbKjrD2FaIvrAOc0H9/hlCzzGESPIjKVLlR8eyS9PKYES/B8Gex
 FFOzM1vJNChSc09algLfW/TTPthzpjnwx62woHQf1RkegufZCezUieX3QyitCJnApcMii8HTio9
 R1QyukAqq0o/WjPIzK7ckxBLXnmQC1R8uQ9qDT/dXEtWGxJMJMpsquwohhyAWcfhGCdt+KFjArT
 HDiBb2zttl+kXQdGxWPebL3sLY+5ahQ17gudiiTqXAk5/tTa9letI0JcLGi/NDKSy92vLigvg0h
 CapmdQJVAEFXM2XAhOk7OXz4C5K1rz3NziktwR0YmX1Rg==
X-Envelope-To: devicetree@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 9c6cbfdcf6ab8252;
	Sun, 08 Nov 2026 21:49:46 +0000
X-Mizu-Trace-ID: 9c6cbfdcf6ab8252
X-Migadu-Flow: FLOW_OUT
From: Paul Sajna <sajattack@postmarketos.org>
Date: Sun, 08 Nov 2026 14:49:15 -0700
Subject: [PATCH v4 4/4] leds: aw2013: Move assignment of chip->num_leds
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261108-aw2013-aw20xx-rename-v4-4-826529beeb52@postmarketos.org>
References: <20261108-aw2013-aw20xx-rename-v4-0-826529beeb52@postmarketos.org>
In-Reply-To: <20261108-aw2013-aw20xx-rename-v4-0-826529beeb52@postmarketos.org>
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Nikita Travkin <nikitos.tr@gmail.com>, 
 Alexey Min <alexeymin@minlexx.ru>, David Heidelberg <david@ixit.cz>, 
 Griffin Kroah-Hartman <griffin@kroah.com>
Cc: Nikita Travkin <nikita@trvn.ru>, linux-leds@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 Paul Sajna <sajattack@postmarketos.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794174570; l=1195;
 i=sajattack@postmarketos.org; s=20250422; h=from:subject:message-id;
 bh=ettSwBxSa5xIRDiOTDO3cSPU46l8tVUsC0Q7wr2qb8U=;
 b=tyyg0CXSxsNHTK/G9Jo5Y1cgKmitvJlkxuqEswdfAB8ZAQr3B/yij1fhxxoolkOtq1RvVbnpB
 iuG1fdMYZsVBXVSHJCoOY1dV7kTXkTLEwlryKMTpI8xwS2zj8adJuLK
X-Developer-Key: i=sajattack@postmarketos.org; a=ed25519;
 pk=TwacvEOiRJ2P2oAdEqIDrtQTL18QS4FfcHfP/zNsxkQ=

devm_led_classdev_register_ext() executes default triggers
synchronously, which call aw20xx_brightness_set().
aw20xx_chip_in_use() silently returns false, skipping chip enablement and
causing unbalanced regulator disables while probe is still running.

Increment chip->num_leds inside the loop, so that each call gets the
correct value for it's default trigger.

Signed-off-by: Paul Sajna <sajattack@postmarketos.org>
---
 drivers/leds/leds-aw2013.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/leds/leds-aw2013.c b/drivers/leds/leds-aw2013.c
index cf8e4b0a4572..c5df652ad8c4 100644
--- a/drivers/leds/leds-aw2013.c
+++ b/drivers/leds/leds-aw2013.c
@@ -410,6 +410,8 @@ static int aw2013_probe_dt(struct aw2013 *chip)
 		led->cdev.brightness_set_blocking = aw2013_brightness_set;
 		led->cdev.blink_set = aw2013_blink_set;
 
+		chip->num_leds = i + 1;
+
 		ret = devm_led_classdev_register_ext(&chip->client->dev,
 						     &led->cdev, &init_data);
 		if (ret < 0)
@@ -421,8 +423,6 @@ static int aw2013_probe_dt(struct aw2013 *chip)
 	if (!count)
 		return -EINVAL;
 
-	chip->num_leds = i;
-
 	return 0;
 }
 

-- 
2.56.0

