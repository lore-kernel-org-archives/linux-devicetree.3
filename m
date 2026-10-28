Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793224601;
	b=VUygpJXhtg+blVpZHne1NScgObRwB6XgB+oW1E3/nD5db1bq//WibMVUESiXE+AhgdJO
	 ClcjP4nXWpkUECsfPG+czbrmlYYe2TaZXuttUIF/fRH3WI48ZNBolZSgnJ4ZknjxW7+kK
	 iX30CJVk2XpwOKsVD9OntInVuLC3+J8/OiWetqEsvGrysB9OoSUQPlabURVdj7h8Y0fwK
	 WTfvxNqcvJa2PQ5ab/Gn0Dpg+Kr1t1ZnI4tVBazCo3o09cwxPX6JyIQzW+XLCLSx4OXb2
	 fNRavm03ITdFyNpJevQUoiBfQHR6ijZbJLSggtb0yoLmn6XwkOHEhp/qUjkDVpzQKIA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793224601;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=RhCp/61kQDDZJEt9zu5kg04zSyX2rdFkpQ6rLDYQN6Q=;
	b=KGOUmFfJfu1E04fQx5avHcX4pa59Cf/De9nDJTqf0UwxkIKb4weqLqwVmk2jfQ5wZdAE
	 tc1aT9wZJMuxgwN2hRS6fJdfpeJKginuiKVP6QqTFVNT7xd9YtbUHkrI0WIurh8UVxmgr
	 B9twigjUgGCLDfcpPBibj3cb1T4/jtmM8Jw1N4+HdudSP5fU5MkrZzM4WJIL5jCNuhYI2
	 msPrg4zljP6q/BAqR+O+1mgZ18HMNvbxYgUSDGbdry5KYzOxjYck49Q9bbDh1uSKo5DKY
	 YS9PQcFiF4J3IIe8Ij0UTgOhlleIngOuX1uFB18zD1ELTIhPTAMRnUF3S9so8xSGQ6g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=RbPng09J;
	arc=none smtp.remote-ip=74.125.82.182
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C38660A3815
	for <Devicetree@vger.kernel.org>; Wed, 28 Oct 2026 21:56:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9C38660A3815
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=RbPng09J
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-33bf40b0c8bso42312eec.0
        for <Devicetree@vger.kernel.org>; Wed, 28 Oct 2026 14:56:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793224600; x=1793829400; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RhCp/61kQDDZJEt9zu5kg04zSyX2rdFkpQ6rLDYQN6Q=;
        b=RbPng09J1uUuo4smSeIG++PvHgPwDC+JSS6fKpiGKnMtAN7asPstkwl9u2USLxyWoo
         AEGOojCM8Ems6zlpK8UJmdCbh+ru0y7EPkm68M8tk4G0OgCIeH4zpECk2xDQoPIdDiV/
         bQVkazqXLH7RUxdQi+bv70Gl/T7yJY4p5ppiU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793224600; x=1793829400;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RhCp/61kQDDZJEt9zu5kg04zSyX2rdFkpQ6rLDYQN6Q=;
        b=XQ2xRok7TIUUKDX8bC3wxXPS57ga5I4zn0lHT+uBadKTB/OIjLwZntMH91DBrRpfd2
         6DDMJRbpPqvlYX8BGLE5qLPGMu68a4zn2ThAjdeHY3Dfw3pARZn4+CsDYLOvHNH4qy/u
         KRRAKMSTZv5qhvx+Y8cev128ZE+gQtMJdRU9ywhOv0D5Ph98RH6g8T+j9xkoesKWlnEE
         mHz+JuW5mb0t5fQCkDg8aoyB4joD0XGYSdD9IqYzjqDyGGV/fAe22xb9RCRjZapAI2EB
         7jQYTRY6HYNgYe7p1C4+2po6eNmLlLGpIXgeVDNli6NKKiBkBWQ/fvbuOBuC+uwZmwrm
         b1ug==
