Received: from mail-qk2-f35.google.com (mail-qk2-f35.google.com [74.125.230.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B57F237F75D
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 01:58:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.227
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790042288; cv=none; b=rNFbTbibtPEcf4Jaa7oF5ev8OT+KcYHoJDPw6m1o7518T8QrhE4oHvqufP5doVvz73nIiC4xaUDifmMIZvEaknzFQwgWbFJz/yRbpdww8r6Bisydn/ptQd0Zfxzb4QR7dhHjgVRt+z9rfqUi/7OmDLSt+s0AJpCsJhJBOKChI3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790042288; c=relaxed/simple;
	bh=aNnUwhKo5OWaeITKE/V1RLKjimX2AydhyY8J6h0P+DE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cGj/YiFabYpiYB05t2xmxfijRlxAWsjUqFxoFWrYSnXgihq/xIRcoG8NlDIweulrdIfpMgXNIBN6XR4DwiA9NvjWaiL9TJtS054AOrZPqh5E2ncExKpuJ/xrkky0wuuadMIfIomtsywAqqhRNnIrRiHDwLH0qLUe6Dk1lyP66sc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YwA1xJC3; arc=none smtp.client-ip=74.125.230.227
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YwA1xJC3"
Received: by mail-qk2-f35.google.com with SMTP id af79cd13be357-93910cadeb3so272550185a.0
        for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 18:58:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790042285; x=1790647085; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TJuZQqGF1rNZ10ZkvnBMS2sNZzKZITrbk4Ko0Bs8caU=;
        b=YwA1xJC39kteH0qwiTOaJIu2G4J3vUttKr7PW6knFxBbF+gUJKJj6svhnqTbZw4LiY
         ZvnAx/xqW61oi09xvxQBWMXpHp1EhodTk+U9ifuru5EgDimEdEtcGlWMGDu/Jt66qenZ
         6SMSGLtOUkJV3WQVCoOLlOo4/oZ6NTnztI19ClcsaZC7Wtr8uMC7BN1FfwAUc5g/ua8p
         x46L0XSJzCIKK1UFaZG9nRJgWTqyFOiiDO4phfZnOOOeHWmHa5gfiB7w5ilZ2ESEhWLs
         jn5Bzx9VMvANTDu1gdlmaL7m9mMr2zsQNjsE8/wURYEOI+nbYvDT32g3FLylaOmbtjPb
         3ZyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790042285; x=1790647085;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=TJuZQqGF1rNZ10ZkvnBMS2sNZzKZITrbk4Ko0Bs8caU=;
        b=ldDKr0dqXtM7B13T8/aFyYU1ZEI7oCC+6RAEaFdy2Pe+v29cRnDoZny0MAfJFMKU6J
         TvwqoH9Ec42TSeWA0RQFVRioLLda4oR2eLyqyWObj3bV5APJdbzoFDHaZ+mWgFXxXPRV
         TXXxR39UUMdmj4xbtLvgzg4DLiITdxG9OW587U04N4Hcpco/e/wKT5FS/QqsJqktp1lT
         7nGVS8prxZj1yb9nOrQkSu7zH7mh6ddFFLAUibWkEksaNV3dVIsossTCeocbbkmQoWEx
         iuSX0vFtYYQTL4l/8ROK4iXRtvmxcuy0Rb8y38NgTGYCRZUNy5iMd4uIQkB5c9/ssGI5
         tUMg==
X-Forwarded-Encrypted: i=1; AKwUvBzRog+NpLMhf1YuEQt8OX3nGsotVPOAwn3gsM7BEVQ54Ota+i4Ttv6KK+PYA2UUjduZPHoScT5RnzoV@vger.kernel.org
X-Gm-Message-State: AFuF++nUJL0NfJLKB9mdf9JhwCHXvNmzZpWvOVLPxSE74/D6XJbcHCdR
	pl4QGjPLooqTmC+ngG8anG8a9Obmcts5jzjlBJzlKUr/4tNl4cJcBx9S
X-Gm-Gg: AYBFou2wloKeOpn6NhCTKnXuWGhUIuAk6KuBjRlFgaJSsPn7xiwk6XRPVNhUSdMHTwL
	eI2lMYzDTxqClbVkvDtrMZp1K1ZZYlWImCYJyBoEJWlX4/IkUbj+Q6E/MnBffmRy0LHOyPwc3q7
	a7EmpkEKgiGkNaeSLRejfz4HkzXO0oVgjTMwHwGmawL1JJvfdcJ7iY/YswuqQYPtfhR9uMx4zbn
	4WOlVXRuvh0irXJ7s0x9x9SQMOC4PpEnDmOiI35X523v2XN/+WRy639cGGb7tSS4fWDwyZWjWpZ
	vSQXKBDEjZCSdxI7ENLLiiwXgj5LvFNRuTjno2pjOEAsSRl1fn0/ibjVzyLIqtwuDOVcho2UjPT
	DHTZmwnqWbNwycsHVnu3QwYBR4RcrWmTECEYne/5tyV7edKDTMJ4/CzLmXRsi9lDNhsaKkO/ysl
	KrJcXs4f/jvTiCTZlT4ZBOcQBUMmE4mIq8KbhQfOTi0H2+mal1YC3Vn44izcnqYzF6NZUFJHi1+
	80LrxaBy3sP
X-Received: by 2002:a05:620a:4412:b0:939:b8d6:9b1c with SMTP id af79cd13be357-93c15d73ab9mr365709785a.19.1790042285432;
        Mon, 21 Sep 2026 18:58:05 -0700 (PDT)
Received: from localhost ([142.181.121.230])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93c1cf0dc12sm18928185a.5.2026.09.21.18.58.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 18:58:04 -0700 (PDT)
From: Richard Acayan <mailingradian@gmail.com>
To: Jassi Brar <jassisinghbrar@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Andy Gross <agross@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-remoteproc@vger.kernel.org
Cc: Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH 01/11] dt-bindings: soc: qcom,smp2p: add sleepstate support
Date: Mon, 21 Sep 2026 21:57:51 -0400
Message-ID: <20260922015801.32373-2-mailingradian@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260922015801.32373-1-mailingradian@gmail.com>
References: <20260922015801.32373-1-mailingradian@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The sleepstate entry is used by Qualcomm sensor DSPs to control
suspend/resume operations. Even though there is no full support for
sleep states, initialization of the entry is still necessary for some
DSPs, notably the sensors-bearing ADSP on the Pixel 3a (SDM670 SoC).
Allow sleepstates to be declared in the device tree so they can be
initialized.

Link: https://android.googlesource.com/kernel/msm/+/91edfe5385f2640a338e2ad230d0fc03c73b77f8/drivers/soc/qcom/smp2p_sleepstate.c
Signed-off-by: Richard Acayan <mailingradian@gmail.com>
---
 Documentation/devicetree/bindings/soc/qcom/qcom,smp2p.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,smp2p.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,smp2p.yaml
index f91276822858..7862d68c9678 100644
--- a/Documentation/devicetree/bindings/soc/qcom/qcom,smp2p.yaml
+++ b/Documentation/devicetree/bindings/soc/qcom/qcom,smp2p.yaml
@@ -60,7 +60,7 @@ properties:
       Two identifiers of the inbound and outbound smem items used for this edge.
 
 patternProperties:
-  "^master-kernel|slave-kernel|ipa-ap-to-modem|ipa-modem-to-ap|wlan-ap-to-wpss|wlan-wpss-to-ap$":
+  "^master-kernel|slave-kernel|ipa-ap-to-modem|ipa-modem-to-ap|sleepstate|wlan-ap-to-wpss|wlan-wpss-to-ap$":
     type: object
     description:
       Each SMP2P pair contain a set of inbound and outbound entries, these are
-- 
2.55.0

