Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EFA13B9D9A
	for <devicetree@vger.kernel.org>; Fri, 24 Apr 2026 11:34:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777030497; cv=none; b=sJTMu8eCiA+qerW4IsSQGy+7TZ5TPWTJSmkge6EwZSlO8i0GiDYBArbttsKNSB3DCBwvuf7YkyuFrxtlGaNpbjceq9rkN0eY6eGmVnKe1UP3K2j85A5n34c4+16xGxhxuvcjoQVppbdkTCBDo3oicLEE1FCmNV8XigU/U4KP+cg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777030497; c=relaxed/simple;
	bh=pV/xWBmtxbC5Bjs1MVGttr+VN/mHay4tmnTxfAeRJiQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=fV2YcE9ZKsGyFPSSUHynYljv8sVjNdvd1pN/ozfCBIEQLbDM8Mo8z4RvYre0DJ0WCsF5S/2GX4IzF/2vICcoXbhKmu85ZL8mpUYXExPSxOS50BtNkG8ciYDDcl0GTJXj9SLJIbJvKGvTDY1exUE7rizShH13R2OnYqAjWD1Z+LA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZAr/WtJ9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JgprYFTg; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZAr/WtJ9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JgprYFTg"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63O8hUFQ1532320
	for <devicetree@vger.kernel.org>; Fri, 24 Apr 2026 11:34:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Q0z4uO9nAxPTmzYAcglDOc
	jQVHzgrGVGDZ4MAZW9Blk=; b=ZAr/WtJ9+XQucsALWcM3xW170HQtCc7/wqku5W
	tOvQi+dZfDc1s5vkkBw+yZnaDc7IPjDrE829O0WAaXQ3CGXuJjVTHcNJOO6m5Lk3
	ZJ5H25t4G00HjXJVHO06zFYrw6x7J2KSwOU837KnODJnnTIg66eHHJp05YHfjKQB
	ShVKakHeALaqiHBkVvR4NA2256rqmlal8djklLsYk+6XXAqYhnrZ39MXKYGKTTmg
	ZlYTOEJdPOLx771F2ZX3x+lAO/6rPbb95D92k2wDjqkPFzI6pdL6Jsql+l+K+Ehs
	4RrHFd64KOmBTV/lIQUrN+oIul25b0wgtCT3r85WS8v4jdmg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dqr26kv99-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 24 Apr 2026 11:34:52 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-35da97f6a6dso7709407a91.0
        for <devicetree@vger.kernel.org>; Fri, 24 Apr 2026 04:34:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777030491; x=1777635291; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Q0z4uO9nAxPTmzYAcglDOcjQVHzgrGVGDZ4MAZW9Blk=;
        b=JgprYFTgZ4Yhb291MUXP13Ldl4ehsylH2j+Cy3lT5slkFCZYc5oCFfUuQs9zrUZ8G9
         P+m+4xbRhljbFOrgI76wpRvc3GYq+CQcCU9o0fzUIooauv9vwHcAPz5Tm1cLfdPv2Wab
         dd54e+6NK0viXikKkD06W0hTNbnDrzWaY4/tuS/gTi0l0m7CFC8eBGX9kDDg9uQ2J/zB
         CP6TrZRiV8kUjgKTe6BMWKHQsPyFv6wkXtx0DIl1TpwZlxDYbfN1AZ1oJ9kylrq++p+B
         4EIPcZoMQYcpefYEKMNukb8WrZnr0wJRJM8OkDcg6Fpgrpv6IYu1/WiL+KvKyVcmjfmm
         V4pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777030491; x=1777635291;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q0z4uO9nAxPTmzYAcglDOcjQVHzgrGVGDZ4MAZW9Blk=;
        b=bK2mASdWnEeUMc4TSQjdUqb/ONE7Y2YFjhzOknFL2ghufbzXwRsekgagc4QiL9S2cT
         NPU2n+Y8SS/Fl1IeFaDflUQGTZjXSEPfXAEnLC4pGpTqZnB564ifgfHMXq4B9HnSqOu8
         rDzheCSzV4kHQcVm2pon+NgBxbFIiHihr3+JCYZIfhWgJBs5zZgGl9M08Bff97w269DV
         6vhbizYPLQ3vJVzpUHK0hbsjfLHjEpveyk8ldz/o4nTYvyHUNIIXWApNdYwVnHcNGrU3
         VuXJ65J7TOm1+k+jNhJpXWbWDTZt+j27u1XCbUIJ6znYXsu2DzDj7QM2q/74rpA2XD+U
         NlYQ==
X-Forwarded-Encrypted: i=1; AFNElJ87tb/3dtBx+J9F/T91/rEOzsvpcgd3odgThk/UP2ATp5nlEKvhZC9xSuW7sZqQ8FoZzeyWrMCBLm2/@vger.kernel.org
X-Gm-Message-State: AOJu0YwfNjFDxoxsjI1s9CYoXR0n08Cu9ZjhrKoSwo4MJGpV+9F7nOkG
	EpHb/uJkWKhstUMBNcpOYNSMwKL97bUSa8G5SsPn25boA0hSkuvqoA4orjSuLau1j2VS+l98VFE
	siB3xEiA62rW8TwgNgTxgGFtS1q3mUmj01UgsHORMXB5ly1yeJqrXgCGNpaSiZM0cKtWG3mzO
