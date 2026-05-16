Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEB7F380FF4
	for <devicetree@vger.kernel.org>; Sat, 16 May 2026 09:09:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778922547; cv=none; b=SZ2R4e3y0PXheHkT7SRYVLD6pKdAxhaEXl7X7Z2cxFZz12IJcIxQcQK45iTXvT2FehP+LdqbR9pog6S4r1DunQeFx+h38hlFrX+K+hE1bAJz+HQ5KheLbZdfDeIEkygs+/IhLX3sg0003zrZGUioWnhNs/qCU6QpYmuKml1S+7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778922547; c=relaxed/simple;
	bh=pafJOlmj/Pbct9eaGPsT9zX+cN6FNk01V8U6Qh4Kino=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=avi7WjJuPZFOHMRzonO9ZrTnJLjEDxQj7uVVF4DPxXnMflRWxjf3jDbobDb20cagw63vf9PPCZkvZ7uBC4IWknxXrIesP4lsra2bmGyQ+2Pgb+IG2fw77/9oboniv3Qr3Lc/B94sIc/APqKNbRHHSnWqnpfZQtOyY9imBmTOdUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gxa/nnXW; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gxa/nnXW"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-682714e8f9eso1960645a12.0
        for <devicetree@vger.kernel.org>; Sat, 16 May 2026 02:09:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778922544; x=1779527344; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kEWYWzmPTYxe8SSU8eAxSX5Syznr5DfzGqZhv2Zb9KY=;
        b=gxa/nnXW2JLW/njkd/+G5Mgd5E3afaU1Y4rLh9HGRAzqfCXzdVo8J0vmJb8kF30RyO
         qaTrpPv+oQTmfhFWvqJNDW6s60Ym2ImH+rn7mZ00ZVrxKcyFSMHlZkneDPk0wNJdtuKW
         5Xo7Uwygg0x8xPy4LXraOGnlO/V4Q5J0AIXHU5LMEsxsJNqQ/JqZ+avI1VCxJZv2Z8fa
         J19N7IWZ5ykpOaAJMciqNLnOrHZkJ1nt+3x7SMQpRQHCVwgnmmnPlsN19x8YMCWx3/aB
         p/WJReIkPQ1FfrhQ61Jcd9V5vq/wj8JJfOt0Qab8ZwyZ84MfRyZWefE8SeKC/mlLwBj+
         mLPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778922544; x=1779527344;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kEWYWzmPTYxe8SSU8eAxSX5Syznr5DfzGqZhv2Zb9KY=;
        b=AId6T82JvjdlInhOUUKKoQcp73GM7gQUK4d8zHM4+p0IUZY7MMgUi57+hVeD/2qS0q
         3hCKXhftf4fXDGA/J+FrUoexd/J7JQ0Y5kehmMHyuhISRKwjpr5XLsw3sPYsBZ5xMrU/
         ZhMKVDlYxGdCf4jKFoIFiu8kDHVAzQSNj84GW+2y1YktMfFUiDgh/ypoF5MET8cHhDNM
         all65qtB5aYc2xaNnLtT+/GwVdp0CIOV8ehjALlhkIrVD8hkiuQaI3XS3WrL1e+meKTT
         xnneRErNsVE2rvDH//nYU9oLTJRwvHI+jSh9XhwV+2EwC0Y30k8JAmrP5hSp+NUnuxcc
         45Rw==
X-Gm-Message-State: AOJu0YzS3A3uRvFkoggtU5eiO21bzTESc9cTeqiSMTShf6hDn1KWITlO
	4Qj1+45hp1LtmxHv96Kidg8aaFmCSZSsWhXvoyn5vOD/rWpIbzxJnDrorIlA2Trr
