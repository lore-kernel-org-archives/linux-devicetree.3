Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793570627;
	b=I7skr2xMDa+LsDFIvtmg+aIJN8XNuWrkO7/xahI+cBIOfkCtwkX1KkeoEWPT4MmKRKhA
	 4K3cSfuWRh6vKtaYVEYuyDHcw9P27qz3Y1reYC/ra1bAcXQ8ycm1WC1+EwTgHe7b/T49A
	 bG9xlLMq59eRMUwY9cBODFN5mWfVZ4f9NgCoyTzlMTw/H3F3cqpWPFYmg7btZNTvXFkLW
	 P5eDG9eiWKbpMWMuVNBVPxy2Ty3U/AZPzt0UKw+DKAfPiYyiP5+Ij8Y3fumgan2HbQ8HX
	 rLpBmuooQWRXbyHuPMz4ZvDdUp8t9Hw/ss/IgFw9g9Er8SdJlBUvY8fO3qsVyGa73Sw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793570627;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=VkblF9+hoJMz6dpel02wGz0tGUBGpJN2KDMF6wCO9Bs=;
	b=yRKDwQsQrEFzORSdoSUP+LVUogN3ePs7Q5yGpWYp6ZvLzQzEDDoQRnrIgBO6nMnM7QFu
	 YVpH+pRfjmeu+6S/2lulxa1Mf8tsgvgQDePYY2YbrMP0QVZF8FRD84GrWNm+lL+n9/Wvc
	 yUnCSN6u9qfCz7m/6eJb3c6cnDJla3J+8/3e+e/Vuwl7LFFdBpYpQSGqw61d77IS5cGWZ
	 Gvq6PlaiVUGrZWu/hggJrUB7rqla15fFpk7Cysyiipaccmm9r5ljpImHfCi5pnNnPsjvM
	 6r5y7owh7+VdnSX6c0lyW0yOOn1UrEzDT0h0GjYiCL7bAJwmcxXsC1r3bu0ti1TSsPQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b="KWaWKp/g";
	arc=none smtp.remote-ip=74.125.82.42
Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89104606A326
	for <Devicetree@vger.kernel.org>; Sun,  1 Nov 2026 22:03:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 89104606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=KWaWKp/g
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-14fc585291cso1826697c88.1
        for <Devicetree@vger.kernel.org>; Sun, 01 Nov 2026 14:03:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793570626; x=1794175426; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VkblF9+hoJMz6dpel02wGz0tGUBGpJN2KDMF6wCO9Bs=;
        b=KWaWKp/g1f02H64f+Vky1BX7ykbEgRPr6AoXFyf7+kgULvNutsHZdD2SyzChAy/92t
         tN1u2aQaDU6jKxUs2UqvzSqu6opWzNVLiVwNH0jPj+ZEvwG0UwyXJpDJb6R/PRB+lAi3
         n04+y+WoXL6AI4zjFmpYpA+kFySpdqir9VC9c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793570626; x=1794175426;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VkblF9+hoJMz6dpel02wGz0tGUBGpJN2KDMF6wCO9Bs=;
        b=MEyeikYO5IqFN6nL/RW6APbycV/78Uh4n0ai3PeTs9XHulbJOV1dlg0Dm0ago8ui53
         6r8z44bsdaVrjxFGUSSejzoIbCQNy5mvyYgvDBgJnmBPIQEQwufzDDrHyqHojhUIQL93
         kteK995NHay3KucWfmRRvRVf+KiHdvVTyGUes8RQcMrspOXlDO639MyfsQXAQZ5+1Abs
         83nAvEDj/IWuMil7WkktLUXUrmf6B4LLXb7l0d7fDB9H8uHnHPhpuSd3GTyABWgzL9Xz
         IPIDhspmE5A5ILaFGADVruv+lA5V4OZBZWyJWSq8vyYYawkYeS+8kqh7SKO0Tk72TdSA
         Qh8Q==
X-Forwarded-Encrypted: i=1; AKwUvBxyMBuX4A2D5tqvY0AsA4XJU9SQrmrDKu9luz9/nGSbgPckgAqAOaif7XQniF0JzTmQGB8ZcDFbQgqE@vger.kernel.org
X-Gm-Message-State: AFq9FYLv6G/yPO/alFPS31CisMK5a4lufMl9D16UzVIjwwMZaD5vN2On
	ezrS3UzoRFlS4zCpABJ1Wu7CpzsrLFGckaV4KUPTY5jjMyTQmuqamV0tMeo5CaNTCg==
