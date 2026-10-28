Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793224599;
	b=JsvjQnNjxtp08a4fC+eTD8aODH0N+zUIviR2OuQMtkFrzaLqwHzR50aqVHSzBIrVAEZF
	 922N1CMkXWxG14gaMykYkPCnSyur7lJ5vb/xAB02rs0xdeR+Ag019bcwNI94owjDT45yQ
	 R5EU+MCbx2D/rYUDppoVKILU22tBE4xCShOqnSqmoZ1lc+BNfPS8lJYLNZfbdAMgKoMQy
	 evHS3BwgcsVzEXTJIYwgJJ5Thj3Uyo/T+2m2zjCv3nti6O7o7jCMi6uVn63zIapJfOhdS
	 c19ukBwSrXHQ2Z3l5Td+jsHGW250B/cUtkTOIGzG42D0hKuvBmHMNIQ9jyU2Eoxgipg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793224599;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=h4HKRMUyyVkUrUI+YJ3JgmkowAX5KVGFd9xGnSrbsX4=;
	b=0uxrDGSVb6U9an/jSOh0y6Cx3wBR6Tj+sDt/kfE+6Yg3VREkUdDBOSFKMheTbc8vHfFR
	 9KuvfezJX5aK6EzJWtEc3mPRpXCqccoeAnNcUOjtb0fxy6oLft803Y538VAHgDjll0UFu
	 no+4MSWFoj0KZEYMhC8P6vBIZqI5l3eyqX7mjH5WBTUabZB1rsryhHhPpt4wH9JQjozQ1
	 332rtDJIedXFMSRZWaKXI/vXT4BXrlYZjw9XiIspjW4g+epF062eQ5Duy/edAtU7zLCLZ
	 RWE4BDL1ZO98bK61vo4mKAnI0E/nZsxshEAxob3Ddgi/lHwERvzLB+t4FG3gDdLJmxw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=iYTzqz6Y;
	arc=none smtp.remote-ip=74.125.82.173
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38FFE60A3801
	for <Devicetree@vger.kernel.org>; Wed, 28 Oct 2026 21:56:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 38FFE60A3801
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=iYTzqz6Y
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-33fb4680717so1676170eec.1
        for <Devicetree@vger.kernel.org>; Wed, 28 Oct 2026 14:56:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793224597; x=1793829397; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=h4HKRMUyyVkUrUI+YJ3JgmkowAX5KVGFd9xGnSrbsX4=;
        b=iYTzqz6YPcJmE2qSwQzaPYHIE024dfvGm9L3oILacF0YrmIWqvp3ei0Z6QaYJAc+Hp
         Xp3V0jnf+kMXBoI1UQ+wimHUElRyAKPGtDht59P/gUm7MFLdsFrbCqm9s+cBjnd3oO/F
         eOFVWgAvU2OnR3J+j/teuuqLl6QDgkO2bvef4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793224597; x=1793829397;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=h4HKRMUyyVkUrUI+YJ3JgmkowAX5KVGFd9xGnSrbsX4=;
        b=fd2Eo1K8zDMutKQ/wEE8mdZfGEnbkqPD4+uKzb0vzADN1R7weCTfm0TljoOcAfdZaD
         p/EWDr9k3rz32m9RiA28q9Kw+1bQD93hVDXKiCHh6kM0V6P48UpZqw7i7+Nj8gSMk5u9
         BzlioX0+Ub1x45jmtyPIdoNqO3Dd/qeKkWBYltHvnYOxpNtV/IuQG2WYDIvtosZJXIzd
         KqEBG+Tl+c4krQCeDdmIiOAiSTJixg26AxpGu44nQgblGBAemdyebFtsSOEjJLGhw3YJ
         SILZ5AiyXCP9/v7GbAWhJEdy6zk4dhHtvB/OEpvF4jgW9e2lL5dKE9ptxhoA/7WZNXnD
         UTpQ==
X-Forwarded-Encrypted: i=1; AKwUvBz7snLuD5twXL2HZY1mtyLwgzX6KqZ9rBAGIcSX9daU4WvkFIliCWHRQP4e+DfV02xflBHmT6ppcAUD@vger.kernel.org
X-Gm-Message-State: AFq9FYLkjJ7IkM2L2hU3xPDYpQ9e4N2mrCRmU+MA2OavdkVdQfBRha4K
	R/UGMg8QWfqZwWG6aevEOl7SI+oX0DSWZMdYIwICuA2Wt4oVwm2H0hH3OWCYdOykMg==
