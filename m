Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EAAE3AF65A
	for <devicetree@vger.kernel.org>; Tue,  1 Sep 2026 01:37:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788226626; cv=none; b=CmI2llfrzwSfN4jbW9m6H7/Vy2h37I14o6u4QocwlQF+1s5gZ5EPdjBdSXAAOJfYGhhr6mTkcICW8yMrf/dIZU/CLGzO6Dv7Nw6Jz4B2pqOaxSxVAzR9tNqD7Aehi1bGUurqzxRBej1r+UefDAxeQ96jL2HWIQargb4RfuwTsLo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788226626; c=relaxed/simple;
	bh=ooCrCfo7oLVOrvAobTBfT5HplE+C8HQJo3SAieGJjk4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AwGckvgeZ69nWcso7zQao1NwmzympbFWEEP1dQwYPi1Mw9xnlCI7ACjhvqYtkl/RABRBkSnYD0FCUbTZFUTGIDAZ7zli1IuRpa0WjrLe9V8GJhy63cSfpoE9PNTpOKfX7P4o5waYxjlK9u0KxMDbLMdVme7wR2S322TbRWKHEcM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=hIIsHE+G; arc=none smtp.client-ip=209.85.222.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="hIIsHE+G"
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-9390f8a1c9eso294861885a.3
        for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 18:37:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1788226622; x=1788831422; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QNTyYnbC0W+gwozSIufWIpELF6tjMCW60rG99iaQh1g=;
        b=hIIsHE+GlQdcBwdsmmTUkAsdM4xtoLNkarcHdbLGj5FXaQ1aXrFIDDc88rU96dknNN
         l01mB+okJ5Wsortsi3CkgairRmFpoAvniWwqORhRem+5m3dkZXgpUQhjJSk2nRGNtaX7
         p6YkKqP024up0YvksMdGgViCFVcsH/XQhk2/oPNHiizLX3SbnRY0Fe6qt9K3AdrZg0ak
         oGPPAB7wC8ZJ5RgyVgqSR7Z7OgSTjggh72y/waSc+lkum/a/mrOyjPVpfcCfXuDTSoUj
         oKAyx6JEJuPiwALgh3h38W3hkyjl2CVRvtCqNLY6N0k0TjV5MFyE3iqUy8OsXbXIysmJ
         PG6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788226622; x=1788831422;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QNTyYnbC0W+gwozSIufWIpELF6tjMCW60rG99iaQh1g=;
        b=L3UUYzJE5PgZEpbD05F2JgxCqUUKVVARINkVfJhDrkueOFH9CfLNx1CcORLqF4rigd
         sUeoU8Snbb3jS2z0UXksqcVCjPofLrBJmHuq1ME485sD9R6LH3/ILoojs5prJtysM6aw
         BLgG14DLrJqyRVsDdu72sep3Ng1sbHHAqNpH9SvmG4wOcTnQpqEWoaaIw9tNzTNEO6Jr
         Cxy3RTivbS7tmJvNflonBVTdHyT+OEs4uvhPLYv+a8BIBp2X79H128F3Do+NGCqtFODj
         RYO0WXwKS+DpDWDZHVRLan4HaeUDodkqNWFeJk35OYZYyw984j37nCjHR++rDNRr4MFp
         qZPg==
X-Forwarded-Encrypted: i=1; AHgh+RoiWNP3y6mfBzoPGNXerhUkH9x1bN2nfEer7wZvEbyWlUyUNDYPABeH86yyktYgw8GciUGcpMA1HA33@vger.kernel.org
X-Gm-Message-State: AFuF++m92oTzu2hcy6xeOQrFlNb2QEIvY6O6waGClQUG8czUAfckr4Wp
	ybRAptehgTkzUrvY6UK/6YzI0SFIFne3mZm2DsdIclRjoX4pgatLaWKWU0bWAFe0nI4=
X-Gm-Gg: AR+sD11UbacwZuRsBXTbNqhhORUvtjtaxMBEmJgE5dPMLOnrn/eC9XVj4NBKgAJ0exQ
	hEFBTk8A2QW3grsX93Ojyt+cbGWJzCnmsNaFc7LyC08dXmSbas9kq70r/brs62Q0AAA1mCQwkHG
	n+fxpLL63foj4noy8+X3N6wNXo+Zs7lbrWUlAsF03CPtRTa8vYmwllcd8DH9pAZ7+twS+yh1z3r
	RJDzqaBtir1nE6j8UdubG4aQHw50SpiFPDEI9n2k1RsCQpiC4uM0qmXxYqeHKbBpIlzVyC9TJWq
	nbEwf3vnoaGZ9y0XZ95A5gyKM9+vndlg2rP9thm0TGGkyklgZwUz/+AyViKel4HcJZscf7A/k3V
	aCF253CQDezS1oN3+qZV/vAUmg0rVZm/FduoxB/kWprse1GqgDI6qUM4qEQDs5j7W7sr3o3HGhS
	6MU70fFeBHLxOi+TTaguX4xNVray2PK7ZaxHJSn7oKeFWeJ1xo+FD3J5vx4GKNLwZM
X-Received: by 2002:a05:620a:440e:b0:939:34c6:a333 with SMTP id af79cd13be357-93948135358mr651883985a.40.1788226622264;
        Mon, 31 Aug 2026 18:37:02 -0700 (PDT)
Received: from zippy.localdomain ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9391703a918sm919265485a.12.2026.08.31.18.37.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 18:37:01 -0700 (PDT)
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
Subject: [PATCH v2 2/6] arm64: dts: qcom: qcs6490-rb3gen2-industrial-mezzanine: clean up PCI function nodes
Date: Mon, 31 Aug 2026 20:36:49 -0500
Message-ID: <20260901013654.1343537-3-elder@riscstar.com>
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

The qcs6490-rb3gen2-industrial-mezzanine overlay defines two nodes
representing TC956x chips, each of which contains a PCIe switch and
an embedded endpoint that implements two PCIe functions.

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
Fixes: 4559b435f741b ("arm64: dts: qcom: qcs6490-rb3gen2-industrial-mezzanine: Add TC9563 PCIe switch node for PCIe0")
Signed-off-by: Alex Elder <elder@riscstar.com>
---
 .../qcs6490-rb3gen2-industrial-mezzanine.dtso    | 16 ----------------
 1 file changed, 16 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-industrial-mezzanine.dtso b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-industrial-mezzanine.dtso
index 46bb52c667a4d..82c4d47fc2aaa 100644
--- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-industrial-mezzanine.dtso
+++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-industrial-mezzanine.dtso
@@ -132,18 +132,10 @@ pcie@3,0 {
 
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
 
@@ -227,18 +219,10 @@ pcie@3,0 {
 
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

