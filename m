Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD39E40314E
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 09:13:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782724419; cv=none; b=fUazxZwEACTncx3vCvBdxTvTZTyB2oGpBigUetMjd0HkH2O0TxijGj4QRS7Eez5dNF9Y1YEl3ZtOEDlGhYE7B9ZIPTkbsJ9qjNjehNBPjkVHr0mL856H7yZftUpOTMHq5+/Qxhgh9X8LJro5RdgLWwB7K9acV1+ow8NL+dxtMB4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782724419; c=relaxed/simple;
	bh=LAw6TP+//tnDWpTcxlgUU+E8OF1oyUbi54CbVTPa5rk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WIZ+IvDBBDWlGHYYNQJPygc2YtwQnTRP7kLFQ7m/ASfwxmaiCrL/O00eET/tvNL62zXUySNBPsvbDGCecHCmXhpQFOqC9hl912igtcErR8YKTexrpFQAPnGhfvWqdRpLwi9eDmS2CVfqgkvuY49VJdxHw3DQTCQFLQtBjnjrxdc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jwWIPkqU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Cqq+ka7U; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jwWIPkqU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Cqq+ka7U"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65T7Dnnx2188693
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 09:13:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NuAGmXhaYagKEsijNwanCl2DU/uS1mMyuthIapbtuKU=; b=jwWIPkqUfbIHUw4h
	qxXbw5MdhJ7tU5kAgvYT1xcyQD+B+MVZHIunycRmvl0cEsDfMzPPmmnNY48Ad3xm
	ZGBZEropJlIWYP5tX45jciHeyvSG9KJhhJdCEzNBBRNprWleIidgiUf2qq8ff8dM
	kvhFKuGq3RtjOnh643ig1kYJscniNaflHGpGwVuYOmU3POpqQ/6Tt9D9I0x/rHPE
	0CsoOG4YAVao7+vBDic3flhV9alXhJDUWz42OITy2PJgaGwlbFEXuC64Z7AFr701
	XmoIgFjrtmInhE93fUYcHj8QA6C6b4fqRcgqtRc1TCgMdtpu+5eZns7NlOENWCZQ
	MzmyZA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3m4trg6j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 09:13:37 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92e59b0e0f4so25617785a.1
        for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 02:13:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782724416; x=1783329216; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NuAGmXhaYagKEsijNwanCl2DU/uS1mMyuthIapbtuKU=;
        b=Cqq+ka7Upn4AhiR5HNykbkrom/cJmtU8oWBRDgIIZCi7wVNQae0DO815Do7EGw+6Up
         GK6ioFc5km7sRG+fwCTWS6QHc5n1iD5QR0Zs4C0E/VUQPPZTjySu5hL7J1g3eYqOAhFG
         c+jtcwkHoDzeiTL6EFkgsQ4HzsGXJ+KqR7RQGdBor+jw5YAn1L44EsovzY44gXueVdcP
         nAbXTLTQGDk5GtEyUXOt7GegfBxy4PKEvgCpSsOynFFTBW0zvi508k6M+3F7XKvhV59D
         RJirTzz/qmPykPTE6EJahqUSdokCEYQkRpH9jtzyFnV2QLyrSCxJh2ddo5w/e++wY/Fx
         L6sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782724416; x=1783329216;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=NuAGmXhaYagKEsijNwanCl2DU/uS1mMyuthIapbtuKU=;
        b=LdlXY7tG5LRBNSzzK7OhLy2zIyq0NZeU7jue0uaX8H3TuExoIOWW4ToJblj0N6z84m
         vhUs/l0heypfJaqgI32n7+LeczQD6oFS4//guadBiMUyynSJbv7hLNYI6JkA4z7pS5ve
         N91Fmj0AbShwlbKBWARP5yeDEh47WKg4dyQ0QExJRoMHf2EDxCDUJzLYxZpFdfb0Ql2p
         bkS7ofpvkToOH5Y4E5Ian/yKZhDDorg5ABaUrhQxGfh6ukiHiy2xYQcTX3hRaRbUnRIQ
         msiMPQduJYr7fJsVB3yFO8CiClh7YoVTemkgF1sgDq5h3Equ78JK2WRLXc3rO2Sc8YmU
         4xSw==
