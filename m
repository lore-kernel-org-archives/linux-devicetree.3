Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com [209.85.210.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55EA93A1A21
	for <devicetree@vger.kernel.org>; Wed, 29 Apr 2026 07:00:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777446035; cv=none; b=sJfTF5OZ+AWEAL2IXTY1T6NXTy1Gpo7sKLYHMvzYQ7KPeup8M/a+R3gh5SCW2i+v0hWrBKISTUobZ1fPS5h/tFy8ZizBHNl80YOemRY0rk8DWb2zI/7pYqxfCCUkZjv5my6YyN3NiWzZMdUIx8DNb1DH0qUvy/CGT0uN2CmIfdk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777446035; c=relaxed/simple;
	bh=GlzyRXhW7BOFU2J58m5FlsVsMQJSPP8T+AYIfqJL/UM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FIVCTjIOMlbrq7/B0GWL/O1f3mTpViq4i6xJjJ5yUmbDo71RYHMu8Ogwaa4/z+TsdtqpVdcs2/kWFMq81xLDQKamqTf2JOVlGBUUcojjV2jbg3C1OQsJu1MKUYfH0pEIdNeoZE/wX5zGvoAe5okF9ABTPV4NsFATR3WcnC7o31E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MteDqc+N; arc=none smtp.client-ip=209.85.210.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MteDqc+N"
Received: by mail-pf1-f195.google.com with SMTP id d2e1a72fcca58-82f8893bff3so5739722b3a.2
        for <devicetree@vger.kernel.org>; Wed, 29 Apr 2026 00:00:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777446033; x=1778050833; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZWH07l9RWm03Oah+cccPH78bmOCX+VwKmCZ1Y6ji5X8=;
        b=MteDqc+Nzc+Y+LXHt9TzYJ2mp5ZYiSxukpwu3QPoJO+o0S6b7Zc9OO+TCF5qiv35mj
         cFQxvOoNVVNf3ROdWdO/OsBhNoaIP8GsolwA2wziNfG+ahtDiha5Ma1xGCFPSE3WPZz0
         zwVFryPwXIqe6PJu9JIyYB/gwrE6s8hBBM6etlW5egAh/mHpFMv54Lv9oSM7rJQa4t2f
         iSUmVZZZL/YTcD3FoPNHJlzyz8R59m2OeIE1xNr42ktveu4LEaX7q8/R+ri03p9oRfPX
         t/eRV+nVysY7hyjhsJd/4btqeS8vHJL3qvIRrAQ/y3mOZDIYfZb6gM8i8RP4/4pG8TFO
         9oZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777446033; x=1778050833;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZWH07l9RWm03Oah+cccPH78bmOCX+VwKmCZ1Y6ji5X8=;
        b=AZqRkWd/bYN95rJzFX9/Zo6Cvz9Rj6ZNQ+2YJtY5Dt8QNmNCJggAm10pGJ3ScQ92CM
         0jrC3q+UiJkY3TMgi1LfPSoNyNLsoba7CB83x3LWgVqKC0Od4J+S4TgNfODqNXeEoQWW
         nlsI4KUENJI2Vo0ORFEOOhWtwgQIsTIbrVuvELUuH0rw8ioEToMbHahQBj5D8vHWacVb
         Mab1B0uQlDxO0EoZCk96r4piz+Xv/wiw6QvRhQtQd9wTQv1MWKAbqs39xVNvIwawvYC/
         ibffFDpKCoqpJMSefdbu/sSfOPVAmhV+vsChvC+3kCMItc687avMG0V2e7yXux/16/dS
         fZ+w==
X-Forwarded-Encrypted: i=1; AFNElJ/z0aOiD2fymVhVmyXMpnPr1AbqXp3gKLZpyNs4CzYberTOOpBKNzz6aIVpuI1X0FDNurdQu6p8J/nC@vger.kernel.org
X-Gm-Message-State: AOJu0YweYkrlcmuDHJU0SWfq74DBrPW+uhSwKpfJwwKwTLc2aJeeR9JC
	YrPBMRDrDutDWN4+QGciPJPepGPx7AKHvtdVn8EDlbxwX0DlApp8HReS
X-Gm-Gg: AeBDievfIyhkVoo5gj+0ac8ukngbb7IqQYw4tefsE14ZqEXzp/YQhhE6npYgzCTTzk6
	zvR7tdL6Ib+QC3f8K/C6kGXGqTLlk2W+UBMod3wEKVTU3Cx+WQyQkBFPewXAx0try0L9K/AcSbP
	LC73j4x8sKaOi0OWxN+lPViSjBLogZe5HH60g6oYsFWzJwV3FE70xCCwF3jlwzcMeLHFVUM4Wjo
	SjBQHPMKR3NyIGCk8+v4tCy9dHLAFyDe8GZpr3s5SiBgIdXM8NNIkC6w+ZcBBv1yj/9hPTJ8WYg
	HTbbcj5fMo0O55Uhn6QwBNTfLzNZDTsR13qaAEKRC1Jy3w3baI/kMqkZrRZojrpTctHCG0PJajR
	ShJuhOyXEEiXKoOTrcJEx941Rz3O3tzzhwaBtkBAFGaWk2h1UPwrgvPOb8XAxSuxgDSZqqhTs3g
	jXh5zY2RkDurez2IO+E/nZHI7LC2XkrlL6A6/gD889NYJ2k7RU
X-Received: by 2002:a05:6a00:a14:b0:82f:9985:d4a1 with SMTP id d2e1a72fcca58-834ddc14f4emr6920159b3a.24.1777446032715;
        Wed, 29 Apr 2026 00:00:32 -0700 (PDT)
Received: from intel.company.local ([210.184.73.204])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-834ed7eaf93sm1043146b3a.40.2026.04.29.00.00.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 00:00:32 -0700 (PDT)
From: Chen Wandun <chenwandun1@gmail.com>
X-Google-Original-From: Chen Wandun <chenwandun@lixiang.com>
To: kexec@lists.infradead.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	loongarch@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org
Cc: akpm@linux-foundation.org,
	bhe@redhat.com,
	rppt@kernel.org,
	pasha.tatashin@soleen.com,
	pratyush@kernel.org,
	ruirui.yang@linux.dev,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	catalin.marinas@arm.com,
	will@kernel.org,
	chenhuacai@kernel.org,
	kernel@xen0n.name,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	robh@kernel.org,
	saravanak@kernel.org,
	chenwandun@lixiang.com,
	zhaomeijing@lixiang.com,
	everyzhao@126.com
Subject: [PATCH 11/11] Documentation: admin-guide: kdump: document linux,no-dump DT property
Date: Wed, 29 Apr 2026 14:58:31 +0800
Message-ID: <20260429065831.1510858-12-chenwandun@lixiang.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260429065831.1510858-1-chenwandun@lixiang.com>
References: <20260429065831.1510858-1-chenwandun@lixiang.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Describe the new 'linux,no-dump' reserved-memory device tree property
and the automatic exclusion of /memreserve/ entries from the kdump
vmcore.

The section covers:

 - The two mechanisms that exclude reserved memory from the vmcore
   (firmware /memreserve/ entries and linux,no-dump child nodes).
 - Intended use cases (firmware-owned GPU, DSP and modem carveouts).
 - Interaction with the existing 'no-map' and 'reusable' flags, with
   the silent-ignore precedence implemented by the kernel.
 - Architectures honouring the hint (arm64, riscv, loongarch).
 - An illustrative reserved-memory DTS snippet.

The DT binding for the property itself is maintained in dt-schema.

Signed-off-by: Chen Wandun <chenwandun@lixiang.com>
---
 Documentation/admin-guide/kdump/kdump.rst | 59 +++++++++++++++++++++++
 1 file changed, 59 insertions(+)

diff --git a/Documentation/admin-guide/kdump/kdump.rst b/Documentation/admin-guide/kdump/kdump.rst
index 7587caadbae1..c2246888e84d 100644
--- a/Documentation/admin-guide/kdump/kdump.rst
+++ b/Documentation/admin-guide/kdump/kdump.rst
@@ -600,6 +600,65 @@ with /sys/kernel/config/crash_dm_crypt_keys for setup,
 3. After the dump-capture kerne get booted, restore the keys to user keyring
    echo yes > /sys/kernel/crash_dm_crypt_keys/restore
 
+Excluding reserved memory regions from the vmcore (device tree)
+===============================================================
+
+On architectures that boot from a device tree and use kexec_file for
+kdump (arm64, riscv, loongarch), specific reserved memory regions can
+be excluded from the ELF PT_LOAD segments of the crash dump.
+
+Two mechanisms contribute to the exclusion:
+
+1) /memreserve/ entries from the FDT header.
+
+   These are firmware-level memory reservations with no associated
+   device tree node and therefore no driver-level description. Their
+   contents are typically firmware scratch areas that carry no value
+   for kernel crash analysis, so they are excluded from the vmcore
+   automatically.
+
+2) Reserved-memory nodes carrying the 'linux,no-dump' property.
+
+   Device tree authors can add this boolean hint to any
+   /reserved-memory child node to request that the kernel skip that
+   region when constructing the elfcorehdr. This is intended for
+   firmware-owned carveouts such as GPU, DSP and modem memory, whose
+   contents tend to significantly inflate the vmcore without aiding
+   kernel crash analysis.
+
+   Example::
+
+       reserved-memory {
+               #address-cells = <2>;
+               #size-cells = <2>;
+               ranges;
+
+               gpu_fw@a0000000 {
+                       reg = <0x0 0xa0000000 0x0 0x01000000>;
+                       no-map;
+                       linux,no-dump;
+               };
+
+               modem_fw@b0000000 {
+                       reg = <0x0 0xb0000000 0x0 0x02000000>;
+                       linux,no-dump;
+               };
+       };
+
+Interaction with other reserved-memory flags:
+
+- 'no-map': the region is already absent from the kernel linear map,
+  so it does not appear in the vmcore to begin with. Combining
+  'linux,no-dump' with 'no-map' is harmless but redundant.
+
+- 'reusable': the region is actively used by the kernel for movable
+  page allocations (CMA) and its contents are relevant to crash
+  analysis. 'linux,no-dump' is silently ignored on a reusable region.
+
+The property is an operating-system hint; DTBs that do not set it
+retain the legacy behaviour (all memory is dumped). Architectures
+that do not honour the hint simply ignore it.
+
 Contact
 =======
 
-- 
2.43.0

