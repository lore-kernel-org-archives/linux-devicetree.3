Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6125334107D
	for <devicetree@vger.kernel.org>; Sat, 29 Aug 2026 19:39:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788032360; cv=none; b=W5CYUhEPCJMP64YzB0oJ7mGASHUdBGLXxPpZ3zOtoGS7P3i4zSFUW0FIW1HIzYla0eV66NM+c8MXorhETKlrJcIgE92AGw7xScHe+EqRfVSUA/VQFjY6LRyJ84/zClAgMzGGQJ9HimskEZjbTdMXwYKCWtqs+rSe+stkuVF+LFM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788032360; c=relaxed/simple;
	bh=sTguRb7ZzQpQAAqmHNbVH8fJafv+ZQqtpDncDKi8RyU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HmhLkJ0hSYZ7hHRYr+Upa3dOz8xpNhS7xRT+wCYLnecSVLzy7vOicApPpfmIH56ZkXE+IZFW4YGcmiKme3SbOhr9cTbm7gT5nXGUsR9t7xAVNmqlAGkn9rJi9KM2Yrcjf9cPrkCxvkDaMN8tItbRKU2TY/ju9BbXtKdMKU9v7c4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=X1C29SI3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=L/HrSyW/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="X1C29SI3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="L/HrSyW/"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67TGwxqx2791982
	for <devicetree@vger.kernel.org>; Sat, 29 Aug 2026 19:39:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=MG4HiwRAfo4nKnx8mRL+C2bMS7+F3i5QnNn
	cb03Lprk=; b=X1C29SI3DG6AfSyUc8eSWJxCrwOq2ijIiIAOi7yP/sIV0wxQRLJ
	Je6fTeLxeCvSjbhHLkNcKsgWh5BIZdhqwP3qU786gzDoJV6JePIXWh9OVoNy4a2/
	ufvxlGxt3rep4+tkpbTbkhmFXSvfcQxSsPzd/GJgclnCFLjV/Za1+9n5MhA6aqFf
	vdimDCUC0rMClMq7T79QAK9K8DYkF0aE2aJGFRY3vy4k5GQv6iG5iH0Jg7KIfrbh
	2nlcxZL7cjQIisnxiBC9OyJyXknJQqy6ZdjdYmBaKrodmSiFs7q0Ex6D4uabd8sL
	uhHtnjHqnJuL7cfjcGFuHih58gKkySiQgqw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gbqdvhn2f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 29 Aug 2026 19:39:18 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-52faa0dd18bso60302561cf.0
        for <devicetree@vger.kernel.org>; Sat, 29 Aug 2026 12:39:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788032357; x=1788637157; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=MG4HiwRAfo4nKnx8mRL+C2bMS7+F3i5QnNncb03Lprk=;
        b=L/HrSyW/dWJKmojYjEbZ8oBuaU3jd3Vy4quQ1DdBgKNgmpSdGa9yeXTb+NSFVkkSuU
         TE12SSMDmyhSV95koAEaASOsNn246q35OKovrgSE1eN62a8P+1mH0Fmkj8RMGCraTf9Q
         gkhOwqZe6UcWf2IXcAUrQUeJfcL7N/dK0uNdTqR9iLI7bWY6q9g4bSoaSWve0FziCtgZ
         29O9EMUaNveT/QAAHEhaZFwtss6yT6YZ2+8GE7r/XA0vy6lJBXNhqKEhG7tnqg/DrvhT
         rgVRjP3JSEXsFVcKE24XmRWB7yvpt7eyQB0eZdePtmCTT+5WN5MDuNZ9tGYwTOjK1pdZ
         XuGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788032357; x=1788637157;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MG4HiwRAfo4nKnx8mRL+C2bMS7+F3i5QnNncb03Lprk=;
        b=hriwyuya6KLVdsZeC1px76iF/43QNLHDRSGTjuIuvsvHidyjdqJwq0IAvYLAOqN95Q
         fRgMOcWzjlEfYLgGVnuUoFswbUwtSX8M9hPpqO1TExcEKG82wqOwsgS+ucD88uk+Hppj
         jLzBk/YI8XsIcXE49gve0XecTmJfYPV+cinVkNPm82dZRxYGjj2YLU/7P4YPhqaaDoh4
         lmdHzdj0ouUn2zYoFXtSt1kGFYwUsjxv2kUmiUvsOCt1BMEAdDZCi0NaZrLSdG5jErf5
         LVnuAMO6ELWo8MKlvQkSTTIjusrjzdXnSmFoCr37/4faxa0AAbLdXxeJfCuzWjbB+C7V
         qB4g==
