Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793570620;
	b=lkH01Q2wjm6mmosDSHDOnQNniVNq3/6b+JNafEsbDwETP68zhuphDIpfytunxMWQN4Op
	 G1sCADlmL01PoBJ3Ltywr7nKD4IZArxcofmU3ub0LIO/Yad7sP/2GIfRLnYilqAQPZFcm
	 b5y2QoB0604tCimQTKayX5IP3VnxcDIWOoepj6ej+AtNp3TJwokyI+oqu5CiuCALhQbJC
	 wQSViixLa3wdh7ynT0U8B2Z/eWspcC0AHLuWD5Ek7ayHVRplyCjxPwGNXSk4HHZE95ADo
	 WD1KMQlFlEDwJANH5NA4MW8mxXkyx68mSPz87hBeOkwgwX/Q2+xnxJwz3ONQShPlZ3w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793570620;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=oX2lY0B1d+Uk+y09UrHk78EQVJf4wVNg8JWwEXhX1hg=;
	b=m97t4tP7mHBoSCMzU/x+S3H8XS9OupKEoJT9MHWZJTvt8/SxzXLtcw41a858pYh3xtWh
	 WTzIb8YaY6O+JPWh+dfUc/TQW8CVIU+XW2m/ZCf445GD8hfc30QJgo8X6Rp8+fhRCNBrO
	 IC/KEmgDCwwa24W5TsiIYROwFdhs1WkRY/WM5ipxW6mt7Di5gjcnxRaKFMjblwZzUZy1m
	 t9FAKkL/0qKuKuUD2ZR9WPRbrrsD+dKVq5zIeZa737Zo4bzcxWfprpgHgW2T5DgzuTwMG
	 jhjcd6CP+Il0RpQlfU+Z4tOA40GdmY0t1JUJsZWOxxzbgwCecZ0CI7CLb+vSEEeqsjg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=hAfr3Fei;
	arc=none smtp.remote-ip=74.125.82.52
Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C08D3606A327
	for <Devicetree@vger.kernel.org>; Sun,  1 Nov 2026 22:03:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C08D3606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=hAfr3Fei
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-1ae18eb9b69so1393056c88.0
        for <Devicetree@vger.kernel.org>; Sun, 01 Nov 2026 14:03:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793570619; x=1794175419; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oX2lY0B1d+Uk+y09UrHk78EQVJf4wVNg8JWwEXhX1hg=;
        b=hAfr3FeijYYJxYYlH/8f9HVj0okG6peROjzlYSkDbyC2M1z0gnfPaVQplVuef6eE3T
         t/vhHt2MR8BF4UwsEB2IEEtnuGmh9NM2FB7vjMiAYGZ5cmxGDmJvZhLJbh6yPrzl1pCS
         fTXdOBvE5Ec/JxB4W3qtKUMLRpF0jWxQXB6aw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793570619; x=1794175419;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=oX2lY0B1d+Uk+y09UrHk78EQVJf4wVNg8JWwEXhX1hg=;
        b=Fb1fJ7mQD0I6e+0EzyWYaP3KhkG6oNCJNLAGk7IpAdxVzH1LH6DCIQNREO0JfU0urA
         K746UAIuTakdIx/DliTVSSxhU8Xjac+JtNogK2xWcaER9MZfv7Tj3W9Ki8XMF7hp7pkD
         ruICOO8S3pJvmqLbeXJTJovscutRlhh9U63HdzpmJUeskUn2stZN0QU8ItG8fPFoMmV4
         BYIxr4O2kZDqjebntTNMuM6L1qzh9mWOFhq8yUc80HpCxFsgVz/JN0Cw7h+NsRhmQGjk
         N5TTx/wIGEK8U7bHcuUbwVMBHkZKQsDdeeoE8toTMziIxrltlW8XtRYIseoSGTzskYdZ
         L08Q==
X-Forwarded-Encrypted: i=1; AKwUvBx70BefXqlZk8fSU515Twm/Gh/haOX+cy8UVYYFjsZ49cK+GpXI/FC2D2faPf/aebsccS89Q75VS/gk@vger.kernel.org
X-Gm-Message-State: AFq9FYIyif3X5GQ3tZ0DR3YjH+2moSQvpkCCO5umyQsC+kc7xW7C8R6+
	4rD7cNDXfX7nxc/qPHMmt1t7iiB1X6TF63gfaBQGaXd1D70ZpDLovnwyLpNHmM2mow==
