Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=210.118.77.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795535651;
	b=Hw9SmKzsevBbuPrAyTuPMl98aVWj/W4d0Pmwtrf74h5gmEQtTR1ameiJzyKDRqa81hXL
	 5Sp/n+NWlQKJd9whMxvhdApcKsWR3euwY5xWX0fBkmMd8baqikoAjPfFcRncnSMoMoQDz
	 4I6ZHdrGdSf0MzfPX2RM+qcE1ifI7Zyr209pgtlqc4Jc3QjyW5KP1TxPzcUZZlcXJw7cT
	 VLCqBkoPPgAZVJh4xKrmvAr1rkPE03DunvPz+M0cxGy/STcHsj18tpdhr44czl2SI6krM
	 rMMnGmjiD25TJCjKJwW3jmhx66DyzFQKzqXTE7OyAokiXUxHPoTmqNLHyqlkL7z58GQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795535651;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:Received:Received:
	 From:Date:Subject:MIME-Version:Content-Transfer-Encoding:Message-Id:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-CMS-MailID:X-Msg-Generator:Content-Type:X-RootMTR:X-EPHeader:
	 X-CMS-RootMailID:References;
	bh=L4+kx50Yc4T0yCDoRUpYz1zoQnaZm52p9pwh+JogV7M=;
	b=2Y17BILp9vD+0gA9QSRPpVu3deaYbXgoenlzOTpReEsfRNIiU+MwyvweAFGvWivOC/Ew
	 BtS1uOT2yC/b9HiIc7JFBzXhbBNMU+t4J0Cv6w95FDFWw5RxGzyupKFwdHvYsW4Wf8Rqr
	 DikiEe/FDCSW6tC+8C98EHbquAQob0rLekiM6Bm407u1SnI18qZBvwunR71ZHE+CwlKRL
	 gbiZJeIeHHtn6xoHUbCrw992AjdigDiw9wcr44iNWtnL8WYggI/ROj75Bnd4ZCcd+mgsv
	 nrQs7hFoMfH19vJT8WXpahqx0hy8iGBO4MNTXqRIInHc/hljElGu1DrxnBgHXOMItsQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=samsung.com;
	spf=pass smtp.mailfrom=samsung.com;
	dkim=pass header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=qNqW2onG;
	arc=none smtp.remote-ip=210.118.77.11
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com [210.118.77.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CC6E606A6AB;
	Tue, 24 Nov 2026 15:54:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1CC6E606A6AB
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=qNqW2onG
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20261124155409euoutp0115dd4b784b83c26480159369f887c045~rBijgrkOC1661616616euoutp01h;
	Tue, 24 Nov 2026 15:54:09 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20261124155409euoutp0115dd4b784b83c26480159369f887c045~rBijgrkOC1661616616euoutp01h
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1795535649;
	bh=L4+kx50Yc4T0yCDoRUpYz1zoQnaZm52p9pwh+JogV7M=;
	h=From:Date:Subject:In-Reply-To:To:Cc:References:From;
	b=qNqW2onGKL1h7vqNJ3xTyk4JV+Dq96xMAq2etjAdwUPfT9cXwCz1Sb/sx7UCdLDtq
	 AMqVT3qI/UwTPIDbNXgLDImJxYz7sozYO25znwVVR97V6F7t9+/vj+7q8T7hPlazny
	 PXznFfi6ziuSKCCrmuYn8AkQ/bOvKlUkcdkIoXO8=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20261124155408eucas1p205755e13b741cc44224d944e46575e28~rBijL-s3h0317003170eucas1p2G;
	Tue, 24 Nov 2026 15:54:08 +0000 (GMT)
Received: from AMDC4942.eu.corp.samsungelectronics.net (unknown
	[106.210.136.40]) by eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20261124155406eusmtip17e07464be1acaa26cdc0aa668b45efa9~rBihiVo470174001740eusmtip1T;
	Tue, 24 Nov 2026 15:54:06 +0000 (GMT)
From: Michal Wilczynski <m.wilczynski@samsung.com>
Date: Tue, 24 Nov 2026 16:52:41 +0100
Subject: [PATCH v8 05/18] dt-bindings: soc: starfive: Add
 starfive,jh7110-vout-syscon
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Message-Id: <20261124-jh7110-clean-send-v8-5-de92635dd857@samsung.com>
In-Reply-To: <20261124-jh7110-clean-send-v8-0-de92635dd857@samsung.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,  Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,  Robert Foss
	<rfoss@kernel.org>,  Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>,  Luca Ceresoli
	<luca.ceresoli@bootlin.com>,  Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>,  Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,  Philipp Zabel
	<p.zabel@pengutronix.de>,  Emil Renner Berthing <kernel@esmil.dk>,  Hal Feng
	<hal.feng@starfivetech.com>, Heiko Stuebner <heiko@sntech.de>,  Paul
	Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,  Albert Ou
	<aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,  Dominique
	Belhachemi <db@domibel.de>, Andy Yan <andyshrk@163.com>,  David Airlie
	<airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,  Yakir Yang
	<kuankuan.y@gmail.com>,  Dmitry Baryshkov
	<dmitry.baryshkov@oss.qualcomm.com>,  Michal Wilczynski
	<m.wilczynski@samsung.com>,  Conor Dooley <conor@kernel.org>, William Qiu
	<william.qiu@starfivetech.com>,  Xingyu Wu <xingyu.wu@starfivetech.com>,
	Sandy Huang <hjc@rock-chips.com>,  Manivannan Sadhasivam <mani@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-riscv@lists.infradead.org,  Marek
	Szyprowski <m.szyprowski@samsung.com>,  Maud Spierings
	<maud_spierings@murena.io>,  Graham Markall <hello@big-grey.co.uk>,  Icenowy
	Zheng <zhengxingda@iscas.ac.cn>,  Chaoyi Chen <chaoyi.chen@rock-chips.com>, 
	Joshua Peisach <jpeisach@ubuntu.com>,  =?utf-8?q?Uwe_Kleine-K=C3=B6nig?=
	<u.kleine-koenig@baylibre.com>,  Cristian Ciocaltea
	<cristian.ciocaltea@collabora.com>,  Krzysztof Kozlowski
	<krzysztof.kozlowski@oss.qualcomm.com>,  Conor Dooley
	<conor.dooley@microchip.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1209;
	i=m.wilczynski@samsung.com; h=from:subject:message-id;
	bh=Chyv4ZadRgB9O0cDMv2nCKKdOMuhURVPdmM716Hfnu4=;
	b=owGbwMvMwCGWumv6zndzRCIZT6slMWSzbhZVTree6Ct9QLaGcZ/ORd5VO7U3zL72zG9t+Cb/q
	o87/LU/dZSyMIhxMMiKKbKc3RhtJPmP4Wn58ce/YOawMoEMYeDiFICJNNQzMiyvu1Y1+f7KC4tK
	MwyUc756XdLduzlZS8/B5rxs4LqLvxoY/go2b734OtzymNOcE5U/dtvsCZOu//q4Qm42x8dvd34
	3GPEAAA==
X-Developer-Key: i=m.wilczynski@samsung.com; a=openpgp;
	fpr=CDB15B3219FE00E577C7E3FA65BA97B9EE9C1459
X-CMS-MailID: 20261124155408eucas1p205755e13b741cc44224d944e46575e28
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20261124155408eucas1p205755e13b741cc44224d944e46575e28
X-EPHeader: CA
X-CMS-RootMailID: 20261124155408eucas1p205755e13b741cc44224d944e46575e28
References: <20261124-jh7110-clean-send-v8-0-de92635dd857@samsung.com>
	<CGME20261124155408eucas1p205755e13b741cc44224d944e46575e28@eucas1p2.samsung.com>

The video output subsystem has its own system controller, documented as
dom_vout_syscon. Among other things it holds the mux that selects which
DC8200 output drives the HDMI transmitter, so the HDMI controller needs
to reach it.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
---
 .../devicetree/bindings/soc/starfive/starfive,jh7110-syscon.yaml         | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/soc/starfive/starfive,jh7110-syscon.yaml b/Documentation/devicetree/bindings/soc/starfive/starfive,jh7110-syscon.yaml
index 0039319e91fe6e6aadc4300114626348e4dfb7ce..cf9b657d0e8a3ed5c5688336fee4123e14a2ac58 100644
--- a/Documentation/devicetree/bindings/soc/starfive/starfive,jh7110-syscon.yaml
+++ b/Documentation/devicetree/bindings/soc/starfive/starfive,jh7110-syscon.yaml
@@ -24,6 +24,7 @@ properties:
           - enum:
               - starfive,jh7110-aon-syscon
               - starfive,jh7110-stg-syscon
+              - starfive,jh7110-vout-syscon
           - const: syscon
 
   reg:

-- 
2.34.1

