Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7ADD403B05
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 14:05:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781186738; cv=none; b=jmLfbJfozDeMhGWsn0Zyec8sIqeoYgzZ/h7K7Ya1Oqd8gNVJFf6IKfUxNbR3icfBNPP0+vQ9nWRZ7DP6gvUCN+5+Ncf3XACuZ3deDU3ezNRBtk06bgw711sag/FjV/bH3axai4dd8XsNcZKdROe3kB8pQCPIvP32XMmRW1AyCnQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781186738; c=relaxed/simple;
	bh=6T0vT8ns73GyAYOqdvKVFt6Kkovh5R/AEwLiJpspPNw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CbEM3LFpLq0C05LpKybe+swRWxuzS3jGDxms3Bd4/ecyvHKkqPQUgbGUREOu1eETFQ7yW6Zrlue5haUJg1LWtEmDAxUUyfP37RETtEbPXb9SFfovoN8WRQATUQ5+wlOpazoMlQpHc6O0VjRORDe+7lHh2DyVvQLSVVXMAxA0X+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KbBUePmB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aPMRaDnz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KbBUePmB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aPMRaDnz"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65BCfEqb573034
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 14:05:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uwOZ8TEedBeQG/0JLrZLUHUec20rih8wIjEdZL6yjZw=; b=KbBUePmBhAxz9/S9
	NP5KFQuImqdu0GhxAo3pHqE9g6gTLtzXQK5kTRNwHv/FVMZ8PvbeXHYiTFRcZ9L9
	RM/C8ce7yLqozl4cioJ/hMRvhhxLQHIjJw7Kgp1QYXad3PuWbF6simLqbjqXUT9J
	+GsP8xkFlmjWZH5gaUR1mJ8ebILlRPZKiXh6inCKmpQuF7O/lSwWKPtISt5ixrp3
	kAF/iGWHfFB0eyFtz7+HDqmGMJtzFpJb6gxedqeaMVrtyOZw2KytNU7gHzYEGGac
	HpfpZStZboifJeWClnDFZNLZurjoZdAQ3zXpgal9AfCUExFaQRFaoFuLVjdPe6zD
	iHsKKQ==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eqe6skuxx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 14:05:36 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c858e0cbc89so4630382a12.0
        for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 07:05:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781186735; x=1781791535; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uwOZ8TEedBeQG/0JLrZLUHUec20rih8wIjEdZL6yjZw=;
        b=aPMRaDnzQ9HgawKHC8dGLHGRlNzKYX8UxoyYPOSguis8K0dwmLYcMFIq8vI/HNDQ/Q
         R1hzdvKTyU9advGNV4t48534F6+nPQGhepcq6ksrHExW38bv+kc0dpXjOInVsAj2A4jx
         DG1t3JI73Wc0ts8dIDr6yrC/M8tcaIG2EskzyZqCXYXQY7u+Y5XuXo+hfIclafFThMXq
         eJ8NH2w2GBgieGNqiekFG56cTbayB1rNrq00xEvDgkj5qPkoUrKafwInFha870oyRk20
         WpacZPFe1JEXmDTojS8QzCWUJntVMq+0oPI4hm5xXfC/J/tuTr7a3EcOF1GJ4dsTigsw
         29fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781186735; x=1781791535;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=uwOZ8TEedBeQG/0JLrZLUHUec20rih8wIjEdZL6yjZw=;
        b=phO9fYQ2xYPVc9n75MAZr/jld1x1S6XAgkBLT68/EWCpUHm7ePLkk2aTaq+PIgqVnK
         HdCOTMI9VnhPDpYgnRKhxPGcJCvJ7l8VUlsE9T7fUPKXtuhnYyHEgoXTJChaBTytjFAU
         75nuq/x1a0NK3fLAeicW+3xQYuTa6n7Pfz4O//rQwDwF9gXuwOEDQaPYYG9eUujLkvE0
         /TUvc9MsNN2snRQy+1NaLi88ou0i5PF68MZcNh6mOSNnnfArui2Q808oTkLfyE7bLHD1
         g0h/Qq2TVJv1LftKpGKBZEgKnv3HYngqHLdl8LjC90YnwY+TxdPS4ZNHuF1Uf0W7dYO8
         1s+Q==
