Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B1BA3A4274
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 07:00:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782716448; cv=none; b=plfx4t+Wpm7q0lVJF6SbneiM74sBlQZE8K64Rsg0q63G77tiO6zie2palvzlRzOFT5awWjhEOU1QStQ8cHgn+IWY5Z/n38dufx3zWAA7URw9lWGcWWL18rH0MY0u8A1I8e1C4cBLZ3ckYkH+Fniv84FCYn+tNplqqZNbTmYTidQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782716448; c=relaxed/simple;
	bh=lp7LAimrZs1QHVxx24pfSjBh3OWT1HxcKdnhmz8J8yo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=uhzLPkJMeVa1MKSLdNC6ZyChUP08U062eaZiULpRxp8NaeYzgckoRq5g5ufWSy+tDcy5RAtjQqku4LmOTIfGs9APJr3iNk2PQgyrdebpAmWED7IQtajIdirthMZTSUSaiAF6gBLhH0uJUG2etZWhHNIrv905pAuSqKhIKh2yEnM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d5reHM9a; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d5reHM9a"
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-c88973b6965so1799645a12.1
        for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 00:00:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782716446; x=1783321246; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jrV/R25cT3pDEPiIHQ/ia5vCE1mVaRFviplQpQbaE6s=;
        b=d5reHM9arn8uNVNPjuPYi5EyHDY+dYRQ6y/hsAky7g64R2uQz0a/Q/BOXBieMkz84P
         /jg4rrV5BefESRVSmEXKaI2xt2eBWHWbDgiDLsrEKVNi87nQnJBNwz+m2LopRKEbGhwb
         zEA0lgmJ+kpbomx91vPxULdCkfHNVb0MDsuiqQIpA1LBhGevWNVmqsVJAEarkKno1EYq
         GdBRh3dKPt3okBz+mWEo74maCkJ7n/QH41XAI30Y2M14AKixik1aFqS0oU578YCOy3Hw
         i/gqb1bzT8ht31oogR6d2Qxn6c4gmT2FtMwWfY6MFZQoJGZDdtZ9kaDLbHzFkoKKRN/U
         gK1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782716446; x=1783321246;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jrV/R25cT3pDEPiIHQ/ia5vCE1mVaRFviplQpQbaE6s=;
        b=rDQaewKdduRsNfeLSMY3HAiGygK60+C4L8Vlw07RmeAFqZqZsrywg/k4qb5qLKaUXi
         fQaBrzUzQTupb145+pYWVHIS9wJrGENDcGG+2xz0bysJZ/VMFJ90PFtc61hZB/3bULyD
         VnZwg7sc/5aX2hW4vAB7RVxsS/+lYYRKrYefgChpu+PjyMr2b8skXEk1SkT2B4O3GuYZ
         SuYhOm1/0H/eP1Wtwx/ZuXLpoHc0+S6CjxOIK4tjT1emhH5fu+kC8DyKQ0/g3HPqoQhP
         oMnOUC2E8tjmQIfH9Alq44YeRDWLbKMl6277xita/UF4OlKtK1hxHYbr4uh+PTaHtiiR
         1x/A==
X-Forwarded-Encrypted: i=1; AFNElJ8XNYIrK/+nF9hKKkWkdGHf4PD6MNtjf1okWqWUbUTGrTOMEfbEpz1ZDz//H0F2GlFPOGhjV/lI8iyf@vger.kernel.org
X-Gm-Message-State: AOJu0YwdU7qyF2HSkNX8XW8CfJWKoQecEACiuZl0jT1vp9asuvWbaVeo
	Vad2x4MN+ThDmW0sHNPBP96hzG23NsmNjvMYQcrslA3f7FNH7V9F0+3N
X-Gm-Gg: AfdE7ckSxmUmv1JwC31jk/KHi2GGmLBTp6h+etL2lBHnmQUHHwTdG4IXssVOWRakONZ
	a+qseW3Cpbq32evkOwL2Gww3ECoLLbmlRDryhKEmDgJQflRgMu9J8zZPJFhw4jG7mS3jVs+Iyi2
	xawzf43y53+8ILjWX18Ck1Xe8O9BC2BX5s/KmZmDjucd8pzbYn1m0QUaZuIOLEE68aJzdfk/5QK
	eQzQA/wZR2jyZvKjVa38M6GqIZ44QlpaG7mvYOlSo3VijtsWAjx6Hpdwz1AVKw4kO1lrgCWNiFZ
	jpHw+ZecACTyyQikRtA/hPEBTpRqygyUIG8uSVbRt1YzD9WoRIC9aSnlLI5vrUAh52Fb6c9m5Hg
	HTLH9LCLu3tzPTSAQdIeFAUwhn7xIofflAlaJuW9kBsJVAPMQPR1J+W0gNfnoXmRFPKHMRHLqJM
	ho+vHrt3f9/RY=
X-Received: by 2002:a05:6a21:4cc6:b0:3b4:6af4:bdce with SMTP id adf61e73a8af0-3bd4ac5d9a3mr12152783637.20.1782716446385;
        Mon, 29 Jun 2026 00:00:46 -0700 (PDT)
Received: from nuvole ([2408:844c:b00:2b2f:398a:8bef:b88c:653a])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c92bcc90af5sm7061725a12.28.2026.06.29.00.00.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 00:00:45 -0700 (PDT)
From: Pengyu Luo <mitltlatltl@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Pengyu Luo <mitltlatltl@gmail.com>
Subject: [PATCH v2 0/3] arm64: dts: qcom: sc8280xp: fix and improve pinctrl
Date: Mon, 29 Jun 2026 14:59:02 +0800
Message-ID: <20260629065905.15651-1-mitltlatltl@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add camera mclk pinctrl definitions to sc8280xp.dtsi and drop local
and duplicated definitions, as this is common for sc8280xp based
devices. Since the correct drive-strength is 6, fix it too.

Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
---
Changes in v2:
- Collect tag
- Add Fixes tag (Konrad)
- Rearrange the patches to ensure the fix is properly backported (Vladimir)
- Link to v1: https://lore.kernel.org/linux-arm-msm/20260607160435.36546-1-mitltlatltl@gmail.com

Pengyu Luo (3):
  arm64: dts: qcom: sc8280xp-x13s: Fix the drive-strength of mclk pin
  arm64: dts: qcom: sc8280xp: Add camera MCLK pinctrl
  arm64: dts: qcom: sc8280xp-x13s: Use predefined MCLK pinctrl

 .../qcom/sc8280xp-lenovo-thinkpad-x13s.dts    | 10 +---
 arch/arm64/boot/dts/qcom/sc8280xp.dtsi        | 56 +++++++++++++++++++
 2 files changed, 58 insertions(+), 8 deletions(-)

-- 
2.54.0

