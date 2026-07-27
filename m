Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 503703E4C8D
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 07:46:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785138408; cv=none; b=GUDVrhLLVMT9iK3wLImfWlemYoil/um58wkVRhwdEu9XEk6URul75iKbxCX+n0JPjfzevKKoiKrMy+hwoyZ479AWUASDcQFsXnSR72UOSE3aw6k1JiyW8kQJOjZc2rILHxrSlJUPaGsBKDMPTFoxmogfQqFraCe5o+05qwPm+oA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785138408; c=relaxed/simple;
	bh=0YzZDwNOI/onVZdiLZlMM47FfMeGDrDDZthxQwRvTgA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bxbetUUC2h9XY07sUGGW96P7YynJviQOBG117VxiVefu0mM1UTyZQm8br3mq3X1Azb68tAg5uZ6/rf225X6MRm0s88jUu3imDrGW67y8yVwkSPwdh5yZDzGIdoMfRGYe5unOEa9ut9eBNIRfrQWxC8/uF07GypghOunYT1ikdXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Uwvqjd+0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YgNvMOlB; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Uwvqjd+0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YgNvMOlB"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66R7RdHF2936650
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 07:46:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=N4TIXsfQ0zT
	s/aF6LfD8y7lVY1UMz6f8WLChqvUOxFA=; b=Uwvqjd+0jF7e9DZS2pp1i2AlZeU
	JT62nSC0nlXEQPgM1dE6NTdJrvRr+O4kpW7Gp93uee7LKH0IIJ9Zl3vEm4y/ZNBj
	lPFFOyWHyEeWvt0MWL+7nLfm44flIhk3D/taSAvkRXk9XROMtL0XJiInAH0sGs86
	lHgVp+gBgqva/d7w4d9qEwh6lRBDZZAfhtR0PfJE/+kCUDMdi1oLfAT00gNl5YLI
	mfQjSkpUZrsMWUT5MIdPY/YbxHGBdlO6VEjPuYRZAcjZBHdo4HoNklPrAENJWI41
	MoUH07Hr+A+OxCgJeYKRl6e2wfIRzi+/5xhTBCCMmXSBhJFvVLpZHNnW8XA==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fmnwevxbe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 07:46:45 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cb835525b10so2934903a12.2
        for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 00:46:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785138405; x=1785743205; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=N4TIXsfQ0zTs/aF6LfD8y7lVY1UMz6f8WLChqvUOxFA=;
        b=YgNvMOlBSHYIswPEJQk4o1aeKrJtHSovSfT94cyTqV0TaUpKwq4ftNJNoUvriW+XJ5
         +0yqrz7eKWGqV24LdQtiYNDZpzUYCMexSyWm7zrFCWnbQ8bYIk1R6nyUg2wqsbLVWSJh
         zB9Gs7Gd5QaH7kartG8u2oo4VmWpM9pCTK352MjrgAutET0HqIetMy1pcTmhDcgWVp4d
         dkTpRBCZVrWsefh+VR8KiqB2IkvzraekKKL2qln8DZZmjSmnH22Eep8cM9vmJi70eHzX
         MeKUxEQ8RmdWvONvt6dlUZ5ojWGiZJDpNBflkcFRp/2cNXnZgpxlT/jgETLnmqkrDm8d
         TrdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785138405; x=1785743205;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=N4TIXsfQ0zTs/aF6LfD8y7lVY1UMz6f8WLChqvUOxFA=;
        b=qDetk2f64tPF688+dh4ttQLyURXLSpxVR8zwg1e0remFDPHJXAHr5iWVubUtGkNHpv
         6zGGR5elaaNdo7Pn4QvV4q2uKsB/FeyOg9DnWN32v5bT7Yb9fZZSNMvhO9yTWGqSpvjR
         KqEX1aQ9FtEETIH8xBrkxzz7EQGl+PSjTxTADqr1HBKTE4JtO9HuR/rKlfURETBJcWr8
         mBW8JaMbGr3ZyDyl1I+DsbFajRqQ+SjV/J2SCqWDn0H/cQ1u6TItcU587YADpmUPM+lv
         1GM42vj/UJVapKwx+xInwDSTLKPfnlGGcpufMcOiNaXwIWXX7U16LeBt/8CQ9qdNvU16
         KHlA==
X-Forwarded-Encrypted: i=1; AHgh+RrT2LNJUzEAApx4yhIfSodFvJTC26v4MO3dd/Qi0wYb3Iwo5Rwm97y+SNX/Gsk4pcThJ8xOqid/lXan@vger.kernel.org
X-Gm-Message-State: AOJu0Yxt8dIapJekdHJ6TDiAGByxQrsvgKwvRurNcnzvwxsYs0Iw+k33
	SiCWt2Muq3Ytd4/qUOfWSEsfDwHxjxh+cHq1nH1rjkMHH99ctIMtSzR7OlzBwz8aYKA4n84qTbc
	djZ+GddSUYF06NR9kaMWj8RtwTwhmtDDhC65GknSSjEyuhEaMaBbKw2yl9tPq/9Sf
