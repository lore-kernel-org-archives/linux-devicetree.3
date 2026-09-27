Received: from mail-wr2-f35.google.com (mail-wr2-f35.google.com [74.125.225.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 379CE395ACC
	for <devicetree@vger.kernel.org>; Sun, 27 Sep 2026 15:12:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790521957; cv=none; b=t/Y7RvfG8ZpQyP1vqZycngHCaM+uTebyUlpFhGg0+QFEfQenDSH7ceI8PMyEuuY0SLoykye9PVYn1L4W4UaruicdT0nMHt2lzhX4C15kktFdcqWv1BryF5NgAUEGU44szfQkSwL5T3fgypnTNzwOW1oBOrYQRN3GQuLTLjqRO0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790521957; c=relaxed/simple;
	bh=HqfZG9G5ZIenBJJAaY9rfjLXNR0FjaP1nUhMOUSdumE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UT4iTwnf5p/MY9yewydmW8YjI9Bx+v/1MlR2xtJ13jjxaNylBk/RFOXSxhqZzUkHxK1Ig+ImuOvjBE3Nt+eudDEl+1hpP1SC0H7yGkWi21tpvS8PYu6LzVLXFX3coOyBpzIXp+Z7hbYxagymd0cSuAjudHWHGnK7ggZrzBkHvSo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=llqE6Rlb; arc=none smtp.client-ip=74.125.225.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="llqE6Rlb"
Received: by mail-wr2-f35.google.com with SMTP id ffacd0b85a97d-488780459e2so2273445f8f.2
        for <devicetree@vger.kernel.org>; Sun, 27 Sep 2026 08:12:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790521954; x=1791126754; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gSdVTPRqn06pkAsO84XJHQb2v3v0xthABnxiNhSpNuo=;
        b=llqE6RlbkzuEpo7WNXxH20ewiDUC2i/UO2g0GqlVWEMbVw7siE9Aq+eaeWAjeGm7hZ
         ua7ZiIiXSO/pwtBnNpcNRSqPBP6gTdAIMemYHHvc2Lff5JjfLbZRoZsGSDePREgmy5dl
         HbBVaHqLSNQWybtQqGeSpG/TJAls6YSi6H+Vybbg2fijnbXWp2q99QycaHfYoowxNUea
         +sqGOMyfwFQOEk5hrZtg4sU1vPLzSXfCyR4b01392wmM+xrnfU/BrOtEYs9N1mxRl/Cm
         uNdkth1q2ix1c407J6sb68oDSH4ryVZlzzk3OjWJUq+tZuoaSOJadg0OlMg9JCDpEyuW
         HeNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790521954; x=1791126754;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gSdVTPRqn06pkAsO84XJHQb2v3v0xthABnxiNhSpNuo=;
        b=wOfcb/HfOhUk9Z76rXHNT5ht+kzbD9F7Icg4uZjPgLeIfbuiMJvJphwUlOQBEzGDDc
         z+dWgTvRjunbGOqvUICxSSjyod5YUebAGhAQxtyOEAISLOqxGD9zAJZs7UdVe0VEJnDj
         VaJTPtblPLAtyMvj/rOm/WL/DugM++O+PNexdFUht6CVjaoe9Z3/aaEemoush9FwXFON
         MTIwtyZyxOwq18sPwjEBWrxAr+RVi9sw5mQrLVtrl8BGbAN8a+xZdbAD+QTkvCQyryT9
         wXfKy1fmnC7kiyU/bxwqBvLL/vnqmUASpRPc/ewRPIJ41gF0QXfWB3+05WYOaMsGVYfJ
         uNyw==
X-Forwarded-Encrypted: i=1; AKwUvBw/KqUFU7PtuwMFKqywrz9cnii3IEffLLKZWrNozuwpnCeo60avgvqomyjfj516csg3b3VR57hgpVbb@vger.kernel.org
X-Gm-Message-State: AFq9FYJ6gNooQOV49/b+OX4uM47p+I4ttgioqcOpiFhrSjW57B27iLqX
	jkNG823KgfCy/C8TU0jAyCXp9tRtg0lbp/NAZFt23slKGkbVg2l1971I
X-Gm-Gg: AYBFou2ovTUDOhbob+cdvtjVKB5+wgtPV0R+q9hgAz5LrLY0U1VyfFj3SqZZ/Kvnhz2
	TtQxeYc8JlGJCBrIVwrRN0mUe8qd5g1obQpQn8LiMaq+W+1zGIcZz8wTJewe6C90wiBkUvcC1H1
	U1eXbSGkycjUSeJnvjXy1/BECFFGRAuqWqZkleotzCKo6EGSI4bF+3ZQDCj4Glb708SjRZyK+JG
	fC0kgicdgEi18nSMOtiCKHLg44mRLpXxRS7QJEAbOSuKeoteAoZUxWWxcTrAbVHhRvVzZlWupos
	kJvFUjEEd9euxQSqBBhRNpC2q4GmkxGhOxBp9oIHMqtFhAkGsZ9B1MIZePI+wsTjdlXG9dLxkIw
	RTO1QaD04NPNBZlF9Ry6Y+wpMePMAQXIN09mKQS/mN5QkCD5vXiPIhaqUMV+tfi7d5RvCFaAQCr
	ErWpaCnSTbkMtCAi+kEkb6tKgUaRdRnrkDt+4ql6sEIvQcpnc5A2V+s+oqpRtWlaRdmlGyxQfjc
	VV6b5cj4qj+DPgxuaFzDMtPOhy762vA
X-Received: by 2002:a05:6000:1a8a:b0:485:8cc8:1f5f with SMTP id ffacd0b85a97d-4887187595emr20616765f8f.42.1790521954539;
        Sun, 27 Sep 2026 08:12:34 -0700 (PDT)
Received: from debian (ip-78-137-176-146.broadband.digiweb.ie. [78.137.176.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a746c57sm19764208f8f.35.2026.09.27.08.12.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 08:12:33 -0700 (PDT)
From: Pablo Mazzini <pmazzini@gmail.com>
To: Chen-Yu Tsai <wens@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maxime Ripard <mripard@kernel.org>,
	Radu Rendec <radu@rendec.net>,
	Rob Herring <robh@kernel.org>,
	Samuel Holland <samuel@sholland.org>,
	Thomas Gleixner <tglx@kernel.org>
Cc: Pablo Mazzini <pmazzini@gmail.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH v2 09/11] dt-bindings: interrupt-controller: add Allwinner B288 NMI
Date: Sun, 27 Sep 2026 16:10:14 +0100
Message-ID: <20260927151016.186493-10-pmazzini@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260927151016.186493-1-pmazzini@gmail.com>
References: <20260927151016.186493-1-pmazzini@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Same register layout as the sun9i-a80 NMI, like the V3s.

Signed-off-by: Pablo Mazzini <pmazzini@gmail.com>
---
 .../interrupt-controller/allwinner,sun7i-a20-sc-nmi.yaml         | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/allwinner,sun7i-a20-sc-nmi.yaml b/Documentation/devicetree/bindings/interrupt-controller/allwinner,sun7i-a20-sc-nmi.yaml
index bb9273ec2457..179e7842bf46 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/allwinner,sun7i-a20-sc-nmi.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/allwinner,sun7i-a20-sc-nmi.yaml
@@ -29,6 +29,7 @@ properties:
       - const: allwinner,sun55i-a523-nmi
       - items:
           - enum:
+              - allwinner,sun8i-b288-nmi
               - allwinner,sun8i-v3s-nmi
               - allwinner,sun50i-a100-nmi
               - allwinner,sun50i-h616-nmi
-- 
2.53.0

