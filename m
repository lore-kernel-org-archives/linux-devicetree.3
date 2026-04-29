Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D855331A77
	for <devicetree@vger.kernel.org>; Wed, 29 Apr 2026 16:56:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777481800; cv=none; b=iy+p2KbPMkWJWkUE195f/mInuCUvXYKGaWsyZlUt4xHwBpicEXI6Ffxm7yXf8iypA1fVkycV9Vz+E0WDMsis5nAB6x55ykfQzvyH1D+4o7bBtJvOJrzg6rRTRnbYec5Zz2qNZ/Gm+CviKBnXn9odOwva9a5+wDYtlXDb3lmkNCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777481800; c=relaxed/simple;
	bh=1pwrD1mtxWjKZKg0d0n8zASSKOrTCp+wMf36OUBdg+U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TG2Gl3Bl7qy4YaK3HlHvhG/w0AZazx1avhzW8LNNCxMp3+TKtV5WuzMHSM+oWus2ZsH3RGwaoGqBM+GruXE+1QaM5G7INe534SI+3JhvR9wiBbjBIMwL27x+UplInmse0MO1OjjlcKjCS+Tgk5A5L8P7HDl3sWCxUzIILKdUsCI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IejM5o8z; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CNkGyKL2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IejM5o8z";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CNkGyKL2"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63TCecW9317261
	for <devicetree@vger.kernel.org>; Wed, 29 Apr 2026 16:56:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=+xyMYLqbuW1+V6VyGV6t0mUvdAy9lEshz/x
	aX0ggCfw=; b=IejM5o8zBBm+Up8vtXQmIkQ/Z7SwiAjXxqwtn8i00yQIxtFGLjt
	qauGSqoS11guqV38wAPxQB7QtgnZxMURgagKykdVPqEo4rRu58iYBOQRbVey/oGG
	in5DBt8J/ikD20UsMg1nkYKhhJnLoHvqhTP2XcIXtKZag1atVAcS9BjXMj1cj1dz
	iSKM45CzaP4aeP/2P21NlZDZU3gNxQgudFAskEpJI8784OwhL9sHwBxre2JqT5Ka
	O0pXfNiYLx9O/LV0jMnWSWVOB066kgNFXThWotn2282k3r1YqzLaYZ50KVcSmvh6
	mrTeHNo1Swmrskl3/ottml/rye1OFYbNnBA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4duj6t91ad-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 29 Apr 2026 16:56:38 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50da31af14cso334943701cf.1
        for <devicetree@vger.kernel.org>; Wed, 29 Apr 2026 09:56:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777481797; x=1778086597; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+xyMYLqbuW1+V6VyGV6t0mUvdAy9lEshz/xaX0ggCfw=;
        b=CNkGyKL26Xe7gGUDOV7X4593dE34NuAGFgsV/cguB9N/z3142z3qZpQd99SBvW5Xyi
         UH/cC8e9rusK2+zZQCxr9ROaEMmnJKKHKnkvWdPKDqV0l6WrGXZCey2OcAR2gn18A1g7
         BZMtQiavT7U3rTd8KIvp28NIviJ0+ed9hmL9DzArE0DC+a51YbfMruAVHiWECEERdTa7
         dkJzj/t8WrW4NN1xTxuyt26tY7nf5jvkGA5qhqLEomQA4Ia+YqBkFlpdVa5N6UfuzhU/
         VnIW/BXyjPQaFfSvpv0FJTJbyUZUCIYEx8FC6IMYA/aS4qOMEPFE6H35msOdHLSF3iqh
         RVHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777481797; x=1778086597;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+xyMYLqbuW1+V6VyGV6t0mUvdAy9lEshz/xaX0ggCfw=;
        b=TK8FsVyEoToqPr0FFhM7kPw7w9tcwBhvbQ7a6dxlCnt7ldYdvMvcFaPOTmDLKpn4oV
         PgxMS10q4R/Ak03oTHA0mmQkdAezlZs9ZUQxbt6NeIS5G2F5ZnblgWMkvIkEN7DvVeO1
         ndpddS6AUXFsNV+VrjHvQCvNhrw07shwl2ny9Rdf8hGbUwzx0tL8TmYox8F71Wc5ccB2
         J8DDi1HM1B+QK4eyH1jnKYXrBJaBEvyIm55mEbdlpfSBblA5m5ROnvA6/MlA2aqAtE/Q
         f4DMR3zCJWe69Bq/Yi2fWHdxdcxADODRsabYI+C666yFi59IW0H6U9+SGYHrs3rDWPL5
         uqKQ==
