Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B806F3A6F00
	for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 06:31:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792391479; cv=none; b=tpqjzaB8B2ZqiRexgUW/3oIaDwkSysHuJ/aH0A9+8EBdsP4SJmU5Zke6UMofRojIEura7zz9sjCyVpdFypC1c+goD6NReNovO2zFrrFWo+6h1cHAg9MuDhCNaWxfxxYHEvC4a3FxcpvTnCOXpd6niYEX48lJXfNd48lcTitIoQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792391479; c=relaxed/simple;
	bh=txq8RXRx0od5LxWggME7R2j18CbFPKPl0i4VxtB+JkI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=dPG049RmAQc2rHjazE93MHI14H1a7TYmE+gYN6eKJWHMzZFVNrDWiGCKhWq5IKrMaismQN5inPlRAbYB0qHEimlY0uby0MKrSD0S7Kzjne3hiZ1lDb0XWy5lp8eQjWYT2BEWTlG0twILFycO14mCCotYL4hIXVmmjRrCuALyMhU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=gB2mun92; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="gB2mun92"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-49e73611928so16086865e9.1
        for <devicetree@vger.kernel.org>; Sun, 18 Oct 2026 23:31:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1792391475; x=1792996275; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=GCThCQjiUFY5+/PZUxZkIpMCNGyKmzi9/ufOgt9jdnM=;
        b=gB2mun92gI5039yDs820EXCenQU4tVDsv3Prgr8rZMNT5VsFeW/f66W7ql3eDaHDn+
         9i9gxp8FhRhOXLs6877qJyVC/oW1+EZnGO2u9NFBWrkg1gQ3HaHr3LcAxBVb5LUCqALB
         ssWJ8rwNZFAVKPWldDuYZahXm9JnKmZ3+J8voNQQC/HA7TGlTD+/ACEWeoorbjDIFuS3
         47mu+F3VTHYq90ksAuIyGu6ILJlJkElv5QMWyxVWN64lWYenwSkaxhAks3AXEqfCS8CJ
         /ufeVlIO3ghzlhRLrxD0BwzGWelv/1zMgfowJTTahr9yWgSxwl1+/fpbssSYrDiiA8B4
         2lSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792391475; x=1792996275;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=GCThCQjiUFY5+/PZUxZkIpMCNGyKmzi9/ufOgt9jdnM=;
        b=FNIfO0ebEgL9wnWJjVczw632gS9xk/zHK2gRNkEnYfRTQ9tf1VT2CRMHDzxdA2aBUe
         jYhWqcb/zzk1XqbiuJqC1ted6ZxJOo2qNJzURUnt2hOGtESnCRapXtvWjc6PcXgNrvGS
         /bYUpfiw+HcRCPxXIhGm4+tx9chF2BWTUKtswIvI2k5CCI5NZDuEtT7BiPxUHQx30WC8
         8I0PcWfitszeKElIQ+4t7axAWK0YhcB5ecub/r95zFjt4bicCllihZnRqPc53J5CU0Wh
         p/JQG8KYm8plYy53kfE0SvkUxT7iFmiwgqliRnBXuP9uzaN67wjP+MYKKqoX0q2VvQVJ
         LRfw==
X-Forwarded-Encrypted: i=1; AKwUvBx8Xp0iiOR5bmKy5w6QFID/I/4elEXwYv1SHALR30aHJH0gMSWYS9ibZ2mmaPil2l8ESpRu/Wh+ix3m@vger.kernel.org
X-Gm-Message-State: AFq9FYJbslrXTn1JNYBRIXmyf/JUMGR/k6Gl7AmLraJoyEr7+DKFBKsJ
	rtHqm5kI8Vo610+6lsDa5QBW+KuqkgMyuh/Q5b8O2zkczMgD+MEyVX+ALDPZ7J31yD0=
X-Gm-Gg: AYBFou0plqxTD1cahrR6le58vmdmNUpn/dYi+GdGWbe4UIRWR0kDBVd0HIT5FZVLK5S
	aor5vs8rZyMmDvWaGf1ozNXPn4mJJjDiJkKOY8oDd1+G69lAkoVrJdeqPSwO+cjCBQMoHKUOlcd
	zDR1WWHjuMpl7n4BpL0AdZtKX/HCbsEwrbpQi3N4Q+E0OjKpFXNfzM1IvnJb0943GVi5ykoTixa
	yPXPBntTJejqkP5W+T+xtXxa+FcAigGZicPpnbNnSFxIQQxjqwX0fJMncfY68gvVkEAJxGCpbji
	tXSzonKoKdLmPYcsJrQHkRvy2jz2pwtm0QEz+njSkfPf/ZO4HeTlIgQqZkugoCFBv7kdBL4TKQM
	SMA24zs8RwGcWJkjy/83whH3RaUFhEnvRBfzN1B4UgfKg8/z40+N53sVyd9UNRIM/psQ/NeknkA
	eNJq2mygxfNfcw7KhcVsm+Ea22+on4VLt1Ey7NCAYdFIsCKJBSzEVWvcDY20hltUhmfhaskNoy0
	E6HjNwL0sY7
