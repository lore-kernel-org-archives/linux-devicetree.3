Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD6103806AD
	for <devicetree@vger.kernel.org>; Fri,  1 May 2026 09:18:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777627119; cv=none; b=sFi2OGxrWyzXa7r++nkKsvzQjfRvl6nil0ZRseW8kWxphGXMHnxoJKYtvynVMdtvaXpEhkBD1ga8yd4rRg4U85WDLjwA6RBKqRKX2PIN+QDmyrq62ZFRePAb2glUJwt7wbsh9zOcDCGp3u1CImkIY1wtnhXNZI2Dv6gzi4muHCY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777627119; c=relaxed/simple;
	bh=h6Sc8ib7tRtd6w/326yX/61ibb/uDm234KS+EP440os=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hY4uHC6pet3Wy4tnoHy4Wz8j2ixiHTBjkFkSLN9+VIslLqZ3m/XnnzdH0fmytu95sb+godo47kG5SYMTmFtbqJE8oagFJwLbP61RCRlMg8+LDF1j0aM3mrQJW0QsgSB7j+XfTmMz3tIMVXw5mVIZy2gk80xE8O/oEU++sgl7Jx4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=RHYd+TXz; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="RHYd+TXz"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-488a14c31eeso12756965e9.0
        for <devicetree@vger.kernel.org>; Fri, 01 May 2026 02:18:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1777627116; x=1778231916; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fSd831WLWoomwvW5VsvsxASYGj8v1cMtz1VOawQMGgc=;
        b=RHYd+TXzjCAeXC0lyBCO0gGa/ei7QEV1J/8RsPZ9b1x/4iQMQgMhkvyHoL+4r84TSv
         /Xl43Yb0J2dMVW/1XdGwLv5EX07Hyt+H2fGBbLTy+W3PLB9+j/NP5DEKKEzgrOrkVcMF
         mbQ0sn1jOJZwAZS/9dtca/6JgUctm51LrhxxC50qTfTheU3CcIjW94bJ5dPU7W1PJ/N4
         ybAfBYh3iNN6nj38GAcQKvCFQedWDDyY+vmbHQc8rjBretjZQ5UVbjvHzHRpP9TD5ZYf
         8fDXaZYxtWORnihFV7WKicOVM89V7ZxG5lm0b6RnLgTZ0qhorSBgzjFBdDpJSIclj63S
         Rugg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777627116; x=1778231916;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fSd831WLWoomwvW5VsvsxASYGj8v1cMtz1VOawQMGgc=;
        b=AqXY8UKXshH+//5fYvetqTIR7wK3E/ovjfLu9SLyWlssyD//8BytYPhsVg1rXlPyTK
         9NEstn561zBzLL2VdWnPOMFlou569Ig/YKcPIl7gysL1DPQ1RQFLdnpYSMYzjpgrCqlu
         L37rlXIDaGpmJDO4WTrmeWTFGHzaLHj6fxefU2E2LWRvl4LRxQcZpWyXppzKbP0luAhk
         hdgcEkRxL+YL2LDVEcyR8w+Ncd2sgOZnYkbg8sQnjBf0U1goNuy1R7511BkTDuiu9DD8
         U0cLY7sTRLI1DUYZ0/pf2cs1FWYInpTg5IPiPaBzbiDEdyZus+asMSIcQF0JrIZQNYgB
         t3Dw==
X-Forwarded-Encrypted: i=1; AFNElJ9pXIZHcEbyLetcNdoBHNe2n23k2Q/ClPutiIRyNMBWNMMdBfQ2tBmkwz6oX5atRVq9auBNpV4/AnCf@vger.kernel.org
X-Gm-Message-State: AOJu0YxhcmCQuyiN763dYcOLVbUf1Fj2d8K5X/v8Uf212+L2stkN7oKt
	AVFlwEbYgXbKUJKPFLEO0bC+789F5ARo7+O2zBTk9Gny8yfOnWJiLCtBkcCJ2KcCFu4=
X-Gm-Gg: AeBDiev+VzBxQgoe7b8wcEzNRcu9FFXoHZTHA4N7ZZZqHdlkofFSqAH5pUyTWdWlIUH
	hXVk7PnXLGsTBmUQNCX9WBugoynf4dlMHsaLYA+XHfXN81uHh28Wv8rJ/t4YurS+7erU09QUcLF
	ONlMgATse5DC/j2O0O5yDG+fzediuKZ9+zNb6c0+OMKxnCFd6g1I0swb4ozSY3kTROnXWANB0I8
	F4Yfg5FnKM26fhgzTPQ/AusfPMIOZrPNVOTOAq4OJD6Nk1fOXWFhSdjxRYAV+HjjznSUGy68f3m
	5/XRNnJrXEsi9s4HMS2PGWArrdryVHu89nwtRPMqENgTdBknWOArSaHC54c/AC7p2n8Xo84qfj1
	8VTfdTC0rKTga5TRRJsoihSzd/UK8/+04r/MMtRj0wqN+qZbCkMC3YRquG7fmTv6UhxphZULC1/
	Ml911dFVHFeDfo1sTEfGPYf6NqQ4Vu9fUveT2sOm9LLoNHieBi/Hjc3TEIynKIHDoy99V3NkFcI
	sUlv8/e
