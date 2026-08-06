Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B93CE231832
	for <devicetree@vger.kernel.org>; Thu,  6 Aug 2026 07:02:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785999780; cv=none; b=TLeqoN2h/dRie1vBb9Wuv7kSd6TVVy04ynsfa8EqoZUPbM2Po4dRMcR9SzyXN38KD3lhtFrq1FCEwJca7r9ovEKdITqCGfSVtE36jU3utcnSUfiMIz7Tc2ZdL9u4y+xt+hvZZMogPkWwIAI3Zv7RwYm1jmePccT6CheiSWHWnRU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785999780; c=relaxed/simple;
	bh=Kyuc5bVBIK6jpa+JRhS5R+xtAmDE2ipSapb7f+2c6L8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NyZzphqQ9ElqCj2vXx7d+6BDI4DqcdfGvj+ThlHbeVZ1xUgzZhzMpJa4xlC0lJd0FEum8kqSDXz5GBwG7Mz444PnoDIApn0hGCpNl2fHNoDmk6/yj2+YGsj2Xb0Ckhhr2jxRYTca+XscyMqKLWgyhe00PLWOIIJzlFVoJKDkgZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JB+fCSZP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IagvEJGX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JB+fCSZP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IagvEJGX"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6763wXB4775152
	for <devicetree@vger.kernel.org>; Thu, 6 Aug 2026 07:02:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=/kj9lcijXf8
	Z+ottqNdn7HYRtfi3O85gd2KLAnTf+mU=; b=JB+fCSZPAspK2yCWrasDaOYBsZo
	bRQvGIlJCtf8RIk4HvWvWG4HZ4zEeknyS8Z4J3yt+ktKUEbAw8WebnERHJzdUktG
	9PS6YCv48QmV5LoLw05elTUvyLBB+EHH2KB+GVZ2KDqlalp4+izw3HygYrxSDF68
	mYuD0USDYlmzm/MnpKjGkrG/dFAI0aiY+4ILhekJ4PANpIe86Uh6YBu7CHlTSq/i
	jXNNYDLaJXFnGYbZVpvsShAceJrfH29Bx0ZeoW5FFkzA0pPv9Z3w7aX/ahYHWuF+
	9emvt0PsKZJnTeLpxvkKpAGNT2o+1oKlSFY7Zr+BQZUVNBC+s5rmsAKw0gw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fvju8gnrr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 06 Aug 2026 07:02:57 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51bec738909so17264261cf.1
        for <devicetree@vger.kernel.org>; Thu, 06 Aug 2026 00:02:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785999777; x=1786604577; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/kj9lcijXf8Z+ottqNdn7HYRtfi3O85gd2KLAnTf+mU=;
        b=IagvEJGX7D5b+8/JpRwq+3UN0svUK6r6ltA+n2fRSEuqEcfu6RtaR2qHMXt8aH9d4o
         s0wJ4llTn/8ZlVIX/3xyAJQR+voo8RnibhRvaJPWWVzLslR4klOKf1L7w8ruBsFKNAlH
         dh54AJV9JJPn9OG01M42WIeg21unoLOwu4HFof6FNmvg8flIm3UEcEnrh3ejvCoPzctK
         Ts2lVaaLdKHruAsHbNGUyd8KfzJ6g0k/SwMqoYxPY+oOzaOfS4ronMpM9uQUC80eafuS
         GoFuOnknJNcFJ/CG9390Vt47LSeuU82TxqytnvLveLok7DOjDzLOHJ/Durg23TCH5KUb
         xhKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785999777; x=1786604577;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/kj9lcijXf8Z+ottqNdn7HYRtfi3O85gd2KLAnTf+mU=;
        b=ELUgWoTt+M2meVYNAdcNl460w9I7cssX1XleiQh9WBhz/5xrsB60Z35+wNdav9RNB/
         1LCAwDrxvZW92HEo1uhjlgEci/qJSAit3BqXDgYSd2z1umW9hKt0jSAWQJkjDxtXqDcL
         aGA2NqR0XSYk3eOvzfp7MvwH+Bx0jxjposcwM7xmP5P76MVsvVamcBDO+DTSuPlkoG+e
         f85Zk4WTUJaRZ+Hn36YndwXO4DIgXRbkjNKYgvNZvftw6QtGWpu4T5qKdw9edKisa28M
         Hg8Z4dJJnIVdJMWOL4AVZ6Pmc6XH8+z7txPvFthsgA1zJ2HdgTFEwDQ/vG6NPnV0nSik
         0L/A==
