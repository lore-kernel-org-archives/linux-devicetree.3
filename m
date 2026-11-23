Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795447683;
	b=JhfsloI1Nn7Xq739ENA9yQGDcSA0Uw22nS3FzhCBQ0eAXAkpO/plbCJxN0aQpTchuW4z
	 5NNB5RF5HPjF9+fKPkbxjzKDgu/gUaDbEEoqbOUOB/0bxjrZSJYOtg7IRtvpFpddctYDz
	 N2qQvoQ3YOJu7DT82S5sP9xw8XUP6J+1sMSjckH/4Xa5I+f8l25RpTW1+3/jNxvdCMmh8
	 6PkWI4CDVeXSfjm5uuLwvvDf9o1ynYQ/PxIBvu1NQWDbyBFblqCa2CR3lCa2BPbKamPj9
	 BgVXlv/w6bS5uMzJNeMV7GIgS3tg2/0GdpZrK1MMJaWVo66y1HFsGCCZnM8kP9nH+WQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795447683;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=c1EzffyQMBPdxbIZVJGcUzqBXPK2cayxcVlx4GrPO7w=;
	b=uj5MMseTI+s1HYKfGYQIOhTfO3w5+Yq1s0pOgG6/OFhs8V0TNONaBpFRdARZ6Kl8eXiz
	 ARyEkj/4CALDrxIYtkajlOT6suUwErGzJuGjc91b9CcVe1kysjcHVj1cROwKMfdDwC4/S
	 caQ4B95Zk2KtpmAGRdMJ70Bjt1JYeILSZJxmPFUjhtXISceswo4a4r/qayKO5TlCh/cv3
	 1GhJQWLYYT+B/D5AXPIr4zKthY2CcL3KUcAyWQXyN40piO7m/wqO7OXLBJdzoMpq+XRCJ
	 LPh6FXMpQSEJB0BxbbDH1GzZ053V2Jnfx882/l8vlCdgm11tVPQRblT5PRCOfhNBZnQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="tM7/Lb4o";
	arc=none smtp.remote-ip=74.125.82.176
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8C9B606A333
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 15:28:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D8C9B606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tM7/Lb4o
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-3282db206d3so10247102eec.0
        for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 07:28:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795447682; x=1796052482; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=c1EzffyQMBPdxbIZVJGcUzqBXPK2cayxcVlx4GrPO7w=;
        b=tM7/Lb4ohN1rjBmrP/p4jsqauMxS8DlnR9uOt5WOXDONuj9gtBL24ThKjhYyUJ1osr
         DzqANDmyaqyQRIj9/WtIAT/2YNLsDbukMTF8CsLrlVLEEj1u79LxziKXkIVO0kuI3yvd
         ilvhELHyvShgLq2T3GfJ2xb3ebiLdSzv8fG/1WUouEulxQ2bjODdAQn++ALn6A5oRrdP
         gp7+Nu5zsnypVzDnLckDqxN6joBc14yqFTXBNPePxokmg2P15CstxQ+L4Hii3L+lJDFp
         UW9V1QtAegU0c2Ex964UbGyqVPZzoLvvZqPc/2zQWmZhYNNwMxGusYtW/O0GQnjuA8yN
         3YsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795447682; x=1796052482;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=c1EzffyQMBPdxbIZVJGcUzqBXPK2cayxcVlx4GrPO7w=;
        b=GFtYPR0VYRn3SONkyQKs4ULri6R5pxAXGUeQ1VPWAV2d6fWxdnbskkMNVbA3vHdiV+
         39M536cayWl5oJZEV454Upc8Rbc6Cb3AxUTfeZhysyg4oepQRp7cZRbcC+wLaMQJO/so
         DZFKyK6tnfh5Fr5jDz/BKubqQwX44z7/gizLOeTPxLGgt6oGNMjv99pSIx3DVy42bHiD
         2GLRvGMZ+OmhXJ5gVqvMoy5OQGqAA8YL8X6Zxde77OuaU3DnZjXsibbii6/I/0KH0MZ0
         g6cpeL/FZZ6JnZU7ECK46mjPk9s2JznsFs7m2fERdXmwbL4NcRI1EKWVVgHyBfZNEmAc
         pccQ==
