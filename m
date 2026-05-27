Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2C4F3EEAF4
	for <devicetree@vger.kernel.org>; Wed, 27 May 2026 10:11:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779876671; cv=none; b=adCfOtBuajcmlcorxcpQxMfHfCl3QbP3mGku5bJSFjweZwpbFpsf9Yo+WKQ+Emg5/obncBtwne2otz/+QsQx62bwit+Li0BNdQ4XzJ8OW33aVcXp3aHw9mi6iDPprMwdxE29rZLU9gyfo2fX6AloAfhiY7gh30Yb2fBcKKP8fsI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779876671; c=relaxed/simple;
	bh=4r+fMZ+uTTWyLCsWD42MPhWz3MsxRIxJ1NOSS/bbs2Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=A/ukc6bN9/6yJvd9BatynAAxNftDSe8Aa9+j5e6cxgRpna02h68wv+tmtioVkmzDQzbk+4yQ/EjGlmoMrlVLtZ8Acwpl6n2+A9kNKYjgIFyk34ja8SGFuYuBHNhoSOSzyd9PshLlxHWd1TyjBnRGMs5qsMsxlUW6LjpqJkXQCGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Db4qRlFH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OmAZnSiz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Db4qRlFH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OmAZnSiz"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64R8mYjx1176694
	for <devicetree@vger.kernel.org>; Wed, 27 May 2026 10:10:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=QEmRa+wZA/TpInOzisybYp
	tKK+tTZk+GBFYtMogBbk4=; b=Db4qRlFHpjzjgtAVOftdwE3isYFecjagMkYfV9
	b/il5moeRYeWQR72RY2dAX6Wja28b3xrvaaCjPi7sSdktJ1w9RL8f0NqFG2h3DYE
	kiE9AB/K9GwlBE5Jcr1kakMi8DU0UsrhTKmEv/7XcRTf/Vtj7FbR0rPWujoJuqKr
	kQSY6RGhbG+hlp1pGh324t1ceJgouFTaVZBm+BgC3Ru0PgpA9BEG1j2HXYXxukZ6
	RF8MQW94VLfyMILx8PxTjh245jw4S6HN6gJg49gi2xZ2h8Id8+yMvAt2gL9Rc29j
	U3OtFduYMHozH9X5j8y2zLk8FQNNe1ZklKm7NBoXyRDJjJeg==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4edndnj148-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 27 May 2026 10:10:58 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c8276c91addso6075698a12.2
        for <devicetree@vger.kernel.org>; Wed, 27 May 2026 03:10:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779876657; x=1780481457; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QEmRa+wZA/TpInOzisybYptKK+tTZk+GBFYtMogBbk4=;
        b=OmAZnSizWc4lJM8jJp+lUNUS/LQ312oaWQ7uaoLInhds/skdDmn5puZ3YxN6FIBQXZ
         0gZK3KFkkCxZ0xSk56ODB0Oo/8yCt9uHxp3zOhimbZk10U+4F0e3IVRuUrIUqb/Sf5xn
         3rYEUYEuMwv6zeCRjzzsHM6OMNxZ21p9xC1wWY9As+BBtvTBDpErGLC643ynFZt/pX/M
         W4bnYpJDIT3FmeDO8ffF7EKA/DECCRSAxnIH5nDytCq2MeTfD2CsfJuCRUWKs9feeW+M
         hv70gZXzG5wVmHBl2zIo+QgXw7ZR8h7aZgCDdSwaeUjMhSXXOy+X4Lm+PpCFNlRf8zXu
         A/hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779876657; x=1780481457;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QEmRa+wZA/TpInOzisybYptKK+tTZk+GBFYtMogBbk4=;
        b=fe62f2TiDhRYIDPuTyVb/vEZrSixY++vF6w4/qLkQmGMbaBBuvm5LxwjfJ9Fpzg8QV
         dRjGRbkZ0/QxEoqa9pDLnq4lauAQiG5aCfN91yIv06tW2n02MHVj70aRtF66DTZny+2J
         x14L6HfH2IETo/PYFcW8WoIm8j3s8WgYMh/G927MaWCvyIDAM1GIWN+43clMrEmpNr/1
         w4urB0nRpiLI3GxVpnif+UdGQhqCsiO++pGuqmOa8MbSWnHPtqmrgBMCzknaauNs8cPY
         0yeyo/4pW0rKFYC+v2/FUibmJmsyPAiAeJ47qbNOUlUACtUppHfVkHwEgAuKgnz0Nb+y
         wDKg==
