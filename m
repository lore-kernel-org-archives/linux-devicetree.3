Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB0203890FC
	for <devicetree@vger.kernel.org>; Wed, 29 Apr 2026 07:34:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777448097; cv=none; b=PSyPEBAeH+CauLiHJGjhR63v7CfDdvgyCwClNaqjZ+7AUJWIQIPIORSCrpTGJAJfFrhRLSWt1ICGubhFtWo4BNQ5KkgCRILolEC5U/W2Y440kK6fmtjq7WmrL1CCTB1XRwBgfpPF9WcWL7QCR7oo5ANmTZ8qz0ZCc5dGC+cZ7P4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777448097; c=relaxed/simple;
	bh=fQDyDBW2jp+KfIfU5HeBmlBOt1kcV4MTHkCrlopCM/M=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Rg76JeYASrvRH2dzU+Eo8MteHW2Fl129/KALtzcsm92joX1VkzYnZDPoxAH4LsXCzTU2AJxdN3wGWceLDbqzSjR8W2SWeXCWuyjRydxCMTdRINulUqvyE9y06oIj3cAZNh2LOmoykL/pNL7VZe5ajFc705jTY2O5a+kJaC6ahV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=O0BUDfqX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=d9xMxKvW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="O0BUDfqX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="d9xMxKvW"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63T5HSfi418768
	for <devicetree@vger.kernel.org>; Wed, 29 Apr 2026 07:34:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=UqtGxNKfLuFxFRH+r4Z1QswRRNhsHKDis+z
	Bz52Z5/A=; b=O0BUDfqXb/ilrRxhFglqXWKwK7sB5nNi2RulnnjYsghUXI8RJru
	C5Tyjneg9QMMk2oJTxR1oIa5tUBUHXMFJPge3MFPRaeEtFdk12N0bCRqUtued1r8
	wPvCuudXfHtrKn2jLVOZJ6/lJfj1l1+IK6ADi/FiS9IIobU09wh532591+CHBPwu
	QqoQQC7iT57VYuCHTDFOFOuki3dW+H9G8IL1Bmdx8FeA3s/xDQNmfIccJiYf8pf5
	o/y6UZhyFA2Ftg3+RvOHJAnnE/rL08OE/dibEI/IPgvyBfTfUh30zPrBCFnwmSGo
	bjAv/tiPWGNvmWKBS3ZRtZ8rXTcp+6nebJg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dubq9ggah-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 29 Apr 2026 07:34:54 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2b24af7ca99so166106705ad.1
        for <devicetree@vger.kernel.org>; Wed, 29 Apr 2026 00:34:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777448094; x=1778052894; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UqtGxNKfLuFxFRH+r4Z1QswRRNhsHKDis+zBz52Z5/A=;
        b=d9xMxKvWopVkoFwMsWuoEAervLTCmaMiDDSs11QzlgWPrn5dKOzo5RXSyeQgLlHzoE
         Fecq6KOXOPDhUlE7TUy4TmMm5shXprPjuA1Hnnj4MKZjrsyqN0Fw5iIiVEl9IrfCDSyI
         +mEh5jwU8QNBTW6D+HGF1vU7Js1OeKdzM7+rF1T4on4Ieu/DoBdhRA3oHJYSseGSrjdC
         YMFCC3/0Hij3jU1LkRw/ekmI9rk3F+sDVHgqhy4DMLClO2mfJ1dVhMaoXoFcsTXJIagy
         mrX9Hdq1BnbJzO7xVy8anonBj6tSucEHupvQxJyoihvltwuBx/7I1zwM4P/sXzUwT7Sw
         MiIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777448094; x=1778052894;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UqtGxNKfLuFxFRH+r4Z1QswRRNhsHKDis+zBz52Z5/A=;
        b=pc7jFyQLf/9W6/VbTdPebFOn02yzSOXgTWabEYv3dRXTA1qb/DBo/llqSpvwGaBzv0
         fz9+yRWbt5MqZtEG1R8w3fLDfEeCrfpsMRrh/zQ1EuRDNZqgGMJXgc5sM0yULBNDnbec
         PvP6rj5l7mB6bfl3O0fI8P6K2IgOEKd9CiVTUejsK4fdMNgvqM/BF2hYErKDnZQRsBgP
         wlD5zPgtg4YQ4sHzoVnHRhnCJIWxLxMBxYj/xL5DhbsshpYZqv6YCb80f+RgEdNerPXM
         zTlb0wwibCVP+GkLzkQp1n3exYumZhT4xHry2qP3ubTscTTDraf6Ax08xPTSONyvECX2
         wMjQ==
