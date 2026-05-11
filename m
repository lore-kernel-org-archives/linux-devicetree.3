Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 493D63FE65C
	for <devicetree@vger.kernel.org>; Mon, 11 May 2026 14:42:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778510543; cv=none; b=p/5BxDa2DOsJfpsxXl0v04KigYOtE5gajw3vrV4Dh9JXbZ7PY70hJzyLVQg6utndp6N7TBlnLY/M1ZqxYfZKVG3rd8AiEwINsZRN9/j3ctVZSC54lyocPZjW+0WOnYn3FatKplo/oy1MKgBY5aRXvjn9+DXGnS4tSN3kFhvyFWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778510543; c=relaxed/simple;
	bh=hb1C5aQJP9WB35OrPcztq1zXVygEQ/kny6JW3BxcH4U=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OCDe5e5CCFIs/OecCuh2N+cd9hEx6o12FjI0T5KbJNP7oWLnoz6+1/NxeJdTXF132YbJaW6tiyL7jvZlTCCw5xf2pMNKk6g5b1CrESBjtoLqdSixQA5Am+wxkKcHapwnqqpwiftje1n3CN3qXat39/4ce+nV11K88fdtc9jA4e8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OI5spa9D; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OI5spa9D"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-835c98b659eso2977633b3a.0
        for <devicetree@vger.kernel.org>; Mon, 11 May 2026 07:42:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778510541; x=1779115341; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5uGmegWoBDFbMwv9U1ANg7UscHU7WF1GRVedykGQS6o=;
        b=OI5spa9DlVOArZHTO/C/4pbzkEPTI4t8YPHzpnRxLE6KStao4qk+PyYx6RR+u4qt0Y
         EzOhTyuqTRYmmLWwGZTALzjwUKpcIseRhoVCkeVUG0mmsm13s2QhZ3oyC54WjeNyDDSh
         VWVjVHwQ72wkYRpe1NePd6+cAdLqqkxaWRyMX2inlc9K1ht7LoL94DKEar9XBLv3zQnt
         bVuz8YiiIGjgNQXqZ2gccWWJwHWCca/mf/YuN5USL/Vec2ENrXRPbNk8ifbQVodYgSWg
         H+1BuGpdKjHLORe+JpK7OLVu6y/xkRDN4Viv5qfacRVD+ic71aE3u8mUrVme5jhlZMLK
         aanA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778510541; x=1779115341;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5uGmegWoBDFbMwv9U1ANg7UscHU7WF1GRVedykGQS6o=;
        b=JbgGR6EguavUqWWsSRNJODdFuRkCk7j5ZLlPtKHdGR4iyakkDgRDJDcfxLpYNdQb68
         7Z0gi3LB4Hw54HYOsN0v1Zi1KKQk9szNkt++rFktsqlrEWliN6Au8sOajXE7DGBSqxVC
         cp137/RgE2b0AIiqqRwkRFIyZIThZczDy+ktZ7Q8togercEHIR8fEKwRt1Xuzs1Esi6r
         QND0Yh+Vkq2jqo0dBTwqP2A2xTJjZM9uAlqPIseR6HFD9TG44L75BVwtey0Zy3KcdbUS
         s8Ri2Id3w4BOkeIWqhgu4NCWVolvKngqTV6LOdqBiuy3XQ4Q9+d267wsAcIBLXO+k03D
         MpTw==
X-Forwarded-Encrypted: i=1; AFNElJ9GTJWd7q/dIivOngnDn2ylD9u/PaZXkKBSl22wTbSWVMBh4goAQ6PklknoJ0CaoCLU4pfBbCx9I8Un@vger.kernel.org
X-Gm-Message-State: AOJu0YzSzigehr97Anf6Q1HlG9lS6BINBo0qzxzhmhO5b5jl4Oh8XOA2
	tndHdXHhVxClaO5AokHguYWc34QqM6pqiyxmsPqa5h2gwZzmNao5EdJ+
