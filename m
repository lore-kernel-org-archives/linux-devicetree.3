Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794586739;
	b=L9S/1iuYJDHkGaQAsFGPQWzRqkv9ahgAWU9m6eAUhEf99y636KZ0TRf4WlYSCH2Dx9W2
	 i/s+dSgeFIQ3uVobFVsLIZtCaUZn8qrfEDdjakyDK7DJozZt12qHlSQ5r0L98q9ZUbSue
	 NY5vEw1F9DQCKEfjzbqMPF7iEk3Yslv5mzjvtS0u7cC572dxOjfMF6QVHTUtG1TWCXwcJ
	 ioty2VQRm9Pu9tdfySFM1dmyNDtay2B78ln++VuwH0S2UpyfLi61h3Gbodr3xAzoaMgxS
	 SRDF3Sp4RqJtas8MtxhGFAgtz+NnwDaMIPmwj8MXB0Vpjg53PFa5LsZt1bJJgIMWFmg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794586739;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=HMJ+dwPb/3PV0iTHWqAgN85Hf/aWfKjSW+f/zVf9g0U=;
	b=uEekxtHto9YeFPXYANO2dqaAuTWdquUC2JjYVRIK/ZKvuQNiZhmyE87NOhjnkYlq38db
	 nOdh8cpZ91RMDPkaYcG8ayckWyMMr0cHnnBncKW8dqTWQTMl7goQsLpUfc/GCAt3ydknc
	 cHp16K/hRcoY+Y0jtIwhpvUZo37pseLmj+FW0trFKK8FiySRgYomJjy/m1J/CdAAbJ6+n
	 tT+lOtvXyq1wo3/XnR/JCZtkJw703UgYA9Jz4zfDGBjiXWdz4WF4U13PAokPFzC30oBnL
	 I5u14zYJu9OiZ5FeCJ+yA8x+zbaIAxSnz9AjhtEMZvpCenrieNJGyRp06KVeMKPiAVQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="h/xZduVu";
	arc=none smtp.remote-ip=209.85.218.54
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8AF8606BAB5
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 16:18:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C8AF8606BAB5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=h/xZduVu
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-c40f29667e6so273690166b.0
        for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 08:18:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794586737; x=1795191537; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HMJ+dwPb/3PV0iTHWqAgN85Hf/aWfKjSW+f/zVf9g0U=;
        b=h/xZduVukTCl98vPuaD9tn7ALCK/+1HewUEzyNcbAZYa8oxWIHIV7r+j1AzG8JkuLH
         28XeWnnMevEHeKDQ6if9gLfnPgBAOLIU67vCQFebQIKpLAZu4B73xIYiKzNL2z/fIgY0
         yh8YQNaq4KfViS8dBltd+isLo9z/hrM9j2BBzBTh138rsni8UF1HYUOIKwEEHxfAl6NN
         sX3tfC9HW06LxyY6oQqc/7jzKHlbOjQLsPYrwUyhgUO0/buG3XT81pNAo+F9ZWqV9Qhk
         ObmZ+/Y7fFhaeI44Isf4MVJVnjLgQUyDpZiDYXU+eevVWUqan2FhVEtfgYVlQVXTUB2U
         hTew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794586737; x=1795191537;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HMJ+dwPb/3PV0iTHWqAgN85Hf/aWfKjSW+f/zVf9g0U=;
        b=U42ORDoU3/2Z2xoHspYzWn0KAo0wFB63TrS4Th17YX2chpDlrGfJW0d0QCYecqBul0
         N/kUZo4vtEwq5CC0NV5HGLQyezzGJqXfSUWH5JmTFsonG/U+35pam2ZB/U4QXFIPoDB2
         7+b0k2mbLujkGEdxRH4LwR8pcMq+nFtTLUQB9XrqF/6n0x4vHGTHh3PTXt/21zkqyGEH
         2gXoBUayXbYt5BkvVXk07q2O4zPCfB+Uyf0AFHUocVug5qudM+BESAkL1IuiKYVdVfYc
         5WQabBRMednSVbcGNwrt8RM0tq8OYx9210ssBGh668aMwol17kqg1UfzGJFs4CUVj2Vt
         tTCA==
