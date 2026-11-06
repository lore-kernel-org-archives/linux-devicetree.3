Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793978196;
	b=jwB3RfYGGalLBfzqmrULn2hJtu66KQIvN1bDGCn5sgU6Faj5jKLi6cSa9GqlITugrAsO
	 W3oaFZ7GD7qW1YyJD1yRYwz5TUlLAtW4Xl0ZhatoSsCqMBP7dG1GlnYysC5fKnEMT5vRc
	 GpRcqUh6nO+hKKeXyQxDW2CwfPidD/k2J0mCBydBlJZjgxOjbZX4g3ErRi7UwK7dv9q8p
	 1aFq+/Efg3AndoJkeNLk1sPjODHQGaYvHV1P2PewiOsRj9FNPoesNbxfd8bWjgFg/qKCu
	 gLsbo0LcT0ZDafNpkZOrAg5u7nz4jyiT5XwO4JA/P70JyMU0UkoPh+cTNsK81SLnnVg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793978196;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=AZbalvr0RZKV2CHqgY8md5UEm/BcGTfETxormN4SzfQ=;
	b=LRMAWREntTkqZ9nBe7f7dd4JgPBioZdGQPH+yVkiWn0h/M6HRznAxd1H67mCULwqSIC+
	 i/r4SfledL0oPSoPvglKZO1chRDCxBssIRPZnhed1jNIcCNMWML9TCy89Au3BCzQwaus+
	 5rsbUPcmuLyxlIXLX9SOPPZsvSMHPyW05sgmsKrpoPKAqJ6FdFILRTXkzE9gF272TD/l/
	 7BLbcpBqHeuw9KY6FES0yheOuEMNQ56BzQ4oogJQKiOd3RWoPvLwd7JER8Tu7tYrmhqfL
	 Hf6mrasWVxE/Is8QuIilz0hWQ51+/5t60sYbA5F6T0jCetMVAeOpR2gT7BVC485iRrw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="VSAql/bl";
	arc=none smtp.remote-ip=74.125.82.172
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EA35606A32D
	for <devicetree@vger.kernel.org>; Fri,  6 Nov 2026 15:16:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1EA35606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VSAql/bl
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-36e99cf7bb3so1204792eec.0
        for <devicetree@vger.kernel.org>; Fri, 06 Nov 2026 07:16:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793978195; x=1794582995; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AZbalvr0RZKV2CHqgY8md5UEm/BcGTfETxormN4SzfQ=;
        b=VSAql/blJeBuuXf8oV/4c1oADv/6SuCiNGnvgI+jYuOKHyIGlQ15D7/sdKN9NYl7wx
         iWb3gjWga3J1E8G9FKpUYgRb6DlbuIVWTvdwzC26viaTrL5X/e1VaVMZq2hRKGYiTyKc
         AzJA2l7qjJn2Mc1QtlCTO4p1IKMjHrPtdGWx7FFh5JzaZLCJx1/6THJc8ZFaWaZqzM1S
         nKBjJKH7mCdHSKmW5xbNxlbH+Z5gd+UlcG3taSFzBLnJflkRpuoWZLJ/8kI2Le266Kh7
         ujLXoS/MNkIY/yhfstFBjlc1JV+W2xRm71elGo+uD2WSg/eUw/2g+fiok9jCC7qj1L8X
         l76Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793978195; x=1794582995;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AZbalvr0RZKV2CHqgY8md5UEm/BcGTfETxormN4SzfQ=;
        b=fhjqkJlgOvX83SNb7CrvthpYfQutxj0mq+aoYhCT/aQ1OQikoRHBqGsiydZfo6s4SB
         pMw26TgtiQT+W8X8w2wfDLsNMzXt9Fis6l6Oyq0dSwEqTGxT9G/0FrlbapCWLsvoRAQ2
         LtL/ofsUzZV7NKYOOMm4zGsabaKwq/jpr2wJpQ7u+NdBEiSLvs0Dr5OJT0pOESDnuv1N
         DntbbK1JCdJHIEKqZgIssKx/1vN5dRN3I43dYY6nIhiuunQ+O1fF3/+84BVq5CXh/5HN
         zVoIEjarOlPZJSHFJnZoFYCZx0EzvmR+nzwEtP5lHDZgboMhdZ05PDodMH2lsboDRf6/
         6JjQ==
X-Forwarded-Encrypted: i=1; AL+hErFs3JzCM5m8F/QU7m8BEU9pB0xkmeaH694IX16xRzYm3lOZaJZ39jUaruYRDNBXEjR4Fn0qH1JsX6uy@vger.kernel.org
X-Gm-Message-State: APuU4Z+d0XHPscZP0wrUatHWuYxwpNsr6cz8IlEmC4Z3lmKmJiTwvM3P
	PVUOdZPUxc6vZiS13cTeXAAnO/S0x6UEU7OHloT+4tOiokmaH2o1sGlN
