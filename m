Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9E454DE701
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 07:27:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790062066; cv=none; b=nN8Kc+djjCAQolUTUmgDDaIs8E6449bm7Cbt4ODRSBWz6Qn7ur0Lkk+Eqkq+8HU0oyBVMtb5x0HnTspsw2EzC8WB0gz8tYbRd7hqHQgkPtyN5ZkELkyPYHbi/U9+VJkySuEfNztGzwObTFguL1eDJvaElS/xWeXIQ+tzY9vAA1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790062066; c=relaxed/simple;
	bh=cydy0LF/RZKM9IAo5HRsLZwewvOr1al+EwNdfV2VZxc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=QLKr/roM6sfn18SnD9tdMIDCHfZnrgDyUZ47qcZbNqBjWy3JdkxyLmWW5zGsBTzpeP4x+zRkuIWGO5DBZOGb3mD02Yv45AjTICSyBlIhQrBGgBODx5TDaHdiHhY1427pMO7PXVHp4+vr8DWhbB0nJQC5BBKfnkcLfe4cUEyixog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MF3jIYTz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IIHHL4dr; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MF3jIYTz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IIHHL4dr"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68M6we1Z2165590
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 07:27:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=cLPit+K9KBK49NQI2/hOA0
	SK35sPG3PGjQlJsFWvnNc=; b=MF3jIYTzUe3bEMRYwYuCj/U/47kY5ijvYZL3qz
	XYmgv4Ko3GHaRFLGGsDTOvSfE+fNOUFV3bqblmdTUH3G+OYn5TY7VmwbTFVH1eUq
	DWDAs/vCtG2Vxclrw63Oct9zuGVb6Bd8iARQRUzUiFEkRugj2hiIPb6gb+4DzJF0
	/WzquRFtkWLJB3lTsLQY1IpJmYsJVSfI05dls7N6sxv3DbtWWVr0Hisb+9/5mLcf
	vxMdDrpuHNqeCTuW3JoA+PX2muGrPaKFatRqh3iXv4u3WWEnQWkt2rZdMl7wVl0R
	BTSyFItnjFTYgkpC7/B/hNt4k1aQxOHs8YzM5G0qY0F9XQJg==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gu8xett51-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 07:27:43 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-ca8aee88725so5661483a12.3
        for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 00:27:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790062063; x=1790666863; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=cLPit+K9KBK49NQI2/hOA0SK35sPG3PGjQlJsFWvnNc=;
        b=IIHHL4dryLxLjrNbe9UlrrOvEuv+HmhRJgHZXgQTo5BqpPf6en1uTfuj5RTjLHZHeg
         hdWNucWsHRRVenISBfWXKnE/EmizFAy7Edr7v8LT8PI39wHIeQ7y5N59gM2Mn3giwn2e
         FIgjAJk4bPHRIJRRAYIFNRmajbYkgp7icvkKiyHCddl6nniX9UUFlrTaCFQJ0nqv6Xvv
         +j32lpN9MncokZ0Y3RdJqPtD0mUK8QFWjWLVjII0HI79Dj5h8XIX9rh4Led5E85ZIFGd
         y/rwiDzkab8SvYRb/by5OZZjZNXSkiDbuoibAZ11fFdxsg9tLkzv+073IzvmEqdx1//G
         xtGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790062063; x=1790666863;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=cLPit+K9KBK49NQI2/hOA0SK35sPG3PGjQlJsFWvnNc=;
        b=cckkSvE45shKF4dQxF9pgNHKX0Earxk11saXMYvTRG9RvlaUnJMlhsE00zZVReV3pJ
         v3AU5jF/awts/9TMpPLJ5AzqY3JtNfXj36tuRgoSYF+nKr7aXqYnrOpiXhejry9ypj6L
         Qr+gU8pHhLHTHNIgAQu/I7fXKvxwYGFXweWtV6wVzczSz160vaA8ug4ryksBGfDdYPZJ
         yB0DCo/pCni/yvmSe426wbJ9JJsmLq4CJGhh9yDl/jyNfCPzwhmtfgwlkisV4SPNEzII
         2kkMy5eR03cZ4ioeevyCg8xgPiXANyAFTw5QfyjVYoE24qwsn5l4WsQe6cYmMdVMlQtw
         cruQ==