X-Gm-Gg: Acq92OEp35ZApHjEeLVksdtHBPmoYkF8LRSZa0FxMvzpVAqGpPpo2DBOYsGG/1egHOe
	eb0Oi24K54gQm81szu9s1ULe8keUhdiVdiZ4ekBgEI3MqJwqJqDYQn4zk4iwtlCFA41L45QC9g3
	uPtTQTLPxScqFuflzDej50JziTFijgjQP3WX/QwhXADubGtBodQdJqjLbEGlb3oBATOM/Tt+rQo
	s8N2f5QU322HdCG+MBF9jo5Nt7updObl3bIOluLw122m0YgRIrCdmfAVPnH+WaX0j/C55dtNiic
	WjbA4oLpfkwQ8EdqYuKFAKZuQ4h0w+VVmtVTYHny/V/7ZLPu9xcYA/I8I931FHsZbpGiSqaIXaC
	wu6vSAHMPkXGPtQTOrH/1zJoKBZ+ghtLH3ihXthFlCnW9WLGSFAEfW7cRaKbzfRoVtG0mcFazWD
	RwXmzuyllawRGo0SB3TAQOySjsDAmtDk+5xQNdgiKKFve1HOf5oftWycmdYESNCHQUiJSeXB8JW
	MhWVbZmj+t2WQ==
X-Received: by 2002:a05:6a00:4b52:b0:835:cc47:6fe7 with SMTP id d2e1a72fcca58-83e3afd76b0mr9723226b3a.30.1778510541513;
        Mon, 11 May 2026 07:42:21 -0700 (PDT)
Received: from harrison-Surface-Pro-12in-1st-Ed-with-Snapdragon.lan ([58.164.4.185])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8396563f11csm26012405b3a.3.2026.05.11.07.42.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 07:42:21 -0700 (PDT)
From: Harrison Vanderbyl <harrison.vanderbyl@gmail.com>
To: linux-arm-msm@vger.kernel.org,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 7/8] arm64: dts: qcom: hamoa: Add inline crypto for UFS
Date: Tue, 12 May 2026 00:40:56 +1000
Message-ID: <3ef6b7bec298de5109296a9e64d12b896e017d0c.1778498477.git.harrison.vanderbyl@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1778498477.git.harrison.vanderbyl@gmail.com>
References: <cover.1778498477.git.harrison.vanderbyl@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the Inline Crypto node and wire it to ufs_mem,
enabling UFS storage encryption on x1e80100 and
derivative SOCs.

This is needed to support encrypted storage on
the Microsoft Surface Pro 12-inch.

Signed-off-by: Harrison Vanderbyl <harrison.vanderbyl@gmail.com>
---
 arch/arm64/boot/dts/qcom/hamoa.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/hamoa.dtsi b/arch/arm64/boot/dts/qcom/hamoa.dtsi
index 051dee076416..35755eabe549 100644
--- a/arch/arm64/boot/dts/qcom/hamoa.dtsi
+++ b/arch/arm64/boot/dts/qcom/hamoa.dtsi
@@ -3952,6 +3952,8 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
 			phys = <&ufs_mem_phy>;
 			phy-names = "ufsphy";
 
+			qcom,ice = <&ice>;
+
 			#reset-cells = <1>;
 
 			status = "disabled";
@@ -3997,6 +3999,14 @@ opp-300000000 {
 			};
 		};
 
+		ice: crypto@1d88000 {
+			compatible = "qcom,x1e80100-inline-crypto-engine",
+				     "qcom,inline-crypto-engine";
+			reg = <0 0x01d88000 0 0x8000>;
+
+			clocks = <&gcc GCC_UFS_PHY_ICE_CORE_CLK>;
+		};
+
 		cryptobam: dma-controller@1dc4000 {
 			compatible = "qcom,bam-v1.7.4", "qcom,bam-v1.7.0";
 			reg = <0x0 0x01dc4000 0x0 0x28000>;
-- 
2.53.0

