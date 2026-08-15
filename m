Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1394C41DE18
	for <devicetree@vger.kernel.org>; Sat, 15 Aug 2026 13:26:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786800384; cv=none; b=WPA4VFW33SCot38HXrmFuKqziZf5mcS4URkaQeNvfnJ0yg2Q4zXP56Lbo9m2q8o6GaB2fiFcLzJnMyfnMOu+ED4mHVp4dMQcpdBvI1DSCC7JxzQ+LW8gmFmjNOcEB6iYBaZpcuBPZ/RsqKCV0JgokBvU9RDqn4kjFinjJhUkkg0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786800384; c=relaxed/simple;
	bh=lJR6G5HF4bl1M1j9qzIr9Pod7FQ6Wv8te8xQH+WXaCI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MZgLUqha5vv5meED+icEkqXqL/0jXE43/lOyRlrzw8b3HXsdag5WG9g227H0UlmTpUTZrTS//QSdSp1nL7lKsFSCi8ytWIbTXtSkuy8Ko2A2Dhtk1CuDomAeyrOs0YvRDEgnAjPYcpO4q/XAoB/Iw3A+jT1sW4X1cTlI1KuMPEs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jl3M/2sE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=htWd0/8z; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jl3M/2sE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="htWd0/8z"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67FDMkhk979205
	for <devicetree@vger.kernel.org>; Sat, 15 Aug 2026 13:26:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=GXUsTUTY9OU
	wECVz/6AHbVUjWEzJ2lKqUl+uPQfQqfY=; b=jl3M/2sE6jyZJXYGTyQwxyOvhVN
	XHBtGcbQOM8vrtknabBv/o483i3QR3H4N/zJDxupzXNZU5lq3CmPJJsLCqmOS0Ph
	T8KPaKm+NJ5uPFsyoatMi1hlh4MWpNcI612fo98P2YKMLlIboXBpZSiMv13+EEvY
	v5aOlRim3qe4ce5JALxjHjnhMNMamdaenowmsgMnSCR7ddZVGVy9/+HY59UNaeb5
	9B1R2tiuz59QZ+J9PoGt1zJgO2QbLTZN0ylhIogTwQ7Z1OYhQ9tV/TE4Ck2Iku1r
	2FfOnayIzG8Y7i3Wx1g/lHmQysnwR1hFXSYRqZ9ADnM3pqZWb/yQPlynbLw==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g2ghns139-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 15 Aug 2026 13:26:21 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c9fe4c5eb39so1324830a12.1
        for <devicetree@vger.kernel.org>; Sat, 15 Aug 2026 06:26:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786800381; x=1787405181; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GXUsTUTY9OUwECVz/6AHbVUjWEzJ2lKqUl+uPQfQqfY=;
        b=htWd0/8zB3P0VgiId1mYUBu9UpHzrQS+q5DUo1/roytAOfmJ0e1T5xkZoTkNt2i9yT
         ddpVBjdpfVJx28uByNI/CTJEsa0txRZyQ8zOrx3rhp2yyOg0nGVyd7kbX5VSCI7X9Xyy
         0uR9uMDPuGYd9SRorSqlQouzauBkjWoRuOgIflFwwKf28uHnxGCZPC/6N9zdL0ztD5UT
         K6Sv8RN7T9J0PaMGaXCu53f7oir7MJv+3rx/cPCKA7d8Qz7eTn9pn2zIkqzE2wUlUwzo
         /0EBGmZxaZ6RjThSJmcenZUeICwbEIK9/wPAsyUNeRIeOi3eYTlQbquIuqyrqP2v5eVd
         TVyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786800381; x=1787405181;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GXUsTUTY9OUwECVz/6AHbVUjWEzJ2lKqUl+uPQfQqfY=;
        b=QWC4yvF0NR2fUVez7LRH79CdRpRw+R5RRCJpiEH1bhSht/GITjANEh21PflU9gN207
         j7gkgeiLOMWRxEAkdKSefrFuIbBIRgDMj6i0dOxrakjCCC/6+4gi0dMzBP600lf7zJq9
         iQkVs4kcWMpuKEO1dRBxtz5WrzTkMkNUwsSpnXrd9GnLeWpfMsyDiVAH1gpIWm1b4onG
         9v25XzM6FgWEj55fNDsfMg2NHkKCR0ZuYtyqxbvDcTbsHBcSBeLyMRH7da4XANtU71dL
         slmD8fQ9vrywTe+c9iLVk5qzlsH1VU7S+nv1WQbOTM03K9xlBbw0Im7nBhrulIvq+CkF
         nwuw==