X-Forwarded-Encrypted: i=1; AFNElJ8xFALzhQqIWQ2duLiw0Dgr+UpvMTfRPAKQDFYMbrsY8tEGGOhn2ADoG+K14ZCeuW5++kFEfjMknOlN@vger.kernel.org
X-Gm-Message-State: AOJu0Yzl06OzuAC4Me/VhYqIdIfANj+OkT22UfHEOOrzPUD+ekclZAmq
	x0G3ue6PxY8myGYF7FpvbIH+a6gFUsucs6HTdeWzh6gm/lXeVtdv8tCfnWJLRu7QBN1MVwlLyqp
	b7AmKbksrC0qCdY12tV8vFGgxHtCM/t9dxT9op0PH+QnMzJ0iruedt7fJStW2CSSn
X-Gm-Gg: Acq92OFQojvjuSDy4iDjKwnUwVQiQF6QhOyyYKIz2/TzNjvR8bs3b2HudIzjb8VvNjQ
	qMX50nSTTAqSlm8hp68Rx8fyFSQdE2WhsMP3pBg/siBGKR46mvaUJRB+h9l1tL066kw1ueEq6AM
	ssWejyZkJKcfO0RxF6lSsXfg8/3blImbkWQWfmRVqq6SbfmDfBOvAcHvWE0VCRw5LMHCiZEkXLN
	+EzDE297xTjUwb/MiK+93vqNd9CLz+q4F6qALynmumQDmBb9nHNM8bB+rsJNhx2wnQ8EgPCfrM+
	j2ePxH+0xsLQHr1MQdoPaw4Km3h5iW+W5VxRnxL88tsed+NdEOkazyzSEj0n3h9kKto/AlvM2k4
	Ad/AZznG/ur6RiSJHYbJLLNZQ78h18rgVk+KcNk8YuzINv1hUUZjZkArz4PkW2yNYBJLdlQ==
X-Received: by 2002:a05:6a00:2295:b0:82d:556b:7a01 with SMTP id d2e1a72fcca58-8415f15a680mr21048079b3a.16.1779876657456;
        Wed, 27 May 2026 03:10:57 -0700 (PDT)
X-Received: by 2002:a05:6a00:2295:b0:82d:556b:7a01 with SMTP id d2e1a72fcca58-8415f15a680mr21048047b3a.16.1779876656974;
        Wed, 27 May 2026 03:10:56 -0700 (PDT)
Received: from hu-arakshit-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-841d70df178sm2441539b3a.42.2026.05.27.03.10.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 May 2026 03:10:56 -0700 (PDT)
From: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
Date: Wed, 27 May 2026 15:40:47 +0530
Subject: [PATCH] arm64: dts: qcom: lemans: Add OPP-table for ICE UFS device
 node
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260527-add-opp-table-for-lemans-ice-ufs-v1-1-3f97f5ce60db@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIACbDFmoC/x3NQQrCMBBG4auUWftDGkhEryIuYjLRgZqEjIpQe
 veGLr/Neyspd2Gl67RS55+o1DIwnyaKr1CeDEnDZI31xlmHkBJqa/iEx8LItWPhdygKiYxvVsz
 Op7Nh6y8+0si0zln+x+J237YdBmIfrnIAAAA=
