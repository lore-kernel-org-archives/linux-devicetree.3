Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795430900;
	b=C8LqISyyJ+rbZx9dOLvHD99pE8ORbtslhd8OJg2iUOmbU/ChVe1i/5Kx5zEr43xxI2dg
	 PWdIBtTOvdIWnsoDDv8OOahFNs/UgOdG5A+NEF5n/mNypa38xC0JJoXaJ+xVqhbA4+Ye+
	 mlPHIiCNlEpcaLxLV06f+UJPs5Zym8wXePExEwb6JANF2Qp0t7bR2w6VD5dCWJgWo9Xcm
	 3qwxjCU25r499kKtPHM5iLmjCxcR9SmgoIYlErHlPIVqgDemc+JQBFBYmg0oyufZ434Uu
	 rXuInhZTQ3vDZcwW+qtlIzbPa/hbRTexb81zekq6hUdLec7NO3bIPGwqoW5MYkEjGSg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795430900;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=BP6w8Mi8oLrFmwp5WAABx/XP4MVrmlvIQ4vwklOKyMw=;
	b=AH+7vJP0U5gFUoOYXe14S9C2fLt/mwdVMGVQENPIQLcXDrcG675T358ez8X5aaDfLoX0
	 hpICkdeu6QXcmKinDCAIO8mSWZHW38j4Yd0z/eTLHHC7ZA+QFE5pIcpeFTyEIxLTNOZB7
	 DWy6t+ish1FqRMV48Nwk8Yzkr8Ejjipj5dmh5/SLqxlDUveWx0DpyFUdQvvWb0kan5zmU
	 0Qe4uiXE6pAP1tC54FS8BV9GYheceOF5KfeW37Ivmg8XuI2Fj444WzgxXj7uLf2RdyAsE
	 1yn12oSftgc0WlEqrpmeN7BiU76gh7RRp6gxu7extXidHck87X3Y9zHXeWR/8chYW+w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Ui7A4Mdf;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XbYGjf2G;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14679606A33A
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 10:48:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 14679606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Ui7A4Mdf;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XbYGjf2G
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AN9G1K61899181
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 10:48:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=BP6w8Mi8oLr
	Fmwp5WAABx/XP4MVrmlvIQ4vwklOKyMw=; b=Ui7A4MdfF9LOlwIa3IT45hEaStq
	vCbAtr36Tm/yVoQSnBbptjdn/QSusm7u0GOmAERz3gqvfnCHHd5if5Yw+xLjh/oU
	IdZg5rRHVyPBT0pC2rzWhy5AmOFSYUgT7xmx2JmhsdkvpsYtTYaDkgWP8pLpiQfx
	2a02oewYOR8caCoZXxNulHI2MD2d7dr/L8Y2OsqmxlexGTh8hf/bguzbYL9veOsc
	qARvoFatcIFAMSLANsnn4wHY/TOh0l/j2cyNcDUDdXfhB3tNRf22vlw2SQv17Fa8
	W4ROxkzPqn3XRmw3bF86b83/YecH1pSyp9Tz21NQ48vcAZCnyc6RONXB2bQ==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4g1k11hv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 10:48:18 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8b60129a46eso3628479b3a.1
        for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 02:48:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795430898; x=1796035698; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BP6w8Mi8oLrFmwp5WAABx/XP4MVrmlvIQ4vwklOKyMw=;
        b=XbYGjf2GXPJIH71NrQ+clM1xLqEumxWzKYFOxloX1sZGWMHKDTCW62tCfTAjph+MGX
         aXYShGsCXptNL82LD5TvofReNLv8iv+0SXyUHrY2TSrVxvjRSrj60+8hn1DIFjTO1K3y
         vf+Jp+JmZWOCf9FowdcxFhHJD0Yn2b+mC0SbGE7KKTwx4U7kF/XjM6RZFKFV+ZwSTYQY
         PRmSJqx7kwn1nDUgA+87AdFPWOzRGhqjsE4niybOD+GjAujBke2an/M8rAC2+qBhtazD
         IR1BfMJfk9kdYmos+1F/Q9q50zenY62UL3J4sKfaVEzMR9VVDXrqLzR8mbPp9ihwuYhK
         dGdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795430898; x=1796035698;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BP6w8Mi8oLrFmwp5WAABx/XP4MVrmlvIQ4vwklOKyMw=;
        b=1zbXsV+lR0TMN5zpUdg2o+SZVR0e4YmzVdvMxjbNBpAKFQTYIdVN9qrEh2mqEV94Px
         eaaCft97/ptT1Q452OJwYj83yIMhEr954XvKT76I1IGEoc4HWczzmCGKlIUrkZmWJ6qT
         5dnb4uUQGi932yxV9ukC/ZrHBeig3ByDtP3iCb//0jSjSlQQnkskR7BfatoatCpzGKRq
         MWURw51gwa1TM90q0ghrBqgt1yGq7BWPwDSCLlltsNqHziy+Jg4aoiOSbZAWwCOq/C2m
         uvW+NA77JNtsfvbggEiEl165UDnrUmWK9Op5haSrgQRXc2h0Ll7czjbXpuzQqouXPPF+
         2vyw==
