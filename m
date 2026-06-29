Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 963FE400E0F
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 09:13:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782724413; cv=none; b=dV3EtlXOpetpHvPREIEhAh8RQWB/3CKNCSikYBO9AU75izX/Xkn38yGQR7z1kPYzqtyq71FbDm9B2Mizn2kyPfilQqtLcnXV63SR5LhMYYEp0jdkx0r8T9bF9bQnjhd8Lxv3bOJm7l2xd/sFrdj9ur0WZWbexEaa7hrlVkgLvN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782724413; c=relaxed/simple;
	bh=1m0AW2cExEyKezaoaqpg9M8Sd9W7xIah4eoQaNoNaio=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kHxBfq+AXC98EaDfVHzDoR8TsGFvPm+ca3L2OIwcLIIiQyGmTuindSXdRb7Jbxm0UvkEhSeW1+x5iTNqAmZsE1gTXFET5bM/o+6Cs2dKGx++h1poq8khMMCdOn0wN/FLt0ojy4lOVihz1BHD/6yOd6qo09R8C8CbzmtusRNbyvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YLrjbRzb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OrCGBDAB; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YLrjbRzb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OrCGBDAB"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65T7Dqt62188726
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 09:13:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LiqGJIubV46C/XuNtoDonnq8kzRgQ9Nd2r1gbru07SI=; b=YLrjbRzbBYmFp1KH
	Y2HoZaQbXuGUJvkgTgwOWjtrK9pG9fm3ZuYyicnUF2+5HPB7TscPcag8+n/Xhz5y
	BNojp5k9tclKQ8iF4yUsL34rdrR55sY/ddoFwlEO04saIGrqP9FInTNVnYC3ai+Y
	FE9VgvTn59oOumkLnuvTlpqgSa4/BqV5s7Ec2U1WqL/WSYxX9DQp+tz4URhyC+7o
	NOUNOwgdBb00bTIydhR0xFyvvop0WA++tA67XRWREQeXNWtFULQg47nRtY+0eeVx
	CCweYiv0RHwkM2cKfHAFOgElT44BugsDsURIPYs8OYxNux1HGSPUDuwuN7SfwBjv
	spxv2Q==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3m4trg57-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 09:13:30 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92ac0a54110so485545485a.2
        for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 02:13:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782724410; x=1783329210; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LiqGJIubV46C/XuNtoDonnq8kzRgQ9Nd2r1gbru07SI=;
        b=OrCGBDABlhlPX6/pCl8UebdaoNNWvnxyPPVTr/114ES7T+BbZlricIGhwTxp/zOpoD
         DyS+kv0y+v+NBcaK11XWSaZ5umpX3AgI7D+JmK1vQ7NNJQyI9Yf2UvjnCfL8Zcy6pTPd
         FM9luhp7DCQYefqlO8zxiEAKtsdzgqs5X12mGDxqQ+4PZ72WD/P3ZDOYXkd3TRp5Vjue
         Ceh3IlPYUSx3wXj5kMXW9jwXgT6ZYNqNctu1I5IVeZrQHZUwsXXGTLtvuWWzhn9zfSql
         t+/JQ1CMuUlhdqWLEtI+1V/j18HvvQvbvV8mdMwYusj+Z1oQBzsz39PGjxhnpXiEx980
         ukmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782724410; x=1783329210;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=LiqGJIubV46C/XuNtoDonnq8kzRgQ9Nd2r1gbru07SI=;
        b=Eo5SbS5C8eDOYqzAqTCLzzDv7C2DKTDIqk3bxaidxGa38vaEO2fsx268IhHuHh/S3X
         geD+UYpgrJNlQISLozrl3V7dvxpKhKWfTUEsuvkX2n+gZcilvdtCmW2pb3dj9PTVUW13
         Rqsx8ISA3vkrBJVzOGlAmosQtpUYo13rWYd2zmR8DE3JLFcwWvmZgCdJP4fZw9yUS3IM
         CYCzW7rE6SBfEo3Vg7Mc6PnKUlPMPMjAq8X/hTdr5QCuJK39cpmtrD5rxuaZ8KrLaECJ
         WgYUhaVPZMqh/vihQDFh8VvIDBnhgTOFhm37VQ5fZg7EkLM5dxb8BlmUoz8j1XnpC74X
         qjCA==