X-Forwarded-Encrypted: i=1; AFNElJ+XHBSG6yhR+BdMry0E9UaJGOkxRHzo774wnKw9qVyzxTZl5NzNLUxrIT8qLFQtfi443INtPAZUrIL3@vger.kernel.org
X-Gm-Message-State: AOJu0YwNDdtKXEuiXJ0YAKsCAvtLJ7LN5KyrL6zDRFKBWyFkgjEskGkM
	OOOXM1QjXGad2RndLBT5/oOEfgWLUDlUE+A6uPakaUEl6evlgwkQDdqGFsESFZYAeXifpAb5dRx
	OMGH1EGJAkklPYFrPs0DZO3t3W4cWEv9Fz8TOqMeFH4cEc6qO87RZtjkx01o/PHMr
X-Gm-Gg: AeBDiesyxHus7iQSCOgA4X/ZaITTURmvq5C7v4+QWEU5VVhpoz3yBT+YD0tYbRtDCdY
	6sTL1Dz9qD7c3Sz3V30dou+4X++6UubrFa9cMHRm5ET2YQYxGWNyzSZOZOKzWk4+qrmIUEraqSV
	c0MDVlfDgmwgU+BgXUKeHmckEOa8iV+GuNLyHtYLiyUsHydkHW/lUGSg00s0NBcwNUxbIInOq+u
	qX0yziPLO4i5+gmR0B97X+gvFSUmDlyiFRgwER8Bh39ISpfPVOV+JdpDZiOt45bxPKEL0oiCzFR
	nOk0imFyA7mEaNCWUd9bRwqeA6+v8bmSVy8KS3UkAf/o9JQBFfqHzPzooa70mnT6/ARPP7ZplGt
	Xc5hSUHRNHnsMBDgR9vYuf5CpeXyNkxIntvRLoh/NphDO3UI=
X-Received: by 2002:ac8:5e10:0:b0:509:f36:496d with SMTP id d75a77b69052e-51018a356a1mr70618681cf.33.1777481797460;
        Wed, 29 Apr 2026 09:56:37 -0700 (PDT)
X-Received: by 2002:ac8:5e10:0:b0:509:f36:496d with SMTP id d75a77b69052e-51018a356a1mr70618311cf.33.1777481796940;
        Wed, 29 Apr 2026 09:56:36 -0700 (PDT)
Received: from quoll ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a7b901a15sm52244375e9.1.2026.04.29.09.56.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 09:56:36 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Thierry Reding <thierry.reding@kernel.org>,
        Jonathan Hunter <jonathanh@nvidia.com>, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v2 1/3] arm64: tegra: Correct Tegra194 p2972 interrupt flags
