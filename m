Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD81B37DEB6
	for <devicetree@vger.kernel.org>; Fri,  8 May 2026 07:20:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778224846; cv=none; b=k3jcG0+BcSdXPm1EJ8/ieE9D9FuQ1UuD/4wYMgiKzJQsCHWVKRVV/ezVaK9YLsur4Oi7urEb0xFIWqLsFoYVH87J79Du07fC5F4+x+EMWaM0TDjFbknJpMg6COXBiQz4TlPXZk6WeBc0MlNNzRC7f9tAx8hOaiaBGAahG7j7ACg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778224846; c=relaxed/simple;
	bh=u9UYAcBfPm+Cjij/4yHsiT59K7r+ruo3k0BHpFBTT3M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=n9PVaqKTnL88oBKtBWpTU8/YAyHeSIiRirlx1n4fTm2f7sIOsCLzDvQlZb+Y7TWEzJ2YxpAs9UcW4ttVf5COB7L4Hfu0q9jNTusqKiFTRND/BD9+kk9J1NN5EO0UGfm8cjh/+Ety3NetK5x2GGuz+zFpOZqzQiNZ5AnfzbJnYpM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VBPAc+7h; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ABfHGis9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VBPAc+7h";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ABfHGis9"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64867GU21173914
	for <devicetree@vger.kernel.org>; Fri, 8 May 2026 07:20:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	L53kthztgvDO0gpZ7CrzJcti9CkeL2yF+aYSX5DyYaU=; b=VBPAc+7h/Sx2KpVC
	c1AOX2zwrX+UavVJb/7CiJoyy36KcMqyViGhYdHGLOy/Xfx/SK+IiJHyUFU3D4xA
	uVYmV617SNPSF1N1f8NoKfJ7Taq7q9NSRzBtbAfcEizipnCKKxmBZ+ObXaXMFw5+
	NUqwweKNgjDGxxhQ2BcYoNmYhtTfF2MFbS0tH//4JE8axmI56ZUuKAFfOVdt4wDl
	UpKhu2tdAyDkOIcmtlEAbHTqGHa9dWKaOxAjt2YH4s5HePnRm95KmOL9WVsVgFEg
	muS4JnuulMwY8hLdfAc4GTM/rg/TiZ3qqJR3lpld9PXX1zgAdedyvmGDEnonwzt2
	FRMl7g==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e132h9qmm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 08 May 2026 07:20:41 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-83536dc3be5so1751688b3a.1
        for <devicetree@vger.kernel.org>; Fri, 08 May 2026 00:20:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778224840; x=1778829640; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=L53kthztgvDO0gpZ7CrzJcti9CkeL2yF+aYSX5DyYaU=;
        b=ABfHGis903TlkEsHK0c8Di8VxmOK2cvUl/v9NPDz89x/y1O+U9A+/+MqXZJuC+c8d9
         iQzytF/ukgCnREqxeFVGffA9v/KpaA9KKPUCnMaIn1aOdzFKsfNrvPy0R67ES0/CiYS8
         4+cLi2HvcLFHYPpxC/PJCR2L0gvLd223nsZCd8O3RdlSkTs83TmofTkEw+lL/NEvQ1vB
         Znb0TojWAwqmubJwwWWfG4ewQJYBUUStmvHRq4kMOvk7tjYXxTFa4AxW8vapVXAQFhI1
         lTnRTfCyFgFEJWHwQgXaHCc70Tox0o3t4Gj45b24yBQ/aMiDNyPKWHG/VjtAdZ0urIQQ
         314g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778224840; x=1778829640;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=L53kthztgvDO0gpZ7CrzJcti9CkeL2yF+aYSX5DyYaU=;
        b=WPzcyIl191A34eOesSDMSjRUr5NCpZuYGZwz14Etg75IlY7TMU4M7TrLaTXT2e7rim
         edYF6F2WohCSeRMx1G+jSib1SOYK0szAiOJBE5Yr6XzxT9g0ADSb2qLEa6G+csLliDfj
         FWRhdSuGisk2FGDlaXg1p1MmZ8Lj7Pid8S6u1cZVmKySCc0fgUgetUb+AZIBEl+weAdO
         bOqfeFOTNyZSpFx2ih5+K/q5VgNy6oHrkM1kdmrijjMvOeWfszKFE8olQPahSUrjD6ky
         IquVrHKY1JZXD/WHVw/ZAwqe2Eiq1c9Kf3LSCrfcD/pfHc0/c8AJBUrnAFEH5C56vElE
         lRVQ==
