Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 228D1478E5D
	for <devicetree@vger.kernel.org>; Wed,  1 Apr 2026 18:35:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775068534; cv=none; b=X6BGem6OrHXXifCUEfqsKoWfza8iqjtOHv8B8otNeQkeWk+X+UvoBOGC1uw4DRvKv/Nn59hF5BQAlBsOlLXu6qHKer0tFIiMGn4aYurlYOZluEFqS8aRTsZUi0/XUJaZBaQx/bQr7w8pQ+q6pA9RpFqEmFQrSfTkw8CKbBGnGZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775068534; c=relaxed/simple;
	bh=q/a+1Z7Bcoh81uB7j3ETlggSbfC4HP7SGQcAffpd8GU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=krIb4XohbrM5kk6PCsjRiwSWQUibmE+cZBCyuEpX5gpDrwtauU2a688DcGF+bONolszxT1zk8nhYvUCSHB5QsIoHSOMmFID3X6vBlDVFOCv8RVQy3eVHlbiWoo4GeVF9ZFTs9moKwNJTn2yYJs3XntTQ27ykdTEJDdRsebZgj5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CA5+D+Pi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jVBOUpwE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CA5+D+Pi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jVBOUpwE"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 631H32wJ3363999
	for <devicetree@vger.kernel.org>; Wed, 1 Apr 2026 18:35:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	buEWTnY1y0nTx16HX/xpkC0Y9x5VrlhbmSN6bfTQ5eY=; b=CA5+D+Pif2Ko5z7w
	rB/8BQRE9behSlH5Dy3ynWvODIQ6ENfhDIyjRM82J3SzLrrXejh7DYmBCZgEOjhm
	Uxhli7igbhcMJW+OE6Xzqi0Yj6nQ/4SQJYAoRBgC3jD9j3BobX67N3h7S7tG2yml
	oNK7Iv5XaZ84iJwdaVKtBThyrtWZ02AKVfu6ct2DFTUH6rdhRPxSnc8Ybg6uI7J5
	E4bykXUy8ZTwkhOWM9+FXIwvLwQLp5XhcunfCYRHBntHJ3oCFbKR2Tx+PzU4ugBg
	HxtWigmWcVykOpZEPMQ3ONg18Ae0tPomTIja5kPxl+p16OvvGTN9Fn+Oofa1Pmwf
	C7We5g==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d97e00a14-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 01 Apr 2026 18:35:32 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2b256ed2cc8so101675ad.3
        for <devicetree@vger.kernel.org>; Wed, 01 Apr 2026 11:35:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775068531; x=1775673331; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=buEWTnY1y0nTx16HX/xpkC0Y9x5VrlhbmSN6bfTQ5eY=;
        b=jVBOUpwEiwcb4coXUwY5938bsRBA8sQTtI3VDXVkeafMINva0WHjUMDRvRFmHVRhwH
         16MVnUIoeYsDKHgpMFuiSIk8vfyJZWqZturc6erM3br1sat5iWxjqv9EvM3NiaJDLorO
         TMLjafOcT1NdkMbtKO+1bpgkfo1gXZJNy1vYlkRyzykPYwPz0h8SbzLpjjJzZajzq8nS
         +Pga/nmNg2bGFwe7FVHSdv2j7Lol85zNrgFZehUiL0ZrpZyCjRvFofyNCetStVC8HaYi
         Hq0qEDnN2p2y504gP5lvTcdOAlP94nytVCW/YY0kKzCVj42arlKv7ij99SD8uOAOjfX/
         w3bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775068531; x=1775673331;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=buEWTnY1y0nTx16HX/xpkC0Y9x5VrlhbmSN6bfTQ5eY=;
        b=RTcDhoxZj3P1SD0WsB/RPbY87PO+lFE6Tq0VOcdo/w5Snjglrsoa4ZgMf4cSjPZsIW
         2G4pfxolnO2hI8jxwGbY3Rgs+pbDIDjKU1YPRxIOdEzaz2bN/I3g7cFiL7s5Yrv2lZgp
         uoMfDib6AH6IEcnRVVyJ6c0YVK/WzwnBJOUNfkQsjUxyk1bWuErRr94uSDZBat2uzee+
         TYH/4782svbVrTApB/BGs0D9kqckJRKe/hIMfm9ilKO+sl3lAk7kmYzP8KEeK+/9TSQM
         FwYPMrh25Q/d/OiYD7Gw8OTmSb8fLYHgWWwiGvEhrdEgK2Isu3pDH0YO6CYM0kHB/scQ
         F/ag==
X-Forwarded-Encrypted: i=1; AJvYcCXZOwfH2AFsK5r7t+5QfeAkLwmewmBGT3Lv8iT6/mCSTaEsscUv5y02gnJWpAcaDAV710aPu1F7cFkE@vger.kernel.org
X-Gm-Message-State: AOJu0YwFnYCxDt0ep2Y6PswlD4VWYOEankTVD8o+x/MS6/Vi4db85sxa
	kzYixVmTZafVSzcdKD+FurfxqkX/tLCQSKvkRyCctEjY+rD1RQ4/lJMczrVpL9+iS7aAspU0XxZ
	frtuv9HcyC1teYYDtirijPRU8UaLJ+0rzsBYL0ByEOZ91C/rH4c82eFtMmpez3Lr2AIOBp3Sb
