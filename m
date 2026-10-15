Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89FAE5221D3
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 13:14:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792070042; cv=none; b=E6SRn0m7f8wC6aXGcNI/0gljzKYQ0v0D5sf68EdGkZH8sAQkCAMVk2RoyRkpz8mVGWD7xvo8HnqrTIhaG8EaA/9H827qirtsz0d7x+hehydzESlBVnShfIGIG6Dq0AwIrQn75VB/UWuFiviHQXx50V4JILCUSM6jtIqOfLDCSpw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792070042; c=relaxed/simple;
	bh=NExAlvPnpeNrybroIvK1yu+2PtogQY+t8w4M/9D2m/U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=b2YuNr4sI5u0jh0+T7rtJNxr2xNrcq8mcPiUeFZJvAFbaCl0e6aumqD69pL//zYeJ+j+z6en5TuOWSdUQy60d850ae7ev/zh5kt6U3cezI821ZjRv1z2+0Ma8k5RcLPTxG9d9dGHoeKeOw5cEXJKc3SCk1KPzlyCKhgXpQuKVvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=konsulko.com; spf=pass smtp.mailfrom=konsulko.com; dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b=Eh84t935; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=konsulko.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=konsulko.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b="Eh84t935"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-48bbb06e746so967386f8f.3
        for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 06:14:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1792070040; x=1792674840; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/smsvKS7Sh5LROb29McUR3fTdP4O2notmfq7QIJ+X4U=;
        b=Eh84t935TirOHdctDY8yRcDoMmP0TWqA6sK3VNRSC3uh9WmaepJGwHVdJ99/0B7qng
         9M4bvKbJxVc40toRA8HIYzUij70oeAGPfb/Os7tCjwA6auOSS54bb/FfCAZGMPAE0CMx
         uR9p6KHc8yCzl+Ufo1bT2t75zd1YJ2oXZbmHk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792070040; x=1792674840;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/smsvKS7Sh5LROb29McUR3fTdP4O2notmfq7QIJ+X4U=;
        b=NTTFkZsE0fAnpULPe553sP1rJ3IMCVxFZukKixpZwvpZ6AyId/d3qQ08pHazQEZY1I
         iqI0dk4DcTafbXZR1cAYcW4jbIwZJt4RlsofcX7beXO7iS3Z6jAYSKfeazNu55aFjqW2
         hHz9rW5N22Ioe4PoksFpf3SlXrAYam8SCocwtLKGfVQJ4hYdyIf0b5btq0iS3GuIHhh9
         M61du4aLGi6hXeKM2NB/JWL21JHvjMebcVWW8HFeAzAsYGEDmf0txseLeNH7mP5S1LNc
         XjLc29YhhFODbh1P4Grw787562EEFnwofvTADsMWZMdPWnUvT5aUhCTk1RWNP5ijTpRl
         HeFw==
X-Gm-Message-State: AFq9FYKnr77dHoU/zV/DWJGjSmkOQv8FsP/CN3MN7NJOv4KKpzMTrbc5
	spJRlvweYxV0mZqEMWXUyfv+5zt9XBfdFLtXWtY3NrnGql3yeComY6wYzZXQsuL2bfU=
X-Gm-Gg: AYBFou0z8FmoM+/ZvMIantmG5RPuXrKjULhq/xpMWputqjGcdtMrzUJXsSlyQFzdGwE
	P3rDzKopKp3ZEgS2W8vVGEl4M6NhQYVSn6qJ1fmi5x984YZ6YMw4GwbSjn7DqyofXKP+krkDz9K
	6CvdqooPLIfwmkBmTliRwtdLHPSq46V2FtawqMBcAza3qPqETP3mE89Jk/3qzIzt2H/culHXJT6
	wA1eGNeBt6VZpSrV5+B5gIRIgC983G8vUdmQFLq6zPF5KoCtY+4rAtUAVU97ox2dDWxWVpV5G5a
	ULmG6Gmu6J0GX9GAQI2MwCazTqY/qnwM6wxXuTcZJK9m6tDvBhs7JKFe/A04VlAQS1cOcJ5+e+e
	jCdkEQ44tlru8d8ClL6Ssj0Km7EKw8b+fi8JC1SRKX/8T/ULaNTFY5XR3E9rU24rrYM2Dq0SpKd
	TpanXqRFmvmG19MhTPzdeZP8KIlW+3Vkn+gl+/xsgmjvIlrdIieg5i5Jk590Tm8YcfMzkFV2ETz
	r2voflwtPt7MYdv
X-Received: by 2002:a05:600c:524c:b0:4a1:825a:5726 with SMTP id 5b1f17b1804b1-4a18e4aeaffmr362526845e9.31.1792070039664;
        Thu, 15 Oct 2026 06:13:59 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de0ac36f9sm17807433f8f.36.2026.10.15.06.13.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 06:13:59 -0700 (PDT)
From: Petko Manolov <petko.manolov@konsulko.com>
To: linux-kernel@vger.kernel.org
Cc: devicetree@vger.kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	dinguyen@kernel.org,
	arnemaximilian.richter@draeger.com,
	martynas.grybauskas@draeger.com,
	Petko Manolov <petko.manolov@konsulko.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v10 2/3] dt-bindings: arm: altera: add Draeger M48 dual-cpu board
Date: Thu, 15 Oct 2026 16:13:50 +0300
Message-ID: <20261015131352.3624327-3-petko.manolov@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261015131352.3624327-1-petko.manolov@konsulko.com>
References: <20261015131352.3624327-1-petko.manolov@konsulko.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

M48 is a heterogeneous board made by Draeger that is based on two
independent cpus, that are monitoring each other.  One of them is
imx6, the other is Altera SoCFPGA Cyclone 5.  The latter is booting
independently off qspi.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Petko Manolov <petko.manolov@konsulko.com>
---
 Documentation/devicetree/bindings/arm/altera.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/altera.yaml b/Documentation/devicetree/bindings/arm/altera.yaml
index 3030cf46fe74..b67dc10b0a11 100644
--- a/Documentation/devicetree/bindings/arm/altera.yaml
+++ b/Documentation/devicetree/bindings/arm/altera.yaml
@@ -47,6 +47,7 @@ properties:
           - enum:
               - altr,socfpga-cyclone5-socdk
               - denx,mcvevk
+              - draeger,socfpga-m48
               - ebv,socrates
               - macnica,sodia
               - novtech,chameleon96
-- 
2.47.3