X-Forwarded-Encrypted: i=1; AL+hErFSlYn7A2qT8zbl/kkpLHEyWk38dCXhH6R+8JhQNu0iy3mA6nqw1WOtOldSOzKKAzHF0hCN2ZlY8ZEE@vger.kernel.org
X-Gm-Message-State: APuU4Z+Ea/QXZExiVPrWrOnXqMEDw2ZrshZugoJ0CCwyxoQwLPHKww02
	t/9DeU8viE3q+wjJtJb8dFWtf0Bh+/yoeg9inX/+3PrSG/TtO4+dJD6P
X-Gm-Gg: AYBFou16KaqiF2Xm+w6CtWArmGdQb2KRGO9l7cvRVK7HJCYqkxmnS07CJrZtnfG5fBg
	RgYjvaE9yornfs+7UO0APRWVj9G6B6uBV47wqckVuWlyWdDz18Y91nvoqlEIBSA/ss4IWRyNEij
	a6s/7RtFrJ89pkzvkazWMsCWi3gl6h83HoJy2mB1Y2pEiu1jwMTgbjcHgDvux1NIzlefjHAZK21
	vc5VJ7CzzvWdKO1Yt5BiZhyQWvWX0hd7KjWHhpB4lvR+jMjn8vKVhJMPltVeZyqgGDUOhB8vg4G
	Z1rSRXrAE3j3ZSHROFoPWMQKPNcukUj3RWBvEUZKbcrITLug6qhw1invGIHo8AvTevA16/rt7LN
	qYtz29wspVqVwKvt3/gTct+BK7zcVz9r639Y4nV0Ts6Hgu37gBSQz18WcGtXiMBF9QAzbUYjRKI
	zLPDRXWoQd+7eHErA/VctM/h3okm295wgtlZR57rz0AIonuK+wQ4w1DHMl0MaERoaKVz5+xDEcs
	PL4D3B4oqNcwcG7mUTVkXU7B635KCfMOsFXOgq002wJaOUgOK3Na3rUMf16mGD3u/EhCIYcFv1X
	raQBkIvFcaN7McwKgSjbErFM6/UUVkpFsJ0l/n6M9IbTBmt1jS/zvt/Hfn7TJpwhHwkEAUFzdGf
	yeMiN4lozq2LXc7VJo3RUF0axQOVVmu8=
X-Received: by 2002:a17:907:3f20:b0:c46:c3ad:e1ca with SMTP id a640c23a62f3a-c5096396effmr277155866b.9.1794586737209;
        Fri, 13 Nov 2026 08:18:57 -0800 (PST)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095b24b88sm122297266b.16.2026.11.13.08.18.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 08:18:56 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Sowjanya Komatineni <skomatineni@nvidia.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Cong Nguyen <congnt264@gmail.com>,
	Faisal Mukhtar <mukhtarfaisal03@gmail.com>,
	Dan Carpenter <error27@gmail.com>,
	Hungyu Lin <dennylin0707@gmail.com>,
	Hao-Qun Huang <alvinhuang0603@gmail.com>,
	Yury Norov <ynorov@nvidia.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: linux-media@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH v1 09/10] ARM: tegra: Remove fallback compatible from Tegra30 VI node
Date: Fri, 13 Nov 2026 18:18:18 +0200
Message-ID: <20261113161819.36847-10-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261113161819.36847-1-clamor95@gmail.com>
References: <20261113161819.36847-1-clamor95@gmail.com>
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

Tegra30 now has its own specific compatible string for the VI. Remove the
Tegra20 fallback, as it may interfere with the correct configuration of
the device.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 arch/arm/boot/dts/nvidia/tegra30.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/nvidia/tegra30.dtsi b/arch/arm/boot/dts/nvidia/tegra30.dtsi
index 1e51da329f310..e1f66240ae552 100644
--- a/arch/arm/boot/dts/nvidia/tegra30.dtsi
+++ b/arch/arm/boot/dts/nvidia/tegra30.dtsi
@@ -150,7 +150,7 @@ mpe@54040000 {
 		};
 
 		vi@54080000 {
-			compatible = "nvidia,tegra30-vi", "nvidia,tegra20-vi";
+			compatible = "nvidia,tegra30-vi";
 			reg = <0x54080000 0x00000800>;
 			interrupts = <GIC_SPI 69 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&tegra_car TEGRA30_CLK_VI>;
-- 
2.53.0

