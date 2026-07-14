Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19CF5448397
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 12:24:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784031874; cv=none; b=ilGelJLAWpVimz+OtslRQXPh3UmX7eqON3+gSFIdOuej5JXQ4AYq0ISQtXQyldOXmbcBQEC2zLGvQl4lkmUT1rNvHANYTnjdyeLiQNmcu8bbnwgbm2YCKkUJXg6IB0nBy64cfpkGnIc6dLLcPh9g46FkmycZYDitUTLCTr7togs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784031874; c=relaxed/simple;
	bh=Sn39nASDOcdWm18LnDCxP8IPtZOVGBBqWB9HUJARVzQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iUOqTZkXcITBjqunEvBwixQQqDL7WRIhCg8p9YmV2VgxoBiyUnKrv4zlXmzgDnLwAxZIHAVRYO7/5YWHLgKDg2GAVbRGiJW/bYjje8MMEnu+7dj/FoMnuDh2uZzYw0CKXBvwvcV5Rgvw1JB6kXQlhS/MeAzHaKE7BJPw7mQ651E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nozmJ6Ev; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=R2QuIG6v; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nozmJ6Ev";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="R2QuIG6v"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66EBO8P5448133
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 12:24:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8+NO4UWz4w4jtTkeYxujP9Ux7n5NsoAtX1Qkh4gu9Lk=; b=nozmJ6Ev5vj77I6j
	av1Oq0ujJbt0K1rYntjh+tJEeth0fYEpiBmuMU1oVmAhy7vUWc2+OKD42ejSa9ZV
	KjlHaNjIUidYTw4P9JWxVvf2TQ+u6zlbO9XJkf4FYZd5gwayViEz4NZgnPXn1c7i
	A3Wvbdvp86bQuynnfkXZAewsBL7MA4Rt/Wvg/yciIN7no6lt+ZDumt35+fMu/Zxl
	LJZSVCyOEKc2qoIfyOgjzk/kXeGr02wz9cMlimdqlkCRNKkq3Clbf9QWmfqktma1
	XHiU2A+/NOC5u7RZG07ZX5QEuqiEYaH9TDmRi5W4Ko5mn6zhdarScwEvsbmjIp/a
	w1liXg==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fd44jup4k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 12:24:18 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8efe7db1c42so72586706d6.3
        for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 05:24:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784031858; x=1784636658; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8+NO4UWz4w4jtTkeYxujP9Ux7n5NsoAtX1Qkh4gu9Lk=;
        b=R2QuIG6vtjkxd/2uKmBXWsTtPdboVntAySgcjKqzxaoUZADt0SJ4L6LB6nAXubaDks
         UAp/H6gHOC08tVPAN81Bj5n+F95Qz3uAPNZOzrZ26R+PVZ1i1VpTYxXETIV99yZU7CFi
         4OeQzAgiztkwDPLQfuF1Z/g21xLjIt8BYETw/k56yEVNA5446m5SYAmh+YbOL9cr5DUn
         dmbXdWuLS49cLAXcFAsgOjiBC8NL49FvzOoz5aQsdlLpup3OIclAbZ6ewK8kW9vd6szT
         BbxEMGJCi8Yd3jBgcuZTwagqUotXwmVe7VAKJ45ulNsJ/pmdc8CagXR1N73liWJJKPTY
         YhtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784031858; x=1784636658;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8+NO4UWz4w4jtTkeYxujP9Ux7n5NsoAtX1Qkh4gu9Lk=;
        b=DR04hOWM/HD3nS0gWKUHOXh6N4THOmOnXh7Llvlc/B9+CATH4KfDlkRrDuhO0nIOHD
         B/NjOxKBe7kj5URrdTsFjg60alzQFh+zmV9wPs9qIZb0YfYFs8GvIjYmrOfWK8ERa0Vy
         GZsvsor+wyx2Bz7AuJRiHW0zVmBGssxFb6MeF11iq9UC5LPSe+u4hidzCE6+klxVP8ub
         jA1JrLdvsIi5DU770C+w7cLK79qvSoUIX5Q2FKcJy8HoyAiQ9AgKC4BTTd9GZ09KknOI
         i+lofh3wDeHkk0YNCI1v7cJvexmRux/t+KMINxyIB/qkEX7m3LX3+G9WIcMU0MdCMkdD
         KXzQ==
