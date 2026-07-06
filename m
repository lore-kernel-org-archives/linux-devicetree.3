Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07B403AEF4B
	for <devicetree@vger.kernel.org>; Mon,  6 Jul 2026 10:19:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783333153; cv=none; b=SOvsIB1pW7vHPXZStthzhzOOJXk+LgOfOBW2r4Kr+z4arae3RwWsE1B/Bes96ef8kjFLdC06FHsOFzy7/FQz5yOMIA3OQK+bUHdKQQCFALMU0R5+7BcJ62kaJujc0zibG9EaHzyEr4xTE2Ua+pLcbEXOQPuI+YJeyPsPXU/xj28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783333153; c=relaxed/simple;
	bh=WwRVC0oPS1PRdnnUiiR/+KmfMwCzKdfktBxDYpwwZ98=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hz3Zh+i4I/cGtwwumkGeYyhODEFZIDPOLEinVh+l00yzL91ecKLiWTn1Q48m014GXNqSg6C0Akl4HuTE90vGZZhFEgtH5LzaXMoQpNqdJIYPqMh36N6YFfSvILhqEqlOiSkdCSCGJQe1W8/BOdn8n7SUMban90Vp7UwgrW36GD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iOUwL9dy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Mi5MCure; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iOUwL9dy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Mi5MCure"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66693tSE4172351
	for <devicetree@vger.kernel.org>; Mon, 6 Jul 2026 10:19:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=H7tRVQ6U4JB
	i6TMIM0U9LRmhFwSAavP1fZJV4lX06Zc=; b=iOUwL9dyhYhLrn3fMSaXUxxJmIz
	wE/SCo7oyOTiV5hdNVBbAF22kVODnPcQ59b9k44//hwzsRwdp+8c//ZjpreMSH0n
	sQ9U/PpBSIrGnjkmbcI3BmYDmAOUMdQMydHvcCwInHE3IZaT16L7bssmZtltESzJ
	yr02W+rxGqYUYlH2LTCWm6sEZmUgLPHU9l0Zt5XTI7S0JQ+cmRsdmRPkYjfSnkI4
	c2dKxqzo2UU0ciqdH6KpeZ8zVQwGQoKZv8VCE33OCvGr2ep4SHPA9tjuWpVfwNfq
	JP4kQ4InLl6moTOB9JpFq05Ln0Yd9tCAtR6D9N2IyJ2TKOzctlnLERTy6kw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f88t88f8c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 10:19:11 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92e56b2b350so587183385a.3
        for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 03:19:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783333150; x=1783937950; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H7tRVQ6U4JBi6TMIM0U9LRmhFwSAavP1fZJV4lX06Zc=;
        b=Mi5MCure8wS8va+n+bZX8fLbbc4DWTWCI8YQUXFAZia/3Jpk8F0cqP1PoQ1PP6MTKg
         JmjeOkkv1cSf0a1FABTLsNDW4UBp7vMtmVH82yBcrMKbs0nY899HAPF7ArWN+ccthel9
         PMCAxKsb633UHqVdX3dNqgrPa6xZrTPXzIEptuD1wyoYZKjQ9Xl+qy6cLVA3cWsLJnoz
         8S64NB+UI/KqunpOHPmdtg1IOm7+Y0P61EIjIT0hvAB/XkSFTIsu24c9GfyWeGBAbF/r
         NtdgsecVDw84M362Pfu9O8Vu6qa/mV60q0WDeYeEWJne5zGD1I3/Lq3iXEYGp/GW15z7
         E2sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783333150; x=1783937950;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=H7tRVQ6U4JBi6TMIM0U9LRmhFwSAavP1fZJV4lX06Zc=;
        b=VX4hcMVFIZlRecCykM6/d/KmzCGqVP5H6y263tChaIy4gi2Qo550IgY196wKQ3hw8c
         6fiOXgi2r012B0z3/BoyHXsk7yC9X++bHSgiFu/NLkm4A4jlOAOkMQwiouWxchVy0B0w
         hq8e1ZdeRoIDxs8kJkr9zFL/BopJ0poV5/EEMIxhyfgLXnnbWhmZ1lfBmfR36ynro5Dd
         QCWbL/uF7BLzgh0YA9WLQq/KSSHS2UOzrvIsvzqP+Vrt9/ZAGmfbzOfNjFHFL4TAXJNY
         G16pWNPwy265aT+ouRfcunboUyda1shlFwE7Ep50F6Gn5OvpsC/rCLIXO9Dg6J7P4df4
         p4dw==
