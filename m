Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BE323C0630
	for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 11:42:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786362172; cv=none; b=RffqgPSM+bb00SAKbRLN/v1Xo5t5QQGyHq8MCfiu/fmyZYMTjcZ+2iuGIt3jKs60vlMM/ip2CocAkAWN4kV3mqeJ+kctc4+KcCvbWgiTquTueGQ+23EDlKPV0nelu1tjmE5ulP5KDZ4JFoGRPT02R6ORH6ctZyAPjUKJpvpLcZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786362172; c=relaxed/simple;
	bh=Vqsw8JJWOi85POaWx2iCSTAfXxNNja11d4f23hwnU5c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rXfj4ExfeUPzCeDkxcFPz+SPgWrfplIXpFZRyfWA77lMmiWSJAViuD1aPYrXBIZJIw8/6rHbPoEbBBRBGUlUEfM4nl2FVW+vFPLAzsC0YJICCQRqEKvR65V7Rb5HA3KGoS5dNMjYuxr9fyA31NV4BjXoouYmZlu4jrX7meGBy8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Oxxv2snj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=b+Hz0FO2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Oxxv2snj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="b+Hz0FO2"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67A9SL2N1119529
	for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 11:42:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pcf8bo9ey21Nzk57L59x1vStqmDp0oasziFMD2pL3G4=; b=Oxxv2snjdA08U2BS
	oGd921vVd/0cgzuoMVF/x+CvfFMxrACHEsS5+UWcbhElVkk6eVpDP2QvQZbNi3Le
	Wsi2LqEiaDYhhJ7TkWykuMir77S6G/4V9mui85qhXw/9RMK2ItGBjNg7g6TMtLIn
	2TuguTbCn4joy2pyA1y0JOdyWdCyKM2WHJ9GKaCOtO/hp7dM1XHayKVFLvYftRMD
	tlNJ60fyL1y2mz/u4l5IrLpB/XuzkmPt4d5FT2E/+W0d5y0UW5cWzqlrGMVnY5mv
	6slJxWo8+FW/OjaO2CpN93wdkgs+rKW6hbxNmD3w44pShygAR2hVHMI18D4n7mCN
	an36VA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fy8v6sbr6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 11:42:46 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c26012cd0so16228401cf.0
        for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 04:42:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786362165; x=1786966965; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pcf8bo9ey21Nzk57L59x1vStqmDp0oasziFMD2pL3G4=;
        b=b+Hz0FO2ZO9U60wJ0SNkgUN3a/klS9IInPEikynllaLV6YrOSp+1CdwzgCi3wxctc3
         VBIi57tr+FzJtU+ZvW8lB5JTV/O91x3US1BHCVxoCuAOv/34n1ZsqJ7+2Z92eisjSe1c
         S62XQFeCIMdkAmXdlUUpddxgrTCWXNzp3srA1VKcvYJTHlI6UGt0z0iElW0MESIYJbRe
         AQJWkxcfzYifFKbKKO26sI9+iGt9QQJeE0g7Adl202QxMEz50RP5PH/46Iwpep9iBPKx
         MU4Pp3cDwN4kIrGpUPTD/JL/SxAyAg6HTd3EzZ/6lZa+DypMDVcUU90cZsCzW7r6+3k0
         zUdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786362165; x=1786966965;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pcf8bo9ey21Nzk57L59x1vStqmDp0oasziFMD2pL3G4=;
        b=rgMChxJweH9DRFiACtLzOWGCT9k+bSz6kupd6oH2qtJ6eELvhcFkcg1eftkUOIgCS4
         2MMIP7YGRyQNUter1wv52dlItOjBh2dvjS5dlFroSEZ3ixS5aNBpM8Cj+xpJXsg8WBlJ
         42+0BRAWuZUNZdqL+cAGz1GPkwfdwvzkMQCWL5o0DoiCbzuQcfUk1ARRd1f1L05ybxPa
         sX/p0HNOWIMCYgcAft1tr8Zs3Ob5z9FqVN7BTJE9HFK8uYYVIlkLj0Bn2mDPjPGGjGeZ
         3H/7oNpnrEm6wnao17w/1JhRPeErmvYt1pnXMDRejl5XRk6S+2slkI9FzLsfDw8LPzn/
         FMqg==
