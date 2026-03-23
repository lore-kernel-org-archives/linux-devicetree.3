Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 441353876D2
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 09:50:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774259412; cv=none; b=m3DjOrhH6K3fbVo/u1pONED25+V2TKTN8BmlmIB2Rat35RRnHLv0d2OElBTgZaOrpnrS5H6xHhzmmENJUkOoRsXzrDfFAlP+7AfWu/ZueinvWFEq6fNbry33zF+BukYOwJw8Wl0FP9K7MTFPar9bamn0IuM60M7TKH/ZqUcvT44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774259412; c=relaxed/simple;
	bh=QjBBWW3nZNJQ7dW86dG4Ar+IGXRSYDsLrfUfjlg4xNQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OoEqOcRk9oOahjGYnn08P34bVGY2k2bHYssEU2Ksp4XVJNouP/0VYr6rMOa7CPbttPU1rw2OkTqxODe5kMIPWircvOd9NMCqXoV8JGhzZk4aUVke1H3SjmeOXMnTgFK8mk1iB9ptrBi9pyF3FXsm7BmygUSC7MbZHl9FSDV8oOA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OM7em+d9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Z1EnM2Sa; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OM7em+d9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Z1EnM2Sa"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62N6nvxP2044226
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 09:50:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XNFnCKRlYseUEtoxCTko5eEC5pQQo7W92i+zQLuCE1k=; b=OM7em+d9dFVzcj10
	BE9dEBV/Ch9Z7m5LogiYs8z2jp+aiRvhNsVZhNDeoU0GolWGLQcXeZ12dQJW8hPr
	WJE0BWMXv/72GzSyFsVRZpfkAE6y7A0ed7F1Dw++MwUCm6fuIosfuc88Bskztva4
	gFMlzKvfYndbVfYJI2tEkaIZ9QRjwP4cUe3Oh69r1NUclcUwVREwaAlAYFarLYpA
	Dbbmw3s/+1N4D1n4OcU2o2czOWY4iHJvKsTZVZ/RPuZ3SOKl99Ureo5UMDCwuZX7
	b+LMbwi1J1cbJEuv7q/lAz+Ml089Ph4P8G9ajUlgB4uG9GiBjWJNc4lRXrVuTTqA
	RDzNtQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d1jb5mvxy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 09:50:10 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2b061bf1a2dso29881255ad.1
        for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 02:50:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774259409; x=1774864209; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XNFnCKRlYseUEtoxCTko5eEC5pQQo7W92i+zQLuCE1k=;
        b=Z1EnM2SanCMsKWPIoXhtMeS0KJwZGcqLpMXWhQiqQOCVBHSgYDQUooC9YqXDKovrFj
         v8ULa6U6wKqNHFwRc+U8wdzRYYdqrvd5VG3cEsjny7Dxo7UjbJWxRw3Kd4Sn68R5ewng
         4IxEYbIuc9M5Jh82zE5ITx0ab4Se1+Z/yVwhhtDakyMtM9gIEUcLacdxin2OPdqa3Y9K
         Vu0WeQrU7z5DpXjBTWN7gas8D/ZTSwQhxic7KtQabqVDCVGTROD8wltFSZGpV4ckMkQs
         9gl8C7cBh7YHphKhXFMtBuhKfrLhILH8fecf3ux4zeCWsUurmcZMS3xBUn2GdW+ScKiS
         dYMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774259409; x=1774864209;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=XNFnCKRlYseUEtoxCTko5eEC5pQQo7W92i+zQLuCE1k=;
        b=VmeIbV3dcAk5YIm77VU0VCY/jnfpfN+DN12yo1LjgMLFWF2qZ8MspJzqZ2jnZ6Csne
         PIplnAFDKG8zJEtqWzaoD/JXOHtuE6slaJCH5yCi35O6wI2LkXqQ0zxRXP8t+uYbVQs6
         tueTciGI0ZhrmGIdHsGRzKb1ERdG4g7HPruWIhd57aCjWbcOY/lboMIl+KNPx7rtvjEd
         06R/xrfzq2BpGGeO6PrTZ9YRhcqjUTqVvcb+gXQeE9Fg3bWOd0dyZsgGu5BQVKIymh+Y
         EPm4F6Ecg4qHlsI7iBLyuWKpf8e3QGwh3eFtvJvQ9zfXCEpgt4cncNqo6VxI0ykQj5oi
         bMYA==
X-Forwarded-Encrypted: i=1; AJvYcCVfPL5fS8f03dMVnyxJKGOT5vZ6Jz0+SFB637BSyVPYFpKQiyY3pe/Gh4SyMLUHeLITq8DP1KiFYaZK@vger.kernel.org
X-Gm-Message-State: AOJu0YzphsI5Lf6wst4l06vP1nvixJjdX6CH96Xrip8Q/9+4bJhK89Sq
	/ZY/1jIwwCg9AEmBWLmLIQC4c/OClRvlpItZXGjAVGFLScdLbmNMm6Eb7OG4fnosc30TSVMvQDX
	uYwSifbfAiiXomio8Ngj9aOYMpphKT1skyEx2krHP9DzpqiDhRXu/q6FGLFCLdWEy
