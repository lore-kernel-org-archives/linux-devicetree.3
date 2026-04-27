Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6506025F7B9
	for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 01:31:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777253500; cv=none; b=QkABpp0ZZvDnnh1qXYPAQGXsuuZCMRG27n780CpDxN2OF1aScOZK+kQq0uyIraV3LbDbdV4Kt76P1hYXngZXFivQNRKRJNr+hfipxknQ1lYQ+/biSwqwJJjZz8ZGctmJKAwqXg3njz8XutjZOkqMV5OGNQCiT8uS+H4msZF80aE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777253500; c=relaxed/simple;
	bh=GMmcn+CVvliit5mGd6Y0/iKeyYddLwRd3s2aVazKWbc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OF+6psmov61/cgYHDTb0hr8078LJSdO2c9G8BeBHnL6Wtzxjvr3bjaSHdUxu+tf8P2PeICsAQPhJWOawgerpctQCMr8a13UfAdSQSvGCwX6nlILcSWyWc7BEvN/jWp2d+5nyQxIZG9Y5dfdL9WsGZHrXhbFDv0bvSg4N6RQcsko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lYQwuzsl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OJhVawof; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lYQwuzsl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OJhVawof"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63QKg2V72552128
	for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 01:31:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=11+wJCVGbqH
	Fg8+Qau8Gh/1gOG6th05BId0D3j7ZQ8g=; b=lYQwuzslmgwiNHpn7lMKv5N/KwQ
	xRudwaUKa2kiEqtaEQ/leO7Bvrs/irnoMBCJZea8EfAgxUR4S64Gyq4/S14PdOsc
	ftA0EdC52vZ4qhr3qWBtJeuWkkZQQNGx60farJf4+kk7JurlVrVh506s+WU5q1xD
	dkpuJByIOBFNfcbyhX5F/LtMY7Iz4/SvEEQYzKtQbkYtEfAGgylvK93toRiyclBG
	11COuDIAknIJAuv6QfwbaoYycUD6J2JHsllu6XkjsuDV9aAgoPOh+btgHlk4dhrx
	FCjMI6xl0OUtM+u9i2BSeUqlWygH32+i8b2Et8if6WnILLCncqdpgJyrAeA==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4drnkxbxqn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 01:31:38 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-2bda35eab74so8662674eec.0
        for <devicetree@vger.kernel.org>; Sun, 26 Apr 2026 18:31:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777253497; x=1777858297; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=11+wJCVGbqHFg8+Qau8Gh/1gOG6th05BId0D3j7ZQ8g=;
        b=OJhVawofm/S4BMWClAc5MsAN3CfqK+wecIhKkZnWFNQWnaVy2X0FMpKGpakGASUBiJ
         ykw1tD7p6Hu6zSUudWmfuyTci/CnkkOz5XyQgh/tEOX/LA2pA6hMowaYPx0yeqzPCKVF
         v2tefHOtZzzcmxTPmweu6zsLl318D9D87NAPTBfhli40ugZ1A3sgA9h7Aoj+AGypNtCt
         b0Zm64DOOQ5lRw0ccPq6j8UZmsv0D+/a6Wn42uTMnBPYCjIxQmh/pmOYitZC2GCVFA0Y
         ah3sFaRsNQprBubXVwbdYUUB61ddwO1p31ytET7SrPNc+Xwm8nrA2KRTPUPYjtrIuKZt
         /j9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777253497; x=1777858297;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=11+wJCVGbqHFg8+Qau8Gh/1gOG6th05BId0D3j7ZQ8g=;
        b=LQitnPzGQkBDUy547KMCOUx7ZeNKEXIPJJSYuwb76yxsL8uV6u0S2w2YgrkT/l4/2Q
         LzPv3Tzss8gDiV7w/HiJ3Tz/2VDPgWHtCWQTooe2EOCRKYuCVhXmrBPE7TyjRmXEu6OY
         LDR5a/VHOvw7m9JU6RgDSP+R+2ByIhL2Q/77ck0U2HTBcdQBHC1Y1oWf1DclTZOb7Lsa
         8o1Dd4hLssMKrKfDP+BZ7Wng7K/kor6/AFI0LGgRdA3TLm3Ag8gPtvLWAr09OyxDdK6B
         m/EzCbT1UKylkfjcn+gwZ3t7/vmiwQjG5aoqMjO8E8YSFb4py1EFJiv8B5wHs1YK3Eod
         z5Wg==
X-Forwarded-Encrypted: i=1; AFNElJ/Pr+jYTG59dV3v94hCTZoUt1Ci9Q1YYMYJ6wsUaYadnhNVimEqi0KDYaxSz8YT2h690HFLnBPDo1Yt@vger.kernel.org
X-Gm-Message-State: AOJu0YyeTe/gQPyX5KaPzddGmxDtTNflMdFgqFB5UFykJWYCLk+7IZiT
	NEnO+wu9QLBedH3sj6gNO1uu10vxkkQQma3EkhYlFqjdorJ2stcbANw1e4kDLfsotNSDGGy4ySH
	PWYyQL41E+12E7e4Vm9T8hUQzpi6atNoZ1kkSZAClv2of/ZOQt4q9v3qmLUrAubp/