Date: Wed, 29 Apr 2026 18:56:27 +0200
Message-ID: <20260429165626.243471-4-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1395; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=1pwrD1mtxWjKZKg0d0n8zASSKOrTCp+wMf36OUBdg+U=;
 b=kA0DAAoBwTdm5oaLg9cByyZiAGnyODrI92+1lI6GkuE4jYHhymBTmzlNYxl65uY/UH3RVXXTF
 4kCMwQAAQoAHRYhBN3SYig9ERsjO264qME3ZuaGi4PXBQJp8jg6AAoJEME3ZuaGi4PXTokP/2zc
 0OQsVpyRv7EUr4Wnni/SP/kVSWxHZsxnyCYMe61Q02aHUpRTgf6hKXjHztcwvVp+PsPdJ0iLbCq
 fDOVTty1rCoNseZxR/4jChUu2/74JjeRFP4Q/tIYly3eCycIbtleywaPD/e8stGUGoygCdT4ALd
 J4dWx3PhLLRLUUKIKG62UFQN8JetT6+3w1N27HgX14Y1kxmGOglDPH2AGvbxqyFFydu5oy5oMlg
 KLsEGzb5HwoqyA0f7VadWFLbqzhwNna0ytWhke7XaFRBTAzSPMJT1nNFpL0RxhRXtyfAm9FpY2c
 lGCS2T8y1PCI6lEruxgp1fWmJrIrTAJoFSzfxDinKO/N/bw7imsBuyzjoJUp/jfXHmipn15K06Q
 THWO7j5PQa93OKODov19g5386RqvTTT96J7OvyrQl1SiPWozcZB4P1jlIwiwZIMXvDpTpbJwi6V
 1Pc7eHEvIFE8YxW1iGr5lifOAMmE9dY03fg92uX6tsOCAyO6tDO4IKnwEqCvMjDr3okgBapE7n4
 L1IUREkWQXO3W+2jTweJbFXtSGQ4Zad2zS+glXfFK6kSnbqVRQrDYfH5Clq9vz5XqYH69uHsKB0
 YBniDoBPnoTfQdNZUb8Yl0fBtnw8d6k/x4frbFfcT17pMcOyPx10Kwk6QSd1jtR5lr5kpH1koU/ MXzsg
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: lMt7_0K0QvWrCc9mjX5k0ZW6EXfc8YV8
X-Authority-Analysis: v=2.4 cv=KcHidwYD c=1 sm=1 tr=0 ts=69f23846 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=0oGBXvcucFHjQTZxw3UA:9 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: lMt7_0K0QvWrCc9mjX5k0ZW6EXfc8YV8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI5MDE3MSBTYWx0ZWRfX+ZkCgc7wN/14
 tDtwF5twA8opssKXfWgwxbIjWCNi+sf6HIGp1Ldzyx4z9vgDxS/sFHZ9f8kkDKf+lLYhHwzIhxT
 2MKFFUYX3yvg3tp/vs5pYurN1GC9iWROb9sUXh/JyGl0Qswj7FqOmQuzUKaYV9PrbqxIqgSaTU9
 3LKiIJkQkHw6mU30UoO39QPmMtE7sNiAmTizOwqkPcnGDQ89rv/e3zW2Y79K6VUsSEBj3Uaz0Ad
 v+nbynt8Ihuw9RtkDVvfOKcwCvM37ELFFQpahfcJZcq8zasoUXtOxl2f+EhJuyK9x4b8WxP1x+g
 c6d6nk19DrxmuN2pxkc6E96QEFBhrV2gHypKW++NEw3HvMAOpPyfgeGxpr0zeghxDjf+UjTZIcP
 E+I6Puh8xYDWa4PMQH/x+IgaaohwHoMCPq8/IPwn5yR2W1DxCi/0CKSewOl0mtYTRkcdNYUStMJ
 Pl0iqb7X8WOCInBs3JA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-29_01,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 phishscore=0 bulkscore=0 suspectscore=0
 malwarescore=0 lowpriorityscore=0 clxscore=1015 adultscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604290171

GPIO_ACTIVE_x flags are not correct in the context of interrupt flags.
These are simple defines so they could be used in DTS but they will not
have the same meaning:
1. GPIO_ACTIVE_HIGH = 0 => IRQ_TYPE_NONE
2. GPIO_ACTIVE_LOW  = 1 => IRQ_TYPE_EDGE_RISING

Realtek RT5658 codec driver requests interrupt on both edges, so correct
the interrupt flags, assuming the author of the code wanted the similar
logical behavior behind the name "ACTIVE_xxx", this is:

  ACTIVE_HIGH  => IRQ_TYPE_EDGE_RISING

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

Changes in v2:
1. None
---
 arch/arm64/boot/dts/nvidia/tegra194-p2972-0000.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/nvidia/tegra194-p2972-0000.dts b/arch/arm64/boot/dts/nvidia/tegra194-p2972-0000.dts
index ea6f397a2792..5462200f1176 100644
--- a/arch/arm64/boot/dts/nvidia/tegra194-p2972-0000.dts
+++ b/arch/arm64/boot/dts/nvidia/tegra194-p2972-0000.dts
@@ -2170,7 +2170,7 @@ rt5658: audio-codec@1a {
 				compatible = "realtek,rt5658";
 				reg = <0x1a>;
 				interrupt-parent = <&gpio>;
-				interrupts = <TEGRA194_MAIN_GPIO(S, 5) GPIO_ACTIVE_HIGH>;
+				interrupts = <TEGRA194_MAIN_GPIO(S, 5) IRQ_TYPE_EDGE_RISING>;
 				clocks = <&bpmp TEGRA194_CLK_AUD_MCLK>;
 				clock-names = "mclk";
 				realtek,jd-src = <2>;
-- 
2.51.0

