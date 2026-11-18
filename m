Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795007328;
	b=MAucxkXEC8g4RoA3sGB0uirVwHR5ywze5Wd3n7Yz2bZUM0QeVCRaqru1Rq9QGBMQwJ+5
	 Iqp5pH5KrR9EHp2eKQsUCEHLVUPYFgyNfFtmVftnSZIX/xMSZsM8zNM5GmS54+T/CGPCc
	 byUL1n2AYjOTCb1U2nhLGlw689F8JFQ2ELRnv0yMmkzDfyWGcktOj+IWjmQW/3KR8maj4
	 9OGYLMJjwrTjEy4mqfR2ZnmdpvJpKCP94ntSrcRE4V7D5Kg2BsfWxJAeDrKueRvVnqFEs
	 nCdH8b59N1kCU7InVjFRaQ3gfjW7NvaxMc2m+VIzv3GQ2blJQyzSlU/ziGnb5+xy0zQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795007328;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=OYcelcE9NXTnlvzeVzCO4FDv0oUoY1w29M+7qaD5s70=;
	b=K2lwSbyW0ICW0bjm8PySb3ch0+ndmUIVMhnFJLTJ+yiKc3NWrc1Jibbp7uyMUhIWqO3T
	 ypT9v8WajW/CPzfOWr2wlvIQ8Jf2/6m2txXYVlhnZVJr7O737jffEsGcCw424cSI1nIzU
	 ZlVsya9YGi7pvVISJvt54VbSwO93yF8fd4GSAc9z79jjqs1XrzaOUxTwyJC1gogxKaPOC
	 D7tI/bq9yjxL2OnSRPyNgzua7VlwFEsv6Bg4AnWlfxZ9KWWHWwmHLzGzw0QPu5fTZDQgA
	 eOkoHmJADS0mLyvvUokQkbh7HrTSDW8y+b5H4MNEhuOVmS/50pdYAkIdbc1htCPEwLA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YWFXi1wx;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DpADukUa;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9510F606A330
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 13:08:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9510F606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YWFXi1wx;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DpADukUa
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AICLWuq3420713
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 13:08:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OYcelcE9NXTnlvzeVzCO4FDv0oUoY1w29M+7qaD5s70=; b=YWFXi1wxS+vbqpTj
	KG9gOoTj9JIX4wK6B8Chm0WCtMeN1Bx5vyYI/Y8ODwe20CeRlROPJwi2W0OB9tl/
	icm3c4DIs+9oiThj3z0z+t9HsDKCpiPVmgF3PO5Yw95NI0G2lOEKPsKCfmAvxj37
	/49nmHKI3VSSf2wQM81dCt9Vx727JxOF8o1AV8i0vnZ4hLqRrUX0exwSPqulHxyl
	NeNkVNyvQlPFd7h9sHdVuszDhjvVZkK3wt2fO1HLstUdjt5DXKHMfZ2/PNj9RRbH
	Z4LRQCG2fsuEsTM0cec6JJQYOspPR0MAD2oOabqi7UcMoGMOrmJf8gOoFouQ5cuL
	NcK+cw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yv8u298-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 13:08:46 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3b3c3a75d9bso164674a91.2
        for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 05:08:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795007325; x=1795612125; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OYcelcE9NXTnlvzeVzCO4FDv0oUoY1w29M+7qaD5s70=;
        b=DpADukUa4DrTkztt6cdfUU7YbktCwYmEChxaJ3fgTH1YExi6lTWLsS/NrbV+BQEoW9
         5fI5vXsmOg3LgUvruo4FhrShFq7mfCDkN8X/vzRVGW7uERg5imiCzIuxxvpdT5tpkjZV
         jzecmGh8L4FtwvEhBOWPfRYTU3oWea/Fd8fJ9Pp4U96t/Pc6BWC1OMCIjY2A6c/QbIXQ
         r1XQtZEd3WaLhXGaGUWibbzde5wTfToeDuhpiv8PpUSWf9q833B+6QbINC3kIGW9/Atq
         bOdqHAi0hglGdIXG8Kj8rTFgo19umvVgVAcejDfHGvuqQTKhW0WV0R2ncQKQ3d2czM6E
         DFrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795007325; x=1795612125;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OYcelcE9NXTnlvzeVzCO4FDv0oUoY1w29M+7qaD5s70=;
        b=bO75dmmXUlqsnN4JcwAS2AI2ZEKYuxnt0JYdIiE6XpHI2jMW7+gDBaY4DCrHaWDjtC
         d77GU2d8iAM6TXQsZ7i6whzmkDzcaVok27bygsnS+F03CX9iSIgMrlt47nrqlFlKK+7Q
         phdg3QE9r+ClyT769BV6oYzvQnTjFlkT1TaMrVBud2rDEPBQ9sOAYLWEv0oBZ0njpOvE
         v4vHm72yhvgrzV3YNwVQHK+vjtn5ySnWRri/ZHqsgdiYsIe3rSvkhI9+XWGGLZDryuX6
         ZLxCaHAB3xpYez/XuT31h8tfXnMxYY1duOoxzJkAC9yDAZA8BwPbFcuUG143vqo1Faxv
         1evQ==
