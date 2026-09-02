Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E5424AA595
	for <devicetree@vger.kernel.org>; Wed,  2 Sep 2026 21:43:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788385420; cv=none; b=obioA4RDQGiFAkslRodlIJiVFuRrevUxA1KaSSPC1MI3uF29l/c/fgkfcwN1Pk2Z8atAq+QyBoqxmVUkQHuR2fHmSymxs6HXrYMALzZXRs88ieGzO0NmW8XalquYKZ1nr/ZROx9Ze5S6lFXOfzDyZqqMfXmcAYvNDacx/kYLk1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788385420; c=relaxed/simple;
	bh=9DoePrAAT2pHQcCNh17LMiEyk8hU6ueOgPJ3ghTAW08=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=r47qqr03dwaKDBOOAn4q6yJSoms+pFUL02E7bE6KBLZta9oBMtFx750rYktKix9XU9GJvsxKOZy7Y5+FPrGbn0VTwjyamjqguli7MIVhNVRrjAslTSn82Lq2fYh9xBxzmyXB87WyNP6bZYrIoGAf6oAnOil+tQJQsIfv0R8ZO1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=0JBaLS7H; arc=none smtp.client-ip=209.85.219.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="0JBaLS7H"
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-90e9e042ee1so17731036d6.1
        for <devicetree@vger.kernel.org>; Wed, 02 Sep 2026 14:43:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1788385411; x=1788990211; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Yza9D0ffScBd6nt5AlUPa1owLlRxXSrXmCqLbjeXPMI=;
        b=0JBaLS7HuxZycRWeqbzmQN0PoG4ng2/8NooWa5+CveaXXkt2Mf1c1Wi8B7duTRF46Y
         UnFBm3BJj1PLvE4sVlugjxpQYAc5wf3C5NHt+G0TVrm8mAe7cj41A11PPeoHfTvCBS4N
         jv3u+EJwL6CvjC18w/S/IQOrVCgErLhBKJ9oXWpj4RLyGrui/8vXxFosH22e5BdNoEts
         YXNrEV86F60tnm33wwS6pTtGvol4c6V4nLYRH0o20k2yHxZSXTT1L9ih7sEJBQOnH4kR
         9h6uLO0uUupFjUTULtT7KabxenKqnIwPrE/Ex1G6ji4/bBCdxOvmsfAuuHmxi2/kYJsB
         feCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788385411; x=1788990211;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Yza9D0ffScBd6nt5AlUPa1owLlRxXSrXmCqLbjeXPMI=;
        b=eV63G7hQ+HkdPcWbSRUqvW/PtefFldw5iDVijy8YAyA/eM8dU81P4EeBDq7o5Tvs9P
         VrJsKOCiP9OYghQCGH9f35l1dkvoIWUJrrhOMz4H8S2b1ZhLtfNvfIEkInywtDJPfXpz
         SbkOV8IKnVFgc1OB+lLLmegONZiDrYZ0nVrnDmtlnQGD7bq5aYibA4Y96RMNHzCki7Ee
         cF2p2cOIWXFqZV3UGIEf7HwbSrlxAZ1MdqtycKrpwygpFQTm66PEn5OWmIoaGJDMY7ZP
         Dw8Ju+h02wGMrQVvxuVWP1ab/W71EoP1aO3KE+0maYbAuhvVartOBHHNlwtuyqlh4vET
         jd+A==
X-Forwarded-Encrypted: i=1; AKwUvByxcHuQ417GU7i4QATjHkR3m0lOVin8/eu+lOTX8btcUWAoY3/FY35qL9we0sJfoOgZbh/VnZkdL8SZ@vger.kernel.org
X-Gm-Message-State: AFuF++nUUdj+oRQlN2lY4LcdT47xyp3aN2wlWN2HCGIqhTQfRZohA/rg
	wOFv4NHj8Jl/KXxezgiqAbXCuKSSfhKjzg2ZrrlNrxLywFKcD2ezs91OuExjuJPMmwA=
