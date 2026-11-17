Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794920770;
	b=N2J9ObNgyUINhYJFNbl4mMUpxd/0uLz3NXXsmNL08SSwDsyTo5NlkjerOOfnGkhzBOWC
	 ZwCHWLXdDM8FrxHbTJ5SlpKU/h7PRg2mPhLyPbcJnYBzfAfj7wVsWepcg/eZ6V93xSX3N
	 bYud0a2yS2PKYgCgETL9YqyYhT9qJThi69wBE/lG/NuHODQUXyLj6+3E7bCJe57SRur1g
	 evsD1C0fl8/JBLH4CCfB0OWQYgvpgcNOv00xywj68W3h+NDTHtYOy6iRWer9mZRfGkbvo
	 AbZfXhvE4XAV11LQpnDxxcmagGeEba6o3EhzCJjIiwhZjr5uLAPJEOvpJ9QiT+qq4Iw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794920770;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:X-Developer-Signature:
	 X-Developer-Key:Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=werp+leniNoWoVq75RHzy2154GOYJfG48JzVEy4bJ6A=;
	b=Yk51r6bi97w03/KsfmiSFwlHpe/FWD0SqBZRykbjOord3S3mD+XKUrKH+LF6fw/QeZ7Y
	 2W/y6vBay/a/ZWGqKl+N5pZ2Om8ItXCeRy8QlmQLwJljzdLyxbZvxlvKxzbA28AX4dST0
	 s1hmhqaGjaEtLRAA3BBarCG8fmxrisLM1MXIVeSa4exw6xDXlWYTP5uTZxaiHG89UvCl3
	 zAN+dIQq5m0Y9hUzPZcxsjaJiAM23yFoHB7HucpUYhPeq1DDPytYoiRQlXgu10h9iwPwQ
	 6htIrEeorchJj3sMQp3/Po9PoDLu0XvBwpJTbeRZ8/yBtfVG5/8vTMMv23kWkYPm2QQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=oUJogxAM;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EmbuStbG;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74AFD606A32A
	for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 13:06:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 74AFD606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=oUJogxAM;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EmbuStbG
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AHC0p9t3047889
	for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 13:06:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=werp+leniNoWoVq75RHzy2154GOYJfG48Jz
	VEy4bJ6A=; b=oUJogxAMZln83g9iN2+29I1+sQ7inyqOcEuTtGiTvTofZfuXzfj
	kHfQQ30DSMBwH7QfbCU3+UP43rJdjF9wPEnT6uZrwREWeJeqVvlicBEr0tXoy4zt
	MTacoo47z8b7AXPVgR5rxCO4Jorfpm6Wp0WKI0sOyvmoGIBcLDSvuMVvZeJcOs9a
	GDcUveMK+NtE2BBLr5pVRrYmzTxEFo2ZPW7PwkiuCETYex2XfyKay3fxh0faGzTD
	7Vj+e0E+jDHpFZ7BlALcw91Wbb/pg4yOTEZisaafA+bFIzbJfywvQ5PU1DIFwbBd
	oJIw7hAoZYk8+mFIfYJf4HF2tbVgxK45lvg==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0mv10p8w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 13:06:09 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-99e109028b4so1705760241.3
        for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 05:06:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794920768; x=1795525568; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=werp+leniNoWoVq75RHzy2154GOYJfG48JzVEy4bJ6A=;
        b=EmbuStbGcF8XaCSRdPdxLWxguRTE5qFHmp7rQIplNcm+Yfh5IlbSO70NoLbFACGH4e
         jDVAlIMywBR9W2khQABDEaW6B/C+RdUy1voq0Pn5IObFMnVM8ukxzfBYoI+5PaLFtsHg
         BPQY3JwMTR9gfquQXkJifCapdtjS5TfFyh2ZpynhHbdPP0Nnp2NBezmIlRpZVgR3yW5r
         ZjpuMQ69Fx/RJpwzyBLBhps44sK3VUSCgxkk+eipW6aRPkrtEFOs+3BVCAgf1nexkZmI
         rh+7cC/1cQqgpy07Mz635QQtzZ3DZKMGseqrqHPYxYSW4vdsCq3rtRmJQhe/GfdIqczw
         tZtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794920768; x=1795525568;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=werp+leniNoWoVq75RHzy2154GOYJfG48JzVEy4bJ6A=;
        b=Un00aDEADinzQYO7H2jYoPck18AjuZs2V4sHFyXr+c8Y/l9BWs28Kdb5LFV7yM9txe
         Hmo7b5vTbQO4Zamyb/hHwu/iTW6PQObleZXhlB2TzhVAyBiEpF9ggXh06+wbhfcsV0Ra
         IMQ/uZboQLg5G8XDYe9rioYRfmUvQT14xVtNkqyhLjR2ijm8z0PnTRr62FA1h3c4ptbO
         wykgISUfJriMSdqPS5FdkZdl7HwONweVa6AW12B/Q1Uw2AewOuVwzLp09w0sIYaLIkw6
         myn78iJ1G9/kH6Tx861mLj4zfL2sAsIk88Z2+oTXbt63tvk0lsOeNL6Bpt+oW3lnjoAM
         nftw==
