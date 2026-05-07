Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EA3B3FFAA5
	for <devicetree@vger.kernel.org>; Thu,  7 May 2026 14:12:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778163176; cv=none; b=LZV2T2ASPRWeu0pn6i0Zcu6gnkN6Kp40lap5KEMMp2PzXkshKRIWc/n4/yQy8qMmiaoMT/Wd+W9Z3mB5zF1xb3YAGhvchgHBV5EnIm1uBUVKJq84Bez+QArapWF6yv5zzDz2Ee2wH2VnO+J0AmDUu5MgdSYpc7b3SKLhjJ2rBck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778163176; c=relaxed/simple;
	bh=hEbivcKkn+B0aZjxHwDfTngcntTeQ3spTkM8LFWyox0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MoLt+oVt3gxL00rbQdJ9K5/gycCd7YV6zLM6mTcR6k3iGLbOY2lITzmGt7BljcK8R5wiZyqDeSY0n/YZgoKywi1fzhT9AVhG1c/GmqusjLYfedfkbknb4QXZ5zuA6IncLoj1fNYCiSvAPPxyiclgZw4tLkxU+DhNJJCvM2/OJ6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SVsvkeRv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PhQqOUIa; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SVsvkeRv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PhQqOUIa"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6477pTGA1424448
	for <devicetree@vger.kernel.org>; Thu, 7 May 2026 14:12:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fTgIUNB2u1bhGm6PTFb6105x0D07MjTNsRT9rz7zUh4=; b=SVsvkeRvrUimCAYj
	7dDE4bAs8uzjnXzkIl15CfSbzlHVmJAI3zVIBimjCAPyqWPjRfNr1ONsIf0Wt74+
	jyl4gMTKzInG8TWJavMJoArIkCHOOJMkLRs25B32R6Ymjc+sxF5SZcAfnbSoqaAW
	La5S+Aw8EP2NPvlEd34EP1/w5IPr3Qi5PrN/ao+SYPN13Kc46kRvipTS2hKyQfCp
	ft3wWmiwOJXL5hvSI81ebuqVf9+OI/qGvBdw9hM0gm69v4V5Gy5bC/A5h5QiONwc
	NI9vSreTb0h8K09Y+or2+fK2TCy5NCywo4GTGHLEsopD5n+Cf8drbcMFlSp2BUvc
	bFxsjQ==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0pqfsdrx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 07 May 2026 14:12:54 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c802862e9f5so921940a12.2
        for <devicetree@vger.kernel.org>; Thu, 07 May 2026 07:12:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778163173; x=1778767973; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fTgIUNB2u1bhGm6PTFb6105x0D07MjTNsRT9rz7zUh4=;
        b=PhQqOUIajQApOByzpst7ZYwKE8hToPd1Dj9lw3eQP0gDu/2TIG8gObLoGezxEzF7H8
         /BFsL77CDWxkjJnNgS2AvF59mm3xKJxyC5fUPakvV3hmvVi73KIiy35OHZfAJ4IgDeRS
         jwBejD0reURjfsTqKWwQT6UuKXEBVD2SRiItbu2v6TAoE9AHpLCC2CldHKKpLIdmZTnV
         qx/v8caLwqfwETzkbcaQHYtY5AAk0PQib/0eWtl6/TvTIbBxiu6gZAyAcFqhgfwmcl3Q
         ic8zfUJXBx3Mly9GyAyjzJpQu4NxyuLF4D7myMeIi4gF9xiQqyeVlpxcZcx3VWDqGQ0D
         aXQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778163173; x=1778767973;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fTgIUNB2u1bhGm6PTFb6105x0D07MjTNsRT9rz7zUh4=;
        b=sAapvYeCmCt0nVdVgfiVIe2wpRjE0EnXw82mdbsNS4L1Y00OsfA7PRGcBisd/FU5M4
         EID0X7+VmTi/N2aX4Xibsc1pXD/ncAO294Mxk6nYzaIewK64+Ey2fXb8gDNOaQ2dzi7p
         kHZu/7IUa3CHDJZc1H0PG7Tgz+aXdksc9ZLHvq+h05hxMZxHvXJ4p1eLOmviZQoZCD3l
         B570heAgSI+bAKF7GdZPM2oPi3RWbOw1ZGffFFA8jVQY4ctfkOXEo7kPpwkh0OicjHwU
         ZoO2NaRVRVnz+u503NLnCen2mNNcdisYHurt2loSWOROzhtMsd5xxHokVX1Rddt78F/E
         54OA==
X-Forwarded-Encrypted: i=1; AFNElJ/YNYCaIsVwJxem8ZF1pMYLixpHfGyvjHAUWiRbsrsLaTpQm1HkjK0QBe85pjDAZXy8BREWmZmNN6bt@vger.kernel.org
X-Gm-Message-State: AOJu0YzAh9YH02b8EDW+AqPYDkfx3AGbjCUwK86AkjUciOb8QS7SrAd5
	tixJonBiOwSOPcz7n0EMR0QkHdAgWUcpuFNLpz5wTsKYWPR5dOBU5IFKcBI8z061bm2Huqy8p+j
	+Zex342z8ifhPLmOt90UCPZNiJMrMcOsqOmc9rPP+itUwguAt9+OQNLk4UM2pNDh8
