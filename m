Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794184163;
	b=tjuqpYYCc5wVLJ8909sF+iZbJF6a4UHFoQ83+l4h8EYVqRHCaLvRTlKuwtgZvsy/SdXl
	 0l6DIi9NY1uoDe2qOnwWeIX4ttHoeKs71xRd14th/RM69aH1O08eFQTx/Qgg2bVEs0j1Y
	 /K+vRuRZzl3dO3V2JngXk/V0PCk3EMOpQW+oIr/Tt7XDmjyLJrHeNuSdw3PF9n6WiFuDV
	 57cpHSBtE3X0Uow/8vCXj3C8q9Y5CSucPCC2Cu4IWnSV5TW2iPC3pCDqGZjbVDIqqp7oa
	 U/cbgcVxbJ1K9p7jbmbeCTcmIv9/13jhT4G9hkITo5P5v5coBXI3O2Mjy0NgiXEMiFA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794184163;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=NHrSPALMzImt+5tm2bsGsRXglZXiGAopxrT3fUx6Kz4=;
	b=B3txPx/15iKHZblRaRfusCyqJkO2jpBsRHJQUaj+XmDTc3kftpBdKiUL7YxwnLDTGYhd
	 iXL/2CtnbZBcXKja/+eI3OB7nteW7+cGFHT4E5DQ/VS7UVrTD8V6VfYiusxxBj+GHD3RK
	 LgWo0226wFicZLMpNAw5jk1Vk1ezXNWQXMmNlsfJjnVXzhOvqh7RJpyJ8j2gKHr66patn
	 kl1gH5VBK/Py4KRg13WQWfF2/WJZHwduYhVsGGXuACZwZNqfBtnK24sVNaGqrrE8DLaKC
	 ohz/D1Ay76i3o5fbIg2j8d1HIzG9T2EvIjlq2M0T9x/TVywuW69d4XgNsaPwsYt9J9Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=d4p4zi10;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE25C606A31C
	for <devicetree@vger.kernel.org>; Mon,  9 Nov 2026 00:29:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CE25C606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=d4p4zi10
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a214c5c4c0so3143105e9.3
        for <devicetree@vger.kernel.org>; Sun, 08 Nov 2026 16:29:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794184161; x=1794788961; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NHrSPALMzImt+5tm2bsGsRXglZXiGAopxrT3fUx6Kz4=;
        b=d4p4zi10/iZIYiEcew0CxxBGjsSCXKwJz7Wss0Cfi3QIxOJNnQvuBS9HdlIksM/8TA
         0mmD/syfWs+a+UbR4zBmt/bHcu5Jq23y7xhZVY6/giLvcc9+jw1ggQRqVtlWttcH7+eY
         upInWhjp9Xav/kLh3RzPOsX6KRLFfZDtKEc9fypqKcYovOJENTuo01UZ2pqdRkzQSb8J
         ahXIJpkpsnAGD3XJ4TS2bkwaBZQbrBqoDUQhHEPI8QmIMbcS0cnDAYPI5GO4LXfjisds
         6iQbLLjn4kNBelJDM+MBhmxKZATTsynfheAsCwk0EBnK37RVCfaTG1keRkIlCn0JyIkr
         UrNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794184161; x=1794788961;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NHrSPALMzImt+5tm2bsGsRXglZXiGAopxrT3fUx6Kz4=;
        b=ckGlAO4SnWlKdRDvVjbYVz4YY8RC3th8aFMUuI+y/a/1dvephohUT4ab5NfRsTv4La
         4bi6vjpExy2BAas4Sk5YbMQCEyJeuLbJuH9nJZszpd0v6PDxMQyC70O03hxnqe9tzhgh
         2Mzc4tf0WBfkLWIXfJH8sDKP8Lolvl32mLOHzjg8TEY40gClvRrcGQcKTtj35EcFGOoL
         79JUQ0eTueGS9Tt0Edf1kj0B/MLmU7jzMldsRfRYWj2XHtgQvn+oOqSv7fee38Cf0dV/
         n6v+z+cgmo7ShJ6VEBk5bTnrFW0h/+EEymR2vzQJsUNNGp4DnH4u9WAVnyBd2q4qCU02
         SmBg==
