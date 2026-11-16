Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794862421;
	b=UlzEwZJNvXJmNwy9sCLZbVPxnlhLbNFvJ6FZEfR7oSd8RtpHsE22wWIkmU6WMDIErQwI
	 Zidi/eJH2VoewxAL7wgES6v+3JT18ef7Ak9LPKtuqksRFSr2mEE5hpGtyUXtn/cSf7La/
	 v/gNO0fMB37lzwGRy4pnF0lBRQ2p4MG5UriIjuNzaek34hnrsXl9o4U9/QW8BdjeHXYdE
	 Dv1CveKiwOqjXbdxUmLYiY5L6oxv+KsGLoqhK2gWxkTzjPXzsmrCX9WJq6u2tbl07I7QD
	 9JdxjuAwPu6FXJS7RO2g5Dy65hDXYApeeiwvEcyRKpPYPh32yylhtjwVSG5PpfHTlYw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794862421;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=jvVNvu1S6dbncJSuthsRoeoeI4Q+KNIALnJGA2kItSE=;
	b=23XxrF8wn2XhZxeiQGGqSHrW9Mub/khv4JRotaIFZdl0Kw+CD8ONiSQ/LUo5eRdoLMu5
	 +tdIYCVbytKQHB/pj+PTX7etezwXGp36kCW77w4ZzNSRyBiuvNeJWxQn1YpdhwYwdWOW2
	 0SGRIoltQbMwGAg3kYqknYQ/jo7AhurfyJOwBwsZH4TJEy1G9LaplLKGFIalnYkP8WTb0
	 RvJKnz4LgOWbVt+sybNdt+1cfFJUShf+9225lahxg6aZvRTNSaxtEsaOSBDZrSdwHXKRF
	 dPQC/CJAQQYJDVsTPnzJj7dT3bpFgxVhU3EfmQDMw/T+QS6BzeWU0dUA1qfxJ+SNvuw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=guJzdrk7;
	arc=none smtp.remote-ip=74.125.82.171
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ACC2606A322
	for <Devicetree@vger.kernel.org>; Mon, 16 Nov 2026 20:53:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4ACC2606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=guJzdrk7
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-36e795af1d4so190793eec.1
        for <Devicetree@vger.kernel.org>; Mon, 16 Nov 2026 12:53:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1794862420; x=1795467220; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jvVNvu1S6dbncJSuthsRoeoeI4Q+KNIALnJGA2kItSE=;
        b=guJzdrk7VmvoXy4eRvWyqWXKP6t5/9dN94YSAHbzWYcmW+bS1TUFisS4TWEUTJw2Uf
         8vi81Cupj7meIi04/HsZgrorewGhpJ90tRztofu3vFKrg2iAUXr4SEasGJMvyZyzrtqO
         fXRn76HH2M+gcq2QT9Ht7q5p49QmMm9g8eUaI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794862420; x=1795467220;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jvVNvu1S6dbncJSuthsRoeoeI4Q+KNIALnJGA2kItSE=;
        b=KxcA+UPnmRuOYRrBtqfx5SRCk4lp1rfHQgEFbaRlufcM9FIjVmfcKuqTo19dM5DQY8
         KSGngxUo3f6wcwZoWzj8faLWBTzt5IgYXrZw9XF0KgldeiEF3Kfkx6SazD+HCtj32z2Y
         ITr9JaOLrGvvo/T4TXkJmypcmRYe2QWC7FPX9MIclttqmDdR8fR34D2SM4bZBJNGB93m
         0BrttZ5wadoaidsdnQZZ4NCjXOr80z7N+4nFBKZX7EeODE+ckjaL9jUdPAGammpRd4oW
         f2XLnx53tkxNf22T/T+cS5zho+qzyulia9k5YVy+lKO43ZESfm3ARamf3BTY36cQ3Yek
         /iSg==
X-Gm-Message-State: APuU4Z8a81f+XUt1xlifoDm38CUVu7+WDz1prBImc5/pAPfaqzqRMOqL
	PvYpjyCdfWBOveJdqQo9vkVb9RikXQc8USUVmw9AYbIcG5PYPNi4mU4UqzlefhoSbw==
