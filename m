Received: from mail-oa1-f54.google.com (mail-oa1-f54.google.com [209.85.160.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA8003D3489
	for <devicetree@vger.kernel.org>; Mon,  8 Jun 2026 17:57:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780941463; cv=none; b=mr17iizt/3aIU+kUYkm1u4C/H8TfGtIKJXsDyeoiTA6XpG/J6W7cnMB31N9vG0vQOLF4GjnXZgLkpgxuEcJodTYPJ3xRNp8nITH6YuN30/w0S7qFRfO4kxHOevzEsfanbDnR5ZPoUqTOZGao1Rsl5tF89ypVJqVVj/HoPdXryyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780941463; c=relaxed/simple;
	bh=dQnacLOtfh1x/EVTAVwP8evevCXXsKE9KJDE9DiR4UA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DgI3O2rSQl3gWnqrWPBVMVc4m0ELiRKMW6+MZFJiCpVF8LV9zcs1DeysWSE4hJrOBnTuzFGCfV6dZhHXosUtk4ajWSEANnL8IyQkyNel/qfeA+cdJ6gW0rqau/MGjAF2jDe+gZudFMC2MhAAzyQ64iaKOoI0/w9rbKoss/C9tF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Xu6hRl32; arc=none smtp.client-ip=209.85.160.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Xu6hRl32"
Received: by mail-oa1-f54.google.com with SMTP id 586e51a60fabf-4414d76270cso2067872fac.1
        for <devicetree@vger.kernel.org>; Mon, 08 Jun 2026 10:57:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780941459; x=1781546259; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kgs1gTYKZ+euqFobW4W1LJ9utvsV9nn5CKlGcDBeRcM=;
        b=Xu6hRl32HrYrIYiKO4nohiM/w33m+hmCW8JwfBm+vPDBre3jhJ8nMDkCsbkYL/Zevz
         ys9YCgAtV2t0n9fG3IsYTrv9AaukouEtIHPW53U+i144qA60NQ/JsSU8BXV52sKDAkQR
         1M2fBvKXxx84WjCHjw9adGV7O5UqP2eJoUhn4FK5j+ZiKXV8IJ0FrgFOZ1SrB8ldEzG/
         X4ocGhgSjYrR5aH8eTzAOHNeJNQS48r27MRgkfLLJjfu7tYJi+Mj98uQM9+fP7dF6uCb
         q0RBjdrOtBeXoL4dUVITCcPZWO0aVRO5vswtBPsv7xX92gtLKUDTVRKqdBfkJ6Kb7aFn
         S6LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780941459; x=1781546259;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kgs1gTYKZ+euqFobW4W1LJ9utvsV9nn5CKlGcDBeRcM=;
        b=jYX7pwJkE7vckMXlK3RVDEM46JE6vX7+rE6V+9b+BxcJyshWi3JHGJoK0WhPzRDDNj
         FX0R1QAxf/TNQx72Sa/NfQCC3dglZnqQrkGy9tnFudcZxwrmVBeuPDLAD3DTev+qBy4u
         bzYXums+TapIBXSp6BSVyks1kkwolLma7zN0QHKuttTni/sfO8qQ5LiPJL4r1jzHZP/N
         S7kBYN9XAJ31U1LX5O35kLAxS0+JpOYY90B7o84uSzUumaabyWeZ8NK8kcPaUI+swOI/
         FW2IEHCPB6TlVLDOE8ch8sw51NOJOlm0oVy6yePsKTt+tvcEZm2hixBHzVAaFuhKPo0d
         H1Dw==
X-Gm-Message-State: AOJu0YyTtQKdprHKzFv4eSQaVUuTv+XMQMTaVx3YYDFj7oaEPRbHamZX
	2YWSBOhIvkeoOBsz7TQ2P4IIQhiqHQD9FVhF+u+zaiQvl2cAFpoiZPi/
X-Gm-Gg: Acq92OF9iQM1r6hwCnVeehMPi0hGl1CfnceZ5PuYADtxe02cgoSrdhGQbyb+wguezS2
	d4in6ANPxq0NWX/wzxmy8PJ0dOOVBb+WaM/kJpjIOEBoDMk8XxkXTQ1mYz/sMllKCpQIfoUGR6T
	DIQxX9oqIROTzmBK2vb0gX8CeBCJWC6U65qUuH+arYBSyZUB37S5y98UxgLz3AlraC1em7Cini2
	2syqVWTawfC6n7EzYUpXS4IgLDMN/fY/3a75LXjUes+QlNbzrKhQfTnLa9DIMhbYofaqX8fgD7R
	MVzXAWBq6TyIZVCCxVzYrzKbU3GX82HT/0a3/yEY0s4vQfZYcBGI2QK+75D2xRJmEPl5WDlI5xQ
	XQyJ3XvpvmnOtOGuhrCdGK1eT1HBNUpax7a4CbdUZbjr7xsZZBJv1NtyfzT4UXFr2J3V1HIqJ8c
	qC2fSvNn07LBJr0pl189WNVUdBhrmNTaFolQZqkqT4UA==
X-Received: by 2002:a05:6871:6c0a:b0:430:3591:26c4 with SMTP id 586e51a60fabf-4413d6a1654mr9148000fac.7.1780941458671;
        Mon, 08 Jun 2026 10:57:38 -0700 (PDT)
Received: from localhost.localdomain ([2600:1700:fb0:1bc0::54])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-440d8297395sm15214316fac.11.2026.06.08.10.57.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 10:57:37 -0700 (PDT)
From: Chris Morgan <macroalpha82@gmail.com>
To: linux-rockchip@lists.infradead.org
Cc: devicetree@vger.kernel.org,
	xsf@rock-chips.com,
	sre@kernel.org,
	simona@ffwll.ch,
	airlied@gmail.com,
	tzimmermann@suse.de,
	mripard@kernel.org,
	maarten.lankhorst@linux.intel.com,
	jesszhan0024@gmail.com,
	neil.armstrong@linaro.org,
	heiko@sntech.de,
	conor+dt@kernel.org,
	krzk+dt@kernel.org,
	robh@kernel.org,
	Chris Morgan <macromorgan@hotmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH V6 5/6] dt-bindings: arm: rockchip: Add Anbernic RG Vita-Pro
Date: Mon,  8 Jun 2026 12:55:20 -0500
Message-ID: <20260608175521.67449-6-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260608175521.67449-1-macroalpha82@gmail.com>
References: <20260608175521.67449-1-macroalpha82@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Chris Morgan <macromorgan@hotmail.com>

Add compatible string for the Anbernic RG Vita-Pro.

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/rockchip.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Documentation/devicetree/bindings/arm/rockchip.yaml
index 1a9dde18626d..b8babe9d3a26 100644
--- a/Documentation/devicetree/bindings/arm/rockchip.yaml
+++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
@@ -66,6 +66,12 @@ properties:
               - anbernic,rg-ds
           - const: rockchip,rk3568
 
+      - description: Anbernic RK3576 Handheld Gaming Console
+        items:
+          - enum:
+              - anbernic,rg-vita-pro
+          - const: rockchip,rk3576
+
       - description: Ariaboard Photonicat
         items:
           - const: ariaboard,photonicat
-- 
2.43.0

