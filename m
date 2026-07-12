Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A2EB39B959
	for <devicetree@vger.kernel.org>; Sun, 12 Jul 2026 09:44:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783849465; cv=none; b=TT8q/sRoa/jctluKF84y3lBwS9zzM22B5378RprSpZ0mGPywtx1bPjwS2BsukbJLSdHhVIiDnv5PaZytBipLSK3CZaXYiF11G+o1j5mlH4Q5bxCGgM3PrbDNc1fVUAGzOepAqwVfS/L6aLU9wFPS3+xpMkK50jxnhS83Ui2LOpE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783849465; c=relaxed/simple;
	bh=V+frO5wk0tnXRPBZHabpKOBw5u16aJAV7l/JMbUCB+M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=b/gsAt/Hqtd9vP+pIxqfjVwHch9rE9wlH6NrKGkvpYoPnzctVGk/KTjf6JnEv2FJ3oHkY0hSiuvNDC6vk6vtvFidQqTOTmZ0HTxPqHOk5w9mJyuX1gD0RhzLLBJ4sO/vUfFrxLOry8lye81BQs+hLFW8yxfbfZYJzHOi3SWYwpY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HPyJZtCL; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HPyJZtCL"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-381ed661712so2702037a91.2
        for <devicetree@vger.kernel.org>; Sun, 12 Jul 2026 02:44:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783849463; x=1784454263; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KojOIw0/7VKNeIbp9mqtjfjXLwzayJpBCU49qrDmgzw=;
        b=HPyJZtCLUsCobAaZRD0l1RJRdrQ0rf5N/LUj/RiMu5BYw9vaJMeMprOvqRb+GOv5SS
         c5oPsARxFCMTyxVk9g+fVvTBsV5kIwZ50dKw2hsyWzrFYU4pqiKKD2dE6fvGKJKUW2bj
         2OXKXQL6jG1V7oBKBNB4XjVyIFDDdMk4YTlJ883pLOQjCyZ0FNbEcTOX4GCWsnCn/tUl
         KOTlax/EAQZEty5lYZ8ZYKLtFLTx/qdwRr5doYJ7HB9lgCamNacI71t0ad4vJTs2g38j
         SnhqtXM3eNJnu/esSgAh5mPSGa7+L+HU6Isq60rhEAbp6KDa5JG2/4g0cn0F4pc9YptP
         T4VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783849463; x=1784454263;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KojOIw0/7VKNeIbp9mqtjfjXLwzayJpBCU49qrDmgzw=;
        b=bYh0D/BONnHqYWfws4RONqgRfRWeIfX3nuIjy+5ugkotuHWUJaWZ0jZ/5iEuF/w2G4
         jX5LBWeX5eft6zNbHIRuAFefs7UWW/UyLf3naeeg7yyeuPx4Es1EqgCoQX2OWGRvwpTc
         7o+0bTl/0XwmBeF8ZIHCr7UagfAFXX1ywNXw7xa5A/+N/rC1YRFNDxsFgwWPF2Z9gm0f
         hDvkqFl+3Ihve7Ujq7Ppl7M0stI3gHkVFU09pzZmTd8AvZM2Gs97Nr6bHgYfSL2zcrZR
         TnKmucX05yAuw2fP6FVLo4gBcLrqninZV5tnhyn5PSqZUzjV3eGiD7HWvT21Cjet0w5I
         b9eA==
X-Forwarded-Encrypted: i=1; AHgh+RpbS4e0YMONjzMdgORrceYWyQJw/oxit3SjtvjocxvB7LLXB+YWekT/NBBbF4wpxIul8uE9EIbCyiKe@vger.kernel.org
X-Gm-Message-State: AOJu0YwiQ+vCgiB9Ur1CBhOx/PcVrrekc/DNHa0kKYjctf3pNaBOuvIy
	w/DtyQoypG7kMKdf57y6JBqSDtY6n113W/R6Qk70Qkk3pAj5vMSc4YNv
