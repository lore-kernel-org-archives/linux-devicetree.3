Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BC3F3D4118
	for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 06:50:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789109448; cv=none; b=uKATUYU7u84YN2CIIqnVg2WJfGHQoyVBg53GkrZ/7479f7/ajWrPOwEaLO5phsqD94XULt7PNMBlto3XLZM+bw4CrnRSohpYTwn5fmGTmYpp5xRNNMjxnTTVwHW8WRFX3hlYLhi9EIKHNLG9SJAlcgd5kIw4aL6QGR1ldfXEHsQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789109448; c=relaxed/simple;
	bh=txGG2oCDNTtagJRUuKL7R0M8TEmq6WZ4snmJ7KrOtTM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fhY3gXv1FshHNSlN6BpPUBekphG23/yB1MHok5pp0zqXy0P9uHaNUGRgqjrRSDZdAaLbxSvCAgdxNWBpV832yOby36CVKj/+DOjJiycALOxVUyt3vw0BiGt86jbQLM+ONArOk0aQdhEhgTXQOeja2X3GGHBf5LnHLZBI1d6V3Aw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JkjAjRyS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QLnbdD+v; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JkjAjRyS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QLnbdD+v"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68B6kDoo3550791
	for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 06:50:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ANtucg0EPqGoGTII2koncEnIcZSyH5bQdGP8YNE3III=; b=JkjAjRySmffFlQDO
	VXHIVMUEHn1emnnNj6B3YirxHNG5acC4UjolydTYdJ6wMILANLlF7s7aHXn9loLJ
	RH5VUSA0Ljg4twb6zhr6+FlJD+FuhpfYFM4+JfXYQUtgykLmJZy4+4ZPiahlBGxU
	bnLGQwv2zBmlQ1U/Rw6ttUpQ/ReNx13+/6NbUu1c2f25I10uvDiRrQH2jI8LnOAR
	sD6FgcJrhUHU3b0Mu0NMgxQJ+mQygOGculji102hqXhHxLW0wigW/tdz/wnoEY1p
	WSoU2s46u5whjKSFTIqXMaCYUcLHIn6d1dp86cLMWFmOXPd3yzK1NdfRzfLpDxRC
	VySDXQ==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmapg0gbx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 06:50:38 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cc42a07d04aso637532a12.1
        for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 23:50:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789109437; x=1789714237; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ANtucg0EPqGoGTII2koncEnIcZSyH5bQdGP8YNE3III=;
        b=QLnbdD+vIG9k21GdNdFUO7nUZ89LnjGKBDrhDTsKHdFWYR1883512MTeqpMSLO6b3J
         nZh42W2Z+cqwPQsLV5w/wzA4Bijm0B6jv4eM1uezkLY+Xlux04+bStIcB77qLTVfn2bE
         4ud6yrZTht5Hv2nTxTtWT5XEy4HfW19Tu3UOnA+TAHDlJEgPmK7e+K5qH/YqM9wpJ706
         qkmEjoBZfWluqa4SNcfy0id3Vhgjg+q7zq70ipBiARh/IB/Buw8nRXKHMm/kJ45gGlnC
         LKxlp9XjGXo7EEs1UMhYWGoZLrYs2I4rlcvjXc4wyf98UIXZH6m4hcD66EZM9D5+IHXb
         up4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789109437; x=1789714237;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ANtucg0EPqGoGTII2koncEnIcZSyH5bQdGP8YNE3III=;
        b=ZEAAc66co8p/R1lWwa8fh1jWY4moSce/Du+uBt4kUk7wOv8LkapoA1lMUZOLoYmnWv
         w9ogli3Kcia32115br0lCyEEfsTGpsllQ7pY8NbgXaT8xByADPI7bHoVf7WL3raMFn/y
         H7wZaQwTNje+ETITsblzoW0R5tStbCjdfnqQTkAAwJ6rcwNgtgSoW08DiYebduqpnUHw
         Tkwm9GWMryfOHiyE3AUgio9NJb8sUgmEkDG0EGvlIXt48erLdFsrs0dVWvDc4KIB07xK
         k85IkhkIugauMi60wJgswyoOsnV5yDfeDRc1CX/lTt5syhMWWLveDXJo/k6653+Vajr4
         TmOw==
X-Forwarded-Encrypted: i=1; AKwUvBzAckusWRH1ux0K0j1iLQs6LuxNhDjlxeI0k729B9QfCSx6jM8gFc41BZlBRyO+MRGyz5StU27Q/OFZ@vger.kernel.org
X-Gm-Message-State: AFuF++mMiVYIJGmw6z57XlhWzzTprOLG8RIlKrjd5shWsgJu2AhcrV6Z
	oOB3PW9ZXw60Zp2+vJ7kvyzuD3in7gTVKBAAaZE09w2tgzjtA8CgJg36A8Mu1+1D/DFylnp/KIg
	us5udIwTmK561l3uHk4EyHSKtAH9b3c9VlSaSAAy5YDgPTHdpcmn6DJa8nqQ127PVYG2BBTL4
