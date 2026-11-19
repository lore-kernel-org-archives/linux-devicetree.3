Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795110613;
	b=nfOJkzNJLlAmAYt/XajLkCcrqnSG2ZWNnXk+7LvOYUbYX1lRvODi/Bw45JRBa9lugnJg
	 9z2T6hnuQ5HfR3fOw0Cmf9HF0drZlRLLCjelB76eoJPshfacGLY9TOcxJfkYCdh5Lw5Ee
	 2BNcM9WhmCNIpsf5OUBbnFfuzJNu8jMpQGfFWSb8E03qbIgrlu0XjCMzxcmQa8KlYWHwc
	 BZYXw4oJtjJ4ACz3fZ9bwoYMplFIcsubx3J5HzG8dO3khpNhSb1ATq2S5cu20jtcXJ2Ok
	 CNFf2O4GRg27+azmbJv0rvnz4x/DZCCOFm7g5WWJKZ7Ho1Y+rh5bVMQCdNSNH9JZDIA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795110613;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=5m08k+pWTgZ26W4H99NIdw305iHAopUdzj3Kg8DMx8c=;
	b=zHkA5cGDPkReXHtwyAygIeIEnqJKp/F3ARfttJWqOs5QlyxUyubrpRVrrpQjolNVfyo1
	 E4w/qrFL0WIVek+EtQD83qpzeE3znGJf84eKe6G3S7XC0hhx9tPT1H5cC56wu3ZBWAp2+
	 vsFkUY/Rs+ab0gO9KTDdMU0kRJiOHLPNa10zmqETcF/9Fr++t1evE5NGtpL0IZOggtvcG
	 z4hDtexeC/WKsq7JczwQTVAUbD/6HTEcMmnLMykvS/lNlxmnwHN+RvDSyawZjG5WfXMS+
	 VvkPN/r162aoi54ZaN2VRai3kH6d6yn+b3Qqx0PVuVFtecqoZIpsp10Sjl+n8Omb8Kw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=aheymans.xyz;
	spf=pass smtp.mailfrom=aheymans.xyz;
	dkim=pass header.d=aheymans-xyz.20260707.gappssmtp.com header.i=@aheymans-xyz.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b="fvJykZ/n";
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6F53606A337
	for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 17:50:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A6F53606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=aheymans.xyz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aheymans.xyz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=aheymans-xyz.20260707.gappssmtp.com header.i=@aheymans-xyz.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=fvJykZ/n
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a2d6d01ecbso16422145e9.0
        for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 09:50:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=aheymans-xyz.20260707.gappssmtp.com; s=20260707; t=1795110610; x=1795715410; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5m08k+pWTgZ26W4H99NIdw305iHAopUdzj3Kg8DMx8c=;
        b=fvJykZ/neLyVItFEhBuAi0WmfnkNb8Y4jIVy1xZB3JP5mhV0QHRRKZuIo/1ChInedQ
         ozTOCjI7wfcchmNYhF669sue2/HmF0Uy6XdyhIrtktpdEYN3CyMnTTIufpcXJDebi4CY
         eOcOpBits2EoRc6ryq8QttSom5epvDHt7vHgHeTqiMIJNN1aOJRK0GQFL1Y5FTfzhkXE
         yyYVP4MJRF9EH1kSLVrO+m0Yi0PYAKmgSL7sGRfB1YTQtsDia+DoKocrsqZHpJoqUY59
         n+XiF6L3WfCtONnXjhitg2wRYLsXpW8Si8BnzO+aQ5aVv6QnbUq+c4PNY+/Od58FQ+4z
         HSow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795110610; x=1795715410;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5m08k+pWTgZ26W4H99NIdw305iHAopUdzj3Kg8DMx8c=;
        b=jzuDDYNB3LKz72lfrbP5rBObn/NYoc1cGXEUJOx3glCoWuXZ8GFYV/62EkoKsp7YAR
         yxoxjf5dAWR3LlC9If1L8qwk6DLZ/sAYzyxwUbNWloGVNDQzJexbw01IWeDA2Hp7V4gK
         1DeepaxuMPvZ2ITc6dX00s612H7HVDoXrUZsQtUfLKOOC+OGWr5POUEj4ry46wOg7aM+
         z7NYw+rMDRETm4pO7bC9ilATEPY3DUNJcAPR8K4vmV9tpsm8gaCm7SCoqLEzr2t9m7Xg
         EPYYDOZP2SWa6nCPyLTNbDwPNJhfLY7U6pn8tTzYCwyUqxXjyee++KaL0HccaYGTZaEX
         vShQ==