X-Forwarded-Encrypted: i=1; AHgh+Ro+kIij19MofvzThQdPLvQOx87TrTQX+GqWNs+7rkuHIGM4MWnkVLiKmUhvimzUIS+jP6YwXthpm/jG@vger.kernel.org
X-Gm-Message-State: AOJu0Yzm8b7/ojoRHGGLzJ/zDFcII9Ts8+1Zxjd0uioCKzJ8qr1Nkyos
	U7eHg0tX5siYYFneuG0+bZCOE9uFFyIEYZj8GiTFfe/v/9jswmNhmIvsWmU6f2mBR7dcOkFiEbT
	8lsQpMNXfX3zff1z1aP/FD5W13MZ9l27b9Lb/O+iM7QEZJJtOd2kuO+mpBiFh5FE0
X-Gm-Gg: AfdE7cmJEfHk4/7KJZa6vEuv8L200Tk6W4IEb1/1gXjMcjs+o58IeXfL9ru1D9bDZBa
	Eq71TygdJ/T9jQ/nnhwEXdVU2D+SqWhPJ7ooJjjRBq3bPWARKL+H5AyohOxCInyPIELblV+IP0Y
	7/y3hzB+YR7kgMkFVGPE575lZGvx4Hy+Fti08dfmryXiqgNBlqcetR4UtqkZHj1j1NLpW4MuCHy
	EU/wopU9up1W2Kkg1uOIZIPFN9NyTHVtKzxzsfOG/R5YQgoVL6DWINwSFzzW1Z4xmJiizcjK3h8
	D3wXibklW5gN99MlBlfcc/D4ahlenP859W4aCMhnK7GSFxCazdgYpVcy0tJ13DI7BIlv4xmVWMt
	Tsx3eNYpHtsbX31U=
X-Received: by 2002:a05:622a:22a4:b0:51c:241f:a6ef with SMTP id d75a77b69052e-51e3c33bda6mr32276461cf.70.1784031857465;
        Tue, 14 Jul 2026 05:24:17 -0700 (PDT)
X-Received: by 2002:a05:622a:22a4:b0:51c:241f:a6ef with SMTP id d75a77b69052e-51e3c33bda6mr32276041cf.70.1784031856856;
        Tue, 14 Jul 2026 05:24:16 -0700 (PDT)
Received: from hackbox.lan ([5.12.73.156])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4950a2f951asm77031845e9.14.2026.07.14.05.24.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 05:24:15 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Tue, 14 Jul 2026 15:24:02 +0300
Subject: [PATCH 2/2] remoteproc: qcom: pas: Add Eliza CDSP support
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260714-remoteproc-eliza-cdsp-v1-2-32eb7a1f2c59@oss.qualcomm.com>
References: <20260714-remoteproc-eliza-cdsp-v1-0-32eb7a1f2c59@oss.qualcomm.com>
In-Reply-To: <20260714-remoteproc-eliza-cdsp-v1-0-32eb7a1f2c59@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-bc6c4
X-Developer-Signature: v=1; a=openpgp-sha256; l=1733;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=Sn39nASDOcdWm18LnDCxP8IPtZOVGBBqWB9HUJARVzQ=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqVipoYq1P6o3aQNAnpMdgHCQ7V+8ecxfIkoeDA
 /7Pk1M5hHSJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCalYqaAAKCRAbX0TJAJUV
 Vvm+EACGcF0d44c+WyqiJLE7Zw3TAj/WFCxjg04TRKwznwyLomnBhcq+2Q41KBGzs+afiH+Cf2y
 MFroc0GFNvYFA+ojzawX556jI7TSBlQVKasb9CgsxsQ8jj5sh5vcX7G18zzUWW/UjP5CytS2qtH
 rcShZpJhHqQbCHaJSgcafsG8JfpBkVnK2FdiSu+anyQez9xo4J7AFkPyFxrtOnTeGLfF03mZziR
 pXGJ/0inkPlZb1eQixJ0qmflir1P74k61NupGtAkHF+AVbJlwmtSQFjvpNLBF7lFfZXRYUo7rsu
 9LvDCHT7z/5o49Ns33F8QuUM60sh5UvJ7hWgsPuYyJ2QOGMTo+ABUcbjowY54bC6eyZAlOxUFJB
 cNnvzQl7O7s/dvV7XmMipyMlINgT/9h78O1pnTH4Ex5WQVPtKg7IoRgMZU3QrhgM8XeoyUVX10f
 Y/G1PA8vN4N5sjJ2s0bvm1HfArY9rRN4XZe4oBVixiuj4BmpESuSss7iXWnRgYC+vV0X4guulQj
 llvqm5JgA2ToSjAFOmiLaC2fxdLsw8tdcXYKlKrMhm+yimsfAtLnYR6iUfl8rKU3kh1kwtEyK+c
 6/BrxmHHAw5Ze+XeJSIDYX605rKbpgfWnNEIxFLkNJ4gYbfd/uEAoaejHGUAL+elVN0ju++uztV
 WnwK7i6Mz5jiOWQ==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-GUID: Erg-HghcSPAOKHcYbmV95dqLHlN-5gbo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE0MDEyOSBTYWx0ZWRfX0kcAOaMkYZoe
 84RcFcHTXdQ7CP2ZqHlNdKdsTc6IgeLITT/K8w1Em6292h/2FqW4MThL4HTOQmZ0OICPXKitftC
 lZQOUw3sgqcGLGbeQO8aebrWbXRT93fKLpPxIx1DrmQValLzYKUwSRAwoPhPUnr8zS/3IX628cv
 eCJaCgMGwHo5ewFT/h8LFUSbHJtoYM+h928MrLh/+c8ubURfHoZDjhHo0lDnIYRoeopjaXEtM+G
 nnKNhgdFuJSu4pSmyX/p34IWXdpEx4DAXiYXDw6eY2dH3XFPw1SNS0Et2tv8FNBhTR9EjEviM3s
 vcXC1Sfu9A1x84WNzBQtiPsAOa4+Gxe3YIqKUU0/z1A9hpIYOS8IYNS1azINr99W1lHHUbY/ku7
 j6q+WseBOwJSh4HpVapPoyWG4fZ1FrftSpc90+oOa0VxcgPOhxh3b72BVUy4IL4OwWOeVTA20FX
 69XepYq8icEbx7yYJQA==
