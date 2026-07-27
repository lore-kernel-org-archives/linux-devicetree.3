Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C447E379990
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 14:23:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785162217; cv=none; b=dl23mubKkKQ2RignJCihzEEGg0OpQ7edhek+j0JGCACogmO05VirvC60wKvcuV4l/jrubP5aFNJye/WlrI0Y+wyUFRjvhcWZyIbrbptB9bvxOce+vYb37DzR/tsPKq6SD+xivN5ji5GFWwJ7ksvfBtq1v2xP9tIdlcIcsTrxD6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785162217; c=relaxed/simple;
	bh=lY2yoHcldcA+3NaI8lXXUOj0RQzCzCCOyPwbI6I3/FA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IihWgmU6RMw2Yfk/pMmzroR9ht0LPGB/JwyH9vS73JiTQX6zrudn6ajlFY+CM8PmvG2HSidzkW/oAbhZPTjmfmJeDZIMTTzY8ZaxvTh4Mx2OFo7dTUKw9NIF9rokhF6PoAEBoyWqKFDAZcoDUN/sZPh+wNyTaf6Q8H0yaabD44w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KRKk0Ali; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=K5LD5oJV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KRKk0Ali";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="K5LD5oJV"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66RDlaYL3414024
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 14:23:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LqMjPqmNKTABTQyu4/oXXNeGMN13hbmHy5tUZLQLrYc=; b=KRKk0Ali4VxzfNdy
	mSi9EKlqwIze2xfh71SEbCde5KOZvAdpu82P6btTVjzuEYhLcz7j6fVSZYlFQEw0
	T6D3p9BhkY3HrJo2aChnjXMOt/Q9pMUCdigMWc/P3tO65zXpV5s6EX/n18T/eDAU
	lMenKyJWZIv7CDuWKs9BcaSPRCWue47QybrYE34b/siNX9SHhLpf3yE3bMUokhvm
	8Azzko5St2gXl7mEIbU6aqcz4XcCq4ZNvol6C8rxnKYTDg11AiwvoHirk7h7K7z7
	XvnhzLWTSl1wPW22HzfADoyDSsfl1YDVcqNRUVXcgmcqtH+4viL2q0yXQdCQn7zq
	ydHi1w==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fp4v692a2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 14:23:34 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2ccbb61893fso60001155ad.0
        for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 07:23:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785162213; x=1785767013; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LqMjPqmNKTABTQyu4/oXXNeGMN13hbmHy5tUZLQLrYc=;
        b=K5LD5oJVQiec6nHlyaUCCrU9+yyqCtLVQbPHHFpKj+dn1eFxRsVrqFDDlWLXlsvQrg
         bqxiY/lWCoaXYP42So4sb3NuprcRb0mzJioLWxZL9kiszhgec3fiNc9T3bl006AZWsMF
         GnHtkEGzsTEsvBCj8uELpm4pFidulboBqCYmyWEW8iQ96JasyTi+t3DN7C56/eZ8EBpZ
         nHURhS5UgR77JMYC8YL7bf3JKf7TgYCc8Fe0GHuat3huvk3tos0v2VzpdGoz+PM6zRHi
         vIdXZgy6xnYkf9tBS3hT+cGA2jV3umTKyvlx70Mswoey14ppneQrgvyleIeusDrkZmrC
         bMxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785162213; x=1785767013;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LqMjPqmNKTABTQyu4/oXXNeGMN13hbmHy5tUZLQLrYc=;
        b=KUhVQ62DgPxURnU5I7d808dK7TA/Hc4pHHKmslTZKM5zJK15E50K10FM3SPCFeJPLN
         Flbf8bcQZL/sITxT+buKoFtUOz/6R4T4i1l5UsDoqKfxtqrheX2v8llzORmIuUa1RcBq
         UkgndzIx2OebPUWBfZsF2XpDGauIRAfEXm26TUvF4K+xcXRz36LhxKKcmEkfeQboLTWH
         nEqiHfJPaNoE8ADEr5uJer6oJgDtxoc1dPeNYEjKEsJ0Vzaaqd0QlNdNd3Hw6s9Q8wgw
         6KLCicJXfgfkMMxledgBgbN+pD80u/MuWJx/sAaf+NWSWU1bOQVHPJKjySWm3DRGTonb
         33+w==
X-Forwarded-Encrypted: i=1; AHgh+RqVGGAa4sS6pqw89IsiQvgQpnKZ5J1eRM9yDajlEOxBti8dCfDPujyle45AQNIQdtfH4GiNLykm0xpm@vger.kernel.org
X-Gm-Message-State: AOJu0YzOBKplKVWNhx04pKVElvu1qCkmr6GcNWb7cYTgid+BgfJncDT4
	nRpyplX0cbfLVINF3EzLok0YMagMy057TKnauue7470kNQEdpl4Qp32pdZ8Cmo1L0Yc39TvJQpp
	llycuwci1ngaYbU7UC83DsBdVq8PbLUyzkuys73sUflbJ9P/5p+7IjmFspniXwkRZ
