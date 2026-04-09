Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9687838550C
	for <devicetree@vger.kernel.org>; Thu,  9 Apr 2026 08:52:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775724762; cv=none; b=WiK3F7ji/UmAWgXk00+usxzN9iXcqG1+PXoEO+5GqBlVK1vZ4RkzesMj8ppSTkCINedwrKygHyd3Bi03bb3ejIHQI+N8dqKeQjCKVBoCtC2VvA0Cl8fFXAwEF3X+xPVeGnw8YPKAu0a9mtyaPJ97HHBy8NgHDqQ8lAieW5W3UIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775724762; c=relaxed/simple;
	bh=X8apncHELkQiQFOopfO/eJAliJCDt9IbYR6LW9EKidE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=h8h3rW9ul2FN9PWoKnsYyFfTZFfecOGIIiz5ufX8usyv268WbBlMe55xq7Tv52J87mFLaYx976win345FueWFvT4RhXfWIbA0zM8CJX4UlAYSm1qGsN4S5IJ32d40qpy2JdhNr/48FmcEBZQONu+uYauErIibfQ7UrpWA0r1EKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=k++b5xHh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PTZNyK4N; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="k++b5xHh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PTZNyK4N"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6392h2ed3326005
	for <devicetree@vger.kernel.org>; Thu, 9 Apr 2026 08:52:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ic5IEtyYAYRznxrQ2uPKemOuJzm0Ampz76bnyiqpntU=; b=k++b5xHhfIpIOtX6
	A/hnnYE0ZAvo6ZFKA7JuK565pF24f4GA2mihpp9ohLeQuGXT06phwPxwSCnCPr1u
	rLa7KZW73yHtpdQ5noZocDz5Y56DbWmiL6hsN9kDshqHGlbAt+Uxble84FOxLZ0a
	z8jtQGJ9W1zB40/ikihWAj9cECfQtXJ9B/HVhM/8bZ6Eiohh33lv6M62hS/jXAFI
	WzkmgUasgMXRzA269Kyv6RZHVJmWmsNuITLzesCsCUN0ce7DIK75JAK7ATzdW3TZ
	8bJV5wgda/L47CwHORTRFkZhNHb8VZfcyf0E22dYSD+YxfnAOrY4cTMAoeMu0eWP
	8km8bw==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ddw9mtcd3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 09 Apr 2026 08:52:39 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-2d054421d19so1821155eec.1
        for <devicetree@vger.kernel.org>; Thu, 09 Apr 2026 01:52:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775724759; x=1776329559; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ic5IEtyYAYRznxrQ2uPKemOuJzm0Ampz76bnyiqpntU=;
        b=PTZNyK4NRd6/YsPKj+azlADk7SE8TghCMY8qWobtudA5fIp1+2FcrRBxBYrp8asY1Y
         6zoB5YD1jR4NLzWwHaPAiycU4NuivT7uRWNkPigSVqA/MILFt7Fh3h6Qmw+MNcxvI20e
         Qnb3xYRxMxDyvZk1ksFx0Upzofou4b6vynkTLIHBfx8R0B22KyIxUoalGVICUOr/ZSMg
         v4aaRxKwdoGtLW3Vb06Pz8qk+8LV6UovdAkas7/mwtDgle2Bf0ruN/TnrG7bV+Zv9QZs
         eaPAps6arBWlwfSooW383PxZZz30lIXiFRvZbUxHTUnJN/a0/tZl6pubQbPAQ5emkDOI
         kDtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775724759; x=1776329559;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ic5IEtyYAYRznxrQ2uPKemOuJzm0Ampz76bnyiqpntU=;
        b=aVJAm5JOo3AVDsuBNUd4L5PjhhhVSEPkHQKJn05NFOL11q5G2HOFA8wUhjjNE05yPv
         eukU08regXlzlm7PsLkZs6FJDLBQBQc8HfAauHR8F/N/LW1Vnw86Pfk8C1HRmSmkRE5N
         fGFu/k3rOIimKeARH9EmIAcwAceh2ABVA2vjqYl2ZZiFZgXIERInFkezK3RjSo9Ah0u1
         eLjeR3jFf711GV7v+JVX0LHDf6gNUB7IEqm5Z6Y0VWZ/nNaj/ck+mMBo+0zc7Q76Qcld
         JKaoCRi/sbAvuH3e1kDG643QUNbGKXDSmf/vPp0CpHaxEgJefhxm5Tr40o0adgo+xnEx
         oKxg==
