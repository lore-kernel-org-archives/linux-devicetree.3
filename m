Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795217759;
	b=Qy7c8RYDUIzhUYlXdbUq7S9JU9Q0iLqNGJRF1axbZfQqiwFwWG+Gn6rFIdVvntkzRHQF
	 5410XwA1FCenGCVowfAHXBgPhezRmazjElYFNklTj+PVMwaXDpaqB4u5kYH+fVG/iM1kJ
	 zdhbKTd8iOQDelGKzFPwuMJaCMiFXTM1yMvlgox2anla51JcIIBhnHffCNewICGUb3DkQ
	 jA3rPcKC19a3HwfGPD6n0PTYt0G66ZgDU/ToFtYAUpelPSNZi1j2YWVFtDelyjmLfIRJ0
	 4JENkxAwVKgaeSpY4Yywl4rscZEYOO0DT0oFsTyGDNkujnwb6Ewe2XKqAEsEhRBbZcA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795217759;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=vM8WZhbKmN29nQ6mO4DJr0H5CZ8GyUYQkfSPTP5P5Kc=;
	b=J7u46DDKNNCfah4HwZxMz0q8JwRoiz9b41GR3fCJZQVD7e4B/c7ahPt08huCYy1fhqVb
	 xS9ERn2fCnJXHwBGbQUAlFMES/Sdx8YHq+Hmo5AdiOYAlF4rkMTliPHAGS08p/3ebqwdV
	 irSVUEuAQoHpmfigB1447L9MKmoZ/rc+Rt2a60ap8AOoG6gbsBH9MbbeT/ks5Mm7J3abU
	 QtxL9sHnZn7UYacpo2aVYZIVAnfF4cF8vfBnpzBCPvSdsH4mfBCL6qzbbI+kGdOgzkmm+
	 LT1cLThKZMki3PeV0ZeuSOzN7KZvbUaZBUGOToeEjZPfynMN2VpfWZpCMUu4oVaPpMA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HfkQXrHz;
	arc=none smtp.remote-ip=209.85.221.41
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF81A60A2600
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 23:35:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EF81A60A2600
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HfkQXrHz
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-4a68190a2a7so1251007f8f.1
        for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 15:35:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795217750; x=1795822550; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vM8WZhbKmN29nQ6mO4DJr0H5CZ8GyUYQkfSPTP5P5Kc=;
        b=HfkQXrHzrjOE8TLe9tFLzg2TWy0FtmrnWZfm9roAjo/wtSVKw9PY4clHBwC7XJcy0z
         bwWPqzohcKLPGNz3AQ6QmXPemTGXrdylbNfHad4YyGLWJM5ORw03HxhsHGXohfToV41i
         3uBryz6X8UECS4RiAnOF4I0liXDW6wAFaLo8vCnzzECgY7BwHpObbkIJgpOPff03LGhN
         +B7cmmBY3NA3JY/3NJwvYL1w8UirxVVGH+FxvvSEDLwVz/1CspoUgooOXMdAmt5FF3bM
         xXJmGCGlYKhbxN/+r5YWoooGLC0C2lPFAx5gM907VJyxWFmBTQqn7YQKT+ZtyXqtO+4/
         jpZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795217750; x=1795822550;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vM8WZhbKmN29nQ6mO4DJr0H5CZ8GyUYQkfSPTP5P5Kc=;
        b=myBX68LgX1rZ7isJQDd3h3NZV1dsyjjoBJPDmXiDWJSr5LOYVa/PAiGBAqRkSs/E/m
         7fU1QkRL5bLmX+KqoTB8uaAzh/FjTUpDU9p7RZPz6tBj9YIZL29Zcu8yNZeIInX4nw2t
         6Mnf7N87SOdtcF4Nqfq6dwireC6Saro7Nlor4Ax2YPjsnHFuhGP6MBlaJzckvl+TDa8f
         3q3f6Tk+8lPFAC+RVRmJ43pTZXTA+OAoOwzXushboOB0XHlnq/heoI2e0qf+EUoZ/UiE
         DspHdz3ao09iBnE9ZFEL7xC3KsTYSC7qK1iEvQDAtPyqs/0Q0H9EfROqYE3B3x94e9hn
         vyTQ==
X-Forwarded-Encrypted: i=1; AL+hErHibzt5hRWhIvGNskYr/Extv8AmkB1eiIND9u3EqeeLMUXLxgTUCPpgcnfFlvySH3e80K2hPh1uqhlB@vger.kernel.org
X-Gm-Message-State: APuU4Z84+FSraFWuVu674TkBcunCtpn2Nlmoi2vxWTz07m8Z2L019EZG
	Amkl/fHaoByfIo7NkEVtJoGI3b2Pscqq5am6vFsj0X4MeObsVOvYm5v5
