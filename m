Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A0084DA544
	for <devicetree@vger.kernel.org>; Mon,  6 Jul 2026 12:45:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783341953; cv=none; b=ZhANfFTga+HMn6HtBRwGwB+AtXEh7QTUtKp57eGl/ExGjQsJcsTe/HzOS5eh+mJpKTEaKl9zv8kf3OFLyrBNMcFjQkeIdPZ7am5r2mRk2rBa7zmWyeclfmYrMLW67/sMcUzAm1QADmL/0XFixaIwNCUHxVMFBXW+hVpl3wRz9QM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783341953; c=relaxed/simple;
	bh=XyyiviFbpKDvWYZ20ZXbahVi66ptZuiXaKVx5fy/wOE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uiEJ0eIJhWTmCtIr776dpIpj7MJbMdt7t3cHo4BIBZ/wcAkvPhltu6LoEJo86Qo8njq5Da3C1e2K1o532KmNmRT6oenU3fnWMRJZZeKgihM+cZ4vysyOtP3ZvLeZAHpBhK9tWNLh/tKjU2dstN0KrEXWar/xNvyHUlIRpNCvOds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cAHAxf1K; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JyUZAoVJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cAHAxf1K";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JyUZAoVJ"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666AxTEl367424
	for <devicetree@vger.kernel.org>; Mon, 6 Jul 2026 12:45:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/bw1TBf3fi+dzITRL6JxlDKqLulHveM6zognFCNzexM=; b=cAHAxf1KaFEH1dEa
	Zhonjd8lqW6rXiguep/wVXHJv97/js8xqR9yyptCdQVInJaPAnBHvZoEKVIGZG/E
	qgSF+FHGlGvU6aovk1R/J/uA0v2CPgen+Z9mAC3t8u33m12/GLMnDgxlwg3pE/nH
	zqY6fTyIULWXeaL6LLn37EhcKQ1K6A+edqKbz+9tIvAfqE02EV14oNcNACqTDRi2
	TM5LzVGESUu+nlBifs0+XJ++JRYAw5ohDvpImiOvmBdIDVK3k0geXaXXB8IvY8Vl
	pDe267XI9IoHGh6Y9KN2BD5bpYAi21o0zNNM7dzMsgizVN/2D2h5RThVAqtgzAKR
	eGj1ZQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f891urwk5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 12:45:45 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92e52306621so213691085a.1
        for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 05:45:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783341945; x=1783946745; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/bw1TBf3fi+dzITRL6JxlDKqLulHveM6zognFCNzexM=;
        b=JyUZAoVJDZEKyPegjtos3uI4mO6qZFGhvMNjx+EnhMaDwQ25lHNlNYaFcMF/BT25k+
         K7PHL0DVSrFwOZwjRXtL3ZQqMFBY14/G1fQUHlPRmSJ4CzW6ujul2yMZAJUPHaHG2dPc
         pGalX4RTBKUCQnesZ4Syh50PxD/wxSh4EDhPGx/f8mX/MrNuG6IDa+glEPlaXlc1rdzU
         Wr/204PzkaunzKOm3hTOpeIXFsGDvGtvLXVmHZYpaPe3mdIlyql0R2HiMwgBkWyVpUO4
         /ZGjkOREp1v4kpCQs4TQkYDF8KDP0hx5pWIEn14gMF5qC6UgGWJKWn32c+5heHL8G750
         N6VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783341945; x=1783946745;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/bw1TBf3fi+dzITRL6JxlDKqLulHveM6zognFCNzexM=;
        b=qayXGKoBOJ2+tKaIMq+WRtNnBTP8tswGYRmCDkBv6Iz7jSBbbFIvv/chEoNC8YawBn
         kwzfisVLzhZ351QXdkKYxWx6GmwdC8KnO737y9AIcMfGE0tcgDWoos97DjfbHxfe+AeV
         0NdgfczqotxvDbdRB/SRoH4zWo1Yk9sVPrFTLzB7lCJ7CXHJ076o1C57yLjDWjPQPR5u
         eJjfviFCLkBfx9O80nhb999XZBGkQ2CNf4zq+nDvuQ51PHidGXoHUCGNtSan+gR6Lktx
         rG/hUZpp+xnfcsbebRyT2qbVs3u/dpAjw4cjimqbbdoL85PG0x/l7PmZd7Y/zw2x3rWv
         qL3g==