X-Forwarded-Encrypted: i=1; AKwUvBxizjSRUyNR255Dz+DZA9cx7pMKdoWO0zExNAkJUOX/cDIe7FGLz53jf15QzR5to9A7lqRwrOXuPiGc@vger.kernel.org
X-Gm-Message-State: AFuF++kkBcYFk2Q7niVnad4qpYvFfmze7h3SyPPJlQ+GoMQOduBqq0kd
	A5mQ6+u0mybOrBTyWBjJfvwmJtI2W3aqLzLcOkBy8kmPGPuhUmiWw37wZj+1GqdYf8qEYwgziiX
	8J/yCji0NmUiGB/qMeCRkX8RIO+FRVQOqzHvN0bEuXOd+TooDbvgUBxcFXSu/Vnno
X-Gm-Gg: AYBFou1uxhzkU9HdjtWCJqsWgi6fevyFeVlNn4t+t2O5jeTxxeQxwg0QG77pNDL9CX3
	YT+CITA/4UD8T2PvY7j6nCeL4mpoAtFjMxD31C1f+wbglMesfta2E1pUXqzW0pZT5vCRciiUAM6
	umwEgiaOTe1CJkbvIb+2jwpqF9GfuIAxUrVH9WBEADW9ByR5gIsy96jJL4O8S0za385cE9MXbtH
	CaxLSIp4q8aOLFGkCRNy3dx6r3jxz1/UEuUpQ3QCfSWrNbmYS5rd56WpL+KCeEHo6Mjipq/BZR+
	n3nT0aNIKX1VdXMKDh0NqEY7gQL5hakra1VFeReBWC7fS10z08o3U2ASTNIw+F9kAgqolXqKzcY
	7ud5DCwSVijDXNhmxS6UMKOsOkfZFymw=
X-Received: by 2002:a05:6a20:d70a:b0:3dd:85a8:4c5e with SMTP id adf61e73a8af0-3ddec6b6f00mr286708637.37.1790062062944;
        Tue, 22 Sep 2026 00:27:42 -0700 (PDT)
X-Received: by 2002:a05:6a20:d70a:b0:3dd:85a8:4c5e with SMTP id adf61e73a8af0-3ddec6b6f00mr286676637.37.1790062062435;
        Tue, 22 Sep 2026 00:27:42 -0700 (PDT)
Received: from hu-ekangupt-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144f29d88afsm2788471c88.4.2026.09.22.00.27.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 00:27:42 -0700 (PDT)
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Date: Tue, 22 Sep 2026 12:57:36 +0530
Subject: [PATCH] arm64: dts: qcom: kaanapali: Add memory-region for audio
 PD
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260922-knp-rh-v1-1-35e29b104809@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAOctsmoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDSyMj3ey8At2iDN0kA0uDNMvUZENTcyMloOKCotS0zAqwQdGxtbUAGZb
 42lgAAAA=
X-Change-ID: 20260922-knp-rh-b090f9ec1572
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Bharath Kumar <quic_bkumar@quicinc.com>,
        Chenna Kesava Raju <quic_chennak@quicinc.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790062058; l=1422;
 i=ekansh.gupta@oss.qualcomm.com; s=20260223; h=from:subject:message-id;
 bh=cydy0LF/RZKM9IAo5HRsLZwewvOr1al+EwNdfV2VZxc=;
 b=Me6NwNzG32slmnYKeA9fRPtVLegjIHa5jDCTAcgaCQG/fJwwjaqMKO2XFcaFl0tjSR7BFB+RK
 viKZYQfhqlICRl2pYRYb4lqogOlwsASj0xh151Le2AqWY93l2ovC8xA
