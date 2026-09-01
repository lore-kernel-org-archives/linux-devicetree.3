Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70E20371068
	for <devicetree@vger.kernel.org>; Tue,  1 Sep 2026 01:37:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788226629; cv=none; b=fcaeYE+xe+zJmpr2vwVJqzkyXUlVB/Xixo44DufoY8BJhdZkdsTnvX1db+9tL3K/jtL0D8DoF2frXm9htf0iU/QupS6eaFezB/zCppNTLle15q2IeMUUb2I1J+ucxY5E8dqSXECAgzp0IdjLt/ZiGnmyLY/iqzC02fqNgGAl91g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788226629; c=relaxed/simple;
	bh=Rux3sdXj3VDwxYn53lIo+IwdAPJhr8/dj2W3Qm3wyFM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kaf+ltcSfdUP6vKlU8SkxzWLLk7XX08dwdK7SV9r7l3qAxTgggWK3b0W6lLeL63KrpASsNrOvPTRPd1qOWN9t36eH3D5wwIn4reMMEV5ei4xEuRUrmF7LJ2/6LKR6FGhEwROAKc69G8LBUYStfe6y+P6Zxcr2d2WHOQcfY5vAxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=id9k1C0d; arc=none smtp.client-ip=209.85.222.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="id9k1C0d"
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-9390c3ade1dso23602085a.0
        for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 18:37:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1788226624; x=1788831424; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7nNvsaEQcRTultSSBuVd+REzQYtjIe97pxmt20zLlCw=;
        b=id9k1C0dBEfzrWu1piSRmdCDtn/STJAUdw9MZC6lWet+sg/4J+zdJMMMHUFgfXfzgH
         JVxtVg25RzlKTIah4Y6EOc0mJX0rSQl7xXjwQitPg2FBtGk0u/urlDKzm9bDNgvt+epX
         0AQmnIRgcuJkvsMtG6JUQjAyTaSgJk/+f7JrsxcAzSLTtfjLWY+nZBFcsf6PVuT5Ptmx
         YEr2nHrREOMMbjTse2Co7LtpYTs8CO974rw9TM9gfsowQrpu1ZavELsELoZpkV92Leb7
         ly+sI6FsRbiU93ZVJ9tVCSNiHEkZMIhWXUoKMqxrGUWN8XyI5OH7W1lB70o3zCvE95XE
         vK0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788226624; x=1788831424;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7nNvsaEQcRTultSSBuVd+REzQYtjIe97pxmt20zLlCw=;
        b=TbOlEBV4cfBhwc/5XfkkQV6ZZGqyfIP3S5jHWDaR0DGiMIC6Wg+Ww6lnGeDiZndyrt
         IU9CS5nK/Ffl3MuGasr8V274edfLxk/bYz3V1/MGc7QIfk9vDTP1PtSRbRuPNvQ6MwiT
         zqAkH4VXHSBWNP5ne6oFNvknsoJTdy1BmAfAPIBvFlq7WRIhEVjeJsFYkDtiz3OmAM4U
         ZIEAyB2YLGRs2YtefB+JBiFtTwE336Yc9Bza81yGum/h1ALzCkVUDcJM7qISwNq4d+Cn
         kZJV4bn6FoO5WuyvoCY4JtUpWq9Xn6NDHlp/A9PHc4vzqMx/95tdsp03tIuOD4ST+9vQ
         mGAA==
X-Forwarded-Encrypted: i=1; AHgh+RpXnzYpAAHUvhLnN8ZYIoBZHHTULEMHSDdu0t2IvP7BKFj/7cXjhp9S950YiscGu3IZtbL/DgL6BVoL@vger.kernel.org
X-Gm-Message-State: AFuF++lvXv4J0oUMJ3mRX1uoLMOofsYRtyoTt1GbkhGj8BBVoFbhMgVY
	T9JGoh14iwIT6+0fd77Tmr49VsGLOEz+bCGdCywl7Fk5ak0kA011HRldAuekCwl3R1A=
X-Gm-Gg: AR+sD11U/tq2komuONrVzrfPAYEE1pe3VvwA386Lc3HquUcXCmiFonEDldLGBy/kMJi
	YEfs+skxp2qEPAsLc2lHMOtDD65LFbDHMnIAs7wuT0UqcGlnOq0C5uupnc3eYMBakNuHCyRxy7N
	PviegJpMPy2CEXEXeEzDbjcGKLvngTUXf1uGXnoXimY5beI9zyPY7Ys7BsHyXmAEz1vWQfp8cZs
	jT6aIUmUaMAcKVh8WISSF3Hdm4eAjridBxyzoGB7+AelUj0KIb6AKgGCkksfRKb74N7mMUjgMCR
	kiZX05Wqsw0Qppwg2ZPlMzkxcKzA0DPrRwpeZ1g3+oUHGfcmN6TYmACWdglSlQse4h4M+AmGvEm
	WO5p9B8NhatfZz6tvs3a2g3sO7oTfJcZAsBCwll3fANPHSQ5Xy1aM93AGYag7XKaUn84eV6njZw
	xiDVoAM0hLipfEA8+oIz7koXeBxpqSjAtXHLLzMh47d3+MPXqFJlkEy+U4S7hyiZLu
X-Received: by 2002:a05:620a:45ab:b0:92e:6637:da3 with SMTP id af79cd13be357-9391394836dmr3178329585a.38.1788226623956;
        Mon, 31 Aug 2026 18:37:03 -0700 (PDT)
Received: from zippy.localdomain ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9391703a918sm919265485a.12.2026.08.31.18.37.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 18:37:03 -0700 (PDT)
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
Subject: [PATCH v2 3/6] arm64: dts: qcom: lemans-evk-ifp-mezzanine: clean up PCI function nodes
Date: Mon, 31 Aug 2026 20:36:50 -0500
Message-ID: <20260901013654.1343537-4-elder@riscstar.com>
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

The lemans-evk-ifp-mezzanine overlay defines a node representing a
TC956x chip which contains a PCIe switch and an embedded endpoint
that implements two PCIe functions.

The devicetree nodes erroneously include a "pci" device_type property
for the two PCIe functions.  That property should only be used for a
PCI device "that implements a PCI bus".  Remove this property for the
two function nodes.

In addition, these nodes define #address-cells, #size-cells, and ranges
properties, which are not normally defined for PCIe endpoints.  Remove
these properties as well; they can be added back once they are actually
needed/used.

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Fixes: b64abb26a2916 ("arm64: dts: qcom: lemans-evk: Add IFP Mezzanine")
Signed-off-by: Alex Elder <elder@riscstar.com>
---
 arch/arm64/boot/dts/qcom/lemans-evk-ifp-mezzanine.dtso | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/lemans-evk-ifp-mezzanine.dtso b/arch/arm64/boot/dts/qcom/lemans-evk-ifp-mezzanine.dtso
index 6cfa0bc1440e9..9edb447ee990d 100644
--- a/arch/arm64/boot/dts/qcom/lemans-evk-ifp-mezzanine.dtso
+++ b/arch/arm64/boot/dts/qcom/lemans-evk-ifp-mezzanine.dtso
@@ -273,18 +273,10 @@ pcie@3,0 {
 
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