X-Forwarded-Encrypted: i=1; AFNElJ/zvZ+zyXL55rQUtF5TfZkvf5wVkB2kbbQBkWvBgwQf3CXuiFwslfnfOiA2EI1VB8I6xnPKLWD0rtec@vger.kernel.org
X-Gm-Message-State: AOJu0YzltcirdPhDVfBaVA+e80iwF2C8e0h8zrs2z+YkYZEti4SU4jJq
	29TkLurMUidlE0wtuyH+/kiaF0USCkdXK3ebz44vxdezkyHNqabGfQb2sFpZzviLU48yMuNRVNE
	k20NhO6Wvi9XJY7LY6phVg6qCbuDMowOomVCeBJFm4lC7KKp59NDHjogiog8b4ht8DRYnpYw4m6
	o=
X-Gm-Gg: AfdE7cmK+EYNnMI2NMftXNyalgJHArCDzHRPXFhN/F8qN0sTaI6MkV2Ervu1zITOAxu
	36l1fZM+AyuxY+W1dKfX7yRN7x+jJtVyLtwQL2tyo2nbBCo5Qh6BAgRyVlhxLTzA1NWWW+fTrT/
	IJbVyBpq/Sfec40Ma1DG2X6t4VlbQGSDdnUzLu6iSwBz+mA+eOqcMQ7BvK9MbAEw0FMvunTSf1e
	/wagUkWySEetZpLzBdqcMIwIUCO9ahfbaX1WzcYoCVuJK124HIH3mehJEvIrEGPJWA/cJKwTIoa
	kL4oUGpxybylxnZ4N/v9fqQSQHChsSLFe/qhpnqkb79QaNlpP6/8LBAsX5zfkjQtHwoF+d9Sckg
	hSGlz1bM3EvN00cG3w3dxgAeY6OlHESyN5Hs/6Zyc
X-Received: by 2002:a05:620a:44c1:b0:92e:54ad:3d9e with SMTP id af79cd13be357-92e54ad40a8mr234378285a.67.1782724409681;
        Mon, 29 Jun 2026 02:13:29 -0700 (PDT)
X-Received: by 2002:a05:620a:44c1:b0:92e:54ad:3d9e with SMTP id af79cd13be357-92e54ad40a8mr234374485a.67.1782724409249;
        Mon, 29 Jun 2026 02:13:29 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:4640:d76a:6126:9b65])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-470f55acda0sm20109240f8f.23.2026.06.29.02.13.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 02:13:28 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 11:12:33 +0200
