Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794423872;
	b=zmcTSB5D9uDkxLo5vX44sVssfUf980xSLoWNNjiNazg3vBAtSjODSi28KWTRM+PqOV7U
	 FfSliOoY+4QgoibB8UEyLDPeJPbveni/ieYYH7ZHcq2vVAo3CyOkfXb72+vb2S5VNnck7
	 jgOEiVz6ODavonmJnTQfNfhohYmu+AojRDkoRzY1872EJr8xHrrZ7/W0brpPhO50AJvdG
	 sLxvuWFM6xcz3sxwLc3LYmK9E5HsLEJ4y5ZASnYNkviPfFtHvJa3gp7gMqkOiwXR+v/2I
	 LuOXfafPU6o92tJmw9XSARXVYVz02ZdOqG9Ey2uJdLQRCn8iSyeke2SwREhZ6WlLBiQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794423872;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=fkBYOithnFO0IRX31SXjaTHWPBNV9b7p8e5gc+6w+Pw=;
	b=G5bMUWNI5vcjx7HRRQ2BxNZAOdFag/8oSlRFcaP1NraatqbCxOUSHigRqRmu6deTTlkO
	 BDNVkE9A2rGp0+oZAD6PzA9iDbS4NtL0JJeotd8shu7ofWtXO5NNJpWieuMH/WUkOqZgl
	 EbK/y3FV9eGNYRcNF0X3I6H80F6CWI/5Xfr9cqAM7/HM7rH6fo2Dh77X9L0akFgaPmTPt
	 caCIRC6A8HH1sKbvD2KZSwE0EJmOLLoWBKfshlECiBs1iLvWDW2LNeez7289usOzxNT4r
	 yZ10n4kjVVakTNVGp6EYgGVOnQwaCuq48qV1Uy+R0LIOFXQ6mAgr0VVlfRXh8eW2UxQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZsdRlPD2;
	arc=none smtp.remote-ip=209.85.216.47
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF5F5606A32A
	for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 19:04:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DF5F5606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZsdRlPD2
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-3b10ca4e3f9so1987108a91.0
        for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 11:04:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794423871; x=1795028671; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fkBYOithnFO0IRX31SXjaTHWPBNV9b7p8e5gc+6w+Pw=;
        b=ZsdRlPD2wHpMA71aOB4Q6aMSz4wd6LpTnHOfIzOYHv3SVEGqCRMmYjV79OCkRQLFLL
         MEXYVZUK5x7A5pURGWdeez7uh2N0PPfaR8uDUonnLBJY44pgWl5EVOeBNbUnAPA5isjo
         C1HBbdyDfN98oMCnrFU11ej5/oSmzuClro8l1NJU2+arAOV2+W15jytRuVyYaVIkv5Ny
         d/uLCBj2t9wRUfs0ejS3c/S6TLSmoGqOrS2JoLfq3tVG/WQ+/UlEWrP5cnh7gc33VTmZ
         LuoEO3/eMW0BYa+WMM3YuSoy3rXdRuQQSYGlvH70uHHZyFzuJBjhqjszFe4AfFH+6wxJ
         TIxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794423871; x=1795028671;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fkBYOithnFO0IRX31SXjaTHWPBNV9b7p8e5gc+6w+Pw=;
        b=hwSbZPN929160Oqs/oJ5kbtsqmDJ36pyZdmaQlr8btBJg2lfAZIEjsMUyE5VsdTs8K
         betelKvQBaLn9NZwK357PH7CrP9NpKB3UPLARclsPYnCFIo1S2D+FYgccS9XWSLiSCKv
         APeepafgjvnqNhNwhWTXKHWj4pIu/Ztczm4+EA8qa8C+1998eGGroL4pTwIEindEhZGM
         V6Qr+Mh2viheEsc4DLN/LbTWHYRD1DYLEznnLpnN9Z++5WVzCmb9/UagPX0UpCmhoj/7
         shUDbL9QmqbqaZjNjwVUmVtIl0lDwnWZblrzJ2zAJ8btLKJR/RcDb9+R4DcvDbDlF73a
         cgtg==
X-Gm-Message-State: APuU4Z+MRTMaF9Oer2x1xd+n433vYO7TmLarX2RwOyZh4XDeWpNW652b
	AEuUUNKRRiKrPyVw1f3bNtCQ222f93KTDmsK/o8UoHTPA2JxmKvuOnlh
