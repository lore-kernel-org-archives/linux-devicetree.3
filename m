Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D93B3B1ED7
	for <devicetree@vger.kernel.org>; Tue,  1 Sep 2026 01:37:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788226632; cv=none; b=Fl+GtFpzHcaJDwNCour4zO3SLlsoAw/j4yuZxec7NQUaCPPEY1edhDxt10jZKtjywYmYjQUv6FFL5voq497AcyoKOWohEKI9iJ44OXJK6gTBGfytWlgP80PMuO/JEf9RSijkAhD1p73fj9pk+HMNQoLJOlL0MFyJJ7pfxkgcftA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788226632; c=relaxed/simple;
	bh=gWLSQTYzpRTWXwqnP8H/tU2Csjcptl2cwKKWkLyEbWQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LKsaCZ1bJN3++ADsKHIWt1LResoQ9BejKxzUgZgLsLHPzycDBhzH1LiH6JDmQYq3Vwv+tv5s6b+wpQmWCWFTQJq7eqDzuxw4KVMpqXVqY7c5G7CG1s216JS+d+JxvC8fNsPpMLfQjy5fMsRH4wzIc+VUhluMlXzisJkjvMKkW90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=KlT6UL+F; arc=none smtp.client-ip=209.85.222.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="KlT6UL+F"
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-92e99ef0902so293816285a.2
        for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 18:37:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1788226627; x=1788831427; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5jGRI8snO8C8blmH9R2yiVabxY6zDHESm9tJwnyuGAc=;
        b=KlT6UL+FNuV43NRdaE2YMZ/XQ3y2JtpKrvgbcvSW5L6Po4NpYQ7C1Gkt5ZyN4yDo9R
         X/QfQ4YnKkO3bbt1UO0UjdBlXkcUEmo6cumMFEvpmgrxgLgWNFGzA4pQyyyOQwyF1I/Y
         9QmZZ3yIq2rs2OdF7eG5Kl1kb4Qlbw47UsvjVTvoZ/EPYXSUs5FpkM8JozgKOOloB9dE
         U8RbA6nokmQDBefRFKOrLkObmQT+rXYotDbVVDBGKOL42IrVBhcZxrqf/AsFv6xqQiAu
         ftwSsrn4cfbZfiLYEp/cjHyPY0T8zUk/AVehdqtRinSIS2qZawN2CHYqktw5QSaTSFoD
         Vh7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788226627; x=1788831427;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5jGRI8snO8C8blmH9R2yiVabxY6zDHESm9tJwnyuGAc=;
        b=acme7xrAp9g/T5e1/De1vqiaClhvs6xw1Ib9sySRqjnAmnmtixPFf3TgG7BYxzUmej
         Q+9QyOOUrEkW+B/JzPIOUEGX0LWcVJ51T52JW3I3Y0AA4bSF9c8kEDsUv3XDJo1LeqCw
         uStaeSh2ei1Qtr9JedMfI8PiaF47R3Lvaf7sL8knuL/ZqrCkQEb3xYXchMfZdx8hKXOF
         Yf3RvYFEaSBey6Ii1EiI15aX+CoNNNmcszsQjd1whCJ2LDwMU9Kqpaf8mByWQHEF97jz
         FK8PBGFHzfM/cazc1oM8Onk7UvsKaYZCoV3u1KyGlM8j2kZTdJU2ss0rvuGvlo3vIMGr
         y5Mw==
X-Forwarded-Encrypted: i=1; AHgh+RqgTXehBIquzSN/n5IH9PLnqI/0F1PSGzY51uw1GosOcHna8Pi5X1F0Yzewr8+0jxqI+gEOiaLDlF22@vger.kernel.org
X-Gm-Message-State: AFuF++nGLBUQ3Lr6pu1IFbvu5hVJ7YrL6O+IACJLz8MxPoe0FH2TorQm
	HHmFfPF/NO8XJo3/HHgKEEnLXokD569jGOSayY4KDP7lB4SJGhhq8O8vzcssuEouNt8=
