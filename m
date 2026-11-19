Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795110611;
	b=VLyLF1f7ld46Xsb91JT7d4dGvJCgePevIOkvM258+YWy7qJXXpV2WSJHJYuTMwXS2vuo
	 Zbr/eqcNnTayXrZoBMk7+rsNI7rHZ6aPIh6TEnw/ydQEdOoEphwo1cNz1tSvtcCPclHvy
	 Vmy0bpwhWy8hLgjyN73JeOroOyh8gInDsQYMe7jjXxSf3ONDT1ExFXdfIdsmiie5vRqdK
	 N5xrbSzRDZk/xo5q5Ecmr/Y7wlrH4wfZhPy0AWy1S5axFndY36mvVDww/PQ9TKl+1Onnp
	 68ERFxZXOL8iHuMc0eZ1cg2lCLj9+mDxKRcU3qIaaYZpnmFYbPgNAvPlFdRgAtcdtEA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795110611;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=+y4Dhz36GBPfKNKm/OZQCyp1F0ego1607MuK1Oaddis=;
	b=xk1zp5m9guPT3ZP8pSkFA9H4lKrmjYsMRtAIROig24eJ3HtJC+KeCvO/PlICdswJa7+V
	 hkEnS3kRok2Qk6uE701KDubYUS0Sas6Ym+puuWtfVyb53saNXjHXlnzHI8dg9V14IwwQb
	 /Eh5bQiOh/yPbAB33fGwW6lCN6ByMPdyh20Zsseo9XbmZ4i4HY3AiWdGNhiVBGG0Rixv7
	 ABF4YDVtv4BKm0xOo6I62RPRdYazFPygCx51A+76/W+XqCO9mr+QJt6dKBAnJeBHmSwNI
	 0/2OQbVHR142V/3hBUlvFF8Kr2MNMogUxJEET5OVAt3vmuyyFFSIv6xzce35aaelL1Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=aheymans.xyz;
	spf=pass smtp.mailfrom=aheymans.xyz;
	dkim=pass header.d=aheymans-xyz.20260707.gappssmtp.com header.i=@aheymans-xyz.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=noXf1rHX;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E6DF606A325
	for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 17:50:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0E6DF606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=aheymans.xyz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aheymans.xyz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=aheymans-xyz.20260707.gappssmtp.com header.i=@aheymans-xyz.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=noXf1rHX
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a5b2be99a8so25090945e9.2
        for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 09:50:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=aheymans-xyz.20260707.gappssmtp.com; s=20260707; t=1795110609; x=1795715409; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+y4Dhz36GBPfKNKm/OZQCyp1F0ego1607MuK1Oaddis=;
        b=noXf1rHXHVA5Bo4zBqtRn+YjTYtHNXGVE83xggHGKpOWjneiUdG5LTFmE9tzs3PcFi
         QDgwMI0eZzahFKbbUHQxOzro7v4Hw3kiJ4m3AYRUtEkI7RUatHAETc/wADxUDy48QzWy
         NltjoUQNyPz91+WrQGjtvuHrtGTA7HQakwoozd0ncQc5831PnXftOw4lhkDLw/7sDU2A
         5cF+ssEbbYVFSUwmA53rpP3GVOutHQ/72+f9fJqIRZo1Deuv6sQUSQjSD1ZU8RhziwLX
         M6YNfnpf2S1ZK5CHuPW2PZYCZ/XVkE7wLBdZJYg1Er631mnNtAF3hoy2QVU+0gJo2z8X
         JXag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795110609; x=1795715409;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+y4Dhz36GBPfKNKm/OZQCyp1F0ego1607MuK1Oaddis=;
        b=v3nPZ4e8x3urgCCwlrmZP1JYmGVTeYbmmSvyxJYoXsQUURYK93jE8RakGWAcObC1jb
         BkC+jM6IS5k3NxNMyiG8FBuZvsuWhn3AEPPf3eD8u+gYbs1/B5UQ2rMRZghGIRFvpqPL
         Hbf4BeV3uqiGpTmzSBkf+VeJokxrlk9QH2Cr/CvrSUPYbLReDhe077k1naLTAcE6ZEpJ
         V1CnWoY7ONZO3hQlrfwfNyVcMt1EuLVEPbYDxvhqqsDR/PNy2idGtFObWEc6O1qNhvJI
         L3SYLwcGI676BrvXlrqrgZMAAVYk7aHb1kM4T2WZQd5huKhWjnHEFc+51vCgO+rOPoTn
         nYTg==
X-Forwarded-Encrypted: i=1; AL+hErFeDnxRf2IIHVU8PuquocXJzkE+9J+o/qPPE+hQfXhhxZFmeptEXBnkMsYLxVMMRcPll76NI/it2euf@vger.kernel.org
X-Gm-Message-State: APuU4Z+FTFwLrxCFo/PlHQKX84VTDrOMdy82D2f1R5p4TwdW9u6axC4s
	g5u/L8HSZNro0cPQii/UK3++ZWoZ4pEOxADBTWSNTBp08aYDqIvuz+DV4uFkv4O14Vs=