X-Forwarded-Encrypted: i=1; AFNElJ//iGg6i8oHoTjQnH/KwnPzNNiWk4+vNG9ugNyQF5aSmZid5qQ68nN6upy4jGOdO4ND9GMIQt/Z1x0U@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5zfZv9u9szKgs7VEKqOsknk8n0sMwJP67ELD5UWyXdYeycMg0
	UMHaGLdcBP1JoqPg0chtLL9eYRBe6CaZxLptzuGZd1CcnMomwKGqn/JQG92X/oxD2Pmeizuwkk5
	6zMKDiSoQZvIwlaxIBdtxVXlCwEuH6fW8uLXN27Ow02an8uid2NQAFnMyRMCxVfn4
X-Gm-Gg: Acq92OE9fGHs/NZjrSuRFZQzmEve8xErssNIUctcnjha7hDSvoCcCbHDYB2c6ayElwL
	9KxizGjGhXU9q3XhqQJNBaT7dMDSkcwRVs1joG5AdjQ+Ts9NXku64vzIj9uvg6qjUMAcFo+jmKz
	WTiHgndjEuE7/mB8eVBoDRnuABFtYHEUU8FbhunCq01LZKfyc4c91BomYNkJBLbHGfYBSP+HqDr
	dZLvRFovf4bkZ6LfJTLujGQj3BCm2KbCKuWaLDEFb+QRNV3Q/WPEFwZlHG2NXOSsyg8U5xtyOm+
	DDziFMx99owc02N1Mra9pAuR9s8c7BmZlSyDf3Bzt2fd5DuDbCuZPoLoHFaBFprKQrkUALu0p+7
	KJslJjh3+m80nNZfgaIGD7hyqw1GHyDP7dIrzlO+j+m0pw2gt44PFYxDgpeDXeuFM/h+dOytiN6
	VR5a7gEHHlVnLn6etbHxIu8NTdUKZjQo7xCUPSgn/2Dkb4MVkijD2tmUDjlErgwmUMQ+Ej3JHzw
	2xPvTWEtsKn
X-Received: by 2002:a17:90b:5708:b0:368:9da3:c496 with SMTP id 98e67ed59e1d1-377a9289941mr2997857a91.24.1781186735493;
        Thu, 11 Jun 2026 07:05:35 -0700 (PDT)
X-Received: by 2002:a17:90b:5708:b0:368:9da3:c496 with SMTP id 98e67ed59e1d1-377a9289941mr2997809a91.24.1781186734930;
        Thu, 11 Jun 2026 07:05:34 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:cc96:22ae:323b:9eff])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-68e64e2c810sm11133831a12.9.2026.06.11.07.05.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 07:05:33 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Thu, 11 Jun 2026 16:05:25 +0200
