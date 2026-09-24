Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57B444A21
	for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 12:33:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790253202; cv=none; b=Nse7Zr61DzJsmarbROtbhI7rQdQHa5/JPkSpJLBIUVPvg73ag5wjF+BqJSVeU3/tZnsXIhenSszkwPgD8iL+8GrNMzAPaSETXZinGSw8Ffvv0bVmNIXGtcZhI5mD7ntgomyZVvqEAjPJsk96pK8n0POZOAK4CBNHxa3Nt4T2HbM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790253202; c=relaxed/simple;
	bh=BAn5aAgxV8jkvZUUVJzIoWcDo2Jh/DvgwG+zj1G9UHQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=ItP0csNurSlc3YZWhvaESRAKi5tmP6Fnofj4TvrSvZrrjcTGYX2UpEpegwEy+CBJYmn643AnR6qI2o9U+QmfRxU3aWgxbu9yHuj1gKALm7B6iOyZGxrU3rqkK5URFPyVb7uJDEypsiXtRINSpFi8py+Gaad8xj6xWMeOnL8wipY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=las+aDOs; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=a3lLnAGs; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="las+aDOs";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="a3lLnAGs"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68OC4SiE3282774
	for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 12:33:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=j1JhjxYMfO7BOGaU49ffGn
	g16NJOkOo+MKEHoAorM98=; b=las+aDOsuQhh9IozvnoicSZFgQ9M+0at4qgXtI
	RpDDpLkb/SMQWMxI14iRTVChMu9zSu5Fu+gRqQ/l9orFlQWCkvv6e02q1MA7bfbT
	kEN4ant2pFZtreB98f/UU9BXTKWUfxfMWymAXg26N9oy2k3EfAInq/uCjNk1OERv
	23nLpVDopiscrroKnxUsjDHOgH3hj7d3mRf3yr+vAwpVfE9CU16C6+FmdvkbI8Pc
	GnGuqxzN3XC64uULEx7ZASnDHJYicfRe11IXMxMVsFqPkWzufJ9U+7bDHfmJSDcB
	1IN+aofu+mmDvUpimcNqWCFSiXQpPSQMbo0wd68diM7Rzcng==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvstujkjq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 12:33:20 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2cee1ec30f2so21785295ad.3
        for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 05:33:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790253200; x=1790858000; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=j1JhjxYMfO7BOGaU49ffGng16NJOkOo+MKEHoAorM98=;
        b=a3lLnAGsVSU/pI8NkSLKR8WxAUNE/dn4qwZQT54YzczmVVuwJAw5Ptt5uA6SyPGGbR
         rPtF8hp2rnQS5qXpTTCVqdVSU49TWNjKro3TfOmVzfd43iLVNaF7wyHiyF2flMsmh11x
         FeCqx+3EwEKL64QaLznvvgNPkJVg3Kp961dO4TgvqzQ7K+ErJ8EOjr6jpa+Dw5nOE35U
         PamnF36c9an6yMHRj7adCEQBcNHqk5tj7k4ip4VONn3t/RURNbmRYiL5QzUiA2Mvy4Ev
         vU9X4uii9fWcdGJL+BVK97yCKqLZcHv1AG2gHbTHAbC02eo7gJhXPXAfVrfCbjNZCAyc
         JYcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790253200; x=1790858000;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=j1JhjxYMfO7BOGaU49ffGng16NJOkOo+MKEHoAorM98=;
        b=i4Ap2oIajocF86K+8QBADhdqzuvwaq5ggT0RK5Z0QcefuJhIdXeJi5ZzcuxL65qKpy
         nCp47h1QvhBmCEH9jw1QhyODo69RDGoj7tnbKEY4/Tsbo+vuRortKmpBmPKJzzvbZYgp
         N6hrV8e/X0uOW+jNW4iBXy4xof225bZdQ+sOUp7qmGJDgoMmgeb3mEFNPrUwLbxgIeAd
         a0lKpRbIshQgye/4iCe5M/w5muGj4Z44ARuVht0QKd612vXm0O/1uYWitdNXEjIClPCH
         XGkWY0JsA1ruxSuJ0yworsFTsJp8gx/X5ZMAPMlKykVQR52pMHtawG/eaZR4lIpXNa9T
         YzUA==
