Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FDCB45A2B7
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 23:36:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784763382; cv=none; b=ohoyM7uHSqEouxiNhJFMVCIH+//Eht8nzQ3EqHAF2eYv4tWmvfEz90FKrXQfp4csErh6NRiWW7yVGIjUqxU/TQkylGGs1ir5C8RtDmi+UIbh3dtOlSoJNivRcigaX6hsYKDP4S+aiHaPUCbjFNCmDjqZ/w+nfLuh/hvsG/vv2Uk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784763382; c=relaxed/simple;
	bh=/QV/a2X9l1SRCZ0f0eQqmAxS/D1oWuZ8tyi8t+tP54I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=k0SqqfFX2/RlJDqDGzDkSzdp3O0eUGbRxWdeUiWdXs5lEz56US29mQftg0XvfG9E89yQ7QGiNdwFUptWzJRFV9px2s4yWRCZvStefqfpw071UmMdxsBHpKRmc3S1mVuP55hmkg6LMwbXAORvWfyyzLNw+U8XXzfL3BZAjVLVqOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L7F2Pk+g; arc=none smtp.client-ip=209.85.128.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L7F2Pk+g"
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-80a123ef90aso176567b3.0
        for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 16:36:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784763379; x=1785368179; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9smGZPIePSsY0cU9QHa9y4DXLJagF50l0voTZ623s+g=;
        b=L7F2Pk+gUaqyBxJRR0D/QPHjrGugUzVNQSPrz4exsIZkpIHIZcRs0dcB+t1mUInS7+
         8kP036BMxU9isXxjIUA3NzQXeGIfOqNYLwaRhB8vaoVxo0yIuCPRyAT/pTQM/Oa6rmDW
         HCtVVrn2GO4d5G3KfIRKG85OJUh27VMwLy+RfedB9YospWhO8wFVpJJfU3yLuXvNE+RM
         IBajCI6L8b45PKMZZqwaaMU+HSDMqzEixecvCKxD8FWKF0BEnEY2SeQt+RNDKaf9ZDsP
         OjrmQ0aPkBptSqa47fBrxw8vWV+LJJHgpfKdr959JPDRq1jOhOFm50XcSRrQ2j2mCwIL
         Oo4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784763379; x=1785368179;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9smGZPIePSsY0cU9QHa9y4DXLJagF50l0voTZ623s+g=;
        b=YH2x15gUgG6CxEpiecfyTeckmKD0fw/g5MT53dg3YYOVN584knAi+bgI5KZ4knLKGg
         0FA9uIEb1o9nLrE634uMnPdOmnCfF4rGWbbQbj1iS0nDTd71KawQb2q0NC9c9pgL5Lwx
         7fkCgEUa6Lus0cHROQuvKo6PL/mn/bzTmGf+09DrSpABqzu0dKSJQlZY/swDcfyT6eJh
         W2heBZ5bX9erKCvzoOnd2ncHclf4YWkx1Jgt+b2WlmYBhvkn5YTeUn8To6OwbJ+GXJ9H
         u8L9rhAMUWKzJ7+AOlit+F62Hl+j7yuXUwKkBCDsssa7TwAFaldecQT58ZFUKHwKZbxp
         AIrw==
X-Forwarded-Encrypted: i=1; AHgh+RrwAEKYVckm6aaeUcChTR9tPrvbaOPjg5/VY//5sJcnzVxKxuli+yhmdpQQcTqR0yARPgkY32PP6ntK@vger.kernel.org
X-Gm-Message-State: AOJu0YwCB5TvJonwIOGZIHuxY+iw+EHtob0Z4gMarYKrk6fYGwYcBPNB
	tg+gSFMuif1rk/ScB7gQzjGRAtRgY6ikcbgHJy29a4KLQpo4b+BQ6vB9
X-Gm-Gg: AR+sD10k9V0QKSR6IuGrNzmRjgVpE6uSgp4M+aHkTHOgnJ6Yu2VGefVqr80vfqTC8e3
	BcvOBpDR8LuvFlDzKKGDlI71sClDOcDXjsRlsNUpqWWNOG5+pu2KaP1jOAGoTSGv5D05l76xTZV
	Dl6D5zBuL5vn5oXG6/VH+kdP0jYRDcsQGxDM03v8iOTVFd0NqX6ySKKIxBEphlfJ8iSvFzNznV3
	twZmbr/fwRrBW/nyJOrUre7v3Wp6bzvoOpkLLVYvzz2DqSQZ17e5PmnIFjFHrwpcV+8fiXQeyNH
	y7jt+qGPKa2tRL+puWd/zmXUcSf7jhbjzljyZVCSpS9rLARS6FBTGR+IR11lveEcoRZ9Sap6XTt
	4b847Pve+EOjY64jzmWztpzVoeEvtPkdycZ3d9zONpn06BQgaqA7z1TDxzklwzZU/a/vxqhBtRR
	YQbDHpXz5fnT5qrVniseCFFxMTVQeAy0XRJE396Qsl4jby0QU=
X-Received: by 2002:a05:690c:6e89:b0:812:9e6d:d47c with SMTP id 00721157ae682-81f4d3b498emr1003157b3.10.1784763379557;
        Wed, 22 Jul 2026 16:36:19 -0700 (PDT)
Received: from zenbox ([2600:1700:18fb:6011:4392:41cd:1ce2:e391])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-81f33c627c9sm20937027b3.19.2026.07.22.16.36.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 16:36:19 -0700 (PDT)
From: Justin Suess <utilityemal77@gmail.com>
To: Sean Young <sean@mess.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Maxime Ripard <mripard@kernel.org>
Cc: linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	Sashiko <sashiko-bot@kernel.org>,
	Justin Suess <utilityemal77@gmail.com>,
	Andre Przywara <andre.przywara@arm.com>
Subject: [PATCH v3 3/4] arm64: dts: allwinner: a523: enable IR receiver on the X96Q Pro+
Date: Wed, 22 Jul 2026 19:36:03 -0400
Message-ID: <20260722233604.3001063-4-utilityemal77@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260722233604.3001063-1-utilityemal77@gmail.com>
References: <20260722233604.3001063-1-utilityemal77@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The X96Q Pro+ TV box has an IR receiver window on the front panel,
wired to the SoC CIR input on PL11.

Enable the CIR receiver in the RTC power domain and mux its RX
signal to PL11.

Tested on an X96 Pro+ with ir-keytable and nec keybindings with
the remote that it came with in the box.

Reviewed-by: Andre Przywara <andre.przywara@arm.com>
Tested-by: Andre Przywara <andre.przywara@arm.com>
Signed-off-by: Justin Suess <utilityemal77@gmail.com>
---
 arch/arm64/boot/dts/allwinner/sun55i-h728-x96qpro+.dts | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun55i-h728-x96qpro+.dts b/arch/arm64/boot/dts/allwinner/sun55i-h728-x96qpro+.dts
index a96927fbdadd..1eaee20acaab 100644
--- a/arch/arm64/boot/dts/allwinner/sun55i-h728-x96qpro+.dts
+++ b/arch/arm64/boot/dts/allwinner/sun55i-h728-x96qpro+.dts
@@ -266,6 +266,12 @@ reg_dcdc3_323: dcdc3 {
 	};
 };
 
+&r_ir {
+	pinctrl-names = "default";
+	pinctrl-0 = <&r_ir_rx_pin>;
+	status = "okay";
+};
+
 &r_pio {
 /*
  * Specifying the supply would create a circular dependency.
-- 
2.54.0

