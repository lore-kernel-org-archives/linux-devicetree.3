Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794328769;
	b=KIJaMo9NkYckI4TgykWh2QTBuRliHqlldZpLgGNbtM3FL370IkG3Sgn1beeSeuhTDvPK
	 ISnZ3/rMMEjGsk73zpojkIj8+itvbnTBQo1bZ6QGoGmA/I+yzDzZLdQ4p0VSWSa6Ngtuc
	 AzPuHK0le3Y6INDggmn3qs/aWcIrh+YxK23GQnZiG4cuqHgeOCGRRAL4pr6PFZhu9Yabh
	 Cnj6JRMdekdDXYQMXKMa+Rz1F29HwBtOVJDGk415yh8eb4Dkh1ItTwFg/4YuZEcnbR78D
	 3cd4RjLVp8T0FhJEIHoP4jyNZIVKRB9EhrYGvplV+Pn811+OTJgfCkDXj8lK9fpY/tQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794328769;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=xtBrngpMGCeQ6vCSEXy9e3E60S6AP7bfg0Uxum5z8t0=;
	b=pSE19Azinr0YYl+lB5YX6QkmAyiQc2x3hv4aTQfePxAzz3UztfTJYhmRoLWL0k2qPrzj
	 LBsIFZJ5JCI0NXusics8z5pD34L3ipv91kUlM+lqyObCZNbUIG2cQnh/iIqkQHAACGpQ5
	 ZISijS9H/vFJn7kFoD7ZCYJxBIrcJK/I0/xqqY62pEKmEQO9bRDbDi+TqsEk9ogF4zXA2
	 smEsUXrEKFeCHMe8vTtBM/KH/jOnERV0MhyT6HRqf5yX8L93fpIylkCT9NjNcyM/T2mlU
	 rA0ycS3hWjkEKWsU1LKkSLTts8+FZrgRu9QFcScxPR6bmRhfjoTMY22RMAgpcJAYh9w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="B/tGTLUl";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=POxdAeS1;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72C9D606E829
	for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 16:39:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 72C9D606E829
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=B/tGTLUl;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=POxdAeS1
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AAF08Qg3376610
	for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 16:39:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=xtBrngpMGCe
	Q6vCSEXy9e3E60S6AP7bfg0Uxum5z8t0=; b=B/tGTLUlL4K0hJ1Q1MWsk7HzHGo
	wLEaG83DQtjsmlsenGMR46YrTnIVk1Kakl9QDejjuxd6gNdon+MeSim9TPrRooxF
	RlETV3dDdY3HrJKJKRHOeUyNui3JqvWz7VwQbBtYakjHBbSeweQqnRoRyhoEqcWG
	kv2syDYc0DOKLqRZ2oM5oOi20vEjOm6pyuoX1GY+RzqmYIzkpmy2pZ/zcuOhwDTn
	UIjkXNKZBTZeElsbQfh3AVzL6FseFPER83WfLb6n41Mdiv5aFXN25kVcpXfI2F2g
	7xlHLk0NAeIc5hH/UsfbeT1Xx7E3ZAaITl3Tgm8g7YKo+RAMQ3Ky1FhhuIA==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hux84a7cg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 16:39:27 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-7d2c86e7e0fso1422282137.0
        for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 08:39:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794328767; x=1794933567; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xtBrngpMGCeQ6vCSEXy9e3E60S6AP7bfg0Uxum5z8t0=;
        b=POxdAeS134a/bHTQP67miwPT7SR1ie8Rh3La+Ea7PL5jU6v/4O8mLYt9n+Mwhnh7e3
         XxR5xnAsgP/reK2x5s+L3pmkis0jjBU9nJcfP1byfMA6D5HGWY4rmZqhGirrLq3kLJXA
         EpdlfAoVE+0rAbt5655CBK3sSIaRguZekV3lHwLjNnOaZAuYp+thbs4jO1Cbfa/0nhvF
         If5H+rkcsv77MkPMrJmEzgelAKQG4+FU+o0MH+cgiuEqMCqi93qIFqw0FmLmQBVvud2n
         j2kJvoglStuUBbnXOKVPgZ4A8GBjOG9Vz1L4ekRSvbOIVd6IzJfK+2kok2lf15rFgRI8
         EGGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794328767; x=1794933567;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xtBrngpMGCeQ6vCSEXy9e3E60S6AP7bfg0Uxum5z8t0=;
        b=Bf7YKaYoNZ/4kkiJBKmiXc46xIZoEm78VOUqm/3uWWgZNYtXeCAtLKcK2tDa7Dfojq
         1USCyt3NzjtLv7+S/8QQsA7jhkI8Rmf8ikctawdAwogI4kljX97IhNwSz3XRMtQD9gY2
         CZ0qxZCMIgydY2mOxOSZCe+/4mDVVra/7f/x+tzBOF4eDjHyAIXAkxUfE+bT/h6vnm3+
         103AlwpNw/GFKCzw3tFcgAkI4Hut7jlSg1xyFR1IKTTNFP8nvgYBRUVRRjwCHJ+TDiS4
         OfX4ZERjq06JM0NaH5ReLGWr8V20j1a3nkIBClElCfJ5uR8HtSVpIQsbUER1JaUe0/pS
         QhMQ==
