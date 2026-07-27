Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF7B13BFAEA
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 04:30:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785126624; cv=none; b=B6FqEuf4sPWqEQyyVH1yMLCNRHdf4uITFeO8wn6tUhewHH3zlZa1wMv6SydvZEMSI2YG99bgQqHsd8UcC+KElcx1RN4phMook46qu9QsMGNmTGXbXJ3cfe4UjSEtcdIbQbyfdZ6HwFfN4qctIzB1QpG42LtYH/60H1AkokDB+ZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785126624; c=relaxed/simple;
	bh=FazoqI/ILuJD9YIY7tvUgoQ9mGvSj/LgYKIkJKM/QVM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UboaaQZu6NnInWY+7Ao0ikuVeOuXjUqaYOi82oKwnzN0CxxJIpADazpoZ53sV0xaz1oO5IH6Vkb75YnA6kVLrkEU7eYjXTMPTlRiPu04Fx8MvOXYlXnHcD4hyHLxweL1ujYzJVN3eR7Py3uQa6UjFC7Nfq89a7i0Eg12Ie9EkPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j5LqH1y5; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j5LqH1y5"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2ce7d2adef4so27711675ad.3
        for <devicetree@vger.kernel.org>; Sun, 26 Jul 2026 21:30:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785126622; x=1785731422; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KFJNx9u+viXRs5tNEKp/mtIp21KgfUj1WmCFdRLL6fQ=;
        b=j5LqH1y58FctOV0pUvxYIfTo/RLTQlHBQi6ei9IWSzmqN3IiHtaOj7kEs4cfE+fIod
         +cQ5wZIzM3157SSZlRsudPwVvz22eUQ6rKbr7x81WdEDRMxQXDJGkPZ2iU2xwZqrRyR+
         MRgOUvaNs87J120dBy2/8DuUig0JNsmVZrRoePd76lDWYX+STtAjMkK6PJKQpNZB1ZmW
         DdCNAH5I8AKEIhjduW7+FkkDnhlG7Hxm9XOEFOCkR738DnSE+Tnl5Lnw1bnXhCG436yK
         +kxNBhKaJQ9wcOL/KesE23AxfUYoi+nUzsOzSAA+Dc68QuJ3U9xcyUqQQdgn4VQeG5zH
         9p2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785126622; x=1785731422;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KFJNx9u+viXRs5tNEKp/mtIp21KgfUj1WmCFdRLL6fQ=;
        b=bJOajctqh+VVHZwFmb8v/5Ob3H8s2Cc1rRhygJ4x+n47qsgLxdjFLp8178P8dlPuP+
         EaNJWjCJDRwmdg5Kca62SUBZTNJMPzopVoSYkV0LYTP4zj387ZtvPyKt4VN7P+4+k8rq
         XvSuSZAdX2KPpu71L4inZDsHNqPADgh6YKaDA84nbmEByyw9JVAqcPjYPQNtNCqJcSg0
         I3/frg9Wkwlm1x2VIFEpDoT4JP+OVoMX8+thc65ntEDtFjkRfdmgdKBx0DZJF+3/68YO
         vpX12GC4Z06UmVEYgHDWAlr0ESo2iGBOu/jLIMeOOg3YkVbYMv1+foO7qWeg4rtTeDRD
         QsOg==
X-Gm-Message-State: AOJu0YzkkWscXXc2UP5PnG7rBpQ3pBTjKYm9CQTrMcxsLfZrs4DFDftR
	Ai7WxPSc6RhwwSaLKQjRKsKNuc5R564zdKKBXpl7E7127F8rm/5wo27Y
