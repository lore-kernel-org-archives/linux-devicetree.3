Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 763193438A0
	for <devicetree@vger.kernel.org>; Fri, 29 May 2026 14:23:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780064623; cv=none; b=up59MRpRZ+yz7wPCVXFMev9tYBrwXZjXAe61ETMeyQxsTQFyhVOFAdUH+1fH4CXE0A6DP1VLOqx1bMAknhZipKTiTmlm4jhZwPpYVotvR3FC8K68nhhEvC72xf2KqoHIZ8uwmtiIYiKJqXhsmK9TWALNGNUnbk4xPIxstEv3h5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780064623; c=relaxed/simple;
	bh=GOKSOFwIdS35aYputVHpifn9pnftZnjBGzZCN7UANlc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fIwNC181MECKlyb6/JzzyX+FRCQoSX24gta8ZjEOUwlGwkeSZpBVPIxpl2TkhZeRNNBSybtX9CNsMfQ21xfS4zBnGXptEDj/0NCWiUPePiixxvA0EVYinZpGedfRvBBvQCvmZfpZv/+CBDNFg9NGnZTWBr0uJuc1w9mM3HbbtG8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Jbj71kyw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=G8p9ydvr; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Jbj71kyw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="G8p9ydvr"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64TDKrgY3845257
	for <devicetree@vger.kernel.org>; Fri, 29 May 2026 14:23:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+i0x93dM4hcUsHjMMZee7ffFLN7Mi7pIpN+pXHsXMss=; b=Jbj71kywTW+TffbU
	HPMgpH/6ar1Yw8rEzD6lXB4eJpl6I5GKVa/hytETcn0UByf8Sh76RJcV7KAU22b0
	WH1kxUIDwLFKCejtMQCB4W+jph6nBnePjQBIrD83RFK6OVS4CAZuNg0/KYb6oosV
	adOUigt6RmcCJrZNx0BPH4KKIeF6tbvnLcyRpku6baphTVfAv0wKB746xCZRToGP
	3o7NQAwFSgC7wrvpADNIYgllVt7FM/134Oafko4xCmABFbHzeaWLfMUYDVvRLyEL
	2GYu0GEF1rUVaVTaGKsHw36CUNz4HsHnkXLD2tnh0dAG2iBj99lteDKVYTdq0/LH
	QtxKAw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eex6m3pe6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 29 May 2026 14:23:41 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2b9a3c3c4eeso144591805ad.3
        for <devicetree@vger.kernel.org>; Fri, 29 May 2026 07:23:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780064620; x=1780669420; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+i0x93dM4hcUsHjMMZee7ffFLN7Mi7pIpN+pXHsXMss=;
        b=G8p9ydvrHYHO2KD0Wc6SUtXv13OmU/uO4PQkHnpGBAwzmr07NCh3QqACWkizUDhKYv
         SZrPp6UNIjpJhMFHwuSToEJSfmt5DZw9gx62HcVnajKl+WQjJvDTKRK6Fp0sOgMr2fot
         Vy6LWs7lV2ZpohhFqsHZz1d4UuEJg7lBerb4ZGJI2b6BOzctXLO/wgAO4pqWmRC3FhHd
         Qmol3UpomLYTW/XWNB80V2KkFhfQJlKdnMesTP4PH/KjT+h4qvoG6T3yZWE+eobhVlZF
         AeHhpiugcdinHcZkngO3TBIasiQRH9Qg/T4DSa5qAvKSnhlI9FDinFHf6aqFNIs16Jmx
         YbJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780064620; x=1780669420;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+i0x93dM4hcUsHjMMZee7ffFLN7Mi7pIpN+pXHsXMss=;
        b=DlMTZMAI/YeHuPelZd9JMlUjNDvOB6WtDAZ9wxpfGz54ejduaR6cEBwAjqAAs3ch4W
         Y936UuEUCWvMpjV+5Y/BJWsoyGZk+UbwS7bwt1IPINSqxIUR98IwqTwWLmcp027++TgQ
         BvzAUUwlKUV5qeq13HvfOSwM5mgJKLe15StmBEo+oDyJg4vW/+CrPJjwTxXWRKvarUv2
         /+3+9ionI26668E2XWMCvYUnsyrPW2ZqKXQlNq+as5yCqVQ81apsADQk3ANFLlsWJPg5
         3NPerb+r1d5fuIK6RsifcKAcXfkcRJJT/0rtGkv2N5Nm3bJ5vwdYr1MTK4F8VzrgO4rQ
         LD/w==
