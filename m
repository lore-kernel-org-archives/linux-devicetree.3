Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4AB5387572
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 09:49:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774259398; cv=none; b=IYB5ypofhkVY5XTal5C0vUVfL2uEVs9NzOZyv3qUCiYG7XjClcbnSZbHOHvphi3BIfak/V4XmQDnhRgB12y78ODA6jV90uxEsX9bn+u4LHFPpyFv9zJOYklmBilpflvpyGfqbVrXJF28B4RtIoi5uy3Ik5/WMoWjKuZVPT86eVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774259398; c=relaxed/simple;
	bh=ckf80wWUcb1qnI0v7q/6ZqqYr3nuJh7ROL35EVLOH7w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kA8KM/eP+5IIA+GV8bFhiKBfIj0cUxsSfDoT5Gtj7lIslaD6udoaaX4e7Q7imlDCG9krlP6+jfVRrbskcpAgl2+MuqiDX/OsHSXRgud0A6re2Xt78H0rRLDWj4EHjWIc87nbtqHew6zpOsgmrGPcPy66gPsanzSt+FSGovN7q8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Mn7WVtAN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kgFAvpZm; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Mn7WVtAN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kgFAvpZm"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62N40xkW1583965
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 09:49:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aOdpdbZJkeNi3c6n6qEjoFu015+pEeWRTwmOxcPblaY=; b=Mn7WVtANdLkIu+8d
	ykBDn7KOR2vtBgKonqxOg0r0blLWFH8TBhoKkUME5Bk0NcZySln1ruTj4QQn0pQW
	rEpWrqmMGi0rM5PveuriqY7HMp9LzXugw1t0AombowwSCleZ0sKJE5z/Avk+Qv7t
	Qv0mDQY7c/kK0WKeeaxvAtA/5r/qFZ9WF8Zl3ChMXON2hT+w5DejOeycpqwhXWrI
	VZLRzQl8IplW2b9MS+w1SmIHavZfa9mQpxLEEj7C+TeNcgv06Rp+kBYgWrwFL82/
	DXHD/nRVrXZrmvbzB1ryz48TcnUCNynZVBCNUspOI2oAPfTnPWvWI/eVhCSykXXX
	DN4KEQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d1jng4tm6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 09:49:55 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2b05d170cadso39833035ad.0
        for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 02:49:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774259395; x=1774864195; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aOdpdbZJkeNi3c6n6qEjoFu015+pEeWRTwmOxcPblaY=;
        b=kgFAvpZmVSzAQqXc3K8grVmwyFog8rDnkztt4dYxTC7NGrcM0l0Yyn8+LH+yakIzct
         wNr5QeQgT43GSlefYSG+Oy5vrOst9eGcTUTtRfiHmxZylOUOEgoOZCwPtdliCtsHlZg6
         RIFdhsfY0/PE/Zy5uN+mBWuEC8C5dvMB2fhu9le2YMnUEqsuMYGSPFbBr86VF60jF96R
         ypW5xOKG8Iit6seKoESyOiaXSzydcVBYcHkKKhgn2dEySOV+u1OCK8IWn4Zm77xt9p5h
         Rr7ODbJ4nxLRC2x0LBV9we0VrFIM+z8jhF7PsXxtnTFNEd3qMf9obMDPriE9nNFpLUNj
         M5Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774259395; x=1774864195;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=aOdpdbZJkeNi3c6n6qEjoFu015+pEeWRTwmOxcPblaY=;
        b=Sy25GQ9/1+crzfs4YOW6qWxXS+wEOVX5njYsZ/txQ3FeLOx9VuXgGUHuayEdhFLf2H
         +8Sl8vt7LLkpS3F03iS2wk5vMGD/tAh0ZvVQBCW2dshrFSOROqHizg03LhPFF/bmiyEX
         lYiST5gjVNYuRdxqEMEi3tziiisLqQ+ku7dJRAtpTnvTgN7ZtC3gGGzU94BPDPqT3eIy
         itRq7QjuMavFC77ChTH5ebjdAZTAKqEmhYrHyHz0lVAxywWPzWsJ9tHU1l77KTIZocX/
         d64HwEnZpAzGwDSAJMdibfXoGxsBM3UxMPzJuVjYO6wetCwjMXwRMjEiBcmlBBeXWKz7
         1bPg==
