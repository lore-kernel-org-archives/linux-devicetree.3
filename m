Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E6C33FC5D9
	for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 09:57:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783677469; cv=none; b=C8mL9HVsHhtFp/6EyiEGDa8KgFYFy+iwfGTXJ77sbtJmrNlEuB0OARot6Ooqp6rfKFpA9b9hpQ/pGG7XY/1P5BxeVQW0GEPno9mhcWn1Znb9rQn782csUOTWc8aynnhqAmPnbL2JWMvJTozGenfmEK79nLO+fYs++Es1naZpRIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783677469; c=relaxed/simple;
	bh=2FBpwvvQE75I5khIUailuHtmF+KaL1qEU+l8PSLJfdc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XjRdjpyiPmoACvvoK0Db7KIU3A0KmgCj9Ol/+CeYKoWyNmttkhusxMjnDlqWKKloRtu7ec9Rmbo4jSmgH7Bkr/lXCVILPwoOvojqOHBlZSoGrFENYeCUnlmNkd1jwY5acH8M4DNm4gVLs9p0N7I+SrMnqXw/sP0HRPWOV8NUsYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JH4UsoJa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Z61Sha5x; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JH4UsoJa";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Z61Sha5x"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66A7dX1E4156606
	for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 09:57:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hRa1V0rI3XaAjqfNbDQPKrOYUHx+ncbEbofR/K207A0=; b=JH4UsoJaIxL9Qnjt
	EDqt7UIvTRB5R1k6fgCRhtToC1oYoDSqCv+GjTm5MEd7ej2Z5jDAmIUWkIj+6+qU
	lim9C3adByloFraelPCK2neFe5Gmr4HaFA41CM7W7WqFEXO8pnDMnr8fiB1pGIcX
	w3ONI6cP9njcHc2Uln7Y63nl8B2DaBvD/MctKrnfv0g1jvQQEET8EM1+LjEdIA4P
	vW53GtNes2rbLtve+HR/v+R/Vuu5Vt/AlC3OMVewk+Fto1X02rQI/e3h+lALOn6x
	MScoikM+O2ChKkNm42YUYoN4AgHw878FRtMMv8rdwQXBlYrXmvkiAyPoX8xQxI2N
	m0ZR6A==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fahv8jr1d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 09:57:40 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c1c7f135bso13038471cf.0
        for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 02:57:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783677459; x=1784282259; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hRa1V0rI3XaAjqfNbDQPKrOYUHx+ncbEbofR/K207A0=;
        b=Z61Sha5xuv+KyJpfvYsi0L8SRPDwV2+t0cuzTNY9K4eH5rnUyaz6Gr4A66yeM547id
         MK8d38lbM/frxnF2NnWTiUnYarhgaxdQTmGW9rgLOSpf34PYAm+hjiBHayfdDBIvSEi5
         KoX+KEJt0y7WGzTP5+aRNLrZUI3ixlM0KX4U1+0qOtG8iny4GZV+LkUExXKlpmElOYYh
         0g6PjYmzMBtZb4kHaGVeH3UaABBgM7IE4jix8OKzjuDOBiOoVSGDBZwxgZ0o5UEWiPZB
         oVUj0/CCAAjysBTY0KIA0EbbJhZ15w9tPqoyRFbOfSDBCCxUqhbQuOr+VeCyT2Dw7dDh
         CtOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783677459; x=1784282259;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hRa1V0rI3XaAjqfNbDQPKrOYUHx+ncbEbofR/K207A0=;
        b=JqFxETMZf7xp+8Iz6ICBvobplM2Ca4l5XkF0XBUldxtvwb8QnTYsB6DM1kOCCvpSzQ
         MXysGLNbkvZ3pA0N5AdcaNjIMPMdCkuHgSGlsO3vyERheiQEaxPphK7MvNUue4hi4ZZl
         WKrBfOCr388wRiiZTGvZZBrULN9Juy1o+NKP1wVlm+ne+xNGB7SUch1mutESb0l/Pr8d
         Gxl6c2JCwhZnsOhAmVG8HP/KIbl3Kt0laQrMgUqPPe+i/TqCCyJZX/W5DzuUx9eLyi6z
         0rPTuyjgcUMeeBlM4diStZ0CPonukcIctUGLmFF3PDzoGj3BC9SPgrTFT8yrbg4Sf29v
         RO9Q==