X-Forwarded-Encrypted: i=1; AFNElJ+0QgZT/b3AyTAiv9d8W+UGc5hPZ/oLcKSRrKe5+dl4Z56w40kWZNVtOgtUXqTz7/qUi58lBQM1uwiC@vger.kernel.org
X-Gm-Message-State: AOJu0YwUiUkC/TKZW9J7CjNu2Mi4Bmi2xy9jdMCEABQNNjJUqCm6Kjut
	AGvtuAVwUugxzKF6M4o4YQa4YURi3dziuN5YrdbB5chJLguvX5yqx1OnABEjtg7NdoYL3/e3SBV
	faW1w4dXbjkK90kubOX+BXzFunNqPIcwyxae/LklZAr7/p9v/fkxFL51QM9Cr0rjB
X-Gm-Gg: AfdE7cnt3Q1dOxUP68qbAn7dwuPo/RqU8lPM/fRz7QPlluJRbBmwGTjGCzlPiNXsksR
	qNJ7X+b56hyz1Ce1I8PMRdKkUFC05tmHycXmw3k9Z7rbcPUQspnBrrRGPqAsqDwm5Bqt1cCHt5n
	vb1DUOTvxxxPMDKBMji2hddyZe8aIVHupKXjLue50Q8cp+genTfpakzchvRrqfehaUlMxe9lnGu
	tkAIJDqV8TqDQju6/H0xY3SrBz5IzgrehN5jXl3BfF8odLseg+pSliRMerHzyjWibkLynxTaHYy
	pSlkxMuCbY74djuWZOZXv3puOUJI14CTVGvPlEnae0QLJvCw/PkcSx26FWJk9GfCe5T/lnUrrpV
	kibn9Kb2VDa1vBPcLvPWJXtp5VAoHcjJen2gCI7en
X-Received: by 2002:a05:620a:414c:b0:92e:51ee:7945 with SMTP id af79cd13be357-92e51ee8ae6mr323652585a.30.1782724415989;
        Mon, 29 Jun 2026 02:13:35 -0700 (PDT)
X-Received: by 2002:a05:620a:414c:b0:92e:51ee:7945 with SMTP id af79cd13be357-92e51ee8ae6mr323643585a.30.1782724415437;
        Mon, 29 Jun 2026 02:13:35 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:4640:d76a:6126:9b65])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-470f55acda0sm20109240f8f.23.2026.06.29.02.13.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 02:13:34 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 11:12:35 +0200