X-Forwarded-Encrypted: i=1; AHgh+RoQdIn7CF8zJFSHssFyZkPpOpvH8MLwxuPj1sntYufvVQ2B/ejL2BM2jvAT3zf35xb3ZZv8Z0Bbem3w@vger.kernel.org
X-Gm-Message-State: AOJu0YwHVEWMQsZiHVmlEMTkkVXtv34jK8bMnLsqyXwz2T27i21M1IUU
	Z/Kgcx0m0W6YT2J7F5L1T9sgZf8ScNgqd2FyvNneX010DRJn08LBpEeMI2Hk+4g4S/fSv7+S0Pt
	kates/6pb/BGc4cn/jaTn7ig3Yd26KlnDHWBsh16labhH2rOv6TI0Eck2JGmch0Uy
X-Gm-Gg: AR+sD13j8qY6sjr9ikraI7s4zbjFo9zHgqDTXe3kgh+G7sMQmIdQkSiP/0pqYxoLThF
	19lRFZGrlKbVg3oDtME9mCydQOXEU5eIduQIbUtvCtjY/QGdfwhTg2jMNdaXbIIx5O1oib0PFo2
	ttR6lpLRuheY77rkVvrm4TsrcPCe6LnR7LzH/j6EySUuunq5lMebpnhp0lsx/RKG4TuqKw+vBE7
	Wol5sG9mVGeaGVpcM3GDz3pHTDVYRV/qiyLlVq6KsR7sG6TEEvQqNJCtHy9jon91SbzBAzKFcjD
	TX+/AXpHeadjCIkP0tkvMg/coSTJThkUO0wsLB+xrl9G9IKlaUVucxjuW0OfuwRw6OsIv8Cod16
	Hgo+xvgLeCbmvK0kn
X-Received: by 2002:ac8:7f85:0:b0:51c:1967:5091 with SMTP id d75a77b69052e-52ce6200bcbmr128643481cf.41.1785999777026;
        Thu, 06 Aug 2026 00:02:57 -0700 (PDT)
X-Received: by 2002:ac8:7f85:0:b0:51c:1967:5091 with SMTP id d75a77b69052e-52ce6200bcbmr128642931cf.41.1785999776650;
        Thu, 06 Aug 2026 00:02:56 -0700 (PDT)
Received: from quoll ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49954246f9dsm45206285e9.15.2026.08.06.00.02.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 00:02:54 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Nishanth Menon <nm@ti.com>, Santosh Shilimkar <ssantosh@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v3 2/2] ARM: dts: ti: keystone: Correct white-space style
Date: Thu,  6 Aug 2026 09:02:47 +0200
Message-ID: <20260806070245.40219-4-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260806070245.40219-3-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260806070245.40219-3-krzysztof.kozlowski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1537; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=Kyuc5bVBIK6jpa+JRhS5R+xtAmDE2ipSapb7f+2c6L8=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqdDGWG3cuc0UxeXvBgKTmcgWGi2wiJBIXX/IQQ
 AU563GukXaJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCanQxlgAKCRDBN2bmhouD
 1wsbD/9AMTpPt4D5MoFMm/AhstEWEAcSwiDtIhSmaTWWw/1F9oZFnfoXepyfrlRWdgilyhgQoMI
 iSjWKeAxYqXV5w28DiAo/AWfkxozT01AU18tC+XbFU4B2tgVG7uozoUywghllJkMEHByYi8noiC
 HAIJ/0Hd34ClrJC3NIBltczD5yNIhteYPVNsMyOCpI22NUsIqn8GtGKs0SUjpY+SXzyYQaX80c0
 oq4R8At77GJPddmih5Ofbxm2+0Cyl5arrcIgVjycb/t2/xy5nKSM8VXxF3vt7g/h/8ZHXJ5uDgS
 LY5+lfoTtTlVWhyOn4cLe6v03/Wsl9g1PEZ/mq4mmfU3z3hpflVbteni9dE09E+X4rIOpMCTXo2
 cibj8Ct1CvnvcRlECUwbreqTiVojy13HLXpAAmZ79r243ry3HaMJTTp/HUeZPlI0qhwxnQJCJeL
 J0bmwvMYKctN7/Il0CJRFLlRT/+3+JwJDAUIq9e+qFrYkKBmChKtr3XSspVGD1oPixNXDCsiLQz
 YG6EyA59KgYCeu57vcuADDYvuAkFCdG+jw2Th1z65Mk5vFYSHYW9uJW/3zxYDMgBpa2ZX/+/C1J
 hxm6+dDhtstsEQfm4DGj+WSwVj3h+Pu3cymeU0D0mv9D9KHDlyYcGv5Cg2rsX2E6zK7pQsA200a zbfiHZTCYs7SyPw==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: IGORfTxYaoWBnwD1iw2vDBl6B-qIniu7
