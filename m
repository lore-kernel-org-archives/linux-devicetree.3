Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAE6738422D
	for <devicetree@vger.kernel.org>; Thu, 25 Jun 2026 10:46:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782384407; cv=none; b=eMsoAqccAChBzlise9IXH5HO87b6Rvdg08xOZYAmWkEkFK6ordSte2PHSzI5oS9PyO/4aMYC3UsgTWPxEgUknuEHaKELw4WjImFSwTKsQaelaU1k0COFt7d5Mu8VKtHIoGNW6Fy2kZHH/Mv5ehzONHe36mZzr2aVeyPWGdYXYIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782384407; c=relaxed/simple;
	bh=fIhJzaso9N9Xd1IgveByjqgunx3Xh6KSxy4FjeYwCkc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WBIkJSh3ydl3so7Pgz5NMJxBi2zq+mGNvTqsnxqKp+JJ7uBrwCNBplwvbv9SiMtsXDEq9AlkqFL+V5/MDWgjwh8cgCgZDuvfbMIJFXWA4jx7sM+vXiOaBOlC95R6fMvXPuVg2tffHYznXYfIq2k/S1oFz00+4YahoLNugU5wW+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nktWvLFF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=M49Jhfux; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nktWvLFF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="M49Jhfux"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65P9jtsY1919432
	for <devicetree@vger.kernel.org>; Thu, 25 Jun 2026 10:46:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	H2gE10b7DqflojsoJUwYlVeY6chdArR8ZAvuFavqtsk=; b=nktWvLFFua3yFrvd
	5B6nj7vGsAE6Lr5dZJwt5IA3hJuKA9DKcIxxpr1gYLk/OnGRIsih3W3n39YUVJKi
	ioA69YxoPwgudCSl7IIvK33sJRokav+1zQ9ZVU0hi15A7kxxi16eXu4lTnHjmjtq
	oBKoXnTZ4EAIm2UxbibrJbIQ7Vb02PYSImjzW0UgLReajzEgQdxpv/ACh97dPixr
	Dj3BruedT6b+9nzI0J3bM8ZIgaVhaCG1Hwtm1uvTAiEZdCYFVd5tTysLusvK/QIl
	qsmF7FDNZum+Rx7PFSoH43uw5ek7/k9K8VwFgrMWG9WSqH41i9s4EfyEmWjDgN56
	MaCh6A==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f0ueu9t79-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 25 Jun 2026 10:46:44 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2c80907fdc6so323685ad.0
        for <devicetree@vger.kernel.org>; Thu, 25 Jun 2026 03:46:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782384403; x=1782989203; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=H2gE10b7DqflojsoJUwYlVeY6chdArR8ZAvuFavqtsk=;
        b=M49JhfuxJ6fmfCjtGsI+Dfr8NLETJFPIn2BcKYBhrJi1QUdLzy9Nc2i+hrSeD3gFgj
         FzGN5J0K6lG9oQnSS55x+/LPYnom5zxOyjnMEAflzIeIsS/p/5d4XZ45Ko6MLZtC2bLR
         ddavarLUDVtDy2kpXIhWIO7mTcdMjmfydk9s9troNkxOrvrWC00HKEWsxvqIYXJGdzD4
         kGKF9ndmKmHIYxQInN87+2eCuh4IXg1swKkjpqfK7IaTdmANNrFBaXIrmW7re1ileEZ+
         OqePf3EnH02VIP6qV7g05VIZBrZx/1oYvQIemwbEeTrXjJ4+ydm7HGzf0oHt/+pqIRBm
         Qa2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782384403; x=1782989203;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=H2gE10b7DqflojsoJUwYlVeY6chdArR8ZAvuFavqtsk=;
        b=MJG18Pvvyad23w32eTZEF42Kw41IHquSUV2gZT5dyw3f1rXUp58RLdTUPqw65MKPfs
         R/aASBo9hONSbqb4S9DS7nxo2bd1jLBbzr75F4UGmhDZ7hSDgXQOLAgUVi8ULNhCVOV5
         p47ubpj1PRF2so85fo5t8cWTIivZQom2QcEd06ArgllZOVCtjJNho3/Xs4aLmxhwC6xU
         MSFBLFjEvCjTr7B9erH+J826uQoKXm9XxeAy4VJsd3hsATEUukEQEs6aqLmAerp3+pU8
         I7mH/WHFA1ar47HJekSCkug8mX4HJkY2zAkHS7oXEtVrgspZ1coPL8eq8kt7X/p+Byfq
         CIJg==
X-Forwarded-Encrypted: i=1; AHgh+RpPw+fuHTn41mo86u70s11R6eE1tdWZrO8okWlYmPO5uOIDYWRPcXK3KZcSUJvOnQoFCxctk5I0QX6c@vger.kernel.org
X-Gm-Message-State: AOJu0YyIzxYeZuJz940dlC2A0vMEHPYKsLokpB6oExU5TaKdRJOFmx1U
	9qQZzocG5N7qKaxqGonifpeWLAw8iQT2KOzSME1jSDbzE0kzhhZ1yhhGk1qlqv4LSXXFx3bIHzV
	G0LCeh1SXGCLz1//9QYiWWYJi8Hp11n+rvJcsWZIEwjweSShISr5I+SekIQX6W1V/
