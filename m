Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28BC7377574
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 08:18:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781165920; cv=none; b=RBx9iAIwc2iSconogXMyoA0BDrMusHrQ2+ILn7OApK0ryV34wyi/FB+UDCbTgtU52JnHNRuVlgToC0rs+tBwHIEi3NdG24Z8aE3NDv0wonbnygSqiLIkq22nthYzEeyoPtIkse7QARqaWNFC4ORlhDszDlykMD5lvpTdTeLSWgk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781165920; c=relaxed/simple;
	bh=0UB/RaRy1ouqQkebbPEeOz036DGdJa1e2gX31mDIAA8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lexjirVbKT2pNPpOGoDuYGiMXDaMV8RaaTZPPg+AURHO5FPo+1kq9FBAkhIwt0Tea6ECKjubGzO3mumlMoN7KpGNjW2QbCNjB8X4wpWoPamsh2wFzmFXIGmviM20Vfs0EhmFhB7b6KA/1MIgAu3+pCgfn8Vjc46Nwkk3Zx1KPTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oeCin4d3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NqBwL+Cz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oeCin4d3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NqBwL+Cz"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65B5GA0F3815491
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 08:18:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=YXis3Rc0MeVYcA02FEComSseyNCa4fwzOgq
	9FNId1gw=; b=oeCin4d3RJTpFfK//LqhiIMeFeKaCrfvdtlTTIQq1IwUnvIdOUv
	+X7xKw6J49bF7ltUIcAOZTTbPu3NWQYm8ZUScTMIMxnmvWpvRHovWmn6sFrJlgGi
	B9zh/S5iEFUrhcZ1IhPhIcCdVW3Q0bgbwfUEarajKnZ5Yskd0Azy0UtIyTDbdIHY
	OVhNAvslbUh5LqZgqTxtFfPCn6OUj+hzhqbfVehMJJ2WdD3L7dCOF8ymkMLr2NlD
	pPTRDi4ewGLgx5jiH9ujFDlD828eaoB/kSp5lDijScAALIq5pLdpt8UVJ1ZiSQcY
	S0vJ+mNUxrL8GVdX79el7uCYa2FJy8Qekyg==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eqe6u2dg4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 08:18:38 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8423f1fe39eso8509936b3a.1
        for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 01:18:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781165918; x=1781770718; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YXis3Rc0MeVYcA02FEComSseyNCa4fwzOgq9FNId1gw=;
        b=NqBwL+CzWATlM2NUqin8WETAL37SDvB8+g2eykH1TbBbXMxCpIDrFkcplM8VC3DxMi
         ZzMeVBn6z2mI2WWIaselcP/E9vQvR3cIt/Ju0d8Y991B0COHPwem/SumwxDm+cAXG4Hr
         60HZjm/811q/8EPvkRCaJkbUKZYui5epoE2wQwm/jBBUzCh0HpwR6g0tzbKVPeTj7Swu
         uNs16xVMzBANqI2bG4488RagUfRPYAG+SHrqKwxebG9rB2BzbPtyJ9iFRuuoJHNRNorb
         Og+Jwh7msSpBkmlIQAJ8iaTAb20MPz3DPo1Bg/7jQ82+uU0GBddKEI/7EPXlNrddgVHU
         RJJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781165918; x=1781770718;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YXis3Rc0MeVYcA02FEComSseyNCa4fwzOgq9FNId1gw=;
        b=Lkw3NgtchURdam/LDyRU7iIcbInrq0kNVRFGEuZkw9gGPmLiicwR3RmxNQGrTN1IOG
         wfZHz2/+/C6lxi+DiqN59RKbI1Z7MWnNGsOr5HsQ9yGEYj31/AWhuG/i7FxHimAc3FHt
         fWNNLppKmcQvIMWL7/cDTCxOJ0ioEZ3GN9nf1Dnu8N9g5qhxLS0hfWVtzGZfD0hUCYNr
         bq7ZlLQF3V9lL+FWOIoC76SblK/iEr8zKBcdZNzcTny+aLDEbMSrK7gB1A03I502eaqm
         sRGVlEelK49coBxVC6sj1DgRNfZk/BdDVOcUzibF3dkxs/olPY8QhR1P7Zt3hIeZ+1dc
         thBA==
X-Forwarded-Encrypted: i=1; AFNElJ9WOZTe12S5DvCtJSjpjnh70FFSd4BLSUiNUymEjCoGO89KivTQvcOS61uTGPXySK84mKBLUd/FvdGa@vger.kernel.org
X-Gm-Message-State: AOJu0YycVdgrb1Sjt1QG1v3bVWCzy1iRCg08ZNT6VLzFM3FdPRBddHCU
	Ly9ynRgb9gWv6HkJceLwzvIkP9AfmE+FzBS6j2ixvNOQiGMQwuTVjQbsefIooBOj5iFVAGv1/d9
	oryczQsCBEE36n9fpSBrba+8HfN1JP5mNEqltv7vAeDFU/SK8rJcPleYuIuHvb01K
X-Gm-Gg: Acq92OE7+xpZlIWGoINHb9qJA3YaGt+L7XyYY03uZ+chBkRbGQ+2DaJOs87mf2/F+O1
	kSxm39DXayCagw4pA7g825n6icdYDQMf12oOnqQ0qw3eDsreE5AoIQLkQ5Z0AghMovRPN9Us7Tu
	L+Gq7fA5pAelTNUcJGNOdKvh8A+wpoHDerFgs4GNPybzKK3P1+zCpJqmBVn001UmZgD42dDgmTG
	+XrguB8Cm4/vNT00707te18aLQ1f1N2UnO1RMtwmmV+7w3qccu85yn+OUfKfB5swCasvHwa52oP
	toJxSv/YEspFPS+G1OU79O5sH2qDIMUzxKqggE2F7GRhE7nWkiAT6VeWL7C+zam/1zWMJaUdmcU
	0DpCM16E9rK6mpFfB0hYCmbCCUiSHy9x+1OT6pEmvlC1U4yo4zkYjsw+CKl4r
