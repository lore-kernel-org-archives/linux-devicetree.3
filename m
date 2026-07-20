Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4E453CC332
	for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 08:04:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784534660; cv=none; b=qMY0osoqHzPxJ8DW1f9bZ9SoQCe8XKnwzofNsjoDRIBqnXyO3cPf+SSJKhq7cN2uhfqNQ5+MmyO0CkQmr60A2R65JWbSUXCshtVCdY/NcYYH3yXlSqGfh0xs/mNJ8w/K9FeGPoao4SGEqPlK6ZA3QegVSgNm4/zJBU/7Czctzcs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784534660; c=relaxed/simple;
	bh=axJo0QsdmJg35RBqGTfo/6nxaHHL0FSyQ0xk2oeWY4I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kjYwu8iYllPN9l5BusULqi4IHjHzRxI3yoDVIBKf8+a+ERIrDwX5eHH7RCKRxwIqo083oZJX2mOzCzLzJRNmEl6VPYBeBiIdIxOubqmzYwDFnK8FK2Mn7b9cOXPdHJu/xECAt5SQZewbMCXOFpmpYSROYf/ECjA0YB9GMxs4Ofg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LkBRKcXu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HA2tbBSx; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LkBRKcXu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HA2tbBSx"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66K6RZjN1506373
	for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 08:04:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fwGrtQXZOZLHM8CW5djIH+FZH0mzGoPJDhLtNrPv7hk=; b=LkBRKcXu8H23KcPB
	FChyV9A0qOOekp5KW04f7D3hfe6JJKYdDRnlgMNorJp0AjaaE1VOzPo35CC78jgR
	NJ5i58li77h6jGDrosvRwj/aLsyqXk8QR1aaXaBwyTQ0jpEYw1Q4cNN8VWiJO7Wi
	a3xuU/daZ9l/39xqB9iBglFYXl88QfFkn6vX/NlE5JXNvVTmrDMYuW+owOVi+C1D
	l3YRDEx1HuYWf4TtuRZ9mXYS96V+Zp9Njh481UIoNoURkBj7clRSTqVLt8kQctzJ
	SokBoDbiOH9tj50J5l+hqR9n+kPl1IiDVNrVoLmz9t6zWDStvDM2vreD07tpmxcM
	apvjfg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fg2bvw312-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 08:04:17 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-9308eafb465so1180671185a.2
        for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 01:04:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784534656; x=1785139456; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fwGrtQXZOZLHM8CW5djIH+FZH0mzGoPJDhLtNrPv7hk=;
        b=HA2tbBSxPI1TPSdVVZnU9Mftpz1IeFv0W71yaJzAnkbkghFnKQPcW+EPMM9Glnt23S
         /CWdQzEE6JCEwRQyP/opR0NLRQNInUUsI1RKhyLcxwBVCc06Mr0Kv87iN1BVcmWonLQh
         0nQVr2lh2Dkdbjsubb5M3U7Ey6FUAkkyYv3//BiXTZ2J42BXWeeRVgvYjxsMxNwnRo5h
         s31BW4UKDQ0cFeQEnkmqBShC0em8S2NFnsCxQqC22Ph4dzgZU5JB1Sxu032W9/G6ddz8
         4j6Y0KT74zjdyuc1lbtMk8dSNZMzMt6ev5PmS4stRXUV+QRL/LPNJ+m9hKUSr4ENKGh7
         7ZSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784534656; x=1785139456;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fwGrtQXZOZLHM8CW5djIH+FZH0mzGoPJDhLtNrPv7hk=;
        b=qrqtZaNowlUEzX8xoTw8w4up5e2yP1Zuqcp47U/ntZPCbngYVACFdwU95yNIDQVr4F
         upN7fa++sO6LDe1FizU3JB3RCDDFFCTQ5d5Wi7n9Vv+A/tH8uKf//clKN9GCXIxIsXaa
         WmZFvtQgbFZDyDtRyD8J7GQaNsbvGpkkAm4ge5rlxUfGpZ9ZyLrKnl3fXYC1ai2xlD0u
         mDvnZgsyGTInpQWmkdBi8t9KYDdy6sQUGt0NE3eiOlkzAG3PR0yt8JlCpFR0AWz38wTM
         P6lqIW/+kSJ/SrFtZTj5amvpBuaU/zBhO+LmufhAdm2BiVQKnN6W/5Z2WbCOhTg+oM4U
         B1+A==
