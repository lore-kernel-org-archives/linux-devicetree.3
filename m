Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793224590;
	b=JNOYuKcrNHX7KcjXEEKv1Tdv9weULK3MpZAmitrSqy4MgNMFGexIPdmKGpu2VPf4gunu
	 Cpdk/srMr2Z0bCuHouj5ygNX6dared5iVZE5+67eUo50Rvjhbnv2bn0bw5xXHWmfdis7/
	 2F2rWsJ+nH0CR3wQJ08Hgy5NUnC3NUAwyiu9fi9jpWgGqEsf+4HcG7mt28mxXTNiQ32oG
	 A2CkyHRiP3zwwNw3rgjkn+h2KgY5MRblhy5f0/b6f7kOpU5rwiCBH8ehuEV7pfjucgE0W
	 4XOls3/Vw96GqcHwqGv4G3Hcs907v96ciXIvV9ADRMpzk3lVHW7I3aREPdLPn8BfhRw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793224590;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=MM0KvfFyAbh8VWSliCEimGsM/uJay/dgVTHB3JwFRmU=;
	b=13FS5psRGir+wgqv9BJ4kV9GHd/bID8MiIaMEZgGCGjOyZchNFge6ST0b74ghsyaq+lb
	 pE9QcOmd6GS1sHrWz0m4Op/Z8Ujtx2TjqE3WX/57yuvylphHT7sLKuvztTCtA6Put4Zt3
	 2/TYn95Po44/wA9xngEQDTzDjYxWfhrCAvl5+jiuCZB19KP7lcjn+nrhv8Xhj41Lajddo
	 E4wCy7guA0IC6ONlDBi82dQ3NqYnLt68FK4C2E5GEWduX0CYt1z3ykpvI1su9rHm7/OKB
	 b7qhKnsTdoOP8SIH8YvtfvQygDbbGb3RZSMzC3V4YIAYkfhoKJetDJQ3JRs259SqQJw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=PnLT18oH;
	arc=none smtp.remote-ip=74.125.82.170
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B4F4606A333
	for <Devicetree@vger.kernel.org>; Wed, 28 Oct 2026 21:56:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5B4F4606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=PnLT18oH
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-3550c917fd3so2121877eec.0
        for <Devicetree@vger.kernel.org>; Wed, 28 Oct 2026 14:56:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793224589; x=1793829389; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MM0KvfFyAbh8VWSliCEimGsM/uJay/dgVTHB3JwFRmU=;
        b=PnLT18oHCXAMfz3A6UxJ7+6+7m4vVBG6m1yn3t9WOYzXb6GHmVOe8Pgz6xzkh7aT1E
         wcqDZjHqJBN4M/+f7MTso6YoWzpfSjAGNm40BRQU0ASkPH1Vf582AmC8ItEPS02eE6pq
         AvZg9tyonmALfffiWK90CkcnUfrzKuaNLfxPQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793224589; x=1793829389;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MM0KvfFyAbh8VWSliCEimGsM/uJay/dgVTHB3JwFRmU=;
        b=RJmAFW+qCQGOKeAaFDgf+Ggb3KIlJOSOPCB85/qsjqTuo+TPCmf6Qwkl0hZvK1tXsZ
         UX3MVRBUr9Zmyl9ATrnTfkNLfppfYE/BtSSq08zzhDGcsLMps9aXWVAzCAgJ0gENuXdE
         5xVTpvCjavWFAoQVXbdULj757ei0HltoZUZf8OLhNezIJFkbpfyNRX47sxZ0Kj8WpgHL
         22YIAMxZBk3UzXEZHpxX0Hsg98BCdN/4QtIsAhsSyHxuDsUcYKpMb8jIrviUIHdjZB8l
         3QkWmWaTkoMNk7ZpsiihQp33+hrELkVmes1qoCz9KWVTQWye3gPsXMGNvoPzoXpmO+WV
         0PhA==
X-Forwarded-Encrypted: i=1; AKwUvBzNW28qj/Neb++W2XoHed7ow0ED52F1pNawolCJVPE0mcKSbLCixBHi3m3dS/EpNoCUgYrn9C7pjpm7@vger.kernel.org
X-Gm-Message-State: AFq9FYKUw+LYrERZ+h5KdHMRPoPgrJzNUL65QTI1fa8htQB0uN/lnEKh
	5jJ4/DyQ/Fvxo3rUHbfHHiybx8ADd2ip9eu2q4laT26p1JMteUATaFn2ujKIVJ1ATQ==
