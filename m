Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFF02337107
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 04:38:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782707936; cv=none; b=VPjsnk07/ToSsWokNPhc6l9ytr/P1uXQcQtrnTtRi2PfmbO0nvhTzMRsWEz5GcA3ic1fQyMX/0VNIypoV6KhRUQoo6WBW0gJmtyXQsHYt7dafDXSTOjK0GcSugAJxeI7kiTVAodJYvQu2DcHNn4ZxBySIoCBKEB1P7u+JlVGr40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782707936; c=relaxed/simple;
	bh=6XedRWs0tAdQLU+ENS+Cwbaw+CbvhGUee8wliZmU0xs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LSJ6BWYxwpqN0V9A/ImyAL1sdHAJW6Et/T/hfLkws13MHvOIb15hSUlwwhwisjGMQ8IePdvvTb8D5kiOClqV6jBvMKdXdSWaOSSMWfveWUJDFApvCbX+aXozLp0/TynaGtdHTRR1KtZ8yA04gKM/bap5OApRRVe9jlSlHlV7bQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YMBDETHg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=M2CZWO2q; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YMBDETHg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="M2CZWO2q"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65T4NGfQ1771372
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 04:38:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rgU/Z7dK7belqgrWLmJtB2Jz951aedZsprBN+xIAdsA=; b=YMBDETHgScnJD64z
	7VjJ0jJEx12BuwogcwIhsc3QfJvf6QMFB8DaeGp6HnRGFQ6Iss7BKEv49t/BylUa
	8vscXZ96OwJ8QnNvnYDY77c1vi6UEzmn7kSDJXqozb/mo4GjifEv2v23iH8vc1yu
	g7fgYWXXJ1SFzFFQ1rw+U7knli9SNQPQMZGGMW03jNscwEF7mSW1LfzZWgL9PrK3
	N2KAxmfV8vTAqRvHoAHnpgr8CWfugforPpXvUPFTY0KjPCjZMOXntkh14FfHyf1O
	bSzk5w9gjxQ1oBqWzNP05p2Zew/y6j396cSQOYowK7V8fct5Bw3RqTSg+rRbGP6+
	UG/KOg==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f26tumdnv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 04:38:55 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-1384427c3efso8668133c88.0
        for <devicetree@vger.kernel.org>; Sun, 28 Jun 2026 21:38:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782707934; x=1783312734; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rgU/Z7dK7belqgrWLmJtB2Jz951aedZsprBN+xIAdsA=;
        b=M2CZWO2qOPDtfxpZhSHo7hxKBEJJmNuV5hjIZXGsPdSXL5hXd4lgViNUnrs4Xsb+w+
         Hl0aglWtwTWNLT9fy4yrGiqoX3v90Clkb1t5vP9/XJ3g/4iHDcCG6N4shDoCj5gn+uTD
         IoivKaG6zmgKuRAkJ6vlK7g+nNrbPmu9YC5UBhOBwFOAhtao+Nrviml2xxTshU9pY8Pq
         AUrpSha7inTxaUvlb8g99hboaRVAcKJkJ9Gi5sdzpC1FRHXMuiHEvI1i5VGmwvajZUz+
         Xb+WD5eda9poBHtqcHh4gDF57XqCc6s46kh8LJO4nbkn/WFRgTyPodvRNDYImMug/ETZ
         cC4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782707934; x=1783312734;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rgU/Z7dK7belqgrWLmJtB2Jz951aedZsprBN+xIAdsA=;
        b=J8BKTt5jfaGeX6+zaf7h7euw1/IUIkXAgMKMq3uv04Ql1Wc78liQYMWJ4A+JBLRre7
         2FMoTZP9JzHWenSqF5PVH0DtawQQqhnuhEv+0sptWJjuvkXyR4j3pSFbeW2/CWJ04M1y
         sKEOMpycFyNc0QKZk7afHg14/Up/b9WAp4kMmasZcMPgxxY5hVPxtPDxsVGlxlEUWN5F
         1MZi5hzRNWgMsDLaYOJbhWIhitquE8RNTrJo5WeMqhvG182yMMFX+a20blhyimVwcKCz
         L2sdFoDh+tIEtzYVu0WaKsgdIcJ4a99kd0vclQhNbEfEBRPGFWrEUnSWt8o5DB+JHCvC
         ywFQ==
X-Forwarded-Encrypted: i=1; AFNElJ80JXLNQuFASa0ra9tjDzMrJAVXvEbsXZ2xpmY5fYs7f418LMcv58XiQ4KwYjoEEhQygzkmU/q2XGSH@vger.kernel.org
X-Gm-Message-State: AOJu0YxFpIpTGuW+FoW4T7WJh+N2puUGcEcDz6slBJLn1j7WMIg2i1E5
	R+ByKaGsQSeJAo/VawMQSSqGo/dEx9Qeq6XpAXQpupv1meOCtNz7vFs7/xhxmXZhC7NEp6bg3jW
	+/HbKiLNhOxheFdh6E/vftn/SnKvn5XTEMiDnBzVHqyVftg5OdfR4wiPJypCnVFrI
