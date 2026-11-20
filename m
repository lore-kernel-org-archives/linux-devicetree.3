Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795145300;
	b=eGAYJ5M4Aqq4nttUKVFsvdjb06Y7gOs3P+nIAQD3zrC2Ky9A35PihzfzjH60K1aTYWCg
	 Eyj6Aqn6UxsG1HaqGTqOX/9Mkgqdbf58Ei9pGJy3b+A/m4M1syJONfrthm435jVfrOAxj
	 R2B5LEgH5IHyU2v8mQ8oPKkbmvA/0T7d52uRZyao0kXzu4jQduDjcqZ99kDlw+ffzIjsH
	 1nfizNkYhdBBNlrH3c5wO5/x/SvAV7YGE29Qjz6W6yvv9Rab0kXlsHK8vPek6t4h0FvKd
	 4EuOfBnTWkqnjZTQvFV4v3Fz3kEqRed65vW/YfJTHm3FvmBtNACNicFTiawdjtarUDw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795145300;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=mGWP4K7gSyR4882ro341W5z3n7kWbxEYoL3WuUhi5sU=;
	b=mJ/hyJN5EqEyJbnqio5IBL6nbwuK2jniPOy9m9k/roX9doYllGkxsh8TYoGf6TPVny0H
	 LpL47edxl2tFagx95qy3kCtmqqBghPx5mnk1HyIlLE1P/Vntldeci+KyjH1sjGh9+aomw
	 GbJZyQfMag27nc59dm48ioMlITfcH7LwaVJieSVgd0XGi70MPGmlVCXdLcAXqVJsPVwmN
	 pctWjLqNqG4XXZg1upgkHq6oaC8YkU7yOaij0dgbNzxR/dLBbRnqpHhaI1Gl4oJBShIMz
	 i1NDIhIgwKbo4vZ+2SlLQqGcolOmuzP3VDZ4sXMNNzD7W1pV5nmQh09y2bLN3khTTLQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BGkuzeGO;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ke7jBJV9;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80104606A325
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 03:28:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 80104606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BGkuzeGO;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ke7jBJV9
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AK0GC5e3295291
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 03:28:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mGWP4K7gSyR4882ro341W5z3n7kWbxEYoL3WuUhi5sU=; b=BGkuzeGOJ3aM3hwZ
	bMax1U/qh4OrNonsZa52DOpUwDiS1t3VpeR8JvoNiWOXhCOQUg0q9nUjsxv/C9Fh
	mTvn8YfTUTN3yoF+CY6vHX2K5+6z38Yde0lz1amsDtDO4EkCVjupsiWeOvZvEcfX
	ISF4KCSn/UtsUAYb0VlMB4eyaUaQZ5AtY69/4tio0KsaJOWpWa48sr3DPYPLNzNi
	ChH5eY1tPn+mw5wfvVZ8jgjTSJAGCj/0n3AKxXBIz2oiWzbsGrS95+ace9st0I2M
	4/soKmdvhGBnm1uAX/LWElGFAZz/wjUzSoUdzRuF6OBzsTR24UPFa3US2YFNRBK/
	YUADDQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j1yghmk97-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 03:28:20 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3b4162e1605so580897a91.0
        for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 19:28:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795145299; x=1795750099; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mGWP4K7gSyR4882ro341W5z3n7kWbxEYoL3WuUhi5sU=;
        b=ke7jBJV9zxnG7tz/V5r+gnekEmRmcXcbmiJCxBJGNzD5HerwfaykvA+voMww6Dn7aT
         McTgDgkEI+YeSxYITvvm1lJbWbKp013gtWHZ8hqfcpN0CwB1PMIFJ2GaS/QqiTqsvFY9
         bAmiBCDbPRHTIDJ1I4rMXbaj9et/7Se9PWtQxi+i5XXJCWBwakSIEkYIUDidj5v9jnxj
         r0HUyj9Wj54j18jzbZSY9NiWrYAVOPGZZ78FipUFUqQUrE5t9++VldFdaIipIzQzuVpq
         MP/Z0B8mZ+vonau8ABNBA2WibONeUNEvaPCwzk4NKgFpABSHix4Xv16IHt3Tpa1IGksY
         jcng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795145299; x=1795750099;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mGWP4K7gSyR4882ro341W5z3n7kWbxEYoL3WuUhi5sU=;
        b=iWXp+THvFZyEnmZZjSliqu8DuSNhvM5N5C8+Ka1aF1FlVeaYz0pmUpBmIyN0uar/Ea
         DI9mqJylB+YvhXsIgg/kzr0N/vKCR8L9w7ETo7SGYqDLZIzSz+Z2jhdxjaRMelzer3PO
         pHq49zDvoXTuYPRpvHVXNIlaltQn3+SIsjE3sSAg6jCUK5fmb6mYN7pB6aUUm+nPlHYB
         Ez7BbuAk7aCd6c/ff2H/RR2Rld/0QbKHZsAAhTVBXSjwq3ofVYRO3s1/JH4RSTz6wljg
         B1fFbyAG4NLPAdFxd3rxNNeKYZSHo/Pym9MpHW8sPT1rtqQPp0S+hiWd8sA9/vxUviPo
         +QBg==
