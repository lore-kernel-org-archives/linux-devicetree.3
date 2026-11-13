Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.228.75
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794585904;
	b=OIJmg/hdhoqr3wWwkbSM4enATFiZfmMCxrv+5mVL/XVVbQDwfXa9E8rnTR69exsIPf1m
	 RQZDozwbiiEYxKS5kMoIz2tE/GA2sTaMKRemslhs46Q/EiwAPKSc+pIgnbNvxGsbkPegh
	 YKfwZncghjvAuRD/GLTl2Ks266PctH1v98iK5OdMcoC6zBwHggpCIneDQ/uCLGMnneiDa
	 opci4XCqDhKfYI1HA1jDr8O0TT0DxwdN7fL6IoO3hvga6dRHc6GFhIZ3rQxOK8dc861mv
	 oDYNMx0rYL97vQtz1774sfuwlQOFfIo3V6M8m0GT+koa0VPTQRsmAzYodA2gMDmJhoQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794585904;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=+UifFPON+SyGnU8x0yf9mTT7ZmSVe1u+d9xf4h1Cr9Q=;
	b=CjSwEVumcpRvFJcQIAzBTv51vlEcrH9X/Rjk43YyUK2T+MdNEHMU6wRgjrvP22XJo4OO
	 AQe+lDB3A11/LOQ/LM2FOwLcZ3M+JVBqx0225Yfx2MmQBUoBelE6sYtCf/sD5mfBc9CNN
	 np2KBG3EZTPzkKkcoYPlVSxpf4OrB1eqRcw+IrVhQAK7lZbN8Wqa1Sl2liwPwNYM0Mzog
	 3tssXkKINRAjWIBhF2Z3ciMyXoKGknO3/UBpa2n2edrgTLQv0xgh7F//u4w8xWojd5Ywx
	 KSik0UttRBwxcLeSsw1AhTdCps5Uf2NhcD6NfROYfrmJxCpc2ctceqj/OyN21VAsq7A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=fairphone.com;
	spf=pass smtp.mailfrom=fairphone.com;
	dkim=pass header.d=fairphone.com header.i=@fairphone.com header.a=rsa-sha256 header.s=fair header.b=SnY1vHvE;
	arc=none smtp.remote-ip=74.125.228.75
Received: from mail-ed2-f11.google.com (mail-ed2-f11.google.com [74.125.228.75])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22B116070943
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 16:05:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 22B116070943
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.a=rsa-sha256 header.s=fair header.b=SnY1vHvE
Received: by mail-ed2-f11.google.com with SMTP id 4fb4d7f45d1cf-6b580057f06so494571a12.1
        for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 08:05:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1794585901; x=1795190701; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+UifFPON+SyGnU8x0yf9mTT7ZmSVe1u+d9xf4h1Cr9Q=;
        b=SnY1vHvEfcW6Q4y8RsJAwDs/Y8ufORxk6twFczLisoiULOb0AZE24YPQgyboSKWPu7
         L8pEa+uH195Syj4b9pp4nt1crwVpBWQZSv3SiwZO/Fzf4BvoBnXolA72LASPCc0qy3X1
         onAMlxw42dat9fKRXcF233oKAjIsJVwwerjBZhQ7arj8yNzORIXgy4omOP6nUCBJsrKF
         vj0xEq6b3zXoqKuKPtgYoUXbhKNAj2u58whda6+AFCZ0zIT4JdcAMq8nMRyMa16JAVGR
         sLhZuEietmaTstOwStfsJJ+JeV/FdXGXoHcpaaHO3iRu91vcIk7BEZ8RVdX7kUNQB5wL
         Xk6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794585901; x=1795190701;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+UifFPON+SyGnU8x0yf9mTT7ZmSVe1u+d9xf4h1Cr9Q=;
        b=wdbTjIJHCIX3fHEEBLCafwIy1C9aNntEFf/tAVor/lU0hE9wtdy3bINLWvbQfRswlM
         wOk3Qazm8E/VI5PPudmxa4F8jJRTa0y1hJCOB9/w+SJFV2WtNmR7yW2ZmDOLMov7h7dv
         0YTT4eFwNqMVzFJ8D2Kdw+Zqc53G8dsnMPrSDel2kwQ2fnt+GmmqHsqBeH2GgEEdBGUX
         CbXwnIx/XgShtGL2b0hzWdyElnavZgxvjjgv7mdtmmErZRj86cUSy/OGc/4AzZt10PRS
         JSv89NUURRMrH1ONTQYOLnvV+CEV3gDk52UUbQAZLkQH+EQv9SPjueMFzrXrpDDZ5h+C
         EX7w==
X-Forwarded-Encrypted: i=1; AL+hErFXkOcOGmXji6QfnW2GMaJMtxF6YF9kX8TnbcnEq00nUHN211vYApklvAcNpcfkbBbIKCaVPrCwCwMG@vger.kernel.org
X-Gm-Message-State: APuU4Z92y8T9NMcHgz7PUqSKLuu843MbUA4KeE/sOmUHXeizLey/UP24
	nckonKAB6sGi/yFu4YJ1JvaVL1qoZPT0CvrKdVh8wOVWaRCbdlbyH3Q6qYOU4mNYymo=
