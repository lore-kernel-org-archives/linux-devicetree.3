Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54B7B446851
	for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 13:22:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784121769; cv=none; b=HLq3vfBkwYKDeObITUzZiz4BU2VotyYDeyqkyGiHeAGBb8rywTUFYjs+ThND+ytFIXUyTBdwPfyfdAdGqMfBEWrNJyITv2jVW4Pomdsp2nDb1g5Row6hvSc5/Qb3yJNOdSsBhTHu1i9sulQK1L4H9iIGnS1Axu0YrDJKDmC0MGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784121769; c=relaxed/simple;
	bh=cg4ahNzE7EQt88WAfbItzJABYeWdAiELXb1PCGpO5bs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oBZZUvumCMVbkQmPXAnYJQDEgueSJiUxUcVgwUzeAA2jWwr5IE8J4HF03ReF4SF9JC4LaZwY8qAGy484OgyBFcFFtk3nnYnI16/Uk1ODxekCOxjx+kbd6SpcaEL2juQCXxDRvWvp39W/37XKTR/yIFePCmhvLq23sOtJYtosQzs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=c5LVJonV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=i6BVxgTd; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="c5LVJonV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="i6BVxgTd"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66FBcwuq3579150
	for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 13:22:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/yefe1MhwuWOpT6zu4e786DStwawUL0hTuo8YbebGdI=; b=c5LVJonVPU0mMecD
	/WHmpoUeNr0LXxecJa3S+jIfeaE9FeXAimWffmVt0FrG307JY8OK3lJx4gM91gni
	A3PtXwGXvya703SVSXSUctpEPXT3PZrXglqzb65OUHx6TMnpMm7ueBifuf5FKfR7
	OwVTd6LYmtNEwft5OMTUO+5Xqhy4nrZ7a06fDykl2OUWHm2ktVRlLBYuZpPGMydj
	TKrUFHbx2W063JrR8jFQr4JUIFxc1fvLX0sW65w7zOhcYVa1KDNGZJIDlfBvZXRW
	w9jnNpazlC7qQYgcMkf5+afG8Eq9o27tAkrSRJJurKzEpAmmhnYIqDyq3IwpgeHh
	BtxwLw==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fdwk3306p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 13:22:47 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8f0c46bfb6dso107499946d6.1
        for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 06:22:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784121767; x=1784726567; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/yefe1MhwuWOpT6zu4e786DStwawUL0hTuo8YbebGdI=;
        b=i6BVxgTdLqyRI6awr53JTqldlviQXrUuD6l1BVjOY/h7h8XIbh+wX1FzZVYsycEQQV
         OPeuLH8jKSs+lS7vbu9eI+Bkzp6LPIIBdK6jnXa9X5R6/IQg2TxSvDBt5MnCSuB1blem
         +wjkrZ4XAeTTqPImylOm4knLrw95ytMb7SmqKtmbQYuPhQ7pgvvC0OnwS9Na/ui/VHa4
         80qbgSMNyYN/dLdp9bq0UzvzDk2g3iJVZMT/RGH5hnsqQu7XKPXyb2YnnkuqjBe+rTtF
         jjplCob32JTWGfpeB2lc3WhxYBSotsHGf9Z7QuCXmmP013CZCUjA11WOXHOJmBKkqobd
         /D6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784121767; x=1784726567;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/yefe1MhwuWOpT6zu4e786DStwawUL0hTuo8YbebGdI=;
        b=r/OMLgWYZ6v7E6OdoED1OKXpw2G75Nu97E5C+4sLtAdkGaAMyAWPmtuN6BwQMyr5ZA
         OPolP4+s3Pm2gea10RhyWAQx/DyGm/yF//JplVbkNrd2sGDQ8xgZtTdei5z2myF+3eHl
         Xq7RwsJqNHmfRZB+fG2gVF78elZRkH2Eh12Kwb9jOZHpr/yPFx/36PyMPj2X/LYiXHDU
         O5He2WBOIISspokfAkZ7QU/9s+NOCwIr3T/xAeMByxZ60a+XsPt85l4aG2wwzP/79ZSX
         p3pcnpRPZ7L7RfW9nccMFev0KZWaPQb7422aUAK2jv7xBF1RBi3sOhFy/4o9xf87ySMC
         EXiA==
X-Forwarded-Encrypted: i=1; AHgh+RqyN/MQA7lN7YLaRGZBlQ48aMmrnEvxLyvz70WjvzZ5Jb0wtn/xM4UaWGis90/rdadXwI6ZZSuUIyeR@vger.kernel.org
X-Gm-Message-State: AOJu0YyRm/3/Hhjs16f1tLSVV+5VsZ+EoiMnTddypS6Qjz9x/WiDglZ3
	Lo/IOw2Y/Lkc8WpIUAwb07Y5cCACOAchajPk4yB237G9ttjYNYwlGbEPuKHvx8aRhC1nc2D+mnQ
	OaELNStbs88eKkk5AZ8SO2fRbtKFV8EoR9IaUwrZzAG35KVrfvQ8Ox5taBm5hgqaN0unSk6BS
X-Gm-Gg: AfdE7ck5C/Bns93h6F18xAyvEN5M6i2vBmpzTIex8HQu4KQ2J1P4GXwgLgJpsKmsmIY
	f1XPMWWDj794vb26e3j5FwI/PaSeXgFj2gZZMfX3P5oOVL+aTJbpbqhp1DNm7fWKIJmp72DELtN
	wvywlBbRfKBcL5r43dK01LHJev/hkPkz3zrtqQctXxkfqPkKUZ4VjhOmMO2Y2CmSsIASfTBhgv5
	uIpJWIVFfB8bNXDpA9AfHjPgRqq4fzbCAAJaygIu86mQSTYs6YFm8haNzxpbsK4n/288ceyso+q
	ezdgMW8Mi7LQZj7iDzGv8fvXCmmJ1e/tt+1Eu51WfA8I4ulhDGtnAvbA06YiagRFc1sYVMVIW+W
	hsf0luon1gAEVd09Ccpk56AboeME+ko6rgwvIhyc=