X-Forwarded-Encrypted: i=1; AHgh+Rog6/+AuY0O20x0NerqZNdqSPnZouzYr9MpV485o77c5xcW9+6+v13KY0vUTbywNdcltUtnhaENJEHZ@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1YTPj5fabf0Ed67AMq1p9DRqKOGVuP0aZowQJJplgNYieAf4K
	gQC1r82sbdN4tcROXMqtbptd+e7LMI/78YFKSDIA+GaSxt+WEtts7hQVw6esuTztvqOO/t5INmU
	ZjWQD0Z4fZFzcTud/3Xs6olTLzag6D9wRtGW5Iia3dxpxHnPhgWv3F5AKgfm6ABcb
X-Gm-Gg: AfdE7ck07ccSr5WSzIkwWAnV/wkI8w0rGtOH5+kunLSiUABmkCIi84m02JdCbK16AUc
	eO5QU2mg4VD7mRS7HVSDBWozp/nup6Iwo3ndFmU3O5dJ6fm3c4WbRAvdU6EcBbhfVOjimvfQ2BO
	F9DPKRxoFAxWOZPsFCLTRVZA0AXusWl4lqCZZAZMOocHbGWW1TMZJHSiU25NyF6Hi13GFMT0kIL
	fek6KikCbLB0hUZGgcH8yyKz4SOuhQ8ZTvTzqIXCFoVkuIban+l1f0mF7tIqmmyblghoqyW5bGm
	PRVAvQ5TfxaUnZSVP/kfDecko0ZR91FkDdrKYhM8XckhLP2HhyYHOtEz2CJ1qAVXbdD5/9YrRyv
	g3X61XSq6qBfzJ19WkR1s6MgNaplHDE1lYM0SK+AH
X-Received: by 2002:a05:620a:1a19:b0:92b:7420:bd5c with SMTP id af79cd13be357-92ebb49abf2mr55498185a.5.1783341944977;
        Mon, 06 Jul 2026 05:45:44 -0700 (PDT)
X-Received: by 2002:a05:620a:1a19:b0:92b:7420:bd5c with SMTP id af79cd13be357-92ebb49abf2mr55493985a.5.1783341944411;
        Mon, 06 Jul 2026 05:45:44 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:86f0:c42b:ef4c:d3bb])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa0a55be4sm22126539f8f.31.2026.07.06.05.45.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 05:45:43 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 06 Jul 2026 14:44:30 +0200
Subject: [PATCH v3 18/20] usb: musb: use
 platform_device_set_of_node_from_dev()
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260706-pdev-fwnode-ref-v3-18-1ff028e33779@oss.qualcomm.com>
References: <20260706-pdev-fwnode-ref-v3-0-1ff028e33779@oss.qualcomm.com>
In-Reply-To: <20260706-pdev-fwnode-ref-v3-0-1ff028e33779@oss.qualcomm.com>
To: Lee Jones <lee@kernel.org>,
        Mark Brown <broonie@opensource.wolfsonmicro.com>,
        Thierry Reding <thierry.reding@avionic-design.de>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Vinod Koul <vkoul@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>, Rob Herring <robh@kernel.org>,
        Saravana Kannan <saravanak@kernel.org>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
        Andi Shyti <andi.shyti@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Doug Berger <opendmb@gmail.com>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
        Ulf Hansson <ulfh@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Matthew Brost <matthew.brost@intel.com>,
        =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Peter Chen <peter.chen@kernel.org>,
        Paul Cercueil <paul@crapouillou.net>, Bin Liu <b-liu@ti.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        Hans de Goede <hansg@kernel.org>,
        =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: brgl@kernel.org, linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        driver-core@lists.linux.dev, devicetree@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, linux-i2c@vger.kernel.org,
        iommu@lists.linux.dev, linux-pm@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, intel-xe@lists.freedesktop.org,
        dri-devel@lists.freedesktop.org, linux-usb@vger.kernel.org,
        linux-mips@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        mfd@lists.linux.dev,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1042;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=XyyiviFbpKDvWYZ20ZXbahVi66ptZuiXaKVx5fy/wOE=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqS6M8unH/9uMVuERAbDU7JQgdVNpF477whb/qV
 h2sU1vkV0eJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCakujPAAKCRAFnS7L/zaE
 w3ASD/917v/2dp9sMu0sQ8gKP5j4d3vmNIIb1xOTgzEHqv0OsHo3Lb9hyL7cLuo7aJkCdKEhLC+
 tyJ8mOcyTKIzMIjnNz7P46mrgIH/Ez2a8MsJaJNtUn2vm/TdGDsp6oD0Z27+aqXvIIBJ1x982k9
 tYW1zaY82nmZD4doBZESwvmet+CCcH4uFFNRXKjknczQUi4PR2ati7XYXfrvn2JAvTNfnOxiFXu
 +SrK4u+NByEBmygBJuoyXbcpqkhQ09hZTQeyT+0mwp4oX468xnNL3RXSyFpg3qy9EUoDtozrmej
 1/cpGxHdGtr++fX6VPEA7p4WO/hAcEgCd5MjXs2Yrc2PMwYDQivAniA5hYQofIrg5nZQKJmLY9F
 QNE9IhjwU2eo8lhVzgaG70/sH3LAdFOXIcZgF0m8xyobA/nfvsy2ZISzyb6muZr016il2N5Sk+r
 r5qk3BMaeykc+A5j6xoNzT5gz+bPiK3MPqOyAq6iir97S7ZSS+X/+jwqd7uHtBp2xLe7bxNAHQk
 N+3c/OzFA1YPhT67cX60BoP9wwOAw3IRlBD23N8m1G8nEzViIeMSygW12u1/EWimFokxYzbDni6
 pz5ci1zOxl74U6f0ojOB2Tsdx5nRwx125VBcJdikdRrs0oLWZAgJnw7SnYRMJAAW4u4FC5vZxEw
 bhsT20MM2rZ7M7w==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: RukYzsOBqbRQI0XcI0h3eQk96HkvxKEV
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDEyOSBTYWx0ZWRfXz0h/cLSTNYM+
 QeQ81wAQHTeVPAEhh5hxnjIuzciRYMNzCZxuX6C2/izp84spWvQuTp8kFS1xvKjRDXXQIgmqS41
 2jkYWlRPxQZannmCaLqHGaas6oAPQZc=
