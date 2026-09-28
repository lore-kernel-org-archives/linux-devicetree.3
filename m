Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62A1549B446
	for <devicetree@vger.kernel.org>; Mon, 28 Sep 2026 10:30:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790591405; cv=none; b=rUcrtWsCQqmUBQA81er764kHLITtOxY9mqlo3z2ik/DvuiUE7XKbtj3Srg1s88gtb8VKzrEbA3ryTeE8zWz2foYN4AW/qdCLV7Rf0WkxgwTTJD+FD18kJqXGsmpF7rQNmkU2lQz7pY+DNDAnInDSRXXVVDEgSzr/ot5NtHZtVg8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790591405; c=relaxed/simple;
	bh=8VfTkBWkjpfaxQV9oS3JobgsW3qmhQOCv+ke/kOugew=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=d7C07ZufVyWPLXTwmKCH1E6I8yH1GQfL+JyXfVL14ppfsrb9AmbR2U1iEh+8H59VJqrweqMM3Wea2dNjxZ31bR5yvQHNl2QfUovyi7+c10QSmRuedM4k4+EQPFHYvubhrHrkGrS4CEsxIFXv1pq7TLojjmmojLc6rU4KScbolzI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FhZOdN+q; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FhZOdN+q"
Received: by mail-pj2-f13.google.com with SMTP id 98e67ed59e1d1-39666e7c9efso188159a91.3
        for <devicetree@vger.kernel.org>; Mon, 28 Sep 2026 03:30:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790591404; x=1791196204; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pw8TmXQHwov66WertzkfdRoZYT1NeXWw60nKcTPEtnM=;
        b=FhZOdN+qu2lgeGJ3qj7dthFz7cjNFqBAT7sHZE0PHazbwum28aqAUcca/wS1UKsTBc
         XXiNCzd0rA054uLqTcLThtDCxoRn69iUGftV4zUKdIHu4QOepmN1g9VMVhKsH0fMb+/k
         kOBwSqOESRs9smKYt8h8jaRNTVChBdVl0wbpWe7SrwOONl+D6+2TbgJ7kaKO4ItnJnAA
         dQ4hiBLed1vJ7IUbE7R6iVHhF6pJPAxnatsytHf2dIiMk5Czoqhs/yT6SKPrA05oZjst
         2fTxfAZo1RvMH79inv8pPiFwlp6jfyrl/W3dYtCDor+VCEgG/XpKa9pqLElfrDXKhPau
         WrOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790591404; x=1791196204;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pw8TmXQHwov66WertzkfdRoZYT1NeXWw60nKcTPEtnM=;
        b=QdFUSCvsC7SgzqacL54p/hnw7XQwP3F5iCiAcEiIjamLQ9xWCw8zu6aa/Aaf5pym3+
         EvVz3BGgke0agfwKH9Q8j6ojqmEWbDs84U1QhdH8roUO7fiF8F0PCGJAJMKmnMNFji6b
         5iD4i9FSoUevh+VppG+8PRGIHI3VHQ+CgGsNHAoYBq+yy7U+LiAi5r/kiQecqcpmxt9Z
         VBk0uc+X6qEcLwRv78VPD5JbhkQrHbJOefq6ao13Jqa0JJbUzqxJlnTge9e7rchFOz6N
         UFcCr70GlrqomzGINWCQ0dy/YRtLhVxtBYWPOLB/09cBrenbvnXPlcfS0RvEfHFEZmyt
         WCPg==
X-Forwarded-Encrypted: i=1; AKwUvBx7/XGGC9Si+zYsinV2dCWajzy7NluGYgI24KW7CTc8IPXab4b1fX12E1QYpMj2rTzGgwRo0rHZtstJ@vger.kernel.org
X-Gm-Message-State: AFq9FYKuCeKIRJZylnqymkpl87PT+H3fblVtQ5Puc97QULjMHiByfR2H
	DOO54rV5OgI/Lh2l4bsgxZgra3UtWDnSZFwPZQYm+H5KPsHSWCZPTv1g
X-Gm-Gg: AYBFou3OU564kVkoHdqV33B3Gwuq2voOZ1xW3JExTBaMj9ZV613Da6r/DBnJxleIS5Z
	Tx5o5cewf8JU89yXZVbTQ4Fqabo5wKYkzCNmnDaUJKMN55y7XxbRzNFpX/zOW9J9RRRG6mfHVKm
	Wadi5uNZPuR3KR0lUrGcaQAewA+FZYQqg9FTSQwB6jIF3qjOkOt2yIqpF6DwbAnYh2uvCluBVEH
	0QSzvOKeFdv0MLTxvYpWwFQyMOb33Vm9fDKn+QXCFXBWnKM9+5bV13N5XrJ8ZLzDzHN9OG7Y298
	hePpgSwkEt0/xBQK0qKuv+UA7qTNj5tv1CNmNBtWnvhzR3bwJ4wmafCmsEBlwrOoqGRyPEK5zR2
	YYT8xyspO2CFk2c0F4PrFR+45VADGOWA0s/aUb5qRyvr/0mBkofJVHN5th49bUpes7BBBXsUcXE
	OlCkK8lJ4M4Q0S15U8vvtP5ecdDEnROiLHI2sGkWPl7MYHe7ynCmIsR8rRB8R5Mr/AGDrC1H74h
	B1Hcy3Mgl6YlA==
X-Received: by 2002:a17:90b:258c:b0:39e:2f57:67c0 with SMTP id 98e67ed59e1d1-3a0b2123b70mr11848301a91.0.1790591403694;
        Mon, 28 Sep 2026 03:30:03 -0700 (PDT)
Received: from jfliu-sfa1411.. ([129.227.183.200])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0b9355e49sm20234282a91.4.2026.09.28.03.30.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 03:30:03 -0700 (PDT)
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
Subject: [PATCH v3 1/3] dt-bindings: arm: qcom: Add Acer Swift SFA14-11
Date: Mon, 28 Sep 2026 18:29:41 +0800
Message-ID: <20260928102951.18369-2-liujianfeng1994@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260928102951.18369-1-liujianfeng1994@gmail.com>
References: <20260928102951.18369-1-liujianfeng1994@gmail.com>
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
index e6b123ad58c79..651a89b258351 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -1204,6 +1204,7 @@ properties:
 
       - items:
           - enum:
+              - acer,swift-sfa14-11
               - medion,sprchrgd14s1
               - tuxedo,elite14gen1
           - const: qcom,x1e78100
-- 
2.47.3

