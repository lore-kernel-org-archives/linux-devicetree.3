Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94271175A5
	for <devicetree@vger.kernel.org>; Sun, 16 Aug 2026 13:33:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786887190; cv=none; b=ELAT5+CcXuzCZiTsEmwvL2MCsYV5RxJoJ8jd6AwLfEGkLjKwDUZccICjkcf01Aoa85NCnxjox834nSrgm17/JMTVKTQJ2az0rTYqEyqnnDwex/wdDi4MzeHzfBDC7b8HWGa2B3MHh0Ppc6l6RQAbowkyI8o6+4ipBF6owzAWGOM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786887190; c=relaxed/simple;
	bh=R6Ql6qBhxv8nRfMWDl4ii2I8yaMmIwHS8a/lEb+KgZg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WSxGemXDFx0wWI3eDTrNuaBxlqW66nR8tLN3qrOq0FGqg/SMz8tqESpSnqTJDUaasK9DJ2oqrKG0A1edLU9rPkBFl9tH4XSpwB+qEdgSsmaTSpMpFq1XyQHzPdVZnnSMWeoVgaRhLqq4LXq9SDLtZluS3z3Cl3agpaCtLSmH7Pk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q0P0NowA; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q0P0NowA"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-3856d6fbcb3so2020190a91.2
        for <devicetree@vger.kernel.org>; Sun, 16 Aug 2026 06:33:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786887189; x=1787491989; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Xro5hLO6XYdeO9sCaq310qk5ul0LDKCYcbgwbKMsfxo=;
        b=Q0P0NowAL8sHS/0OZpgaOn7JYu17myNtkeycku1BK/mNkonJM2+QQygcStzGuE88qF
         4rPLx/g7Mept/pLjSAUOmS3cHUO/ETLsKGexnoTu9clYvqcapkt0Esqwps4JEv0vvMpP
         39VHyQ0xq2I9Yf6xrTdxgmwhrDirYyhhKeHajT/l/ttE7ps7AAo0sfAqaIHY2qBk6Ub3
         TvDyjHVuxNVOm86mi+NHgxkofcTEHE5ltFPnatdXchh1XS1iPutUN+/Qhajfo2Ep3EMw
         Jreho2vNwMPpk9Dl2FQJnQUCHSSPEaNgGQseFugIZMC4ymYFwx90gF/B5qq8cryP9/yz
         c8eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786887189; x=1787491989;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Xro5hLO6XYdeO9sCaq310qk5ul0LDKCYcbgwbKMsfxo=;
        b=bsKQqRbyiSZ8p50G9I+CDQXPJbYKfqpqBNooq6mHBcjVp5LW6SZWQdoVsmlq8aDvCk
         Q6DRRfk28i8MqAXJ/6PlZec08z8RZ1nZyqfYW2pFbIW18tFxWyE2USWPaGYJhywkK85w
         0JMoVuKCW0+7hhhk8a6ycz/QOzuN9jb6H+PVIHlJYbsWwLcvS6TftlTvE8pqPmqFY9UH
         u0yiBq9KEi9KCSdQZqMM6SdcVBZhlnakt9YiT8jDQGKprmtE1HZ01vskRlp2iTdLrT3Z
         f/2KGPJdZl9qqja6HwPQkWiMCIq24zoaqj0M5ginbmXlHjWwknyXWReLWmVHtS0mHGFY
         6uqw==
X-Forwarded-Encrypted: i=1; AHgh+Roddi1uP5+OWsDSngN9jSOT88atl1AMOo4gLZ34E+32r+Xnt8agbF45c42X5NLJC7Qjje75hZD57Q7V@vger.kernel.org
X-Gm-Message-State: AOJu0Yzj/tbC2GIdMkpTzEF5PV5duhKTd3FfHPmm25Bp27e0EshvHvTN
	PDK81IIpqD3dnJm68I0ZOPdDMJJ1DDT/NAN5u87VS4Hw0V/VstOd5L76
X-Gm-Gg: AR+sD12OnoJvyr4EHvERCthSFex3ifJSbn55xgWNNQv9Tc5qUNG8KlCRv3Khpt/hrM6
	+IzNujYDsrKMupjyYjtILVRSP9YPNldV8MPPp/03+Ol8eL8Dzqzb9Ho5ZasBL9NYLG8wyiFmeUU
	F2SwJ9y14mqC/ztsLjE3on8W2k0oci+T92dvZif+CfUi7VYQrdh5BrR0Wmk+TSxTOnUFidov39r
	Kb9g32Vnyz6E1yvtkdG8eNs60QNhjWlKWrznrrcoObWSOhU2nsL72GpqPX1j2wvKFmUQ4rvOH9j
	nVDuBAcEXPeJU0zCqp44b2FXVd3nzPdhKDPNlcAhN5bt6PgdW+Jl/Q8YxVxSwIWPeBwb0seuyNc
	BYNF9qFdcjXpOLlzfXJiz58smRFpgshr5dBsXTsna/QujX1NPjjlwzdMoFkioDK9JbPt4V6KOzd
	dUDvIwh3LsD+xu33+Sioonm45VO1AlIv91Y9jruaxKqv2wL/FqAyhRCVU5R3hyDI1WA8AZqu7uA
	ZZ7AxxsANxOG0ZSlA==
X-Received: by 2002:a17:90b:510a:b0:38e:9ef9:eb97 with SMTP id 98e67ed59e1d1-3933ba87422mr20314564a91.16.1786887188980;
        Sun, 16 Aug 2026 06:33:08 -0700 (PDT)
Received: from localhost.localdomain ([157.51.221.131])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-320ea804233sm23599064eec.26.2026.08.16.06.33.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Aug 2026 06:33:08 -0700 (PDT)
From: Sreeshankar K <sreeshankar0910@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	andersson@kernel.org,
	konradybcio@kernel.org,
	tglx@kernel.org
Cc: lpieralisi@kernel.org,
	robimarko@gmail.com,
	linux@gurudas.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	Sreeshankar K <sreeshankar0910@gmail.com>
Subject: [PATCH 4/5] dt-bindings: firmware: qcom,scm: Document SM7250 SCM
Date: Sun, 16 Aug 2026 13:32:30 +0000
Message-ID: <20260816133231.10875-5-sreeshankar0910@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260816133231.10875-1-sreeshankar0910@gmail.com>
References: <20260816133231.10875-1-sreeshankar0910@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document the SCM compatible for Qualcomm SM7250 SoC.

Signed-off-by: Sreeshankar K <sreeshankar0910@gmail.com>
---
 Documentation/devicetree/bindings/firmware/qcom,scm.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/firmware/qcom,scm.yaml b/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
index 25f62bacb..7446a54eb 100644
--- a/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
+++ b/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
@@ -72,6 +72,7 @@ properties:
           - qcom,scm-sm6350
           - qcom,scm-sm6375
           - qcom,scm-sm7150
+          - qcom,scm-sm7250
           - qcom,scm-sm8150
           - qcom,scm-sm8250
           - qcom,scm-sm8350
-- 
2.43.0