Subject: [PATCH v2 12/19] slimbus: qcom-ngd-ctrl: use
 platform_device_set_of_node()
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260629-pdev-fwnode-ref-v2-12-8abe2513f96e@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=914;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=LAw6TP+//tnDWpTcxlgUU+E8OF1oyUbi54CbVTPa5rk=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqQjcRvVGm0XjHzeekMWgCSmedmQdOuB32YFAod
 HQ6XNyVL0OJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCakI3EQAKCRAFnS7L/zaE
 wxVHEACqOwp3yO7AptcceX8k/naLnlKxs+wmgitoHHSTRNa8FE8HkJ7lYPPwAwc8lovQLX9q05Q
 6hcHOe4n4CZQbTxN15/qEZ87njRex4lLYPQZ0AuWZzlrx6rr4WQIRBarM875qSv95m5BL7AR3Du
 ENPTAKbTTX+n+C25UiY+ayBKtWsSGo+kpsjN3X3Z05TthGI8MH1cQqBtpCXwLDDDxk5ZJE+28wk
 Nxr04r/bKCTmFTKcAOLeZwe+n7OBQJiULX5aNGFND2NKf6gYXCLrX9uSvrOFKGgahmbtYUFZVrS
 aMQrMchr3DV0mRgFYqENcBrCgGeMZt6rZXDuQ2/lDEmpFrJ3JHsNtYzXygqcuHVQ31BjA2JQ+DH
 nrcD2BYjuGhGKUV7Wzayp9U1n/q6PJkAxKuVsOJx/jGmJeJsjfbNnyBY2f6dS7cDV583Hw7Z/tx
 6SzHZBOe8r5iHFsTvsP/CvjXUetP8B08c9s0WkwKNh5vrqHQt9jegjzDY6LZM8GsreGmq/SMB3e
 eED8xB8DcdpxLmveQkgTC7u5QBiF4N77Q3Uk9jZ9zLfJLSJF9y0iwK1d98Kp26FrAvtSsukjHkf
 /3kIw6Q5xTb/Yzc7/yv3Ccc1iUgJCOfnZ0rWZVZ+0ggxeXJ0kK2eg4UsUY7GtJTRNPzxT/PdftH
 otsBKzVctyCmwZQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDA3NCBTYWx0ZWRfX5exk19RG6VSE
 hGcbAgRcGkkthvaTHJ8aN1A6uIX6igI2y1E4Fo11d11DyvbZgeJB2IuRHKWtgY18Zwz7B+lJyK8
 GYumxqRSu4RkytOVjQsZ3ZfJwg0PEJDEz+os1knX3VT59gg8ymoJwYJJkeMYUr5sqPe2RYfujuv
 wVTnHjUBm558c+bL5FS+07l3ajHEAUhJoCswk7wikV7F4LQWA7SMrZZ/5RYeFZOfHUKiOQ/jAIP
 DRPo00y7nHgbnNKD3UR85VOCCelyAmFzcjLm/2hlKkN8k6iDLXYJNYfsJCZwmc3ivVvhQSnydSv
 4BNgBr8+95YQ/JiKjtDtKbTOvRV0y8c2/8K4htrbBpQh+lOmyoy+YIMxB1A2n+UoNh0zuohxMkn
 U5stRy7EDiJKmhnABzdquOcHRRAD0IG+jvcoaUAPZ5n107hlscdzP1dUUko4nPF1ClCXYNswlVq
 UNhbx9f+ZI85C1OueNw==
X-Authority-Analysis: v=2.4 cv=R58z39RX c=1 sm=1 tr=0 ts=6a423741 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=gD7B2NV2fXQl33RD-VUA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDA3NCBTYWx0ZWRfX6p7NUYpbmJnz
 PWQbhwc3zNS+Gq+Y6FPts8BAz5OkTWDo8ysbtLysALKQYqIEG8s9shAwEqNUmFEP8liiIczJeSK
 A4Nww6KYf3t/wx7QKSdFUT66vWw/qG4=
X-Proofpoint-ORIG-GUID: ukXDickN34NUe7d8_ho1SYzXqNuHFk6S
X-Proofpoint-GUID: ukXDickN34NUe7d8_ho1SYzXqNuHFk6S
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
 drivers/slimbus/qcom-ngd-ctrl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/slimbus/qcom-ngd-ctrl.c b/drivers/slimbus/qcom-ngd-ctrl.c
index 3071e46d03beaaae2321e858c564b512c22e820e..6e89415712ce1a7a7781af6bd0eaf0d6879da52b 100644
--- a/drivers/slimbus/qcom-ngd-ctrl.c
+++ b/drivers/slimbus/qcom-ngd-ctrl.c
@@ -1539,7 +1539,7 @@ static int of_qcom_slim_ngd_register(struct device *parent,
 			kfree(ngd);
 			return ret;
 		}
-		ngd->pdev->dev.of_node = of_node_get(node);
+		platform_device_set_of_node(ngd->pdev, node);
 		ctrl->ngd = ngd;
 
 		ret = platform_device_add(ngd->pdev);

-- 
2.47.3

