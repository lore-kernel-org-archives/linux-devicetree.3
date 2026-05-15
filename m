Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AD4742EECC
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 09:02:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778835743; cv=none; b=nRMMGRjcVPmRGbss98BmK/Ztm2+Ur072uksWZj8iHlUpGNGz69Wi4FUnsYpuYXeje3ePLYD6VYhGQ4wLtVCXSaixGQ7z7+eqroJOF9YzApt1BqH00ZE78chbEJUXG5gaCSgZQr96pqVzO5YV43dpCjgpVESMggjQW4ZplR9AmTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778835743; c=relaxed/simple;
	bh=bOSDifb0+bqORKH2w/7EPITVe40diI8h5lS71n8Mt58=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=V8gVUPvY8+YxBitN5ePYbzPuu59Ma4gbQSwXVEDCd04cmlV/mLpY5weJ34v/ls8RpEq2+Zxlcw9Up9O2P72PRbhs6fKoJagmDQw2HaMz8+EWWM2VR+RL0U9C6GfSgpxsTDF03vXREln/u273iSlNkIWaWBRsh0ZX8oXH38b33uA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=JCj3R3Wf; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="JCj3R3Wf"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-3680540a6efso4099835a91.2
        for <devicetree@vger.kernel.org>; Fri, 15 May 2026 02:02:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1778835741; x=1779440541; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CWN7gkxjFiGZ3cV0OWHAWJ+8N9Pyp+YRIV9vOKGoCOQ=;
        b=JCj3R3WftoStic+DwMeCi+7mnyb0HhFcBZBXMAAfPT8pcXH2l8L+N8MkzUL3dAtdOD
         dxnkd8kwHxLw5PJkQjPiN34ytGyYS5XK8H08Y+ZZMPJadfGPi/d6HgCu6y1pTgWFcJR3
         jaNMIkNq26XYAcikYNj0CqhML+KgXMF6VweKI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778835741; x=1779440541;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CWN7gkxjFiGZ3cV0OWHAWJ+8N9Pyp+YRIV9vOKGoCOQ=;
        b=M8Hutf69PIEo9maRPvGe6sx19qsSOOO4SWqxaL1K0+RqZx/V2nx0o+km24FlfqH7D1
         t6+VuEVlG7E2ybsGXoEhTUnD/fqgZVgw06pDewwi0zAf/yC5dIRAx0xLZNmg+aqLL4Aw
         zGkqD6byxrPYctFxHQyKxSMv+xP9xwx87BgpBozR/KGMOm5vVz86JwOgLVZvAPnMT7Oc
         xDIWwM9hCxnqNl58UwGU1t0XuundNHsDzGXL2aMNBvNaMzX2TULZPrKh5Uvf/1CHas09
         shUwoRxkXfptXGynZ4p84mfxxKNqqMlGGOPX7XXniN1Zb505H/iZY2lHrah107iPSUGI
         dKGg==
X-Forwarded-Encrypted: i=1; AFNElJ93SciHEZfwIcvcqcqqvazQ8usSF83khWLMXtKsZShxHbHcEfAV9+6z8tndKLL0y7ndbBqSpJpxmbzV@vger.kernel.org
X-Gm-Message-State: AOJu0YyDGmTh2Cmp5ZKdS96PsSf47TA4FWVU3swnbvyvyJIaehmsN6xv
	MRdpkPZQ72i9rk3R5KhALvsaJTxF8bSZgIf5RYywgD7zuUyQ1OXilUxelMpYolLXQw==
X-Gm-Gg: Acq92OFHcBQrC0Zf48NiHlKDZub3kA0+081LeR5MymqixYjMonXqmy98Pa9duxtpZat
	ZqkyUydYA+dKcVGiHus8Yc4vtPi91Sg/bZM8G9z7iDIV/kBwSl+xMlccX7vRklza9il4l57i7vY
	suuQu4hx45I22nraqNN6t+brxvptU1gB5nzdzAUTxvxgTCtfj6di31qq+zTKbuLmoHU6B26FBkY
	qshbwdaqFTJP3D9sM5mwBB17N3ilhZd6bdObqWLflSVgoftpIeYyIqA/N8ALK62vLXQfAHqkzsy
	Tus+trhb2gIWOdAuORSrjr5Awb4T9fi+94AsAuyk31DJyKg0jCVfs8/k34x8s5n91Zoqz1EzIi1
	zL/Yjg6rgzDS8LKiOxi9MIjUTMCaq8sIAHLozAfhkMf9BR7v5VWRc9UviA2LCzdS1PRt+Du2d50
	cMLauR2WiUOky0j0H/m6Xr/AbeJDr9J6WQ+FgRNE3jccyb7IQb7TuSAsWt+v0LTw+xSaNV6vdGg
	aEAHgUz/77yTtCuZDs=
X-Received: by 2002:a17:90b:5203:b0:35f:b288:8e4c with SMTP id 98e67ed59e1d1-36951a6722fmr2708708a91.15.1778835741437;
        Fri, 15 May 2026 02:02:21 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:b3d8:e32e:c2fc:c31e])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36951584654sm2076537a91.7.2026.05.15.02.02.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 02:02:21 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Bartosz Golaszewski <brgl@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-pm@vger.kernel.org,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Manivannan Sadhasivam <mani@kernel.org>
Subject: [PATCH RFC 04/12] usb: hub: Return actual error from hub_configure() in hub_probe()
Date: Fri, 15 May 2026 17:01:40 +0800
Message-ID: <20260515090149.3169406-5-wenst@chromium.org>
X-Mailer: git-send-email 2.54.0.563.g4f69b47b94-goog
In-Reply-To: <20260515090149.3169406-1-wenst@chromium.org>
References: <20260515090149.3169406-1-wenst@chromium.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The addition of power sequencing descriptor handling in the USB hub code
requires dealing with deferred probing from pwrseq_get(). The power
sequencing provider may not yet be available when the USB hub probes.

Return the actual error code from hub_configure() when it fails, so that
the driver core can notice the deferred probe request.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 drivers/usb/core/hub.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/core/hub.c b/drivers/usb/core/hub.c
index 24960ba9caa9..90ea597d42ae 100644
--- a/drivers/usb/core/hub.c
+++ b/drivers/usb/core/hub.c
@@ -1998,14 +1998,15 @@ static int hub_probe(struct usb_interface *intf, const struct usb_device_id *id)
 		usb_set_interface(hdev, 0, 0);
 	}
 
-	if (hub_configure(hub, &desc->endpoint[0].desc) >= 0) {
+	ret = hub_configure(hub, &desc->endpoint[0].desc);
+	if (ret >= 0) {
 		onboard_dev_create_pdevs(hdev, &hub->onboard_devs);
 
 		return 0;
 	}
 
 	hub_disconnect(intf);
-	return -ENODEV;
+	return ret;
 }
 
 static int
-- 
2.54.0.563.g4f69b47b94-goog

