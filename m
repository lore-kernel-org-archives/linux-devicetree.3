Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99C7B38886B
	for <devicetree@vger.kernel.org>; Sat, 29 Aug 2026 19:41:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788032499; cv=none; b=RtVnNh1RhwWhIOoepMSYSFbAtkb8EfFZhHQtiwnovhIaGLJbrNPCd2PsCe1kh9o+vUVppCGQeKdQksjAV1knmNFgiSZm7x/XuuThBaWiHmOOgcoo8O1WnRp47RnAWdLQ9o1g+Hhz/EWCm3cv0pMO8hIHpTP56FGRWFgFonCNv0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788032499; c=relaxed/simple;
	bh=k8n/bi2g8bb5SMtULjvD127VMpit1jAkK54KyWSdN6Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=S1hz07LimmLN0iLLTxM48SBlbymZ8PMEVH/vzCflp5zAWlq6ZWcszFeAYVMiIBgmIu1ttHVMQY2chYHnxXCoMo8HAkvfZngVdhY5eK1OELoUMH5SO0FZqAzXfSz4ID3k/p1c3XPSJmu4gmkHUVqHLCCXdXo8nPU0qFJfgwLFxUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=W1fHASae; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=i8Qq5iFR; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="W1fHASae";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="i8Qq5iFR"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67TGx3gG3024113
	for <devicetree@vger.kernel.org>; Sat, 29 Aug 2026 19:41:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=uvvVmWWmWkOAQN9Xye2DpALciJSXKEk3Wdr
	0rRgOknU=; b=W1fHASaeVreLYR8e0aAhG+oZ4kbfH0cC/6kqLiOExVdlkiKN/tw
	5UW+9KESK1c7B+YpLNybQ6m4/pDM1ZWhNAw7WVBat6Ni1j6BcPzzroObh8NEPhMV
	UURUQYEW9ea1ktwz1ivYzU2LqzQyhIzCbu44lpuMtLANlBAQEJczODPggbdnz/pn
	J33EjK1vf3sV4IxnHPyNg7ZWNO9ilXN+rdafgTe/AMzVRFA8Ym3jrfbGyFFAp8Yp
	9+6EMCSVtdOcL+fCKZaqGxFmebX4iex6GU/1PXlR+7SIWYu6Bn+r9vbthlFdXRds
	OYnsQehtSl+fUFGCTq/WSoZC40nCr2otBfg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gbqdfhp3j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 29 Aug 2026 19:41:36 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51c1d137a68so54929021cf.3
        for <devicetree@vger.kernel.org>; Sat, 29 Aug 2026 12:41:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788032496; x=1788637296; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=uvvVmWWmWkOAQN9Xye2DpALciJSXKEk3Wdr0rRgOknU=;
        b=i8Qq5iFReM7ze+pB5zz2lz6Oj8zjTHwBDaYj0E0KLyXi3pqkd4k/GjvHvYvHpdYtbM
         My6rzSP3HXem8PnE1uy4g0cTj+l86reLmndqluwK8vBI48lfDmaMdYmv7yT/yGp45XI1
         88hlyYNs4dqxfBpzmt7dJ7TLY3MsnT/xTqADL8owqD27JpyvNw+jTDqI1uRK7f8QHbXQ
         inRGlC7XWVKd85iCDCErzx5ALTruhxbVIN2u5KpbYc8g5fJd1b3dzGXMJgcY6LIUH61C
         1MrS2w4O00ofKRRDTi7nEfFWY0XRYuTev+plbTATHt0tnp6XtnmlNVnLQbZj4uJlpmv1
         9svw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788032496; x=1788637296;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uvvVmWWmWkOAQN9Xye2DpALciJSXKEk3Wdr0rRgOknU=;
        b=YQZj44pRv26XLK0cOhK/oWJ54pz6zFojMcLKzgXGWVcT07bQmz3Ze6d6b0ezRKMJ2N
         Crz57NAjbkZ7Yh28ocM7wSu0qWmU16g3yY6ePVrFm1crP7f2zqgfs5TB9fIeqcLWYaBR
         PEK8dpEMGbqLcWMaL+5DY9YSNBQzgUkB9ui0CRBqF3gXY5uVsKuqvOP8XQIY+nJElmdk
         Rh7CDiNdFjD1XUzOqWMJHnxDazEzExHW2E1DWyVzKS8L2oERHiSIQ5JqyAZ/QM+9pdBG
         Wg2okiyTJU9QxmVpdCrf+HNeTARXqT4fbKXStfD6ttEfC0/NLzV95JZgbSn/oGUBSrRR
         bR3A==
