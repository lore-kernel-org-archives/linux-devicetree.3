Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 646AB3E5A15
	for <devicetree@vger.kernel.org>; Thu, 21 May 2026 13:21:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779369718; cv=none; b=DmtfTddb4G49Mo7srT9N/e5N7D04+JeGG1ZcQO7TA8fP3EQcIYN1oWX23MDwNdL7ePTr9K0A6i4s5FuM13Xgp+01a5PFQwlv7DesbLVpcX2u0An398YYLY3L3RHJ5izIKuMra/2trKHQbUQdRoDjd5uwK0C5RsJ9NbbThVVlFBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779369718; c=relaxed/simple;
	bh=W0/Uu+1m9zRO87h8CajyONTXKGYKrPV5nJKS09BkI34=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bGnTJkoR9YsLdCGhvEgxbLrw8Ob79/wZJ/jv6MBwL52fkQfFYmMRwZ/VIiSmS/J0ZlOY+QJWX+i9Tu7A2h38dIaRq97BXH9oR0gOoMWYa5ZWU5kRw5MzA3ikJSenaDGaiG/1+nBORsnb6lC1lupwxxZx+Ffa3CYz2/nWEHN4ldk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=c+7sooWh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aAJBXIse; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="c+7sooWh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aAJBXIse"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64L99t2g3343616
	for <devicetree@vger.kernel.org>; Thu, 21 May 2026 13:21:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aE9MYFmFwU88VeE8ZXPSijChgvgU9D9aRPiqoxDMKCo=; b=c+7sooWh8iDuhWS+
	Dc+Y3b8mb+/zKPVxGHr4GIhLBG8hmFmZ9nSY/k5rDUNZ4T48gJK3JjgWT8SpTVw5
	kEfQ9JiCVf/80anZk5Q61z6ufFSLdcHd8RuD59pQMggNfpbMfklORwmnOKSbseOh
	YUpTEDcfk2IhryFFWOJUCjAevczbd86DlFeFWF+gGdXkdzPkVHQ1HoBDDio2oaez
	CXotQ7/+6loRydeUOKywaOFDKpU1qKXsEu/W7ALoxIq/IRNjrZ47X8pyyEQErAXc
	e6Y+63Gm10Su9jrAQLlQ46TCprHFjV4H1NBpRn1lhxMGnTLb/mre28uo21FIY3uf
	BRtdnw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9wahsfk0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 21 May 2026 13:21:56 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-365e70c39d0so5802052a91.0
        for <devicetree@vger.kernel.org>; Thu, 21 May 2026 06:21:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779369715; x=1779974515; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aE9MYFmFwU88VeE8ZXPSijChgvgU9D9aRPiqoxDMKCo=;
        b=aAJBXIseFaxVY5lbTUjNGxanWINXegTbq4uGhmRMQCuelXyAR1iq7AjZS9DrC0HTsC
         JmlLd41p+kkVpM82j3hPfg8MmvRvIl/kUJCrzAOkWikDcl4Y6e6Az+3+7g/NNqt1fZnM
         vt3b1rQh9V4Eo5wJ8hUbauZiBI1XWflt6jSPeM0iGZr8ha4y5cbY+1q/TfbvsVmxYUmT
         gmvqpznr6M97T9W2TdW/o38OTR6kK3I6U6snJxeLDT5AY6CMll6Sdi3/IakY+SAYiYJG
         ln30MX52EtjeFGY20AlNe47ptY6+jGLMouJsLfw4fvTogswO0pWb6UxRQAyqdILnL7q1
         cD9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779369715; x=1779974515;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=aE9MYFmFwU88VeE8ZXPSijChgvgU9D9aRPiqoxDMKCo=;
        b=ifLW3rsztIO+Hiv+Tb0+EvYL78cIwDpibFJssBKB3cCkA+Za3A73PYeSmcYO3Sy89V
         aXc98qqneyqXuKlsLmGiAavGyK7IBi7k5bz0alw0HM/wy9iog565LGZGYc+w1dVaZZzo
         FO/RyDOUI62Eyhx0N3UU/8N3yoAO7qqAgwGwjM4CyfqqSmZ5Ax2oY28F5WksYGxACSQ2
         IfCacWaDOKnIzcpT4xkruz6wI2mZIlCkNVJQ/okr/DA8TnBlx+q+XNBYX5L+IJIXGJDM
         csIFaECFA2zx2LUzcbf30qc9fnQWAr7HpNfOUhzXcEOORz7lAeA10aCn5QosdwVlmFRe
         Z0CQ==
