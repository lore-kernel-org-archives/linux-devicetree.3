Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EC4D481237
	for <devicetree@vger.kernel.org>; Tue,  5 May 2026 15:08:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777993727; cv=none; b=RkotB0925uO6hxEDbTNoGi5FelvHtP08Xys3rzu8gUtvDSIaC8RAXRSxbDns6ECHGkd8DRyayef0lyGd1m+DRByWyv5NWDFzSPtUqBr+9CKvWZl4JBJ+fVpRszlBEPAU0xL7lhxdpUzayFGyPBrPritHjjaNtJTK0Sm01wccE7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777993727; c=relaxed/simple;
	bh=e2pYmLL72fwV4h7HoDkzJW9C4malcZs0f+OzkynG6hw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qANNfVT3crHIXYm0+3oX+/uOV2QZq4Jya3WJ5H/a78e7wEKO2uD+CO7XdwxZLyZfUtqXg+QYDLIi3/1BAHCALtA0lSG2V5bcwOK/zxAbNyDtU0dRo0qDwRrs95JgLys3PlUMEXMbPp/4LeVeZUVVaDhOMkxPo7MXyRfU5GRbfAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=3WSiOan3; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="3WSiOan3"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-bc2301be8ecso375233266b.3
        for <devicetree@vger.kernel.org>; Tue, 05 May 2026 08:08:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1777993724; x=1778598524; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CTnCFBORpaeiea8kdIBVEdmJcWQUYz6wO+fctU4NtdU=;
        b=3WSiOan3N2b/WRUkxUczrEI0eb88bLyXmKVHDtQhcdtgsBiI6DBxCS+ESBdi80zO2A
         8Cmj+H2eKnRtCGTvxmxGQv4iLGJD2TtOh5Ret6Pz3Mab4ynKjXdULVbyRcTC3UVv7YeS
         GwYIQnWEMG8wwjheuL+k8d2Aj2L+3JzkB/huD5fg7gxQGeqv5WDpBxHXk0k9jKxIdp9G
         xGNsiYbT0J7Awg44VfVr0B4G3pvKrgOuO9SRv75ifbs5ARa8CxgBNuUPWr9GFkVYoVWq
         yvxGWPJS/tfcgbXCRr98XUuDkNzHeQVL8eKm4IcD2Ew6C/n9DlIxKGSPSllBspLZwaHE
         2nVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777993724; x=1778598524;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=CTnCFBORpaeiea8kdIBVEdmJcWQUYz6wO+fctU4NtdU=;
        b=N/JYSmJVnsMavD55z6N7Gv+BtotLsf4m06N/+JxWbub03ASZ/JIrAUpIDwv0DWt2K0
         jOt0Ph4PWv503bK6iXpFqvrtrI89J6qbPBMYe70wvwduyodinhWMhoS7JdA8HsCEPp44
         bnzgQrBRqyyT8rwlsMpxZLCum9VvCDs9i53fF4dUdv3nf6TvTw/I5GGhutiHe+8u4aNT
         Tjg0zpwy9RwDxn4ObwMUNFNaxytgwkiYWJKNJ0DKhCj0KmeFEq2PtBzGfqxuPSKiax8Q
         G13hBomthjHRKJe9Id7pWWGWFnEzoZo1Q3ZhwbHwm7oa6QHhEi8SZCp5WJzwcCgagB2r
         fi4w==
X-Forwarded-Encrypted: i=1; AFNElJ9WO15qrbLv8l4SN1FZ/Nklpt5es+HhhbAT8+uWCRgMroEamx9QJxVz7HMge8nqq3VfoF8hvFu4e5gd@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3wfXjMHAxupw5bhRLT8BB7ahSLx+4MCqzGOes+tiDV0wZVuvz
	sXqnUZ3yiyw8Q/Tx3v4Do1Zl6uoW8jOLG6QUkRkMSgxPEivG1XOjkhGjRZsEfBFExBo4JJg5jWX
	0Gqc1GLiqhQ==