X-Gm-Gg: AYBFou035YRJ3qVzyXjv+zrPHYngsVltpSbemKt0ztCOEKh5rqgvwJDou5pkWQYX5Ze
	UlyoPCFKYYcErbG6C8a6mY3xUJAvtQLcnsUIfkJWwAGAOTvHtic00N/9pu0+Ab/0MM1adT6yGUi
	fTlH+9KCzkvYT1qkgVtFkkr8Sibt20utDG1DiYilfVucrzFqsiEcUfvyl7hmM+y8XZvPwsvUaLz
	QPvnUEiyV2UFaNWpGlYPoqBgj3qIdOWs++pvJLsRBc59L6x61eDiiVHz5tOK/3BCtErUawkiccf
	vSMP/x3UHnpHOc0NavXXle4np3NrwMO67G1hn8QVUIM7Ia4RWG96wJMf+M6FkllGG6gcTcSqGli
	hJ3FJtc47IBHI+MaH1ZFF1nVjvgeRoACQeyEQMrk7R00xY7b+TUddV1fDm4ULqKep21kJ2eDDFn
	Wr0qX55HDAZrZ9x1UWThmlrgr9BGcF8m1RP04qZ6S8m2iOyDqUkUAJ4+oaM/UQ7y77JE0udAYGz
	JY8XvgpIeFg50nP75G8RKarH02P9Fe6BfTatWoMcLjlWyYnbYancGCyRDldK0OPmXQhUl1IB0+J
	onEnGxIaSGrTA9Xw4TkbYF4KL7P0UHIajxZCKNqt5XGmWflUGe7nSThI7t43sBe1rxj1shmETJ8
	KVXKWo4ChNSHL
X-Received: by 2002:a05:693c:639b:20b0:36a:1904:60a3 with SMTP id 5a478bee46e88-36a203d0975mr5134289eec.15.1793224597294;
        Wed, 28 Oct 2026 14:56:37 -0700 (PDT)
Received: from dianders.sjc.corp.google.com ([2a00:79e0:2e7c:8:19e7:c87:2527:4e12])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a2393cc86sm8845224eec.19.2026.10.28.14.56.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 14:56:36 -0700 (PDT)
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
Subject: [PATCH v2 04/10] libfdt: overlay: Factor out fixup and fragment path parsing helpers
Date: Wed, 28 Oct 2026 14:46:53 -0700
Message-ID: <20261028215600.1713475-5-dianders@chromium.org>
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

In preparation for updating the base device tree's `/__local_fixups__`
node during `fdt_overlay_apply()`, factor out two helper functions in
`libfdt/fdt_overlay.c`:

- Factor out `overlay_parse_fixup_entry()` from
  `overlay_fixup_phandle()` to parse `"path:name:offset"` entries in
  `/__fixups__` properties.
- Factor out `overlay_split_fragment_path()` from
  `overlay_symbol_update()` to validate and split
  `"/<fragment>/__overlay__[/<rel>]"` paths into the fragment name and
  relative subnode path.

This commit is pure code movement with no functional change.

Assisted-by: Gemini:gemini-pro-prerelease
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

Changes in v2:
- New patch factoring out overlay_parse_fixup_entry() and
  overlay_split_fragment_path() helpers in libfdt/fdt_overlay.c

 libfdt/fdt_overlay.c | 226 +++++++++++++++++++++++++++++--------------
 1 file changed, 154 insertions(+), 72 deletions(-)

diff --git a/libfdt/fdt_overlay.c b/libfdt/fdt_overlay.c
index 51a3859620a4..f9d1a555ed5d 100644
--- a/libfdt/fdt_overlay.c
+++ b/libfdt/fdt_overlay.c
@@ -351,6 +351,72 @@ static int overlay_fixup_one_phandle(void *fdto, int symbols_off,
 						   sizeof(phandle_prop));
 }
 
