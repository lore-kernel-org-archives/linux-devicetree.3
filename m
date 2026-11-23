Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795437368;
	b=3JM42BXswcdzzICfwjE4W9PD04/+GjLgy9TVEKP3KYMg9XkDSOgp+gHXWGyw5fapRcSE
	 vHtafBY24EsiqlRR2bGZhYD/blh8UQDLZHXVvwMW1Mph2IjHFZ1erI3KgBTSWsdvrHlQ0
	 aFMCg/M1X/xCWHVAGIt4Gox1JJLIEDgxaR152H9bujNO7EVHxuOT+OXb6qpxRE4j428cX
	 nbKeO0SU2jWCVMTyaC3QEaeetxkzuFBhxDgYwxCh9POCYNbUD4N4BPqkA4d9p8LReJFsF
	 m/nHY0WMqzJh/vet0VJ+6oKhvcw8EKO+UdsnPs9++l/KXyADc/6ab6pfxigmCx804NA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795437368;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=qTs6qt+I479MzVm3TzmSF9iYkRLfWtY+RBYI0Kg8HgQ=;
	b=0NXG4eTFX+CSwFRz31tm90d8cVAqyds8unxREgmn+kaKdWbuh9t93js3e7lppnqzVVSy
	 HUsFA7GSqJWSbFOFjdRi8RQ6AHAl3lWka8Qo0Z/LVbJ4oTvs31saTAIvwboVqeQh6YCBV
	 WSLCRpsue/AzeiJNzIeFi/Vj8hnWPflf8rahaCLvELDzc8NxNfgIq3O2vhxHK18xXtavd
	 txlcpClCrYI3kc3BcvFf+P7mRFsX+sVlbIQb0R+ENzukz0EQ8r1Y0QjHnkHRznKR+leg2
	 KTdFRiTHf4pLlGJfA6PrAWKkuVuMo8MJF2OifpzuJxOMl3Xdr3yUOeQk/A8quZl9c/A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=alq+xpW8;
	arc=none smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EC79606A32C
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 12:36:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6EC79606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=alq+xpW8
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-382f4710a17so5494958eec.0
        for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 04:36:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795437368; x=1796042168; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qTs6qt+I479MzVm3TzmSF9iYkRLfWtY+RBYI0Kg8HgQ=;
        b=alq+xpW8lvIvn7LcJwzSvomTxbVuQXitCohB6cKUBQAR6jW9xKij72us30SL05FkMa
         H3Poy1cOtIZ4Sy0okJijmUSOBntFNr6/Oxa43vJbYWKncSm6Do4G1wHQS2tDipyPE/lJ
         fwQh+u8cNBxIiNdUK+P/pbNoutc9ywa4rJr/Geb/7NAHIHIGl+GlkvwtU8NaxtVNcE6x
         3vMPNKRFxg87rC0bZNZfq9UgV+4zlMY6+Jh9w7xb/LhDIVRk8EgnbFP9ID41wPMuZYrX
         e7Cx2HK0oF7JaWx+jgqk+gcKRJ38vpli8lP3FgvCI2JX8jt+O1Dj6VtscZ6JFVBd+4wg
         f64g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795437368; x=1796042168;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qTs6qt+I479MzVm3TzmSF9iYkRLfWtY+RBYI0Kg8HgQ=;
        b=zsdF731gVioaceEmDGcdFSKrzS+OqkhA7w2oFTsrTRJw44mhalC5tn4y4vVyrfmnrP
         OcTtcBRjT6AsifdDIbCy7pxIZ6r+O+Rs0GGlEh55HO208NXt3g5TFKGrZxvWWRK7h0XA
         Jp2xutzEk8wDF+4pgmo/Y0luR/fzF7VdnXYgv6lplFY5uDHDNHU/0eWJgPWgM5QOzLII
         AkfMdAXvoJW5kNdRPVcptdLFWKCnKEtnA41ThS2hA7OuskvzsuMUk5641zpylQs3O3LM
         LKPosxkTCfsK1IyoykYS1SgnCu1lWFE+WmjHf/BXmiYnQc8c8NABEE70JV0pSxxrUo+S
         16sQ==
