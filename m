Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793570631;
	b=PJ+sh9hMe9MHsAaBGCFH1rRntQZSUOm6Uz2rOBmDF80v+Js3EJaP1iTJRlJDgmuU9hjn
	 ybxO3jha8u/d4ut9okTIR+Js0LClFGIgripBpuhQjXd1kb6iWGs6XMT4Pl77A2tF6OHpp
	 YoXh7PVljhnSbN7py4874ABq7LR1ZBdTCqs2dRKaPsjgpuKQGz0lRJiWxXbMN+WdD+hdU
	 wRMG5DdXDF/8giz8Fz8BkAJkn8d85LtEZDFxgvsmL8swkZbcdUyTstvk8ivKt+RuvackI
	 UGmt8CTtwGcc0z3HqPS5B0pv+uwKeh//mhKWbmZGaTw7COO5PEZbcDzDtQxFHh/DoLw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793570631;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=bD/vlkPqinAapl5RMxcxWzjL0Xw5ibaSxR6emJ/L0iM=;
	b=EWMDCrNXeFTn59NtDi35DttsNbCzWPnWacx7LVe7RU2FAWAils0H2gjhW6EK2Ttvlwa5
	 wFbKxBGutz9DcOVU5T2dy+u5GjfU4Bi617v/R4AYnhl6P24HGo8BBB6mi2TDs+acrT0WC
	 sf41cezLLG4qaZ/a+QVS8FJ5eTd/Hk/a+3hCwsQChggj2W/BIUuU2EHT5iz3Gsc4Vbp22
	 qs/nvvvFpVN7aG8gtED6kavjHA5Wo2z1oBtPJm/SYU84VrS/eHk01pF9KZ1+ZNRb0j7Qk
	 rnY89Ke+pwSSZ22/h+Ur1stjMIxtIndL698gR1WEmTPYf9tpeAW2oFLAhD73D/+ru/g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=K2AlmytZ;
	arc=none smtp.remote-ip=74.125.82.172
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D45F606A337
	for <Devicetree@vger.kernel.org>; Sun,  1 Nov 2026 22:03:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9D45F606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=K2AlmytZ
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-36661f953e4so3774332eec.1
        for <Devicetree@vger.kernel.org>; Sun, 01 Nov 2026 14:03:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793570630; x=1794175430; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bD/vlkPqinAapl5RMxcxWzjL0Xw5ibaSxR6emJ/L0iM=;
        b=K2AlmytZVl73vvxOMdBztOeX5764uPGxvghGjFtcc6avSP+EC0orerWN8YiL6C3a6Z
         drxHn8/qSi0b957X6JH8qaOAyxsY6DNKLuls1sYp2R+YZqfbJBE5uNpd9FuV/djhX3ez
         9mYcb0FSWwnu1A6NHEbLjYyGFnZ3CZuaWW6Eg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793570630; x=1794175430;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bD/vlkPqinAapl5RMxcxWzjL0Xw5ibaSxR6emJ/L0iM=;
        b=Qb+f+Zstxh+3I1/w52oBDEnhkBavuq4bC2HTo30ZtozGKf/yofdzoqVO/D+oVGDdl2
         JAz27OSOFlM6DkknTQkqOQWir5tpkFTmUDOOtlysMb3oSAQaR88C586rXQasZsWq2I0O
         l5qoSfjzdqqwkWKW6683OsN3axmjziPjv2SkSE7S29zvZKhhy4TKPNVpj/fpTOKC8K1V
         QZY+Anw0YwGNrGdoTKXreizerzhGr9VdRoj+NVZTHEXl0ETmXxEPIGwAB1h/Gwlx9drQ
         Eix9Gm3HLtdDMxJJadT/DLJUriyYLA48VV8MNG6Vmt4iJGLkcbYzmRxJr7IheANZJU+X
         15EQ==
