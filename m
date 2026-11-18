Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794988975;
	b=wUa+/6Ltki/KwWAbxO9vCdizV0dcRKg0/1vdVdEFuZs8fmRIChQDd1D2HzbYnj2NBWCJ
	 4a+TWjzbhfK2aOlQETaHRyaxB1isRPrV2d1zv3jsYapBgK/V1U5rVRgJ4UfwS1edZa/nT
	 cbRc0yx6+RNJ0qkHZq6YOz12eXslLhA148lNDRhvp6XjS9TQy4uhqWD2rWv72qG2SLt/L
	 LbTq8+u2JvoSxkF4ziL4XXDtxCyHQ5okaywW0HKoFWmYKtuJ26XiOYikkQnKlitiAtN/t
	 IsvsiSU7iyGHPAEsmBT9d85Js9ryI91OQK50AP5XFMsvxtVREGaZ4b2Q/OqzsI7qiWg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794988975;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=oRHoL0IowPBtdkXq6acf6pO5kP7NbE/jHqMLo/D6VFA=;
	b=o5fOlHf4WciBAJSq+Yubu1yfLFOqp8Oh3mN8MxgAHoujWMN9NAdn6NikLpxjl7ubZRm9
	 rdx8pWEBB5RnaIGggjPQ5MUmNwf5D6H79fEtj5+NzqxKvbxMxLx5Wqj8rlKgp/P6B6jWA
	 pB0AcNPYLNo8EFiH9fSy0f6VKzBe4MXjal0p5be5AH6Km/ZfyO2hGb8UAFm2nSasaj1gD
	 s9zMswgZ8Ku3gaddeKs3HIEgM1BuJ9U1d7nTQHMBDTMQdD0UK2ogTI3i1cXZidtN0/K4k
	 ccPIqsLaO/AFHd6AEDzxa7BYnjcjORznGQWLeviSdL+PZ8bWN9iJkkUYtIRJQDr4RTg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fUsSYriY;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GkI82qww;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73086606A32F
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 08:02:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 73086606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fUsSYriY;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GkI82qww
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI2V0MG2602498
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 08:02:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oRHoL0IowPBtdkXq6acf6pO5kP7NbE/jHqMLo/D6VFA=; b=fUsSYriYxUBhe2ok
	LUURC3k8cJqJcNOs2tP+TO5gfMabqNHoNa4ji290GF7xjVo02WiMbAsms68mrMcO
	pfVNMPjcgzXFU4kzTivDN15V+0F9ZG4RarW+ExSShMS/Z4FadHdu78FJRdV12U1I
	vtKaGBoKGAFMhEscbguyVzNB0VHe9MkRF750M1aWiEGDv5DfhBoXJMCnL+dSGLWQ
	8YMkg1z6xc8mefOkLCqmij8NgMIh/z7ZYTxrzzLo88nDtlq5/pzfq6jNw82oEC6J
	eoovRuRZruiabIBr3mLKMHAnrt/x1J60j18c3eFeo5gaDDT9YMDMJi1/E4z40hlP
	Oq4b+Q==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yv71y5k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 08:02:54 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3ada6ccd402so455009a91.2
        for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 00:02:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794988974; x=1795593774; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oRHoL0IowPBtdkXq6acf6pO5kP7NbE/jHqMLo/D6VFA=;
        b=GkI82qwwJY7PYhEK20nsAzg/bTVPx4S1X024fy/vfO+nDNc1ins4Y+ZrYONLJhuQq7
         ybjJPNp+humqZBcW5jp2S5pTnlcxXyTrJk9WBHn/pHZKSJFqEP4VuBE42DAucn7kddh5
         oLdQomzswe7Aj5IA7ozBJ0WOSvqH2HbQbIIg+hGHMLhBtS45IQ8w+pJI3YEhsLUoF/kY
         dLtxNVJmPvqsEXM4hW2aUpJIF+eVyTbCIzdCYqbTx5ixa4STUllVYA9WtU7li8t7KA4a
         Bcl4a1vv/KBqfKSyb0UijZePtExvM3XyPSTSPQ3fqQXBxquDcI1e939ab6CcQeKnlUh2
         nWmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794988974; x=1795593774;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oRHoL0IowPBtdkXq6acf6pO5kP7NbE/jHqMLo/D6VFA=;
        b=fPXGAPJ1ZNWZbfkUbkDB9sQfjUS2APSF84sWHA0TvHT2cVrhL2YN5ZB07g3ki4b3KL
         9ZwTeZgS8DJTRU0K5YnscfQL7rOGdH2jSnmNnNsZAU+FbuIRZ9gY5r7X7eZLJjVpIGjD
         y7Q/6B6sJ3q7mF5fYXN5YF1mQb3tjLIiRFc4VUv3RkIPmMRO+0rSsxi59NUnhwbV8h6N
         QY+lDqt/GYBt/z3SdeppYH7ReHH7iNr/1NcRGN59ACUFNXvCxew7Zv8cao9rAWPoitLZ
         TtW3abiTRHLa1OBU9kEVOMHtNrIV2RkdbzZD/LG2hHG2aVlKbf9eCW4wl+DaNWZMdgEm
         rgmw==