X-Forwarded-Encrypted: i=1; AKwUvBwoXU9m2OH+MypOJoKpeptwOcEtEuCWaMxHzVY09Dw7lbT/28+wR7nZaETYUr1I1ojZGRjW/9Pg6xIQ@vger.kernel.org
X-Gm-Message-State: AFuF++lzBRopeibG6uByQMAyQHLmHcAG6q/Y1XJCE3rj0aPQWEeNpx7m
	WHnLw+CyDX2PMyxzMoM8nEJTwT74DApLl0so1wvkvKzFuYV+ImnocKpdK/B7pwRZKL9dI7ZUz3r
	HliVIf2knk1mFyQbxxNLHZ+e1wZso/wan5RI3nluUnFJf3eC0TTd3RhWgjRastEHV
X-Gm-Gg: AYBFou2WQMoGAPKJ3V+tUOWI+dBZxh1g1dCaIHu2tRBOJwx4z4RBBJ5BMeHMb1TBgzc
	96hqXMVGK2T4KapO1NkjwzLXmjxvqsFZQt3XkuVEfN/jzyTHrFdW04277k9hbS/1x96RyDB1QkV
	KidzFRNOJ8aDqJpB4gZ8C5iKldcDjCVt4YNgBGfaAeEwLwr7Zh5iaLgtIYMPMXrYUTBmsM2jbv4
	htVRzkJKNYHlu51Klbor0wHbVOZf4JkhG1Cd9TqM5hPzU8OZNPWVPmesL6rZPpCmLmNO6UAfzcG
	mpXG23rjIyjUP1jhbDQwERmhhj6gMyrRz2kPJaR2A/jQOTT5QmyNkwMO8V+Pmli/aX3KhoZoXMG
	LI/EqaG8P58uEhw==
X-Received: by 2002:a17:903:1a24:b0:2da:ef81:37e7 with SMTP id d9443c01a7336-2df7de905damr19626655ad.21.1790253198429;
        Thu, 24 Sep 2026 05:33:18 -0700 (PDT)
X-Received: by 2002:a17:903:1a24:b0:2da:ef81:37e7 with SMTP id d9443c01a7336-2df7de905damr19624505ad.21.1790253193100;
        Thu, 24 Sep 2026 05:33:13 -0700 (PDT)
Received: from [10.213.101.118] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df6a5164c0sm26298365ad.6.2026.09.24.05.33.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 05:33:12 -0700 (PDT)
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Date: Thu, 24 Sep 2026 18:03:02 +0530
Subject: [PATCH] arm64: dts: qcom: shikra-evk: Add GPIO expanders
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260924-shikra-gpio-expander-v1-1-71929498ea44@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAH0YtWoC/x3MMQqAMAxA0atIZgMaqqhXEYeiaQ1CLSmIUHp3i
 +Mb/s+QWIUTLE0G5UeS3KGibxvYTxs8oxzVQB2N3UwG0ymXWvRRbuQ32nCwIg3OGUvzPpkJahq
 Vnbz/dt1K+QCK7gmcZgAAAA==
X-Change-ID: 20260924-shikra-gpio-expander-25ff4a29c848
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Faruque Ansari <faruque.ansari@oss.qualcomm.com>,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790253188; l=1433;
 i=komal.bajaj@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=BAn5aAgxV8jkvZUUVJzIoWcDo2Jh/DvgwG+zj1G9UHQ=;
 b=R6GAmqVgeX0epgeuCzE+91Oh6SxFUp6mRCOFLzKb9fMJuxMtjjZfFnpEIfLE6wpNywnt7KsJr
 ZLS64eUrRi0BaETNOW8AJcm3IGIOOzoTavVjlWLWzBAdNYQRZMdBa0C
