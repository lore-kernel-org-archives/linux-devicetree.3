Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792680412;
	b=fnfTi9DpzeVNEzw8RmSAF5kWOrTxhTeVT7mR4E7YL++52xGrC9IJ81K+kCQfyZJtzfAa
	 G32B9wM/uLsG2ngeli+AuZ3KQHggpt7gFdp7GRhMvuNXW32aTp0ydUCfKKMdbBSUXWiow
	 TRObD3JNb9CBTSfJGnk6Sq2dHUEMNAkCcpujlfYnxAXeavcybCv145QeF7LqBZs3+ds4S
	 zbIHMMBP1FhPbZtNxjbwlfZLABuf/P45hE7ajzYII/cHlvwogyr4LDryekXiQUKPqG9ss
	 e5MIlNnG7eOoYwYu0/avZJuvNQCd/sM9/aEncXP+IZ2BF0SokpCqwo/DC7UAI2XWJ2Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792680412;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=9ejw1kEAdsdZspPEoWHlWSDGgAnEWhYDeRavXIDNvZY=;
	b=UBQW3250PpYEuhdnVU1VqJWy3FJb17X04O/blxFuWJoFOUKAT3FemVeAWUEXz6XawLYV
	 r7XGzdwT0NeYQ0HHGxkq2jpP1aN9OCGpyai5MIL09SoHwf9et7AjweVw+LhsvoS1roCMX
	 4POZe+VZ8CFMgqT0o5rtpai0nHGRrcRkuQe0Jm/ETiJJcys0jV5DN8H2H1zA1L6M2VMV9
	 EfFW6H4/SrYQWRmGTqzmNbPmSqgAFQgaViVPIe3vbfzwWe21Sk3iuXt6Au01cHZvpzbYR
	 lznZH/76+IkTBpC9pqzgTuI5Sh53gCERk6w3ek1gXcuaAZZZhxsKWYL+DWGMvbXXCtg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Ot9hvuVq;
	arc=none smtp.remote-ip=209.85.221.51
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85775606A325
	for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 14:46:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 85775606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Ot9hvuVq
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-48df54150dfso1264890f8f.0
        for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 07:46:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792680411; x=1793285211; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9ejw1kEAdsdZspPEoWHlWSDGgAnEWhYDeRavXIDNvZY=;
        b=Ot9hvuVqUOq4gabmyCvwiOpEYaHkAlol+ZEJ+1cT1OVD9ezQZHGG5WY0oXtZtDiyr6
         Ivg3r0z2c7XpTJYV3ApxAeUk1jBLru+ESu1rOMHU8eh9HA18XmECtcNzJnXmFqZ2iTsh
         YpNJAQnuOxyrnYpd1okZKSdwZaEF14wa0QzA/wF23clzBXZBi/GmS1mD3ASyxywDPg0E
         MLm4pbqNwrLuizs9rJH9Uxm0Ne4GUkc6wjHYff23khKp4lmz/jyu2/l2mZyfrIG4ANXl
         YVFqI6TM4zlk4fdkcmsgDsAX3fYVHv5thGsXhNf9sGnQG2I9+IiC+aUBiCayOy2/lEw+
         X4Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792680411; x=1793285211;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9ejw1kEAdsdZspPEoWHlWSDGgAnEWhYDeRavXIDNvZY=;
        b=P2HCzafs4qBA9yCqVob47cja3uKhS55mZO/DJHwDbJt4N8Gn/VuCVOKea/GeTOnLTA
         zCsDytvLLZ3MW8hq1Pfs0ipYtUl8CHP8keoA74AX6Upa/nZjNYL7pSRKUdsaBlMRWqix
         BcavUkY/iRKQcqisrfKnFGauVckbeyJmygz3xz39hMGaYf0+VaoOE+fH+LvuigJPzAF6
         gS51lYXCQn0bi/q2zAUFiBe52McSElNten811ufz/dF1o3gV+KmJTiIgdqBQa6+LvrLQ
         gSNmeBaNWJ5Uv4l3jPX+VMAhffptg0em95/z0d2/f/TFpgj2cexuVJTfnm0EJUswhZxs
         MMZw==
