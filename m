Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793612868;
	b=G8v/tVlMBxaUO68IqOWB7ZhttBDXHxrmN4RYgPRGNrXXJt3mKqiJfAVVow6umPjpjLXV
	 55951dnziMG54pGGL5lv42qcvRHcCBg9Z5GZ/yZaHohPrE6qssO60yDXKAqLaZHQKJ26T
	 vZ9VklBcjuxGKvO9fDdJYGfFNdY+jpyi4eFhJxI+C/Er4lngHdU3agN/Bn6J+RxoEk/FM
	 q9YyKEpPBECAy2eJcp5hwMIZP6J9cf0xkL7XaUobBb/0EYDLF/wQcaBhEHQRZ4+8V27Hl
	 xd9+rI4+zi7itFy5u5f4dmgo8Snr37aLU/rNeKBa4qhrcQRQHbulTX8/S+YERDdG/iA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793612868;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=EopcEXVJlshc6fFdssRRk7Nmikd8/mCpBz6B8w6T8bU=;
	b=VKqtrSpDDEJs8xI2ExgpM3Uo9W6U5zE5rYRR0vYKdqy6E6bLBqJHVx0pT+vJGPhAxG+h
	 QMvAuektGg6wdNTlet4KK8F0XEO3VqvYcSpddf/gj3RJNf/JskY+zw16bByGTg9tTNwEF
	 MESX3bi35ARRkHjgHT/M/0DfU1qVY7XJASO8DFJNkFdNrAoR3tZ9YJRHo+CRegSqRpdNZ
	 qfhBTY00MsQBCze4kx+JBlpyRUgyLxQ6HQ/Q229M3bq3CfIROOyMRsHblG6Z8MdoQgVb5
	 a+0lmCBMVJh2yxSV4L7+GeF1Yg6tQ70GMlT+oUNjiFv2loSnKYq/OMfkF8s5uAy+E2A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mHk190Vv;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UmUQHS54;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2614606A337
	for <devicetree@vger.kernel.org>; Mon,  2 Nov 2026 09:47:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B2614606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mHk190Vv;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UmUQHS54
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A29A69t213981
	for <devicetree@vger.kernel.org>; Mon, 2 Nov 2026 09:47:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EopcEXVJlshc6fFdssRRk7Nmikd8/mCpBz6B8w6T8bU=; b=mHk190VvNDxCyjAU
	jOxW7DpEW2RjomncdQIKanJwYxnrHQJMQY9UmATTa0BDsg3mWuIOfYG061G6MVS+
	XejDBe+qkRtwJaoNrE7wd4SAwzIbtf6XuxD48nHNNa0aS/4ckAUgNhrYWLqMdvv0
	bi7qbkUGHA46QmGRANwLgMS/VN2AXkpYoHQNVOqo25kZR+mnApoM7z2cxK0XgWx2
	7s9EAhF3BXl8jJ25WV6ppjLBA9AcShdez45U/fdIBEHFEo220B7frMKWCN7Fm6W1
	2LHEUU5+NDs+VRF7f7+951XxvHmVJl5PaxG5Vx8PA8SJc2wC2AihKqig823GhfXq
	E/ANcg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpmf1ryh3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 02 Nov 2026 09:47:46 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3ac7a4ba546so2937380a91.0
        for <devicetree@vger.kernel.org>; Mon, 02 Nov 2026 01:47:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793612866; x=1794217666; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EopcEXVJlshc6fFdssRRk7Nmikd8/mCpBz6B8w6T8bU=;
        b=UmUQHS54WrXpI8T1A9R5DQMowWD8xbHKQIt+yflf9wnPSV9RhlufI1d8ul0lI1QCV1
         VWLj5kwQTyPIWDxhEBKRdsaep9oeqapG7ELaKngyvscTV5aBsaUhSxen9oeFp2VcO+F2
         ECFx7Z7bNXboRvjEzcpcfvKzqWTMdWp0CM51N72AJ/nBCmIvrc98LK6b0WWJV3Hy8uLV
         FLF6EHoyhKisGyP8ZwxbxfOofwJ2zDXM4Kx8Nwd3ax3HUY/WIHUJ+SXNuWXawML7lVHH
         UXpV4Hw6Sf8Tt1YTI2i7AsnT/OrPq6COHU7EPAJhYxvdi33HdPo17jpiwr3SzEBFU1na
         5CdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793612866; x=1794217666;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EopcEXVJlshc6fFdssRRk7Nmikd8/mCpBz6B8w6T8bU=;
        b=G3zRXBiPx09pNITnlcOyAfTTq3d1yC8CVO0O4d6noDXqGUfbDdqJ77kGo55UD7U0iz
         /2YiG+JYwDXvIvl1DDsLSWLjYaEJ+pxQ9U45734dyNZO99IvJICHbgNieiEkFrhTlBW5
         4AtWGzatk6RyAQXNI/hSrczR28xhoxf+zgJJCSLcSiv2VyDSseuozqPUxzKLBGPBOxvu
         nkUaHDDzDSKy/+DCU2vdvaf1wFn6o0iS2UnI9gB82IJ9GIOympT1fhZQQr07tu+EAcBZ
         skADvB+S0JdoNVJbsRKFxLlzosB3P+QCHq5dafZFCce7t3u7uxqMRZlkxY4AoQFtVYRa
         zq0g==