X-Forwarded-Encrypted: i=1; AL+hErHFJqcV9ZPwr+Cl1Vdyqr2hXU8U6Hy9TARHpr0gExypCNosSEwKXJo9b3LROJgdjs6LESsbE7Udom15@vger.kernel.org
X-Gm-Message-State: APuU4Z+nU/OFyTNP2DAVyfw1Hv2wA4yIVU1nNlSEfn5anJke/r89UNXn
	PZf2fYzS41uhEC3FVmobpByuGx+FcgUKhJdBbI6zyFi0hRKGXd4VXBenofcAS94FmgDbTlHoOHr
	UQ5GBSxG2M1ooKp4280meZgcsEXpsFq/DItmczO03O+gL9IugdiKfkywRBvcWJKgU
X-Gm-Gg: AZFdTZce76q7+9EcUYL+HgXXMSJK80MU8H7+/otVgGj+LCT2Pnca93Y4Iil/Y3n/3xD
	0N4oLc7Ve1eJFZtC1rushKaI6YXH9qWcYy+rpLjNqRlkZGeSeUsIHr6eOGT4DZAsNZk+x4E8We8
	CkHh4wCCJS55HAFDqHJ6C9Mt1nlPIM1ikXylKdxVdMk3zRBmm8xB2A76vTdS/GBCF5kQnd+6yno
	EA/1JWkXhIDe1uUZDOpwAQ+7YNyGOdSnYYXsO0h0Wt+rPeLvK8vLiWpJ1WDwYbPgqulWNFY/BnY
	+Jr2U7qeRLT1mbtbNiTNDNn+0Llys+BE6plHQ4nThC01a0DCAGUPH78H/8tpg+dcWm0759ecfNS
	0CdpFqpl5v+AQoOGT2g1BilTPCg/FvIYHQdGCmfNNC8nRi7MO8vRcUwdYNzxKMN3C58tyMcHJjt
	fQBkMhKg==
X-Received: by 2002:a05:6a20:6a0e:b0:3de:b120:bba0 with SMTP id adf61e73a8af0-4014d4579acmr12134583637.36.1795430897884;
        Mon, 23 Nov 2026 02:48:17 -0800 (PST)
X-Received: by 2002:a05:6a20:6a0e:b0:3de:b120:bba0 with SMTP id adf61e73a8af0-4014d4579acmr12134564637.36.1795430897404;
        Mon, 23 Nov 2026 02:48:17 -0800 (PST)
Received: from hu-faisalh-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c873442863sm5413467b3a.43.2026.11.23.02.48.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 02:48:17 -0800 (PST)
From: Faisal Hassan <faisal.hassan@oss.qualcomm.com>
To: Thinh.Nguyen@synopsys.com, gregkh@linuxfoundation.org,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        krishna.kurapati@oss.qualcomm.com, peter.chen@oss.qualcomm.com,
        krzysztof.kozlowski@oss.qualcomm.com,
        Faisal Hassan <faisal.hassan@oss.qualcomm.com>,
        Sriram Dash <sriram.dash@oss.qualcomm.com>
