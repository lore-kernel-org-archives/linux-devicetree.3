Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E67094183AE
	for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 17:28:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781544492; cv=none; b=oOfY7QnoH4YLNc86yP1mmpPaeaoklKcrZSVAWx1+HY4/Xvq/b+bThBJ4YzyWFZSBwIK6Y4vEcdmBSEqShuhPkAsBmczaCLY2D2gF5XPEPL74S6hjmUJHCWujybxYA6Zp2/bvMEHtFBWGCf621BJjF56qYpw5uxRt7sO/MV4DT1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781544492; c=relaxed/simple;
	bh=44wlK79p2iFBlaDNEJYYoVrsZ4V64y2DhfrkrngDWyE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=S+mWeD8G4ck/ldT5AEz8JbokJFsr0ERK8C5J7RYNzjj0BRde5YQAgocxZCNeEewRHPY4mJeeX+mYb8plKYo5x+fo1WQ8qxZN4IwOff5/8NbjcQScWj2d5Kpp22Z94Nn5TQIPMgaWzUqMYTPYwen+O5rrEVLAgE8Z0yfPNq6eYrw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oq/iAIMq; arc=none smtp.client-ip=209.85.210.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oq/iAIMq"
Received: by mail-ot1-f46.google.com with SMTP id 46e09a7af769-7e6dcad6018so3130058a34.3
        for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 10:28:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781544489; x=1782149289; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KaUmQ9JpbnpkUCaTH5UXy4GKoNzMoHaVL3LWpQbAxts=;
        b=oq/iAIMqQZTBJlgNKViBnr8T46zaVepKpiIOpTbXyH+S5pA4mmnJq13vgt4zk8+rU9
         +RkJ5HxGhTBPjVcYSzj1Q03k7mWvket3zUokv4f59ECONFffleVednORbu1teR6PYXe+
         jqZ33h+NR6Bv1n06IIk10/Xmstr0cVxGPhiPcyfs7gVlpWls0gvXEsB8qRKDGnEGIrf8
         bhTNDelHTgxBVXZwyG3gw97LsYsRD1GPCuPWVNuEa+FiWt1xdP7+NCTE86T24Qkqwagn
         Yh4Z5vYtB9hYdFxT6aePvogsE8QdL11FnbH0DagzjgFlizZ/4GWpE6BTlN9Y0UO4et1K
         mWog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781544489; x=1782149289;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KaUmQ9JpbnpkUCaTH5UXy4GKoNzMoHaVL3LWpQbAxts=;
        b=I48NhBhnS7qwzfRkP9FVcfPbK6A8crRmfhe6A05yPwtCY933Uo1DpQr8SHA86npeX/
         c0uczwAGT4R+dY+3m8yUTBpcVpdngVuvmkOe+XkWr1MnbbdW8c1JJWg5pJcnJXkdqKIa
         K+zO/6rnuG3g9SV2T7hCJwnmiqaOMOMl6uGCbt2BBeQOU8sHYa/4ys8Xz6+DXtDwusC2
         EYcl2r/mGvez0daXwG76JnMNtWafqqVBl7FH0tA3PxsogNlo4PQr7gkYUj8P4w7jatBK
         w4Z/F+zPTAGuw1amRRLgqKMFkJY8VCgGU9pAgfkDf6DFaWzU2/p1bCalxED/GW5k6RZt
         vEeA==
X-Forwarded-Encrypted: i=1; AFNElJ+zkYpkEL3czjrUVCKVI3FaTdF4xScwEcwtm2scB0qvYJn/Dfi8RdjuKwvBCigDmGRs+BW9pW5Rxt2O@vger.kernel.org
X-Gm-Message-State: AOJu0YyfYqIZ4P4KVH7K+vvyBcX1Tfr5EtKyZoqoOQG3d8lYuHT1fuHA
	invR7RRGYc+CvS/jAq+vlVAbrcyuPOAXdoudWQw2zZ6LHFGSVS1TxC8G
X-Gm-Gg: Acq92OHIpo4bxSNe2FsuT22O7CeJ/WgLcU/0DUlXyWZYLugHgYxCRNL/X/TibVil2E9
	ogJgyawgzwWwuRfWzm0//Akz2SWTCgtSJ5ngtEdCk2HGPTS6HJicFnJZyIcTGpkX66Q+NrVaduY
	0y29iSosxapNCmLSowlXQUqSo9V+QjwhlD9UDd9FgRj9RjC3wu+w6gW+7giD1L/2v6UvCHQYhXZ
	RdFBLnR7S4LZBgO4l9FzhTdx8gvfvGR1v7j0UrrTTaeB/USvAWuXJmmySEVviv7laLYH4JEKpe7
	q3Ewk8rs0AOxrfziTirXTVmH/iBx21SjRVyFYlvPsoJe9rThB3ubPyoOka4gtugpM+VtxkbeHD6
	18N/Tx6lfLZoWGXZVY+h0EPULlJECQK0upFmSgFjeRXTpuW6qDpI4u9JUwvGezXs+55eTEA6TJu
	ceRhCGWrK/Jgqi2k4YCYPW9w==
X-Received: by 2002:a05:6830:438c:b0:7e6:ece3:80ed with SMTP id 46e09a7af769-7e78e7f3cedmr8432644a34.21.1781544488940;
        Mon, 15 Jun 2026 10:28:08 -0700 (PDT)
Received: from localhost.localdomain ([2600:1700:fb0:1bc0::54])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7e79f451fe7sm4480033a34.0.2026.06.15.10.28.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 10:28:08 -0700 (PDT)
From: Chris Morgan <macroalpha82@gmail.com>
To: linux-iio@vger.kernel.org
Cc: andy@kernel.org,
	nuno.sa@analog.com,
	dlechner@baylibre.com,
	jic23@kernel.org,
	jean-baptiste.maneyrol@tdk.com,
	linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org,
	heiko@sntech.de,
	conor+dt@kernel.org,
	krzk+dt@kernel.org,
	robh@kernel.org,
	andriy.shevchenko@intel.com,
	Chris Morgan <macromorgan@hotmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH V13 1/9] dt-bindings: iio: imu: icm42600: Add mount-matrix to icm42600
Date: Mon, 15 Jun 2026 12:25:44 -0500
Message-ID: <20260615172554.160910-2-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260615172554.160910-1-macroalpha82@gmail.com>
References: <20260615172554.160910-1-macroalpha82@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Chris Morgan <macromorgan@hotmail.com>

Add mount-matrix attribute to schema. This attribute has been supported
since the first revision of this driver, but was not documented.

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../devicetree/bindings/iio/imu/invensense,icm42600.yaml        | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/iio/imu/invensense,icm42600.yaml b/Documentation/devicetree/bindings/iio/imu/invensense,icm42600.yaml
index 119e28a833fd..9b2af104f186 100644
--- a/Documentation/devicetree/bindings/iio/imu/invensense,icm42600.yaml
+++ b/Documentation/devicetree/bindings/iio/imu/invensense,icm42600.yaml
@@ -53,6 +53,8 @@ properties:
   drive-open-drain:
     type: boolean
 
+  mount-matrix: true
+
   vdd-supply:
     description: Regulator that provides power to the sensor
 
-- 
2.43.0