X-Forwarded-Encrypted: i=1; AKwUvBwTpCQUhq7R95Oba6odUmNtOBTcPSddPAIfDhczDZTQnjxfBE0oWueUD8Kvrkkel30mvTFB7X3KMG+1@vger.kernel.org
X-Gm-Message-State: AFq9FYLISkzuArA0HeZioodFydOwtKDFJh4tl0l+ZlUBSHxXS41uuR78
	8NVAHF+yHrA8xru4f3+sM3JWO/7Lzc5wjl0xNvIwbyoA7i5nt3fvtoSnOjuKYeMshQ==
X-Gm-Gg: AYBFou35JKXJdOQln6WJwNaJRblWg196hySuM553WIdQawITUP26NH4KhEubEECvsFD
	MapTfGRmdZBGFHFcBrhnz6lDytNCQ6+BX+7NkugLkfDbIKKOd1OgDi93XRcIBKG/cNZNf4JszZY
	Qj6O9mtZdfdJILs00bX+W3WWeycc93Paha9SFdjyKU1Y7pP2JZ+sN6Op7f5VD2tsSQ06u7e/9gx
	3KFealeMQk6aWLUumZBA0bNPq2fJFzgzUZcJjPje8O5N5rO+HkUP7C0O125j8m8XK9kZu2yvrtG
	LlExaVBvwRq4MJ4NEWAYuTebr8bH7AB2b9LiMfmAdDxARi1JzwQlsZarnERdjynE2sjST3fH5lR
	0LH+hVHoQbwPYWPoW8m+3q0ZVKrYK0buiIloYza8vOkrS7RrwZF4MfK6FBGRZzS3MfQo6TqNLtP
	sRUZV5e9lwoHxropoTU+gajVO9FGM41/fG7K1mMLVwmgatgyLcwsDlqzLyCL7jd8Y574KRR71s9
	HvMOxDMfLZkorocpcvhTPyQNx3rw4S3klyToL8L4qS77Tv+DcrLYlD9BzWY3ytYCqOcwmEkyLM9
	pMuhy0ji9X7S/HJn6Igd/M7udlVKkQOxWkdS7QB/t3ZTKimrmxfeKhiEPkte1axpj9vY/fu7BD6
	YgW13nhYQFLzE
X-Received: by 2002:a05:7301:4683:b0:35e:51d6:9f6f with SMTP id 5a478bee46e88-36a20418ca8mr5788681eec.27.1793224599384;
        Wed, 28 Oct 2026 14:56:39 -0700 (PDT)
Received: from dianders.sjc.corp.google.com ([2a00:79e0:2e7c:8:19e7:c87:2527:4e12])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a2393cc86sm8845224eec.19.2026.10.28.14.56.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 14:56:38 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Devicetree-compiler@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: Brian Norris <briannorris@chromium.org>,
	Chen-Yu Tsai <wenst@chromium.org>,
	=?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@linaro.org>,
	Devicetree@vger.kernel.org,
	Simon Glass <sjg@chromium.org>,
	David Gibson <david@gibson.dropbear.id.au>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	linux-kernel@vger.kernel.org,
	Julius Werner <jwerner@chromium.org>,
	Saravana Kannan <saravanak@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	Douglas Anderson <dianders@chromium.org>
Subject: [PATCH v2 05/10] libfdt: overlay: Prepare fixup and fragment path helpers for reuse
Date: Wed, 28 Oct 2026 14:46:54 -0700
Message-ID: <20261028215600.1713475-6-dianders@chromium.org>
X-Mailer: git-send-email 2.56.0.313.g2479322e68-goog
In-Reply-To: <20261028215600.1713475-1-dianders@chromium.org>
References: <20261028215600.1713475-1-dianders@chromium.org>
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

Clean up `overlay_parse_fixup_entry()` and generalize
`overlay_split_fragment_path()` in `libfdt/fdt_overlay.c` so both can be
reused when updating `/__local_fixups__`:

