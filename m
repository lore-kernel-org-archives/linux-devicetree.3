Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB078343890
	for <devicetree@vger.kernel.org>; Wed, 24 Jun 2026 19:08:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782328134; cv=none; b=S+JUqUOVySseYQj8JUXGi1OXjp4ybHBpyJOgQFLzmKpHJUqt69sPxmXFMV1zZ4BJsEToqCCGet7GnVM57HwW/qP4Yb0UR6oF8dAv3AIqpEOCvxa61PS6DheQu3U52Bj4Xj9LiTQ7x+jIoSV9v7YyP6Dp18wdTog8b40at5ssAHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782328134; c=relaxed/simple;
	bh=4FxHbmz8kDUtIfGKFuiVIX5SuFnBhCE95+M+is46FYI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kOsFpbTcSV+5CZmQn4+eniLDA0KyX+mSA+KNadoN/D6kQ/0yr0ogQVZpDyXao94DHDKTnGKN8sjrD1+Lt+xMw2Yg9+6aFbeJliXoR1ML2poisQsIFsN2qGzpZ4ZeL+kMbI8WI5RPP/gnJ+L0DMmQuHS5BTjdbvQDWG9zrf9BdFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VGg1tbKL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=U2BowD0w; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VGg1tbKL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="U2BowD0w"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65OHj3gE3580594
	for <devicetree@vger.kernel.org>; Wed, 24 Jun 2026 19:08:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=r28Iz21wgcp
	SxJs9OE2sYvkYbcyymDjl28v67tiLeDM=; b=VGg1tbKLluzPCW1tprMwfq4BU2n
	twF3wclNipE/UTbq/SJ/Hgmi6Sockd2AtMEOsKrPEDBG0czYwwNJ9KS2EkkXIwWL
	2oqCX9GDCK1n9rBMjpVN29H+el0Q6zsxrjuxYEDaqHYimgKBpvEhsvqwVgWD/gJg
	pCKqyM+hjBDMo4bZbHUk1vbVmZYZB180IhSIXVC9qPkXCLO2D/ee3h3jED49zZOf
	sDxDXHh02/eNhrLajho84TE8RoYL9P9yBdVZTeNeS8hoAkXLopKQFH+CZrRzd1Um
	hNIirGMWw6cTaJH9wlu1OIcQMS7ZNsJPPWcsSt8RKbNANJKidM9QlN5kp4w==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f05aqbvxg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 24 Jun 2026 19:08:52 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8423f6247c6so1872749b3a.3
        for <devicetree@vger.kernel.org>; Wed, 24 Jun 2026 12:08:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782328131; x=1782932931; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r28Iz21wgcpSxJs9OE2sYvkYbcyymDjl28v67tiLeDM=;
        b=U2BowD0w2YbeOkMhxmTlRW9GiXgi11SbDEiBDDSeMfithANevaYWzlwm+ikAmRwHB2
         aTBzAoFP0hHvHDjufQMqLInz/pl3wC9Syk996wb/I9sPF2WGcYarzqsCQqqThJHBnDUD
         ZQbcqQ0bxt3Sq0AvZjNi8CIgyZMjeK6kyj29473YBfu0X01NenLrS442IvmzESTQhVrS
         t4ABROqmN4xF9KYbh76MZnaj9qHD356j0PYGj1T2ka25JU0TkPfNzYhZtFRVQJhd56P5
         lh24zkreLmsN5odUZ/oD+ztcNM1rs+62qvfElyc79b8ScJuORa/ItGIb5EbtJHUSkoSN
         pOjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782328131; x=1782932931;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=r28Iz21wgcpSxJs9OE2sYvkYbcyymDjl28v67tiLeDM=;
        b=YRFBkhYv++728pH5ZYEHS9Efa2/EBFFKAhFZOqMCftaqc4iZRpvjgOcpxkHGd/fknj
         1dYnnQTaWZXmg+Ozk2VMTp51KJ9Uwo6jtySIs+c7+o1DWce4FzjNEPKmWuKGrkkGnv7n
         S66JPZMlCAn2DnrT/nck4IgNLpisrOcLA47T4fG8eJUiXjmfqNeyNXQbYmg46Ebe3WEX
         y5opRlMpfxS76CIpLoGG5/fsCd9Ge13gPzZ/ePe9eXUS19aa7w2WWdhUTLkACtnd3kiM
         Jw+Rz7C8lB50gwG4X0I0+wdFt68PV77v2EMvuR8j71Yg4+AfF8ZUcc39/u/7wS6o2/Xw
         p7kQ==
