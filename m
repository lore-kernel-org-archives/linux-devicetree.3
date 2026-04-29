Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A61DB3B6376
	for <devicetree@vger.kernel.org>; Wed, 29 Apr 2026 13:22:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777468975; cv=none; b=sQNp8Cr6Us6ux1Brn1bseXZEErWRqZQ+PwPQU/6CgmCW0o2ZYrs0BeG6YVgu1lVNGFsa3MWPJ2ulJ70UPeRK+0RofsZxTnHnSYmbk9w+2uSaVh745Hc9F3L5mG3mOzLz62oDvuVPAlR2itFPTdrVBFqRTT9Elkp493Fk1Z/mVCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777468975; c=relaxed/simple;
	bh=01DQgwaJ3ce2HaFqHqFVOsD/TYkkeJShpzCaK3dyx4M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GubsbOexza2d+ou5Lgl0h80jdnntNG8gf0rO/AUBeyI3WjQGXUK1trEl8ga6TAugF1dR63iJLNVq+QRUPvJy/fEHmsGjnAotFBTjL9Dn0TkLLNXFouAJZSPv4pxv89y1ElgfqBAhDL8zr4zC8KIm74l3I/F9qur9+UuMIGDWNns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EvMG5VKB; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EvMG5VKB"
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-c7b9f54d3deso4906689a12.1
        for <devicetree@vger.kernel.org>; Wed, 29 Apr 2026 06:22:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777468974; x=1778073774; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DZTB0k5HzoHvpW2eiYdnzwypWK5KqzxoJlBxqEnFu+U=;
        b=EvMG5VKByiGkhnQNWvlq+k0VssqHnbUaCTMi9hYZGr5HsGBTfAbPCehd6dav8zCxrT
         pEBNgmNaUjIMMJwpKrk+ON+TNvPiZNmzIgWnv67s3t0yQDwFeJHwxyKqcPzl8J5IF/5+
         CxAn3MHz3z38B8lSfbrrFwCOAGgRxi4AfcHvQz3y0VaOz8iAmMxexzltu/abDGMC5Bkb
         /gY5ZsB4GWg2EQN0HsqNGvJ9IE2htbmU3mySv2CaSNbo33rhwGC8Va9lzMGHvgWfmv8i
         1DuQkKsqmFFby4XI61DW8XFwUj8Kz2+SMcLm0MZ6d9PeZU1x/kUCZXYIgnEEp18tQBR9
         8ccw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777468974; x=1778073774;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DZTB0k5HzoHvpW2eiYdnzwypWK5KqzxoJlBxqEnFu+U=;
        b=W89ruGMr0Bm4CgtfbfnmqI9u84SHCsHJr59wqeLBOGLHG60Y38/0Z6IZ15N0mriybS
         sESTWpZITRo+G1Ylmo/XduAJbnoPZR1GrSf22Hv9T2PHFWiVFZB7uW9rZEI132mLB7is
         kNDO3/ozOKavj+ytRjMXtVhaKAgd/qSC1kLWd2aeKApiuxBBHbHxkpmflgZRxPZbiJ2Q
         j2kftY9heNvYlxVrV8FasqEH+Hsk0Jbl2ehDrC+autoSOYFBEFZVZCbmPXJupDha3CQc
         xaoD/Zxu9A7BslYPUyNg3yLSIvF+wjZZV0eoh1bPdshfL4cWn8E6wsQ0vWGiBtfGm0op
         33SQ==
X-Forwarded-Encrypted: i=1; AFNElJ+ZImDzlUtcfIndSFUPmqfIy4EV7JyFpaaNmu0YXr0L9aNCV0Zqz9hj6eTHR/1HrdgLJ2m08UFDrOyl@vger.kernel.org
X-Gm-Message-State: AOJu0YxX0e1tlZXC5OeOM+ws5wpQPdXqcfBtPPFrdV5d9AuYWz5mbPEc
	WebVoy2DvDPvFRGO5GcMRSxh/p78zKEaWMBgiebe3P4xDgIpA6zrD09v