- Change `poffset` from `int` to `uint32_t` in
  `overlay_fixup_one_phandle()`, `overlay_parse_fixup_entry()`, and
  `overlay_fixup_phandle()`, and parse into `unsigned long` before
  validating the range.
- Require `*(sep + 1)` to be an ASCII digit (`'0'..'9'`) and bound
  `poffset` to `INT32_MAX - sizeof(uint32_t)` so negative strings (such
  as `"-4"`), leading whitespace, or large values cannot silently
  truncate or wrap around in `fdt_setprop_inplace_namelen_partial()`.
- Drop the redundant `*sep != ':'` checks after `memchr(..., ':', ...)`.
- Generalize `overlay_split_fragment_path()` to accept a length-bounded
  `path` slice that is not necessarily NUL-terminated (using `memchr()`
  instead of `strchr()`, and keeping the NUL-terminated property check
  in `overlay_symbol_update()`) so it can also split `:`-delimited paths
  from `/__fixups__`.

Assisted-by: Gemini:gemini-pro-prerelease
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

Changes in v2:
- New patch tightening fixup offset parsing and generalizing
  overlay_split_fragment_path() for non-NUL-terminated paths in
  libfdt/fdt_overlay.c

 libfdt/fdt_overlay.c | 46 +++++++++++++++++++++++---------------------
 1 file changed, 24 insertions(+), 22 deletions(-)