X-Forwarded-Encrypted: i=1; AHgh+RoBfB3RxcA54se+cx4DDhQBztDUWhf4gCaN0ICnUZhQHQb4QE0LxVZaB4wRihdO8S0MMByqpnrngrCv@vger.kernel.org
X-Gm-Message-State: AOJu0Yxx4GeqM6tJm2ZfGZ2VxRDpUJ2Hq80UWZLhLnrNeWRBD5oXyKUQ
	IXsgieXJfWZoE0P6KRAO5muKe/oZ0uWFu0txi5j5asDjadbx6GQaPWTL/rLf1Vbyc81p/UZNCit
	J3c+7DU0HVpuTB2Cp+25BpIPRX+tG/h4AL9N7KOjo+ujIbv+XwJya7oMnEJj4s3Ul
X-Gm-Gg: AfdE7clAuKCXaXzZQqSnpFkcbx0cEBKq2zFBg5tpvXk0e22X1BgoIsMYxdvk4wk5JZx
	0TCfZmHHAmgd0ByLY0IBo9AAkd4asGymMkU9dJep6loA+ZpCG57oBQNmc3JDRUKZlFzPw9pyVUh
	SbjaFP6wnwmFhGyflpnwsUQGgHNEctXbSiEZyMf2InbWIgcpylyAyf0gV7kDJW/Q3sH2XG35DlA
	B75bI5I6FH/eV4MC6yhJ2bKUJ1ZGsU844O4oh0IUAmFrkFQSbBCFRtdLJgbo/mOWq/KCMI+st63
	DLna2FZX/eGjO+u0D+HdwYciSJuYfUYg6wvcvc/Hyf4NbftwCFCYZGkqlc67/d/TL5eOW+E/O8j
	2Ac951qRtfEhlcva7jIM3OusZYPpu3AjfUObRbA==
X-Received: by 2002:a05:6a00:3927:b0:845:4928:8645 with SMTP id d2e1a72fcca58-845a2ac2920mr5509752b3a.7.1782328131435;
        Wed, 24 Jun 2026 12:08:51 -0700 (PDT)
X-Received: by 2002:a05:6a00:3927:b0:845:4928:8645 with SMTP id d2e1a72fcca58-845a2ac2920mr5509716b3a.7.1782328130925;
        Wed, 24 Jun 2026 12:08:50 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-845a412e5e9sm2932120b3a.54.2026.06.24.12.08.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jun 2026 12:08:50 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>
Cc: cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH v4 03/19] firmware: qcom: scm: Fix missing smp_load_acquire()
Date: Thu, 25 Jun 2026 00:38:14 +0530
Message-ID: <20260624190830.3131112-4-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260624190830.3131112-1-mukesh.ojha@oss.qualcomm.com>
References: <20260624190830.3131112-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI0MDE2MCBTYWx0ZWRfX9I4OlLGgeQ7E
 Gsnln9J3CjSAvtfFlU4S+4DH21dL9qf3JEJBywiPb7GFDlBDNVx4vJmj0aVqR9cma71lLV93/gy
 tKcjhAgMqypSgFZwfI3rwyuNESRoLRU=
X-Proofpoint-GUID: 4Wfc35bpVvJYj57Af7kJVoIjDFtZkT-Q
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI0MDE2MCBTYWx0ZWRfX+tsUZ5c9hSHn
 p+ATJm1WC8C2vO3qhXHEHjLu9HQI19Zn5Z4wrJgbgbD0fNL5/sLAxG1fPraZsJ9sSX5QEnEqrZx
 Ler8IHIe35GZW+tQgapXuChfJW7ZB654YuyBwq4w2ASSriu6bDkcBHp0vOPxjYBDfUfCmMKsMGI
 KKhx/SDIqHO0YNPogGTPyfqSOiXYWCttgFfOp3h4H8flH/TZiz2m7mEx2ztqxL1DDkuQqi/YgWQ
 TF3SoydRY8PzeUYXIqdjlmedBhH98J6hp8FozOwLm4lG4HJ41qLfHAIzoXIkgG777kdqp63fhMP
 2McXs+OSGTlIGr+LZlcuQC7LebO+5Nn4IA8fH2H0jmU+euPZjqO5ZfL+2PhgDx0GAagxxcX8Urn
 hF5uqo4esaBk1R6Wa+YhChdQyXR1RA==