X-Forwarded-Encrypted: i=1; AL+hErEtykTLOyjepYbi3xiuXY7Gku4KYDRZV/XXUjjp9jBgF2n6tLYv1DfR6aUPZsMMdgZZDJkhnuIHjcu0@vger.kernel.org
X-Gm-Message-State: APuU4Z+OIvHg4hphRNA0N82L+jvAEV5S7vJQphtWnSq3fem38psRtpMd
	Rg6X2NBN7KldEOZeUTXDf3Fe92v4dak8wqeSLLKFjEa1RFfxonPVmGll
X-Gm-Gg: AZFdTZcAXr8ZsMY2t9TS0oMstA6NDhRiZkjpEe/WyimEVFTpsDbkbGjfefh9/sX7de2
	lM330wDpq9dLV3Inj0fzUa8K/tZ7hu+1HK7o1cnRwByxyDOO9Nyk/DZORwIOaztUr9AwAoMMuTb
	QRewO/7gfSLu8pM92VUA4FPfMl0+dYlZ9vMrL1CCOp75IxJZQCQSufPGipeHGs38kFUfccPBk70
	mTm2rvgu9EVRUfgp2Tzv9/I0GmuBvGA1vb7dpgWB8XOt1ptQbywD709O+/gdb/FFsbzuMnE44om
	wZkt41/5sWvNazmTEohD1NspD9N9fMP7u31wckuuKMdEPABBtk9RsK75FI5nSZBSuMSrtkoWzfO
	UqZlYkcxPM/ZoANtNyyp5AeCFT9kWUd5uazxKCsGREGQTMqb+cB80tzISZdmlpXzMxfWqeYdRrB
	x6zki7fwjd45U3GCxTUg9JtVoB+XTE2EBJ2lRT3whBJ4QS6TMvrX3srvViWDEZmqwx/Upp46hMt
	EsLha6jHB43JeSndPFdJ3bsf/lSRuu/u1ujRSCCv2RdptO1srSdjVcVGq1BoROgX4aB5c96p3w6
	vYsm+iv21JMkBPyXXtEKEQAgoKFsOw0iAH+tuatXbjbzOw==
X-Received: by 2002:a05:693c:8801:10b0:386:b070:6f2b with SMTP id 5a478bee46e88-386b0707075mr3467857eec.36.1795447681882;
        Mon, 23 Nov 2026 07:28:01 -0800 (PST)
Received: from localhost.localdomain ([2404:c0:aa07:12b3:e89:dfdd:d14b:d911])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e99fdsm46569087eec.5.2026.11.23.07.27.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 07:28:00 -0800 (PST)
From: Hikmah Gumelar <hikmahgumelar@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Hikmah Gumelar <hikmahgumelar@gmail.com>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Subject: [PATCH v3 1/7] clk: qcom: gcc-msm8953: fix csi_phytimer_clk_src 100MHz parent
Date: Mon, 23 Nov 2026 22:27:16 +0700
Message-ID: <20261123152722.168879-2-hikmahgumelar@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261123152722.168879-1-hikmahgumelar@gmail.com>
References: <20261123123546.152162-1-hikmahgumelar@gmail.com>
 <20261123152722.168879-1-hikmahgumelar@gmail.com>
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

The 100 MHz entry in ftbl_csi_phytimer_clk_src selects P_GPLL0_DIV2 with a divider of 4, which leaves gcc_camss_csi0phytimer_clk stuck off on MSM8953 platforms such as Xiaomi Mi A1 (tissot).

Fixes: 9bb6cfc3c77e ("clk: qcom: Add Global Clock Controller driver for MSM8953")
Signed-off-by: Hikmah Gumelar <hikmahgumelar@gmail.com>
---
 drivers/clk/qcom/gcc-msm8953.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/gcc-msm8953.c b/drivers/clk/qcom/gcc-msm8953.c
index 8fe1d3e42144..8aec5600e837 100644
--- a/drivers/clk/qcom/gcc-msm8953.c
+++ b/drivers/clk/qcom/gcc-msm8953.c
@@ -964,7 +964,7 @@ static struct clk_rcg2 csi2p_clk_src = {
 };
 
 static const struct freq_tbl ftbl_csi_phytimer_clk_src[] = {
-	F(100000000, P_GPLL0_DIV2, 4, 0, 0),
+	F(100000000, P_GPLL0, 8, 0, 0),
 	F(200000000, P_GPLL0, 4, 0, 0),
 	F(266670000, P_GPLL0, 3, 0, 0),
 	{ }
-- 
2.47.3

