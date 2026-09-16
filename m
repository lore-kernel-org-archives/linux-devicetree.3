Received: from mail-pz2-f42.google.com (mail-pz2-f42.google.com [74.125.228.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12094456292
	for <devicetree@vger.kernel.org>; Wed, 16 Sep 2026 07:59:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789545552; cv=none; b=o6PDB3Mk5HVJizJfsfgaMaU2Dv9dFo/wcveGJofQlnMQ+AmtLB32X0Lq3gEEZKHyEvrpRO4te8p8exBQUFqu+c/yIpbDMswUvRffBaSQkNrRLqGVWhaziaGQqjMy+rTbzX/SlX4zNV79B2jsG+SDkFoSuc0UfUCGtC4mLIuaMec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789545552; c=relaxed/simple;
	bh=SHgJWoiUkxW7Auz32fIVCxJL51q1VUFL5lzA1MkMflA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YxYBWApH/sKH1N+8b9+887NN4+/vXz8I8F0AVzglKBxLlQ/z7teXFkO3pWViNgsw+UbH8c0Ytx6arY8ZUHswDRQKOVst/3cOK1foGuiHP7MA2+DcwflgPWYXr/QiSd+TGvwn9rfhLGXep195Bs6HRle76ld1fqSFE1e3iv3I+Es=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=bTpPwfgt; arc=none smtp.client-ip=74.125.228.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="bTpPwfgt"
Received: by mail-pz2-f42.google.com with SMTP id 41be03b00d2f7-cc1cea4c79fso330884a12.0
        for <devicetree@vger.kernel.org>; Wed, 16 Sep 2026 00:59:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1789545545; x=1790150345; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JKZMmlDJFNSMtO9huPhOVTb/TTA3LxjwLBEnHIboH44=;
        b=bTpPwfgt2dg6mAR22GIGoVXoXt5LVnIna9UME4o87hnvazveaRCXjchh3OySTCMIZo
         8Me+CeP2zrfN60uDgL0ffEtx3e/YGqozMJK5dE/lp8b5IdHuBLYJ1JzEbpmvUMCpiEYR
         PgD1ToM0uCq3nFBiay7EB5kBKI5ygM4mXxamk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789545545; x=1790150345;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JKZMmlDJFNSMtO9huPhOVTb/TTA3LxjwLBEnHIboH44=;
        b=RMHVKEa1voWewryUuorn6npgP9tTjYlh27emq0xTpKqTYtuTGB1HAeCxoPIcfcRUBK
         XW8LI45zYVHi49yYLP2zs9ThCdvrKkosCDG7pllAbDO9/hkrum/YkLx3KrfW9b8gIvo9
         RLnlvvbqUdRNId3qqOTyKXS7B0IPJRe4gam2C2uha3F7I7ra4fNp80s3JnSXi9kINLdf
         yWezh9NUDG8A1EZhFltXqSC6NYLWBu2/IUVFv9CrFhUzQzZZ4UtQnhmIL52jwwE/TBwy
         FykqCjc0OIAsTMC0IB+0lplc0PQAziXRinTJM5V4ua8UZ8d0D2AKtGFvOo5vTsnn8Arp
         GVaA==
X-Forwarded-Encrypted: i=1; AKwUvBzEWIT5XgMnKeJ677mToTa+POmZoBBxTeD20alk+pjGBg6iGPrY3nYdljl+jVqA4tl5Oj4iwFRsQa7s@vger.kernel.org
X-Gm-Message-State: AFuF++lOTFptPgNiN908zU4UBrshPEHw++pw6KUP7lbRBzIuFF/88Dhd
	Q3cwPspM4EHRMY605e2VIzKUreJQlGZadhcbBcCnFzuDG9QorzWDhydcvgG9b4vgj1550v7YT21
	S+ME=
X-Gm-Gg: AYBFou3uEfuzW+HxXb5OVmUfOMkwB8HVa/j7KkLpR2FM8nledc54d/8js2l9fQoLp+U
	lKkCxlhnYTNgZd7SnYKfGDiyYBzmibgg3bXTvlRKl/IMmjSOpK6wf4Kj3xJZ6xj/BgakqA8u7PP
	+iCwhERMP0M50vzsT3qO2eHH01ZkzFBgsuahF6aI/1c3/zsBtuDEz+/SgG4J+vgLk6Q4yKMp0Oi
	8mEAhsGDu0JOKZcHHplg4LaUqntvFn7gsCK3QIgPQwOHr3ULkdiz4DW4Av0qASGXWqilhSjAzXd
	IDIWiKFpI2nUkPa09HzawKQ2eWMZ83383JF9ZzXo+Svmz1jdxcFA+rFcOCliO/ZBUMQ0q6tOGTB
	n2YbKn6G5JWBgx+BqTv0pG6bJcSHJ/Q8JeOtFcTqlJ+i8MM+C0GLOSHAoo+itmJMMPZOGs+Fxg2
	S4r6s5m9EKyNOPYqcbtToMIGJE6cjtNUrOIbjjmLG0olkqYmaDnLXSi/go87kw8cOoTJvkUsI5X
	MoH2/HMENCxThqtFL0lNz7w3ez9+PH7PmzcswgyxBlDw+zf4rA/j99mhg==
X-Received: by 2002:a17:90b:440c:b0:39d:fea0:c17 with SMTP id 98e67ed59e1d1-39e1e309c21mr3793724a91.8.1789545544841;
        Wed, 16 Sep 2026 00:59:04 -0700 (PDT)
Received: from wenst-7875.tpe.corp.google.com ([2a00:79e0:203d:7:1f62:7622:5d61:2578])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e1b7acba2sm4348197a91.16.2026.09.16.00.58.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 00:59:04 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Bartosz Golaszewski <brgl@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Daniel Scally <djrscally@gmail.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-acpi@vger.kernel.org,
	driver-core@lists.linux.dev,
	linux-pm@vger.kernel.org,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Manivannan Sadhasivam <mani@kernel.org>,
	Alan Stern <stern@rowland.harvard.edu>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH v9 08/15] usb: hub: Use usb_hub_set_port_power() to control port power everywhere
Date: Wed, 16 Sep 2026 15:57:34 +0800
Message-ID: <20260916075745.3549953-9-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.1032.g73a4cd73de-goog
In-Reply-To: <20260916075745.3549953-1-wenst@chromium.org>
References: <20260916075745.3549953-1-wenst@chromium.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There are still some instances in the USB hub driver where port power is
directly controlled by toggling the USB_PORT_FEAT_POWER feature flag.

Switch these instances over to usb_hub_set_port_power() so that only one
unified function to do this exists. This makes adding external power
control with the power sequencing API easier and consistently applied.

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Changes since v2:
- New patch
---
 drivers/usb/core/hub.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/usb/core/hub.c b/drivers/usb/core/hub.c
index 1a98ccfe2664..f309ceea1969 100644
--- a/drivers/usb/core/hub.c
+++ b/drivers/usb/core/hub.c
@@ -979,11 +979,8 @@ static void hub_power_on(struct usb_hub *hub, bool do_delay)
 		dev_dbg(hub->intfdev, "trying to enable port power on "
 				"non-switchable hub\n");
 	for (port1 = 1; port1 <= hub->hdev->maxchild; port1++)
-		if (test_bit(port1, hub->power_bits))
-			set_port_feature(hub->hdev, port1, USB_PORT_FEAT_POWER);
-		else
-			usb_clear_port_feature(hub->hdev, port1,
-						USB_PORT_FEAT_POWER);
+		usb_hub_set_port_power(hub->hdev, hub, port1,
+				       test_bit(port1, hub->power_bits));
 	if (do_delay)
 		msleep(hub_power_on_good_delay(hub));
 }
@@ -5461,7 +5458,7 @@ static void hub_port_connect(struct usb_hub *hub, int port1, u16 portstatus,
 		if (hub_is_port_power_switchable(hub)
 				&& !usb_port_is_power_on(port_dev, portstatus)
 				&& !port_dev->port_owner)
-			set_port_feature(hdev, port1, USB_PORT_FEAT_POWER);
+			usb_hub_set_port_power(hdev, hub, port1, true);
 
 		if (portstatus & USB_PORT_STAT_ENABLE)
 			goto done;
-- 
2.55.0.1032.g73a4cd73de-goog