X-Gm-Gg: AfdE7ckCgRBgDwfv6eHlypQzTHlj+uKhdLosmz/4ADg/R+590blOVuNjRDoYMKRYXmc
	jYwIUv5bOHI47wt0Gx0ayuaIgHVEFwGIb/8dbbrIUaZB1tm/Fwlkm7ArWGFogVhX73FvPpD+7BO
	ca/+6OnNvfOAwNt7SqFZecovZgjaTCf4wYhtAsq/BMxYVNAaAJ42VPRKQzOQlOWVf8x95c5dZUG
	J4Cjc0PjtwLNcj2WLMED0q6efjFugm5PLxOB32MF9HtO7ft7dqEeCIKbDFVRUevRvMzuZkx2DUV
	An4fMvOsmealLXToGENAfARQbk5xcCQy9OsXX6IXoYGoQBtBVkD5zubZtxRjPgwlTv9qNKpG9aZ
	pebFUHeU9HsLX8BS6v6Srkx9wlL1yPCYDWT5ysgNnDFOJcDPjRRKR/RUcvvDMDM6par0FWdRMZY
	efekj2nXi6yy1qJyD24s63tSwarkHuNiLzSWM76A/f2xoqc9QSA6RUZuce3fh1H3xuYmEpu6KES
	qbx2P3ODVZ8Y+XdhyhTf0wROnFPun/60B+Gc85Ic7N38UqNXOMzCzJq5/NUYIsh
X-Received: by 2002:a17:90b:2802:b0:37f:9ce1:7364 with SMTP id 98e67ed59e1d1-38dc774cf00mr5465528a91.26.1783849463612;
        Sun, 12 Jul 2026 02:44:23 -0700 (PDT)
Received: from [10.160.6.73] ([119.17.57.186])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-313c50c70c9sm15268919eec.29.2026.07.12.02.44.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 02:44:23 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sun, 12 Jul 2026 19:43:22 +1000
Subject: [PATCH 03/12] arm64: dts: apple: t600x: Add SMC hwmon node
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260712-smc-subdev-dt-v1-3-7763006d57c7@gmail.com>
References: <20260712-smc-subdev-dt-v1-0-7763006d57c7@gmail.com>
In-Reply-To: <20260712-smc-subdev-dt-v1-0-7763006d57c7@gmail.com>
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 James Calligeros <jcalligeros99@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=679;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=V+frO5wk0tnXRPBZHabpKOBw5u16aJAV7l/JMbUCB+M=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFnBiU8sOyuevxZZl3o733i2iW7IseYJiSGud+YevHKgg
 Z1/4xuTjoksDGJcDJZiiiwbmoQ8Zhux3ewXqdwLM4eVCWSItEgDAxCwMPDlJuaVGukY6ZlqG+oZ
 GukY6xgxcHEKwFQzf2D4wy18fXJQyb23Mwun7bi07ZpFf6fL+eoLPxb+mNf11PrFVx5GhoXtL7R
 V05o13/tWFHFd1XpvXDRBUCD+ovra9uiOhfr+/AA=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

Add the SMC hwmon subdevice

Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 arch/arm64/boot/dts/apple/t600x-die0.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t600x-die0.dtsi b/arch/arm64/boot/dts/apple/t600x-die0.dtsi
index f715b19efd16..17db8d7a850c 100644
--- a/arch/arm64/boot/dts/apple/t600x-die0.dtsi
+++ b/arch/arm64/boot/dts/apple/t600x-die0.dtsi
@@ -45,6 +45,10 @@ smc_reboot: reboot {
 				"boot_error_count", "panic_count";
 		};
 
+		smc_hwmon: hwmon {
+			compatible = "apple,smc-hwmon";
+		};
+
 		rtc {
 			compatible = "apple,smc-rtc";
 			nvmem-cells = <&rtc_offset>;

-- 
2.55.0