Subject: [PATCH v5 07/11] usb: dwc3: qcom: Recover controller state after power loss in system suspend
Date: Mon, 23 Nov 2026 16:17:22 +0530
Message-Id: <20261123104727.1539149-8-faisal.hassan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261123104727.1539149-1-faisal.hassan@oss.qualcomm.com>
References: <20261123104727.1539149-1-faisal.hassan@oss.qualcomm.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA0MiBTYWx0ZWRfXwySlSLPOJV+j
 TsR3uzFpQqx2RiaICJcrAjeSrxSAC/y05Ol2cvose+0sPJhQJ3GzY+M24utHeOcQ2/XpzPRHIqC
 1PENojXoAZUzxeGtrNnJCHTqUynxMkE=
X-Proofpoint-GUID: FBX8dpBiTWfP3yqAD56ye238gZLqVWal
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA0MiBTYWx0ZWRfX4q1aAg9lSk4n
 7ZXPXS/CUvknpeyQdwWKPrTp3oLXLQiF2U7pBFLVBGfq2vVJOibQHnzc4ctwBvmrzwfRRRoYZ6p
 c/50wgyurhIAOoniLli40PeUkS6MgTvGVslK0V4yhBwedXWg+w8ksxzOKeufZoCbhz8u/lKkJ0P
 py95bMiYv0Ght2qGZO30Q0DOOPwSS2Qaot8lbDiR3+dIv+TpCQWT6pJcCq9JcnxG6TqCzOm/9j4
 wKXKslCWbu2AjMlHhvYx/IR9K+hmoseetBtfVd89CHcDCQN7BVr/OMbmT0qBUvKHRHN8Lz8eGFE
 KhfEV84R/uHu9FnMWTOjyIzARH0CFZht+Mz0IFpCTlA8yD/hyUO6OdiTnqK4TtuPEC5QrusE4m7
 Oqk54+5hzgwKjoCyh4zh34fhPhUFyYf5IQHDH7vFAqVESP5/u6Xfr6uvlqKoyCajVJN13ICGF9q
 SrHRVr1pQY7xOZ8RTaA==
X-Proofpoint-ORIG-GUID: FBX8dpBiTWfP3yqAD56ye238gZLqVWal
X-Authority-Analysis: v=2.4 cv=cpIOAF4i c=1 sm=1 tr=0 ts=6b0419f2 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=jwmZVrpRRrw7NlGO4-gA:9 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_02,2026-11-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 impostorscore=0 suspectscore=0
 bulkscore=0 spamscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230042

On SA8255P, automotive platform requirements call for powering down the
controller's GDSC and entering VDDmin on the APPS side during system
suspend. The controller therefore loses all of its state across system
suspend, regardless of whether wakeup is enabled. Runtime suspend does
not remove power.

Add a per-compatible flag, power_lost_in_suspend, and use it to recover:

 - Assert and deassert the controller reset on system resume, so the
   controller starts from a known state. Skip this on runtime resume
   as the controller keeps its state there.
 - Set needs_full_reinit, so dwc3 core reinitializes the controller on
   resume, and xhci_reset_on_resume, so the xHCI host is reset as well.
 - Return 0 from .prepare, so the PM core does not apply direct_complete
   to a runtime-suspended device. The system resume callback must always
   run to reset the controller.

This follows dwc3-imx, which also sets needs_full_reinit because the
controller loses power across system suspend.

Co-developed-by: Sriram Dash <sriram.dash@oss.qualcomm.com>
Signed-off-by: Sriram Dash <sriram.dash@oss.qualcomm.com>
Signed-off-by: Faisal Hassan <faisal.hassan@oss.qualcomm.com>
---
 drivers/usb/dwc3/dwc3-qcom.c | 47 ++++++++++++++++++++++++++++++++++++
 1 file changed, 47 insertions(+)

diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
index e7fadad9a4e1..8e8d7e59c6d5 100644
--- a/drivers/usb/dwc3/dwc3-qcom.c
+++ b/drivers/usb/dwc3/dwc3-qcom.c
@@ -68,6 +68,10 @@ struct dwc3_qcom_port {
 	enum usb_device_speed	usb2_speed;
 };
 
