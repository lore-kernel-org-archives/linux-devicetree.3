Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44706511216
	for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 10:28:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790677753; cv=none; b=rQPK/EA+JqIhaPDCHefNlRc9GKT37j98RMyhVZXauqoBlpyYrtlLkR10VSUr5pWQuL2g+CdHvgYfPBmlRdWJSRAg4vqSmiYbAWlVPaEls+Y57AqrF1d7vTaq3MaMZGJ2i0zeuBczEIN2V7euMFqH7oGzKPLHXwEKsSnkBrr4UNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790677753; c=relaxed/simple;
	bh=q4j4QY4leyzrLjrQxisvqoEVE4/IisdbZD2H5tvHyPE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ud8EtHS6f9DqwJTcLW1D9b+LU1A6aK04+g06gZmv4pEMdG2eXJWkcxuR1iogFrpvRB6QZG0XjMVTl+1Ge8QKngsrDU8KItSpgxOnEnUbRf4chTgrr7bm00P2T9G4lFtGLNd4dWDrPt3wGacsTpMVQBA6Tr7N/W8CdHh66NjszeQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net; spf=pass smtp.mailfrom=flipper.net; dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.b=Q2a3ivIM; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flipper.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.b="Q2a3ivIM"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e6b885ef8so22765265e9.1
        for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 03:28:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1790677726; x=1791282526; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BSZ/gXDOHxG9VvtIRs2yHB3ZSsRLqGiGUtuNcgzCuxo=;
        b=Q2a3ivIMoZrznwZy9Bh7WR0k/BanALvuhYpuIAfk5wrx+NMpP5SiRumVvuddrSGqUG
         da/uXnMT1xpxb0s+KZvaEf8IrNV1czrNGfAsELSAOOEOLkdYpaoNS6Y3mnoQuTtvEmDW
         xplwj46i2abbP48S1HscYl/2qlK0hmQXXES3Xh1bWUxZUvHQGRrbBGPtAnwUfGDQv3Wa
         HwLYFw5hzi8sm4Acwvu8/tb8stFraFdk/YjQeDH6oJyEA8VgmTv1gGgZfsVg7YrqDOnA
         cX+yFyJKpEUOOD+JdtVamx1B+oC05BhL7l1X9hCDJW+FsUPYUG4HVoz/Y8JfVOCVzH8K
         8wxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790677726; x=1791282526;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BSZ/gXDOHxG9VvtIRs2yHB3ZSsRLqGiGUtuNcgzCuxo=;
        b=YrKMDxaO1hnMfNOij1EY3MQnodU3gcoZy4Fy/lcz8ntyLXmqM30+YduPof4ZbOlaQU
         q9Z/5d8o4t+n1/+Dke0Zw0lMPdSggSThXtTnT9yg9+oisC0SF8AwYhjn4IfogaGaiSOx
         8A7bug2czOtOvYl/parNV9s1qxLDIQAl6fDH4b8kbWr3W3tdFdLy8FYi2XtLMG/IXSMa
         3drWM2nT42/IHjl1EJh2m5eiEfd89ChkZ5P9h+C+OiujxB8mP4q77Yh1X0l6Kbf71ND8
         tGhDUbBR8tKhTDMsEDzMsveKhBVTek0ME/5Updf3elnbdM7hPY6v3USH8ZQm4b1C2i48
         FMZw==
X-Forwarded-Encrypted: i=1; AKwUvBwKCENuZvgfZAccW157ZtHxWBf5mQFsKwp1qJ8i5qarfAJU0NNL6+AT7bzFaVI50wPMzrraJQFjZwSW@vger.kernel.org
X-Gm-Message-State: AFuF++nc1Dq0Fe2znqaCGzoMF3eDh00M/tylAvtjOeA/fx3M61b769RJ
	WXfOx+GbtvetJBxn7MOSyN2KBepzmSRMYpHcMBuomaWSNKYZamAGmOnt2h0UbX2EWco=
