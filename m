Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794869309;
	b=1NLjvMnjQVaghI0Kt3oZZlLsDw9xFKFP+T/mIbqLH5sWg15k1GtoOagK+NwDELSqDJVg
	 HVvWxuRk3KZqBSf863AGS3kORDdQz7nEnEpfKpPz7WgZLDQhjFLjEzx+9xGZ8KsQf8EJK
	 jol9TUsvnCnPcZB54q4tRizqHukKm3XfeqMhqwHobFJKji8IRF+uOlJarLSt0y24X2sbK
	 21xfo61hSpCRFLvrYMwySNmHOgoOYPC9UuzSH+w7B/sG/F+v0o5UvaY7OJzvwiSgBtieQ
	 G6rTKBWstSxL3woy4Zw8MNVwp1W0PEO4KvDxknDHUN2BQlMdh0Yw3C0/Ct2GWPyirFQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794869309;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=bZKF6TYd/oNwfZR5R6RX8KffmVrf3Im0dZF68ZrZGqU=;
	b=5GxzMgTWSw75imedrUhjo+HG4q85kBa2dN9S8NzJH1xAfKJrh85hmI7KsGryv1SeXc0t
	 l5vnHFeg9B9NHx4Os85e7IE6PQ0EQO4qAAbKVTLecZi9rcDXF+kvrAQe3K0TP0UkqHFAL
	 gfiMXEHgStdN2S11Z8uBUANm0mHALoF84zzkejnATm/mAWpdPBRSkERpwSG9arIDohZAg
	 sFE8fZBuD6GN+79JuOFHinSNqwM0MAkmXJNM5Pdvf48eSRINfx4ZQ1WohO2sRV7DI4fHG
	 M8BoqeTonhYq24+gjF4IToToizHlCOXcPB4LYGjlniJbI+9Yq3Mbgh7ko0ne+5tE5Cg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CqrdJtqq;
	arc=none smtp.remote-ip=74.125.224.54
