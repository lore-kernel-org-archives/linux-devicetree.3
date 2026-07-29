Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 229C44418FC
	for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 13:30:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785331820; cv=none; b=iFj+p50kVv7rIR1Gr50AohZAWbQW//pcbmp14Pb3niyBTg/3s05Bl6OFm/56brzI2bKeYFuP3UHvXlaD87mnreIyzTRIHCKj/5uutJuw4h5FiOKv2N6jY85EKjfurhPf2JiUnRPc8ssxwJOm9rdGuwbuqNyb6RBt2Y+XyQH/EJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785331820; c=relaxed/simple;
	bh=h3mRRRWRIqCqBZfRc0CmpRMQKXvpCwzIZxNJvRvwNxg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ae8T4T3ce0wim93nwzQOIUY3tM/KyAyTtZMghC5lAiwwMtTlb2Zt5UhzdxY2oyjEHXMD1B+rOpXU385QnKLum/wYihpz8c/zO2mp1BMQFWCkGNKkH8yLyYlMGsbB09wTAUTj9C6H3chYIE4A/Htq2X7ZYJqDq0NtoCAlU2+8UH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=cW2EEhv+; arc=none smtp.client-ip=209.85.210.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="cW2EEhv+"
Received: by mail-ot1-f47.google.com with SMTP id 46e09a7af769-7e9fc3de7ceso493875a34.1
        for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 06:30:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1785331816; x=1785936616; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EaOPNvMsi1Oyj1Rb1H3YB9cT3SaYqM0H52mnkJ9+dKo=;
        b=cW2EEhv+eZcw1EF3qLP65xwCQiNKoqSWvpcTMIOmHuBeEscdxMdN++l+SVHvUMoCdt
         1NuBpO7xcMaN5v87SdJjCG4TXLpQTiM81V9l2UAZfNMEf9Nk3nc9oYPfuE0XfZvBaPOv
         E8Ga+3hI89ZSpWdOm/Ycy251hdXiSEcbJXxMI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785331816; x=1785936616;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=EaOPNvMsi1Oyj1Rb1H3YB9cT3SaYqM0H52mnkJ9+dKo=;
        b=XkwZv/fiOt8wDXqpCrKlafV2tAdKn7vsox4Bt7ZMD05/GpN4ZGh2ffAUn8uCSlJGsX
         dkl0SyKmqyzq/edM+OiYMGIglEQJpa6JC8et3Py721LLNIhCnIgQxCiDWMjJJBRF1sIu
         znuM3nCAzLlKFx5czVwwfBy3dqeGi9ph8kQuwByFK7sCAsxIFLQVf/GmJ3MWuot05RAC
         iWhcX503f75tJHS4l3hfWsbG+ZCKzuVMt0Lz3xpVGjGWfilDDSCw1eWxR+OVQDMdZnvd
         XZo3L5/47hBAMYNrupGkr5CXkKOB+a/NTN95bqOGLuXs3ogxbKWopTN5GKrFSSEZB2Vc
         CSGg==
X-Forwarded-Encrypted: i=1; AHgh+RrFXXhNPMRMili+BIIVZ4/c+V3s/gBMT79S+3wvUbx0atO1xH93mrGD+qc4CGbSrmudzN2RvWFoRpgJ@vger.kernel.org
X-Gm-Message-State: AOJu0YyPn55fKbHPqPXpRTVoWgp+2VmwHtMSG/tQQWpVadHyrExlXfgW
	Zel4ILxzTJJoc+nyde5phBJkXDuiBRJOlrdYcPW8r2YNzMFat8wBF8UzEhfOjzbrNA==
X-Gm-Gg: AR+sD1223XfR5gLwud01tiMlh41q9qEUNM5YDNjNG7kZ2ztY8wsG1MzCp1gbVZll8J3
	e6wnBjb1Fe1U1ZLAWjPSTCAbtVpfNXlR6kePjQBDFX0XJge6w4zbbpC28wIwXxEt97A7WHcAboq
	VpudxuQPf1ON57zl4/0evdoAjgLg9mikeZcDmiSbEp/DBffULVK3fL6n3DNGLu3K7z7is/1NKw3
	jFLbVHYZ7HgRoPZTKQBe3uIX6RsLKVyaj/NXqSbOGKC5htIIHYI9dtYBPD7u6zw+Oh0FOG08ltE
	jnJe71YZUQ94rg+hSPa+9ALLyEe6MbOyZoMm513PaF1+qcMQcNYqS0vKKYe8TerwsyFnLZPntn3
	RO899GSkbWVS0Hrw9pKR+XVSe6oOFVkdlq+UnmhTH2J5xYBsZ2gUgDuKbuhdLfmcnN94bXuOZfW
	KnAUoLMzhoJdyCWkLMdoioWHqAvBIrCmbqJOhAz+s5PTruPcTeg9ionvU=