X-Gm-Gg: AYBFou2UDIRacwX9VY6+FVPxUM9BK965eJr5FUIfwjo2Po/R08FzoC+RKhK/sZ0Rtzt
	1zrW5KAJr5oxA6hfLZlSstasZaLuUxSBCulsmI3Fp4r135056SVj/mqE92zxGPWlzjCqUU1fVRo
	e+THMMLnKQY3e149eN1e6/C+JX/NAkl4Z3Vuk9uLnntvIziVB8QW6AHfMFcgLPa5hU4ZEV9Zenq
	jQcwzGbfs8iYoJ6tbOVBwVzFmgnSP/JfAHqyJ+P4PzOeOaEw94QXeDBRBBlrbUD7+8P6HewJbvl
	LuS/+Ac/zfag6fxga28TdUHWNTU+NWc/stppnLUBuVXfhXvJE3S5OUllsMfwSc2k0UnSzjzCABr
	nDNj+uf+gXcMiWosRmOuwRYg5lH3eborpHx2o8UGq+d316LiRCnfVc9x8bO0mA3Pp15GWsts9Wq
	gnotLC83MaIPvXZa0G5Y39bpS0mvsX4HPPjtcKD8qO+Guv/pDVgZAqW/aAFguTTHde8++r+1aWh
	yJ8owTdmqaKm8IHsz05e6+kmJK4oqzTuC3MYPUJAQ+kdiitsemaMCWJ0RRTlAfZbf9kHgUmYL0E
	yr/54s8w3vTPukdX0EcHUUlc1uPsL43Yr3yn2IHUOwr/xzuOvxMPVPMhJYmIh8c408Ac2k6mLID
	+3rdegd0suD1zP6+9I8fSiyhDzj9ConrdPVEK8EV5m78jV2VG/6i6MmqUChX8BsOst0UK4ATfhQ
	4zrA==
X-Received: by 2002:a05:600c:6290:b0:4a3:59c9:a743 with SMTP id 5b1f17b1804b1-4bb8882a21amr5216045e9.27.1795110609383;
        Thu, 19 Nov 2026 09:50:09 -0800 (PST)
Received: from localhost (2a02-1810-b422-d400-611-84c9-252f-74ad.ip6.access.telenet.be. [2a02:1810:b422:d400:611:84c9:252f:74ad])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb84e06c73sm90730215e9.2.2026.11.19.09.50.09
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
Subject: [PATCH wireless-next 01/10] wifi: cw1200: avoid removing the debugfs directory twice
Date: Thu, 19 Nov 2026 18:49:53 +0100
Message-ID: <20261119175002.458988-2-arthur@aheymans.xyz>
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

Unregistering the wiphy removes its cw1200 debugfs directory. On SDIO
unbind, cw1200_debug_release() then tries to remove the stale dentry.
Leave directory removal to the wiphy and free the counters as before.

Prepared with OpenAI Codex.

Fixes: fa8eeae10257 ("cw1200: Remove "ITP" debug subsystem.")
Signed-off-by: Arthur Heymans <arthur@aheymans.xyz>
---
 drivers/net/wireless/st/cw1200/debug.c | 19 ++++++++-----------
 drivers/net/wireless/st/cw1200/debug.h |  1 -
 2 files changed, 8 insertions(+), 12 deletions(-)

diff --git a/drivers/net/wireless/st/cw1200/debug.c b/drivers/net/wireless/st/cw1200/debug.c
index 7dad6d3ba239..6b8b6ca35103 100644
--- a/drivers/net/wireless/st/cw1200/debug.c
+++ b/drivers/net/wireless/st/cw1200/debug.c
@@ -359,19 +359,20 @@ static const struct file_operations fops_wsm_dumps = {
 
 int cw1200_debug_init(struct cw1200_common *priv)
 {
+	struct dentry *dir;
 	int ret = -ENOMEM;
 	struct cw1200_debug_priv *d = kzalloc_obj(struct cw1200_debug_priv);
 	priv->debug = d;
 	if (!d)
 		return ret;
 
-	d->debugfs_phy = debugfs_create_dir("cw1200",
-					    priv->hw->wiphy->debugfsdir);
-	debugfs_create_file("status", 0400, d->debugfs_phy, priv,
+	/* wiphy_unregister() removes the whole subtree. */
+	dir = debugfs_create_dir("cw1200", priv->hw->wiphy->debugfsdir);
+	debugfs_create_file("status", 0400, dir, priv,
 			    &cw1200_status_fops);
-	debugfs_create_file("counters", 0400, d->debugfs_phy, priv,
+	debugfs_create_file("counters", 0400, dir, priv,
 			    &cw1200_counters_fops);
-	debugfs_create_file("wsm_dumps", 0200, d->debugfs_phy, priv,
+	debugfs_create_file("wsm_dumps", 0200, dir, priv,
 			    &fops_wsm_dumps);
 
 	return 0;
@@ -379,10 +380,6 @@ int cw1200_debug_init(struct cw1200_common *priv)
 
 void cw1200_debug_release(struct cw1200_common *priv)
 {
-	struct cw1200_debug_priv *d = priv->debug;
-	if (d) {
-		debugfs_remove_recursive(d->debugfs_phy);
-		priv->debug = NULL;
-		kfree(d);
-	}
+	kfree(priv->debug);
+	priv->debug = NULL;
 }
diff --git a/drivers/net/wireless/st/cw1200/debug.h b/drivers/net/wireless/st/cw1200/debug.h
index 80bc1567533a..339a375b4c18 100644
--- a/drivers/net/wireless/st/cw1200/debug.h
+++ b/drivers/net/wireless/st/cw1200/debug.h
@@ -10,7 +10,6 @@
 #define CW1200_DEBUG_H_INCLUDED
 
 struct cw1200_debug_priv {
-	struct dentry *debugfs_phy;
 	int tx;
 	int tx_agg;
 	int rx;
-- 
2.56.0

