Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793224609;
	b=0mGO3Vy97IQ54MXBsHsV1SqisNnaEKUkDX/jndyDaxDK8J/UzFprs6jmAJ+S9AAC5CyG
	 2KQoS87Sqn2mz+WGJo5R6XNsr0wQhBa0AejPuDSlS0bdt5ZpUtGIFJtU0Ox342cvzhvzX
	 5jUUoz7edQ9TnPFCDm7Pztov4urDCCmPPUP8LfW8IMq0Uq4m5jPoWH+MA4P3P2Knzy9CG
	 jzw3Ja+X6XfH9hZRnO29emh4T2lkbuGjWhxseROFRxEJmfBtEurcRDKZB472yNjkdrl9a
	 63veaEo2Etue83lurrcL0V3TV64S+T2vOvFub+/jO0JE53boK9rWKHrUMUcmV4liUiw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793224609;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=MvLJqJMTVVoMmco88i36J5iA+D3Q4Nr/f/OH/N8rtAM=;
	b=M9gUIt9E35xJv0SAo8Q4tPf/atQ+fBJIDUZK6SuiXI5yemcs2ikDLULzjiCkt9cfP8tb
	 ob2p1FsftlmLHHcPcLWZ4ZRJ//nyfcCzh0nnhy5Q/oxi1rc1tvWH7va6SB8pnVjfWbWen
	 DjVGOiKdOeR8IhgVd7fNn2SF4ol3eR0ahrxNxsBaPfSdmWsBdn3MEILWTlEW0W4AJLFi+
	 5GtHak17l3VfQEA5NIT5nwmFWo0Bua34z3D83AYeBPjtErdtOuWK4NUww2MA1/aH9HVor
	 KfCggdvQ4IDywymlJibnJW1rbxlQYhUmBfYiGTkHaLuZVkNI+3CBBd1nijTg9gc1VHA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=TXmD1zG2;
	arc=none smtp.remote-ip=74.125.82.177
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91A5160A383E
	for <Devicetree@vger.kernel.org>; Wed, 28 Oct 2026 21:56:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 91A5160A383E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=TXmD1zG2
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-33fb4680717so1676385eec.1
        for <Devicetree@vger.kernel.org>; Wed, 28 Oct 2026 14:56:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793224608; x=1793829408; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MvLJqJMTVVoMmco88i36J5iA+D3Q4Nr/f/OH/N8rtAM=;
        b=TXmD1zG2rqdqOs8kbGTtZQg0U2A9b7xkOXVjJKLBpVo9KX+8QV+ndPeynB0a8nz1Ry
         NonWSpj0G6ZnKnykKLu0X5uIgPFSqCFUnKn98vaPDN42SW05NAcgHe4cLl44MFTeZxSd
         i2id+2t1F64J8qwPCD4C6OpUiejVb2a60ZSh8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793224608; x=1793829408;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MvLJqJMTVVoMmco88i36J5iA+D3Q4Nr/f/OH/N8rtAM=;
        b=MhzGnEu9EMIlMPvKtHSuj+9FrmUmhkI24crrOotGPpCzxPO3sI5eZLckhOsWa+qkMV
         LEQ76IJJtgF/yMnqYJB0WoS1O2cwffosL9T2guGmWGgJ5LrAB5iv3yeuLxalXQvdhzGk
         /ZF1O53+qKCARxum9+YKXNi4JOegXOmsyx3KhLxVYcanNGz41AMxfoFU+NsMdVTwj6Si
         I68SY2+BBifY6HGC0EgzJ/CL2mkKUiYJB0HEIzOliTf+wxTGOzIPJRnRrdT54+besspb
         p22LYxtfB3tikU6tVNSDqec1UgCDjBFMEBoFVxDPlhUf5y8VvYnOaSUZQ5SixsX5zxwc
         EEGA==
X-Forwarded-Encrypted: i=1; AKwUvBxxx7u2uAns01JC6a53do8SgMPANGkIzL7zE+0JklO47CxEzNlLS+P3mqVW080omcZREpiJNUBPRklZ@vger.kernel.org
X-Gm-Message-State: AFq9FYLO+8QNiqvk1GpwlQ4hTIZD7Rw2PPOvwznqRKuuydVARASarVzm
	hi4H+kT4052yVlhOvEnOnRlpJkTkVByvV+aLPPNF8sQnT0YtQOdLNTkr+DT//wrrSg==