X-Gm-Gg: ATEYQzynh7GCWdTDTTom+aZMqjMc9OXJJ/4gn+kY+cnYYJ2BdSJw31kTg7T3M0HQp9z
	eOU86v5yyMpFdor9a34Fv9Ar6IijsI5m3MYrhvFFxdofZX+kXH1myR/HTNAhb0AKQy3mRHp9bbj
	2aK2UFpvtBirdH44LZdZCo1n+5s/jOCl7q4ETQmANfy6VvdzOnpm1A9GTQtECGB6yuEVt37t5ER
	YV84TRev4O0BsKs4BM2CpyOWA4dEKHfVv/t2Xqp1QGoNP3yESLYaXLjnE9zkbzVGnc+2EPpJjCd
	utSEFzY7kniGZ+Fr3F+865U2FYMpUY+4okwOdWjD+CIPOHM1ih7GOsbkM2Y9cykL7chJWWtoIAd
	srDSHG0YaMmHLzN3fp/UYAjkVJSCL/e6fKgpKP30a4VCBNs/KQEzyU+A=
X-Received: by 2002:a17:903:40cf:b0:2b2:5be3:ba35 with SMTP id d9443c01a7336-2b269d224f5mr46611885ad.47.1775068531055;
        Wed, 01 Apr 2026 11:35:31 -0700 (PDT)
X-Received: by 2002:a17:903:40cf:b0:2b2:5be3:ba35 with SMTP id d9443c01a7336-2b269d224f5mr46611655ad.47.1775068530613;
        Wed, 01 Apr 2026 11:35:30 -0700 (PDT)
Received: from hu-kuldsing-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b27497af47sm5717965ad.42.2026.04.01.11.35.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 11:35:30 -0700 (PDT)
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Date: Thu, 02 Apr 2026 00:05:09 +0530
Subject: [PATCH 1/2] arm64: dts: qcom: kodiak: Fix ICE reg size
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260402-ice_dt_reg_fix-v1-1-74e4c2129238@oss.qualcomm.com>
References: <20260402-ice_dt_reg_fix-v1-0-74e4c2129238@oss.qualcomm.com>
In-Reply-To: <20260402-ice_dt_reg_fix-v1-0-74e4c2129238@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Eric Biggers <ebiggers@google.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Authority-Analysis: v=2.4 cv=fdGgCkQF c=1 sm=1 tr=0 ts=69cd6574 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=bhJ4FvvW0HhCVhu0n44A:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: UAiFW4MSBJZQ05D1EzczkYg5K4yNBoRY
X-Proofpoint-GUID: UAiFW4MSBJZQ05D1EzczkYg5K4yNBoRY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAxMDE3NCBTYWx0ZWRfX7K+wCUDONQbt
 Cp3pBqu5AWERNTmnLGGAYrI7A5sRWdXA1Z+/SYt4ekFj8UyxvS/leiwmevek04mI6TFEGUWmM4A
 xiX3SFD5dZK8luk8nyBfGo0qopZvhBfM5DELQT6Bk32wASk5Rwj8cUFT27TKDhuCCkfvnOVBvBB
 kJgUa8ec9x1IFXb8K91Akh6yVAc6l9shduHp1OtRK6r7QLaVcNVN/QLoFqvipiNiHebt6tkummM
 0t7+8HzsHUnAxJu35BFTd8n3KgNXko7zfLI3KFSt4rbs2naTY65gl9XtCzxKoLhaj9nOZ+V4rcA
 WExGBxQgcMn5MqbwpArDSHaUOMZTVOMRoumkoHzwDqAGn5w1r5LYRsRNK1m1Y6dyI95l3EJEJFC
 TCvj+u8V8Egrw7YlkNqDVIC4sUWYM9EhUHJ1mmel8JrevGriUtQu4B7MnCIaRl0mMJSariVTxyZ
 MdqDzo8ewRAGPa7CGsw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-01_04,2026-04-01_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 adultscore=0
 malwarescore=0 impostorscore=0 bulkscore=0 phishscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2604010174

The ICE register region on Kodiak is currently defined as 0x8000 bytes.
According to the hardware specification, the correct register size is
0x18000.

Update the ICE node reg property to match the hardware.

Fixes: dfd5ee7b34bb ("arm64: dts: qcom: sc7280: Add inline crypto engine")
Signed-off-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kodiak.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/kodiak.dtsi b/arch/arm64/boot/dts/qcom/kodiak.dtsi
index 6079e67ea829..ed8361f79e28 100644
--- a/arch/arm64/boot/dts/qcom/kodiak.dtsi
+++ b/arch/arm64/boot/dts/qcom/kodiak.dtsi
@@ -2578,7 +2578,7 @@ ufs_mem_phy: phy@1d87000 {
 		ice: crypto@1d88000 {
 			compatible = "qcom,sc7280-inline-crypto-engine",
 				     "qcom,inline-crypto-engine";
-			reg = <0 0x01d88000 0 0x8000>;
+			reg = <0 0x01d88000 0 0x18000>;
 			clocks = <&gcc GCC_UFS_PHY_ICE_CORE_CLK>;
 		};
 

-- 
2.34.1

