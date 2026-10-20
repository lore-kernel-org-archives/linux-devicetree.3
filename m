Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792501230;
	b=II2eoJdqb0WaRLMcFwP+ef37BG0RDCIwix8TALOkcg6eIVnOpnNZoXfCLtKEpRPoYxe5
	 2ANngJbE+ITr709UdpNDIJSgE+tK7FOzgrjdHCeNbaSMBpBqek3hCQWE01AkiAeFSyN2F
	 0V+A0Lgy+UrjCs8G903Y0P7ZCNTTOPQiReKO+vZrSKnM0P1BNdUfGu911e7hOVuzoAsW5
	 eAkGriL9jobPVlzlJa9ZiiSDB6PlOGkw8t2lfYfXNt+wVspvaTcVJDdMvqdGJHaOpQVnY
	 m1OwAtYghS6SJbRWXYfQhF3qWuS6pAlhPLv/FhTbMQvo2LU83dq8u5p48XTwsH4LWUA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792501230;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=gDnFObZ0K2X9/qO2ilzZd80c6UZ6TUK8OX6LvufmLAA=;
	b=uOWL3aVlo08SQCm8mdP7QwNnyK6YMvxB4/z/d16NakykhhVr4KQuaAyjiEFCt1hELoiV
	 ZwT7Y0VvtwOdbq64PX7DJAzY24Lbt7B05dT6PYlMCQOmWH+aD62DPx0ToejE80xJyqGMh
	 vRPz9rQd677reRFUHtBT3FZ+5qEDgAQzv/zftVFQf9ZK9+UoAXyA/3f4R3yLD6Pwt7CM5
	 U1QCLZ3X5gaaI/gJ4GecQNBoCQ0M0rdhgVTfyoofvZ8wcW/ebSVI+FUU00WmFwLO4Tcpl
	 zWZozqw6EKGlGmuDffIHvGLVbJdAtsr0JBYsOLRH1b4BXzYeuQeRryzRI0M7lOsRJkA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="p4l/8DF9";
	arc=none smtp.remote-ip=209.85.221.49
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD6ED60A4AE1
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 13:00:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DD6ED60A4AE1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=p4l/8DF9
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-48e09aa5264so1935193f8f.2
        for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 06:00:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792501228; x=1793106028; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gDnFObZ0K2X9/qO2ilzZd80c6UZ6TUK8OX6LvufmLAA=;
        b=p4l/8DF9+/kYzcvHQwOneewQdIXFBAmaAIofNK4rYogA0p6b2j/4k28KAy04iAOQ+v
         Q8+DfkO/hKDcSxybfRIB/8oGAkscX0EMrg0N1JIRBHIhmHjDxc7gpzxJvNaM7uamfipj
         FQbgA11uYbN+ERU4IiiyOgZhWX6v7sRYJZBzWkuMK2EVtHtek6ObeuyA0FbWaUBVRg2i
         iOaFZ3M+c9VQuy1OxKyUIP/kjUGSLEheSnAiCfnKqofRPPslBWn1sMhSPAK3c+dq4AQf
         5Aer6fU9gvSOdpYJw408drds4U9ySb6zuO/55i8bNFqdGjukPkM0kDIdyU0IuHXi5plR
         W0Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792501228; x=1793106028;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gDnFObZ0K2X9/qO2ilzZd80c6UZ6TUK8OX6LvufmLAA=;
        b=Zh5DtKqp6M77wvEqNnsIAF4siC08OkGnanz4JpVVcIA5AlkNThDL2zJyNxBo0AIOB6
         fD/j3MfVs7/1P6YG2kK2oGkyDTwslDrikTMB07ZqPjpJ6dj7eaaSsj32uYK0CxIS0lyB
         XI00f5HPrsBen638wktq3G7+xQhgJO/d7qxwXhPE+fW82d2KAJnJGIf+Qhx2m6p4j22N
         gOB6GXPpbBIP3eQ3u2MDI1SFXCNkvHsar9dZtbp4lSrKGh6zk9k5VSR3VYb1SwTs52Tu
         jz/41sNQeUOd+9C5qUxhFqR44yldqy1IU4BSJzlr4kTpoMLmYUmW9Chkch8DG4hBr8jq
         Ed7w==
X-Forwarded-Encrypted: i=1; AKwUvBwY115DY+rGOoZT3NLnbjWqa831FUIDXmAlw+3WUQcW/ZdgNubxIjDeWNQ6smtqi+dBmctix4HWIaND@vger.kernel.org
X-Gm-Message-State: AFq9FYKcMpaPDNdK4MfaRORn3ILShQFTW0Y+/RwwGGv9BFObZP+MtwJn
	deTiO2xYhPYefD2SshxzPJKJn7rnWkZopEUzP6WV5l3oTFBe72FeTkWG