X-Forwarded-Encrypted: i=1; AHgh+RoDf13cd5SeFQv0hRt3j7YOhn2JFEDqBMWyNwuzIoL5W5ZtfxqmbkOwBzc5CGg5IGAx6yWJULzOhg7L@vger.kernel.org
X-Gm-Message-State: AOJu0Yz91lc5Is8TtNZSSUza5JYYDr/Z+NQpDylgXwGwkUcndzxrr7aL
	vwxyL5R3Horm2oebCG7HTiWyf0jfmP1o9xdc3uaCz5EfoiTQX+5MVeBeeGGUX6W3tksmNnJYqQk
	nAmxb2F9ftVmQMW4PG/yidnw6MZJe6bubCeR5ynUd/WU9qH728P38r9zZIOoN1BBs
X-Gm-Gg: AfdE7cml+LpTfvl4twVjgNPly6RvNp85nqgmQDTE2jzy+f2FThXK28PtX760LmuWSS3
	ruG0itnH3FLSyvhHK4o25rNLi08UlHoTz5kWVVfszVNemu1eLOlmn2FpYlKWYfdsRk5PYI/HTYb
	uIqfXwaO7Wwf6vCejEKv8fayiMXyUpOh8GHqJVUcV0zM5v27axaK/KXzUMVhRBZxF9SDpoMeI7z
	FfRhBngkF1AH/aqqm6YmRSC+WjEyK2etleIw3o35MRihu2wHfEhR4Lc/tvGIAg6Cznb+y8Vev+e
	Df//v9m99Eds7mgt4/RikXga7P9Xe5ee4VndGxs3Esdm7smeKebYKa53FtuQktDejqMdza7GM/n
	oCUapzSvIzeGKQMm/gtzDnZsdIS0=
X-Received: by 2002:a05:620a:470f:b0:92e:5d19:bf84 with SMTP id af79cd13be357-92e9a4cb125mr1231705385a.69.1783333150430;
        Mon, 06 Jul 2026 03:19:10 -0700 (PDT)
X-Received: by 2002:a05:620a:470f:b0:92e:5d19:bf84 with SMTP id af79cd13be357-92e9a4cb125mr1231701485a.69.1783333149893;
        Mon, 06 Jul 2026 03:19:09 -0700 (PDT)
Received: from quoll ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47ad69519c2sm24506340f8f.37.2026.07.06.03.19.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 03:19:09 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Andrew Lunn <andrew@lunn.ch>,
        Gregory Clement <gregory.clement@bootlin.com>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 3/3] ARM: dts: marvell: orion5x: Correct indentation
Date: Mon,  6 Jul 2026 12:19:02 +0200
Message-ID: <20260706101859.341467-6-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260706101859.341467-4-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260706101859.341467-4-krzysztof.kozlowski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1519; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=WwRVC0oPS1PRdnnUiiR/+KmfMwCzKdfktBxDYpwwZ98=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqS4EVEko+YabAY8cF5x1SHykX45oWZnWLZieeL
 Tu6BxyJ18WJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCakuBFQAKCRDBN2bmhouD
 1/t1D/wJ/mqVmArwtHr3ontZz2iv0oCxGYvz4vi+PG2sQBZXLecn3Emy+upKnGfqtqKQC0jDCpo
 0PD4/jMmqbJB3bU10qFGZHjzJ3LjRlWsSxqJlf4eHKdwEOzAp3gnNPNEUgYNYNAuKeouweJ75vv
 Rut2bPAT7OTuvr8NhL90ZClHSPwXo/EQvW4X2R6I7FD7g2o8sQaTrL7AQyv7c0OwhMToEjj80r5
 UFIhiopyZ3rClrAXiPf0QPzZvMWWjoF8ijtqv9PWXRajnsThhs7G2QIAFuLx2MxdL52ufGpcXAU
 +6XeBPh7TanxNCdGOZc+adimxLrQGWh99LGpza60uwIoOx+kYWa9AnFUmt6gSYZCqxfpXiB0wgA
 /bYxVgMiwrU0gs9Bjrr62JP9OlOs2ZnYAv2gTjwZT7HihxcDvCDe6ku5/ShxrOYovb9S+2C86fN
 eheWuqWcMDKqufe/xtpP17XNUKYEzudHOnAYYOcqZY9/IYTUHZAJBhJw3hyV0AxD893OAnIgHSY
 5V2dU8eBZVnlcvOVowBkUSCbJkmx2czdMvEeMkk+rU7RRNq7IeTO+Szxdm7UsiEN2QtF1cGGP5a
 pB2CmqIHhmjc6fLbAigxDaMGzpP2n5tne8dNMVjoTjLDHKL/08YVL6WaL7omfCaFsQNcHZLoi2U N23OVBZTd2+K8IA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDEwNCBTYWx0ZWRfX6rWZVpzik37H
 uDw8ckkVTmm6q+T2qWXzjxicPaqIvHI+XF0jr+DspiVRh2+Bdtv60QtONZbbIdejQTbu66YHDJ6
 7P120UztXtqCRBQZbC3dOUIbldOXHe0=