X-Gm-Gg: AYBFou15dRXBTn9VQqhbYAuhpLDtXGqFAY3H6TE6e47YFKPtIwRSryF+aAETXJgp8II
	Bio+iyo4UJbR9ot0lbcN7jT2MIVGwwD+l6xaDkM7N9yQ3ApwXEldqhGkyOKJgE+EuGgQhmgYNh0
	EJJeymGjQLDGuuOCZgnNge81Bi1aEVaPs29OE2Ay4kkonLZ5UkNh6ZARCwy/HxQlq0ooFK2OBPk
	AH9IwyZhElOdejU8ItmDpAcH67yul5GnlkaZbibPb39JL6AAfNl1DPna78WdFGqu8ZzF93q3wjS
	z7JuM5+7Ncl3/w6WiSPoW9q0yOK2uYDJlhrsqucLYfZxE9ICXjfIJvY1S3FZNJqfYVTyNUX3QJ5
	mT00WYUCMlRK87Bo16nU9JpVOziTonBklpbfwASp7LWWD2PGUIWNxu432ONSLlzVP3n0hTeZcmx
	asmGWOrFtS4kfRV0lcPGcIEUk4scVWeKnMjkw2t1DjUmjx3HfFCmw73KZs+yUVhMr6p45mC5Mtr
	/0yiia/LV4yfoUDdA==
X-Received: by 2002:a05:600c:a08:b0:49e:73e7:888c with SMTP id 5b1f17b1804b1-49fe66c8a3emr289485105e9.4.1790677716604;
        Tue, 29 Sep 2026 03:28:36 -0700 (PDT)
Received: from alchark-surface.localdomain ([5.194.93.183])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a00cfb479asm66579305e9.15.2026.09.29.03.28.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 03:28:36 -0700 (PDT)
From: Alexey Charkov <alchark@flipper.net>
Date: Tue, 29 Sep 2026 14:28:18 +0400
Subject: [PATCH v2 1/5] dt-bindings: soc: rockchip: add boot ROM download
 boot mode
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260929-b4-rk3576-reboot-mode-v2-1-5a34ca72065a@flipper.net>
References: <20260929-b4-rk3576-reboot-mode-v2-0-5a34ca72065a@flipper.net>
In-Reply-To: <20260929-b4-rk3576-reboot-mode-v2-0-5a34ca72065a@flipper.net>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Sebastian Reichel <sre@kernel.org>
Cc: Alexey Charkov <alchark@flipper.net>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
 Shawn Lin <shawn.lin@rock-chips.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=964; i=alchark@flipper.net;
 h=from:subject:message-id; bh=q4j4QY4leyzrLjrQxisvqoEVE4/IisdbZD2H5tvHyPE=;
 b=owGbwMvMwCW2adGNfoHIK0sZT6slMWTtnnSxWWD91pz53CYh8tEJyStOv7gqYVyyf5PzVjlrr
 Xs+ly83dUxkYRDjYrAUU2SZ+22J7VQjvlm7PDy+wsxhZQIZIi3SwAAELAx8uYl5pUY6Rnqm2oZ6
 hkY6xjpGDFycAjDV9v8YGQ4ZW0svarESvfuy0Ulrrcjv1b93zzsscyboaOf9B4WPDkgw/LP7XFI
 U0rP8gUaIUFOywwwtRY/Ev3F/tySWzU5YpfeglBkA
X-Developer-Key: i=alchark@flipper.net; a=openpgp;
 fpr=9DF6A43D95320E9ABA4848F5B2A2D88F1059D4A5

Rockchip boot ROMs enter USB download mode, commonly known as maskrom,
when they find 0xef08a53c in the register they take the boot mode from.
Add the magic under the name U-Boot already uses for it, so that boards
able to request it can do so symbolically.

Tested-by: Shawn Lin <shawn.lin@rock-chips.com>
Signed-off-by: Alexey Charkov <alchark@flipper.net>
---
 include/dt-bindings/soc/rockchip,boot-mode.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/dt-bindings/soc/rockchip,boot-mode.h b/include/dt-bindings/soc/rockchip,boot-mode.h
index 4b0914c0989d..88684f4184df 100644
--- a/include/dt-bindings/soc/rockchip,boot-mode.h
+++ b/include/dt-bindings/soc/rockchip,boot-mode.h
@@ -12,5 +12,7 @@
 #define BOOT_RECOVERY		(REBOOT_FLAG + 3)
  /* enter fastboot mode */
 #define BOOT_FASTBOOT		(REBOOT_FLAG + 9)
+/* enter boot ROM usb download (maskrom) mode */
+#define BOOT_BROM_DOWNLOAD	0xEF08A53C
 
 #endif

-- 
2.55.0