X-Gm-Gg: AfdE7cn0fH1hjztyeZSPMwWqea1jhW97cxGexha0KLGNdcbkQWzXIJugbCaHMCdModQ
	BocPLG+tjgrT9S0FEjqm4EgeijQgcIYP9yF+8XYVrCsuqWSfd0Okcoa9BTnASjoXPgdocMY2brQ
	G77c7gYzPdA8oV8YxXDIuqfRQYyXJD9vsvW4GPCj7R2xOJkxrRchQfrNnpHP4UV2WSXlNjXG2wG
	kRaYGK66bJm3RjwWtX38MW4Wo0R4vLqrz5q2+OP+AIelJV+uVsuniTTTae/fg6UgO2IYmQA8mru
	mVXSWp+b+YYRcshlJP165TBmuy2VJpn+gSbU60hBdh06HQzQEB0e5/Ozdxf8DHjU3E5LYENQuB5
	UUUV14udn5vPUiZ8HwBM3Z48myW1eU34JOsdSqNdTnSAJ/IpgQM09bAHxndD6hEP3wQ1J+8tLig
	==
X-Received: by 2002:a17:902:cec1:b0:2c0:c14c:bf38 with SMTP id d9443c01a7336-2c7fc7309b2mr19681965ad.24.1782384403442;
        Thu, 25 Jun 2026 03:46:43 -0700 (PDT)
X-Received: by 2002:a17:902:cec1:b0:2c0:c14c:bf38 with SMTP id d9443c01a7336-2c7fc7309b2mr19681765ad.24.1782384402956;
        Thu, 25 Jun 2026 03:46:42 -0700 (PDT)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c7f63d58e9sm17114035ad.60.2026.06.25.03.46.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2026 03:46:42 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Thu, 25 Jun 2026 18:45:54 +0800
Subject: [PATCH v19 4/7] coresight: etr: add a new function to retrieve the
 CTCU device
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260625-enable-byte-cntr-for-ctcu-v19-4-8fbbf22e8381@oss.qualcomm.com>
References: <20260625-enable-byte-cntr-for-ctcu-v19-0-8fbbf22e8381@oss.qualcomm.com>
In-Reply-To: <20260625-enable-byte-cntr-for-ctcu-v19-0-8fbbf22e8381@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@arm.com>,
        James Clark <james.clark@linaro.org>, Leo Yan <leo.yan@arm.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Jie Gan <jie.gan@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
        Mao Jinlong <jinlong.mao@oss.qualcomm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782384372; l=2348;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=fIhJzaso9N9Xd1IgveByjqgunx3Xh6KSxy4FjeYwCkc=;
 b=KxGEjMfdJvyIiidzq8F2ZIosQs0uCJGWkZa5FHiQaLch4Vk5w2VVPtL3MT5jND7sa+axVhvo/
 NXNHyXdi6zaBGQNmRG6wcWvxqdFOS8qRrrxEyaqfei1DNGJ1U1Xbtuk
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-ORIG-GUID: YCKTFdhsOlWXP82Um99a35VIoR1JVOoN
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI1MDA5MiBTYWx0ZWRfX12q2zE+M210n
 iVTYmV+6+rzQdvAIF3RlMAMxSYWcBVGFUTOTaYL/vg1d0HCN4c2sWZcMRk37ksEaFkM5nSbFGX5
 5KDPiNGpEntL73hIfbJgrNXcVc3CXlo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI1MDA5MiBTYWx0ZWRfXybtVfxHx1Vom
 HM8ob9xp71ck+1hnUaNnJ8LTQhuRN1XvOg3sv/PHxnQYGEe3/gF6y3dLQZ+hvun2r0kix2lOiRi
 GIUUq62KiuW8bBf5NoxONHUTJnur+DbLfK82bM2Y6isKdk5W9JzgwdVJdBKyCws327X3K8gul2S
 tDYx48mvIl0jaFAKEkl+I+8bNkGmk7w9XUtti6V9sSz3JDNZxJUxFTBNeg5oXV9TgARt+sOt6Jh
 PKsfg90Rhs69HnCo8uZNxHljfBPKmfqityVTa9xv3eKoGRBLHOgBBxDutdhd9vskroXG4zgwqhl
 YXomR85Xj97TyjnQx6bCw5XfyBchbr70F+n09hbghwpRKS3ovEc5S2NcEz0ffZdzCGtE0OiB4bP
 Pwq3A/jtquA5VcAEv3GIqT4KaZqx6VNDX0twlnB+i7jwHk3KbPF0YnPJO9lAs/nl9+D6kM1/Aqm
 +DHXAOEo6NnQXyJB9vA==
X-Authority-Analysis: v=2.4 cv=b/SCJNGx c=1 sm=1 tr=0 ts=6a3d0714 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=FuIWbRVyn4pKkvqW11oA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: YCKTFdhsOlWXP82Um99a35VIoR1JVOoN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-25_01,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 phishscore=0 bulkscore=0
 adultscore=0 clxscore=1015 spamscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606250092

Add tmc_etr_get_ctcu_device function to find the ptr of the
coresight_device of the CTCU device if the CTCU device is connected to
the TMC ETR device.

Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 drivers/hwtracing/coresight/coresight-tmc-etr.c | 24 ++++++++++++++++++++++++
 drivers/hwtracing/coresight/coresight-tmc.h     |  1 +
 2 files changed, 25 insertions(+)

diff --git a/drivers/hwtracing/coresight/coresight-tmc-etr.c b/drivers/hwtracing/coresight/coresight-tmc-etr.c
index 9b3ef73e9cf2..2b26ce6455a7 100644
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