X-Gm-Gg: AYBFou3v9dY4oJrc/qP4a04G5n8tXTlYz5yTJEEt3XfbWXAOp7MQ4abtz701L1UivuQ
	GAzStCZan1/13X7vAg5OczvpVI71YlEQB8RW/M4UbsnuOUNGz8jEbfGSnu9dg9WF2JME20H8VbW
	yWOe8a0RoQ5VIylM/Zo3TsVxwnGTyCQxldHKWnAGzPq5s2a3dnO4UDUMPIJS44e3qpZEk9lA0lU
	j3qZiucsZ+1pyk3HnPDbXE6lDK06UVqUhO2YOiW7takMXCqO7yQFDVKVozMDM/ElUlL7OlvuFiz
	/+cV42PxeTH6vocITCzwN9Jsgl9oguaKFjYuSLMHJxhN5CuDoZWScmoiWnGwRRWoidxPBRPKWrr
	KRQgC8HyjqdBWcVO6iU1KE4ufeDPyGifYBMVQswQQGkENvhXVhjCtS0kiXJhmBskTDQEggLgGgA
	r4Ym14yR5K7eKQ/QWzZ2AJzen+PWTUGUwRy45QLbCfkFVbiavWkRkl1kixR2YAFT5jKZNthbJKK
	rvr75ZcGan8homHryZjtPEyYaV2p4Dqb0R4xT+7gctFyzNJyZGk/PCR7OPiSsKtB1TDNt+Whg==
X-Received: by 2002:a05:6000:4205:b0:48e:dee:52bc with SMTP id ffacd0b85a97d-48e0dee52f0mr18975446f8f.0.1792501227440;
        Tue, 20 Oct 2026 06:00:27 -0700 (PDT)
Received: from ernest.hoecke-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e1d830e91sm6114754f8f.54.2026.10.20.06.00.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 06:00:27 -0700 (PDT)
From: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
Date: Tue, 20 Oct 2026 15:00:18 +0200
Subject: [PATCH v3 7/8] of: property: fw_devlink: Follow clock nexus maps
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
Message-Id: <20261020-fw-devlink-nexus-ready-v3-7-fd6f1c17e16d@toradex.com>
References: <20261020-fw-devlink-nexus-ready-v3-0-fd6f1c17e16d@toradex.com>
In-Reply-To: <20261020-fw-devlink-nexus-ready-v3-0-fd6f1c17e16d@toradex.com>
To: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>
Cc: "Miquel Raynal (Schneider Electric)" <miquel.raynal@bootlin.com>, 
 Frank Li <Frank.li@oss.nxp.com>, 
 Kieran Bingham <kieran.bingham@ideasonboard.com>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, 
 Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, 
 Herve Codina <herve.codina@bootlin.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Geert Uytterhoeven <geert@linux-m68k.org>, 
 Leonardo Costa <leonardo.costa@toradex.com>, 
 Frieder Schrempf <frieder.schrempf@kontron.de>, devicetree@vger.kernel.org, 
 linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, 
 linux-pwm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
X-Mailer: b4 0.13.0

From: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>

Clock consumers use of_parse_phandle_with_args_map() to resolve
specifiers through clock-map properties. fw_devlink instead parses the
clocks property as a direct phandle reference, so it records the nexus
node as the supplier rather than the mapped clock provider.

A nexus is a translation node, not the clock provider, and need not be
populated as a device. The resulting fwnode link can therefore remain
unresolved and indefinitely defer the consumer while
device_links_check_suppliers() waits for the nexus.

Use the map-aware parser for clocks so fw_devlink resolves the same
provider as the clock consumer API. Direct clock references continue to
work because the map-aware parser returns the original provider when no
clock-map property is present.

Fixes: aacc54c67869 ("clk: Add support for clock nexus dt bindings")
Link: https://lore.kernel.org/all/20260807-schneider-v7-2-rc1-eip201-upstream-v5-0-8785f9531cf0@bootlin.com/
Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
---
aacc54c67869 ("clk: Add support for clock nexus dt bindings") has been
in clk-next and linux-next with the same hash since next-20260907. There
is no build-time dependency on it, but this patch should not reach
mainline before it.
---
 drivers/of/property.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/of/property.c b/drivers/of/property.c
index 53301cdac6a9..2388d607136f 100644
--- a/drivers/of/property.c
+++ b/drivers/of/property.c
@@ -1422,7 +1422,7 @@ struct supplier_bindings {
 	u8 fwlink_flags;
 };
 
-DEFINE_SIMPLE_PROP(clocks, "clocks", "#clock-cells")
+DEFINE_SIMPLE_NEXUS_PROP(clocks, "clocks", "clock")
 DEFINE_SIMPLE_PROP(interconnects, "interconnects", "#interconnect-cells")
 DEFINE_SIMPLE_PROP(iommus, "iommus", "#iommu-cells")
 DEFINE_SIMPLE_PROP(mboxes, "mboxes", "#mbox-cells")

-- 
2.43.0

