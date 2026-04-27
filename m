Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E31693F0A84
	for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 17:59:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777312767; cv=none; b=BzeM5DR8cxu/E9wWsULKPFMM/QIlT9KI6Ieff07utc+q87KThyQdU8iqcsEUs/Kfa/6fVhsmLmeTUUkW4nqCmouEiYY2Kr3YJVHSmMEHQywHxZ6irGGLzXaopNli9CdY4HA6prfS5iaKh8DGrnvUFrNnIBu/n+1KxTeaRGwJWLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777312767; c=relaxed/simple;
	bh=yEAoBevnklvr751YiPv2ruAY/6bNGQFrrHJ3uHFmatA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=svzGTBNrxodjGGp70pgB+bc+yhzD7XM2pkA+EM+iJBMCQRTrBhVYDW1j+dKVy/kbD/M6hw2DX7GAsBKPoR2//NBpHb0oNw2aJm1wPurczZwpfu+ONPF3hPsyl82PdpDZjimZOK1q6V1u+xIS9HPy9vYaxz+YtXrah/7a89N5qjY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cSx7iiWK; arc=none smtp.client-ip=209.85.128.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cSx7iiWK"
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-79cd8f8e261so67571967b3.3
        for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 10:59:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777312764; x=1777917564; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4XnzuTpeCdAZ54lpqlJgam5mcLCIWMeRuvdgYIc6Lqw=;
        b=cSx7iiWKBRV1o1T2hhJCmhJtMMEVYuyO6T9HCFCREQm8gDem0cC4ZUqFTQcnafFlln
         kLocccXlCoQLdySM9b9/w+cHgLXvyXq8pu9p0wzXvZ64tkdjqvnCAMuhged6e1e6s6u0
         jnRqrSmImNU2fY+yZOx2L2btwZfzrBFDSyA5t4rigEMFu89red/G1YZgBWx+YHNGj4nw
         InrgiZPjQ+8Vj390CYPXRREa6BYJlyLsTOLgBEGwbfNiQEaknNdk8pZnE7uSL86XCX0g
         OhD3wfuuLtJunir3TJ53djWKdTEcD+PR1fmHQFpCJSfbTdB2p56LYc6v+TFoXvEk1EtT
         SRjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777312764; x=1777917564;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4XnzuTpeCdAZ54lpqlJgam5mcLCIWMeRuvdgYIc6Lqw=;
        b=rXesYyDSCwNCIteutiZ4i3kKEqEX3puaP2KUJQe/lL89PQJSlkRyzlzB3GfquShx0T
         OTmwyLG8MYoE4pZGXUxchK49p276gRAhg4KFLo+unfWC3u38KuD4f2TdDMxzhMwuBr2n
         KhowtYkZ2jBTqbvizGGVbrqFrltJPwundbhCyyhPW4Pj3tBln4LGPnYXksVwUp//A880
         ax8IOYURxyvk1iHI7rRgqDkvVXKgJeTqL0iRbRcoJ+nzV5ONK8ItjfLWzxhG1Clr/wDV
         Ch3LVKEjO1og6VR9XZTombmwfk9Yqh8zShKQ4Rp0cixRB5F7CXQk+YdbUU5BzANf5HIL
         4MHQ==
X-Forwarded-Encrypted: i=1; AFNElJ9CeLNmYZXjy5QrKZeBJ3vvDNUXYANGNI5QkcQ/OXhPn5n4lK4AL97W2hrYVaV2ML7pIEb5TDS59jH0@vger.kernel.org
X-Gm-Message-State: AOJu0YyT9mtYnG3uRbiKKGfVgGjpv8A8bVPnGY3h60mMNko6mX26Wuhz
	FUz0v0TFu7oeAS+S04RttFHOzRWUb0Sg4vOB27TyaYRNW03SmnRMv0gl
X-Gm-Gg: AeBDieuEpqgJNmh/y4nVySfZfU+HjSq4y1PnFZS9bZCU6Xn9OygoioILpuVlMwJVbJz
	IjXDa494k6DR0GoRSSABvXctvh1iECk9KlCjjWYTRPLdRpMqgl0x1rqVNN8GPNE/Ks8BNBuwER4
	br1mT3oO6W6R7+suJRcpfcR9hrOqI6xnXRuBTgx2FDoKDqm5Ly0dCkt+6XFyqHnkDM7RsuE3rbZ
	ALTBQj00erFNeEqkud6HtHl+8xVeZrRrETkn/8vKf3+naD5gbP3HgsJ9bV5a3CE67mKah9LJLaH
	MEw/YxCQ9f4HrnRlCzUgaS5ybFZ0oUN4CTDGvK9XQJFAmVgY7La4wHyZqNG505OtH1S+ZdMdsLo
	mfokEbiv0pQNUfD/8Pt9so4wp6dBUPsZgiopgDBf4V7ENrPxcyv3Zb4hwq8aIq8rTwA5QFaISXZ
	OdsEvhnGdiC3/aoH/LLuR2afZGYP0H0emcr3Sy
X-Received: by 2002:a05:690c:c22f:b0:79a:7157:879 with SMTP id 00721157ae682-7bcee02cb9cmr3050107b3.50.1777312763881;
        Mon, 27 Apr 2026 10:59:23 -0700 (PDT)
