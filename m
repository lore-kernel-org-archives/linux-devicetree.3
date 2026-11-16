Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794862433;
	b=iD/MxjSQsydC7odch4CGlLJDW8RUPzjs7ZzzjWsGFoO3GtU0cDjEozw6ckvDMJPFKNoe
	 CR/6o/cgWZa3OYPo3mI7c0IEGK9kqsXRHaZDwfDP23uA2w34/0XdmmplzSEQFskR/XdM+
	 dODTawnmFs9d+JeJmr5TDvGblt2+C9IMr4rl4NH0jgjtGbW9ai9SQFcV/Q6iJkj0DfbIc
	 fSsodRPgGhEf2ZGxvaArMn4mYjYYn5P6dATKdsSDz82Lf/avyY2J5zjs+JeLqBcgHzomU
	 3S1q09WYosLTqyqdwTL4TrzvgEXopdhd8qQ8c/6nIuFCg13iGb6JmMxFxmqEhH47zfg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794862433;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=jPlGNQGUllWqmUH4lzVRty7A7FRP7Ti1jD8lLs2t1TU=;
	b=4jWPv+eRsjgZ0JXUR/7q11Bq0FL6ZlPxuD38zJqwKfyqAYUC2B1U2PoXx5aN1I2CsmIn
	 5fWzd8JxkPGigR+u/UPwkzOp/mWgI16D4GxjUVBrVywoFHC5UbsQB4FARzZDIFqfT10Ad
	 FFoGAKc8yKwDcycbolOtHfXxANQ7a9bvM1kjJ7E70VBRyZ6XRpVCOKBdFpKsbaYRjfwEI
	 QvX13e44FK4KXG1Me4vJLQBW3T6ioQs5T84PGSurSTmBNoQ5uFXo3YpWLx86ossqHvJdv
	 ou3ZNUIHZk79qfSQCfFGnCM303nTWM/gb6qywTBryr85F8R54hg/HGpKLRPgcjqov8g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=WJdIBema;
	arc=none smtp.remote-ip=74.125.82.175
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB012606A893
	for <Devicetree@vger.kernel.org>; Mon, 16 Nov 2026 20:53:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CB012606A893
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=WJdIBema
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-38133db970bso209954eec.0
        for <Devicetree@vger.kernel.org>; Mon, 16 Nov 2026 12:53:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1794862432; x=1795467232; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jPlGNQGUllWqmUH4lzVRty7A7FRP7Ti1jD8lLs2t1TU=;
        b=WJdIBema9Fy0VVb2yMJm4K2vvVv1owxU35L0eJP8xf4aP6rtPSqyG9uFfIavMdPzli
         wpiqVTFcecByqRNwNTHoVoPvmW2xsCFgmJpreSvaxrIDlGlmLDSsRNcQdLKFRi+rnJvB
         b2gk2YPIZerYWu0J/quwLqJD0nVi6rREk6HfI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794862432; x=1795467232;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jPlGNQGUllWqmUH4lzVRty7A7FRP7Ti1jD8lLs2t1TU=;
        b=cbYUjCMDW7ehNS8aIeQujW2g0enZ2bguePn7bb4T80eGFlTRXsktxHLRZX8ktXG3ev
         EmEnzkUKGTXhjxs2oITWSvDQPWJnqQPrcBrUOVFQjzQfvJvfoMzinEuPZ0Ji1/DJenRg
         EB9R2r5s/ufVxnsDjpruEBKijYnEuejQBXgPHwEdkrRYq7JHsCPJw9CVGAwyIlXqVWTP
         jIy2yVAZ2d+7VuaL+M98A/bs294J2c334gktyx/BVSf+VrMA/NELeZdG3a+mWKaGf8ju
         n44N6ZBdkhJCiJsP9gq0wh0aQZ51FbgtFAV2b51ydNI1vktGXdhTMSoOEvEm3TBmbgkT
         lTiQ==
X-Gm-Message-State: APuU4Z/ioMkecXjWxkgHORnr04ccVH6iZmMQIDW9aiSBOypJJE85Mp6s
	uGhbnWtHHycoooopCoSuB5d63YTy3MBZKM8cuNxAZO2NFUdOuX0N823gAqa87zQdkw==
