Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3409D355F42
	for <devicetree@vger.kernel.org>; Thu,  2 Jul 2026 17:23:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783013013; cv=none; b=g1y3/kXMD+eBrALSsp2RcmOEj2APJhl59nCkoWIej0x84FZf2Iqcp3brg76Z+EmlpKQRnU0ESg18PxrDttLEHDxDUXRAJE+JlsTM7X9wbKUbG5blj0lz0MY/RO5FoNVwKLVAoXtY7mrEd7dTTMpZXCqnvuKZp3hkaPJsZiY+eTY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783013013; c=relaxed/simple;
	bh=f1kW0KfbOBwzfyvSB6qRsv0wRsKse0k48GBqyG+Gu0k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qNSmbyAQXCzVSqss3zRiv16szyhkQqCPE+Z5wBCBLKSfKfRpTz81Xg6x2rDa3IQHqT8L6XPF0SnDiH1cN6y978jFb2/SLl92e7S9aBQ3pDX/egCK9AXwWlUF8p+IS6Izp1/qHQ9uYwS0izyps2YGJMni7oO8wbItU2wrM619Vp4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PD/G9MX6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aa+ibTxH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PD/G9MX6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aa+ibTxH"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 662E3TDX623099
	for <devicetree@vger.kernel.org>; Thu, 2 Jul 2026 17:23:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4LjwJAfGIMwv4JvSBnxIJgWfBxcmgUQORx2Zd1CjIe4=; b=PD/G9MX6RYrFDIaY
	iKo0vYuQdqDFW3yDhh2meMjy1DPJkhVv5WGSETjk1F0NfjMwfArK3u38fL+YKzzX
	aLgtqeESvTbCrDJvZ8tNyMVjBCmYv8dOK/S5kbWI/lM32rwyyo+bcoSfWdg+xLpr
	tBmELcuEiUmpSsauDhiLxNu4p99cy5gg2D4sZhtiuRp1ugH3azLvNPnHtkeXJ7xR
	qZGt5dOIMg02UlssOkyEhtZMpclxfVkNgfmR0HwW1kI3O/g/yyqJSfD2z3WMJ0Se
	gOIRMKO+vxrnA8kaziAV7lgJjocaM6O3yZXaZlmJVLeQQLsi2V0mchekjzmjsrP1
	wBSIlQ==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f5s2511hh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 02 Jul 2026 17:23:28 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c88ad1558f4so2946092a12.2
        for <devicetree@vger.kernel.org>; Thu, 02 Jul 2026 10:23:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783013008; x=1783617808; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4LjwJAfGIMwv4JvSBnxIJgWfBxcmgUQORx2Zd1CjIe4=;
        b=aa+ibTxHvMxHUro+87PX01nYss19HbAQQxOFQ2dJyv1OlIEUeQll3ndk3SF/LHjnan
         SOt3MFL+ApMkqRwHmUSdQx/UqGg5pchV1GZg9yAGwYEEfBCQmo+3nV+eH5DeQ5nMLnml
         grTJ6v37EMg/QHMd4LkQDUeGmTS4SMnprQaCZkJMae5mnTtiqSGJmBXhjV/nNXJ8Kylu
         g/iVTLWl8JuIZVeGq1L4jQdqqmmGqLRNihvjdBnR3CqdIPGzLOYXBA+0M+q+r15LV703
         9c/1Mw+oO64qs4hkXS5HPmYj9/Olea/YinY7+XFADvrsLgcuE5eKXd80bZrD7ij34ODz
         5RIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783013008; x=1783617808;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4LjwJAfGIMwv4JvSBnxIJgWfBxcmgUQORx2Zd1CjIe4=;
        b=DsbmmA1vIfn0GWCO6V+4/avzKzB88d4eHYmV6pmv/bxsxfFKWvioTHrKxThmyTlRF/
         phZXG/bDrzMlHKlmM/YZAHsMw36RX35fZE4x2PxjnyZC9HkecuTMxQ0/2uMot11srZuz
         Sz0LEGvQjdro0v+FBxyAfc2PBx8BD5SuOvZ7FXj1t/GhFaZLnV9qKvcDMlunW+oocwoN
         VJhiyaK8vN3UG/dma2x/MRVnu+7PcK1WNa5RVEQfkeBdavUWnfkvLB9BhQkgduKA2kbs
         Oio8wYb5J2vB18ctmy7n/DNIJzZxqQt+EUzwIpVloghmcKUIEXo3bq52ZizT7AauKOEc
         I49A==
X-Forwarded-Encrypted: i=1; AFNElJ/Q6DdMgvnbkTGx4tQBlLro0Ju+NHPp4exPg7oRFMI/Tw85EIss84mwOryiaC8jtmfO0qrpvKpr2F8H@vger.kernel.org
X-Gm-Message-State: AOJu0YziI4BrUoEck693qIjWUjUuqT9APvIGEjPEJLCp8OKpJbFmeRJ4
	h3JNkcsiL1BphmBzekOeXyDHQvwTkNVyF1jzjKoJfXarqoJIpkufRem0vAfEdT1FmsKla2UIsN5
	mGqN5+H9i13WPfbmXifvyHeSX03yPYlZfgddi3VR2oO+PwqHMubb2fhxSCr13s5n5