X-Forwarded-Encrypted: i=1; AHgh+RofzPHkfsET4f56yVw9GOQDUf+8CwTc6kKIq9ryvBDSjYDO+Cl0a1xViW0xGZWs5N5Det8UWfu64Tgd@vger.kernel.org
X-Gm-Message-State: AFuF++n90+GRMivOws0wlE5exLTf56F9qp8kjuFj6bngek8tWLloetbz
	FdTMypUKEkLCQCNK0OHkfuuPMU0puJ5TWzC1jy4eK31wJxCROF+h+YOEg7yb7eCoz+HnYdO+4fb
	m2rHiAjuYw3PptikmYUIJtSt/klVsWVGGz6DlWT/W9xwcmc3KTgzxTHNn6kFrw6lk
X-Gm-Gg: AR+sD11+t+1gw4NqgLfFLt+vN4MLt2teXuyk+jI5oqZjADsk5OU5mDmzuM79AaBJhHW
	9L8UBlbk9Ks82m93IvOi+PZ+jeT2CH3HUfVJr0VIU43Fd4LozUnIVlis7Yflmjr1JVnZiQScSYE
	8q+p95hEvIGGPc+zmumXWhJCgBQD2bkPqqGWH/bknc+l0EqejI3cl0pK3e0wyL/vqMNYlqLN60r
	wDWkJalRJ5b1qZcmDkyAd7hNaZY9a23urG700HxHMzLf+SYIcMUf64BziOSLNuyVfQ6E4OZw7dC
	c7RS2AsRK3sgvGxA3gMdQvB3BcDZ/CA1DSz2bjOkALaiKN+KiqrMtAF5j2lF/C4P9Y4ms+o4K9F
	ICni9hq88PZDM8sM=
X-Received: by 2002:a05:622a:e490:20b0:52f:bdbf:4086 with SMTP id d75a77b69052e-52fbdbf4745mr111562501cf.23.1788032357482;
        Sat, 29 Aug 2026 12:39:17 -0700 (PDT)
X-Received: by 2002:a05:622a:e490:20b0:52f:bdbf:4086 with SMTP id d75a77b69052e-52fbdbf4745mr111562341cf.23.1788032357099;
        Sat, 29 Aug 2026 12:39:17 -0700 (PDT)
Received: from quoll ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b497fa9c5sm221100935e9.4.2026.08.29.12.39.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Aug 2026 12:39:16 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH] arm64: dts: mediatek: mt8173: Replace spaces indentation with tabs
Date: Sat, 29 Aug 2026 21:39:11 +0200
Message-ID: <20260829193910.107418-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=984; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=sTguRb7ZzQpQAAqmHNbVH8fJafv+ZQqtpDncDKi8RyU=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqkzVemZt0DvfAr/vLICEjLQkCnCMztHioVx/9D
 6bi+sDnTy2JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCapM1XgAKCRDBN2bmhouD
 14q3D/9+DYXiJdw8FRE5dDuxkc+cX29OgqezepRXiMivbAtVx0PhwCEgsithchxNRzjNurDPlIX
 ZxnP1FbvRxgSicU31k0Dg5+89go3KWez7OSCawgQVGEId+rF8EkaTZbmncUc5IWRjpVfhjNQAuQ
 uduXLoc7n+e/ZxjkafituTQ1ZiGfXGLtWVLJp9WFx47H+Di4WruoJJLpzOS7GQc0H2vwaGm/9BL
 yoa67EC6v5v45Ko09MBS88o2EsnIh96rBNqezvcc9n9Xsy36WdMz2DmJcw3NxvziKvRuzpM9ljb
 l96/m48UzWE5n8wOxCZEbuu9VDdriLXeRNaHVDEbIOzRAwgGl7W0PxGJE3r7JUmj+I76Oqqf/5/
 d0kenyrmvc72sifpwgB+VtDKEWkluiJMyH+zm8U0ubX10u/QlT93uU+FXvSvcGyGxEcwpnBxiAY
 VrgEefSGBnptWz1TX7QzvPBvwTsmd/UoQpu4+9I950ejJzjs4E+lOCu4YlmPqWEGjXmUnMiLCkW
 yQW250nEWL02FWJu8t9fxDpIyxLSERkYopITxl6NJXw2+nGVzBBb99QdSplvjNHShIaVmQ2FdeJ
 IUwqF+Deb32gC8p7P1WCp1wdq2n7AJkSin21gMk46+jLVZH6TO3KxoTkqcInsTrjxJF/5fKWCOK iKJcSuZjOE8v2SA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: NXW1VMK8ftxfGU61hP_k0fbvWnoWIimB