X-Received: by 2002:a05:6a00:1f18:b0:82f:280a:d888 with SMTP id d2e1a72fcca58-84336908cbemr2281713b3a.12.1781165917646;
        Thu, 11 Jun 2026 01:18:37 -0700 (PDT)
X-Received: by 2002:a05:6a00:1f18:b0:82f:280a:d888 with SMTP id d2e1a72fcca58-84336908cbemr2281659b3a.12.1781165917134;
        Thu, 11 Jun 2026 01:18:37 -0700 (PDT)
Received: from hu-akakum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8433831ce8fsm1188753b3a.57.2026.06.11.01.18.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 01:18:36 -0700 (PDT)
From: Akash Kumar <akash.kumar@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH] usb: dwc3: Update nominal max votes for qcom usb
Date: Thu, 11 Jun 2026 13:48:21 +0530
Message-ID: <20260611081831.2743464-1-akash.kumar@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: u55pTjbxXtQWPUx3xXe-q_ANIWZTZU_C
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDA4MSBTYWx0ZWRfXwsw63iEFgG/A
 VbX0y3lcg7LFUlhaEHO4wpF5AM+TlcPo9r5YIQ2Ludo7Ni7evKo3yIW90kuEzBDb0GVYz+dm1Z6
 pPtKbTGho/DMVWF0+0TR9wg6PgRjTGo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDA4MSBTYWx0ZWRfX7MZJD6qcKqzo
 LwPx3EHuuIFHDhJXe2PPTJd9zVngrxEMB/kGj2PHY1fd81Z8x/VI14znC6+j6VAFIitRn0TdxIw
 SabZp2wi9eeVzGToOcGRrlNaWug5ix9QApPtvLk9ub7bi/OUCKMqil3xK56FnIplZ3/m5vAjytb
 0C8hKzGEzg3/lydj7lSbOZPi1HP/xOx+SCoSZe07eRnYYE8yoz7uTGjZ8Nzu3KrDX/8sacLw3fx
 jtt2HkAF/+EHJLEH5RYz3WOryXzPBGIjh9sTk3MaXvGNCbuWrofGLZFqbyjJ2Dz/pVZ0cZBMV3D
 pHV9/ceZB7JAavZdGcA6XMXot02dOdyKGpqTNWI3Fth69HLPo/5QWS2i2w1ou+zbr0bHoI8VtCX
 jfqXBnVgp23DYr+8bkwW7dUOOtatt5gUUOY7OQan75PzSPmTs/TB9ApcnIYHb4rAynuS8py6Qpf
 VAvE4UE/HbTEun8IAwg==
X-Authority-Analysis: v=2.4 cv=F5lnsKhN c=1 sm=1 tr=0 ts=6a2a6f5e cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=g64AcZ1iVWnUTv4HF3QA:9 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-ORIG-GUID: u55pTjbxXtQWPUx3xXe-q_ANIWZTZU_C
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_01,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 clxscore=1015 adultscore=0 bulkscore=0
 suspectscore=0 impostorscore=0 priorityscore=1501 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606110081

Increase nominal max votes to improve DDR performance and USB audio
use case handling.

Currently, Bandwidth vote for max nominal value is set to 2500,
requiring DDR to run at 1GHz under normal load.

DDR is allowed to run under nominal range at 1.5GHz, which is
consistent across all targets. However, with the current nominal
vote, glitches are observed during multiple audio use cases over USB.
Update the nominal vote to allow DDR to run more
efficiently, enabling simultaneous multiple USB audio use cases
without glitches.

With the existing vote, throughput is around 125MB/s. The updated nominal
value increases throughput to 145MB/s.

Benefits:

Enhanced performance and stability for multiple USB audio use cases.
Improved overall system efficiency with higher throughput. Slight
improvement in the audio KPI from 17.9ms to 16.6ms RTD-USBC.
By implementing this change, we expect to see significant improvements in
both performance and stability, particularly for USB audio use cases,
leading to a more efficient system overall.

Signed-off-by: Akash Kumar <akakum@qti.qualcomm.com>
---
 drivers/usb/dwc3/dwc3-qcom.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
index f43f73ac36ff..aa43a03f3c7f 100644
--- a/drivers/usb/dwc3/dwc3-qcom.c
+++ b/drivers/usb/dwc3/dwc3-qcom.c
@@ -46,9 +46,9 @@
 #define USB_MEMORY_AVG_HS_BW MBps_to_icc(240)
 #define USB_MEMORY_PEAK_HS_BW MBps_to_icc(700)
 #define USB_MEMORY_AVG_SS_BW  MBps_to_icc(1000)
-#define USB_MEMORY_PEAK_SS_BW MBps_to_icc(2500)
-#define APPS_USB_AVG_BW 0
-#define APPS_USB_PEAK_BW MBps_to_icc(40)
+#define USB_MEMORY_PEAK_SS_BW MBps_to_icc(5500)
+#define APPS_USB_AVG_BW 40
+#define APPS_USB_PEAK_BW MBps_to_icc(80)
 
 /* Qualcomm SoCs with multiport support has up to 4 ports */
 #define DWC3_QCOM_MAX_PORTS	4
-- 
2.43.0

