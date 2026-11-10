Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794280968;
	b=e9U14AyXT/3UruYDH12RcgoIRmne8/HGScyK62TS3DSIqDFNkqQnM1LqQhXDGYRmOW+J
	 HZKb28r50iP+2z9T4v4/n+U3AXwkPuxmhiVlASv6ODruu8ihxEv8vOPCmlsUxx3qOiyDb
	 l5gKaCPUcNpUK0J+/VF2T5NCfs6OzeBleiQWVJWfo5AfbpNB29RprfA0ctuJHETcMwU9r
	 6zsLTEqTpWhubxAEEGI0rvU+9/9xviKw7o0TSFjq1/x2uPXfz6ZXe7Vy58vDh0uldVLhw
	 XXxCYH+1evYRbWZwQalPpvn2VwcNiUumCE+uhy840RihOSEQki9UCx4hJL8G8G3Lijw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794280968;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=ZuqNEpDUlfFbdnNWjZAurd0lzCiaAXeLtHn+BckMIRg=;
	b=fLbZg/EVCoCetaaYwEYFlrrV5VP8HfCSFHVw7Vi6HgLxyiUD1puR2PaI9vvZ2sTzYh5i
	 BaPjcLOCFhYU846LRm3WOuBheZg04OMJ9syjVRS1iDdFanEa9qqhUfhSgL0IRx75SAGRO
	 WMJb0jBetNtBbdRFADoFXk4ZRsjfnqKvMmn6zbVViYA3ItBKF9piVu0Nf4zvTfz6fYIwv
	 7PCbFjblyjEm/OWxH+nSZ9fT2fEugxWWfSgnGaAKhHJIGt8/SGCc2G7rRfi2WG2SDweh6
	 ccyJ0FbTTlQGisyLLAXjDcPjvMN8PUzebsG0BxeJoi07fgNG+RVSNUEH6pKTwUqEZ0g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Y9NeKlJA;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dUA2Ozqj;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5442360A381F
	for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 03:22:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5442360A381F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Y9NeKlJA;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dUA2Ozqj
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AA0j7ge1853887
	for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 03:22:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZuqNEpDUlfFbdnNWjZAurd0lzCiaAXeLtHn+BckMIRg=; b=Y9NeKlJArDDZik6u
	i9r+Gc4AC2GlTg+Dgud0mbuq6zicQ2UbTDtbGicesU80GkiWuOk7f8CwJo+CrPD1
	kftSTGmQaC6cTgf/pXCY84uVI1xGqg5Xc5Tdk1JELl1PaINFaPzrvMkJdVNd8tTI
	Ly2xub9qnwbaeyAT1sey7CvkJpP+0S0OEXxvFIC65F2LGEvNTn4RYgCkSxBhrT+4
	N/gZ9DRad6UblyX2S1wxN5mn5FfmDH/DEfvR4O76H9qJrDCRkGkhiLhtgiQf8DHz
	XWTgylQsN+cZqf9oVmvLjNquAH/PxcwXS8yliiL2aJPQIkWKJnFUWrmYxh5vWCgX
	GZ2AuA==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hu6x2mpvv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 03:22:47 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cdba0aa55bcso916149a12.3
        for <devicetree@vger.kernel.org>; Mon, 09 Nov 2026 19:22:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794280966; x=1794885766; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZuqNEpDUlfFbdnNWjZAurd0lzCiaAXeLtHn+BckMIRg=;
        b=dUA2OzqjfuPKww139zibdMIN267Zqs6B4SW9713FlkUHfbbHLN/Ug2zQnaxc54n+/t
         Eg7vahXJYSeuin5xtfaXerEewdZwzXTKzP4WkuFk4GzYgSoElkoV4Ua3TaRrbjwPs0it
         OJq3eSmCfqcEY2ML71st/ro9V+PNhUSUzLtvfls6wIjRFI58uXQHrFv3PsZk1gAoLX8j
         a+HGvy8RIJPY+KjdvetbIkR+Wp69SjM+5itJMWBCfJTrC8YSGNNwyFmwriNwYmHFWViP
         VQEwa1CGvgT1T6FRT0RJTLt3UiOJRF86KdXs48bKNH/NrnJLiewyUKTx0D71Khau2yBQ
         H6rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794280966; x=1794885766;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZuqNEpDUlfFbdnNWjZAurd0lzCiaAXeLtHn+BckMIRg=;
        b=yti9DAZ42psqsOi/Cs7Ts4n9aV+sMbOrqUMdgrUJ4fzDFYEhXsaztOAAhtvSkPcTR3
         qvDJdwpIOYYr+lrPqvX40WUMDLg8vcKEEKfD/XdfI8NIjFaXQElQuBBm9qEgY/HiLZKM
         eGJbMmV7BHairEBfNi7MHh6heclK9kv1qazLNEics/DGz1QENd7n7J2NVZjU1U4WDMZJ
         GTA7YFIS31EyC/5Sddgmuot3zPvqSUr0IAQ9vsPjkl9KwxeN7sRUK4lALjUohUksGqg5
         HIYPit4JwuxMDNQPZi7qkfY+bCOhexgKSCNXyXsG92lBSyhQJW/xZo3sd+mLs9LZ3elU
         FsrA==
