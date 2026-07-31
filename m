Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97A7D42A155
	for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 11:41:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785498104; cv=none; b=rzkFn1EbDMjkN4VgBmGrLrZWhRDIAfQIF6uEIFUJey07AllOm7/sxaTrQQS4N3NDMRWhFva7R+c4LP/Bp7Qcrg/DClLtjFbHDYa6sMthTNXvW5QkKYgf+gXd1C5prnhEHrJwnWvmgS5Z6u/RuArw6F1HKU9bLMqoP1GbYofqi/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785498104; c=relaxed/simple;
	bh=gXNJqaf+zTctXL5WLgdpGYeFG2qxNG2Vh2hV85r/k1Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KQxAvpyQRA2naiIDDKk+SPH3Xa9aVGoG6tA9+3WYanWTd5KoBfYQo1uA2l2gEnjgmvRuyV60jWyzmJxk16oXx6vjaz+TNdQ+wbD8d7XOuCtWxkUGvBYljSsh4gQjMYrDRuLdPbVxGUYWKAWg8sW3lI+Mh69IqOAfzCrTLxDY6Hs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dmx4XRlS; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dmx4XRlS"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-47f71156e1aso479242f8f.3
        for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 04:41:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785498101; x=1786102901; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GL48HhqEqA89OWX1SNNRwvNWdwLXSktQBg9CSPlO8sc=;
        b=dmx4XRlSwrwYQ9JJGfXoK6iFhWb0NhH7vW3efgdwihdmTj4tyy5HhJch3eHZgiCIOy
         S5cuGAzo15pFtGWfxQU4v7NLsEPRechFMjj4gp5kF8pfgYFjuBWz45y2j/ldfj5kskbW
         XtRSgeZflQv0x6sDdOWowvagnmlbDgEaKZUtzpqdxfzST4QNSwxZzifAtYOrczF6djI8
         szCXDm8DeMmIL8/iN0jA1YAGc04fIe/BKqLNxnDQyBY/Wez2dPfp4YNhQvVcmbzTlBHQ
         SGm5UOzQWxcTNXMcuhdqr5BB3hZ3AolOkA/wKUpyyU78rquoBAfQ8U0NzbzNAGj8/7Vs
         D8Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785498101; x=1786102901;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GL48HhqEqA89OWX1SNNRwvNWdwLXSktQBg9CSPlO8sc=;
        b=QMlUgg1/5A3t5oCLN78a4dKNz7vT/BcTFtc5j3Vx9+cWejhxhbgnV7rtsCAPAz07hE
         QEoRqcERvZzfsVE8J7P3p3s1N7Q4agjnx+9H5rEWUdt5Fz68yJ968G01vKuUkC7C+2wS
         DPby9wlo4Ngq30fHrAnRqBoFejE8WneOTkdqKFdb4DYPJoWeIEo+5A6QXZmAi6dl+54E
         8fd5/elE5xmwigoPI+QrMf96Gs5WiC3B6lViZ1EEZAXUhjBYQh8kMKW+wOExgtiq4zqW
         jBVkoOX/NB/4SEaL4c29rQhIVZM0aKy+uF/OlXPFp3NPaluAMeIICrFrTSg+wSm7fp2x
         g2lA==
X-Gm-Message-State: AOJu0YzKxPjtVnQBofc4rCz2DGvCYEnFaXwBCT6+A1RB+/6O8Hy6Oe4L
	xe6pADTCfat1E32cCgQmUWSVabymo54C3EuoHHHvoTo6MOTeLAlyOzlu
X-Gm-Gg: AR+sD13vP3CHvTHhTYs1jDRc1mTQ9PPTn+U23I3HdbstIfza4Gjcr2v8GBFtcc2ycT+
	GxBrVggAvz5kIhGizY12shg8xgp1zIJnCZmeID/wVNNNx+OTB7lOD+gOAEglIX8ZD9UWXXUIOE0
	0NM/yzKQ8/WZYy5FQkZzvXwYQ0SNAVhGpaURK+GZnPWLbYm1dVToYgavU3igGvQbwsKKISIb9xp
	WHzwXVCpt14xpo2+65u1r+zs3PkmZ6oL2XVgbwaz8ILIlPIs4MwkaIHHJ02kjLGN00E2NTM3XZs
	hcVtLf/70tf8njlFYSQI8Zo4aAYdSdb7Gr7rCBimEDQ8Xjm7cWV4DPTszA8rQTJCM/n9gtRgQi1
	6JBo+tf+5tBkrf+gg+iCxIOCPgpAl/IC8oRHflNnPyA1XynDvStEPnW17f8F36l7UTzGQfEdQb9
	dvkWk0JNqCbm2tnIB3DiUb8JBY5DGY5UbiQmzu+qzqCXuYquI05CX7DjJicKZHA79aqcbDuABB3
	A+QZRdygg==
X-Received: by 2002:a05:6000:18a4:b0:47f:778a:6587 with SMTP id ffacd0b85a97d-47fd2b53c48mr3813169f8f.40.1785498100849;
        Fri, 31 Jul 2026 04:41:40 -0700 (PDT)
Received: from xeon ([188.163.112.51])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fd41d0064sm3769336f8f.5.2026.07.31.04.41.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 04:41:40 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 10/10] ARM: tegra: tf701t: Add chosen node
Date: Fri, 31 Jul 2026 14:41:06 +0300
Message-ID: <20260731114106.169398-11-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260731114106.169398-1-clamor95@gmail.com>
References: <20260731114106.169398-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add chosen node since some bootloaders may require it and add stdout link
to UART-D to simplify getting kernel log via console.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dts b/arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dts
index 0d182fa5c1af2..1b9839a855610 100644
--- a/arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dts
+++ b/arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dts
@@ -26,6 +26,10 @@ aliases {
 		serial2 = &uartb; /* GPS */
 	};
 
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+
 	firmware {
 		trusted-foundations {
 			compatible = "tlm,trusted-foundations";
-- 
2.53.0

