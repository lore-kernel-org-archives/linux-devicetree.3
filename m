Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793880692;
	b=g9Q5u3SDtj95Y3cD/BDy/qsRePsvM4NnCC5udsB32F9sYpbLbAid0DdZseAt3LS3DtiA
	 yWRFdEcHgz5sAOeJ67sZkJiuhpMZej76AjJ1+1KFl/rWT6OuXngaLczJIm0SZhRUSJoMf
	 R2MgHgrMYADjgKNuzdINoaKewf3LOqMgwIQoaFyZGV4rk8Qto5Q18I4HNiom/kVCtJJtx
	 GsJENiWUFWzo/biVSDjGREPebgqWr9WiLqZcgivWgvD72slD0QmqG6mm2KEyojyHMYp6y
	 hk7cK6jWWBMVdoefVTkAg/F4PL3Z0eQ8VxWVRRwlcTvWPMu2M6Rv4iL7M+Z7xj4bY1Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793880692;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=b+CmWncL7kwlaiOlUzGSlbN8SKe/VBMyBDE+45su+XU=;
	b=lfoGoMJbfkBNx0HU7mW0Dn3rk5T0qitgVBj+8v1rCz+2HVGrsa+Xd1Mtp+kPnBR6PTRR
	 dCbqrsckykGhFTFhg2Wgi/4rfwz9bk69Udrn42sE8QHsPY1gJbBUhzfYsYpkA/gvmEQoI
	 nuiGA7SRU/bqIx4/Mfx+/b34GQv5sjwFq3LAfje3nsym/HM7huiyMvSXggSHEqmY7wsz6
	 0LSQdz7kv7AZHLv1PueipyK3q8z7QPHrrac7MIVC1HymX/gs+q2uGRTmQY+upvfAeX7JQ
	 b/p7UtyVty1YUbCv23oO1H1wjqZiaVuL2AdfCbsLChuxrRuz2USYMy8caosdn/S498w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="TR8OsAv/";
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7105D6082BD3
	for <devicetree@vger.kernel.org>; Thu,  5 Nov 2026 12:11:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7105D6082BD3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TR8OsAv/
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a35ac4475dso12126825e9.2
        for <devicetree@vger.kernel.org>; Thu, 05 Nov 2026 04:11:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793880690; x=1794485490; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=b+CmWncL7kwlaiOlUzGSlbN8SKe/VBMyBDE+45su+XU=;
        b=TR8OsAv/YsPNWNpVrMCE5cD32Tibu91NPJjk+QzARhYEOFihEoqI/xYFDIKRS6ifZx
         0jMqwnOZRKUKkP44KANXGDxObBYqSff8Hn40lFWcx1SARV26sZSpsSGfJzWXWBYysW0S
         Rxdmikr5RKS1eaJLDF2AuI8LTgGpAnvta0FQLjQEnBWwPhTeCX56TFnsWYoqat45JtxK
         IVlW9RywwZys9dtkRQ90IK3nRnZ1XKO2+7m9WGHMM+BstqFlGDdE/LjP/VkWTLoZXEHK
         ABWQKuPwqPiAuQiv3J0YCBKF7X3m6CX+tDnX0Dbsn/jSRHH49b12nVWdXPgJKX11m2a8
         h/ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793880690; x=1794485490;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=b+CmWncL7kwlaiOlUzGSlbN8SKe/VBMyBDE+45su+XU=;
        b=V2vi/GXrGq/2x/Ytdtj4L5qCMqa7PJXDPFxwpWdRU67K4s1Q8r+SqtvtNcNF9Zavry
         kBw+5Ihivp/Fg8fPvzRiExwUNhcz9OepTKTCJXkrYLh+n+ojkiFe3EEyymHmPaprAgEe
         kIecrsqcY8uRCgbs4YAlMBFvIOvE8btR4YOZJoWOd3grOx4+7UxLzevvu/yjXc+SnkgA
         vtRUKAqED2IuLjPMD8AyH54Ra0y35La09NPPJvbyd1IbJoFZRkqeeijQFZlRiiV3kl1j
         efBQLE56+Ou8s5utvMUThDktMzBtEccD1wxvtdZgOb2yDpNbxdxb+CKD5JWetljS5F7O
         rwkw==
X-Forwarded-Encrypted: i=1; AKwUvBx3qolL6a223ImasjJ3yUzhQDrKXWDhn+Vss9LqPmSgerw33OzZSpaDlsN+waKpWUhv7fA77yrPaGjM@vger.kernel.org
X-Gm-Message-State: APuU4Z/OXPsKHEoDocyBFaSE6Lr4U/wqplMSuqi8orMhZT9ZwRDyCWaj
	84tTZ4BKX8mcxpT2jwi9DpmLtY5O70diH1pUM5ZyXE122TD33hsIzQZV