X-Forwarded-Encrypted: i=1; AL+hErEFKM8ID7OnYEUlWKEGC+hIUmebPF5MnfNBH9ZYWaESbTsxdKaBHnXwi2qCJMji/sFI5k00+Em4MkDm@vger.kernel.org
X-Gm-Message-State: APuU4Z+PmM+t0xphY4wKMj4Plf7ZJGNU4ShbgyFPcOsrkAG2tuLGdsY4
	AIah1sE+Rtse3MIPcGAVw9gZfk1wTSxl9325Ujhl5F6gSrnqB/GYGeo2zmBr6isCUrVJzTQe/Zy
	+KupW9HhDZDhmkl3ZI/TbFM7G/GFvaq41dPdUzCqNryhYWo6sbB6lhLCj5NigvCW5
X-Gm-Gg: AYBFou2cocUptH7APEsB9DAatjsrELnHH4sRbPcRvJn1EMp5sS5khadBYY7BUAbjmPg
	+iay7EQCaLDdsBOPyjVOmz4R2lyhcGRbv8irVVpEKTd526iQRf0SMylzD1+yIm2ZUk4l+rVQt14
	oA42Qrrd3CxVYcS1cOa/t0R+SjUjVUoJE/OS+wQkTPDBayl36kODAnQspH9cICn4ie+/5RD65mC
	MXBUcSfyoNmKOuKf38aitX4j3U6dNLi850xU03PUoedXJ+IppwzCOEM58htz7lXmrAOFVUhzRDr
	WMAfHlizYaiVrL4Cfx2ytwN/78RepdF+1Pw+l78MuHo8SFQ58E0taC7tclfnP2PVGztXI50tO5B
	3BeRvMXPfc4r09Aw2DyoGqoF7a2YVPsPg6sq/ZvUnZIcn472PAB7p+QZxtwctyfqIyx7+x1C9/h
	F5kVDjBVeTD6VhkLenznaX+D5PO3XLdm2kqNtQ
X-Received: by 2002:a17:90b:48d0:b0:3ac:7c52:faeb with SMTP id 98e67ed59e1d1-3b166cd0dfemr1871302a91.41.1794280966167;
        Mon, 09 Nov 2026 19:22:46 -0800 (PST)
X-Received: by 2002:a17:90b:48d0:b0:3ac:7c52:faeb with SMTP id 98e67ed59e1d1-3b166cd0dfemr1871273a91.41.1794280965687;
        Mon, 09 Nov 2026 19:22:45 -0800 (PST)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b16fea4243sm2341a91.14.2026.11.09.19.22.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 19:22:44 -0800 (PST)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Tue, 10 Nov 2026 11:21:27 +0800