Subject: [PATCH v2 10/19] pmdomain: imx: use platform_device_set_of_node()
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260629-pdev-fwnode-ref-v2-10-8abe2513f96e@oss.qualcomm.com>
References: <20260629-pdev-fwnode-ref-v2-0-8abe2513f96e@oss.qualcomm.com>
In-Reply-To: <20260629-pdev-fwnode-ref-v2-0-8abe2513f96e@oss.qualcomm.com>
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
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=965;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=1m0AW2cExEyKezaoaqpg9M8Sd9W7xIah4eoQaNoNaio=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqQjcQyzurssOLyeyJpbZ44XjlA13nVoOMp4FKq
 5FZ7f2+wTeJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCakI3EAAKCRAFnS7L/zaE
 wyWrEACG2jfBFV4TvBfRwgewJrn4MxZY9WNutkVnrkExL+M7S0eJJfGkP3U/Ukk/dDuUejoAZPq
 Sb8SC82gQT++7Px/b+D/TRPwIKXTnW6UmQ8FAi2TIsKTxV7Y0BFWyq3LmTfXizbM2/WWieYNGfj
 q1obXEmNP6PgwvgxLOWFzKk3aQnyMP45KHCH04+Azw3h80o389TeYER396jSTd6J8D1Z0iVTlfM
 kspWO9GmIoBe6xg1eZ7BSif8azWOyC3XZYrMHyM0N2/xr3DOSNw4jR6WbM1ly0g/TOJQyqyZ/bZ
 XK0kk6MV4xzK9uCp1fdLBufhgIo3HnLUprQPj3ypXUDqTXs53DWtHvSaIOPUqBe/e7pyGvPnoBG
 LBo3Z8Ms6GvyC6woMBczrgA1VOaN7rVQmzMhcWTOZy/K7ejTa/fQbduwysKFk8LAjCDSmjrBuad
 dcUiN6hnJHjImb37ruwv+NawTfliRSl2eEIP2fZfY1xjR5bUyjLzDtU5XDwyLvj7po8px8TWAJ1
 1PG5K7rrfKL9XK/lYkC1XTBtvco7sTwy02oSD2cg+YQOUecFEzGzFZTD26WnyMafToduI/mIs1d
 0X5Y/9B8j/BEfdQKBcEanz8PzvHy0mc0uYTjL3aycjoL6wAeXuh4BC/cNLOIJu0l6wQBFFLC7fC
 yDjtPW4DVmx/sYg==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDA3NCBTYWx0ZWRfXzcsQlhKjXdHw
 s9bn8OJprD1HMeaNjCt9vwvRL6yfS5jDZYdtwq49+6LCy2ij+vOSCD9i1F/gdojzm75mTm+E3bN
 VB3vOprMhcNzdd9qGaKcjZSe9o//Szii9wlh+6SBweJGmsiE5CSniXL2CZFwQiliQS7jSsmtXup
 0dKvxDpNmeuRyvN7Gv/YZojeFneieRx/qZOrQ1BDunHq3djcLISw9iUmrDW5AyIRgqnMJLEPNAd
 sWFuPJMWNaJuaLg21zU+Cs2dxSl+mR/RcJJMAEoq2HxLCoeIAxxtl2ZctPtLPPxmV6VN3u1KIJr
 yW2poxr4UCMPK44uI+/C+lC2PB8+aRN9fz3NUafqbE1mQaONeVh32XGrBqiJtPOkfH5gvOmc3kQ
 8SBIKRI16I2Jt/WO9Mv4ZKgCnq1dMVRIhHcDcn3I9Aupo5wy19fGoI5ypRQd7ll9Sl/8VFbYdKm
 kaDFsxQxcLhN4YL8eJw==
X-Authority-Analysis: v=2.4 cv=R58z39RX c=1 sm=1 tr=0 ts=6a42373a cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=J9-S39C9qTGxOfEZqScA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDA3NCBTYWx0ZWRfX6YZ0p7eq11Yk
 AXIeXPtvXopmaqjwOyg4RvzWfldyUZk2MZARrTPIMavtex+V5iIDePIraSc87KORYySxYy3V11k
 35thv4/p8nB1jsdt8zTw1vnnKuT+MZw=
X-Proofpoint-ORIG-GUID: QDH_Z2eiPOH1a3Z6eRX43MxTLAzxkHHk
X-Proofpoint-GUID: QDH_Z2eiPOH1a3Z6eRX43MxTLAzxkHHk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 suspectscore=0 phishscore=0 clxscore=1015
 adultscore=0 malwarescore=0 priorityscore=1501 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290074

Ahead of reworking the reference counting logic for platform devices,
encapsulate the assignment of the OF node for dynamically allocated
platform devices with the provided helper.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/pmdomain/imx/gpc.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/pmdomain/imx/gpc.c b/drivers/pmdomain/imx/gpc.c
index 42e50c9b4fb9ffb96a20a462d4eb5168942a893c..abca5f449a226fbae4213926e1395c413160c950 100644
--- a/drivers/pmdomain/imx/gpc.c
+++ b/drivers/pmdomain/imx/gpc.c
@@ -487,8 +487,7 @@ static int imx_gpc_probe(struct platform_device *pdev)
 			domain->ipg_rate_mhz = ipg_rate_mhz;
 
 			pd_pdev->dev.parent = &pdev->dev;
-			pd_pdev->dev.of_node = of_node_get(np);
-			pd_pdev->dev.fwnode = of_fwnode_handle(np);
+			platform_device_set_of_node(pd_pdev, np);
 
 			ret = platform_device_add(pd_pdev);
 			if (ret) {

-- 
2.47.3