X-Authority-Analysis: v=2.4 cv=P6EKQCAu c=1 sm=1 tr=0 ts=6a933566 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=JjGN2f0IYHD0VWcqIQwA:9 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI5MDE3MCBTYWx0ZWRfX05tyBrG/Dc5F
 d1fTTU8AB8hDmheiZCxk241iEentimZZOc7ARYFc1VWVIt5XsIoGnCS+llZqKZRjOLjxW/JLyAX
 iSXRUcRkNPdYDb/f34B79ZjknQNmuKXUsgFmTtIXUOauvMIPMdVfdBcTUPjWSre6a18RSNTb+H1
 X0p/D/89rfspq8Eb+O4jrE57U/wBAf1OXGqk3EGXcFSToqykg8jyD8ByMCjmO2FXzFdCKgkW/Zt
 IgZKsWPYb1LN1LkZo2sHTLnwTapqXcycse4QCFpYQNVE2FprrAWbH5S0wvt1dnvuX0sftKDUsUV
 mwjyIjKP3E1vEgoqGaRW5wObpgz1oWMV1salorAq8H7i+IgmTOso+UYu1SNzQSAgE/Mp2ZdAnr1
 oQs4SqRGTnVm4akNr1Zss3XylFbieN96tYsbOlX6N2X3AnYs/ZfzgvIyaBxgi2OCYoefm6Vzs/K
 tyWlIyptcIUd7M1qS3w==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI5MDE3MCBTYWx0ZWRfX87OPHSUxqmJB
 oN5kmGmyOKaM3+COYYuafyYFSfowU8gkSp7jVRcBPkcgLyD9OvazPJfE2sLMmBgM+6k/EsYH6q/
 09DJB4EZiJjMxMhUL/73M0fTDIx0Vvg=
X-Proofpoint-ORIG-GUID: NXW1VMK8ftxfGU61hP_k0fbvWnoWIimB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-29_05,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 spamscore=0 adultscore=0 impostorscore=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608290170

Replace excessive spaces for aligning indentation into tabs.  This will
be reported by dt-style-check ("[mixed-indent-chars] too many space
characters in indent (more than 7)").

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm64/boot/dts/mediatek/mt8173.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8173.dtsi b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
index 8346f0207134..d1faf84b431b 100644
--- a/arch/arm64/boot/dts/mediatek/mt8173.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
@@ -1291,7 +1291,7 @@ mutex: mutex@14020000 {
 			clocks = <&mmsys CLK_MM_MUTEX_32K>;
 			mediatek,gce-client-reg = <&gce SUBSYS_1402XXXX 0 0x1000>;
 			mediatek,gce-events = <CMDQ_EVENT_MUTEX0_STREAM_EOF>,
-                                              <CMDQ_EVENT_MUTEX1_STREAM_EOF>;
+					      <CMDQ_EVENT_MUTEX1_STREAM_EOF>;
 		};
 
 		larb0: larb@14021000 {
-- 
2.53.0