X-Forwarded-Encrypted: i=1; AJvYcCW1ge6v7bEusYsE41XbpXH/bq6sN1LCSl6j8ghKLae3efi6ECmHose0X6f0qncq1vWv4YQtF9Zcm0Mw@vger.kernel.org
X-Gm-Message-State: AOJu0Yzqy2OutsABUxY1E/bE3JbnVynrr3xagbCQzCTEN5JsNM8h0ELw
	+VO9PnA8jRx19qOyOWB1o/ayvujuHGqTdQYzW7gpoILv/mvWV/nMuOIEIIDxcCDz5Ft6KH7bgKq
	emFSqzFCo8q8+U/f41/vDyQUdLeeAfTj5RB44QYdpqRIY0XBgieWBqkm0DqyrNdqH
X-Gm-Gg: ATEYQzw8vINTTeY/qNOUp/gUDbiV8ZNTJlPNEWto+/Hevk3+imGkTr/x1Be1nSaDxXE
	EdgyyvJGGsE837qPARA01xedkzsSyvbgb1xKqNPCWxENsL4SpH+57UR9BBfcTQHhXLLnhZqdD96
	Pp1j5ybm10lVf2g+hakZP7v14TuIlpRP/hgAVF18tGwvAtB15iTXIEneSwxtZUCJP5PMnoLdUQ5
	Qqt8yvx8Bu9GACC5G6522e5XGcY7ZqBUbAkeiY3FKWXJ1j7+XZlvbFYA0abPqzYiPSK9ZiRShHp
	Kd4m0jCf46exMMOs1NcpfSGfIH9CUZxXe+nqOwS9a7dOlcwlpd01T+GIW0IFoQpqFpam2CUBFug
	t9bEjBghA7KeA5LbpyRv6AzoiyQhDZhLieGfAoLxVdnDcauks/EZseBiEOKoMwKgAoWQA3PIMj6
	uKekyFwkLk
X-Received: by 2002:a17:902:f545:b0:2ae:5655:b16 with SMTP id d9443c01a7336-2b0827556bfmr114909105ad.21.1774259394758;
        Mon, 23 Mar 2026 02:49:54 -0700 (PDT)
X-Received: by 2002:a17:902:f545:b0:2ae:5655:b16 with SMTP id d9443c01a7336-2b0827556bfmr114908795ad.21.1774259394276;
        Mon, 23 Mar 2026 02:49:54 -0700 (PDT)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c743a939af0sm6591935a12.16.2026.03.23.02.49.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 02:49:53 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Mon, 23 Mar 2026 17:49:26 +0800
Subject: [PATCH v16 1/7] coresight: core: refactor ctcu_get_active_port and
 make it generic
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260323-enable-byte-cntr-for-ctcu-v16-1-7a413d211b8d@oss.qualcomm.com>
References: <20260323-enable-byte-cntr-for-ctcu-v16-0-7a413d211b8d@oss.qualcomm.com>
In-Reply-To: <20260323-enable-byte-cntr-for-ctcu-v16-0-7a413d211b8d@oss.qualcomm.com>
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
        devicetree@vger.kernel.org, Jie Gan <jie.gan@oss.qualcomm.com>,
        Mike Leach <mike.leach@arm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774259383; l=3771;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=ckf80wWUcb1qnI0v7q/6ZqqYr3nuJh7ROL35EVLOH7w=;
 b=w8ZILQOnGTMowRbpwWpLUHa5OOF+7MJT/Ml5rl4sI+DJZQpFY3JY/QPQdMZL7gqB50X0CQjcF
 Ld7n0gX3kSYAOt22Gbfx3Q5bQ5n5sDS6wUCigNYTrtUhtb2T00rpytb
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-GUID: chd0nFLVPBrUhoxBF-wh2CXPQk-KD2kl
X-Authority-Analysis: v=2.4 cv=Q63fIo2a c=1 sm=1 tr=0 ts=69c10cc3 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=qQZ2XtAyJf2dEkEvaVsA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: chd0nFLVPBrUhoxBF-wh2CXPQk-KD2kl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDA3NSBTYWx0ZWRfX3+h4FcZMxc10
 NAdClxm5HvTdie5p3s3dlgbY8fOHkE5HQB8jgGIC17fD9qmMYmMFpCHVY01JAodIdZd4jCo0Q2Y
 xlWxsXnhInA64kI1dohdB9qtd/MvQBesjuJqC3OgGkpKqaHo1+FTjOKkMiqi3U0qdNwe6oO981y
 aqV13XT8GXsGTeqrwD/8nLKi/U8P6S8B9lAN/zf/T7DYrt/CjKhP98NCZ12UM/jvo8TThKxGj5G
 Sp+YywPLi51CYzxkrryM5ljOzzfpeqEslnsEj2EVDSqRIUQdfO7DQrCBe9qvqG0K1sHpC8dVQNI
 yB/nM5wnJSBh1i0c8WSeq1a5lMfT3kolAk63F1Sjh8wa0H4IrfubFUM1v+yIoGATCCNXz1zE2E0
 KCvnoAnm5BS7veQvH8zOoE11zznmi1/STK2pNjTsTYCIzF9ISSwAL7J826SihfBYsLJOZOkhAkS
 o+VnNGBU8ZzpcXXRXpg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_03,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 priorityscore=1501 bulkscore=0 spamscore=0
 malwarescore=0 adultscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230075

