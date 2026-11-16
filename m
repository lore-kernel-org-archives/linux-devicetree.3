Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794862457;
	b=JJLidZUB/dRVRN8dx+DgazK+9e175FNpqgLTOeKGsT5IXVNu4v6IfJSq8nUtlhuaOU8g
	 4XJBdJmNU2jPO0ZK7juGyRMyQZn61c95mOLxG5lAdyRjtRLggUawK4t6eAGUQR2Gj9S1U
	 Mhn44vq2n+ciTR0Z4GJx3e9kx5Y3VQmocVx4V+OfGsOOE6A0L1snYKu8CGSca3hjYH91M
	 Egcur9jvchxbIfpnw5dX040IyLA6Mw+xPuPGg0JpHXgJO7kJC9jpcQaJAJ2IM57wAytPL
	 WuYOF1gzPmotoEf9hLKMrXdcZMLa02vLUbYJSYY3APOQkO/Kw5s8Ksgr8UvXlZjIB5A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794862457;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=wY23vVP26FclYf43DSPod+3AMaTOMObgwHZwGjSX/TM=;
	b=n1ON77Sll4AFiqvJaaXmD6jdCOj3b4/XbIBThR+9DgoA0y3OKb0+xRbKFEifpFQB3w4s
	 S0OMUYQFnEggP7xjlokw7UoARiT1dCJD9ruewya6AEKkJHSYoq/6zL7c3re9/2q924JkS
	 ILj0h3tMo6/75Sss69V4tOcnwLEeBJCGtpV+SxvaUPhH4/r4BcX+loM3CmwkYjds2/kdF
	 Jp7EZgZfjUHuNMVlJ+vqnU4SauDT9mY14ehZ9CsPwRIp8LGUXC6PD6HRnSQehz3TfheLS
	 XG5wU78ARmlln31nask3gUJIgWkdjH9QX5+o//WBpD3MEbv5kH8Il21O8dKhAemsXqw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=Q6wL8QK+;
	arc=none smtp.remote-ip=74.125.82.175
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89182606A8A1
	for <Devicetree@vger.kernel.org>; Mon, 16 Nov 2026 20:54:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 89182606A8A1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=Q6wL8QK+
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-380b40312e2so1792224eec.1
        for <Devicetree@vger.kernel.org>; Mon, 16 Nov 2026 12:54:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1794862456; x=1795467256; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wY23vVP26FclYf43DSPod+3AMaTOMObgwHZwGjSX/TM=;
        b=Q6wL8QK+VY9xx+ONDUwIFC6FoYn6h2EOxNhpRr0lXW0s0OR9kdjh9F26P5SZhxBqvt
         s7mpPCa+m9D2lUEuynLelsGjX/50XOlz93ERGrMUqwsncVx6fnJWktyceqYkGfMjGu/r
         khlaMciBwbYHKIACSjmasF7++5fez2yj8AQFk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794862456; x=1795467256;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wY23vVP26FclYf43DSPod+3AMaTOMObgwHZwGjSX/TM=;
        b=hzBNUBTQs/4k3GxKbAkqeXREWG228XMX+f19BEU4exoRmDI6RaqZ3T3AlCSzR6KOE+
         b1RmBEsmb6fZksZ1fqun/iuojsRGY7ogrbPqUAhCQotPzqyp7CMKctAd80X2b3bHwADY
         zCuNEQ7E9d4UOg0ibKARpvdzjyytgqE6uFZkrlvlq6+whC40bZx+52IAhjasd1kKIJpc
         EPJHZfKWehUVpeJlbR47c01edPCHvFJsQ1GMvZA7ySC7E3k9x4mzwyjMEkkC+QhuuY3i
         UHc53QH7o0uBli3oDdV2bx8GeevAm8Q5576UsbS8H6zU/J3YPqkx/6bnhBCmL1472c9c
         F+lQ==
X-Gm-Message-State: APuU4Z8jlbIRvTe0WFZfj3/YaAQuhI43qe3kTZSJ+3I7kOt/MFe9bBby
	DTM8dDIkaDSEjXcTvYFpIaKirHRxD2A+MSKNoJAQh9cGIjGQ05/oODFHF1aVcvANYXJPdfIbUMe
	u8xPROQ==
