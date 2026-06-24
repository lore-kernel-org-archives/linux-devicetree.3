Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3192B3446BC
	for <devicetree@vger.kernel.org>; Wed, 24 Jun 2026 19:09:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782328155; cv=none; b=RuXiJOFnaw4Py0EOgTLBpeoLWahXEq3H6em7F+TBIvKj+KYAHklZZ3VSTc2xXBHShLj4jLoLUm6LZ0X4lS1f8hILK59I4T5QqkhZKxKdVAGCPDRvCIxcVVkuT+LUuTEUuFe6D6EWKSsrjWHnWzojHfhrFPbc0tR9MKutmeWIvrs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782328155; c=relaxed/simple;
	bh=ugptK5yPWV3b0e5LxrA3hkpcXCBCQxYSIHBrFGxSoCo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=spk72HW0nX845y+PA8FUBBECVG27vMQCnTRqCOwy8ArYj2KzTY5lJ9snMivXZf1NCq/PTNfpHBWmscF9/cNmkvXES6pwBpAEAgEkgAiCxi56OiBd84VS1JKOoScnvE0Wkvcc5HrKqT/XId7P+lCng/SfQ2UG7g+as7Ol6zoENQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fi9H6CQK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=j4xxeLun; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fi9H6CQK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="j4xxeLun"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65OHjFRr3581000
	for <devicetree@vger.kernel.org>; Wed, 24 Jun 2026 19:09:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=cNfZ+GRBh+z
	VDTSEbAPJDe09lxxojv7nRV4D8SdviFQ=; b=fi9H6CQKcQGUgoLfvBtfXt6kVYP
	qMr8/AMOl/mxm9k2qqeqEtXweEw1nNg41+PyV4+K3CEORJuFraPkwawz6KF3p7WQ
	B/ZKc4kQiry61NQx4Dv5xa7hrbn0dGOE30qOcEBwYgXt5cyfQp0oodGCZn2lCo9C
	k7G8QopO9mLo4j4hkUi2Q54sr0ltHLsEo/mcPQF0ARHLDejRZp+uPFoXOFRJtEai
	m3U/rdDrcIeJ6E4Ni0432G5meden6jghjG7tP56ArBR5Y583Ic+5FSCLWycWWVSa
	aMwwSE+ZuxZhPJKfSugHlbd1BVkYv1FnyNaGUMyTEwjprnokeH187rXi9yQ==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f05aqbw08-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 24 Jun 2026 19:09:13 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-84240683a82so124379b3a.1
        for <devicetree@vger.kernel.org>; Wed, 24 Jun 2026 12:09:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782328153; x=1782932953; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cNfZ+GRBh+zVDTSEbAPJDe09lxxojv7nRV4D8SdviFQ=;
        b=j4xxeLunSQXi+APoR/5d8TqL+bny8yH9RZLJLW7z1lHxwA7FhrQdgShXF1B1XEbSsC
         XMiChYE3hZvHBrdGhg19pI+VJRVom/3djg+Gr5NZvFYSKrDCbIDmrLhPNmMr7Y8kOa8Q
         UkoTq8k4UpOaWDePAH8qOuMqKXJBkTsRSatxtsjS1yooZrvlKEeIgQICWgcDVc7W3AjQ
         UyLwdR2Wo4hBhQPe1tgCVFaBqCv6lysrk3ac6zAY+10nRhoJk5UoRuv+JmrN9uSwmn/T
         uHy3COWCSRNyoMkzRbQBN+Y30tHEc8am4Jhxm54N2Nt89qqdv6VxNXz0dKeVJ11TPZk6
         3cLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782328153; x=1782932953;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cNfZ+GRBh+zVDTSEbAPJDe09lxxojv7nRV4D8SdviFQ=;
        b=SOusycuIGIXtcn+eJTE8VuoD+lkx2xha93n16ElZQN2LoRrIeQ2NHd8G9S7BZNi+4u
         pRLtjzOPON5UhFkdqqz/eV5GN2VlR+76fgpV2fyP2c10LYN6svVPTrRl4DS4Dxu66I+J
         PjBUfXKd4NBvxbeaN07IBKEZjGlnwQEr4zglq3qMN8M2OUThHB7ODByTfWmExHAVGWMk
         myBYx0ULy/BkxTkFSrprHdJp2H8oZiUrisjUP+9xko/ahx4VcMADVvx3r7rMeVkjZw4e
         bUMW6RwXI/7twuMtjfXr7wWS4A3SsElYX0XGJnCgOEYVHUL5lVnUC3ggrxhEGEye0PX3
         Hq3Q==
X-Forwarded-Encrypted: i=1; AFNElJ/gXeM1aemoSWnsI2cainqheHOHO7p1VbEIf/dcFS55afW5QFyawsYijFoSzfx4yoOof8jNaIHDP3vU@vger.kernel.org
X-Gm-Message-State: AOJu0YxFh6bH4UbNUUe1qI3YQFmqgjtqBLrA6bC969Lat4+SBvng3K5K
	P2QykBhs0YsGqzyIjJ4daZS5T7UuaQdTazwWBXnSZsPO1HVwG5uBJDQgve2UjK2aN5LvE2ePfgq
	DVnf+RB5c76g0pHXjAQuB9x7y5dHq3D1YC79BWt/eHBNDWE+yJxhVFVoK/lH/JTTf
