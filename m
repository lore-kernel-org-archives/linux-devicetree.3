Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEC9333F5B2
	for <devicetree@vger.kernel.org>; Thu, 14 May 2026 20:30:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778790649; cv=none; b=t5aJQ1yICHVYUYmemjjJFIEMtWrINOhiFC6kqMFXxtfeg18WccSSH6psezHkPypV06nNfybs1HPu4Lesy8nm+wuH3KWUiYJVy7yaQgW+JtIaqFZW3v0MCkMB5Epd68mtHUFjFbK0qXp5WDup09C37L01Ip597JIs2PyYvFNOYVQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778790649; c=relaxed/simple;
	bh=ENRAB6NaAfz+N/esGn59rAS1dbyvJcqApk/1sxjO5Ho=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nl2KaPg1W7cYQBwfojlj/IcE7INbRgH8zRhCQoZ7e8XweF+LYJII7RCKkxHw943PLZkfYvyhK8y0V7GbTph2/3UjNH/qHzntP7VMDQDcEliEoKI0ruAZ1uKtmqM9ns7U0kiKcUBYPs4VN8TVQarQ3ZbmWPHQENp0lhJcE6lJm/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GBHCraI5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NxzF+asI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GBHCraI5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NxzF+asI"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64EIpTBt4008297
	for <devicetree@vger.kernel.org>; Thu, 14 May 2026 20:30:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	29moSWZqjKQBR+rms1scwxyd2aS4I64T0JEH8KBPdfE=; b=GBHCraI5y1rPwzFw
	WFcvkHTQqGILl0MlKJF7AUlBkgEwf+WnbNW6zKBYbBt+y5KPlWMFPSaGHoHb5cuj
	oFNRtKz4Vp1Rmu6e9xE/0kXFS7qLqRsccs4uqzJARwm+zPXa1KbmcM0e+E2Y+eYh
	2adZz/5WPI3bIRbzykZfMN6g4pSz6pWoqvSAJBD2IUsL7C+wf8RVsvTk29AHRaTZ
	wqZRY1I6VsYRInyl7CmSYlbl/haAaand6yTKcGFJL8PRv572OVN56TzptpnGV+Kc
	UrtLj0VcePBu3a8ugDs47+fySkhevvAx0ThONDwddR02F4aWVeG1pKLKpLtFOOrw
	Q4JcyA==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e5m1srajm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 14 May 2026 20:30:46 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-835423c69ffso5114620b3a.1
        for <devicetree@vger.kernel.org>; Thu, 14 May 2026 13:30:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778790646; x=1779395446; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=29moSWZqjKQBR+rms1scwxyd2aS4I64T0JEH8KBPdfE=;
        b=NxzF+asIHWQHaRDw05hiBMWU/9WCYlmlHgddp0XsKBAhl374FtrrK9vgRw6tLyHGBg
         MA+7RTxpTaEw2JViqtcLeh+rPK0zQ3Y6ZWlYbEUulQtZJWF2ZyawcErwTTZIHZKwvvt5
         +s/RkXqmoZ4jbTYw86JSlMvzeWbGotyZ96/Ju2QCcHxJrI3mcERM9sfYCIZ/qktS6lXc
         EGubG50PbCft20KXDUueRsoi4fo1C95PRTipE1KvcEgncaGLGujnfYqORK0NXoANS9QP
         sv2wunTsCj/d1L6wWP8VylVBZB7SGdRRa7h8HMlf7vS3anQzlnhTAfCRTzNxmi0ZpKc0
         I4GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778790646; x=1779395446;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=29moSWZqjKQBR+rms1scwxyd2aS4I64T0JEH8KBPdfE=;
        b=Fb9nns5ViqJRjjDbrPAWSTWtKW2h1YJHIZekDIJQ0XzQSIbAZhPUlBgY1s4VQgLM2q
         IRuelwh+WKsjbJuILjkrlsp/8iGG9N51nTcD4zjDTrq6yeUYr436rE5V9nzA3vJPIoN8
         pFJx4osgIiwXpPB3T8z+sjxddVzrYEuzQe52ShSAWj0hCKSZbFQHzV/Gf0LhQgJC330I
         ISx+u140/L7CPzCMBE2LJmqdhoj4OWpgfOLcz5c8xjLDXFErcpfZrsvhSfAE9hrLwpIQ
         d6pTdFAy2MgLRGrFLaBa3N+BuNr7+HrnqM0/P/d/Aj5PxPbemgvLoS/IBts3MFy+URYZ
         E4vg==
X-Forwarded-Encrypted: i=1; AFNElJ8FnP7NE7F18VBsKlE+ZcjMS4XvJ8kaaDE98G93KDAyqGefu8vlJenZ66tGAZuOXou9kMJ9q35mJprP@vger.kernel.org
X-Gm-Message-State: AOJu0YxCzO93kOm4vw7t4ucvNucomz5uaRCssRAnRTYlCObnzbhCk/KT
	swE8qzLO+9BhcqiGRMXjcXQa7CepDXZX0yy+kJxyuj9eC+W82+Ku/pIIez68R1m3fk9V4+YT3Ny
	dMZIcv7FO2aVniBo8TbHX0yVp2VYVzfKuHXqDv+A9rBbD9YPlTlph7dVCEFDyiWb3