X-Forwarded-Encrypted: i=1; AFNElJ9GwWIxnJZ49rJzHQQi9C65dBQttORWJ7/1K19KE59wGiZSgE1IDNeItp9Xmap7sKv80B8R87oCuwZE@vger.kernel.org
X-Gm-Message-State: AOJu0YwiV9cYb2y7/ql1OWtaa3vxZUvKzKaTLjRodXjWEB5UkOr20hly
	R3tRwIPe/YhfLWkEkHvsPGuD2QCWwSKPJnJ+kWTKwtw1pNnN1+Qc/8oxpqrkfLVvJ/UROCBCbMR
	2miO4lFZbkUMID+Z0bhSXDHzM5fxjVx1ohD80BVLq5O66DslYXZpXIJx02sRCorLc
X-Gm-Gg: AeBDieuWIbGfUDdPkqcAg8E152sQP9TW0am2bos0XkpxpoO48IWoN/AhdiQCRq0yry5
	Tn42crooJfkIQGKiepPbBm1YtVM7K7UfyQDC9mDYu0yoq6F2ekvJL+EYrzTfRRBahsxUSWKvs/Q
	WvAt2df2+dou2iZLqgpxQgEVEcX9Mdm2Dm57tnlYlu5wpS7Aw9I3LS1XHxkQcOcx3JFvUB/2JjW
	6mM9bvOkNFTxCxRB0KdE8MfNQrjGhD3hBGXTpIQkCq0ll9F4/yGy0Xo5jvDUoFh28s5BJ9ZA6y2
	rer13z1vPoS85XrXEkQkQu7TkFYt2UtHKIuc/8trb1xrSbwfzzeZ3FxwJRPT5B3t2voRoRgPMBc
	/okWFu+ruQFkxX63K39dFaxIT7dG37MPVzio6fxjf+YOWglL4Ep9eyx2ih2Gj8wRnhwYeR3R753
	fUfFB+iO8fewjxCXRrWIGTF4TJ0k0O
X-Received: by 2002:a17:902:d2c8:b0:2b2:a6a2:c8ca with SMTP id d9443c01a7336-2b97c40028dmr67358565ad.13.1777448093979;
        Wed, 29 Apr 2026 00:34:53 -0700 (PDT)
X-Received: by 2002:a17:902:d2c8:b0:2b2:a6a2:c8ca with SMTP id d9443c01a7336-2b97c40028dmr67358275ad.13.1777448093502;
        Wed, 29 Apr 2026 00:34:53 -0700 (PDT)