X-Gm-Gg: AR+sD13bNciJcySa1YXov6LYLTka5uCMMdvkCHD4t9tH6xMkrzmvOfwKXXYdyrCLfYy
	lRf1FZozEXF6lQjwnOxAx0LUuFbG8xpjcmFB2gBH6tuPOFc8aj6cnpclMXde1yBZglfc000z7/y
	gaYS+Swyr/XFmRcBrj8voHMcsNiMBQpDMKhK3sjjvcnkgBWAWjnftCaCMIiIwNiDANW16I8DNBC
	SPGMUuIEKvp9KfxIICQ/evVpCQlrbihaHg79yCRYXuY+BWTYoWDdpgovFMah8zH/wLB58UBQB0i
	xmPzyGq/CzYobKc9k95IVe7KTXwGKhA1P/8FQiVpVo6jerTdMWXor8R/oSlEcP/ND1NTluZ6yIP
	EOIYECSG/hsCaqca5SY8iP+Z1lqr4bXt5dAQTdVSfE5vet1jkcnoso2G7XvzzuWo9THrQUwNHNi
	VpYuWyFhghbx08JLvM+KJkmvUdegT4vE5ckCm4Z5ZyATJa55Hdg2OlKI5zG8J6qzBv
X-Received: by 2002:a05:620a:1d0b:b0:939:3c0:7520 with SMTP id af79cd13be357-93948004098mr760507185a.18.1788226627261;
        Mon, 31 Aug 2026 18:37:07 -0700 (PDT)
Received: from zippy.localdomain ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9391703a918sm919265485a.12.2026.08.31.18.37.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 18:37:06 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: andersson@kernel.org,
	konradybcio@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: mani@kernel.org,
	krishna.chundru@oss.qualcomm.com,
	dmitry.baryshkov@oss.qualcomm.com,
	sushrut.trivedi@oss.qualcomm.com,
	umang.chheda@oss.qualcomm.com,
	rosh@debian.org,
	jsandom@axon.com,
	daniel@riscstar.com,
	mohd.anwar@oss.qualcomm.com,
	lorenzo.bianconi@oss.qualcomm.com,
	devicetree@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH v2 5/6] arm64: dts: qcom: qcs6490-thundercomm-minipc-g1iot: clean up PCI function nodes
Date: Mon, 31 Aug 2026 20:36:52 -0500
Message-ID: <20260901013654.1343537-6-elder@riscstar.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260901013654.1343537-1-elder@riscstar.com>
References: <20260901013654.1343537-1-elder@riscstar.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Thundercomm AI Mini PC G1 IoT devicetree source file defines a node
representing a TC956x chip which contains a PCIe switch and an embedded
endpoint that implements two PCIe functions.

The devicetree nodes erroneously include a "pci" device_type property
for the two PCIe functions.  That property should only be used for a
PCI device "that implements a PCI bus".  Remove this property for the
two function nodes.

In addition, these nodes define #address-cells, #size-cells, and ranges
properties, which are not normally defined for PCIe endpoints.  Remove
properties as well; they can be added back once they are actually
needed/used.

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Fixes: 1cde54c54b83b ("arm64: dts: qcom: qcs6490: Add Thundercomm AI Mini PC G1 IoT")
Signed-off-by: Alex Elder <elder@riscstar.com>
---
 .../boot/dts/qcom/qcs6490-thundercomm-minipc-g1iot.dts    | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-minipc-g1iot.dts b/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-minipc-g1iot.dts
index 31bafa2cf51db..3e8d144f57b00 100644
--- a/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-minipc-g1iot.dts
+++ b/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-minipc-g1iot.dts
@@ -792,18 +792,10 @@ pcie@3,0 {
 
 			pcie@0,0 {
 				reg = <0x50000 0x0 0x0 0x0 0x0>;
-				#address-cells = <3>;
-				#size-cells = <2>;
-				device_type = "pci";
-				ranges;
 			};
 
 			pcie@0,1 {
 				reg = <0x50100 0x0 0x0 0x0 0x0>;
-				#address-cells = <3>;
-				#size-cells = <2>;
-				device_type = "pci";
-				ranges;
 			};
 		};
 	};
-- 
2.53.0