X-Forwarded-Encrypted: i=1; AFNElJ+zdX0Ssf7LBWFToZk1gzx5k177n9kxonk0pwjDh0c4cx4LWWCEzFuWLE7yhsBLqZt3x4NzOTca3N4P@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8RgmM5UTyMQG8gQElMg+glCCo8LUFtMX8aK7YsNkheEIFrUa0
	te9KZED2JmXRjmX++vRsiNdG8sFDYFfo851g+GyfKqb1adMhrJW2usH6tjtgj2xvLk5jdXz5L/J
	PUIe3m2k0+6JSa6gvHKKqIa+0jjvapVXpr9W60JuYBuI2+54mI8QA77n/t/nxII8r
X-Gm-Gg: Acq92OFOGEsQC4kpl09JILFyjr5dc5pC75zb/8sf/mfGE3nhdqPRyQDP2zF1KsWnQ91
	NwsaI/2OJT1mu8O9DjTAbFir5GoxaXlKHjR4sd49RNCI1HiW6moWtUrC2kKG6OtHkBMISupfUTL
	N2ySlkp/dTxbYEW498m5d6RsGSJ2KDwHjn1XWjnbhy0qWtjbPds1U/qfbVylWIeEi8sCI/A4Nzc
	9BKqxheZZStgbSFWzVlScEhlZNFq5sFSRaNdxWJhpKaRHI7vtNDZcoVFWPqvVj5WqlDoXrs4zH5
	pMrnrw9PEwp2nxBWGgHE77Lt0KFMbBZG64whegbU/na3eqoZfjhdVjI8o7Q4E9zDuKdztfybWk5
	jUSRzKdjxlSDp54RM428iNItcTTRe2j9jp4uG
X-Received: by 2002:a17:90b:3906:b0:36a:b34:17e5 with SMTP id 98e67ed59e1d1-36a456043a6mr2845105a91.14.1779369715048;
        Thu, 21 May 2026 06:21:55 -0700 (PDT)
X-Received: by 2002:a17:90b:3906:b0:36a:b34:17e5 with SMTP id 98e67ed59e1d1-36a456043a6mr2845062a91.14.1779369714477;
        Thu, 21 May 2026 06:21:54 -0700 (PDT)
Received: from [10.213.101.118] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36a3d1e9300sm2927797a91.13.2026.05.21.06.21.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 06:21:54 -0700 (PDT)
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Date: Thu, 21 May 2026 18:51:38 +0530
Subject: [PATCH v3 2/2] remoteproc: qcom: pas: Add Shikra remoteproc
 support
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260521-shikra-rproc-v3-2-2fca0bbe1ad7@oss.qualcomm.com>
References: <20260521-shikra-rproc-v3-0-2fca0bbe1ad7@oss.qualcomm.com>
In-Reply-To: <20260521-shikra-rproc-v3-0-2fca0bbe1ad7@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779369701; l=2673;
 i=komal.bajaj@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=XoVsbLspLJSC0rBw1se9tovMaT2+CG8RoLGQiO3wVm8=;
 b=e+t7G0ot79Y1UN0mhQwSYmV1AEbMAWPkK9QhdszHRHM1eoqCAOgUuX5h3wPAXbbHTjTMQSLbe
 lUW73ePB504AA0w7vqwv3uEJJmjEcyyDb/sMEdmPQ86vFZZxDqwA11C
X-Developer-Key: i=komal.bajaj@oss.qualcomm.com; a=ed25519;
 pk=wKh8mgDh+ePUZ4IIvpBhQOqf16/KvuQHvSvHK20LXNU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIxMDEzNCBTYWx0ZWRfXz/2RtGoxuURn
 5/xf4YPmV4X5dzSUmFGgPkaulWJXPqlk8ZzJApOIou8bFvA22XPjk3UAYt6UU/NNbX2Z+yjiGEH
 jKVQ1BN5kIteS0b1EEtyH9ADHX7+ZIaig5nYy3lZjAJGUH1KyfuXbv4ZEl69fXs105qlsSwAFj/
 PBf/RTPpVDmD2ASEepcEBJNkE17h1T33jObLzF+wEyd0H3tyPcetBpT/yP0p8v3NnAc6BAcCYMT
 5ieNQmsl5nGOhGPJKLgGkX6gFXlCta2za33p1pyHuDM/rprEMZ5n393ftzboOrAi6xEUCw4fdpV
 HnSwN1wTD/AEsz28HnITc421vR9DG2c9gf/HaakWKOQ9T/y3H2uUCoMCfCuQMgJkbXXV5Q145Di
 VSTbOL4M96wiy0No0LIFuhWZUyOnt/ilhTJmNSy3m6l6K2O5C8Q9LLvUfAFJ5QQLuXQu9Jvh2Zc
 jhkoQJXwvcanQ66TEnA==
