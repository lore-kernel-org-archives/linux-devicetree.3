Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793570644;
	b=EJkWCU9cnHmWx1I9BDaAe4FhmoTaoXyKwQ8NALL7A3Gt7b3jRGF/0HwrpwwYrOKN60ym
	 KjAh083xo7PB/HMtC1Jg81DGZp6AiariylMzIet++nZiwfC5WWmq+x+WnkZGotF/phGYx
	 fAldJ6+4FVQfwyeWfIs3YNo4Obgx19CdJeNSYohINrHydRMXDW/3YL8fUZIt1xTolQ8vF
	 vR6o4SmaanRw+baIdh2vSvIKLA+e6pCXCYTNnOwoTf50b7wjwgIuYbHSzKq58y9rYzBiO
	 +GLqIppa+OZ07xIBGk3ajlG2RVH/Ef8TDLmXSDVm6tKpn8tLYmHs/eGfcfSA2UpGoKA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793570644;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=GPhAQVnMxRI3448bUSNZGSLyEYFOhY5IHBFp9Vsc1mI=;
	b=dD6y0KPevy1Vt1Cwixe0WQf/V2sRdpXTQX5cAMqnL6XP3DegHRHXsok3KmfzBlumctpP
	 7ob2FaylaQkAKr3nEkk9leKbC2HOPKdf2YyqYdvPgSpvQDQPAd/axqbrQaq9Hi1CeqhjY
	 UD3Cb6a0+ogpCcNqOX2MYc/zNl1cObajedLSU2vgugSkdagYXJ+LveVd2nunlMQpQuLkK
	 Ga94Rr38iePl976wYf+ANEbYsQJJuR2EXuhX5QSVSVQCyHvpmIW78bYP/l1R5r2fje88v
	 Jqsin5PGUsQ+slXYyttMhXcs92FPHUv4r1VvnF0RvZvin+K3s8HIRKsyTNKXSm7XyJQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=XAakfkJl;
	arc=none smtp.remote-ip=74.125.82.43
Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB7D460A261C
	for <Devicetree@vger.kernel.org>; Sun,  1 Nov 2026 22:04:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BB7D460A261C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=XAakfkJl
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-1a3c08d6928so2693945c88.0
        for <Devicetree@vger.kernel.org>; Sun, 01 Nov 2026 14:04:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793570643; x=1794175443; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GPhAQVnMxRI3448bUSNZGSLyEYFOhY5IHBFp9Vsc1mI=;
        b=XAakfkJlQf8BoJBks4KiI9f3ilO/UJsmBC4v0jxLFbkownxSrK53r43uHzawU3McL0
         sVZ2Cg60QxDPEVwCYyimCAmcFpUZJHsWOCZoIyHIbtjhDNZA6eLslYkPus+BCj+pDI9U
         znaPdWXrpA7pIehTDkhjJyY629zvTA2mYpwnY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793570643; x=1794175443;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GPhAQVnMxRI3448bUSNZGSLyEYFOhY5IHBFp9Vsc1mI=;
        b=wI/M4mCVWHQ/r2aZPtmtI7tdj+R9f3J4bT59YxvAlmoxLxhSdMSrROE+JU0mWIUKwn
         nxzal/eypHaKscNje1CPOxetR1Lgj+rOo57xJOgpiU/9ZaDUbKQeOAilWYH3XWQXwNsD
         fCetBbb7Fw2Kvu6zv2QnE2AO6zl+Bs9I10ApfPMu2dYEZLxsvSsm9B//vZN8rub6F4Jv
         8zCMEbPGaGGpnXUZ91SxG8IJIT3YozVZ9LQd3WV/NuIFq234+BjZJsygaTLZsMI5SiTJ
         e+yXCPidJlo9FMcl9AXApSg78uO+/5VGiPnpF8nfxZ8unfDXvOrYBGy3dkBdjsYhcNBR
         l9BA==