X-Forwarded-Encrypted: i=1; AL+hErGLpOATQ3mveXgCiqhpDy5cNoAQe3sFwvuJY5b1K9Uf4HYccSmeIOZeTk19eDaAQzEB2OuNqJIbtgx1@vger.kernel.org
X-Gm-Message-State: APuU4Z9dVdElnXgj9+j3K4PSd94J2JDXwj25fDD4hfLiyOLgakEFJ9Fo
	PnCLJGfqxGmdV4uFeoSTaOX+Buyip7xOYl0wVeqEBkhcdsXnwheRtQ9nljBCRODsyLquDM9CsIq
	wYTTe/wyboo4uIqS6GCrTMRkfk305+DeSIj3CeD77FV4lGHHyARj3TJ4vi++UdgyW
X-Gm-Gg: AYBFou2nvrfXTAYMid5k/3uk7KDJYUIIrO63TXlfTmM2FkhAftOBf/zrsZ6UMjfiJ7i
	tUIq1lIewAKe/AgJ4xXDj7e3lwSnwiOd+KnJqOEEl4mQqAUAo3dV/n4YYKwHo9brHII/8qmGreg
	CaMtlQQ62a7k9gfdMgtxWr5pzDh9rJ+0kBbTa7Z+4A1pyKKzli8CSUSAqa7lWa3Z29UCBmPZvBA
	Prs3w3syvEUZl+T/O5i6YmEGfjlfiE4Zi8eAPaPyo1lNKRdNfPkW59b0mAWqz43Q4vzNGDrae5D
	ZkWDWOsKAr97TZM7QDpJ0UduX4dim+J55D8cICEPaOUu7xZ7ZDWW44un1DQZGIVcxmELsFtja/A
	TRxbGuMjHa6M2RfY+yshV1dMoEN40ZP3g02GIMjOaCmquASNniNthr8KGgwftrKPNHGTSjsWabg
	==
X-Received: by 2002:a05:6102:3910:b0:7c1:8aa5:36c8 with SMTP id ada2fe7eead31-7d301c3ff3amr1254823137.36.1794328766658;
        Tue, 10 Nov 2026 08:39:26 -0800 (PST)
X-Received: by 2002:a05:6102:3910:b0:7c1:8aa5:36c8 with SMTP id ada2fe7eead31-7d301c3ff3amr1254799137.36.1794328766120;
        Tue, 10 Nov 2026 08:39:26 -0800 (PST)
Received: from lin-0772.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba01ff3428sm85130395e9.15.2026.11.10.08.39.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 08:39:25 -0800 (PST)
From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
To: linux-media@vger.kernel.org
Cc: bod@kernel.org, mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, andersson@kernel.org, konradybcio@kernel.org,
        loic.poulain@linaro.org, dmitry.baryshkov@oss.qualcomm.com,
        gjorgji.rosikopulos@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        atanas.filipov@oss.qualcomm.com
Subject: [PATCH v8 6/8] arm64: dts: qcom: qrb5165-rb5: Enable JPEG encoder
Date: Tue, 10 Nov 2026 18:39:07 +0200
Message-Id: <20261110163909.78085-7-atanas.filipov@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261110163909.78085-1-atanas.filipov@oss.qualcomm.com>
References: <20261110163909.78085-1-atanas.filipov@oss.qualcomm.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDA2NiBTYWx0ZWRfX8x1PR/9svHHf
 io1tJiilftI0hpcoxowRQETs3sOuhJYV+WQaLJx81zJMmzsVOkzv5WqcFKs6gMYpO4krKa0m75D
 tOr6fseNDFwtB4Mw1zr+u9vYOCxGWtCXI/yynZwqzYiaYZktuVdmSiCVhytfRRaCrhv0BMeQrLK
 2usSFbGZF/OTVn8y7jNoDcm7t+utr4PMcnhgtA7bIa2KpKVsVB2NHABSwnk0Dn0RQ7VRDRijeLp
 cBVum9SnnLSBeulitaznNyLFUaH82ahnL5mYBsQQGjqpDaTKcDOdk56w4LT7k6h4RssmcQNN0Oj
 Hf+tdZozsN21nBrVGNJ/3IIrAAo+e/51HcmfvP8dDpFrtsSgLGaOaqO0tGj3YK2g6MARuf+P6M9
 rMHcySJcVZdi9czOlqLpvGen98yAqT3krXnM+SXTBOwMqOVxy1TWlFmlFTIcw115SiIill1rbDp
 R5t00JBnw1e37tzI0bw==
X-Proofpoint-GUID: OJNHzPrz-qj93E2-X5Aj3-mByBt0iNZd
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDA2NiBTYWx0ZWRfX1aRpwsLKVnOT
 C2Ll6rNwa1Q6GV4M5QMPpokvy8HAOgKA3lUbv/PalFWt91pniNyh13vr+kVpDhJgskSp/9YPjp1
 TV93dAGic24nYO4IO5r4aweMmL+OETc=
X-Proofpoint-ORIG-GUID: OJNHzPrz-qj93E2-X5Aj3-mByBt0iNZd
X-Authority-Analysis: v=2.4 cv=JNSuIMKb c=1 sm=1 tr=0 ts=6af348bf cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=YFy_RbSkoLDF6nbOkSQA:9 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_05,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 phishscore=0 clxscore=1015 adultscore=0
 lowpriorityscore=0 impostorscore=0 bulkscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611100066

Enable the JPEG encoder on the RB5 board.

Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/qrb5165-rb5.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts b/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
index d6af679abe1a3..949328806a9de 100644
--- a/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
+++ b/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
@@ -668,6 +668,10 @@ redriver_usb_con_sbu: endpoint {
 	};
 };
 
+&jpeg_enc {
+	status = "okay";
+};
+
 &mdss {
 	status = "okay";
 };
-- 
2.34.1