X-Forwarded-Encrypted: i=1; AKwUvBwzM1F7aJRhBQKTYevWej7QW4oD5acohDxoPoHQgeKyyncn/wJ8nT1wwLlodxb6nFrYt+21d0El5Go5@vger.kernel.org
X-Gm-Message-State: APuU4Z8zjEcVXXeZSziuscqOXD5gHX5JM1YH5sQ0Kb0VAJ6YUYigNFfr
	xCB/AXiCHjY8wHFEnQpHPmbMYViB4X9jpTLDSz2U86jSbzwJfBewDEGk40Mhn5f93+ABuSwZXpV
	OJG8Ie9PU/Pl6Z0lBbiO4otE8melehKjTmzgSUJ1l1Oj+IS8IUmIewwHWlQMgKsyx
X-Gm-Gg: AYBFou29zdIGUrieYElT82ig50l9aT/RwlDn3LJ+GyU4yFXhtID2lQ81WF+Rb3xFba4
	8uGX2InbepFyKWEZGz4Ae41f/SGv8ZOPihuF8Opgs7Hd7b1OfpUXALy/1ZSbPCTHUNBpnvdLDiL
	bpFNre8+vhN0i1UkziKX8KWDIFff4SPfOUxU9ErCxIaWEK1X7wAyz+xkQK65TuC67CY8qO9Fpkt
	iEYatp0pAgUaa2H1jAWZxl0ZwNKBpkJgd19HzKR4EcykqPYBe4LHY5PWt7Q8+T329AAhtWUy1Bi
	mECX/UqGucahJwqwappiEHiLilWvn9LPUaoLFRHP65MSPXYpi56FYbqDFMagXUipR2zyh8zSA7e
	6uho2kEPduya8udkOX0LLK230rIHLP0U9mC3kBUfabdpiTT38RmzLw2QyjVC+DYwyjL/UNZTyYw
	92asuwOUD6k+JKurD8QhMyMWqMnKf5jj/3Ihw=
X-Received: by 2002:a17:90b:280c:b0:3a7:a3c8:8f4a with SMTP id 98e67ed59e1d1-3ae8972a6d2mr5341901a91.18.1793612866226;
        Mon, 02 Nov 2026 01:47:46 -0800 (PST)
X-Received: by 2002:a17:90b:280c:b0:3a7:a3c8:8f4a with SMTP id 98e67ed59e1d1-3ae8972a6d2mr5341870a91.18.1793612865710;
        Mon, 02 Nov 2026 01:47:45 -0800 (PST)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3aebaac28c9sm5053234a91.15.2026.11.02.01.47.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 01:47:45 -0800 (PST)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Mon, 02 Nov 2026 17:46:33 +0800