+/**
+ * overlay_parse_fixup_entry - Parse one "path:name:offset" entry from /__fixups__
+ * @valuep: In/out pointer to the current NUL-terminated fixup string
+ * @lenp: In/out remaining length of the /__fixups__ property value
+ * @pathp: Output pointer to the target node path
+ * @path_lenp: Output length of @pathp in bytes
+ * @namep: Output pointer to the target property name
+ * @name_lenp: Output length of @namep in bytes
+ * @poffsetp: Output byte offset within the target property
+ *
+ * returns:
+ *      0 on success
+ *      -FDT_ERR_BADOVERLAY if the fixup entry is malformed
+ */
+static int overlay_parse_fixup_entry(const char **valuep, int *lenp,
+				     const char **pathp, uint32_t *path_lenp,
+				     const char **namep, uint32_t *name_lenp,
+				     int *poffsetp)
+{
+	const char *path, *name, *fixup_end;
+	const char *fixup_str = *valuep;
+	uint32_t path_len, name_len;
+	uint32_t fixup_len;
+	const char *sep;
+	char *endptr;
+	int poffset;
+
+	fixup_end = memchr(*valuep, '\0', *lenp);
+	if (!fixup_end)
+		return -FDT_ERR_BADOVERLAY;
+	fixup_len = fixup_end - fixup_str;
+
+	*lenp -= fixup_len + 1;
+	*valuep += fixup_len + 1;
+
+	path = fixup_str;
+	sep = memchr(fixup_str, ':', fixup_len);
+	if (!sep || *sep != ':')
+		return -FDT_ERR_BADOVERLAY;
+
+	path_len = sep - path;
+	if (path_len == (fixup_len - 1))
+		return -FDT_ERR_BADOVERLAY;
+
+	fixup_len -= path_len + 1;
+	name = sep + 1;
+	sep = memchr(name, ':', fixup_len);
+	if (!sep || *sep != ':')
+		return -FDT_ERR_BADOVERLAY;
+
+	name_len = sep - name;
+	if (!name_len)
+		return -FDT_ERR_BADOVERLAY;
+
+	poffset = strtoul(sep + 1, &endptr, 10);
+	if ((*endptr != '\0') || (endptr <= (sep + 1)))
+		return -FDT_ERR_BADOVERLAY;
+
+	*pathp = path;
+	*path_lenp = path_len;
+	*namep = name;
+	*name_lenp = name_len;
+	*poffsetp = poffset;
+	return 0;
+}
+
 /**
  * overlay_fixup_phandle - Set an overlay phandle to the base one
  * @fdt: Base Device Tree blob
@@ -403,44 +469,14 @@ static int overlay_fixup_phandle(void *fdt, void *fdto, int symbols_off,
 		return -FDT_ERR_NOTFOUND;
 
 	do {
-		const char *path, *name, *fixup_end;
-		const char *fixup_str = value;
+		const char *path, *name;
 		uint32_t path_len, name_len;
-		uint32_t fixup_len;
-		const char *sep;
-		char *endptr;
 		int poffset, ret;
 
-		fixup_end = memchr(value, '\0', len);
-		if (!fixup_end)
-			return -FDT_ERR_BADOVERLAY;
-		fixup_len = fixup_end - fixup_str;
-
-		len -= fixup_len + 1;
-		value += fixup_len + 1;
-
-		path = fixup_str;
-		sep = memchr(fixup_str, ':', fixup_len);
-		if (!sep || *sep != ':')
-			return -FDT_ERR_BADOVERLAY;
-
-		path_len = sep - path;
-		if (path_len == (fixup_len - 1))
-			return -FDT_ERR_BADOVERLAY;
-
-		fixup_len -= path_len + 1;
-		name = sep + 1;
-		sep = memchr(name, ':', fixup_len);
-		if (!sep || *sep != ':')
-			return -FDT_ERR_BADOVERLAY;
-
-		name_len = sep - name;
-		if (!name_len)
-			return -FDT_ERR_BADOVERLAY;
-
-		poffset = strtoul(sep + 1, &endptr, 10);
-		if ((*endptr != '\0') || (endptr <= (sep + 1)))
-			return -FDT_ERR_BADOVERLAY;
+		ret = overlay_parse_fixup_entry(&value, &len, &path, &path_len,
+						&name, &name_len, &poffset);
+		if (ret)
+			return ret;
 
 		ret = overlay_fixup_one_phandle(fdto, symbols_off,
 						path, path_len, name, name_len,
@@ -887,6 +923,80 @@ static int get_path_len(const void *fdt, int nodeoffset)
 	return len;
 }
 
+/**
+ * overlay_split_fragment_path - Split "/<frag>/__overlay__[/<rel>]" into parts
+ * @path: Input NUL-terminated path property string
+ * @path_len: Length of @path in bytes (including trailing NUL)
+ * @frag_namep: Output pointer to the fragment name
+ * @frag_name_lenp: Output length of @frag_namep in bytes
+ * @rel_pathp: Output pointer to the relative subnode path after __overlay__
+ * @rel_path_lenp: Output length of @rel_pathp in bytes
+ * @is_overlayp: Set to true if @path is under an __overlay__ subnode
+ *
+ * returns:
+ *      0 on success
+ *      -FDT_ERR_BADVALUE if @path is not a valid NUL-terminated '/' path
+ */
+static int overlay_split_fragment_path(const char *path, int path_len,
+				       const char **frag_namep,
+				       int *frag_name_lenp,
+				       const char **rel_pathp,
+				       int *rel_path_lenp,
+				       bool *is_overlayp)
+{
+	int len, frag_name_len, rel_path_len;
+	const char *s, *e;
+	const char *frag_name;
+	const char *rel_path;
+
+	*is_overlayp = false;
+
+	/* verify it's a string property (terminated by a single \0) */
+	if (path_len < 1 || memchr(path, '\0', path_len) != &path[path_len - 1])
+		return -FDT_ERR_BADVALUE;
+
+	/* keep end marker to avoid strlen() */
+	e = path + path_len;
+
+	if (*path != '/')
+		return -FDT_ERR_BADVALUE;
+
+	/* get fragment name first */
+	s = strchr(path + 1, '/');
+	if (!s) {
+		/* Symbol refers to something that won't end
+		 * up in the target tree */
+		return 0;
+	}
+
+	frag_name = path + 1;
+	frag_name_len = s - path - 1;
+
+	/* verify format; safe since "s" lies in \0 terminated prop */
+	len = sizeof("/__overlay__/") - 1;
+	if ((e - s) > len && (memcmp(s, "/__overlay__/", len) == 0)) {
+		/* /<fragment-name>/__overlay__/<relative-subnode-path> */
+		rel_path = s + len;
+		rel_path_len = e - rel_path - 1;
+	} else if ((e - s) == len
+		   && (memcmp(s, "/__overlay__", len - 1) == 0)) {
+		/* /<fragment-name>/__overlay__ */
+		rel_path = "";
+		rel_path_len = 0;
+	} else {
+		/* Symbol refers to something that won't end
+		 * up in the target tree */
+		return 0;
+	}
+
+	*frag_namep = frag_name;
+	*frag_name_lenp = frag_name_len;
+	*rel_pathp = rel_path;
+	*rel_path_lenp = rel_path_len;
+	*is_overlayp = true;
+	return 0;
+}
+
 /**
  * overlay_symbol_update - Update the symbols of base tree after a merge
  * @fdt: Base Device Tree blob
@@ -907,7 +1017,6 @@ static int overlay_symbol_update(void *fdt, void *fdto)
 {
 	int root_sym, ov_sym, prop, path_len, fragment, target;
 	int len, frag_name_len, ret, rel_path_len;
-	const char *s, *e;
 	const char *path;
 	const char *name;
 	const char *frag_name;
@@ -934,47 +1043,20 @@ static int overlay_symbol_update(void *fdt, void *fdto)
 
 	/* iterate over each overlay symbol */
 	fdt_for_each_property_offset(prop, fdto, ov_sym) {
+		bool is_overlay;
+
 		path = fdt_getprop_by_offset(fdto, prop, &name, &path_len);
 		if (!path)
 			return path_len;
 
-		/* verify it's a string property (terminated by a single \0) */
-		if (path_len < 1 || memchr(path, '\0', path_len) != &path[path_len - 1])
-			return -FDT_ERR_BADVALUE;
-
-		/* keep end marker to avoid strlen() */
-		e = path + path_len;
-
-		if (*path != '/')
-			return -FDT_ERR_BADVALUE;
-
-		/* get fragment name first */
-		s = strchr(path + 1, '/');
-		if (!s) {
-			/* Symbol refers to something that won't end
-			 * up in the target tree */
-			continue;
-		}
-
-		frag_name = path + 1;
-		frag_name_len = s - path - 1;
-
-		/* verify format; safe since "s" lies in \0 terminated prop */
-		len = sizeof("/__overlay__/") - 1;
-		if ((e - s) > len && (memcmp(s, "/__overlay__/", len) == 0)) {
-			/* /<fragment-name>/__overlay__/<relative-subnode-path> */
-			rel_path = s + len;
-			rel_path_len = e - rel_path - 1;
-		} else if ((e - s) == len
-			   && (memcmp(s, "/__overlay__", len - 1) == 0)) {
-			/* /<fragment-name>/__overlay__ */
-			rel_path = "";
-			rel_path_len = 0;
-		} else {
-			/* Symbol refers to something that won't end
-			 * up in the target tree */
+		ret = overlay_split_fragment_path(path, path_len,
+						  &frag_name, &frag_name_len,
+						  &rel_path, &rel_path_len,
+						  &is_overlay);
+		if (ret)
+			return ret;
+		if (!is_overlay)
 			continue;
-		}
 
 		/* find the fragment index in which the symbol lies */
 		ret = fdt_subnode_offset_namelen(fdto, 0, frag_name,
-- 
2.56.0.313.g2479322e68-goog