Received: from QCOM-SocCW5bzXR.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b98859f629sm13281425ad.0.2026.04.29.00.34.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 00:34:53 -0700 (PDT)
From: Jianping Li <jianping.li@oss.qualcomm.com>
To: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org
Cc: Jianping Li <jianping.li@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        ekansh.gupta@oss.qualcomm.com, stable@kernel.org
Subject: [PATCH v2] arm64: dts: qcom: kodiak: avoid EFI overlap for ADSP remote heap
Date: Wed, 29 Apr 2026 15:34:43 +0800
Message-Id: <20260429073443.2027-1-jianping.li@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: WN9eGMVVfh43VsWNtUlbhpu4JvF6yTfW
X-Proofpoint-ORIG-GUID: WN9eGMVVfh43VsWNtUlbhpu4JvF6yTfW
X-Authority-Analysis: v=2.4 cv=Wak8rUhX c=1 sm=1 tr=0 ts=69f1b49e cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=iXbblyws4aYpK_2pIfUA:9 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI5MDA3NCBTYWx0ZWRfX+s41AoNp7mmB
 Vt0b73PVj68bICltkL4rIiUjBjVJ+I6Lyq8YjH4ApqlCP3i4WCEBXAcEC+lpez0bR0YsgSW/yk6
 uqpljij9hRJiVY1pbIQe9OvokoW954REBSX2ClgtZO3tYlZsSTKeKGySs1biYgqQInQwI1uwtZQ
 OOkVmD8GuUSijBUZy+86K+beVTEtN/CyIQKozuBu3Zj50JtA2utOVZ9OsoztrCxRTwEyEnLCrB/
 zGJX99Erw5K09DhpqSlUYmCZuObpd5rZN5Zqd5E/Chb+yWMnHxnhKZr4sxt8wKflbna4Lc2+T+k
 se4NEtbxHuPHAk9ye0JjB6qEJnk+eTgPS+yn9ZL8NLZFhGLTSCY+jbn/1YspcPOmOEPZt2j/sSq
 R58ObMC/7ePW0Qsy5fIp3Pn2Wyk5rmVqfq8Bk7kdn/U2T8Y+vjwfQOf1Wz9/ZlxU/HkVDiqjUW8
 IyeuAMLcCB+ijuL5A+w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_05,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 suspectscore=0 spamscore=0 clxscore=1015
 bulkscore=0 impostorscore=0 adultscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604290074

On KODIAK platforms boot can fail when the DT "adsp-rpc-remote-heap"
reserved-memory region overlaps with firmware allocations (UEFI/EFI
runtime). The kernel then reports failure to reserve the region and
subsequent EFI runtime activity may trigger aborts.

The remote heap node was described as a fixed "no-map" region, which
turns it into a hard carveout. Replace it with a "shared-dma-pool"
reserved memory region with reusable CMA-backed allocation, specifying
alignment and size.

This avoids hard carveouts and reduces the chance of conflicting with
firmware memory maps while keeping an explicit pool for ADSP remote
heap usage.

Fixes: 90a58ffa9c55 ("arm64: dts: qcom: kodiak: Add memory region for audiopd")
Cc: stable@kernel.org
Signed-off-by: Jianping Li <jianping.li@oss.qualcomm.com>
---
Patch v1: https://lore.kernel.org/all/20260423063502.484-1-jianping.li@oss.qualcomm.com/
Changes in v2:
  - Correct the value of alloc-ranges
---
---
 arch/arm64/boot/dts/qcom/kodiak.dtsi | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/kodiak.dtsi b/arch/arm64/boot/dts/qcom/kodiak.dtsi
index 988ca5f7c8a0..4d46c7a62187 100644
--- a/arch/arm64/boot/dts/qcom/kodiak.dtsi
+++ b/arch/arm64/boot/dts/qcom/kodiak.dtsi
@@ -191,9 +191,12 @@ rmtfs_mem: rmtfs@9c900000 {
 			qcom,vmid = <QCOM_SCM_VMID_MSS_MSA>;
 		};
 
-		adsp_rpc_remote_heap_mem: adsp-rpc-remote-heap@9cb80000 {
-			reg = <0x0 0x9cb80000 0x0 0x800000>;
-			no-map;
+		adsp_rpc_remote_heap_mem: adsp-rpc-remote-heap {
+			compatible = "shared-dma-pool";
+			alloc-ranges = <0x0 0x80000000 0x0 0x80000000>;
+			reusable;
+			alignment = <0x0 0x400000>;
+			size = <0x0 0x800000>;
 		};
 	};
 
-- 
2.43.0

