Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DB3442464E
	for <devicetree@vger.kernel.org>; Mon,  6 Jul 2026 18:03:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783361035; cv=none; b=tt3drH4G0/PiJbc5zXaOl2t+CK+wdmOwZLpsqsGANc4tWejCGrL6L7JkqlHcYpA/RdWkSfBHlQMxdgkYPVEnKHL0Ogm+l3pZ95Hh34fC5a1LUxo8wXROZIroPLuP7TqraLdH6c/ejKavMVuIfpy8tJUJZKibpOU536PPfTGvo3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783361035; c=relaxed/simple;
	bh=WwRVC0oPS1PRdnnUiiR/+KmfMwCzKdfktBxDYpwwZ98=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oCgUuuJzQkMp3/t1UrhNDDZO/rreu9BoRphA+4SpxgKzbNiBw/BW6iQQP39jOWDnheXsy34zImZSZvQ57adG182ZUYxAooLLn0lHKcuSDknYIo1ElRJurbaMRmBj52nCz6IXbJCtmsJevBzN/MefZqK4Znw+deH2gwX0u4k1ESU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NHBHBrD8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=egu38Je+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NHBHBrD8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="egu38Je+"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666FFDk8972291
	for <devicetree@vger.kernel.org>; Mon, 6 Jul 2026 18:03:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=H7tRVQ6U4JB
	i6TMIM0U9LRmhFwSAavP1fZJV4lX06Zc=; b=NHBHBrD8xW+GXO78pXAJlGDRkuJ
	9t4cu5dkSeGZa279lpxmYbKkVJ7V3a1eadVO+G8WZYZctYhtBLuOlpDPJkdIGYEq
	36KXWBfYDAWZBl4xdSpqmfYdYfmQGwcBYBRFg1bcVLZvqVqIUxcXUNk2OW8Zk6vP
	GJ4S8Xw+n2e0LJgjhgQbueVTAJ71gkBMErGoYhpyJCHCVu8fdqwYZNmQTMaupUyj
	SCs9bAbu/8rx0FoDO8pyMBPnXe5u8mCVtp1UpR/2aFweGWAg8SWPBbXjZgUbQM8a
	gFzsUKD1kmSZdGa49sahOSw21uHEY5pqPaxjHLIQxme7N5Lzw3+tREeY+qA==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8a3r26nf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 18:03:52 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5bbd4255f46so610647e0c.0
        for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 11:03:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783361032; x=1783965832; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H7tRVQ6U4JBi6TMIM0U9LRmhFwSAavP1fZJV4lX06Zc=;
        b=egu38Je+UQSX9XUKFQ/qmjzXHi/nOCIjkSZ31v6cxoFUE8GtkB1vpZ1vRtd4SnfUE3
         MDxhJyGDQiUmWDxf1RaJayOpv14/DT6R3Oz5L1eQhjNsJ9WEyDbkxT1OK4VOhPP5r0hk
         cCl7rsuwvDlE826n/tZ+zNY+u7GEH+xLX6kcHRtg7TDduvL7xZtRnXpvFNnPBvCBO+1F
         7bN6XpvfzlPc7hCdQAhFGjyipJLKBf428Hz5rUT6foWwTKnPkSdhy9Qf7lxCc5nTgV71
         KnZ+ga61oGcm2h6ORClPZyrUKjwzJ5aw1HLCGcvt+8zstVjMWYz9C+cmQZVv2wm/XckQ
         ULcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783361032; x=1783965832;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=H7tRVQ6U4JBi6TMIM0U9LRmhFwSAavP1fZJV4lX06Zc=;
        b=KMtx548tjP/VKGeUNyvKqXLO9e01qOFklj4EuqoCom6ZnhL4uYe0iMHYebPpgJE/xT
         LSzPVFp+ZXru6w3b78PImS8E17ZtE4CJFmLDqHTd005NjknK8YH1MdqGjmVX1bL0gAjU
         2PJj2PNxhzTJrhw7Pvbeu6oOyJeNCeh2dsYRCnig897Cs8UH7wG3y0VVOngKJ/JdlwHL
         BLMRamvQVgCh2l95znhZ4SjYGGip6Pr98/FIEKoYgynmRtU3fyqKz6cHP7KN7+O9Ldbo
         OKnCL3CgpW3utgnRlx5PorYcmN3GYeYxWgUSJ9SlwgI3ivTWt5BRAdAb7/xfVw2Uso1r
         aoRw==
X-Forwarded-Encrypted: i=1; AHgh+RoKsiIqtJpW7aAQ8rbzvQFoWV6JwSDVYespMtkfUj31gURYFI506FX5FUcsGa8xK2ha2QIgCZQd2Fcm@vger.kernel.org
X-Gm-Message-State: AOJu0YyYDhVKAY4vmusPNC6pw+ShpAqVol1fpYVeQIoLijEmszamjOGG
	m9y/NUXMpIA0lAeMTyWuik0dF6dYuXXr7RTeIBds5DirAsGy4mhimDhbq2LFwJ5dnU5UU6Fm0nr
	FCQL6JygWgm0A+5Zj5vOvEwrQEEzcQ4H5NPS+zMFttUTFPcOBDazEkdu83yfQVVDn
