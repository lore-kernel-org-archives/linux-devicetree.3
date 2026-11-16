Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794862426;
	b=cG1E7zfiXXkeNgmmtva2KtTUoqMYIpRRoTi8xVLUHPIsn49UJn4ptFpd62vwh70CE0wO
	 Zg9ZgTZyQHij5vhEyvc65au9QsJ97Zgn0vDzJgD40JD9J6ZuFzhDOzL0+LUSoSQC80DYd
	 0wlSZvILm/GL/uzUusjWX8kHBP7ciILJaGgWXyRF+kUTsKv7samhBmhyYoJb31tkZExqF
	 8G8yuzK2+N1Shc1AW4NJ/akS2CPvIsFMbCSKCXTUA57bls3Xgah8/7SbXJxZ45iwoiD4Q
	 A+Xfxa7HWyaLSBJm0/yL0W+2cdGNjxREZpeDG2sxhB5cNTRaCqHDzsjdXavjQpCpoCg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794862426;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=zKhcQqCObW2np3+GZxG/Vi/lnV5TvzNl3cN+yw2JRFw=;
	b=PRe+eJCmY/K1W0e1ZAgOnO1swYPagRkPRkfra4DE3LiA3qLsYHGaVxy8cEqqll0bkmpm
	 vI8r741OCYMK5Yt40UqSWvo0+QqUvlbzUxG7USgCwSXE1dtDveWSpZzJMABAfboXkacjR
	 QZdXu8Ka7/wwng5ONbaQEVMexs09fOUz9gUj3e/Bbn4gbEH9ZMKVbxcPyM4VFFrRgihIw
	 j1FapgmrlAPuK1CrEhi38FLiHgJ22K1qDuXr1K4EJPCqOoFX97LQ5ltbAt0tf+LZOaM06
	 Gz57q5W90MIYihW16fkicFc2QeCgtmUf6aROr9WKoXuWvljzO4U8gjdZux0ElEcejMw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=Wy3lwnyD;
	arc=none smtp.remote-ip=74.125.82.180
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D4FF606A338
	for <Devicetree@vger.kernel.org>; Mon, 16 Nov 2026 20:53:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9D4FF606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=Wy3lwnyD
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-33fb4680717so10193869eec.1
        for <Devicetree@vger.kernel.org>; Mon, 16 Nov 2026 12:53:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1794862425; x=1795467225; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zKhcQqCObW2np3+GZxG/Vi/lnV5TvzNl3cN+yw2JRFw=;
        b=Wy3lwnyDZ6zg6JvnqVw+Q/KYJREuy2Q3beiqnUTSYCrndQpeCc8rH221h4OKOy2ROo
         Pdg2opaFsrwFCCzWU6FuOLum2O/Pjbn8L5vFnhCK8eMS87eJlGHP47DcwyPy1EMJa77/
         9TXaubiHuLlXfwDME7+tGH2EVSAU5IQ/NowgA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794862425; x=1795467225;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zKhcQqCObW2np3+GZxG/Vi/lnV5TvzNl3cN+yw2JRFw=;
        b=1c9+Wi3uEiWhmujyYSjpzLTowzPql32Bkpqy8cTJnlo7BUV5/r2TNfLK0zUxuJdTyK
         9g/FmLRcG1cjSf7/2aonNhlIg4XsLnul+m2/SpxVQDeupdQcxBLltkiPTGu1s2b4/+9c
         78cmTo16+/MzvF/zJ7KhVqSzd/VpocbswZJCDOjGDtjhZTIW4xlrbwBYgGfgpodRdhvt
         k+DeWopo+LrRyI01A/VHdCE7P+RAZ1CGJbOCfMlEk+I5LZWXpGGM1+w+FSImB+hTHv/1
         SiwnuO+0FXdJufdd5Vt4HSltdvO3gnCtlX9Dn88Hq9inFJ+N0LKIXkmQ6fe1ScLhk8Sd
         Ue9g==
X-Gm-Message-State: APuU4Z/DsVHubbcrQmXJ2CJq5B13jdSu7vBDbbwcprXWKLz4BZkNPyBa
	2zAxiH39F2ZmizW/7QCK9F2/YxYaAxpF9fiTwXRF7IkBNrnvmcfvNGkjF84GGft32A==
