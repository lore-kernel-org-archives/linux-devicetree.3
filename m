Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793570628;
	b=eSx1ZdORH+aANk8d9iULaV0xsU8qycWForGHTQwaKwRdsCj4zpCh875Pf7IftNt6JvVz
	 uOsSrxK9qAE0eE4gsN8nIlpsQFfqcVReG4+YOiIFqszfz5mUQXMcKshOFgiO2F3sj/xPp
	 zs0Ye0vKHKW8u7Lzn/DgPiA8q2xbUAkVkCzkEveAbn9383Q1OkbWN54oiwrC+1hJjzixl
	 2s3rCRo9azljk4elQl+2hyY9M2ahAgehlJreO3hOw9XVPhXJpWlU93P8+XRUR1sPVxnMS
	 KB3508zzi6REAP2Xv6CS1G2hmACp9hH9sqzu42qYLNy1aIoekL0+2Wp2nPRO6ITqfNQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793570628;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=PKCTTttSXS/mV308tUM8IvVjrohPmFSHkzxQ9oTcAQ4=;
	b=mdns2t/vAFWNdEqn7kHYmRiVLQoEW9VTykc4NaPykXCI9HA4BDgqYdxcriSSXIV7n7+t
	 a56VYMAFiDX3NPGZO1m7Qky+ILfNIqJdNeviXDcsEujZXCrkaBnXLEYyr86f+t2Nr/7MZ
	 xqLl0KXZ0YIuWEeKD7D0iJIBF44EWzIvzsullfq+N+TQhy0HMG2Za1QOgFDZfuy6Yn9w3
	 qua7yT8sKiM8l58Ic+t6vgeI7kh2K1CMmmal8leKFujZCl5krPKXWNg0gmPACF1X4oy8I
	 mofhs8WAHoTNVXcCxtlJcP/FIHuscf7KtK/5ZpolL9hdYd0WmOePgSJRSVqyx1onIsQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=WoE18Z6c;
	arc=none smtp.remote-ip=74.125.82.172
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65AFB606A32E
	for <Devicetree@vger.kernel.org>; Sun,  1 Nov 2026 22:03:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 65AFB606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=WoE18Z6c
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-36a2551d7b5so4393198eec.1
        for <Devicetree@vger.kernel.org>; Sun, 01 Nov 2026 14:03:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793570628; x=1794175428; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PKCTTttSXS/mV308tUM8IvVjrohPmFSHkzxQ9oTcAQ4=;
        b=WoE18Z6c+/xgRgl2yQ6EzvQtQPJpXsFgK8eXRNL/5kN2kj7F2sVZt99P/n5wPllgal
         9kdtr/WOeqd1NYXA34Anjq//dAGL8q7bzH6YINQKbwCumA12JrK5w4ToXdi4tbNeIdfD
         Qx87N3IscLV2421GCrHZe1a5J7NEJ+PdgTL2E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793570628; x=1794175428;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PKCTTttSXS/mV308tUM8IvVjrohPmFSHkzxQ9oTcAQ4=;
        b=cDBLMmrFQYSss5fhMJyl1dI6HMLDQud/NdTX8ibVxfubzZTlqcuwM70f6ZvTdVELj2
         5tG7wdtvBc+R29Zwr7kIcL9B/FjXe1Gtv7DoLXOPV/gKkbCwjXJDhAhU3jySrKho+/zl
         QzNbusTjO/Y9ty54RTM3g1c9h9KFouvvNsUThN50DgcfM0quIxIEeZ4JsEsYBKD6iGUn
         mvT7/eXJy08IvU+bTNdqGjdwwNn1+9ABd9OCbctIT2W6POXmCRTbTo4uz0gJZ/NJBhro
         IgbjvpNibH/Qvg9GrScTBTTaozWGNA5dLJXFZWTgpGKeFgLa/hpFjX6yBRPDD0n2mqcI
         SkDQ==
X-Forwarded-Encrypted: i=1; AKwUvByjkzYql/sc2ZmjJ+Gy3Xv72mtR4lwG8go3272xss+mKI9kU19k63kr6wFXlcEOtbFYufwEqKDO8jBu@vger.kernel.org
X-Gm-Message-State: AFq9FYKKgL0bI3WD1gpgw6w3MV/NuTTleHztmlPrUP4TAcTu1V0bmYE6
	2IyYH0juZgdPHE27+03pHL4U98EWcU6sGyrvai1ociYi92Jd9kjjkYqq1J+s5Kz66g==
