Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4764952E070
	for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 13:41:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790689270; cv=none; b=Gh4Rc+8REZZDM9FFZI9x/czES9TwInZjBGjYY2U62QBvKSXH6XeYDizaVeLJE1xqQaSfy1lJ/OGY1dBVqtQ9YC/Mqg3TxhDOeRRyOWFVmLkcSucbQCfaAgPX1qD3frjsmp4Yp06kn1LlOXms9rUR487TIEcVO202Ee4gxTnKAH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790689270; c=relaxed/simple;
	bh=618lZEj4J6PxaEmGpFoPKRIGN5uod/rBxdxIH2fNG/E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rWkCEYkqf8T67R5Be8bozqqA8Gzk0E5OH/613CfY5Z49/kd9ESmi4yhreexdramxp6is7LxiSfup9AiI7IlQ367JCxEJ9fqrmRo4ovNF2GBPPg6f0gktKL85cZ+p87C1x5CNDhhyuzYe2/C5ozyLJCQCb5L9uPOe0XSGSimi2tA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=konsulko.com; spf=pass smtp.mailfrom=konsulko.com; dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b=hifxynlZ; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=konsulko.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=konsulko.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b="hifxynlZ"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e7d2bb404so3692275e9.1
        for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 06:41:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1790689266; x=1791294066; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=j6Xglxzig/oF1VgPKgOC631Csxaxo7kJhuv3JvcuV7I=;
        b=hifxynlZO6OoMK/VwF6qjrtfHIO1jJgV6SzCAie3barSfYbXJbVt3nZ00SnaiXbJiC
         T07ENyvtg7tF2+JzqDDD96/LYgIPYnsZpUg68D7OsWwFD7/9pi7RCiL65V46AtLyK42k
         GpvDiczVn8yVinuCNU/b0lhD8WqGDJYom3eZ0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790689266; x=1791294066;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=j6Xglxzig/oF1VgPKgOC631Csxaxo7kJhuv3JvcuV7I=;
        b=RkBqay69jKcZBz/7mpwsQZCzaSqkm056gKiyGHzullfu7qnqCZU0KtoAg+hPrW00ie
         5MY8dv3xUvPDtVNeRKNdBABkMDfnV9QK3CqPkg89nOSIdgoyggHS4BeLhrcMCJsP67U4
         q9Qs955ea5fn/NKQwEmp2icpbIpNv5kdZ1qj6TTdl0yxWcsW3qBvydgwoxAd6ArE42ko
         6XP0MrcFCqkeCBcNEgCf1W1eP0Su61QiSPpEnZkq1DkogXCLKxO0uUoLQ5ebflkQCSO4
         ToDCcZc/965FdoE0rgyY7PuUMRadd4RzrzfuHWh8IV8GYIwufe0gelfDsm83uWoeeIx5
         mlWg==
X-Gm-Message-State: AFuF++kGgUoSi4+urSIN/BDlnDaJgVUE+40ag28hP3JgcDhUCrbkaWxP
	+oZp+U5K/7gAILBJivuIVVpqywuXb1T+KVLt0CuFCA+fjQcBR8Mwa7rZQvZQxwIgfSA=
X-Gm-Gg: AYBFou0krXURxNT7AkTxZ8Gbr6kcfCHEJQhKwxKk7M0lRJoEvDDLlAXo+UM19f8nNEz
	WByV6LZU1NrOke1qbNJ/ZhX6UwVeXEDtXHs424Ze3ffiuXRIxrRj4Iz+ZlVuivohwlemI/T//pI
	O+Tq1/gZRmn4DcAbkfil3oCQU+ICQok3iaLtJgRA7IQxYLzF7TDmhEAGy9sqiFKvK+yB2/jeYVH
	Q3/pML6rw7zv2l1PZUFB536h6NzjVMkhFTRGsHQlyk0LoIwwM6YN9V2qj7UhPG8LYW5MypexD60
	Pf3NdzDnU8dIsQNSVNS1WMs12zlYYd+60fbfkuKCh7aBMOvT118sAUTC/8eeULdCjL+yB1awV9d
	eCF4Dz2WmZ9N5zpQHEP7jqddCtDArb7XQsP+HczPjbqkOdsL53srU8VoQ6Myn0XFXvsI+zFmIos
	d/Lamm17mTbGq2p0EBol97sljvybzqaWOsLVTXuE2YhUQ1DQw6rAPBfbAp79QhNdn3TFNT+AqEu
	B4nqewAX6pwya0=
X-Received: by 2002:a05:600c:1f92:b0:49b:8f5e:51fb with SMTP id 5b1f17b1804b1-4a00d75ac32mr46144095e9.3.1790689266111;
        Tue, 29 Sep 2026 06:41:06 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a00d1011d9sm91835165e9.15.2026.09.29.06.41.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 06:41:05 -0700 (PDT)
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
Subject: [PATCH v8 1/3] dt-bindings: vendor-prefixes: add Draeger AG
Date: Tue, 29 Sep 2026 16:40:55 +0300
Message-ID: <20260929134058.819371-2-petko.manolov@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260929134058.819371-1-petko.manolov@konsulko.com>
References: <20260929134058.819371-1-petko.manolov@konsulko.com>
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