X-Gm-Gg: AYBFou2xD+COyA8Sx6IMR/8R6SkBwVlAMwNPwthrsZE9wp4QCDxm6jQ8qMNfH5KFswL
	Cx1SZBZZmbXGN3bOuebuHLzJY15HcFFhNDiqQNgBEKdQk81sDRmVepuWtv//kfLQHwqC3qyeLr4
	b479VA0LaGQL1/AAaSOAsW7mQaRxfECUYxbux0kL/KKO0qoY0D4ZSK1+/7OaOjmP1cVIbhvS8Oa
	b5eQ0h0frzTFR+FULlWr2lx/sbatN8pXy/Y9Z6kfB8RmgMYKtGhO/pMOOgNZXnbGkD8tJAiozOA
	6+zk5NLKu+hqChrH1Mf02ozWBE7BWzQm4+kvHILbysvspYW6Hp9TxSViib5ZVCjlwxt1C5kXDSw
	qRRh733JzyDa357w5PPvLTRhksF/j0vzhZZeoxjTnjClhtXkArsJ84Brte3LBrn1KUO2QQ0xbfc
	G5Nmz4o2dpLmBNrOvZDqO9EUVxY+P1bJ1VXDjeuWt5pzNV82S3LkQE+5iX1SdFXUnqc0VCB6gNe
	j8+M3Pm2l91vGyiF61mTK42WldSyd65O8MP4OFWL5UkYcmA/webB40vLLwdTW7TTNrYLDGNin/e
	H6bLZ29gM5BKf6Nbr1mQwfCQxO/zhKkrN/Qa1aDYminBAa6TTkKnX1+bBJnCG8lgeFdgckeEqz1
	fv32Ri+xQNjBq
X-Received: by 2002:a05:7301:1708:b0:369:987f:d15e with SMTP id 5a478bee46e88-36a202871c0mr4715544eec.2.1793224589274;
        Wed, 28 Oct 2026 14:56:29 -0700 (PDT)
Received: from dianders.sjc.corp.google.com ([2a00:79e0:2e7c:8:19e7:c87:2527:4e12])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a2393cc86sm8845224eec.19.2026.10.28.14.56.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 14:56:28 -0700 (PDT)
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
Subject: [PATCH v2 01/10] pylibfdt: Fix FdtSw.as_fdt() when buffer is nearly full
Date: Wed, 28 Oct 2026 14:46:50 -0700
Message-ID: <20261028215600.1713475-2-dianders@chromium.org>
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

`FdtSw.as_fdt()` calls `fdt_finish()` on a copy of `self._fdt` without
using `self.check_space()`. Because `fdt_finish()` appends the 4-byte
`FDT_END` token, `as_fdt()` raises `FdtException(FDT_ERR_NOSPACE)` if
fewer than 4 bytes of free space remain in `self._fdt` after the final
`end_node()`.

Wrap `fdt_finish()` in a `while self.check_space(fdt_finish(fdtsw)):`
loop so `FdtSw.as_fdt()` automatically resizes the buffer when needed,
matching the rest of `FdtSw`'s methods.

Assisted-by: Gemini:gemini-pro-prerelease
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

Changes in v2:
- New patch fixing FdtSw.as_fdt() buffer resize when < 4 bytes remain

 pylibfdt/libfdt.i       | 3 ++-
 tests/pylibfdt_tests.py | 8 ++++++++
 2 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/pylibfdt/libfdt.i b/pylibfdt/libfdt.i
index b41c03f4932a..46f28f67290d 100644
--- a/pylibfdt/libfdt.i
+++ b/pylibfdt/libfdt.i
@@ -959,7 +959,8 @@ class FdtSw(FdtRo):
             Fdt object allowing access to the newly created device tree
         """
         fdtsw = bytearray(self._fdt)
-        check_err(fdt_finish(fdtsw))
+        while self.check_space(fdt_finish(fdtsw)):
+            fdtsw = bytearray(self._fdt)
         return Fdt(fdtsw)
 
     def check_space(self, val):
diff --git a/tests/pylibfdt_tests.py b/tests/pylibfdt_tests.py
index 0e1660753477..1b65961491bf 100644
--- a/tests/pylibfdt_tests.py
+++ b/tests/pylibfdt_tests.py
@@ -646,6 +646,14 @@ class PyLibfdtSwTests(unittest.TestCase):
         # Make sure we did at least two resizes
         self.assertTrue(len(fdt.as_bytearray()) > FdtSw.INC_SIZE * 2)
 
+        # Check that as_fdt() resizes when fewer than 4 bytes remain for FDT_END
+        sw_exact = FdtSw(76)
+        sw_exact.finish_reservemap()
+        sw_exact.begin_node('')
+        sw_exact.end_node()
+        fdt_exact = sw_exact.as_fdt()
+        self.assertEqual(80, fdt_exact.totalsize())
+
 
 class PyLibfdtRoTests(unittest.TestCase):
     """Test class for read-only pylibfdt access functions
-- 
2.56.0.313.g2479322e68-goog

