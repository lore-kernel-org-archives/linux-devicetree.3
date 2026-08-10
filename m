Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22B2641F5ED
	for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 15:42:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786376554; cv=none; b=L744tFPbgaLU/AkGRPOiHDPrey8pLW0+L17Vs4vqyLDQcOZNAEadoe9S1VUdQWp5cOpLnmUqxsheDQsubhLG8aG0EYppFZeFxZ07/TMxHpqXvYOZ2IsG3tVsScqMzSqYx8CkXI8pr5pO/XiTCmWmD0m6nlIR6SBRCog+KajQNN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786376554; c=relaxed/simple;
	bh=R49ER/gxWRxFuxGE0BY6zWUSKOzrVJjau1n5zkgccSc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=foWEuXcCZv/CThjLx6Nj5SoU5X2HOdNsMGB3mYtP9gQwXHBYKEHdTOee43ljb4JsRtnEL/NXOXLV+bUnaNFPpZwwmQNJLtjLda2czuG8sPyXWhoPP6Tmh2aYfWtN2apFVsIwPLSbZttaT30SO20m6hdIrTtl52L/538dl2omHMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SLk9K5Ou; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZkfIpVIM; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SLk9K5Ou";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZkfIpVIM"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67AFWFok1754219
	for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 15:42:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	G023oLebHt08Iu7D2qcmQMAHLSYQBvIdenvFL+u+nwk=; b=SLk9K5OuBVnrUOZC
	rdbgp1eW96WQpkm8EMy01WP0jGIJm+UHURPbr8FxxjakPCIlNo7rrTkY1F70+ZUa
	TGl2nLUpCe5rlF3jhFVCWxIe0bMsTXSVq4J5QQ0VFp/HjbzZFvTJw0g6F8bxQVqy
	8tG77u7nhwjz2ClrDzQ1GD3G7miQAMxQ7K4Gv/CBsDD806au1cE+NLCPBl8zf++f
	embyyuGU4P6S8waNtkpgHUz2L5DE5ZEAFGdz0ZGoY8lSIpPmLTYEV1O9jwrDvAME
	P4Wz9Jvbow0YALM+8Bdz+sTJ56bTguzxmSV77o0rKEmyS3Z8tHvdZffYQdZSHE51
	vm0R/A==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fy8v4aaa1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 15:42:30 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51c0e702df8so28586961cf.2
        for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 08:42:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786376550; x=1786981350; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=G023oLebHt08Iu7D2qcmQMAHLSYQBvIdenvFL+u+nwk=;
        b=ZkfIpVIMbatjSH6SYa+mOwiBGyw28NxyoF0+ViUMFR3FAhThvnUj8D2KcJ/+AorZ36
         EaTnxiAd8QiVapDEPHdU6EywDrILDlGmyoNtdIdPc8nQRn8hSNZmH1Bg+UknjyOAWzmY
         FWTXgTjwWbXMuUJjgOFcykOMjBZSRTZ4iTtHQH/6kk1T/58j3xhgMi9c2XTzwuVtSwmw
         V8UFk4GJ1FlsPFIdv0DZj0zA5IHGWQKJKT2Ps5tGo0C7Y/17NIXmWMji87EW4xFR90sU
         hLqHoHrR/+PStJzFFG28Llm4p0XTTBBDTSv73g0NZTvrEuQNGwhdLwsdgRduCyRVo2pg
         rRNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786376550; x=1786981350;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=G023oLebHt08Iu7D2qcmQMAHLSYQBvIdenvFL+u+nwk=;
        b=WvqK4A+dWE5mtSV7tPOB8Y1ERUzofaS0t3Lz9n4MzwYdKMw8ovX8IBGZ4E8i09Fepa
         zVHTFP5v7HJ3ZnTBxaALd1D5iuT5ccVU4k5piR2Ty/6LIxO4AjsXw72j3Au2rnvhlEo7
         HfXtIy0cH2LjUzTFju5K1GQXjqB/DtJJQsBfvSbRYhdXVzGOwn6M46LFBfEv0TENBBhT
         r+nG1/f+5nP+NuxGI/pPtJaEzly+jlTnb+muYeFxCgybqkGX4hriE6sXWQcueRWY17YC
         ITpy3k8NaEfuitg/tiXXquVwOAxER4ucfjh5QYk0n2UnQDPdTN2ZjHyVVKXkZu/1j8vv
         racA==