X-Gm-Gg: AYBFou3ckL5IIAEZpR9TjIq4jAB4yFaEyurym0D2LpZzvMDzdu9bFBcVHzwVjo0zJib
	hog1lhC19Ar8sc/LupjzTeX2MNWhAgDUrjb6uJWXkCE+ee3KKKfKXPTthdhtjzFH+DMNOHB3/qZ
	QPkvNMacpNeQg1jbc4EMXaV89obcdAU3Mn71kx+1XpAzQVd+g0emHqS/TR37SvIyqHxjs4mWsSE
	vZ+aKFTTWyTN6lYgA5Rz6qcnX5aOq/3o0jbJqCBgQayKr3Xr9Xam/55OslpzinVgUQuOwvgv0dY
	evRrVHxUIwh8Q4XzUj3qh6Cm0Sc95IrYrNHU26U6DQgIHRRift8H6OMl+4R3ZBZyMmiszEc8024
	1JA5q4zHdUSTS2diXwEkMsqct+yAM1pBdAzIzN0Cuw69HTubL2hj9aUEDYuuQCF5RoUSBvcimWo
	H2SW9L6PoTf/VI/dE+I4SWiVUj0ZKJK0MFQgf5OS0HGVfzkPJPjaEa16XApstw7gPilZuAR/1n9
	vyikw8GtieQ+0FSE5UGQH3YydaZL56d8hcwqFMb97FQU4IvWR62LdgQI8vWgdsqA0ZvM0MEXGyB
	Kso+jV8az8wFR6cifNGiAxieOL2g3zw47pSHHcCTAbNZjn9TT4QVlWJLIVrHTOV1vVcq/GfnNtF
	RaIhvgkBx4ECbbl3BzDwKiV5N
X-Received: by 2002:a05:600c:1f93:b0:49f:ce78:356d with SMTP id 5b1f17b1804b1-4ac180f2fd3mr439395475e9.30.1793880689556;
        Thu, 05 Nov 2026 04:11:29 -0800 (PST)
Received: from Ansuel-XPS24.lan (93-34-90-148.ip49.fastwebnet.it. [93.34.90.148])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4b56f02386bsm58869885e9.7.2026.11.05.04.11.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 04:11:29 -0800 (PST)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Felix Fietkau <nbd@nbd.name>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Christian Marangi <ansuelsmth@gmail.com>
Subject: [PATCH v10 4/5] clk: en7523: generalize register clocks function
Date: Thu,  5 Nov 2026 13:10:57 +0100
Message-ID: <20261105121059.11201-5-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261105121059.11201-1-ansuelsmth@gmail.com>
References: <20261105121059.11201-1-ansuelsmth@gmail.com>
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

Airoha AN7583 SoC will use the same logic used by Airoha EN7581 SoC to
register clocks. Generalize it to register clocks defined in soc_data.

Add the clocks definition in EN7581 SoC to support this new implementation.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/clk/clk-en7523.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/clk-en7523.c b/drivers/clk/clk-en7523.c
index c05d0bfa2340..979dd9c20a4f 100644
--- a/drivers/clk/clk-en7523.c
+++ b/drivers/clk/clk-en7523.c
@@ -151,6 +151,7 @@ struct en_clk_priv {
 
 struct en_clk_soc_data {
 	u32 num_clocks;
+	const struct en_clk_desc *base_clks;
 	const struct clk_ops pcie_ops;
 	int (*hw_init)(struct platform_device *pdev,
 		       struct clk_hw_onecell_data *clk_data);
@@ -801,12 +802,15 @@ static int en7523_clk_hw_init(struct platform_device *pdev,
 static void en7581_register_clocks(struct device *dev, struct clk_hw_onecell_data *clk_data,
 				   struct regmap *map, void __iomem *base)
 {
+	const struct en_clk_soc_data *soc_data;
 	struct clk_hw *hw;
 	u32 rate;
 	int i;
 
-	for (i = 0; i < ARRAY_SIZE(en7581_base_clks); i++) {
-		const struct en_clk_desc *desc = &en7581_base_clks[i];
+	soc_data = device_get_match_data(dev);
+
+	for (i = 0; i < soc_data->num_clocks - 1; i++) {
+		const struct en_clk_desc *desc = &soc_data->base_clks[i];
 		u32 val, reg = desc->div_reg ? desc->div_reg : desc->base_reg;
 		int err;
 
@@ -1290,6 +1294,7 @@ static const struct en_clk_soc_data en7523_data = {
 };
 
 static const struct en_clk_soc_data en7581_data = {
+	.base_clks = en7581_base_clks,
 	/* We increment num_clocks by 1 to account for additional PCIe clock */
 	.num_clocks = ARRAY_SIZE(en7581_base_clks) + 1,
 	.pcie_ops = {
-- 
2.55.0

