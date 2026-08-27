Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ADF047FB01
	for <devicetree@vger.kernel.org>; Thu, 27 Aug 2026 16:38:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787848742; cv=none; b=WyExstYNFYFGOtwUi9nPoOzLrMl3C+Q++lz5OXxgV8RAbU5FBfIMCQUSO++LbhMM0CgSLPcbiDZSfyl8G9qurYBUMqfvRSfrx6s5PpXawOXSpjh6b9vFWd3pzmKX7vaIocJpJrFxMZfR45ipE9t/hiDhCTzd4RLU5Q9EN80UTkg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787848742; c=relaxed/simple;
	bh=PwVD29DtUH4dIGkOMbXE9qMjiF+K6OUxLIjMJeof/6o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Dqo4XjWcIv7+87zpPTAVCtp8WZ2vW5hj60svaf019CNHv4Mvg1sl8vFfsK3yaddnWpw6OAu/awOM8D5aHoPCyE5u8IYNsZzh3/QNTeqNT47aK426g6AeLCzOHNIUhwp2pvEqir6kv4hJOf5AuyS9IefBSLOS+0EBsE8kSfAEa/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CUMOWAQe; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ii9VYzAM; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CUMOWAQe";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ii9VYzAM"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67RFbkKM3829505
	for <devicetree@vger.kernel.org>; Thu, 27 Aug 2026 16:38:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zPYfTHbFrfi2XEod5q3VXPMVscV9WPdiBhHDyk/uC10=; b=CUMOWAQe2SCk5xCB
	T3vNJPB7iJoTQI/mjbPVIYKq/aKPmR3a9CvuS3h8HW+FkKh8VRUp97G3BOIqMU93
	9tOQ+YOLJG94c4N+WstV9Jlxqxrn93HjFBiP320Jw+BZlgqtHogv88YdXGhKJ9n5
	zQ0S9Tjjaf2MtmJm9BCa6v3UGyST5J35aLSifHCq1Wsv7/pRI83FaqUhCzcC7qH8
	MeU2orlQZS811LW5UWPHse/ZatmrEUPPmv0euDeXiefxKFOChCY/6avJpoEod/Qk
	PyeR1AGIdXTPFfEh9NlboojGReWxFU38iKBX8YVU84RO3mUadNXLk64g3E3iNNi4
	So4Nng==
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com [209.85.210.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4game7s952-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 27 Aug 2026 16:38:56 +0000 (GMT)
Received: by mail-ot1-f69.google.com with SMTP id 46e09a7af769-7e9dee2f7b5so234442a34.1
        for <devicetree@vger.kernel.org>; Thu, 27 Aug 2026 09:38:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787848735; x=1788453535; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zPYfTHbFrfi2XEod5q3VXPMVscV9WPdiBhHDyk/uC10=;
        b=ii9VYzAME6cZWkBdTa0kvWgLy6GAZgHjCrkMnyevQMqCoMNB+Q9NgdIXxFg8aXmT4K
         ShIxvtTii3X+by+Dv5CwRKM7UHgzdMaRtbuY6890yx6NTj8PTkQV+UT6aKLFd79bNZYI
         ASFEUzntKl3E2SmOQOeaxkkV60E4Ex0jNsD11UzdTFb//9U9IND0jfUBVLPh5XB034RB
         NYc3U5DHi6Qn2U50OX7psVEaet6wZZHxKiv4kkQ8fLcFklqWK27zLrsdJxYpUtWsFjzy
         oc5pSbkqYo1lS22RJcKBeyaUTKHefHlORp5r3DPWNEl/uioJi4GBberzT+qAM8CYhumy
         pZqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787848735; x=1788453535;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zPYfTHbFrfi2XEod5q3VXPMVscV9WPdiBhHDyk/uC10=;
        b=GK5gD0yxJnW9nZANeJpIgS3LTdx8DmSQERHIrz3pxnvrwnI5Okl86r5ALAd+DAVoiH
         DIKUB4Da8aH73VhVrPfwC2UTbQCH67uOy+QBqfkBU/j4EnRS9AAFFvR8fRXDVw7WG/Hn
         3YjgITQr7ymxOEeyZpn9ZrGB9QB/9bIqc007FMtDxQt5v0NgCXDCqP4Dnjykk6H2nDfQ
         UuWagvNubqsuf+SUd5jwx5ncRHT/ccBjR2nficDjIWJSp/O8d3HvwhGcS1lsTfrSY+Qp
         Kgo3A9djPZu0Qb0JPI56TuNgLNAui4Gh0XGXf3vyvN88a6s8pR3Q3uj1XzPx5vaJITxY
         SItQ==
X-Forwarded-Encrypted: i=1; AHgh+RqrZaHdTUKLw45VBngAE6hBy7GfrxFgDk8JI+F6QgtYj32X8ng8gMhuZ2v3LaeToXlXw7VScO/nezIr@vger.kernel.org
X-Gm-Message-State: AFuF++ndK0kL+1dlb24MMaTgatKQQTTeyeMEwyL4o5a5HkZ7eWclWuFB
	uBJ6nCUbvB2LtbD/ayGjQWVqStPfOYNfmSCA7fb9LAXDcUZOBehcI7l0/ITkHAaDzWJ8AErLgxt
	zj38YkyDxPhtMD+NziuYCynnsg0qndKr7DoD2zcbTZ2yGT8JXssu0afH86ezC8S4e
X-Gm-Gg: AR+sD10nnNunmhdeu7tMSa4a53176MoDvDJuwy0yuAOj5HRe+KyaHrE+bsOlWs23KQE
	0xW2rsh74qgSDImKv5u9wnsBqqSImbaFwa7+1EW2NaiA77jQEAiepxCH7yG+EvjM6gPQ0dzipgx
	JSz4MPCqUdxFnRf57KlcPSAjUeGHMTkwNWBj5LBY6lrIXEWgfRodZapePLCq+SBOHQr4hg3e2df
	XUMfHuOFKwuAapPhbvGTW2cLa5jES791AzFG7/9bX+umL/equAgjK77ZYyV0bm3PVsCfXp7jEEQ
	8ldlgfoFwPj6uIip2XugbQKhR97qOcljTQRuoDkMolYZpW1RbGs3i+nSftm0OoIKPSTxw83HdMH
	QBcxtBMxlbDDJ4TEsYkLzgEgtU5NN0+Bf7Jl9NS/QqcLuWSqhArL8GxEwH1Kwp0WHd+G33DY6Dy
	gziR4/bgi3X07yz3yzReUFksg=
X-Received: by 2002:a4a:edc5:0:b0:6b0:1ba4:dcc5 with SMTP id 006d021491bc7-6b1a04aff4cmr15899917eaf.20.1787848735353;
        Thu, 27 Aug 2026 09:38:55 -0700 (PDT)
X-Received: by 2002:a4a:edc5:0:b0:6b0:1ba4:dcc5 with SMTP id 006d021491bc7-6b1a04aff4cmr15899828eaf.20.1787848734913;
        Thu, 27 Aug 2026 09:38:54 -0700 (PDT)
Received: from hu-hardshar-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6b1a24bce78sm4253171eaf.3.2026.08.27.09.38.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 09:38:54 -0700 (PDT)
From: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
Date: Thu, 27 Aug 2026 22:08:05 +0530
Subject: [PATCH v4 04/15] dt-bindings: clock: qcom,rpmhcc: Add Kuno RPMh
 clock controller
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260827-kuno-soc-support-v4-4-dd34f235fc1a@oss.qualcomm.com>
References: <20260827-kuno-soc-support-v4-0-dd34f235fc1a@oss.qualcomm.com>
In-Reply-To: <20260827-kuno-soc-support-v4-0-dd34f235fc1a@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Georgi Djakov <djakov@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Radu Rendec <radu@rendec.net>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>,
        Taniya Das <taniya.das@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org,
        Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787848688; l=902;
 i=hardeep.sharma@oss.qualcomm.com; s=20260204; h=from:subject:message-id;
 bh=PwVD29DtUH4dIGkOMbXE9qMjiF+K6OUxLIjMJeof/6o=;
 b=d7XrupLvy0iND0SZlo+H0OcXt79v+Ztj+iih40zaAtw0/Y0Ue4Jz76iybjEAjucn6S54JTK5L
 TAo00bkepGLCmnXDlkD1RitIb5HJ+Jqh92rB1LduDdsAu2Qwi8YgAoY
X-Developer-Key: i=hardeep.sharma@oss.qualcomm.com; a=ed25519;
 pk=IvwPDKA2xr6jWaCIBBY2ran/H0124QUzVfun+CtEikM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI3MDE0MCBTYWx0ZWRfX+mBkUtfQTStT
 P5cSobq2H6BlOImGlz7KnbyHE2gELG82Uhl6ekhKyPhBPvA9donh89CSZD01jFovof4Iav/po0m
 CKHGOJkgjHz5h/rcd6+dcNwkJ8Ssl80COsijgkBYsLTJRzJdMIUTRmd1aUaatXcm6aMkQX41D0F
 qsbvvK30bRG3r6+iBrYTyPoV7SLVJoicI+y+JnfqVeREPI8lNR0N62v7LJ9lCoWaPGu4UNezFpL
 n7WtYmV4aQb3Zpuot8d4cCzvTi6HolUAhlGKE/G+LrhM8bhxpyWcxRfwUBQtIWz0ubZDxJBLuGO
 GKyTh+/DIi58jwHppiwTwIoXojMBrFDv1WMKZBlJnP7KaACmLZ0JN3RI3lo4wcd9e6pdajouNvI
 8saWd14aHiuQumH8b7xrhKFYQ3ZDjyhpaBOWUi1vBqd4DIgG4jWM9sHgx/hBemMrR0TsLMDN9tK
 xlBSTeA2QdIIdBNBvJw==
X-Proofpoint-GUID: Q3A4nnDcWM2fCzGP8G89GFavJfl_WrKJ
X-Authority-Analysis: v=2.4 cv=Yrc/gYYX c=1 sm=1 tr=0 ts=6a906820 cx=c_pps
 a=z9lCQkyTxNhZyzAvolXo/A==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=VE4QQHX-7aIn0oL__EwA:9 a=QEXdDO2ut3YA:10
 a=EyFUmsFV_t8cxB2kMr4A:22
X-Proofpoint-ORIG-GUID: Q3A4nnDcWM2fCzGP8G89GFavJfl_WrKJ
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI3MDE0MCBTYWx0ZWRfX1DqJlCf1lllK
 0NGoH2rj3qfXofxHtimI4WL/LTAiyXF9DaMFPA2kfutq9xfox4xfGuZ///ZxLeaQRMwpt5Hyxxy
 tBekizvgQZbq1T+zlx4hg5oRxkqaGcM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-27_07,2026-08-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 spamscore=0 priorityscore=1501 adultscore=0
 impostorscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608270140

Document the RPMh clock controller compatible for the Qualcomm Kuno SoC.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml b/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
index 2b446aca5207..9d521ac9c33f 100644
--- a/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
@@ -22,6 +22,7 @@ properties:
           - qcom,glymur-rpmh-clk
           - qcom,hawi-rpmh-clk
           - qcom,kaanapali-rpmh-clk
+          - qcom,kuno-rpmh-clk
           - qcom,milos-rpmh-clk
           - qcom,nord-rpmh-clk
           - qcom,qcs615-rpmh-clk

-- 
2.43.0

