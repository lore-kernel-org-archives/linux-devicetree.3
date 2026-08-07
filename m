Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1493D3C3F51
	for <devicetree@vger.kernel.org>; Fri,  7 Aug 2026 19:58:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786132734; cv=none; b=JaLSW/WnGjC453Ot3nLYAdAmovnw1B/an9UzUbOBGTYPP/9asAZ0nySeJDVvPmgIJXPQ9Hdh1ZdnrUxAUR40WVidgx/bur7hPdYKZe2m0Km/DUuwmi3Y7Uw4Qh2Tq9m1OIk7Heb8iEVCyVQAOgYX9OpCUPf5K2LM80xTOTH4/L4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786132734; c=relaxed/simple;
	bh=q92BmS1TMU4fA8tTbEfubmt9qSqkiCe5co5TbaZfdnM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dZfFLbfQmikJSbthNYSCRTJePlj4hVPcc22pFrS5wDdWxF7K996YXZacMupPy7t7ekVtNQrHz3Czd+qwWJSKAzSJK8UUKSaTt0SFtY3Saf3XQuh+fzaIpgq+K9vzdpf6yUatpfW5fG37lbJXTkDE1m3Z61uGLsdpx3R+1Xc0Ckc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=cKDPjdM0; arc=none smtp.client-ip=209.85.160.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="cKDPjdM0"
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-51c5382806fso38548571cf.2
        for <devicetree@vger.kernel.org>; Fri, 07 Aug 2026 12:58:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1786132732; x=1786737532; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=f69xMGzZrOlWqmsW9pivu6gSwpVQmPjx16bBsvNBC8E=;
        b=cKDPjdM02lZJRUNgWj20cuSA45stFJu/M2CPeSdWLANAfMlZ/DGDKm366wKYIUeUJK
         ZWIIdxCVIKkP7zC7by0spXnD7bx21KsXpOLicl4qf7XDnKtQ7WQHYInfpEePOPnU2OJe
         fCBEY63FOVdZRCC7DYO3KvXtHWOEf7uiXYL7k1T7h4PLjvszY+zC8+LHvzTa7kS8WV3E
         U8zcdgXtjY9qqEc+vjMvKQ3rfRczzpboMjK8GLgrwYcpBqkL/QPkEXcRXUwMUQkhGV9N
         35fHuyDyf8vu/3qqkdPBjfDEXQphfgGzprwPmeC11pdYCMKtd69j6ESMG8ho57X8lvNV
         elvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786132732; x=1786737532;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=f69xMGzZrOlWqmsW9pivu6gSwpVQmPjx16bBsvNBC8E=;
        b=YVrcWAbpvpN6aCoAE2lqptpRmvFJSqnTjD40b+U2Xnl8LM2Kc/AO0Yf8d3U0QUhJ7f
         VG/c1iAYtjP6C6xN7TnDFqGbY5/JWvGcNCd21FMSEg5TowNwToi40mUaITAZZwpOcyYw
         kUctRajhzMJnxCmzOu3RMxSetelS92NEcYvbFTIvpsuSMs0iddai60UOnhGZScRkDz0R
         e9dtXP2Mzn0ovE9K02IFZ9KGO2z4xaGnLd1WOQCS9lS6RIfXliQQWbC+B7Cf1OwdXoZU
         GjTBerY8civd9L+RKgDuw6msizPHqldjK9YZsYXlOMWKbFr6RJNj4zkfVqkTBAUhGz7E
         rkCg==
X-Forwarded-Encrypted: i=1; AHgh+RpOiBGc+8b/Q55UP30LHJurojAuWgmjTDWIPNUSflszpzsDA13VRYWNrwqztZ21oJBh5IYqeM6Uhu2m@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5Kp3Mz7Tma/Vqla/CBmoTxSu7XEgRoFclJxtnyPXfIFL8Q8aQ
	dKzN8mIgjSlWd0QAh9Jq1MHvvvIJOaIXcz2VTPQkN/43hfPaSsG/t8xD/JNAbz8dl84=
X-Gm-Gg: AR+sD10GgXMa89OrzQx8RIzeHbXYPha0crBMGTUuwDme7VibFnIAK8zAQjE4thVhNMj
	cPiIGSjDrqjRmvhGhNFjVDSIgREsGbsO4pqr6O3wVRfEWD/I8/I4+C7Jg6DC2cpGJCmBBEBjcgc
	97f40KOLcReyyFDUKSveOisjeE2WahVocKUo5KEuXAvcVpa8fo4lUEzJ1VkxTVK9FBY46wObNQv
	UOCd6BD8Fv6jL8mvSDpCwZ4HbeLWFYpUwoJsuw/xJWtL12MSxlLwzdYhUyOAQAK7J4M/lhaUVGL
	7JuUQuxFfdcllLduiyE9sWTd4MPLbjKrnuCs7Z2sSVcTP9Y7CA4GBmw6s1UC/e+3onJA0mFLQh3
	Fr+CMsw7VR+79AQ1817mebK4YX3NbdFuURZx+n37TNx5kzwXF/AMmHe/Ym8SRBPFWJxuoG/NhLP
	Q8UDfjCMjk0JvD78vM3ane4To43AWj6CZzXQiNzGkK1OthO4blq9GUC/kMOrGQwoFs
X-Received: by 2002:a05:622a:2448:b0:51c:1117:c79 with SMTP id d75a77b69052e-52d0b193284mr153445671cf.24.1786132732042;
        Fri, 07 Aug 2026 12:58:52 -0700 (PDT)
Received: from zippy.localdomain ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-908a92ff366sm15824226d6.32.2026.08.07.12.58.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 12:58:51 -0700 (PDT)
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
Subject: [PATCH 2/5] arm64: dts: qcom: qcs6490-rb3gen2-industrial-mezzanine: clean up PCI function nodes
Date: Fri,  7 Aug 2026 14:58:41 -0500
Message-ID: <20260807195846.456079-3-elder@riscstar.com>
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