X-Gm-Gg: AZFdTZc2dGEBRmvgVOHYo1p+lnfkfvkOvZzYgpYlJeagVK2lA6cyE0RxGFzJxCqMYHq
	GEjVU4ll+wIdlcAhm7/LZT7Ad7N1IhWrVMx419MAPWONoJS6P7SeITKJGtEczKvoAEK505ee0nw
	6E0tDfzy0MocqYySdy3XLcYSSc02LSmA0iR9x3Y3/JJGDFjmzRJ35/VWmNxLIj4BH99x7SBpTjx
	V5sTbzQtJAzMfV1PSo6THSJpPIy/i9hBe4jmTp3WQEKGzGVzCjong2/40MdqXJZbBTjXbnnA7e5
	JCaW8XvesLmR/ggpkwuJwL5CYqiFstDW8s/iR6dkFbkwqlMGAMDQD2W0kxrxnXy3BVS/qnupj/Z
	zzbzuOVAq2V8P4nk9E3xAAbtat22GjtZRLDqeLDLqifotKsQD7nh8BYDoaFNFrHPiVPU2ospV38
	63kfcoVPwqefJMTlPQf4uh9rbh1l4oK0cMLG4zUpcIEb1m7ZhwMuumpd/ZRlTFRiybUiZ/SlmPM
	9XNL7Qygm/xJOF2mTGmrSL+f8M1TxYKPcWVGh7CT0hAAM6HRoHxudbT08jhde7vyn2SOR6F8bjg
	RhrXRl5xW7lugPKnGl8WVoRKXec0JpF2ocMhDNvwSyeC6j++yWvq2jRYQaI3aqtELT6GpMQccOH
	WhRClJc0JLGZpQQ==
X-Received: by 2002:a05:7301:a4:b0:378:b1be:2d3e with SMTP id 5a478bee46e88-37967ae558emr12079365eec.32.1794862424700;
        Mon, 16 Nov 2026 12:53:44 -0800 (PST)
Received: from dianders.sjc.corp.google.com ([2a00:79e0:2e7c:8:40c8:6e27:a2df:3321])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379563e6b6dsm67120390eec.21.2026.11.16.12.53.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 12:53:42 -0800 (PST)
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
Subject: [PATCH v4 04/14] pylibfdt: Add Property.from_*() creation methods
Date: Mon, 16 Nov 2026 12:53:01 -0800
Message-ID: <20261116205320.1621386-5-dianders@chromium.org>
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
Content-Transfer-Encoding: 8bit

`libfdt.Property` provides `as_*()` methods (`as_cell`, `as_uint32`,
`as_int32`, `as_uint64`, `as_int64`, `as_list`, `as_uint32_list`,
`as_int32_list`, `as_uint64_list`, `as_int64_list`, `as_str`, and
`as_stringlist`) to decode typed values from a `Property`, but lacks the
corresponding creation methods to construct a `Property` from typed
values.

Add `from_*()` classmethods mirroring each `as_*()` method so callers
(such as `DeviceTree` users) can construct typed `Property` instances
directly without duplicating encoding helpers on `DeviceTree`.

Assisted-by: Gemini:gemini-pro-prerelease
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

Changes in v4:
- New patch adding Property.from_*() creation classmethods so
  DeviceTree does not need its own get_*/set_* wrapper methods (David
  Gibson)

 pylibfdt/libfdt.i       | 56 +++++++++++++++++++++++++++++++++++++++++
 tests/pylibfdt_tests.py | 49 ++++++++++++++++++++++++++++++++++++
 2 files changed, 105 insertions(+)

diff --git a/pylibfdt/libfdt.i b/pylibfdt/libfdt.i
index 68f22e316ece..ff9210d123cb 100644
--- a/pylibfdt/libfdt.i
+++ b/pylibfdt/libfdt.i
@@ -962,6 +962,62 @@ class Property(bytes):
         parts = self[:-1].split(b'\x00')
         return list(map(lambda x: x.decode('utf-8'), parts))
 