X-Gm-Gg: AeBDietXxnVdg9MJ1EttS53Lw24g8PXCd8pzA4DrLHXe6mHwNkBzVn6sqWXLVE5hv3w
	YWf9qjxmskDI/7dRJa1F/VEYjTIZgP3oKebpka6aTvRQtG8eOb54o2hPXaVvecV1in7g0d/Xhuz
	sJil3EBTGWa4xeqrMwN1R9U/+/J5GHWh+XEOl7KkcaQj2k18hU1DUrsler2r3zfbTkXdSo1iaJL
	PPXS+XT8qNnDpnCa1a+jTYIZvsGqEO6DcUoXgdRoIPJxhzRYUxI9CxoomsC9eMi0h8Ea5jBWfPj
	OqHNrZblAVk4yA+VJ/kFW4OA+hv5P/roHqMOgFKHvkyRuabZbODFnxUmVYxlggieV5Akn3kE0OT
	LScz1VHMCW1onE1C3jjHxz4bo758W/dV6O24OwPUFfhu4CFPBmRKCr7giwll2PiNMh2UFs5u71m
	w0ASGtLyN8OWa8O3lr
X-Received: by 2002:a05:7300:5711:b0:2c5:c532:1fe1 with SMTP id 5a478bee46e88-2e42c15ceacmr18576866eec.3.1777253497366;
        Sun, 26 Apr 2026 18:31:37 -0700 (PDT)
X-Received: by 2002:a05:7300:5711:b0:2c5:c532:1fe1 with SMTP id 5a478bee46e88-2e42c15ceacmr18576852eec.3.1777253496801;
        Sun, 26 Apr 2026 18:31:36 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2e53a4a8018sm52749042eec.8.2026.04.26.18.31.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Apr 2026 18:31:36 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: "Martin K . Petersen" <martin.petersen@oracle.com>
Cc: Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Kumar Dwivedi <ram.dwivedi@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        linux-scsi@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH v2 2/2] scsi: ufs: dt-bindings: Add compatible for SA8797P UFS Host Controller
Date: Mon, 27 Apr 2026 09:31:15 +0800
Message-ID: <20260427013115.231731-3-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260427013115.231731-1-shengchao.guo@oss.qualcomm.com>
References: <20260427013115.231731-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: SA-EYt4QHrIHyf99Sh_aQHkGU-0tGPdv
X-Proofpoint-ORIG-GUID: SA-EYt4QHrIHyf99Sh_aQHkGU-0tGPdv
X-Authority-Analysis: v=2.4 cv=TuPWQjXh c=1 sm=1 tr=0 ts=69eebc7a cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=VwQbUJbxAAAA:8 a=ld1VxiVWUvbaCiqNsT4A:9 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDAxNCBTYWx0ZWRfX1CRLgAbziOtQ
 xPiFLrFtHLpKJfUwDqehZOC4PhvXY7sMjf9tqLnjUdcMML/n57bjLO1k7bPaA+wS4ahKLgNAymI
 laa3Pgq01VOnR2rvsZ8R1Wr9a4yg8xWzbswQ3jVuhF5nHTVP9yUKgWlNr9HkX9i6z0p1jSsMf0Q
 l+RAizD4gcu7k+jdefi1DJAQVxYJXiqOL2qG7w0jMrcreaXZTFO+FWtY0IATEHRuj3BEWn7nZA8
 RHph8mu0V+ta4c6RlArH88U7jxsYqh/jnQEDFu4pi1mlTFRCMnoFHnD04eptxJrWQ/CcjYWcik0
 ZSUzfL8vBPwRWBmuMWpo1hwyWCmd++ojQZyJ/pdCYjavOT17+dEM32vJGrImq+gJSpILTeHJua1
 T/4M0lnQncLsoyvER+XltQs/SnYtUTUjbtYwjVzRQtmcn+OhqdFpTc2AVL+tzg0ST9gRrFaz3nH
 cPA07U2qfpF2Uy2kWCQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-26_07,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0
 impostorscore=0 clxscore=1015 suspectscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604270014

From: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>

SA8797P is the automotive variant of the Nord SoC. Like SA8255P, its
platform firmware implements an SCMI server that manages UFS resources
such as the PHY, clocks, regulators and resets via the SCMI power
protocol. As a result, the OS-visible DT only describes the controller's
MMIO, interrupt, IOMMU and power-domain interfaces, making SA8255P the
appropriate fallback compatible.

Signed-off-by: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>
Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 .../devicetree/bindings/ufs/qcom,sa8255p-ufshc.yaml         | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/ufs/qcom,sa8255p-ufshc.yaml b/Documentation/devicetree/bindings/ufs/qcom,sa8255p-ufshc.yaml
index 75fae9f1eba7..db165a235cb6 100644
--- a/Documentation/devicetree/bindings/ufs/qcom,sa8255p-ufshc.yaml
+++ b/Documentation/devicetree/bindings/ufs/qcom,sa8255p-ufshc.yaml
@@ -11,7 +11,11 @@ maintainers:
 
 properties:
   compatible:
-    const: qcom,sa8255p-ufshc
+    oneOf:
+      - const: qcom,sa8255p-ufshc
+      - items:
+          - const: qcom,sa8797p-ufshc
+          - const: qcom,sa8255p-ufshc
 
   reg:
     maxItems: 1
-- 
2.43.0