X-Gm-Gg: AR+sD11JcytY4BP6mUW7otOnToi1DC/XPkoF/RcZ9ATiUqTj1II1jZcD8oGQUuMB6zG
	+7yBiWrWoc+5g4/vhi4aNYCqt/zLLA0kWir73UL9XXgyMzRv3fhslaxj4QBe0yPyIf9vDmJ3MIg
	J2p0fN9ZQ3tLbpTGhTqj4kSWqUzBskpiZExrEIepeyN4G5QUC+HCYpzl5z6LqJu+xpvUITaeu45
	RSYPdQyywABtNbsC7wPs5DyPJPnObO1qngboKXt4zf2LJOrVw5jXwPhBNRZGnDkZaVVNz2Ah8Z8
	MkaBNEnMtmxmHj4D6ZPGcS2/5RH65EIzjffny84q9RFB6Bo081a8JssKCGL5BTwcBRjZ6gxXOxO
	YeJ/jXqHBdAhOlMbJz/S2ZYBsFwORhw==
X-Received: by 2002:a17:902:d48b:b0:2ca:d151:383a with SMTP id d9443c01a7336-2cfde7adcaemr86494135ad.20.1785162213487;
        Mon, 27 Jul 2026 07:23:33 -0700 (PDT)
X-Received: by 2002:a17:902:d48b:b0:2ca:d151:383a with SMTP id d9443c01a7336-2cfde7adcaemr86493745ad.20.1785162212992;
        Mon, 27 Jul 2026 07:23:32 -0700 (PDT)
Received: from hu-gkohli-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cfde81d7f5sm36608755ad.83.2026.07.27.07.23.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 07:23:32 -0700 (PDT)
From: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Date: Mon, 27 Jul 2026 19:52:21 +0530
Subject: [PATCH v6 4/9] remoteproc: qcom_q6v5_pas: enable QMI TMD cooling
 support
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260727-b4-qmi-tmd-v6-4-973cd3a226af@oss.qualcomm.com>
References: <20260727-b4-qmi-tmd-v6-0-973cd3a226af@oss.qualcomm.com>
In-Reply-To: <20260727-b4-qmi-tmd-v6-0-973cd3a226af@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        Amit Kucheria <amit.kucheria@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>,
        Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-hardening@vger.kernel.org,
        manaf.pallikunhi@oss.qualcomm.com
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785162177; l=3908;
 i=gaurav.kohli@oss.qualcomm.com; s=20260302; h=from:subject:message-id;
 bh=lY2yoHcldcA+3NaI8lXXUOj0RQzCzCCOyPwbI6I3/FA=;
 b=NeDCgOWKfvQfPbiBGlv8v4h+J0TA3CDp3WSY2FOn/Sipv4ba2znp8p0drrEA8UF7va2mTdFIb
 bjSzdydwb0jD6kju7rc+MVH+ZpDlJQDGgz6w4sxZHk1HEWIZpzwaPdW
X-Developer-Key: i=gaurav.kohli@oss.qualcomm.com; a=ed25519;
 pk=IdNsqe8rWsF6dbpGHfwPEH9zM0nbOdRH72HxUT9qPak=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI3MDEzNiBTYWx0ZWRfX90difkcO4QZR
 NJYTzmba/lKy2ahLFaKrkfD9iWfYC1lzrw+llTQUYwkibGei9usqvzbrzqmZ7gcP4hX5YV9YXyr
 Av5XMJsJjRVXOcBcZYD6a3H9uclDLw4=
X-Proofpoint-GUID: hqhQuQlMrGwDe4fvqWPT9Y85_E3cbE2X
X-Authority-Analysis: v=2.4 cv=ev3vCIpX c=1 sm=1 tr=0 ts=6a6769e6 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=j6jQExit_mXiN_RbaP8A:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: hqhQuQlMrGwDe4fvqWPT9Y85_E3cbE2X
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI3MDEzNiBTYWx0ZWRfXxeJ0wSsLHUU2
 Ps6mQTd5NMXrX/MbjW6FsmSMSYdr8Pm2cdFJq4kFCtb+xLZHgp0eyJlQqAdm3BLI090QLHXTjJ/
 3tyV9iEN5mLjvx0yhdNNSF1KjDBSH/mIc6Xw/FccBlgw4uWh6u/eEtznzVE6nDH0ZYynrx1l3QJ
 77kA8fF9dz3iHw40Hl0u94MSIMS39XL60FPDsNvgWJ/iS3IN6b06Yo2lqdJxu9Wyn6hHt2KpEyB
 Q2JwA9LMb94KnvYNLXIX/SUOFh19RIDaHJcQp8hsPRpuR/GAW9/ibq0u+AwZu18iJUjk2Dgbtmw
 os6qaGmY+pndg7ugSiMx30TlScSiHib+h08kAmwA2f8tlWDHVXl4fnmi+A3lV2wCmqZBKy4Ebe3
 8Rr4MFMnYcB7zF2WZkX87AACQXvjkcEj0CtKcD+bq6tN7PW3cz1XLbTZ+2tBK5mrklisl3R2ZaB
 1xqoKygI1+4vI41RuXw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-27_04,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 lowpriorityscore=0 priorityscore=1501
 suspectscore=0 clxscore=1015 impostorscore=0 bulkscore=0 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607270136