X-Gm-Gg: AYBFou1zavOUo1OJkIfbFPamCPYRY9YEnuQ3au46a6XsntyJv+1WG0ikoxKZ3NQbAkP
	sclGhZ0HLsSCOLdLzmzsAUjGUFuOpI/t9AKkJiEBpCIOjhLbjX6j6/VTB/ksYfviCSuElT8Em3K
	oGJ1VdfF0Yj2o2YCYoWUbbqsXg0xcE//XildOOMPwxa26MStNumWVuw9eYgviggjfAqbmCZrgrQ
	MG49nhsu3pcH+srDOdmYNJU81+WHDFio+SnQlKBeHoFyDGFjUZ1Ef+fLDMz0gK9zP6FQL8eB2YD
	3vBGJpfNkYcV/A/h9xzmkkLLRb8xt1x121zcb2opnSffTOaovvraKmVYxPhA6pBjV20jwBfcAwq
	U2dDQpbx+0Pos1Fy4PVhYwrHFAich5hKIF27rRevYtE2gv7rt5Avknn6kG4QyUabUlP6CL7KeDi
	ajyFpOc4b/aU0eCggLn0nvafthOFxhszHzRFcuiMYxVbQXqhPqIPMLqGZlbyP3ubD2K4fg3kEjv
	drRFLVaN2td34lQna5DUCvkz5vdq9TwjJR5IQeBSAvhfndLE1VXkMJCzK85uGUAC+ZH7VxhNnMF
	eyf39MRXkrT9dzN2OIHgeJzO3VIjFGxudzL/ZG6O/rghfDHVx4QlSNYw3FIAgVs+NCsj0m2XTxE
	CQFOQkyEDUlbyVA==
X-Received: by 2002:a05:7022:3c87:b0:1ad:4ef5:ffed with SMTP id a92af1059eb24-1aea05f4bcfmr6889873c88.38.1793570618814;
        Sun, 01 Nov 2026 14:03:38 -0800 (PST)
Received: from dianders.sjc.corp.google.com ([2a00:79e0:2e7c:8:cbd8:5ca8:653a:11f9])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b106edc7f8sm11097266c88.9.2026.11.01.14.03.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 14:03:35 -0800 (PST)
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
Subject: [PATCH v3 04/15] pylibfdt: Handle empty properties in as_str() and as_stringlist()
Date: Sun,  1 Nov 2026 14:01:11 -0800
Message-ID: <20261101220224.1436242-5-dianders@chromium.org>
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

Currently, calling `Property.as_str()` or `Property.as_stringlist()` on
an empty `Property` (`b''`) raises `IndexError: bytearray index out of
range` when indexing `self[-1]`.

Update `Property.as_str()` to raise `ValueError('Property lacks nul
termination')` on an empty property, and update
`Property.as_stringlist()` to return `[]` on an empty property. Add unit
tests in `tests/pylibfdt_tests.py`.

Assisted-by: Gemini:gemini-pro-prerelease
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

Changes in v3:
- Split Property.as_str() and Property.as_stringlist() empty-property
  handling into a standalone patch and add direct Property unit tests
  (Simon Glass, David Gibson)

 pylibfdt/libfdt.i       | 4 +++-
 tests/pylibfdt_tests.py | 7 +++++++
 2 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/pylibfdt/libfdt.i b/pylibfdt/libfdt.i
index 5c8859b37df3..eb14312986ea 100644
--- a/pylibfdt/libfdt.i
+++ b/pylibfdt/libfdt.i
@@ -932,7 +932,7 @@ class Property(bytearray):
 
     def as_str(self):
         """Unicode is supported by decoding from UTF-8"""
-        if self[-1] != 0:
+        if not self or self[-1] != 0:
             raise ValueError('Property lacks nul termination')
         if 0 in self[:-1]:
             raise ValueError('Property contains embedded nul characters')
@@ -940,6 +940,8 @@ class Property(bytearray):
 
     def as_stringlist(self):
         """Unicode is supported by decoding from UTF-8"""
+        if not self:
+            return []
         if self[-1] != 0:
             raise ValueError('Property lacks nul termination')
         parts = self[:-1].split(b'\x00')
diff --git a/tests/pylibfdt_tests.py b/tests/pylibfdt_tests.py
index 93408745c575..20741d8f2df0 100644
--- a/tests/pylibfdt_tests.py
+++ b/tests/pylibfdt_tests.py
@@ -423,6 +423,10 @@ class PyLibfdtBasicTests(unittest.TestCase):
                          self.fdt.getprop(node, "compatible").as_stringlist())
         self.assertEqual(["this is a placeholder string", "string2"],
                          self.fdt.getprop(node, "placeholder").as_stringlist())
+        self.assertEqual([], libfdt.Property('empty', b'').as_stringlist())
+        with self.assertRaises(ValueError) as e:
+            libfdt.Property('bad', b'no-nul').as_stringlist()
+        self.assertIn('lacks nul termination', str(e.exception))
 
     def testReserveMap(self):
         """Test that we can access the memory reserve map"""
@@ -523,6 +527,9 @@ class PyLibfdtBasicTests(unittest.TestCase):
         with self.assertRaises(ValueError) as e:
             self.fdt.getprop(node, 'prop-int').as_str()
         self.assertIn('lacks nul termination', str(e.exception))
+        with self.assertRaises(ValueError) as e:
+            libfdt.Property('empty', b'').as_str()
+        self.assertIn('lacks nul termination', str(e.exception))
 
         node2 = self.fdt.path_offset('/subnode@1/subsubnode')
         with self.assertRaises(ValueError) as e:
-- 
2.56.0.317.g454f8302e1-goog