X-Gm-Gg: AR+sD11HQx8bVYThMVjxj+BgGvAQK+MZ7JIqiqjA4Ooc1/FyR1RDpQ8nhzXv+jLvbOX
	uNtqpi+bh54XBvQnNHrpcYVEMcwqIZ0rUdJC6uYSskOY+SiGU857rQWtxHJ8aH9NdEYoiH02d/z
	vvjGxRid0bDZ3W9QiDxRf81FXEkaVdfXxDBOygQlNVC5k2rn9hXWGcTf7eBagUbwcseB4e2+RaY
	2yxOBPpzVN8rleGFKCd5oI7C5TjOfUxuDHoSp6BggE8R/d6UY9N2n+ylSBvdFOhuR7RFO6/1IaS
	TLHBrBnEQNTvsjsJvqyGIgxwLw2XakFXcB80PzQlxh8Ou6rdUTNILOuRbLabDFgRHDNc/ubaO5P
	X3YPUFSJEXvnVbqJMDHlKN1f6WkuDPjNFX0R/E5+uEaSS9eEs+aeeCOOSlkTG7i9yQWCBGqP4s4
	iy57G4P6Yw8NHW+cDnMiiJpWIxK8w8W46KHwOvMFYvsw==
X-Received: by 2002:a17:903:1acb:b0:2cc:77f3:a934 with SMTP id d9443c01a7336-2cfde89bea6mr59939035ad.46.1785126622357;
        Sun, 26 Jul 2026 21:30:22 -0700 (PDT)
Received: from [127.0.1.1] (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cfde80f50asm27372145ad.77.2026.07.26.21.30.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jul 2026 21:30:21 -0700 (PDT)
From: Kyle Hsieh <kylehsieh1995@gmail.com>
Date: Mon, 27 Jul 2026 12:32:09 +0800
Subject: [PATCH v9 1/2] dt-bindings: arm: aspeed: add Meta ventura2 board
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260727-ventura2_initial_dts-v9-1-504c0ec68039@gmail.com>
References: <20260727-ventura2_initial_dts-v9-0-504c0ec68039@gmail.com>
In-Reply-To: <20260727-ventura2_initial_dts-v9-0-504c0ec68039@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 Kyle Hsieh <kylehsieh1995@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=915;
 i=kylehsieh1995@gmail.com; h=from:subject:message-id;
 bh=FazoqI/ILuJD9YIY7tvUgoQ9mGvSj/LgYKIkJKM/QVM=;
 b=owEBbQGS/pANAwAKAaWDQrcJVsSBAcsmYgBqZt9OKqVk+UNOOZ7EOnO+1ZHiy6C9OmYUeEsUu
 x1L5wJuTtyJATMEAAEKAB0WIQTJHsaNZOdY+THGqJelg0K3CVbEgQUCambfTgAKCRClg0K3CVbE
 gUL0B/9KNiCnj3/MY7JH+tcOx3Lwu1GKhMmkwHIXZbla+56lXC+pkC1DoF5xSYkfgP3spMwVfvE
 al5XVkXTycvd4M7OdAZeq3DNyx0I8ggxp1+ODZZGWzVUm+IoCa2xa59awM7AHCB6jGELzdwoX/u
 tk8iixZfV9INDS2pa3C+z1gFPocIhdy0pWAJUpxJMr70G7kffChSTMC6dF4tKxEAbBo7Jvtugf7
 YZlzN3LSQGwfg3lIPuQd8mPs06lQ8Ew56kG3lwyJlgg51JM2kk9MklPpVddjXpUTmWVM3HlyqLr
 WeXdmCjAbuS2Vinr/RI+yFdAM7ITJZcWBzsP7ZqmdOkWqCot
X-Developer-Key: i=kylehsieh1995@gmail.com; a=openpgp;
 fpr=C91EC68D64E758F931C6A897A58342B70956C481

Document the new compatibles used on Facebook ventura2.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Kyle Hsieh <kylehsieh1995@gmail.com>
---
 Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
index dd7996960de3..b7e70868ebd8 100644
--- a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
+++ b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
@@ -98,6 +98,7 @@ properties:
               - facebook,rainiera6-bmc
               - facebook,sanmiguel-bmc
               - facebook,santabarbara-bmc
+              - facebook,ventura2-rmc
               - facebook,yosemite4-bmc
               - facebook,yosemite5-bmc
               - ibm,balcones-bmc

-- 
2.34.1

