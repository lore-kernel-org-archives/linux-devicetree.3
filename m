Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793691699;
	b=UGSBg4MNdfh+ANvWAUKoB7doUjx5UcZv+aavAcRWWJjayixBZk46KWpsSZkZpCkkUUYG
	 zYh4DhAWYeLEga3jCi2kPPhIVj5dbCNPUsV/yRTLmOAqnkkpdjMMnshAImDdhLZOUg5Ot
	 bbkTUG5rvu6NRJJX98y7wU6NQx33uc+5Z9izEe1S8Zi0eWz3ZcSTIANwew1UXJ6yq8Yqb
	 mdfrIUEjYn4srYrrjo9jyo5JwllsrXLgyDXDB5AhjnTjypF0mn5jccxvFuB2z6d/cpX6i
	 3Ch1gjAt1TxtY/93bkhbA4tuYmXZEzKbWrKJnHXRYWGTaG7swbhh21CH5DriVdWXp1w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793691699;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=sgKBfMXdyH3JiV8S086KL7jIltq3tXtvUnKZO5GkGUc=;
	b=bXvLRiuRVFq2yWykKvyCN9I1hkCrSg4f6DzAt/xtJzCuAEuRe1vFru9IuSw6qgLtClyC
	 ZQdqHULXBFYFe5hePNEBam9FY+2Jfl7aL5LcKTPdIqLA6N9QOpKBa7gsh1pyJbVsCNxmv
	 SwKeeQ0SDcmPrUJOEizC9hUeoFpm7O58SpkT2ZGsKT//8ZZuVgNcaYCVq4bfNMHHoxLUp
	 0XEiR9+wPPd+J3vvK2X6nIxc5047nu8a7oUNvxduxGbEUsUkkgoQD81PUFANQihvxlPil
	 wzaJjCmeFSm0mJa6fJd91hMkBlIABihE1MNbyk4MbLr49ECksOvk9NOiTNw4if/d8Ag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KJfZXYzb;
	arc=none smtp.remote-ip=209.85.216.41
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0A95606A32C
	for <devicetree@vger.kernel.org>; Tue,  3 Nov 2026 07:41:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A0A95606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KJfZXYzb
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-3ae486f8a27so2181755a91.0
        for <devicetree@vger.kernel.org>; Mon, 02 Nov 2026 23:41:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793691698; x=1794296498; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sgKBfMXdyH3JiV8S086KL7jIltq3tXtvUnKZO5GkGUc=;
        b=KJfZXYzb9V7BarptGpXjwtFkFLWZHfrzLpBtYZ/hT2sClqSpIOBxyHx1i0CxoaYq3C
         M9eYL90xk0ZhTZSVxjZQi+xZN2bZ1IgkqWw0uYbU+xvc9DXmxLPnxYU0GuAJm2Bmn0Fn
         HNXqOQbINNQhVXAG7IFWI1MJGA+58ibtFCPOvIqDvZo+ojymWESc7MvnfHeS+H9zT7kO
         hkN6itB3FyOxC0CAoEdBBWtrpwbGJjmo4KStjlQTf2LNLeZ0BoZXHR9O3xkR1S4HnrQf
         lz9CxjdcGFFPFC+Da9D5XgFKSghLUss4sE+zZBwG7wqJtaS0KkIeFOhtcWNg2RFqtayi
         eL3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793691698; x=1794296498;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sgKBfMXdyH3JiV8S086KL7jIltq3tXtvUnKZO5GkGUc=;
        b=MqvxL8UGnuTAIjI8RlUp2bWZ/VF73xMbUFfZ02fkMVb4zlR0DrPWRAdyF8ok0TVxw5
         lOctkx3wdH6d2BOTEbtEdsxogB3N8onjcETjBRBy/zt7FPGhJnGy637uTEu4nWfd2Md8
         AqQUlQbx5Tk9DemtNGuxn3n8u5azMgCvvZRb7aKLBq7BKsOHCciJfpigRSq3H+R0Cp2u
         TtHeLcRHVYVBWFd4MXKziisaCFh89GNk3Z4eGJXxFagJ+JIF7t3hYmBdCN+00iycezCy
         PK6x3pBWWtLcE4QMrV2RarJMpoqyBRBG9/qMPIPunAqwjQrVu1CpaI2hba6Kjre4quEk
         quuA==
X-Forwarded-Encrypted: i=1; AKwUvBwaFKedlhw8u3oXDmrR07LetMs4v5HozmIeFOaEeNTLwzQeXUq58b/NUUe8h1JiA1E3JDOwrDJdlhZm@vger.kernel.org
X-Gm-Message-State: APuU4Z8Ftl9DRfeS2xd6RMQxRt7WzFQUTpEqhGjGn1Jxb/u4B8lWXl6+
	s3hjibHo7B/y0HS11YsJgopIhIcipwoDMaOgovqlvWbO2fQsv45iTp2h
