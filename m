Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 169C5415F36
	for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 15:42:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786376549; cv=none; b=XS6ld2JM2w5ZVlEQQBTm8/7D26fdNV9yrxVzdVhnpp+7C8hXYsu2ZBTPGc+skCHOvSBzcDik8aeoSmmEoM7Z12Leb9XvmbCPz+KW8FwlHnXeU/EuhvyJPddH8Oh8qHMmLgUOgq0clW3TczV95m8VCH64DKtbcI98rp7mNlfRlkc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786376549; c=relaxed/simple;
	bh=W5fwrw87A/zYMZyvs0ZH/Ywonomd67B2W25bvL7eGxM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DrgAXvBSFufG/9qNDIsTPDHrBhTrK3kCpzssq2d6OcPPHpX0L/UFPmRF7wwyz0ypCrgB7WGqMFTyyjGqIPk8VfMT+urn29OCrtOl2C510faJ86+fluU0ht/Tmomezw5GioMdyol131ewNyStevuOgvd/s036kY3QuVpi5gbNkYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=c09Tmmx7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=c6ypL9TS; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="c09Tmmx7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="c6ypL9TS"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67AFWPjn2345013
	for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 15:42:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GCrGDHyDrQa95r9/bHjjtu86fmQgfeBAEBBhKsMFLXQ=; b=c09Tmmx752QBOxka
	QruGFk8j0cco/ou2TFU+r7Mm7vIHwXva7N1cvwsrPPeGtdPb2Zx4QX6jn/z+rRGe
	lmTJgrJ+BPzUYNHfzazialSmqEOsWI2pxPE9gzWPN/WH9+sY1kOxAbxUQAOYMX4f
	mJqcQ+HoEW5dfQYD79VOxrTrVIr03RvSOiv0Bk3E1NVGH0H3+UsU91aiGWqrZrY6
	h1bCL+top/z/VE7fmcWdhdeOf0WXZXjVTGfb8tNA1+epGVvZl8LXkwwHU3VoYrQl
	6YCUdBnITbwlKAFlklcM2nstm3hGhzxLqbzP/8DqfBVb3FiWpkout2iHX6b9rskC
	zyZ3vg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fy18xubx5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 15:42:25 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c083f1818so21752811cf.0
        for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 08:42:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786376545; x=1786981345; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GCrGDHyDrQa95r9/bHjjtu86fmQgfeBAEBBhKsMFLXQ=;
        b=c6ypL9TSg8zDFj27x7R2r415/Y5aFP3NdmYO03jZLRpPEkUCBTLVZRpVPKMVl5BXep
         Y+lgH/1bLruAb5JXW0SUgxDHBe2tjnN6IcWD527TMnJQPXNE9cZV3xtnSSESvd1g6jd0
         B9bnlHk8ndc+76C3yIREAhkh0O2Tm8u7rPkJXVIbnX+5+ROO/ExJIe9abld23C+6Kqiv
         JwOq8G1SrJ9jmi2gQTXibSjiSSawZCI55M+2MQYoyuYyhVDIlJhtzQ1B2fFZ7WRZQDx/
         0SUCDA5ZYGgrC4XZvBh9g1MTJtARb+EHv4XoomXh0wsthf8VMIMVmpiSKPVZSMfKikpo
         1zuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786376545; x=1786981345;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GCrGDHyDrQa95r9/bHjjtu86fmQgfeBAEBBhKsMFLXQ=;
        b=Lyyau7QNGO+GDiyMowDzD/7rELN9q43HzP+6ieECK78i1dGPrI0twZh8ZjbMSuA54w
         m42J36XopBJs85pZ17tdcejo6XOgKQ6UKTCK4Me0BJDMEKx8NhEEH05h2E1igk/1lSt2
         eCa4y0Fzf0AdFTZd5KAc2RmLmmuElwGl6kwkWrtazbg6mEL4mHJcIuIOYktiXGtTQwPM
         WzeDWih+kIFjXp7q/8l1GkzBWmo0Uq5HdPU2qEuPq4RQ9tNm/O02fWA9IACQ3aebSXMm
         sT9CAgLHqm4Ie42r+Cgl0o4DzRUr/uMA0tQz8fNFkg/HZkgEDk2z+Va3mWgI4Pzr+PE0
         t93Q==