X-Forwarded-Encrypted: i=1; AL+hErHBl+4Q1K8POog8csI7TrgrwYIsi5eq1ZkvATNDEyGvhl/D+nuFV4xyBs6fXo4vbnBiJyOe3zpZqkWJ@vger.kernel.org
X-Gm-Message-State: APuU4Z+7yOvKLGghoTMj2Y6fp6hm1yOjZUbne6Y0ZOaAtkiVeMJmQk7+
	jJClq2skYKX5i8/qipT17cS9Rn8yceIC3ZwIUpbfeiZytRuxQT3EgbMEEjpS1HM9dIU=
X-Gm-Gg: AYBFou0D9g4cDCmq5975jpoIKpnUioEdlnurpCpgs0BsFwCHYTFW35ggJfvhD/KmoNv
	IqZr7sXzhbicQmKh0uu3v7aHjf6FCSFqdSNUNRvF+q466S14SGquu3i72yizwVe6I3F2VleFJTn
	A9KsivegovOikXjuPBrrhUHYkGhWeih9CIwQjgWlCrA7B6Be2tgIoV0YT+Lv705l0/ThaO7Lc+1
	CNpBkzrFEzQXp7Lsq/SBZjPtXvuHdI+h5XCbXNGF0GLpRuSvSLHooc62YekSJG2v8AkpfO4MbFs
	0k9lxJGChi0/yXHnZv8bISeq4ioA9fdtBbU1qlN6F1uzuKZ3bIkP7GKHGTBmhxa7WA0XpbbJQaX
	vFZomgu5f1SxzKFuR6mzx6KJr7w7jTTqUB9b2EAmtVs1TqxJz5T+oOYA0v0s1XjUZeRLJP+FqMK
	URWHS701tQXM9nybUOLk49pZhQd8VyNgONrAXNZttRFxruP20i732Xwg7m9gmQAub4WpFngVqgA
	AOVj1CIxLcvvjk3se9GyoQcIv/Sdaoat+Gv+2sCVaBgt8othgk6Vg+VmmixAvuflJK4OFakTqaz
	q3JAiqA3YrBij15XmMvB+WZ20vDLelTjg4WOffqKToaUMwCsGxY9+umUSUW8+ZWL8X15SGbDzoT
	gJjS3nc5fLnDv2iefM1B9W77OK21kxwhIqkcHATWhJee34FoGwQUBFKMli7o4xfWi+RirleVw3x
	K8yfE=
X-Received: by 2002:a05:600c:64c7:b0:4bb:68c4:2044 with SMTP id 5b1f17b1804b1-4bb887fe725mr6329465e9.11.1795110610075;
        Thu, 19 Nov 2026 09:50:10 -0800 (PST)
Received: from localhost (2a02-1810-b422-d400-611-84c9-252f-74ad.ip6.access.telenet.be. [2a02:1810:b422:d400:611:84c9:252f:74ad])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853b2437sm68993685e9.13.2026.11.19.09.50.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 09:50:09 -0800 (PST)
From: Arthur Heymans <arthur@aheymans.xyz>
To: linux-wireless@vger.kernel.org,
	Johannes Berg <johannes@sipsolutions.net>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	Ulf Hansson <ulfh@kernel.org>,
	linux-mmc@vger.kernel.org,
	Solomon Peachy <pizza@shaftnet.org>,
	linux-kernel@vger.kernel.org,
	Arthur Heymans <arthur@aheymans.xyz>
