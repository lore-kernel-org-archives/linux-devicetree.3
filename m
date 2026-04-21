Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ED333BD651
	for <devicetree@vger.kernel.org>; Tue, 21 Apr 2026 10:56:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776769007; cv=none; b=J7jWAZJjVsNJW249kKQBVpeJN0QNwHqVsAWhKVttp9KGyHlK5ti3KNAJMVlQwwy0d0EwGWONR92QOW7nOFyl/dE+iARN2hx07vpoU2qHrcsPdpod3r6THAZQwy50qNLfGeIq1NVicRBM8qyG0mAC+QSo/ecNGtggrK/U08USY0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776769007; c=relaxed/simple;
	bh=5Mt5/XsGHOSDEOG0ISFiVsCUEFGP0erIeLzDLMDtZnM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=azRqPCMt9gZxUwwjc8d074aGRtTLJg3tTBD25qFtpg0CWTSBzRPYnJ+IN5MEqhRfMbmNlsU4YOZHy6yjuZzignrk6UEQqMzt9OLFfd5qjRwv5OmjyNKvcKk3Yv2wBq4SDVUQe7G0OTyXtqGa/ePMk35B9yC1zCSLouhqB1RR1EQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=J9dd5cxj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jTbeDl65; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="J9dd5cxj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jTbeDl65"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63LALcwX1510935
	for <devicetree@vger.kernel.org>; Tue, 21 Apr 2026 10:56:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wVV75OBmAXnSQqclAhnVAU844754GU81P5VURZ8XoRQ=; b=J9dd5cxjJis9OQYL
	GGHT7kdXwe9Zen5iz990QgdJgI7imRUY/Uzgcnakz5kyFWGPA7pNa+57nKgS22ug
	Elmx2vRZSxonTaJNbaNXoT9nXS9acuMsqLjaYmEyk6bYi9KxYhvWfuPx6vJ0howr
	V7Whuv8ujNNJjERfCc4QBGAdN5Tzhh1KmG8upWyHctVjqbc4yPLpuZf5PaNWM+YE
	3beX5RSQdoqoJoLXSr9A9BQfIcXJ1+kmWbGMwm0TYXtxbiJDDBBjc35p4OUDqvsZ
	0P0CfQr94LkZAGOV3PB+MwYKX75s6uxG85+lZHJJupWwWRrEbSRbyHBgD1dsg3kE
	R7A6SA==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dp2ak1dhs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 21 Apr 2026 10:56:45 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c7989b7cdd0so2881467a12.1
        for <devicetree@vger.kernel.org>; Tue, 21 Apr 2026 03:56:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776769004; x=1777373804; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wVV75OBmAXnSQqclAhnVAU844754GU81P5VURZ8XoRQ=;
        b=jTbeDl65T9loOCFahbu+WOKb4UoDPI/syvrp49g74x81uEs5c/Q93t0X6nh/htxUGO
         FPlCfudWrGiHDCx6ZbfyvBX8s1w3Rz00aLx8w+PsSFP7bTKlEp70ZK0mFwVk0xHWGfyF
         BQZ5NqXQhaKw2RgHWOs0aVT7vzgKnCNxLe/pQdGMoJVhpQySrNhUdang2QDIjSNJ2hVE
         jz3Jxwhvg5HynZB5bNLdY3Cz0eGyaZxR3lhEoL2rqjn5AcAHC2XqgixpvWWG6GHvn9h0
         ugqaiAXQIzb1QIlZVn9Y6BPJexIFH/AcLZXWk3HVfH4Sw+JD75eaUBuSAaQ9VBnAWh7A
         g8+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776769004; x=1777373804;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=wVV75OBmAXnSQqclAhnVAU844754GU81P5VURZ8XoRQ=;
        b=l74J0957nGicBTm/WYXBnVhZkIBRNahecAa4vJ2rRQF2jHvNavdLRhsqfWB0vi3M4a
         VwT3vT3XPgbzqm9q3fTnvk/dJtK5pXUg1FMVbbSmrpl2/N3a5DofWowfpMQGDGiOskWo
         liyMov13aL/qHtNJUKq17chVxMME+JwV4RNd78I98PgI4ItlG6teDAdSORKqEr70tD4V
         fizh+Y6KHS9P83RZ4ck9NRyt2Z2m22hCaZHEHcACgfnqBxumPtp/K1Q4oDiiGTvPxeaa
         hfCLZcSQ7fvx9mwAJoCl3xX+uObSQxIcv9bGAK+z7HsgxxevONkN5ILnC7OzlcB/MYpo
         MHmA==
