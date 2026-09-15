Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91AED47F3D9
	for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 10:43:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789469015; cv=none; b=tkIK0W6I/ZbSgPh6DjoD5oIlD2Fs9AfpYTxTIo4endCWyV8T88DP0n4k7GRyg/4IOrzgXLYQG3f+c7G8zFKt7UBFJ0lC0qvDAmbncd/aPgyxSFltlCHdVchJNY7vpxCgIIq0fIwujA6HzMZuhdr4ut+waQGkzRuspYCISVYcmNY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789469015; c=relaxed/simple;
	bh=T7svtQCEZR4NbRSxQOr575LmZrX+L5qTFSBrf8JfOqc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=W8uHPM5dZBDaupKLUiru5PG2D2WVPIs+Cy2f5xCvxT62bYESOsEPBxztVmkP4G9KrVDKax3y/hGBb/f8WL8uxbKKZLzCTa4gVXvoy3KD9qvMFyvvutwcbZ1w34RP9SGGqUxzMOmbNSM/27YzmyWT3KgFmL7TfAAYbZyEBu3VljQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hEqcvPH6; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hEqcvPH6"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912d3931so868885e9.3
        for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 03:43:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789469011; x=1790073811; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+CV6Egn+bDTw43XKQWvuzHo2bqHGWcQG7Sgy8YDAY5U=;
        b=hEqcvPH657nPit5JpSf6aeSK1VzhHI6/z4DvU7Jx68BhE8mFNi1BaBxHTmTg7umw7g
         e6UG4jykuI8171FDngJ+5BVXcEHxOamop7TQ2lR9SsK1S3imgkvL86a/F6fBmoOklYxz
         enW5LvJe+yaOV1n8njhYkPazT/3K40HZuP+q6/C/mru+rR2hnmUo2M76UJ+Z2yES3DWP
         Q4SzYijZo1XV3ve/MC3ViOglGC92NwnRP6wfU+gCqHT/8+QIWvwSKU8itQ+ixebyd4kT
         kE6T0wJyzC6VHuJxskHi/mNoq+820cMKdR2W+D9FvU9TQvDrKnr2+RdAAWdfNn54GRW0
         Hyfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789469011; x=1790073811;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+CV6Egn+bDTw43XKQWvuzHo2bqHGWcQG7Sgy8YDAY5U=;
        b=2wXdGVN6kyBTwuyyF+FBtHWq+wupSYv5VkNDCfwuR4MJ9ZL5TWzIStrKDNKF77exXK
         pIaMS1zy1/pY1VTfkgNhog6ljo7lHWDuHxIsfrW0PCbpceargUME+Xk2KTObbwU3zNoE
         mbdOXE2zsShSg/XpLRrXnxgtWd5HhbNuCMmYwlwed9Mu+7dIBWEO+zQTPM1x7EJz71dr
         evgN58DgCStir7co08IfhQvxi6YYo1IrrIvlgbH8/mQXY9vcFE8vEhf2yS2drtQ7UPXy
         dE12ZqmhWpOtUo+k+ORNm8NpzmSA+W19bva9bKweALR6N6QgZGZwp/FW1eVk0Zmv/Vk2
         pAyw==
X-Forwarded-Encrypted: i=1; AKwUvBwDERX/lcCYqr4p9bQIySNXMnK7sOhm7KSX6TFYtgPLUbOkHQhKp5eTT7dgrcQT6/C5doaJ5pNrL7tL@vger.kernel.org
X-Gm-Message-State: AFuF++neO9nykwE3Vh81rxsl284fv1W06EK73/+8/qmrv+vcnxY9CsDS
	BmFsL8LSSmeF7hFn/igkAwNCeDsOEldLHLtDKZ2b7MHdyv6VId8UsdapYoi+Zw==
X-Gm-Gg: AYBFou3YjjHQuObkf9yNcefznRW1pO2VUNpuaE1+g6yFw5NW0H08xKbALiFP0zL0tIX
	eYehHuDDokILV+j9aNbSp3/pMm3Tk9QboqffqEZIpTq6UiAExKVcAW2GRQrEYj9qRDmU0oPOnON
	TuFeyGYdgJmFOK99L6CwhsLkShG6ff94bX/Q5fufPShLEl6sEoLC6HWxEQE7P45NHGTt8x+wmC4
	EzzwfSzkevmKsLqc5zZIB6h4ph/toqFZXZjC35n4MdTzvrTbd2TdSnm+/E7oit/No6z/cgdMc1p
	KXU/bnO0jwRSLMOk8nNqSA+pMIx3L25StBSUPKvKBlRSDf3vFECwFqGWsNcmvEv9EX3uHz9eLwh
	YwrBEDOd/M11/YXehw/PmFx7WxDchwrh5RvJnPAmejGZZ3tCB4pAn8kfnM1wYHxRUK+INoe0OXS
	myni7pcZLW8eL1bTdDEm2iwGE405r+yjGvF3CX+pzk6J+QcArIkIYazt42LDNL4IgTfLpSB065A
	2TkDb7fGeacKicsXNNhyvICtkNVVZe0BCBbhr573FKJCVJuUP9KJDIzZcXcXZFCYiUhnUFc8xyX
	Kw==