X-Authority-Analysis: v=2.4 cv=XonK/1F9 c=1 sm=1 tr=0 ts=6a562a72 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=qUYP/O48JsHWwiZSxXr1NQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=yW1A7ns81NOMPIjzjlIA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-ORIG-GUID: Erg-HghcSPAOKHcYbmV95dqLHlN-5gbo
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE0MDEyOSBTYWx0ZWRfX6YNmfbYIByBM
 Pq6yeRB9/1Pre9Z4aNBUI1yXMfIZvR0fX6osf6cSMyu67F+so2PsQEvIA10r12yk8fGMG+/yLez
 m8GHJn3bFN/Aj66ruJ8IakTsjs2vEh4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-14_03,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 impostorscore=0 malwarescore=0 priorityscore=1501
 adultscore=0 phishscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607140129

Add dedicated driver data for the Eliza CDSP remote processor. It looks
almost the same as for Milos, except Eliza needs region assign.
Tie the new driver data to the Eliza specific compatible.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/remoteproc/qcom_q6v5_pas.c | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
index 25599d728208..c8313c61da94 100644
--- a/drivers/remoteproc/qcom_q6v5_pas.c
+++ b/drivers/remoteproc/qcom_q6v5_pas.c
@@ -1687,8 +1687,34 @@ static const struct qcom_pas_data glymur_soccp_resource = {
 	.needs_tzmem = true,
 };
 
+static const struct qcom_pas_data eliza_cdsp_resource = {
+	.crash_reason_smem = 601,
+	.firmware_name = "cdsp.mbn",
+	.dtb_firmware_name = "cdsp_dtb.mbn",
+	.pas_id = 18,
+	.dtb_pas_id = 0x25,
+	.minidump_id = 7,
+	.auto_boot = true,
+	.proxy_pd_names = (char*[]){
+		"cx",
+		"mx",
+		"nsp",
+		NULL
+	},
+	.load_state = "cdsp",
+	.ssr_name = "cdsp",
+	.sysmon_name = "cdsp",
+	.ssctl_id = 0x17,
+	.smem_host_id = 5,
+	.region_assign_idx = 2,
+	.region_assign_count = 1,
+	.region_assign_shared = true,
+	.region_assign_vmid = QCOM_SCM_VMID_CDSP,
+};
+
 static const struct of_device_id qcom_pas_of_match[] = {
 	{ .compatible = "qcom,eliza-adsp-pas", .data = &sm8550_adsp_resource },
+	{ .compatible = "qcom,eliza-cdsp-pas", .data = &eliza_cdsp_resource },
 	{ .compatible = "qcom,glymur-soccp-pas", .data = &glymur_soccp_resource },
 	{ .compatible = "qcom,kaanapali-soccp-pas", .data = &kaanapali_soccp_resource },
 	{ .compatible = "qcom,milos-adsp-pas", .data = &sm8550_adsp_resource },

-- 
2.54.0