X-Forwarded-Encrypted: i=1; AL+hErEG5ptCOxwg8v2O8M1sAj4Drf6xS7flQn2FV1Qlih7mpCEjTAEBKDSmCns23XtEmTsgwhNxLyj0emuM@vger.kernel.org
X-Gm-Message-State: APuU4Z/edk2V/pnG0SJvUBp3UJBT/GO2ogVQDm33v4O+YEgemvC6YzTN
	S6tVER6fgtRnMCFHsrKtCd4eItvsjzjKzrv21uhstgQu4wyaueGgUEqFNa4YVmD53CuPdV1tlU+
	61IUjv/9k9QpbPxZs+jX9D1TVo9N45s9VB7oGpPyPCTyfXUtgt375EPL5M3dRra8m
X-Gm-Gg: AZFdTZf6NKJ7GRafmRNOSoxM46gYRvzsWXYGXtW6xSYP6vGJEYeZgI7uGDCA6OR49pc
	BQvjmkCbHKf+eYCEORZBXxS8mc9MQ4+2AgiX1IDBx8gHeimio36f6E2UWis0Jn2w/V3Rx+/Mj0m
	PXcUk6vO9UyQGo7jkRk9X3iIKUtc9MdJ/so56TS9SiUOImrRB7vMvcDEKVVmD6YDiJ+Qo8FMbFK
	8jxiR8nzI7vXK55lk6ddK3IPsR9JWe0mhkK7NUgil8+gLEjqPTDa091Oy0NCn5msgKw60q+ZXoo
	e+KWTe29pDKIB/KX7jP1pJaMHSNeYc5Y2pRcYoktSMATbUFG6cAegyaSKhHmeBiaObYpKkfeMoG
	S+zErBMdOntRWWs9OPfBfdKNdsqXPzABjwyiNoHwtM3ue9RxlNUWiVcf62sGysrYeZYoj9tal5Z
	+c6IHDsTlWlZF3m7luG4PA7mE4H4DsB5m4+Fc=
X-Received: by 2002:a17:90b:1a90:b0:3b0:e388:d9da with SMTP id 98e67ed59e1d1-3b41c92ce29mr1222891a91.29.1795145299339;
        Thu, 19 Nov 2026 19:28:19 -0800 (PST)
X-Received: by 2002:a17:90b:1a90:b0:3b0:e388:d9da with SMTP id 98e67ed59e1d1-3b41c92ce29mr1222859a91.29.1795145298821;
        Thu, 19 Nov 2026 19:28:18 -0800 (PST)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b40578d771sm5278297a91.1.2026.11.19.19.28.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 19:28:18 -0800 (PST)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 11:27:24 +0800