X-Gm-Gg: Acq92OGJwVaTnpzyelS4Y7yyVCifZOVwNb6Al4fm0GdvIVeCSqHydPG6CflB9TCG564
	1o/L4L5sch9I2S+AOoiLjJLPPWpKf4szYG48yJ+B3NoK8s7/zy4lSYOJHx0CWn/NL8u7FVu9wK6
	00lssytJOth56V0QcWzpJJ/E3X/Up4gqs1oqpsWkg7pxwl16xZJTla7e1b3CJlXPaMCH4Sf2a03
	2bhNMGq6wyTMIaXISKlkW7aUidUG84qpghao0zqMMWK1h/rDLivorjjnOw6+wyiKgeTlHKmNHl5
	cxE8BKLn3eb0dh97s2ESoql+SiyO7GrkUUjPrUg9nLDNj54+Ea8ad/+oaAhozAGg2v3G4IgefEm
	CRdHlBsVm4Nx+zFBeopGzzWvX4l92qTDpajiux5r4nsvrBTusU+PCC9s=
X-Received: by 2002:a05:6a00:1d85:b0:83a:a55f:c3f9 with SMTP id d2e1a72fcca58-83f33b4e019mr1029701b3a.20.1778790645753;
        Thu, 14 May 2026 13:30:45 -0700 (PDT)
X-Received: by 2002:a05:6a00:1d85:b0:83a:a55f:c3f9 with SMTP id d2e1a72fcca58-83f33b4e019mr1029675b3a.20.1778790645262;
        Thu, 14 May 2026 13:30:45 -0700 (PDT)
Received: from hu-kuldsing-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83f19664a59sm3666952b3a.1.2026.05.14.13.30.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2026 13:30:44 -0700 (PDT)
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Date: Fri, 15 May 2026 02:00:09 +0530
Subject: [PATCH 2/2] arm64: dts: qcom: shikra: Enable ice support
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260515-shikra_ice_ufs-v1-2-b1b6ced70559@oss.qualcomm.com>
References: <20260515-shikra_ice_ufs-v1-0-b1b6ced70559@oss.qualcomm.com>
In-Reply-To: <20260515-shikra_ice_ufs-v1-0-b1b6ced70559@oss.qualcomm.com>
To: Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Proofpoint-ORIG-GUID: Xdv8bzOWnueUOP2I9abcFC_t4s3GE1t8
X-Proofpoint-GUID: Xdv8bzOWnueUOP2I9abcFC_t4s3GE1t8
X-Authority-Analysis: v=2.4 cv=cZPiaHDM c=1 sm=1 tr=0 ts=6a0630f6 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=Fg_DINg97nz2W6SJEv8A:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE0MDIwMyBTYWx0ZWRfX01wSRL0h/IL6
 wu6l1EKuXEYtSRVEP/Nrdgx5s6STk+UH6DdwCyBizHwB1J1RTBN8XlGWRfQwAoW05L6oxEdSFI+
 qslZ5IfbM+r5gEGJ7cfIJi51Saa2uT7NSO32Z2ErO3BJw67o/SdJIAVsDbPP2i4Y/QedU6Bqflm
 cjWFCEMlKXf31+e/qt43F1cjABeo1ZS11LknjwDQmzkHu25SOtLWkxrh7p7+105A9gS62L6IKls
 T4gwf7xyuuP/FNqsNcBBHmBYxthHNPc7ZjUtquTYrxZxgqM1l941nHnye4HGqiW3+ZjLYTB6/yS
 9CHGyqg33eqidHsJI3YyEoe+R2rDWe4wzRziXqm4gh9trOdRylZbbbyr+Ms8RcajgZSTfRn6TO6
 71FeplgouTkjNunFPpH6su/wRFZLNG5S0c2E5S/QgE4LKed7GI0h8KUENNs6P9VO3G4DhuZJgeg
 y+oh7gSEK/C4bxBby9Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-14_05,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0 priorityscore=1501
 adultscore=0 suspectscore=0 malwarescore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605140203

Add UFS inline crypto engine(ICE) support for shikra.

Signed-off-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
index 262c488add1e..0b988dd607df 100644
--- a/arch/arm64/boot/dts/qcom/shikra.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
@@ -641,6 +641,7 @@ &mc_virt SLAVE_EBI_CH0 QCOM_ICC_TAG_ALWAYS>,
 			mmc-hs400-enhanced-strobe;
 
 			resets = <&gcc GCC_SDCC1_BCR>;
+			qcom,ice = <&sdhc_ice>;
 
 			status = "disabled";
 
@@ -663,6 +664,17 @@ opp-384000000 {
 			};
 		};
 
+		sdhc_ice: crypto@4748000 {
+			compatible = "qcom,shikra-inline-crypto-engine",
+				     "qcom,inline-crypto-engine";
+			reg = <0x0 0x04748000 0x0 0x18000>;
+			clocks = <&gcc GCC_SDCC1_ICE_CORE_CLK>,
+				 <&gcc GCC_SDCC1_AHB_CLK>;
+			clock-names = "core",
+				      "iface";
+			power-domains = <&rpmpd RPMHPD_CX>;
+		};
+
 		qupv3_0: geniqup@4ac0000 {
 			compatible = "qcom,geni-se-qup";
 			reg = <0x0 0x04ac0000 0x0 0x2000>;

-- 
2.34.1