X-Forwarded-Encrypted: i=1; AKwUvBwmvyKXTiU/yX1wPcGHR7d8BjeDmfv2x8KlEY+sEEPEOs4CEJmJn5WqH7oGcd6yYf5Jyv97GYQAYXE+@vger.kernel.org
X-Gm-Message-State: AFq9FYKvQDlZZyzDWKEkKaK+vfrDekHAhE2xGeTlbvGK23kOryHrsVhB
	466hlv8HPaszksoFszTu5vqnKey4au7+K1b8QBTHqD9BheaJtYVJa5jeWv3SkoqdpA==
X-Gm-Gg: AYBFou3wDNw35V3Z4Nwy0zYl+hd+ACj2xyQrWWtFHQK34n3WqPv+aS8XDtVFqPpBjRl
	fU4rjBShjsU56bVY2Z9SFGYrgRYXj9BptGByljvOBEGptxUtShK4PwGGg9ioqQBnlU0p6eScMUR
	TvlN3BAZTHiRIq9fwKlcoNqLG/9fkK7XiuvsX7aoAL19MClKXjGdv9wkP1TLsaF7w8VMdOLWLgF
	I9DYP2Tg7o54FBxWgEjjiYOK49LcY4Tf0IlO+c9lFWWL+sxWSOlxTM3I7PthMNeW2lvZ1o4TTpz
	qSJf+dvhY6qfKUQcOUhxd3cHL6qF+jQoxhCDjNv+k5K+NuambBZ+kB74tFgWhhMkspWNUlVTpMr
	vL/mc0/jCBLRzE65EScf9uti71L6/P3KGKkXnypuShnJjW0fSl4T60cvFyet69ALXfo6nRPo5SY
	UU5nJIe5VPIw+XGD7uYomaIFqfSp+VpStwN3rfM4Up9X7e98nq7sPpP86WkxZzHw859bwFT+1Ew
	yFv84MjSpi7M5T2w2vWO2pGB2923fY7fhIfCYMcchpEYnGuWleUYoNoovPAPed19qpkYom6HqSm
	cY0+WzqbKEi9QFHtIEpyujf3iPsu/ZjqY0dQIaYCS8NyxjWC/JsoovioK7qgmiF9HvJmFb3+1WU
	U4AzOYw/CEnpu6A==
X-Received: by 2002:a05:7022:3b81:b0:1ae:59d6:91cd with SMTP id a92af1059eb24-1ae59d694e9mr10086805c88.38.1793570629449;
        Sun, 01 Nov 2026 14:03:49 -0800 (PST)
Received: from dianders.sjc.corp.google.com ([2a00:79e0:2e7c:8:cbd8:5ca8:653a:11f9])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b106edc7f8sm11097266c88.9.2026.11.01.14.03.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 14:03:48 -0800 (PST)
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
Subject: [PATCH v3 07/15] devicetree: Add DeviceTree live tree representation
Date: Sun,  1 Nov 2026 14:01:14 -0800
Message-ID: <20261101220224.1436242-8-dianders@chromium.org>
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

Add `devicetree.py` providing `DeviceTree`, a non-flattened in-memory
representation of a devicetree node and its subtree:

- `DeviceTree.unflatten(fdt, offset=0)` builds a `DeviceTree` hierarchy
  from an `FdtRo` instance, storing `libfdt.Property` instances in
  `self.props` and raising `ValueError` if duplicate property or sibling
  subnode names are encountered.
- `DeviceTree.flatten(mem_rsv=(), boot_cpuid_phys=0)` serializes a root
  `DeviceTree` back into a packed `libfdt.Fdt` object via `FdtSw`.
- `get_node()`, `create_path()`, and `walk()` provide path lookup,
  intermediate node creation, and pre-order traversal.
- `get_str()`, `set_str()`, `get_stringlist()`, `set_stringlist()`,
  `get_u32()`, `set_u32()`, `get_u32_list()`, and `set_u32_list()`
  provide typed property access and mutation.

Add unit tests in `tests/pylibfdt_tests.py` covering `DeviceTree`
unflatten/flatten round-tripping, duplicate name rejection, and helper
methods.

Assisted-by: Gemini:gemini-pro-prerelease
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

Changes in v3:
- Move NodeTree out of pylibfdt/libfdt.i into a new devicetree.py module
  and rename it to DeviceTree (David Gibson)
