Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A2E1C8CE
	for <devicetree@vger.kernel.org>; Fri, 21 Aug 2026 08:13:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787300031; cv=none; b=lauY7hbsQNxPPU/OvJr4O//FGxc5731SYi378/0bNVyUdb4/W0F3/1mk8uZDXbvlwzoPtve9gR1cDZ7Fcbm2HNO9uTzwpieL/MUBflSwTMbNMHk14sJwRciQT8v9xZjBdf9KZ8CuQD1WreyRpdJk/v6cJdh5MvPXy/48FnGsOG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787300031; c=relaxed/simple;
	bh=S4gVIUWwuoALYuzwzRm82WuAYzYN5KLWtNbqZ/oM/+w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CB6YY6tTE7N+PAMaUBGJL3vY39RnKwLzCK4xTcoHO9sE+MjwwQ7qFY2REaZtvogfbHPSqY0XrG3lBdbXBvnTwcsywMSbLSnDAkT+1w0y+FmEXi0LAmCt/12m2DhSfhy0DgaITyssE1+8W1vOMYWvOeiTCgfWclJHG1tPPzf9k3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EJoK4GYg; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EJoK4GYg"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-c9eefcf9175so770238a12.3
        for <devicetree@vger.kernel.org>; Fri, 21 Aug 2026 01:13:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787300029; x=1787904829; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=g3FdfDbvToHSgtTrj8YFlW83QqqTfihaw6vnLz7PZc8=;
        b=EJoK4GYgFSAzpEh9YFNwO5Mk5s9sNwBHyWF80DghZE5kc988pKUQnL/P/xAfGxEphb
         Vu6zPWJhXpiSGypkiAQnv/q12VG7AULICtGMcIL76VD9rYJFtG3gdi2zdj3sxmi57AHk
         iQ2ojaO/6l+V/Zd7+h8eIcitIlPnbfRPmWDPX5OtKnY96px1juK9wbcR68npe3/q8woN
         oSWdb/AILgHZFt/pVqH3sgDEvJc2eM0AiJ63N6X4bIuexU9fMdq6+irjcrWmEmWIK8uW
         9Dkt+TwpHjTZePmkTaqR82A/WjVa/4ZfD6CbHw/VEt0KSb4OC50k/uDP9YU6DZrIfDFq
         NCNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787300029; x=1787904829;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=g3FdfDbvToHSgtTrj8YFlW83QqqTfihaw6vnLz7PZc8=;
        b=Px7liyF4vA2n8zV17qLVoongZ3Pv8U+4FIyx6Rrtb2Qc0yyME0rKNlY/zvwvfTfoux
         9PdLa2y/E1xcZHW0Okp8Nrs3r/LTFJcSKexTyp0WXtchcRWPsDH7hfwYyAkYEP55xegb
         L++RikItVPClVwR2EwB+TqQc9SwszKJDuF/NtaYJStZgHKbrT+Ajg+M5jm52Vqq7FdKn
         IVuN3secgxlfCRmlUFNS4hk5+BXy29juzTjLSdLLgXg8ltMRwh8yJ7GnoWcwZxqHwNF9
         iczSK46e6TDJm3OXS88yn2EIF1JXRCvondJBPhJhY+VbUmMd81Zb/6zgwXRQKhuJO6vO
         BZdg==
X-Forwarded-Encrypted: i=1; AHgh+RqevpNguGZyum/SufSEFJcrjJftDloGRXAxB1vJQ1jYJ5Rp5nZbtMyg8CLP/83ax5qfZRLIKLG1Ah7K@vger.kernel.org
X-Gm-Message-State: AFuF++laTT7Dr4TU0QHf+5ctPle+ZpnvpI2L+CQ4ZkAwMdw/gJifZanG
	7yGR4Xy1yg0nWjTx/+Z2+hBnb19KMNq7L/Ad60BBDXre0xC0MAo0JFQ/
X-Gm-Gg: AR+sD13E1x4ntJBWkbiH7HyF0uTqdZIO8WDD9rWf9vJJOnYWqAMLsiCvl+X++38d1J7
	e1zJEA34CVzWfpGkg2cmHVUpw2il3t2JtU3fJdkEVZofsWcQb5dabfoJRdAzpLXMCIEDy6Agbrt
	oyMeLzbd49zdzSZnhsbuGlIRwgvlNUekIS83vUd4dN1lMvMgFHoV5Zw1R+eOwdhahcwbf+S2XFL
	ymrXSlhvhy9woJ2+G1uAFIdvJQUe9h1pyf1rqpBKkUAqCi3V5zGXJZl+TbgafiN474yAAhoI1pq
	rHTPFPnZupRhu0SIbYdjC72K73SDmooBplnRZESBfD+kc6yVg1hQDkJ1Oy56yTk88fZ9peHRnek
	Ri5EOtmW+MgVTjA5AQ+xYClL0FEcfLz7PKH5LwqnASK6JQoYZtYK+lk1C0IEFHHZ4lgUE1mzPWk
	fS0OLe1ysaX1goAiFCjg4PSbTAnN6UBN9IaDqjsgv58aBRh85m5Le29UTz0qHbUUKJAD4sgCoP7
	uMxHO7fBQVN
X-Received: by 2002:a17:90b:2d0e:b0:395:7fff:a08f with SMTP id 98e67ed59e1d1-395c2f65bfbmr9339432a91.0.1787300029568;
        Fri, 21 Aug 2026 01:13:49 -0700 (PDT)
Received: from localhost.localdomain ([152.58.217.163])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1416ae48761sm22040786c88.12.2026.08.21.01.13.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 01:13:49 -0700 (PDT)
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
	Sreeshankar K <sreeshankar0910@gmail.com>
Subject: [PATCH v3 11/13] dt-bindings: interrupt-controller: qcom,pdc: Document SM7250 PDC
Date: Fri, 21 Aug 2026 08:11:23 +0000
Message-ID: <20260821081125.4522-12-sreeshankar0910@gmail.com>
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

Document the PDC block on the SM7250 SoC.

Signed-off-by: Sreeshankar K <sreeshankar0910@gmail.com>
---
 .../devicetree/bindings/interrupt-controller/qcom,pdc.yaml       | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml b/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml
index 8162a49d4..c30b88589 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml
@@ -50,6 +50,7 @@ properties:
           - qcom,sdx75-pdc
           - qcom,sm4450-pdc
           - qcom,sm6350-pdc
+          - qcom,sm7250-pdc
           - qcom,sm8150-pdc
           - qcom,sm8250-pdc
           - qcom,sm8350-pdc
-- 
2.43.0