Remove ctcu_get_active_port from CTCU module and add it to the core
framework.

The port number is crucial for the CTCU device to identify which ETR
it serves. With the port number we can correctly get required parameters
of the CTCU device in TMC module.

Reviewed-by: Mike Leach <mike.leach@linaro.org>
Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 drivers/hwtracing/coresight/coresight-core.c      | 24 +++++++++++++++++++++++
 drivers/hwtracing/coresight/coresight-ctcu-core.c | 19 +-----------------
 drivers/hwtracing/coresight/coresight-priv.h      |  2 ++
 3 files changed, 27 insertions(+), 18 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
index 46f247f73cf6..221de57ca57b 100644
--- a/drivers/hwtracing/coresight/coresight-core.c
+++ b/drivers/hwtracing/coresight/coresight-core.c
@@ -588,6 +588,30 @@ struct coresight_device *coresight_get_sink(struct coresight_path *path)
 }
 EXPORT_SYMBOL_GPL(coresight_get_sink);
 
+/**
+ * coresight_get_in_port: Find the input port number at @remote where the @csdev
+ * device is connected to.
+ *
+ * @csdev: csdev of the device.
+ * @remote: csdev of the remote device which is connected to @csdev.
+ *
+ * Return: port number upon success or -EINVAL for fail.
+ */
+int coresight_get_in_port(struct coresight_device *csdev,
+			  struct coresight_device *remote)
+{
+	struct coresight_platform_data *pdata = remote->pdata;
+	int i;
+
+	for (i = 0; i < pdata->nr_inconns; ++i) {
+		if (pdata->in_conns[i]->src_dev == csdev)
+			return pdata->in_conns[i]->dest_port;
+	}
+
+	return -EINVAL;
+}
+EXPORT_SYMBOL_GPL(coresight_get_in_port);
+
 u32 coresight_get_sink_id(struct coresight_device *csdev)
 {
 	if (!csdev->ea)
diff --git a/drivers/hwtracing/coresight/coresight-ctcu-core.c b/drivers/hwtracing/coresight/coresight-ctcu-core.c
index 9043cad42f01..e8720026c9e3 100644
--- a/drivers/hwtracing/coresight/coresight-ctcu-core.c
+++ b/drivers/hwtracing/coresight/coresight-ctcu-core.c
@@ -116,23 +116,6 @@ static int __ctcu_set_etr_traceid(struct coresight_device *csdev, u8 traceid, in
 	return 0;
 }
 
-/*
- * Searching the sink device from helper's view in case there are multiple helper devices
- * connected to the sink device.
- */
-static int ctcu_get_active_port(struct coresight_device *sink, struct coresight_device *helper)
-{
-	struct coresight_platform_data *pdata = helper->pdata;
-	int i;
-
-	for (i = 0; i < pdata->nr_inconns; ++i) {
-		if (pdata->in_conns[i]->src_dev == sink)
-			return pdata->in_conns[i]->dest_port;
-	}
-
-	return -EINVAL;
-}
-
 static int ctcu_set_etr_traceid(struct coresight_device *csdev, struct coresight_path *path,
 				bool enable)
 {
@@ -145,7 +128,7 @@ static int ctcu_set_etr_traceid(struct coresight_device *csdev, struct coresight
 		return -EINVAL;
 	}
 
-	port_num = ctcu_get_active_port(sink, csdev);
+	port_num = coresight_get_in_port(sink, csdev);
 	if (port_num < 0)
 		return -EINVAL;
 
diff --git a/drivers/hwtracing/coresight/coresight-priv.h b/drivers/hwtracing/coresight/coresight-priv.h
index 1ea882dffd70..5532ec82e82c 100644
--- a/drivers/hwtracing/coresight/coresight-priv.h
+++ b/drivers/hwtracing/coresight/coresight-priv.h
@@ -155,6 +155,8 @@ void coresight_remove_links(struct coresight_device *orig,
 u32 coresight_get_sink_id(struct coresight_device *csdev);
 void coresight_path_assign_trace_id(struct coresight_path *path,
 				   enum cs_mode mode);
+int coresight_get_in_port(struct coresight_device *csdev,
+			  struct coresight_device *remote);
 
 #if IS_ENABLED(CONFIG_CORESIGHT_SOURCE_ETM3X)
 int etm_readl_cp14(u32 off, unsigned int *val);

-- 
2.34.1