X-Forwarded-Encrypted: i=1; AL+hErEdvv7qBXBh6s2iW4BNh+rr/LkBoMiAjPUou/4SHtM58a8YIytj0IROaC108NwnEPA1gGKbrjGTgE3k@vger.kernel.org
X-Gm-Message-State: APuU4Z/F79X3roq24WznSDcGm/j+wAwQ+3kCxt9TTnjiB0B/fjZoBaYF
	pO5IDIsbpgf8BP2jhbDUibaWZwUh2hBwzeAY+ZuHrS5HJz2NTNKEZfguATzcGZ5IP4JaAYvGIto
	kWuKkYN5YrMU1N2cqzJcq78YCWl7zgYEC3XYtP4YUMsiVBj6v2AE/MSPdeqNavpa7
X-Gm-Gg: AZFdTZfWN9jRHN933xycxKw5npNkFwIZUdFJy24IczF+Dg7DSOWY/jsf0Z0EDJo8lMT
	mVUSPNUtogyKKJaUulrUI3y9aGyFsvVHrsbFP4RXlq4Hhy1wz68hF48wj1gXj35zA5bvmsAZG+W
	y1J7tQl7ms27HZbFymkTZbfMMzV5hsr11XWbVq4151WlifzYl27fQBJX85naPAfjsW2o6soFzZC
	KdKrOifwuBPrF13SJwftVlgb/YIsj6g88dIkcwblIAMFlEFiBva0E573yFS+k2iD5z9swhsLeyy
	u9RnI5YTKjYmloKRQya6g+XSalL/OIelcVSUwi+EHxnFYtmlKli4jnrb1XzI+q92XmST3jiEFl7
	T9HCS9kUBIn0tQd5ZxpeCu3f7+KcS8RI/2j8Of2nvlqH+WcOSKtZIMTBa5Ni8Ow==
X-Received: by 2002:a05:6122:4f93:b0:5ec:20e8:45ff with SMTP id 71dfb90a1353d-5ee34ae3347mr4929146e0c.21.1794920767804;
        Tue, 17 Nov 2026 05:06:07 -0800 (PST)
X-Received: by 2002:a05:6122:4f93:b0:5ec:20e8:45ff with SMTP id 71dfb90a1353d-5ee34ae3347mr4929113e0c.21.1794920767336;
        Tue, 17 Nov 2026 05:06:07 -0800 (PST)
Received: from quoll ([195.50.164.66])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095b5b078sm534082166b.56.2026.11.17.05.06.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 05:06:05 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH] arm64: dts: mediatek: Remove undocumented, unapproved aliases
Date: Tue, 17 Nov 2026 14:05:57 +0100
Message-ID: <20261117130556.234785-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=7918; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=JhAQKSi0UHwGaRwXw9Ozbf6HX68wW/ZtNlGPzsJLQPY=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBq/FE05ytbYP2204OYIuT2UmPNOZgaD/fErFnqn
 Yehi09tgqeJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCavxRNAAKCRDBN2bmhouD
 12y+D/4/5qerQxe/BEAJkh8aESGtkmL0OcZVuM3sOQgqovDF88ovrnq67BZoRD+ZOenW68asV5t
 uLd5WnWNL/naLPXAwBgivabqWoY+CnkfnPkMbDAqhbXuvGV1xL5XNcGhMc0iElFhS94biszOgds
 NRQlYPKCYEZoEuEBbleG2vXdARzecRe4NSDQo7cjX85X0gSy5mcjqEGJuwa52CGOsflhtsFmE5Z
 vQZPFy0Ffqu0ZdjItDPr4u+b8HZfHu/u2AgxSPGw5l67u5D+Ir8MXPr42YvfpLkhSmlS30Y43RX
 PBW4cKZ8XMQfYEXVhU5PSZyEDgZF53u57IR7TO7jOXklQm2mMZu6hsM1G5J8Fv5O4bKL7QcmST3
 V3AiqRHZ9KRp8oPuPVclwIOxdK7cAA5w4xPNb6y7ZbGo0+JKsz0UeU+RopVx5UHyNusSSzY3Z82
 GIkj06gwBQPdWcOPdcpKr11R7QqrlLlXLZSuNcVZQMj6AMqfA/RBeyYz1+610GyNOQuJdgRre+a
 3VPqAJEZto9ASmnUs1Y7Q7hjiArQzim6ewz5vmb+URjaNboRswzapn37mJQLng0f0wNlhkvFYz2
 XWdDJTL343s+bS94gfF8Wi1ADmuR53MrjwysN18+Qz2y33wR2MDuYt2dpnw2reKJdmka/j5jckn sXVVx3Ey+/h4nVA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: vteEgSYlTc2f3UzQ3BqXR8Sx6tU_qLTr
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDA1MiBTYWx0ZWRfX8BI2RmB2RLb0
 nJCz1vbSjT5j3pCCfH9uQVCEsYO1S6MEEMmQu0v5oJgWK+e95Fj7Okb1B7KGmXqezJqwZFadlAv
 iXBVupUL6SRiNV3CdIkjdkdHe0PiYkE=
