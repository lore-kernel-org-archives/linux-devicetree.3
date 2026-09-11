Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8683C42E8FA
	for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 06:50:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789109432; cv=none; b=uJvxLaJKd/JT9In4EVjsSGMYE5xF4m3P5FzJW1xOhFxA+PP3bQHcPyzhfzURXYP1yAA7AObElxwODhVuyPfb/pJ6VV9Wtr5A1xaJv8Y859I6PxdxdQ3IKwfaFdYARouB9b/2+DX0lu8BGOZkEi3OLal6oC9kR4RVH0NwjShXpvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789109432; c=relaxed/simple;
	bh=0nSubABOl50KaksCNtOqy0MS4fyrCmthWTVYzde5yzg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kGYWxz1VIMv7+P/tGETFpZ8O2rBxbFA2MWKoJNZudFY/ahStGgGHhYa1RYIEEfCW1YKsN/3p2GtyUWVpXC0WCm3asBQpjG302IIAGqSId8snzFDxF5UCUMsW+k/8e0kE0BJkIgRtTAsmBbwTVJguOSjPmhwy9Mcu4xvYO/WlntM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Uew2BQOh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SzoZ8PTG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Uew2BQOh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SzoZ8PTG"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68B6kY8s3709595
	for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 06:50:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hrW4H9N3V6allMPxCp8yjuEFUdYwfNcJpCFdVTtpxmU=; b=Uew2BQOhClnVOOro
	WTT0ov6lttFniYi2MItuUBKEUMWiEVfSEV8/kGKW2d+l0csMsWsUwX9I/y8xgy4Y
	C3leuRKF7lq4uyNCnLL4AZWFLPlSZXaCwSevCCgi5YczZLRYrxSnHRLLh1pzGgWa
	BVjUCxfY5AabQ0plpumR9SFnXtE2Y2jq/CqkR9NcXuO/YoHDaVagPKW1C+BWgVqG
	qe/b+HUufp1K6R869OzcK3ECSDhTTCIuvzMq8IkvQnop1BSFbs7kophymTzek8vF
	d+orySlt7HjD9/Vilw7FLQkOglqT0fnBVC+pXdPFyDOUWKaK7oXa1rersCrrj62R
	0DURiA==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gm5q41he3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 06:50:22 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cc1b80835d5so731692a12.2
        for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 23:50:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789109422; x=1789714222; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hrW4H9N3V6allMPxCp8yjuEFUdYwfNcJpCFdVTtpxmU=;
        b=SzoZ8PTGRfZjFm26rUIhX5IVq/xRcXepfVrbc+U4wWfMFaEcsyMm93vZ+tyqePz3QR
         1r1C3paRGiHLGjse1FtdFXatDZGQl4I1g/75xVTsYAiq+fg4cwX2oXcEgAANYe0Pamb0
         2dbJ1hbr8RbZncVP7U3bfWvrU4652e8cx4CNXPolnqv1g10eIJ6bjQY7kwdNvioCthcg
         MfEHKKyp8trdyAySXe9oGN+C8Xl2YaY/Dm3mRShuYo8bEaO8ou+wDjTlgY/7wX83fOSH
         sZXBW2NMnhPLZ4885NIefGfxzYcdfXwI7HVvoCqJl4ZghaAeeLFb1Q0Ej2MCV/MyIPDy
         eNNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789109422; x=1789714222;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hrW4H9N3V6allMPxCp8yjuEFUdYwfNcJpCFdVTtpxmU=;
        b=Lc/REDI0QEvSdY1DUvOGeETsIC/fbF72F8bNRfyJxK1YkfXqSBu5FU4JyzFXgFaTRd
         AXi5D/f5Ve+/75/BVu8If5/9rwsNFYp8SMPA3Qxo1pDP3tEvWiAzW5dsrqjCncVXEJNf
         0wAslpSLnpFdOpORd/dFd18wfkzjkKJov7aIe22LY1VfE8DFbFytRs8wxaAh0H4lQE9x
         wMlwubbr87PrGQRyh6qOcfKiMcRSUbI0hIV5JtAyQEj8cnYAnHNHqxflaqrIfovEmebo
         XMeTqWRuCJ6drqHE+QT558yV+RY9s9XUer/iZywOSsNSS5hmp/g8I0WfANi5qjLFip9S
         Fqvw==
X-Forwarded-Encrypted: i=1; AKwUvBwz9xjoV51PFfZifEH3ENyZ9UKKft+D072LgfYRPiSlh7XxJMGcsgzP+Ckt+nsBhuTSVU08AVwvR4cE@vger.kernel.org
X-Gm-Message-State: AFuF++kp9jnjtHvm5wK8YFSshylh+9pOnHqbTFn8NStrQoRNTQ66uN94
	KQBkbwtfZEqoVBDssC3KduO8JK3tBkpe9D6HwR4fVlNnqjvPQb1p8zUUsY2DX73yYsAephoSsCd
	DK4yQw9G65e2YKuvxUnJ6RbvWfHqeRobzI7LPXfHGfBz03TLsnQQmlpH+gnGwsYPa