X-Gm-Gg: AZFdTZcXJmsBwP0v09YRSNrcdekhJUmj0tYorVaDxDoda3RCPnt/+xw6q8LhD6iCFUJ
	503j5t1kVIFh/AbFdqmu3gfLW7Vohr3O72n45RY6ImxTyPwbJihKCF/CErC05CYDIxds//xSMW0
	MoRiXbusy1MeywAP2cBWLoNter0OWwf9Nq/xLlqnvk1WFmJITQEEOcBbmDSgaIn0cvGbk+8igfB
	mkq8ft+3YA/Sh3+9WDRZDlLI8fScpxC6cODfUz0fwjCybv6u64JNfbkIaKuzEECopZ+z+OoJW/m
	A1zKIIb5EQiYUqav1Hajn7ycU4J/CWO/ywvxIZFlFYUecDVOqjwMxW3gXyFICMmpBL91HEHKEBc
	6DaPWc01TN+ocqUWj9iM4uc2j+qzSGtNz/iZJsJIG3+rZv0SwnMbnJFgf8XHbngZwsLfPtrTpDh
	sunTgI0ku+bhqkftHyQX7Ze4mMIpYYx+wUtabXxXfNMxlEWqaKo84bgOXrTlBewH22yG+B0dwjX
	69TmuJvtrht1awU2AIaXK2DQk3nB/8TgrCvCJCUhbdvl1/dgCZioye3xdFLgIaHu2aCaB2ucQzM
	CSp2byvROpFTwkFmfRJ40PuqfvMC81w+U5ecn3hS7aD5oNnUc0w3UI8jPpGjF89NESoU/2Vki/5
	JF2IBi85OgeBtHQFYRGAg9N2zj908MgTg3Xk=
X-Received: by 2002:a05:693c:2a0a:b0:369:fbc1:89c2 with SMTP id 5a478bee46e88-37965daa77cmr10150232eec.8.1794862431716;
        Mon, 16 Nov 2026 12:53:51 -0800 (PST)
Received: from dianders.sjc.corp.google.com ([2a00:79e0:2e7c:8:40c8:6e27:a2df:3321])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379563e6b6dsm67120390eec.21.2026.11.16.12.53.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 12:53:50 -0800 (PST)
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
Subject: [PATCH v4 06/14] pylibfdt: Speed up FdtRo.properties() with a C helper
Date: Mon, 16 Nov 2026 12:53:03 -0800
Message-ID: <20261116205320.1621386-7-dianders@chromium.org>
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

Iterating over a node's properties via `FdtRo.properties()` currently
crosses the Python/SWIG boundary `1 + 2 * num_props` times per node
(`first_property_offset()`, `get_property_by_offset()`, and
`next_property_offset()`, along with their Python `check_err()` and
`check_err_null()` wrappers). When walking every property across large
device trees from Python, those per-property SWIG round-trips dominate
runtime.

Add a C helper `fdt_node_properties_stub()` in `pylibfdt/libfdt.i`
backing `FdtRo.properties()` so all `Property` objects for a node are
collected in a single C call per node, interning property name strings
via `PyUnicode_InternFromString()`. Also add an invalid-offset exception
check to `testPropertiesIterator` in `tests/pylibfdt_tests.py`.

On one stress test (walking all ~573k nodes and ~2.06M properties across
438 arm64 Qualcomm DTBs) this reduced `FdtRo.properties()` time by
~1.8x.

Assisted-by: Gemini:gemini-pro-prerelease
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---
Found this speedup while benchmarking fdtfactor. It's not critical to
functionality, but seems like a nice win.

Changes in v4:
- New patch speeding up FdtRo.properties() with a C helper

 pylibfdt/libfdt.i       | 64 ++++++++++++++++++++++++++++++++++++++---
 tests/pylibfdt_tests.py |  3 ++
 2 files changed, 63 insertions(+), 4 deletions(-)