X-Gm-Gg: AYBFou2K5Y2eLPJPe8/3efxxjjQp3VfWxFdwUckazbzuNDANdY0dYot7JS65VV4urVe
	3hJzFMwATG0dSfLXujDzZZ4P1/IUmYY0e6dpTe4sm/W1gp8ZOLJMFVp4oeQjwSa1UX2A3nNcNZn
	ydUJFNhLOIwDW8L8vN3VQC8bOxmZvFnlgS+N4KiAkZMksyDbOKN1Olia4sKARRsVWeTk0LoSHXf
	6AjdMPhtYyncNrpVjy/QiSsmokJSib7dqBbH8kDTlbNQKuw22bYMbzq9iZ+NfZSaCZQ+SBcQuQJ
	LH2jKyq9zVJFW1Gyx0TWADi0Ow32wWRtBVAL2wQo1+4P8dT8aOEJGSyOmlrMWUsqTpTbbE8d3q6
	ylitrMo+h5axXAUbxOldgnBoUW+ROJkPt6oINUBCzATCvy1Cls9ZGDfbe9xoP2W+IeGFWcfm4NM
	hUT7bhZEBzGbVz55JBWq9uYOfVNmDJV0OJTVvRdqyPhSV2C3wsA5Ny2+0rQk/rAU6eKxYoCzVSf
	NqCPQ8C9huC8lcWNaXstXcPl5R7sgYrn1fN9/pPmYeysNriwqohsywv8Xs++2qOR2sp0ikk9QQj
	s+VRnz8KXcH6ByAk4bkF9+QLqT1Ee4x2bzwx6d0LGRIwBhHVkFwtVQssIsMjVj7LeuB4Y33AZDR
	yjB3yY9mne/29cFK3bYqnQd8biZJw6e0DtA==
X-Received: by 2002:a05:693c:8946:10b0:369:f7d2:d7a0 with SMTP id 5a478bee46e88-36a20407ad2mr5600064eec.25.1793224607565;
        Wed, 28 Oct 2026 14:56:47 -0700 (PDT)
Received: from dianders.sjc.corp.google.com ([2a00:79e0:2e7c:8:19e7:c87:2527:4e12])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a2393cc86sm8845224eec.19.2026.10.28.14.56.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 14:56:46 -0700 (PDT)
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
Subject: [PATCH v2 08/10] fdtfactor: Add -S/--strip-local-fixups option
Date: Wed, 28 Oct 2026 14:46:57 -0700
Message-ID: <20261028215600.1713475-9-dianders@chromium.org>
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
Chromebook board DTBs, `fdtfactor -S` reduces total uncompressed size
from 7.69 MB to 634 KB (91.8% savings).

Add a test case in `tests/run_tests.sh` verifying that `fdtfactor -S`
followed by `fdtoverlay` reproduces DTBs compiled with `-@` (without
`-L`) via `dtbs_equal_unordered`.

Assisted-by: Gemini:gemini-pro-prerelease
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

Changes in v2:
- Split -S/--strip-local-fixups into a separate opt-in patch (David
  Gibson)

 README.md          |  9 +++++++++
 fdtfactor          | 34 ++++++++++++++++++++++++++--------
 tests/run_tests.sh | 22 ++++++++++++++++++++++
 3 files changed, 57 insertions(+), 8 deletions(-)

diff --git a/README.md b/README.md
index 446135e7c02c..9b2115ebbc67 100644
--- a/README.md
+++ b/README.md
@@ -118,6 +118,15 @@ Options:
 * `-o`, `--outdir`: Output directory for generated `.dtbo` files and
   `--base-dtb` (default: alongside each input `.dtb` for `.dtbo` files,
   current directory for `--base-dtb`).
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
index f1a5b35d5ee9..ebe1e3d44382 100755
--- a/fdtfactor
+++ b/fdtfactor
@@ -424,7 +424,8 @@ def _build_base_tree(dtbs):
     return base_root
 
 
