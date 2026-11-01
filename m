Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793570634;
	b=hV5FVzLnNWUbfWD8MO0wOnI2j7I5lGsv0z9awHGQ7ZzAcRut1HKNjR2vryThr+JQFgIk
	 SB7E4DBMq/iqUvzERWGV1EauNVOOdItUeLGef4JBVwmCJVmvxbpn/WZkEEmuxAWnmKU6+
	 2XkVpeAnVZGoG26bWVQPepWD0zVOX6wN5e8ree6ak0ghNXIwBMKZIyb4vplQjv9rLx1Cy
	 Wv2EPCptO5ayU5HUIIHBaeaLudS+ePB17yLt8MCPsGjFuWUVImBqtNo9n9J3McaV6kgjG
	 Vq32f5qEJ4k8lvYqCdc9Mqw1THRRRjNdSv2KUk+KFsydH4XZzVWKcyHCyymItiqZHBQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793570634;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=FTgirQjK8v+h6bBIdw7yINH0jFX7wTeSxRtCfIzO3b0=;
	b=VpOFV1JHnqcqugUsLlmw4iK3y+SVrQb1o4rdq8Rk+T77rQJMSI3RPbH3jnLCuVJ4b8SE
	 cPf3nU8EKx9UCASDdvffqkDxJhkEODk6AZeYZJLmCZXH21jyN5H9liAeSjFaDUwYg49Qi
	 ppLFYKlRKOXzeNJUN5+zazeUcmwT/ZtKY8t3w6BusRYYfhF9086ra6NS0bN82AX3TyW31
	 LqoKf8+BBNZ4dXTtwhbzI0+ecMxU65tK0DptU/goYgFcHvVUR7A2TQEzSkZiwnePXsXNK
	 Lsa0QepWuOMawDhD3h0IVtAqmRLq5eIPulsEz+TvCAo6pChpJ8g+R37Yt2V6BMKiNVA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=NDbRPLIW;
	arc=none smtp.remote-ip=74.125.82.52
Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61D57606A33A
	for <Devicetree@vger.kernel.org>; Sun,  1 Nov 2026 22:03:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 61D57606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=NDbRPLIW
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-1931ff67a29so3965210c88.1
        for <Devicetree@vger.kernel.org>; Sun, 01 Nov 2026 14:03:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793570633; x=1794175433; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FTgirQjK8v+h6bBIdw7yINH0jFX7wTeSxRtCfIzO3b0=;
        b=NDbRPLIWhu00ercRXlZ71a+tzkP7hVAIAQUnLdJNmeFgQEpqbfzDjL28+khq0RpBmN
         /i78gByfpNvPgN24KJ4BAJX+XlMx+Apoo/KlqJCwzJiTbxCl1HnrWJo9svW7KofJjTX8
         J1VS0XADlvhrFz7SioNX+Mm/BbRrRGY9zVEig=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793570633; x=1794175433;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FTgirQjK8v+h6bBIdw7yINH0jFX7wTeSxRtCfIzO3b0=;
        b=tx4ZEjnDjiIYAXWq6kgpX0vXugubqwJsryMHf5cu7wWKUuAnB3IsngN7n3w3PDjODW
         6vONomTHE7E/VVWa9sedj7KdtyGw4vuvv7Qz3+wxBNxVnGNTAMDqNp6t2U0pbTKed4P8
         pGk6DmxFxesmpMY6+KljxUuNYN/zorRgYvuwySxT7LQSbW7DWHsf6ZaSwK8TmEtnAfrY
         ivXY4q9IsbTApmY6SYeOZL1s1Hcai9ef8x+RIxqz+iBY4OgmianFrJbXgXtII7WZnLNc
         dqxkqLnolYp9tXBF8zaP/Jzk1M1EfiR9/SHS2m+R8Ilu180xDwlumlX2Cr6W51vUksE3
         LwDA==
X-Forwarded-Encrypted: i=1; AKwUvBxuMUU55xAkEcGzebOnORWQ0dT3135IJicnyzIQ8E+a+gfMCA1ufdLsniPE3RAG6PrO7g8bS+sSeSZl@vger.kernel.org
X-Gm-Message-State: AFq9FYJWi5dofnJg5nAOr1QD3HmauwzG5j636TqqExBti+NKW1DHyglB
	0+aRWYAoqWx8TUD1ZI6lDhgCVZiDHzkwlVOrV+77dVOAXqlC0oFauB/UGh/TtmFUPw==
X-Gm-Gg: AYBFou0bMHkBBB5A4Bp0o54fOlViVZa3EGKmI7UThx3QgqTLpvOCzuS2Hvo9wdeLeKd
	yCoTSgnY8Pn5MQGominxhaTWUE38ZVUSwiKXvx0UH4hjD7PE0PBeqzVjx1E69kquqBhZqbr8JNp
	m1/AMr7zApUG3ffcI5eflPkJ6doJx3mCmA5erWltVJtSzncP0FQWnWnSnZ1jJzGEvQrDGbG92gi
	MFvQqjhEknhzpPpBP4KZ1DbhPuOKsXZ/7ZbsEQdEGOGvwP5Q+9wDhqbQxXKwSAaPladNFHuT0Xy
	/0jivcbz+a8esFbIeQdJpJ1ZHwrZvtqhFX2XlNgcWWsW8QOiM7+caEi4QleWvgcqwVGCRMZ7ZEW
	PgKjpbQSacAnq9sEVHN85/P18aJ108VuuD2oItXYnXiCGDeOhuAHKqEv5wMwwh/SEnJ1NKDdYwI
	f8G051/FFAurXdoL5qxsOIKt8GLbB1Qbgg9B6yfiD4oZf1oXd1Mkx8sdIoZL5pmWlj8rMxYKmr+
	lkn7VWEXsCB735cKs3TDBHKSWTwxEvO9CDVp7Z+buee9U5AA3fTWcBggOzPPUiNxuJ15pmrxkF0
	DZUJ6jsIVhCKEZRFf/tRkA7Pip9V63Nk3U4gZIiW1alkSnAStkMaUlNPsFZ2fBseFkP4ZRxazjk
	HxvmPkNsF7jqMR/c=
