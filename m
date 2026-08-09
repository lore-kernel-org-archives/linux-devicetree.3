Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB6663AEB29
	for <devicetree@vger.kernel.org>; Sun,  9 Aug 2026 07:29:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786260546; cv=none; b=rJsxsQncpa6m06Cps3FscFzvkr1j5KW/ljw+6UlksvuzNcwRxkbYyQlKI/3rB9a4cvuOLGVackfWyBPLmpwiMEvezLeQYMUWNXXLFOEj5G133zlEouiwIW0EfkiMNfQtaLSJ8utW0WUxje1Wyj25ibB99EjBy63pvy36m4Jlloc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786260546; c=relaxed/simple;
	bh=cOmOJ5dbV3GIQe056RBD75wdCBDJKgyApOIxb4F6H0c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ukv6YcFOjJuIUadtq8z7Kd1p/AusIoAxYiSgVXj0/2SxNraPTY7/Tc87oRXnnIEpXDfsF/arPO8A0lGkpHaQsbLCrttxCgHVSYsIK9XDAU2WB6IIpsZdWxJkI24VVohiqikDjQpnSs3GDgm0FwAzU40//NdhCzQ0xqMYevskUdQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GqwJwB+/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OBF8MDD3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GqwJwB+/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OBF8MDD3"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6795bxwF1556451
	for <devicetree@vger.kernel.org>; Sun, 9 Aug 2026 07:29:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VilHWKEJkx3EHlqeaLXr0SbhU/0AlNwgfKBvkLnh058=; b=GqwJwB+/+9nhdaGB
	ZAhT2ftoHgMggjeUqgrE+gwShf03PhpseCsxHpmiwbIgqgxyReeUssghItdM4uEG
	Rl1tQH9uDo4wdeLDuMUDiOUV61OrhVXdXHaawHsZ/eMVi488Qgw0uRrAl/CofYCG
	ghhhrfhvWUfSGbajJJyQ+49mfRWrKUs5awC+7X2JiHUZ5Zz4vhMYJDteMyj5rNs/
	z4yBB7EXaP/0LMgzr00n/mlVdaq3WOvIS3KqvW/9D2kAFTfSq0tCzdttzFwQB2oI
	VIMjGLrkQazqamga42pZdKhSnONe6E+gA4U8CfH9ZdEBBPsnQAWLYY19ieMkRe1y
	FSZ27w==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fwwr9jbx3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 09 Aug 2026 07:29:04 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c860544c077so2139995a12.3
        for <devicetree@vger.kernel.org>; Sun, 09 Aug 2026 00:29:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786260543; x=1786865343; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VilHWKEJkx3EHlqeaLXr0SbhU/0AlNwgfKBvkLnh058=;
        b=OBF8MDD38zA9TDACSBvzWbhGFsowAFXN8tfp7kHCt/a4scAFOdrorzqavoTx+Zh5/h
         PQGoNF5wM3JcNJ6E1VHfwGY9iLyEZiWZb688ebaCZkJTbpd7tojqLPCDNJ+ifMq463Xv
         NpHMYIha6K6t4Ek3NeJ7q0OpptE0xcJn4j2fKZFkdzw2ROFwHBOA6TYs/XM7+7KfnP2x
         bzpDYoZpoNv+KPe9a60j4IwgWHAkZMTudQXL4NbMNEBh7vqE0cGABwNbQcW2f59I/WS4
         BjAJ995VOZLVCKstA9qm+9ygu+dwWQPV8tSvA5j0o9P7Yh+hmvjK73mRr9MEchuoxFqT
         Lz6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786260543; x=1786865343;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VilHWKEJkx3EHlqeaLXr0SbhU/0AlNwgfKBvkLnh058=;
        b=Xr2pcCU3FQcAFYFbrIkrGOZtV37ViDhB57q6mj+HoxowdLJUOGTGRHVVgO+pQeGMW0
         V9o67MY9rtL0LedMqJTK2iEpQSHrmt1/mPSg0ojpXx11xovkyFxX6JQoewVU04NyalAb
         rk638XRv+3Mg/OktjzP8sYwLNfxEMVFDuG/hYTh4MAyv0A/QTFXKVh3jD5ZBT2rjylgd
         tLmWCadiSi8ggGA9trj8QBrI37tXSVixGdUMuNUEwbgsOdPHRZ9ErK6aZ0QPhVT/IkL1
         9kRmmicYERWbAs+hKB7GB3ReutmX4tvkF81Dedo5opAHVuqtLwsU41ySkOUBNfxpzCyz
         KdAw==
X-Forwarded-Encrypted: i=1; AHgh+Rp77v4G4vYy9h9vzCpxGf1pqJrzjLTxuqAfAlyXT/HT94ZwA3cImZ+wxRjLtRXqvzPxsUDLtruhzWxb@vger.kernel.org
X-Gm-Message-State: AOJu0Yzfe4T0VUX0btQjH6exP6oakEXdw7qe0q2ahTfaqd5++E4nqVrp
	6NTfidYGKSqWmzP3yH9ejkCC7ctg4ODdBR8ydTRZT9A7ssAny5+UsKj1hesPDDaYASqyWkCOzEw
	x/UP7fvz7pdWl5gT3im8JBt5NAexzAbqiVVYjQbBGnHkGGwym/XzI8wasqd/czu81
