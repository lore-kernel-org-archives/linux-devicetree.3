Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D88003DB62F
	for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 16:46:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774889207; cv=none; b=p5LdqouugCkY723CZkpctTHLC0Uv3Vm3aIVo3QSpXUqjDxFudlgXeHx8BiMFEBm0hNluLuRUO3/DNDpyxovP30Yc99rpXHYs4fqU4FaCQ2XadjD/UOTIrVUuYvfO3p2jX2pDQWJXtOcvo19jheS8IzE1wrTtn/Wo4ZmGrtHTfiY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774889207; c=relaxed/simple;
	bh=NwyXZR7QbGUDm1mOXnBWp7u20Y6XzKuZR4MVtnLVmfA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KMhWXpe7WJ84HehOPDZ4lbRA0IA06uaQBPmKoBnV6DtIdX5+lbxPRNs7gsq8QehGq9tEiJ3x3QIPefB2Np4nuZXfsd5KUvA+jDhyxZM+uhU8hja/7OfxX6rgzJ5q1ALE3uF551+oOxUw86nXYPSg8PoXC5ZbZj0xTGkECRM+J6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FpmxGqVB; arc=none smtp.client-ip=209.85.222.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FpmxGqVB"
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-8cd7284782dso286158885a.1
        for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 09:46:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774889205; x=1775494005; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K8GGrYi7FgQrxm+QRG1h+SJv0fVPLGse+KqfIaRcTgM=;
        b=FpmxGqVBiNIIVukMq+z0S4M2iJG76S5my68R780eE0C6R6EwiFOMurIf9J/0iqKg8U
         IfJ6qp0XzpsgBKvUyty52K5a5KQ466BeWMizLMx5YBLEvVhyH6y2r8L1FBtbaKcF2TZm
         fBNvyonAwxdaW2iMDgORhP1fSPyDjpi/trHA3B9efGCpghgsafsd6KJN+vPcG8Cdr9ka
         01qxxpYlxQGDUibTm0/81SKDAamKwjfCviztPcURDV1YuQiH5QodklcAgGyLQ9ZLK5jQ
         FfrhxFp9bK8Isa4UPcHGfKe0qj00DP9DECGrrNvEz95AZqkV6MVG1gMqZakJtrqGOuz6
         fV9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774889205; x=1775494005;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=K8GGrYi7FgQrxm+QRG1h+SJv0fVPLGse+KqfIaRcTgM=;
        b=k/DPGlScpBHIWfqiFBEjxquBcmv9Kr/sLP2CeEH9cF3AifCO0Fn9M5b5uMuHn8Vfm7
         KM++rMyEFO02+CMoqgXhe13WYXOcxXiOoaJDrEJYKYcJlL1zEHZWxVF3zwzpAIQqiAwr
         AnUlohfAiQB4FnojDBGQvAbtZZatvIdwhoF5RYzsxHaeckr4o2xPQih19Kol5PtcMqcs
         zsmf/B0oAgONScJiPfR4tXAvZ/KE8tesMs3PKHvPoYy/1kz0yTrbuBLw7PB6SjBZjWYH
         ZXsdzj18792nBLF/szl9Q6vVg9jDvD3RFxwzAIE+eEv0aPddDbk2w4FrWDtkYQQOShI0
         Vr5Q==
X-Forwarded-Encrypted: i=1; AJvYcCUAFHub/YWgrpZyqGLkQMGKgXjluSYP9Zhj8U/LE0gvc4TKvGACSrU+EwOB6+/bQZPip6BRXMljMlVC@vger.kernel.org
X-Gm-Message-State: AOJu0YzpPSacB6g0k8+KCrXu9Z6RnbzrDK1nApY2OvcAXBuLOZ8CyGuP
	4ZqcSzWPsdtDcBVEP2vhC0XAGwnmZkDAwCCAHVFT/Y8jQlp4K5Dw19PicuMxlQ==
X-Gm-Gg: ATEYQzyw/OXuN9A6mE8TkCkkOUiqbKqCvPzFCanpg1hsMOWFvmIiPo88IjTRMFdMkFt
	QQmUxZkdFlNfNoB56KjvbwVrviRI3Rwz8K8o+dlyWRzCnIlgAzXHtfCWbML2wGLOSyCis93rILK
	OCOj5AZms4jb7vYF2G81PVQaDJk8iHYK4gCsdO8Wat+vum/248IwUfj7/jM63GrDWbVWLB/gK9u
	cqtlXNbqNmHgG+cHcCh1qGhYkxsdhaBdZy5yGjfTKJB58hznr39qfWtymUimNtUE6lWV5m8NdZh
	dQR3xQNNKytlCWYPkZWAFO4YFFHaY2/gHF1m0XJGj4IySPm+9PJfzFspFtTT7UNvrojosN5kj6F
	7YXc94YTR5qG6YNbkdEzCn6uULou7pttCYEILRxKzQk02elazc7dRkTrSAyseIFSojl5T+PWnXr
	sf8leKJstwfcnZWBc/A/oAndM=
X-Received: by 2002:a05:620a:370e:b0:8cd:8f18:d1c4 with SMTP id af79cd13be357-8d01c8011afmr1722421585a.56.1774889204797;
        Mon, 30 Mar 2026 09:46:44 -0700 (PDT)
Received: from localhost ([199.7.157.54])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8d027ed7ed0sm686529985a.2.2026.03.30.09.46.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 09:46:44 -0700 (PDT)
From: Richard Acayan <mailingradian@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Srinivas Kandagatla <srini@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH v4 5/5] arm64: dts: qcom: sdm670-google: add reserved lpi gpios
Date: Mon, 30 Mar 2026 12:47:07 -0400
Message-ID: <20260330164707.87441-6-mailingradian@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260330164707.87441-1-mailingradian@gmail.com>
References: <20260330164707.87441-1-mailingradian@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Some of the GPIOs are reserved for sensors since the ADSP also handles
sensors on SDM670. Add the reserved GPIOs for the LPI pin controller.

Signed-off-by: Richard Acayan <mailingradian@gmail.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sdm670-google-common.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm670-google-common.dtsi b/arch/arm64/boot/dts/qcom/sdm670-google-common.dtsi
index cf7b130ea0c4..b0da24fd1aee 100644
--- a/arch/arm64/boot/dts/qcom/sdm670-google-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm670-google-common.dtsi
@@ -519,6 +519,10 @@ rmi4_f12: rmi4-f12@12 {
 	};
 };
 
+&lpi_tlmm {
+	gpio-reserved-ranges = <0 8>, <12 6>;
+};
+
 &mdss {
 	status = "okay";
 };
-- 
2.53.0