X-Gm-Gg: AfdE7cmkFTEp52FLsmUJw3LdO4rqtk82eR19IM0Jd0B5KFwfNXIkTCWLka8EMd3XdgI
	RUFT8abIUQosyawIwkn7a9ZzFBFv7rd05hQqYIUzV2KdarcKZgVFDyt0Qj2vUENSKUrXWMEKzsG
	w5pn80GHjmavHFVMkhaFd5FMulOUtvpizlRKPvw90LCCUnQiEb7HPx2zFZKdEfDoH/WAoL6mUXc
	ibE0yUsfDqzsyirFUsgfub6tV+rpl4QeHANSQnr2AuAYs/JKeUB4A2DLmzhkOY0rDmsbUEVs3HM
	ZVFPAeu6AtWIwQJis+aBNysQ6tvHjJF60W19T1RCwHULKzJYCeIBQ1qkmWX8prWDCzPhdwFFZv5
	bULQC4m6BXCEJFs8JQT4nLy0cYIlg26vfsanwH27qk/2XSg==
X-Received: by 2002:a05:6a20:b40b:b0:3bf:b9de:854d with SMTP id adf61e73a8af0-3bfed2b3ad6mr7932447637.23.1783013007741;
        Thu, 02 Jul 2026 10:23:27 -0700 (PDT)
X-Received: by 2002:a05:6a20:b40b:b0:3bf:b9de:854d with SMTP id adf61e73a8af0-3bfed2b3ad6mr7932404637.23.1783013007223;
        Thu, 02 Jul 2026 10:23:27 -0700 (PDT)
Received: from hu-manafm-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b3ececfe4sm10564289c88.8.2026.07.02.10.23.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 10:23:26 -0700 (PDT)
From: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
Date: Thu, 02 Jul 2026 22:52:57 +0530
Subject: [PATCH v3 4/4] arm64: dts: qcom: glymur: Enable SPEL powercap
 driver
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260702-qcom_spel_driver_upstream-v3-4-434d50f0c5b0@oss.qualcomm.com>
References: <20260702-qcom_spel_driver_upstream-v3-0-434d50f0c5b0@oss.qualcomm.com>
In-Reply-To: <20260702-qcom_spel_driver_upstream-v3-0-434d50f0c5b0@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
Cc: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783012984; l=1091;
 i=manaf.pallikunhi@oss.qualcomm.com; s=20260206; h=from:subject:message-id;
 bh=f1kW0KfbOBwzfyvSB6qRsv0wRsKse0k48GBqyG+Gu0k=;
 b=wmK6qDX3jahgYWIrKjsQYC/RtdfcAAJm1MmeDtfPeAyOAiPjjOoPupWkQkcyQnN+kadpTsN9A
 OvcQXq3+n3EDEwVxHdkDs3UBzJBsu1Pj/kYJXmhPg9T20ItLaz3aIBg
X-Developer-Key: i=manaf.pallikunhi@oss.qualcomm.com; a=ed25519;
 pk=oZ3x9jh+FDyPwxHmCbyzEMQHMzKqrH6hUbbL7dEBe2g=
X-Authority-Analysis: v=2.4 cv=U7uiy+ru c=1 sm=1 tr=0 ts=6a469e90 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=mqSRqqF8xmN81XtCacEA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-ORIG-GUID: 0hTAo44lRrwKDwD5_jKikJC9MmR56TmC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAyMDE4MyBTYWx0ZWRfX5mqjpXibcI/x
 +2ipaSinSf6kOJ6dM196u2k9lKVqzNCo6vsxu3s7ECyw71LF2YvR0hGCciNbGQd8TLZf+BSGS9Y
 k1A5fPx74oIZHpYayUed8OeWK3gJOy49rPQaPAealEtKnibkCF/fKSwIj2EJn/y2dRQJmQ6YmhN
 exkvK3z0lExGNIM9Y9/9UZ3usnimplq/ZK1zTNfTBIcvMmmZ8vjSdfnYoq/QHvrp/mF/qRVO8S+
 6bWaf/HFJ8mcXqI44JH8GUxs6/T8US6B++QXxCUKMOQRknjFM5Kfsgtea69aRxwFCvrsnlSZRDn
 zuh5cFKfHvzcXwY9Mv1MqHoAhgAEMMM1peAJqa2Kn0vw5BeWqOQRt0k2kx5uZKBnLYMohkHV1qk
 TS1Y1AoEsCrh0ccR5sXNdJoDDPnokoUKo3ENh8gOyLvoK8SYIL3QyEuhlMXUVda8U4HMLnUPTiK
 mHsBSZhboOaXXPfihmQ==
X-Proofpoint-GUID: 0hTAo44lRrwKDwD5_jKikJC9MmR56TmC
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAyMDE4MyBTYWx0ZWRfX6tAFsxiQiV2/
 VFoTEvAQpXH4zH3P1gW7ribO/fUGX6I7WbTUoiUtMW4ptMP5RXmOqsBTAHtaTKWrk/+LNnsEHc1
 DFWrBburs5iIDTnAEMQEqFbeqnHGVDE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-02_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 suspectscore=0 priorityscore=1501 malwarescore=0
 spamscore=0 lowpriorityscore=0 adultscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607020183

The Qualcomm SoC Power and Electrical Limits (SPEL) provides hardware
based power monitoring and limiting capabilities for various power
domains including System, SoC, CPU clusters, GPU, and various other
subsystems for glymur.

Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
index 20b49af7298e..9c942db8c824 100644
--- a/arch/arm64/boot/dts/qcom/glymur.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
@@ -5045,6 +5045,16 @@ spmi_bus2: spmi@c48000 {
 			};
 		};
 
+		power-limits@ef3b000 {
+			compatible = "qcom,glymur-spel";
+			reg = <0x0 0x0ef3b000 0x0 0x1000>,
+			      <0x0 0x0ef3d000 0x0 0x1000>,
+			      <0x0 0x0ef3e000 0x0 0x1000>;
+			reg-names = "config",
+				    "constraints",
+				    "nodes";
+		};
+
 		tlmm: pinctrl@f100000 {
 			compatible = "qcom,glymur-tlmm";
 			reg = <0x0 0x0f100000 0x0 0xf00000>;

-- 
2.43.0

