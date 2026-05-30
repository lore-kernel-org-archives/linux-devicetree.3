Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA4413CF049
	for <devicetree@vger.kernel.org>; Sat, 30 May 2026 18:28:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780165732; cv=none; b=HMzIRtm2/3lBcGn9/vTCIPZhzRN+MYlANMXeFBNbPONKFyX9D0D4QEK66JgXp6Z0/swLiVHhmqO0oYA0QbixGg6daIk2c7WbnFMuQhKm42GDSfdAxFGLcnHFbJZKoUqP4ebGzsuDTAkLQtwHWixnYAW/etmJQaFUJsSczn7WdY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780165732; c=relaxed/simple;
	bh=rlu63NqzgVZGbDQFT3XHJ2eEFRpxquNj27s2b770qto=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ayXl5pqVPP6jWRMKKCdxB1Yehe4gxolDJpW6a3qKJ1+oHAld4xW6cCThfCT3ljBL76DZ1LOhgTor/HIGaydZxNyBvcApBfLhOlhyBqITymc0bBbnnDl4FVQxGKOURSrTY2dLXCshqyEG8yt2o+HCSqo2gzYDqKAHN9ICu8E2gWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gdWfRsu4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dGUNB6iE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gdWfRsu4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dGUNB6iE"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64UEOwIC3354031
	for <devicetree@vger.kernel.org>; Sat, 30 May 2026 18:28:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Grijfbm0GSs+meDyPd4bXAK+a5thmeqrFJ+N6944pxo=; b=gdWfRsu4Tv2tq5yQ
	KKNYzjhztAjyNy/cbGyBGKjDOI+VPkliaNCKt/zQewwxDiyWkEtmOmxp4BuMov64
	qKxM8z/4zV8nxTdYYcv/lbyPnbDIiAGO4J7Iz5hIGgHBwetmTCQJRphykcd+69p4
	4dVQRH3ZhfFxmbz/x5DdtHuOcvQXry96eqNkxrVtuWKjU3M+dOGLV5LMJmcnGeoc
	Z4rph33joVUKmEwXvyHpfTflwMVNO+0dJDNEVruaX+H6b/QUsi2hrhl6DPyU5xW3
	2AyqslReOtoPg85rMqinB48BUlJMoypDg/BszvWEB6VdhW+1COkLlB7B61ojedS7
	Qpr8TQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4efs2h9jq4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 30 May 2026 18:28:50 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2bf1dece2ecso22625215ad.1
        for <devicetree@vger.kernel.org>; Sat, 30 May 2026 11:28:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780165730; x=1780770530; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Grijfbm0GSs+meDyPd4bXAK+a5thmeqrFJ+N6944pxo=;
        b=dGUNB6iEDJVs/m7Zm6ebXRExf7GiXQ5DZTw26U8xWQ7V7Ds2gDK6MwYceO2Ku8emVw
         fEkDBWKwX/cTjd51IZ29iiiW2jSxA3cqYPPmrxdj3AzqS8t3024yu+gyc5hb5GxOtpym
         PZALfoXBHhmy8f9WNt5U59dqvV+S3nax6/pK+T0+WzDnWKHs8HWzZ05roPBPC8IxR/xa
         I38XARqZrtrnVrecd23DZrGKFovebYKaH3Js0McvAYFENE0W9G91mquoVd9WhFgcMq3h
         D+3TLIRstuuJQ4KZAk2Ph669gb16MUSwgcpFgVcMVJf5QybqqKhXhtRgg9eOcpCKk29m
         VEwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780165730; x=1780770530;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Grijfbm0GSs+meDyPd4bXAK+a5thmeqrFJ+N6944pxo=;
        b=rbLcZ6W/dyOhOt5YNhJCrlEujoE6kPzccEn455bZUF+fggRWfdq52+H+tlo9vOOviw
         qLcpMl2hS6DJ+0If5OYmRkUD3zfYgZTAqkvoL4PTMSN/oG4aBb1RBlg7bKQhLGkGz1v7
         n1DB2vrrxVVgM9DFz5CosEVYbgSmwT7NC9wMXNO4E0eEpTJEi/mWUnYuNY3Ik0Z43gQH
         w9tOm5NsRTXzIdJd/qVi3sjNOimlXzh37P0h1vdiDgLfAHtXU57BcptBJoUcSK6N7XtR
         Lb3KZVB3hbYgQ9G2IWl+nkKTSuNRAm4ZkdnNmxYhGKEQKvrn9C7MtLyUv3T8hUAdrmtE
         Jf7w==