X-Gm-Gg: AYBFou2Y6ae+BXp06p3lPE19cmQNiEDsNdZeW9gtW1daWz2DKyf+FF/9eSRkMBjjfON
	CeXAh9dK91MX5Sox188fnCawPkaV6nwto+5CAEI+dXVQ0ZmdfIBvWGk+br24/cgIbThltw7DexU
	Sc3bhyQJnJn/uPck2tuesEkS0UNP71f8sU6SUSJ2prps4J+Q/Sa8DtSK3mEJ1V+6Cef0wMYeF+n
	r8QOaYI0890LAC9Zc/3/wJymqI5uO6FPq/W55MG9RCu28wYVNCglMBulxtS9PBACxPtVHn7O2ao
	fvxOzRGNy9LmgkA6XaCeZNkZgiojlZIgIj5WpQKiTbtcIeKJv+8SLG1LcbEMORRcKOJpkdq9FEV
	IAb1yqoyHAxEQqZbedIUTC8ZS0104934JHtmJy+kmUZnnNKdC0lPweVcIC2Mn3otLcYuDwgAV+u
	Hj0PCjz5ZzvbQO9WOQchIJ8IVlrvUj4+bF5CQg0i300IE1ujGuvGrNFzDD3ZSd2aXOSQADJXTVk
	4fT+vezaJ+mxDeBawGuJuVRH3AXQI7oY8uoi3l7sRQYMqiaA5uCm5lmOuCS6nD6UGr8AW+OUXg+
	7MX6k4PraTMzl8fMtZVAyyMDr9Dfv+hS146G9zZ2GNI3bz/jWCNUprs99HK3tk1QXgBv8+3nzGK
	XQ6pLpe1p8deGcU5SgTMgD7vBHe4tQO1U6FWtOxHMcH/qdarYM9sLxkKEQ46eqoT4RdWKSTcxC8
	g/zuE=
X-Received: by 2002:a17:90b:2ccf:b0:3a4:6e84:e7d8 with SMTP id 98e67ed59e1d1-3ae897a8b33mr10316524a91.54.1793691697979;
        Mon, 02 Nov 2026 23:41:37 -0800 (PST)
Received: from [192.168.2.34] ([2403:581e:d87e:0:739f:50a5:e171:f133])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b07c903d0dsm2956769a91.12.2026.11.02.23.41.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 23:41:37 -0800 (PST)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Tue, 03 Nov 2026 17:39:58 +1000
Subject: [PATCH v4 10/22] arm64: dts: apple: t8103-jxxx: Add regulators for
 CS42L83 power supply
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
Message-Id: <20261103-macaudio-v4-10-637484efe46d@gmail.com>
References: <20261103-macaudio-v4-0-637484efe46d@gmail.com>
In-Reply-To: <20261103-macaudio-v4-0-637484efe46d@gmail.com>
To: David Rhodes <david.rhodes@cirrus.com>, 
 Richard Fitzgerald <rf@opensource.cirrus.com>, 
 =?utf-8?q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 James Calligeros <jcalligeros99@gmail.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, 
 Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>, 
 Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>
Cc: asahi@lists.linux.dev, linux-sound@vger.kernel.org, 
 patches@opensource.cirrus.com, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1835;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=91sg/4nKfvF74lrnGKYqCKgThTSUHsOM+GGCNFkYSqs=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFkv+88JbPI72Su8M+7Bbd0Zf+xbV7Nr6FclxD/dnnT9V
 n7MU+kXHRNZGMS4GCzFFFk2NAl5zDZiu9kvUrkXZg4rE8gQaZEGBiBgYeDLTcwrNdIx0jPVNtQz
 NNIx1jFi4OIUgKmOesbwz/IYh5nksXNOV/8cU2vXil8j0SZjyleck+IU2sYVW3tenuG/yxuJtQf
 /2BkYBE01uGa7Zk4Hl963N2flDnT7cRpfC9jBAAA=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

The CS42L83 codec found on M1 series Apple Silicon Macs gets its voltages
from fixed regulators managed by the platform. Add these to the template
Devicetree so that they can be referenced on the relevant devices.

We do not (officially) know how the power is delivered to the chip
(voltage rail names, commoned pins, physical regulators, etc.) so
the regulators expressed here are just stand-ins.

Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 arch/arm64/boot/dts/apple/t8103-jxxx.dtsi | 32 +++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t8103-jxxx.dtsi b/arch/arm64/boot/dts/apple/t8103-jxxx.dtsi
index 686fb1dd215d..34694902c945 100644
--- a/arch/arm64/boot/dts/apple/t8103-jxxx.dtsi
+++ b/arch/arm64/boot/dts/apple/t8103-jxxx.dtsi
@@ -38,6 +38,38 @@ memory@800000000 {
 		device_type = "memory";
 		reg = <0x8 0 0x2 0>; /* To be filled by loader */
 	};
+
+	/*
+	 * The CS42L83 found on all T8103 boards requires VA, VCP, VCP_FILT,
+	 * VL, VD and VP regulators. We don't (officially) know how power
+	 * gets to the codec, so these fixed regulators are stand-ins.
+	 */
+	jack_va_reg: regulator-codec-va {
+		compatible = "regulator-fixed";
+		regulator-name = "jack-va";
+	};
+
+	/* CS42L83 VCP and VCP_FILT */
+	jack_vcp_reg: regulator-codec-vcp {
+		compatible = "regulator-fixed";
+		regulator-name = "jack-vcp";
+	};
+
+	jack_vl_reg: regulator-codec-vl {
+		compatible = "regulator-fixed";
+		regulator-name = "jack-vl";
+	};
+
+	/* VD_FILT */
+	jack_vd_reg: regulator-codec-vd {
+		compatible = "regulator-fixed";
+		regulator-name = "jack-vd";
+	};
+
+	jack_vp_reg: regulator-codec-vp {
+		compatible = "regulator-fixed";
+		regulator-name = "jack-vp";
+	};
 };
 
 &serial0 {

-- 
2.56.0