X-Forwarded-Encrypted: i=1; AKwUvBytTkNIdpMbxV0pLCNDK38fu3WGr7uKbsutYYlYwiedtQQfSecIECDFNPOjnN5dgMFoYFQiLBq9Hu97@vger.kernel.org
X-Gm-Message-State: AFq9FYL2dkMQh+MvdVwXrCLOsRty6oQHgdxiKMfJ2nq9Y41pWe04U4fc
	bu+1j9Idx0g6zmsGpdJkvxUX5jHMoD41zp4Dorykex+9QG/qFMMLthCrB59XMpjcjw==
X-Gm-Gg: AYBFou0EW7UUhYGEqgG9uCnJ39DdrIV+JTzM1BkL5TLdRXF+IsisXM7mbxJ5pYd18n4
	1YYAO9t5/b2JYlPX7R6YOMFXwVJEJm99eMdlHMIU4C1U+A4uLMxqd7mrLT6XrHc5Pls+pgUDPXt
	TiNwBFhmCVTMAfk9pHOIZapz3DpmghuBsoO7LZPOmXxhXx/iRG174NIDHBabQNuO8skXU/F4MIz
	Z2p9AArYoQg2i4Bhwrvn4k9NP73RhTTjBHO148Llu2hduv+i/jjqetEVFyopGy/SlCaqAGmJkD4
	bvJPqmVk6bIAPxsaatl7OaAAfLx5tQtPkNFEzwSYSTBMykSg0e2Ks7B+pm146ZJRLx28jaNsMbC
	lcwSPJqwVvQsxNyhKc98OVcGI1Q0yeaYPDXMrX8oIG0oSEecdGercqiMZodwqM0TMDplmWpXwBO
	bIKrlduPrJfHI4Qa2IvAxt4SCnC9TpBL4QMtW7i4hdiMDNdDB+137Om80sZ70tpZ6Xq81LWvOoJ
	h++rGZp1EN5g9CY15SkSaaXpZ9mi8iec0aBYdlcqCBcbFXF6fToxrSmoH9bw43QnJpuY2ljykYy
	0VLEpaexnUfqmxvaH9dDxsqoE95SndxLlxA9Wu4i9TcK9ai1iTjhnSA2lWaRDDS0A1rJTXsCgG4
	C/0+YGz7lzJCkq2HvzxudJOmif+9EVUwifmk=
X-Received: by 2002:a05:7023:904:b0:168:3243:c907 with SMTP id a92af1059eb24-1ad85de518fmr11700901c88.24.1793570642613;
        Sun, 01 Nov 2026 14:04:02 -0800 (PST)
Received: from dianders.sjc.corp.google.com ([2a00:79e0:2e7c:8:cbd8:5ca8:653a:11f9])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b106edc7f8sm11097266c88.9.2026.11.01.14.04.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 14:04:01 -0800 (PST)
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
Subject: [PATCH v3 13/15] fdtfactor: Add -S/--strip-local-fixups option
Date: Sun,  1 Nov 2026 14:01:20 -0800
Message-ID: <20261101220224.1436242-14-dianders@chromium.org>
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

By default, `fdtfactor` preserves `/__local_fixups__` on `base.dtb` so
that when `fdt_overlay_apply()` merges a `.dtbo` overlay, the
reconstructed device tree retains full `/__local_fixups__` information
(for instance, if an OS kernel wants to know which property cells
contain phandles at runtime).

When `-L` was passed to `dtc` solely to help `fdtfactor` locate phandle
cells at build time and `/__local_fixups__` is not needed at runtime,
retaining `/__local_fixups__` in `base.dtb` wastes space.

Add `-S` / `--strip-local-fixups` to omit `/__local_fixups__` from
`base.dtb` (and therefore from the merged device trees produced by
`fdt_overlay_apply()`). On a set of 47 Qualcomm SC7180 Trogdor
Chromebook board DTBs, `fdtfactor` without `-S` reduces total
uncompressed size from 7.69 MB to 932 KB (88.2% savings), while
`fdtfactor -S` reduces it to 634 KB (91.8% savings, saving an additional
298 KB by omitting `/__local_fixups__` from `base.dtb`).

Add a test case in `tests/run_tests.sh` verifying that `fdtfactor -S`
followed by `fdtoverlay` reproduces DTBs compiled with `-@` (without
`-L`) via `dtbs_equal_unordered`.

