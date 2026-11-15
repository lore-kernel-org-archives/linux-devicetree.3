Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794755144;
	b=vdghqAWAHChr/HQJlJ8XXRE75txb+LXHf/8rOECAHtKNFJfavSvZ4Zr4F1iVZXhN1T1+
	 +OZvSMDzsH63wLVmrqrKOu8kKOm7wTkkUQkobtJMAcecP2NXQ/OAJGg8wxk+p7Ql2zDQl
	 BucbVO2jWBWDXIMZvPC67JAeSz8VooBl5fXF0KSHhiOqUycceXby9g4Cqj5mleVTYUHlK
	 N1zcTw43rd0Eh3gjMd2qhrlEehx8XoSa1KVU0+PxghCyjmR9c3Fzb20JrhjCbNUzdz7Yn
	 WIQpwDIj5B67Ou5TV/8tcf2Ct1o3nfiTSfgWKfIi9/KskXPZ1fj1xobX/7qZnphNKaw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794755144;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=LNKJPtzHb1J7PqtXpGxzA28qSovY5i1QlYlXq6WtWl8=;
	b=Dtbz4pNmJyOxK1LqWrhEThGVVVQ7HRC38FEZU2shDWghjxfymG+ezfnhccbRh8B0FOZn
	 CREOtZJWqNmfZPjFj+8BViXibvTwBYbep0ZG0AQ5exFB53Xa+J78EadyfoShiMiGXaDqF
	 rIn1/is6ahTMrkaA98za1Ba0xwGzCuFVC+5saxwtwaRzpQVkzD8h85s3cVVIzDt/XC65L
	 TT9DjFrrYA4vW/KP5Dg84ISdjh0QE0NI9SeQlaUN3ZncKE3lZzaO2Eo0gLhMsPvY7q/2C
	 FdVgCPy/bMelMZY2Ppei8z1lFv1K/edSC90MN/+a/uQEwDMNA6qQPIgioFyUGuoE9ew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fca1iXU1;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B078606A323
	for <devicetree@vger.kernel.org>; Sun, 15 Nov 2026 15:05:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3B078606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fca1iXU1
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4bb6adaf0f1so2883695e9.0
        for <devicetree@vger.kernel.org>; Sun, 15 Nov 2026 07:05:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794755142; x=1795359942; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=LNKJPtzHb1J7PqtXpGxzA28qSovY5i1QlYlXq6WtWl8=;
        b=fca1iXU1Z15peVjSm+PNEsPgkQf2AEotII2E+OLuHx4uwukngxu6ypGXIW9zTyKHAn
         /XFKOxq90k0saJagNt/ypJTyVeLaXZ5+9OHqgmnIevW5sKS2GaYvI8k49gDIYxtqau71
         hdB8Tyu2SaTGVvStSFxP9cPRoF1eNnBxmvelpeNf1D9wSx6HV4XOSuqGSOqSDZnm0XFK
         7/+Kkczsf8RPXVUDDEU1eLTedkk0eHubWhjEviZ8G3wVbke4LXfcgAx2Ps8ZaSACbhRX
         o14V1Ee0i3g6YNlYDjQgctQWh00nVh/69pImTODhlcZk5JxVI06+NTPihq9+kOauQTzb
         4dHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794755142; x=1795359942;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LNKJPtzHb1J7PqtXpGxzA28qSovY5i1QlYlXq6WtWl8=;
        b=HBphouL3M3XNVhJB3sZwDzKFHKattuZC573a+BimcYbcbV0GsIObaDASFQvmknFg2i
         qqywXcHnUgUqgebiS/5t5MWKsh4wmbj4EP/+SCSbjLt4j43oHiyXxsfA5jZTNT+JGjMq
         5LX7mqRJwqo/CofYWFPKAHObwkywURuVVRgRWDKXIgpuPyRCuaVux68Wl5/zBn/iTKJk
         Xd18B4Qa0Mds/k0gO4d9gg5A7trIsMddTeWW/j+nhEEn0IJfbIIH/R/YkSQHHFgNAOpu
         y+ikJtV7mC5Tj3uT5n+s5fy5jtADvmpFCmsUZm7zb7vlONIIcsaBsLIaxuZi13ihr/lc
         2htA==