X-Forwarded-Encrypted: i=1; AHgh+RqRhqXuNb5Sy6e3vz0lqi0xc4bTwgkc0PunTIGj60sRNzAMr2biltMxzD9yoNOestBImtE1lJpCUUfy@vger.kernel.org
X-Gm-Message-State: AOJu0YzhT0/UbWvzwSROg1cCMoJy+1+XwnlpjyheoHDv/e9BJNCcgR5k
	ddpuw2gY7UHqWT+WsYO7YvfrUU904YZgGLu+/ApHKBwEnu+5f7iitIGk0ULj7ESyG+BW5sZLazk
	IRkyDMof3tzF88btWs0jlNsClV9deYKoyWl9HJFFU9zwKEe89m4+YixyP4kIMJgvm
X-Gm-Gg: AfdE7cnhTeGfd+estKTANv2ZrL/Sb5a2Ce3a2SqYOYCzF8JcIyXXQCr5UPw/zADgpLa
	q6QQH3vXrT53Sl+ndRyqsuZ2esii05ramvB/Lve9qlMdcfOaHAESk8kNQkip9a6U8xdAJ5ARVJ+
	tzXh6rZEhMCaELLDC+wxvkFShn3XIkix/ndJy6+qePAAUjEcOsrMfy5ILf1Kx9e2rHJPTGZfw5h
	aGu0XQ8AKNhEINbkSBsCok6Nz5Me2d+VN1zIGLGvPASxlr0jSWXCB+647cnu8tt6MnhMZ0WN4ka
	J0ZB8O18QmXH8YfkYcaXzOrmPgPoVKSfvBlK4aHw5bgErhY9+lxk8aIOOAkLiliFabdCRTJWHKJ
	D3d82unnJgr2/1gbZTSnDbWl1mjSiOH3+eE7KK0gCpgDENNp4Pogy2Db2fEK7wkdIKk72vZfYqZ
	Bq9n2vN8lBTWTzg/Gss7yzq2mctH/aMMcU9GjpSmKFh7NF5YLwpNI=
X-Received: by 2002:a05:622a:7:b0:51c:d52:6049 with SMTP id d75a77b69052e-5213ced0406mr130529291cf.28.1784534656084;
        Mon, 20 Jul 2026 01:04:16 -0700 (PDT)
X-Received: by 2002:a05:622a:7:b0:51c:d52:6049 with SMTP id d75a77b69052e-5213ced0406mr130529061cf.28.1784534655488;
        Mon, 20 Jul 2026 01:04:15 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:751c:d61c:c91:60dd])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69e7000c3e2sm4256542a12.30.2026.07.20.01.04.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 01:04:14 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 20 Jul 2026 10:04:06 +0200
Subject: [PATCH v5 04/11] power: sequencing: pcie-m2: Report power
 controllability
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260720-monza-wireless-v5-4-69ec6743543c@oss.qualcomm.com>
References: <20260720-monza-wireless-v5-0-69ec6743543c@oss.qualcomm.com>
In-Reply-To: <20260720-monza-wireless-v5-0-69ec6743543c@oss.qualcomm.com>
To: Manivannan Sadhasivam <mani@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-pci@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-bluetooth@vger.kernel.org, devicetree@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: hf27S0cb8TtCZ_F2VyJERrN1V5sTDV_k
X-Authority-Analysis: v=2.4 cv=EcH4hvmC c=1 sm=1 tr=0 ts=6a5dd681 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=Wval_j7vKiRkorSqWqkA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIwMDA4OCBTYWx0ZWRfX9iqNeBwvx5gl
 gwAuqf35L42B9gRr0hv88MUOp6RrDeRXaou09YvlVAu2huoGMh/eqr/YsHwGOZmMtxzBgpd16RI
 LCKQEl6xxrQNoXl4+dydulSsIdFb5Wyi/q3W3uEnX2EvXfFSPCtK3wW+tF7PURPFUW4GaHyDwDg
 u5ilRh8KxoJ/G+2cieP6P1safoNm+QCxNNwDlUZkBx1Jp++U4A4AuH0b3PdGOcMXX098W0fvexE
 1rU2oYCYaHqv3Fka2iCAnm61c6BxYx0jBujER7Fw9tNopLs+wPVqTVm+4PEvOPvs0syEJj7780y
 sv2y3woLyIdPDbWJDs5sj8snY6KCLSVMaGg6G5nb7kyFeI80K0atH8p03IKJ5En1UGz8uix+xHw
 qNHvpAuMLs0SFRyxviE9QlpMXRJstCVXGP1tMrsne8CQ2x7yR/x74B3uQohcTzDm3/6HyFEuC0p
 ZdqXavvhxsVwoyZ0Juw==
