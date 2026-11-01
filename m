Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793570614;
	b=rXhDGRyi4vSTacFllH4rhFVbtpfIV0KgXu7Qgv2+9MytQtj9E2JY4U1hRjs8uhDQ76lA
	 Asglj1M1U2NCL01eCHGBgWDcKynsQe0gX5ZZAbKuZ5CQ5Z4kIAVrdl35vaGpm4xTMFDEj
	 lIfaeWgJrI590upP7+ex54ebJEupPz3DRTJE5GVNn+yuLedMWzkkdRiZChPEPCGw17arm
	 mlAq0/gR6RDGQw8jdz7b7C/F/ljio+JCforWYi00y+Bkouxj6qx88jh9S8uSPWQCa45Yx
	 Lpbvx6VvLrpBfGy/86sjfQOKlrCEubZWpKuuzUaWsilDsurIu3uLKmYAKmSohh41E6g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793570614;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=H6oyrULPUMKEvcl/yJFleG9B/xW31TKnvnu3kNvY+DE=;
	b=mLHGsJgpkWQNPsaf9/GXOhZBN7GRWQphx9Ox/EnDhZYrPTCQ1WchAtG0NJedhbAm0mWY
	 lueSykB43SrRGK+kbGTVbnD3ryOA3tOOB/7kR2PhXtPaF8kgUe6XPQ1hhNp65QydaDhVk
	 H1Z56Bd+ziCIjBftLC54I0AZ+0az0A70nFhCp+IW2HVzWPk8Uo7/YxvB+fG4pJHY1somm
	 ekphBvsrYfrRpndp/RSX0bTRMFz9Evp5ybaVzFACYSvTNJGeIWLP9fE2wvfe8+CaGzFjx
	 LvGt+rty4BTq2QbdQbD7gwI/rgiqlIlI66UYMKss3uSWK8HFtHErBVCKsDnYgdmWJbg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=MdKAWEDC;
	arc=none smtp.remote-ip=74.125.82.42
Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DB4B606A332
	for <Devicetree@vger.kernel.org>; Sun,  1 Nov 2026 22:03:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4DB4B606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=MdKAWEDC
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-1a8cc11ac42so1927327c88.0
        for <Devicetree@vger.kernel.org>; Sun, 01 Nov 2026 14:03:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793570613; x=1794175413; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=H6oyrULPUMKEvcl/yJFleG9B/xW31TKnvnu3kNvY+DE=;
        b=MdKAWEDCcS2gf1aRPpXCuW2HhP+CsyqoTGCTIGDlElskl4MjosxEVfaCeln5bv1GMx
         ebAzMmoCLSUTM/8nCT8ij7Qy4duhScepSEtgdWoKzbOs7NpE99HDAm6GxzDduWjku8Kz
         mud45lC8v+zl9yZwQaHIU9pS28fM/WGDTRa98=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793570613; x=1794175413;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=H6oyrULPUMKEvcl/yJFleG9B/xW31TKnvnu3kNvY+DE=;
        b=OewmyIPplgiVawj/Rh8wGAVEeZ1zTNrijqMNJKnLwqUQD51LMWgVY6qmYR00MGGETX
         miOEo9FXve+Qr4pqPu5IvznKgbRBunCBRlsu92JOjOuKvH7ZbKxVzktGT87mnhkmydfl
         nk2GFDEi7U3DJT7mwv5vVbyFjyceMn+sEAkrogXIg5dlBO23Z9tj39diSIbUB6ygopk1
         6MeOZvlIcV5TqlbGArFOyfueSyYbYnQqm9Nh1H7nkojp7aXjP0qEXK+Td2N0AU2cFH/t
         +pyP9GX0s2QruoaRYBQ+GllMoookAPBDZ3cqxTwsKN6zopYSp528ihXyFUIVbbiWVVYc
         1Wrg==
X-Forwarded-Encrypted: i=1; AKwUvBytG9rl7q7BRWWejNpys/vg5AmjouJ3eGD3crBm9dO85qIE/149kChrBWOR2kJB0OsaQfUHk50cjjAO@vger.kernel.org
X-Gm-Message-State: AFq9FYKxLri0o/aVXmb5Grhmr24Iof8MnaLyjYli8RehFr9Oh30yJgO5
	w6VF3Uqp/QJujRoMRPD4ytds2IBUdtdaPfyd+MTlKJBEBSWRE+P114fc8Bya3qBO/g==