X-Forwarded-Encrypted: i=1; AFNElJ8ksWMECPU4zxb4kHM1b/hhY4Sd8Lg4nUvW+HCe8KZVXMW3DL1HS3pzRuPbgVM25gjD8Zh8Q99vUloh@vger.kernel.org
X-Gm-Message-State: AOJu0Yzgop5CRKudUPxUkTwb0R3QuQ+ofiWw2pr6qK910Q8BUGkFNJmo
	AReq46FjD94gqLCj5wZJvIdMF9XHy1FRPcykZXxNf5hl084Q+1ZYdwWR770RnDrP/J/nwEVCHmg
	YkiDUMwVFc1FmyGree8Fk+l34jpaIvXBEtoc4sTKxAH7Jjv+Qb2h8/kY3ncufmgAW
X-Gm-Gg: AeBDietUvsX+C5m53H9JoV0G0yja6+TDFc6WE+/gLAhMRQ5eDpgVrCpYr14/X6x9Bj0
	3p/+fjck95kHWucpCxj/ED0AiSGu6A1UpXjNq7kmOASK1ZVXFaCqbD2Ddu69xQGOY9mgRh2Hjlm
	StgM0hMCyNER+yZcD1QTbPSiCRPMrbGjvS06+gOWBoXUKDsz4M69Oi3re5s9PiA0Qi7OGc7aTSx
	exmzyXEoE/8jqvt331QI3Ub8t//duseAhtSap65F0Z9GM0buWV4F3/lXt1cXKjVcHu5yRf8RINQ
	+lzMzCIlh54YJpmfVnMOrEb/Q1xN4TYJGvWh7uKBdMdUzfQ4k5Wi4tAH61934t/7JWtxX6Wm9nd
	d80FrlODwD1vEHn/ZDNyYLISwgVoIB9sGEMzvJkedEkElwhezYu5PJvA5bHlm6hoHMHaDSNC3IN
	/KN9Hpt6/vzLI+CLuufEE=
X-Received: by 2002:a05:6a00:a15:b0:82f:2243:e445 with SMTP id d2e1a72fcca58-82f8c8c32d9mr18441649b3a.32.1776769003270;
        Tue, 21 Apr 2026 03:56:43 -0700 (PDT)
X-Received: by 2002:a05:6a00:a15:b0:82f:2243:e445 with SMTP id d2e1a72fcca58-82f8c8c32d9mr18441626b3a.32.1776769002748;
        Tue, 21 Apr 2026 03:56:42 -0700 (PDT)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8e982fd3sm17077339b3a.10.2026.04.21.03.56.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Apr 2026 03:56:42 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Tue, 21 Apr 2026 18:55:53 +0800
Subject: [PATCH v17 4/7] coresight: etr: add a new function to retrieve the
 CTCU device
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260421-enable-byte-cntr-for-ctcu-v17-4-9cf36ff55fc0@oss.qualcomm.com>
References: <20260421-enable-byte-cntr-for-ctcu-v17-0-9cf36ff55fc0@oss.qualcomm.com>
In-Reply-To: <20260421-enable-byte-cntr-for-ctcu-v17-0-9cf36ff55fc0@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@arm.com>,
        James Clark <james.clark@linaro.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, Jie Gan <jie.gan@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776768976; l=2348;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=5Mt5/XsGHOSDEOG0ISFiVsCUEFGP0erIeLzDLMDtZnM=;
 b=WhXCZV5up4hdp1qBnIeS6UhdzvfhCV2dG1U5NQe17LczbTvQE4hMGeRKNMx/5suR89AWCGg5l
 q9Y/hhLWvOYARKtSAz+lUS/Arcee3oXJQ8LgYBAzkS91RTI8cIJiIjQ
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Authority-Analysis: v=2.4 cv=KItqylFo c=1 sm=1 tr=0 ts=69e757ed cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=FuIWbRVyn4pKkvqW11oA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-GUID: iIHoW9LMCxiqB5AqVbVmmoO8khcT_fxz
X-Proofpoint-ORIG-GUID: iIHoW9LMCxiqB5AqVbVmmoO8khcT_fxz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIxMDEwOCBTYWx0ZWRfXzdp61l76kQzT
 wfl4BsuSJJdMpXqPeIHd3KKPyZ6FhatZx4vVEs1f65cNjrD25M5z+Kc4PD2YfUg9yJeZYaCJg1t
 Wr/oNZ3Jw58tX8MA2r+WNmtQyZGtuMEVxZB/KLRMBJz6JIcnSNVU4sgBngoN3xQX4ZrGslLSVVZ
 K/1uOcTkSE7RlbbiFOkqdyORObhVyK5E5inmRBrdGVZWqfI5V2qawf0nRoqXk3SJDvVDFZj1Grf
 ilorLnrb717Mvex+1nzz4SQSM8uZlV4tgg1H+nIGzVMYae9EKAKLIkCiRpPdZeUi4WQ2zK5JKpO
 bJ6bLVU4mOLKGwtliJpNwag2nmGHBE/E0239gEZkm/c8U4FmwUocO4QKjZRzR45yPxOgM1G42qB
 91w3dfSZu8NXvYPon3IqoEdTbTDxIxyWies6WGNi3LGtptGvx+zR6DnxjaTwmeLdpx1COYurTw+
 WfmExAaM9IUHglNl2jg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-21_02,2026-04-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 phishscore=0 malwarescore=0
 lowpriorityscore=0 impostorscore=0 bulkscore=0 suspectscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604210108

