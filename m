Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A79F13EDE6E
	for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 03:13:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789701220; cv=none; b=I+LzUw1F/TazZZ33pzLZT2UI1USkg4cOMbqMcvK9kYAIJhfUyqS7RTswPqGYvG6ivnPKSsbyEz3mOEe79VEXURMooIeBpWPtAOf1594WV6QS38vhBOz2yEjpJkBYYo6y0qcqw8sebBc9DxuwsVAmTzSFwSRuvsSdVcQM8/ubqqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789701220; c=relaxed/simple;
	bh=fuiyPDZncbmrS+1tzoE+tYoQNhb9wDdhb+YHTNeEIbg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=F6J+JLmqKgDaDxEmzBAnlevkn9QCf2wIN0It4ECmBTSJpCcAffK3GZxEvAyM3gKX+jW3K/nt896KNsfaI++urotSAzms5dZaR+WqepGyu5r92jxAPCRW70SpyuCO3E7abGaLTDUx4++B1OQQnZ34rAMutIKwSVDM8xXLO1d0ATU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=asseily.com; spf=pass smtp.mailfrom=asseily.com; dkim=pass (2048-bit key) header.d=asseily.com header.i=@asseily.com header.b=bC2+hRuj; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=asseily.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=asseily.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=asseily.com header.i=@asseily.com header.b="bC2+hRuj"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49b91369d18so2108055e9.0
        for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 20:13:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=asseily.com; s=google; t=1789701213; x=1790306013; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ANatdXebkZ1BuiimhU4+FlWt1nvjUZ5NXOb6LB2ATX4=;
        b=bC2+hRujem4bueLxqDnu1fTrJ9ggKzkCYYmibb7szaANrjpfotZ/BmCpt+mW11D3Ap
         /QERKtD2YpHugSrBol2/DtfDlyTCK3f4BT8DcgfsCpC2nujzFRnjrCqdiB2ADcIK6jZY
         4JPkoskg4+ZJJj+S+b5epuKuQ5V4asWkyx0/t75q0ZL7s8ce3pWiglfq9/k36ZTMhIg8
         iLLyRYpTPfGh7eWy7/6jF15s0+mu5Zu8sb7ITTykKeRMeqPqBjImObZ/otZt2DAkr2GZ
         UTyB5/gByAAxwQqdINMjeWIbuXjZWK6L8F9FmmuqXIgCXBq75kVaaaNSfx8ys5AXlFDc
         9hCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789701213; x=1790306013;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ANatdXebkZ1BuiimhU4+FlWt1nvjUZ5NXOb6LB2ATX4=;
        b=oLxgKDCvPeLvIoWLOiwnPy6ogO4MFQSvx1ox0BY2HUftu0cJe0ixyyoZB9nwugCvit
         YEZnfmnZnUp2nR1D2Xrv8uUZXVW0UTT/kS72fpHmUnZJVkrqKVBa4gp4CGQF6N6VVJKf
         0AsTGGulzlg08CRQR1fhTkar/AQHrySz12zqXVTPiKNBSbUfur0tfmiaUk3Pekq0KvRI
         YxIyWq//xW2gPoCA1hgWZ+s9YOL1qKlsr4wuHJgsXlcUjqdpJILOX3LNIJ9ajj730OJl
         3Lj3wKCZRz8RlcrCE9D1eb9Wl/UjRyQfsSJrXXSt13aZmPZQudu8nhmy0fADvLsBQvA4
         jSZQ==
X-Forwarded-Encrypted: i=1; AKwUvByvroNJb+3FXDnZ0o8j/yNtQJrt5LJDv/WP94/yhy7P4QJuVEYv3RCzw6sGarwaagHKXyqkuk0YSWyh@vger.kernel.org
X-Gm-Message-State: AFuF++lK8yjtkItOOoH3jhsKFLbyAaf6+Ukm/eq0ZxuMrVyUPq798MXc
	1SIufBeU8NZjpP+iQdaBLdktUtNy6wvA3cEGphf46oXRChEA3gKoQzV5Nf5OdxPtdZs=
X-Gm-Gg: AYBFou1Lg5cqfBO1kGJoPxxMdlchM206xs6xHB6ZgQ16IiwOSH9qx2fdswuKDfDGVPy
	LqbWJqcFXuSR2lxEWowhmB8GUEwvMBbMf0QYG/bZP/F3Ze49V+CIjP5LNIexyGnhNis3DUy+g1z
	30WKEqbi7WpthpnM+2EOO6z0JOffCRTj0F+0peYpUDvx42rCccKx5zqbbQxEMwFpLh9xajiBwMz
	LZqnzicRe3xqI2n7kFWm4TajkhXoOItNAJkIDZ9rMQBzr1okS9JPU8DaUaFDOeWB7QTDwzbpn92
	0sD/npyiglWqG341OcMzC/fs8fF42FR/8BGDPLRPgRHEOdklqwQiUMBV6+jo60BWoRVAmVp4oKG
	fW7dkEqHg5Q4NYx6itCOmZNy8yRHbe9Son6N+Vd/tKEtO1x6XCR/bqXnHm8TK5ub8042mmsc2rM
	+ipLuy27bZSf82wQR+gM2LW2RvNP5Sp850o37d/sXT0kpuVTfk9rdVdUFNe3YxmbPSld/Otl5EN
	0ZhDS4+S79MzA==
X-Received: by 2002:a05:600c:3f18:b0:49e:6c47:1433 with SMTP id 5b1f17b1804b1-49fc5868a9cmr9307825e9.33.1789701213006;
        Thu, 17 Sep 2026 20:13:33 -0700 (PDT)
Received: from Behemoth.triland.local ([178.135.16.163])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fc79bdc35sm14533685e9.0.2026.09.17.20.13.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 20:13:32 -0700 (PDT)
From: Karl Asseily <karl@asseily.com>
To: broonie@kernel.org,
	lgirdwood@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	perex@perex.cz,
	tiwai@suse.com
Cc: linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Karl Asseily <karl@asseily.com>
Subject: [PATCH v3 1/4] dt-bindings: vendor-prefixes: add ESS Technology
Date: Fri, 18 Sep 2026 06:13:23 +0300
Message-Id: <20260918031326.68542-2-karl@asseily.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260918031326.68542-1-karl@asseily.com>
References: <20260918031326.68542-1-karl@asseily.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the vendor prefix for ESS Technology, Inc., maker of the SABRE family
of audio DACs. The prefix follows the company's domain, esstech.com.

Assisted-by: Claude:claude-opus-5
Signed-off-by: Karl Asseily <karl@asseily.com>
---

Notes:
    v2: rename the vendor prefix to esstech, after the company domain

 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index ba200296937..ff4a85f4cbd 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -559,6 +559,8 @@ patternProperties:
     description: Seiko Epson Corp.
   "^esp,.*":
     description: Espressif Systems Co. Ltd.
+  "^esstech,.*":
+    description: ESS Technology, Inc.
   "^est,.*":
     description: ESTeem Wireless Modems
   "^eswin,.*":
-- 
2.34.1