X-Forwarded-Encrypted: i=1; AHgh+RpeGlJIeir6VfyO8vD3fVJCKBqz8OnwzWd3LsDXx3cyduvdmKMEzDlPsu5it9YpMXxKU23KXQKuUxLA@vger.kernel.org
X-Gm-Message-State: AFuF++lpvH/FnOQ1k0lBu5MIGFoXOu6D89DRZ0/tdq7QW/AILNQ61vhf
	TLPa9X+UQqHcPD75gnVG0tVOAptJl9g17cL6CJhJvmTjGhbifBkfaYMma8nCYBE3aARUTJwDVPe
	ZzZqr4Z/71NE5WHvA1yc+Msr8AY4hvifvsAwM5mQB5LfW8iFLdlYm1LAUFQPR8z73uXQSjFCn
X-Gm-Gg: AR+sD100e1MAkX1JjAhMiMBNGZrGhh74ij4FhLqQidNguM19oSJQCU4Gze3E0gTQF5Z
	wna+Q3v3V7xN52sE/MkcTrM7gQCBiX5PLDxfEUSlogfwTCjRyTo6BYey2aKruVe4BEKKUs+r4gE
	UK6EO9wNbCqHQXqE4oWE5gVSA3p7eIZ/pvpyUJ+MQfPB589W5T+q4h3OW2pCv742F+v8w0YMvuh
	iFYEdoDzVBswgvSNqbFbtLdXik0zOr8/tEBkVX70CZzHqev4LhFsFkTzMBwV6Zh99sYsCF1nAY8
	Wru3scwlEX+Nhos3iUmf6qi9Q082W9R4bNgV98BMsgcDk08kWyV/Q6r0sN3grCgJNEZ2XiWwZZZ
	n1ahsSzthb0hvHm4=
X-Received: by 2002:ac8:5cc7:0:b0:528:3b83:3483 with SMTP id d75a77b69052e-52fb94d4677mr210911321cf.23.1788032495545;
        Sat, 29 Aug 2026 12:41:35 -0700 (PDT)
X-Received: by 2002:ac8:5cc7:0:b0:528:3b83:3483 with SMTP id d75a77b69052e-52fb94d4677mr210911061cf.23.1788032495180;
        Sat, 29 Aug 2026 12:41:35 -0700 (PDT)
Received: from quoll ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48435b024fbsm2499802f8f.29.2026.08.29.12.41.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Aug 2026 12:41:34 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
        linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH] ARM: dts: allwinner: sun7i-a20: Replace spaces indentation with tabs
