Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B25E93BB9F7
	for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 13:38:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789479496; cv=none; b=VdDu6lYRFJHCMq92OS0MKQRJLkHCoZj2Y5cjgzVslqTjEZ8DaD3V6+170BqEdVt8dess+Iucgfi3e6fJlt/49WkFZKACl1HwhGMLHYz0uMZ3KUt5BhYCLHkpJ7Yr4nhi/HPcll8O1+OSzfMZQaORn3l/54tnyUxrxQmTSwvgdAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789479496; c=relaxed/simple;
	bh=6Lz1w8I4jTEAaYTzPTwMJF/7TY7BvjA3HgkopZ1NJOw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LwLCnIZGPjSupo3w9MHeN/bXAH/8pwzZhIkNtN7fJ2cO+Q07ov8/sc6YSrWsoMXpwidqpXJ0FVjKb3kfRN06BBSUNXtAGxSOVFm/zHAsPTnOAjylQ/tzjmeLVWDu+tlRq0ARsdmrJiT9vQ9ox6zYeLoEok4nptSy/UJQce+ZCKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=konsulko.com; spf=pass smtp.mailfrom=konsulko.com; dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b=XD62+2Ry; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=konsulko.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=konsulko.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b="XD62+2Ry"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b965f447cso26378675e9.3
        for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 06:38:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1789479493; x=1790084293; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=I9it+H2KzAMUWqwq/e89Zc+T4Ptx2OqaJ7EErcD6+fQ=;
        b=XD62+2Ry3nLK+Y5it9CMpczWppBrUDeYnz1rWJFVJ/6k15aKXGAUcB/yVGOdbjBtRN
         LKrJF3p0OF3S28JVG2+GlhDXpZlT/eIZ7aD5yiNk52cqPxE7SFEzr+3M2HawihvICdFQ
         8+xrrtT59GVkqs35rfM9OdBbPtomWgUALjF1M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789479493; x=1790084293;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=I9it+H2KzAMUWqwq/e89Zc+T4Ptx2OqaJ7EErcD6+fQ=;
        b=bpIMNhaZStWx5Gl4XTX/WJQb1QnAYxsx48hzK5GAvjDhSM4ZDi60AUuX9icJWubCE1
         2QgXhrJmFtILTTbek4jwDAY4S7NbshdprI9/REVt1XZCLxl9eWBAHloFfMFMCH2EKuln
         dUbSDfFP5ULpR7HI7k4ZifRy1Z/lEMaBXoqIeBz32+8ePYGpQ6HLNJC51d+IYT74Hu7p
         pQPgqFmCqrWlcFJ1Gb2S6nBUQVtAoOxOR6PGPCIxi0VJg6LKKx+y8cO5n2KJsuuo6pov
         lZ1Wcgctin3peT4ItH6iJwwwlTPfEmArj8z0hvhFWK7kKf9DXlUnYqBaLR4r9kQlTfgb
         HDhQ==
X-Gm-Message-State: AFuF++mNb+lP1JVQ6LurCRmuOlCFS/4+lFlfP4UsPzLeCekivwU+z6QB
	6B3ocTs9mvByp6itc8Y4G9+9AlAj5Na2bG2JAZRZrmrREtLPlHQE0MFLBIsBk91VUkg=
X-Gm-Gg: AYBFou22GBrwWB8HVK2DLmbBf9/PiQGnw9Y9IchLSwQu2p9JlNKDZwy3X2IOlG5b/S3
	nNhZHq68Mg61hLWHkLZmJT2ZBJiJv8/Y7o5TCwcmNr8Y3C/lFgeNt5N/cXxHJBnjFv/oSq9flqH
	mFV7dfs6qnp6vWs1L3wJFdCr0ucYRuyHtew+P1OLJL9HVeg2INW2MJPoMC+q6h5NkhUejpVQYr1
	JoeBSw3z3IJiAFW8Plxruh6FRJuAtcVwr3GPLJpP6PhvWvK9ZGB9yz/BLBXLoHXzBrgcQkQxP8R
	a+iBokHW4pG7w5/yEgmE/piial2IE/kBEYUnJjKgLo+9SMeBN7N6sldjWX+YuS7nTQzWNe6uFbO
	GbzKtjfaRpr6TXBWWVfL4oe5RHHH5cwT342G1Ed67gnVA//h1AI0Oc5739NKiwqHUwU2aEZ0ukp
	Knwx6wJNXSUdtTP33rFPqmDeniBRqIJGp3tn4adeEvAaLOXKwAWb6F8oI2bDzdYdrQQSOxvtg2k
	jTtI5LRKOEscfly
X-Received: by 2002:a05:600c:3d92:b0:49e:6777:da79 with SMTP id 5b1f17b1804b1-49e7a678649mr96419565e9.26.1789479492758;
        Tue, 15 Sep 2026 06:38:12 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e7d6bf4desm88186235e9.15.2026.09.15.06.38.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 06:38:12 -0700 (PDT)
From: Petko Manolov <petko.manolov@konsulko.com>
To: linux-kernel@vger.kernel.org
Cc: devicetree@vger.kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	dinguyen@kernel.org,
	Petko Manolov <petko.manolov@konsulko.com>
Subject: [PATCH v5 1/3] dt-bindings: vendor-prefixes: add Draeger AG
Date: Tue, 15 Sep 2026 16:38:02 +0300
Message-ID: <20260915133805.3249587-2-petko.manolov@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260915133805.3249587-1-petko.manolov@konsulko.com>
References: <20260915133805.3249587-1-petko.manolov@konsulko.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a vendor prefix for Draegar AG, which is Draegerwerk AG & Co. KGaA

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