X-Gm-Gg: AYBFou1kflf5Gm6e72Rxj7SSzScA/vBRtJatlFlUaF+EqP7bcXsbyDV8RtjLRqlkOPX
	SFloxEapff9mPzOSsbLRi/Wf7ZIaQRfCg1Ep/DGvPWdAQhQ7HKeZoF4kOnAQf0DG8jVqePVHjoI
	KYJNeQ+NYVu5VRkce1uOiZtcPg4mpZAidzQgqYPJqvlXoDby++CTFITxGgm3hFnAThMg8eRMZWG
	ofaqnanx9qmjsshDQ5MrHzkTisZ5MYFCPmwwg+iVVMLFqxPBzRsArmB54jIcf56AIcyKN8J+QON
	Xa84DVRectjedKVWdl8Lmt0kid3marYit/IsDgG96tt57bMs/+MYCB4rmsVSTQFn937cejubfRW
	kp35PZQHDAtpZeaayu9tSWFLIRGfbjVgCJJ9lcHTbSHQhbFxkPvMJaH7ZDU7eMTHjFwxEkC4nfX
	UW5F2TDWGo6oCw3QGZJYkbpTOOH1tPv+Gs7yr1b+3sblrbjcW+ZKwOqpNqmwLBLojH1okdk5xR9
	2iIfhVNPO8GzEIv9qGibrUzjUES5cKRnx/tA+I6+Iopn3mvI4US4FJ1sScHl3sWCqWvYrnI3Uoj
	p8GkVIDkF8dfuqWBVRWvfPFrsv3Tj+qngVrQwTKappKIQjwGaNQN0K8=
X-Received: by 2002:a17:90b:3a0e:b0:3b1:4018:bfdd with SMTP id 98e67ed59e1d1-3b182e107dcmr3006901a91.7.1794423870904;
        Wed, 11 Nov 2026 11:04:30 -0800 (PST)
Received: from [127.0.1.1] ([67.159.246.222])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b181f8fd59sm2727366a91.1.2026.11.11.11.04.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 11:04:30 -0800 (PST)
From: Leonardo Costa <leoreis.costa@gmail.com>
Date: Wed, 11 Nov 2026 16:03:58 -0300
Subject: [PATCH v2 2/7] ARM: dts: imx6q-apalis-ixora: Add 3.3V_SW power
 regulator
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
Message-Id: <20261111-b4-v2-apalis-imx6-overlays-v2-2-8129b21634c7@toradex.com>
References: <20261111-b4-v2-apalis-imx6-overlays-v2-0-8129b21634c7@toradex.com>
In-Reply-To: <20261111-b4-v2-apalis-imx6-overlays-v2-0-8129b21634c7@toradex.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Francesco Dolcini <francesco.dolcini@toradex.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-bsp@toradex.com, Leonardo Costa <leonardo.costa@toradex.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794423849; l=1776;
 i=leonardo.costa@toradex.com; s=20261001; h=from:subject:message-id;
 bh=G0D3AUMCZAfAB+oBMBn/hQwsHUHoV16Fn9kK3ypcWVo=;
 b=nVAd3ioHTSP14EpXIOGgXQEKXYdlaDj7tVEwROvBxWF3/+gClQ12Rlidq7vEtLB+ule4J4Vk0
 3bR2zBAFxnoCkRzAHzkq5qgKAg20KQVSPt5/X9Lvj3yCeW7DLsd4Jni
X-Developer-Key: i=leonardo.costa@toradex.com; a=ed25519;
 pk=4xvoVLDt+NxIz9D8BJHhT0fD43Ig6XgSDw4jRN/gHzk=

From: Leonardo Costa <leonardo.costa@toradex.com>

The Ixora carrier board has a switched 3.3V power lane that is used for
powering peripherals. Add the correspondent power regulator node to the
Ixora carrier board device trees, similarly to the already existing
reg_3v3_sw node in imx6q-apalis-eval.dtsi, so that it can be referenced
by peripherals that require a specified power supply.

Signed-off-by: Leonardo Costa <leonardo.costa@toradex.com>
---
 arch/arm/boot/dts/nxp/imx/imx6q-apalis-ixora-v1.2.dts | 7 +++++++
 arch/arm/boot/dts/nxp/imx/imx6q-apalis-ixora.dts      | 7 +++++++
 2 files changed, 14 insertions(+)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6q-apalis-ixora-v1.2.dts b/arch/arm/boot/dts/nxp/imx/imx6q-apalis-ixora-v1.2.dts
index 6ef2a986ca8cd..73e3b99486d0e 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6q-apalis-ixora-v1.2.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6q-apalis-ixora-v1.2.dts
@@ -57,6 +57,13 @@ led5-red {
 		};
 	};
 
+	reg_3v3_sw: regulator-3v3-sw {
+		compatible = "regulator-fixed";
+		regulator-max-microvolt = <3300000>;
+		regulator-min-microvolt = <3300000>;
+		regulator-name = "3.3V_SW";
+	};
+
 	reg_3v3_vmmc: regulator-3v3-vmmc {
 		compatible = "regulator-fixed";
 		enable-active-high;
diff --git a/arch/arm/boot/dts/nxp/imx/imx6q-apalis-ixora.dts b/arch/arm/boot/dts/nxp/imx/imx6q-apalis-ixora.dts
index 6b5393accc092..6fb57935cdf1f 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6q-apalis-ixora.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6q-apalis-ixora.dts
@@ -55,6 +55,13 @@ led5-red {
 			label = "LED_5_RED";
 		};
 	};
+
+	reg_3v3_sw: regulator-3v3-sw {
+		compatible = "regulator-fixed";
+		regulator-max-microvolt = <3300000>;
+		regulator-min-microvolt = <3300000>;
+		regulator-name = "3.3V_SW";
+	};
 };
 
 &can1 {

-- 
2.43.0

