Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A223D3E63B6
	for <devicetree@vger.kernel.org>; Fri, 29 May 2026 14:23:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780064628; cv=none; b=AwQWClRrU1vneDZcKjzrUUyDWVczQhf71opJeB5z2ReOlxs35ovUkplmIy5Xw6HPoJky0iv7EF26SG0fPoDyosNqRP46lLwp+m66uv4R/+pyJcZWYk8GhtEsQ7+NK2N1Yhtyg/xoEKu3Iih6buNjGGRJ/UKWdESU4Dze2EmOlpY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780064628; c=relaxed/simple;
	bh=QT1O7JWZuQeCOEkAN5pFlabn2CCUVlrdoZ+6wOk2a8k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CyRa/0DVw6S0A3F41n8XoG1z3pLSq+tuz1wMcSszeRPIdgiUQpMuP8tGzghuKvcAWCVHsuNKQSTv5V5aPZOc2me+Pw4yNSTIglkmYmuTfMvmb4AVWweDQvF5Sa9uQ4IgIe+u/0zaOSwAv/t24Q7sza1fHes94Ha1OLjOW0Woy60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Mk7QoEWR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=I70xZUZE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Mk7QoEWR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="I70xZUZE"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64TDLDau4050788
	for <devicetree@vger.kernel.org>; Fri, 29 May 2026 14:23:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZJtPO6O5NeXjipxB9wGMsy1g8c32dTSOI3WAyDX13cU=; b=Mk7QoEWRFmFFlnxH
	gsw59ZwskhzkNdCuviiwzqi5jRs489LW9dCyWB0qA9Y45wwcKdmAME9NKjaBjIvz
	+FGrCIaRzKXJhyu1P/JONajDDo9KiPdqDgw89OGxRNK2pfhPmFLR2VIgrXPHx1wJ
	G8zc/OBR7ZSYUy7nP8dB9QLoMRNK4UWMDQkuY512a21WREKIkqXEUj7jUT47LZjD
	VjmHAQ9Nz2Fhw9MgvRPk6ySJIN5soYqAJCq6HaDsa/Yoa0XZ3LOVtRqGWi5IEbpz
	ULtwKKIUMbgXYcvuM+xfu/cVr/Bss0c4dGos8uI2HJ80H3kMk2AH5/rWRBV5Bnuq
	o0KOxA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eety54f50-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 29 May 2026 14:23:45 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2bf1dece2ecso11867655ad.1
        for <devicetree@vger.kernel.org>; Fri, 29 May 2026 07:23:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780064625; x=1780669425; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZJtPO6O5NeXjipxB9wGMsy1g8c32dTSOI3WAyDX13cU=;
        b=I70xZUZEa9eMx+mli9uSVejTh3aBPftaYUBTSiL4jjAr6rn+SHjCwjPkFTwkrOrCv6
         xDx+xmsJ/7PLAubbL9roxlrAnvyu+4aGkHiIavY/zOEX1N16rVFkGUzF/xlLXwHVlgdM
         agSGdIRTXROrMa3qF9o0GofHw7sPI5kZnpu2QDNL7GB4qTYQSRiSld11nexElwP1LOAH
         IvU1VVQRhRbwiLn9Z1SMJ4cJ+5BvhTTS0cr4zrzi5npGphWDA838r9tcz/RwcpjwhlMk
         lONPzc0O95yUt7pqNq+c/iHpJEJDDNQ5mAmTgSqlwgRkD+/qc9hV8eUMil6XNj6JkMw2
         HYTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780064625; x=1780669425;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ZJtPO6O5NeXjipxB9wGMsy1g8c32dTSOI3WAyDX13cU=;
        b=YoduMFnib7QDlLwVwUwsX3p+C/Xnr6Dp07SqOiDmBdRrAtE8iHFgXlWmusioLZNuvs
         CGdrs0i6OrCmZ/rLCp0YLbGs8H6lp7hvuqBYQR4ZJ1qVL13KnSPuVTgzWzs/jYCQFkK9
         CrrTo2Ql4m21OIPCCmhK604KkUH7NdeOqtKf4LXNUonCQ25YHYIxBoGrdFOSaJdEFz7x
         T0uTplmk8KbbSbklJv92WahYGzsAjkUIAICzgp5U6BuvG0fSWqmNCo9vZDYJErOZtehv
         Zce+OZLTU+KQX4xgAK5M3qjFFQCF5ZJAM36EnTWIe1uPYTdd+rTQllQnCLPgTIayN4iH
         395Q==
