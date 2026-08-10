Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF870418A28
	for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 15:42:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786376547; cv=none; b=YiyWMs1y73C9f79Pk1KhZHG6b73NI+UmZF4GSx+z/Um07gYrWxOkZE9cZngnxk7Js4noTTXVfm0IdR4Q82XkcqaUk5gfA32jE0n8oIPVxXwYIaIC/58agJEMSmMv7+9swWTcPeUw6I1u864HuVMTOvWLRapKfMJNInDOzYC8yGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786376547; c=relaxed/simple;
	bh=zF09fnAjSPFGZsQfp4IpqRrDJjz7DPLi1N/LYmSBNLw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EebhLnCUpzzJV39jLll7sYH6C5MuMCgRO9CSfJKjoFUUJv2DwmrADIQhox6wahea0Xb/CRC72YQc1YNiCywGbUKXnA8PLwBhVbSnqDiAJ1eZ+Luhr7kLSyYTk83RJePqtWqjEYKHOneKW4Zc/XqkXOkfGt4Gz6M+NshQ+p0kDw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UOLHK9R4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hwKY4Snp; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UOLHK9R4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hwKY4Snp"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67AFWDjv3201353
	for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 15:42:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ykiz7/WLXu1Pqam7m96oprgwnXnPFLvlLQkcUT1pgeA=; b=UOLHK9R46ffmVQXv
	ZQwEq0a8ewE8eq3tOwO3f74Jy+opbpXLRpw0AfxuMocVObs4gccOCaHSC7B6KtW/
	Wu4wxcdUOPOLna37bl4kE36gdF5UyjLY5PMj7iT2oz68GvPmS0d+J3wz4QjujuZl
	KLCMRFs0OnwbyLeg1XSEnuIA21OO3dLet1Tc3BmgZGqN3Jm7LPh05V1Z0NbkLZWh
	I6Ku4DNJA07pPrUr179BdqnHp68BQwdIlvZtDxzmjQrhGuQiMoV8ynniqzX1pFaq
	j2KelKK4eBONxuHXtVIdgI6Ars/v8WGxfuu9gb5bIovsLeNt3M8y0vMPWyqUxrKe
	VF55QA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fy19kkbtb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 15:42:23 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5174a236220so18125391cf.3
        for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 08:42:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786376543; x=1786981343; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ykiz7/WLXu1Pqam7m96oprgwnXnPFLvlLQkcUT1pgeA=;
        b=hwKY4SnpEcbjpUHw8cvzeDnMsWgJAqXhMIfwzELZlKsTh/U1jWiEdMBB4CBA1dGwm9
         3q1ZNj4RCbeUt4f+aOy2R7FutuaMzjECOVcuXUzKXFGeCVPswkhhYreaHP5SKmS3y5Sp
         AQrFRTw577v6SmAapFhf8674qvvkOXyKWQJ241nMrdQhD6tv02mMiEaZbOLIy/AUvqvD
         90mGQKFRbcBqr3tufBPnOXOn9bgFdKiOMq1X9oWzVO3z3vX6GCK5oGKOP9QcXbWzYs1y
         0AvLd83x720C7woe9prSeu5rbfK69E4BmzQejvjFMDQOMLvpsDOFu7XKAf7vUl8UtFjG
         aECg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786376543; x=1786981343;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ykiz7/WLXu1Pqam7m96oprgwnXnPFLvlLQkcUT1pgeA=;
        b=S1hhbsMvI+fgHQ4bg55Q1ZKljokvt61m3/y6Cws6MkYkkq4jsVOddgpgP+6GPJEBrk
         aSySjcthJIoyf/+gVFpmDtuXGbiKoyavmx8AaATEvbFzreF9h1ckl3HS9ApjwyH4Rf3W
         qt6Aw7dsVeT4w0NHQoMkV18Qzo7k5zt7dSyG+QnyLTt5JkwEiMpVTeig55/gbMuTKNVk
         wCL4YGjOf8GWmDFtHfkwvKP0jSKrJAbLKiODbfgU0qJQiD/alEQAxNZx1fVi2gycovuy
         EPlwAXVT0gvpUbMFuv1+Lo7w+c3AR9xo3a9FOWnE6LQLfAOjxsGXZq3ORpQsYvMatfg3
         wnOg==
