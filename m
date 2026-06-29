Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00225406807
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 09:13:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782724431; cv=none; b=WGAIclpYXMPLsJ0KqFM1VAtPrH5BeB5DwZOOpR/2LmiKRyGa2wQlDN8BfIssD2jlNht4DZqudDh7irs6mX1hB0PxVnAmy0ixtfYauUefUnsoDAZVQUxHToi2DiD4YQmmiXfCq9ThJgjU746qulwJdfrG3vVJ25e54GbEShl5t3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782724431; c=relaxed/simple;
	bh=Gc7zjQ8K3UGxrQUEA3l/ojyEpHz6CDAO+1N6mZySJcQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kyJXL+Y0QAAEzFjaWNdxIXqb1jxUrDT6Lt1A+HVAOTzON82cxd+Yy9fV6k1594nMOxqnOlOBfEOJ1cc/jPD8RxV3UIZhcJG9Qqa2EBsBvqKJPq2cMrae7fEOvkJUwxdcwRKEiRlYrPUwgHrAWfoFdwUJ/Tcg98RLVR365tBMtzE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ILn3fVqP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=h1QOO5RU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ILn3fVqP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="h1QOO5RU"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65T8xguI2431938
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 09:13:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WnFQ8s5FzTKwx99wZfiqcLQumGzbQMJ1Gb38TtDDzAY=; b=ILn3fVqPEftBrxbf
	hbNT1B+TKhtWUm4n09Np/mVZdX52QNbGzOkOo+0eCuwdMafnDDhXzksj3f78cul0
	/JY36CRdvCq7DG8+9RI4dY9xyaa0bHXKzOgr+J+EDeDNDbDeGF7ma1rd/EAdl1GD
	OGT7STFj1i6QUYlMe/S3UwMCCFfDRYDPAp9cAOjeTL2/eOng6YUxiYoz3Nj7nZWT
	FPeA7LGVmWsvDV9iwwmLYsN/JCob39gjGui/sLO/5Z7qsiYyIwcjcuDvF1IFzOOH
	DQSH2TmfU1TTjGR7LTzqSp2gGB2K6W+8y1hBWlI7lZl1knIzdIH6EN3AVKScHjPm
	JpOLIA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3nper281-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 09:13:49 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92e4f27f49bso110714485a.0
        for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 02:13:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782724428; x=1783329228; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WnFQ8s5FzTKwx99wZfiqcLQumGzbQMJ1Gb38TtDDzAY=;
        b=h1QOO5RU5AcJzNXZV4cbToa7d0wq62PG0PNb5jAvq+Zm55AwUHjGxtppDZok6wHcyK
         hugkBLbx4PVAm/a1HCwm9q4W0bsJi4ynZEFzuMe8wuzjw2rZS92aSd7vFoor50hkE2E2
         YSupMGYZb4fXYezR0B6OLA8XBiXmuAd1Fp0ezOtd2Jnic5MpNvdYyyuLokqLE8Ozrbg8
         OqPo0+rR39hoxQohlAqohhnWuDBEb9eYFXfcbvHNQfFp+eJcMC1n8yIWImEaOWqxdGA/
         vyWDIgOdrb4XeHwpJ+gUC2YhHiO6LtoOtmL6u3PcWoyLOm+zHOuv1ubKxD91Nrdwkpgi
         3C/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782724428; x=1783329228;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=WnFQ8s5FzTKwx99wZfiqcLQumGzbQMJ1Gb38TtDDzAY=;
        b=JznlDcGzkyzKXggUSHflBP+4HvpdGLIiCjv/Dt6NAMKK9lk48zLw+DATnRyqwh39e5
         5lqGFVd9gQvY3NegqmDvZ1jof4flD1w2gaafAj/pm2HGdyd/PwWk5OB6pXAEBYZSp8EU
         yAMSxJphMioeOPYKGlmN2MsbJaqCXquGfyL9Xo5q5U0cInjmzJeywuzuNIn4RYUHRZ+l
         2sNxOPH+/U0QBlKMaa4fNpp+AABrOZ9uigwWEcLVEfsSnUFPTMn/HucRFuKIUtxboob/
         fbdzVcBaaqsNsB53SMlA084Wpjik0ScptL9vaxRDAWptn6aGR0/OfhgItLG6bYrhXXYZ
         TROw==