X-Authority-Analysis: v=2.4 cv=Mo1iLWae c=1 sm=1 tr=0 ts=6a4ba37a cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=QyXUC8HyAAAA:8
 a=EUspDBNiAAAA:8 a=ndL-XpQVcrS1Utx7N0IA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDEyOSBTYWx0ZWRfX7BbzAqiHlnBt
 RXt6fl8SO7uIdSJ5zZHx/Cdi39j+8xD0O50ZD8WIzjNQZEqPBSHZAZfVkl8fMkf5jVI+Yn4rxRx
 8ssl+3pH3Dob2C3zgDZjuMRby5JjK+Uy2tBcXivd7M/ReWrkCX28MebOX7Jq9geKUl4Ir47/wZM
 79AL/rGt+HQlVFDpZzu79rKZQrP+cl9lPvzmijce80jS2savQimXAuKCcKjngVgJMBbZRDdfUM+
 r8akA2KWB9KQiTV+NRKg/9rNNp6WaN87ngQz0vuc/VRc9SWunR8ZHaTVbKg7dhWxfX9tMl/zrn5
 ZMV2ME7YFwB1JVEuYu10zj0aMMSf8JfteaTjabw7iFI49R6jdOharux/S18tarobBHQjqErvnkl
 vz1aXzqqo25sHzCtAzFTDq5/o8Ray6EXKCT0OE4+1KZsYd11qdC4oIQ7ClIGUskEIoTdaH+vcDR
 Z5unjG/R4/XBYIM6KNw==
X-Proofpoint-ORIG-GUID: RukYzsOBqbRQI0XcI0h3eQk96HkvxKEV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_01,2026-07-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 bulkscore=0 adultscore=0 priorityscore=1501
 suspectscore=0 spamscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060129

Ahead of reworking the reference counting logic for platform devices,
encapsulate the assignment of the OF node from another device for
dynamically allocated platform devices with the provided helper.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/usb/musb/jz4740.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/musb/jz4740.c b/drivers/usb/musb/jz4740.c
index df56c972986f7c4f5174a227f35c7e1ac9afa7ca..c770ba576f05b6b672836753cd9b696b752d017a 100644
--- a/drivers/usb/musb/jz4740.c
+++ b/drivers/usb/musb/jz4740.c
@@ -273,7 +273,7 @@ static int jz4740_probe(struct platform_device *pdev)
 	musb->dev.parent		= dev;
 	musb->dev.dma_mask		= &musb->dev.coherent_dma_mask;
 	musb->dev.coherent_dma_mask	= DMA_BIT_MASK(32);
-	device_set_of_node_from_dev(&musb->dev, dev);
+	platform_device_set_of_node_from_dev(musb, dev);
 
 	glue->pdev			= musb;
 	glue->clk			= clk;

-- 
2.47.3