X-Forwarded-Encrypted: i=1; AHgh+RoDNDWEKYdAQcXuy0drSv+uFJf9+crlUVxVyMFDeHU/7L7sz6JjOHFr1t13z7vJ/CdR+YpcJVoF1PIO@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4Ha7DEHMHeR/xDkj6VUnSY+y7mfUahpPP7/9h8pf32PK8X5uy
	qszM12aScr8gVgUQj9IxeenXtELj84Z9SSYeLfu1uMfZS5GiF+RJnFz88Z2aPM0uIEjC3VYPDoY
	9l2YmM2oKdlsDbBYPH+fkgg9ZrIZZcua7hUFTl+uhQpbkD9rj4vLsJO/Id7FPsezX
X-Gm-Gg: AR+sD10wfSzapvhbdRSkOH8pGbdWw2Fnp+TXyP+GW4caIeB5rFegFqdcGmsdZEnkUcN
	pob/crspdpp578wgOLbSd+KaUVF2zjoMMZPkB4zHInOMVF8Gj6toG2QxeoefYN38A5b6EBneTgB
	lKjdKr+WjiBlEdJR2A+fX2AKaO3FgkNqL7cdmI+6H9Xl+gyXhzUVB+yaplK28NyzN12y531YIzb
	TGAFrB+fZdCzkoIWi5BpdMsz8RuVGGXoxHRYz9/MBFsumM+s9UPCJV2pY/sDgBP2tIkFr4C4pud
	FSD9gAm/PTWZayCcY7wkItt3gNAEMSwjIeWweb0QYnIaq9XPRfZfjAyClzwlF1idyxzRyFC3iSJ
	RbBpws8xeQKd8wAGkQ4WAbEBCpoF/netsujP5A5+no/lm5dq4B9XRZB5TCEu/H6tUXZuj2JUOPr
	Gvy/xdH/zINgB1Pw==
X-Received: by 2002:a05:622a:228d:b0:516:d699:a99b with SMTP id d75a77b69052e-52ce61f545cmr485605361cf.40.1786376548377;
        Mon, 10 Aug 2026 08:42:28 -0700 (PDT)
X-Received: by 2002:a05:622a:228d:b0:516:d699:a99b with SMTP id d75a77b69052e-52ce61f545cmr485604671cf.40.1786376547907;
        Mon, 10 Aug 2026 08:42:27 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b3056f1bbdsm2071673e87.82.2026.08.10.08.42.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 08:42:26 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 10 Aug 2026 18:42:12 +0300
Subject: [PATCH 08/10] usb: chipidea: host: calibrate the PHY after
 starting the host
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260810-msm8974-usb-hsic-v1-8-e5f93ea76ffa@oss.qualcomm.com>
References: <20260810-msm8974-usb-hsic-v1-0-e5f93ea76ffa@oss.qualcomm.com>
In-Reply-To: <20260810-msm8974-usb-hsic-v1-0-e5f93ea76ffa@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Xu Yang <xu.yang_2@nxp.com>, Peng Fan <peng.fan@nxp.com>,
        Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Peter Chen <peter.chen@kernel.org>,
        Pavankumar Kondeti <quic_pkondeti@quicinc.com>,
        Stephen Boyd <stephen.boyd@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-phy@lists.infradead.org, Greg Kroah-Hartman <gregkh@suse.de>,
        Peter Chen <peter.chen@nxp.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1522;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=R49ER/gxWRxFuxGE0BY6zWUSKOzrVJjau1n5zkgccSc=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqefFRaxbm8F1hM5ExceXw17O2BVdmuXAN+50T5
 3dOXwsrWl+JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCannxUQAKCRCLPIo+Aiko
 1ZmYB/9S4PXJJai/uHxYRI7nxMrsVvpp2b+iA+rEMo9LCswUf7RBmFudNegJUuknF9U6NNGPSeR
 88vQVX4Hh2wdfwLgLhN0vi63hpMJGo7u01+G5ofvjwRYoVm8uYpuWe6H0sXvmPPdh7NzZ9LT/75
 A97e7bvPfBxLYnRTeiQB6SffN/11ZcKjZvp4n+S4kQhVQpPBEvc55rOKI0VBgkMefBU1Y1VJRYK
 ZMq/GD4B7GsNCYRBdj+HyIiK1cy/dInPM3ZpsHawE+k4q6U+9wMedJtl9supoeuGUycF0gc/fr6
 I8LeTJq97zdnsCZxJBKuUJDhkv9Ok/6frP+w+lcAYFd64Cu6
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: FFD6bD3lniQ1h7MLA5ETnDSMG-dfU8MZ
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEwMDEzNSBTYWx0ZWRfX2HQ/U8ZuzQRy
 a6W1+Ovxme3zGPwAUbrak/ah7eP7ypkXvcnp0UDAY0fuGuA0W7TYqLD6IzqUgi1m/SVRzZF5Q4C
 4VlpSkc2djiKZQ3EPfAmB/f7kHq1CZ4=