X-Developer-Key: i=ekansh.gupta@oss.qualcomm.com; a=ed25519;
 pk=n0SepARizye+pYjhjg1RA5J+Nq4+IJbyRcBybU+/ERQ=
X-Proofpoint-ORIG-GUID: yeorlfV2LVUQJbZAYzxmFA0YpC_eHzIu
X-Authority-Analysis: v=2.4 cv=PZhqFShd c=1 sm=1 tr=0 ts=6ab22def cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=ecT6ZAH8srv0KshgsUoA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-GUID: yeorlfV2LVUQJbZAYzxmFA0YpC_eHzIu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDEwNSBTYWx0ZWRfX8AhqpWrfTRYl
 tLsg5yilz8XU1pz7kx4wnO1i7MIhHQxwX7ezgoFkY7LDYQXBdzI2xehuh/CeiyJvFhy/RootPlx
 scQfI8JFsDJ9FeiDbEQvV+7XIBiqjd+AG0EK7/KldIVeUlNmiGlIurxEisUdfOrJgLoSLLRHBjm
 2N8DGZj4FoUPGrf0Cr4yQbCEO8H93+VuyqaiMSPYKEds7caA/nnSh8nn+yZRRL3UR9ViUtQ0jqt
 MFQXLx0Rvlwr+TpNuOLx9FE+//YLg215mM4YN1S1Dlohf7Xf81FvzCWBnZCSLHv9vgsVpcG7wxg
 Sg4ff8X4abbiJ8SMXie3wmdE9DGvCq8bx8aSB3UK60SGQPEOwhvUPtB+BjO+mLt9OjX59V8hvVV
 kpY3GjaEXWMeYwBHVZryJo7TsFzTHQOvwEsf8SAOU+uED4Cj5vVZTFM5hS9CCYtUpTjyOEMj7nO
 Z/MvcCuvM6mcjJOuO9w==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDEwNSBTYWx0ZWRfX+y8mhYC6dcIZ
 hmJczoddNQVfKTYlkDszbV8fsK1YtwYxLZrAUzWH6D5kT1SSBkRXzmPFnujFzYh6wIhIexkm52K
 MgNZBeT+uzRKIMvokBqq6sHc51lTZmk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_07,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 spamscore=0 impostorscore=0 priorityscore=1501
 lowpriorityscore=0 suspectscore=0 bulkscore=0 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220105

Reserve memory region for audio PD dynamic loading and remote heap
requirements. Add the required VMID list for memory ownership
transfers.

Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kaanapali.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/kaanapali.dtsi b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
index 131fd2a16c54..f79f7679de02 100644
--- a/arch/arm64/boot/dts/qcom/kaanapali.dtsi
+++ b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
@@ -451,6 +451,14 @@ rmtfs_mem: rmtfs@d7c00000 {
 			qcom,client-id = <1>;
 			qcom,vmid = <QCOM_SCM_VMID_MSS_MSA>;
 		};
+
+		adsp_rpc_remote_heap_mem: adsp-rpc-remote-heap {
+			compatible = "shared-dma-pool";
+			alloc-ranges = <0x0 0x0 0x1 0x0>;
+			reusable;
+			alignment = <0x0 0x400000>;
+			size = <0x0 0x800000>;
+		};
 	};
 
 	smp2p-adsp {
@@ -2755,6 +2763,9 @@ fastrpc {
 					compatible = "qcom,kaanapali-fastrpc";
 					qcom,glink-channels = "fastrpcglink-apps-dsp";
 					label = "adsp";
+					memory-region = <&adsp_rpc_remote_heap_mem>;
+					qcom,vmids = <QCOM_SCM_VMID_LPASS
+						      QCOM_SCM_VMID_ADSP_HEAP>;
 					#address-cells = <1>;
 					#size-cells = <0>;
 

---
base-commit: 5c4d4169604b335c38bbc79bc1fc03042981fc6f
change-id: 20260922-knp-rh-b090f9ec1572

Best regards,
-- 
Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>

