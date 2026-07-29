Received: from mail-oo1-f48.google.com (mail-oo1-f48.google.com [209.85.161.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59A2C48D88C
	for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 13:36:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785332204; cv=none; b=OvZynQsClnTdWPj6Ka72jwnWMnBwAZ0Xxm1hjg1bwKrmlwOApsxAFsbXYDgh1KonC5+mGaFWUXN0bxyzYRfNM3j6woWI7t/OBfTXGuwoms3uVAa6+H5fYw25oJ3kRtBGXnkn/ecz0U57R3zXVsHJtBGWMI8IU3jh40BQEwdiJYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785332204; c=relaxed/simple;
	bh=e+PGA6Tp96qbvjcwNuYIZ7UQlT/FgJkBY/2m645lKPU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jU0KVBGBzF1ec66849czwKeA01vi6D0xSF0erymDqVJ1+lP6+BGDznWHqqt42u2EKxu+SBbvsH1X9H60oqjnTFRmjrXtqCcUP4GU+fMxvCgvvqwxwCEPSvcxvrSjBGAI4VZ5nStZo2/bCwfjTy4aStgw5L7QdwTxWQ3yUns9xfY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=N2rfhDNu; arc=none smtp.client-ip=209.85.161.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="N2rfhDNu"
Received: by mail-oo1-f48.google.com with SMTP id 006d021491bc7-6ab05b2f9daso369349eaf.2
        for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 06:36:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1785332194; x=1785936994; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ESgTvyFk5x4edZWjL4sPAzl2lLq+eyEVMxFH0mwAGdQ=;
        b=N2rfhDNu88Bq92oPVx9OFmfv1FpZ9cWxU5vHsdbGu7l7dXLx52JdRQ+4IjAgBvZ43U
         Azv5PGAasGBzdRh48OHZ51t5yNOZSEoZXGir+evkFj9WUJEkSLG8aQqWTfwEKK1WTvVE
         Vus+5OWlOtqqDzMwpspvcyHnvseLrKw9PhdN0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785332194; x=1785936994;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ESgTvyFk5x4edZWjL4sPAzl2lLq+eyEVMxFH0mwAGdQ=;
        b=qc8KXg/Si4Yx8UfGIpuBznVFQAlUvnPDtiWMCXkwfELuOMy9rf7xptTh2m4Kx3aFcz
         baa1cfevk6gS0u50IAf0un0gxvrHQkaXwYowD0UU/R/SVxUk1bFjapTBpdM5LH3sMb15
         GHZhmrN2NCxSVyyEtXnfyymqU7wbRfw/LV+2PGpA7qc5/jqyZ5WnLbCcq0mujcG0IaIu
         6UXhUyl2J99wNGT+/tiG0zqhIT3HVLWkLM78yXucc+3nCCyzG/jWn0t15I7qE8Vv8kZl
         3kjLb0dQi9p/jGneZd++yBJjrPhTOX1fHsPG1S7F3g9pgl1QHxE6RmprKHuxr4yP9BHY
         N7yw==
X-Forwarded-Encrypted: i=1; AHgh+RpFjQ8bRrP+sQwK3SWvawP+Ie0pSfbBDjFLGZWorrn0DMGqZFkR1VdU/oiNdO8Ip5VhKZwWCqvtf9i4@vger.kernel.org
X-Gm-Message-State: AOJu0YzzrTMU04ObrewTWox4CQqxrH7XksvA5bNn/PNF+jaYuRfabH0P
	aA7UM0dhzAtT7UrqXVMg22mnSa0fncVW5o+5aIjjRcLZifY7hHPSJ9dSTLj31wWIMQ==
X-Gm-Gg: AR+sD13EgBBYxxRouFd9ecJEkZiEb31oEZeJs+Za67AaTZ2hjR+OWxIwi2gJBIupYYm
	iNx+qhSRVZxOhMRzeT7/yCcjDw0QGO+As08moweSViJyNOjzS3Go8sDlye5ajik52mPRgieQnzf
	nJ949rvUsyG7fMAPIrhCsS+naBssGBu/6ULWNF2q+8lF+exV44EoE5v2KURVHfLwbnwQPfruaBS
	XLJMrs4LMAzQLQqnxoJK74j3GBBakuypQ24j1JgJ8+PVPi1ctPg61AJ/AkxzuwMm5+OG5Selzd1
	T6f7mlVhjvUoUs52z74Iqd3mePVS6OR+f9iYDmkeRjMZZCLD1IiFmL1g2ft9Eb2oGUtGbmE8j6d
	Ve9kdySHJ6H3Wjj1LzIZL7szSHtJNN7Zv5WV3NKNaVmXDBHSropaMyKl1MbXrZziW0KO84Sk5N7
	/Ou0NNFKG+L4TnVTE4fNMQlxrX/ObHcDM8oh+oLhMqHEWP9uAlBIZ1riU=
X-Received: by 2002:a05:6820:4c89:b0:6ab:5b3:2fb0 with SMTP id 006d021491bc7-6ac96bdd68emr3516421eaf.42.1785332193876;
        Wed, 29 Jul 2026 06:36:33 -0700 (PDT)
Received: from chromium.org ([174.51.25.52])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6aca527fe83sm1956196eaf.6.2026.07.29.06.36.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 06:36:33 -0700 (PDT)
From: Simon Glass <sjg@chromium.org>
To: Heiko Stuebner <heiko@sntech.de>
Cc: Fabio Estevam <festevam@nabladev.com>,
	linux-rockchip@lists.infradead.org,
	Jonas Karlman <jonas@kwiboo.se>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	Simon Glass <sjg@chromium.org>,
	Albert Aribaud <albert.u.boot@aribaud.net>,
	Chukun Pan <amadeus@jmu.edu.cn>,
	Conor Dooley <conor+dt@kernel.org>,
	FUKAUMI Naoki <naoki@radxa.com>,
	Jeffy Chen <jeffy.chen@rock-chips.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Michael Opdenacker <michael.opdenacker@rootcommit.com>,
	Rob Herring <robh@kernel.org>,
	huang lin <hl@rock-chips.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 5/6] dt-bindings: arm: rockchip: Add Luckfox Pico Mini B
Date: Wed, 29 Jul 2026 07:35:52 -0600
Message-ID: <20260729133609.3465563-6-sjg@chromium.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260729133609.3465563-1-sjg@chromium.org>
References: <20260729133609.3465563-1-sjg@chromium.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the compatible for the Luckfox Pico Mini B, a small board using
the Rockchip RV1103 with 64MB of in-package DDR2 and a 128MB SPI NAND.

Signed-off-by: Simon Glass <sjg@chromium.org>
---

Changes in v3:
- Place the entry with the other Luckfox boards, in alphabetical order

 Documentation/devicetree/bindings/arm/rockchip.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Documentation/devicetree/bindings/arm/rockchip.yaml
index 1a9dde18626d..ddce8d1b5a3c 100644
--- a/Documentation/devicetree/bindings/arm/rockchip.yaml
+++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
@@ -791,6 +791,11 @@ properties:
           - const: luckfox,core3576
           - const: rockchip,rk3576
 
+      - description: Luckfox Pico Mini B
+        items:
+          - const: luckfox,pico-mini-b
+          - const: rockchip,rv1103
+
       - description: Lunzn FastRhino R66S / R68S
         items:
           - enum:
-- 
2.43.0