X-Gm-Gg: AYBFou3JvgxvHpNuNiyibhBf3uuSNBs0+yXGpqiPCuL4VBbGea7MNZVg/Z5ajlpoWo4
	9eBiO3dc9+YpMxQN8gMzskX3o2vyKn4yWHb277H436nDoOs05r/fLlIBTO1GMxg0tpdCqvfmjGM
	b1FUxiaQjzVQR3UqOPy892hoSJWa4PkgPOg+JFLNsfJ0ijSafgGJqnnLaFS7oloRerD+2nT523p
	Xpe/DXnCB9kn93RtlYIMnfPt5mJGuNwbxr5Tyb1cyxd2kMWNwgYiWKx0V+lubXrdUI4SJ+QyqOJ
	nTG8grvKgs2gSO9vfCX6VXFHNAOdI/3a2ABEeD4R17wF18qgtPGCxgmlRF00MzSOpvdLJUuO8ur
	k8RBN0S8wa+HRg7jCTzAoFGYLmHU1pnv009c=
X-Received: by 2002:a17:90b:5790:b0:398:9be9:ab8e with SMTP id 98e67ed59e1d1-39d9c21b847mr4640489a91.19.1789109437070;
        Thu, 10 Sep 2026 23:50:37 -0700 (PDT)
X-Received: by 2002:a17:90b:5790:b0:398:9be9:ab8e with SMTP id 98e67ed59e1d1-39d9c21b847mr4640449a91.19.1789109436629;
        Thu, 10 Sep 2026 23:50:36 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14365a598aasm3934383c88.1.2026.09.10.23.50.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 23:50:36 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Fri, 11 Sep 2026 12:20:08 +0530
Subject: [PATCH 7/8] arm64: dts: qcom: sm8750: Add t-power-on-us property
 for PCIe root port
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260911-t_pwr_on-v1-7-c9eee197d082@oss.qualcomm.com>
References: <20260911-t_pwr_on-v1-0-c9eee197d082@oss.qualcomm.com>
In-Reply-To: <20260911-t_pwr_on-v1-0-c9eee197d082@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, mani@kernel.org,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789109406; l=806;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=txGG2oCDNTtagJRUuKL7R0M8TEmq6WZ4snmJ7KrOtTM=;
 b=vQMF74YGhbBQLFZBTHDZQ2SyZkOOD4SMkSmxMAOBL9l0nh2ULEgi3dlQixAof9eMHrIfM5V/P
 lxdRc+Okj5iAYSfFBN/l96HHAF53FQ+Ofxm7zlHwPgdh5+CG4mZxTbo
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-ORIG-GUID: oBmAgG-aCh7ZmkyN2Gs9DH7j-YvKMCO7
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDA5MyBTYWx0ZWRfXyDJFOHz6OBh3
 MLULcJBx/9v369ZOSGor4K/1ItQTrd4yKPDDAVQuRcLDsZtsAd58QRn0F7H4zYBeV+k61gVSRsD
 2+VihjMQQX065UHJYQX/es0qkNvF10c=
X-Proofpoint-GUID: oBmAgG-aCh7ZmkyN2Gs9DH7j-YvKMCO7
X-Authority-Analysis: v=2.4 cv=DLoacCNb c=1 sm=1 tr=0 ts=6aa3a4be cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=bu6UjZ7a5GH_BZZocUYA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDA5MyBTYWx0ZWRfXzgLcpOWOmp4Y
 2B0goopuKplFMnnFj2oPxWnAAO9O5GOaFRyKE+SdNK8QkKLvaaTSyqOVbn1DL23WcxlIZoGgds+
 JcHYNQ0WY+o6wQM1/nv3exrADQiZrV5S2KjeTrEXmzAsMEN7N3gGeRN+uJPtMdXOl8JtXjNo9N/
 0s/0bXQpwM9wbt8BkQnYJIg7OhnrqXHe9dxHIEsA93xfMO2o4VLEcxJpJiSMBLofJTM1tPhfzXe
 UoFlNwgpdwR9c7wJYbuJ/eEewd0TbQcw7CoQo8V8U+ZkkmXw/ML6Xl/82DjyN3FYoR6krrMdmrx
 vL9qGFSvyWhpMm3p2E00Ch0iIjp3U7xHIWArfb88Ga9lIbmMlWhATseXH8Px5+aqbw9S1gtjUvZ
 fEIcWA23TCUfhJSIhEgr/Lix5M0I6zTw7TjeGB5sWA7LUnz6eZQBLY93/yd6tZrjtOTmSJ16ayz
 qZTjbrxG6BjZ29rzVZg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_02,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 phishscore=0 adultscore=0 suspectscore=0
 spamscore=0 impostorscore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609110093

Currently the PCIe controller is not programming the T_POWER_ON value,
which can result in improper L1.2 exit behavior. Add the
t-power-on-us property to the PCIe root port so that this value is
correctly programmed during host initialization.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8750.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8750.dtsi b/arch/arm64/boot/dts/qcom/sm8750.dtsi
index dd738d13df8e..bb57385678f4 100644
--- a/arch/arm64/boot/dts/qcom/sm8750.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8750.dtsi
@@ -5577,6 +5577,8 @@ pcieport0: pcie@0 {
 				#size-cells = <2>;
 				ranges;
 				phys = <&pcie0_phy>;
+
+				t-power-on-us = <80>;
 			};
 		};
 

-- 
2.34.1