Assisted-by: Gemini:gemini-pro-prerelease
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

Changes in v3:
- Include both non--S (932 KB) and -S (634 KB) Trogdor size numbers in
  the commit message to show the savings of -S itself (Simon Glass)
- Pass -S to the negative test verifying that inputs lacking
  /__local_fixups__ are still rejected when -S is used, and move the
  non--S rejection test to the base fdtfactor patch (Simon Glass)

Changes in v2:
- Split -S/--strip-local-fixups into a separate opt-in patch (David
  Gibson)

 README.md          |  9 +++++++++
 fdtfactor          | 34 ++++++++++++++++++++++++++--------
 tests/run_tests.sh | 18 ++++++++++++++++++
 3 files changed, 53 insertions(+), 8 deletions(-)

diff --git a/README.md b/README.md
index 61fefc4424fe..bb6f041e1e78 100644
--- a/README.md
+++ b/README.md
@@ -139,6 +139,15 @@ Options:
 * `-o`, `--outdir`: Output directory for generated `.dtbo` files and
   `--output-base-dtb` (default: alongside each input `.dtb` for `.dtbo` files,
   current directory for `--output-base-dtb`).
+* `-S`, `--strip-local-fixups`: Omit `/__local_fixups__` from the generated
+  `base.dtb` and final reconstructed device trees. By default, `fdtfactor`
+  preserves `/__local_fixups__` on `base.dtb` so that when `fdt_overlay_apply()`
+  merges a `.dtbo` overlay, the reconstructed device tree retains full
+  `/__local_fixups__` information (e.g., for an OS kernel that wants to
+  know which property cells contain phandles at runtime). When `-L` was
+  passed to `dtc` solely to help `fdtfactor` locate phandles at build time
+  and `/__local_fixups__` is not needed at runtime, passing `-S` strips it
+  from `base.dtb` to save space.
 * `-s`, `--stats`: Print size savings summary.
 
 ### TODO
diff --git a/fdtfactor b/fdtfactor
index f6944e36a0f2..7442a2597399 100755
--- a/fdtfactor
+++ b/fdtfactor
@@ -442,7 +442,8 @@ def _build_base_tree(dtbs):
     return base_root
 
 
-def _serialize_base_dtb(base_root, base_dtb_symbols, rsvmap, boot_cpuid_phys):
+def _serialize_base_dtb(base_root, base_dtb_symbols, rsvmap, boot_cpuid_phys,
+                        strip_local_fixups=False):
     """Materialize phandles, `/__symbols__`, and `/__local_fixups__` and flatten.
 
     Args:
@@ -451,6 +452,8 @@ def _serialize_base_dtb(base_root, base_dtb_symbols, rsvmap, boot_cpuid_phys):
         base_dtb_symbols: Dict mapping common symbol labels to target paths.
         rsvmap: Sequence of `(address, size)` memory reservation tuples.
         boot_cpuid_phys: Physical boot CPU ID for the FDT header.
+        strip_local_fixups: If True, omit `/__local_fixups__` from the
+            generated `base.dtb`.
 
     Returns:
         Serialized `.dtb` `bytes` for the common base DTB.
@@ -485,11 +488,12 @@ def _serialize_base_dtb(base_root, base_dtb_symbols, rsvmap, boot_cpuid_phys):
         for label, target_path in base_dtb_symbols.items():
             sym_node.set_str(label, target_path or '/')
 
-    # Create `/__local_fixups__` on the base DTB so `fdt_overlay_apply()`
-    # updates it with the overlay's phandle fixups when merging.
-    lf_root = out_root.create_path('/__local_fixups__')
-    for path, prop_name, offs in lf_entries:
-        lf_root.create_path(path).set_u32_list(prop_name, offs)
+    if not strip_local_fixups:
+        # Create `/__local_fixups__` on the base DTB so `fdt_overlay_apply()`
+        # updates it with the overlay's phandle fixups when merging.
+        lf_root = out_root.create_path('/__local_fixups__')
+        for path, prop_name, offs in lf_entries:
+            lf_root.create_path(path).set_u32_list(prop_name, offs)
 
     fdt = out_root.flatten(mem_rsv=rsvmap, boot_cpuid_phys=boot_cpuid_phys)
     return bytes(fdt.as_bytearray())
@@ -638,11 +642,13 @@ def _build_board_dtbo(dtb, base_root, base_dtb_symbols,
     return bytes(dtbo_root.flatten().as_bytearray())
 
 
-def create_base_dtb_and_overlays(dtbs):
+def create_base_dtb_and_overlays(dtbs, strip_local_fixups=False):
     """Compute the base DTB and per-board DTBO blobs from parsed DTBs.
 
     Args:
         dtbs: Sequence of `ParsedDtb` instances (at least two).