X-Forwarded-Encrypted: i=1; AHgh+RoClWQugQ4+TKw6DkVUnDuIdTgsZb1EdtNAn/xr3GhT/ixkYkOSRbdvY0/PVOlN4PuMtH+MYhUO0Xwy@vger.kernel.org
X-Gm-Message-State: AOJu0YwZStS23EM2yj4LntEDrLFiOUYgsoS5E3TqgdJ4IY1Ha0jgQ2NR
	Prwk0+u9sP10JCmf7cE+Co85RxApvrnfqEFsoyzEA0ry3HCY6LQLtW8Ygl8C+PpRUwPv0vyD06n
	ypDto1M2iVRhrdeCgUJ2oLiU8S3N7ezYkbWWYIqyKpuWzWc/VumTQUPn3twyWQEpuNRiFiKeX
X-Gm-Gg: AR+sD13vjqh3yP3lOM6auu02A39WslX5h7IwGNGhuCaoOsFxlX07x1fuq7ps921aoxS
	gyb9cmSk3c+/J+7S8HV5Gs7buLGry04wBpn/SwEbPDgpe049GSbFAc8KWEGo8I69g5TiGVdSr0/
	WLG5TpVwJLHbRieDyGQctpsACQqaQh1BvIuaoU8/DS82J8ajyKfByuL4oULpQnn5lfKxkcC0DqB
	kXaW0wW684d9FrfZoG/GJm1SAzhWDo0AE+fMtqKIdLOl4uxMDVGqsITTi3zyNxbVRiwXlomW2Y+
	Nue0SagSDnjY2pM7kWHrEm+QDGuQdOnlRUyJX3RsR4kky6QuobfVPBNy/5ZcKA0Nmp14tE2JZOD
	7C0fCOSc7Rr28vs1Wkm0PuUinUxYZDCuCE0Uq6jOhN74/FlTwozRMtd6GEWP4mka/+EM4YFntoX
	+YG2oGXURYN3kUSg==
X-Received: by 2002:a05:622a:5512:b0:528:17d9:2d99 with SMTP id d75a77b69052e-52d4c26af67mr8542231cf.43.1786362165575;
        Mon, 10 Aug 2026 04:42:45 -0700 (PDT)
X-Received: by 2002:a05:622a:5512:b0:528:17d9:2d99 with SMTP id d75a77b69052e-52d4c26af67mr8541791cf.43.1786362165151;
        Mon, 10 Aug 2026 04:42:45 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39fddd67ea8sm21201671fa.28.2026.08.10.04.42.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 04:42:43 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 10 Aug 2026 14:42:35 +0300
Subject: [PATCH 05/10] phy: qcom-ipq806x-usb: fix the SS PHY TEST_POWERDOWN
 bit
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260810-msm8974-usb3-v1-5-1a47e1185524@oss.qualcomm.com>
References: <20260810-msm8974-usb3-v1-0-1a47e1185524@oss.qualcomm.com>
In-Reply-To: <20260810-msm8974-usb3-v1-0-1a47e1185524@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Christian Marangi <ansuelsmth@gmail.com>,
        Andy Gross <agross@codeaurora.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-phy@lists.infradead.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1207;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=Vqsw8JJWOi85POaWx2iCSTAfXxNNja11d4f23hwnU5c=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqebkpuX+vOVLrzjxpiNNS2YkxPf3uqan6N+RLz
 fDpxGwaCuGJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCanm5KQAKCRCLPIo+Aiko
 1QfPB/4iz+jf8SjAdNFZSm0aMTjbl+6rvr/pgSsoFIAr+D1trxTc1W3fTjUJmBF+pNfEWNwBZca
 Aq06bNbBr8k1OydR6xd+HzebvHxfD1/yOKF801JdwSUQYCexzfEc1djrDIXUCFcFjK34ADHu0gs
 g9Y8Pkh6c0nM74+r6elS2JgKMUiQfcyZzqhAOX6gL3B0NZZJXRD1Q4wM5Q6WRI4vaDCkHCpnY+i
 1WPMSzmmjSUXWvY6gcHiMMuzDjXdp6Nq4/c3GdMjXNgjrjvGOazyDqZm/Tis+KskmqVesaCt8uh
 3mbTOLt6/tzRK0TxhPzDS6qERKCQgapfahvyMTLaR9Hgpd1p
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEwMDEwMiBTYWx0ZWRfX13pTzHzt8b7T
 OGMoF2t/IIST33Ug/OAGgtOlZ6MbDiO89HpcYETo3lZ9/zGuTBA3NtWwd4vT0N3eivKtkjNs+rm
 kV/Bk3P+xJQsO3FPy6jC3xFw8g5bFc8=