X-Gm-Gg: AeBDieuylCqBCCiBDwQx2wZIZ+/Io+5XJnbLgmNxjuV3JmlYOhSm5rg/96Sl5T+dPuk
	eNZt2wHZ99IdFKMv3yUfkdbb1d2eVHZoUkVp12Y6dHrdFf6TFfRe8gONiUzlxKBDEZau29QAXjf
	sF7CWLxbW7Nk5inF2N9S3TkzVCdJ1keXen1AGFNYXQU1gICMZPXWMT+GLlGvO/odM4IxWWEC7zJ
	XOz98WFFnyJxVPQRjZ4IYzRgS/P1FuiqEa6LXQQw3vtJ33kr3zxFuybEr+NBIVpRTU1vO9o1zCB
	xyMVz4z2aXPypp1k0Lzhu4NYGvi7XSKs6DHOHWhhGhHTHEmLqvj/y6ol7lJQpdcRFzArwhNPpaO
	xri1/olOAvVu0eE3Rx+PS7KqRtHCn6KEcBciI7FkjPl6bnuXncuo8tGpTJbja0p4k7nk32Q2Mwe
	Mb/xUjJTadv59VpadWCBlWQwxbaMOcqtokHkrwpKkgAAOV8GlVG04A/UdJmOB4RZDwVhZlAg8Gz
	kJdTBr5Z7s5MHRe5RlQPq2YHSFJvu3Sv/7rrA4PUrmpkEBm
X-Received: by 2002:a17:907:db03:b0:bc3:784f:e143 with SMTP id a640c23a62f3a-bc40fd1a7ebmr198407766b.19.1777993724310;
        Tue, 05 May 2026 08:08:44 -0700 (PDT)
Received: from otso.local (2001-1c00-3b89-c600-71a4-084f-6409-1447.cable.dynamic.v6.ziggo.nl. [2001:1c00:3b89:c600:71a4:84f:6409:1447])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bc28c4ea2casm196662266b.53.2026.05.05.08.08.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 08:08:43 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Tue, 05 May 2026 17:08:34 +0200
Subject: [PATCH 2/3] arm64: dts: qcom: sm6350: Add PIL info region
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260505-sm6350-misc-v1-2-0b9efc22690c@fairphone.com>
References: <20260505-sm6350-misc-v1-0-0b9efc22690c@fairphone.com>
In-Reply-To: <20260505-sm6350-misc-v1-0-0b9efc22690c@fairphone.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Luca Weiss <luca@lucaweiss.eu>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777993721; l=762;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=e2pYmLL72fwV4h7HoDkzJW9C4malcZs0f+OzkynG6hw=;
 b=LzqyjIXgy+BsSpDTCVDeJ3tfwIlSeXRkL0BDgmVrW+GloE1b7+2stddVFsJlNalPqkM2XhCTf
 iAddJNpbHzgCa/n1hOGN3bYf6AyQQSaNQKfmSdnBDnI/DpdrRN8vFki
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Define the PIL relocation info region, so that post mortem tools will be
able to locate the loaded remoteprocs.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/boot/dts/qcom/sm6350.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm6350.dtsi b/arch/arm64/boot/dts/qcom/sm6350.dtsi
index f37096cf11d6..7cb9ade1f0c8 100644
--- a/arch/arm64/boot/dts/qcom/sm6350.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6350.dtsi
@@ -2754,6 +2754,11 @@ sram@14680000 {
 			ipa_modem_tables: modem-tables@28000 {
 				reg = <0x28000 0x2000>;
 			};
+
+			pil-reloc@2a94c {
+				compatible = "qcom,pil-reloc-info";
+				reg = <0x2a94c 0xc8>;
+			};
 		};
 
 		apps_smmu: iommu@15000000 {

-- 
2.54.0