X-Gm-Gg: AeBDiev+vEx1mNfmdnBxvM9OKVU5KK4lx054i+C4+8U8li/4xAVTio/TFirpuiCYYUF
	XZ5s0Ly8T/rj4khpKhLO4J4DV+X0NxLWpCIN8QzkN/6FOld5B9+NCXwxciqNeav2q9xN/LPeNPP
	QRVw+Aenh3j7B9LIJmfMQa/S38COZUcAr2U3l7r4Zvhlfjjs0Iz/PTCNn9n4mLZlbiykBVMkpKx
	fDWhPF833uJAcfMB37khNcz24/MP2spGUVJz42DF/XL7CECk+l9pSdmaBQtCf2VwgpLmzzXkML3
	komekM5BZ+tJlJlN6SgY37mg9I20oX0VGWF1YuoyvQ5mJ5D56PAfMaBMWHjBmVj6coImOipfQwz
	T9vfkgJvEGxd0dBvTvzA9VXVIQLXHoipwNVxMSP5F1D2aFIBPIK5nox/4O8FjuVxt7A==
X-Received: by 2002:a17:90a:74f:b0:361:4720:af84 with SMTP id 98e67ed59e1d1-3614720b0e4mr20437848a91.20.1777030491151;
        Fri, 24 Apr 2026 04:34:51 -0700 (PDT)
X-Received: by 2002:a17:90a:74f:b0:361:4720:af84 with SMTP id 98e67ed59e1d1-3614720b0e4mr20437811a91.20.1777030490665;
        Fri, 24 Apr 2026 04:34:50 -0700 (PDT)
Received: from hu-kuldsing-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3614186adddsm24204734a91.2.2026.04.24.04.34.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Apr 2026 04:34:50 -0700 (PDT)
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Subject: [PATCH 0/3] Add support for qcrypto in kaanapali
Date: Fri, 24 Apr 2026 17:04:14 +0530
Message-Id: <20260424-knp_qce-v1-0-813e18f8f355@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADZV62kC/yXM4QpAMBSG4VvR+W11bFLciiTmjEMNG1Jy74afT
 73fd4Enx+ShiC5wdLDn2QYkcQR6aGxPgrtgkCgzTGUqJrvUqyaBaPLOKJKocgj14sjw+T2V1W+
 /tyPp7Z3DfT+KaLKAawAAAA==
X-Change-ID: 20260424-knp_qce-00f9df3e2039
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Harshal Dev <harshal.dev@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        dmaengine@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Proofpoint-ORIG-GUID: RmshmLqaBz1OlBrnvmlWoHC82BJ_bVfA
X-Authority-Analysis: v=2.4 cv=QLhYgALL c=1 sm=1 tr=0 ts=69eb555c cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=hpg_QQ1ef3WCVlx-FDkA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: RmshmLqaBz1OlBrnvmlWoHC82BJ_bVfA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI0MDExMCBTYWx0ZWRfX7CZBezGaaOQH
 UfSQvtbdAia3cHVxpOmbcUk5Gzjvj7j1fMNatwhD1bmUl7AQBea6CS5DOw9qHtVdRiAwBnEz5jt
 kjssxvtaBaaX4jQVnkOa+OGHC61su/olqDwBwf2fknaDUWqEBpqZ13mL34ZmdpksUwlB8htcY6D
 W6DmH9VJ3+QRznb6Po2a2vZ1cDrcLoamZ/2GOCQwwZaYC160PokqfH37UvG0Ps476wuSdUAVlZA
 xt4nlE8uMv8wgGVKKdBhhPbFcJ4plcPMEeuqGubufQjc5dhM2QyPhhGQF+sk1GiOu9ZlYyjZQMz
 pJAimCwAr9mlvx2rsAr4AKLpID30yTTP4tskN/VEfcBrthmQBUuHInvROxqKxzYaO44tz1NK5pQ
 M7lz9OZB3EzOoj4ZJbi3y2cuhYNON684BEFYL+BRnl6OmR3ErPRg294xYVB6B05GiYcxB6YQbc7
 ZTed7cUWvbRhc6DLGBg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-23_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 suspectscore=0 phishscore=0 bulkscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 clxscore=1015
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604240110

Add qcrypto and cryptobam DT nodes for enabling qcrypto on kaanapali.
Validations:
- make ARCH=arm64 DT_CHECKER_FLAGS=-m DT_SCHEMA_FILES=Documentation/devicetree/bindings/dma/qcom,bam-dma.yaml dt_binding_check
- make ARCH=arm64 qcom/kaanapali-mtp.dtb CHECK_DTBS=1 DT_SCHEMA_FILES=Documentation/devicetree/bindings/dma/qcom,bam-dma.yaml
- cryptobam and crypto driver probe
- kcapi test

Signed-off-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
---
Kuldeep Singh (3):
      dt-bindings: dma: qcom: bam-dma: Add support for kaanapali BAM v2.0.0
      dmaengine: qcom: bam_dma: Add support for BAM v2.0.0
      arm64: dts: qcom: kaanapali: Add qcrypto node support

 .../devicetree/bindings/dma/qcom,bam-dma.yaml      | 21 +++++++++++++++
 arch/arm64/boot/dts/qcom/kaanapali.dtsi            | 25 ++++++++++++++++++
 drivers/dma/qcom/bam_dma.c                         | 30 ++++++++++++++++++++++
 3 files changed, 76 insertions(+)
---
base-commit: 4c406406070d57dbefeaad149181785330c23f92
change-id: 20260424-knp_qce-00f9df3e2039

Best regards,
--  
Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>