X-Authority-Analysis: v=2.4 cv=PvijqQM3 c=1 sm=1 tr=0 ts=6a79b936 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=dvWP00IZLZjrm0WsKW4A:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEwMDEwMiBTYWx0ZWRfX6mjMyk0n+FcD
 zOeRmSM954/9wSODV0JV2cTTH3QS71OU5LuK/kVv0fB8vpK7KUzN3fvhNmMN9i/XCxTtbZGPXew
 Oz/mafAg1rKMZNwSdfreyrBsikoxZ/IrsbINyhi1vQZo+qx/VvnTu7C7eRjjdPw3XaQLgu9HyI5
 YTT/E9J0sPKA53HSKdq8KLearLm4cuW5Ix3tC29nSJ7Os2/nsUTf2MCXXruSwAxvddWUxvqX+WU
 Nx4wLzrr4yYChyHIi0bXJtXMxEPgPZjHQNbg5I/3EsxhTZ34A1IlnW2neHBKe70iQ0n3LaaNQ2i
 fGgUjNKafkUCq6adcDpPffMioET1XtlLLdZFRwdRCQSFPmj9kxtgw0w94pevOMqhChP+or308SL
 QxumM6hfiwAy2ib72c9S1MBb1dfeggUnUCQgq7ufsqvdcgh1TbRLYWmbyS/fyvIHmjh30VSN42o
 rlAE0s2EjesnlI4omVQ==
X-Proofpoint-GUID: Kyf1ekVbjtYrfk7FxJlt9z0XsQl3lMjZ
X-Proofpoint-ORIG-GUID: Kyf1ekVbjtYrfk7FxJlt9z0XsQl3lMjZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-10_02,2026-08-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 suspectscore=0 spamscore=0 clxscore=1015
 phishscore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608100102

The SS PHY exit sequence tries to put the PHY into retention via the
TEST_POWERDOWN bit of SS_PHY_CTRL, but defines that bit as BIT(27). In
the DWC3 QSCRATCH SS_PHY_CTRL register TEST_POWERDOWN is bit 26 (see
the downstream phy-msm-ssusb driver for the same IP generation), so the
sequence pokes an unrelated bit and the PHY is never powered down.

Fixes: ef19b117b834 ("phy: qualcomm: add qcom ipq806x dwc usb phy driver")
Assisted-by: Claude:claude-fable-5
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-ipq806x-usb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-ipq806x-usb.c b/drivers/phy/qualcomm/phy-qcom-ipq806x-usb.c
index 21b59d4ca8d2..cf77e0a66e20 100644
--- a/drivers/phy/qualcomm/phy-qcom-ipq806x-usb.c
+++ b/drivers/phy/qualcomm/phy-qcom-ipq806x-usb.c
@@ -51,7 +51,7 @@
 
 /* PHY_CTRL_REG */
 #define SSUSB_CTRL_REF_USE_PAD		BIT(28)
-#define SSUSB_CTRL_TEST_POWERDOWN	BIT(27)
+#define SSUSB_CTRL_TEST_POWERDOWN	BIT(26)
 #define SSUSB_CTRL_LANE0_PWR_PRESENT	BIT(24)
 #define SSUSB_CTRL_SS_PHY_EN		BIT(8)
 #define SSUSB_CTRL_SS_PHY_RESET		BIT(7)

-- 
2.47.3