- Store libfdt.Property objects in self.props instead of raw bytes
  (David Gibson)
- Return a packed libfdt.Fdt object from flatten() instead of raw bytes
  and use fdt.set_boot_cpuid_phys() (David Gibson, Simon Glass)
- Raise ValueError in unflatten() on duplicate property or sibling
  subnode names (Simon Glass)

Changes in v2:
- Split live tree representation out of fdtfactor (David Gibson)

 devicetree.py           | 276 ++++++++++++++++++++++++++++++++++++++++
 meson.build             |   1 +
 tests/meson.build       |   2 +-
 tests/pylibfdt_tests.py |  77 +++++++++++
 4 files changed, 355 insertions(+), 1 deletion(-)
 create mode 100644 devicetree.py

diff --git a/devicetree.py b/devicetree.py
new file mode 100644
index 000000000000..198ab73eda88
--- /dev/null
+++ b/devicetree.py
@@ -0,0 +1,276 @@
+# SPDX-License-Identifier: (GPL-2.0-or-later OR BSD-2-Clause)
+"""devicetree - Non-flattened in-memory device tree representation in Python."""
+
+import struct
+
+import libfdt
+
+
+class DeviceTree:
+    """In-memory live tree representation of a devicetree node and its subtree.
+
+    Attributes:
+        props: Dict mapping property name (str) to `libfdt.Property`.
+        children: Dict mapping child node name (str) to child `DeviceTree`.
+    """
+
+    def __init__(self):
+        self.props = {}
+        self.children = {}
+
+    @classmethod
+    def unflatten(cls, fdt, offset=0):
+        """Unflatten an FdtRo subtree starting at `offset` into a DeviceTree.
+
+        Args:
+            fdt: An `FdtRo` (or `Fdt`) instance.
+            offset: Starting node offset (default 0 for the root node).
+
+        Returns:
+            A `DeviceTree` representing the node at `offset` and its
+            descendants.
+
+        Raises:
+            ValueError: If a node contains duplicate property names or
+                duplicate sibling subnode names.
+        """
+        node = cls()
+        for prop in fdt.properties(offset):
+            if prop.name in node.props:
+                raise ValueError(f'Duplicate property {prop.name!r}')
+            node.props[prop.name] = prop
+        for suboff in fdt.subnodes(offset):
+            subname = fdt.get_name(suboff)
+            if subname in node.children:
+                raise ValueError(f'Duplicate subnode {subname!r}')
+            node.children[subname] = cls.unflatten(fdt, suboff)
+        return node
+
+    def _flatten_subtree(self, sw, name):
+        """Recursively write this DeviceTree and its children into an FdtSw.
+
+        Args:
+            sw: An `FdtSw` sequential-write instance.
+            name: Node name for this subtree (empty string `''` for root).
+        """
+        with sw.add_node(name):
+            for prop_name, val in self.props.items():
+                sw.property(prop_name, bytes(val))
+            for child_name, child_node in self.children.items():
+                child_node._flatten_subtree(sw, child_name)
+
+    def flatten(self, mem_rsv=(), boot_cpuid_phys=0):
+        """Serialize this root DeviceTree into a packed `libfdt.Fdt` object.
+
+        Args:
+            mem_rsv: Iterable of (address, size) tuples for the FDT memory
+                reservation block.
+            boot_cpuid_phys: Physical boot CPU ID for the FDT header.
+
+        Returns:
+            Packed `libfdt.Fdt` instance.
+        """
+        sw = libfdt.FdtSw()
+        for addr, size in mem_rsv:
+            sw.add_reservemap_entry(addr, size)
+        sw.finish_reservemap()
+        self._flatten_subtree(sw, '')
+        fdt = sw.as_fdt()
+        fdt.set_boot_cpuid_phys(boot_cpuid_phys)
+        fdt.pack()
+        return fdt
+
+    def get_node(self, path):
+        """Look up a descendant DeviceTree by path without modifying the tree.
+
+        Follows the slash-separated node names in `path` starting from `self`
+        (leading, trailing, and repeated `'/'` characters are ignored, so
+        `'/soc/i2c@4000'` and `'soc/i2c@4000'` behave identically, and `''` or
+        `'/'` returns `self`). If any component along `path` is not present in
+        `children`, returns `None`.
+
+        Args:
+            path: Slash-separated node path starting from `self` (e.g.
+                `'/soc/i2c@4000'` or `'soc/i2c@4000'`).
+
+        Returns:
+            The `DeviceTree` at `path`, or `None` if not found.
+        """
+        node = self
+        for part in path.split('/'):
+            if not part:
+                continue
+            node = node.children.get(part)
+            if node is None:
+                return None
+        return node
+
+    def create_path(self, path):
+        """Return the descendant DeviceTree at `path`, creating missing nodes.
+
+        Looks up a child or deeper descendant `DeviceTree` by following the
+        slash-separated node names in `path` starting from `self` (leading,
+        trailing, and repeated `'/'` characters are ignored, so
+        `'/soc/i2c@4000'` and `'soc/i2c@4000'` behave identically). If any
+        node along `path` does not exist yet in `children`, a new empty
+        `DeviceTree` is created for it automatically (similar to `mkdir -p`).
+        Passing `''` or `'/'` returns `self`.
+
+        Example:
+            root = DeviceTree()
+            # Automatically creates root.children['soc'] and
+            # root.children['soc'].children['i2c@4000'], and returns the
+            # 'i2c@4000' DeviceTree.
+            i2c = root.create_path('/soc/i2c@4000')
+            i2c.set_str('status', 'okay')
+
+        Args:
+            path: Slash-separated node path starting from `self` (e.g.
+                `'/soc/i2c@4000'` or `'soc/i2c@4000'`).
+
+        Returns:
+            The `DeviceTree` instance at `path`.
+        """
+        node = self
+        for part in path.split('/'):
+            if not part:
+                continue
+            if part not in node.children:
+                node.children[part] = type(self)()
+            node = node.children[part]
+        return node
+
+    def walk(self, path=''):
+        """Yield `(path, node)` pairs for this subtree in pre-order.
+
+        Args:
+            path: Path prefix for `self` (defaults to `''` for the root node,
+                producing paths like `''`, `'/soc'`, `'/soc/i2c@4000'`).
+
+        Yields:
+            Tuple of `(path, node)` for `self` followed recursively by each
+            descendant `DeviceTree`.
+        """
+        prefix = path.rstrip('/')
+        yield path, self
+        for name, child in self.children.items():
+            yield from child.walk(f'{prefix}/{name}')
+
+    def get_str(self, name):
+        """Return property `name` decoded as a NUL-terminated UTF-8 string.
+
+        Args:
+            name: Property name to look up in `self.props`.
+
+        Returns:
+            Decoded string value (without the trailing NUL byte).
+
+        Raises:
+            KeyError: If `name` is not in `self.props`.
+            ValueError: If the property value is not a single NUL-terminated
+                UTF-8 string.
+        """
+        return self.props[name].as_str()
+
+    def set_str(self, name, val):
+        """Set property `name` to a NUL-terminated UTF-8 string.
+
+        Args:
+            name: Property name to set in `self.props`.
+            val: String value to encode as UTF-8 with a trailing NUL byte.
+
+        Raises:
+            ValueError: If `val` contains embedded NUL characters.
+        """
+        if '\x00' in val:
+            raise ValueError('String value contains embedded nul characters')
+        self.props[name] = libfdt.Property(name, val.encode('utf-8') + b'\x00')
+
+    def get_stringlist(self, name):
+        """Return property `name` decoded as a list of NUL-separated strings.
+
+        Args:
+            name: Property name to look up in `self.props`.
+
+        Returns:
+            List of decoded UTF-8 strings (`[]` if the property is empty).
+
+        Raises:
+            KeyError: If `name` is not in `self.props`.
+            ValueError: If a non-empty property lacks NUL termination.
+        """
+        return self.props[name].as_stringlist()
+
+    def set_stringlist(self, name, vals):
+        """Set property `name` to a NUL-separated list of UTF-8 strings.
+
+        Args:
+            name: Property name to set in `self.props`.
+            vals: Iterable of strings to encode as NUL-terminated UTF-8.
+
+        Raises:
+            ValueError: If any string in `vals` contains embedded NUL
+                characters.
+        """
+        vals = list(vals)
+        if any('\x00' in v for v in vals):
+            raise ValueError('String value contains embedded nul characters')
+        raw = b''.join(v.encode('utf-8') + b'\x00' for v in vals)
+        self.props[name] = libfdt.Property(name, raw)
+
+    def get_u32(self, name):
+        """Return property `name` decoded as a single big-endian uint32 cell.
+
+        Args:
+            name: Property name to look up in `self.props`.
+
+        Returns:
+            Integer value of the 32-bit cell.
+
+        Raises:
+            KeyError: If `name` is not in `self.props`.
+            ValueError: If the property length is not 4 bytes.
+        """
+        prop = self.props[name]
+        if len(prop) != 4:
+            raise ValueError(f'Property {name!r} length {len(prop)} != 4')
+        return prop.as_uint32()
+
+    def set_u32(self, name, val):
+        """Set property `name` to a single big-endian uint32 cell.
+
+        Args:
+            name: Property name to set in `self.props`.
+            val: Unsigned 32-bit integer value.
+        """
+        self.props[name] = libfdt.Property(name, struct.pack('>I', val))
+
+    def get_u32_list(self, name):
+        """Return property `name` decoded as a list of big-endian uint32 cells.
+
+        Args:
+            name: Property name to look up in `self.props`.
+
+        Returns:
+            List of 32-bit unsigned integers.
+
+        Raises:
+            KeyError: If `name` is not in `self.props`.
+            ValueError: If the property length is not a multiple of 4 bytes.
+        """
+        prop = self.props[name]
+        if len(prop) % 4 != 0:
+            raise ValueError(
+                f'Property {name!r} length {len(prop)} is not a multiple of 4'
+            )
+        return prop.as_uint32_list()
+
+    def set_u32_list(self, name, vals):
+        """Set property `name` to a sequence of big-endian uint32 cells.
+
+        Args:
+            name: Property name to set in `self.props`.
+            vals: Sequence of unsigned 32-bit integer values.
+        """
+        raw = struct.pack(f'>{len(vals)}I', *vals)
+        self.props[name] = libfdt.Property(name, raw)
diff --git a/meson.build b/meson.build
index 520cd35f9075..963d8f59b209 100644
--- a/meson.build
+++ b/meson.build
@@ -125,6 +125,7 @@ endforeach
 
 if pylibfdt_enabled
   subdir('pylibfdt')