X-Forwarded-Encrypted: i=1; AL+hErHED/0QSz5mgOq2WhEzGtFEKpDkp8z0JFqdSjvwgOW25SZ1ubUt6OgcXFkcMy3ZCRT8X7jmWftlw6wA@vger.kernel.org
X-Gm-Message-State: APuU4Z9Pd6c3qVRycsVnlsaXJHyHiUM+057aq08TK9cCk9/vJsFMDXF2
	iqG9km4c/yLYYVm7lWB79H1ZNb/w1cOEr3pVksahbXk60R5fYIbXkbxGeFd/P1MGcLEDLVy3xkW
	W7ts+Y4xyN7awHUJu1Ij6nY/3wIX4wTOJCtEsgn7k6TE9VxjzjzAFYjByl5jQmRrH31wCtJRhpY
	w=
X-Gm-Gg: AZFdTZfZ1DfIYMkTxVL5OtMi6MjFmb6wthY9oRXXp0PmYG6XxRsSA1CZEBMJxR4dOqM
	nyacszhHMxar3Rria1gqOqFigeIR4Xb4ITCsGd8OfPG35wiXkymdiSiJGeMGjQ4enxu10O6nHPF
	9JDCcGZaWv8HXM/UOKBnyXvp8ccYAQo4qUl7HpxF/oigNtDSd+aRp8TCgxCM5IsK6XWDspd1/Iq
	0seXB25IyIvugFBv0qalRr2vNoSKSmjt3njzNTPfnO+ll//J9ab/vB5Yl6vk73ZtzeSyD3qmN/d
	A1DbwBItf0ETMrZFGgbR68ke6ggkzLyzgudi8VCDaiogEGSemcH4eo+ysWWnCUTyGRlBdQS/+E4
	JF/63F7F8jI8eHXAc/Q9l34Nz8pakZHjWcMI8mKSPyGbLhQrdpteWPiXyixghovhr4P24HuKlyl
	PXe23PDrfvVepvS2YeaPtSh5VPdU2snWNiH6Yd
X-Received: by 2002:a17:90b:1d47:b0:3ac:8ee5:e007 with SMTP id 98e67ed59e1d1-3b3d07a7856mr1524836a91.20.1794988973734;
        Wed, 18 Nov 2026 00:02:53 -0800 (PST)
X-Received: by 2002:a17:90b:1d47:b0:3ac:8ee5:e007 with SMTP id 98e67ed59e1d1-3b3d07a7856mr1524802a91.20.1794988973176;
        Wed, 18 Nov 2026 00:02:53 -0800 (PST)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3d19b6adasm3004072a91.9.2026.11.18.00.02.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 00:02:52 -0800 (PST)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 16:02:22 +0800