+    @classmethod
+    def from_cell(cls, name, fmt, val):
+        return cls(name, struct.pack('>' + fmt, val))
+
+    @classmethod
+    def from_uint32(cls, name, val):
+        return cls.from_cell(name, 'L', val)
+
+    @classmethod
+    def from_int32(cls, name, val):
+        return cls.from_cell(name, 'l', val)
+
+    @classmethod
+    def from_uint64(cls, name, val):
+        return cls.from_cell(name, 'Q', val)
+
+    @classmethod
+    def from_int64(cls, name, val):
+        return cls.from_cell(name, 'q', val)
+
+    @classmethod
+    def from_list(cls, name, fmt, vals):
+        vals = list(vals)
+        return cls(name, struct.pack(f'>{len(vals)}{fmt}', *vals))
+
+    @classmethod
+    def from_uint32_list(cls, name, vals):
+        return cls.from_list(name, 'L', vals)
+
+    @classmethod
+    def from_int32_list(cls, name, vals):
+        return cls.from_list(name, 'l', vals)
+
+    @classmethod
+    def from_uint64_list(cls, name, vals):
+        return cls.from_list(name, 'Q', vals)
+
+    @classmethod
+    def from_int64_list(cls, name, vals):
+        return cls.from_list(name, 'q', vals)
+
+    @classmethod
+    def from_str(cls, name, val):
+        """Unicode is supported by encoding to UTF-8"""
+        if '\x00' in val:
+            raise ValueError('String value contains embedded nul characters')
+        return cls(name, val.encode('utf-8') + b'\x00')
+
+    @classmethod
+    def from_stringlist(cls, name, vals):
+        """Unicode is supported by encoding to UTF-8"""
+        vals = list(vals)
+        if any('\x00' in v for v in vals):
+            raise ValueError('String value contains embedded nul characters')
+        return cls(name, b''.join(v.encode('utf-8') + b'\x00' for v in vals))
+
 
 class FdtSw(FdtRo):
     """Software interface to create a device tree from scratch
diff --git a/tests/pylibfdt_tests.py b/tests/pylibfdt_tests.py
index 26915a015ccb..e2f9c6d5afe4 100644
--- a/tests/pylibfdt_tests.py
+++ b/tests/pylibfdt_tests.py
@@ -414,6 +414,16 @@ class PyLibfdtBasicTests(unittest.TestCase):
         self.assertEqual(9223372036854775807,
                           self.get_prop("prop-uint64").as_uint64())
         self.assertEqual(-2, self.get_prop("prop-int64").as_int64())
+        self.assertEqual(self.get_prop("prop-hex32"),
+                          libfdt.Property.from_uint32("prop-hex32", 0xdeadbeef))
+        self.assertEqual(self.get_prop("prop-int32"),
+                          libfdt.Property.from_int32("prop-int32", -2))
+        self.assertEqual(
+            self.get_prop("prop-uint64"),
+            libfdt.Property.from_uint64("prop-uint64", 9223372036854775807),
+        )
+        self.assertEqual(self.get_prop("prop-int64"),
+                          libfdt.Property.from_int64("prop-int64", -2))
 
     def testGetIntListProperties(self):
         """Test that we can access properties as integer lists"""
@@ -425,6 +435,28 @@ class PyLibfdtBasicTests(unittest.TestCase):
                          self.get_prop("prop-int64-array").as_int64_list())
         self.assertEqual([0x100000000, 0x1],
                          self.get_prop("prop-uint64-array").as_uint64_list())
+        self.assertEqual(
+            self.get_prop("prop-int32-array"),
+            libfdt.Property.from_int32_list("prop-int32-array", [128, -16, -2]),
+        )
+        self.assertEqual(
+            self.get_prop("prop-uint32-array"),
+            libfdt.Property.from_uint32_list(
+                "prop-uint32-array", [0x1, 0x98765432, 0xdeadbeef]
+            ),
+        )
+        self.assertEqual(
+            self.get_prop("prop-int64-array"),
+            libfdt.Property.from_int64_list(
+                "prop-int64-array", [0x100000000, -2]
+            ),
+        )
+        self.assertEqual(
+            self.get_prop("prop-uint64-array"),
+            libfdt.Property.from_uint64_list(
+                "prop-uint64-array", [0x100000000, 0x1]
+            ),
+        )
 
     def testGetStringlistProperties(self):
         """Test that we can access properties as string list"""
@@ -434,6 +466,17 @@ class PyLibfdtBasicTests(unittest.TestCase):
         self.assertEqual(["this is a placeholder string", "string2"],
                          self.fdt.getprop(node, "placeholder").as_stringlist())
         self.assertEqual([], libfdt.Property('empty', b'').as_stringlist())
+        self.assertEqual(
+            self.fdt.getprop(node, "compatible"),
+            libfdt.Property.from_stringlist(
+                "compatible", ["subsubnode1", "subsubnode"]
+            ),
+        )
+        self.assertEqual(
+            b'', libfdt.Property.from_stringlist("empty", [])
+        )
+        with self.assertRaises(ValueError):
+            libfdt.Property.from_stringlist("bad", ["embedded\x00nul"])
         with self.assertRaises(ValueError) as e:
             libfdt.Property('bad', b'no-nul').as_stringlist()
         self.assertIn('lacks nul termination', str(e.exception))
@@ -552,6 +595,12 @@ class PyLibfdtBasicTests(unittest.TestCase):
         self.fdt.setprop_str(node, prop, TEST_STRING_3)
         self.assertEqual(TEST_STRING_3,
                           self.fdt.getprop(node, prop).as_str())
+        self.assertEqual(
+            self.fdt.getprop(node, prop),
+            libfdt.Property.from_str(prop, TEST_STRING_3),
+        )
+        with self.assertRaises(ValueError):
+            libfdt.Property.from_str(prop, 'embedded\x00nul')
 
     def testHasProp(self):
         """Test that we can check if a node has a property"""
-- 
2.56.0.679.gc527c65306-goog