Received: from [192.168.0.39] ([79.133.247.80])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7bcf05e9cf8sm198467b3.18.2026.04.27.10.59.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 10:59:23 -0700 (PDT)
From: Erikas Bitovtas <xerikasxx@gmail.com>
Date: Mon, 27 Apr 2026 20:58:31 +0300
Subject: [PATCH RFC v3 09/11] media: qcom: venus: Move HFI v3 venc and vdec
 methods to HFI v1
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260427-msm8939-venus-rfc-v3-9-288195bb7917@gmail.com>
References: <20260427-msm8939-venus-rfc-v3-0-288195bb7917@gmail.com>
In-Reply-To: <20260427-msm8939-venus-rfc-v3-0-288195bb7917@gmail.com>
To: Bryan O'Donoghue <bod@kernel.org>, 
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>, 
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 =?utf-8?q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-clk@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 phone-devel@vger.kernel.org, Erikas Bitovtas <xerikasxx@gmail.com>
X-Mailer: b4 0.15.2

Some Qualcomm SoCs which come with HFI v1 like MSM8909 and MSM8939 also
have dedicated cores for Venus, like in HFI v3. Move methods from HFI v3
to HFI v1 so they can be reused.

Signed-off-by: Erikas Bitovtas <xerikasxx@gmail.com>
---
 drivers/media/platform/qcom/venus/pm_helpers.c | 66 +++++++++++++++++++-------
 1 file changed, 48 insertions(+), 18 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/pm_helpers.c b/drivers/media/platform/qcom/venus/pm_helpers.c
index f0269524ac70..cc21a4762188 100644
--- a/drivers/media/platform/qcom/venus/pm_helpers.c
+++ b/drivers/media/platform/qcom/venus/pm_helpers.c
@@ -328,10 +328,56 @@ static int core_power_v1(struct venus_core *core, int on)
 	return ret;
 }
 
+static int vdec_get_v1(struct device *dev)
+{
+	struct venus_core *core = dev_get_drvdata(dev);
+
+	return vcodec_clks_get(core, dev, core->vcodec0_clks,
+			       core->res->vcodec0_clks);
+}
+
+static int vdec_power_v1(struct device *dev, int on)
+{
+	struct venus_core *core = dev_get_drvdata(dev);
+	int ret = 0;
+
+	if (on == POWER_ON)
+		ret = vcodec_clks_enable(core, core->vcodec0_clks);
+	else
+		vcodec_clks_disable(core, core->vcodec0_clks);
+
+	return ret;
+}
+
+static int venc_get_v1(struct device *dev)
+{
+	struct venus_core *core = dev_get_drvdata(dev);
+
+	return vcodec_clks_get(core, dev, core->vcodec1_clks,
+			       core->res->vcodec1_clks);
+}
+
+static int venc_power_v1(struct device *dev, int on)
+{
+	struct venus_core *core = dev_get_drvdata(dev);
+	int ret = 0;
+
+	if (on == POWER_ON)
+		ret = vcodec_clks_enable(core, core->vcodec1_clks);
+	else
+		vcodec_clks_disable(core, core->vcodec1_clks);
+
+	return ret;
+}
+
 static const struct venus_pm_ops pm_ops_v1 = {
 	.core_get = core_get_v1,
 	.core_put = core_put_v1,
 	.core_power = core_power_v1,
+	.vdec_get = vdec_get_v1,
+	.vdec_power = vdec_power_v1,
+	.venc_get = venc_get_v1,
+	.venc_power = venc_power_v1,
 	.load_scale = load_scale_v1,
 };
 
@@ -351,14 +397,6 @@ vcodec_control_v3(struct venus_core *core, u32 session_type, bool enable)
 		writel(1, ctrl);
 }
 
-static int vdec_get_v3(struct device *dev)
-{
-	struct venus_core *core = dev_get_drvdata(dev);
-
-	return vcodec_clks_get(core, dev, core->vcodec0_clks,
-			       core->res->vcodec0_clks);
-}
-
 static int vdec_power_v3(struct device *dev, int on)
 {
 	struct venus_core *core = dev_get_drvdata(dev);
@@ -376,14 +414,6 @@ static int vdec_power_v3(struct device *dev, int on)
 	return ret;
 }
 
-static int venc_get_v3(struct device *dev)
-{
-	struct venus_core *core = dev_get_drvdata(dev);
-
-	return vcodec_clks_get(core, dev, core->vcodec1_clks,
-			       core->res->vcodec1_clks);
-}
-
 static int venc_power_v3(struct device *dev, int on)
 {
 	struct venus_core *core = dev_get_drvdata(dev);
@@ -405,9 +435,9 @@ static const struct venus_pm_ops pm_ops_v3 = {
 	.core_get = core_get_v1,
 	.core_put = core_put_v1,
 	.core_power = core_power_v1,
-	.vdec_get = vdec_get_v3,
+	.vdec_get = vdec_get_v1,
 	.vdec_power = vdec_power_v3,
-	.venc_get = venc_get_v3,
+	.venc_get = venc_get_v1,
 	.venc_power = venc_power_v3,
 	.load_scale = load_scale_v1,
 };

-- 
2.54.0