+struct dwc3_qcom_priv_data {
+	bool power_lost_in_suspend;
+};
+
 struct dwc3_qcom {
 	struct device		*dev;
 	void __iomem		*qscratch_base;
@@ -86,6 +90,12 @@ struct dwc3_qcom {
 	struct icc_path		*icc_path_apps;
 
 	enum usb_role		current_role;
+
+	bool			power_lost_in_suspend;
+};
+
+static const struct dwc3_qcom_priv_data sa8255p_dwc3_qcom_priv_data = {
+	.power_lost_in_suspend	= true,
 };
 
 #define to_dwc3_qcom(d) container_of((d), struct dwc3_qcom, dwc)
@@ -407,6 +417,23 @@ static int dwc3_qcom_resume(struct dwc3_qcom *qcom, pm_message_t msg)
 	if (!qcom->is_suspended)
 		return 0;
 
+	if (qcom->power_lost_in_suspend && !PMSG_IS_AUTO(msg)) {
+		/* Runtime suspend keeps power, so there is no state to recover */
+		ret = reset_control_assert(qcom->resets);
+		if (ret) {
+			dev_err(qcom->dev, "failed to assert resets, err=%d\n", ret);
+			return ret;
+		}
+
+		usleep_range(10, 1000);
+
+		ret = reset_control_deassert(qcom->resets);
+		if (ret) {
+			dev_err(qcom->dev, "failed to deassert resets, err=%d\n", ret);
+			return ret;
+		}
+	}
+
 	/*
 	 * If a later step fails, the wakeup interrupts stay disarmed, as a
 	 * level-triggered wakeup line could otherwise keep firing while the
@@ -649,6 +676,7 @@ static int dwc3_qcom_probe(struct platform_device *pdev)
 	struct dwc3_qcom	*qcom;
 	struct resource		res;
 	struct resource		*r;
+	const struct dwc3_qcom_priv_data *priv_data;
 	int			ret;
 	bool			ignore_pipe_clk;
 	bool			wakeup_source;
@@ -659,6 +687,10 @@ static int dwc3_qcom_probe(struct platform_device *pdev)
 
 	qcom->dev = &pdev->dev;
 
+	priv_data = of_device_get_match_data(dev);
+	if (priv_data)
+		qcom->power_lost_in_suspend = priv_data->power_lost_in_suspend;
+
 	qcom->resets = devm_reset_control_array_get_optional_exclusive(dev);
 	if (IS_ERR(qcom->resets)) {
 		return dev_err_probe(&pdev->dev, PTR_ERR(qcom->resets),
@@ -741,6 +773,9 @@ static int dwc3_qcom_probe(struct platform_device *pdev)
 	probe_data.ignore_clocks_and_resets = true;
 	probe_data.properties = DWC3_DEFAULT_PROPERTIES;
 	probe_data.properties.skip_phy_init = true;
+	/* Controller loses power on system suspend, even with wakeup enabled */
+	probe_data.properties.needs_full_reinit = qcom->power_lost_in_suspend;
+	probe_data.properties.xhci_reset_on_resume = qcom->power_lost_in_suspend;
 	ret = dwc3_core_probe(&probe_data);
 	if (ret)  {
 		ret = dev_err_probe(dev, ret, "failed to register DWC3 Core\n");
@@ -829,6 +864,14 @@ static void dwc3_qcom_complete(struct device *dev)
 static int dwc3_qcom_prepare(struct device *dev)
 {
 	struct dwc3 *dwc = dev_get_drvdata(dev);
+	struct dwc3_qcom *qcom = to_dwc3_qcom(dwc);
+
+	/*
+	 * Resume must always run to reset the controller, so don't let the
+	 * PM core skip it for a runtime-suspended device (direct_complete).
+	 */
+	if (qcom->power_lost_in_suspend)
+		return 0;
 
 	return dwc3_pm_prepare(dwc);
 }
@@ -873,6 +916,10 @@ static const struct dev_pm_ops dwc3_qcom_dev_pm_ops = {
 };
 
 static const struct of_device_id dwc3_qcom_of_match[] = {
+	{
+		.compatible	= "qcom,sa8255p-dwc3",
+		.data		= &sa8255p_dwc3_qcom_priv_data,
+	},
 	{ .compatible = "qcom,snps-dwc3" },
 	{ }
 };
-- 
2.34.1