+  py.install_sources('devicetree.py')
 endif
 
 if get_option('tests')
diff --git a/tests/meson.build b/tests/meson.build
index c25500606059..8dbfc3f9e8e2 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -119,7 +119,7 @@ if not pylibfdt_enabled
 else
   env += [
     'PYTHON=' + py.full_path(),
-    'PYTHONPATH=' + meson.project_build_root() / 'pylibfdt',
+    'PYTHONPATH=' + meson.project_build_root() / 'pylibfdt' + ':' + meson.project_source_root(),
     'NO_PYTHON=0',
   ]
 endif
diff --git a/tests/pylibfdt_tests.py b/tests/pylibfdt_tests.py
index ae46b29a8f5c..cfdb8f5749b6 100644
--- a/tests/pylibfdt_tests.py
+++ b/tests/pylibfdt_tests.py
@@ -11,6 +11,8 @@ import types
 import unittest
 
 sys.path.insert(0, '../pylibfdt')
+sys.path.insert(0, '..')
+import devicetree
 import libfdt
 from libfdt import Fdt, FdtSw, FdtException, QUIET_NOTFOUND, QUIET_ALL
 
@@ -717,6 +719,81 @@ class PyLibfdtRoTests(unittest.TestCase):
         self.assertEqual(b'this is a placeholder string\0string2\0',
                          self.fdt.getprop(node, 'placeholder'))
 