-def _serialize_base_dtb(base_root, base_dtb_symbols, rsvmap, boot_cpuid_phys):
+def _serialize_base_dtb(base_root, base_dtb_symbols, rsvmap, boot_cpuid_phys,
+                        strip_local_fixups=False):
     """Materialize phandles, `/__symbols__`, and `/__local_fixups__` and flatten.
 
     Args:
@@ -433,6 +434,8 @@ def _serialize_base_dtb(base_root, base_dtb_symbols, rsvmap, boot_cpuid_phys):
         base_dtb_symbols: Dict mapping common symbol labels to target paths.
         rsvmap: Sequence of `(address, size)` memory reservation tuples.
         boot_cpuid_phys: Physical boot CPU ID for the FDT header.
+        strip_local_fixups: If True, omit `/__local_fixups__` from the
+            generated `base.dtb`.
 
     Returns:
         Serialized `.dtb` `bytes` for the common base DTB.
@@ -462,11 +465,12 @@ def _serialize_base_dtb(base_root, base_dtb_symbols, rsvmap, boot_cpuid_phys):
         for label, target_path in base_dtb_symbols.items():
             sym_node.set_str(label, target_path or '/')
 
-    # Always create `/__local_fixups__` on the base DTB so `fdt_overlay_apply()`
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
 
     return out_root.flatten(mem_rsv=rsvmap, boot_cpuid_phys=boot_cpuid_phys)
 
@@ -610,11 +614,13 @@ def _build_board_dtbo(dtb, base_root, base_dtb_symbols,
     return dtbo_root.flatten()
 
 
-def create_base_dtb_and_overlays(dtbs):
+def create_base_dtb_and_overlays(dtbs, strip_local_fixups=False):
     """Compute the base DTB and per-board DTBO blobs from parsed DTBs.
 
     Args:
         dtbs: Sequence of `ParsedDtb` instances (at least two).
+        strip_local_fixups: If True, omit `/__local_fixups__` from the
+            generated `base.dtb`.
 
     Returns:
         Tuple of `(base_dtb_blob, dtbo_blobs)` where `base_dtb_blob` is the
@@ -629,6 +635,7 @@ def create_base_dtb_and_overlays(dtbs):
     base_dtb_blob = _serialize_base_dtb(
         base_root, base_dtb_symbols,
         dtbs[0].mem_rsv, dtbs[0].boot_cpuid_phys,
+        strip_local_fixups=strip_local_fixups,
     )
     dtbo_blobs = [
         _build_board_dtbo(
@@ -691,6 +698,14 @@ def parse_args(argv=None):
             'for --base-dtb)'
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
@@ -775,7 +790,10 @@ def factor_dtb_files(args):
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
index e012aff2193b..b0c621e5d1c3 100755
--- a/tests/run_tests.sh
+++ b/tests/run_tests.sh
@@ -1184,6 +1184,28 @@ fdtfactor_tests () {
     run_wrap_error_test $PYTHON $FDTFACTOR -o fdtfactor_legacy.test.dir \
 	fdtfactor_out.test.dir/fdtfactor_board1.test.dtbo \
 	fdtfactor_board2.test.dtb
+
+    # Strip local fixups (-S): verify that merged DTBs match DTBs compiled
+    # with -@ (without -L), and that inputs lacking /__local_fixups__ are
+    # rejected.
+    for i in 1 2 3; do
+	run_dtc_test -b 2 -@ -I dts -O dtb -o fdtfactor_board${i}.nolf.test.dtb \
+	    "$SRCDIR/fdtfactor_board${i}.dts"
+    done
+    run_wrap_error_test $PYTHON $FDTFACTOR -o fdtfactor_strip.test.dir \
+	fdtfactor_board1.nolf.test.dtb fdtfactor_board2.test.dtb
+    rm -rf fdtfactor_strip.test.dir
+    run_wrap_test $PYTHON $FDTFACTOR -S -b base_strip.test.dtb \
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
2.56.0.313.g2479322e68-goog