Subject: [PATCH v23 1/8] coresight: core: refactor ctcu_get_active_port and
 make it generic
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
Message-Id: <20261118-enable-byte-cntr-for-ctcu-v23-1-67fd9db6bc0e@oss.qualcomm.com>
References: <20261118-enable-byte-cntr-for-ctcu-v23-0-67fd9db6bc0e@oss.qualcomm.com>
In-Reply-To: <20261118-enable-byte-cntr-for-ctcu-v23-0-67fd9db6bc0e@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794988960; l=3915;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=+oZshRSJK34bHEGxdoF7ktkVcnA/k42MY2hxHJFiV/4=;
 b=xita3mZAUpFh5kamyEmNix6Ry1Q4ZUfdHYGcvVo5ikI/KmNGgWqCgVp6rcFIMiHmcpu91b2vy
 5ycxre/cwQMBzLD84GCg1z2XugbfBA5scLIMdVDdssV1DuLe0zKXG2k
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-GUID: TFVLbRiDf39mRofOcSSYHmxqJsesFxtq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAzMSBTYWx0ZWRfX6XJeCbJ4P2HJ
 KJadtyZLpTW23MOFi73wffmkA1/GB9uD/uXYGokx3giLy9aJWjyKjriIFFlqMHh9CtkHuFyKkkB
 ddBCeDVB6eUHV/e1ye8AmX5vv44PXioS1znYTExN9k9dbYO4sYZObTf3pqSuyQ+M1p9fFrNLnDB
 R+ooYJ4XUji4b7Zt0AfRmoozHSR6fAbnXXBN+3dKnIuxESryPrtnNumviLoCCG9VPgTmeBXKX32
 n9242ld1pIAyA9PoeL1IPsBxnmZevkjOShQn28YQedPLv3nNUuA2A2xZQsxCMMsCNrJ6GWMEa+Z
 t8YUBt2DvPH9TXbe3uFaP54FA10vs7o/8zQhZWN7SwwyU+aQiiPuB2qsJUoLjIziYk6AKjq6zp0
 Vj7YKJFAP0Mx5AYjJ75wuwQySTxS8FCRTfSBG7X15if51XgSFvIL7f7MnqTB/NEjNBkKJY15iSz
 4JCdyym0oL4lEJuqJJA==
X-Proofpoint-ORIG-GUID: TFVLbRiDf39mRofOcSSYHmxqJsesFxtq
X-Authority-Analysis: v=2.4 cv=H8xOUOYi c=1 sm=1 tr=0 ts=6afd5bae cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=7CQSdrXTAAAA:8 a=EUspDBNiAAAA:8 a=lyq7_Muqgj1vGRpOYO0A:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAzMSBTYWx0ZWRfX4B3MdL3HxmH/
 QYzoEQ3Za97dWXCjV5DZASWdUY/C4UPENtQpy+dDDptJuArBe89TJjWBQkNVnALPgnRs3NIwM/V
 GrFU2fSxKf2LHy7ZwOrf+Bg8nR21Ci8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 suspectscore=0 impostorscore=0 spamscore=0
 bulkscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180031

Remove ctcu_get_active_port from CTCU module and add it to the core
framework.

The port number is crucial for the CTCU device to identify which ETR
it serves. With the port number we can correctly get required parameters
of the CTCU device in TMC module.

Reviewed-by: Mike Leach <mike.leach@arm.com>
Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 drivers/hwtracing/coresight/coresight-core.c      | 27 +++++++++++++++++++++++
 drivers/hwtracing/coresight/coresight-ctcu-core.c | 21 ++----------------
 drivers/hwtracing/coresight/coresight-priv.h      |  2 ++
 3 files changed, 31 insertions(+), 19 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
index d2f9c1fb77d9..32e8b3e51519 100644
--- a/drivers/hwtracing/coresight/coresight-core.c
+++ b/drivers/hwtracing/coresight/coresight-core.c
@@ -773,6 +773,33 @@ struct coresight_device *coresight_get_sink(struct coresight_path *path)
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
+		if (!pdata->in_conns[i])
+			continue;
+
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
index 9043cad42f01..739105acb0a1 100644
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
@@ -145,8 +128,8 @@ static int ctcu_set_etr_traceid(struct coresight_device *csdev, struct coresight
 		return -EINVAL;
 	}
 
-	port_num = ctcu_get_active_port(sink, csdev);
-	if (port_num < 0)
+	port_num = coresight_get_in_port(sink, csdev);
+	if (port_num < 0 || port_num >= ETR_MAX_NUM)
 		return -EINVAL;
 
 	dev_dbg(&csdev->dev, "traceid is %d\n", traceid);
diff --git a/drivers/hwtracing/coresight/coresight-priv.h b/drivers/hwtracing/coresight/coresight-priv.h
index dddac946659f..854c0a3cb080 100644
--- a/drivers/hwtracing/coresight/coresight-priv.h
+++ b/drivers/hwtracing/coresight/coresight-priv.h
@@ -155,6 +155,8 @@ void coresight_remove_links(struct coresight_device *orig,
 u32 coresight_get_sink_id(struct coresight_device *csdev);
 int coresight_path_assign_trace_id(struct coresight_path *path,
 				   enum cs_mode mode);
+int coresight_get_in_port(struct coresight_device *csdev,
+			  struct coresight_device *remote);
 
 #if IS_ENABLED(CONFIG_CORESIGHT_SOURCE_ETM3X)
 int etm_readl_cp14(u32 off, unsigned int *val);

-- 
2.34.1

