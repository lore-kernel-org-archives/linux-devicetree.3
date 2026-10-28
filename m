Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793224593;
	b=DOO3FL6sMAnHxZE12Ayk4F23NF1bBsuRZYFC2ocsNw7nQmjZfW+3BctfGSx4tYqqC2b5
	 jUgcqz9GpiABI/2Pd6x6oCCYLMOoLJ6dt5bbAj+Om3lhDETTqAx/8fahlc1GPchws76kT
	 1fQQo+FMYOVZvVM6YKrrj6EZx+F+0zUkjluGl32JR57YoO31nfIjN6jthtl5EsV9ikeMv
	 JnN4b8yuP2K8X7aBFudfDzgJ2PFaHEBgLszE6ipsM5JLHQXT9bpIqjeYu2Ceg/ov23rQs
	 c4TOhlF1WBiQ8xhrk1+M9sWpyGrkLJS/X2ZoZYsW+6KyDF55Pqjank6uvy9w6Ee3YQw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793224593;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=vtPt26i4DTob8A1zC8fxRf/fIw3oTXwSxSeO/xR9m7A=;
	b=m5Ido1oB4GCILysRIp7GN3GSd3NbaLrTtFtYltRabcTXM6e099sIf+tByyS1ouoGBwzP
	 4xVkL/KZ8pj39BlWbcpMU7CsVhws5A/miOnyeEsLKNU7oV0rPC5QzcHvfhbL5BqZrFMFO
	 MHMY+/3H1jJ15DcoQz6eWhr4TyAXR2BvcYLZmIAt2NyZ1JsKKYkwryDheddx3GLd0c4HV
	 l3kDzyMv1hH2VpNFMMAC0gCc/od+Aeq3ahID8Hes4r48Bm+kRux7uGWoZQ8Fup4E5mj7X
	 egwSYp8fyOpTpgT/W10Vv4AboINhJKDj0fJFd6mqXnWtoNInEGbYwU37CGyrZ6BQclg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=Xp7CFEYr;
	arc=none smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3F1860A2618
	for <Devicetree@vger.kernel.org>; Wed, 28 Oct 2026 21:56:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E3F1860A2618
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=Xp7CFEYr
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-36661f953e4so2372040eec.1
        for <Devicetree@vger.kernel.org>; Wed, 28 Oct 2026 14:56:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793224592; x=1793829392; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vtPt26i4DTob8A1zC8fxRf/fIw3oTXwSxSeO/xR9m7A=;
        b=Xp7CFEYry8zuhbzaG+VuLUZQwM+bu+2OS4a950fHkY59ltQUcCT6yF2qkUrNASG+od
         3HqylUdsKt9v8ocpODaaMm9a0j78iu2LZxOd8ZsYg894XLuALJMF7fsDtE5ffm43t2ZH
         Mme4DtNqEjgoKmHGnmenomB2ATSEmqTbDmoYQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793224592; x=1793829392;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vtPt26i4DTob8A1zC8fxRf/fIw3oTXwSxSeO/xR9m7A=;
        b=NWgxLSI07KnlHrr0ee2K4g3M8PmFm4Pc6d6QO5Kd1HDjCQtA81UCCKXnZnLINDaUnj
         4CzwedOKdQRWGW+/APnJkBNlzc5ILQnRm9ODMwG6IgU4Qxs7xROkHVL25Zx9Bk08A+dn
         azFFQGx7nQn+hphZyF29PiZAaQjKy8jFBE1Ahb5QaLgKMe5kvT6rnKX435MkhfNSwPCd
         IHOF4L5R1S77oNqUHafdK8lTqiGi4G4bCL0IALcjevBgX0RA2VDzktS3xDsnbEhWYZ6o
         dlOfGfPaAY4Az7ND5vBNZJivpgkDpBkfSyaMziY0ndMpqEM+g5f3iG3+zdAaQiRVYK+h
         SRzw==