X-Received: by 2002:a7b:c3c1:0:b0:4a1:8849:17ae with SMTP id 5b1f17b1804b1-4a1c663b460mr166458235e9.1.1792391474870;
        Sun, 18 Oct 2026 23:31:14 -0700 (PDT)
Received: from [192.168.200.185] ([122.164.127.22])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-183190aa411sm29269239c88.4.2026.10.18.23.31.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 23:31:13 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Mon, 19 Oct 2026 11:59:20 +0530
Subject: [PATCH] arm64: dts: qcom: sm6350: Add memory-region for audio PD
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261019-sm6350-fastrpc-memory-v1-1-1d4edb11238d@fairphone.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/y2NQQ6CMBBFr9LM2klakCJcxbAoddCatGCnGAzh7
 lZh+ZL331+BKTpiaMUKkd6O3RgyqJMA+zDhTuhumaGQhVZSNchel5XEwXCKk0VPfowfVHVjz7o
 21UWWkLdTpMEt/+6125nn/kk2/WKHEek158O0a9AbJrSj9y61ItCS8DjV0G3bF0qB9fmqAAAA
X-Change-ID: 20261019-sm6350-fastrpc-memory-179c467a5803
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792391467; l=1793;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=txq8RXRx0od5LxWggME7R2j18CbFPKPl0i4VxtB+JkI=;
 b=VEH2q6yE78YozhInji/DsMmhOONcl0mWskWd4bhyhR4rM3/IPyw042bVDiaHZPQLu2pvNLIXv
 KKDA0CcERGFBiGbXdcaCCFB+6gPQjZWmgFORriHY4/Cfw2G8WLopGiH
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Reserve memory region for audio PD dynamic loading and remote heap
requirements. Add the required VMID list for memory ownership
transfers.

Fixes: efc33c969f23 ("arm64: dts: qcom: sm6350: Add ADSP nodes")
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/boot/dts/qcom/sm6350.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm6350.dtsi b/arch/arm64/boot/dts/qcom/sm6350.dtsi
index e0506fada32d..11c1df6e7a4c 100644
--- a/arch/arm64/boot/dts/qcom/sm6350.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6350.dtsi
@@ -11,6 +11,7 @@
 #include <dt-bindings/clock/qcom,rpmh.h>
 #include <dt-bindings/clock/qcom,sm6350-camcc.h>
 #include <dt-bindings/dma/qcom-gpi.h>
+#include <dt-bindings/firmware/qcom,scm.h>
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/interconnect/qcom,icc.h>
 #include <dt-bindings/interconnect/qcom,osm-l3.h>
@@ -689,6 +690,14 @@ cmdline_region: memory@ffd00000 {
 			reg = <0x0 0xffd00000 0x0 0x1000>;
 			no-map;
 		};
+
+		adsp_rpc_remote_heap_mem: adsp-rpc-remote-heap {
+			compatible = "shared-dma-pool";
+			alloc-ranges = <0x0 0x80000000 0x0 0x80000000>;
+			no-map;
+			alignment = <0x0 0x400000>;
+			size = <0x0 0x800000>;
+		};
 	};
 
 	smem {
@@ -1430,6 +1439,9 @@ fastrpc {
 					qcom,glink-channels = "fastrpcglink-apps-dsp";
 					label = "adsp";
 					qcom,non-secure-domain;
+					memory-region = <&adsp_rpc_remote_heap_mem>;
+					qcom,vmids = <QCOM_SCM_VMID_LPASS
+						      QCOM_SCM_VMID_ADSP_HEAP>;
 					#address-cells = <1>;
 					#size-cells = <0>;
 

---
base-commit: ad304bc4f861beeb20f6fb189783284e17557338
change-id: 20261019-sm6350-fastrpc-memory-179c467a5803

Best regards,
--  
Luca Weiss <luca.weiss@fairphone.com>

