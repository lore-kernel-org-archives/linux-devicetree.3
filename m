Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D0454AA039
	for <devicetree@vger.kernel.org>; Wed,  2 Sep 2026 21:43:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788385424; cv=none; b=B8msiFqtHte1xMBTQCYUeb+pEkPH7Y2B0qB+MyozHll1SBXa6rXFHFFQxwQqwaTKrUei41w05tOnCtxOwrHPc+WVUWL4zR6TK7J9i4nZav30+7028PiHpJViO+vbii29KiSxYzXF/UwXv5knVW5CBLrKGtIp+X51pS728rddMWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788385424; c=relaxed/simple;
	bh=eQ9Zy7fiFKEeKMtOVVIUKWgvDli3RddZi/DwsQZnRus=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GnUg1ZaLSv5lVNrQ72fzSvFtnC+IJlPYz7B+W+HoK9VWLUJJeub1UJ+Pigy7iOx7URZfellmaglhVDtua4yWeM324C56lgSm+MZv4epmADNZZHqCxdCkrawTmFP9XRgbNAQBVjA1hHwOduYBojDYlH9vSeKhv3HwGKVxeuL68jk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=iXBGzGer; arc=none smtp.client-ip=209.85.222.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="iXBGzGer"
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-92ed3993c1eso108912085a.1
        for <devicetree@vger.kernel.org>; Wed, 02 Sep 2026 14:43:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1788385409; x=1788990209; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fsxIaRRLmwpMLtJ5PsOHVJNZ9n/FmHMUVyfE5LlxUlI=;
        b=iXBGzGerdG2gEmQLlDs3xa3Zl87igUJsrWz1aoDPsUA1xFmOyQdkQfcsfKQnN/OeJZ
         v1CUEfQI6uNt6VlNK/2wRHVCxWHxk2U+IdjioebMzWH9TQ+AZZesA4d4YBeI70ynMdpA
         qtAR+cH3UOhS0N7kTESH7zVWQb/rh71N7+vAFWCDMYZJIvvlBIJMTwVSLF7ZWeuDQY/P
         +QPe7IL2gALG4giX5+Ak0zgV9bHbqIic39kUP75Xq8PX1PqCEUEaS8zFivD32QXMJXr5
         aWVxngMN7QG2v57oSBtdMgtn3TJ9RkOSVeuXrklTQcShX0AmCLIsb0y2Zr2DDKfTKU4Z
         06mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788385409; x=1788990209;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fsxIaRRLmwpMLtJ5PsOHVJNZ9n/FmHMUVyfE5LlxUlI=;
        b=MMvOzjIOPxEWq25ICqp6t181Rv+QS8KMuUJ/IZLmlGJiX8DiCt3elfCjblk+dqqEfW
         2Yp+UzyWj3LPtul6Hq9Q8m/RrQLMueg4MCHzkIIWtHJAe8N9JlozSDvV8pKqfeA8FvAR
         b2TZQzyZP76CzLJWBv1yMXywyQBt9n/Sgr7rb96yRxbdYioFnrCR8uuJLL7+MiHoYLpf
         KchRzqV0akHubp1sfqY9PdJJsJphAXZYgBqSvDDyfXC3hvfwlWCC1f3lob/aPXEc/obS
         NVMdF9B3sT4oJ+ZoyLAhCH3LmwUleP9CkyPiuk3REjyaIDcpwnJNIGFcn/vHM3RdiDRm
         sXew==
X-Forwarded-Encrypted: i=1; AKwUvBy2Kg9MA9WySF37n8Ilx/YiNM+4DqzWmcpebArqGgjcDLIkKbAvroh0p0xlpfS44uO6jrCo0bUQCQmA@vger.kernel.org
X-Gm-Message-State: AFuF++mts1Bfy1hLO1WrTWxQoENGZq13kbXAJIMRHqEDxYPBIdm6IMt/
	6sYeAQdiGJwPqjLa/IwqqebN0Oh3gfdB3KC31W360x8rlk9/s2eN7PNCgk0oV2Ipu60=
X-Gm-Gg: AYBFou1+1N1/3CwyRl0CA87gcKXapZbFRIKL5sl406jcXKgvNe7FOkyepmjTYWiNDh+
	VX/zRt0Vxe61oVWSLhGw/NMM/3kITj7Rxc/vaUaChB1tfAHa5ANGWRkM8mqoFNQdAEu8ZYZWGCk
	lIBtDiZjjPVjHD5MgWslyY437WDSTrGL7X0MIhqEQ/HkZ4O2xaqz72wnvUnE09SSEhY/yFG/K1d
	PTT5vevYgbssTUN+SQbNq/hpm175nmtxxbtSaD+W1q648muK6kU/K9e3epxMUQxAOYFcHnbExC/
	7Kh11l8DcuUPJNHJJw0y70uO9g+eK4I0NheqTuyG7/WoxuVksNtLYavgJ5PC8OvZ2wZwa50ARLo
	nAj2jQnWFGECYMJqzEaR743sIFh6I+T503KWHXq79FeVBAgK7yO+byWJRfoDUKi4Dm0WlKN2jSI
	iWFUEQHHfeVxSPxb0ZXhEYM6XqFM3pu1lqH30IYmSjftecJWC135ufg0tBu8bQoaM0
X-Received: by 2002:a05:620a:bc8:b0:939:6b87:9a62 with SMTP id af79cd13be357-9396b879de0mr590218185a.38.1788385409497;
        Wed, 02 Sep 2026 14:43:29 -0700 (PDT)
Received: from zippy.localdomain ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-90e9ee06d30sm28372546d6.6.2026.09.02.14.43.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 14:43:29 -0700 (PDT)
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
Subject: [PATCH v3 3/6] arm64: dts: qcom: lemans-evk-ifp-mezzanine: clean up PCI function nodes
Date: Wed,  2 Sep 2026 16:43:17 -0500
Message-ID: <20260902214321.1721477-4-elder@riscstar.com>
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

The lemans-evk-ifp-mezzanine overlay defines a node representing a
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
Fixes: b64abb26a2916 ("arm64: dts: qcom: lemans-evk: Add IFP Mezzanine")
Signed-off-by: Alex Elder <elder@riscstar.com>
---
 .../boot/dts/qcom/lemans-evk-ifp-mezzanine.dtso      | 12 ++----------
 1 file changed, 2 insertions(+), 10 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/lemans-evk-ifp-mezzanine.dtso b/arch/arm64/boot/dts/qcom/lemans-evk-ifp-mezzanine.dtso
index 6cfa0bc1440e9..e42314c648579 100644
--- a/arch/arm64/boot/dts/qcom/lemans-evk-ifp-mezzanine.dtso
+++ b/arch/arm64/boot/dts/qcom/lemans-evk-ifp-mezzanine.dtso
@@ -271,20 +271,12 @@ pcie@3,0 {
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

