Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1EED3CC323
	for <devicetree@vger.kernel.org>; Fri,  7 Aug 2026 19:58:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786132742; cv=none; b=apqJ2t7WQAosNo46BdQgtIrOPoG46/CN72LM3D5wJ744tTYsLr/jUcq+evxRV77vgJL1dIVb+FbEkofUquPJxIDBsVoopekBJodkFC3J0oDQfmsPf8D0VFXOt/IqjUxfRYZ+13niHgml9CYydDXnncge4CA4RzhLvtsxp5oTwlw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786132742; c=relaxed/simple;
	bh=QiXDP5a/p9iG4MitEVx5J5d3MhyHsUrvD44Z2yG4aDE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cxoI63kpYbXr1U1WWxo/SsJxo8BIVk1YYPZetFYanwXy70O/Tc0gj14FKmdM6SyrujgAoeu2bWlfd4P7SUP3GlKiyVqMt328XuY2Ch0XFWpT0QBT64KmCKgonn3tPhJoHMfeOcegueufmBqhfePXSy48JM+6ZPTad0JPArXONb0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=Usaf0nw7; arc=none smtp.client-ip=209.85.219.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="Usaf0nw7"
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-9030f8ea3b3so31367626d6.1
        for <devicetree@vger.kernel.org>; Fri, 07 Aug 2026 12:58:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1786132735; x=1786737535; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fDcofZ4S8ZEPXUXp4lQuVMHLOZNcIGHwYtKwcoJ453M=;
        b=Usaf0nw7rW2S5zvygIN77eD9WudsIVv3xw7JvYq/O9XSocmMMnV14KhgKBfk7HLYkH
         wfhGuTvMIw/xAC30u0C6tGtXa+kmltNjTNog2NYPbFc8NoAQ95c66Dxv5Uz1y59kMKDQ
         2k0LZ5slB0pj+/914SRNUVOxMMvnVPcYXUYAgjZ1f4fCpWbFks2+DXTqGYBAweIl0Dwb
         rtExk0yfspcIKdSMI15BloVKPw2uHjBSahMKuH5EznbXHHuTvDtYTysgoBm68zxVZj9t
         BdtASsnX4V0HSTMiB67yYFvN24LHPMtYTn87G28MQFuWsEK73Md/NMj1mEGUAu4+3Uj1
         l7Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786132735; x=1786737535;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fDcofZ4S8ZEPXUXp4lQuVMHLOZNcIGHwYtKwcoJ453M=;
        b=MeTDfH4GABRLUOD4nf+C3qLvrGnMciHWIdaIugGWHb/OBPcewtKenQ5ixUUlsKGgwC
         ZQpVQnYRiZW47w0OE+2xxNXZtAv1cp1GIgujFIw6YYa3VGeMV/1cpxUETu3dbujEYv3W
         K1C8so5/59Qm28X6DKolrxOd6mgjqrbpR0POr6LqBBy9H0EP/FH4Lc46bIFW9PtFB+HX
         Lj61a5dZdZiR0xK+kCyE2753phGC5081p75EqIOlfj1Sum0X6SphKBZJC2bF8TV7vwmM
         ZJCt1zarPg69Ohcuh0tm9U7hY2AXRiEfaiB4SWPHZAxQR7WCn+ZfsbhTOiqBEVHHJP7b
         AeuA==
X-Forwarded-Encrypted: i=1; AHgh+RqmK3QWEHKx4IArAC2dR1lbyXbZTZsl8PA05rNMaGQCtb2doXDMnEqwnA4cOMf1Axvlsc6ock8GffCs@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5hxr0gDg/0+hMijgymayjLGeJcAs2/oDf1t6laIOGlK6uO/Q6
	yII/jmQh7DF9hmFdjnm2k6kSOzzxnAEQQ4UnemUd3qf/Awgv3HSZaE42v14Ee6XqGpk=
X-Gm-Gg: AR+sD1123i+ZWmFUnXk49m0tZFc0GLjiidqty4EaW/TIZ96fRDa8s3n9t6C0K5CUIc4
	6moC6Z4rQez1sp/1Ae/j+BwOxCbeh1r5LCSgtvU2gLPOT7iMsCnuvubes4+fhh4mA49iah2nPPk
	ChoV2RJhBhLJ9NmaJ6PpT0k9DHnmWNy7wYG3K4kMBsEUhW2wUk8XKsLwe81ypkSyR4m87xLFcJz
	JC4GXXQcCtNPCctNGkG3AhhbGXmvKW3GPC0/lXiJ2mft4QH9F4QrHcMBA8ezGBJfYmf7jjcPMDm
	Mqtl8Kkbmlh+XXo3rzRlQtRBeoHwiZJ7xfW4wF+FilBgWLvM3KAoIkq+RTaminLZ8rjhWRiuq3p
	nnR+zgB/PXUKwt2jAK1T76FJSj6ka/WCt+TrdFYNfmK4BoqxJH7VOG/GKR5NV59p9sYtbVZl5Dk
	td8NGKTjxPhlGC4dplcwwr1mjAK7bfuCtKdLvrYXWTDASiTp5YOVANi+1uf4fzO5cPNWUry4zOT
	Tk=
X-Received: by 2002:a0c:f099:0:b0:908:8f6e:52be with SMTP id 6a1803df08f44-9088f6e5917mr214892616d6.15.1786132734818;
        Fri, 07 Aug 2026 12:58:54 -0700 (PDT)
Received: from zippy.localdomain ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-908a92ff366sm15824226d6.32.2026.08.07.12.58.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 12:58:54 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: andersson@kernel.org,
	konradybcio@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: krishna.chundru@oss.qualcomm.com,
	dmitry.baryshkov@oss.qualcomm.com,
	mani@kernel.org,
	sushrut.trivedi@oss.qualcomm.com,
	umang.chheda@oss.qualcomm.com,
	rosh@debian.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 4/5] arm64: dts: qcom: monaco-evk: clean up PCI function nodes
Date: Fri,  7 Aug 2026 14:58:43 -0500
Message-ID: <20260807195846.456079-5-elder@riscstar.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260807195846.456079-1-elder@riscstar.com>
References: <20260807195846.456079-1-elder@riscstar.com>
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

