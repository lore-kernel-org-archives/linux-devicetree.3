Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76D095208D9
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 13:14:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792070041; cv=none; b=JHu9UNejW6XxvGP9f3sxPYT6dSYSxVBE9BDF75TGT7gBGPVvk2OKFUN2tIhrUOu2zrx+2Jt/GzUhGNxAtqFidEl+TBylt5fc1HYfd/+F6PQOW+KrT3iXqmPZYesFjNmS2kUwiwXN+NUvvVGzqHBl0Wwg9rCZzgj+8uVU3lbAL9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792070041; c=relaxed/simple;
	bh=618lZEj4J6PxaEmGpFoPKRIGN5uod/rBxdxIH2fNG/E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=q4mOwrA62Y57LGq4ITMr69opXq/Eld0nyLHwiymKqVwSBsNi7EK/c5lbUdmugFiQecZRWbattRkrk0pBfoxfh6vrycpRl0NS2NZwEl6dIndptUiSsm3VFUE2LgiR0EMmKrBfHbOZhOc33ahUG67YC/NzLPF8ztizdoHVBaXOIAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=konsulko.com; spf=pass smtp.mailfrom=konsulko.com; dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b=rTXMjPAV; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=konsulko.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=konsulko.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b="rTXMjPAV"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-48b042c0728so1279742f8f.1
        for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 06:14:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1792070039; x=1792674839; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=j6Xglxzig/oF1VgPKgOC631Csxaxo7kJhuv3JvcuV7I=;
        b=rTXMjPAVDiMJIIdlMY1xLllVJHpnSoA5g8D0+0Z8KEzCjiQlPlW1waEnoYpyRUZxev
         hyllSBDJiBl1q4vPbUgbMFUTe4l8g9t9XQkr6RRhsTYiSu9M1eB8iOJtmlnpNrEzAAoL
         6XI+wRha9U9MWlwqXxUI2rIo3OiDOr5mowGp0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792070039; x=1792674839;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=j6Xglxzig/oF1VgPKgOC631Csxaxo7kJhuv3JvcuV7I=;
        b=mlsFRYEuZHYyuc4+WiYnB/+e+MwOEwky6SkgXeJdoDFxr006kGS2DdV0SFK4PeN91f
         Tae31aTeiG8ruvErkFCvFWo6v1J/GFN2eOpnniFExxDELZMxkE5HppNqlBu8SjN1fzlo
         jH3+xkmYN1aBL7i6n6erVTk3NR3DUqHSRK910D2jX0k3rxY2mMC1qHa5vqlw8/XxuL6y
         qqCr+RnGIsJw3OarANg7a4WCLq4e4PAD7eGfc6R9VenNiFhX88vtcLgH+jY/GPQHX0Ak
         SeEzy/LqtQpfVSJuy8Yb2ltYINnl87SI0FaZ4pjeWP69Ak/Y41uzBwZYPdhQ2TIoVcJH
         Y8Aw==
X-Gm-Message-State: AFq9FYIA4iAjYih5PSW0C94mpUzuGK0vUcIkzBhcXrW17B3QWOy16Fa+
	/ErOwHFv3opkvNdbCYpxAmjAvfiQpYuQb88nngi2mz32sCSr5jva30ipSMoktiRDt2M=
X-Gm-Gg: AYBFou1A81IHYof/LW2C0CRjUuwFHbYY1pinvLdhKCtD5Dz0+M80lLVJv4UJQ/X9HF+
	7UyZQp7DPD5Zfiz08zFbtoQdWNHdZtrBh6czsRDSjGVUOtgTbW9fcvTbYkPGaCQnW0bSQW4aihe
	xN8QYqr1yQtZVmKuHOUi4PW76H97yLbA832JhTQ7bkh3FKATbUONOH43dcbnBtTkMdq6pU5UyaN
	bJ90pl3y0jBBRCKzWbRrh0jhGvLmOUDW5wkwLQdMhfY5swT1a2F7gosOuGJ4xw6BUxVlj7GK5Vd
	GMEIeuZmTlDLLZzfjgr6p0Xy9D/G7y5lLA/995zgu4VKak1QDiFP4vSyUGooVjFQW5bdh3CmWaL
	h1h+3aOY64f2f+9knbh6qFzIVq8NrUh7hpi+dPSURi3Lz4GS+HUVkm7y73BNDiiNBLs7BgTnfj+
	eksryoRbaf5wwQ170rO9kdGu9FBc3OfS3YqW3mMkCYxygh4d5FadjGXm/AEAuUOo+0lycj1IdR8
	zDVXpv+HGlUNAg=
X-Received: by 2002:a05:6000:230e:b0:487:1f7:f506 with SMTP id ffacd0b85a97d-48dbaadeba7mr34203897f8f.11.1792070038514;
        Thu, 15 Oct 2026 06:13:58 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de0ac36f9sm17807433f8f.36.2026.10.15.06.13.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 06:13:58 -0700 (PDT)
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
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v10 1/3] dt-bindings: vendor-prefixes: add Draeger AG
Date: Thu, 15 Oct 2026 16:13:49 +0300
Message-ID: <20261015131352.3624327-2-petko.manolov@konsulko.com>
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

Add a vendor prefix for Draegar AG, which is Draegerwerk AG & Co. KGaA
Link: https://www.draeger.com/de_de/Home

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Petko Manolov <petko.manolov@konsulko.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index ba2002969373..276d62b848d5 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -467,6 +467,8 @@ patternProperties:
     description: DPTechnics
   "^dptel,.*":
     description: Guangdong Dapu Telecom Co., Ltd.
+  "^draeger,.*":
+    description: Draegerwerk AG & Co. KGaA
   "^dragino,.*":
     description: Dragino Technology Co., Limited
   "^dream,.*":
-- 
2.47.3