Subject: [PATCH v21 5/8] coresight: etr: add a new function to retrieve the
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
Message-Id: <20261102-enable-byte-cntr-for-ctcu-v21-5-231e069b7853@oss.qualcomm.com>
References: <20261102-enable-byte-cntr-for-ctcu-v21-0-231e069b7853@oss.qualcomm.com>
In-Reply-To: <20261102-enable-byte-cntr-for-ctcu-v21-0-231e069b7853@oss.qualcomm.com>
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
        Mao Jinlong <jinlong.mao@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793612830; l=2348;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=xCitoVuPyJdwSq/nLCm3rX+LYZy3JMTxp5Mg/VzmuLM=;
 b=5p2RYwhfoSCqZkty7pDs+7dTH+BH8Bgud1+7pW8gEyNinxJ/eqvEgnmt/bmLvWqgYdKb3BUd6
 JCRfQNfi86lDp2fsgLmxn7w0iJoIR3bLMMjDDYxd22InIfHVOXchugo
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-ORIG-GUID: w4dJP9EjRu5FLPgrCsN7vuM8IfP4GM22
X-Authority-Analysis: v=2.4 cv=bNaDs/+Z c=1 sm=1 tr=0 ts=6ae85c42 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=FuIWbRVyn4pKkvqW11oA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDAzOCBTYWx0ZWRfXx0TI2ihR5toF
 wbxHOiOMgRgvVs4E74goshF0CBiSBvd2hLwINVbaHl83oIwmiUZys0rCI/F+olHLrR0hdCVO4du
 XpJr5u9phy4Yr3sxCwSs6EB1gIZEIBSXG6pBP7/oWnUZSs6N8gFX9hZ03cb4V7+DN5k4ixgM5uD
 4h9qQrXTzViGzCLpyQJcC3aeKkAV5vGlzMy2vtFM1ubNK1hXj7lXpNrVbwBSSwmk+terf9ed8kT
 ZKxjYN26dUfBV7iVVYb4H89Ni39ychrMEh5658qj8I/urplO0HVkjL53y8phQhJf0kg073SyHim
 rGMCQzkZWtfJUL7ncl9RlUW+hwUMoVd2I6xeMMqBytKY/8wNcQJZfzgMJuc/KM1zxgSDBv3MCKe
 elOV5aH8ZXfPErjfilF1Iuv9hs28YajJhIEaAsfvH9a3gh5WpXOSrtWfev12RmKzn88CI1ZJxLi
 YGcOc9l0VuZf/TCPcOw==
X-Proofpoint-GUID: w4dJP9EjRu5FLPgrCsN7vuM8IfP4GM22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDAzOCBTYWx0ZWRfX3F2hH7K43URJ
 zrVRAXHCcqZ//gjlEtM9e3Km1N+/vjRS6SeKiI3WtRCbfHXevRb8hZ3D1wCE/KhwtbM0ugOw/Zm
 muxLrv6JXr4IrROP3F7x6htXiIUVVUo=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0 phishscore=0
 priorityscore=1501 adultscore=0 suspectscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020038

Add tmc_etr_get_ctcu_device function to find the ptr of the
coresight_device of the CTCU device if the CTCU device is connected to
the TMC ETR device.

Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 drivers/hwtracing/coresight/coresight-tmc-etr.c | 24 ++++++++++++++++++++++++
 drivers/hwtracing/coresight/coresight-tmc.h     |  1 +
 2 files changed, 25 insertions(+)

diff --git a/drivers/hwtracing/coresight/coresight-tmc-etr.c b/drivers/hwtracing/coresight/coresight-tmc-etr.c
index 2de31d73a4b4..bf4c1d8f7b2e 100644
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
index 36c80918958f..2345bdbb0b9d 100644
--- a/drivers/hwtracing/coresight/coresight-tmc.h
+++ b/drivers/hwtracing/coresight/coresight-tmc.h
@@ -474,6 +474,7 @@ static inline uint32_t find_crash_tracedata_crc(struct tmc_drvdata *drvdata,
 }
 
 struct coresight_device *tmc_etr_get_catu_device(struct tmc_drvdata *drvdata);
+struct coresight_device *tmc_etr_get_ctcu_device(struct tmc_drvdata *drvdata);
 
 void tmc_etr_set_catu_ops(const struct etr_buf_operations *catu);
 void tmc_etr_remove_catu_ops(void);

-- 
2.34.1