X-Forwarded-Encrypted: i=1; AHgh+RqFc+5qx71wdQlA3+UZn50GirSCcEzvAr4CGeu/6HlaBqrXB4fYt3Niv2VzjnIJNGuUFUdfOMngGQVY@vger.kernel.org
X-Gm-Message-State: AOJu0YyOT4PaaIlWUEJ6iUcYC1YK95POR1yxGGf/fh1k5JRJIvR482lp
	8dsR7bWZWfaXbe9Uuon+0qT3Sk9VOLrZw1GnYZUtIQuWSpZczMQ3bg2DNVS34BGlLsdy/WOaZhI
	21U+Om6KCgdOvOb68+hjSOD+gu8kIsyDm0JQkdrLxMQCOD5x9RVAo8u0RmHfLVLoa
X-Gm-Gg: AR+sD10rQN3FajK6Mg8nKvdzdm/9OpGOWDWC0lsW0FoX0eo3Gb4yQ2BJSxR8CAxsBUK
	L/e6/xe4vQP259FJxhJyJIaSVNKekgu6DIl0iYJn93yueerpO7cgpWOkBPyFVJKgqxBQUuyQgPa
	/6yVSmC3NN+Roe4bi6FbYpirT958aGxqDwJ1LtEaSqeN82ggaRGiW+qeDqQmvWmenLiSjCHs8cO
	+ntpV/whS5UYGbg6b33m2JKiEivsPQChM5J53ERlg2Jh7CCBfTcvtY670YB81P9fdkIOc3A9URS
	st6wxkiHhW+3WGbNzxYWB2Lg19yjbaB8BI6csS1HtZu6+/omBV3b/ejd6NgdGiJjSbqeiwuYlt0
	9rB1Z/HfAspYcGcCNyhE5Xfnl8C9NSaBHpdKZXsF4/fpkjTFleQJhkWlUHBpV
X-Received: by 2002:a17:90b:33c2:b0:38f:bbc:6a0f with SMTP id 98e67ed59e1d1-3933bd0c033mr12646178a91.1.1786800380716;
        Sat, 15 Aug 2026 06:26:20 -0700 (PDT)
X-Received: by 2002:a17:90b:33c2:b0:38f:bbc:6a0f with SMTP id 98e67ed59e1d1-3933bd0c033mr12646140a91.1.1786800380243;
        Sat, 15 Aug 2026 06:26:20 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-141386a039asm19313374c88.0.2026.08.15.06.26.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Aug 2026 06:26:19 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH 8/8] remoteproc: qcom: pas: Add Nord ADSP1/2 support
Date: Sat, 15 Aug 2026 21:25:41 +0800
Message-ID: <20260815132541.1575121-9-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260815132541.1575121-1-shengchao.guo@oss.qualcomm.com>
References: <20260815132541.1575121-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE1MDA5NiBTYWx0ZWRfX/2x3uYzZ4sTF
 EYs3CbRZh39M8aHb0jlCHFRLzDZyuPTdEf3PpFZMYwL2d5HTP9cNm3NwPsSD09Jq6pIBEDhput7
 HFTkAzK6bY9J57GDAVJLmcDllA52yOzE6O2MWSmCzh5QbyxGgv9sye4p9yxkm/nEB1SCZBavTva
 G7D3A+nnJvNRmFO22zZmdoAvXTH14PpJvG0AfrdumcA/z/h60Jgfn99e/ZIqpYNpZ2DNW5Z3foh
 uqISc/0dTMmIHOVLKC0tj4UI2qXwSE46J4C/RNar11GP9qnDRqMVAYBDVRf2IiGEFftJc6LDM83
 ZmhGl756/NXu1Nlon0JPhjfws25EeqzjM20P94gveBI5/ccTUyJwQsjVHokq9CCorlaJWIJb1eK
 USdw+BftLd08df/nyoMO5/sxAN8tgIs7yLVKje0ovHtiPRG9rlpQKgEZK/J+Izh5KoHB8m260Ei
 sLSQOLiOZgK0QQ8eAoA==