X-Gm-Gg: AYBFou2Lp12fV+uiEyEDg6b319DocpWFFMmM2nP7GPYSROkc0QxQkONGY3dEJoz8IK2
	mmahJcCCWBTajvUwnF9qKf9sUZTU1Py9pPs9rxpI2CDInRSicMAI6LxKJI7ZGlwqnu/zv88XBSV
	0loNyyn/NvIMYWW2yl4HCQ+keTF4DNjj5gG8NWBFlxZKahhGe99D32bGvHalK0+LFHtu3Vs7boS
	y/SpjBI+U0TgZaig9pG+Boq5ZAgx5zN70PEleXJ70cGAMbD9g98l+v2UeN5Wz71YcgwTce/I8BE
	mPH8HPoqEmcTVGE3mW4mvzWB2o7IJ9fedYhqewA8P2IEDlxHjPH+HShlN0Oye1SPhZ5fERyX6I8
	GR0SCnLPBuyZBaNz2ckT2/Xh102KiviC04rjn+sg8YOX7DwK4bNKIlKVQZo3/GwrPgVHcuiIk/U
	U71A8fJr8bZNGMc9LXndtzKx7zFptCIcMFADY9jcGFx0kw7VfUrnAkYYcgoZpJq3yVYryNS1oHZ
	d0DhFLO0mySY32UmK7YKvBGg7/Jqr/8uSNhls6AAIDe30GqDGDc88u7aPlrSo4oixH+I0re9jPl
	ur5dLGa7n7jwVwnGjRZ4FGcHyoutNoR11aiBHeoKl91vVGZyac6/V+KpwTuLFOkjQxdvMdNB73b
	BrcR9OeI=
X-Received: by 2002:a05:6402:2348:b0:6b7:b626:3047 with SMTP id 4fb4d7f45d1cf-6b7c0c6d5bemr2614461a12.22.1794585901476;
        Fri, 13 Nov 2026 08:05:01 -0800 (PST)
Received: from [172.16.240.104] (144-178-202-142.static.ef-service.nl. [144.178.202.142])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b7c264d99csm1123946a12.36.2026.11.13.08.05.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 08:05:01 -0800 (PST)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 13 Nov 2026 16:56:44 +0100
Subject: [PATCH v3 3/5] thermal/drivers/generic-adc: Allow probe without TZ
 registration
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
Message-Id: <20261113-bat-temp-adc-v3-3-743979a8fd90@fairphone.com>
References: <20261113-bat-temp-adc-v3-0-743979a8fd90@fairphone.com>
In-Reply-To: <20261113-bat-temp-adc-v3-0-743979a8fd90@fairphone.com>
To: Jonathan Cameron <jic23@kernel.org>, 
 David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
 Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Laxman Dewangan <ldewangan@nvidia.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Hans de Goede <hansg@kernel.org>, 
 Jens Reidel <adrian@mainlining.org>, 
 Casey Connolly <casey.connolly@linaro.org>, Val Packett <val@packett.cool>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-iio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
 devicetree@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794585895; l=1961;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=dKIR7SEd80N/+qwSyOrsBe2GJeTCbwmGB4u3yhxKz60=;
 b=W6M5dRaAMjUDhpYShHtsozwZdwnqCFAQirhB1YkYhJl2/l4HagKS8AChyehoYTB4jc4qoyEPI
 U4dOEZleS6PDzlU3Zg6O6xRR8Td/f3BeutmmgBZtMcd5Dsg3cJCzvp3
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

If the devicetree node is not referenced in a zone under /thermal-zones,
devm_thermal_of_zone_register() will fail with -ENODEV.

Since the driver is now also registering as an IIO device[0], allow the
probe to continue without the thermal zone.

We also can't use gadc_thermal_get_temp() anymore because we haven't
necessarily initialized tz_dev.

Link: https://git.kernel.org/torvalds/c/3762f5851ac5 [0]
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 drivers/thermal/thermal-generic-adc.c | 20 +++++++++++---------
 1 file changed, 11 insertions(+), 9 deletions(-)

diff --git a/drivers/thermal/thermal-generic-adc.c b/drivers/thermal/thermal-generic-adc.c
index c6a7a65aa6a6..40a34e97a515 100644
--- a/drivers/thermal/thermal-generic-adc.c
+++ b/drivers/thermal/thermal-generic-adc.c
@@ -86,14 +86,16 @@ static int gadc_thermal_read_raw(struct iio_dev *indio_dev,
 				 int *val, int *val2, long mask)
 {
 	struct gadc_thermal_info *gtinfo = iio_priv(indio_dev);
+	int iio_val;
 	int ret;
 
 	switch (mask) {
 	case IIO_CHAN_INFO_PROCESSED:
-		ret = gadc_thermal_get_temp(gtinfo->tz_dev, val);
-		if (ret)
+		ret = iio_read_channel_processed(gtinfo->channel, &iio_val);
+		if (ret < 0)
 			return ret;
 
+		*val = gadc_thermal_adc_to_temp(gtinfo, iio_val);
 		return IIO_VAL_INT;
 
 	default:
@@ -195,14 +197,14 @@ static int gadc_thermal_probe(struct platform_device *pdev)
 						    &gadc_thermal_ops);
 	if (IS_ERR(gti->tz_dev)) {
 		ret = PTR_ERR(gti->tz_dev);
-		if (ret != -EPROBE_DEFER)
-			dev_err(dev,
-				"Thermal zone sensor register failed: %d\n",
-				ret);
-		return ret;
-	}
+		if (ret != -ENODEV)
+			return ret;
 
-	devm_thermal_add_hwmon_sysfs(dev, gti->tz_dev);
+		dev_info(dev, "Thermal zone sensor register failed: %d\n",
+			 ret);
+	} else {
+		devm_thermal_add_hwmon_sysfs(dev, gti->tz_dev);
+	}
 
 	return gadc_iio_register(&pdev->dev, gti);
 }

-- 
2.56.1