X-Forwarded-Encrypted: i=1; AFNElJ8c2ZM4Tt2H1XJbz7vd7h2U8ibFF2RrTgclLRRkx4CbSkAwq6IdnRJAwoxqp4Xop43+HCaUowJDTsJU@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9q9U1ISwaRQxBYRQ62AGMiQTehRpl8qcN3RHvK18hui6HCV36
	zwd5EZyIsMvRV74Br/AXaB3pIuwf/Et3x+dgVk3Y67sUL2Q+oYoDN9bs2sC7u8qW1IBydjvSUI0
	yOtRSQfn6M4rWyqvnwwolU0HTDBT0Dhp7IOZ3rytaUhKP+ZI8QQwlTnwYvXG4jmDpTqa1viPebt
	k=
X-Gm-Gg: Acq92OFCQsr5BIVbx35RAyVsstrNC5z06fXKsWIP37q3hJ+81OWRuUNLWhs1jK6yns0
	GzcpyegltzQhVVDkKAuJ62/MzHUrUO2vDnP1RxkFCKFvphqTKvpEc34kKH6t0yDFRBHURsFm01G
	d/Y/X7b/CBXkIaPWtFpB6xZjheHF//dDI0nk7x0KC9xrrvQqeoBlA4IP80dUseOjlqDlKY8UtXq
	alJ0e0jqVT36I9I2WCPD9+dfeuZsXybD0GxUOKgJ35IQ/Y9mZEXIKYsqCWgQ/REtzCpCmwSt+8R
	TlZwjQmeAn10Dy9snSe4tHvFTfKZBDVwv3vIu/qHiRuAdVtFJnK8jCe68vJURXLTbGJDT7bvyB8
	H7xN6PpZMQ5e6pyvdSC/koAON4jYAfY87QQgRAT71hzKg/r8137CVOOp582NiP0JwXVbu
X-Received: by 2002:a17:902:ce0a:b0:2ad:9b86:ddc2 with SMTP id d9443c01a7336-2bf3682abd2mr57995ad.22.1780064624550;
        Fri, 29 May 2026 07:23:44 -0700 (PDT)
X-Received: by 2002:a17:902:ce0a:b0:2ad:9b86:ddc2 with SMTP id d9443c01a7336-2bf3682abd2mr57455ad.22.1780064623889;
        Fri, 29 May 2026 07:23:43 -0700 (PDT)
