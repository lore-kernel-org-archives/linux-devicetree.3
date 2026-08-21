Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AC984322E6
	for <devicetree@vger.kernel.org>; Fri, 21 Aug 2026 08:13:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787300021; cv=none; b=QwzYJsGocWwbV/kkhJ02IVqaGSdtyURtDiq/aQ7VkWQ/SZvHcpaZ+pQS7KtCPbm9yylAX0w4bSXf2hOP/dwUC4ss9AiNCZKjsKIfoueX36nwSWQAkedWVrhwfKzg8kdnylTNWPEriCHtV3a2eW+I00T/AHc8Th5scSmnpqxBkwQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787300021; c=relaxed/simple;
	bh=gKbqr+JbhugVzrK4haKucfxH1GbAmaJ/63Ra+8PimmQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fUPEjci6lOM0kO02kAv8P7z6G3pNgwRSPq9icFAq8VdHwqmudCRpcgKB6PiVLhJQOwgDpK0EhjFWNSy5JYR4FETE/MdZeOwe7yxBhXLw1QBURvt8dkEoBwUx29rffBEzRY/slFR7BWFnQ5LDwP9os19n683Th0l8i5gt8mGgBwQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jo6Yup2s; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jo6Yup2s"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-3900e39d935so647168a91.0
        for <devicetree@vger.kernel.org>; Fri, 21 Aug 2026 01:13:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787300019; x=1787904819; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rRyq9W1nPrd5M7AXluKRAa4K58WRzpGWnzgIJ9MVQJI=;
        b=jo6Yup2s1jWFxeAGZmELFCYNh03KUuRZJAi+kbVR8e4+Pzlgwpl6NpDG/wvsl20C2z
         Oq5T91YgMsU0EGW8oWpM1ZgUl6q9mJsMePkO+hOK33IfrX8Q+4FSGWbXCCYCJxGciIcC
         yLIrOkJl4837O6LycxrtPkS4GeRSBi/kh2Wei5pXMZYdhpez6uVGdCIu6wQHLQpqQWsU
         LdBLEcdpks2dR/dO9nv/ZJGpT/iznmYj82LNFx6gIOcDJDik8wpA/Va6BVI15qNzWH6e
         N9m/SvddwGYrVCPk102cbi/2i+Va9JrlVbWf/fBPKAJLrc/lSTfQr0BHt//aorpIdj3i
         /MuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787300019; x=1787904819;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rRyq9W1nPrd5M7AXluKRAa4K58WRzpGWnzgIJ9MVQJI=;
        b=jLZZRKbNtRxuFZ7sbAhxabFAkdRn1pwg41ygKW8bnIu//ZrCzb4WoHqq79nbxJw5LO
         ATe/bf7JA02iTFVDkfQGcEdAy9nbdJc6lt1xOQ/C688av49rYyeURw7vtNabxvDFo2LR
         6JfFYtIDhvOyouUv+LeKdWeRkoaz1kXN8ph3/h+T+XYWD7LIDtav+b0uakiDVI2eKlcp
         fZnMh+eNjkDoukxudnzuZSt6GxLdnU+OxFYp0auABikwioBk+HRdr+IVrrTM90Sp6GGt
         F8Lh9ZWkcHGb6IQJipvTn4CibDbHruEw6vLuc3t+rGsTYIvlLolCBrCgJFnj0vevJR8x
         gzDg==
X-Forwarded-Encrypted: i=1; AHgh+RpDYLoOCNGQyMK+p4Hg4YhfDaM+HV3yDLdwa6YVAm6aHCZhl4wBvBtC03/Ii/xVHZdGvpsMSFsb3TuZ@vger.kernel.org
X-Gm-Message-State: AFuF++nRrkCNnQvIKw4oyHDRfpHIIVP3WD5c63R3J1Ri//jb9tmt4GWm
	/C27LI/EPBCUgk9biFvxzkeCdXZmqI2EGRWSJxXPOqoQCOF7ymCnMt70
X-Gm-Gg: AR+sD13hf9gyf33YgU+RmsCKP33WFmoji8QUO4AJKhjfluSHyBOJOnH8RFHbQZH0ewE
	niuJ6t9XIKGc7Xh/v4GitA5sqtUmWB5N1fQ6JeEHF84W0oWViMf0NDWZuvLN9XOYNpMD71jcSD0
	4rF2KcVvLt4XTjEg5bK0nbNWTadCr7F02xIhX3vgu+C6jTsXnD0KgRO9E6L2qFfNsfupKkBfleV
	aupcu9H5sKTTWAPzxKUknLhHPBD/DV4J9aPPKL6X2oTvkxX+ZMqHRxFxp0moucNlvcjzdHtMJEY
	r40r6APXFsVmhPV5ng1Fo8AqU+9wmFrkbPkhv+JtU2uaG1ISDQlvhrOEo0KS8DnqyzS/7rcCoDW
	tiEN7RVw3DJBY7kjPpamYx7lFmFCO+mAUrwFEeAMlIcINfg33fXLXK3Q8I4ADcExFKpJJ8foRvR
	MZdSbAVidogjTqwrsvNgifrK8eiueX0ZuEcFnqs6Evo/GuMORLVh1Gkq7Jsa7+zHJBeMEa/uoUK
	QqfLUMlaZYD
X-Received: by 2002:a17:90b:5110:b0:38f:5869:387b with SMTP id 98e67ed59e1d1-395c35dbf5bmr9219448a91.9.1787300019475;
        Fri, 21 Aug 2026 01:13:39 -0700 (PDT)
Received: from localhost.localdomain ([152.58.217.163])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1416ae48761sm22040786c88.12.2026.08.21.01.13.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 01:13:38 -0700 (PDT)
From: Sreeshankar K <sreeshankar0910@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	andersson@kernel.org,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	rafael@kernel.org,
	viresh.kumar@linaro.org,
	konradybcio@kernel.org,
	tglx@kernel.org,
	ulfh@kernel.org
Cc: bmasney@redhat.com,
	radu@rendec.net,
	abel.vesa@oss.qualcomm.com,
	lpieralisi@kernel.org,
	quic_tdas@quicinc.com,
	danila@mainlining.org,
	davidwronek@gmail.com,
	mani@kernel.org,
	robimarko@gmail.com,
	linux@gurudas.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-pm@vger.kernel.org,
	Sreeshankar K <sreeshankar0910@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v3 10/13] dt-bindings: firmware: qcom,scm: Document SM7250 SCM
Date: Fri, 21 Aug 2026 08:11:22 +0000
Message-ID: <20260821081125.4522-11-sreeshankar0910@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260821081125.4522-1-sreeshankar0910@gmail.com>
References: <20260821081125.4522-1-sreeshankar0910@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document the SCM compatible for Qualcomm SM7250 SoC.

Signed-off-by: Sreeshankar K <sreeshankar0910@gmail.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/firmware/qcom,scm.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/firmware/qcom,scm.yaml b/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
index 037d4ad8f..0cbdb3b2f 100644
--- a/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
+++ b/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
@@ -74,6 +74,7 @@ properties:
           - qcom,scm-sm6350
           - qcom,scm-sm6375
           - qcom,scm-sm7150
+          - qcom,scm-sm7250
           - qcom,scm-sm8150
           - qcom,scm-sm8250
           - qcom,scm-sm8350
-- 
2.43.0

