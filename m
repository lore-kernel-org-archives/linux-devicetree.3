Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57E144A9D7C
	for <devicetree@vger.kernel.org>; Sat, 10 Oct 2026 13:00:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791637246; cv=none; b=ls+XqSpwmLd7S9iTCW3g0W6MTSHTUQQAKtTfvZe/LBQ6TQExgq5Frh+7Fup5rjjFhxvOz2D/gMlt4Iaz9Ept/P8o8DMcxFJ6eXfj2zoXYasgRBuFsmJfRRBmnesJLaU2oFWO8+vhf/xZgOICsmGitOAnfLKY/X/vDuXgusLrlBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791637246; c=relaxed/simple;
	bh=l0IL040uUXd6HnZJzpcP07Y63JwiJBJhiCQQdbR6inU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KffN8MhuPzLac/7CRQHviYBnM2TjPY1PHNg2XHnN1yIblyOtWps3ebpqvyJK4kfkfkBRTsL6Rhh6CNw3qPSJhzqu2r1d2jrscXb+9+L+lyPK2rFhRALwf/8vb5LfRR+IhUBbF5HiIEgMnYSnNn4BhL3CbQdQFuRF4Nbx3/NJVis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iSunAND7; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iSunAND7"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-487049569b6so354132f8f.1
        for <devicetree@vger.kernel.org>; Sat, 10 Oct 2026 06:00:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791637239; x=1792242039; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kU0EiRV6t65KITcFfTc2U3VqjgSJJWwOkUyPrJsR+2o=;
        b=iSunAND7RtYtirz8xNVyyXiyIPZic1mOCOKV8tbLfDUCKv+b+xKUWgTNWPGx+0Efx/
         rpQ4A+iitRW3sKuAKquifKUUOEAuKoHdmwqmI4G8A4cbMau33PTbV3b7mkbPg3hYj9Gd
         qMiLpr8nr7+kB+7UYZq/P+EUZ1wqp6yzyCe5xWhOQdeuDrEuThpJ6J/MfjjO7IC2MK/b
         AeH5saSYkFxhGtNoL/bIuRltw+GpVLB2J9A0F2k6vLBIUtkgb3qf7axHVVUqEfenr30r
         JaJHrIx1PS2ebv+1gkVnIn6v6xr0GemKk015yToBX8o2x9lrZYkKTC8Si05nuvCat7Px
         I73A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791637239; x=1792242039;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kU0EiRV6t65KITcFfTc2U3VqjgSJJWwOkUyPrJsR+2o=;
        b=finGglaKuEEoMDwf8EB4pX+KBbKgOpferOMkIeZHE91oGhQ3v1Quz2oQFyBBpNaGo8
         Mk0VmQc1O3SLamjs+gKD6ksiI43wVaUZXsquLSamoc/Ld2McDer0iOi+rNV83Xpl+oGV
         s1nZKy/MfG8buGsbBAaDyW7SPHVAyYQauHK92ErpXpUmeMyHoQnCLIRbK+Wx8M7FR1vP
         dnHczcxMH5nRKxChmDRcO1gF+Fx79CtFCE4ZTfeO9uQ2x+0bH6EkQtorvvE2Ir3+HaJ8
         D4+4dy6UPKvUNPxdi1t831OmpqUr80zKhLOyjb8C7rDzNKtSLAUSZptyeesASBtSoJN0
         ShTg==
X-Gm-Message-State: AFq9FYJavqfUoTUHFPG4BCpprTBLYrQ5jSsyuSGqlq/dnPQx+xASNPe9
	ibF/BTQhZ6H6nlcYkbVUyh4Uvoqv2AvuWRmvYE41DiXKiT44QBjEWYQa
X-Gm-Gg: AYBFou3ypGsGX3s0wx/0XM4I6heHZUfDTAKb6X6X0AJVKp6033alPCivVRNdFqiUEmr
	NoCKBgoiFAAA29ryg1tmFGxmQfntHaQxvhHxvSfLmVcmvQ2bldqLekv1Ypu5EvFoHayZKC+k0Wa
	5AgRTD/gUwXU/HTy0jrqlm/UX8nz7mXtuikViMcozVqgR2JOd0y+SdAbXS8FWKQpmLaxAU0c6Gj
	uy/m699q9IDOxsxngdNt6T3sSz68DjceucQmXB8QUEDt+EskhVwOlDcjslA7tPT60St0B1CGCx4
	kGl5QAg6jv4IETNINgCdAqvYimeEPg6GIVNouGEgkH0PBDN7YwUvuJMeFz4ffEjcE5pd/7WBfiV
	Sp1TOs7HlkeS/DB7TL0uxK2resl5GLNU19bBP4811EsNoAJPz1W7ulX8v8/jVfVoNS35bh++kuF
	aNtOZT8IvarZE5FA9osb4S5hm8jC+pMH0JrsBpO9ATNBL8ZnrT8IU8hehpI1h2S9aAb7mLRxuNA
	4qLPa9UHxjq7/WgJBqb1Nc9qCha2UaHeU+hsO38h8wvN9H+4RhOZ2GNid0aoACGX0xxcbAFrZBI
	JhR+gjK7+1KKOVsNBKhijuWnL6n9Y35E9FUwsZyXv7y/ST8iUqpS+946vXHjnw==
X-Received: by 2002:a05:600c:8117:b0:4a1:6d21:93c1 with SMTP id 5b1f17b1804b1-4a18e4b1613mr85591995e9.16.1791637239431;
        Sat, 10 Oct 2026 06:00:39 -0700 (PDT)
Received: from navid-pc ([2a01:4b00:a856:6220::a11])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a190c49d5csm162309975e9.3.2026.10.10.06.00.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 06:00:38 -0700 (PDT)
From: Navid Ghahremani <ghahramani.navid@gmail.com>
To: linux-arm-kernel@lists.infradead.org
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	arnd@arndb.de,
	linux@armlinux.org.uk,
	stefandoesinger@gmail.com,
	robh@kernel.org,
	krzk@kernel.org,
	Navid Ghahremani <ghahramani.navid@gmail.com>
Subject: [PATCH 10/24] dt-bindings: pinctrl: pinctrl-single: Add ZTE ZX279128S pin mux
Date: Sat, 10 Oct 2026 13:59:48 +0100
Message-ID: <20261010130024.177503-11-ghahramani.navid@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261010130024.177503-1-ghahramani.navid@gmail.com>
References: <20261010130024.177503-1-ghahramani.navid@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use pinctrl-single for the verified PCIe and external-PHY bit selections
without guessing the unverified field layout.

Assisted-by: LLM
Signed-off-by: Navid Ghahremani <ghahramani.navid@gmail.com>
---
 Documentation/devicetree/bindings/pinctrl/pinctrl-single.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/pinctrl-single.yaml b/Documentation/devicetree/bindings/pinctrl/pinctrl-single.yaml
index afe7329a1d..bd57b41f1e 100644
--- a/Documentation/devicetree/bindings/pinctrl/pinctrl-single.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/pinctrl-single.yaml
@@ -33,6 +33,7 @@ properties:
               - ti,omap4-padconf
               - ti,omap5-padconf
               - ti,j7200-padconf
+              - zte,zx279128s-pinmux
           - const: pinctrl-single
       - items:
           - enum:
-- 
2.55.0