X-Gm-Message-State: APuU4Z9UHac1atGruWPLUCw3BU0mp9Lb5/GIqLsPptGq9AmkUCc5rQ6D
	VpNaTQQkmHie1idMO5dM0PzpBjoAvTUHHS3eS8npDKUSykr8t+bSuFET
X-Gm-Gg: AYBFou2jjMj9Em3htAWu765bQtMrumWqEe2l8qPGkgFrNTEYh4Dgi3HgIe+k2B89PyE
	Jp29qCTIbdNR5uOEZYcPR+AztVT46VtcqiSpso7oX1sn8qMWjJZPSbHoyARaOO4A83LkIFmfxgg
	Ow6EgbE7Rfa2eASQpZSe2o+wtysbAoWsfMlrclFqxqxd51sEP35H4v+qgM7/BKuxbEYDyY+kl9Y
	GAlmQlyUfMHR6gxInwlrQM+WI5CxquNAGXM7cfefygpwIVnlvG8vAtOSpG6rGCN6MVf69l5N4og
	r0m37GTwpXeEepcymTQrPHKfchiq/A2JsY2+0DpjSezdoNuxHhakMwuMdmz7rATqqaoyxfqPlDe
	keBa1+0FqpqpIuWSfk5l8JaAJ//ucbYy/5DOeaCT+AzyBSxVYd5pGA7IBfhVSoylU4MdZi6B51V
	7ISC4jYDWGqLbDk8NXbGznGC4+vCUNe8hYPdPef4NszcyF+hjxISFAuxEUKqX8NNnIgTDzNw+pz
	rrRnIVfYRAFRH3xo6EHV7urqZb4sLv+QeotEQD+Whir10kZTGPZoCpwVmv0Boj1MxAgb7p2hJd1
	+1XSRGzmIh5nM44OfU4zMkGTyqem7161gfTidy7dV/9YJ5zNTl/HUaKKdMVOlJxFmqqbG9RolUD
	kvzMvB+5UAm6oDU7aIObCXYuDszkeNQQCTHfumERDJrAdp9wdCM38yruMcO5v9ybFtBpy7nYPA5
	BM6SviHoasnb71C0AKZSJmnF1KjQAMeZCya9b3FbNrT2bjoSoFInxg8hxoKuLB9+T04wuSo4AOf
	PntrMFNPOsuIg0=
X-Received: by 2002:a05:600c:3114:b0:4a2:167a:c939 with SMTP id 5b1f17b1804b1-4bb55a5de41mr169387015e9.21.1794755142424;
        Sun, 15 Nov 2026 07:05:42 -0800 (PST)
Received: from jernej-laptop ([2a00:ee2:6a02:9300:bb69:6bcf:1b11:e85b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb4e293540sm313567485e9.8.2026.11.15.07.05.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 07:05:41 -0800 (PST)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Samuel Holland <samuel@sholland.org>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH] arm64: dts: allwinner: yuzukihd-chameleon: Enable the GPU
Date: Sun, 15 Nov 2026 16:05:36 +0100
Message-ID: <20261115150536.16212-1-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.56.1
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

The Mali GPU is supplied by DCDC1, like on other AXP313A based H618
boards. Enable it.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 .../boot/dts/allwinner/sun50i-h618-yuzukihd-chameleon.dts    | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h618-yuzukihd-chameleon.dts b/arch/arm64/boot/dts/allwinner/sun50i-h618-yuzukihd-chameleon.dts
index eae56908b9b4..9e275f0217ec 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h618-yuzukihd-chameleon.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h618-yuzukihd-chameleon.dts
@@ -68,6 +68,11 @@ &ehci3 {
 	status = "okay";
 };
 
+&gpu {
+	mali-supply = <&reg_dcdc1>;
+	status = "okay";
+};
+
 &mmc0 {
 	bus-width = <4>;
 	cd-gpios = <&pio 5 6 GPIO_ACTIVE_LOW>;	/* PF6 */

base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.43.0