X-Gm-Gg: ATEYQzw2S3ebaRs+bYKuTT/5bqwvtG86ZeYS2wtD2NJ/9KBovm7awJF9oVz8l8ywFCl
	vbRE/kDsIZjaS2l8/rcLAAanuLIUMfGXthMDCPsE9rDr0GbNEQqt95jKC6XWFz/6Iqh5vhGd24S
	RIYuWiB/vIe7XNOZFKdqG4k2HXjpkdoivqugX+WgbLXpmLHOTUZZSPL3i12veYOaEfq8XvHiK83
	bh/wyPelcU7K+jg2BJMf8kYGrTWORQ+ll9PdoqC86B20yD0c16gttObmOay53VHD1Sj5BVhv9oU
	uGEfeQRPj6QyE3tTJi5p6SWsMhsYid48sJ5i4Q1Vy2exI4MFpcF7tb63evDqDXga5lKmzhee3qu
	woxtch+O2eWuUr/bsW0MmfGM95BgmZ0tEhZfIh5fTOxf8yoiw+4gvVXRtUVHHYVzsImUDEteU7U
	VCvINKPXA2
X-Received: by 2002:a17:90b:510b:b0:35a:1b43:dff1 with SMTP id 98e67ed59e1d1-35bd2bf7926mr9813874a91.12.1774259409073;
        Mon, 23 Mar 2026 02:50:09 -0700 (PDT)
X-Received: by 2002:a17:90b:510b:b0:35a:1b43:dff1 with SMTP id 98e67ed59e1d1-35bd2bf7926mr9813857a91.12.1774259408597;
        Mon, 23 Mar 2026 02:50:08 -0700 (PDT)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c743a939af0sm6591935a12.16.2026.03.23.02.50.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 02:50:08 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Mon, 23 Mar 2026 17:49:29 +0800
Subject: [PATCH v16 4/7] coresight: etr: add a new function to retrieve the
 CTCU device
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260323-enable-byte-cntr-for-ctcu-v16-4-7a413d211b8d@oss.qualcomm.com>
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
        devicetree@vger.kernel.org, Jie Gan <jie.gan@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774259384; l=2348;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=QjBBWW3nZNJQ7dW86dG4Ar+IGXRSYDsLrfUfjlg4xNQ=;
 b=/ND2nS44mbInVi4eNYBq/svnHomprXsHoRCmcKSXJZJjvVzmC7pJzBR0bMBaeQMxxQlzQqux1
 UeemwW4IB24AXbcIycNxDxrs8HgNvFJRGYIm+DAEvI3VmliTw9r+tCV
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Authority-Analysis: v=2.4 cv=aJv9aL9m c=1 sm=1 tr=0 ts=69c10cd2 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=FuIWbRVyn4pKkvqW11oA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: DSdNMCjij9W-dzJy9NGYvKQY43kVZb9a
X-Proofpoint-ORIG-GUID: DSdNMCjij9W-dzJy9NGYvKQY43kVZb9a
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDA3NSBTYWx0ZWRfX4OjN+WPtKRvO
 vOIPl+d3IaaoM1hxXXrrnwDIo4HthvDTLa/kwH6wl1SI51O50bPGJs7eu7qm3RukErqgsASe+/4
 UYXlNNgluc225hkHqycuyCNEs2fpu193z14cDort08UqiV04a/mUJh0SmuYX9ne6XXlvKrvbDr9
 +rizNoWCr0vzEBmWtkPjnjhcwsDfWR/oPBP4Qn+cebstTxkoC8dOCb7hFaLLUi8bklQ6z0lnhJE
 hKvwDLtnDl3MAqwWRucsCiEzoPISEsseS6kij7/3OK0sxSJ2iwz0RYsDRdsKd1zZchoqQXHO6jA
 g9pt+QUahHjBGIPKg+mMHbQyZGb1RkQqf4dE1sc2/bbt2rpCwZmtFmOWm+vvWQouAZ6egaGggQv
 LTaAhPhsn35d39BdE5OaMfmO2JGAGxV9A6F5IFFTA4mWonTM6VQqYMu39hSHb/Pa6bkKz2DkS7I
 nVJo8qFMxg+Xv7A+96g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_03,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 priorityscore=1501 spamscore=0
 impostorscore=0 clxscore=1015 bulkscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230075

Add tmc_etr_get_ctcu_device function to find the ptr of the
coresight_device of the CTCU device if the CTCU device is connected to
the TMC ETR device.

Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 drivers/hwtracing/coresight/coresight-tmc-etr.c | 24 ++++++++++++++++++++++++
 drivers/hwtracing/coresight/coresight-tmc.h     |  1 +
 2 files changed, 25 insertions(+)

diff --git a/drivers/hwtracing/coresight/coresight-tmc-etr.c b/drivers/hwtracing/coresight/coresight-tmc-etr.c
index 306982e88dbb..d4a99c77dd90 100644
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