X-Gm-Gg: AYBFou0U0rmqK5elSAydB6O/9joM05vW8VM1RgM7nXrqEOw8percc5s3MVp7VBrj+ip
	AHJAiyv4NKtwwm/nKTlQCL9dAQpeuN4iAHCnLJoBoUfgcSHwZ9rTXBcYlhuiywTU2JNZ/o245Fi
	aCAOD+KJYO0ezYFM+2KU6T8/4NYTcw/bmXOeh5QEFJgcZzCWYlUKvvhmmn8Hxy1M9F5/aaYh9gF
	C5DuHAhTnMpbmhI7wHOO4pZsAaKsIADuTB6yRNvVUEAki2c8iCpK0SYqeFfKkJjIg69ZUb7ajMN
	VS7ykF4fruFa0ePEh0cyw+PkR1U8Emszp8ECS9d7YWT5KB9gZkzdY9gRz2tlO/EnNdcCANGH0HP
	a1sGQg70Gk5OaD5S+zkGuzQwkVhQQNN4H2GPxrMOg/L0YPT7OJndIvVyZqjz9U88sNJQfbL0zrY
	m0hOWIYXtmlZ+pSAAOuJY9RuLEAEsux/gmqf8B02JgTYlLW38qM/UvHFcmBS4tRm2i
X-Received: by 2002:a05:6214:f61:b0:90e:9361:d035 with SMTP id 6a1803df08f44-90ebab8194cmr94657936d6.21.1788385411027;
        Wed, 02 Sep 2026 14:43:31 -0700 (PDT)
Received: from zippy.localdomain ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-90e9ee06d30sm28372546d6.6.2026.09.02.14.43.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 14:43:30 -0700 (PDT)
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
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Abel Vesa <abel.vesa@oss.qualcomm.com>
Subject: [PATCH v3 4/6] arm64: dts: qcom: monaco-evk-ifp-mezzanine: clean up PCI function nodes
Date: Wed,  2 Sep 2026 16:43:18 -0500
Message-ID: <20260902214321.1721477-5-elder@riscstar.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260902214321.1721477-1-elder@riscstar.com>
References: <20260902214321.1721477-1-elder@riscstar.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The monaco-evk-ifp-mezzanine overlay defines a node representing a
TC956x chip which contains a PCIe switch and an embedded endpoint
that implements two PCIe functions.

The devicetree nodes erroneously include a "pci" device_type property
for the two PCIe functions.  That property should only be used for a
PCI device "that implements a PCI bus".  Remove this property for the
two function nodes.

In addition, only PCI bridge nodes should be named "pcie@" (or "pci@").
PCI endpoint nodes are typically named based on the functionality they
implement (e.g., "ethernet@").  In this case, the role of these PCI
functions is not (yet) specified, and furthermore they will be used
with PCI endpoint buses.  Rename these to use "dev@", following the
convention used in of_pci_make_dev_node() for dynamically-created
devicetree nodes.

Finally, these nodes define #address-cells, #size-cells, and ranges
properties, which are not normally defined for PCIe endpoints.  Remove
these properties as well; they can be added back once they are actually
needed/used.

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Fixes: 5a67924d2fc57 ("arm64: dts: qcom: monaco-evk: Add IFP Mezzanine")
Signed-off-by: Alex Elder <elder@riscstar.com>
---
 .../boot/dts/qcom/monaco-evk-ifp-mezzanine.dtso      | 12 ++----------
 1 file changed, 2 insertions(+), 10 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/monaco-evk-ifp-mezzanine.dtso b/arch/arm64/boot/dts/qcom/monaco-evk-ifp-mezzanine.dtso
index ca5bf0fe5ec6e..4f727ff6ecb61 100644
--- a/arch/arm64/boot/dts/qcom/monaco-evk-ifp-mezzanine.dtso
+++ b/arch/arm64/boot/dts/qcom/monaco-evk-ifp-mezzanine.dtso
@@ -117,20 +117,12 @@ pcie@3,0 {
 			ranges;
 			bus-range = <0x5 0xff>;
 
-			pcie@0,0 {
+			dev@0,0 {
 				reg = <0x50000 0x0 0x0 0x0 0x0>;
-				#address-cells = <3>;
-				#size-cells = <2>;
-				device_type = "pci";
-				ranges;
 			};
 
-			pcie@0,1 {
+			dev@0,1 {
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

