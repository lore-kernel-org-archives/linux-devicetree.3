Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79372391513
	for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 18:29:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784226545; cv=none; b=owZvp0nt7/UVI/jRN7phO6odOe/Y3GlC28M2JCTZ3CaOiKKmaAGw2RlKD8AsKvFFX+LYFyhudlj9gUUI4UiBWb3LBsTrNGf446y+lZuFDKWKFT5xyUwojHIGuXPkWuT3ktHO6oN/nplupENFV4qO+7Nzfbk5R/Z7uXVMcPsSWfY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784226545; c=relaxed/simple;
	bh=44wlK79p2iFBlaDNEJYYoVrsZ4V64y2DhfrkrngDWyE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CuzVIwu8GFI6qyIWgxOfHX0Om7++mkchr6V+aX3RGc5g92fJZ/Do0YGLQlgtmGjdD7/rZC/+4fvPfx52sETLXGKO8xec286xYgQX0YBWX4RuYc2Lzk+U/A9UD0qPCamRor5y9Y1gECUvgJwk9+Bnb3wmFKb3dEpciLrWdOo0Il8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W8elpYg/; arc=none smtp.client-ip=209.85.210.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W8elpYg/"
Received: by mail-ot1-f51.google.com with SMTP id 46e09a7af769-7eb787dec99so4189975a34.0
        for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 11:29:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784226541; x=1784831341; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KaUmQ9JpbnpkUCaTH5UXy4GKoNzMoHaVL3LWpQbAxts=;
        b=W8elpYg/o17CJ3I5vH0ni9eyjza9a229wrX9ZFHJu867O6vJmLd1OiOPh17zJmdkg1
         /Sp8siVUC6QoqH94RJmrTAmCOT4fJ2tzFQ6HJrNGAL1eN/4v5uqBPaVDgP0nB9dwAQix
         8hQhtugJMI437fpEsnX0qcqwzrx97Jc3TMdG11Aks4z5T8f454a07TbjAiIrxSVddqOE
         SsrFXDOMjltb39SJQvgkIPqGEYxeqzyC6cOCNmo4Qd+d0VwSkutQrEMdFVjhcv0TX4DU
         YldC8XuU3ZcR+h18hsM7I9OaH3Xn/riDqlkJPkE9T64kahrvIIFMWlSkoNTdxTLuO5Gh
         skGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784226541; x=1784831341;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KaUmQ9JpbnpkUCaTH5UXy4GKoNzMoHaVL3LWpQbAxts=;
        b=c5phF79rf1ppsyqY3fXLFETy8O8jHGzMAKlSH/CqNM/BCrXBX10fSt9qTo9i8RGK7R
         T9Q3zfAnrd0H8noZP8EMXXogb/VvwRPQREejv71ILZdpTc6jxyQFmQVsD4Hqtyyi+cpV
         GyT9L+8CWb8vKDcfr7YJ0fvAJ42N9QInyC4iOnlNlErhEL+YAqtrkCotS6JjBK/m8zOs
         23YIHMzJrAZUbZx+u3y005l5Ik7txY5tADkAAYM6orEccOu0+FU0q9OUccXOWqa6kYXv
         oZY5adEmCscyfTqFskcd6B6XhPPe3UETtVsXx1VMN20IB2V5zwna8K39u6Xx6o62RVC2
         gHCQ==
X-Forwarded-Encrypted: i=1; AHgh+RpJarFZFhaQ2fvLHsM63xXgfCFwDAZG+6KcnzbNaKPDsES8SW90di1DLfBtcn14kifC6DxGs9jN0atN@vger.kernel.org
X-Gm-Message-State: AOJu0Yzrh4ZOsfNN8tz+KUxpD3KqJgdmEMk0ybHwrcsAyo4gIogT/u+N
	NvI43gyBfbnex1vi2M4et+Slv3bdBEg/kmFsloUv+YnCqCY7bYwFLfPb
X-Gm-Gg: AfdE7cl0atINP2Hvbfvvxm0U2bv1KTb+6hvEgAPq3ieL9SCsXljmRGeYVrBQMgzDFES
	x4Hr+nrfuSckPSUHc99rT7IFVTzyI8M4xYfblVVyJJ94uKV8fnbx3J/04d+KvnlV4+o8Q8lAeM9
	bct6tQyrwe2R2cHIPLT5srE5StvboS6Kfl+7Ra1v5/UhLURvb77vGkUz/giqW94L49ZkNoeq4cM
	vSzD3MhNO6kTxkpvTTv7+T2YSEWju5H/zBM+YUNF9REFbj4DbRcZ7v0iKLCx+ildhogD1BEJcVP
	6RBKpcXO1bagW5VWQK4nK5XO/HZex4g/B2y+LyH3KjyCQjaVicB807BwNZZJ01awH6GQgMFv3NQ
	PYB3U/2ewWaTczpFawFMKSkNTha4kDEdrHFb3TBh4P+BFAiqOshACkWWvxqjuNE9oiGEKj/5fWk
	vM
X-Received: by 2002:a05:6830:6416:b0:7e6:f582:955e with SMTP id 46e09a7af769-7ec59baf6d2mr5210296a34.10.1784226541322;
        Thu, 16 Jul 2026 11:29:01 -0700 (PDT)
Received: from localhost.localdomain ([2600:1700:fb0:1bc0::54])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7ebcb3f6826sm19939993a34.27.2026.07.16.11.29.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 11:29:00 -0700 (PDT)
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
Subject: [PATCH V17 1/9] dt-bindings: iio: imu: icm42600: Add mount-matrix
Date: Thu, 16 Jul 2026 13:26:28 -0500
Message-ID: <20260716182637.24310-2-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260716182637.24310-1-macroalpha82@gmail.com>
References: <20260716182637.24310-1-macroalpha82@gmail.com>
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