X-Proofpoint-ORIG-GUID: hf27S0cb8TtCZ_F2VyJERrN1V5sTDV_k
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIwMDA4OCBTYWx0ZWRfXy+xM8ZqnoqyO
 9KiUFCOpMCw74/W9oHXRB9pwdnHy1hcMZB7QJwZXrmpG5MiZGrageyCikKRvT9fIkGsgN3+SBZz
 zflRGfAFtC0wjosk0n6PHu982jlXfZ8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_01,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 bulkscore=0 clxscore=1015 impostorscore=0
 phishscore=0 adultscore=0 malwarescore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607200088

The M.2 Key E connector gates/resets its functions through the
W_DISABLE1# (PCIe/WiFi) and W_DISABLE2# (Bluetooth) signals.
When a signal is not routed to a host GPIO, the corresponding
enable/disable callbacks are no-ops, so the consumer cannot gate
or reset that function on its own.

Implement the .is_controllable() callback on the "uart" and "pcie"
targets so that consumers can query this per instance (based on the
runtime presence of the W_DISABLE2#/W_DISABLE1# GPIOs) via
pwrseq_is_controllable().

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 drivers/power/sequencing/pwrseq-pcie-m2.c | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/drivers/power/sequencing/pwrseq-pcie-m2.c b/drivers/power/sequencing/pwrseq-pcie-m2.c
index e3ba9169144dabbf0c553c0a4302c3b511fcaaa1..8e4cb778e31f66aa171ad9831d4213e17d2e6145 100644
--- a/drivers/power/sequencing/pwrseq-pcie-m2.c
+++ b/drivers/power/sequencing/pwrseq-pcie-m2.c
@@ -84,6 +84,18 @@ static int pwrseq_pci_m2_e_uart_disable(struct pwrseq_device *pwrseq)
 	return gpiod_set_value_cansleep(ctx->w_disable2_gpio, 1);
 }
 
+static bool pwrseq_pci_m2_e_uart_is_controllable(struct pwrseq_device *pwrseq)
+{
+	struct pwrseq_pcie_m2_ctx *ctx = pwrseq_device_get_drvdata(pwrseq);
+
+	/*
+	 * The UART enable is driven through the W_DISABLE2# line. When it is not
+	 * wired up on this connector the enable/disable callbacks are no-ops, so
+	 * the host cannot gate the Bluetooth function on its own.
+	 */
+	return !!ctx->w_disable2_gpio;
+}
+
 static const struct pwrseq_unit_data pwrseq_pcie_m2_e_uart_unit_data = {
 	.name = "uart-enable",
 	.deps = pwrseq_pcie_m2_unit_deps,
@@ -105,6 +117,18 @@ static int pwrseq_pci_m2_e_pcie_disable(struct pwrseq_device *pwrseq)
 	return gpiod_set_value_cansleep(ctx->w_disable1_gpio, 1);
 }
 
+static bool pwrseq_pci_m2_e_pcie_is_controllable(struct pwrseq_device *pwrseq)
+{
+	struct pwrseq_pcie_m2_ctx *ctx = pwrseq_device_get_drvdata(pwrseq);
+
+	/*
+	 * The PCIe/WiFi enable is driven through the W_DISABLE1# line. When it
+	 * is not wired up on this connector the enable/disable callbacks are
+	 * no-ops, so the host cannot gate the PCIe/WiFi function on its own.
+	 */
+	return !!ctx->w_disable1_gpio;
+}
+
 static const struct pwrseq_unit_data pwrseq_pcie_m2_e_pcie_unit_data = {
 	.name = "pcie-enable",
 	.deps = pwrseq_pcie_m2_unit_deps,
@@ -133,12 +157,14 @@ static const struct pwrseq_target_data pwrseq_pcie_m2_e_uart_target_data = {
 	.name = "uart",
 	.unit = &pwrseq_pcie_m2_e_uart_unit_data,
 	.post_enable = pwrseq_pcie_m2_e_pwup_delay,
+	.is_controllable = pwrseq_pci_m2_e_uart_is_controllable,
 };
 
 static const struct pwrseq_target_data pwrseq_pcie_m2_e_pcie_target_data = {
 	.name = "pcie",
 	.unit = &pwrseq_pcie_m2_e_pcie_unit_data,
 	.post_enable = pwrseq_pcie_m2_e_pwup_delay,
+	.is_controllable = pwrseq_pci_m2_e_pcie_is_controllable,
 };
 
 static const struct pwrseq_target_data pwrseq_pcie_m2_m_pcie_target_data = {

-- 
2.34.1

