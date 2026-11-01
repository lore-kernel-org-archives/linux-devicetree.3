Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793570642;
	b=4GI+MWp6frloy9v/K1o6FqTNSb0NB12OfmEJg170Fka7UUytTurjQvSgiALMPhCXKrVz
	 hTH+wpUjMC5uLyeaeHaDoWAx3Ky6AZ86fOhClA2KpJ3NpWt4aiqm+JLIJT+Np/KJPyIOV
	 gA9irnEYFd2WYbeLdIhVfrggU8SSj/Up4BUaFaud0jmG7zgg/vn4v3XWM3XZz6dc47xbK
	 3IlpvMcdWSJIjs9FMSSlr7FQTbNkAIJLCuBTWzjV9SlSgarkZSEITrkl9PdM82wViJSrs
	 muE/RsBXEoXWU1gjDWo0yjJlfbF6jyynnolzS9992dZE3CQp/YiNOysZnqalKNTIYpw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793570642;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Ho0e6UH3B/lTO7/cNrPQ+T0vKlpGOthjtjXw3DfjY1E=;
	b=veBVLYXsIFtSi3jeGYMTsNWrig/bA1TiFWAWibhOH3Y6sj9Rv/BAX5LTr+w0oMv4w9RR
	 +5ReIMiFEepwyzV1QfmLtbjK6yXSQ49s0oW7IKMBOxMpeG5PhLQ8D4eCN0FtEFaahyAax
	 SgAR1FRIsN3ahY9UYztvrmYE95j28o01iWZX/zuRGg3L3FxXQx88qtx31O0QxTC5O5SuD
	 c70SUyLWv9kjo4y9JEQHWCdW7/RsWfYNFIBk7orNbYsPMxoksAKIEwOWbzRnSp14OT/7O
	 xBxpK+GZ+oC2X3zMCVwjJG9V9cLm+nTKvicLYPvwAW1ZykJcdp6P5Uz+2JDfYGgFW2Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=GaSgdJxT;
	arc=none smtp.remote-ip=74.125.82.49
Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54C84606A33F
	for <Devicetree@vger.kernel.org>; Sun,  1 Nov 2026 22:03:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 54C84606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=GaSgdJxT
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-170135e43c7so609475c88.0
        for <Devicetree@vger.kernel.org>; Sun, 01 Nov 2026 14:03:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793570636; x=1794175436; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ho0e6UH3B/lTO7/cNrPQ+T0vKlpGOthjtjXw3DfjY1E=;
        b=GaSgdJxTLy10oRGBUy+bumWaJoY0ilqCBp5x8IueoDNSq0ZP+pChyin7C02xb0+Twa
         KmyrEo/I4aSqqvlt6YkQFJr1mai/KzWfssltGOnIv3kHOkAFb3llhCmGIhtwGcT0krYc
         PhcgB/5PZbP8eZ3RAY2g7KLcs8+I7AWbphZTo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793570636; x=1794175436;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ho0e6UH3B/lTO7/cNrPQ+T0vKlpGOthjtjXw3DfjY1E=;
        b=uXLJItWiXd5DRu8LCfGOcv70tRmpT+RxHrUxLeIcAE4h9wQjgE8PiNokjofiiMmxb2
         zdTj+i6YfPPbbn7ITXjxXwl9L/PHgu2P10X8GwB2SVKA2KZsia8nO7KdPpxw+avhQHKa
         NiaQ1zrnlq2DMQ/oYm41pncbgv6Oej6xl+Kw629v9DNYQHNREJuAloN83r1q8lUbtsRn
         ALVdODqCykkVGcqCo/pnwEjQq06MbypVXiqLinVxZvSDQjoBS2HsYF6Y533oINa5UnfV
         kzmkTTAYZBDydrGzJXTEuAp5LeGgKWaIPeixK913pmT9vZ1QZA8GH5Oy2IZ29BtO8/Wd
         ftGg==
X-Forwarded-Encrypted: i=1; AKwUvBxMaP8A7XOS9bT8o5VVZwcMpXu2Av6xTF/EgYrEwI80sGDRG9QRkaEtzxoiiqR/jhTI9q0qTdpwcpTg@vger.kernel.org
X-Gm-Message-State: AFq9FYKas7SiXhkBkofMI7aluFGFBvkir97Gry4vgXtickI9VV4R070E
	ZsN1j8jHsAZ3n8ccFUmZHn1Jz2dzYWRCu8HH0n185WU6V+DDc6nXpN6GXrw5b+q8JA==