X-Gm-Message-State: AFq9FYJF1zW17L8Os3hpfZ1RyWeEo2OnNZa9cRZW3Y/qI7QC0MY7SuxN
	kzN3aFP0tyn+7IVVPZc1ZVXkC8tZBZQI0hrMAeGu5CKyRHPazpyj75d2
X-Gm-Gg: AYBFou2LvL5K7ARaHZIoG+aitghTnN0YgPSEBGh4XLdz2f0UKKuVx1UddbP4IJNrp7a
	EVZ0/8iaddWcoruGeCFvmO6RUYMMVdI+8e286Rk3+gWD0vLNEE0z9F1lBrrgnexY7RE2yFrUjv5
	SVHa0tW5nxnntGE2ZJA8nV5mj2E+fVGZoy0iHl6E2b0ImR18oV75YIYJQt8ZDe5iAuonZAtmAeH
	0vs0NDDjEXzehWf/x4KjuCIkS3VGe2ZVlM08HQ0DvbbNNb7Sw8zaRAVn4PVlOvBIXuqY/Q56Xj5
	3uVm6DtGFIwf5pXGA1fK+ixZ56oRcoJIkfN/QNtYwvnVfiaGGfAiTnADIR7b4ydqkujCBPlJV+W
	MzRwAVXD7jpShP6ZAwyRD/lGvsbXc/Y01rfuMeWGxE84QlA1otzcJZYi/00Y++jB8t7+Ozj46M0
	NDoBROk8VP/JQpV8AhzNaUb4yg/cH/cmrS7G0+oztACDnePfs9klYJnFlSj/YSPQDemqvPyn0nc
	AtJgnqilxI/1aHQm18Ahh4Pzp5klHHDXLA8c5vhvHkyYcEu9mY84AXjbGVF4sV4f5kVxcETAVlR
	JLLzH4hxgEvYmLvvxV48Pt5g9GWG1lzXi67LZ2lNOTo+0tm+4kmOS+oq1+58sft6Bnh0V4ZUqEv
	d
X-Received: by 2002:a05:6000:2c0d:b0:48e:d36:77 with SMTP id ffacd0b85a97d-48e2644f155mr11067241f8f.4.1792680410751;
        Thu, 22 Oct 2026 07:46:50 -0700 (PDT)
Received: from ernest.hoecke-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e25828c6dsm13672146f8f.24.2026.10.22.07.46.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 07:46:50 -0700 (PDT)
From: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
Date: Thu, 22 Oct 2026 16:46:44 +0200
Subject: [PATCH v2 1/3] arm64: dts: freescale: imx8mp-toradex-smarc: Add
 on-carrier 3.3V regulator
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
Message-Id: <20261022-v1-smarc-imx8mp-cameras-v2-1-cfe3d25e7aed@toradex.com>
References: <20261022-v1-smarc-imx8mp-cameras-v2-0-cfe3d25e7aed@toradex.com>
In-Reply-To: <20261022-v1-smarc-imx8mp-cameras-v2-0-cfe3d25e7aed@toradex.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
X-Mailer: b4 0.13.0

From: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>

Describe the fixed 3.3 V rail of the Toradex SMARC Development Board as
a regulator, like the existing on-carrier 1.8 V rail, so it can be
referenced as a supply by the devices it powers.

Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
---
 arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc-dev.dts | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc-dev.dts b/arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc-dev.dts
index b31de307093c..c28d63293149 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc-dev.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc-dev.dts
@@ -32,6 +32,13 @@ reg_carrier_1p8v: regulator-carrier-1p8v {
 		regulator-name = "On-carrier 1V8";
 	};
 
+	reg_carrier_3p3v: regulator-carrier-3p3v {
+		compatible = "regulator-fixed";
+		regulator-max-microvolt = <3300000>;
+		regulator-min-microvolt = <3300000>;
+		regulator-name = "On-carrier 3V3";
+	};
+
 	sound {
 		compatible = "simple-audio-card";
 		simple-audio-card,bitclock-master = <&codec_dai>;

-- 
2.43.0