X-Forwarded-Encrypted: i=1; AL+hErEf8t3w0ijxXzkQODIsja/sNJsFD9ZhRqSF9mRTRjgACEncUmPeSK7r4vjxGXzHr0G3JzCgFqgkiJPC@vger.kernel.org
X-Gm-Message-State: APuU4Z+pSC29xyErSG3vexIySyaZyMNVK1/axwmMmRfs8S9mR5e+ITY1
	TczXdtqPHu61zh3CZtzwjji4fD1Bauph+zF6r62uPK52MjaWyNpEewoZzk7utqTQ9lE=
X-Gm-Gg: AYBFou1TBmzsiobrATUVriOPe1WBYwoRlQr+DtRrGRHkTdVks8r3wtlwrJhProWkrXB
	Mv853QWiEp/UCT8xdCdOM2UiVimAAiBu6eveTC/ZMhPmjQHwKLohnrXDTZT1OZ+aMGl5B9AMrTd
	oYhNMQNkKwkvoEBLvtqkUbKPu+SZvmGZFetvUQpOU8aauBkJDFc5Jn+veX9nVTPeUdDok9VDFkA
	S4IdP0FB38CIy7bS1SGibJQl5Jo8nykzAaS7WaMz47jiWha0bkORamtBhHRqp8QskSkMI6LPdlB
	llq92ejPAgbRMGc2nxaX+HxXEw1Qtni1XNh0ZvgGKE4h5nyiDRQNpiEhw7P8BVhAWV9yLnAQHsy
	Xf84WEGVyiXH0gZY07fTuX3bj32btMDG4VavvorpNC3GG2Ig+5ryZzPC1Hj4QW9zSs4jw/80HOO
	dIPkJan1mbmrX0bwuwpZy6Op1Wq2AP8BiBOrWKO3ooMZM2uNgL2oQx/TO936pfo5+7fnI97kdDM
	4hK78Wtq2VfzkMFlkn/0ucTSfNWK1RsWINU1cEr91yKjbq/P3ej4F2cRMMyCUycLVQvJlXqQNIu
	YrKtn10e65022huptdQCUPUqfWTl1KCrLMHEc8WR
X-Received: by 2002:a05:600c:6087:b0:4a1:9663:7633 with SMTP id 5b1f17b1804b1-4b963c6cfc2mr45624795e9.11.1794184161384;
        Sun, 08 Nov 2026 16:29:21 -0800 (PST)
Received: from [192.168.10.105] ([212.58.121.92])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b90ee1de2esm91295785e9.5.2026.11.08.16.29.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 16:29:19 -0800 (PST)
From: Stanislav Aleksandrov <lightofmysoul@gmail.com>
Date: Mon, 09 Nov 2026 00:29:11 +0000
Subject: [PATCH 2/5] clk: qcom: rpmh: Add support for RPMh clocks on
 Halliday
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
Message-Id: <20261109-halliday-clk-v1-2-20c3ba8be0bd@gmail.com>
References: <20261109-halliday-clk-v1-0-20c3ba8be0bd@gmail.com>
In-Reply-To: <20261109-halliday-clk-v1-0-20c3ba8be0bd@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Qiang Yu <qiang.yu@oss.qualcomm.com>, 
 Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org, 
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Stanislav Aleksandrov <lightofmysoul@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794184152; l=2646;
 i=lightofmysoul@gmail.com; s=20261108; h=from:subject:message-id;
 bh=aIHEkyuQRMwtS4nF1/vAJgKiqPllrSNgBuEOLsM+WjU=;
 b=4GhFqGxLWBNf/FL/i4sGiZ+95EhdglFfY+0zGtEjtd6bCBnqe5FwKRv6g1GpcjOv1EoIDLwKm
 HLuC9tzQhEzB6kg5r8jpJ4YsbKyhUroOwn4a91d9Gwh48Vq+NbHDb+P
X-Developer-Key: i=lightofmysoul@gmail.com; a=ed25519;
 pk=jeRUlfmkhE53CJPoeIIXgu7rTE0ybDRH0HQrEwbydzg=

Add the RPMh clocks on the Qualcomm Halliday SoC as Qualcomm's
downstream clk-rpmh driver describes them: XO (divided by 4), RF_CLK1,
IPA, and the clka7, clka8 and clka9 resources (downstream LN_BB_CLK7-9).
As on the other SoCs with clkaN resources, clkaN is LN_BB_CLK(N - 5),
so these are LN_BB_CLK2-4.

