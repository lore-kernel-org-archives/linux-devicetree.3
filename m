Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9E963AE18C
	for <devicetree@vger.kernel.org>; Tue,  4 Aug 2026 17:05:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785863165; cv=none; b=cbUaF5ENdoxHrQZA8n2UF1z/bMn5PdgcuAlamiLoG0i5GXfauhnYF67iewT65xWonhOdlVf1NiQHDs7Hac5tBDp5n44CQrYpamT/iOdDlakE7gYjwBCKZpmrlZpwNUUF9tvLEMYXZa/YGmupZSCndtcvGNGsDKMH4+vNzQmPgRc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785863165; c=relaxed/simple;
	bh=BP5isHWJVSgsQc7eHb27miIKkXny1ILGVxUFS9gjsgw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZRURbMTLJhMNfUQY4pMkcSZrQ15W/OWqn1AgGnQEt8tUL2VE5Ec2MnXUAL93+cutBiJsn0rlt0RZxtsYzfT6smFKMEhOpQw/EsVK+Yc7E0NEY770ohbL/ziqVONHJhPDChgslttumQ/4LODS5lN4phPgDeZG4lGISyLJFxZiKSs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h5E/1iZF; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h5E/1iZF"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-38cfcb507a3so10073a91.0
        for <devicetree@vger.kernel.org>; Tue, 04 Aug 2026 10:05:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785863149; x=1786467949; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VjB+Pa1McUr4XyZZTJgTh82TNmXCDaoM/UdBX+H7SC8=;
        b=h5E/1iZF9Tmx3U8tEzCB1W5zRqZHVkBs6YsyqX9jlRoPI4Vsq4OO6bAtA7D/4V3puS
         9n6WidwKBLsKG8K87/us1CZBIgqiLxApVjHzHXqWy8PRJxu1rcVf9VvgSbdQI7pCEDBo
         RlTA9YqAUya8mLjkV92IvVOSYy/goOTn8D+b6iuxiNhtj4xvxd1nQ/fsKWebrmr3/H4B
         TGEwPmO0uGFd20V34TyvHLz0YE7NIH7kgG7FfyrfZyAYuQPLFbN67Q2LDqTceP3z/DSd
         T8zdtk+8KvlWK1bcV/ppnGFyZMopIo/D1QxKg4bCWSt+Mxw/50hGAIIOMLzKvGLbdbNR
         jWvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785863149; x=1786467949;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VjB+Pa1McUr4XyZZTJgTh82TNmXCDaoM/UdBX+H7SC8=;
        b=ZEe0loC161z6mbBIPbiv9w/QYTSt/HcxolYFuJwcSeY1Svv6zMTUyb2+pBDu5K6x/o
         TII7GSjLYQXfR43NITGFbPnsw1LPVJDdairbPDHPzUJVhVTbqLnTT8w9ruzW+9NU8EzZ
         ETFa4GqcHuFfg16Rk3SkfYEIK5ldAK4rNrmXVw2FHmP5rqPXZFlLCmZBrnwXW1BzPN3I
         0qBQHf2qnk+Wf48h5QHHC/fhBskmlNVTR389jZRYyYOasLVeADQbDLqVtL8oWtszf/3y
         5jTghTDSfIbCrfuKEDYucrKLjsmy2o7IAHthTz05IXb2k6JC90gIWnofaZDJTwbU+uly
         JWOA==
X-Forwarded-Encrypted: i=1; AHgh+Rq/Y2IHBz2GIRFR0+Y3n/hCDtnNTf6PZA26uxRPTuUfRNrQCJswrqXLnNDvcZoitlyL4s/Si2Hwr1e1@vger.kernel.org
X-Gm-Message-State: AOJu0YxpiLP86z9mVdO8ZYycS/FiOsLtXbQQq2Qz4qx8JTHnSAtE+YAZ
	N5GjBSoHMePRuAmib8RACHLrj+5knlZ54co8Xna2TQi4IU9NY1/bqY8X