X-Gm-Gg: AfdE7cng0AX3QHc+5pkhTvDdTlP7t/1xnAcIUXKuDR3MOE9a+9+0rRNex5VTInIOh6e
	mxub44ejHv+pXE8fAF7whWal0QG4Pb6EFx1yE9re1pvoE7fkhMglU4zRrA44ufJJWp4VdSRJdMF
	J0Hih9m4LGFIEOZjkaBHQRTHNQsKPsDt5aDN0Qfoo6uny4pFEWVLHMe4z1Zr2VdtnWe8uldtQD0
	/mZD0qdRBekmIeltk6S86vwYaYWSoGGUHHFkaGSIPkNijyuTg4VGPN02xS3j5ByLCBSnVlEvmxQ
	VopAqlJpgIHo+ToMLdZlZZkxa3oIockT+bIxF3rzhcfCpqSC1H1kINnua46z0Sn4eBSq6/92Zf5
	JBh4IRXycDLmXDudIJOhop+Vma6bd93JeUXLLFjpy6uYU9dCYcWEIOQGqM9hGWvbQvD1bu3DvMt
	wk7hc5dtFRhKpwx+CTd8E5T+zvuRFjr4SG5P/D5HwV
X-Received: by 2002:a05:7022:629b:b0:139:b63c:a0f2 with SMTP id a92af1059eb24-139dbb8bdb6mr11102663c88.33.1782707934470;
        Sun, 28 Jun 2026 21:38:54 -0700 (PDT)
X-Received: by 2002:a05:7022:629b:b0:139:b63c:a0f2 with SMTP id a92af1059eb24-139dbb8bdb6mr11102650c88.33.1782707933949;
        Sun, 28 Jun 2026 21:38:53 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-139fcf63021sm7791247c88.0.2026.06.28.21.38.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2026 21:38:53 -0700 (PDT)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 10:08:42 +0530
Subject: [PATCH 1/2] dt-bindings: clock: qcom,a53pll: Add IPQ5210
 compatible
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260629-apss-clk-v1-1-8c92fe118ce4@oss.qualcomm.com>
References: <20260629-apss-clk-v1-0-8c92fe118ce4@oss.qualcomm.com>
In-Reply-To: <20260629-apss-clk-v1-0-8c92fe118ce4@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-GUID: N9YcPZVI028j_qwkvgP39BNwjY7flTd6
X-Authority-Analysis: v=2.4 cv=A8Rc+aWG c=1 sm=1 tr=0 ts=6a41f6df cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=5uBAxpE-56c2IjUQXdsA:9 a=QEXdDO2ut3YA:10
 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-ORIG-GUID: N9YcPZVI028j_qwkvgP39BNwjY7flTd6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDAzNyBTYWx0ZWRfXxUOgqwmxuDhv
 +sGULqhPbvMSgaaZUyKtSNnjOrk9NW2bOcZsEgBqDFfr1966fE1eGIpwlxfus7Tcbzal9mVukch
 EMcHwlRoF4ZMvQMKLhGqodqfYY+aE+0vl/QAbtMBxF2An7hj9p2f4HoDzqKr2mZY4hUY/2jWX7i
 C1FCibrfTE3LUvIrhs0O5pM3hlt8QNSph0cFOyfusRF2Aa1MFUen2h7htVCyEy88rQuTvWLQws6
 1bNaMacCtC4Qgt4f7JJA/l+NLL2yQog3owwdx6HTlsjNkDSZxXQobxbfugoraTCCDCkJSL91Cem
 egZdCvnvhG7XZBVtJ+xZOZJKD4/ys3Rgn10zt+oaMUUBFRkTzxaHEUDn449JYBlf0QXkKeSqR9+
 XhQMTNRlIS/TaqkT4njFDUiJSEOXC0RS9Q2jkCgeIe3o6v4pkQiizMyejMGOlCQ1+6DCF3LEC80
 EMN1n7UNldlbdikOa+A==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDAzNyBTYWx0ZWRfXwl4YBuayVYdW
 LSqt8XwLg1iZurMo96xtYU213SqrbjeV2f+RQGETuCNBquD/NAG678YgpPuV5BwKa99zqhQn+Le
 jqo6PDNRzPy+PYTv4lIyxO6e0Pgjc4o=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 clxscore=1015 impostorscore=0 priorityscore=1501
 suspectscore=0 malwarescore=0 phishscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290037

Add the qcom,ipq5210-a53pll compatible for the A53 PLL found on IPQ5210
SoCs.

Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/clock/qcom,a53pll.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,a53pll.yaml b/Documentation/devicetree/bindings/clock/qcom,a53pll.yaml
index 47ceab641a4c..1eec77e75a0a 100644
--- a/Documentation/devicetree/bindings/clock/qcom,a53pll.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,a53pll.yaml
@@ -17,6 +17,7 @@ properties:
   compatible:
     enum:
       - qcom,ipq5018-a53pll
+      - qcom,ipq5210-a53pll
       - qcom,ipq5332-a53pll
       - qcom,ipq6018-a53pll
       - qcom,ipq8074-a53pll

-- 
2.34.1