X-Gm-Gg: AeBDietXDe14fZOdtzTzbnbUroQy2V3yAjeUSuJygydD/lOxiHkczaSmVHZGVGZ2vai
	cbZ6BbashupvRYCwmF7Lw6D933ZCVw3fMwXZtIdrRFq8FH44A2sgVqfPqUJm4Iw12l410l5iswW
	8vRvujLAxHJ6YCov8rMuiUFHCTg4/+CQuLbcFhXhS6VF4B426v7bp/6XfWXGeKXhiCFSARPVt4v
	qrqHbDc2FfW9ddBT6VToDU2ks5BV53W3nZX+82wFaznGCTutcYVNfxW4LdE5dtoUHOK+THPGZWS
	r0788+fJg/PFlqpGtMysOHEqUEQtxnAYmYbMqCWR+7MzzidCKoujA2esvRgMI+dVnIv1/XoDeEj
	d889cjGq8ra33IDJORqgNnAQCMMs79ifuhsciknbm8JeKZETGpqb2jACgNZiSbLPC9rm9UPDsh2
	FcH2rvsiUhQSk1UCmuuAHOtFbutshJfg==
X-Received: by 2002:a05:6a20:3d1d:b0:3a3:240d:4fcb with SMTP id adf61e73a8af0-3aa5a8d4ebemr9135155637.13.1778163173418;
        Thu, 07 May 2026 07:12:53 -0700 (PDT)
X-Received: by 2002:a05:6a20:3d1d:b0:3a3:240d:4fcb with SMTP id adf61e73a8af0-3aa5a8d4ebemr9135119637.13.1778163172924;
        Thu, 07 May 2026 07:12:52 -0700 (PDT)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c8253b493c5sm2343072a12.28.2026.05.07.07.12.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 07:12:52 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Thu, 07 May 2026 22:12:00 +0800
Subject: [PATCH v18 4/7] coresight: etr: add a new function to retrieve the
 CTCU device
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260507-enable-byte-cntr-for-ctcu-v18-4-2b2d590463a3@oss.qualcomm.com>
References: <20260507-enable-byte-cntr-for-ctcu-v18-0-2b2d590463a3@oss.qualcomm.com>
In-Reply-To: <20260507-enable-byte-cntr-for-ctcu-v18-0-2b2d590463a3@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778163146; l=2348;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=hEbivcKkn+B0aZjxHwDfTngcntTeQ3spTkM8LFWyox0=;
 b=cWwry+vjlbxC0QyK4KYC3NThL4pvoYwV6BicQS+0HllKJNcokB0qGMnvsAqmlZlqLcteC1lE6
 H9aBpK6Hx4RAp4O+o10zqBQznOawn4b9w6LWgVfVLMg+95kVg1gjlF3
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Authority-Analysis: v=2.4 cv=TJB1jVla c=1 sm=1 tr=0 ts=69fc9de6 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=FuIWbRVyn4pKkvqW11oA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA3MDE0MiBTYWx0ZWRfXyJvlRvXbydbz
 ErGfmzKl9DP6kjThcEJH5KjtLEbk3HX5tx5dfoMzJWLfrJGaVVja7lO4R6AgacI8eUWjlPcmayu
 irXVWn3MNLNzJvYgmvBe7x1DsC3yA0MzfjwF8aI1xwVAWg8SJj14ck3x2ds28PSO2hcSVzoudht
 o8aPZNQtU7Cynci7+zwIDRztYWXbmbRxsrrxjqSpg2b9YKVR+NgfwNPZvUUu0Wajv54aB9Ifzab
 QB8qVfcGsJqbYO4c8wRnuDwBC52uyTK7ZCqDPOHq0FzPZOVseuJQ9NYoAcfvtWpibO8iZbyoP7P
 S1Z6H9J1bJ3T5ouADl/IPP4gQqMTAUfPLnK9wGFvsOsHPHYin1uO9XJrsaKIR0LqRh4NBaOPsQO
 Pj+aFDzOXNnNLXvyYUu/LAVIEsv1wEp/UkFVoOLrr/ynzf0iwslneXQrgfFqk9zj9ebjezPRilB
 wkB7kGcyugdAzHus+0w==
X-Proofpoint-GUID: M0jLuiEoIOP97le9rvau5yoioGnszKll
X-Proofpoint-ORIG-GUID: M0jLuiEoIOP97le9rvau5yoioGnszKll
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_01,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 malwarescore=0 impostorscore=0 bulkscore=0
 phishscore=0 priorityscore=1501 adultscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605070142

Add tmc_etr_get_ctcu_device function to find the ptr of the
coresight_device of the CTCU device if the CTCU device is connected to
the TMC ETR device.

Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 drivers/hwtracing/coresight/coresight-tmc-etr.c | 24 ++++++++++++++++++++++++
 drivers/hwtracing/coresight/coresight-tmc.h     |  1 +
 2 files changed, 25 insertions(+)

diff --git a/drivers/hwtracing/coresight/coresight-tmc-etr.c b/drivers/hwtracing/coresight/coresight-tmc-etr.c
index 779d9e479aab..b0c5f3559085 100644
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