X-Forwarded-Encrypted: i=1; AFNElJ8HPpn1qvS5Sqxni31TexymDdMHQR4ItMakyhX8vI9AI5WeT81E+6hIGhqYCnAouuj18bOdCrfq/3KB@vger.kernel.org
X-Gm-Message-State: AOJu0YxDaYaOKt/GFzy5hzE3f1ZDzyc/A7fx7KCyHq0b31EYc5CAyoJk
	0PDXyxJqr5JPFqMOO1KqNzw4FbJZUNc5CmUyEpusivKXl1oW2cTUPZfiHEZE8c7R0JwhJoMboYe
	haG99ilpc7wgI8qyTmEsr5chhEDuzh8dVN7OIvjpxKH9Xjsog5s0gcFtbM+MspcBz
X-Gm-Gg: Acq92OHngbDe0teC6YUBUvWIDdBewITs6pycuRFvixdLysZltHFW8GFKnKEDmjDAz24
	9D4rMVdBdeIECJQk+fQOWpn4Mj+9rKuYkfOIj0OOXbkbJSsepaoOUhVD9jvjy5EyNc9XZm/F51y
	HfjYn60REkwcvIDKdGApHh6/n/0PL29ZONcDtfsm0oGKIoTcmlhx33bxxpcN7vTAs5wUSTnwcMy
	l6fcZ4jrzX6Lfad9fxMlFzcPMNstMvUzbMDP0/3uTWPArf5gZxVrBb/Eb1HhFW6n4LkXsvP1/k8
	eLGg/yLdHyp060SAnn2u8lJfpKwN3HB0wrbam9OlcRr3mF8ZFFkajcnRnLUsMf3GkGEpAkKm85g
	174EAYHyb3fAblHP6Ajz/9PpXTeeumnghSfkm6r0k/2WuLj+fGByOf5h6yLkn6nzQfA==
X-Received: by 2002:a17:903:124c:b0:2ae:6259:5aff with SMTP id d9443c01a7336-2bf3679571cmr54559515ad.6.1780165729598;
        Sat, 30 May 2026 11:28:49 -0700 (PDT)
X-Received: by 2002:a17:903:124c:b0:2ae:6259:5aff with SMTP id d9443c01a7336-2bf3679571cmr54559265ad.6.1780165729033;
        Sat, 30 May 2026 11:28:49 -0700 (PDT)
Received: from hu-ptalari-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bf23a27ee3sm56879635ad.36.2026.05.30.11.28.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 May 2026 11:28:48 -0700 (PDT)
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
Date: Sat, 30 May 2026 23:58:25 +0530
Subject: [PATCH v2 3/4] spi: qcom-geni: Use resources helper APIs in
 runtime PM functions
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260530-enable-spi-on-sa8255p-v2-3-17574601bd63@oss.qualcomm.com>
References: <20260530-enable-spi-on-sa8255p-v2-0-17574601bd63@oss.qualcomm.com>
In-Reply-To: <20260530-enable-spi-on-sa8255p-v2-0-17574601bd63@oss.qualcomm.com>
To: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Praveen Talari <praveen.talari@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-spi@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780165714; l=1862;
 i=praveen.talari@oss.qualcomm.com; s=20251114; h=from:subject:message-id;
 bh=rlu63NqzgVZGbDQFT3XHJ2eEFRpxquNj27s2b770qto=;
 b=H4y/JGukGyrEaXtiG0q8jIuFzEudHtHcqalv9AP5Tk1w7MKQOSZQUGodDOlM2SdTuWlCNVMIX
 E/yfI37wg09CvBqbfXZ/7MgQW58hKZDx3I5Rha552v3Sv+YThfpuIfe