X-Proofpoint-ORIG-GUID: vteEgSYlTc2f3UzQ3BqXR8Sx6tU_qLTr
X-Authority-Analysis: v=2.4 cv=Cuwq4X4D c=1 sm=1 tr=0 ts=6afc5141 cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=Jk2/TV77q6/E6wQq2oQJxQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=MmkPf4a8AFjUc3_LGQoA:9 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDA1MiBTYWx0ZWRfX7BsUxRKI/uYV
 gT2p/h81cmpllvyWswh3/JWbAlogdc6H+VKsjwwyygMbWbisfTkVTFVGfbEXtHyx74VffqkEjBR
 o9ybT2p9FwlrDH/QG9x1uvB9RdyYDXj82Z+QdjefPW1lauOHLMn2V2GUlMvIka6TJJ0MxUv69uX
 JjMdbpk2T0OoW8pwaIsRBY8hfP7T21YV0nfMVKhgK6cVfZaJAJRJbLnVoYcQHP/TO8DfCkdT1bU
 3jCNPGRAiYEeXiTrwzcZ+Zk3HjIsqsttLTqUAgCfv+YkTz6QC7+kFETxtDaZiqmXtdsDWvSt0hy
 Wc/LbPUPAThtM0ZSZPIr5RCeiE5ULVF6nIK4FJlHseFLAdaLXExe/aDNp6otYRCRgvekJ1FYsc2
 /IOlkfdcQZrR12oLbJaXrVaVvMxCV9fQLirxs6Hp1mD7yjnMwDAdFIeheLPMLjXuG52DwghN3yI
 Fh6p6uyFgS6hw2GSYTA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_02,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 adultscore=0 clxscore=1015 priorityscore=1501
 spamscore=0 malwarescore=0 impostorscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611170052

The ovl, aal, color, dsi, gce, rdma, split and other aliases were never
approved by Devicetree maintainers, because they were never documented
as actual ABI.  Drop them, because no new custom aliases are allowed for
years now.

This might break users of this undocumented ABI, so these should be
updated to use only documented and approved ABI.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm64/boot/dts/mediatek/mt6795.dtsi      | 17 ----------
 arch/arm64/boot/dts/mediatek/mt8173.dtsi      | 16 ---------
 arch/arm64/boot/dts/mediatek/mt8183.dtsi      |  5 ---
 arch/arm64/boot/dts/mediatek/mt8186.dtsi      |  7 ----
 .../boot/dts/mediatek/mt8188-geralt.dtsi      |  1 -
 arch/arm64/boot/dts/mediatek/mt8188.dtsi      | 33 -------------------
 arch/arm64/boot/dts/mediatek/mt8192.dtsi      |  8 -----
 arch/arm64/boot/dts/mediatek/mt8195.dtsi      | 24 --------------
 arch/arm64/boot/dts/mediatek/mt8365.dtsi      | 13 --------
 .../dts/mediatek/mt8390-genio-common.dtsi     |  1 -
 .../dts/mediatek/mt8390-tungsten-smarc.dtsi   |  1 -
 11 files changed, 126 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt6795.dtsi b/arch/arm64/boot/dts/mediatek/mt6795.dtsi