Enable Thermal Mitigation Device (TMD) support for PAS-managed CDSP and
modem remote processors on platforms that expose the QMI TMD service.

This adds per-platform TMD configuration in qcom_q6v5_pas for:
- Hamoa (X1E80100) CDSP
- Kodiak CDSP and modem
- Lemans (SA8775P) CDSP
- Talos CDSP
- Monaco CDSP

For each remoteproc, the configured TMD QMI instance ID is used to bind to
the TMD service running on that subsystem (e.g. CDSP: 0x43, modem: 0x0).
The driver then uses the corresponding TMD endpoint names ("cdsp_sw",
"pa", "modem") for cooling-device registration.

QMI TMD identifies mitigation endpoints by name, while DT thermal bindings
reference cooling devices by id. This change provides the mapping
between DT cooling indices and QMI TMD names, allowing remoteproc nodes
with #cooling-cells to act as cooling devices in the thermal framework.

With this in place, thermal policies can request mitigation from CDSP and
modem subsystems via QMI under thermal pressure.

Reviewed-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
Signed-off-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
---
 drivers/remoteproc/qcom_q6v5_pas.c | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
index 07336a2d75f7..ab23c371601f 100644
--- a/drivers/remoteproc/qcom_q6v5_pas.c
+++ b/drivers/remoteproc/qcom_q6v5_pas.c
@@ -1061,6 +1061,15 @@ static void qcom_pas_remove(struct platform_device *pdev)
 	device_init_wakeup(pas->dev, false);
 }
 
+static const struct tmd_name cdsp_tmd_name[] = {
+	{ .name = "cdsp_sw", .id = QCOM_TMD_CDSP_SW },
+};
+
+static const struct tmd_name modem_tmd_name[] = {
+	{ .name = "pa", .id = QCOM_TMD_PA },
+	{ .name = "modem", .id = QCOM_TMD_MODEM },
+};
+
 static const struct qcom_pas_data adsp_resource_init = {
 	.crash_reason_smem = 423,
 	.firmware_name = "adsp.mdt",
@@ -1218,6 +1227,9 @@ static const struct qcom_pas_data sa8775p_cdsp0_resource = {
 	.ssr_name = "cdsp",
 	.sysmon_name = "cdsp",
 	.ssctl_id = 0x17,
+	.tmd_instance_id = 0x43,
+	.tmd_name = cdsp_tmd_name,
+	.num_tmd = ARRAY_SIZE(cdsp_tmd_name),
 };
 
 static const struct qcom_pas_data sa8775p_cdsp1_resource = {
@@ -1236,6 +1248,9 @@ static const struct qcom_pas_data sa8775p_cdsp1_resource = {
 	.ssr_name = "cdsp1",
 	.sysmon_name = "cdsp1",
 	.ssctl_id = 0x20,
+	.tmd_instance_id = 0x44,
+	.tmd_name = cdsp_tmd_name,
+	.num_tmd = ARRAY_SIZE(cdsp_tmd_name),
 };
 
 static const struct qcom_pas_data sdm845_cdsp_resource_init = {
@@ -1263,6 +1278,9 @@ static const struct qcom_pas_data sm6350_cdsp_resource = {
 	.ssr_name = "cdsp",
 	.sysmon_name = "cdsp",
 	.ssctl_id = 0x17,
+	.tmd_instance_id = 0x43,
+	.tmd_name = cdsp_tmd_name,
+	.num_tmd = ARRAY_SIZE(cdsp_tmd_name),
 };
 
 static const struct qcom_pas_data sm8150_cdsp_resource = {
@@ -1278,6 +1296,9 @@ static const struct qcom_pas_data sm8150_cdsp_resource = {
 	.ssr_name = "cdsp",
 	.sysmon_name = "cdsp",
 	.ssctl_id = 0x17,
+	.tmd_instance_id = 0x43,
+	.tmd_name = cdsp_tmd_name,
+	.num_tmd = ARRAY_SIZE(cdsp_tmd_name),
 };
 
 static const struct qcom_pas_data sm8250_cdsp_resource = {
@@ -1362,6 +1383,9 @@ static const struct qcom_pas_data x1e80100_cdsp_resource = {
 	.ssr_name = "cdsp",
 	.sysmon_name = "cdsp",
 	.ssctl_id = 0x17,
+	.tmd_instance_id = 0x43,
+	.tmd_name = cdsp_tmd_name,
+	.num_tmd = ARRAY_SIZE(cdsp_tmd_name),
 };
 
 static const struct qcom_pas_data sm8350_cdsp_resource = {
@@ -1430,6 +1454,9 @@ static const struct qcom_pas_data mpss_resource_init = {
 	.ssr_name = "mpss",
 	.sysmon_name = "modem",
 	.ssctl_id = 0x12,
+	.tmd_instance_id = 0x0,
+	.tmd_name = modem_tmd_name,
+	.num_tmd = ARRAY_SIZE(modem_tmd_name),
 };
 
 static const struct qcom_pas_data sc8180x_mpss_resource = {

-- 
2.34.1

