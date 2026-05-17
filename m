Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D77D355F36
	for <devicetree@vger.kernel.org>; Sun, 17 May 2026 23:41:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779061294; cv=none; b=X4Z1tq2w8pTLJ10rbWRWeCKdJcINRR0omNaDQMQq+N2U1xxTD57LZiTcJHkwTMK+Fe+Kf2T3hZtAfV1YESo15RrgLM7T3YTbtWMbfB9W0BEJx9gxC3+UUOL68NTcZAl2yyySKI8+ROHCqvI/Htpqa4ORyhuFaLFa7Q63rYOXpSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779061294; c=relaxed/simple;
	bh=2u4td5jGQ8Ow5l6X1ajhmMrh6sEykCQG5upAuJ1gZDI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iLmg6DpY/IyZ7V8Vo7jzdjEDc+Bb9dTvsgt+gaxSaH00A06fA5RSczwqO1M/+u7OOIEhfiPcUBfip8TRtfNTWpQfZGkTTr3C57Fviu9vgO3RoAhpQ7kN3rjTLNXg8kZFcGeZ4AlM4Vf4/JxmyboQ6CQrcNISsFkAciBDLQUkp/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sg6Uucqt; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sg6Uucqt"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-43d7e23defbso783738f8f.0
        for <devicetree@vger.kernel.org>; Sun, 17 May 2026 16:41:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779061290; x=1779666090; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gAFVp0sa+jSBvMKIktj8nBPRABJR9ywpSmKS0ZE52SQ=;
        b=sg6UucqtpkMltwvAK0ZfwbOkolWLio4xJER8tx5J8XDiG9PwSfvICohMjeKHIVUUVn
         8RRwQtIahmUnB5IvqhW77pkzMxcKiSdNc0osLE+3hspCR3v9Xyp9gVcvBAUTVowZJMH1
         JECwGE3YObb4NmRQvGZ4lGThZFlcTxfosQKvs3CgWW7b7IcR5MelYipjeU1bchk2B19m
         0Owsl3Ugr3in/U+lGYHQ3dLUpW1ziQzSX8M+qz+eOROfeppPdgLMgbTc41QCyHL9/bfM
         558LgsziIXYPaxUSF7HOz6yRrp9XJGm+Jv2SnNytoFE743bCpUyzC3aF1NsqmSeWIrHR
         1Zng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779061290; x=1779666090;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gAFVp0sa+jSBvMKIktj8nBPRABJR9ywpSmKS0ZE52SQ=;
        b=Z6PRGMTZziMJ9b4hmPZvjxXndwfF0EvHxXcIanQg94gFM8YDwUlspJFx4N/U8hhkaD
         3Blgyy9FltSAqAPJ1ynKGlHxkOzR+l28a64OhjxmqpqxbuoKQZcpP2HR29d/KXp2Jgox
         POXqWYXW523OaMchRoF8GoYUDq4VLudXRdR4GyvLWL0NGdyqYjvaPv5Ir2uwIoKRu3O6
         itCIighs7JTfdLxniQg1DYeyVpbbxsuxrkdKP7nUnPfyOjFE/sv6hb86hTxsTwwTS7H1
         kvukNi/oMt5Qk2AzNO1/+YxBr7gSYSY8TX8fBDkv6jXyJBo01y2DKhTzvOFJmja57rFd
         FIYQ==
X-Forwarded-Encrypted: i=1; AFNElJ+6/nofTyzBDPbbU7xf3qvE89m0nR48Y7yg+9/Lh2SOXlto5LPEI/b5A2WJB4kjRDoZXAuGnljmEkXa@vger.kernel.org
X-Gm-Message-State: AOJu0YxOF7SE/+aONVxbehMLc42vBWWmwJzZOzZCnVG5SVcDyEtCzta3
	im1w2OC61LnrFka940hmBz8zDGzfVtx9RB5FeK7rEn9viEHvZAmwZ1VY
X-Gm-Gg: Acq92OGNWZCq0PpganRlWp4gKCxPjIpTonxC8C+qv3Q4XUowvyaBM6AT5hN31npHDTh
	X4RTGE6gqj3a/zI/2O5BLKg178wcZydOmTN3HdWPlZJO7/9RcX63zeqK84L9KEQfNsKR+FhGY8D
	laK3qYDgybuZwN5sTUFX0TUJjaDSZhvoop25rBLO1R8X0jT+P0nwemutvefqxUwP6xKf9FtNYlw
	/4IoFVMmXJm1oFRT+m0OKgovOU76WKBqmcdjVyMB4lpwvdGZqIpE7fMnFomRRw3TaG4a7BpZFBT
	qPoDsAClltlNt2BuC0aSknd9sH92QJPQ8kBpn5/C1W1jtzBI8c47kkCY6taADYQosZXuH+yCtBc
	BuuPZnCjyDGJoo6mm3nHqJ8owojgBIpotM5QiwnzC/lF5xRUDiR+oXv+6e+9EAexVLQIFdL/ftU
	xSmEa0dxGg/7F0zTHdXfS1hdxNUCiLn1gDSukGE+sR8syzKjwW04XpXyJ0MSYMI6FfcHydn/QzM
	2cW4Izvf24=
X-Received: by 2002:a05:6000:2383:b0:43f:dbbf:6d93 with SMTP id ffacd0b85a97d-45e5c5f2032mr18741752f8f.27.1779061289760;
        Sun, 17 May 2026 16:41:29 -0700 (PDT)
Received: from localhost.localdomain (72.92.4.85.dynamic.cust.swisscom.net. [85.4.92.72])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45da15a562dsm32845129f8f.33.2026.05.17.16.41.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 May 2026 16:41:29 -0700 (PDT)
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: linux-sunxi@lists.linux.dev
Cc: Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Andre Przywara <andre.przywara@arm.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 5/5] arm64: defconfig: Enable Allwinner LRADC input driver
Date: Mon, 18 May 2026 01:41:31 +0200
Message-ID: <20260517234134.2737320-6-alexander.sverdlin@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260517234134.2737320-1-alexander.sverdlin@gmail.com>
References: <20260517234134.2737320-1-alexander.sverdlin@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Enable Allwinner LRADC input driver as module to support buttons on Baijie
HelperBoard A133.

Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 094bb9cd8764..570e84674029 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -524,6 +524,7 @@ CONFIG_KEYBOARD_GPIO=y
 CONFIG_KEYBOARD_GPIO_POLLED=m
 CONFIG_KEYBOARD_SNVS_PWRKEY=m
 CONFIG_KEYBOARD_IMX_SC_KEY=m
+CONFIG_KEYBOARD_SUN4I_LRADC=m
 CONFIG_KEYBOARD_CROS_EC=y
 CONFIG_KEYBOARD_MTK_PMIC=m
 CONFIG_MOUSE_ELAN_I2C=m
-- 
2.54.0