X-Gm-Gg: AR+sD13ftyQ/PAZQNJzhD66fxbu0dJc3li50/L42C8RlRN+Da0z+ba7gFtiwJFvZ06T
	im+wIVqD6x/rhnat7gXPSOuKL8NCgNw3noxxE+6hS9AlsBFFqIhJY0v8ZYcHtnjZ1mveREdWM7T
	Yy7hH3qGTguDn11mqDmO4HRJH9hwaylmWTAxXZZ+ZWVAf1orwo4TYCQYCE9z5i8YkIazaNRpNKZ
	3vWiHuZKhKJxjOHnKddgW9v8/JKJVojqi8Lf+0GlM+pUSr0Ncg5VTllMqgeIChFeLJtCeDRdx0b
	GRqEXujadz5XRWnmNUwYPjFvyjU6kiuNu9HSC9daSiM5PsU00cIdCSX0/9RzegdL3yV5rO5lwNZ
	aRlidyrAzjbeYhydRCQDI0uao7zRvqiAPe+WsN8KeENkjIn+yx5XQ0pwzI6VKejoJHly+uqG63p
	Gw1r20vJtkdhRL97FJA7U98e0=
X-Received: by 2002:a05:6a21:511:b0:3c6:62e4:91eb with SMTP id adf61e73a8af0-3cbc041f1d5mr18614631637.24.1786260543530;
        Sun, 09 Aug 2026 00:29:03 -0700 (PDT)
X-Received: by 2002:a05:6a21:511:b0:3c6:62e4:91eb with SMTP id adf61e73a8af0-3cbc041f1d5mr18614587637.24.1786260543008;
        Sun, 09 Aug 2026 00:29:03 -0700 (PDT)
Received: from hu-hardshar-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-141019b4eabsm22655630c88.6.2026.08.09.00.28.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Aug 2026 00:29:02 -0700 (PDT)
From: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
Date: Sun, 09 Aug 2026 12:57:12 +0530
Subject: [PATCH 13/15] dt-bindings: firmware: qcom,scm: Document SCM on
 Kuno SoC
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260809-kuno-soc-support-v1-13-5e0ede4a0c72@oss.qualcomm.com>
References: <20260809-kuno-soc-support-v1-0-5e0ede4a0c72@oss.qualcomm.com>
In-Reply-To: <20260809-kuno-soc-support-v1-0-5e0ede4a0c72@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Taniya Das <quic_tdas@quicinc.com>, Georgi Djakov <djakov@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Radu Rendec <radu@rendec.net>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
        Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786260433; l=798;
 i=hardeep.sharma@oss.qualcomm.com; s=20260204; h=from:subject:message-id;
 bh=cOmOJ5dbV3GIQe056RBD75wdCBDJKgyApOIxb4F6H0c=;
 b=l9PLOYb4vo1eA2JQoI6YE2Ad8LxymxwZEW6f34g3FTwoT5FQ3BB/16Tuu5NJ8iklopEAY/w0L
 LUVNBTE2SBZAMvWNUOoGpSC7suV44JRDq7COOt5gSNJL+BHPAxztARd
X-Developer-Key: i=hardeep.sharma@oss.qualcomm.com; a=ed25519;
 pk=IvwPDKA2xr6jWaCIBBY2ran/H0124QUzVfun+CtEikM=
X-Authority-Analysis: v=2.4 cv=d73FDxjE c=1 sm=1 tr=0 ts=6a782c40 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=01DA1dDmEfGoSNMvxaQA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-ORIG-GUID: pgaUNI3JCnZCn_LffcjjrMBuKKmoFR7V
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA5MDA2MyBTYWx0ZWRfX6YmWox1XMLdY
 aIzSuYRF7sN5aOomKr/NV5qQc1FLy3WL+Xo9rYBL5RCkTw36NKPsRFpHUzJhn693L9+j7Uyh0nk
 tqVzTAA0FKLyIqAqw2EsgnB23g2wlw9dDa5IrO/sdSe7WhTy1fAZwazoSkf+v0RWHSl71DDtVm+
 rFsMx1OLapP566gT7ob8PxMS8m/wsa0H2nrHgeQNqWpr8qRzrZOR8aWmfH/Y63mtVKGxF/W01oW
 EIqDERQ2F80/awIacT9AlbefVj/qJriOKFP3jCg3eyorE1LUhKtOsEV+lpmXZmZyLoTPLVWwC0B
 CQPCnKgrWIToCf9UwHlxLc1CxY9bWi+nLI7XDvOrz0SRZ5CFJe+x1uXR9YWjH77YCQFIF5ssm/N
 RRHj2wBwL9PKnH99roygJ4awVuAtVe30z2emFewBsoFd5eTD+rlG1+b1InxhgyjuurGzA4LUwyt
 F/ObYcTVtXofSnjfIpQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA5MDA2MyBTYWx0ZWRfXzJvzVJiVWdUl
 uMpA4NR7qMz4AXExTuk+ePdmlkAAp+gyOI/VMKkc5UQmvwmAUwRKGABoR1DMh9U6nfRLlh5eV3t
 TU+c9vgHVBfzBN/krkP5aUgqGJSMGOQ=
X-Proofpoint-GUID: pgaUNI3JCnZCn_LffcjjrMBuKKmoFR7V
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-09_02,2026-08-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 phishscore=0 adultscore=0 malwarescore=0
 spamscore=0 suspectscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608090063

Document the SCM firmware interface found on the Qualcomm Kuno SoC.

Signed-off-by: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/firmware/qcom,scm.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/firmware/qcom,scm.yaml b/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
index 037d4ad8f718..ecee5aef65a7 100644
--- a/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
+++ b/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
@@ -37,6 +37,7 @@ properties:
           - qcom,scm-ipq9574
           - qcom,scm-ipq9650
           - qcom,scm-kaanapali
+          - qcom,scm-kuno
           - qcom,scm-maili
           - qcom,scm-mdm9607
           - qcom,scm-milos

-- 
2.43.0