Subject: [PATCH v2 2/3] hwmon: ina2xx: support ina232
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260611-monza-ina232-v2-2-e4375ce652d0@oss.qualcomm.com>
References: <20260611-monza-ina232-v2-0-e4375ce652d0@oss.qualcomm.com>
In-Reply-To: <20260611-monza-ina232-v2-0-e4375ce652d0@oss.qualcomm.com>
To: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-hwmon@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Martino Facchin <m.facchin@arduino.cc>
X-Mailer: b4 0.14.2
X-Authority-Analysis: v=2.4 cv=GbMnWwXL c=1 sm=1 tr=0 ts=6a2ac0b0 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=4d72ej-57Oz9oLBfKlAA:9 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-ORIG-GUID: uvLY3fxWFjYNEA3RCY9mybcXRqVfXy53
X-Proofpoint-GUID: uvLY3fxWFjYNEA3RCY9mybcXRqVfXy53
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDE0MSBTYWx0ZWRfXyX9K0GPhSEKC
 w1WvX1bYTnQeOQs0l/YA8kJGxyz3aq9DhxLaWwBUgGXXooZdQsCTAE5dKTwpPq9CX50nU+lL/J8
 Kpy3faLX2orhrCEDSMD8rxyjwTbS8ZUj25sanM0ta3QuC/kV6XmIRzERgpLInGhzmKca6/qIY9c
 tXnNynqFW5OgLYYqUIc5t6ldF9glLciREHNrZ5AzS4NGgj6tYgN5Bsb/4lWxEN90nM6YCMl1/AA
 pM7+1xZiYj04A5kG0LKR57gjBat7zUD6ruToHtLgMP7XwjQsSfD5dk3LgxplYJ1iXCWJKr3x1Sb
 cC6rkck1CebPdjNptSXJvejcGhGtxW4Qti8HqUOL9J5x6VEtj3tHwqyH9/eSp54tp950zty1Y5+
 scdeF2TAaUHaYuMabs2Cbno/3P5sx+tgP1LmgUKfds64DhDS5tkvxs93NsUihnBlF7RIbHl96J4
 Bsj1mf2I9lnwoZ/JHkA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDE0MSBTYWx0ZWRfX1OwdiXLCvyti
 5sJDVNJzVsqXuMBGhuca+QEYK+sD6uv99OOrkZZdE0fZdYOoiH5Pi4wi5ejUP/uXEt9VOV65vdO
 hxm5n3nXXxm0WfkiXoKuJSA48glfIPo=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_02,2026-06-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 bulkscore=0 adultscore=0 spamscore=0 impostorscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606110141

From: Martino Facchin <m.facchin@arduino.cc>

The INA232 is a current/power monitor. It shares the same register
layout as the INA2xx and uses the INA226 default configuration, but
differs in its electrical characteristics:

Signed-off-by: Martino Facchin <m.facchin@arduino.cc>
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 drivers/hwmon/ina2xx.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/drivers/hwmon/ina2xx.c b/drivers/hwmon/ina2xx.c
index 613ffb622b7c42b8b6090d3b4ec7b2fa412e24a4..fc2319ad99fc398a50e97ee617f67255bd0b3038 100644
--- a/drivers/hwmon/ina2xx.c
+++ b/drivers/hwmon/ina2xx.c
@@ -122,6 +122,7 @@ static const struct regmap_config ina2xx_regmap_config = {
 enum ina2xx_ids {
 	ina219,
 	ina226,
+	ina232,
 	ina234,
 	ina260,
 	sy24655
@@ -196,6 +197,20 @@ static const struct ina2xx_config ina2xx_config[] = {
 		.current_shift = 4,
 		.has_update_interval = true,
 	},
+	[ina232] = {
+		.config_default = INA226_CONFIG_DEFAULT,
+		.calibration_value = 2048,
+		.shunt_div = 400,
+		.shunt_voltage_shift = 0,
+		.bus_voltage_shift = 0,
+		.bus_voltage_lsb = 1600,
+		.power_lsb_factor = 32,
+		.has_alerts = true,
+		.has_ishunt = false,
+		.has_power_average = false,
+		.current_shift = 0,
+		.has_update_interval = true,
+	},
 	[ina260] = {
 		.config_default = INA260_CONFIG_DEFAULT,
 		.shunt_div = 400,
@@ -1005,6 +1020,7 @@ static const struct i2c_device_id ina2xx_id[] = {
 	{ "ina226", ina226 },
 	{ "ina230", ina226 },
 	{ "ina231", ina226 },
+	{ "ina232", ina232 },
 	{ "ina234", ina234 },
 	{ "ina260", ina260 },
 	{ "sy24655", sy24655 },
@@ -1037,6 +1053,10 @@ static const struct of_device_id __maybe_unused ina2xx_of_match[] = {
 		.compatible = "ti,ina231",
 		.data = (void *)ina226
 	},
+	{
+		.compatible = "ti,ina232",
+		.data = (void *)ina232
+	},
 	{
 		.compatible = "ti,ina234",
 		.data = (void *)ina234

-- 
2.34.1