X-Received: by 2002:a05:600c:3516:b0:49b:d45:703e with SMTP id 5b1f17b1804b1-49e82210b64mr9351345e9.8.1789469010714;
        Tue, 15 Sep 2026 03:43:30 -0700 (PDT)
Received: from [127.0.1.1] (2a01cb0007c59900d73f8285c1e647ab.ipv6.abo.wanadoo.fr. [2a01:cb00:7c5:9900:d73f:8285:c1e6:47ab])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e7d2a94b9sm58001325e9.3.2026.09.15.03.43.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 03:43:30 -0700 (PDT)
From: Amin Gattout <amin.gattout@gmail.com>
Date: Tue, 15 Sep 2026 12:42:48 +0200
Subject: [PATCH v2 3/4] phy: rockchip: phy-rockchip-inno-csidphy: add
 support for rk3576 variant
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260915-rk3576-dphy-v2-3-b56e68b54b8c@gmail.com>
References: <20260915-rk3576-dphy-v2-0-b56e68b54b8c@gmail.com>
In-Reply-To: <20260915-rk3576-dphy-v2-0-b56e68b54b8c@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>
Cc: Michael Riesch <michael.riesch@collabora.com>, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-phy@lists.infradead.org, Amin Gattout <amin.gattout@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789469006; l=1842;
 i=amin.gattout@gmail.com; s=20260818; h=from:subject:message-id;
 bh=T7svtQCEZR4NbRSxQOr575LmZrX+L5qTFSBrf8JfOqc=;
 b=eQvDxheF72tsvAJS32ZkaFvXX6NNWm28Bsw7F/w1Zy5QmGsgwEi4egtVnZZRjBKNhf4WjFbAW
 h0O3gsraYFIAa6PT+HoD2V4W8Tz+gYMZVjRPi9SOtZsJl8Lzfm0kax8
X-Developer-Key: i=amin.gattout@gmail.com; a=ed25519;
 pk=MSIqDPkCOkwtyP8Fns1m+KFU9SgqoDl2mpLe18vL+hQ=

The two RK3576 MIPI CSI-2 DPHYs can be supported using the existing
phy-rockchip-inno-csidphy driver, but they need their own driver data:
as on RK3588 the GRF control bits live in a dedicated CSI-DPHY GRF at
offset 0x0, while each PHY instance only has an APB reset line, as on
RK3568.

Signed-off-by: Amin Gattout <amin.gattout@gmail.com>
---
 drivers/phy/rockchip/phy-rockchip-inno-csidphy.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/phy/rockchip/phy-rockchip-inno-csidphy.c b/drivers/phy/rockchip/phy-rockchip-inno-csidphy.c
index c79fb53d8ee5..177beb685f70 100644
--- a/drivers/phy/rockchip/phy-rockchip-inno-csidphy.c
+++ b/drivers/phy/rockchip/phy-rockchip-inno-csidphy.c
@@ -403,6 +403,17 @@ static const struct dphy_drv_data rk3568_mipidphy_drv_data = {
 	.resets_num = ARRAY_SIZE(rk3368_reset_names),
 };
 
+static const struct dphy_drv_data rk3576_mipidphy_drv_data = {
+	.pwrctl_offset = -1,
+	.ths_settle_offset = RK3568_CSIDPHY_CLK_WR_THS_SETTLE,
+	.calib_offset = RK3568_CSIDPHY_CLK_CALIB_EN,
+	.hsfreq_ranges = rk1808_mipidphy_hsfreq_ranges,
+	.num_hsfreq_ranges = ARRAY_SIZE(rk1808_mipidphy_hsfreq_ranges),
+	.grf_regs = rk3588_grf_dphy_regs,
+	.resets = rk3368_reset_names,
+	.resets_num = ARRAY_SIZE(rk3368_reset_names),
+};
+
 static const struct dphy_drv_data rk3588_mipidphy_drv_data = {
 	.pwrctl_offset = -1,
 	.ths_settle_offset = RK3568_CSIDPHY_CLK_WR_THS_SETTLE,
@@ -435,6 +446,10 @@ static const struct of_device_id rockchip_inno_csidphy_match_id[] = {
 		.compatible = "rockchip,rk3568-csi-dphy",
 		.data = &rk3568_mipidphy_drv_data,
 	},
+	{
+		.compatible = "rockchip,rk3576-csi-dphy",
+		.data = &rk3576_mipidphy_drv_data,
+	},
 	{
 		.compatible = "rockchip,rk3588-csi-dphy",
 		.data = &rk3588_mipidphy_drv_data,

-- 
2.43.0