Signed-off-by: Stanislav Aleksandrov <lightofmysoul@gmail.com>
---
 drivers/clk/qcom/clk-rpmh.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/drivers/clk/qcom/clk-rpmh.c b/drivers/clk/qcom/clk-rpmh.c
index 68640e5904a6..fc16111c890b 100644
--- a/drivers/clk/qcom/clk-rpmh.c
+++ b/drivers/clk/qcom/clk-rpmh.c
@@ -383,8 +383,10 @@ DEFINE_CLK_RPMH_VRM(clk5, _a2, "clka5", 2);
 DEFINE_CLK_RPMH_VRM(clk6, _a2, "clka6", 2);
 DEFINE_CLK_RPMH_VRM(clk7, _a2, "clka7", 2);
 DEFINE_CLK_RPMH_VRM(clk8, _a2, "clka8", 2);
+DEFINE_CLK_RPMH_VRM(clk9, _a2, "clka9", 2);
 
 DEFINE_CLK_RPMH_VRM(clk7, _a4, "clka7", 4);
+DEFINE_CLK_RPMH_VRM(clk8, _a4, "clka8", 4);
 
 DEFINE_CLK_RPMH_VRM(div_clk1, _div2, "divclka1", 2);
 
@@ -413,6 +415,25 @@ DEFINE_CLK_RPMH_BCM(ipa, "IP0");
 DEFINE_CLK_RPMH_BCM(pka, "PKA0");
 DEFINE_CLK_RPMH_BCM(qpic_clk, "QP0");
 
+static struct clk_hw *halliday_rpmh_clocks[] = {
+	[RPMH_CXO_CLK]		= &clk_rpmh_bi_tcxo_div4.hw,
+	[RPMH_CXO_CLK_A]	= &clk_rpmh_bi_tcxo_div4_ao.hw,
+	[RPMH_LN_BB_CLK2]	= &clk_rpmh_clk7_a2.hw,
+	[RPMH_LN_BB_CLK2_A]	= &clk_rpmh_clk7_a2_ao.hw,
+	[RPMH_LN_BB_CLK3]	= &clk_rpmh_clk8_a4.hw,
+	[RPMH_LN_BB_CLK3_A]	= &clk_rpmh_clk8_a4_ao.hw,
+	[RPMH_LN_BB_CLK4]	= &clk_rpmh_clk9_a2.hw,
+	[RPMH_LN_BB_CLK4_A]	= &clk_rpmh_clk9_a2_ao.hw,
+	[RPMH_RF_CLK1]		= &clk_rpmh_clk1_a1.hw,
+	[RPMH_RF_CLK1_A]	= &clk_rpmh_clk1_a1_ao.hw,
+	[RPMH_IPA_CLK]		= &clk_rpmh_ipa.hw,
+};
+
+static const struct clk_rpmh_desc clk_rpmh_halliday = {
+	.clks = halliday_rpmh_clocks,
+	.num_clks = ARRAY_SIZE(halliday_rpmh_clocks),
+};
+
 static struct clk_hw *sar2130p_rpmh_clocks[] = {
 	[RPMH_CXO_CLK]		= &clk_rpmh_bi_tcxo_div1.hw,
 	[RPMH_CXO_CLK_A]	= &clk_rpmh_bi_tcxo_div1_ao.hw,
@@ -1137,6 +1158,7 @@ static int clk_rpmh_probe(struct platform_device *pdev)
 static const struct of_device_id clk_rpmh_match_table[] = {
 	{ .compatible = "qcom,eliza-rpmh-clk", .data = &clk_rpmh_eliza},
 	{ .compatible = "qcom,glymur-rpmh-clk", .data = &clk_rpmh_glymur},
+	{ .compatible = "qcom,halliday-rpmh-clk", .data = &clk_rpmh_halliday},
 	{ .compatible = "qcom,hawi-rpmh-clk", .data = &clk_rpmh_hawi},
 	{ .compatible = "qcom,kaanapali-rpmh-clk", .data = &clk_rpmh_kaanapali},
 	{ .compatible = "qcom,kuno-rpmh-clk", .data = &clk_rpmh_kuno},

-- 
2.55.0