X-Forwarded-Encrypted: i=1; AHgh+RouppBd8pFcWoXE6WUJ2CSGTrwWHq3BjaZdt5Yin8XCx+vBFIfeBdJp0h37F1TSupk4uxqLzHg/bGvQ@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6JccGg4VCgn5ZhoDkJ779WHhLdkLG0B7fuPypIjGR6kx9/ECo
	Z6Bnc99I8CT5utLxc5VLLl9OfWU+LGiCtnenrmHxxWNq3KjpyS7PP0tKltwAdsav6VBmnkXkaCB
	PvaCqLlh0qaxTiGKHP0icLJwaROydjILLoAnn2dDvqXWQhwnE6CcnmhxBJPcUmK+b
X-Gm-Gg: AfdE7ckPdahLneEaOrhWU48l8PaKIdTnU141quSgZ+JkigNc0t8+PjrlZrUaYGMZYpP
	DM67Grw89fXPncpTpy0gyXC3qMH4XxIX3PhA5bxiZTeO+fq1+rP1RX9ecIurKbM7Y3GpMPxu83V
	VuFHX+etaVeqK2XY8Idob+NBWGJqXektRQ7ixoq4vmbjg6poLAQVYd2KmOPX4vg52gwiBy9sirJ
	PX+TznvDJyIv6FSdeQf+qL4rcgKuDnL/Uf4QSIvqXz/tm6S9MtckK9fgsloZkUHVsivKKYRW0No
	hftx3kSeSS9v2sYlSpFupo2phuBogveMHtZBmNGeUScLEHYgekTytq/zPmBZgn1dFmY/VQkv2Oa
	T7AVbyYtjd5jmhVHzTZUyHuKF69vnXX2jdYxvw+N7giaEwhxZuG/dti2cxG+XNN9B6XL1ZWHl+S
	Xn2Pu27NxP1peoTcf6QWt9Ra3GS1yIb850nqKF/lub/6U9OB+ezhJECjcuY81RJYDZb8dCzGHE9
	7SnDsyOC7lpW+pQsl0y
X-Received: by 2002:a05:622a:55:b0:51a:88f8:bef2 with SMTP id d75a77b69052e-51c8b3daeb9mr118302811cf.28.1783677459274;
        Fri, 10 Jul 2026 02:57:39 -0700 (PDT)
X-Received: by 2002:a05:622a:55:b0:51a:88f8:bef2 with SMTP id d75a77b69052e-51c8b3daeb9mr118302571cf.28.1783677458821;
        Fri, 10 Jul 2026 02:57:38 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com (82-64-236-198.subs.proxad.net. [82.64.236.198])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15dfda815dsm265357966b.36.2026.07.10.02.57.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 02:57:38 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 10 Jul 2026 11:57:30 +0200
Subject: [PATCH v3 04/11] power: sequencing: pcie-m2: Report power
 controllability
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260710-monza-wireless-v3-4-46253587af64@oss.qualcomm.com>
References: <20260710-monza-wireless-v3-0-46253587af64@oss.qualcomm.com>
In-Reply-To: <20260710-monza-wireless-v3-0-46253587af64@oss.qualcomm.com>
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
X-Proofpoint-GUID: HpVXDjx7H-x1--FJ7Y7KMvQdtZ7kMct4
X-Proofpoint-ORIG-GUID: HpVXDjx7H-x1--FJ7Y7KMvQdtZ7kMct4
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEwMDA5NyBTYWx0ZWRfX94nq9+qm2lCC
 phSv1UK4II0DFhyU77lAjFCmfjH9KePUav9/a06GXJ4vSuyUwcKX3IXQPVZRejcLmEar909Fl6a
 sj+lgSvFiQi/QvIQihuCMmQKtUKyd7M=