X-Gm-Gg: AfdE7ckvIk6tpxliCZLyFJs2H9HMFXeRlytoHls3yTmGrasWqBdYRYcd1dRROpmYNev
	l4RdpeFbGcY8pm8/Y3c9Y120Iq8Rtr+5b0y/KnI4VntBuDuoLqeJYKbv0YPUYQDn2x2nPCQmyTl
	vW3l5H50ye7ReDTT/c9CGI9rJjq3bAFh8JWJ19QeJwC4FeSBB/XmVMU11I+17KuGE03PlHuSGmE
	f6XM5QxH/24U+feEPzYzvtncz23ct8ccPDaq9luxyubuJj3Y0svtn6V3VqmmKWA0UU2kUfNTq5u
	E9AAQkAn6ejTCJG/J/L97FulYUZ3BFm41v3sJbEnocTfsgLsA32ZqK98/CBQyGd4Iev+7j0m2lq
	FEG/7Qq65ae3F1frZXnqcnw2VHNM=
X-Received: by 2002:a05:6122:511:b0:5bd:89bd:3543 with SMTP id 71dfb90a1353d-5be908b8787mr858307e0c.12.1783361031807;
        Mon, 06 Jul 2026 11:03:51 -0700 (PDT)
X-Received: by 2002:a05:6122:511:b0:5bd:89bd:3543 with SMTP id 71dfb90a1353d-5be908b8787mr858294e0c.12.1783361031447;
        Mon, 06 Jul 2026 11:03:51 -0700 (PDT)
Received: from quoll ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493e00b769asm1108555e9.14.2026.07.06.11.03.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 11:03:50 -0700 (PDT)
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
Subject: [PATCH v2 3/3] ARM: dts: marvell: orion5x: Correct indentation
Date: Mon,  6 Jul 2026 20:03:36 +0200
Message-ID: <20260706180333.648401-6-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260706180333.648401-4-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260706180333.648401-4-krzysztof.kozlowski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1519; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=WwRVC0oPS1PRdnnUiiR/+KmfMwCzKdfktBxDYpwwZ98=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqS+33Eko+YabAY8cF5x1SHykX45oWZnWLZieeL
 Tu6BxyJ18WJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCakvt9wAKCRDBN2bmhouD
 11oKEACDTScl/k0BJaeGF9h/I5ghVzZ1yOr6TTlIxdPmJa+CB9a1uNqKHHnsGYRvorKBnD7yWSh
 pCZ3OkQRJYaqJq7ow+eYwvLyzeUGxFHd0yO5uvsIEcL3ZNLS5Kx1aRSgY6MrSfSPQZyPrY1Z7OX
 sll1N4qVKrxhd/J2PElTaMQVNztK4EOYV3ay9d7/izGa9PKRkHcmfJQamhZqw7/MZc8BN/7up4B
 Jizsv+LktDSzRYRmyrExwX2DetpTBa8zCR9h5+VVpQTmQ11TEdrzmH2Q+ep+fTmh4GKizpMOESD
 z7K915Pftrda/r1a76WSvQ3qDDYMp657v7jCoom6lH95mWG9nRYdkywi7GjOVdaTURrmXeiCRlS
 ao/z2QL+BUCZ4ky/hlIAIkg8qqM6aeSRPXC4qe3fkeScJ3TrPl0hzyuQzKo2IOjqJUSkGm46jOV
 QEgCSyv1sNuVUJbnXmZnTC/1LQVnxbVhebnzkdW1V0+XuWsVNUGok7PgyZN4jif6PUbLj0qQNsY
 RYUv/KMe+ufo5xZR9Kd/NHH01dnwQi6JpxOFfNip7OhFDbbqIa+Yn/QLh6qPeniJB1DT6ihsmcf
 7qXNolmb2ueQW5f6oc+qD+1bUmhDPLqUGa5rUuWiqEnmC2O4M+VxXypVr5AUjlXmFXztYpocblo ZS+ugMCoHIczzbA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDE4MiBTYWx0ZWRfX/mQpvfB57QpI
 qjCas8fI9e3vcHtpmW/xe9rbY6NXWFM10TD0w+DjrqJfT3Br8aiVXGjQbjRrSAZIbLl7xdypJgt
 d7DO0Ky41uzMA760fv2VVLTO9dCeve4+qVeQkvs2g8Cs3xMtjtPSy/3Ce+B+gPJV3LeLU+7q2IY
 hgVh/WXSaVduMdsEDlb7oYzzFdex+r9eVqu/4SX7zXQvD4MsoIyDmLHt7mlhjQxyLJZ09olLTDL
 g9uOR6nvSrDO/AUzXaezx8bDY+XGnQ2y3EjG8hyLnNMtgw++KYukX3yS5wUrV7osF6D/mqtzWLn
 pkgz07S5qg4RE3nT7jTXziXz9if6u7pdT8MzQOSu6ecmQapWPPe9mMGWTd2EWkSyZxMxbQrDQD3
 2BAjR1dVVMtjdGa6b/ZofnsFtb6TuWdosmUwqg1DAwaMe0okqrzQ1ypsGzwt42Wi8prgOMkdAAF
 O8Qg6k4N3dH70GG8bHQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDE4MiBTYWx0ZWRfXwTDgsreqsRkh
 jFRhao9/wI9mIaliofiiOnkE0LF3ApZmFL9ejERBw6fAi8AqnJTfyVG5EtwqPXXyrnwIGbWSR8I
 F05M4ys1o1M9fghLfwd0m0sb8PDL5Ho=
X-Proofpoint-GUID: 7cRIiA1_VQlbnxBK6onoAU0ibyQ_SUT4
X-Proofpoint-ORIG-GUID: 7cRIiA1_VQlbnxBK6onoAU0ibyQ_SUT4
X-Authority-Analysis: v=2.4 cv=OKcXGyaB c=1 sm=1 tr=0 ts=6a4bee08 cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=52rqv5wQVAuTtBApVRAA:9 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_02,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 malwarescore=0 clxscore=1015 suspectscore=0
 spamscore=0 phishscore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060182

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