X-Gm-Gg: AYBFou3k3skaA9T/VpNn5FuooWsg+fiA352YU5DiPGq1RB9WpF51uvOiQkJx9/MEoup
	Y3wSpcu83RxzHINbkvgNR9giFlOKg/NryqhB2wreCYkJOEX6jaV5ESXaNgOyP7hzsphK+ENtcAT
	VJv8QUul7m7mp8xs/KLm0id3kwbb6DqK4HzRlQUaLtRU8KOKzckuy77nbB/kX+e6il1uuLlY6d5
	v1udfhzcBpTIGwqmpjfbUk76BmrZ7MJ6Mv9mfXAKCYCELahiGGI17Be2OevkQPKBHC2+xVLaaHE
	2ZvvYWbeqBnrNtYqMuCfwOO9xZMx21rXL+faDJpHRdWFgEmAeeytD+KrPiwU+PRpdndxdNzKDbG
	6RM7BXejDAv06u2a4moL6Dj+NAuUVdxlc+XQM8DQ6TWaBuVl4xN7W3ZHpmFQGQXjkkoJc2nqISp
	JloWqI2t2KhKkhA2/E/nCgXAf7YX1o/sAHFtQD758CGvIfh1QVOaaW9Ao74+rfmDhLx7xKSsHQ9
	SycP/n0oTpXV5n7E0/YyRe5sot5fmSqXryz5BR3YaA59DDrS8AtUQ7qqNphC92o0BpCTnHnsQbE
	PD3Qf4Sf+69a76yMDXzPpxgtj4NALqDY91/XI9PKnv+9IDFF69DUvOxVRgmNE+Egpu1AHzcym82
	d+Ap6hEkB3b5/YA==
X-Received: by 2002:a05:7023:90b:b0:14c:8461:b3ef with SMTP id a92af1059eb24-1ac5e6f5132mr15587123c88.24.1793570613180;
        Sun, 01 Nov 2026 14:03:33 -0800 (PST)
Received: from dianders.sjc.corp.google.com ([2a00:79e0:2e7c:8:cbd8:5ca8:653a:11f9])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b106edc7f8sm11097266c88.9.2026.11.01.14.03.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 14:03:28 -0800 (PST)
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
Subject: [PATCH v3 03/15] pylibfdt: Clarify iterator docstrings and test negative offsets
Date: Sun,  1 Nov 2026 14:01:10 -0800
Message-ID: <20261101220224.1436242-4-dianders@chromium.org>
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

Follow-up improvements to commit 6b0371afc532 ("pylibfdt: Add
subnode/property iterators and get_mem_rsv_list()"):

- Document in `FdtRo.subnodes()` and `FdtRo.properties()` that the
  device tree must not be modified while iterating, as node or property
  offsets may shift.
- Remove the inaccurate `Raises:` section from `FdtRo.subnodes()`, as
  `fdt_first_subnode()` and `fdt_next_subnode()` map all negative
  returns from `fdt_next_node()` to `-FDT_ERR_NOTFOUND` (which
  `subnodes()` quiets).
- Add a test case in `tests/pylibfdt_tests.py` verifying that passing a
  negative offset (`-1`) to `properties()` raises `FdtException` with
  `-libfdt.BADOFFSET`.

Assisted-by: Gemini:gemini-pro-prerelease
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

Changes in v3:
- New follow-up patch for already-applied commit 6b0371afc532
  ("pylibfdt: Add subnode/property iterators and get_mem_rsv_list()")
  clarifying iterator docstrings and testing negative offsets (Simon
  Glass, David Gibson)

 pylibfdt/libfdt.i       | 9 ++++++---
 tests/pylibfdt_tests.py | 4 ++++
 2 files changed, 10 insertions(+), 3 deletions(-)

diff --git a/pylibfdt/libfdt.i b/pylibfdt/libfdt.i
index 0db7110b4a38..5c8859b37df3 100644
--- a/pylibfdt/libfdt.i
+++ b/pylibfdt/libfdt.i
@@ -204,14 +204,14 @@ class FdtRo(object):
     def subnodes(self, nodeoffset):
         """Iterate over the subnodes of a node
 
+        The device tree must not be modified while iterating, as node offsets
+        may shift.
+
         Args:
             nodeoffset: Offset of parent node to check
 
         Yields:
             Node offset of each direct subnode in order
-
-        Raises:
-            FdtException on error (e.g. invalid nodeoffset)
         """
         soff = self.first_subnode(nodeoffset, quiet=QUIET_NOTFOUND)
         while soff >= 0:
@@ -465,6 +465,9 @@ class FdtRo(object):
     def properties(self, nodeoffset):
         """Iterate over the properties of a node
 
+        The device tree must not be modified while iterating, as property
+        offsets may shift.
+
         Args:
             nodeoffset: Offset of node to check
 
diff --git a/tests/pylibfdt_tests.py b/tests/pylibfdt_tests.py
index 2a0509c7802e..93408745c575 100644
--- a/tests/pylibfdt_tests.py
+++ b/tests/pylibfdt_tests.py
@@ -171,6 +171,10 @@ class PyLibfdtBasicTests(unittest.TestCase):
             self.fdt.first_property_offset(node)
         self.assertEqual(e.exception.err, -libfdt.NOTFOUND)
 
+        with self.assertRaises(FdtException) as e:
+            list(self.fdt.properties(-1))
+        self.assertEqual(e.exception.err, -libfdt.BADOFFSET)
+
     def testGetName(self):
         """Check that we can get the name of a node"""
         self.assertEqual(self.fdt.get_name(0), '')
-- 
2.56.0.317.g454f8302e1-goog

