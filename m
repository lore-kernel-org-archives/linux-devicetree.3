Received: from mail-pj2-f8.google.com (mail-pj2-f8.google.com [74.125.227.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97E8938D401
	for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 18:50:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788202258; cv=none; b=VTX0pVx8WM+gwZ0faRDfik7K80iSEf9LOm6qlbm0+L5IDN5EmMxkOfr6sii5q7F/7ne2eBpueK8sjKHcbDK0Yn7EyoRZ+3pqsgmXpIztHaRHzm4cdKYd7uprLFpxFOUqc+m7k46j8d+nm3AiTknDxvwgQpwW2K9YBYNJRPcak/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788202258; c=relaxed/simple;
	bh=6hryHCIPCjgEQiYN3dv2fRXZ1WHHrAlyZRiHDL/ExVs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OVQyNsCArkbC+bdAnSI63Ez54M0Lp3UQmwFxILmqYZ/G0GIP2Kh7d9TUTyKH9jYyhKPu/wYff5n9yAK/iJRXcdhJhe7KhnDV3mW8Vn8v3lVz1lDUqY/Q0DkaifuP19PVsLJCzvgf+q9H0VKMKmVHMHft558+a8tyovrhPvf506c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H8+iA2r0; arc=none smtp.client-ip=74.125.227.136
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H8+iA2r0"
Received: by mail-pj2-f8.google.com with SMTP id 98e67ed59e1d1-398b9f722abso709576a91.0
        for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 11:50:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788202256; x=1788807056; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SU8TMnAJdFKhQ7rwVc1XtCTGG3xuVljaOpUMOXRsDlQ=;
        b=H8+iA2r0dXAz5s57zGwnd3Wsaofas5QSthjp04Lro/l3qdi82IQSxIS0kIzY/BLsuu
         7iJWlayHGLKeBtqanb0a6D2wawGmBeRiJMxAbtnMJBOHISYTWEooh3pslg3a3caHJWMk
         fbwmk5y+CRAUQ7i2poa2J+oh+6C+GYW3/oeSlveGZsrfQ8V4onOa/6XpLcZYSQ3snfJ1
         eZF9u/HKtjp6Mn86Ez1hGEHfdoIwdCvKhD8YrYBsFPPf2BWPmzZjd1aceVw5yuqc6oNB
         ZaKhuG94bmeuzPaKI6zUZuqbp/KsLDLX/JNhkoLC0y8RRpgE3iJuEqz0O7AkzvuZKG1y
         8O0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788202256; x=1788807056;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SU8TMnAJdFKhQ7rwVc1XtCTGG3xuVljaOpUMOXRsDlQ=;
        b=PO3H0ZzJrYa/h2XsMl7ylXqDyDhq1JzlhGDD15kJ8hUSbQz+/jtsrcSlfIl3YZjFhb
         LB6cJEYKeEukXmnUGxdshu2XAaMsC0hPR1A3YvNOIa4oIEBTHX5JWcll0xqpECFGrYww
         si7zopd9r6hZWPJ9D7+8gjnKiSQhQVF/hyRlNPicQWpfXijIRGr+SSIvsYaLI0TQCLYF
         g6S/krpA2BBBQUodqfI/BoLb9TeOnmfvdxUZT/rdeiJ/EjZX145uTFmZImt7IDZzLWjH
         2/6ukbzFSqib10VbYOc1BnJm/LYT56BcIq11KuUSPk7W/a1ghMuUYyoBqLzjCycGFIqC
         ihoQ==
X-Forwarded-Encrypted: i=1; AKwUvByugZbbY0FiRmD8HYr9kZ7YLsvlIJfr4k136s/SnoXQGQReiGyxPz6IJ7d9nkc8RMHZNLzuALFzrbKh@vger.kernel.org
X-Gm-Message-State: AFuF++nW7Lqu0GEjok47vZCMkoTgZ1XObOkkxj9/ZHcKScq49jScFdv2
	rp5Cwd/hW1MSDKh+XzBQQ78WmN8lO7LvBB5J3wOEA4MGcieuS0IqGjjz
X-Gm-Gg: AYBFou0durjuGua3clvUlAcjwzoOnueNy2527XP+w5IufK3LAxf3LeitnkqBaer//EZ
	jMf3ZF+x9HNy9pP6Ad6lBCWfUuyZcJt7PURy3g088/ka/y3VeHDcGuPbuvWcD/8VSagYqkL87s7
	FvVC9lgjIGBY0F10a+CjhgA0VO5XAAQTVhQk4TrHnRQE/0vkQmnjbWIzMRPQKue4yxjEtPLq5RV
	tQrvkSjKtTQ4Va6XHbSU7ctNg/vGpBlXadwL8t/AKat/t4nER4IRF6e/i8w0z4dUkh1eIZ2sJY8
	+66/bAqleFtcZLYrPEM9qey1pn3r8yp+wNWoa1iynYp2Ctp/CXlj4xpRLYwxZXQqZU17GI9iXDF
	cYB1Bvc+YaScIboqW8p8KC+voF04UclfkXdcOqkgjbzwEmPFjrlKESX5s303DvuU2H87Uz8SmEC
	SjcKB/aD0VN7yyqznuUuccoMX4DQ2TiZl5RSuLqb8uKfOvUozBNAJRwZ/xbq0BHEkB1o4BTLgCv
	EFDfraa
X-Received: by 2002:a17:90b:2884:b0:398:c3c9:d0ae with SMTP id 98e67ed59e1d1-398c3c9d103mr19100460a91.0.1788202255729;
        Mon, 31 Aug 2026 11:50:55 -0700 (PDT)
Received: from DESKTOP-M0MLFVC.localdomain ([165.99.41.159])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-142e0dc854dsm29459223c88.10.2026.08.31.11.50.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 11:50:55 -0700 (PDT)
From: Shehryar Ahmad <shehryar.amd@gmail.com>
To: jic23@kernel.org
Cc: nuno.sa@analog.com,
	Michael.Hennerich@analog.com,
	dlechner@baylibre.com,
	andy@kernel.org,
	gregkh@linuxfoundation.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux@analog.com,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	devicetree@vger.kernel.org,
	marcelo.schmitt1@gmail.com,
	danascape@gmail.com,
	Shehryar Ahmad <shehryar.amd@gmail.com>
Subject: [PATCH 3/3] dt-bindings: iio: accel: adi,adis16201: add adis16203 compatible
Date: Mon, 31 Aug 2026 23:42:01 +0500
Message-ID: <20260831184201.34416-4-shehryar.amd@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260831184201.34416-1-shehryar.amd@gmail.com>
References: <20260831184201.34416-1-shehryar.amd@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The ADIS16203 has the same external interface as the already documented
ADIS16201/ADIS16209, for the properties covered by this binding
(compatible/reg, the DIO-based interrupt pin, and VDD supply), verified
by datasheets Table 5, Pin Function Descriptions, in the respective
Analog Devices datasheets. Some Auxiliary pins differ (e.g. adis16209
marks a few pins DNC where adis16201/adis16203 use them as AUX COM), but
these are not represented in this binding.  Add adis16203 to the
existing enum rather than creating a separate file.

Signed-off-by: Shehryar Ahmad <shehryar.amd@gmail.com>
---
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

Previously reviewed at:
https://lore.kernel.org/all/20260812043506.456ced6d@jic23-huawei/

 .../devicetree/bindings/iio/accel/adi,adis16201.yaml        | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/iio/accel/adi,adis16201.yaml b/Documentation/devicetree/bindings/iio/accel/adi,adis16201.yaml
index b6ba7ad1a..3ce5fb1be 100644
--- a/Documentation/devicetree/bindings/iio/accel/adi,adis16201.yaml
+++ b/Documentation/devicetree/bindings/iio/accel/adi,adis16201.yaml
@@ -4,21 +4,23 @@
 $id: http://devicetree.org/schemas/iio/accel/adi,adis16201.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: ADIS16201 Dual Axis Inclinometer and similar
+title: ADIS16201 Inclinometer and similar
 
 maintainers:
   - Jonathan Cameron <Jonathan.Cameron@huawei.com>
 
 description: |
-  Two similar parts from external interface point of view.
+  Three similar parts from external interface point of view.
   SPI interface.
     https://www.analog.com/en/products/adis16201.html
+    https://www.analog.com/en/products/adis16203.html
     https://www.analog.com/en/products/adis16209.html
 
 properties:
   compatible:
     enum:
       - adi,adis16201
+      - adi,adis16203
       - adi,adis16209
 
   reg:
-- 
2.43.0

