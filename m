Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E53B3C0A0D
	for <devicetree@vger.kernel.org>; Sun,  4 Oct 2026 15:45:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791128761; cv=none; b=rmyqvHnLhwv90bGDVhPgBJNI/3G5QoIDL3RnrNk7Wq5oE3RUCCSMeWIS6vrgQqwqJDA/cQfa43ox1nz8M093OiChBy7p0jNIpyvmQtbqxIY9KCAWYt11ULcenJs2qq4i+ELUnw/yR32Y0nslC+d813maCreZNEZA1M/lGNTLvmI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791128761; c=relaxed/simple;
	bh=XZS61d0mcO7GLkdtlPlyL2kzE68bvmUYKNf3f7TrgJg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WAAqUz0EMCt5s8zh90pF7vCfD2WF4w9VdoTgWpdx52k5gnnv4LFlhq1jY1zJs2SaltHOV/NdU+D8pOmZujgQDAO7HVlqSVsl+A1Bxs64C4DefHI5Yr4jEumVIuxgM9HhKP1CuFQfvCvExcQPJONID6T04FrW7dfUqxNknIhcJLw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sqNkdAAW; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sqNkdAAW"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49d1fb0cf5eso9379365e9.3
        for <devicetree@vger.kernel.org>; Sun, 04 Oct 2026 08:45:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791128749; x=1791733549; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+VMd5ocy/TAqsRdGEQmPxImtWVq/jP2X2lBRDaNKz1k=;
        b=sqNkdAAW+XdbqaRT5HvubBsfFNg0bIjKznp8PYCPiTwOzGgKdo0053Bz2d6Ylhf6Gv
         O88qVjviAyVwtRIpKhAPTHdUu0x2q2MhmiNs4h+/t71S0COeX/xt6IlaEDHQKHieWX/k
         qzujEamRWUnk89gBiqWzjdBkzoxc7nbWQuuqaURtBQThR73tJVFFDStKqW7Ms6CVdPJQ
         3FxM3iEHgiIBRY/AHqh53iJPWj8eN9s/xtvxZh3HnxTjHmIZ+jcHrs+NhCNqMV8TZlJV
         383ZePCEiPZUgawe2B/8T0/Cp+EYWpyonyfgZ9JmFSnvlo5ujYMOj0titSvyMTf+XhQg
         VObw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791128749; x=1791733549;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+VMd5ocy/TAqsRdGEQmPxImtWVq/jP2X2lBRDaNKz1k=;
        b=Lv304xmxybDmmVCd+MIBffPLDvOCGP39TVDY+mGN/zoJUhifYel+OJhTg54D1vLd2f
         TEcI9GcpIH0JEJgjBAXXQYeLFdGrKBM9W7fwX8XoMXDGZr7EHc8lavYpZdM5fJerxfVW
         kv7v+5v/SQFleQSAHo68o3ywjYL9ASyzISJI4LyqQej4Wo80S9oNTlhq4mHkPxEgxcR3
         kZqGftfEjIX+rrV2ub4IBMS8k55NTACXZY5qqT7Y9HAzazgKvhQGSxNHRogy9tIJJg+p
         6SE3vpoEvpXnWyksoQRWiDQLG1q9k1VKGal5qB5XL2xiUG9tl1uF1kwJNkJ8Dr4Aq7JQ
         OEmg==
X-Gm-Message-State: AFuF++na8AB9EBvw9yL0iveC3GwXIhH7WedEkapqBP2iJzAQM2XLLIh2
	MZS50eRqtWEqF36dLn4Wq26fDOgWu5r4gOCzI2UZ8JfhADgoXEw/OxHP
X-Gm-Gg: AYBFou386elVJcpi6HtnafKd+1MlNIjXkyc0q5vufwRobdmix3dN3irNxYJ7fSgqekI
	pRR6xdR/zzxqzh25RM0AAenxTe75NcElMxV6jonk553ojzX5AByGLmTe78+2ilpKhbIcW39Vpob
	6ChCta/RoCi4miZBVGvMwICgT6tvld/0Amm6W+Y+GCF7ktZsfzSf1wZW0dqpUENrhDAStb3JLSP
	D5Bp2UWfQyideRENCa7PZRAKK2oQ1GXnyE4bkURDNVwaEqFTVPEw+22h9GTV/zekQOifUDqwyKI
	/ADPka9ThdbfSEV0d9igvJtOtMACVCs8jH5R781vFUHSHLybKZj0/2WraMI6X29HZehW0DOf0PU
	9k1bZnItRYbYsdBHoRgFvlf4s0XC1jErdqjCm+Iro0hJBI/khzH4os8Mj6OdQDkUfWqq2LFJ0gN
	TziOVVbVtXtN8StEF54PhaEOs+yCCmzGYJfxWaqOn7XPYP3ImTlaUzUpEDCLMDUQBX8pDmROSEX
	Cu1FMLwoP6egb9hYJoq7DSK3qJHyg==
X-Received: by 2002:a05:600d:82e4:b0:4a1:71af:cbc7 with SMTP id 5b1f17b1804b1-4a171bc2193mr13724975e9.13.1791128748595;
        Sun, 04 Oct 2026 08:45:48 -0700 (PDT)
Received: from xeon ([188.163.112.76])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a0394ca0f0sm168639935e9.1.2026.10.04.08.45.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2026 08:45:48 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Ion Agorria <ion@agorria.com>
Cc: devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 9/9] ARM: tegra: p895: Update power LED trigger
Date: Sun,  4 Oct 2026 18:44:56 +0300
Message-ID: <20261004154456.145362-10-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261004154456.145362-1-clamor95@gmail.com>
References: <20261004154456.145362-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The previous "battery-charging" trigger was unreliable and slow to update.
Since LG X3 devices now have a charger driver, use
"max8971-charger-online" instead. Tested on the LG Optimus Vu P895; it
works much more reliably.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 arch/arm/boot/dts/nvidia/tegra30-lg-p895.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/nvidia/tegra30-lg-p895.dts b/arch/arm/boot/dts/nvidia/tegra30-lg-p895.dts
index 0d56fd25ce178..f2b527dfbabd4 100644
--- a/arch/arm/boot/dts/nvidia/tegra30-lg-p895.dts
+++ b/arch/arm/boot/dts/nvidia/tegra30-lg-p895.dts
@@ -552,7 +552,7 @@ led-power {
 			label = "power::white";
 			gpios = <&gpio TEGRA_GPIO(R, 3) GPIO_ACTIVE_HIGH>;
 
-			linux,default-trigger = "battery-charging";
+			linux,default-trigger = "max8971-charger-online";
 
 			color = <LED_COLOR_ID_WHITE>;
 			function = LED_FUNCTION_CHARGING;
-- 
2.53.0