X-Forwarded-Encrypted: i=1; AJvYcCURBkrdXFgh0g3b8XZheuFdH5/7bx1F7No5/ce0X1rZeb4MUROYigStgS0W0RykVgTMzuIRlCGlxaNF@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2ul1aNW8Rp858+iKlzaRxFwWDR0Q0MQ1ZA2bNxWxMNCT2vr4O
	2oTWybpkhYg2/YqwM+ajm4LzGCtunJIftcfgYEtgPYB0RCwnUMleILEc11tCQJuuYt8hOvrdGAE
	xQHVnMrovOIdurBddYLEMQYpW16zIAoH5hXZ/rYjE9rhREg40N+OSAe/o2Gg551Lu
X-Gm-Gg: AeBDietuSXhHkDOAT7d+762XeuNVtxdeyNpiCzBaojDpvst7ZQo6ecJf0nQNYFwunlg
	y4VYITj7dx8WzkrvMc7EaGQBlG0JLwAzR7s6FIxuqvi0DMTtvN6zN1KIVHPTppNC17zScDF70LI
	JGIPL7W85PH1OPOH/Os2fMlA7t8yLHdT5SgRaW6/Uaf3HYxdxmAc1LwjMsYJe3KF8rdEzalcn1y
	RvH2uG/xzEBTvsjRZKAWQ/AN8gMqyI49GlOhgAPdRdijKObglpjGFUmBDuadQpzSkyBt6LiA4L0
	Cfyhh70a6LGt5kPEYDOLA1+sdsJQ5lYgPovFiZvc23beZJmd1kCKd1wNw48DMQE7PgG4VGLm9kG
	bEDffZ1QUjSCfHxxFOaZ1jwsD0bLNtWZuiaBrr5yiamD2f4XSKgqymr+JhDLDln9SA8fxWnmp
X-Received: by 2002:a05:7300:dc8b:b0:2c6:31f0:a018 with SMTP id 5a478bee46e88-2cbfb98f39amr12705005eec.22.1775724759345;
        Thu, 09 Apr 2026 01:52:39 -0700 (PDT)
X-Received: by 2002:a05:7300:dc8b:b0:2c6:31f0:a018 with SMTP id 5a478bee46e88-2cbfb98f39amr12704978eec.22.1775724758815;
        Thu, 09 Apr 2026 01:52:38 -0700 (PDT)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2d460c8e9a5sm2312889eec.17.2026.04.09.01.52.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 01:52:38 -0700 (PDT)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Date: Thu, 09 Apr 2026 01:52:28 -0700
