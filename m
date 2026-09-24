Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02DE641A55D
	for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 08:33:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790238815; cv=none; b=BOB87krZ6nbBQWaek44SS5AFy7OT4tIYc1gsNjy70zlCCGPDBCU9QfRbYDddEZJke+Z1PmDa+esHgnGgqy5evwE6hTYSu268ZNlPPEUKbLF8ZC3lmjkQAKMyk1Lymfeflrbsmv84aKc/QqQcRJ/eNO37WDTY7jmlXY5phGt3PpA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790238815; c=relaxed/simple;
	bh=BLYINOzG+j8wRTKT4ZsVkwaDP7ZaJIacVlW2Zo5nM8o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GVseG7OFW7zMn/DTwbYr3Vi80qQtqzHO1nrTMQkddPxt0/vpgF23JNEiZQai2jnb7BfsyyIGXlP1MwDY3MNVlnv6S1d31wz3VC8Flq0F9H/thc1aOQahJsl0cHi/8Ipdvm+Yckj9upI0TczqfPZxgNurMLmlX71VErLHl0439QM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=knCE4RrF; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="knCE4RrF"
Received: by mail-pz2-f12.google.com with SMTP id 41be03b00d2f7-cc1e1b51234so79270a12.3
        for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 01:33:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790238813; x=1790843613; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MRXNlYLipD/yiMI1wfZqSuy2Z9Ygn/v9sO3rrHh3+UU=;
        b=knCE4RrF3Xez7Q0aGfex2FBlUJNnUu9FCOrgEZqVMgZsxjLqHn+OhdZutlqNgThJqg
         nii5wujQoV9iajaOWEL+BukKczLX96HMYE6QNDkjZyCnYl7xKSGI7CbNS+olohywgfZw
         zQLnmb3MNfPFu3sF/lNTI1MFmrmRG6vlJir001pYaqrg3pfzePSDML3bzCii+QKSC+kO
         cN/PAqQyX0OIx6gjQ7FSysQayJ/xB99vuY14lCcyHJFKl+T9eSqCEKnROkQNFXJtFE7s
         FjNuTywqDilwNTLhrhLMAejG8bxmrbY54T6m8lObuCB9pOmoLB7UVRLK90tTOf3CkTsw
         T/cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790238813; x=1790843613;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MRXNlYLipD/yiMI1wfZqSuy2Z9Ygn/v9sO3rrHh3+UU=;
        b=AvcEHifZ5FFnw4c09ZTHc0I9iHoaXZ7ElI+ghGCOG41WLlNQIr6TZ5QwBb6cGOGvH/
         Jzoieb+9SOub7ui3Ia0MaCnayi7i0a8Ayb6DFTdThO2mn1aSqiHKvdwjnuYbFa9Jr3BC
         L6L3Fjrxf9YGjz6NQsjYoSvd7vCoPZUmcD95jFZhmr0FTSbyFCyaQyvBx3bcuBpCvH27
         2Awyq+8EJco6JHlzZ783YNq3v4d4xzSTNaY3kYOoJrDd3pWwBr9pJihY6hMP1NBKyCuj
         8bV5v2Xz8iUM2D/qzs8ED2i5yQbpsea9i2flIT3TCHhcr5BbiuOKvGMkpD8lMd3MzSxE
         CnRg==
X-Forwarded-Encrypted: i=1; AKwUvBxXJ4IlTMcbtAFRbfWvHK+ADgL1DDHb5mo3b5bH0JHnD7dQQ+TbMg2fUmnBB2YaKvP7/7c/kD1/LhqY@vger.kernel.org
X-Gm-Message-State: AFuF++nTgJXK2s5Yx4MUhqhHXGPuZl2CSqXeb38tumzNpf2vGJ++MaIQ
	qDBM+ZOpH02eDVqGfC74rOtNSP5Hu6lFd+ihiS98Of45U9Zv3hlsjdbgi4gLGA==
X-Gm-Gg: AYBFou3i4NAob0o1yM7VYGnNcZvzQOOIxkTDRjVNO1HvRq2mfG/ZyfttBssIWFflNbK
	c1UNJ6ccJuRNvBlhcVZNfgn7ExfdWW4+7zrQcoqEvsUMgGxf6NeHE6erwekoIm9AfTS87Mm+yC2
	rmADJRNa8ct2LGY3ZCRy5HbKkpLhDrgKtY1ZlgdisqCHrNVp50Tpnyxajq4LaFMprqT2GRjIj3/
	oDSL83wqhgDOJ7GCrpJnnklm6x7rW7sW1V9WjZSja6+bi84Iw4lPFzK7xi/zWpKnnNpoADqI7Ip
	PoTAbBrAyJjupRf9m6JVngEhJ2BGVc1azaafoHrwyBHhA3m0Hqm3hku3xhwWhSZsAOTjjSvEdRD
	lO0pc4qP/7xVxa/xav0LkgIQAfmEqXdQuVQxTAk0qGhS/9C8NJNshs2DN3UasTa7JqIrBUQBtn0
	y+yyk3PsD4LYCyAqyhFpSpo4l2jRAO+RmHfdz8bdPbOsA7ycnFejrH+xbEdAV9pc7XGiyPdo+b3
	2lbMF2KhvwerEJ9EJ7arHOx
X-Received: by 2002:a17:903:1663:b0:2d8:d29b:c1e5 with SMTP id d9443c01a7336-2df7d71ee93mr26583735ad.0.1790238813321;
        Thu, 24 Sep 2026 01:33:33 -0700 (PDT)
Received: from jfliu-sfa1411.. ([129.227.183.200])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df6a516d8asm22659015ad.9.2026.09.24.01.33.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 01:33:32 -0700 (PDT)
From: Jianfeng Liu <liujianfeng1994@gmail.com>
To: linux-arm-msm@vger.kernel.org
Cc: Jianfeng Liu <liujianfeng1994@gmail.com>,
	Abel Vesa <abelvesa@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/3] dt-bindings: arm: qcom: Add Acer Swift SFA14-11
Date: Thu, 24 Sep 2026 16:33:01 +0800
Message-ID: <20260924083321.33129-2-liujianfeng1994@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260924083321.33129-1-liujianfeng1994@gmail.com>
References: <20260924083321.33129-1-liujianfeng1994@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document the X1E78100-based Acer Swift SFA14-11.

Signed-off-by: Jianfeng Liu <liujianfeng1994@gmail.com>
---

(no changes since v1)

 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 5c0414d4af9b9..85e62b2c7093f 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -1203,6 +1203,7 @@ properties:
 
       - items:
           - enum:
+              - acer,sfa14-11
               - medion,sprchrgd14s1
               - tuxedo,elite14gen1
           - const: qcom,x1e78100
-- 
2.47.3