X-Developer-Key: i=praveen.talari@oss.qualcomm.com; a=ed25519;
 pk=NGK/88fjyHXgfhIKwag7+uIytOmyOypvZ/hDFaYPEss=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTMwMDE5OSBTYWx0ZWRfXx9WDsHFxCLyp
 PUoKt1Nn7PU/O0xmKefV30LNSVyp/n+ucTxL3yhg56jqS2NkV6YriGxwP0iUu1c2YCRB4PEfTF3
 Ka6/g18jwjSj9HVagfZHnhwLBE2zkBPOskWhlwuLP4zMFNA3bnqNPcwQpnybsDWCs7aAN062P8m
 bSPj/WXMrLm/sU/bGpNapUYueipdmOefYfu6hPXV3sLqITVHKOdS08EfLaj7GyeUI3UagzaLKBr
 gHp9tandCq4m5tu40jJHklyTS2XG/wul0l3m2+wNytmVzIbw9ZbtDwcJ66HHE+oqUQQjwnsCeyQ
 9vz8Gu1jRZ47CEjf+qnZbAZdp+41DboNgOw/8HTpBxUAZxEAFObl0Mr7+JFLGasYLM93eKoxsTO
 nGYRE9/wpgcDyaXokIQFL0ZrmYjEKwgIAcrY3lSP8TqH0Q1Qm1cyIuqOIm3SuLxEBfUNRIDWoOt
 +o2ziLtvAmkpNPvImcA==
X-Proofpoint-ORIG-GUID: XPfPaNfz1k2DPXVpyRAOmLps3Io7VhG5
X-Proofpoint-GUID: XPfPaNfz1k2DPXVpyRAOmLps3Io7VhG5
X-Authority-Analysis: v=2.4 cv=UIvt2ify c=1 sm=1 tr=0 ts=6a1b2c62 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=i7xoKaWEWnc8ZE6DH4sA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-30_06,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 bulkscore=0 clxscore=1011 lowpriorityscore=0
 impostorscore=0 adultscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2605300199

To manage GENI serial engine resources during runtime power management,
drivers currently need to call functions for ICC, clock, and
SE resource operations in both suspend and resume paths, resulting in
code duplication across drivers.

The new geni_se_resources_activate() and geni_se_resources_deactivate()
helper APIs addresses this issue by providing a streamlined method to
enable or disable all resources based, thereby eliminating redundancy
across drivers.

Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
---
 drivers/spi/spi-geni-qcom.c | 21 ++-------------------
 1 file changed, 2 insertions(+), 19 deletions(-)

diff --git a/drivers/spi/spi-geni-qcom.c b/drivers/spi/spi-geni-qcom.c
index 333216df922e..7696412c6e87 100644
--- a/drivers/spi/spi-geni-qcom.c
+++ b/drivers/spi/spi-geni-qcom.c
@@ -1119,33 +1119,16 @@ static int __maybe_unused spi_geni_runtime_suspend(struct device *dev)
 {
 	struct spi_controller *spi = dev_get_drvdata(dev);
 	struct spi_geni_master *mas = spi_controller_get_devdata(spi);
-	int ret;
-
-	/* Drop the performance state vote */
-	dev_pm_opp_set_rate(dev, 0);
-
-	ret = geni_se_resources_off(&mas->se);
-	if (ret)
-		return ret;
 
-	return geni_icc_disable(&mas->se);
+	return geni_se_resources_deactivate(&mas->se);
 }
 
 static int __maybe_unused spi_geni_runtime_resume(struct device *dev)
 {
 	struct spi_controller *spi = dev_get_drvdata(dev);
 	struct spi_geni_master *mas = spi_controller_get_devdata(spi);
-	int ret;
-
-	ret = geni_icc_enable(&mas->se);
-	if (ret)
-		return ret;
-
-	ret = geni_se_resources_on(&mas->se);
-	if (ret)
-		return ret;
 
-	return dev_pm_opp_set_rate(mas->dev, mas->cur_sclk_hz);
+	return geni_se_resources_activate(&mas->se);
 }
 
 static int __maybe_unused spi_geni_suspend(struct device *dev)

-- 
2.34.1