X-Gm-Gg: AYBFou2NVqzTyqpOdwIkuFNDWGAJdGebmZPNGX4fgawnvebDSOLRp9b+lMhtV6zgclL
	c9aXCz2WQVQyMNs4WId3M7jKGZZKCbsVRSxofyhpL6HweusWpyeHAYZygdMoFy1QwDQeBsuGwrH
	CQi62voXwaFupGJ40c+ONeROZQ13g7oXTZiCHBqHOiegDLKs22E5UHdEY6DRD2+bMNDYDD0AYpW
	g3x134R2F5JxtQ0i8JdnifTK62qtILkonttvrOo/JzKbgD15IhtuekGv3kkAULoXhQy9fIhhgav
	JOqsXyufaqPUXsL4qG27C8V8V6u9IM3u8lk51yqYzIlAYYvb3fYSry9m8KpemS/bQHABwFGENNY
	UMgyCpERX228eDzwqRiokhPMlqbrwknm67Y8=
X-Received: by 2002:a05:6a21:4cc1:b0:3d1:deec:9265 with SMTP id adf61e73a8af0-3daecff18b0mr5259945637.6.1789109421982;
        Thu, 10 Sep 2026 23:50:21 -0700 (PDT)
X-Received: by 2002:a05:6a21:4cc1:b0:3d1:deec:9265 with SMTP id adf61e73a8af0-3daecff18b0mr5259896637.6.1789109421492;
        Thu, 10 Sep 2026 23:50:21 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14365a598aasm3934383c88.1.2026.09.10.23.50.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 23:50:21 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Fri, 11 Sep 2026 12:20:04 +0530
Subject: [PATCH 3/8] arm64: dts: qcom: monaco: Add t-power-on-us property
 for PCIe root ports
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260911-t_pwr_on-v1-3-c9eee197d082@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789109406; l=967;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=0nSubABOl50KaksCNtOqy0MS4fyrCmthWTVYzde5yzg=;
 b=N7eDlp/BMLvTPMfBTnblNDCcWwm8rFLqd3xImtPM6MuqRVKEZMMsqnQZaMkr1eYV0JAZ23c8o
 kUJR454ixj4Cs9ZrApfgfNkzdSL1J30Vy0VSW5j8OAxPHdxopD5LTur
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-GUID: -MDSQ2bqnvFdKxMlytCrAzzkeJLcxfYT
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDA5MyBTYWx0ZWRfX5R+jDr1tgHJc
 Zg2a2fIlH+9CPpAinWybEeBqTQZ5CnSUdWwIdwlo4ZyvF1GnkgjvvBadR6wyNpj73Rf8NDeUfu4
 D2ryREMM9Dawz1JiRarDmrgg+xELHos=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDA5MyBTYWx0ZWRfX0WUXkoYSPBxJ
 V6yur1FkLeN5Fti3bINo0H1k+oVzwpBM/PVSziy1B0Cbn3upbn8VaDb87Rts8tcV/m3Eppa/1XO
 p3wy89OsdwD2bWlp4pMo+gVyw4H+R1EPxfN1rgxThRUvVQ2F3guH2etDQCULZlxD/tjhPlL0K+c
 PZ5UoXZD4XCUaqz9mtkvxV7lDA3cfzE3ztZj6746Dag0fbdV/wTXLrHSa9oxIDd4v+rRfBOeS0a
 cn6/iKJ/HKfOoJ31sbLH+vb1pCG+JoMHOBK5lO1+Ky0Q1x1v2TfERJdcNUXLxkl5yHLAz2Xr7BR
 bCH0ri54nwdzQYuaYgegAfZKxqcNwpN2bAbdfEz8ib1nqOOhgGpTuDMxr3vxJ0J20nQUbfviJK0
 26AvjbXciE8647srfY4Rlp/sV7My7mGeJNGKw7xwEpLnGzG2zunMPPv5O/xiEbOga7ePVy6FUJp
 Boh8Y9KaEuLMvCvfN9Q==
X-Proofpoint-ORIG-GUID: -MDSQ2bqnvFdKxMlytCrAzzkeJLcxfYT
X-Authority-Analysis: v=2.4 cv=Wsa+otfv c=1 sm=1 tr=0 ts=6aa3a4af cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=bu6UjZ7a5GH_BZZocUYA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_02,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0
 spamscore=0 bulkscore=0 impostorscore=0 clxscore=1015 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609110093

Currently the PCIe controller is not programming the T_POWER_ON value,
which can result in improper L1.2 exit behavior. Add the
t-power-on-us property to the PCIe root ports so that this value is
correctly programmed during host initialization.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/monaco.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/monaco.dtsi b/arch/arm64/boot/dts/qcom/monaco.dtsi
index cfe39f923224..d9c3669b5e1b 100644
--- a/arch/arm64/boot/dts/qcom/monaco.dtsi
+++ b/arch/arm64/boot/dts/qcom/monaco.dtsi
@@ -2402,6 +2402,8 @@ pcieport0: pcie@0 {
 				#size-cells = <2>;
 				ranges;
 				phys = <&pcie0_phy>;
+
+				t-power-on-us = <80>;
 			};
 		};
 
@@ -2593,6 +2595,8 @@ pcieport1: pcie@0 {
 				#size-cells = <2>;
 				ranges;
 				phys = <&pcie1_phy>;
+
+				t-power-on-us = <80>;
 			};
 		};
 

-- 
2.34.1