X-Gm-Gg: AZFdTZcqfmKt1AzXR5MkGcEInurjC+7aABuTo4cq0tXyDEIrs2TXu4ZMveb3Sl7uGud
	cUz/KWErpsUfyFKdiAy5unz8R2Q8L601cVkS9BeeT6aJh/KdZV0l7zfO/iIxX2cXZWgEhHyAyQG
	lIgxZNcL4mYk+5G2pO0aGnnFhOo/BqRrFYGv4+/ID5J3xpNLk5tew4hsoBzqbFdTinnOUzLy66K
	4lT/D5vVj0aS5pa+Vd6IkcvoNi6+DYXflA/DWGN7ki9ocdGH7AZxYAUjXYBZ+rVd+skNGP+wka6
	Vys4iJY/tFPAG4RCw1XU/663nD/a8TwkhiXwKWIi+yzlbmuu8qjA+n72ENfXQk1BVQcMJaaWbjP
	y8gvfSdk/9pUQNmko45nKRLJsEPjOjtEoxJ95d09WfjxpgqzM8fywSvZpnbMrc7Ce7d1A5HsoIF
	gaAfo7viA84HYteomsU9fyXop5INLDtJGY8MEO/KmO/9YmkmGcYc5JcUPlH1brc03ZzifKTggZ3
	wZxoG2rsMr1cZ4BswAdL8Us8OhCUOz5WmQJEyEGjJ4z3yJxaD/2u3b+kvC34nPIG6rTLIgV/d1k
	UnDO8xOibGn0Ptr3e+OtL2xhDmBr3JDtdvvq7weqwKSLXxZbrE2FOR2Ijq+v7NzLVpI3Gc1CNgk
	GoZ2FpgnIQhHVlA==
X-Received: by 2002:a05:693c:83d4:10b0:37f:4fda:1a85 with SMTP id 5a478bee46e88-37f4fda20f2mr3778860eec.16.1794862455442;
        Mon, 16 Nov 2026 12:54:15 -0800 (PST)
Received: from dianders.sjc.corp.google.com ([2a00:79e0:2e7c:8:40c8:6e27:a2df:3321])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379563e6b6dsm67120390eec.21.2026.11.16.12.54.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 12:54:14 -0800 (PST)
From: Douglas Anderson <dianders@chromium.org>
To: Devicetree-compiler@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: Devicetree@vger.kernel.org,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Chen-Yu Tsai <wenst@chromium.org>,
	Saravana Kannan <saravanak@kernel.org>,
	David Gibson <david@gibson.dropbear.id.au>,
	=?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@linaro.org>,
	Simon Glass <sjg@chromium.org>,
	linux-kernel@vger.kernel.org,
	Brian Norris <briannorris@chromium.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	Julius Werner <jwerner@chromium.org>,
	Douglas Anderson <dianders@chromium.org>
Subject: [PATCH v4 14/14] fdtfactor: Parallelize blob compression and decompression
Date: Mon, 16 Nov 2026 12:53:11 -0800
Message-ID: <20261116205320.1621386-15-dianders@chromium.org>
X-Mailer: git-send-email 2.56.0.679.gc527c65306-goog
In-Reply-To: <20261116205320.1621386-1-dianders@chromium.org>
References: <20261116205320.1621386-1-dianders@chromium.org>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

When factoring dozens or hundreds of compressed DTBs (either standalone
with `-C` or inside a compiled FIT with `-F`), running `gzip`, `lzma`,
`xz`, or external `lz4` processes sequentially spends several seconds
compressing and decompressing blobs one at a time.

Because Python's `zlib` and `_lzma` C extensions and `subprocess.run()`
for `lz4` all release the GIL, add a small `_map_blobs()` helper using
`concurrent.futures.ThreadPoolExecutor` to decompress input blobs and
compress output base/overlay blobs across worker threads in
deterministic input order whenever multiple compressed blobs are
processed.

Assisted-by: Gemini:gemini-pro-prerelease
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---
Found this speedup while benchmarking fdtfactor. It's not critical to
functionality, but seems like a nice win.

Changes in v4:
- New patch parallelizing blob compression and decompression across
  worker threads

 fdtfactor | 190 +++++++++++++++++++++++++++++++++++++++---------------
 1 file changed, 138 insertions(+), 52 deletions(-)

