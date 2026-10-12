Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFDAE478E20
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 10:09:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791799795; cv=none; b=NhfbG/wdh1JZOmmdMjXMTKmJOaSTFQztMI9QXKeapi4YtOKJDHYl3CTxftRhkPT7hp4aTeYjLSa897DClTvNxl75VfXBJj8lXlqSgiRJPPo2p9RHwY0MlM4JU3iuaSKxHetDWIzPlyGgEKL9DHa7Q41KsQwEtH0TtQdJxEiJB+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791799795; c=relaxed/simple;
	bh=rF6rQofzYRml/5wBil+Xn0JDP3ogfFhOy5WOAz38e3c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Mo5wRcIOdAhpkZTe/o8PA2cMUb/gh8a1emS88f47psw40+nUPIOdEJN6cE2HjyrZ/Yx5ETuPZWRFPXEryxvuaLJ8GgqZgZg3NNWzKqDeR81u/XbByF9PSXXvB1bzlntQlFgYZmXv2twqqEFcK1JBq3896lZfqfrAE4BFXyHYfJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f+nvihru; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f+nvihru"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-48b0ef9c76eso1396667f8f.0
        for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 03:09:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791799781; x=1792404581; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=W/C9tWh0XAUTo7k5jKf93sgNA+uT1YvSZ7hoHgaGa7c=;
        b=f+nvihruUVejM7Uhc3/2JbQjBD21Nf0Hcrw93+oX3Lmmg24yvmklDr7m4mVNusixel
         ui2oNSb4XQ6Ze6W0qDFk2xaIHdZBD8jwa861PcRN+KVryLmrvVg+hP9rX5aybX5WNLaG
         3LXz1oPxo1aaxbG//YilwZ/EneGRt22rGnPrL8Vd6JkX2Q/cDCgCx4+wzTvdizce1f3l
         t66wqeeTXefceKRRZwYZv+FpIjdTHxXlMLwlAnnP97gOW5JGzTVXHnI5sGJK3y1zejML
         saFHkUafDBUGjWEy0a7c41mK0AlUpIKOyTEH7a4srtiedGevmF/66PMFPjEhKDhPsnPa
         ATbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791799781; x=1792404581;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=W/C9tWh0XAUTo7k5jKf93sgNA+uT1YvSZ7hoHgaGa7c=;
        b=TjaGh0HWVDlN7XkaeYnsvV6W8YM9Mbu6jXOCkScPCskZvi69+5fw+0tIL/Apjk35E8
         jZNL8DuBCknc+vh7gc2qC7oK8MRiN7QprvUoOmdIr0w5Xmzgmf4WpovIYuGTl1/qcgLl
         7WG6EQSK1zvLLltQ46pqFCY94PO6kLLV4nt4olpd+q66zB5zvC2x8pI/nzpPyN8Nh05B
         RuO9kPKRip8U7bCWODZcjKnL5sVWqKNbeqUG+wFEUxCxKyQqXF07/+AHHJydz/qLUbPj
         rx3OWTVhzuPtWI0CF/uObGBkrJZWGh1Q9Z+BuR/nRGlklGyPf+B3c8QaHUyyalW2inHN
         4kTQ==
X-Forwarded-Encrypted: i=1; AKwUvBzENssCBouUHpdOqEHUbkB4dmRdGCaMZCU8iDYel6Q4sfKwK0+W2lji0m1vm2ZVqOIxNifoD2i6iAgI@vger.kernel.org
X-Gm-Message-State: AFq9FYLFt6llQCSm+ilZb0ebUqwE5ODb95ophPpldl+3uWFweuLZUClR
	Hq22/iZ9W6zEfZn1ycXK2FDogs2UhJF2HapTZ3+A8H3gMa68aFlWtFW2
X-Gm-Gg: AYBFou39Ug8OfHTC1AUUtw2nkJtVSxVdCbBFxSwQ0NzYDfQD2mok4bvnuuD9I21SARu
	7eKXXHnPb90I4twL5WtHSzi4VWhQQaeORLoFq4JUrqxix4UR+LxRFUxg+fVHIQWA6wvfpBo3M87
	IdJMfptp+q3jN06EMs6sHwao1svg0bO0k+4aUVJ8qWqIf0Jp844rxLLT0bBZZnqYJ05+EQJ3WIY
	n5AQEL/EjvW+i0LXA6JHLF69y+iH0UGY9QSULh+unX/A2oyb4dcB1piMWb66LX8EveLvpR6LUne
	NKjQDd7SW/xpWdjbokIM/dLzMDRF3dPTU6v5084/VTVp25Ihlj3b8aTr8846Mk3bvd6HmdSoPUk
	urQrzlf0U0unzyaYGIERViW15kVeZ/281/2nSu41qW6DBhRgNTOY0RVktDgCdA3cAQRrMdqIZLm
	WGLDg7Ks8pJVE/KHh0KLKNfBrNycYCg6OaV3PVQJ9G+SZBUZmOirM4AFlXqSmzbI13p7eNW3ZZT
	mo52Nv/BrQ/tp42YL8tg9lq+82Zrt1n
X-Received: by 2002:a05:600c:46d1:b0:4a1:7d56:663b with SMTP id 5b1f17b1804b1-4a18e4a7844mr180897045e9.24.1791799780438;
        Mon, 12 Oct 2026 03:09:40 -0700 (PDT)
Received: from debian (ip-78-137-176-146.broadband.digiweb.ie. [78.137.176.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a192d3efb6sm166229885e9.1.2026.10.12.03.09.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 03:09:39 -0700 (PDT)
From: Pablo Mazzini <pmazzini@gmail.com>
To: Andi Shyti <andi.shyti@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Gregory CLEMENT <gregory.clement@bootlin.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>
Cc: Pablo Mazzini <pmazzini@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Andre Przywara <andre.przywara@arm.com>,
	devicetree@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 07/11] dt-bindings: i2c: mv64xxx: add Allwinner B288
Date: Mon, 12 Oct 2026 11:08:12 +0100
Message-ID: <20261012100816.331033-8-pmazzini@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261012100816.331033-1-pmazzini@gmail.com>
References: <20261012100816.331033-1-pmazzini@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The B288 controller follows the existing Allwinner variant.

Signed-off-by: Pablo Mazzini <pmazzini@gmail.com>
Acked-by: Andi Shyti <andi.shyti@kernel.org>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/i2c/marvell,mv64xxx-i2c.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/i2c/marvell,mv64xxx-i2c.yaml b/Documentation/devicetree/bindings/i2c/marvell,mv64xxx-i2c.yaml
index c4efcef59133..d3b6f7668621 100644
--- a/Documentation/devicetree/bindings/i2c/marvell,mv64xxx-i2c.yaml
+++ b/Documentation/devicetree/bindings/i2c/marvell,mv64xxx-i2c.yaml
@@ -21,6 +21,7 @@ properties:
           - enum:
               - allwinner,suniv-f1c100s-i2c
               - allwinner,sun8i-a23-i2c
+              - allwinner,sun8i-b288-i2c
               - allwinner,sun8i-a83t-i2c
               - allwinner,sun8i-v536-i2c
               - allwinner,sun50i-a64-i2c
-- 
2.52.0