X-Gm-Gg: AYBFou3bWKDnmcBmWk0PNCglJl6svpZOgC9jirX/H/LEgRY0Z8/j6vUnJLxyV6Gjjyk
	PXA8aP7Fa9qemmd5YkdFNU4obAkGVeap+Yc43cL2RRRwwMJYM1P2BCtVZNEQctHHPcoLx7JgYXD
	sgyfhoCxcBlTS0H1wLv+EXVWOdg6UoPXA8fOEHTrR6rZDjk2693CX/sL9Ym7CRSjfpmFx/CXBT6
	DxA+sR30KMGOi5ntTRZNOLyHY0it5rtvIxUhNfM2NKpV6+KjbUkEyJKjG/wTjv1GHPIPdZPgC4r
	jrbNaoGvQCyCvzloPeBLwHPSXlew0c26IcIzS5T40zeK047dlzULyX5wPK2HFX4IADaSPzLWdR+
	5B+SiUbk5PTZ7IxHoERikoMB+N8GhtIafHOUDZr7yH+asPH+DpH+exdFc9+CHdTs5u7G2jexxDf
	tx01gkAFM/lvUQCGSrQmglPdZsLXAiZtowAKOpt7H+QD/H1CGzuiRPg4DYx/p4K7+LRH7d5Ocqo
	WU+jnlinibqFb2jNUJwR7hZ90NykyE8La8d9qosBqPBv4r9ryGq6S7ncW8Q4JG6lKHpBcnPyUKB
	PR6ptRm6kIZiP429U2ZMMBB3VAy3ezWZObyN8CNwMclT8CJyJSf5nwS2VhO1jmPRSszyJdry3wc
	RzpN1EQ4=
X-Received: by 2002:a05:7300:ea8d:b0:361:167c:2364 with SMTP id 5a478bee46e88-36f76814de3mr3562020eec.8.1793978195003;
        Fri, 06 Nov 2026 07:16:35 -0800 (PST)
Received: from Sobhana.localdomain ([157.51.221.122])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36fa9ed126csm7581500eec.18.2026.11.06.07.16.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 07:16:34 -0800 (PST)
From: Sreeshankar K <sreeshankar0910@gmail.com>
Date: Fri, 06 Nov 2026 15:15:39 +0000
Subject: [PATCH v14 4/8] dt-bindings: thermal: lmh: Document SM7250 LMh
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261106-sm7250-v14-4-7d167e993f9c@gmail.com>
References: <20261106-sm7250-v14-0-7d167e993f9c@gmail.com>
In-Reply-To: <20261106-sm7250-v14-0-7d167e993f9c@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Taniya Das <taniya.das@oss.qualcomm.com>, 
 Sreeshankar K <sreeshankar0910@gmail.com>, Amit Kucheria <amitk@kernel.org>, 
 Thara Gopinath <thara.gopinath@gmail.com>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>, 
 Lukasz Luba <lukasz.luba@arm.com>, Konrad Dybcio <konradybcio@kernel.org>, 
 Robert Marko <robimarko@gmail.com>, Guru Das Srinagesh <linux@gurudas.dev>, 
 Viresh Kumar <viresh.kumar@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-pm@vger.kernel.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793978147; l=791;
 i=sreeshankar0910@gmail.com; s=20261029; h=from:subject:message-id;
 bh=VBYR2sSJ7gPSfZ1zDIlxykyMXb9GohC2X09rRKZ3wIw=;
 b=tA+YO4IEziw/rxKUuLOEgg9oSmL+N5rlYkZXd62GE5c3l7KwaJP7/Ge3KIv/yGEwS6/bV7IKD
 UTf6B27Bw92BqD5ffzrs425wCTGWhznBDR5PUtFGQnRPV1dh25cvGBx
X-Developer-Key: i=sreeshankar0910@gmail.com; a=ed25519;
 pk=CGSHduvtn2hwLCNRXRc9s/fh6X8PH/zNdp08zC8hOuQ=

Document the LMh compatible for Qualcomm SM7250 SoC.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Sreeshankar K <sreeshankar0910@gmail.com>
---
 Documentation/devicetree/bindings/thermal/qcom-lmh.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/thermal/qcom-lmh.yaml b/Documentation/devicetree/bindings/thermal/qcom-lmh.yaml
index ce72347e2..e1d5cb871 100644
--- a/Documentation/devicetree/bindings/thermal/qcom-lmh.yaml
+++ b/Documentation/devicetree/bindings/thermal/qcom-lmh.yaml
@@ -21,6 +21,7 @@ properties:
       - enum:
           - qcom,sc8180x-lmh
           - qcom,sdm845-lmh
+          - qcom,sm7250-lmh
           - qcom,sm8150-lmh
       - items:
           - const: qcom,sdm670-lmh

-- 
2.43.0