X-Forwarded-Encrypted: i=1; AFNElJ8iherF/ivnAcKVnpTUnbdyOKfbQZcENbkp+tdQnpISeqPMIbf+BVKVCFVg7joNEzRkwDnLqX8DV/1G@vger.kernel.org
X-Gm-Message-State: AOJu0YzRCtNbgQ83iczTAzS8j8jgzol+A2nMNwBWkxlnmVG7MVuhdJXx
	KljwdaAfkIjxsTGYR4jv1ksxB+hdIXGuP/+Kc/TrP7x4fbvRpfcOP5tkycPVdNaRkUPVnj+qtWV
	qYgHh9Lf/2wKBqOZHc5kkK852vN+dj0W+mPC2clYO1Uw9NYsAqzjGVIY/K35HbdpA
X-Gm-Gg: AeBDieu/hT/y77o8/QT9rNUfHd+u1zbL4YRD5NArhsvhCV1aJLxqEyceaozM97U0SjY
	pSjv9mzbsxLZhY9MD3HHzKQegdQbmCMyaXnI2J1ZCd49qsqFI1GpjzDEMoyDjItBdQuRl7UeL8q
	Vsk1Hz+LRHEwP0XX2+fYh2CJes+BVtRr2XPrtL9k2Ln9J1pVDhGg9dnWEclXlUdK74PUBBwiPDi
	KO18Ioe+c5pJdzTNk0DoJCd+6I8JzneP9RgMWUv3pz2/kFYtQJmenpH9R3Fv5XtWp8JnhQAuwzd
	Zg4vn51UaQixHtYWM646+3Nu0jPjLxQ6PsaMHcjlKBxxoCK2jvbPh+uGXsT2t73Nq6BXK46RHde
	3urgXOD1x0t+rRZMe01xFoBNZwA9xlp1uwMZAlITjKIYSIOtMZh8=
X-Received: by 2002:a05:6a00:1ace:b0:82f:776f:a78a with SMTP id d2e1a72fcca58-83a5d873226mr10911687b3a.30.1778224840155;
        Fri, 08 May 2026 00:20:40 -0700 (PDT)
X-Received: by 2002:a05:6a00:1ace:b0:82f:776f:a78a with SMTP id d2e1a72fcca58-83a5d873226mr10911652b3a.30.1778224839633;
        Fri, 08 May 2026 00:20:39 -0700 (PDT)
Received: from hu-smankad-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-839659498f1sm14566685b3a.17.2026.05.08.00.20.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 00:20:39 -0700 (PDT)
From: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
Date: Fri, 08 May 2026 12:49:50 +0530
Subject: [PATCH v2 4/4] mailbox: qcom-apcs-ipc: Add Shikra APCS IPC support
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260508-shikra_mailbox_and_rpm_changes-v2-4-ab76fd9e71de@oss.qualcomm.com>
References: <20260508-shikra_mailbox_and_rpm_changes-v2-0-ab76fd9e71de@oss.qualcomm.com>
In-Reply-To: <20260508-shikra_mailbox_and_rpm_changes-v2-0-ab76fd9e71de@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Stephan Gerhold <stephan@gerhold.net>,
        Jassi Brar <jassisinghbrar@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        Sneh Mankad <sneh.mankad@oss.qualcomm.com>,
        Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778224815; l=1107;
 i=sneh.mankad@oss.qualcomm.com; s=20250818; h=from:subject:message-id;
 bh=QPOvZ4FdMA2wnx84lf4VqyIVMhJ9E7QIKahaQXRd0/E=;
 b=82mwbwOr0ZKBOub5kRgRJXn9IsEfwKmYiz5+sD7tYbxZTcQyYwvEdscH+tBgld5nw6LmwxhW1
 FDTx/jmeahiCMiCrcsedzSemJKuw79zp0z59UNIybMKRkrrIgF2nNyR
