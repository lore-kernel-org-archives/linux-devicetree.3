Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1F2250AC34
	for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 13:02:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791982962; cv=none; b=PASWQC6WA9Q8p2NZpXtXfjA+jtkp7AfaxPYDFxTx5KMl8GyGMK/xzaii4angimb8dVJJjjfSPzS18APt3K2ac8X6D9M6pL5/3V033gGAeCgRcFPeHZTVvYX14TUm3v0y+ETPW3J/DjoIbm+i1h8OCcCpL7v4FUTOpH2d9U13d40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791982962; c=relaxed/simple;
	bh=NExAlvPnpeNrybroIvK1yu+2PtogQY+t8w4M/9D2m/U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fkMYHJDTfTlwNYUjmJ8aml0BjU+enLNLfK8Ng7ChOXqmYUtJCDkcJ/viRPFsdoS3ZpdRTu/vuskQHueFtZmq4DuQjZvQvOvq+Tbs2XjmRLpcasXollcvLvot2wHdkT5oTizZhiSgZ8bvrBr0WGBqOzivOt0ligYRXZI5ct3vrZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=konsulko.com; spf=pass smtp.mailfrom=konsulko.com; dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b=Vb3VKmwe; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=konsulko.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=konsulko.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b="Vb3VKmwe"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-6b170129413so1599264a12.1
        for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 06:02:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1791982958; x=1792587758; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/smsvKS7Sh5LROb29McUR3fTdP4O2notmfq7QIJ+X4U=;
        b=Vb3VKmweXtFMK6iYuBMzOvVpk4gy5kqZ8MZBf6li8sIEbW/+F295xJWVSDtkzrS4uJ
         aP/hqoX7Et1+ZJYAn+FVKx9VpsmuDkHiaSWs9JkTPFYKNHAYmEViKFotQ+1SFt8eCmvg
         zKQ1OTTfPyG57D8Bi5KJOlEujJxvosvDJb4xI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791982958; x=1792587758;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/smsvKS7Sh5LROb29McUR3fTdP4O2notmfq7QIJ+X4U=;
        b=yurUfxc+Gk7/VOLhhVdRrk5Dbz96Srea5ORslxMDLkSVo1+jYtGvaGVW2W0/sYmFWz
         bLjOXnXYcUQ7xERUBTuUrblXVD7FLawfR8wAuzs5bcjmTQkb6PqduWsgwaozm1r9trcM
         Ei9DMYVGbQzCYpjMXZ3249pOtYQIKvwFpUgiMV80XJvhGQ+HKTQptxqZgGSpf9zv9WQg
         lT3tF+jiHDwWlH7gE1/IWzxwZkwOTXixYODqcm22qLASRE32SeMgAHNymesKkX8hHXSa
         iZniJctlnTVB/v9AB+U+J0ntcndReZJta3u76IHTtRCvo50GBbaDvdzLYjDSnZq+OuYz
         8W6Q==
X-Gm-Message-State: AFq9FYIya6ImuGgkgWA5k4Su6DFnuGnbf5KcLFFnbMYiSdpXYDYYppXc
	E2WHHRAW7YoSq0I3VG4f7YKeFdAbvC36sdyRBa7+pCXnFBAUy95gfTmg/1UO54ZA/ACO7wiEF9E
	9dwZW
X-Gm-Gg: AYBFou16kEaRkFBkWu8kPVB4C08nLgCozIJWtnv8OYUPP5wvSIuXmIV7Iyp3ItRSH1J
	4IGcPENypMw9D8/Ya8z4E9kdm2QQpIriNUlZsgiryHm0JoZcMpaoHr1qcY72Qn2gJA8q82wO4zE
	ObxoouzSbGX8oPYdSg9Ef5XMu1FBIltN1uAK5D6uXTzW+f0S23q0YMsy73VLaTw55QZ15eo5QgY
	f3sks3CPtxyyxr6sAx98v+WLwxDfmc7F3DyVuq3glCRqRQfrqKa2V6L2nDbJHF68jiyLj/i1VuT
	kvNVdVoab26owJBbWxJLe0neXK55015gmfcmreTwOBqvIWxBFsU6vXzY0hRpxxlVRCNNyq191gQ
	5ppwm2wO7RmX1fvPaZwpyLcRwS06WZu9ZVeBY3e9JKGYVfzOKTMxqpf2MNKkajggpsNNNC85RM3
	TgKJ2YDttUAS3TLx+T7GGvGiQYIAlLD42CwGPsArKCbkxY5hXZZAvcitf1/6+6Q09PR5ghoE5lH
	ARW63q1ouqMJxw=
X-Received: by 2002:a05:6402:a0d6:b0:6ac:b861:dab3 with SMTP id 4fb4d7f45d1cf-6b17c296bf6mr11720589a12.39.1791982957834;
        Wed, 14 Oct 2026 06:02:37 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de0ab5b03sm12608292f8f.30.2026.10.14.06.02.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 06:02:36 -0700 (PDT)
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
Subject: [PATCH v9 2/3] dt-bindings: arm: altera: add Draeger M48 dual-cpu board
Date: Wed, 14 Oct 2026 16:02:25 +0300
Message-ID: <20261014130228.2780803-3-petko.manolov@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261014130228.2780803-1-petko.manolov@konsulko.com>
References: <20261014130228.2780803-1-petko.manolov@konsulko.com>
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