X-Forwarded-Encrypted: i=1; AFNElJ93B0BfibRJhlhlalS3t56UKr/LO473u3mp1Z0sdm+t6bWkkl07+77Fr3nIbuDqB49CpZ+oSCzrNQFC@vger.kernel.org
X-Gm-Message-State: AOJu0YzuU8fb03IzBlVGLY7aP4SPShEaegfOZ1jSZmPpngc7Kb/C+e3n
	MNs9uHjZf75QSch3BHkLqHTIQlNtwPi6xp2kYRfUKSSKKo99Zd/uXRDTIzeyC+/HLWzRXpXFmxp
	ffNoBhjVdLvDdt4MJtmpDHizlXy+Gs5T+zEeUVZ5r5oTtN8djDMzBGbTrvKxSdOGpMRwssDw3pV
	Y=
X-Gm-Gg: Acq92OFjLaJL/+Z/Grs0ZUMVCTfsJUkW1JhvaI6hU+Apwv+ps1I4cqD3pxd9ENmFLvS
	0Fh8m2hART7IKjJyRlxMwElhcVRcNqSmHzsJ10OJa6E2Si44kL/R+a0uzqRAp3mLCNf+bZ1WbBU
	A+CZwURdtOF4Bp1Wwxoxbd4kGYP5wWh5/xE5cD2e/VD05y5EGn9/T7i2mv5t5EHYiSPpuUQMudZ
	onPcvtr95j5sg2tNQUuJNoFYd1c61SPq3IY8D36GkrUuXwG6ro7OrMrQru10mpQ7SOUfAwylOLV
	1NFZvKrcjGMEhyzlaSL8k1hDpYlrc+8PCpf0P+cZXWnq9J54HZ89nVtxnj1IAEHv0aCN8GTkH12
	jTn27pz5yPbS+CHCWVBfn6GN1ZtrNBvliW4FOVcf3IqQmYnZDl2XWzbjbwlNew5NXzIe6
X-Received: by 2002:a17:903:1c6:b0:2bd:9c0a:32c with SMTP id d9443c01a7336-2bf3683b78dmr261865ad.19.1780064620397;
        Fri, 29 May 2026 07:23:40 -0700 (PDT)
X-Received: by 2002:a17:903:1c6:b0:2bd:9c0a:32c with SMTP id d9443c01a7336-2bf3683b78dmr261155ad.19.1780064619786;
        Fri, 29 May 2026 07:23:39 -0700 (PDT)