diff --git a/fdtfactor b/fdtfactor
index ebf40cdeaf92..ab59763d8863 100755
--- a/fdtfactor
+++ b/fdtfactor
@@ -18,6 +18,7 @@ its embedded `/images/fdt-*` blobs into base DTBs (`fdt-base-1`, `fdt-base-2`,
 
 import argparse
 from collections import Counter
+import concurrent.futures
 import copy
 import gzip
 import hashlib
@@ -140,6 +141,32 @@ def compress_blob(raw_bytes, comp, filename=''):
     raise ValueError(f'{prefix}Unsupported compression type: {comp}')
 
 
+def _map_blobs(func, tasks, pool=None):
+    """Apply `func(blob, comp, filename)` across `tasks`, parallelizing if compressed.
+
+    Python's `zlib` and `_lzma` C extensions and external `lz4` subprocesses
+    release the GIL, so running multiple compressed tasks across a
+    `ThreadPoolExecutor` overlaps compression and decompression across CPU
+    cores while preserving deterministic input order.
+
+    Args:
+        func: `decompress_blob` or `compress_blob`.
+        tasks: Sequence of `(blob_bytes, comp, filename)` tuples.
+        pool: Optional shared `ThreadPoolExecutor` instance.
+
+    Returns:
+        List of processed `bytes` in the same order as `tasks`.
+    """
+    if len(tasks) < 2 or not any(
+        comp not in ('none', '', None) for _, comp, _ in tasks
+    ):
+        return [func(*t) for t in tasks]
+    if pool is not None:
+        return list(pool.map(lambda t: func(*t), tasks))
+    with concurrent.futures.ThreadPoolExecutor() as new_pool:
+        return list(new_pool.map(lambda t: func(*t), tasks))
+
+
 def _is_dtbo_overlay(root):
     """Return True if `root` is a `.dtbo` overlay tree rather than a base DTB.
 
@@ -1061,13 +1088,14 @@ def group_fit_dtbs(fdt_entries, min_overlap=50.0):
     return [grp['entries'] for grp in groups]
 
 
-def _extract_fit_fdt_entries(fit_in_path, images_node, configs_node):
+def _extract_fit_fdt_entries(fit_in_path, images_node, configs_node, pool=None):
     """Extract and parse non-overlay `flat_dt` entries from `/images`.
 
     Args:
         fit_in_path: Input FIT path (for error reporting).
         images_node: `DeviceTree` for the FIT `/images` node.
         configs_node: `DeviceTree` for the FIT `/configurations` node.
+        pool: Optional shared `ThreadPoolExecutor` for decompression.
 
     Returns:
         List of dicts (`{'name', 'node', 'dtb', 'fdt'}`) for all non-overlay
@@ -1081,7 +1109,7 @@ def _extract_fit_fdt_entries(fit_in_path, images_node, configs_node):
                     f'is not supported; sign the FIT after factoring'
                 )
 
-    fdt_entries = []
+    candidates = []
     for img_name, img_node in images_node.children.items():
         if ('data-offset' in img_node.props or
                 'data-position' in img_node.props):
@@ -1112,7 +1140,19 @@ def _extract_fit_fdt_entries(fit_in_path, images_node, configs_node):
             )
         if comp == 'lz4' and raw_data.startswith(LZ4_LEGACY_MAGIC):
             comp = 'lz4_legacy'
-        raw_bytes = decompress_blob(raw_data, comp, filename=node_label)
+        candidates.append((img_name, img_node, node_label, comp, raw_data))
+
+    raw_blobs = _map_blobs(
+        decompress_blob,
+        [(raw_data, comp, node_label)
+         for _, _, node_label, comp, raw_data in candidates],
+        pool=pool,
+    )
+
+    fdt_entries = []
+    for (img_name, img_node, node_label, comp, raw_data), raw_bytes in zip(
+        candidates, raw_blobs
+    ):
         fdt = _open_fdt(raw_bytes, node_label)
         root = FactoredTree.unflatten(fdt)
         if _is_dtbo_overlay(root):
@@ -1194,13 +1234,15 @@ def _partition_fit_fdt_entries(fdt_entries, single_base_dtb, min_overlap=50.0):
     return factorable_groups, unfactored_entries
 
 
-def _strip_fit_unfactored_local_fixups(unfactored_entries):
+def _strip_fit_unfactored_local_fixups(unfactored_entries, pool=None):
     """Strip `/__local_fixups__` from unfactored FIT `flat_dt` entries.
 
     Args:
         unfactored_entries: List of single-board FIT `flat_dt` entry dicts left
             unfactored by `_partition_fit_fdt_entries()`.
+        pool: Optional shared `ThreadPoolExecutor` for compression.
     """
+    to_recompress = []
     for entry in unfactored_entries:
         fdt = entry.pop('fdt')
         tree = libpydt.DeviceTree.unflatten(fdt)