diff --git a/libfdt/fdt_overlay.c b/libfdt/fdt_overlay.c
index f9d1a555ed5d..eb87b356145f 100644
--- a/libfdt/fdt_overlay.c
+++ b/libfdt/fdt_overlay.c
@@ -330,7 +330,7 @@ static int overlay_update_local_references(void *fdto, uint32_t delta)
 static int overlay_fixup_one_phandle(void *fdto, int symbols_off,
 				     const char *path, uint32_t path_len,
 				     const char *name, uint32_t name_len,
-				     int poffset, uint32_t phandle)
+				     uint32_t poffset, uint32_t phandle)
 {
 	fdt32_t phandle_prop;
 	int fixup_off;
@@ -368,7 +368,7 @@ static int overlay_fixup_one_phandle(void *fdto, int symbols_off,
 static int overlay_parse_fixup_entry(const char **valuep, int *lenp,
 				     const char **pathp, uint32_t *path_lenp,
 				     const char **namep, uint32_t *name_lenp,
-				     int *poffsetp)
+				     uint32_t *poffsetp)
 {
 	const char *path, *name, *fixup_end;
 	const char *fixup_str = *valuep;
@@ -376,7 +376,7 @@ static int overlay_parse_fixup_entry(const char **valuep, int *lenp,
 	uint32_t fixup_len;
 	const char *sep;
 	char *endptr;
-	int poffset;
+	unsigned long poffset;
 
 	fixup_end = memchr(*valuep, '\0', *lenp);
 	if (!fixup_end)
@@ -388,7 +388,7 @@ static int overlay_parse_fixup_entry(const char **valuep, int *lenp,
 
 	path = fixup_str;
 	sep = memchr(fixup_str, ':', fixup_len);
-	if (!sep || *sep != ':')
+	if (!sep)
 		return -FDT_ERR_BADOVERLAY;
 
 	path_len = sep - path;
@@ -398,15 +398,17 @@ static int overlay_parse_fixup_entry(const char **valuep, int *lenp,
 	fixup_len -= path_len + 1;
 	name = sep + 1;
 	sep = memchr(name, ':', fixup_len);
-	if (!sep || *sep != ':')
+	if (!sep)
 		return -FDT_ERR_BADOVERLAY;
 
 	name_len = sep - name;
 	if (!name_len)
 		return -FDT_ERR_BADOVERLAY;
 
+	if ((*(sep + 1) < '0') || (*(sep + 1) > '9'))
+		return -FDT_ERR_BADOVERLAY;
 	poffset = strtoul(sep + 1, &endptr, 10);
-	if ((*endptr != '\0') || (endptr <= (sep + 1)))
+	if ((*endptr != '\0') || (poffset > (INT32_MAX - sizeof(uint32_t))))
 		return -FDT_ERR_BADOVERLAY;
 
 	*pathp = path;
@@ -470,8 +472,8 @@ static int overlay_fixup_phandle(void *fdt, void *fdto, int symbols_off,
 
 	do {
 		const char *path, *name;
-		uint32_t path_len, name_len;
-		int poffset, ret;
+		uint32_t path_len, name_len, poffset;
+		int ret;
 
 		ret = overlay_parse_fixup_entry(&value, &len, &path, &path_len,
 						&name, &name_len, &poffset);
@@ -925,8 +927,8 @@ static int get_path_len(const void *fdt, int nodeoffset)
 
 /**
  * overlay_split_fragment_path - Split "/<frag>/__overlay__[/<rel>]" into parts
- * @path: Input NUL-terminated path property string
- * @path_len: Length of @path in bytes (including trailing NUL)
+ * @path: Input path string (need not be NUL-terminated)
+ * @path_len: Length of @path in bytes (excluding any terminator)
  * @frag_namep: Output pointer to the fragment name
  * @frag_name_lenp: Output length of @frag_namep in bytes
  * @rel_pathp: Output pointer to the relative subnode path after __overlay__
@@ -935,7 +937,7 @@ static int get_path_len(const void *fdt, int nodeoffset)
  *
  * returns:
  *      0 on success
- *      -FDT_ERR_BADVALUE if @path is not a valid NUL-terminated '/' path
+ *      -FDT_ERR_BADVALUE if @path does not start with '/'
  */
 static int overlay_split_fragment_path(const char *path, int path_len,
 				       const char **frag_namep,
@@ -951,18 +953,14 @@ static int overlay_split_fragment_path(const char *path, int path_len,
 
 	*is_overlayp = false;
 
-	/* verify it's a string property (terminated by a single \0) */
-	if (path_len < 1 || memchr(path, '\0', path_len) != &path[path_len - 1])
-		return -FDT_ERR_BADVALUE;
-
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
@@ -972,13 +970,13 @@ static int overlay_split_fragment_path(const char *path, int path_len,
 	frag_name = path + 1;
 	frag_name_len = s - path - 1;
 
-	/* verify format; safe since "s" lies in \0 terminated prop */
+	/* verify format */
 	len = sizeof("/__overlay__/") - 1;
-	if ((e - s) > len && (memcmp(s, "/__overlay__/", len) == 0)) {
+	if ((e - s) >= len && (memcmp(s, "/__overlay__/", len) == 0)) {
 		/* /<fragment-name>/__overlay__/<relative-subnode-path> */
 		rel_path = s + len;
-		rel_path_len = e - rel_path - 1;
-	} else if ((e - s) == len
+		rel_path_len = e - rel_path;
+	} else if ((e - s) == (len - 1)
 		   && (memcmp(s, "/__overlay__", len - 1) == 0)) {
 		/* /<fragment-name>/__overlay__ */
 		rel_path = "";
@@ -1049,7 +1047,11 @@ static int overlay_symbol_update(void *fdt, void *fdto)
 		if (!path)
 			return path_len;
 
-		ret = overlay_split_fragment_path(path, path_len,
+		/* verify it's a string property (terminated by a single \0) */
+		if (path_len < 1 || memchr(path, '\0', path_len) != &path[path_len - 1])
+			return -FDT_ERR_BADVALUE;
+
+		ret = overlay_split_fragment_path(path, path_len - 1,
 						  &frag_name, &frag_name_len,
 						  &rel_path, &rel_path_len,
 						  &is_overlay);
-- 
2.56.0.313.g2479322e68-goog