+    def testDeviceTreeRoundTrip(self):
+        """Test unflattening and flattening a tree via DeviceTree"""
+        tree = copy.deepcopy(devicetree.DeviceTree.unflatten(self.fdt))
+        self.assertIsInstance(tree.props['compatible'], libfdt.Property)
+        rsvmap = self.fdt.get_mem_rsv_list()
+        cpuid = self.fdt.boot_cpuid_phys()
+        fdt2 = tree.flatten(rsvmap, cpuid)
+        self.assertIsInstance(fdt2, libfdt.Fdt)
+        self.assertEqual(rsvmap, fdt2.get_mem_rsv_list())
+        self.assertEqual(cpuid, fdt2.boot_cpuid_phys())
+
+        tree2 = devicetree.DeviceTree.unflatten(fdt2)
+        nodes1 = [(path, n.props, list(n.children.keys()))
+                  for path, n in tree.walk()]
+        nodes2 = [(path, n.props, list(n.children.keys()))
+                  for path, n in tree2.walk()]
+        self.assertEqual(nodes1, nodes2)
+
+    def testDeviceTreeDuplicates(self):
+        """Test that DeviceTree.unflatten() rejects duplicate names"""
+        sw_prop = FdtSw()
+        sw_prop.finish_reservemap()
+        with sw_prop.add_node(''):
+            sw_prop.property_u32('dup', 1)
+            sw_prop.property_u32('dup', 2)
+        with self.assertRaises(ValueError):
+            devicetree.DeviceTree.unflatten(sw_prop.as_fdt())
+
+        sw_node = FdtSw()
+        sw_node.finish_reservemap()
+        with sw_node.add_node(''):
+            with sw_node.add_node('dup'):
+                pass
+            with sw_node.add_node('dup'):
+                pass
+        with self.assertRaises(ValueError):
+            devicetree.DeviceTree.unflatten(sw_node.as_fdt())
+
+    def testDeviceTreeHelpers(self):
+        """Test DeviceTree navigation and typed property helpers"""
+        root = devicetree.DeviceTree()
+        self.assertIs(root, root.get_node(''))
+        self.assertIs(root, root.get_node('/'))
+        self.assertIsNone(root.get_node('/soc/i2c@4000'))
+
+        i2c = root.create_path('/soc/i2c@4000')
+        self.assertIs(i2c, root.get_node('/soc/i2c@4000'))
+        self.assertIs(i2c, root.get_node('soc/i2c@4000'))
+        self.assertEqual(['', '/soc', '/soc/i2c@4000'],
+                         [path for path, _ in root.walk()])
+        self.assertEqual(['/', '/soc', '/soc/i2c@4000'],
+                         [path for path, _ in root.walk('/')])
+
+        i2c.set_str('status', 'okay')
+        self.assertIsInstance(i2c.props['status'], libfdt.Property)
+        self.assertEqual('okay', i2c.get_str('status'))
+        with self.assertRaises(ValueError):
+            i2c.set_str('status', 'ok\x00ay')
+
+        i2c.set_stringlist('compatible', ['vendor,i2c', 'generic,i2c'])
+        self.assertEqual(['vendor,i2c', 'generic,i2c'],
+                         i2c.get_stringlist('compatible'))
+        with self.assertRaises(ValueError):
+            i2c.set_stringlist('compatible', ['vendor\x00,i2c'])
+        i2c.set_stringlist('empty-list', [])
+        self.assertEqual([], i2c.get_stringlist('empty-list'))
+        with self.assertRaises(ValueError):
+            i2c.get_str('empty-list')
+
+        i2c.set_u32('#address-cells', 1)
+        self.assertEqual(1, i2c.get_u32('#address-cells'))
+
+        i2c.set_u32_list('reg', [0x4000, 0x100])
+        self.assertEqual([0x4000, 0x100], i2c.get_u32_list('reg'))
+
 
 if __name__ == "__main__":
     unittest.main()
-- 
2.56.0.317.g454f8302e1-goog