X-Forwarded-Encrypted: i=1; AHgh+RqhO1ZSGHu2P5DNcflyqGdkouKdW6tLzmgIgTyAnnWIJsaNxpYUzkhH6VLv59hNJTadeNkGAuWPZYo7@vger.kernel.org
X-Gm-Message-State: AOJu0YzncWLirxTwInGU9rbSvabYo0klbsl4SPIsTYuwCvZHzHfSdU86
	m+iv35/b8SVgxkCKwz7Xp0J4ZzbkVzW8BzTRv1SjEj2z4WeaaI+BR17GEdAXETy/DPTvf7aQOIe
	/1ATCWmSKW0/xJO6LBg+1D4Cup7lOtucVPX6YD81lCZw/DKSkUZHovm0AV9uw7Kib
X-Gm-Gg: AR+sD10kI+Lc+ow+VsIdv/nLeuB9pVH+U/pe2YuCWf/fsBI7PIua75NlaT60U2mKjBd
	zQkiW29ApK06YqQ2SavqzresZnfvi/uV69IQcZaAQ3YucfrexViwmU9mxJjiMmALQDigQR3xXZm
	IsF7KqLZNPrRDTAnL9g0MpLn0QCyzPtlCyw5RS8T/v9UEnFHuQfgaRbElXwG7AKwKGh1HPo8qmS
	KzAQRoGPVF9EeWxfrbTfj7Hhg5Epybs/cdcroHw1hfDHZ/I8zSObqybHOXRoVGdvVwWG+bzqRhb
	JIBOJ/i2ITCZEY4IlNLyX/yPO0z0DIEqchgyC2gHJNPLcglfKs0waEbSzSlLdPgCspb2KDLezbR
	nGvNfx3WmCB6Y7Kk1JB2rw382295TDEUmdk5qiL6cmZ9TycmCV88y6LGSjpIK2i7dskOCdwWG3r
	FkkoT+7sBhWNwEPw==
X-Received: by 2002:a05:622a:593:b0:51c:21d1:3852 with SMTP id d75a77b69052e-52ce5f63740mr455151961cf.5.1786376542538;
        Mon, 10 Aug 2026 08:42:22 -0700 (PDT)
X-Received: by 2002:a05:622a:593:b0:51c:21d1:3852 with SMTP id d75a77b69052e-52ce5f63740mr455151151cf.5.1786376542016;
        Mon, 10 Aug 2026 08:42:22 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b3056f1bbdsm2071673e87.82.2026.08.10.08.42.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 08:42:20 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 10 Aug 2026 18:42:09 +0300
Subject: [PATCH 05/10] usb: chipidea: msm: support the HSIC asynchronous
 wakeup interrupt
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260810-msm8974-usb-hsic-v1-5-e5f93ea76ffa@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2640;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=zF09fnAjSPFGZsQfp4IpqRrDJjz7DPLi1N/LYmSBNLw=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqefFQprX64U/4DCFpJiS14RtCBnDgkvwJpjJKW
 lTiyOQZ8kyJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCannxUAAKCRCLPIo+Aiko
 1W2AB/4guuqVz3+TvJnK5H8xdLnO5BEYGr+vZ7ygvrf0WZfuL4F1BLUJwTmRESF5lD/QlFQZemG
 IwfL5qsbQDRHMZhbNYcrgh1msxLpuSwmO+RCqWlG6mZbMiwHGCFfYq9Xa0TEoE9A7Cwi9x9KDD8
 Tm/0C1wFxNGJf8uCRkSsy5efA8Ijx5smouZxEsNmJrQJ8zyDQ4c/n5UwtyOTl8RG1NwpBV8z//t
 im+bU+E6xQeyEb9oMQ/BOjcG0xg8uOP4bXVCcn9B4pdveKZv3UN3yGCbHYbkK8frrxGdLmJDe8n
 t4bCyvugfQo97me6aPjdAhjJgTH8IhMsPP8mTtvXY4fZmCLL
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: SlipP3nF8cX6A5lUb_cn6PJvnoUhc0Lj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEwMDEzNSBTYWx0ZWRfX/Pf6Y9ClKFs0
 qSmENB2YVpnzOrfg9fw/fXODKgnfVOMC5x80QWuLUG/xS5Lxn0ADAPdVn4BZvGPhSnUTs37QcVf
 /Yha64GdNxkzAc+z9EpGVzv9yX6lgr4lAjOqlH8DGBX5wRzqu8hFxPLwT7kMpDbW5f6FQ6XUvxC
 g047Y6rt7DXK8z0CWwGUGrvVPZxLlcQOHo+Tgh0Cz5/KJ6f6oFBZMb3XMcXhNWO5roVETGNN9Il
 n86bv5yuWp5FwliAmomUuVP0JBFtt5pLenFMaoyO7EGjM2CUmeQleN1EW7iBcXpMojnqCaAy0YQ
 4bG7duT+wFXyfDa9mZ/SmvP0TlJbu/v1mNKE7nNDvV7OvGnX8u8IhCxvQThVaqW5jC6CQr7xZxX
 VZVfLc/Ox0jkQ+nyo7DUFXmNOLoEb9PH5NyHFo3Sc8Rk+JswXvtls32lf/k1THOTVoUrgY1XYXm
 GayIF5XVIJ/YgoQOqZQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEwMDEzNSBTYWx0ZWRfX82uIYm3K7rox
 BJj5adu8AqyM5kZMe2qN88jKHLjHjU1PcguReVEICil0AG5t6wVaTRYnfdytPTZHf7MBXWNPbOR
 s7BIW4Ns1VEyOKSADkiYWjlDHjcSo+M=
