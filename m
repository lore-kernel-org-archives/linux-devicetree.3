Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B364E39FCD7
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 20:23:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790194991; cv=none; b=IGLy6HVXhgd6ZitVkB7g9MBsUSToQfTMmU2Gj4SdE9lkvbi3EmO1sAD6KQqrLJ9KkiikrOOoDkMc/w2g3wNHEKql9u8KNVpCEH5Gvzowt/AmBFxzWleN9RH/x0y57UIF6ZuDuIFprJ84gc/JkGy5ZKDUwJ85oUhodR+caRUlbe8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790194991; c=relaxed/simple;
	bh=IKu+NW7V12nnMBgKKHdP7rj1fpU2GspG4UzSnncTVMc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=U+YZkYyR7P0nMsoRpKIzbPO6JK6GUWOTLNk78HmO8LfZ3dScz/KpUB6qpf9sNp9iHVQ32gy5jqobR9hmaB/lkEviybhkqMwVyT2JjnYRTXVmh8U2sapKo74uvLjrP/PyvD6PnQNZgc2EMK5ejmEkspy4ilY3LfARC9V60T9vW7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VP3eZawc; arc=none smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VP3eZawc"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c254f560398so182670466b.1
        for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 13:23:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790194983; x=1790799783; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qQkzg0CGegWquCnbwRamX/sZPF4fvz02MpKEACpVE4E=;
        b=VP3eZawcfCqhXEKT02y1EkPiImNqUQJFySdTatlLfPJxzoQjIhZS048w/xfRVLz5Gs
         upkVCy4FQwfQXVk8+p5kZQG7aHYCjikf7iJ7elwz8XC1d4UDuCb0fgnertOy5dmwF1EG
         BDfzjtFSgVCjUsQIpkQTfAKhvNVY30NIJNQjyygyeFksSv6OgFBdpcHEKyMuBOmdzRSa
         RXKCyVJSeOA+/uWUrmUH4+grPlg5dN9TqmGCWftv7q/qB5Uh3H0Aap5w1A0GBLzyCFZ0
         iucr7mIq+0LXzeHw+ZzInHZFAudO478yw4YqhT4NgtUmu5dXNmlRyRX8TdNLgCh9CuFe
         7hFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790194983; x=1790799783;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qQkzg0CGegWquCnbwRamX/sZPF4fvz02MpKEACpVE4E=;
        b=cD2feRNxxqhAVTouSrwsH5I4dB80OBfVrVR9zfRAZrsoGsJAm4R3WyzYA6V9+SAFA8
         WNX5Fl3gZa5cRl45hOijMv65jIBbDqPSntKocNKo0jr7wdcBkg3sySYMHrybG8ZojTmc
         IUH1iZklw1IPR5Z7i7HIPK+cuE2ss6Nle2PgyriPcl9yv25w+YGBKhH5UX5lp5xk54qp
         gZxadLXT/u1X1b1AtXhHYdkL2SwMvIxl+mm+qxdk6Sl4zLRPvV7fdw9ByqYwf0aYEFyY
         1n3B3JEOYv3zcD8qUEuPxQrBIYYIz2V9ADM2CLErYfyaJKlOrbMW4td+Uu1ewUThKhEK
         BYgA==
X-Forwarded-Encrypted: i=1; AKwUvByniNc0qtlj5dXoIA7MWbJBKdRbKpVC2KxI4IiDnxU6o91oxCuB606JKv/+mwhSGmLenzALeuOun+iH@vger.kernel.org
X-Gm-Message-State: AFuF++n/uM3wIGobB9FNJyIu7iQ/o514Gkz4xCc0kCvAiRPuwtRr+pFQ
	cs1xCV5Cv2GPxtG8d3Rj9ihm+Xo0QptuN+Hzfbib7c3NtXE7uYocgqex
X-Gm-Gg: AYBFou2d+b0m/46Ao+e5C5snIVkhTd4K05DxJilX7R970/Tz8kKezTDg8LxPUESrCk3
	WOnVkk+pUFlkyP3FRHkOb/3j1Hs7h76n4MhY8XfI318BOiqUtGcvq70jRsgoT4kvGyjZgUB7bK1
	H0xqjqiLtrGnn6uSGr0QXvJQhj5Nef6CQ6sAkhdJ5l9xyzgVS2qL+2wbmmKE02Rorc366t5MzVz
	JiyFnai5h7EfdKene4aYy3V1NF/dl17RF+AhmflWpvhVVKfEPlTqncnXM2FqdAV7wPcf2PUQIFC
	3j04w3BZOBkS2exZGnJawkSLKUd4vP7Xe9WA75MhsqxpJfsxBTDLMuksEtQwygK8RTzWQBbqItC
	iwVvFM/mrUNUyUxWdQZjDqf0IkIo9M+Zmqae3t/tnhJ03ul04XQ+FWrrCUFl9Layz527LVw0+bl
	G5fVGSoF+g6JKd/HNdaM0C/+IKZJI//ArFX+ncPJpkN8HQ+jWuSaWp4jpN1x50Fs3tuxXupDN/R
	MBRX7eDOzSTgyfwF+ZUQxrIq2GbQ3D3
X-Received: by 2002:a17:907:a893:b0:c29:4915:83cb with SMTP id a640c23a62f3a-c2ac262664fmr19261066b.39.1790194982908;
        Wed, 23 Sep 2026 13:23:02 -0700 (PDT)
Received: from debian (ip-78-137-176-146.broadband.digiweb.ie. [78.137.176.146])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2aae5c8a44sm177243566b.20.2026.09.23.13.23.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 13:23:02 -0700 (PDT)
From: Pablo Mazzini <pmazzini@gmail.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maxime Ripard <mripard@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Samuel Holland <samuel@sholland.org>
Cc: Pablo Mazzini <pmazzini@gmail.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rtc@vger.kernel.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH v1 05/11] dt-bindings: rtc: sun6i-a31: add Allwinner B288
Date: Wed, 23 Sep 2026 21:16:55 +0100
Message-ID: <20260923201701.43391-5-pmazzini@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260923201701.43391-1-pmazzini@gmail.com>
References: <20260923201701.43391-1-pmazzini@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The B288 RTC wires one alarm interrupt, not two.

Signed-off-by: Pablo Mazzini <pmazzini@gmail.com>
---
 .../devicetree/bindings/rtc/allwinner,sun6i-a31-rtc.yaml        | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/rtc/allwinner,sun6i-a31-rtc.yaml b/Documentation/devicetree/bindings/rtc/allwinner,sun6i-a31-rtc.yaml
index f2b91186ed37..1699e3576b91 100644
--- a/Documentation/devicetree/bindings/rtc/allwinner,sun6i-a31-rtc.yaml
+++ b/Documentation/devicetree/bindings/rtc/allwinner,sun6i-a31-rtc.yaml
@@ -19,6 +19,7 @@ properties:
       - enum:
           - allwinner,sun6i-a31-rtc
           - allwinner,sun8i-a23-rtc
+          - allwinner,sun8i-b288-rtc
           - allwinner,sun8i-h3-rtc
           - allwinner,sun8i-r40-rtc
           - allwinner,sun8i-v3-rtc
@@ -162,6 +163,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - allwinner,sun8i-b288-rtc
               - allwinner,sun8i-r40-rtc
               - allwinner,sun50i-h616-rtc
               - allwinner,sun50i-r329-rtc
-- 
2.53.0