Subject: [PATCH v22 5/8] coresight: etr: add a new function to retrieve the
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
Message-Id: <20261110-enable-byte-cntr-for-ctcu-v22-5-05d48c0eb110@oss.qualcomm.com>
References: <20261110-enable-byte-cntr-for-ctcu-v22-0-05d48c0eb110@oss.qualcomm.com>
In-Reply-To: <20261110-enable-byte-cntr-for-ctcu-v22-0-05d48c0eb110@oss.qualcomm.com>
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
        Abel Vesa <abelvesa@kernel.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794280922; l=2348;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=Y/FvSaBbedQq8aKjgsZpsJQaVI9vU9ZVyO2kbtYJAR8=;
 b=V6M7HUx9Kms3500hr5WZuGK8cd06NyCwD55SfWh+pDqabilgAIs6G7iRqWoYD5IMsLKodsx0c
 g6c8d2cIg19D5JiY8rMe9D+/kgU65OIqoDGzzMAuOw5l76/ZxcXBWLu
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Authority-Analysis: v=2.4 cv=TMjQ2Fla c=1 sm=1 tr=0 ts=6af28e07 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=FuIWbRVyn4pKkvqW11oA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDAxMyBTYWx0ZWRfXy2Mgo6o1plpd
 FfIy426v4rUPi+R225L8l4lPeHB5GRO6Ep6gaKXoeYCRRva6FmY7jg1bNm0ZUzavcK+nOjgM2JF
 7y9UN4Rhb4WtJeQwjfeTBXaIpM6S4msiJdvSOqZe2SMsXi7FKGyMxZwpAuZRb+heksi7N4GufSo
 up7fmUzxZf2CNWekTYqzT+sBsLEU8HVdFTaSiJVex78rctKlgdR+PBc4UXJi3p/MXwIfQewKL9/
 3UMsHD0a0PB+ss+SEjq8ohetmEr2H+0knLoF6vcstvV5KNSQCq8yM+w0oIV9Y8hE0YOwBtiD31L
 0KNCbvGbDYxZg2xSSD35yUGJbm9BmhGDUswqqJXbI1Z3x0Bd0ZN/bvUr9y51v391hZ5XDFC/vch
 b+5X5Nwcj0Qi/DDOzu5Li15xKAPbFz1SbvyK+VfH8FiGRJpE4ikVcexW06qajlkG+qLovugFkj8
 UpGVXF/BtOAMP5BzjkA==
X-Proofpoint-GUID: fvQsuyG2MIIxO74Oc67KDPhE7IPj5AGO
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDAxMyBTYWx0ZWRfX6nbHrMvBKzWb
 wjd7AhkAvXOKcR7d2CAGXN1Ja3weq8oJ+977WMwhpeQ4wQrUL6eh+skVIwAkuM6DW6kDLEZJtvb
 5lQB7udAuyavPTtUDT4EaUZshKNV7eg=
X-Proofpoint-ORIG-GUID: fvQsuyG2MIIxO74Oc67KDPhE7IPj5AGO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_01,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0
 phishscore=0 priorityscore=1501 spamscore=0 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611100013

Add tmc_etr_get_ctcu_device function to find the ptr of the
coresight_device of the CTCU device if the CTCU device is connected to
the TMC ETR device.

Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 drivers/hwtracing/coresight/coresight-tmc-etr.c | 24 ++++++++++++++++++++++++
 drivers/hwtracing/coresight/coresight-tmc.h     |  1 +
 2 files changed, 25 insertions(+)

diff --git a/drivers/hwtracing/coresight/coresight-tmc-etr.c b/drivers/hwtracing/coresight/coresight-tmc-etr.c
index 5032f5598e15..cc341cdf8d8e 100644
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

