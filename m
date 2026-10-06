Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 276F63BBA01
	for <devicetree@vger.kernel.org>; Tue,  6 Oct 2026 08:55:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791276955; cv=none; b=epQjZdPfiqH0DvJOKCS8jw1o58jk8BNcwJ+t0BEfOp37zoq06iBFWcdMigEW9XxB+6a9J8fYMq83m6VH0WUVycs6xgduGSDj2uz98Hm0qio0vrWy4OkXMfbXCGwTPikOr1paYBNxr73QCAyeFDQVs53GZqmdkOkq5PFnR1g949k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791276955; c=relaxed/simple;
	bh=DU5hZk2w72UN7XPPKKC0Ei9MPQopHgndGyHLU8P+5b8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OfZQbSLkqGz4ADDMf84HoMSppmAdgONEXIcPa6Z2V6+tSXrdbHrLCVY1rzSnKrIsJc0IzL+erIRndBJkCMv9EoPvq75h3Tdp6ZRSkWIfEutVcAczjj7pmh5ntKUulztyiFMzqJQdHGAfeY511Svf7LgsjFsgmhaVi4RTfQq128A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IJ1yTe+X; arc=none smtp.client-ip=74.125.82.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IJ1yTe+X"
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-34ceab2900eso415732eec.0
        for <devicetree@vger.kernel.org>; Tue, 06 Oct 2026 01:55:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791276953; x=1791881753; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3aZILo0UhPf6mB0ZTQXoidi3QecrcEcdbBPeLfd20Is=;
        b=IJ1yTe+XBfoTj2Qjdipzow+M1xr7GmTj7jOnr5W5KTtk2NI3a53bwN+S5CGKplGAfq
         9nxYUniBzyH+e1bxP+GOzTVYtEllNyNwho4iabc6ZOvS4V6LlQjQkJXtRgm6NvWE4gph
         skcYkvRociO7C+mwVPlnVVUQO5fSsMN4KFvlu+I/i9V237BUdwRDUfwIX7iFWdJ0GEn+
         N2AV1CyEygvmEZA6EwLzgS8DcCPDAVP2I/WrF1Jk/U5QrMv8niGDAc14NXmKoKPxbzuv
         GmntGbnMQrqiGGN4ngPVYjeUOGCw5nddx/oSgzwmtrqmBymPH20IyCEwB+ZNUwrln//+
         VgMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791276953; x=1791881753;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3aZILo0UhPf6mB0ZTQXoidi3QecrcEcdbBPeLfd20Is=;
        b=oz4YUCWmn4RqTh/yLocsTSFuxUGedYEa/MLJTeDFkL1m9fTfAGkKuqfO6wYRr102u9
         t6uS+co8HVSOgrf/QMek4+vhCRr2bQLWmWchXnBKd58Xgu3ZXTxO04qBIqeHVxOMe1RK
         LMG9I7Vp5miOFOKK6HFguZAoANKokkQna7lyCkWRW9hpMNx2vvfWbXCCtaqXyxbf8tyi
         7dbdY5VcBJ4VGZ9tvGy5DYVrCC0eFfD6SlyRjRNKSR/5BSpUY4/QDD39Uxs54G1zhO1M
         FPgbfssAqtlqH1cwmQORTwWzcytX/oHKjVC3tkXWPuyzYcv2pAqwTLdT6LGPNdnv3z2A
         QGOg==
X-Gm-Message-State: AFq9FYIQaqRL86CXvKHd+49bomq9HxMvUu9LtqPTxqfgsWzFEu3+JJTO
	uH2VxyZa7nhRMvVIuxG4PN+u+iOD4sKzKRSJqrUm+JBvV1MXODIPpzPF0YQXgf7H
X-Gm-Gg: AYBFou3thJikRLyKaq8FbL5sYYmPXaFQg1SPzrWt1KROkiDFCQzbwyNo8dRC16U8Gx0
	YAWfU6hLJJeoS5EGC1e9NuB4dp952iFc91KjqxFaQzJPuEr/O6G0Zlaeh/vzJQorf1gb9BvMfBb
	XUMY8YMdIPitxDvMo1ZqqSbNjCmHsdQQ9AhUxfoIlCacY/kkncxLhiIfq25+tSMDUz13aZk+/n5
	L61Lk9VwJkdPO8cK9UEfjCwuHD5BHkg7K4HO9VMXFB2eQMn4G+lKvYcITaRphlAEkv8R9/Yb8Qi
	XawGS71pORpBpV97WBi2rPpx4ua9GKxLPvJ3N4bbsZ1PqHdsdUu6P6bIKwkZQdcAmpwMfzPaTIP
	F9gbMETRuMKJ1dFAUcnocS6vaUXJiKJ1Ei41crcnf+9Dprmj27y8rhr/0ocyxP4tXrqxFc/oMci
	2fBdIq6BBGbxqLfcyEej/44NCYokjUkC+sxptyx3xxeU/8r2uQPJ9umyjmSreLNkss1zB5Qs+cT
	ahCQw==
X-Received: by 2002:a05:7301:53c2:b0:34b:f279:2c16 with SMTP id 5a478bee46e88-3514dcad9e2mr873245eec.5.1791276953239;
        Tue, 06 Oct 2026 01:55:53 -0700 (PDT)
Received: from ada.lan (cwgw.codeweavers.com. [4.36.164.2])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-351469f6dccsm7008620eec.7.2026.10.06.01.55.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 01:55:52 -0700 (PDT)
From: Kaipeng Zeng <kaipeng94@gmail.com>
To: devicetree@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	conor+dt@kernel.org,
	krzk+dt@kernel.org,
	robh@kernel.org,
	konradybcio@kernel.org,
	andersson@kernel.org,
	Kaipeng Zeng <kaipeng94@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v4 1/2] dt-bindings: arm: qcom: Add Acer Swift Go Pro AI (SFA14-11)
Date: Tue,  6 Oct 2026 16:54:24 +0800
Message-ID: <20261006085425.40450-2-kaipeng94@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261006085425.40450-1-kaipeng94@gmail.com>
References: <20261006085425.40450-1-kaipeng94@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add Acer Swift Go Pro AI (SFA14-11), a laptop based on the Snapdragon X
Elite (X1E78100) SoC.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Kaipeng Zeng <kaipeng94@gmail.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index c7c9a9279684..da653b787d4d 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -1180,6 +1180,7 @@ properties:
 
       - items:
           - enum:
+              - acer,swift-go-sfa14-11
               - medion,sprchrgd14s1
               - tuxedo,elite14gen1
           - const: qcom,x1e78100
-- 
2.53.0