X-Authority-Analysis: v=2.4 cv=W5EIkxWk c=1 sm=1 tr=0 ts=6a79f166 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=eoJ_6RDj2L3Ezgz4JzAA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEwMDEzNSBTYWx0ZWRfX/sfLleUiM4sd
 rgRACdpPW4GEidTRKAeHPQCS7mIFKVBFs5vwd9OJvZaJ7CRZX0v70fQZXkYifABuKP/BpMs7CRB
 lIPUbh2k7kJIBT3cxJKLYb1BXmAkTVHkzScohcM0K/EdWNM4tHTX6eDQTG84ZBbLBQTsMFmNY0y
 AiYbu0aBPQYBBjzfcS5d5+vdlbSkFFmu7/oFB3ORJyCyQ97hy26J++WJnE6PF5G2l8a/PMvlAbJ
 c4AXaXuwakdMEG5ECvcOl2oDfD+8tGbBavkyMxiz8Ya9v0+in5/7s5mHzU9PVKHhkgxJEfXaEr1
 JGSOrtU4XxUFvD7eed7oZbpCL4uFNgXAMjkqGawaX66wVAQgoL90bDgQQk2dBqD17tMepaH7167
 kr9ofx+LXfs4g2J6OHSw2ubkxIx+WsO5y6WGBc6/7gST/GqPIocvGmvnwffP/02N1wRR8kQbhh7
 8EB8+XpCKcVdApsjPfw==
X-Proofpoint-GUID: FFD6bD3lniQ1h7MLA5ETnDSMG-dfU8MZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-10_03,2026-08-10_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0
 clxscore=1015 adultscore=0 bulkscore=0 spamscore=0 impostorscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608100135

Some PHYs need a final programming step after the host controller is
up: the Qualcomm HSIC PHY latches the device connect at the moment
HSIC mode is engaged, so that write must happen with the root port
already running, or an already-connected HSIC device (the strobe/data
lines have no hotplug) is never seen. The generic PHY framework
provides phy_calibrate() for exactly this kind of post-init fixup and
dwc3 already calls it; the chipidea host does not, leaving no place
for such PHY work.

Call phy_calibrate() once the HCD has been added, next to the existing
i.MX HSIC active-event hook which serves the same purpose. PHYs
without a calibrate op are unaffected.

Assisted-by: Claude:claude-fable-5
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/usb/chipidea/host.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/usb/chipidea/host.c b/drivers/usb/chipidea/host.c
index ced6076a8248..62bb2999edb6 100644
--- a/drivers/usb/chipidea/host.c
+++ b/drivers/usb/chipidea/host.c
@@ -15,6 +15,7 @@
 #include <linux/regulator/consumer.h>
 #include <linux/string_choices.h>
 #include <linux/pinctrl/consumer.h>
+#include <linux/phy/phy.h>
 
 #include "../host/ehci.h"
 
@@ -192,6 +193,9 @@ static int host_start(struct ci_hdrc *ci)
 			(ci->platdata->flags & CI_HDRC_IMX_IS_HSIC))
 			ci->platdata->notify_event
 				(ci, CI_HDRC_IMX_HSIC_ACTIVE_EVENT);
+
+		if (ci->phy)
+			phy_calibrate(ci->phy);
 	}
 
 	return ret;

-- 
2.47.3