X-Forwarded-Encrypted: i=1; AKwUvBxc4ndjcd40Nr7bFQ09m1bwjTgyfUOTAEy+5vvu/RRWq3nqB7B6mPjC3UbT0Zs19am0BD0rIglbHZyQ@vger.kernel.org
X-Gm-Message-State: AFq9FYJz492o2U5R/yeXAw+J3WKxNjj7XL7Tw+Z1Ca0aA3c4DY29gjy0
	nh8esiSiADOIKgMY5xRh8NhppTEyGZwhae0myLJ3ngGus3kY4mzU5EOepXiOP/TJsw==
X-Gm-Gg: AYBFou0FX9Hpzy1DlOKdhM4AtkhLaZX1TcynxDCfH1IWPXNhZO40eASQKGhYhsh/wlE
	JpyahmF8tElJqD9BKQW18nO4DdRb03g2q8MVlV5rDFBPX13MKhR/KgImQ/dnySPlfQg3Jwo6ISO
	h7LAUCtLJCcnNL0crUTke6x85v3U6G2nNvH/G+5lm6hmLsPNuxr4jZzILvLowRxJiA9s2IZExoX
	JbCB7GPalCh4inD1VlkxEthpHWOcRKMkDk4fHSFzOYGQHNYjmP6n2q+5a3Wk2mzj3n+I/3ZBzKp
	qozGH2zBPnWKC3XXbONjsRqJANwsbRYlnRp4b5pZFZ8wKYLXAbge9fnGyVAiG9L4GpMr2PDWuu4
	Ht03WY90ZPhidb9NkZ5AqIdG556n7i2LL1am/ss3n9KaK3xP7P35fkXa1XMbolQtYdGcICdXAdK
	UbjfVABUGBjqdVrF1wUpCF70XEN6GjfSTPdu95VjZCpHZMkn2PBZYOI8G2M20sIhrt8VNh8KpuM
	fxl0cTsKiOQ6N6/LH23/RY96vlGRGVfJDR+mez4WpnIJyDdaX5EpA1KYr0GVTzim/4VGnC8tYK9
	6xyopjj+nGNGm5aSESWd71aFMujJUHECC0ZmTkm+M8MLoAQf/Z0fecHgMhs2y43UEAs6aEBz0wr
	Jhd1a3a4LTzOL
X-Received: by 2002:a05:7301:1925:b0:351:68e8:4646 with SMTP id 5a478bee46e88-36a20469b48mr6733231eec.37.1793224591770;
        Wed, 28 Oct 2026 14:56:31 -0700 (PDT)
Received: from dianders.sjc.corp.google.com ([2a00:79e0:2e7c:8:19e7:c87:2527:4e12])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a2393cc86sm8845224eec.19.2026.10.28.14.56.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 14:56:30 -0700 (PDT)
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
Subject: [PATCH v2 02/10] pylibfdt: Add subnode/property iterators and get_mem_rsv_list()
Date: Wed, 28 Oct 2026 14:46:51 -0700
Message-ID: <20261028215600.1713475-3-dianders@chromium.org>
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

Add Pythonic iterator helpers on `FdtRo` to simplify walking nodes,
properties, and memory reservation entries without manual offset loops
or `-FDT_ERR_NOTFOUND` sentinel handling:

- `subnodes(nodeoffset)`: yields the offset of each direct child subnode
  of `nodeoffset`.
- `properties(nodeoffset)`: yields a `Property` object for each property
  of `nodeoffset`.
- `get_mem_rsv_list()`: returns a list of `(address, size)` tuples for
  all entries in the memory reservation block.

Assisted-by: Gemini:gemini-pro-prerelease
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

Changes in v2:
- New patch adding FdtRo.subnodes(), FdtRo.properties(), and
  FdtRo.get_mem_rsv_list()

 pylibfdt/libfdt.i       | 45 +++++++++++++++++++++++++++++++++++++++++
 tests/pylibfdt_tests.py | 18 +++++++++++++++++
 2 files changed, 63 insertions(+)