X-Gm-Gg: AYBFou3wvYCenRj9o66nr5n1jVQ+TY5X+UpqERHhKp4RVLqqnsdfjLtRlV/hNIJ0B1G
	F2L2NeMT8MUzNR8fPsbwZ7dYUx+86JLOK/MwCrXjgIYqvszeuIa4GwttRcvBHKD2cG+IF6XRMwc
	9z0YFkSitfIxheVFY8yeDHf+jGp4OPKNF5IQUjKbZdUF20qUh1cZ6t7FG0xGGECdZJAGfk8eGjr
	AXC8K+MzSLPvV7aifELc5+CBKzLWXxHPPPphUsqdlMXgAqSdsNDC/E8ysjFUws0ReUXWRgPYDO7
	FBb48bqzBviTFzuNpO8Mv9RLbfu/kwisYUf9OZj373fJ5EI9IHkdaoJSGqJK++TAHF4Ih1GAuWk
	k87NZvKWJa6noJOyfmuLmuxjZiWzAv87tBWzSQSRFZXhDIQvs3RCuGmQ/4m24JH3mOORkKDyjdT
	NGMoGOG72D+S7bQTF8eNYnNuTcInh8Vx21cAp7PVjQ4Wenc+whzeo8f3Y7p1NGOSoXEsPtyPYDp
	HQ/IRve3UoAlVfnUpO3qnXuuCwhmH0HzE7DGlE7Rz7g6Ttjya1NrjRmmvczKi+VKT+NAgIY61/G
	qyNH4ISKNCLbyiGP/IrNo4XSOLiBwwSUu96qvAwte3P4eaqDqFl5jQeRIWZIwNNYmJc5vCQaaq9
	I3XzSEBy+aOJeZA==
X-Received: by 2002:a05:7022:1588:b0:1a3:d292:f696 with SMTP id a92af1059eb24-1a949f6c426mr17161036c88.16.1793570627439;
        Sun, 01 Nov 2026 14:03:47 -0800 (PST)
Received: from dianders.sjc.corp.google.com ([2a00:79e0:2e7c:8:cbd8:5ca8:653a:11f9])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b106edc7f8sm11097266c88.9.2026.11.01.14.03.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 14:03:47 -0800 (PST)
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
Subject: [PATCH v3 06/15] pylibfdt: Support copy.copy() and copy.deepcopy() on Property
Date: Sun,  1 Nov 2026 14:01:13 -0800
Message-ID: <20261101220224.1436242-7-dianders@chromium.org>
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

`libfdt.Property` subclasses `bytearray` and has a two-argument
`__init__(self, name, value)` constructor. Because `bytearray`'s default
copy/reduce protocol passes only the raw byte buffer to the constructor
(and does not copy instance attributes), calling `copy.copy()` or
`copy.deepcopy()` on a `Property` fails with `TypeError:
Property.__init__() missing 1 required positional argument: 'value'`.

Implement `__copy__()` and `__deepcopy__()` on `Property` so shallow and
deep copies preserve both `name` and the byte contents, and add a unit
test in `tests/pylibfdt_tests.py`.

Assisted-by: Gemini:gemini-pro-prerelease
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

Changes in v3:
- New patch in v3 to support copying Property instances in DeviceTree
  (Simon Glass)

 pylibfdt/libfdt.i       | 6 ++++++
 tests/pylibfdt_tests.py | 6 ++++++
 2 files changed, 12 insertions(+)

diff --git a/pylibfdt/libfdt.i b/pylibfdt/libfdt.i
index 51db9535bd39..fa5f499ed96d 100644
--- a/pylibfdt/libfdt.i
+++ b/pylibfdt/libfdt.i
@@ -908,6 +908,12 @@ class Property(bytearray):
         bytearray.__init__(self, value)
         self.name = name
 
+    def __copy__(self):
+        return type(self)(self.name, self)
+
+    def __deepcopy__(self, memo):
+        return type(self)(self.name, self)
+
     def as_cell(self, fmt):
         return struct.unpack('>' + fmt, self)[0]
 
diff --git a/tests/pylibfdt_tests.py b/tests/pylibfdt_tests.py
index 18730965bd02..ae46b29a8f5c 100644
--- a/tests/pylibfdt_tests.py
+++ b/tests/pylibfdt_tests.py
@@ -4,6 +4,7 @@
 # Written by Simon Glass <sjg@chromium.org>
 #
 
+import copy
 import struct
 import sys
 import types
@@ -192,6 +193,11 @@ class PyLibfdtBasicTests(unittest.TestCase):
         prop = self.fdt.get_property_by_offset(poffset)
         self.assertEqual(prop.name, 'compatible')
         self.assertEqual(prop, b'test_tree1\0')
+        for copied in (copy.copy(prop), copy.deepcopy(prop)):
+            self.assertIsInstance(copied, libfdt.Property)
+            self.assertIsNot(copied, prop)
+            self.assertEqual(copied.name, 'compatible')
+            self.assertEqual(copied, b'test_tree1\0')
 
         with self.assertRaises(FdtException) as e:
             self.fdt.get_property_by_offset(-2)
-- 
2.56.0.317.g454f8302e1-goog