index 6dd706b27830..971fb19e95df 100644
--- a/arch/arm64/boot/dts/mediatek/mt6795.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt6795.dtsi
@@ -21,23 +21,6 @@ / {
 	#address-cells = <2>;
 	#size-cells = <2>;
 
-	aliases {
-		ovl0 = &ovl0;
-		ovl1 = &ovl1;
-		rdma0 = &rdma0;
-		rdma1 = &rdma1;
-		rdma2 = &rdma2;
-		wdma0 = &wdma0;
-		wdma1 = &wdma1;
-		color0 = &color0;
-		color1 = &color1;
-		split0 = &split0;
-		split1 = &split1;
-		dpi0 = &dpi0;
-		dsi0 = &dsi0;
-		dsi1 = &dsi1;
-	};
-
 	psci {
 		compatible = "arm,psci-0.2";
 		method = "smc";
diff --git a/arch/arm64/boot/dts/mediatek/mt8173.dtsi b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
index 6ec50125cea0..868b0fb84449 100644
--- a/arch/arm64/boot/dts/mediatek/mt8173.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
@@ -22,22 +22,6 @@ / {
 	#size-cells = <2>;
 
 	aliases {
-		ovl0 = &ovl0;
-		ovl1 = &ovl1;
-		rdma0 = &rdma0;
-		rdma1 = &rdma1;
-		rdma2 = &rdma2;
-		wdma0 = &wdma0;
-		wdma1 = &wdma1;
-		color0 = &color0;
-		color1 = &color1;
-		split0 = &split0;
-		split1 = &split1;
-		dpi0 = &dpi0;
-		dsi0 = &dsi0;
-		dsi1 = &dsi1;
-		mdp-rdma0 = &mdp_rdma0;
-		mdp-rdma1 = &mdp_rdma1;
 		mdp-rsz0 = &mdp_rsz0;
 		mdp-rsz1 = &mdp_rsz1;
 		mdp-rsz2 = &mdp_rsz2;
diff --git a/arch/arm64/boot/dts/mediatek/mt8183.dtsi b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
index 7414c10ee664..2c3836555e55 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
@@ -35,11 +35,6 @@ aliases {
 		i2c9 = &i2c9;
 		i2c10 = &i2c10;
 		i2c11 = &i2c11;
-		ovl0 = &ovl0;
-		ovl-2l0 = &ovl_2l0;
-		ovl-2l1 = &ovl_2l1;
-		rdma0 = &rdma0;
-		rdma1 = &rdma1;
 	};
 
 	cluster0_opp: opp-table-cluster0 {
diff --git a/arch/arm64/boot/dts/mediatek/mt8186.dtsi b/arch/arm64/boot/dts/mediatek/mt8186.dtsi
index 621408439ffa..2f82eb532f30 100644
--- a/arch/arm64/boot/dts/mediatek/mt8186.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8186.dtsi
@@ -22,13 +22,6 @@ / {
 	#address-cells = <2>;
 	#size-cells = <2>;
 
-	aliases {
-		ovl0 = &ovl0;
-		ovl-2l0 = &ovl_2l0;
-		rdma0 = &rdma0;
-		rdma1 = &rdma1;
-	};
-
 	fhctl: fhctl@1000ce00 {
 		compatible = "mediatek,mt8186-fhctl";
 		clocks = <&apmixedsys CLK_APMIXED_TVDPLL>;
diff --git a/arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi b/arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi
index 801eee735afe..883141d8a6d5 100644
--- a/arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi
@@ -9,7 +9,6 @@
 
 / {
 	aliases {
-		dsi0 = &disp_dsi0;
 		i2c0 = &i2c0;
 		i2c1 = &i2c1;
 		i2c2 = &i2c2;
diff --git a/arch/arm64/boot/dts/mediatek/mt8188.dtsi b/arch/arm64/boot/dts/mediatek/mt8188.dtsi
index 14a320f0c70c..f14b23dd57aa 100644
--- a/arch/arm64/boot/dts/mediatek/mt8188.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8188.dtsi
@@ -23,39 +23,6 @@ / {
 	#address-cells = <2>;
 	#size-cells = <2>;
 
-	aliases {
-		dp-intf0 = &dp_intf0;
-		dp-intf1 = &dp_intf1;
-		dpi1 = &dpi1;
-		dsc0 = &dsc0;
-		ethdr0 = &ethdr0;
-		gce0 = &gce0;
-		gce1 = &gce1;
-		merge0 = &merge0;
-		merge1 = &merge1;
-		merge2 = &merge2;
-		merge3 = &merge3;
-		merge4 = &merge4;
-		merge5 = &merge5;
-		mutex0 = &mutex0;
-		mutex1 = &mutex1;
-		padding0 = &padding0;
-		padding1 = &padding1;
-		padding2 = &padding2;
-		padding3 = &padding3;
-		padding4 = &padding4;
-		padding5 = &padding5;
-		padding6 = &padding6;
-		padding7 = &padding7;
-		vdo1-rdma0 = &vdo1_rdma0;
-		vdo1-rdma1 = &vdo1_rdma1;
-		vdo1-rdma2 = &vdo1_rdma2;
-		vdo1-rdma3 = &vdo1_rdma3;
-		vdo1-rdma4 = &vdo1_rdma4;
-		vdo1-rdma5 = &vdo1_rdma5;
-		vdo1-rdma6 = &vdo1_rdma6;
-		vdo1-rdma7 = &vdo1_rdma7;
-	};
 
 	cpus {
 		#address-cells = <1>;
diff --git a/arch/arm64/boot/dts/mediatek/mt8192.dtsi b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
index 898953acdb61..bf5893e3002b 100644
--- a/arch/arm64/boot/dts/mediatek/mt8192.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
@@ -23,14 +23,6 @@ / {
 	#address-cells = <2>;
 	#size-cells = <2>;
 
-	aliases {
-		ovl0 = &ovl0;
-		ovl-2l0 = &ovl_2l0;
-		ovl-2l2 = &ovl_2l2;
-		rdma0 = &rdma0;
-		rdma4 = &rdma4;
-	};
-
 	clk13m: fixed-factor-clock-13m {
 		compatible = "fixed-factor-clock";
 		#clock-cells = <0>;
diff --git a/arch/arm64/boot/dts/mediatek/mt8195.dtsi b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
index 9aaf8b6edcb5..389fb9d7ea89 100644
--- a/arch/arm64/boot/dts/mediatek/mt8195.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
@@ -23,30 +23,6 @@ / {
 	#address-cells = <2>;
 	#size-cells = <2>;
 
-	aliases {
-		dp-intf0 = &dp_intf0;
-		dp-intf1 = &dp_intf1;
-		dpi1 = &dpi1;
-		gce0 = &gce0;
-		gce1 = &gce1;
-		hdmi0 = &hdmi;
-		ethdr0 = &ethdr0;
-		mutex0 = &mutex;
-		mutex1 = &mutex1;
-		merge1 = &merge1;
-		merge2 = &merge2;
-		merge3 = &merge3;
-		merge4 = &merge4;
-		merge5 = &merge5;
-		vdo1-rdma0 = &vdo1_rdma0;
-		vdo1-rdma1 = &vdo1_rdma1;
-		vdo1-rdma2 = &vdo1_rdma2;
-		vdo1-rdma3 = &vdo1_rdma3;
-		vdo1-rdma4 = &vdo1_rdma4;
-		vdo1-rdma5 = &vdo1_rdma5;
-		vdo1-rdma6 = &vdo1_rdma6;
-		vdo1-rdma7 = &vdo1_rdma7;
-	};
 
 	cpus {
 		#address-cells = <1>;
diff --git a/arch/arm64/boot/dts/mediatek/mt8365.dtsi b/arch/arm64/boot/dts/mediatek/mt8365.dtsi
index 2e782558fb77..4b05f6a864d4 100644
--- a/arch/arm64/boot/dts/mediatek/mt8365.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8365.dtsi
@@ -20,19 +20,6 @@ / {
 	#address-cells = <2>;
 	#size-cells = <2>;
 
-	aliases {
-		aal0 = &aal0;
-		ccorr0 = &ccorr0;
-		color0 = &color0;
-		dither0 = &dither0;
-		dpi0 = &dpi0;
-		dsi0 = &dsi0;
-		gamma0 = &gamma0;
-		ovl0 = &ovl0;
-		rdma0 = &rdma0;
-		rdma1 = &rdma1;
-	};
-
 	cpus {
 		#address-cells = <1>;
 		#size-cells = <0>;
diff --git a/arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi b/arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi
index 669eaec662f3..a938539c92b8 100644
--- a/arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi
@@ -21,7 +21,6 @@
 
 / {
 	aliases {
-		dsi0 = &disp_dsi0;
 		ethernet0 = &eth;
 		i2c0 = &i2c0;
 		i2c1 = &i2c1;
diff --git a/arch/arm64/boot/dts/mediatek/mt8390-tungsten-smarc.dtsi b/arch/arm64/boot/dts/mediatek/mt8390-tungsten-smarc.dtsi
index f2ad9265be31..d70bed80274b 100644
--- a/arch/arm64/boot/dts/mediatek/mt8390-tungsten-smarc.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8390-tungsten-smarc.dtsi
@@ -16,7 +16,6 @@
 
 / {
 	aliases {
-		dsi0 = &disp_dsi0;
 		ethernet0 = &eth;
 		i2c0 = &i2c0;
 		i2c1 = &i2c1;
-- 
2.53.0