X-Gm-Gg: AfdE7cmhHJPMF5aSyaxJgul7H+gHn5e2jKKgW4kySvHx7Nld5bPIvuEuN/HBtTtczc8
	dfI/rebdjORgvvKYTT0x+GUydDEnvoB8B4LgxSm01hP1MROsq5VDZyoQE1S0QBmOzw++uQcwLXN
	jDlC7u3CVmUBLEw1jR6Vgrb7WoAmNDYK46VzD2ttumSd5bCYJw1wEGDXaKSlwDDY/U/dlCqDqLq
	Y/VIZ3SEffyyoUkC2kP/wW8+Ge/UoMSfalAZaaxO0pd/YM+oq5MHyk7/UyCIRFJk+tRc0AUQeB0
	iP4g0hbCdQ2/FLFd+Mw+tSy2y/xSS7BDKrk7ahs7cBgUO4fxFmVCWOqDhydLlcs+bFY/50jdI3i
	KDra0Y1HDfO3ftdG6dIa7QnVyItbdIdpQG0VYiw==
X-Received: by 2002:a05:6a00:2e21:b0:842:50fd:4c13 with SMTP id d2e1a72fcca58-845ad1c0d76mr1665636b3a.4.1782328153084;
        Wed, 24 Jun 2026 12:09:13 -0700 (PDT)
X-Received: by 2002:a05:6a00:2e21:b0:842:50fd:4c13 with SMTP id d2e1a72fcca58-845ad1c0d76mr1665591b3a.4.1782328152548;
        Wed, 24 Jun 2026 12:09:12 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-845a412e5e9sm2932120b3a.54.2026.06.24.12.09.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jun 2026 12:09:12 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>
Cc: cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH v4 08/19] arm64: dts: qcom: sa8775p: Add minidump SRAM config to SCM node
Date: Thu, 25 Jun 2026 00:38:19 +0530
Message-ID: <20260624190830.3131112-9-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260624190830.3131112-1-mukesh.ojha@oss.qualcomm.com>
References: <20260624190830.3131112-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI0MDE2MCBTYWx0ZWRfXyX3I6rgxGMCI
 gGto+4d4h1E3J0YQPmJ8R+s3t2T+4XtSQhxLcRwD4AWbrryfuFrUPuQM5TH+f7nEkugZv8qUvfG
 /AdKtfOovHkrweTW0nOoFfFrLGhcuMI=
X-Proofpoint-GUID: 6FG03iMHf3TEYD8TV6cFDyLx4ORByiYu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI0MDE2MCBTYWx0ZWRfXxzWtllIFKpCc
 lW5GL9/gQD/mRxPjqH9Ain+ChHtOIsfUt1Gk+94dnGAOWgER0LT4U8MpkkFy98fJDi0QCswTlxt
 HpKxz+GnAl6eJox/nc+hf317avewDW7q/kPGxveFqAR2uEnyp3k4OP3EOBrMDlQlTUEecezdK5J
 dJbORCf7nk0IoWhJh2xXawF7G056MuiupuN1eK9D3RdIdYL4+d3mOnHvlHCXrPC+h1qsMM9W1Ea
 8+NTJeRQzbYYdzL9/pOIyyrW2R6vp2ko+YWu2Xq9DiJKR7STUL8FMT5Wpz8s5I5ZoErDZadKNgu
 aq2C/+e00WdH6hBWQHczFrqkFIrD4koNE10scmSH9kvQvM3Ua0aiuB5J/zL6o2P6tMoHQYJl0wp
 RO6d4T9a1pO4UcG9VVliOF3/xEF41Q==
X-Authority-Analysis: v=2.4 cv=UphT8ewB c=1 sm=1 tr=0 ts=6a3c2b59 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=ih2dppi7jw4BXePuyMoA:9 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-ORIG-GUID: 6FG03iMHf3TEYD8TV6cFDyLx4ORByiYu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-24_03,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 phishscore=0 spamscore=0 suspectscore=0
 malwarescore=0 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606240160

Point the SCM node at the minidump config slot in the always-on SRAM.
Boot firmware reads this word before DDR is initialised on a warm reset
to decide where to deliver the minidump.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/qcom/lemans.dtsi
index 353a6e6fd3ac..a1708bd15076 100644
--- a/arch/arm64/boot/dts/qcom/lemans.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
@@ -524,6 +524,7 @@ firmware {
 		scm {
 			compatible = "qcom,scm-sa8775p", "qcom,scm";
 			qcom,dload-mode = <&tcsr 0x13000>;
+			sram = <&minidump_config>;
 		};
 	};
 
@@ -6825,6 +6826,10 @@ sram: sram@146d8000 {
 			#address-cells = <1>;
 			#size-cells = <1>;
 
+			minidump_config: minidump-sram@1c {
+				reg = <0x1c 0x4>;
+			};
+
 			pil-reloc@94c {
 				compatible = "qcom,pil-reloc-info";
 				reg = <0x94c 0xc8>;
-- 
2.53.0