X-Proofpoint-GUID: 8Vk7BQd4s_vLJ4I8PPWE40lRlJtktoeA
X-Authority-Analysis: v=2.4 cv=C6zZDwP+ c=1 sm=1 tr=0 ts=6a4b811f cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=52rqv5wQVAuTtBApVRAA:9 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: 8Vk7BQd4s_vLJ4I8PPWE40lRlJtktoeA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDEwNCBTYWx0ZWRfX8BOeGympzUi8
 izPpcVQcPHKgH62PyV+PbknboSLiV/NpWnbXRHuvqzVlnJTbjMToNqNBD3gdjZ8EYzjgdmEqW7H
 TXoS+8CbVyv1ghYU4KPrQF1gEIrGeEI5qaEQjIYD81Txfwm2zl9wqxqPASlBr9xfrgftRgDW4RG
 Lm5rWn12lOLhPsDzNq7X/SIJwN6rFVzl1TARClf/K9xrMaeYMg8qRyIZdkyzK6FgvZM0EBMUiQR
 1ZjFfKNlNxBjok83tvOV9ofu+QXUkK14VBO5A/R9gCGf6K4EKjOvFR+h5TwhOzKIPlfMWQOobIr
 g1NM4Ri4bE1f8ZRDxCT44LYUh6DKn9zvtNjPrWprTdvEXodoyjBcUTY1wnZOJuEjxs5hDwEejAn
 WZbIxZv6lhQ2n4pOxkUvdssi5JGJ70A8mJ4bjCchXiWcX76Tw2W6+evdkMFjoaRnW5Owi4R6dr1
 PgVeVOBhT/bAdC/mihw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-06_01,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 clxscore=1015 spamscore=0 adultscore=0
 bulkscore=0 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607060104

Correct spaces or mix of tabs+spaces into proper tab-indented lines.
No functional impact (same DTB).

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

Ongoing bigger work for all bindings and DTS with built-in checker (dt-check-style).
---
 arch/arm/boot/dts/marvell/orion5x-lacie-d2-network.dts        | 2 +-
 arch/arm/boot/dts/marvell/orion5x-maxtor-shared-storage-2.dts | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/marvell/orion5x-lacie-d2-network.dts b/arch/arm/boot/dts/marvell/orion5x-lacie-d2-network.dts
index 12a4aac2633e..9757c3b57de6 100644
--- a/arch/arm/boot/dts/marvell/orion5x-lacie-d2-network.dts
+++ b/arch/arm/boot/dts/marvell/orion5x-lacie-d2-network.dts
@@ -109,7 +109,7 @@ flash@0 {
 		compatible = "cfi-flash";
 		reg = <0 0x80000>;
 		bank-width = <1>;
-                #address-cells = <1>;
+		#address-cells = <1>;
 		#size-cells = <1>;
 
 		partition@0 {
diff --git a/arch/arm/boot/dts/marvell/orion5x-maxtor-shared-storage-2.dts b/arch/arm/boot/dts/marvell/orion5x-maxtor-shared-storage-2.dts
index cb1bd24b7ae3..b2b3309ed1df 100644
--- a/arch/arm/boot/dts/marvell/orion5x-maxtor-shared-storage-2.dts
+++ b/arch/arm/boot/dts/marvell/orion5x-maxtor-shared-storage-2.dts
@@ -69,7 +69,7 @@ flash@0 {
 		compatible = "cfi-flash";
 		reg = <0 0x40000>;
 		bank-width = <1>;
-                #address-cells = <1>;
+		#address-cells = <1>;
 		#size-cells = <1>;
 	};
 };
-- 
2.53.0