X-Gm-Gg: Acq92OGVni/G/3roDdy8W29E0jhAIl87Lnv4NxmxGKeKuRdPEf8tBX94dV6Je3AkJ8p
	2hIUdAcKZT4WE3m9Ws7Wu5zudL8qEfTdIY8gmZATAr7HwF5Xk3kxtYRGyd/IC2aULz6UxUKONbQ
	VVrqpg+4vkvq44Qx9XOJpPoREje3YipuyEp8b+LQOEneNvWOR+PGo24uHb8AStGr0aAHpD6BSau
	JTPgnPzKS4fwv1pPQYL/lv0Rdvyn9LBTTyKSIlyChdw1OkcZ24hKhs+eBP9xrd7xtQqTioqhmab
	u6sPPnukxbp5XH/XoqFbrr2HcFGhmPhuQl03uHJiiUlneIgw5ZdQW+aURjhx0jkZgVbzAsgkhvo
	Hf5fMZnS8OWd7QYaX99a6M1BzZJkbLz4WqhSbq03CDOSudO3f0NDXRReePN6uhNUYBBnCmtZxsd
	PexzV7/eU+9A0M+a4LtelrJCLtBH8+/pWeVizUbRvF9SdyWNzD6C9UVfvoYZLbpWysr3M0EKc=
X-Received: by 2002:a05:6402:3254:10b0:683:84eb:54f4 with SMTP id 4fb4d7f45d1cf-683b266e97bmr2679426a12.0.1778922544001;
        Sat, 16 May 2026 02:09:04 -0700 (PDT)
Received: from workstation.home (71-212-98-95.ftth.glasoperator.nl. [95.98.212.71])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-684744d13aesm525848a12.18.2026.05.16.02.09.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 May 2026 02:09:03 -0700 (PDT)
From: Stanislav Zaikin <zstaseg@gmail.com>
To: devicetree@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	andersson@kernel.org,
	konradybcio@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-kernel@vger.kernel.org,
	dmitry.baryshkov@oss.qualcomm.com,
	Stanislav Zaikin <zstaseg@gmail.com>
Subject: [PATCH v6 3/3] arm64: dts: qcom: sm7325: Move common IPA properties
Date: Sat, 16 May 2026 11:08:53 +0200
Message-ID: <20260516090853.2873223-4-zstaseg@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260516090853.2873223-1-zstaseg@gmail.com>
References: <20260516090853.2873223-1-zstaseg@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The qcom,gsi-loader and memory-region properties are common across
sm7325 devices. Move them from spacewar dts to the soc dtsi to avoid
duplication.

Signed-off-by: Stanislav Zaikin <zstaseg@gmail.com>
---
 arch/arm64/boot/dts/qcom/sm7325-nothing-spacewar.dts | 2 --
 arch/arm64/boot/dts/qcom/sm7325.dtsi                 | 5 +++++
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm7325-nothing-spacewar.dts b/arch/arm64/boot/dts/qcom/sm7325-nothing-spacewar.dts
index cb59c122f6f6..7db9ae1c3cef 100644
--- a/arch/arm64/boot/dts/qcom/sm7325-nothing-spacewar.dts
+++ b/arch/arm64/boot/dts/qcom/sm7325-nothing-spacewar.dts
@@ -971,8 +971,6 @@ nfc@28 {
 };
 
 &ipa {
-	qcom,gsi-loader = "self";
-	memory-region = <&ipa_fw_mem>;
 	firmware-name = "qcom/sm7325/nothing/spacewar/ipa_fws.mbn";
 
 	status = "okay";
diff --git a/arch/arm64/boot/dts/qcom/sm7325.dtsi b/arch/arm64/boot/dts/qcom/sm7325.dtsi
index beb279956df6..59adc7fa5976 100644
--- a/arch/arm64/boot/dts/qcom/sm7325.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm7325.dtsi
@@ -15,3 +15,8 @@
 &cpu5 { compatible = "qcom,kryo670"; };
 &cpu6 { compatible = "qcom,kryo670"; };
 &cpu7 { compatible = "qcom,kryo670"; };
+
+&ipa {
+	qcom,gsi-loader = "self";
+	memory-region = <&ipa_fw_mem>;
+};
-- 
2.51.0

