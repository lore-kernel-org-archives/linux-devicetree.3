Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B773446073
	for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 08:40:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792140061; cv=none; b=YgKAfa/g0A/9nZS2iyl7B788WkW2dOjck1DZqD+6KmC4yzO1pPONJJh7Mes0/KVTWH4P/VXURuAq3501Ow3m4U8pZgTg1MyJxZgUdKJ+4iKN0iOhfdoX6jVIgs3resOWTYA5HIqb7rD+1QPYFcBsh3fPeLUjYwmri7QDQ65sOws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792140061; c=relaxed/simple;
	bh=PjYj5OcW4JfpfG4g+XhgfGTd7DVPkQ8LFPMLoMqOLz0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AwNSibIi68Pnecp/pUVF6U9SPsrf0AyjCrE7U1vmLLKIsdjIrTJKI6sOvd2nkya93Cp51oPjblEYY9RBYYpSrH5c0B9amamWk+Wa/ViMmN5+TYg7J2D8RyVBTJih2o1lpVlmUR5y7r6kdPb/W9RQA30WmiOUjMLv8e3yx5aPRrA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V2K8as8S; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V2K8as8S"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-48afbd2c386so3656995f8f.3
        for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 01:40:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792140057; x=1792744857; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=m37LH0K2JtdkMATWovRMsFTjhjXw4zu/xnrVqxt3zQA=;
        b=V2K8as8SjLWigx8l6UbkXXojJ2gH/m1fWlNAMrWMIR/3yEgwh2OsNVgJBHe4A890Bs
         FYBnyBHkNgUi7V37W+tcevvtT1ylogeW0b80wJbJ96jNmRWhQEgyMRhuFm9rreUc734T
         XXo6DmzGmeQOxnpX25MVKTfiWnL8eOjGwOehzTtcSE5Li93+cYDeO/HMpI++bv8jmUGr
         gQ66fX3gZx2T/3AbZa93jZQIggeEQvnWZn3PoQ5UmTGVp717B0TWhwAkgF9FvmPcb5M5
         QJTnkPj1FBm4QZVuPgaYXXqz7EYtm8bhiPlqNTENHCpCPDZArr0E1LIuoaPyEXwsbb0S
         yRzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792140057; x=1792744857;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=m37LH0K2JtdkMATWovRMsFTjhjXw4zu/xnrVqxt3zQA=;
        b=c2Zih/2NOX4zqOWzD0QMHNBBOP07Dzhwh/FzoIqTwEU2+/p3YCzDSgDFOWMkp+QRHV
         GuCS7Jkn2qF/Z27WiKbc62X+3FbpQtdsqr4KfD3HIN5DrwP44tkjWPEFm7wdqrXocVYO
         Mbm0mSLeEcQa8ZISjz82VymqvkRQcRv/risSDw/QfrPFzV74lAq/jXkfGcQgNH/5CkAN
         1lp0wgp86L37Qcd6JmFJeVyZjZkmMBVd0L1h/zG1necbARqS6qD4YdUTo2/v54szzRS8
         7yv/yhm/qA5u8LV/W1gFRH18Czh1W/U1Nd08nVgND/muV/gNRe6DM6Gx4a/tuXPybNty
         IZuQ==
X-Forwarded-Encrypted: i=1; AKwUvBwlufwZRcEPBomzR/DKacC7qon6uhxehOukJr5Sj9evIRFDm3BbI27/rxTo5lLEc/FiNtizgjZsSRCd@vger.kernel.org
X-Gm-Message-State: AFq9FYJO2LvrBE6F3FYDqSLt3CHibW5XlwPD89Eo6Op5Rug4UwaiFoSv
	st9cz9J8ajh+s+MxgY4lWycQaSM3m4VY4CrCvQRy5i/vKn70u6et2lzU
X-Gm-Gg: AYBFou2G8l6DHbxaIHoVFEVppk+w/Pnmu5UmNBvI5uUYgHJsrWmYqe8m7nmJaxCxpLH
	Ca+jsVhO9+bIIoQVqMdfS62VWzuLVgADTjEjNOsLzb9Qa6Q4kdu6hzoFTnsq6iae5MnN+nDIG5t
	Z7qjeHdYLYrqEag+d+NyCESBsnIolWiyRiDPnkUGOhohmAwKVxNEeT7VyQ6ykcyGJTwd+fJcHGZ
	fU96oFT2iarPWvTWGH2cOY1GtH31cXfRmxu4TEvOhv9IjXm3hiQsM9kBfS1+QDOXaozswaHcIod
	5/Jh4Xn6GdmAqd57JMR+e6mwS3dEojmvDdMlV3LjBojnIt0B+4KPCwMGwA/kwonR2zJZo/IkzEF
	ABz1yQhQNPfntsvDHucWWS1uLM154LGOYkCjt+wVGFdseTjHLFQv7k9xQOt0XnUQwtzLDblmzqM
	tlG3TE/qCCMlQad6ArQ9wrgxCI+G0fhqY3NYnJgERV9uzVGHDTmgWoDooLhRh2/RWEJVLboqURL
	YxkhoWx3Z08r8XXQZj22xiTLcdLMyM+frRp3e/RAFfUBnKnnt0tcg3ceaYKpMzharMZI13gCprl
	fxnBHmhMbQDYQRsHFY01Yg==
X-Received: by 2002:a05:6000:2912:b0:48b:5e2:52dd with SMTP id ffacd0b85a97d-48dbace9d5cmr40663215f8f.11.1792140057193;
        Fri, 16 Oct 2026 01:40:57 -0700 (PDT)
Received: from Lord-Beerus.station ([93.66.71.207])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd5033a2sm3715233f8f.45.2026.10.16.01.40.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 01:40:55 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: Frank Li <Frank.Li@nxp.com>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Luan Rafael Carneiro <luan.r@variscite.com>
Subject: [PATCH v1 2/2] arm64: dts: imx8mm-var-som: Enable WM8904 DMIC input
Date: Fri, 16 Oct 2026 10:40:11 +0200
Message-ID: <9c0e289ab226609d99bee1bff4f175ff9796d8c8.1792139809.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1792139809.git.stefano.r@variscite.com>
References: <cover.1792139809.git.stefano.r@variscite.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Radaelli <stefano.r@variscite.com>

The digital microphone data line is connected to the WM8904 IN1L pin,
but this connection is not described in the device tree.

Configure IN1L as DMICDAT1 to enable the digital microphone capture
path.

Co-developed-by: Luan Rafael Carneiro <luan.r@variscite.com>
Signed-off-by: Luan Rafael Carneiro <luan.r@variscite.com>
Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
 arch/arm64/boot/dts/freescale/imx8mm-var-som.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm-var-som.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-var-som.dtsi
index d05b1ab17fed..514cc568fb71 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-var-som.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mm-var-som.dtsi
@@ -348,6 +348,8 @@ wm8904: codec@1a {
 				   /bits/ 16 <0x04af 0x324b 0x0010 0x050e>;
 		/* GPIO1 = DMIC_CLK, don't touch others */
 		wlf,gpio-cfg = <0x0018>, <0xffff>, <0xffff>, <0xffff>;
+		/* DMIC is connected to IN1L */
+		wlf,in1l-as-dmicdat1;
 	};
 };
 
-- 
2.47.3