+        strip_local_fixups: If True, omit `/__local_fixups__` from the
+            generated `base.dtb`.
 
     Returns:
         Tuple of `(base_dtb_blob, dtbo_blobs)` where `base_dtb_blob` is the
@@ -657,6 +663,7 @@ def create_base_dtb_and_overlays(dtbs):
     base_dtb_blob = _serialize_base_dtb(
         base_root, base_dtb_symbols,
         dtbs[0].mem_rsv, dtbs[0].boot_cpuid_phys,
+        strip_local_fixups=strip_local_fixups,
     )
     dtbo_blobs = [
         _build_board_dtbo(
@@ -719,6 +726,14 @@ def parse_args(argv=None):
             'current directory for --output-base-dtb)'
         ),
     )
+    parser.add_argument(
+        '-S', '--strip-local-fixups',
+        action='store_true',
+        help=(
+            'Omit /__local_fixups__ from the generated base .dtb and '
+            'reconstructed device trees'
+        ),
+    )
     parser.add_argument(
         '-s', '--stats',
         action='store_true',
@@ -803,7 +818,10 @@ def factor_dtb_files(args):
         seen_paths.add(abs_out)
         dtbo_paths.append(out_path)
 
-    base_dtb_blob, dtbo_blobs = create_base_dtb_and_overlays(dtbs)
+    base_dtb_blob, dtbo_blobs = create_base_dtb_and_overlays(
+        dtbs,
+        strip_local_fixups=args.strip_local_fixups,
+    )
 
     if args.outdir:
         os.makedirs(args.outdir, exist_ok=True)
diff --git a/tests/run_tests.sh b/tests/run_tests.sh
index 166a662708a5..e5ac38dd2bab 100755
--- a/tests/run_tests.sh
+++ b/tests/run_tests.sh
@@ -1243,6 +1243,24 @@ fdtfactor_tests () {
     done
     run_wrap_error_test $PYTHON $FDTFACTOR -o fdtfactor_legacy.test.dir \
 	fdtfactor_board1.nolf.test.dtb fdtfactor_board2.test.dtb
+
+    # Strip local fixups (-S): verify that merged DTBs match DTBs compiled
+    # with -@ (without -L), and that inputs lacking /__local_fixups__ are
+    # still rejected even when -S is passed.
+    run_wrap_error_test $PYTHON $FDTFACTOR -S -o fdtfactor_strip.test.dir \
+	fdtfactor_board1.nolf.test.dtb fdtfactor_board2.test.dtb
+    rm -rf fdtfactor_strip.test.dir
+    run_wrap_test $PYTHON $FDTFACTOR -S --output-base-dtb base_strip.test.dtb \
+	-o fdtfactor_strip.test.dir \
+	fdtfactor_board1.test.dtb fdtfactor_board2.test.dtb \
+	fdtfactor_board3.test.dtb
+    for i in 1 2 3; do
+	run_wrap_test $FDTOVERLAY -i fdtfactor_strip.test.dir/base_strip.test.dtb \
+	    -o fdtfactor_strip.test.dir/merged${i}.test.dtb \
+	    fdtfactor_strip.test.dir/fdtfactor_board${i}.test.dtbo
+	run_test dtbs_equal_unordered fdtfactor_board${i}.nolf.test.dtb \
+	    fdtfactor_strip.test.dir/merged${i}.test.dtb
+    done
 }
 
 while getopts "vt:me" ARG ; do
-- 
2.56.0.317.g454f8302e1-goog

