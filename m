Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794862418;
	b=avTs7EoLBaplL3lTHb3PnoJV0RbJSEWtuV8JrG2AmVD67AjXxBOCTVzCLcrgJKexU9Yg
	 4JwHT0sRWWXp1Q39XL5Ee8U3CmnHI+/W54847h4Oozdg1S7SqEIwNdHle9ZOOjIDe/wyU
	 UFOu9P1AWBF5L7ibwguQ4WgtyARK7lZB4VhWwBhWy6WYSZvk0ss9KH756tY9EcFt95MrR
	 l7MqX+d2aODoTSPCdVjOuwp/7bn8xjghN5g4dVCiR+tWZw9FdJ2+ka1Ly1Kipx8kITaxB
	 uzNrbozVEE9zA+552yT7twvtEVkJDk78NHA8oKQh1GtQcdSVmqMBVj6/NmxgJqbVuRg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794862418;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=JBnzKQZzBT4WyH0+pQkXtO3eXK3ZrINhKYQbrALuTEY=;
	b=gdSmNBb9PExW0YH7eMLqaePcvhczKmjsGvX0SGPYVE9/0GtiWcvWKbHppLCpGLIbio9d
	 NYnjkfRw+79k5qo9P2SUBG1/L/CwZTuwnja1syQbzB0+MMChCbQPE22tlOwxZYwzlOe1f
	 S6NUKq8hMtQeM0esVLhKg9OcktMe9T1/j4wtfnwpncHQPzWh5wDrfhn8WQI9lDZghIG4C
	 EX+j6SnAErBNNwdWUbl837g1azWSeTaHIUhp5vhC20Vblbq8jhhx12kPULZwQ0kZ+C0yq
	 gCJpmSFcwILv5zeRneNkBKdFCsUKMZDuezzoM4hcqBIEqgXkU4tEDpD64tOtcCFB2ew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=deEhDzMw;
	arc=none smtp.remote-ip=74.125.82.176
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A04B6606A88B
	for <Devicetree@vger.kernel.org>; Mon, 16 Nov 2026 20:53:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A04B6606A88B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=deEhDzMw
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-33fb4680717so10193650eec.1
        for <Devicetree@vger.kernel.org>; Mon, 16 Nov 2026 12:53:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1794862417; x=1795467217; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JBnzKQZzBT4WyH0+pQkXtO3eXK3ZrINhKYQbrALuTEY=;
        b=deEhDzMw8mkqzMDHotoO7tdUq4HM4qpNrY2H/iDB8iqRi99H7InpKzckbLq1QOHbkP
         ajOxMhcqfpvUAvx8qCi1/1oJ1A9WODrejNe6gQQhmK4i41WLluJXigQR6D9FrPB0G+X2
         eHYEgosAh/dTUUDqhqCu8ae6b7e5hlJf/kr8Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794862417; x=1795467217;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JBnzKQZzBT4WyH0+pQkXtO3eXK3ZrINhKYQbrALuTEY=;
        b=ibLOIUU0E9AFzI14DkcbSl4Ry6bQwQ+HASFv/x8Iiptg7u4RLnw8wnB/TFMh25OLVt
         I0sJ+gvbne34Gl0mjuXzvWOPacNjm/6y4CBBge0mU6nXYk+rD2e0fyCi1HMlFXaG68qw
         Bz5UIlKJo+CgN//YW/Ylf3KQhX0zg/B22591gVMBNT7k9/1F6PE5XtQfRFDAGydAwNv4
         1QDekZnnTSRC3T9I81x9GkMBvayOT5/c8BqCI20MfJjL9N2xbyIqHtJ/dkqpe1lq4qac
         LIDdjcpL75VQjpF3apCadmeX1rBmf3Y2oRxxSGiR32hEdmSkZt8bj5gwGQTe1kISNU7g
         9r8g==
X-Gm-Message-State: APuU4Z+Mkxb+loAXJlUNnex3JLCBTc21uf/Wo1gYqmaPFcB8fcvTu/HW
	HojpCpQLx/jELcuCgKqzhw6rnllIWKeR/WrKZ7WopQkgdDZKwKMeiGlha8GeszQpvg==
X-Gm-Gg: AZFdTZeS4K3wzLlcp+6fWjEzxe3C/K87n3A9PKgtiqgGqokqoSDof8bifILIfsIqfan
	Qd3Kq9p39OIjUmstq5aVygzz0Uv8GBkpXxMpHThMQuSs4K7IKlALwGZpNl3u1EMsOGmenZswAaW
	Ho6wqImBpX1ZG0sho7OisjSy7+eHDFmQ+Gh97W4s0JfaVNZiftyLxF8b9EjQ4wJ5CfE1oN/p1Xy
	vMNS2n1LJOTATCbO3mpbTbbdUWrCPb7sqjU5Jmyi96W0GFhFlwWlIHEPd8dBQsO23uV9QEYs28v
	OYwAgNsaucSVkW8tTCU/ZRaPOLVckx0ZMrOHZyx+1t6qt7317TqqpaKHZ4jP92fQPmorsmaJxjW
	7gyDTsfjzfSr83IfIocFvrhccmIsmmcGqPYn9vGvFpqiWWimA1MQ/qi3aCRWE+c32qL48JjNP7a
	M5yZ0iKB0QCeff+zBhyNpbNZm6QO/TtjJb5AMryVG2naTyioWLhYauVYXGdfoa2aZHMQTHU4D3M
	I1FvgtYm5ejuqVMocLs0sY7JbXAL9cLxgHnr5BiZ15qnGwhtCL0Qzff6mJXqu7PtcaVh+mfgu5z
	7uY0zuYpJcNchTS0OG/A1uoTL+DFWOedZ/q8MewX3GDKbThNOvQjU/EWlgf9cqL3Syzg4NvCSV6
	v7Oscp8wkXHK+0g==