X-Gm-Gg: AeBDiev1u4WkDV/2Vn7D21AtYamu7NUabUEbonxFB+c91cnsyN8TIgGBE55+nkn/bEr
	pbvlOL7JDvrqFwmeMQbsMxuMNWRbqZgYeDWFt6ZaSgoCXiWy3zWV/lllYUj7W5yx9RhL1Jds20w
	cBFWQJ2UPJPkOv77sRZfT69OYxlqEokPkfsV7Ak2KsqqREdlnC4UlHygMx9gNrEtTEEvKmajU+x
	1jLa2by7iEq8A2dA81KrhlWVDTZ0MzFJ1X6JDzwlU1UteNb9ngTYKEWt3DudKd4pyysgHkfnYMv
	HIwfluccTxaDc2PQTrdPx8GXg8ACrdZZ0ztODA8fWiUefccliJRvd6Bhop8FKUBidqs4K9pVUQO
	6tGTdjCVe1hNGRs163RXLttw5WEx4Z4wHQR8WUxN2S1Fzg/NRSLTMhN70XwIxlOVPpFxn41jWHv
	3dVlHcvwai01AlZzcLs3v8Q5z2eeEsyi9lpCd6963bmimOKAU8uNKKnSBNQ9s+Mjinf8B8ygpG+
	TWymYATS9iSbQ4SkAInQ6rLzA==
X-Received: by 2002:a05:6a21:9981:b0:3a3:472b:2e6a with SMTP id adf61e73a8af0-3a39c058afcmr8013894637.18.1777468973973;
        Wed, 29 Apr 2026 06:22:53 -0700 (PDT)
Received: from localhost.localdomain ([2001:448a:2002:4381:3859:fd0d:505e:362c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-834ed5cd407sm2091372b3a.13.2026.04.29.06.22.47
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 29 Apr 2026 06:22:53 -0700 (PDT)
From: Muchamad Coirul Anwar <muchamadcoirulanwar@gmail.com>
To: jic23@kernel.org,
	linux-iio@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: branstj@gmail.com,
	lars@metafoo.de,
	ojeda@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	igor.korotin.linux@gmail.com,
	linux-kernel@vger.kernel.org,
	Muchamad Coirul Anwar <muchamadcoirulanwar@gmail.com>
Subject: [RFC PATCH v2 1/4] i2c: rust: add smbus_read_byte_data and smbus_read_word_data
Date: Wed, 29 Apr 2026 20:22:27 +0700
Message-ID: <20260429132234.30514-2-muchamadcoirulanwar@gmail.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20260429132234.30514-1-muchamadcoirulanwar@gmail.com>
References: <20260429132234.30514-1-muchamadcoirulanwar@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Muchamad Coirul Anwar <muchamadcoirulanwar@gmail.com>
---
 rust/kernel/i2c.rs | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/rust/kernel/i2c.rs b/rust/kernel/i2c.rs
index 7b908f0c5a58..6eaea1158fda 100644
--- a/rust/kernel/i2c.rs
+++ b/rust/kernel/i2c.rs
@@ -477,6 +477,30 @@ impl<Ctx: device::DeviceContext> I2cClient<Ctx> {
     fn as_raw(&self) -> *mut bindings::i2c_client {
         self.0.get()
     }
+
+    /// Reads a single byte from a register via SMBus.
+    pub fn smbus_read_byte_data(&self, reg: u8) -> Result<u8> {
+        // SAFETY: `self.as_raw()` is a valid pointer to a `struct i2c_client`
+        // by the type invariant of `I2cClient`.
+        let ret = unsafe { bindings::i2c_smbus_read_byte_data(self.as_raw(), reg) };
+        if ret < 0 {
+            Err(Error::from_errno(ret))
+        } else {
+            Ok(ret as u8)
+        }
+    }
+
+    /// Reads a 16-bit word from a register via SMBus.
+    pub fn smbus_read_word_data(&self, reg: u8) -> Result<u16> {
+        // SAFETY: `self.as_raw()` is a valid pointer to a `struct i2c_client`
+        // by the type invariant of `I2cClient`.
+        let ret = unsafe { bindings::i2c_smbus_read_word_data(self.as_raw(), reg) };
+        if ret < 0 {
+            Err(Error::from_errno(ret))
+        } else {
+            Ok(ret as u16)
+        }
+    }
 }
 
 // SAFETY: `I2cClient` is a transparent wrapper of `struct i2c_client`.
-- 
2.50.0