X-Received: by 2002:a05:620a:3911:b0:92e:68f0:1eb8 with SMTP id af79cd13be357-93096375b1bmr276808785a.59.1784121766556;
        Wed, 15 Jul 2026 06:22:46 -0700 (PDT)
X-Received: by 2002:a05:620a:3911:b0:92e:68f0:1eb8 with SMTP id af79cd13be357-93096375b1bmr276804085a.59.1784121766107;
        Wed, 15 Jul 2026 06:22:46 -0700 (PDT)
Received: from hu-mkshah-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-92ee5d6a77csm1773676985a.45.2026.07.15.06.22.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 06:22:45 -0700 (PDT)
From: Maulik Shah <maulik.shah@oss.qualcomm.com>
Date: Wed, 15 Jul 2026 18:52:02 +0530
Subject: [PATCH v3 3/3] irqchip/qcom-pdc: Add puwra compatible for PDC
 secondary mode
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260715-purwa-pdc-v3-3-be08934dc916@oss.qualcomm.com>
References: <20260715-purwa-pdc-v3-0-be08934dc916@oss.qualcomm.com>
In-Reply-To: <20260715-purwa-pdc-v3-0-be08934dc916@oss.qualcomm.com>
To: Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Maulik Shah <maulik.shah@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784121746; l=1015;
 i=maulik.shah@oss.qualcomm.com; s=20240109; h=from:subject:message-id;
 bh=cg4ahNzE7EQt88WAfbItzJABYeWdAiELXb1PCGpO5bs=;
 b=Ak/AeE2kqiDyqgHKFdDDyN9F9Ruke/ofJBgZuKziCza99ngYwqJ660IEQDRosVPmXkiTmrgbR
 6Is4Jatu47eAhUggqdTnqwxHIttJO2CZRxy0J/tp2g+BWvHlkvsgcbA
X-Developer-Key: i=maulik.shah@oss.qualcomm.com; a=ed25519;
 pk=bd9h5FIIliUddIk8p3BlQWBlzKEQ/YW5V+fe759hTWQ=
X-Authority-Analysis: v=2.4 cv=Yc6NIQRf c=1 sm=1 tr=0 ts=6a5789a7 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=PsF74K0pJtfrG51pEAYA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-ORIG-GUID: _DoThqn01FucBzj0Y35bhRPH1YdzXmUV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE1MDEzMiBTYWx0ZWRfX02BDq8B+cS8C
 HoaoOL2ibzvausbwdxC4M2+ftlDV6RCwS+QLU5pgMb4Y+iCOAzlS4jVqhqHtpFMMYBZJVcBMW9P
 sDHuxseehVjt+uY9ViswAw2qgcCjUfK2PA9OkKQpLNpZocpx5KTT1qN4O3pVrfkw42jwa4F9hGR
 4kH7NiBzfPM64s58fEBpnZkXN+cClpaTmYKcbGEyWHWY/wsRaJsH+eZKAlgiP11NAq46YCRrC8p
 DPDF856sawzlWihbbHUL9LWNmwjdK0zy47DZNbrRb6LQGcTF73VwVi7urI9WKHGqPO1QeuC9oW7
 R/sKghA8GrzFv1k9fzwBdA+2CGVO4djDp4PKNo8odtwTYZC1zEJS60VL+BcxcNg4VGluSjVH9TR
 DbQZ5+k9r0Hya0qcPiDA8/+r8ofZpBhKTfZLFl6bfqjQ0V6i4Fj9z4kZl2bziYwAiiOFM6kVWiJ
 uiVrOzy/fdStwbmQIRA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE1MDEzMiBTYWx0ZWRfX2rrlAk07oy3B
 CgODr8Ly43NsY9rCo6VWbx3Om6x12blqfK699PpRg72Cty5eP5CLdf4h06m44rb/1/+4YwBGcSO
 P3344/AkV0mubINYBuR3vUbAaiWMafA=
X-Proofpoint-GUID: _DoThqn01FucBzj0Y35bhRPH1YdzXmUV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-15_02,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 spamscore=0 suspectscore=0
 impostorscore=0 adultscore=0 clxscore=1015 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607150132

X1P42100 (Purwa) and X1E80100 (Hamoa) shares the same PDC and windows
firmware sets the PDC to secondary mode for X1P42100 too. Add support
to reset the PDC to pass through mode using qcom_scm_io_writel() similar
to X1E80100.

Make sure x1e_quirk to workaround a hardware bug is set only for X1E80100
as X1P42100 have this fixed in sillicon.

Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
---
 drivers/irqchip/qcom-pdc.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/irqchip/qcom-pdc.c b/drivers/irqchip/qcom-pdc.c
index ce6d80c7f17a..29025a212ece 100644
--- a/drivers/irqchip/qcom-pdc.c
+++ b/drivers/irqchip/qcom-pdc.c
@@ -715,7 +715,10 @@ static int qcom_pdc_probe(struct platform_device *pdev, struct device_node *pare
 		}
 
 		pdc->x1e_quirk = true;
+	}
 
+	if (of_device_is_compatible(node, "qcom,x1e80100-pdc") ||
+	    of_device_is_compatible(node, "qcom,x1p42100-pdc")) {
 		if (!qcom_scm_is_available())
 			return -EPROBE_DEFER;
 

-- 
2.43.0