X-Change-ID: 20260525-add-opp-table-for-lemans-ice-ufs-156d70e2696c
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neeraj Soni <neeraj.soni@oss.qualcomm.com>,
        Harshal Dev <harshal.dev@oss.qualcomm.com>,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Authority-Analysis: v=2.4 cv=PpSjqQM3 c=1 sm=1 tr=0 ts=6a16c332 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=XOz6Fnkc2SSDDoo3uF8A:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-ORIG-GUID: XeLYXvh_Epm_5R6zQ5zZF9eHL33iQCXg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI3MDA5NiBTYWx0ZWRfXxdAEbiPfS//g
 QPc7Wr/jS4E6CDe5+hYxbS05/EuOez4N85nWpw2EpvnhcuQ5xwhDVq7umb2GfE7rC2hx8s3huqU
 XeRk4OkGoHzhluR8CaAOrcDXwsSNy7NSmRk3xAiFZBOLeHCy9tVNax3sUIw4YHaG0n99kXbgzga
 vIwOxsnZ2pB1S84Uly25XDFdqb5Hhpb3CwP1VGLnCTXQ83TtzkKxtMHQCB9JZHufFSwi8yznq9j
 UPoaCHdxKKw/dDLU613Mmnk5C86I8LsF97Wz6oG9Gy2PTfKa+m3qkcfkRjPXKu26Svt7F1FXKyN
 850JZiHo1pRZPUh+YOQYdyYH76Zy9SYwU80n/LQK+FJ5geTHnuJOPwN0co+BQvo+r3i1+KhticK
 JF2Nx+lu7YrwtbILY2UENK8UvE9WDklaAoGT0PYNpRFpdoj8vXl56youhfiEAEb4dMuLnGrzmlE
 G4QS4HeaCvoOCGkyYIw==
X-Proofpoint-GUID: XeLYXvh_Epm_5R6zQ5zZF9eHL33iQCXg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-27_01,2026-05-26_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 malwarescore=0 suspectscore=0 clxscore=1015
 adultscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605270096

Qualcomm Inline Crypto Engine (ICE) platform driver now supports
an optional OPP-table.

Add OPP-table for ICE UFS device nodes for LeMans platform.

Signed-off-by: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
---
Testing:
* dtbs_check
* Validated on LeMans-evk platform
---
 arch/arm64/boot/dts/qcom/lemans.dtsi | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/qcom/lemans.dtsi
index 522ba43836a2425a8612506f5f7113f291f34706..43f96c6d3eb14140ef20091f5b25886c44fd5ac1 100644
--- a/arch/arm64/boot/dts/qcom/lemans.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
@@ -3109,6 +3109,32 @@ ice: crypto@1d88000 {
 			clock-names = "core",
 				      "iface";
 			power-domains = <&gcc UFS_PHY_GDSC>;
+
+			operating-points-v2 = <&ice_opp_table>;
+
+			ice_opp_table: opp-table {
+				compatible = "operating-points-v2";
+
+				opp-75000000 {
+					opp-hz = /bits/ 64 <750000000>;
+					required-opps = <&rpmhpd_opp_svs_l1>;
+				};
+
+				opp-150000000 {
+					opp-hz = /bits/ 64 <150000000>;
+					required-opps = <&rpmhpd_opp_svs_l1>;
+				};
+
+				opp-300000000 {
+					opp-hz = /bits/ 64 <300000000>;
+					required-opps = <&rpmhpd_opp_nom>;
+				};
+
+				opp-600000000 {
+					opp-hz = /bits/ 64 <600000000>;
+					required-opps = <&rpmhpd_opp_nom>;
+				};
+			};
 		};
 
 		cryptobam: dma-controller@1dc4000 {

---
base-commit: c1ecb239fa3456529a32255359fc78b69eb9d847
change-id: 20260525-add-opp-table-for-lemans-ice-ufs-156d70e2696c

Best regards,
-- 
Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>