X-Gm-Gg: AR+sD10NmxC11AL+UwuEjCToypB+0dioWle0k/Sn3wvblYxfzKux2a55Vl2uIJGVE6b
	faRae5xwHfzSmOP4H32yEEWXEGs9gRjfmLcsgD4h2JRCHW6mhOQTejgwKanyVqxeBOZHw2K7ivq
	+WyMVOyUnfgBW10y40Abfy5+++/1afJhLj0UslUOa1qz1G+iy4ODnR+ImoUySDAz3d3Sm0LN+37
	wHi7i3Xec2fUW/fZMZ7jYnWaCuvBSGqz6XwWUBZ3PjAWLk9A2u/B1Qu+dwa3mMnfPLamsERCVcC
	PkLPgoCiZ3ZRFYAnp4AdkVWbWnheV/le0K7yKZbe4kderYid4NWcqIbMJe7ugKzwLdilJRE/OAI
	XkgIWt4ReE9P0GuB9KSyVQuG9UrMdIrKwMc4WXq3uk0/aytkSQr3NKxBNr45G
X-Received: by 2002:a05:6a00:9507:b0:837:f79d:909 with SMTP id d2e1a72fcca58-84e59544ea7mr6009422b3a.39.1785138404569;
        Mon, 27 Jul 2026 00:46:44 -0700 (PDT)
X-Received: by 2002:a05:6a00:9507:b0:837:f79d:909 with SMTP id d2e1a72fcca58-84e59544ea7mr6009393b3a.39.1785138404084;
        Mon, 27 Jul 2026 00:46:44 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84e5342471dsm2590150b3a.47.2026.07.27.00.46.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 00:46:43 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH v3 3/3] remoteproc: qcom: pas: Add Nord ADSP and CDSP support
Date: Mon, 27 Jul 2026 15:46:21 +0800
Message-ID: <20260727074621.561661-4-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260727074621.561661-1-shengchao.guo@oss.qualcomm.com>
References: <20260727074621.561661-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI3MDA3NiBTYWx0ZWRfXysyC0fAGPFMg
 GyV8l6mB+n3ElHu858qFZA4yeiDlsUIS1pGDd/FFUbqpnimja1HWEQgr+yI04tta/O0l+96+tu8
 GeHbie3PzsMu09zlDDmKighg8wER7Q8w74W629gx1F02Z0/jWc/tHvX3+mhzTRjpWPA/SVX7wFH
 W1mAW5JjsHV/Vl2AFHwIy97zwpUgXQ9+ZfjVcdvqDuE1HHMOQz73S0pmiHzHIxhkub0URDOpFPu
 Psp371j1OKyqkibvnLV/bMMJKyzSLl6eCK8vj/8/CSgzRg1TtKnpB123VE0S7Jnsk/RRfqO1wJ5
 2zh92U8NQdBiDk0smRwDXP9x4eq5GyV9HpFvc41rBCWieGMYo9ZAhEN7EkgC08YsDHo4yTYiyba
 HPPS+nqZqTYN8mCME3q4+a/O9hoJ97nFeWI6O30iRx/WaqK4EJHUf10jP0mWBNJ9atcZ1e7sbiD
 Yx1uGX3MW5zD4bhiLyw==
X-Proofpoint-GUID: gKuGC-Yx4oUyo6hyJLpvqJsamaHmIFR_
X-Authority-Analysis: v=2.4 cv=S77pBosP c=1 sm=1 tr=0 ts=6a670ce5 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=wKDsrv0q4RgBVPAhY5MA:9 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-ORIG-GUID: gKuGC-Yx4oUyo6hyJLpvqJsamaHmIFR_
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI3MDA3NiBTYWx0ZWRfX3yHLl8PtHKWP
 JnDtMbjOIG7N/AgmVdHcqwZQqRAi1k1PJIMZfiiVlbQHLlGiqsKyAIdZYSPqOs1aKaAyijefITD
 bYKBU8dwTL375N6dh0k1CmOmBnT/C5g=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-27_02,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 phishscore=0 clxscore=1015 impostorscore=0
 priorityscore=1501 lowpriorityscore=0 malwarescore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607270076

Add support for ADSP (HPASS DSP) and 4 CDSPs found on Nord SoC. The ADSP
is pre-booted by XBL before Linux starts, so set early_boot flag for
attach path rather than a cold boot sequence.

Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 drivers/remoteproc/qcom_q6v5_pas.c | 110 +++++++++++++++++++++++++++++
 1 file changed, 110 insertions(+)

diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
index 25599d728208..6f3850a3fa9e 100644
--- a/drivers/remoteproc/qcom_q6v5_pas.c
+++ b/drivers/remoteproc/qcom_q6v5_pas.c
@@ -1434,6 +1434,111 @@ static const struct qcom_pas_data milos_cdsp_resource = {
 	.smem_host_id = 5,
 };
 