@@ -1210,17 +1252,26 @@ def _strip_fit_unfactored_local_fixups(unfactored_entries):
             mem_rsv=entry['dtb'].mem_rsv,
             boot_cpuid_phys=entry['dtb'].boot_cpuid_phys,
         )
-        comp_bytes = compress_blob(
-            bytes(stripped_fdt.as_bytearray()),
+        stripped_bytes = bytes(stripped_fdt.as_bytearray())
+        to_recompress.append((
+            entry['node'],
+            stripped_bytes,
             entry['dtb'].compression,
-            filename=f'/images/{entry["name"]}',
-        )
-        img_node = entry['node']
+            f'/images/{entry["name"]}',
+        ))
+
+    comp_blobs = _map_blobs(
+        compress_blob,
+        [(blob, comp, label) for _, blob, comp, label in to_recompress],
+        pool=pool,
+    )
+    for (img_node, _, _, _), comp_bytes in zip(to_recompress, comp_blobs):
         img_node.set_prop(libfdt.Property('data', comp_bytes))
         _update_fit_hashes(img_node)
 
 
-def _factor_fit_group(entries, base_dtb_node_name, strip_local_fixups):
+def _factor_fit_group(entries, base_dtb_node_name, strip_local_fixups,
+                      pool=None):
     """Factor one group of FIT `flat_dt` entries into a base node and overlays.
 
     Args:
@@ -1229,6 +1280,7 @@ def _factor_fit_group(entries, base_dtb_node_name, strip_local_fixups):
             node (e.g., `'fdt-base-1'`).
         strip_local_fixups: If True, omit `/__local_fixups__` from the
             generated base DTB.
+        pool: Optional shared `ThreadPoolExecutor` for compression.
 
     Returns:
         Tuple of `(base_dtb_node, stat_args)` where `base_dtb_node` is the
@@ -1241,9 +1293,20 @@ def _factor_fit_group(entries, base_dtb_node_name, strip_local_fixups):
     )
     base_comp = group_dtbs[0].compression
 
-    base_dtb_comp_bytes = compress_blob(
-        base_dtb_blob, base_comp, filename=f'/images/{base_dtb_node_name}'
+    comp_blobs = _map_blobs(
+        compress_blob,
+        [
+            (base_dtb_blob, base_comp, f'/images/{base_dtb_node_name}'),
+            *(
+                (dtbo_blob, entry['dtb'].compression, f'/images/{entry["name"]}')
+                for entry, dtbo_blob in zip(entries, dtbo_blobs)
+            ),
+        ],
+        pool=pool,
     )
+    base_dtb_comp_bytes = comp_blobs[0]
+    dtbo_comp_blobs = comp_blobs[1:]
+
     base_dtb_node = copy.deepcopy(entries[0]['node'])
     for prop in ('phandle', 'compatible'):
         base_dtb_node.props.pop(prop, None)
@@ -1272,12 +1335,9 @@ def _factor_fit_group(entries, base_dtb_node_name, strip_local_fixups):
     _update_fit_hashes(base_dtb_node)
 
     dtbo_comp_sizes = []
-    for entry, dtbo_blob in zip(entries, dtbo_blobs):
+    for entry, dtbo_comp_bytes in zip(entries, dtbo_comp_blobs):
         img_node = entry['node']
         entry_comp = entry['dtb'].compression
-        dtbo_comp_bytes = compress_blob(
-            dtbo_blob, entry_comp, filename=f'/images/{entry["name"]}'
-        )
         dtbo_comp_sizes.append(len(dtbo_comp_bytes))
 
         if 'description' in img_node.props:
@@ -1386,39 +1446,42 @@ def factor_fit(fit_in_path, fit_out_path, strip_local_fixups=False,
             f'/configurations nodes'
         )
 
-    fdt_entries = _extract_fit_fdt_entries(
-        fit_in_path, images_node, configs_node
-    )
-    factorable_groups, unfactored_entries = _partition_fit_fdt_entries(
-        fdt_entries, single_base_dtb, min_overlap=min_overlap
-    )
-    if strip_local_fixups and unfactored_entries:
-        _strip_fit_unfactored_local_fixups(unfactored_entries)
-    else:
-        for entry in unfactored_entries:
-            entry.pop('fdt', None)
-
-    fdt_to_base_dtb = {}
-    insert_before_first = {}
-    group_stats = []
-    used_image_names = set(images_node.children)
-    next_base_idx = 1
-
-    for entries in factorable_groups:
-        while f'fdt-base-{next_base_idx}' in used_image_names:
-            next_base_idx += 1
-        base_dtb_node_name = f'fdt-base-{next_base_idx}'
-        used_image_names.add(base_dtb_node_name)
-        next_base_idx += 1
-        base_dtb_node, stat_args = _factor_fit_group(
-            entries, base_dtb_node_name, strip_local_fixups
+    with concurrent.futures.ThreadPoolExecutor() as pool:
+        fdt_entries = _extract_fit_fdt_entries(
+            fit_in_path, images_node, configs_node, pool=pool
         )
-        insert_before_first[entries[0]['name']] = (
-            base_dtb_node_name, base_dtb_node
+        factorable_groups, unfactored_entries = _partition_fit_fdt_entries(
+            fdt_entries, single_base_dtb, min_overlap=min_overlap
         )
-        for entry in entries:
-            fdt_to_base_dtb[entry['name']] = (base_dtb_node_name, entry['dtb'])
-        group_stats.append(stat_args)
+        if strip_local_fixups and unfactored_entries:
+            _strip_fit_unfactored_local_fixups(unfactored_entries, pool=pool)
+        else:
+            for entry in unfactored_entries:
+                entry.pop('fdt', None)
+
+        fdt_to_base_dtb = {}
+        insert_before_first = {}
+        group_stats = []
+        used_image_names = set(images_node.children)
+        next_base_idx = 1
+
+        for entries in factorable_groups:
+            while f'fdt-base-{next_base_idx}' in used_image_names:
+                next_base_idx += 1
+            base_dtb_node_name = f'fdt-base-{next_base_idx}'
+            used_image_names.add(base_dtb_node_name)
+            next_base_idx += 1
+            base_dtb_node, stat_args = _factor_fit_group(
+                entries, base_dtb_node_name, strip_local_fixups, pool=pool
+            )
+            insert_before_first[entries[0]['name']] = (
+                base_dtb_node_name, base_dtb_node
+            )
+            for entry in entries:
+                fdt_to_base_dtb[entry['name']] = (
+                    base_dtb_node_name, entry['dtb']
+                )
+            group_stats.append(stat_args)
 
     _update_fit_images_and_configs(
         images_node, configs_node, insert_before_first, fdt_to_base_dtb
@@ -1668,7 +1731,24 @@ def factor_dtb_files(args):
     """
     comp = args.compression
     input_dtb_paths = args.dtbs