Received: from hu-apateriy-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bf23c57283sm22013095ad.81.2026.05.29.07.23.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2026 07:23:43 -0700 (PDT)
From: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>
Date: Fri, 29 May 2026 19:53:12 +0530
Subject: [PATCH v2 2/2] arm64: dts: qcom: kaanapali: add reboot-mode
 support
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260529-psci_sys_reset-dt-changes-for-pakala-v2-2-1964ebf1924c@oss.qualcomm.com>
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
        Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>,
        Xin Liu <xin.liu@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI5MDE0NCBTYWx0ZWRfX2Ri+XJA+Uq/F
 GdP0u0xFpcNw9pnNa6rVlKtG52rNxPbNQeK45E19IGbPtqWaAiSVFHEYarKCnI5DGA2O03JeXcW
 ONoJFCHYEBejETuiutQWISk6rHtJ8nciwc9EV3auqxSN3fVNgFCTXHAu3fca24AW1nGct7sQArW
 F4UmiMwJ3VpSx2KHxzpqKWXKIQlJIUMzDsiaalFnm8xJnfyPV/gjnswB2G5GvZArk2IfcDjpJfV
 HiLzsaIFt2I1lCxZrzrPfeXaCXPQTC5bQH+2Doz3jVAR9Na+QbcmH54j0Jc+9Ke1FiPzbFYE1Yu
 g9/zFbcBrdlm6KAT6/9nfWVpXzCPgTcMGnTkZdxsoeYp0wTBo9fZ83pDsigmzokL8aTgNa2EwTk
 tnpiz4WQP3KApUgBlIbIqln16BfefFWBUJUbRHQODCGVJWaeiyRN9OauojUNDP+1a4+MzJGEHAx
 QdkUaCjWPO3X48SqEtQ==
X-Proofpoint-GUID: wdiYTNm5CeYnuN9oXW4Yur6Jnfy3UxJe
X-Authority-Analysis: v=2.4 cv=WaM8rUhX c=1 sm=1 tr=0 ts=6a19a171 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=7AJH4AG-BTyQ-FR_P80A:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: wdiYTNm5CeYnuN9oXW4Yur6Jnfy3UxJe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-29_04,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0
 adultscore=0 suspectscore=0 priorityscore=1501 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2605290144

From: Xin Liu <xin.liu@oss.qualcomm.com>

Add PSCI SYSTEM_RESET2 reboot-modes for kaanapali-mtp and kaanapali-qrd
for use by the psci-reboot-mode driver.

The following modes are defined:
- bootloader: reboot into fastboot mode for fastboot flashing.
- edl: reboot into emergency download mode for image loading via
  the Firehose protocol.

Signed-off-by: Xin Liu <xin.liu@oss.qualcomm.com>
Signed-off-by: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kaanapali-mtp.dts | 7 +++++++
 arch/arm64/boot/dts/qcom/kaanapali-qrd.dts | 7 +++++++
 arch/arm64/boot/dts/qcom/kaanapali.dtsi    | 2 +-
 3 files changed, 15 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/kaanapali-mtp.dts b/arch/arm64/boot/dts/qcom/kaanapali-mtp.dts
index 7bce5653ea74..6429d91eba62 100644
--- a/arch/arm64/boot/dts/qcom/kaanapali-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/kaanapali-mtp.dts
@@ -1356,3 +1356,10 @@ &usb_dp_qmpphy {
 
 	status = "okay";
 };
+
+&psci {
+	reboot-mode {
+		mode-bootloader = <0x80010001 0x2>;
+		mode-edl = <0x80000000 0x1>;
+	};
+};
diff --git a/arch/arm64/boot/dts/qcom/kaanapali-qrd.dts b/arch/arm64/boot/dts/qcom/kaanapali-qrd.dts
index 95dce0812725..85007e53c456 100644
--- a/arch/arm64/boot/dts/qcom/kaanapali-qrd.dts
+++ b/arch/arm64/boot/dts/qcom/kaanapali-qrd.dts
@@ -851,3 +851,10 @@ &usb_dp_qmpphy {
 
 	status = "okay";
 };
+
+&psci {
+	reboot-mode {
+		mode-bootloader = <0x80010001 0x2>;
+		mode-edl = <0x80000000 0x1>;
+	};
+};
diff --git a/arch/arm64/boot/dts/qcom/kaanapali.dtsi b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
index 63c828c80920..d8203b2dbc8c 100644
--- a/arch/arm64/boot/dts/qcom/kaanapali.dtsi
+++ b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
@@ -274,7 +274,7 @@ pmu {
 		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_LOW>;
 	};
 
-	psci {
+	psci: psci {
 		compatible = "arm,psci-1.0";
 		method = "smc";
 

-- 
2.43.0