Received: from hu-apateriy-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bf23c57283sm22013095ad.81.2026.05.29.07.23.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2026 07:23:39 -0700 (PDT)
From: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>
Date: Fri, 29 May 2026 19:53:11 +0530
Subject: [PATCH v2 1/2] arm64: dts: qcom: sm8750: add reboot-mode support
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260529-psci_sys_reset-dt-changes-for-pakala-v2-1-1964ebf1924c@oss.qualcomm.com>
References: <20260529-psci_sys_reset-dt-changes-for-pakala-v2-0-1964ebf1924c@oss.qualcomm.com>
In-Reply-To: <20260529-psci_sys_reset-dt-changes-for-pakala-v2-0-1964ebf1924c@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI5MDE0NCBTYWx0ZWRfX/cyxPy7Z2hrP
 oOFAnwBvNRHLuxespU9yF7XbKOvm+Sn86G44P//LX/yAd5lieNRXSKnrcj4ywvlg2ZQdFINl0V/
 mqFSz+ZLP2QGcIKnpHdzTNs3R2U+saa+4+i1dq7L5OqkxmK33dhjiSFqhOzh6ov/ZKXccEI6lD9
 UHJ82mNKfAF2kZf4W+yjA68ftKD1JcHyWeHWHkxihMlPGWoXhsRIQVC4mrxjXTodcmKp8jJuSr/
 PIhSDWnqwC681EsZXRqIVQcaZRK43hi6ItseNC11+eljTRl6Jr9YeaDApWUOGeQh5BxeSCzQc4J
 rZcaO/EGyWDzKRa/Ette38cwkWA8S4n03xyNYgdd00VobBnd8fC2AFNFQdb9wGcKrRgS6gBG69j
 vjqCYrq3uUVYQFFgpzPmTre5kgxcCOTj4JAdn2AiguOKWQLOG1vtTOZHzhRb0dVU+rLTrh9ZvKs
 zFauNTs51q02Cq0uAzw==
X-Authority-Analysis: v=2.4 cv=frnsol4f c=1 sm=1 tr=0 ts=6a19a16d cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=t9eHAnW7oJswSNK9swEA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: gJS-pLmm3Ek-WbMeNxbq4vUcYbm80N_S
X-Proofpoint-ORIG-GUID: gJS-pLmm3Ek-WbMeNxbq4vUcYbm80N_S
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-29_04,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 suspectscore=0 adultscore=0 clxscore=1015
 malwarescore=0 impostorscore=0 phishscore=0 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2605290144

Add PSCI SYSTEM_RESET2 reboot-modes for sm8750-mtp and sm8750-qrd for
use by the psci-reboot-mode driver.

The following modes are defined:
- bootloader: reboot into fastboot mode for fastboot flashing.
- edl: reboot into emergency download mode for image loading via
  the Firehose protocol.

Signed-off-by: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8750-mtp.dts | 7 +++++++
 arch/arm64/boot/dts/qcom/sm8750-qrd.dts | 7 +++++++
 arch/arm64/boot/dts/qcom/sm8750.dtsi    | 2 +-
 3 files changed, 15 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8750-mtp.dts b/arch/arm64/boot/dts/qcom/sm8750-mtp.dts
index de19b4dc214e..e5e2efa2218c 100644
--- a/arch/arm64/boot/dts/qcom/sm8750-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/sm8750-mtp.dts
@@ -1425,3 +1425,10 @@ &usb_hsphy {
 
 	status = "okay";
 };
+
+&psci {
+	reboot-mode {
+		mode-bootloader = <0x80010001 0x2>;
+		mode-edl = <0x80000000 0x1>;
+	};
+};
diff --git a/arch/arm64/boot/dts/qcom/sm8750-qrd.dts b/arch/arm64/boot/dts/qcom/sm8750-qrd.dts
index 801c46d55602..795d0d34e47e 100644
--- a/arch/arm64/boot/dts/qcom/sm8750-qrd.dts
+++ b/arch/arm64/boot/dts/qcom/sm8750-qrd.dts
@@ -1154,3 +1154,10 @@ &usb_hsphy {
 
 	status = "okay";
 };
+
+&psci {
+	reboot-mode {
+		mode-bootloader = <0x80010001 0x2>;
+		mode-edl = <0x80000000 0x1>;
+	};
+};
diff --git a/arch/arm64/boot/dts/qcom/sm8750.dtsi b/arch/arm64/boot/dts/qcom/sm8750.dtsi
index 5d6374a23e3e..58ff34e91893 100644
--- a/arch/arm64/boot/dts/qcom/sm8750.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8750.dtsi
@@ -261,7 +261,7 @@ pmu {
 		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_LOW>;
 	};
 
-	psci {
+	psci: psci {
 		compatible = "arm,psci-1.0";
 		method = "smc";
 

-- 
2.43.0