X-Proofpoint-ORIG-GUID: Q3mnWake1Amxeej_xRXdTNddUava4f6n
X-Proofpoint-GUID: Q3mnWake1Amxeej_xRXdTNddUava4f6n
X-Authority-Analysis: v=2.4 cv=H8LrBeYi c=1 sm=1 tr=0 ts=6a0f06f4 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=SNgwcZzc0U0EFhAFe-AA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-21_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 adultscore=0 suspectscore=0
 lowpriorityscore=0 spamscore=0 impostorscore=0 malwarescore=0 bulkscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605210134

From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>

Add the CDSP, LPAICP and MPSS Peripheral Authentication Service support
for the Qualcomm Shikra SoC.

Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
---
 drivers/remoteproc/qcom_q6v5_pas.c | 48 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
index da27d1d3c9da..0101f1db6458 100644
--- a/drivers/remoteproc/qcom_q6v5_pas.c
+++ b/drivers/remoteproc/qcom_q6v5_pas.c
@@ -1457,6 +1457,51 @@ static const struct qcom_pas_data sc7280_wpss_resource = {
 	.ssctl_id = 0x19,
 };
 
+static const struct qcom_pas_data shikra_cdsp_resource = {
+	.crash_reason_smem = 601,
+	.firmware_name = "cdsp.mbn",
+	.pas_id = 18,
+	.minidump_id = 7,
+	.auto_boot = true,
+	.proxy_pd_names = (char *[]){
+		"cx",
+		NULL
+	},
+	.load_state = "cdsp",
+	.ssr_name = "cdsp",
+	.sysmon_name = "cdsp",
+	.ssctl_id = 0x17,
+	.smem_host_id = 5,
+};
+
+static const struct qcom_pas_data shikra_lpaicp_resource = {
+	.crash_reason_smem = 682,
+	.firmware_name = "lpaicp.mbn",
+	.dtb_firmware_name = "lpaicp_dtb.mbn",
+	.pas_id = 0x56,
+	.dtb_pas_id = 0x57,
+	.minidump_id = 0,
+	.auto_boot = true,
+	.ssr_name = "lpaicp",
+	.sysmon_name = "lpaicp",
+};
+
+static const struct qcom_pas_data shikra_mpss_resource = {
+	.crash_reason_smem = 421,
+	.firmware_name = "qdsp6sw.mbn",
+	.pas_id = 4,
+	.minidump_id = 3,
+	.auto_boot = false,
+	.proxy_pd_names = (char *[]){
+		"cx",
+		NULL
+	},
+	.load_state = "modem",
+	.ssr_name = "mpss",
+	.sysmon_name = "modem",
+	.ssctl_id = 0x12,
+};
+
 static const struct qcom_pas_data sm8650_cdsp_resource = {
 	.crash_reason_smem = 601,
 	.firmware_name = "cdsp.mdt",
@@ -1571,6 +1616,9 @@ static const struct of_device_id qcom_pas_of_match[] = {
 	{ .compatible = "qcom,sdm845-slpi-pas", .data = &sdm845_slpi_resource_init },
 	{ .compatible = "qcom,sdx55-mpss-pas", .data = &sdx55_mpss_resource },
 	{ .compatible = "qcom,sdx75-mpss-pas", .data = &sm8650_mpss_resource },
+	{ .compatible = "qcom,shikra-cdsp-pas", .data = &shikra_cdsp_resource },
+	{ .compatible = "qcom,shikra-lpaicp-pas", .data = &shikra_lpaicp_resource },
+	{ .compatible = "qcom,shikra-mpss-pas", .data = &shikra_mpss_resource },
 	{ .compatible = "qcom,sm6115-adsp-pas", .data = &adsp_resource_init },
 	{ .compatible = "qcom,sm6115-cdsp-pas", .data = &cdsp_resource_init },
 	{ .compatible = "qcom,sm6115-mpss-pas", .data = &sc8180x_mpss_resource },

-- 
2.34.1