+static const struct qcom_pas_data nord_adsp_resource = {
+	.crash_reason_smem = 423,
+	.firmware_name = "adsp.mdt",
+	.dtb_firmware_name = "adsp_dtb.mbn",
+	.pas_id = 1,
+	.dtb_pas_id = 36,
+	.minidump_id = 5,
+	.auto_boot = true,
+	.early_boot = true,
+	.proxy_pd_names = (char*[]){
+		"cx",
+		"mx",
+		NULL
+	},
+	.load_state = "adsp",
+	.ssr_name = "lpass",
+	.sysmon_name = "adsp",
+	.ssctl_id = 0x14,
+	.smem_host_id = 2,
+};
+
+static const struct qcom_pas_data nord_cdsp0_resource = {
+	.crash_reason_smem = 601,
+	.firmware_name = "cdsp.mdt",
+	.dtb_firmware_name = "cdsp_dtb.mbn",
+	.pas_id = 18,
+	.dtb_pas_id = 37,
+	.minidump_id = 7,
+	.auto_boot = true,
+	.proxy_pd_names = (char*[]){
+		"cx",
+		"mx",
+		"nsp",
+		NULL
+	},
+	.load_state = "cdsp",
+	.ssr_name = "cdsp0",
+	.sysmon_name = "cdsp0",
+	.ssctl_id = 0x17,
+	.smem_host_id = 5,
+};
+
+static const struct qcom_pas_data nord_cdsp1_resource = {
+	.crash_reason_smem = 633,
+	.firmware_name = "cdsp1.mdt",
+	.dtb_firmware_name = "cdsp1_dtb.mbn",
+	.pas_id = 30,
+	.dtb_pas_id = 59,
+	.minidump_id = 20,
+	.auto_boot = true,
+	.proxy_pd_names = (char*[]){
+		"cx",
+		"mx",
+		"nsp",
+		NULL
+	},
+	.load_state = "cdsp1",
+	.ssr_name = "cdsp1",
+	.sysmon_name = "cdsp1",
+	.ssctl_id = 0x20,
+	.smem_host_id = 69,
+};
+
+static const struct qcom_pas_data nord_cdsp2_resource = {
+	.crash_reason_smem = 665,
+	.firmware_name = "cdsp2.mdt",
+	.dtb_firmware_name = "cdsp2_dtb.mbn",
+	.pas_id = 57,
+	.dtb_pas_id = 60,
+	.minidump_id = 29,
+	.auto_boot = true,
+	.proxy_pd_names = (char*[]){
+		"cx",
+		"mx",
+		"nsp",
+		NULL
+	},
+	.load_state = "cdsp2",
+	.ssr_name = "cdsp2",
+	.sysmon_name = "cdsp2",
+	.ssctl_id = 0x1f,
+	.smem_host_id = 133,
+};
+
+static const struct qcom_pas_data nord_cdsp3_resource = {
+	.crash_reason_smem = 666,
+	.firmware_name = "cdsp3.mdt",
+	.dtb_firmware_name = "cdsp3_dtb.mbn",
+	.pas_id = 58,
+	.dtb_pas_id = 61,
+	.minidump_id = 30,
+	.auto_boot = true,
+	.proxy_pd_names = (char*[]){
+		"cx",
+		"mx",
+		"nsp",
+		NULL
+	},
+	.load_state = "cdsp3",
+	.ssr_name = "cdsp3",
+	.sysmon_name = "cdsp3",
+	.ssctl_id = 0x1a,
+	.smem_host_id = 197,
+};
+
 static const struct qcom_pas_data sm8450_mpss_resource = {
 	.crash_reason_smem = 421,
 	.firmware_name = "modem.mdt",
@@ -1695,6 +1800,11 @@ static const struct of_device_id qcom_pas_of_match[] = {
 	{ .compatible = "qcom,milos-cdsp-pas", .data = &milos_cdsp_resource },
 	{ .compatible = "qcom,milos-mpss-pas", .data = &sm8450_mpss_resource },
 	{ .compatible = "qcom,milos-wpss-pas", .data = &sc7280_wpss_resource },
+	{ .compatible = "qcom,nord-adsp-pas", .data = &nord_adsp_resource },
+	{ .compatible = "qcom,nord-cdsp0-pas", .data = &nord_cdsp0_resource },
+	{ .compatible = "qcom,nord-cdsp1-pas", .data = &nord_cdsp1_resource },
+	{ .compatible = "qcom,nord-cdsp2-pas", .data = &nord_cdsp2_resource },
+	{ .compatible = "qcom,nord-cdsp3-pas", .data = &nord_cdsp3_resource },
 	{ .compatible = "qcom,msm8226-adsp-pil", .data = &msm8996_adsp_resource },
 	{ .compatible = "qcom,msm8953-adsp-pil", .data = &msm8996_adsp_resource },
 	{ .compatible = "qcom,msm8974-adsp-pil", .data = &msm8996_adsp_resource },
-- 
2.43.0