X-Forwarded-Encrypted: i=1; AL+hErECMOuusTrb1Dk9jUmPya0gJeHyr5G6V5LFbUvnQLIPcfIYMZp1DVz1Z6eJlS5UkjpH+fg5j3fMbboQ@vger.kernel.org
X-Gm-Message-State: APuU4Z87TEkJEFRXuY/a/kxqg/K1BIWHk7m6ANEdPCNM4ZwuGz3cccx6
	IEAp5ubhx2EmGDhsEY6YmWNaPd0KSJ92mmhys9b1jqNvibPUWGpC4jKgIMpFFPZUYv9S3pQ1KNM
	PMTwZ+2lHy8yDCB56WINyxc+yhHrbSuru8OIpStwRPYnO9WvkRoBiTY5Mu+1cI+P7
X-Gm-Gg: AZFdTZeDRBpGHsZn7Oss3JSjwHiux4gcZEZEhe3J/u1QGeCTItM11UO5xvWBaTs8DT1
	Uub9ZxmVMDyFq6nzoG325od3i1qacVAwB0kUyxntgFJeetTEjen0fjdErwVGfVvqi1t8lW4Spo/
	QKom9GQhdz9WlSGssaHZ5WN4v0uhxuhk0jNLPzPCqI6EFcXepXZ/YSLL5zk/+PzKNcNpJJ8yYCK
	txcOmRvBD8GBrtIEpLJTuiODbEsa3kqeQQ989Rhh2yHO+3y2YzwX3qc3lKW6JLzKpYYsTeztlNv
	NeiZ5klxLraPJGbtT6G6qyG6E3P6nD3R62FQqkNb6I2h2NPhxrhvRi70b7tH3R7/DZLrTs5Xeal
	JtQJPJYRX8Bx8QCB2vHYYHLnCc5gynqCtNdlZLx3EQRN8qoPATfpqRf/31rd4SZoQoh+EtFxmOW
	FFg6+ZGvsd
X-Received: by 2002:a17:90b:3b86:b0:3ac:9e5e:d1a5 with SMTP id 98e67ed59e1d1-3b3d083c92bmr4657123a91.6.1795007324966;
        Wed, 18 Nov 2026 05:08:44 -0800 (PST)
X-Received: by 2002:a17:90b:3b86:b0:3ac:9e5e:d1a5 with SMTP id 98e67ed59e1d1-3b3d083c92bmr4657045a91.6.1795007324474;
        Wed, 18 Nov 2026 05:08:44 -0800 (PST)
Received: from hu-pvgtejas-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3d187dc82sm4909533a91.6.2026.11.18.05.08.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 05:08:44 -0800 (PST)
From: Puranam V G Tejaswi <puranam.tejaswi@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 18:38:25 +0530
Subject: [PATCH 1/6] firmware: qcom: scm: Add
 qcom_scm_gpu_init_regs_is_available()
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261118-adreno-scm-fallback-v1-1-e99cdbf3121d@oss.qualcomm.com>
References: <20261118-adreno-scm-fallback-v1-0-e99cdbf3121d@oss.qualcomm.com>
In-Reply-To: <20261118-adreno-scm-fallback-v1-0-e99cdbf3121d@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Puranam V G Tejaswi <puranam.tejaswi@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795007310; l=1903;
 i=puranam.tejaswi@oss.qualcomm.com; s=20261118; h=from:subject:message-id;
 bh=36QhktHN5brrd6bKAbxnZZKZPlIcq3IKQTUY8RNm4rU=;
 b=7c5odhDiF+aoEvaDFipB/OOXd8NZHegIz5aqnIfRId0PVLLarNwAzokb8yFvCnQjvp87oPV1k
 Agje8s2ugqJDiHzhpPrg8mTtb9APVmDukh35XCZCczigmxZQAl7ylq1
X-Developer-Key: i=puranam.tejaswi@oss.qualcomm.com; a=ed25519;
 pk=I7kFxZ7dcroo7ZWUatk8fR/J/KVbRzZq4ZBLhRRGpJo=