X-Received: by 2002:a05:7301:a4:b0:378:b1be:2d3e with SMTP id 5a478bee46e88-37967ae558emr12079086eec.32.1794862416514;
        Mon, 16 Nov 2026 12:53:36 -0800 (PST)
Received: from dianders.sjc.corp.google.com ([2a00:79e0:2e7c:8:40c8:6e27:a2df:3321])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379563e6b6dsm67120390eec.21.2026.11.16.12.53.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 12:53:35 -0800 (PST)
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
Subject: [PATCH v4 02/14] pylibfdt: Make Property a subclass of bytes instead of bytearray
Date: Mon, 16 Nov 2026 12:52:59 -0800
Message-ID: <20261116205320.1621386-3-dianders@chromium.org>
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

`Property` represents a snapshot of a property's name and value read
from a flattened device tree. Making `Property` a subclass of the
immutable `bytes` type instead of mutable `bytearray` prevents callers
from accidentally mutating a `Property` instance in place when sharing
it across data structures (such as `DeviceTree`), makes `Property`
hashable, and allows `Property` instances to be passed directly to
`Fdt.setprop()` without converting to `bytes` first.

Also return `bytes` instead of `bytearray` from the
`fdt_get_property_by_offset()` SWIG typemap and drop the redundant
`bytearray()` conversion in `FdtRo.getprop()`.

Assisted-by: Gemini:gemini-pro-prerelease
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

Changes in v4:
- New patch making Property a subclass of bytes instead of bytearray
  (David Gibson)

 pylibfdt/libfdt.i       | 17 +++++++++--------
 tests/pylibfdt_tests.py |  1 +
 2 files changed, 10 insertions(+), 8 deletions(-)

diff --git a/pylibfdt/libfdt.i b/pylibfdt/libfdt.i
index fa5f499ed96d..8a7dfed85f15 100644
--- a/pylibfdt/libfdt.i
+++ b/pylibfdt/libfdt.i
@@ -492,7 +492,7 @@ class FdtRo(object):
 
         Returns:
             Value of property as a Property object (which can be used as a
-               bytearray/string), or -ve error number. On failure, returns an
+               bytes/string), or -ve error number. On failure, returns an
                integer error
 
         Raises:
@@ -502,7 +502,7 @@ class FdtRo(object):
                                quiet)
         if pdata[0] is None:
             return pdata[1]
-        return Property(prop_name, bytearray(pdata[0]))
+        return Property(prop_name, pdata[0])
 
     def hasprop(self, nodeoffset, prop_name, quiet=()):
         """Check if a node has a property
@@ -893,7 +893,7 @@ class Fdt(FdtRo):
         return check_err(fdt_del_node(self._fdt, nodeoffset), quiet)
 
 
-class Property(bytearray):
+class Property(bytes):
     """Holds a device tree property name and value.
 
     This holds a copy of a property taken from the device tree. It does not
@@ -902,11 +902,12 @@ class Property(bytearray):
 
     Properties:
         name: Property name
-        value: Property value as a bytearray
+        value: Property value as bytes
     """
-    def __init__(self, name, value):
-        bytearray.__init__(self, value)
-        self.name = name
+    def __new__(cls, name, value):
+        obj = super().__new__(cls, value)
+        obj.name = name
+        return obj
 
     def __copy__(self):
         return type(self)(self.name, self)
@@ -1275,7 +1276,7 @@ typedef uint32_t fdt32_t;
 	if ($1) {
 		resultobj = PyUnicode_FromString(
 			fdt_string(fdt1, fdt32_to_cpu($1->nameoff)));
-		buff = PyByteArray_FromStringAndSize(
+		buff = PyBytes_FromStringAndSize(
 			(const char *)($1 + 1), fdt32_to_cpu($1->len));
 		resultobj = SWIG_AppendOutput(resultobj, buff);
 	}
diff --git a/tests/pylibfdt_tests.py b/tests/pylibfdt_tests.py
index ae46b29a8f5c..78d8976c0cf3 100644
--- a/tests/pylibfdt_tests.py
+++ b/tests/pylibfdt_tests.py
@@ -191,6 +191,7 @@ class PyLibfdtBasicTests(unittest.TestCase):
         root = 0
         poffset = self.fdt.first_property_offset(root)
         prop = self.fdt.get_property_by_offset(poffset)
+        self.assertIsInstance(prop, bytes)
         self.assertEqual(prop.name, 'compatible')
         self.assertEqual(prop, b'test_tree1\0')
         for copied in (copy.copy(prop), copy.deepcopy(prop)):
-- 
2.56.0.679.gc527c65306-goog