X-Proofpoint-GUID: SlipP3nF8cX6A5lUb_cn6PJvnoUhc0Lj
X-Authority-Analysis: v=2.4 cv=abxRWxot c=1 sm=1 tr=0 ts=6a79f15f cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=a4gATcTAGDG0ZWSRqCQA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-10_03,2026-08-10_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 malwarescore=0 suspectscore=0 impostorscore=0
 priorityscore=1501 spamscore=0 phishscore=0 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608100135

The HSIC instances of the chipidea controller runtime-suspend with
their clocks gated whenever the bus is empty. HSIC has no VBUS-style
connect detection: a device (such as an onboard hub coming out of
reset) signals a single connect event, and if the controller is
suspended at that moment the connect is never noticed and the device
never enumerates.

The hardware provides an asynchronous wakeup interrupt that fires on
HSIC bus activity while the controller is in low power mode. Pick it
up as an optional second interrupt and attach it as a dedicated wake
irq of the core device, so the PM core arms it over runtime suspend
and resumes the controller when the bus reports activity.

Assisted-by: Claude:claude-fable-5
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/usb/chipidea/ci_hdrc_msm.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/usb/chipidea/ci_hdrc_msm.c b/drivers/usb/chipidea/ci_hdrc_msm.c
index 3ab3daa78e34..e28ea87f9898 100644
--- a/drivers/usb/chipidea/ci_hdrc_msm.c
+++ b/drivers/usb/chipidea/ci_hdrc_msm.c
@@ -4,6 +4,7 @@
 #include <linux/module.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
+#include <linux/pm_wakeirq.h>
 #include <linux/usb/chipidea.h>
 #include <linux/clk.h>
 #include <linux/reset.h>
@@ -173,6 +174,7 @@ static int ci_hdrc_msm_probe(struct platform_device *pdev)
 {
 	struct ci_hdrc_msm *ci;
 	struct platform_device *plat_ci;
+	int wake_irq;
 	struct clk *clk;
 	struct reset_control *reset;
 	int ret;
@@ -261,6 +263,19 @@ static int ci_hdrc_msm_probe(struct platform_device *pdev)
 
 	ci->ci = plat_ci;
 
+	/*
+	 * The optional second interrupt is the asynchronous wakeup interrupt
+	 * of the HSIC instances: without it a bus connect arriving while the
+	 * runtime-suspended controller has its clocks gated is never seen.
+	 */
+	wake_irq = platform_get_irq_optional(pdev, 1);
+	if (wake_irq > 0) {
+		device_init_wakeup(&plat_ci->dev, true);
+		ret = dev_pm_set_dedicated_wake_irq(&plat_ci->dev, wake_irq);
+		if (ret)
+			dev_warn(&pdev->dev, "no wakeup interrupt: %d\n", ret);
+	}
+
 	pm_runtime_set_active(&pdev->dev);
 	pm_runtime_no_callbacks(&pdev->dev);
 	pm_runtime_enable(&pdev->dev);
@@ -279,6 +294,7 @@ static void ci_hdrc_msm_remove(struct platform_device *pdev)
 	struct ci_hdrc_msm *ci = platform_get_drvdata(pdev);
 
 	pm_runtime_disable(&pdev->dev);
+	dev_pm_clear_wake_irq(&ci->ci->dev);
 	ci_hdrc_remove_device(ci->ci);
 	clk_disable_unprepare(ci->iface_clk);
 	clk_disable_unprepare(ci->core_clk);

-- 
2.47.3

