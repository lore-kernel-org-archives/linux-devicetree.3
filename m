Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E99894D17AB
	for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 18:26:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790015205; cv=none; b=l/DUWDDpIM2mL88l2Q5QUzAiZRV7tSHdY/PriXIoB8GncFnkGCVPU1P/rJeXK3kkDkzesYuNNkc0a1ZvYLZMTtSlwvnyv8QZN0ZuZT/3EQWbfC+sTkccKGpTSJ/YC4SFUa9zD9NB9PgVVR6bivs7sYKpp8lypewWGexk+Ph8GNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790015205; c=relaxed/simple;
	bh=Hrw9uVCkuJ+RImHrQgLm4rRhEErnOvCmxCULmx+qlwg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sV8xXFkhtNp1A17kf072016SOjg81XkfQXsC4WrzW50E+DS5Hrd+PULfzYp1CwjSdyetOI5xMkx3JjijIzYMnKsJdG5lb9nh3+H0ObXu5Jp8A7gDCvqRRE7RngvloGY7Rgk/rIZ6T1uz+G5h9Oo7ib8Nk2dA/ZxHJh2Im0wUwF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffroot.co.za; spf=none smtp.mailfrom=ffroot.co.za; dkim=pass (2048-bit key) header.d=ffroot-co-za.20251104.gappssmtp.com header.i=@ffroot-co-za.20251104.gappssmtp.com header.b=mQHsbUvk; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffroot.co.za
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ffroot.co.za
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ffroot-co-za.20251104.gappssmtp.com header.i=@ffroot-co-za.20251104.gappssmtp.com header.b="mQHsbUvk"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-482f62ccdb1so1150137f8f.1
        for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 11:26:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffroot-co-za.20251104.gappssmtp.com; s=20251104; t=1790015201; x=1790620001; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RfbhD5QaD4wJNjO8bt14TtWKzvgd7QRbHTerWPS0g/w=;
        b=mQHsbUvkiMq6qrWy2DvyOMK75EQpqsr6QTYLHNBoQLy2D1+G6XchmTCc+qeylPjOkB
         NDi7jfVVk6w9bGp8PQnntmZi1vqTqhP4CLS4ZgkNlCbhRcazS6Z25U2Ze0vAVBmtwRq+
         kpL+6Klq5zZpCEtI+eP5teGdz4C9O+LNKhGCwnFkqyC+zqxvrf7MuObBCOYPdgOBnRMJ
         lpkRI5kZiCiMROm2S/DAwvEHeXyjikuZWLgdRv5VA/5eSi60laSbu9jx8baD79WASg9q
         ASASY1xh/nWxEXpISXT9pxukEAB4hYYEQ3NCn65QaTf8+Op2uETXCJtSkhbliQ+5jBGC
         /NRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790015201; x=1790620001;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RfbhD5QaD4wJNjO8bt14TtWKzvgd7QRbHTerWPS0g/w=;
        b=BjLxmkPf3KCxu87VSfScr4NsWly2XQNo3EYkY/2RCIMyL8cAMrDBTT1i+ULlTFjmGu
         A9ZUWYPLfcd9QhN1GZw+l6HOJ+X4/PYsNDEM3gX6W4u8tqr3GE5i6VGbvHi6qOUe7ZSj
         yjyw70ytLmwUFO+qTjpj4BYxY0lNJvqMgQQJdQFVoLSwcr//7x9jt3mPdGjPO/VNm5gw
         uq1oqARt7XCOMetsoQ893XYiWsQM9rYCHyALnR/rGLs3fFAK3waU3YFhRUJdsOXZcBAR
         yU6rPGKLLsgVRkvA0z4mcXkBZ9dWyvWcaHP1ypzYIKVUoTPaLY7X4nlUG3E81JHVZMzL
         8pKg==