X-Gm-Gg: AYBFou2KVNlD6l0NKlfUwamz27snulKUvevlvSsjF/lLm03Z1g5g0sRlhOTWC/3fPWY
	+Sb9R95YUWF8kA54QC6ELziUQgcxoZKOvgxSR9m1V4T/DbNViqleaMkFRZTkZpokbhPQIjQ9D9a
	aDeEX6YKjUelnLu+5I+qiewqADGRs8MP33Z8GG7OEFz+loyKWGzJqdRyu18K02VYzdtwSVYpTPb
	yQEZtnn+BOGLX/grcWju8hN5gQIxFwpgiZ/jqfdxfHBvCHDct0e/OlUD9p8f3yMWliDCFKkSO/z
	ll/4dNaF7g5tz4cIq/PyvXZ12MDndAy9VK02Fm1toQHnXkgd6sJhHgsN0AYCfV58uB03huKlKx2
	5WTzelxT1Qavbw2RtqDnB477Ix5EAHdMRxGsi3JNSKFa42VqDOktCdYuGk4BDtju1KyyDqhX7fj
	cj2M+RusPQsGbtwbFSs4Dq59NTdoM1q1cRFU9+gjx5d89pg6HL52ccLsnJ95K5bBoxqdtJWpiFs
	H9CLPAERGM2Hen/O6SamxXXpth8YZkiHutWPDb+MyGqYMWGSgqC0VeYY+2RnFlldpVAy/i+cH3p
	od0xWwRZZDigS+ztVPtHX+popr+gICsaK9M9wphqkgvUjrwUESR0tZkjtVakwFwCMOO9ciHDLSF
	xJz5N67VA0zBVTCmf7M2Og+AhnN2VdIovL7w=
X-Received: by 2002:a05:7022:3f0a:b0:151:6e80:ba7e with SMTP id a92af1059eb24-1ac56c9ff26mr13705215c88.4.1793570625752;
        Sun, 01 Nov 2026 14:03:45 -0800 (PST)
Received: from dianders.sjc.corp.google.com ([2a00:79e0:2e7c:8:cbd8:5ca8:653a:11f9])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b106edc7f8sm11097266c88.9.2026.11.01.14.03.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 14:03:40 -0800 (PST)
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
Subject: [PATCH v3 05/15] pylibfdt: Add Fdt.set_boot_cpuid_phys()
Date: Sun,  1 Nov 2026 14:01:12 -0800
Message-ID: <20261101220224.1436242-6-dianders@chromium.org>
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

`FdtRo` exposes `boot_cpuid_phys()` to read the physical boot CPU ID
from the FDT header, and SWIG already wraps the underlying C function
`fdt_set_boot_cpuid_phys()`, but `class Fdt` lacked a corresponding
`set_boot_cpuid_phys()` method.

Add `Fdt.set_boot_cpuid_phys()` and test it in
`tests/pylibfdt_tests.py`.

Assisted-by: Gemini:gemini-pro-prerelease
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

Changes in v3:
- New patch adding Fdt.set_boot_cpuid_phys() to pylibfdt (Simon Glass)

 pylibfdt/libfdt.i       | 8 ++++++++
 tests/pylibfdt_tests.py | 3 +++
 2 files changed, 11 insertions(+)

diff --git a/pylibfdt/libfdt.i b/pylibfdt/libfdt.i
index eb14312986ea..51db9535bd39 100644
--- a/pylibfdt/libfdt.i
+++ b/pylibfdt/libfdt.i
@@ -684,6 +684,14 @@ class Fdt(FdtRo):
         del self._fdt[self.totalsize():]
         return err
 
+    def set_boot_cpuid_phys(self, boot_cpuid_phys):
+        """Set the physical boot CPU ID
+
+        Args:
+            boot_cpuid_phys: Physical boot CPU ID
+        """
+        fdt_set_boot_cpuid_phys(self._fdt, boot_cpuid_phys)
+
     def add_mem_rsv(self, addr, size, quiet=()):
         """Add a memory reserve-map record
 
diff --git a/tests/pylibfdt_tests.py b/tests/pylibfdt_tests.py
index 20741d8f2df0..18730965bd02 100644
--- a/tests/pylibfdt_tests.py
+++ b/tests/pylibfdt_tests.py
@@ -300,6 +300,9 @@ class PyLibfdtBasicTests(unittest.TestCase):
         self.assertEqual(self.fdt.version(), 17)
         self.assertEqual(self.fdt.last_comp_version(), 16)
         self.assertEqual(self.fdt.boot_cpuid_phys(), 0)
+        self.fdt.set_boot_cpuid_phys(0x42)
+        self.assertEqual(self.fdt.boot_cpuid_phys(), 0x42)
+        self.fdt.set_boot_cpuid_phys(0)
         self.assertEqual(self.fdt.size_dt_strings(), 105)
         self.assertEqual(self.fdt.size_dt_struct(), 564)
 
-- 
2.56.0.317.g454f8302e1-goog