Subject: [PATCH wireless-next 02/10] wifi: cw1200: check SDD element lengths before reading them
Date: Thu, 19 Nov 2026 18:49:54 +0100
Message-ID: <20261119175002.458988-3-arthur@aheymans.xyz>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261119175002.458988-1-arthur@aheymans.xyz>
References: <20261119175002.458988-1-arthur@aheymans.xyz>
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

SDD elements have byte alignment. Read the PTA and reference clock
fields with get_unaligned_le16() and reject short elements instead of
using incomplete board configuration data.

Prepared with OpenAI Codex.

Fixes: a910e4a94f69 ("cw1200: add driver for the ST-E CW1100 & CW1200 WLAN chipsets")
Signed-off-by: Arthur Heymans <arthur@aheymans.xyz>
---
 drivers/net/wireless/st/cw1200/sta.c | 26 +++++++++++++++++++-------
 1 file changed, 19 insertions(+), 7 deletions(-)

diff --git a/drivers/net/wireless/st/cw1200/sta.c b/drivers/net/wireless/st/cw1200/sta.c
index 5d8eaa700779..db9f0c4a07aa 100644
--- a/drivers/net/wireless/st/cw1200/sta.c
+++ b/drivers/net/wireless/st/cw1200/sta.c
@@ -11,6 +11,7 @@
 #include <linux/firmware.h>
 #include <linux/module.h>
 #include <linux/etherdevice.h>
+#include <linux/unaligned.h>
 
 #include "cw1200.h"
 #include "sta.h"
@@ -1072,28 +1073,34 @@ static int cw1200_parse_sdd_file(struct cw1200_common *priv)
 	while (p + 2 <= priv->sdd->data + priv->sdd->size) {
 		if (p + p[1] + 2 > priv->sdd->data + priv->sdd->size) {
 			pr_warn("Malformed sdd structure\n");
-			return -1;
+			return -EINVAL;
 		}
 		switch (p[0]) {
 		case SDD_PTA_CFG_ELT_ID: {
 			u16 v;
+
 			if (p[1] < 4) {
 				pr_warn("SDD_PTA_CFG_ELT_ID malformed\n");
-				ret = -1;
-				break;
+				return -EINVAL;
 			}
-			v = le16_to_cpu(*((__le16 *)(p + 2)));
+			v = get_unaligned_le16(p + 2);
 			if (!v)  /* non-zero means this is enabled */
 				break;
 
-			v = le16_to_cpu(*((__le16 *)(p + 4)));
+			v = get_unaligned_le16(p + 4);
 			priv->conf_listen_interval = (v >> 7) & 0x1F;
 			pr_debug("PTA found; Listen Interval %d\n",
 				 priv->conf_listen_interval);
 			break;
 		}
 		case SDD_REFERENCE_FREQUENCY_ELT_ID: {
-			u16 clk = le16_to_cpu(*((__le16 *)(p + 2)));
+			u16 clk;
+
+			if (p[1] < sizeof(clk)) {
+				pr_warn("SDD reference frequency malformed\n");
+				return -EINVAL;
+			}
+			clk = get_unaligned_le16(p + 2);
 			if (clk != priv->hw_refclk)
 				pr_warn("SDD file doesn't match configured refclk (%d vs %d)\n",
 					clk, priv->hw_refclk);
@@ -1147,7 +1154,12 @@ int cw1200_setup_mac(struct cw1200_common *priv)
 			pr_err("Can't load sdd file %s.\n", priv->sdd_path);
 			return ret;
 		}
-		cw1200_parse_sdd_file(priv);
+		ret = cw1200_parse_sdd_file(priv);
+		if (ret) {
+			release_firmware(priv->sdd);
+			priv->sdd = NULL;
+			return ret;
+		}
 	}
 
 	cfg.dpdData = priv->sdd->data;
-- 
2.56.0