X-Gm-Gg: AZFdTZf6QI56ZW7DoiduGR45N39aa9zYr1VGpsVm77Q0Nf+Qbx52YS+gxiLnw/tgVfO
	H+0VKGK6MZAKhwbTaUpH/ZkTKE89jZj9MnkKOtJ88XM7BD6mUjt5P9pQRPIne521z6FATTkJE5i
	jnzY7PTU53VKAgLGy6wq5oi/BzApnHei11dklRn/fxiWq4MYrJwURbyP6Tni0h4WqZgK36EW4O7
	mW3Kqf5S8SVS7eKkYPoeNkOxcORLaszWq+6a6Sa+SdnmP3xaIMFsFFrpSebrqx9G8+xxwimo+ao
	j6/Apl1NYhybfUAQvYSXXsSRJrww/LKZr5xtbg5NjuVNK5z1iI9A4R7y5JAoiRUtwmi3mQdqdr+
	dcV6t7QnN5DHOAC6L8UscJndzW4SQCHrC9aHJLtoYU2tMyKr3S1PIXgssUl1OajxiQ4ErOVEYOh
	FZYgycTwBqbfxOjv8UukV2kWFpwiE/wZYM1ZbDFMBm6JPI+hoJWuMiPb/L3TWPJNtnnQ1Z69jab
	Y9Eh/l8o/FKFWxUBh05Zfu53ypP4DQa9cbKCbO9DdPO3FNtfREcl4PCNCwsKDwAuSUjIjwQoLwU
	U/sY4v2++GBTKf6F2VadG+ksCDWM8wK6edDY0VTwpiNq2AdpqGRGWnVoDZccMWIOnn0HnI4662P
	OlGXuXJVzxw60IA==
X-Received: by 2002:a05:7300:1895:b0:358:c5c9:2661 with SMTP id 5a478bee46e88-3810cd4c1bdmr660553eec.10.1794862420309;
        Mon, 16 Nov 2026 12:53:40 -0800 (PST)
Received: from dianders.sjc.corp.google.com ([2a00:79e0:2e7c:8:40c8:6e27:a2df:3321])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379563e6b6dsm67120390eec.21.2026.11.16.12.53.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 12:53:37 -0800 (PST)
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
Subject: [PATCH v4 03/14] pylibfdt: Trim Fdt bytearray to totalsize() in FdtSw.as_fdt()
Date: Mon, 16 Nov 2026 12:53:00 -0800
Message-ID: <20261116205320.1621386-4-dianders@chromium.org>
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

`fdt_finish()` relocates the string table directly after the structure
block and updates the FDT header `totalsize` to the packed size, but
`FdtSw.as_fdt()` left the backing Python `bytearray` at the
pre-allocated `FdtSw` buffer size (with trailing zero bytes beyond
`totalsize()`), forcing callers that serialize `fdt.as_bytearray()` to
call `fdt.pack()` just to truncate `_fdt`.

Truncate `fdtsw` to `fdt_totalsize(fdtsw)` in `FdtSw.as_fdt()` (matching
`Fdt.pack()`) so the returned `Fdt`'s `as_bytearray()` length matches
its `totalsize()` immediately.

Assisted-by: Gemini:gemini-pro-prerelease
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

Changes in v4:
- New patch trimming the returned Fdt bytearray in FdtSw.as_fdt() so
  DeviceTree.flatten() does not need to call fdt.pack() (David Gibson)

 pylibfdt/libfdt.i       | 1 +
 tests/pylibfdt_tests.py | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/pylibfdt/libfdt.i b/pylibfdt/libfdt.i
index 8a7dfed85f15..68f22e316ece 100644
--- a/pylibfdt/libfdt.i
+++ b/pylibfdt/libfdt.i
@@ -1026,6 +1026,7 @@ class FdtSw(FdtRo):
         fdtsw = bytearray(self._fdt)
         while self.check_space(fdt_finish(fdtsw)):
             fdtsw = bytearray(self._fdt)
+        del fdtsw[fdt_totalsize(fdtsw):]
         return Fdt(fdtsw)
 
     def check_space(self, val):
diff --git a/tests/pylibfdt_tests.py b/tests/pylibfdt_tests.py
index 78d8976c0cf3..26915a015ccb 100644
--- a/tests/pylibfdt_tests.py
+++ b/tests/pylibfdt_tests.py
@@ -684,6 +684,7 @@ class PyLibfdtSwTests(unittest.TestCase):
 
         # Make sure we did at least two resizes
         self.assertTrue(len(fdt.as_bytearray()) > FdtSw.INC_SIZE * 2)
+        self.assertEqual(fdt.totalsize(), len(fdt.as_bytearray()))
 
         # Check that as_fdt() resizes when fewer than 4 bytes remain for FDT_END
         sw_exact = FdtSw(76)
@@ -692,6 +693,7 @@ class PyLibfdtSwTests(unittest.TestCase):
         sw_exact.end_node()
         fdt_exact = sw_exact.as_fdt()
         self.assertEqual(80, fdt_exact.totalsize())
+        self.assertEqual(80, len(fdt_exact.as_bytearray()))
 
 
 class PyLibfdtRoTests(unittest.TestCase):
-- 
2.56.0.679.gc527c65306-goog