X-Authority-Analysis: v=2.4 cv=funsol4f c=1 sm=1 tr=0 ts=6a50c214 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=MDeckJw97qnk8wCBExTehA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=ZbPLKLkBM29APCUVJXgA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEwMDA5NyBTYWx0ZWRfX9GeqBu7H0STn
 ZiJsLD3GludaKQSQpGYXSx3Y2GmtqSS+KzotdeqWzKE3qyuI/daQyANCXiJhq4bXJGKr19D9YJl
 meeoqZ1IyUB+k0oYbNYQJWuDMrOwMHFYveYjb4KJoZH24zStq3oV9EpnRKOxQLdRGZNsJHFyl+M
 7uGa4wqO7rH2ohEmv5yggscHZDwVVxZfyNs6+i/LjFf1YviEqmbRSAGXtp1FHSfkuXrp0uZCtFW
 pHczlNIMBl/AUkHR4MU6fdI/qXeiHojSxk5l/RsfZtk1i8lNfH9jFLAgG5TtgEwP2GBqZNaKzqd
 qbMNF1463AFawqUCMgxV6UnC/xLM4X+eWtZP+731qgwvgbBgOuXd7Sr2bbLZrRJP7Il1z5/iiEa
 T15bmynS9haWbn5FcXvfJPk/hSvurcOgjJ+YI4f4AogWquMg5mkw30Ep27VxHSnLRNqEya+Ns+h
 cbSnLpHroK5n0N4U78Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-10_02,2026-07-09_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0 adultscore=0
 bulkscore=0 suspectscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607100097

The M.2 Key E connector gates its functions through the W_DISABLE1#
(PCIe/WiFi) and W_DISABLE2# (Bluetooth) signals. When a signal is not
routed to a host GPIO, the corresponding enable/disable callbacks are
no-ops, so the host cannot gate that function's power on its own.

Implement the per-unit .is_controllable() callback on the "uart-enable"
and "pcie-enable" units so that consumers can query this per instance
(based on the runtime presence of the W_DISABLE2#/W_DISABLE1# GPIOs) via
pwrseq_power_is_controllable().

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 drivers/power/sequencing/pwrseq-pcie-m2.c | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/drivers/power/sequencing/pwrseq-pcie-m2.c b/drivers/power/sequencing/pwrseq-pcie-m2.c
index e3ba9169144dabbf0c553c0a4302c3b511fcaaa1..4bcd5078609da1be966ab30c73cffae5e578934f 100644
--- a/drivers/power/sequencing/pwrseq-pcie-m2.c
+++ b/drivers/power/sequencing/pwrseq-pcie-m2.c
@@ -84,11 +84,24 @@ static int pwrseq_pci_m2_e_uart_disable(struct pwrseq_device *pwrseq)
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
 	.enable = pwrseq_pci_m2_e_uart_enable,
 	.disable = pwrseq_pci_m2_e_uart_disable,
+	.is_controllable = pwrseq_pci_m2_e_uart_is_controllable,
 };
 
 static int pwrseq_pci_m2_e_pcie_enable(struct pwrseq_device *pwrseq)
@@ -105,11 +118,24 @@ static int pwrseq_pci_m2_e_pcie_disable(struct pwrseq_device *pwrseq)
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
 	.enable = pwrseq_pci_m2_e_pcie_enable,
 	.disable = pwrseq_pci_m2_e_pcie_disable,
+	.is_controllable = pwrseq_pci_m2_e_pcie_is_controllable,
 };
 
 static const struct pwrseq_unit_data pwrseq_pcie_m2_m_pcie_unit_data = {

-- 
2.34.1