X-Forwarded-Encrypted: i=1; AL+hErECO01Dx6upcy5zNrsD3tizxXijgToOXdBf8lhNF1QDyZMuDLuG5Vir0/5K6pFFd0B7Y0/Cm7ja3KMH@vger.kernel.org
X-Gm-Message-State: APuU4Z87J/UPDOTQzZEK/kNVEmVfcOhLCKFejF5WORn9zJiwRiId6B38
	hJM4eac2RFfTTre8SWyLtkn911yBXc2sNAiMqV0quroN/YCevqKk4ybZ
X-Gm-Gg: AZFdTZcpii0jkBG+F1/ga1sJJzoh4K+e3TzPEJHjyTiVyxdBKZI+h7yRd8oTkQZzFoE
	fJ0QWijfSeG23O17Vn4/Dw9rl93sIzxFx1euGjYBTBZZV3iKcPx8t3cDhXylMR268JYUJJkL8LH
	xYKK43OoPRdYwFL6MmB1oflKQFKxPwT2VGXm57W3JpgF/8WxZ9FxWTXdqYfgY5VFDuyrdOUwd0F
	c8QKveTmU85IiXcArQtcP2GFDTj/QC7BI0C1ddI43uRN24J4H7tAdxWxQiTN7XwFDjGikstLrXO
	s1vRjEicaCcsf4dn5k2vd4kwoUlVXAG7a6C8TxkYrGWFO/3/5cUynXBcJoZnS/iXvm0nE4/4kts
	dFN2csdlQT56c5p42Tf/JCy4VEvINPbnVTELnR4CB9yWA8dNKMf1wuQNULafCuFfzWBIBlS6HZA
	lrNeB1weyPTYTeh5ZS+KvR8q8Op9CZkX58wrThU9Qka/A3/Zs+g+NYua6++WuFsuDnCivqTUkcj
	RtelaUfPw6iPkUGx8Ty8t7+DDx7MH8RDsmcohOubhNFa/KA45ZHsDPUJtCMZdqIVKvSUD4SkJyf
	r3RcG0MAQRreKCybOmcEHlyxiKQGX/oGE4rOCeV5+6g3DQ==
X-Received: by 2002:a05:7300:e60c:b0:386:636f:c25e with SMTP id 5a478bee46e88-386636fc6f9mr13059014eec.12.1795437367601;
        Mon, 23 Nov 2026 04:36:07 -0800 (PST)
Received: from localhost.localdomain ([2404:c0:aa07:12b3:e89:dfdd:d14b:d911])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385f68bc0adsm32854353eec.13.2026.11.23.04.36.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 04:36:07 -0800 (PST)
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
	linux-clk@vger.kernel.org
Subject: [PATCH v2 1/7] clk: qcom: gcc-msm8953: fix csi_phytimer_clk_src 100MHz parent
Date: Mon, 23 Nov 2026 19:35:40 +0700
Message-ID: <20261123123546.152162-2-hikmahgumelar@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261123123546.152162-1-hikmahgumelar@gmail.com>
References: <20261123110805.119610-1-hikmahgumelar@gmail.com>
 <20261123123546.152162-1-hikmahgumelar@gmail.com>
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

The 100 MHz entry in ftbl_csi_phytimer_clk_src selects P_GPLL0_DIV2 with
a divider of 4, which leaves gcc_camss_csi0phytimer_clk stuck off on
MSM8953 platforms such as Xiaomi Mi A1 (tissot).

Switch the 100 MHz parent to P_GPLL0 with a divider of 8 (800 MHz / 8 =
100 MHz), matching the 200 MHz and 266.67 MHz entries.

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