-    dtbs = [ParsedDtb(p, comp=comp) for p in input_dtb_paths]
+    file_blobs = []
+    for p in input_dtb_paths:
+        with open(p, 'rb') as f:
+            file_blobs.append(f.read())
+    raw_blobs = _map_blobs(
+        decompress_blob,
+        [(b, comp, p) for p, b in zip(input_dtb_paths, file_blobs)],
+    )
+    dtbs = [
+        ParsedDtb(
+            p,
+            comp=comp,
+            fdt=_open_fdt(raw, p),
+            uncompressed_size=len(raw),
+            compressed_size=len(fblob),
+        )
+        for p, fblob, raw in zip(input_dtb_paths, file_blobs, raw_blobs)
+    ]
 
     base_dtb_path = (
         os.path.join(args.output, args.output_base_dtb)
@@ -1706,20 +1786,26 @@ def factor_dtb_files(args):
         strip_local_fixups=args.strip_local_fixups,
     )
 
-    base_dtb_file_bytes = compress_blob(
-        base_dtb_blob, comp, filename=base_dtb_path
+    comp_blobs = _map_blobs(
+        compress_blob,
+        [
+            (base_dtb_blob, comp, base_dtb_path),
+            *((b, comp, p) for p, b in zip(dtbo_paths, dtbo_blobs)),
+        ],
     )
+    base_dtb_file_bytes = comp_blobs[0]
+    dtbo_comp_blobs = comp_blobs[1:]
+
     if args.output:
         os.makedirs(args.output, exist_ok=True)
     with open(base_dtb_path, 'wb') as f:
         f.write(base_dtb_file_bytes)
 
     dtbo_file_sizes = []
-    for out_path, dtbo_blob in zip(dtbo_paths, dtbo_blobs):
+    for out_path, out_bytes in zip(dtbo_paths, dtbo_comp_blobs):
         out_dir = os.path.dirname(out_path)
         if out_dir:
             os.makedirs(out_dir, exist_ok=True)
-        out_bytes = compress_blob(dtbo_blob, comp, filename=out_path)
         dtbo_file_sizes.append(len(out_bytes))
         with open(out_path, 'wb') as f:
             f.write(out_bytes)
-- 
2.56.0.679.gc527c65306-goog