Subject: [PATCH v24 5/8] coresight: etr: add a new function to retrieve the
 CTCU device
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261120-enable-byte-cntr-for-ctcu-v24-5-2d792c6b4819@oss.qualcomm.com>
References: <20261120-enable-byte-cntr-for-ctcu-v24-0-2d792c6b4819@oss.qualcomm.com>
In-Reply-To: <20261120-enable-byte-cntr-for-ctcu-v24-0-2d792c6b4819@oss.qualcomm.com>
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
        Mao Jinlong <jinlong.mao@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795145263; l=2348;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=uwbtQr5CO9y4m2VKIS5xp7McWK7MGYHbpK99F1KNat4=;
 b=SLkUvEcl7lYrBTAQnWJAgtuq8pF0GvPrnlMCcAOC5CGloPzizcu9FlAXBO83peJqAz5ZVR2RT
 RpydEuqrPC1D/0d4Dg8ktxut2A2fNeKKBSaptBEH3qUiFHJZBUew0P/
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDAxMyBTYWx0ZWRfX99jKRms3ERJY
 HlZB7tKqEaXmpgESFc0H8tlXlzR7l1cTP1HFaJvCLWro2noLPcGRcU7Kh/UbbhjJTZu3XVeShb2
 jztAQDVbtRiRq4iVGhwBBNz0u+FVGpfY9ohV1R6oa5ZFpZ/h56d3l7+uoSQ1P8pupmV8Wdrf7Ob
 5rhzEKVozVcECRhftoRjdwpPpOsiRfZQF+4UCVQlEcfoxgcvs0EitWo9zwWiPspJLBpN1Oet/om
 ey6RnciHJahAnKHRqMqSFxDioOAOHwWjeCuAYo/xrvvqQ1cAP+qSP1jTZlUw5Z6BLHaSZa4N+GO
 WYudSHbVHGnT/MSofVU7sIzE288VYkOZgzRTJN/X3McFtos1J/k31phAQv0/cA2s9wtTpe8xSjp
 nhxGvRo0zH1cvZVQsQjnA6OgAvYvQQ==
X-Authority-Analysis: v=2.4 cv=Vvi2kO2n c=1 sm=1 tr=0 ts=6affbe54 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=FuIWbRVyn4pKkvqW11oA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: s1MhRwOMqQhmuQ9txGGOvDzRfJG-ITh8
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDAxMyBTYWx0ZWRfX6CTVf+AGSH8o
 Uwt7uO1hghAd1qqtwrZT5HEJudh3pebHGw/HFrh4EqpCSjVT92q7I2Hcejtlknt885Zy+Ga5y7Q
 5CbfO9f5LMNUxFYW7kpWpiRHFHEsZqE=
X-Proofpoint-ORIG-GUID: s1MhRwOMqQhmuQ9txGGOvDzRfJG-ITh8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_01,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 malwarescore=0 adultscore=0 bulkscore=0
 spamscore=0 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc=
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2611040001 definitions=main-2611200013

Add tmc_etr_get_ctcu_device function to find the ptr of the
coresight_device of the CTCU device if the CTCU device is connected to
the TMC ETR device.

Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 drivers/hwtracing/coresight/coresight-tmc-etr.c | 24 ++++++++++++++++++++++++
 drivers/hwtracing/coresight/coresight-tmc.h     |  1 +
 2 files changed, 25 insertions(+)

diff --git a/drivers/hwtracing/coresight/coresight-tmc-etr.c b/drivers/hwtracing/coresight/coresight-tmc-etr.c
index ba6a686828d7..308762194e5d 100644
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
index e94bd74e7c08..6fc0b136bc05 100644
--- a/drivers/hwtracing/coresight/coresight-tmc.h
+++ b/drivers/hwtracing/coresight/coresight-tmc.h
@@ -476,6 +476,7 @@ static inline uint32_t find_crash_tracedata_crc(struct tmc_drvdata *drvdata,
 }
 
 struct coresight_device *tmc_etr_get_catu_device(struct tmc_drvdata *drvdata);
+struct coresight_device *tmc_etr_get_ctcu_device(struct tmc_drvdata *drvdata);
 
 void tmc_etr_set_catu_ops(const struct etr_buf_operations *catu);
 void tmc_etr_remove_catu_ops(void);

-- 
2.34.1