X-Received: by 2002:a05:6808:ec9:b0:494:9c17:c336 with SMTP id 5614622812f47-4ad5bd54593mr3466258b6e.34.1785331816049;
        Wed, 29 Jul 2026 06:30:16 -0700 (PDT)
Received: from chromium.org ([174.51.25.52])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4ad6ef5d650sm1712932b6e.9.2026.07.29.06.30.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 06:30:14 -0700 (PDT)
From: Simon Glass <sjg@chromium.org>
To: Linus Walleij <linusw@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	Jonas Karlman <jonas@kwiboo.se>,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Conor Dooley <conor+dt@kernel.org>,
	linux-rockchip@lists.infradead.org,
	Simon Glass <sjg@chromium.org>,
	Jeffy Chen <jeffy.chen@rock-chips.com>,
	Ye Zhang <ye.zhang@rock-chips.com>,
	huang lin <hl@rock-chips.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/4] pinctrl: rockchip: Decode drive strength in the get function
Date: Wed, 29 Jul 2026 07:27:25 -0600
Message-ID: <20260729132736.3807082-2-sjg@chromium.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260729132736.3807082-1-sjg@chromium.org>
References: <20260729132736.3807082-1-sjg@chromium.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The decoding of the 2-bit and 8-bit level drive-strength values sits in
rockchip_set_drive_perpin(), where it is unreachable: the SoCs whose
banks declare these drive types (RK3506 and RV1103B) take the early
ctrl->type branch in the set path, and the read-and-decode logic in a
set function has no purpose. Meanwhile rockchip_get_drive_perpin()
lacks the decoding, so pin_config_get() and the debugfs output report
-EINVAL for these SoCs.

Move the two cases to rockchip_get_drive_perpin(), where they belong.

Fixes: dbd2317d7b9f ("pinctrl: rockchip: Add rk3506 pinctrl support")
Signed-off-by: Simon Glass <sjg@chromium.org>
---

Changes in v3:
- Add new patch moving the drive-strength decoding to the get function

 drivers/pinctrl/pinctrl-rockchip.c | 38 +++++++++++++++---------------
 1 file changed, 19 insertions(+), 19 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-rockchip.c b/drivers/pinctrl/pinctrl-rockchip.c
index 7e0fcd45fd26..08a46a04a815 100644
--- a/drivers/pinctrl/pinctrl-rockchip.c
+++ b/drivers/pinctrl/pinctrl-rockchip.c
@@ -3267,6 +3267,25 @@ static int rockchip_get_drive_perpin(struct rockchip_pin_bank *bank,
 	case DRV_TYPE_IO_1V8_ONLY:
 		rmask_bits = RK3288_DRV_BITS_PER_PIN;
 		break;
+	case DRV_TYPE_IO_LEVEL_2_BIT:
+		ret = regmap_read(regmap, reg, &data);
+		if (ret)
+			return ret;
+		data >>= bit;
+
+		return data & 0x3;
+	case DRV_TYPE_IO_LEVEL_8_BIT:
+		ret = regmap_read(regmap, reg, &data);
+		if (ret)
+			return ret;
+		data >>= bit;
+		data &= (1 << 8) - 1;
+
+		ret = hweight8(data);
+		if (ret > 0)
+			return ret - 1;
+		else
+			return -EINVAL;
 	default:
 		dev_err(dev, "unsupported pinctrl drive type: %d\n", drv_type);
 		return -EINVAL;
@@ -3390,25 +3409,6 @@ static int rockchip_set_drive_perpin(struct rockchip_pin_bank *bank,
 	case DRV_TYPE_IO_1V8_ONLY:
 		rmask_bits = RK3288_DRV_BITS_PER_PIN;
 		break;
-	case DRV_TYPE_IO_LEVEL_2_BIT:
-		ret = regmap_read(regmap, reg, &data);
-		if (ret)
-			return ret;
-		data >>= bit;
-
-		return data & 0x3;
-	case DRV_TYPE_IO_LEVEL_8_BIT:
-		ret = regmap_read(regmap, reg, &data);
-		if (ret)
-			return ret;
-		data >>= bit;
-		data &= (1 << 8) - 1;
-
-		ret = hweight8(data);
-		if (ret > 0)
-			return ret - 1;
-		else
-			return -EINVAL;
 	default:
 		dev_err(dev, "unsupported pinctrl drive type: %d\n", drv_type);
 		return -EINVAL;
-- 
2.43.0