Date: Sat, 29 Aug 2026 21:41:32 +0200
Message-ID: <20260829194131.108039-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=950; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=k8n/bi2g8bb5SMtULjvD127VMpit1jAkK54KyWSdN6Q=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqkzXr8Tf8bT7OCyOkAuUb/kCNtsQh7oAUs4V8i
 RtE3/I/EL6JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCapM16wAKCRDBN2bmhouD
 1wivEACM2xUyoCqIPlXoVuxlyn/QJ8FHgmm/6tDcsawf2Fro+zfY2Y5Y89LOQJgHY6a72n/xnjM
 GGoOYSZWlWJgFRa64oN8BwBfmy8BFSyB2USpUX9Sa88PGWwIBjH38PhTuge0fIfpCfL5k8k+SLD
 FuRz+nBWes8h7zDU0xpdV+QHLisd4U/ImjoJX4vUrY2UWNZnizuZMrJlhrrSsdL9zagFS7JnOuP
 57YB7SPsi6ECqgW0HIEWw7u7sH93bQsox8wp5BS+O/eQSAHMGclJ1iLiMgMAgC+hV7nehLSvJvW
 MTu1ZUWE+mjB98z+QiJveQef/Hk8it7QZvjALMURpOc8ynbF/Ye4VpVAHlWP6Uhy4FONU4E+P5u
 G0VZOkGNNdM6UqTwiajiMbmsD0twLMgPWmr/WzrWCtLAmUbXtCLtK1qWms8q+C94Wak+a0mBVRp
 f15zFI2CB1VY8zsABi94X3USYoMPKiTDfrTZ1mFNEXyLJNVecleBVFyCNhmYSSpSmlLiu6afEm8
 tA4r4umx2V0nG+RkO2Wz1yiivT8HdoSkMeQpfb4JZE+rUAD0Sm0FPaY8IFCFvjGQcNuxnPYCNXr
 L7wE/I0NO3OIXPODIWa5bvsIduxiwsrg2xzuOMTEJUWPDHusoc6fhOluRDpn4V8NKptOZVuGylb THyxiCiWRXx2t9g==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI5MDE3MSBTYWx0ZWRfX7zPtRDQde9Lj
 FuCW66/2aTwdJlVNJAk++pgkUQERZcLxAeo2trqw9O7DCAaFNZXsVRsHb16+prHmhlbrzQVb2se
 43LHGdwXHgiR7bGd2QawFrDG/yfidLAKXKVAYSuYtQo8h5yDdT3v8s042E5PNP9kqIFYtQ0SVWT
 Ze+XoVzGPn6b1s0RecxQXm5geGlc5jDKNUQOfRnbPXu4aSxDuPj5qNdM34yloNBvXVEut+Rij7v
 sN9W3jbMCg6mbTbDBcYN1lP6k0wgRHO9ahL1jh6xK/JXUoJ7IErp/Nn8aeczby9ubzpACVpRAn7
 hYN07yAN6lqvG8iUzfRVxtr2CTeYtl3UTB+Ja7DTMrrU3VLpsa6T6NrVDEooVuONnFMAg1WmD/X
 flRQhmLRaYkDF8qRruXwHlOlT6Yrbsq8rIpeEn55DC4aJBwq07gqtyedR6cAVjpwrOcanuxJ2sE
 nUT5QmmQKcJSfj1ZK7Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI5MDE3MSBTYWx0ZWRfX6gCh8wnETCKO
 f4fUpyBDZSzTCUu/5EmZ41HLBuotDNDvDSnnrRuSyMAjYhkL8kSSAzorfetgskh/jV5PDX3SfLV
 0w6sUcx0RL0vbAqNrrgUUDLLgMv29yc=
X-Authority-Analysis: v=2.4 cv=B7eJFutM c=1 sm=1 tr=0 ts=6a9335f0 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=JjGN2f0IYHD0VWcqIQwA:9 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: QbE8kCF2zvSUCO01gZ6iNAZi1PzADec2
X-Proofpoint-ORIG-GUID: QbE8kCF2zvSUCO01gZ6iNAZi1PzADec2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-29_05,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 suspectscore=0
 impostorscore=0 clxscore=1015 phishscore=0 malwarescore=0 bulkscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608290171

Replace excessive spaces for aligning indentation into tabs.  This will
be reported by dt-style-check ("[mixed-indent-chars] too many space
characters in indent (more than 7)").

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm/boot/dts/allwinner/sun7i-a20.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/allwinner/sun7i-a20.dtsi b/arch/arm/boot/dts/allwinner/sun7i-a20.dtsi
index 5f44f09c5545..adb9ee57ac11 100644
--- a/arch/arm/boot/dts/allwinner/sun7i-a20.dtsi
+++ b/arch/arm/boot/dts/allwinner/sun7i-a20.dtsi
@@ -873,7 +873,7 @@ gmac_mii_pins: gmac-mii-pins {
 			gmac_rgmii_pins: gmac-rgmii-pins {
 				pins = "PA0", "PA1", "PA2",
 				       "PA3", "PA4", "PA5", "PA6",
-				        "PA7", "PA8", "PA10",
+				       "PA7", "PA8", "PA10",
 				       "PA11", "PA12", "PA13",
 				       "PA15", "PA16";
 				function = "gmac";
-- 
2.53.0