X-Gm-Gg: AZFdTZfP+2N7rUSFJ6nR1nfF3+Hlvg8pt4ffTx5Bs2GsFH3mCZV/JNQ9OYBq37eDli8
	/kX7WOz/mpNHXYeGMDCakOIZ/x38SNWCu//4vujL6VKAFuRSPE6TqstGS0QKB6Y4Nh8K1f99chv
	sItLUXosOFjNeUQaZyMmcQMROPmm/LKkQEovhCbvBt5JqVHr6bD/T/Nao70Fw8duU4NUIbBRG6J
	VG5D8ON8W6zeSXuOOy4ljZkNuT7QdjBbZZumvKsJl6nh+JY7GZN65ri6RJcE+bfZMojjgJzLABF
	mxGKpG3QI7p3P0T7Ss6qB1bpKhCbTXVjjkDqPF+4xB2LcmPqcQCZZfP5Qm85o8jp8KxjlGwYRVY
	3UP8jIGeyWQfuSIv+DA3Jxa4HCl3TDuHYqgGb+gvjNTKVgbO7ZaU5bhUzXQiQm6qY41c3BkULbL
	jKzNAtqEBo55zdAVTJN6V4Wk/p/HamwS8Y247P7giL7Hk9sNU+YWYfli51Dhz2u4xXrVELSoZxM
	6iBh9MgixztJGrTvWXxJooEwqF992PJFLbjsHf5Ft4OrRWnDE2UXL4P6e8Qck28ZZ2lBpgLfw0b
	vrzgYr4ZkEp6M+/FmCIAxpobw+oURHTDCXy3TSRA+5vkXnPYwWKUkEdKJrHU+iulmMiCJGB1uvu
	P4yob7aba8O7tYFgw868OeC67CeuhyGNuvIO5F+hlTmO3Ia0p/N/3JChfgJTd3dIlZbfs5ARzyg
	==
X-Received: by 2002:a05:6000:41d2:b0:48b:1296:52ec with SMTP id ffacd0b85a97d-4abb0c5d65amr9454742f8f.18.1795217750385;
        Fri, 20 Nov 2026 15:35:50 -0800 (PST)
Received: from Ansuel-XPS24.localdomain (host-95-234-253-103.retail.telecomitalia.it. [95.234.253.103])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-4ab6bb98b4dsm8672390f8f.53.2026.11.20.15.35.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 15:35:49 -0800 (PST)
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
Subject: [PATCH v14 2/5] clk: en7523: use devm variant for clk_hw_register and fixed clock
Date: Sat, 21 Nov 2026 00:35:30 +0100
Message-ID: <20261120233535.164885-3-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261120233535.164885-1-ansuelsmth@gmail.com>
References: <20261120233535.164885-1-ansuelsmth@gmail.com>
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

Use devm variant for clk_hw_register and clk_hw_register_fixed_rate
to correctly unregister the clocks on probe fails.

This should never happen under normal condition but it's better to
handle these cleanup.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/clk/clk-en7523.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/clk-en7523.c b/drivers/clk/clk-en7523.c
index b38d7b5dc0ac..9e92586f207c 100644
--- a/drivers/clk/clk-en7523.c
+++ b/drivers/clk/clk-en7523.c
@@ -651,7 +651,7 @@ static struct clk_hw *en7523_register_pcie_clk(struct device *dev,
 	if (init.ops->unprepare)
 		init.ops->unprepare(&cg->hw);
 
-	if (clk_hw_register(dev, &cg->hw))
+	if (devm_clk_hw_register(dev, &cg->hw))
 		return NULL;
 
 	return &cg->hw;
@@ -707,7 +707,7 @@ static void en7523_register_clocks(struct device *dev, struct clk_hw_onecell_dat
 		val = readl(base + reg);
 		rate /= en7523_get_div(desc, val);
 
-		hw = clk_hw_register_fixed_rate(dev, desc->name, NULL, 0, rate);
+		hw = devm_clk_hw_register_fixed_rate(dev, desc->name, NULL, 0, rate);
 		if (IS_ERR(hw)) {
 			pr_err("Failed to register clk %s: %ld\n",
 			       desc->name, PTR_ERR(hw));
@@ -769,7 +769,7 @@ static void en7581_register_clocks(struct device *dev, struct clk_hw_onecell_dat
 		}
 		rate /= en7523_get_div(desc, val);
 
-		hw = clk_hw_register_fixed_rate(dev, desc->name, NULL, 0, rate);
+		hw = devm_clk_hw_register_fixed_rate(dev, desc->name, NULL, 0, rate);
 		if (IS_ERR(hw)) {
 			pr_err("Failed to register clk %s: %ld\n",
 			       desc->name, PTR_ERR(hw));
@@ -1103,7 +1103,7 @@ static void en751221_try_register_clk(struct device *dev, int key,
 	if (WARN_ON_ONCE(key >= EN751221_MAX_CLKS))
 		return;
 
-	hw = clk_hw_register_fixed_rate(dev, name, NULL, 0, rate);
+	hw = devm_clk_hw_register_fixed_rate(dev, name, NULL, 0, rate);
 	if (IS_ERR(hw))
 		pr_err("Failed to register clk %s: %pe\n", name, hw);
 	else
-- 
2.55.0