X-Received: by 2002:a05:7022:3a06:b0:1a5:1c15:9ea3 with SMTP id a92af1059eb24-1ac5ac4b77amr13607573c88.17.1793570633519;
        Sun, 01 Nov 2026 14:03:53 -0800 (PST)
Received: from dianders.sjc.corp.google.com ([2a00:79e0:2e7c:8:cbd8:5ca8:653a:11f9])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b106edc7f8sm11097266c88.9.2026.11.01.14.03.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 14:03:52 -0800 (PST)
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
Subject: [PATCH v3 09/15] libfdt: overlay: Prepare fragment path helper for reuse
Date: Sun,  1 Nov 2026 14:01:16 -0800
Message-ID: <20261101220224.1436242-10-dianders@chromium.org>
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

Generalize `overlay_split_fragment_path()` in `libfdt/fdt_overlay.c` to
accept a length-bounded `path` slice that is not necessarily
NUL-terminated (using `memchr()` instead of `strchr()`, moving the
NUL-terminated property check back into `overlay_symbol_update()`, and
rejecting a trailing `'/'` after `"/__overlay__/"`) so it can also split
`:`-delimited paths from `/__fixups__` when updating
`/__local_fixups__`.

Assisted-by: Gemini:gemini-pro-prerelease
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

Changes in v3:
- Move the fixup offset overflow fix into its own standalone patch at
  the start of the series (Simon Glass)
- Move the removal of the redundant *sep != ':' checks into its own
  standalone patch
- Reject paths ending with a trailing slash ("/<frag>/__overlay__/") in
  overlay_split_fragment_path() (David Gibson)

Changes in v2:
- New patch generalizing overlay_split_fragment_path() for
  non-NUL-terminated paths in libfdt/fdt_overlay.c

 libfdt/fdt_overlay.c | 19 +++++++++++--------
 1 file changed, 11 insertions(+), 8 deletions(-)

diff --git a/libfdt/fdt_overlay.c b/libfdt/fdt_overlay.c
index 978c9c23bd56..36f2377cf7d8 100644
--- a/libfdt/fdt_overlay.c
+++ b/libfdt/fdt_overlay.c
@@ -944,8 +944,8 @@ static int get_path_len(const void *fdt, int nodeoffset)
 
 /**
  * overlay_split_fragment_path - Split "/<frag>/__overlay__[/<rel>]" into parts
- * @path: NUL-terminated input path string
- * @path_len: Length of @path in bytes (including terminating NUL)
+ * @path: Input path string (need not be NUL-terminated)
+ * @path_len: Length of @path in bytes (excluding any terminator)
  * @frag_namep: Output pointer to the fragment name
  * @frag_name_lenp: Output length of @frag_namep in bytes
  * @rel_pathp: Output pointer to the relative subnode path after __overlay__
@@ -970,11 +970,11 @@ static int overlay_split_fragment_path(const char *path, int path_len,
 	/* keep end marker to avoid strlen() */
 	e = path + path_len;
 
-	if (*path != '/')
+	if (path_len < 1 || *path != '/')
 		return -FDT_ERR_BADVALUE;
 
 	/* get fragment name first */
-	s = strchr(path + 1, '/');
+	s = memchr(path + 1, '/', path_len - 1);
 	if (!s) {
 		/* Symbol refers to something that won't end
 		 * up in the target tree */
@@ -984,13 +984,16 @@ static int overlay_split_fragment_path(const char *path, int path_len,
 	frag_name = path + 1;
 	frag_name_len = s - path - 1;
 
-	/* verify format; safe since "s" lies in \0 terminated prop */
+	/* verify format */
 	len = sizeof("/__overlay__/") - 1;
 	if ((e - s) > len && (memcmp(s, "/__overlay__/", len) == 0)) {
 		/* /<fragment-name>/__overlay__/<relative-subnode-path> */
 		rel_path = s + len;
-		rel_path_len = e - rel_path - 1;
-	} else if ((e - s) == len
+		rel_path_len = e - rel_path;
+	} else if ((e - s) == len && (memcmp(s, "/__overlay__/", len) == 0)) {
+		/* Trailing slash after /__overlay__/ is invalid */
+		return -FDT_ERR_BADVALUE;
+	} else if ((e - s) == (len - 1)
 		   && (memcmp(s, "/__overlay__", len - 1) == 0)) {
 		/* /<fragment-name>/__overlay__ */
 		rel_path = "";
@@ -1062,7 +1065,7 @@ static int overlay_symbol_update(void *fdt, void *fdto)
 		if (path_len < 1 || memchr(path, '\0', path_len) != &path[path_len - 1])
 			return -FDT_ERR_BADVALUE;
 
-		ret = overlay_split_fragment_path(path, path_len,
+		ret = overlay_split_fragment_path(path, path_len - 1,
 						  &frag_name, &frag_name_len,
 						  &rel_path, &rel_path_len);
 		if (ret < 0)
-- 
2.56.0.317.g454f8302e1-goog

