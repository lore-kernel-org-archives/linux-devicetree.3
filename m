Received: from mail-oo1-f52.google.com (mail-oo1-f52.google.com [209.85.161.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4787A351C22
	for <devicetree@vger.kernel.org>; Mon, 18 May 2026 20:07:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779134873; cv=none; b=BUYwYwbyNoQl4X/TW8fbPLwiLSMKk06xk4tWfk+8f3WN2pH+zeigbpVwneeUNYKtq5SMvjqAO43OkyUuqVDNKoLqGHMme6hFxX4XhtbUtRarSdAqNOKVjejD4b3nF/Kz1pOK1+a+8d0hVsKo1ObqMu1tkGR8MB7RT+i0Jyreu/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779134873; c=relaxed/simple;
	bh=44wlK79p2iFBlaDNEJYYoVrsZ4V64y2DhfrkrngDWyE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dY0lkhD/SdkawepJnniX8MloZ8yH9TvzUjE6iy5+/Qkwjaiuveuze+NEt7Sy6+zWninugJqbLmPq55hDgWkAzwLXJeTx5ANN+DaN4o3oDEg+5X7RMQWxzihX72i9PlD52n9vN+F6SPLkEFniEx0nes6IAwyGM8NWPNXlMoyt9KI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JDaIuxJF; arc=none smtp.client-ip=209.85.161.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JDaIuxJF"
Received: by mail-oo1-f52.google.com with SMTP id 006d021491bc7-69b4f7d66e2so646514eaf.0
        for <devicetree@vger.kernel.org>; Mon, 18 May 2026 13:07:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779134871; x=1779739671; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KaUmQ9JpbnpkUCaTH5UXy4GKoNzMoHaVL3LWpQbAxts=;
        b=JDaIuxJFK+zYos5xVmOVsg9JobL1xkeVa1raweC39aqdFHlkeysXi3rYfYxMinLz3Y
         rGLCO57FE+Ozmh30gZ81UCS+MGtiW4cxPvoKKLoOR0Ov7EA009PuJuSIz34olHNQ9TzG
         6/qo3Ui0dZ0OyvQ70XR7JjopCE4y3Bivo3VcA39SLJtvB9+r1OfsyPLz+aIx/8JjqX9i
         EPjTeah04oarhyy7LRA0GSGNHDQrFobTC800qPp8+GLbwg29yoIco9PkI+oyM2/xpPKW
         oUEl2pwk2OEcTNQl67a/kQ5fWT4H9UyD5lmef5G+HZakrvW5wsWmAGUWQEn1Qs5Iqacz
         iPGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779134871; x=1779739671;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KaUmQ9JpbnpkUCaTH5UXy4GKoNzMoHaVL3LWpQbAxts=;
        b=HCp1jKREk1Nl4cIj9TE0vTx6VAUyhPKYfqAyMpF0BuuuhJX8OjwF1Vp6C4gv0FNL5/
         5su55tefFTnubawlq7eLHv4InvIkHYOdkgyoAN1NZ96Wo/USa8eJ9v3BBTTVk5lde8MG
         mkgAf68Aee8E76JA3OwgIozJZ2X2aHO/mBjpF2yCHOZnObEiIqqTjLeflbb2jLny+oHW
         sJsbQRtELHjKDBAFX28s3P0BuHuvej614q7u4Ol7FzCqhG6QiiSqcKGllUhL/2/pfOb5
         eTzsCEYRAU7YQaWtByOzlTTKNjA9CsDihAOAcaQTxCOt5gBZvK1YeXEPrODQ8X0HqnX4
         MzOQ==
X-Forwarded-Encrypted: i=1; AFNElJ9GPEpAVnOLEPeQvmZaWEpTfFgni3PZmDfHoQpsY2Y6qAUFuu51qdZ5EFv2vPHw/QUSdIc7JlPll5n3@vger.kernel.org
X-Gm-Message-State: AOJu0YyBijErAAGqcJZdIXrQW+DUnpNkEptdNEjt252Qdiv3rVzlMXZA
	CU0DgUsMt8HzEhaHcHKfoc0TYobNIdK5YiXt0l3bikAsI7m9YIcxcs8W
X-Gm-Gg: Acq92OE26KxcMlR6CettM4GSj0Ix1Mn1ba66IVHxpoA0miYDnhT63/ENzH2Lf/z7XAC
	wXyLpj63LMdud8L5iOOHoDVs1TUk1KHFAkCfzSarMgw8D6W5VohUeo9SpEErAtVe7ps6wc+nWAU
	QuoyTWMTR+xFwpucOiMstpG28Embtp2Kx1qBhgmP5DZ9YL3jl2ZnDO/aWzqvprn4OLk8I8bYrCR
	0/Z0jJkmz3UzcDPtd51Y3fgQfTfOOJoeY0evZX0pmjxloy0DGv1zHLKpt6iUioSBmUOTeHJ9Czs
	d5cPBVQ2UCC5DJeeNZWohgkBgVwl0RIQ5RJEDMTnJcRfBvY7Gigr82bbb0IQDiC4qdLdLgDDD+F
	9qFISF7YZC6w/eDfUIl6F2Ev+VC4r+xVTKV+ZAJEiyivEc+ZxPaTYkGIa9lIMLgAU64KJ1MqEqX
	yfA5pPJAoS6uLsU7PPik0w
X-Received: by 2002:a05:6820:221e:b0:694:a362:e3ba with SMTP id 006d021491bc7-69c955c7f57mr9560119eaf.48.1779134871241;
        Mon, 18 May 2026 13:07:51 -0700 (PDT)
Received: from localhost.localdomain ([2600:1700:fb0:1bc0::54])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-69d0462e85esm6113360eaf.6.2026.05.18.13.07.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 13:07:50 -0700 (PDT)
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
Subject: [PATCH V8 01/10] dt-bindings: iio: imu: icm42600: Add mount-matrix to icm42600
Date: Mon, 18 May 2026 15:05:16 -0500
Message-ID: <20260518200526.458421-2-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260518200526.458421-1-macroalpha82@gmail.com>
References: <20260518200526.458421-1-macroalpha82@gmail.com>
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