diff --git a/pylibfdt/libfdt.i b/pylibfdt/libfdt.i
index e4a9357d278a..333a25f27946 100644
--- a/pylibfdt/libfdt.i
+++ b/pylibfdt/libfdt.i
@@ -24,6 +24,61 @@ static int fdt_property_stub(void *fdt, const char *name, const void *val,
     return fdt_property(fdt, name, val, len);
 }
 
+static PyObject *fdt_node_properties_stub(const void *fdt, int nodeoffset,
+                                          PyObject *prop_cls)
+{
+    PyObject *list = PyList_New(0);
+    int poff;
+
+    if (!list)
+        return NULL;
+
+    poff = fdt_first_property_offset(fdt, nodeoffset);
+    while (poff >= 0) {
+        const char *pname;
+        int len;
+        const void *val = fdt_getprop_by_offset(fdt, poff, &pname, &len);
+        PyObject *name_obj, *val_obj, *prop_obj;
+        int rc;
+
+        if (!val) {
+            Py_DECREF(list);
+            return PyLong_FromLong(len);
+        }
+        name_obj = PyUnicode_InternFromString(pname);
+        if (!name_obj) {
+            Py_DECREF(list);
+            return NULL;
+        }
+        val_obj = PyBytes_FromStringAndSize((const char *)val, len);
+        if (!val_obj) {
+            Py_DECREF(name_obj);
+            Py_DECREF(list);
+            return NULL;
+        }
+        prop_obj = PyObject_CallFunctionObjArgs(prop_cls, name_obj, val_obj,
+                                                NULL);
+        Py_DECREF(name_obj);
+        Py_DECREF(val_obj);
+        if (!prop_obj) {
+            Py_DECREF(list);
+            return NULL;
+        }
+        rc = PyList_Append(list, prop_obj);
+        Py_DECREF(prop_obj);
+        if (rc < 0) {
+            Py_DECREF(list);
+            return NULL;
+        }
+        poff = fdt_next_property_offset(fdt, poff);
+    }
+    if (poff != -FDT_ERR_NOTFOUND) {
+        Py_DECREF(list);
+        return PyLong_FromLong(poff);
+    }
+    return list;
+}
+
 %}
 
 %pythoncode %{
@@ -477,10 +532,9 @@ class FdtRo(object):
         Raises:
             FdtException on error (e.g. invalid nodeoffset)
         """
-        poff = self.first_property_offset(nodeoffset, quiet=QUIET_NOTFOUND)
-        while poff >= 0:
-            yield self.get_property_by_offset(poff)
-            poff = self.next_property_offset(poff, quiet=QUIET_NOTFOUND)
+        return iter(check_err(
+            fdt_node_properties_stub(self._fdt, nodeoffset, Property)
+        ))
 
     def getprop(self, nodeoffset, prop_name, quiet=()):
         """Get a property from a node
@@ -1420,5 +1474,7 @@ int fdt_property_cell(void *fdt, const char *name, uint32_t val);
   * function and a struct, which confuses SWIG.
  */
 int fdt_property_stub(void *fdt, const char *name, const void *val, int len);
+PyObject *fdt_node_properties_stub(const void *fdt, int nodeoffset,
+                                   PyObject *prop_cls);
 
 %include <libfdt.h>
diff --git a/tests/pylibfdt_tests.py b/tests/pylibfdt_tests.py
index e2f9c6d5afe4..9c0104bfbabb 100644
--- a/tests/pylibfdt_tests.py
+++ b/tests/pylibfdt_tests.py
@@ -270,6 +270,9 @@ class PyLibfdtBasicTests(unittest.TestCase):
         self.assertEqual(props[0], b'subnode1\0')
         leaf = self.fdt.path_offset('/subnode@1/ss1')
         self.assertEqual(list(self.fdt.properties(leaf)), [])
+        with self.assertRaises(FdtException) as e:
+            list(self.fdt.properties(-1))
+        self.assertEqual(e.exception.err, -libfdt.BADOFFSET)
 
     def testFirstNextSubnodeOffsetExceptions(self):
         """Check except handling for first/next subnode functions"""
-- 
2.56.0.679.gc527c65306-goog