X-Authority-Analysis: v=2.4 cv=UphT8ewB c=1 sm=1 tr=0 ts=6a3c2b44 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=NeVOsJV41uE9b8WGLD4A:9 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-ORIG-GUID: 4Wfc35bpVvJYj57Af7kJVoIjDFtZkT-Q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-24_03,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 phishscore=0 spamscore=0 suspectscore=0
 malwarescore=0 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606240160

__scm is published in qcom_scm_probe() with smp_store_release()
but qcom_scm_set_download_mode() reads it directly without
smp_load_acquire(), creating a potential ordering violation where a
CPU could observe a stale or partially initialised __scm pointer.

Use smp_load_acquire() to acquire __scm in the
qcom_scm_set_download_mode() function.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/firmware/qcom/qcom_scm.c | 25 ++++++++++++++-----------
 1 file changed, 14 insertions(+), 11 deletions(-)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index 6b601a4b89db..b78da40a4d60 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -551,23 +551,23 @@ static int qcom_scm_io_rmw(phys_addr_t addr, unsigned int mask, unsigned int val
 	return qcom_scm_io_writel(addr, new);
 }
 
-static void qcom_scm_set_download_mode(u32 dload_mode)
+static void qcom_scm_set_download_mode(struct qcom_scm *scm, u32 dload_mode)
 {
 	int ret = 0;
 
-	if (__scm->dload_mode_addr) {
-		ret = qcom_scm_io_rmw(__scm->dload_mode_addr, QCOM_DLOAD_MASK,
+	if (scm->dload_mode_addr) {
+		ret = qcom_scm_io_rmw(scm->dload_mode_addr, QCOM_DLOAD_MASK,
 				      FIELD_PREP(QCOM_DLOAD_MASK, dload_mode));
-	} else if (__qcom_scm_is_call_available(__scm->dev, QCOM_SCM_SVC_BOOT,
+	} else if (__qcom_scm_is_call_available(scm->dev, QCOM_SCM_SVC_BOOT,
 						QCOM_SCM_BOOT_SET_DLOAD_MODE)) {
-		ret = __qcom_scm_set_dload_mode(__scm->dev, !!dload_mode);
+		ret = __qcom_scm_set_dload_mode(scm->dev, !!dload_mode);
 	} else if (dload_mode) {
-		dev_err(__scm->dev,
+		dev_err(scm->dev,
 			"No available mechanism for setting download mode\n");
 	}
 
 	if (ret)
-		dev_err(__scm->dev, "failed to set download mode: %d\n", ret);
+		dev_err(scm->dev, "failed to set download mode: %d\n", ret);
 }
 
 /**
@@ -2705,6 +2705,7 @@ static int get_download_mode(char *buffer, const struct kernel_param *kp)
 
 static int set_download_mode(const char *val, const struct kernel_param *kp)
 {
+	struct qcom_scm *scm;
 	bool tmp;
 	int ret;
 
@@ -2720,8 +2721,10 @@ static int set_download_mode(const char *val, const struct kernel_param *kp)
 	}
 
 	download_mode = ret;
-	if (__scm)
-		qcom_scm_set_download_mode(download_mode);
+	/* Pairs with smp_store_release() in qcom_scm_probe(). */
+	scm = smp_load_acquire(&__scm);
+	if (scm)
+		qcom_scm_set_download_mode(scm, download_mode);
 
 	return 0;
 }
@@ -2842,7 +2845,7 @@ static int qcom_scm_probe(struct platform_device *pdev)
 	 * will cause the boot stages to enter download mode, unless
 	 * disabled below by a clean shutdown/reboot.
 	 */
-	qcom_scm_set_download_mode(download_mode);
+	qcom_scm_set_download_mode(scm, download_mode);
 
 	/*
 	 * Disable SDI if indicated by DT that it is enabled by default.
@@ -2875,7 +2878,7 @@ static int qcom_scm_probe(struct platform_device *pdev)
 static void qcom_scm_shutdown(struct platform_device *pdev)
 {
 	/* Clean shutdown, disable download mode to allow normal restart */
-	qcom_scm_set_download_mode(QCOM_DLOAD_NODUMP);
+	qcom_scm_set_download_mode(__scm, QCOM_DLOAD_NODUMP);
 }
 
 static const struct of_device_id qcom_scm_dt_match[] = {
-- 
2.53.0