Add tmc_etr_get_ctcu_device function to find the ptr of the
coresight_device of the CTCU device if the CTCU device is connected to
the TMC ETR device.

Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 drivers/hwtracing/coresight/coresight-tmc-etr.c | 24 ++++++++++++++++++++++++
 drivers/hwtracing/coresight/coresight-tmc.h     |  1 +
 2 files changed, 25 insertions(+)

diff --git a/drivers/hwtracing/coresight/coresight-tmc-etr.c b/drivers/hwtracing/coresight/coresight-tmc-etr.c
index ac704617097c..bb76e7e37874 100644
--- a/drivers/hwtracing/coresight/coresight-tmc-etr.c
+++ b/drivers/hwtracing/coresight/coresight-tmc-etr.c
@@ -865,6 +865,30 @@ tmc_etr_get_catu_device(struct tmc_drvdata *drvdata)
 }
 EXPORT_SYMBOL_GPL(tmc_etr_get_catu_device);
 
+/*
+ * TMC ETR could be connected to a CTCU device, which can provide ATID filter
+ * and byte-cntr service. This is represented by the output port of the TMC
+ * (ETR) connected to the input port of the CTCU.
+ *
+ * Returns	: coresight_device ptr for the CTCU device if a CTCU is found.
+ *		: NULL otherwise.
+ */
+struct coresight_device *
+tmc_etr_get_ctcu_device(struct tmc_drvdata *drvdata)
+{
+	struct coresight_device *etr = drvdata->csdev;
+	union coresight_dev_subtype ctcu_subtype = {
+		.helper_subtype = CORESIGHT_DEV_SUBTYPE_HELPER_CTCU
+	};
+
+	if (!IS_ENABLED(CONFIG_CORESIGHT_CTCU))
+		return NULL;
+
+	return coresight_find_output_type(etr->pdata, CORESIGHT_DEV_TYPE_HELPER,
+					  ctcu_subtype);
+}
+EXPORT_SYMBOL_GPL(tmc_etr_get_ctcu_device);
+
 static const struct etr_buf_operations *etr_buf_ops[] = {
 	[ETR_MODE_FLAT] = &etr_flat_buf_ops,
 	[ETR_MODE_ETR_SG] = &etr_sg_buf_ops,
diff --git a/drivers/hwtracing/coresight/coresight-tmc.h b/drivers/hwtracing/coresight/coresight-tmc.h
index a14645b04624..fbb015079872 100644
--- a/drivers/hwtracing/coresight/coresight-tmc.h
+++ b/drivers/hwtracing/coresight/coresight-tmc.h
@@ -470,6 +470,7 @@ static inline uint32_t find_crash_tracedata_crc(struct tmc_drvdata *drvdata,
 }
 
 struct coresight_device *tmc_etr_get_catu_device(struct tmc_drvdata *drvdata);
+struct coresight_device *tmc_etr_get_ctcu_device(struct tmc_drvdata *drvdata);
 
 void tmc_etr_set_catu_ops(const struct etr_buf_operations *catu);
 void tmc_etr_remove_catu_ops(void);

-- 
2.34.1