X-Gm-Gg: AR+sD12ljO9maAWAhii2g6OX2C49dy659dDKz2YgZt8WA//SlOalXK/jCHSWV4Q6y3W
	UKI7g5e6OegESlsFn8fvFrm2Ac4yRYC3A5iQTj+3j5Hz8LOdILpabu08sLDcAC4N8vpaiEltOt2
	BWTwBR/i5wAEZSCBPgjWOg/XmiFX7yfMipAidiSU68PaKzMCMTUj+cEuYce7rJa1FqrAr+pm2Uq
	qU3l4ptOmcr8QCb9rMemQnujvIHJoQHFT+fdT4qCyqqtuh/jWqtqT3iu2gqjnQn42fO2F1X3bvs
	71MFG6k/mgIEr1N1LOMC9C1TRrecAvYH9Fa6xeb4SMP+TsmlwcmpUWQ50DcBwR8cdygxI+1zu9r
	v3BZ4F41lmM2urIr69WuhwsjV1GSmy01IW9XDrsqhxm9faleaG4z6E+4plniN+8tNULP7Rrn3JR
	z0O0/qnhszVJzNnd5joL5hckfAIShteWB0X6zYXxe78S9swBra3ZUOCuMbSD3zgp9d802CX9I=
X-Received: by 2002:a17:90b:264b:b0:381:bcfb:e710 with SMTP id 98e67ed59e1d1-3903c64c81cmr451371a91.3.1785863149041;
        Tue, 04 Aug 2026 10:05:49 -0700 (PDT)
Received: from [10.15.72.252] ([2409:40c2:5423:e712:2aaf:ae79:67c5:476d])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13fca52d329sm5147124c88.4.2026.08.04.10.05.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 10:05:48 -0700 (PDT)
From: Bhargav Joshi <j.bhargav.u@gmail.com>
Date: Tue, 04 Aug 2026 22:35:05 +0530
Subject: [PATCH v3 1/4] ARM: dts: ti: am57xx-idk-common: Remove unused
 ext-clk-src property
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260804-ti-omap-rtc-v3-1-ba3bbd8af570@gmail.com>
References: <20260804-ti-omap-rtc-v3-0-ba3bbd8af570@gmail.com>
In-Reply-To: <20260804-ti-omap-rtc-v3-0-ba3bbd8af570@gmail.com>
To: Aaro Koskinen <aaro.koskinen@iki.fi>, 
 Andreas Kemnade <andreas@kemnade.info>, Kevin Hilman <khilman@baylibre.com>, 
 Roger Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Keerthy <j-keerthy@ti.com>, Afzal Mohammed <afzal@ti.com>
Cc: linux-omap@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org, 
 goledhruva@gmail.com, m-chawdhry@ti.com, daniel.baluta@gmail.com, 
 simona.toaca@nxp.com, j.bhargav.u@gmail.com
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785863118; l=818;
 i=j.bhargav.u@gmail.com; h=from:subject:message-id;
 bh=BP5isHWJVSgsQc7eHb27miIKkXny1ILGVxUFS9gjsgw=;
 b=AglLCpt0Ow4mCeWLX0NY9rtIDhK/08WmnqunooL/nv6BacQqxByO9/HQvU1mtVT1ZJN8n7QoA
 FKb0J8AydZ9DB4o0MwIVRocvKlO/ncX/sFRjei1eYxdCCcuUFKTEKfM
X-Developer-Key: i=j.bhargav.u@gmail.com; a=ed25519;
 pk=IqNDwUZKECEA+n8wXctFLBbYL9NhFstZNbOznm/nX1k=

The 'ext-clk-src' property is a legacy, undocumented boolean property
that is entirely unhandled by the rtc-omap driver. The driver instead
determines the clock source natively by checking the presence of the
"ext-clk" clock via devm_clk_get().

Remove this unnecessary property.

Signed-off-by: Bhargav Joshi <j.bhargav.u@gmail.com>
---
 arch/arm/boot/dts/ti/omap/am57xx-idk-common.dtsi | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm/boot/dts/ti/omap/am57xx-idk-common.dtsi b/arch/arm/boot/dts/ti/omap/am57xx-idk-common.dtsi
index 43e3623f079c..ef4bd554e92b 100644
--- a/arch/arm/boot/dts/ti/omap/am57xx-idk-common.dtsi
+++ b/arch/arm/boot/dts/ti/omap/am57xx-idk-common.dtsi
@@ -445,7 +445,6 @@ &uart3 {
 
 &rtc {
 	status = "okay";
-	ext-clk-src;
 };
 
 &mac_sw {

-- 
2.55.0

