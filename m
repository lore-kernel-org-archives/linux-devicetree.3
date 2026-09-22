Received: from mail-qk2-f36.google.com (mail-qk2-f36.google.com [74.125.230.228])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40E5437F75D
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 01:58:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.228
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790042294; cv=none; b=UOy6HSRNd0ZEX0ZQgQMx5TpCjFCX0Lg2f4Rt/VSksJzwHkMl93c8PmB5ytFokYZwyIvw756kAIq7CFDLtSsogUo4k2dJj3QAsxhOQm3ICazFHAsr/NPcwnJyHVY7GfnuQySSTYOVtpAVvbGTu0aWnU5EINYGuXHznGLIM4jGqk8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790042294; c=relaxed/simple;
	bh=R8K11s0BndL6LE0ql5BRGc7vujvck+7Af7FsCOsZG98=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NCwD72mY3rWtH2QHhI/vnfOCtPOanN3M0Ky2Mo7RemSbCFzz12tYARb9+7SIuHf2MOOJAQoa1hLoD1vb2pgn9CwY7egzdCg8WgHX/LDsw8ILZ3EH4SWu3c3/PNK8j6K33oQT+ePo5xTvL2qlnNAUfAKYTAJrEgANZROtpJtCATk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qsIUay0g; arc=none smtp.client-ip=74.125.230.228
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qsIUay0g"
Received: by mail-qk2-f36.google.com with SMTP id af79cd13be357-93910cadeb7so367757685a.0
        for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 18:58:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790042292; x=1790647092; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SdHhQQ9Rh/yme+QeCJrihS365SLLVixpmNHdxOf0vqk=;
        b=qsIUay0gORzqajTzlYbEE664AD+a1BN98rH9nEYFjFojy8vgmUBMVKHw9TFQF0PxXp
         fEO6jEpKOxwN5yZv4cer2u9+T/hOnD+onpUipqTejr/GNHqk2pk4wHRc7PXqcHbeA3Z1
         QzOzcoUl6ZkBmaxY5CnGYSyu2o2aFOs4pgzjKBZd2sWASJzMgcb7h2DO2pQXQJF55tjN
         ZtF933QNDQM+NwCAdcK9YTDeqpqElPl785HIdzbhbdKp1pGiC+3OTU6OcjorCq6TdhfS
         O0J7FgsgcB7TGEyrKnZbXmva0xpbK9ga7LVq6zC370TgTVi8Xs54YvY2zduUg7/PTzcc
         STeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790042292; x=1790647092;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SdHhQQ9Rh/yme+QeCJrihS365SLLVixpmNHdxOf0vqk=;
        b=PholmuDWbEz5Z0a0VTSuqMVo8Jte9dqHy09vwCDPCGpgD6Nds48HHFJfCTScOLoX5g
         XMrLQ9lArUXDhyFBDd8woCVDsu/Td8eBnyMpfimn6P72z8L7KcQhvUaBawNrl+m/XrjA
         QmjTfhS7LP7i4g4+Zi/oZA+n3Kt6+Lttf5TLd4tJyB5KJdkSTzHwHmjIcEUFoVLP6CGV
         USlbm/4dnrhx4Vhixv1y6g+DbRT/brxZXFOFe5enGl86ZiGM5wdKtDnyPHwb8uxEAd1m
         rybWorYjrXamTPrPmN4fxQl4aI5uloy56nET7FWBBII/AY7kfaARj/KdOPgHLMSalWud
         2ywQ==
X-Forwarded-Encrypted: i=1; AKwUvByM8LJCtq1MClsie2tLj57yEwyyqOekIg/RsNT5b4nWzBHHWkbVdNl2+cePrAxaC09gQ+KiH12bSOUt@vger.kernel.org
X-Gm-Message-State: AFuF++mWoBfkwKG2QHLXkNK/FJZnDHEsvcL5Zmp/7FVp/svXu0pY/rMr
	b1cME0ugmKDVT2czibFVyk0SQfFW9KWofTnvep6a1+GnyeJ6DMXAQl9E
X-Gm-Gg: AYBFou1SACwarM8Xbe6ldk2ljAZE7bXbuvGuDRBwop/I5W6LMubbgrokiacf7y08Cj3
	BQJW5ktpsUYjMhi3837kXhr3YmfrSLoWEkJ9aOUeolT+k82a57IUo/OTcL8+2zf56Xs4aytA5zx
	TgSOUUFwzGdBFdlITYgb5WVZ2y5YELx2VjwfPIDBpB/sc1ymMBLfDIP6O7p+5pMqAQbCVFTgOre
	ze5VOZb4OiMi/n28aOKJBdvwM/Ph3yKmoRtZ2gKFxpZG2tXxTtlVo3DUglYwfCsnBMbq08uzUHq
	LndJC1QmMmJ33Q2Q5CyrzEzkUHOkBkYSj8h5HiJ+TaGIvgDj2lzIxwMolZW4WtiyOavxfVb4QlM
	YXaTIWf1oX0BcjfLY0il7yv1bVeHB0MKLPPB6dwetg0G306b4/3okT/ffTxtWgco11jDgSAOxbk
	m7h+gpCxE29PwTUrdiYbyAvGHbbxKuPuYZEqutoYZs/+gKF+P2jw95ToQSa/NK7fMjIe1Lfocd6
	Q==
X-Received: by 2002:a05:620a:4412:b0:939:46d7:4b4e with SMTP id af79cd13be357-93c15d76553mr341481085a.7.1790042292116;
        Mon, 21 Sep 2026 18:58:12 -0700 (PDT)
Received: from localhost ([142.181.121.230])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93c1d19ff89sm16781885a.24.2026.09.21.18.58.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 18:58:11 -0700 (PDT)
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
Subject: [PATCH 04/11] dt-bindings: remoteproc: qcom: adsp: Add SDM670 ADSP compatible
Date: Mon, 21 Sep 2026 21:57:54 -0400
Message-ID: <20260922015801.32373-5-mailingradian@gmail.com>
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

Add the compatible for the Audio DSP on SDM670.

Signed-off-by: Richard Acayan <mailingradian@gmail.com>
---
 Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml
index 7e8ecae8e6cb..f0f6fe1f560b 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml
@@ -25,6 +25,7 @@ properties:
       - qcom,msm8998-slpi-pas
       - qcom,sdm660-adsp-pas
       - qcom,sdm660-cdsp-pas
+      - qcom,sdm670-adsp-pas
       - qcom,sdm845-adsp-pas
       - qcom,sdm845-cdsp-pas
       - qcom,sdm845-slpi-pas
-- 
2.55.0