X-Forwarded-Encrypted: i=1; AFNElJ/VJzcOzdgluz3xNUNAsrV8Z/BJFLU4dRCoka+rLatft2FHAt0YDFZH832qSI+I0fMgdCvUWTp8LHJZ@vger.kernel.org
X-Gm-Message-State: AOJu0Ywgn2IZfHpQ47sKanjDtyjlm+yCJRqCvU+58+dni3vfy2EYaTdP
	T2rPbixZPGN7D4o6U39Tnn7H/792PXsbzOjTwne6zY+LrH/+8CwvRe41oPMFZ78DLlNnkfjGDLC
	iLFxHf9iI0vmjanPoTFcja7iVPNcPPdIXFg+SIG/NQAts7mNJ4/bTt9nr1WMKwD4W
X-Gm-Gg: AfdE7clr6NBK1io3DHXSAInpuRmey1/YQqutAWEFzIjuqXxeXNk4yPOZEcBVqV9Ju4y
	VEad2nuQX5n19fw/fyjvzUCMnoEAe82SjKZ12LSpoRrUh35y3fZrjArcWQABXdX04Yy/0V3b4eP
	nTPFuaAlSTk31DokueEYApbUjY/bEHTc5K1aZlcSEe2cL31rore9KWwyqI0akQuq3saSisya4mn
	o4Msle/br5aEYGrT5k1wHvTC0tywuJEFS4ycd/5ihXM43CACj3ANKBGbM5eYt7YuTuy2PTIPCt2
	/3jW85FV4/PSusPP4m3hLDXITbGs36JmuGlmu2tWFRdQpBCuZjLjLniWpL90lqubsgkdW8WHm61
	WdFD6m7raGDLMoI2RyYKvrwY1TKSLdEbKUAvKJ2ty
X-Received: by 2002:a05:620a:4706:b0:92b:e0de:f193 with SMTP id af79cd13be357-92be0def3bemr1192767685a.67.1782724428326;
        Mon, 29 Jun 2026 02:13:48 -0700 (PDT)
X-Received: by 2002:a05:620a:4706:b0:92b:e0de:f193 with SMTP id af79cd13be357-92be0def3bemr1192756185a.67.1782724427424;
        Mon, 29 Jun 2026 02:13:47 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:4640:d76a:6126:9b65])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-470f55acda0sm20109240f8f.23.2026.06.29.02.13.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 02:13:46 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 11:12:39 +0200