Received: from mail-yx1-f54.google.com (mail-yx1-f54.google.com [74.125.224.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C074606A334
	for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 22:48:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4C074606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CqrdJtqq
Received: by mail-yx1-f54.google.com with SMTP id 956f58d0204a3-679a2b5fe87so4168214d50.3
        for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 14:48:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794869308; x=1795474108; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bZKF6TYd/oNwfZR5R6RX8KffmVrf3Im0dZF68ZrZGqU=;
        b=CqrdJtqqlqqFTPvG21v5VfgDwdnkGw0lkRHkWExpiZRr2MveXfoFTXtiOss415VbDE
         u0dXEJCO3aQ8kiJmmBLtdTEt0VLMkD5XQLKI0wp28opEfbSXx+VFRomGLHOeREoxsdqd
         V0NljsHCmwqNU/130gTTA1L42Fs9uosV9qbGjsyB63I0/JnvJCHgOi0yBW8laDzORAuw
         Od6Oi0w0sFbjIbKgiwANjzFHkZxFODojpGcDwN9BeHhcyOX3RIXeXjT7daBwyKjiWK1K
         mAvd/JwJZyI8dM4OiD7TAznZ7Cob8zennS5HneSbMejsiYIAKr09WIqzhQrZmJ6CiTZe
         bKzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794869308; x=1795474108;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bZKF6TYd/oNwfZR5R6RX8KffmVrf3Im0dZF68ZrZGqU=;
        b=varcehfgKb2KWcigLfB3Lgo86A1/x4daxBv8L5b1YR3DGYiFrHwozf3RwAvSa8K4zy
         /cxmp5lhvkvSsMQkZnHbGkJRyluYBBmUrS83DBUAI+AlEqwahjFDEQBwrtelSqAUfkKD
         dR5VujW6IMLSXTsNuFFmCGrXLjImZdf6ZdVjxk+mxXyvBuya+W42zWG668RbuOAMrIXA
         OH/jxpKntdRZ7Gia1THqFOlhpEZRP+VlW/L4wMNz3iuYknYYl/T4gfcQ3KblqigHMjkf
         3uGxV/dh3iRibGdS2VKf8DeruK9ERqIiearWO19cbGQX1YNcGNUu3QgcvUlyOQGzoSle
         0ZDA==
X-Forwarded-Encrypted: i=1; AL+hErG3VnkUY1tpxcMLVNEBGD7QrbK46ag0HTw6PzLACW7rZlSt7DnSKIvYzknR1TOoegCDck7YMz/L9yNq@vger.kernel.org
X-Gm-Message-State: APuU4Z/Unonxr4wBr0xAh/+puZYUMGCgHNlpHD3LnPJiWbkDPQYfWKOc
	rQtqWjt3+R0NRpSicHfmPxhVn7nNOGypY8Nrf4x7QzwNQTfMvPxOMOru
X-Gm-Gg: AZFdTZfEiX8p1Cg7XDSWECO10aE+tew7QsQSnaC0MJ31pnM9MDBkD+IYY1M2QtWyfz6
	EDer/Uh7eZqiWZip6Sere4dXFe5Vm7QXvpLFBkiBdhXQkP12Dot9Zy3A734M8tAbDwWe2x3VuS+
	/ah5opLnATa3QiDzIxqzBYJICXhRxLpHqZhKve7wgln9pI9HJVGFAIqZz1epdNDD82KxZ2COFu5
	CbqDwf8+7k7IzlnfbVNAB8kvkuyk8pH2vHHMxdD3oJmKgupkU/4ej7yxpSt32dkypZHAq9P0v0U
	eZhNCm/twaWUA22KtHecdbsic0WgQbP0/LeY97NqUMkHcvPK6d5RLICH9zlpuKcVQU610wbbfbt
	lhOzZ2grXZ3I9C8U4iqT2MVElkIecP86EbJ0RVkA3AXVmDOBUfSjeA1leVPeceqtb8NGP8R2F10
	+Bf9YxSsDIY5UeL5SW1CVtKNJpkL8XXgoVzTuznvJVQLgp3p6jmmFkDgHWnXfuE3xErcZWndjwC
	Jo61ihYFVpBh0Gl26xe2MiMVF68qmMtjjYbMQkrQXjZshdrtg14VdbimAN4b/HC/wBCysDIptE6
	kuyygZa869zRoN5nWitxwQ9r1CTe+5yNpt+NXKcPvHmCaGS0llquR/1wB52Dsf49Cu/M2N+tzpQ
	X28m8hlkBVyIoA9FD7xs0XJw=
X-Received: by 2002:a05:690e:d42:b0:67b:e822:6ccc with SMTP id 956f58d0204a3-67d895e5aacmr4455238d50.33.1794869308071;
        Mon, 16 Nov 2026 14:48:28 -0800 (PST)
Received: from fabio-X870-EAGLE-WIFI7.tail2bb604.ts.net ([2804:1b3:a803:1afe:e1c3:da60:db44:d0c8])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67db0361f39sm5259534d50.19.2026.11.16.14.48.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 14:48:27 -0800 (PST)
From: Fabio Estevam <festevam@gmail.com>
To: lee@kernel.org
Cc: maz@kernel.org,
	andy@kernel.org,
	jic23@kernel.org,
	dmitry.torokhov@gmail.com,
	linux-input@vger.kernel.org,
	mfd@lists.linux.dev,
	linux-iio@vger.kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	Fabio Estevam <festevam@gmail.com>,
	Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
Subject: [PATCH v4 4/4] mfd: mxs-lradc: Convert to devm_clk_get_enabled()
Date: Mon, 16 Nov 2026 19:48:03 -0300
Message-ID: <20261116224803.61154-4-festevam@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261116224803.61154-1-festevam@gmail.com>
References: <20261116224803.61154-1-festevam@gmail.com>
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

The LRADC clock is acquired with a managed helper but enabled and
disabled manually.

Acquire the LRADC clock with devm_clk_get_enabled() instead of a bare
devm_clk_get() followed by a manual clk_prepare_enable(), so it is
prepared/enabled for the device lifetime and released on unbind.

This conversion makes the code simpler.

Suggested-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
Changes since v3:
- Newly introduced.

 drivers/mfd/mxs-lradc.c | 35 +++++++----------------------------
 1 file changed, 7 insertions(+), 28 deletions(-)

diff --git a/drivers/mfd/mxs-lradc.c b/drivers/mfd/mxs-lradc.c
index aa55f88399ef..c3dd2d80e7f1 100644
--- a/drivers/mfd/mxs-lradc.c
+++ b/drivers/mfd/mxs-lradc.c
@@ -160,17 +160,10 @@ static int mxs_lradc_probe(struct platform_device *pdev)
 	if (IS_ERR(lradc->base))
 		return PTR_ERR(lradc->base);
 
-	lradc->clk = devm_clk_get(&pdev->dev, NULL);
-	if (IS_ERR(lradc->clk)) {
-		dev_err(dev, "Failed to get the delay unit clock\n");
-		return PTR_ERR(lradc->clk);
-	}
-
-	ret = clk_prepare_enable(lradc->clk);
-	if (ret) {
-		dev_err(dev, "Failed to enable the delay unit clock\n");
-		return ret;
-	}
+	lradc->clk = devm_clk_get_enabled(dev, NULL);
+	if (IS_ERR(lradc->clk))
+		return dev_err_probe(dev, PTR_ERR(lradc->clk),
+				     "Failed to get and enable the delay unit clock\n");
 
 	ret = of_property_read_u32(node, "fsl,lradc-touchscreen-wires",
 					 &ts_wires);
@@ -193,8 +186,7 @@ static int mxs_lradc_probe(struct platform_device *pdev)
 			dev_err(&pdev->dev,
 				"Unsupported number of touchscreen wires (%d)\n"
 				, ts_wires);
-			ret = -EINVAL;
-			goto err_clk;
+			return -EINVAL;
 		}
 	} else {
 		lradc->buffer_vchans = BUFFER_VCHANS_ALL;
@@ -204,29 +196,17 @@ static int mxs_lradc_probe(struct platform_device *pdev)
 
 	ret = mxs_lradc_get_irqs(pdev, lradc, data);
 	if (ret)
-		goto err_clk;
+		return ret;
 
 	num_cells = lradc->touchscreen_wire ? ARRAY_SIZE(mxs_lradc_cells) : 1;
 	ret = devm_mfd_add_devices(dev, PLATFORM_DEVID_NONE,
 				   mxs_lradc_cells, num_cells, NULL, 0, NULL);
 	if (ret) {
 		dev_err(dev, "Failed to add subdevices\n");
-		goto err_clk;
+		return ret;
 	}
 
 	return 0;
-
-err_clk:
-	clk_disable_unprepare(lradc->clk);
-
-	return ret;
-}
-
-static void mxs_lradc_remove(struct platform_device *pdev)
-{
-	struct mxs_lradc *lradc = platform_get_drvdata(pdev);
-
-	clk_disable_unprepare(lradc->clk);
 }
 
 static struct platform_driver mxs_lradc_driver = {
@@ -235,7 +215,6 @@ static struct platform_driver mxs_lradc_driver = {
 		.of_match_table = mxs_lradc_dt_ids,
 	},
 	.probe = mxs_lradc_probe,
-	.remove = mxs_lradc_remove,
 };
 module_platform_driver(mxs_lradc_driver);
 
-- 
2.43.0

