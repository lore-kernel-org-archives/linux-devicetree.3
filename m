Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E82C841D210
	for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 08:09:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787040585; cv=none; b=EZUsa29HrXK/JYCUNsIrZkTb5r6K9uKtpUiZVeMBgQ15rLGgHzMF5wTJCwyCSmYjlgBwFo+tlxhhBzLo2Ma7PT4v7rIZH0oGPVt5j4SmhlwsATelqj0XF8G89McYv/iG7BEJSZ/Qnc92pyxGH+I4eLYoRPPs1sfcvFaXgPO4WL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787040585; c=relaxed/simple;
	bh=Unl00eAfFi9To3aFPzg9GlTfdXTVfm9Q5VowGJ6jvsU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=h+Psus9nrSPq2Qw91B6adeLWEQPEQoYNCiBRabE0oo7ITnv4b+zaiAuvUfkdbcUJ/vHuwjuuiQSyh9XKUhqouszwNGi2fDT+kKPFyiQI7cv9rzMSQ7+x/QiVif7Vv400P+FNIGDG6VJjiJT5SW+beCniPJfHoCFBSxOn7rO4mvA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FF4dQhan; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FF4dQhan"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-38e88b60121so3305305a91.3
        for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 01:09:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787040583; x=1787645383; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iR99/HU1Sv6a6aJcZCVFplbKZQ+GSq64X/oQnCgwbZk=;
        b=FF4dQhanQa80jrhuV8O5EinHloE+L7I9SIrdGbMeow0FtBxQ/1MNZz24ApzJDTPdB+
         gwE9iSNQ2eYHu1a7SOyWGMlSdtEYDoOFftLjKciW03I6Wg2waaZbgvwAW8DnBqPpPM/L
         JicDDisW6Iwz0YYCCK0uwCVxgT1834HS+4IUTv9fNAcQZagbGBMkSGs7w/a7M4xGPgkp
         5DrDSU7IYe6Z2Hl8u93vz95vl4T5hxs/L1rElblduNAqZ0Q9Q4CZGm0eWjsFpt+bYaRt
         JhNuOytstuQJgX8Wsk8YrYCdgs9VJkp2VOlOoPaHdG8Fh8h/OKQh6SZA7QbCwGI5Petf
         Qfsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787040583; x=1787645383;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=iR99/HU1Sv6a6aJcZCVFplbKZQ+GSq64X/oQnCgwbZk=;
        b=YXUD5Ysw1HYK0n48bJycyNm7w9adGK2Cg1+dVufrpLzihzSNJdR/5Ndj50/PdYX6pV
         R14arVmjkGdKVqIACPItMSdMVQPOQ1LUxJ11T7i50p+6j26lK0zTWz7wlq6dApUSeeIV
         N6NdNhfQ0gCBX5xWn9d7aEwHvVJsBSsf+ur6jryd+lXHhwPnXwV7aP5YE+DK6sZIrg1V
         XXPoRx5g7SzTxQ75kxIfBDmFIBQSfQ5NIK4h1Msaz8RYChbgCNSfDP5ThtB6XymAO9xB
         IRHVaJIAJ0JU8S3IQslDvJRvLDXUQmPwB0HxYn+rMOtILargf0zyqZdxbXDXL9hFpRE8
         WhGw==
X-Forwarded-Encrypted: i=1; AHgh+RrjrEkDK4u5xUYofizpC3VVADF/AalmgFvMANTsUQFPwU64AzpcYQs8S4llEufHRCl3+3hDbFX8VSp5@vger.kernel.org
X-Gm-Message-State: AOJu0YyENXf0Gci9hh5+x+Ieg0bEo6KW2IBhoeP3OM8AO7/30ml0GiU6
	pjQ4a5WE44jLt10UTPlsDb7L8WJ8lbaMECsr/dWQ8A/MRBUK3g0YZpXr
X-Gm-Gg: AR+sD105k8rFXBB7OAoYM/pHi/vSkifvJuJziKOdQbrjuMD3HkKMfhsHzuKTbfyjlFb
	QOFltcio/bEfunI1EJP7RmPKUlot0mnJKi65DTZjwPEHthdLVp9nBQPtpPcRfNlv1FQyy6TqAQh
	LY2SBElHuyKpelBO+Shq20WueL+XChJa55aOeP9mYn+DdxARJy6FGmIWYNE5pzQX87MT4eLiWC3
	d/HuqqcEWj7IguozgJWCBhLSoeGlWx3DMefPrAQCJFc6Qimb6iSUloFh2Z4UGQcL6qP+aBMrLbY
	HQ+gok+bkkvEYCXl2T9VG1waDSVwHA/MuSKqOgalL4f98lzAOcJHwFDaWo3RpNTj6YPdUWFiZwR
	hpYMfbJ0qbvhucVNpmWe2jW9md504rgWAB9LWlVjdp9+kH43iZnz0JuA1ncwxNl1gRPgX15neA2
	WRE4SrEs5LEX4/Vh8ug9pWHMmHK+hxR+hFjIkfrgpenYx7/AK9IRIuTSe62A2g9x5Yi8cOYLAYa
	AoIBm2Gy3k=
X-Received: by 2002:a17:90a:e18d:b0:380:7688:fbe9 with SMTP id 98e67ed59e1d1-3933b764d23mr35772186a91.8.1787040583219;
        Tue, 18 Aug 2026 01:09:43 -0700 (PDT)
Received: from localhost.localdomain ([152.58.217.90])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-32678dd08d6sm22606290eec.4.2026.08.18.01.09.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2026 01:09:42 -0700 (PDT)
From: Sreeshankar K <sreeshankar0910@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	andersson@kernel.org,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	konradybcio@kernel.org,
	tglx@kernel.org,
	ulfh@kernel.org
Cc: bmasney@redhat.com,
	lpieralisi@kernel.org,
	quic_tdas@quicinc.com,
	danila@mainlining.org,
	davidwronek@gmail.com,
	robimarko@gmail.com,
	linux@gurudas.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-pm@vger.vger.kernel.org,
	Sreeshankar K <sreeshankar0910@gmail.com>
Subject: [PATCH 09/12] dt-bindings: arm: cpus: Document Kryo 475 CPUs
Date: Tue, 18 Aug 2026 08:07:51 +0000
Message-ID: <20260818080754.4362-10-sreeshankar0910@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260818080754.4362-1-sreeshankar0910@gmail.com>
References: <20260818080754.4362-1-sreeshankar0910@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document Kryo 475 CPUs found in Qualcomm SM7250 SoC.

Signed-off-by: Sreeshankar K <sreeshankar0910@gmail.com>
---
 Documentation/devicetree/bindings/arm/cpus.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/cpus.yaml b/Documentation/devicetree/bindings/arm/cpus.yaml
index 5be89c584..2a90af67c 100644
--- a/Documentation/devicetree/bindings/arm/cpus.yaml
+++ b/Documentation/devicetree/bindings/arm/cpus.yaml
@@ -212,6 +212,7 @@ properties:
           - qcom,kryo465
           - qcom,kryo468
           - qcom,kryo470
+          - qcom,kryo475
           - qcom,kryo485
           - qcom,kryo560
           - qcom,kryo570
-- 
2.43.0

