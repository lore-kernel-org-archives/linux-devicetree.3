Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CFCA41F7D4
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 13:06:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787576807; cv=none; b=ceODVCpGv+wQQNePOz07aeQTbgGsrKGC7O+DsDpQESfQ66sp4hMRhT1uefX7HUpMZ6w8P3Li9I/KERmYmqlsXyvCoMLOkn8MSUdD++9c+CBGn/4cYZCQP+X35z6SYfAH1rULKJ1bihI1GR2o4WIx8+BiHEAejEPOVu74wPodw60=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787576807; c=relaxed/simple;
	bh=iyIt2VTzEWJFddhlukajc/L6+s0oCbiYJdxmCZQgWaI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qRFXP7gwOmwlkk3/CTUdu+8oT5HWSy4/H/i+SDUkFknJ1Dw3Nm7C5zESh5p+XJNcSXDQVSVQXf5Vu4ihdVfbBE0HVnzwYnqnhmWqqwqXsHAbpJxctRzabO5B0QXVmY6xjERmWAI5E5aRuTbN9mwr/Cdxi2aKz2ehd9zLDEMdm9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qQ+ZNjxr; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qQ+ZNjxr"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-38101f85591so3652755a91.1
        for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 06:06:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787576806; x=1788181606; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CRwL2GsSIS/j4FawlFSo6ds2Awqey70m0LWn3uJFJ0Y=;
        b=qQ+ZNjxrt9TCZP7krXpKT3XtkPWwGXThNVY8pamUDRY7RpthSuS7emqbqg+Z0vz1hO
         T/Q0U2+N8XUXCkZ3wgIv5fWgEZGEbcA3AFbXDW7nMvOYu4qfO7GGJhMW/5DgtWbxvjdS
         iMft9LPMbLYnCRwts1cQizR7LXrfe4njfyq11lN67Fp/oCfeB7xj2lamC18bD1e9nphg
         QLiefDzftZahxK+tjIsf5gxT6aEeDJDNah1FuN+pJ0/1sOgRhviQ0GUh//RCSmpPlAkP
         JSYaOYnza35VWNhIiPS6eHgsdZOUJoxx3nU4VjGrdEEUV9NIc5Lo3zMhRNtohxCkXMsF
         7Svw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787576806; x=1788181606;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CRwL2GsSIS/j4FawlFSo6ds2Awqey70m0LWn3uJFJ0Y=;
        b=BRxAtaqgRWILaaqj/tzcajAoAG0SvE/TQQkJm3nbFJN77cldTohLBqunS6BdfgSksE
         sCnGoGGuv7bnOIf7YXeU8L2wyUgrjQOyoCv6OLdYZGIB2FZqMqu91Tmnyex2M6DpqVZq
         87PCIc17WJ8U13euClb4nI7vaa5fJZjBKjWtYfljoxflWD+m+TQYn6nb3cO07gDzh+Lu
         YgAhtpGaNVT/9gOVNDSqt7bG7/7m1hTDM0S2OTu9DC+rpdg3LQMG7KIi+pkKiiH88K4O
         VRj0JK1gZPQJ/VY0mZoukx0i7oufOwFDoJZL+4Z63BkzhFehpLdR3yfZ/4ySmws5xG2i
         3wGQ==
X-Forwarded-Encrypted: i=1; AHgh+RoKco6ZOeRW9skCPjjxtVLISYujVbSnySAhBT/aLanc7bW4PcCDDcM25pRxXLwtwLDhHZEj53YnNR3M@vger.kernel.org
X-Gm-Message-State: AFuF++kfIEWPldftNnxXpZa0nA8rSRaQ25A9SanjkPF9RomFmIbGBOYR
	oAsZ33WophL69RmK8+aXRyhJgoQV2XZU0/gBYaTo9JBKhRmuExrZZQxZ
X-Gm-Gg: AR+sD13/wgEgC2uIiguebx80ny2k6OInBJLqFwfBIH7DXlwIR+Mu+wsHRmOyRcvnKeK
	1DDWSS3L5lbmvfHMuwtQESmFjDwC/bm/A0vqa6WpQfP/wQH5NNzyak9aqf3kb/Rxi9e+fTfD6kL
	/kT376dMBdEZixGCGejer33X1JfDQJYk3oo+heRab1d2mdh31fp+FSouFIGqAfpNf8VuY1z0yBI
	yqGs3cVgcYIDc7xsruvdlp0GTXT57Jn9cn93THTg/KgqtpeyR7P/7LbJXUExqhPvNfxSNm10vSe
	Nn3GtvPhnWakHwsNEXylWbWcpd5cRKf5ZA1B39NDjteh8HzXYQn242e5j3EijuW59w59+Jg+WLJ
	qBDjZnLqLL8GP1mo/sJahy9ztr5fG+huIpTICae9L7WZxcbROnfCdeIzFMe97j2E9S3F5yaXflJ
	q8+/CSXG0KK4wSdla0cla/ZJ04d1niAZeay5PbabW6krYjw0Hb1n/GPqoEKESBZyswRxTxGlcul
	vcmtE+nymx8
X-Received: by 2002:a17:90b:3bcc:b0:37f:a913:1554 with SMTP id 98e67ed59e1d1-395a06bc47amr39222445a91.16.1787576805712;
        Mon, 24 Aug 2026 06:06:45 -0700 (PDT)
Received: from localhost.localdomain ([152.59.223.115])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327f92359c9sm26409711eec.27.2026.08.24.06.06.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 06:06:45 -0700 (PDT)
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
	taniya.das@oss.qualcomm.com,
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
Subject: [PATCH v5 10/13] dt-bindings: firmware: qcom,scm: Document SM7250 SCM
Date: Mon, 24 Aug 2026 13:04:34 +0000
Message-ID: <20260824130437.2771-11-sreeshankar0910@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260824130437.2771-1-sreeshankar0910@gmail.com>
References: <20260824130437.2771-1-sreeshankar0910@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document the SCM compatible for Qualcomm SM7250 SoC.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Sreeshankar K <sreeshankar0910@gmail.com>
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