X-Proofpoint-ORIG-GUID: iajLKK7bAykYkYvVpfVH_ds1kwYQTKkv
X-Authority-Analysis: v=2.4 cv=QN5YgALL c=1 sm=1 tr=0 ts=6a8068fd cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=Y5oKQx0N-h3E-Ucf2xsA:9 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE1MDA5NiBTYWx0ZWRfX815pP2RpSYO7
 bDJeX+ky5l5UGGWRFCIG2zZjpBCx3YS2O3yetEJAd+tXgnkXzMeM9NigYdoTg4Qswqcw92aZkSL
 0GWQP6LpkoJ4UI15kDkfiCRK4PgO3HY=
X-Proofpoint-GUID: iajLKK7bAykYkYvVpfVH_ds1kwYQTKkv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-15_04,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 impostorscore=0 lowpriorityscore=0 suspectscore=0
 clxscore=1015 priorityscore=1501 malwarescore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608150096

Add support for additional Hexagon ADSP cores on Nord (adsp1/adsp2),
which sit alongside the existing adsp0 as HPASS cluster members.

Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 drivers/remoteproc/qcom_q6v5_pas.c | 44 ++++++++++++++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
index 0cf0a31f1f1d..96e2a7c74927 100644
--- a/drivers/remoteproc/qcom_q6v5_pas.c
+++ b/drivers/remoteproc/qcom_q6v5_pas.c
@@ -1937,6 +1937,48 @@ static const struct qcom_pas_data nord_adsp_resource = {
 	.smem_host_id = 2,
 };
 
+static const struct qcom_pas_data nord_adsp1_resource = {
+	.crash_reason_smem = 663,
+	.firmware_name = "adsp1.mbn",
+	.dtb_firmware_name = "adsp1_dtb.mbn",
+	.pas_id = 53,
+	.dtb_pas_id = 55,
+	.minidump_id = 21,
+	.auto_boot = true,
+	.early_boot = true,
+	.proxy_pd_names = (char*[]){
+		"cx",
+		"mx",
+		NULL
+	},
+	.load_state = "adsp1",
+	.ssr_name = "lpass1",
+	.sysmon_name = "adsp1",
+	.ssctl_id = 0x1d,
+	.smem_host_id = 66,
+};
+
+static const struct qcom_pas_data nord_adsp2_resource = {
+	.crash_reason_smem = 664,
+	.firmware_name = "adsp2.mbn",
+	.dtb_firmware_name = "adsp2_dtb.mbn",
+	.pas_id = 54,
+	.dtb_pas_id = 56,
+	.minidump_id = 22,
+	.auto_boot = true,
+	.early_boot = true,
+	.proxy_pd_names = (char*[]){
+		"cx",
+		"mx",
+		NULL
+	},
+	.load_state = "adsp2",
+	.ssr_name = "lpass2",
+	.sysmon_name = "adsp2",
+	.ssctl_id = 0x1e,
+	.smem_host_id = 130,
+};
+
 static const struct qcom_pas_data nord_cdsp0_resource = {
 	.crash_reason_smem = 601,
 	.firmware_name = "cdsp.mbn",
@@ -2316,6 +2358,8 @@ static const struct of_device_id qcom_pas_of_match[] = {
 	{ .compatible = "qcom,msm8998-adsp-pas", .data = &msm8996_adsp_resource },
 	{ .compatible = "qcom,msm8998-slpi-pas", .data = &msm8996_slpi_resource_init },
 	{ .compatible = "qcom,nord-adsp-pas", .data = &nord_adsp_resource },
+	{ .compatible = "qcom,nord-adsp1-pas", .data = &nord_adsp1_resource },
+	{ .compatible = "qcom,nord-adsp2-pas", .data = &nord_adsp2_resource },
 	{ .compatible = "qcom,nord-cdsp0-pas", .data = &nord_cdsp0_resource },
 	{ .compatible = "qcom,nord-cdsp1-pas", .data = &nord_cdsp1_resource },
 	{ .compatible = "qcom,nord-cdsp2-pas", .data = &nord_cdsp2_resource },
-- 
2.43.0