X-Forwarded-Encrypted: i=1; AHgh+Rqatwf0T2Y3ay9z6sN+ATCErZiDDYd2vdUQi7g9fWbkq6RkzFM+ta+qI2q9ZgPMJcKBMVWkySwlyfgT@vger.kernel.org
X-Gm-Message-State: AOJu0YyWzXsLw0UNR9CZvJKWYIl6uW4Qt0vG0O2JGgtrFrL+JMVyICvD
	NfK9nbMG6JiMgYO8ruq/Lli+jtnRSHr0Mh+LYknqSp+1pdssriBZLZRDP8CAl6fpVHEi4dORI4t
	yVeHE+ao6Mj3GY9iI173gr0/EQRWkAMva9Or6UjbuNps9eD0JMujtBoWg7kJPUaZ5
X-Gm-Gg: AR+sD10AwnTmfLXMHrPGkG/14doDPNbGUKUWqvdtUePj/PYYKrO4tS8ELvjIBbv5kgT
	MqgznIQJbVSpXfVok3R+Y+uEbkgCMmZ75ktz566UE4hFRyb8r5Uttgj9ADF2wwsd2k92iY/Yu+J
	EXnXyCsMYIvOWGqs+RHwxov95OM+duA7B8gGzgb6431BwlGiYoNkk/x0oB4h4XrjJPQbMiliv+D
	caArjPy19OeBpmPJpiEdVOJP5clXEoFfoxujubhhEIEIQC34Gv+Sj0YSGIigx3uY+05Ps01kHO4
	A+EC18Oa4DS9yLI4rGsVbiF5eN8PVVGfaxvXJ4iUBFsUdbBt3AddQZ8jcOOvtAueQxmSenrQE0T
	7GHgIm1TxzKRswSTpNWZ/PbGoTJgxPFh5A+epJo3LVB9b5JWolyPipaqMuFydL0+eWszxWQbzjc
	O3ftTeygQPN/r5uA==
X-Received: by 2002:a05:622a:58c4:b0:51c:963:cafc with SMTP id d75a77b69052e-52d20a814eemr255582821cf.41.1786376544934;
        Mon, 10 Aug 2026 08:42:24 -0700 (PDT)
X-Received: by 2002:a05:622a:58c4:b0:51c:963:cafc with SMTP id d75a77b69052e-52d20a814eemr255581111cf.41.1786376544064;
        Mon, 10 Aug 2026 08:42:24 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b3056f1bbdsm2071673e87.82.2026.08.10.08.42.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 08:42:22 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 10 Aug 2026 18:42:10 +0300
Subject: [PATCH 06/10] usb: chipidea: msm: keep the glue device
 runtime-active
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260810-msm8974-usb-hsic-v1-6-e5f93ea76ffa@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2213;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=W5fwrw87A/zYMZyvs0ZH/Ywonomd67B2W25bvL7eGxM=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqefFQhTQDcU2q5OpKlPcQt9+901ij4/eO0pNy/
 HSEWtd7m3iJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCannxUAAKCRCLPIo+Aiko
 1atgB/9L0zN0A8qyBtwd82vNyEPK5KczZuUzbj/WjMLPPb+4l0Q3ash4UwV7mMg5NN/ewuxYNK/
 lL6Ywgcv+8x4aToz+jDBwPPDYjmzgBezMgBtUW22NvPUG6+efLudrkNisso2Au+ATDaxP6BAcce
 kkpONMN8GRn9mrLWwGCMmROlJslpvJSeGzvc4nFbtku9clhrJKi2mHQFeI2lBzBIaGBH+K12Mk+
 Mn0hmMZCBnyZ/bvBGVA20M9wIuCyJXgRDwIpFTldc0FFhhwuoSRIB8HE1wWVoVzMZ/Q3twkGmxR
 76E4RQOFwkp4nJdrNElE2LUMNEJzBT1hBg9xYM0eSRC5B2qH
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEwMDEzNSBTYWx0ZWRfXzlMGEq37S4vt
 I+dIsJf7lJmMtyoYQ+TjyJeqU5Lrr2V64zZ+N3iOI2Xj/NwGf9g3mQzRS3PhU3Ph5JpOnarCq48
 x/aAn8MQkgMSoKeemqqOF5UBqqBsN3k=