X-Received: by 2002:a05:600c:6994:b0:488:a916:14a8 with SMTP id 5b1f17b1804b1-48a844ebae7mr99326285e9.10.1777627116383;
        Fri, 01 May 2026 02:18:36 -0700 (PDT)
Received: from [192.168.178.36] (046124199213.public.t-mobile.at. [46.124.199.213])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-44a98b76fd0sm3820787f8f.35.2026.05.01.02.18.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 May 2026 02:18:36 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 01 May 2026 11:18:29 +0200
Subject: [PATCH v2 1/5] interconnect: Add devm_of_icc_get_by_index() as
 exported API for users
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260501-milos-camcc-icc-v2-1-bb83c1256cc3@fairphone.com>
References: <20260501-milos-camcc-icc-v2-0-bb83c1256cc3@fairphone.com>
In-Reply-To: <20260501-milos-camcc-icc-v2-0-bb83c1256cc3@fairphone.com>
To: Georgi Djakov <djakov@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
 Mike Tipton <mike.tipton@oss.qualcomm.com>, 
 Taniya Das <taniya.das@oss.qualcomm.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777627112; l=2340;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=h6Sc8ib7tRtd6w/326yX/61ibb/uDm234KS+EP440os=;
 b=EkStrO4AgPi/QOnRLNXv0FW3BxXmJs0IsGB/Ss3Vm8o1Bu7DHupW/HkJYypIrV4+9V/F3WscB
 BHOpdj2kPn+D+jrj3Khz4feDFEWrY4W1mc/sEASIxpRrmw4vgb44cSl
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Users can use devm version of of_icc_get_by_index() to benefit from
automatic resource release.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 drivers/interconnect/core.c  | 20 ++++++++++++++++++++
 include/linux/interconnect.h |  6 ++++++
 2 files changed, 26 insertions(+)

diff --git a/drivers/interconnect/core.c b/drivers/interconnect/core.c
index 8569b78a1851..bc2e416dbcb2 100644
--- a/drivers/interconnect/core.c
+++ b/drivers/interconnect/core.c
@@ -443,6 +443,26 @@ struct icc_path *devm_of_icc_get(struct device *dev, const char *name)
 }
 EXPORT_SYMBOL_GPL(devm_of_icc_get);
 
+struct icc_path *devm_of_icc_get_by_index(struct device *dev, int idx)
+{
+	struct icc_path **ptr, *path;
+
+	ptr = devres_alloc(devm_icc_release, sizeof(*ptr), GFP_KERNEL);
+	if (!ptr)
+		return ERR_PTR(-ENOMEM);
+
+	path = of_icc_get_by_index(dev, idx);
+	if (!IS_ERR(path)) {
+		*ptr = path;
+		devres_add(dev, ptr);
+	} else {
+		devres_free(ptr);
+	}
+
+	return path;
+}
+EXPORT_SYMBOL_GPL(devm_of_icc_get_by_index);
+
 /**
  * of_icc_get_by_index() - get a path handle from a DT node based on index
  * @dev: device pointer for the consumer device
diff --git a/include/linux/interconnect.h b/include/linux/interconnect.h
index 4b12821528a6..75a32ad0482e 100644
--- a/include/linux/interconnect.h
+++ b/include/linux/interconnect.h
@@ -47,6 +47,7 @@ struct icc_path *of_icc_get(struct device *dev, const char *name);
 struct icc_path *devm_of_icc_get(struct device *dev, const char *name);
 int devm_of_icc_bulk_get(struct device *dev, int num_paths, struct icc_bulk_data *paths);
 struct icc_path *of_icc_get_by_index(struct device *dev, int idx);
+struct icc_path *devm_of_icc_get_by_index(struct device *dev, int idx);
 void icc_put(struct icc_path *path);
 int icc_enable(struct icc_path *path);
 int icc_disable(struct icc_path *path);
@@ -79,6 +80,11 @@ static inline struct icc_path *of_icc_get_by_index(struct device *dev, int idx)
 	return NULL;
 }
 
+static inline struct icc_path *devm_of_icc_get_by_index(struct device *dev, int idx)
+{
+	return NULL;
+}
+
 static inline void icc_put(struct icc_path *path)
 {
 }

-- 
2.54.0