X-Proofpoint-ORIG-GUID: liRU0lUYZPrFDwNT150MCxvA6I0S8SX6
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDA1MiBTYWx0ZWRfXyGxvbM/wWjIf
 OeGM6JnckFNHWfqNqkNL/Oz2pqMC4USwyv3Qu8d2Zs4/t4zfA3u25qcJkZNRdKpyRjZXqf6Qr35
 27sExk71rR6HfO4QP0IjTnDYzhOZuEc=
X-Proofpoint-GUID: liRU0lUYZPrFDwNT150MCxvA6I0S8SX6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDA1MiBTYWx0ZWRfX+91qMBraysVa
 uLsZKINp+JbvLqq7hRIwUKhLMJQHLzyjvLcvxcHgJc+WWoyxvAWtgFf9LW2nMLE/Ufa05hryXaW
 zDSifWmbqrsc11OaCsPrg2/LMaXmZcfH2Eg5s9lh9INavT//qHeoN5Xr9WX8MjqzVa3506S1mOJ
 T/6hIUBRXENpE2aVTGQ0Ofl1x7lKpywJxKoOB+aYYxwkjG0Wt5fhUrLbMfeC8ObGNoENQJ5fmW8
 RJE4hrn9Mk1F/XLSOZ55IXLPmJlXogoPTdmz/WRM8uXctcstY+aeVA5ENUeDuoJCteiD2673aWI
 P54Uur3bA6AP3WAEKjHy62iQUN8TF3UgBohhaEeDiYVnuMHohTvRGTiZJk8DxpZpeysc6OTBWrW
 Ia4cn9FyvhOi5pLVYh9RnTMXryDXcf5EByxNcnUK3J5Rc3iIdKzllp5tHROs1xQ8plXSYOBymnE
 kEvWMe0PsyE9Ofph4QQ==
X-Authority-Analysis: v=2.4 cv=NNVAaE6g c=1 sm=1 tr=0 ts=6afda35e cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=dBqpytzp2iRCIsmGKUYA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_03,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 malwarescore=0 phishscore=0 adultscore=0
 suspectscore=0 clxscore=1011 impostorscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180052

The Adreno driver asks the secure world to initialize some GPU registers
through qcom_scm_gpu_init_regs(), and fails to power up the GPU if this
call fails.

Not every secure world implements this call. When it is missing, the
call fails in the same way as a real error, so the driver cannot tell
the two cases apart.

Add qcom_scm_gpu_init_regs_is_available(), similar to
qcom_scm_set_gpu_smmu_aperture_is_available(), so that the driver can
check whether the secure world supports the call before making it.

Signed-off-by: Puranam V G Tejaswi <puranam.tejaswi@oss.qualcomm.com>
---
 drivers/firmware/qcom/qcom_scm.c       | 7 +++++++
 include/linux/firmware/qcom/qcom_scm.h | 1 +
 2 files changed, 8 insertions(+)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index 030e4ba90812..f4f34b7dd0b2 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -1941,6 +1941,13 @@ int qcom_scm_lmh_dcvsh(u32 payload_fn, u32 payload_reg, u32 payload_val,
 }
 EXPORT_SYMBOL_GPL(qcom_scm_lmh_dcvsh);
 
+bool qcom_scm_gpu_init_regs_is_available(void)
+{
+	return __qcom_scm_is_call_available(__scm->dev, QCOM_SCM_SVC_GPU,
+					    QCOM_SCM_SVC_GPU_INIT_REGS);
+}
+EXPORT_SYMBOL_GPL(qcom_scm_gpu_init_regs_is_available);
+
 int qcom_scm_gpu_init_regs(u32 gpu_req)
 {
 	struct qcom_scm_desc desc = {
diff --git a/include/linux/firmware/qcom/qcom_scm.h b/include/linux/firmware/qcom/qcom_scm.h
index a0a6bc0229c4..c9e88b2904e3 100644
--- a/include/linux/firmware/qcom/qcom_scm.h
+++ b/include/linux/firmware/qcom/qcom_scm.h
@@ -131,6 +131,7 @@ bool qcom_scm_lmh_dcvsh_available(void);
  */
 #define QCOM_SCM_GPU_TSENSE_EN_REQ BIT(3)
 
+bool qcom_scm_gpu_init_regs_is_available(void);
 int qcom_scm_gpu_init_regs(u32 gpu_req);
 
 int qcom_scm_shm_bridge_create(u64 pfn_and_ns_perm_flags,

-- 
2.34.1