X-Gm-Gg: AYBFou2OzB6PFLL8Q7QoOFR9dg+qQ8gPywVEdbIddVyONjIIaJvFwRT1BH4UovykBWU
	AC2hiJJIY2/UxrC1DzXu4F1Y+ED+h0fdSGVKbXJxcu11n8uSywgaoVWroenmVb5Jjayn1l24ycX
	ny868d0NDxd8pyreeoh4UoQujAFb+ydFnGq50wK6rn6bY/Ai8sMWIVWYh0IM2sypdC5k0+ZvnYL
	CD96hBpqI6eKekd4yl2Xmyzv3z/Ufsi6nzlsooQDtMLhDl60GCNge5fOtabe5lWzfMZo/bSvBin
	yf9asjlX8UUC2Viy2W4A6TLA+E7Pur4CAXy6fconqbLFPGM8tQK5wLS+UTUp9jW3vbhGd/WofIJ
	tda/woqd0LbH0MlPfXUxPDN/R4VIJ56MlybaLx89g/h+ryDKtfLEb7byl+H/SwCxgwGqfQ1ZeOQ
	/XebGe2Jg1bVMULKf4pAKBBHNGRG0oD4sx8LEb3vvRbtXrY9YzJQxncRJvUaaYMTvf8kZgWZEHD
	Zb+zfJUWpaMfi0Nfy8pl86tCPCEjRwQCTZorfR9NCmh8aUb8eG0xZYdyY8r8mEo6M/AoTSKmvOW
	I9n5S6SnGXTCmrH4OkyT58axkAHs7+Ne12HK4iEBhL+mf6H6jNWVAKs8BLsSOOQR69Gg7oXaZj8
	smFVNrJ4Znk/95A==
X-Received: by 2002:a05:7022:208a:b0:1b0:4272:4282 with SMTP id a92af1059eb24-1b042725256mr5453515c88.17.1793570636332;
        Sun, 01 Nov 2026 14:03:56 -0800 (PST)
Received: from dianders.sjc.corp.google.com ([2a00:79e0:2e7c:8:cbd8:5ca8:653a:11f9])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b106edc7f8sm11097266c88.9.2026.11.01.14.03.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 14:03:54 -0800 (PST)
From: Douglas Anderson <dianders@chromium.org>
To: Devicetree-compiler@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: Peter Griffin <peter.griffin@linaro.org>,
	Saravana Kannan <saravanak@kernel.org>,
	Devicetree@vger.kernel.org,
	Simon Glass <sjg@chromium.org>,
	Chen-Yu Tsai <wenst@chromium.org>,
	Julius Werner <jwerner@chromium.org>,
	Brian Norris <briannorris@chromium.org>,
	linux-kernel@vger.kernel.org,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	=?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@linaro.org>,
	David Gibson <david@gibson.dropbear.id.au>,
	Douglas Anderson <dianders@chromium.org>
Subject: [PATCH v3 10/15] libfdt: overlay: Make fdto const in overlay_apply_node()
Date: Sun,  1 Nov 2026 14:01:17 -0800
Message-ID: <20261101220224.1436242-11-dianders@chromium.org>
X-Mailer: git-send-email 2.56.0.317.g454f8302e1-goog
In-Reply-To: <20261101220224.1436242-1-dianders@chromium.org>
References: <20261101220224.1436242-1-dianders@chromium.org>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

`overlay_apply_node()` only reads from the overlay blob `@fdto` while
merging properties and subnodes into `@fdt`. Mark `@fdto` as
`const void *` so callers holding a `const void *fdto` pointer (such as
the upcoming `/__local_fixups__` update logic) can call
`overlay_apply_node()` without casting away `const`.

Assisted-by: Gemini:gemini-pro-prerelease
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

Changes in v3:
- Split constifying fdto in overlay_apply_node() out of "libfdt:
  overlay: Update base /__local_fixups__ on apply" into a standalone
  patch (David Gibson)

 libfdt/fdt_overlay.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/libfdt/fdt_overlay.c b/libfdt/fdt_overlay.c
index 36f2377cf7d8..4b3e17bd087e 100644
--- a/libfdt/fdt_overlay.c
+++ b/libfdt/fdt_overlay.c
@@ -821,7 +821,7 @@ static int overlay_prevent_phandle_overwrite(void *fdt, void *fdto)
  *      Negative error code on failure
  */
 static int overlay_apply_node(void *fdt, int target,
-			      void *fdto, int node)
+			      const void *fdto, int node)
 {
 	int property;
 	int subnode;
-- 
2.56.0.317.g454f8302e1-goog

