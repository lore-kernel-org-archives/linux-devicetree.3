Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A17243C1F57
	for <devicetree@vger.kernel.org>; Tue,  1 Sep 2026 01:37:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788226630; cv=none; b=fSc5QLFnobf4mATiE+FrzhiyvRIiUUsdCOJbRBqPbm2fFmtvWzwpF+Qi2cWfuvJ4Kj90chPOnYXZxuvNnCHMBLiiJQSvgcYvC4ydeo9msANQPAhtNaFtKylUwEy658g4T7l6YgLUGZNaPZlFSMjEf8daEgxp+DoENdDlojSoT8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788226630; c=relaxed/simple;
	bh=F4uRNuOP+2KFkvrPkqUx+q/oV97b0GVrD9D00eeSPPg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mrIr2Z6Paa4ff7Hffs+4BVjlpYDFO4edv6LVpvWluwtW4FtoCYR+E4gjS2+94fAP/iR8CInO4VhIOrXFuO6HJQqSV+u+yJYssvonlDicbusL8rokPBsT+NrxXS/d0/1tGc0kM0yp+TXXbhniw2B+q7J/gs6QRthWRSF4zceZdyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=U5uqgJTy; arc=none smtp.client-ip=209.85.222.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="U5uqgJTy"
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-92e55b62640so260739785a.0
        for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 18:37:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1788226626; x=1788831426; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YYcquwxkbINl1+Lmd2DxlHXKbpatPe7WMleZZ+FNZlg=;
        b=U5uqgJTyYTN20/WhFcR7vVlhCDRWgjSP95Vyqctqy8x5qvBM/cq5qJ1CJxKfxnKCUd
         Wxv7H0YZ9DNnWlqFZusB6eZqasj+7H94+vJeqsJUb3bsZ1cIzRb9NbLBdtKZD94g/3Wo
         MZsOc31m2neosMp/sSheC5VvaOkoyAXuWVcZEoqM9G64RzfQT6EZJzQiEl699putfCNz
         lmWztcOCT/LnxA7gHMTaeCgezr90laq4xxJ09UJEpxA+w5nBr55iNkbXmfz48+2s9TVq
         RNwYbNKgdBaozH7jb8Z5tUjgUHE4cl1jdrcdn5rP0nFJHPcMeem5/Fus4W4F2Leaye/7
         PSYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788226626; x=1788831426;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YYcquwxkbINl1+Lmd2DxlHXKbpatPe7WMleZZ+FNZlg=;
        b=F8K3EwylyBPrCDtOnaoiBr5OZ6KSFCS/dovVlmk4noFnf+dTV9llINdbIVVbs5Q3Qw
         By57e3TvMuc6QhnKPxdmQyhaXd/SRuPQreg+l885x/rg5mTakF3DivGDgthy8GxKaues
         /12HWySUkDL20TQJgv+NxG8mrycW792Goi7VHOGIVc98EbzEKcnxuymW0NXr0tiAhKWP
         HnJrZ1mARQXTsHn6HIfPgsV26DE28sb0BBcRFoG8hxeARA4FvIRtvB10C1tbx5eWIqQc
         ftOeRF+dyF0SRQtqMuqYRnaYu7V460n17I6Z6tW7iHQ52JSD5q5ye2gHC3XocGwmKW2Q
         9ulw==
X-Forwarded-Encrypted: i=1; AHgh+RrwEuEtyE/GhWNH9Rri3V0LoXfzePbO6Uts/1+TH9fwRK8CqjBUMZ9lJb0M6JMEYimijMotDwi0ovKH@vger.kernel.org
X-Gm-Message-State: AFuF++nb8a1EebOM1ThmW7i2LtFOcpKpkpyKiJfjsvLHQGeoa6ZYCYuW
	Rvugb4MO1K4a20le5YXiLuBkRMO3wbcwQT83ayt9jQzX6KBCDZkp37lToSj2sr1ZcrM=
X-Gm-Gg: AR+sD11QfHI1fmulllOF3CZSgYiuCfZVh+zSVWlf4VX1IfXlXQskWp41jqQfJpuOqL2
	fE1uh5sDcZsZ30JJYilsXUKQqK5a4s3zPD1c+JtL2aotiXVb5iAPSAavWIi9dqb07L/Jw2Zx5rn
	3TyPjw1zix78k87XOZ30QkzNnfZRvkST/SHkV3pkwjZa0vqsxXNoOSe3Rfi5UEoaq8BAtKu7iN8
	5zjwfKEFCFDfgX8GcKAb4MESApdza2m5bSBZCJzvUti+XSXJthQJgAw4liHVoH5yqfGochFdsnN
	n4h+YV6JOcoj6S5ZgWKuyjySykXMau1/9/LhpAdnu5kQNWAfrrOormpZYWA4netBHEKNMPBwTdH
	I6OdsE66Lc1Otp5hYZAw11IWNmNhKzW3pnuosYOP/oFLf1FfDUzNwvjvsJ6vMncAICMpa941/Xa
	D7EDHi2Gnfsqf545h0XtmyuhHpvEI/nHwFTPK8GeJK/yDrqsFnY98CJxpsGCpIPE+M
X-Received: by 2002:a05:620a:4686:b0:939:1864:343e with SMTP id af79cd13be357-93918644403mr2684993385a.40.1788226625629;
        Mon, 31 Aug 2026 18:37:05 -0700 (PDT)
Received: from zippy.localdomain ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9391703a918sm919265485a.12.2026.08.31.18.37.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 18:37:05 -0700 (PDT)
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
Subject: [PATCH v2 4/6] arm64: dts: qcom: monaco-evk-ifp-mezzanine: clean up PCI function nodes
Date: Mon, 31 Aug 2026 20:36:51 -0500
Message-ID: <20260901013654.1343537-5-elder@riscstar.com>
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

The monaco-evk-ifp-mezzanine overlay defines a node representing a
TC956x chip which contains a PCIe switch and an embedded endpoint
that implements two PCIe functions.

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
Fixes: 5a67924d2fc57 ("arm64: dts: qcom: monaco-evk: Add IFP Mezzanine")
Signed-off-by: Alex Elder <elder@riscstar.com>
---
 arch/arm64/boot/dts/qcom/monaco-evk-ifp-mezzanine.dtso | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/monaco-evk-ifp-mezzanine.dtso b/arch/arm64/boot/dts/qcom/monaco-evk-ifp-mezzanine.dtso
index ca5bf0fe5ec6e..9b5e911b83210 100644
--- a/arch/arm64/boot/dts/qcom/monaco-evk-ifp-mezzanine.dtso
+++ b/arch/arm64/boot/dts/qcom/monaco-evk-ifp-mezzanine.dtso
@@ -119,18 +119,10 @@ pcie@3,0 {
 
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

