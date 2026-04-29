Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B3D742317C
	for <devicetree@vger.kernel.org>; Wed, 29 Apr 2026 19:00:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777489234; cv=none; b=baq+rm3ENobTOOdnK6kWFUj4X1/68QpU7O4+Ew7492twIK8W0YDV/02vZ3fxxSnX4cUgcGl5waAHK6Nq9+knSiWEpMd7WrgnaXj7DhsXA5tAQ5Y9t0Z74j2viAyxeGhgjtvVa9hv6IYdWiy6hnM48AUsiirZk98Yx+VHXjeWXz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777489234; c=relaxed/simple;
	bh=zG+o0MhzCy1MhAPEPaaXMKj2DtTAIlj69kKyo11vWYM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Retj/Ba8pIZv3VZhmtyjvi3+RejSsPOMrA4SQKI8xB9EvQEw4k+cBvLaszhpRSjiwr9M9eoBBQ4D/vu+fEHl9QY1TxkyKSQU+MrG5R6iOyN1KrL/JLgfmProbpMNAQ+5nKC03WmeSeU29ANISanUdkd6bquw22pnK+sPbjjQVyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=olGne8yx; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="olGne8yx"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-488a14c31eeso625255e9.0
        for <devicetree@vger.kernel.org>; Wed, 29 Apr 2026 12:00:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1777489230; x=1778094030; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+JAhGZcmG5DTNoPpP7LuatJXcV6lbxNbVHpf0DkS0EQ=;
        b=olGne8yxcmCXqBWeRmexhG9r2AGiZXQVItjA7r8YD7IJvxKP0pQMi2Ki62l9g9TIYK
         W9ueDVmUiNmdm4u9TGg7SGif7Gy2We4lC0XJumLSEfHNQFb7DFQJgcuTNdxpwtjCvdmI
         Y9PTBGkHzkGVEUw1TtVlo/sZU/VQQTQmfypUn0b1p3QqWym2gR7pg04RJDhMLv+rurK4
         Z655C8YVdRRYWUmIaFbgE4KllW1f1K98Kjs0ixG5A74qFmOrx5AW5rOfW/CTCKOEmEJJ
         FS8orPv/PLPQF8t71t+x06loIUIil6v+GgCe3470RviGEUwgM0uU4xFGgEIUsvZy6IqQ
         aBXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777489230; x=1778094030;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+JAhGZcmG5DTNoPpP7LuatJXcV6lbxNbVHpf0DkS0EQ=;
        b=Qcahn3ha9M2HQm9pB8D/a9T5FXfp1sSF/WYAWtRXkLA5gk6inWgNKdSFwYShsbtrfa
         6hU0mmFh5dZ0W7p3d6Uax0pffZ/iYZJuB+qDvi5Ex66uX4gCD7SSV4SP7zCrRi0o7Np1
         RFkAblbQJnrdI2sgIiyJk2WkSfESPP2ID66372R42DLiu5n4wriTQ6fjBzkvZUZm7Yn0
         JzXsfPvRB+zb9xHUcNYdkUInSLF+ZaQw4QSqDJ6K4/TN5MqeG7GupTta+199/Ww/iQaW
         PFQssZK+9JBMo32bHdqiXkWnY9tbmf3gwdb+rd/47vtXCUGWDHmu1h0b/CWhPw3Ycj9i
         iX2w==
X-Forwarded-Encrypted: i=1; AFNElJ9bDsG48RNX6vVd1dTJY0c3W/ym0VVAw2SNh4Tm5seWm/o6/hbmpzH7mVpYBCYdskTuA0FfMJGqtAPe@vger.kernel.org
X-Gm-Message-State: AOJu0Yxf6hTKEtTjRn7j+YyfAG30fvbPEHerFX3U5zZ1PF7f9TiRAb9n
	Y/hX3ob9Ehfa1NeFR0j79pLzTRwVnigqH0A+KkNUJHYA5jpDFiINms3q2g0hAWdVfAk=
X-Gm-Gg: AeBDievaBZ5m5stwb1+uuZcTUznnvfBAppnvaUo1oHBRyCVO8I+ZlmPhK7eheEwL2fv
	xUYsAjkRZx/pfw1auRQnD+dldlBHo0TuOvD1AB90J63kYhnty13uaJLekIfS6WUc3+Bb7vwfXiv
	o4Oal5JzRef053HIC5zLVEF4IBVuSRJDz+S6F51S9Co2nnZDMY4x5nodazosi6Z2sZzfo2aS2vA
	QZM5sWzVr5sKMsWZQcXk0IKygDggsnWSdoKEZSkx49Rtaaw973VKSNBsyEBi9VApq4FNhtrI/K3
	ekKO1adzuDDeKuyINwZuLGsdNe1fiSPbqR0EX7r9COrgNZxpy+PKl1yDFwVu6ouc8uaRKRjHuH/
	BxtZCTobMINm8HvfU9vOUJLuL0q2Itw0DEUbOW1G9NORmpF74yFk2WVcJ/JO2LOmEh59QZ1JTrr
	TGXAJJ/OtnsMaddya+juvI0j/70Al22/WLFda2HMn2Kn0dgj/pH6CHrkgCGTl25h26SO9iir4TM
	NLea0nLMlu45ooNTmK8jfXgUek=
X-Received: by 2002:a05:600c:1396:b0:48a:5565:ec3d with SMTP id 5b1f17b1804b1-48a77b1b85fmr145395505e9.22.1777489230144;
        Wed, 29 Apr 2026 12:00:30 -0700 (PDT)
Received: from [127.0.1.1] ([94.4.195.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a7b900b40sm26187785e9.2.2026.04.29.12.00.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 12:00:29 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
Date: Wed, 29 Apr 2026 20:00:24 +0100
Subject: [PATCH v3 1/2] dt-bindings: mailbox: google,gs101-mbox: Add
 samsung,exynos850-mbox
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260429-exynos850-ap2apm-mailbox-v3-1-8e2719608c46@linaro.org>
References: <20260429-exynos850-ap2apm-mailbox-v3-0-8e2719608c46@linaro.org>
In-Reply-To: <20260429-exynos850-ap2apm-mailbox-v3-0-8e2719608c46@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Sam Protsenko <semen.protsenko@linaro.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Jassi Brar <jassisinghbrar@gmail.com>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, linux-samsung-soc@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Alexey Klimov <alexey.klimov@linaro.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3

Document support for a mailbox present on Exynos850-based platforms.
The registers offsets are different from gs101 mailbox, but the
workflow is similar, hence new compatible.

Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
 Documentation/devicetree/bindings/mailbox/google,gs101-mbox.yaml | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/mailbox/google,gs101-mbox.yaml b/Documentation/devicetree/bindings/mailbox/google,gs101-mbox.yaml
index e249db4c1fbc..c109c1f7af24 100644
--- a/Documentation/devicetree/bindings/mailbox/google,gs101-mbox.yaml
+++ b/Documentation/devicetree/bindings/mailbox/google,gs101-mbox.yaml
@@ -20,7 +20,9 @@ description:
 
 properties:
   compatible:
-    const: google,gs101-mbox
+    enum:
+      - google,gs101-mbox
+      - samsung,exynos850-mbox
 
   reg:
     maxItems: 1

-- 
2.51.0