Subject: [PATCH v5 5/5] remoteproc: qcom_q6v5_pas: Add SoCCP node on
 Kaanapali
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260409-knp-soccp-v5-5-805a492124da@oss.qualcomm.com>
References: <20260409-knp-soccp-v5-0-805a492124da@oss.qualcomm.com>
In-Reply-To: <20260409-knp-soccp-v5-0-805a492124da@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-3d134
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775724750; l=1726;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=X8apncHELkQiQFOopfO/eJAliJCDt9IbYR6LW9EKidE=;
 b=BUkecBlsTbhEGuiBVfrl3qtTaWPHKGZSAMf5zyiNKsi0G/oTkgic3K61pr5FoLQtt47z2qpVN
 9XWklRMggQMDM+IHRBZ3CHLxH9+dm63lvHcsgQzhcUBca0GAK8w5xr2
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Authority-Analysis: v=2.4 cv=cfPiaHDM c=1 sm=1 tr=0 ts=69d768d8 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=-54vo4t_4OUFHp6kYXwA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-ORIG-GUID: 1h1gZFkx93WZ27S-GhtKD4lBGDUUxgW9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA5MDA3NyBTYWx0ZWRfXzJm8OS6WJdzm
 2BUr4Tb1OFkgDk1X0pvE8etjtlro1v/A38vrY0D8hBVflLSxhLI4dxA6frvhHduuEA0egU0FH4+
 S9qZrAGZdSH7eWh/gpdSHObHj60DnFAfl9/d92tCIXVrDujT77EoM34z2X70W7upZhWwt/K68Lg
 BnxmjC29iibp+/YHFPGymsXHD0+P57riPNgfXE9j291XqlAv8eFx9sksO3YUSQQix8yFiT2wVV3
 5F+QT222otmms9ojs9mGGADRp0/hHjiJT4ck/SDKberZjqsh+c4QknK6+IY1lFMMbX/1El3lksy
 3yexpGezq6Uqb204Uf69g6kr/oEwBB+QsZteu5qF0XTZvivwFOsJrFcr+WGaypJgFzYM0dL5Jb1
 n/KfCISNTIE94vjQpfWjLkLy72MjsZ5tfwfid61ENh3oVzHcUldy9ui8Jvv4vKCWycHbZwXnlvM
 fQ7Vpcyfd4q50aZESxQ==
X-Proofpoint-GUID: 1h1gZFkx93WZ27S-GhtKD4lBGDUUxgW9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-09_02,2026-04-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 clxscore=1015 lowpriorityscore=0
 malwarescore=0 spamscore=0 bulkscore=0 adultscore=0 impostorscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604090077

The SoC Control Processor (SoCCP) is small RISC-V MCU that controls
USB Type-C, battery charging and various other functions on Qualcomm SoCs.
It provides a solution for control-plane processing, reducing per-subsystem
microcontroller reinvention. Add support for SoCCP PAS loader on Kaanapali
platform.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
---
 drivers/remoteproc/qcom_q6v5_pas.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
index 34b54cf832d0..1c81f22438cc 100644
--- a/drivers/remoteproc/qcom_q6v5_pas.c
+++ b/drivers/remoteproc/qcom_q6v5_pas.c
@@ -1604,8 +1604,26 @@ static const struct qcom_pas_data sm8750_mpss_resource = {
 	.region_assign_vmid = QCOM_SCM_VMID_MSS_MSA,
 };
 
+static const struct qcom_pas_data kaanapali_soccp_resource = {
+	.crash_reason_smem = 656,
+	.firmware_name = "soccp.mbn",
+	.dtb_firmware_name = "soccp_dtb.mbn",
+	.pas_id = 51,
+	.dtb_pas_id = 0x41,
+	.proxy_pd_names = (char*[]){
+		"cx",
+		"mx",
+		NULL
+	},
+	.ssr_name = "soccp",
+	.sysmon_name = "soccp",
+	.auto_boot = true,
+	.early_boot = true,
+};
+
 static const struct of_device_id qcom_pas_of_match[] = {
 	{ .compatible = "qcom,eliza-adsp-pas", .data = &sm8550_adsp_resource },
+	{ .compatible = "qcom,kaanapali-soccp-pas", .data = &kaanapali_soccp_resource },
 	{ .compatible = "qcom,milos-adsp-pas", .data = &sm8550_adsp_resource },
 	{ .compatible = "qcom,milos-cdsp-pas", .data = &milos_cdsp_resource },
 	{ .compatible = "qcom,milos-mpss-pas", .data = &sm8450_mpss_resource },

-- 
2.34.1

