Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAC09354AE3
	for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 02:27:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792376853; cv=none; b=QAu8J55vsbtRpwPWpo0RuEwM908ybIwzlHHsiiwYM+bhFPcr31Ftp6r1lGJk8GJSJs63xyGom3fRk7S+2oOFPpgV+u32YnSCSmuZP2agZZdXTqGXzUhD02QyqjYg1MY+1zLe5BN3eGRuYx//pk94s+UY1KY4WlDZwfzd7NazVn8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792376853; c=relaxed/simple;
	bh=ERKbFmN73N+bFdL2Y7WXwHzxqABDYzGdg5NtpYeJ75I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dtNP/L6JHz4p6AKyPWkRGj84ysdYAVuJpYt682epoqjopNS4+K91BFWn5pZ+SggzcjAX7WS+Zvu0yX47KOivNNPKqrGDzaqs5f/SG7e7X1ZftTAEwZncJlp67vd3AcP2fdF3dxiCUlfd9VCW+9fy0LP/WnTMPqtFxHswVOtN/3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F88pOb7G; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F88pOb7G"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-878b44611ffso851664b3a.3
        for <devicetree@vger.kernel.org>; Sun, 18 Oct 2026 19:27:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792376851; x=1792981651; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=rkqdExa8w61hUC2yB0qnndgXQmrAByDZaalNNXrY3xc=;
        b=F88pOb7GVcNqqyngT4WvNp7mbEC1R7hBIqrULBhQfdNXFkxiKwxZLkz/55J8yWm+70
         +g6aJMjITloqkNFY/hb/cQ6qkF2Yg3rM32/p1by0mBHsqO9nf3m8qWxvI7DsMTHM0xWn
         hH76tLsSqocTgHmbX+E6dFhBGc3qfjDq2vEoxGX/eptWYQyUtfoDGMB3cVf1qJW1DP1X
         Noy7CPmNctodbW9ciGysnaQeo8LfOvzfPpIYN2un4OMwhsdLeIC/o7tjZILyMsscO4D+
         1Bf7ibayo7OfFHtsp1iTQ+ZUseGCsqsch2DXWc/NMoxcntcLxkHMak07U363QAGppr4c
         oHSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792376851; x=1792981651;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rkqdExa8w61hUC2yB0qnndgXQmrAByDZaalNNXrY3xc=;
        b=r2B2wRb/cXcddKQTMO/Rg56a/UJl9TM7fcfC5VoziaTmsK70FgN3cLcEH94t4mgTjT
         XmPHE1H496wQ1+zjR0qv506SmzskZLsi4sRExm3p70Vma83cjv0GYTIxLa5krIwVq4HF
         vWb9WFPdFGgYsc9agpsIn9V9HGC9WW4JynRWnLjnA+kMLt2rwGq/5JInns3UMjr3Vj61
         CQyncfs9S+gpa0zrZPh9QunF7nLl4jz2/I0/aXcntw1562V4SdMh0OcAgYIDQc73rnK6
         DziAz7ZlVtcTA9Fw5z5eRNjIBDV2NzptnNm3VHXYG+dNdSUd8TnnxlyTIInXgMSjT2ab
         QfFQ==
X-Forwarded-Encrypted: i=1; AKwUvBxD9OXgv33VPQYBsLkheekYB/8wmdhrdmPZ7QOO38U+RAjnGE+2uFhAb0JCYZceLhCJWcF218+gQT7V@vger.kernel.org
X-Gm-Message-State: AFq9FYJhDgzM1HxxWyTapH/2fVSnkCBnBzXbT6+rqRhCx2KGVqjlyJt+
	eS98nFlNyu9pCWkmVnrcsgyippuKmMV47aaA1h/TOtWX6BohJJYfRAdg
X-Gm-Gg: AYBFou1UOyG6fWXFma8rBhTwGGO1RE/F8RY41OS++ZMYdJAD7BHqS1SXXHatj5kQI0q
	C7VHWr3wC7mjZlQrHjuS00tn7O4+v3KO55RLy1BuMHZHNL3mecILzXgzbKZNNogDkwBNmlngqHa
	X0dWLuNXXXFVCe8Wr1hoDC0KZVZ1YAgniHZf+Z41qWrCMEPz9cRfsbwRewtDrCG7ReE8jr0ZpK0
	C//ZLY/Kop76CjP6cd4bqhKnx07L1g0aZmDmNkAAvYYm0vAafPq0BC2GVrYOM4CXkxz/tS5+QJQ
	TGGPeAfMbUlwGct+BXI1mX6Qwry8pUYbMRYjQ29uVlTuJn10QvzEo2fQgHoiztt4EGThp2KMBvQ
	mNs/y1y2l3zHxqHG1p8Wh9IsASHO1jYQwJWkyQLCNjjJLial4Zh2t0VzqmTNc9/ycdL9FBFpbGt
	1rYDXVjDpjpwf1G2HDQyhn/g2CsIrfGzGqZp38qwyWJPYlsonZTI2jPxPiAlhoShd9BZlM0YEzz
	hFZ5aB52gcaRDLy45uLxqzO4aQT5VNg
X-Received: by 2002:a05:6a00:22c5:b0:89f:6989:cb9b with SMTP id d2e1a72fcca58-8a04bc2d679mr5099071b3a.27.1792376851039;
        Sun, 18 Oct 2026 19:27:31 -0700 (PDT)
Received: from archlinux (d173-183-236-7.abhsia.telus.net. [173.183.236.7])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-89f57452b16sm3240432b3a.29.2026.10.18.19.27.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 19:27:30 -0700 (PDT)
From: cacioandpepe <artem122novak@gmail.com>
To: daniel.lezcano@kernel.org,
	robh@kernel.org,
	geert+renesas@glider.be
Cc: tglx@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	laurent.pinchart+renesas@ideasonboard.com,
	magnus.damm@gmail.com,
	devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Artem Novak <artem122novak@gmail.com>
Subject: [RFC PATCH] dt-bindings: timer: renesas,tmu: add SH7305 compatible
Date: Sun, 18 Oct 2026 20:27:17 -0600
Message-ID: <20261019022717.511096-1-artem122novak@gmail.com>
X-Mailer: git-send-email 2.56.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Artem Novak <artem122novak@gmail.com>

The Renesas SH7305 includes a three-channel Timer Unit (TMU).
Add its compatible string to the Renesas TMU Device Tree binding.

This is an RFC because SH7305 TMU0 Device Tree support is still
under review.
Feedback on the proposed binding would be appreciated.

Signed-off-by: Artem Novak <artem122novak@gmail.com>

---
 Documentation/devicetree/bindings/timer/renesas,tmu.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/timer/renesas,tmu.yaml b/Documentation/devicetree/bindings/timer/renesas,tmu.yaml
index b1229595acfb..8ecc57cc3d91 100644
--- a/Documentation/devicetree/bindings/timer/renesas,tmu.yaml
+++ b/Documentation/devicetree/bindings/timer/renesas,tmu.yaml
@@ -21,6 +21,7 @@ properties:
   compatible:
     items:
       - enum:
+          - renesas,sh7305-tmu  # SH7305
           - renesas,tmu-r8a73a4  # R-Mobile APE6
           - renesas,tmu-r8a7740  # R-Mobile A1
           - renesas,tmu-r8a7742  # RZ/G1H
-- 
2.56.0