X-Proofpoint-ORIG-GUID: IGORfTxYaoWBnwD1iw2vDBl6B-qIniu7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA2MDA1MiBTYWx0ZWRfXw3dLcdK4bh+D
 nD6PbNLB+wqflAr8zM67i8RtmgyzqsALGGTlZKvrz8L1rXwHNDuP6w56uVncLWNwcqs9zKsVeMo
 xD3kaJclr6aC+Vo8SwIEND5kEfbAoe4nPSgaTbG+FRtjyId8R+tOlGJGS1VqsdBxjpKTG4lRgDt
 HsgLgl3l1nzp0CQHFdDKT8WZcO/HhY1xOaSSYEZfjqLmyYB4bDSCNtSso45NsMcOcDzO7JdeWSd
 6og6ghlkWaR0L8mJucMaM+eqJgE1ThgjgwtOEDsmTU7yxbQY8smhqZHosah/Pigw01EFLZm85UQ
 vejU2vd2nETLszbAXVCeLJIz/Fi2gECCe5KsHxCrIAvIzljlUpigGWYJnQRZ3o1uYavL2DVJdsj
 Z9pJatquAgAMl7rsc8fQGc3nqr/KPzpdVR2lBBT8Gc5GL49ULm/JNduscCX2TDRYCFi7MTlIIud
 qRryetwwsOtrcIr673g==
X-Authority-Analysis: v=2.4 cv=K5cS2SWI c=1 sm=1 tr=0 ts=6a7431a1 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=YeREbuiUy5DaHqWHangA:9 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA2MDA1MiBTYWx0ZWRfXxGj1jtF5H+yG
 AaGfYcArkCUce4QAdjah7qXkqtEWyWYOkcMIB4iIlza6JymHa9qHMGFmoEjMUnuetzP/mfpAlfo
 b8Zre5F90OsZrxaeNrTTZ86RspAQliM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-05_06,2026-08-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 bulkscore=0 priorityscore=1501 spamscore=0
 clxscore=1015 phishscore=0 lowpriorityscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608060052

Correct a few white-space issues, like double space after ':' character,
which will be flagged by dt-check-style ("redundant-whitespace"
warning).  No functional changes.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

Changes in v3:
1. Split keystone to separate commit
---
 arch/arm/boot/dts/ti/keystone/keystone-k2l.dtsi | 2 +-
 arch/arm/boot/dts/ti/keystone/keystone.dtsi     | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/ti/keystone/keystone-k2l.dtsi b/arch/arm/boot/dts/ti/keystone/keystone-k2l.dtsi
index 330b437b667f..d91a23bbf6bf 100644
--- a/arch/arm/boot/dts/ti/keystone/keystone-k2l.dtsi
+++ b/arch/arm/boot/dts/ti/keystone/keystone-k2l.dtsi
@@ -51,7 +51,7 @@ uart2: serial@2348400 {
 			interrupts = <GIC_SPI 432 IRQ_TYPE_EDGE_RISING>;
 		};
 
-		uart3:	serial@2348800 {
+		uart3: serial@2348800 {
 			compatible = "ti,da830-uart", "ns16550a";
 			current-speed = <115200>;
 			reg-shift = <2>;
diff --git a/arch/arm/boot/dts/ti/keystone/keystone.dtsi b/arch/arm/boot/dts/ti/keystone/keystone.dtsi
index ff16428860a9..cff549c447ce 100644
--- a/arch/arm/boot/dts/ti/keystone/keystone.dtsi
+++ b/arch/arm/boot/dts/ti/keystone/keystone.dtsi
@@ -123,7 +123,7 @@ uart0: serial@2530c00 {
 			interrupts = <GIC_SPI 277 IRQ_TYPE_EDGE_RISING>;
 		};
 
-		uart1:	serial@2531000 {
+		uart1: serial@2531000 {
 			compatible = "ti,da830-uart", "ns16550a";
 			current-speed = <115200>;
 			reg-shift = <2>;
-- 
2.53.0