X-Gm-Message-State: AFuF++mJne9rbgCFbovbi/rvrJTtMWfMZLBenqxKrEMAzw1yk9Ep8cPm
	Bn54W4uzbruMLCSqwJy7eTcBulkltxgyCS6OzViyGHgNGZDuIu0HICfHRbDe0030kaQ=
X-Gm-Gg: AYBFou2r+tqKU4XW91qfK7VKNq1VNHeXnTfTb96c0y59NRuObMNvOsE4hMPpIK349PL
	XgkPfH1IG1nC60icAeAG3JyTcBzWlOmEqwXVTah0cMbnJvK+4Vpg6z9CPtrD/W5S7YIjQ7RiJoA
	l7/gyKkWu1BjVVJtzBe59vIUw1sBdlk1BI9J3cGHJGWK3E3ynAh9JejrmRpC8FYftWGTRaftzof
	YdYEs7c0a73I5noxHc/+uPHSlsVI+8iTnfmEdYnBGSCGSiXwLx/j8H+ygegVGVzPU7IC6KVZxqz
	kXhHVEToNQ4v7Py9/GiFZ/PAib2HgSRHny+GLWEEpYT4aDI6lhPE+DT20r/za/Eq9pDNhfaBi+i
	3q+dd7aR0synjW21Rg2L137DpdINn3SmhVXMHn+FpURUUtL0PieS/hAyJwZPO/OcarRw9pOJDy7
	TGBzRfd5FxEVapxm1+Cxka6Ha4X/mes32uoGcn92d1Qj2I9ybwnmq+65CFMGc/VqsNvb5tWi/67
	YKElwiINYbtJL5CJ5Nj9YE0QnQnx0sxJ5z4
X-Received: by 2002:a05:6000:985:b0:486:f3ae:7d93 with SMTP id ffacd0b85a97d-4886100499cmr799279f8f.12.1790015200880;
        Mon, 21 Sep 2026 11:26:40 -0700 (PDT)
Received: from dev-ag.figment.co.za ([192.145.132.58])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4872446067asm25126184f8f.12.2026.09.21.11.26.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 11:26:40 -0700 (PDT)
From: Andrew Gaylard <ag@ffroot.co.za>
To: linux-arm-kernel@lists.infradead.org
Cc: devicetree@vger.kernel.org,
	qinjian@cqplus1.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux@armlinux.org.uk,
	Andrew Gaylard <ag@ffroot.co.za>
Subject: [PATCH v3 2/6] dt-bindings: arm: sunplus: add Tibbo LTPP3G2 board compatible string
Date: Mon, 21 Sep 2026 20:26:16 +0200
Message-ID: <20260921182620.17597-3-ag@ffroot.co.za>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260921182620.17597-1-ag@ffroot.co.za>
References: <20260921182620.17597-1-ag@ffroot.co.za>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add tibbo,ltpp3g2 to the list of compatible boards for the Sunplus
SP7021 SoC binding.

Signed-off-by: Andrew Gaylard <ag@ffroot.co.za>
---
 Documentation/devicetree/bindings/arm/sunplus,sp7021.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/sunplus,sp7021.yaml b/Documentation/devicetree/bindings/arm/sunplus,sp7021.yaml
index def7d0cfeb31..8ec006576f74 100644
--- a/Documentation/devicetree/bindings/arm/sunplus,sp7021.yaml
+++ b/Documentation/devicetree/bindings/arm/sunplus,sp7021.yaml
@@ -9,6 +9,7 @@ title: Sunplus SP7021 Boards
 
 maintainers:
   - qinjian <qinjian@cqplus1.com>
+  - Andrew Gaylard <ag@ffroot.co.za>
 
 description: |
   ARM platforms using Sunplus SP7021, an ARM Cortex A7 (4-cores) based SoC.
@@ -22,6 +23,7 @@ properties:
       - enum:
           - sunplus,sp7021-achip
           - sunplus,sp7021-demo-v3
+          - tibbo,ltpp3g2
       - const: sunplus,sp7021
 
 additionalProperties: true
-- 
2.53.0

