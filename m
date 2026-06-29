Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72AE03B2FED
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 07:00:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782716454; cv=none; b=O4L8jTWXanIyGnfsB95j7XxGjCZI/Nim7kwuseYOw5h5d/opZ0stn6AzJM09THG/0632k7Fn+PJiLqkoRlruPYxxQ7AV4acM9yUH2/fYDncO4206opqMLQdFFDs3G/OMQQm6w/eCOEQPv0BXE9BD0ruoHj4sQyJg8ZHUrc18q4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782716454; c=relaxed/simple;
	bh=kVMtXl7rCmx5JlnaHYpMBj69E287VOYKC3xVI2EdEes=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SoNXp3Za5Vz9FJ5iJ1u1emskOjxS9xCnlxsBuG2MlU82pcZxc2N2hnDnQw+ZQEwZod1CESFK17+1iA4jOWfU0ilpCSCY4al5AuM91GoGBZ6u7cpmbf28uSv17gp1kXYpSMvxHt5/giDoiHz8JuRkww6XCis4c2m9MbHpEJdxkZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Agx+YXaQ; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Agx+YXaQ"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-c96d2bebca3so511998a12.3
        for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 00:00:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782716452; x=1783321252; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OmJhwlnvHDQUYncTcDLRsXQNIfCpXR83f5hKepY0aRc=;
        b=Agx+YXaQUv9tyklnaYAzKlFgVN8wqL5OKM46Gmtva/DtTHUuSoKADSW7K7Cpv6T01Q
         W9QTWltkfbNf/LKxZIQJJZfbqFjtLvKINDk+zvTabmlUOJRzhqjsJM83b5PpQ42rMoOD
         HUkUHG6aAMiXA01BfyhiyfkQ/8v0ic0OXCWF6MJEXmr/BsdBEAOy9XchQ4GTE1VikI+a
         Py9XQRu324npZ/gRkERNGlHjx5o9YMfuYWr4QLZ96gVymWVFVwqChTSJPGZ3NEJuyxPD
         SUnpiH3AFBid7GmQDxWy6/dm2SEM7+QCpDiMPIAh2OzNWdaxF6MFjtDXr+lIVO4VXkDj
         MZWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782716452; x=1783321252;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OmJhwlnvHDQUYncTcDLRsXQNIfCpXR83f5hKepY0aRc=;
        b=pjOF92gPbNcpLCyBAP4LJIxo+SK2Il7VUGgpxlRGsygDSQfaHEPUn6DoLQ6ii9ihza
         vRaOQBJunKbpfBIqrmOIN1yKZvAcSoOa2K4cD9Z26WIdK5xPL2GX2kEXD9mMJBBq6FM1
         hN5Nk7Dwd//Oad1WBGfLXYMYB6WA3kvTf+/VzCjvw2Ls7xo7ex5ZEApK4S8/0qMl9ed8
         i45yLNxmhj9GtM78r9+AKs4nNx3ULRN6djnZsfnwODX8MWqIybuHkOirLVHDIRBdV+tP
         SCvbvaGb5+LV7E7zz5zTWzsGmRFIGq0hHBagYtisWokOENU869HJV9rh9bw7rUc5+n2/
         qVJw==
X-Forwarded-Encrypted: i=1; AFNElJ+SKp9zczwm+VGs+vCUo4e6nlEvxVuY0IDASZHO4UsqP9Sbu0QcxKM3e8d2L/7vwRpXurC7gNM97q4P@vger.kernel.org
X-Gm-Message-State: AOJu0YyUgUSDpYP1GtwyByh/S+9ZX3BAFi4yMbeH/nPS7nR1o3VxmIP1
	YpHha+RrHkrIjp0HgqfKJTARpJ8b4tEsn5IFm+vJiaFeR/3KDZWygo/2
X-Gm-Gg: AfdE7clM2yvCHYJZHemqKloOegKOQanq9T7kK30fU1HNaCcpamuVrbuFD2oTV+Nayyz
	8ckK3AVy59mQ0F2tk0kykec9WJmBLj/N6EhbBPgqlsoYisH60dTkXDnA94oOAgKJjrdH1QW4Mi/
	4Eko1vpha7phxQz4bHT8jHe2DGkinQhyCYvINSZurE5GMw/Q+sjarjgUJP4NeUSgD1fi/brnJVT
	KMedPE5jalghTYripLF54upJelsnIctlqMHUMSyAamqSFkGSU90ZnsN78vPLTr+8PeOKcOYwvPw
	2SMs/FGv4+Q/owbB+VUlQWeNW8LwTKmToyH/tvL4a5GKq+NTQ3fKCXlpbsKl0XkTYjbjioRbnpj
	wKyPLMxkk2PBYwBZm5c1cig7KFRrBqcrwBMf6uqjy5Q1Yj/oHTrA6vFAkBz3xwM1caeBpyuLBbf
	sb0MbGdaz04xs/L9zhIjfsHA==
X-Received: by 2002:a05:6a20:43a5:b0:3b2:8675:4866 with SMTP id adf61e73a8af0-3bd4aea1393mr16514328637.31.1782716451742;
        Mon, 29 Jun 2026 00:00:51 -0700 (PDT)
Received: from nuvole ([2408:844c:b00:2b2f:398a:8bef:b88c:653a])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c92bcc90af5sm7061725a12.28.2026.06.29.00.00.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 00:00:51 -0700 (PDT)
From: Pengyu Luo <mitltlatltl@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Pengyu Luo <mitltlatltl@gmail.com>
Subject: [PATCH v2 1/3] arm64: dts: qcom: sc8280xp-x13s: Fix the drive-strength of mclk pin
Date: Mon, 29 Jun 2026 14:59:03 +0800
Message-ID: <20260629065905.15651-2-mitltlatltl@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260629065905.15651-1-mitltlatltl@gmail.com>
References: <20260629065905.15651-1-mitltlatltl@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The value can be retrieve via windbg on Windows.

lkd> !dd f111000 L8

ctl_reg => 0x284

in drivers/pinctrl/qcom/pinctrl-msm.c
function msm_gpio_dbg_show_one()
...
drive = (ctl_reg >> g->drv_bit) & 7; // (0x284 >> 6) & 7 == 2
...
seq_printf(s, " %dmA", msm_regval_to_drive(drive)); // (drive + 1) * 2 == 6;
...

So the value is 6, not 16, it matches Windows now.

Fixes: 21927e94caa5 ("arm64: dts: qcom: sc8280xp-x13s: Enable RGB sensor")
Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
---
 arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts b/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
index abd9c5a67b9f..3ddd44e16e67 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
+++ b/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
@@ -1555,7 +1555,7 @@ cam_rgb_default: cam-rgb-default-state {
 		mclk-pins {
 			pins = "gpio17";
 			function = "cam_mclk";
-			drive-strength = <16>;
+			drive-strength = <6>;
 			bias-disable;
 		};
 
-- 
2.54.0