diff --git a/pylibfdt/libfdt.i b/pylibfdt/libfdt.i
index 46f28f67290d..0db7110b4a38 100644
--- a/pylibfdt/libfdt.i
+++ b/pylibfdt/libfdt.i
@@ -201,6 +201,23 @@ class FdtRo(object):
         """
         return check_err(fdt_next_subnode(self._fdt, nodeoffset), quiet)
 
+    def subnodes(self, nodeoffset):
+        """Iterate over the subnodes of a node
+
+        Args:
+            nodeoffset: Offset of parent node to check
+
+        Yields:
+            Node offset of each direct subnode in order
+
+        Raises:
+            FdtException on error (e.g. invalid nodeoffset)
+        """
+        soff = self.first_subnode(nodeoffset, quiet=QUIET_NOTFOUND)
+        while soff >= 0:
+            yield soff
+            soff = self.next_subnode(soff, quiet=QUIET_NOTFOUND)
+
     def magic(self):
         """Return the magic word from the header
 
@@ -302,6 +319,17 @@ class FdtRo(object):
         check_err(val[0], quiet)
         return val[1:]
 
+    def get_mem_rsv_list(self):
+        """Return a list of all memory reserve-map records
+
+        Returns:
+            List of (address, size) tuples for each memory reserve-map record
+        """
+        return [
+            tuple(self.get_mem_rsv(i))
+            for i in range(self.num_mem_rsv())
+        ]
+
     def address_cells(self, nodeoffset, quiet=()):
         """Return the number of address cells used by a node's children
 
@@ -434,6 +462,23 @@ class FdtRo(object):
             return pdata[1]
         return Property(pdata[0], pdata[1])
 
+    def properties(self, nodeoffset):
+        """Iterate over the properties of a node
+
+        Args:
+            nodeoffset: Offset of node to check
+
+        Yields:
+            Property object for each property on @nodeoffset in order
+
+        Raises:
+            FdtException on error (e.g. invalid nodeoffset)
+        """
+        poff = self.first_property_offset(nodeoffset, quiet=QUIET_NOTFOUND)
+        while poff >= 0:
+            yield self.get_property_by_offset(poff)
+            poff = self.next_property_offset(poff, quiet=QUIET_NOTFOUND)
+
     def getprop(self, nodeoffset, prop_name, quiet=()):
         """Get a property from a node
 
diff --git a/tests/pylibfdt_tests.py b/tests/pylibfdt_tests.py
index 1b65961491bf..2a0509c7802e 100644
--- a/tests/pylibfdt_tests.py
+++ b/tests/pylibfdt_tests.py
@@ -243,6 +243,22 @@ class PyLibfdtBasicTests(unittest.TestCase):
             node_list.append(self.fdt.get_name(node))
             node = self.fdt.next_subnode(node, QUIET_NOTFOUND)
         self.assertEqual(node_list, ['subnode@1', 'subnode@2'])
+        self.assertEqual(
+            [self.fdt.get_name(n) for n in self.fdt.subnodes(0)],
+            ['subnode@1', 'subnode@2'],
+        )
+        leaf = self.fdt.path_offset('/subnode@1/ss1')
+        self.assertEqual(list(self.fdt.subnodes(leaf)), [])
+
+    def testPropertiesIterator(self):
+        """Check that we can iterate through properties of a node"""
+        node = self.fdt.path_offset('/subnode@1')
+        props = list(self.fdt.properties(node))
+        self.assertEqual([p.name for p in props],
+                         ['compatible', 'reg', 'prop-int'])
+        self.assertEqual(props[0], b'subnode1\0')
+        leaf = self.fdt.path_offset('/subnode@1/ss1')
+        self.assertEqual(list(self.fdt.properties(leaf)), [])
 
     def testFirstNextSubnodeOffsetExceptions(self):
         """Check except handling for first/next subnode functions"""
@@ -410,6 +426,8 @@ class PyLibfdtBasicTests(unittest.TestCase):
         self.assertEqual([ 0xdeadbeef00000000, 0x100000],
                           self.fdt.get_mem_rsv(0))
         self.assertEqual([123456789, 0o10000], self.fdt.get_mem_rsv(1))
+        self.assertEqual([(0xdeadbeef00000000, 0x100000), (123456789, 0o10000)],
+                         self.fdt.get_mem_rsv_list())
 
     def testAddDelReserveMap(self):
         """Test that we can add to and remove from the memory reserve map"""
-- 
2.56.0.313.g2479322e68-goog