X-Proofpoint-ORIG-GUID: 2MU5oi1dIYflJGFS8-56R2cDiDheeFdk
X-Proofpoint-GUID: 2MU5oi1dIYflJGFS8-56R2cDiDheeFdk
X-Authority-Analysis: v=2.4 cv=bfZbluPB c=1 sm=1 tr=0 ts=6a79f161 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=Gq4z8NyD3fEPJbr1v9MA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEwMDEzNSBTYWx0ZWRfX8RVa+6t47Vax
 m5knVdVR1fB75Oa4D+14eGOaIqxmanY7oyQmiO19gVYZvmJf9ndHaIlpEjv0K7uj9ujSAesznpk
 pPQNEjyLVCETD0bhQ17gqgsJ4oXzJWfVrQmdWSMi8Wxj9jOgf911Tj8PF/l8qvkifJXbbn+xQLR
 sHu8yh1+/vS/ww6FEgMmzjF5UFGKJqcAKuMDcKpAZw72e2mTTSuZqdqEEuhcXRrKjrJimMK/32V
 TgWAmxs2gfW307VGizm2NqolBpMjnDDIEQ4Cg4cvVSYnP9MWJ93fhZyWHuaApT9ko3Hu0s5EYOY
 Zr0oH6RlcbbGn1zPjDN8oEsX6HEpY0VtxWGsIHdRuk+MIu4pG9VY4kCPbcdHWs6an+Rx0qxvoip
 viU+HCueq0SB6+HV3rRckh/i8XcZLfOIYnwK7BoCPKJCCBOpUTF0KhnvDx60Tms6e55wuES/6Gf
 MwF6RB2lhb7X7tbUlug==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-10_03,2026-08-10_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0 clxscore=1015
 priorityscore=1501 phishscore=0 bulkscore=0 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608100135

The msm chipidea glue enables runtime PM with pm_runtime_no_callbacks()
and nothing pinning it active. Right after a successful probe the
driver core's pm_request_idle() runtime-suspends the glue (the ci core
child has runtime PM disabled, so it does not hold its parent), and
when the glue sits in a power domain - the HSIC instances live in the
USB_HS_HSIC GDSC on msm8974 - genpd then powers the domain off
underneath the running controller. The EHCI register file reads back
zeroes, an onboard hub's connect is never seen, and subsequent bus
accesses into the unpowered block wedge the interconnect, eventually
taking the whole SoC down.

Pin the glue runtime-active so the domain stays powered for the
lifetime of the controller. Proper low-power handling can later be
built on the child's runtime PM together with the HSIC wakeup
interrupt.

Fixes: 2d0cdcc5a0e4 ("USB: gadget: Implement runtime PM for MSM bus glue driver")
Assisted-by: Claude:claude-fable-5
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/usb/chipidea/ci_hdrc_msm.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/usb/chipidea/ci_hdrc_msm.c b/drivers/usb/chipidea/ci_hdrc_msm.c
index e28ea87f9898..9a9410a814e5 100644
--- a/drivers/usb/chipidea/ci_hdrc_msm.c
+++ b/drivers/usb/chipidea/ci_hdrc_msm.c
@@ -276,7 +276,13 @@ static int ci_hdrc_msm_probe(struct platform_device *pdev)
 			dev_warn(&pdev->dev, "no wakeup interrupt: %d\n", ret);
 	}
 
+	/*
+	 * The glue owns the controller's power domain (the HSIC instances sit
+	 * in a GDSC): if it runtime-suspends, the domain is powered off
+	 * underneath the running controller. Pin it active.
+	 */
 	pm_runtime_set_active(&pdev->dev);
+	pm_runtime_get_noresume(&pdev->dev);
 	pm_runtime_no_callbacks(&pdev->dev);
 	pm_runtime_enable(&pdev->dev);
 
@@ -294,6 +300,7 @@ static void ci_hdrc_msm_remove(struct platform_device *pdev)
 	struct ci_hdrc_msm *ci = platform_get_drvdata(pdev);
 
 	pm_runtime_disable(&pdev->dev);
+	pm_runtime_put_noidle(&pdev->dev);
 	dev_pm_clear_wake_irq(&ci->ci->dev);
 	ci_hdrc_remove_device(ci->ci);
 	clk_disable_unprepare(ci->iface_clk);

-- 
2.47.3