Subject: [PATCH v2 16/19] usb: chipidea: use
 platform_device_set_of_node_from_dev()
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260629-pdev-fwnode-ref-v2-16-8abe2513f96e@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1039;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=Gc7zjQ8K3UGxrQUEA3l/ojyEpHz6CDAO+1N6mZySJcQ=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqQjcUYFPkmtYlqYBD6pOfruG0HB4agBQdjermW
 D2CaNY48aGJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCakI3FAAKCRAFnS7L/zaE
 w/FjD/0eAzv7lZsLEu+8uN0Gf3x0hmYmNZU+OfT/4weEInEM7TeSQbiN3pgMmvlj80CdY5Q1REQ
 Ex6iSujlHMMD9tcNl3V1BIGs++Pz9dpmj9n+5Fo6INo9YQJfeP3ZfbkkBda+3M0CX+RGmcKChG8
 npDT3s5jcIu0Be9TRlphsuhpjCXJsDBvuxhc7eqwWardj4eSth/HNLkbKfY+ju7Y4qsoHepyAeA
 p5m2K9399ZE5HTJlwCOfwYlVlQo4sJnEl0Afhqsr7b7DkrqCZrOpi6NGsFj6JDD9aokHMeUDntu
 c/1zSjRLx2hKPgU5Q96bRQysWGped1vtY1grnPhifgdnp/jvqRcbEXVYhxZPj5FACP8Gr1ReNWv
 BpTxLfHoW/M79AyNPhdGX+jVcNrzPaGm5sVhrOGIPEpAo42H+MVA3DDdBup4FrH+i3sUIEPEYps
 GV0P5A9CKpLx5K3dIcWMsBn9ZrBorNi/XqU3JgfGBbpcv9xeJvBGCy38l/PMAS4/9u9zgVTV//y
 yQGP8iFBOxoQxugRDNREkWEdHcUi+LdcjWnXvBgZnXMSiqiK1AwLZjKp8YOnvUwQkbEcuCaAePv
 C4sElo1miGCgWPCtW3XInxjubqn+p2OX/c89FWORM3XSJYRsDCJH3OXSvb1aktZuC3a6q7x0S2z
 I06GT6zphKjJr7A==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDA3NCBTYWx0ZWRfX6Gak/rRHaJQ/
 xucqbt7FpBLIRt7DZzdxaQ0hA1JXv0C+5og8TT1sgCLFeOHCevSDl1pw4Y4gtRH6S6TdHScps3/
 03Aayu1IgILTKLzbMwb+uJfVmiXPQW9ofsfTvpVieUqPFBBcHalTDuhxhT7J5R3B/jCEl8ZtHe8
 9R5G23gxbW0+FgHDtumDNsfgTC4GNhY+mRaE8+2ekDYVHrSEiZjHUGNQNJHASwi5d6VUPMgXL6b
 PFaAkCA7UVtwcKgtDfwB3/vbes09u0f/PtykMB0Rd3fpnHHiMfY1AnJwsEy7jm90lkj7+bU07PA
 vi6rdpnKdYeQpgGsBB1IXIMErvhWqYNSRGVnFN5lUScDpBY5Ww314vu8bDiHsOUKTkZQl4WHOd/
 f5yNaK4aYztN6khIh1vzEYr1bFGDooavfqahDcXXYRZdOlV0wZDHXoRj35W4EfUMMdFiC2HNyk0
 PvACMjgh1EE3TN57YEQ==
X-Proofpoint-ORIG-GUID: BJM78geL9kSJSXljkqG7SM8gG2Frbksb
X-Authority-Analysis: v=2.4 cv=T6q8ifKQ c=1 sm=1 tr=0 ts=6a42374d cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=kq0kPlqncbyAjjsh9XUA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDA3NCBTYWx0ZWRfX2OM1bPhhqaKD
 Z0RghwMGgXBj3SQvLoZcL2wqIltp7yD7UAgcpe7uYKFYaxp+HRrUui25IAV9ChuTBwKyIxcAqBh
 uuobV6biCuF+DwnXumNhAmZK64svIW4=
X-Proofpoint-GUID: BJM78geL9kSJSXljkqG7SM8gG2Frbksb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 suspectscore=0 clxscore=1015 adultscore=0
 lowpriorityscore=0 malwarescore=0 impostorscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290074

Ahead of reworking the reference counting logic for platform devices,
encapsulate the assignment of the OF node from another device for
dynamically allocated platform devices with the provided helper.

Acked-by: Peter Chen <peter.chen@kernel.org>
Link: https://lore.kernel.org/r/20211215225646.1997946-1-robh@kernel.org
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/usb/chipidea/core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/chipidea/core.c b/drivers/usb/chipidea/core.c
index 07563be0013f4d28ed6318a0751670ccef01d0a5..7edc512cc37dc24551efe5fca172777a0a4b0766 100644
--- a/drivers/usb/chipidea/core.c
+++ b/drivers/usb/chipidea/core.c
@@ -879,7 +879,7 @@ struct platform_device *ci_hdrc_add_device(struct device *dev,
 	}
 
 	pdev->dev.parent = dev;
-	device_set_of_node_from_dev(&pdev->dev, dev);
+	platform_device_set_of_node_from_dev(pdev, dev);
 
 	ret = platform_device_add_resources(pdev, res, nres);
 	if (ret)

-- 
2.47.3