X-Developer-Key: i=komal.bajaj@oss.qualcomm.com; a=ed25519;
 pk=wKh8mgDh+ePUZ4IIvpBhQOqf16/KvuQHvSvHK20LXNU=
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDA1MSBTYWx0ZWRfX/yvrV7EiCxcN
 YXYTFjyKkpQtctcS7Hu6xGseuC1b6QRM/6ynUm7tIi6bDSQtgUa4bKIamSq6Cz+2eGyPSFLrKrO
 24Od+figlAdPXWF24YqoXGyHLqfzVM8=
X-Proofpoint-ORIG-GUID: vMuGqLap4f_555azpG3_IQFTY8dOzWa4
X-Proofpoint-GUID: vMuGqLap4f_555azpG3_IQFTY8dOzWa4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDA1MSBTYWx0ZWRfXx2FBRCMpe/ZU
 r725KoyB/udOCRH3TOttYLz2juk8I1Or20sTXCmMadmswFccLhwxYvWR+xAkSxGJVvHB7YooLkA
 pTAKP/NG7p61sJ/uDqeqqSjoqwD7CHwSAmtwSffUApG3o3uM5OoYRl/7I10uSdDIqr/z9uWfrWm
 nwturIVo6fhd9H2/rOY/6K93Vj0jHEmLRYU8oRMO7DmxvNiLrcHpNTXvUws4r1arz5FcPqBMPHX
 N8tEufoFkukCN39SVsd7GiEAtO2a1Gh8Mg1j5Rm/7zMD4ZGkLId0ZeMlTYOCNDrscfRZ3VEmVqk
 gzf4OaTkRl0N722Bcc7I2VBqzH23xwLcR3UHGExjvIsKgy9ZibaHpAY0xiTUSBp8mjr2rMoQ6oT
 C7mkbnpKZNGHbpaRSyn+03HXycp/V/mP0T3vNvbkp71Qhf7Wymri8/cVyB4qA+xZz/4NcuXc85e
 wX210dqzsMww5zcYxsA==
X-Authority-Analysis: v=2.4 cv=cKp1IVeN c=1 sm=1 tr=0 ts=6ab51890 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=vI5slWehT91-5SZ2dYMA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 impostorscore=0 suspectscore=0 adultscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609240051

Add the EVK GPIO expander definitions on the I2C3 bus. Describe the
TCA9538 and TCA9539 expanders used by EVK boards.

Co-developed-by: Faruque Ansari <faruque.ansari@oss.qualcomm.com>
Signed-off-by: Faruque Ansari <faruque.ansari@oss.qualcomm.com>
Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra-evk.dtsi | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra-evk.dtsi b/arch/arm64/boot/dts/qcom/shikra-evk.dtsi
index 0115fc9095b3..04faf09b21ae 100644
--- a/arch/arm64/boot/dts/qcom/shikra-evk.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra-evk.dtsi
@@ -29,4 +29,32 @@ tpm@0 {
 
 &uart0 {
 	status = "okay";
+
+	expander0: pca953x@38 {
+		compatible = "ti,tca9538";
+		reg = <0x38>;
+		#gpio-cells = <2>;
+		gpio-controller;
+	};
+
+	expander1: pca953x@3c {
+		compatible = "ti,tca9538";
+		reg = <0x3c>;
+		#gpio-cells = <2>;
+		gpio-controller;
+	};
+
+	expander2: pca953x@20 {
+		compatible = "ti,tca9539";
+		reg = <0x20>;
+		#gpio-cells = <2>;
+		gpio-controller;
+	};
+
+	expander3: pca953x@21 {
+		compatible = "ti,tca9539";
+		reg = <0x21>;
+		#gpio-cells = <2>;
+		gpio-controller;
+	};
 };

---
base-commit: 3d7783543c2646af69ad65825e810060494bea21
change-id: 20260924-shikra-gpio-expander-25ff4a29c848

Best regards,
-- 
Komal Bajaj <komal.bajaj@oss.qualcomm.com>