X-Developer-Key: i=sneh.mankad@oss.qualcomm.com; a=ed25519;
 pk=sv57EGwdcfnp6xJmoBCIT1JFSqWI+gawRHkJWj/T2B0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA4MDA3MiBTYWx0ZWRfX/UgAdpffSotj
 NMy+HJgPu/R1X67twUMa33wYUdT44rJQ8E+tiFw1UqCNBpVk6TqTZgL+360YuClt6hAr/ppgTAq
 luNYugBIOZ62+ab9cedLV7dzRHJc7Ap+9qp+GCKfKxaxuYta5pgyMNe5SZbUHgENyDeelVwt2FA
 fdnvhA3A8jRGTbdIbBrBPGpflnbfrqFblNRMnjWfjjmhn5HfPuz2J9RXJqi4E/QMQh7C70qfGWK
 1U9ZhKC8h8ALjc5milMsSkopOFlpS/QLd235xGmseWMoWlzmuUQqnTajaGimHNzDFJ40ELo3r44
 MVGAht4etDnSN0jqQkZ3z8aNJAqD+/td+KivRQZo+/ohof+P+Zn56sT8wSOlf0lmS6FBmxGr0N/
 XVXILLvlC9ZPbl++Go43/HzY1Lh6RrElNsu0jjuyMWvSkXGiUBBqyatO901M6rSg05FGpPoufqo
 hKDrzzbpx1F29iAagcA==
X-Proofpoint-ORIG-GUID: uMNfSDDJTUTo0sYc_Ne5B4oeMt3y9_kI
X-Proofpoint-GUID: uMNfSDDJTUTo0sYc_Ne5B4oeMt3y9_kI
X-Authority-Analysis: v=2.4 cv=McxcfZ/f c=1 sm=1 tr=0 ts=69fd8ec9 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=3n6LiYR9N_aqWDaFmTgA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 suspectscore=0 spamscore=0 bulkscore=0
 adultscore=0 priorityscore=1501 lowpriorityscore=0 impostorscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605080072

From: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>

Enable Shikra APCS IPC support by adding the compatible.
It reuses apps_shared_apcs_data.

Signed-off-by: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
Signed-off-by: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
---
 drivers/mailbox/qcom-apcs-ipc-mailbox.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mailbox/qcom-apcs-ipc-mailbox.c b/drivers/mailbox/qcom-apcs-ipc-mailbox.c
index d3a8f6b4a03b368821ef9a5b24fee78037104610..25f76965921ba695e3a1bf4df47ce643916a28cb 100644
--- a/drivers/mailbox/qcom-apcs-ipc-mailbox.c
+++ b/drivers/mailbox/qcom-apcs-ipc-mailbox.c
@@ -168,6 +168,7 @@ static const struct of_device_id qcom_apcs_ipc_of_match[] = {
 	{ .compatible = "qcom,ipq8074-apcs-apps-global", .data = &ipq6018_apcs_data },
 	{ .compatible = "qcom,sc7180-apss-shared", .data = &apps_shared_apcs_data },
 	{ .compatible = "qcom,sc8180x-apss-shared", .data = &apps_shared_apcs_data },
+	{ .compatible = "qcom,shikra-apss-shared", .data = &apps_shared_apcs_data },
 	{ .compatible = "qcom,sm8150-apss-shared", .data = &apps_shared_apcs_data },
 	{}
 };

-- 
2.34.1

