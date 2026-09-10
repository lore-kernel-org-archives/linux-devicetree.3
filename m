Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B43C1483820
	for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 12:27:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789043263; cv=none; b=AH8KcUItDQrudBthyCwSya4vn9P9FLnWUr+dw3Nb5cYaCyVbwnNQ7WpHvnWF8PBF37dmUzYEPRzPBBl+3aZgB8PhCaDM8z2HgHzgL/iRjaEDELhed1TLWR8cgpH4CLhmJdSoWI63c+pysmbNbTrw2sbhtIeiPijcQT2ACGpZSlY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789043263; c=relaxed/simple;
	bh=Lh+SwH21jhBJph617FXvRF5JB190/NoNd9H1iE00Q2k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BQAhhQmEwS4Hh3j2a0/N1ToGO21bKCyMIrp0aczI/1ZiTHngCSG27PihbUPoMyXOWp7pSJ4cOAOI8qRtzv77oV6OdaDmw61ULA1lzvcPzLAp3cfGCJr/lFC9CjKCTucoCfC6Mr9nZZo+pB1iFeRpxoFElUYsAXUgExMR5SyddBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TMxbFDFm; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TMxbFDFm"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c255c58156bso1489114766b.3
        for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 05:27:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789043260; x=1789648060; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=U2IuLo0IrIpLFjdkCWDq0IoYangZfYaae/T0dXFNw/g=;
        b=TMxbFDFmt3hxXLACKpMJJLpqffUk9hvoGdFYTa7ULXzo9tOMwkHqFeIkwQ2l6tfBhq
         LOQA6YGzvWI+GKv2ddjzG1+j1ejGIFOob1h7gxDn/jbotZzlhty+PRsRTNhfEp99y1X7
         RkIcpAKAM4+Cw0qbA+BRwHFyI66jInSRShrOqnrk7P22MQkKeoNG4yHrPnQGOlvq+Nr+
         Q3FCLfFe+g8NDqk25YrcAqSN1plG3Tmom0nw6P2MFwVZXavRUnm21cNCALY916ydyjU4
         Ns/J1ftRW/Xeyl67UYVheYg9Na8P+lCm5XWjtD0NCEBIcIHXABEGZOGz9rioVu+ABiEc
         b7jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789043260; x=1789648060;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=U2IuLo0IrIpLFjdkCWDq0IoYangZfYaae/T0dXFNw/g=;
        b=gBZeNpiWkQLMwWXNiIbHTc2S0wxYDgLvrOhGPRUuz3yTPhbWcWTNb1PYvWbjNYIzWQ
         mCPSO1VsJopEvrDcrFBvDzUApLfmK4JPWO1EZTgtuHQoOjJccvZ4EaBjhmPxkdgtZ+3w
         IrJiUPFcM5JyA5MS1uKaPg9waZwgeYcICS6sv3IxH5qBIappULsMwnQfrQHBVp4krTir
         BFTwILVOq7JJL7mQwNuhIxRCEy8trd96rYSLnpUVgcxPs785K3mo8K4BRInyrpYVt/YY
         qhvlXZpgzqmxQQVUNSkQ/nnf4EymmauOnqMiGw7+MKcHTiEjA7mG6Q8bB0Ea5VJe3QVf
         iWCw==
X-Forwarded-Encrypted: i=1; AKwUvBz8zlAD5CXiwZlSFADwMVAf6QYUoTuFlcIupwvGhWHz14VIAT1/KGTqHNzZtu1iV9MMY7EWc1FNvuDh@vger.kernel.org
X-Gm-Message-State: AFuF++mhcntMOqPBO0lMv0KBIkZ7ylFdMGoYwL224hNxF3N4KMDXsyyd
	90eDPKAmSVRnY8d3qcpRi/D5uy+IrHHFoQ71YYM5yndTms7jye/dQQhe
X-Gm-Gg: AYBFou311wW3OkLOwA+LhXHhUaKNx0k2HkrQ+K+5YoLwMuhBK+izL4KvijNDJ4lkLQf
	4HCT4PUVQSEYAxIoIVdcOoTNje10GqEP37Wc6Jn2HvqkyD8FkBfVAQzYkVU9jXxeJBdtyM2CE0w
	/BunV4rFc5QHZhWLaZ42U6TGnIwB+2MUWJVyP1iT84ZlfMsxfL8S3cpVxwgUwSx4pvhYDQZnPgt
	ccn3yIMHr1FEYbLFrjZFBjIm7GVLfzSdNO0GN3+Cu3bTyqZ7F/D5OowLku09rAGxv2UH5XOrdnz
	5HPx72u8meYLKY5syUpZMtX+CB5rjK9SasFluXsaVg4k2wdqQVt/2Ebw+10hopk47XxzsIIDFNE
	nDqEswtT2H7syjHTUXD4m22d0BExbMGWbmst34e5aOGBjTLyeFk7WTtsMwTrZcdXmsvBqPJyCRI
	EW0gVjvEjCh3r/tb8joGnZ1VGzHypBpsqSH1KnUK8c0xJz8/wvuO/Y7S1QHw==
X-Received: by 2002:a17:907:6092:b0:c25:64ea:4d70 with SMTP id a640c23a62f3a-c260c65c251mr1785575466b.1.1789043259949;
        Thu, 10 Sep 2026 05:27:39 -0700 (PDT)
Received: from [192.168.0.68] ([79.133.247.80])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2951217d12sm65136066b.44.2026.09.10.05.27.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 05:27:39 -0700 (PDT)
From: Erikas Bitovtas <xerikasxx@gmail.com>
Date: Thu, 10 Sep 2026 15:27:22 +0300
Subject: [PATCH RESEND v3 2/3] firmware: qcom: tzmem: disable SHM bridge
 for SM7125 platform
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260910-sm7125-samsung-v3-2-c467bea0fb9c@gmail.com>
References: <20260910-sm7125-samsung-v3-0-c467bea0fb9c@gmail.com>
In-Reply-To: <20260910-sm7125-samsung-v3-0-c467bea0fb9c@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
 Kees Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>, 
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Stefan Hansson <newbyte@postmarketos.org>, 
 ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 David Heidelberg <david@ixit.cz>, Erikas Bitovtas <xerikasxx@gmail.com>, 
 Vitalii Skorkin <nikroksm@mail.ru>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.15.2

From: Vitalii Skorkin <nikroksm@mail.ru>

Currently SHM bridge causes RCU stalls when booting. Disable it for
SM7125 until a fix is available.

Signed-off-by: Vitalii Skorkin <nikroksm@mail.ru>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Acked-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Erikas Bitovtas <xerikasxx@gmail.com>
---
 drivers/firmware/qcom/qcom_tzmem.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/firmware/qcom/qcom_tzmem.c b/drivers/firmware/qcom/qcom_tzmem.c
index 0fd9581275f1..91d59e3e5988 100644
--- a/drivers/firmware/qcom/qcom_tzmem.c
+++ b/drivers/firmware/qcom/qcom_tzmem.c
@@ -82,6 +82,7 @@ static const char *const qcom_tzmem_blacklist[] = {
 	"qcom,sc8180x",
 	"qcom,sdm670", /* failure in GPU firmware loading */
 	"qcom,sdm845", /* reset in rmtfs memory assignment */
+	"qcom,sm7125", /* hang in rmtfs memory assignment */
 	"qcom,sm7150", /* reset in rmtfs memory assignment */
 	"qcom,sm8150", /* reset in rmtfs memory assignment */
 	NULL

-- 
2.55.0

