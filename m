Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C79841B8F9
	for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 08:09:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787040567; cv=none; b=JbZh+w5H/ySVTKErHBbuOrFKzP2f/9KVjgmhwUcgh8vA2PI+MmgEfi1I+NJmIE6TwfunCuX0UEp2Vt5KfmLV88aOFe5/tzLToQtwMPdSmjrfLhqu3fx9pu6LNHCIIO3TY4lZdoSuNi13L3PzgwL8d3hxR3+cEHm3QzhRQAW5msY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787040567; c=relaxed/simple;
	bh=WQnQ6/awaqesyO4FuxnwtkQQVd/qID9Itar1frdoCTo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KEAuXSJFQq3oD2+VFSBMXJ9sxfmGScjx+qYM5+FNjUgtZup6wTMl5PY9fO7UzJS7TsumhX1EtOb0vGjT++oKaSqGpl/yOlrn1ScV/03WGlFM3Q6e+1DnF+qYYUZrB8LnsqsRP+lkdzY3UvpTjfexGK+MjBbFSfMyAEcfR/HoVUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=s9wSldjb; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="s9wSldjb"
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-c9ef3e1337fso3495753a12.2
        for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 01:09:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787040565; x=1787645365; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iuOxCh9qY6VsPX+/asBmCdWifj8i9okEwYPqtY8odhc=;
        b=s9wSldjbks3MfCo+8vm1hxSmEmAAB/txoB4gFiYiRNrHVnJM1HIY1YEg5L5BxOkXUV
         ZrT1lLOH+CQxSqnDy/6vj7gIHDBwjqatAamXFVgb3N6sxHcW3Zz61TNPWBPbCsffDr5T
         Vp8W3zizV0EzMRwh6kaoMJH/Bkhs6trLuBsjEsDGdZcqMXtoctDuwiSPTyw+u/a0qMwX
         m+dvdxpfjoG5OaJ4pRkTYSJGk3fwExd5pLgGiDC/u4DPcbeqjdu+cVDYXHEZfIOBUCr4
         MfqZjfiK2m1Qfq3Fmsi0bMe1opD39BvudrRi0KZSESysYlu/JirR76VWHw7c1bKEaHeN
         sQTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787040565; x=1787645365;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=iuOxCh9qY6VsPX+/asBmCdWifj8i9okEwYPqtY8odhc=;
        b=WwQ1mCvXE299mJ/6+nY4eCU6KKLt84O4aq4nm9DK5UV5hbCUhKYx/M0r30b++MEh4K
         o7z/2ttchiLdnwn+ETpbtc76c0Pk9izLoVN2hTPQZ9HFS2BVcPMTXx9O7XPSNz7f3Gxb
         +mspnbVAJt4wGAglM9276B2RoFH95EjXvZpjrD/i0xvMQwIFfAL79e26LP0LMGo9LNYo
         t8UHWu5JTfR4FaCTxn9S073PksPpIAREHJrxg6qSQekSNTKtbOrg1vupXfy6iT0zp6CI
         J+JRV9pwUfLzRFAmPNVdviP5qzCva7tEr22TNOGy8YgsTvDSzsZjerlLUPow2v6tSl7E
         jFjA==
X-Forwarded-Encrypted: i=1; AHgh+RodS63G5Iq11s95+CLNZR0/jE6UzI1YZ+4ch9pJ4pV923f5IEUIDpgMtGUxV5jODKLorUaM7uVL135+@vger.kernel.org
X-Gm-Message-State: AOJu0YyihfCJ386ZGJ+ckd2W9Ob0cjlLZThSkKVpbu6Y2q1PD+r/uRgD
	0vocoP7zD0mzs89CgrGioYaDV936dXzCuq2yXvY7bQjsxOIEAkrn4dRe
X-Gm-Gg: AR+sD123zar5zct5uQWdMdkY8yGkZ/rxPNdtjQZi73sHBsnkSGG+CM7I0KHjwnf6ENd
	PcBfudjH30rGsZwhHbuQH8UxfjCNcMYtIa6LRkwmQFdQV/k5XEwYaPq0I5PlJEkkXMSWhIPGi9B
	m3+7ndo2MOwQSrwPaEpfhosIntNKvHCHEvYHAvoBHiOdtCdalL9JiPMKVjLS74pZ/zWs/Y3I0NY
	zxuvu7WHsrUsoZiF3BBmQUQtg1Vut2QrB03YYmw5e4lkJgeNcq7tGCB1FbixvCdj27aBbvPrw71
	19icRoUXRkT1ndNbO6CZ4eeWl4wjwKaWw0OQ1ir2YX26EilOwZXfyOxH8GUopYUsq3KDF+NQ7Vr
	iEFu91yXIqYU+IHmo1to1+1LI8o4DNOl8SJsEXFlMJU/3MpgyW8ixcToB5xPrFPR1C2eEVz/GIf
	M+uUJY3WgD4m9lOFs59xoh6gWz5ZglysHaq3/UxZrOoJwPlYianCqL1bMcG8uWNA0BgGcP4VFrM
	/giT8TueXs=
X-Received: by 2002:a05:6a21:7d0c:b0:3c3:a3fd:db0a with SMTP id adf61e73a8af0-3ccdaa0da04mr9243528637.16.1787040565566;
        Tue, 18 Aug 2026 01:09:25 -0700 (PDT)
Received: from localhost.localdomain ([152.58.217.90])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-32678dd08d6sm22606290eec.4.2026.08.18.01.09.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2026 01:09:24 -0700 (PDT)
From: Sreeshankar K <sreeshankar0910@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	andersson@kernel.org,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	konradybcio@kernel.org,
	tglx@kernel.org,
	ulfh@kernel.org
Cc: bmasney@redhat.com,
	lpieralisi@kernel.org,
	quic_tdas@quicinc.com,
	danila@mainlining.org,
	davidwronek@gmail.com,
	robimarko@gmail.com,
	linux@gurudas.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-pm@vger.vger.kernel.org,
	Sreeshankar K <sreeshankar0910@gmail.com>
Subject: [PATCH 07/12] dt-bindings: power: qcom,rpmhpd: Document RPMh power domain for SM7250
Date: Tue, 18 Aug 2026 08:07:49 +0000
Message-ID: <20260818080754.4362-8-sreeshankar0910@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260818080754.4362-1-sreeshankar0910@gmail.com>
References: <20260818080754.4362-1-sreeshankar0910@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document the RPMh power domain for SM7250 SoC.

Signed-off-by: Sreeshankar K <sreeshankar0910@gmail.com>
---
 Documentation/devicetree/bindings/power/qcom,rpmpd.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml b/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml
index 0744a867c..427953913 100644
--- a/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml
+++ b/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml
@@ -63,6 +63,7 @@ properties:
           - qcom,sm6350-rpmhpd
           - qcom,sm6375-rpmpd
           - qcom,sm7150-rpmhpd
+          - qcom,sm7250-rpmhpd
           - qcom,sm8150-rpmhpd
           - qcom,sm8250-rpmhpd
           - qcom,sm8350-rpmhpd
-- 
2.43.0

