Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01A413EB7F4
	for <devicetree@vger.kernel.org>; Fri, 10 Apr 2026 18:44:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775846656; cv=none; b=VRK4Wo6FMRu0qyWkM/0obL7g+mVhqlTj+NEu+RDbDxPkP9+IzjaBplzDM+g+Bcoj1Da+q3NULkU1dYN4Sedy89jMjM0eNC3NiXbKE9VRTPvMZ9AEioFSVH6/JjDZCYnEpIYunffe+HolCE004dhPyAQXA/Uiqi9czihhniJHQfE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775846656; c=relaxed/simple;
	bh=WqsQpn7s0ZV5h/zaMO4HrjGzk6E644Ti9dj88dVmfNY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Tb82WOcALMq0svzRbDQ5LULD0b4RTYWtnBsclkkJMQFnaIMWB4JCfDa7kIwVT/rMMBUisri42s+yOmEBj1SnuuHsWPaAUyLO4Xyqx1HjFpsb+EipYHvn8GCbjgQIorVQbOyB7PFLq5NKwhLZ5W2JANLYFhA/iRJjcPX59n3Dy3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=f+1unU9b; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YnYkCXmL; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="f+1unU9b";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YnYkCXmL"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63AIhhtj709117
	for <devicetree@vger.kernel.org>; Fri, 10 Apr 2026 18:44:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=V3rE52GS8C3
	mDxuji4MPgHRTXY0MLvScv2I3hFnriSc=; b=f+1unU9bMNJXmB1HP0/W+uS0clT
	Tz6i8fDp1aautou5eDy2adBVtFKfe2uDQXjdiEhIn0qvicgYjiF666rw3aV/vAfn
	Y8uZTWWDHSzfT59UOmCxSYDxQDY9pdY2MEWE9ZYgvBggW8XuW5JE+qgvA2YrcPuO
	S21UuZg2KWwQ0E8WoU17vU8BrB5AHHtz9MHxcW+WDVd2RhTqm+ZX8A97oDji4JQv
	PrxJuh0tvNFmWOKV354YtQGRKYx444PsfyHX46HHBM8wgi7SQgBv5Z/59kQSNh4a
	Bs355kFaYYEXFejm3fFmCcw3ynJNusOuTd0NYystOPAxpclNwFGKUCJQRog==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4deudj2jvb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 10 Apr 2026 18:44:14 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2adc527eaf5so17865305ad.0
        for <devicetree@vger.kernel.org>; Fri, 10 Apr 2026 11:44:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775846654; x=1776451454; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V3rE52GS8C3mDxuji4MPgHRTXY0MLvScv2I3hFnriSc=;
        b=YnYkCXmLJP7spBX7WGkaznjJQXyIX8yv5YVeMUYtaOa7B9cUb2ybGD9pFV6g4Xk6Ik
         cuoz3cH9CWGRUh0QMpdOJUag9ov0dQFY+n2O9WRkqEbsJOguykwS/un8HbRx/Qfu0pgX
         Y9N+GEvhkLLjOxJ5mmn/yvi6a39SYU0J+omPtBXln4gmrhemKqYmjv8q61r4iDB1Vcsn
         GDeCu5z3GR3qm3PF+N6IM3AVZaeUPfWJE2aEj/q9jnKIUORZHnqGEu/P4jo1ZyknATHB
         3VIFnY9HnVRGMhUsNmBRMoStJDGQNyuHDZHUXmYLF9d0LsXs7l8MlXRiiWDVWxHL0E9y
         v2kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775846654; x=1776451454;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=V3rE52GS8C3mDxuji4MPgHRTXY0MLvScv2I3hFnriSc=;
        b=E7PBTtmgpYMHkOeWXyY6C0B8RRUlVXu/OZ3dYxmrXTwHK8jtf5cdJnBa96Q0tYaQ46
         DXRi0AbkXdATPdk6pXYWPPPsddQITtVRBs9wkd47eyYlnoVEujvGSRaDlh3/B+658T9e
         8n3i1UEB3x+CJzfSpQxsyLevlIqmnGN26YWE5BHaxQ7Efdj0AmPi4H7YKx2SYC+8gzPm
         1P1o1E3Z8EA9NEikNiHZASqEbaIZqiQv+WLqlKwEgSXAxi/yXcbyGZWHhfp8+i3Oocdu
         tg70c5eM4BIZuY/BDJ0wGEeIyQojAHP9SHfGzIMRw6IEa9Qsdy+5KOCvTkaMHt0GjiRb
         Fs1g==
X-Forwarded-Encrypted: i=1; AJvYcCVHhvEh/hK9m4Hq2SqwIQz3W4/+sT/lZgFnxJlOpgVJmR5sB8Yt4e3MmtMEkae3us02GSGIxb5FoX3x@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8c0qbymIgV/rqNsNdqdvZKV7+uEc8/l/YlSwEiV+XLu34CKBK
	WtkVzXLs6rrmrQktXGmv1Z8lHptr+XWZJSKNDh0aWONvByKRYD0kr+xVT14wuBDfO4aKw88brZl
	FnpGVmgwqZyA9c4MJqtP74kJxq0WUBg2VMPHhAJZQq5M2GkkrOe90US687hkHwCwl
X-Gm-Gg: AeBDieuVQ2EJ2Nw6XYQlC3O1Veg7wEP12K1Y36VEGQEoOirNNRDQDmPM9s9B2EHP50Z
	hkRvrpbSx3DHYGUNbAJLSgRbR/YlMS98p+cYOJ6ytXzY1bDZRKqABboPJY3JPWdPgcNhsnlIMQP
	PQfWy+yBkAt1IUWfWAka6oUsKiHjwfdydDveNJ4NgY9O5/FT8rBE8FkJhs8+oTAowzp0JNfvi5B
	T/s6K//Yxe1Ubga0oMr+C7tsblsUUNZPPvuiNfxcZ+JezYy08uw4LFdDWTvoFn5M/8b3Nt9t8Jc
	aPcoTHBtKMLT0QvyXMPpClZ3RsIeJwoP3siEkKFa6q5X3BvRyW0YVZ9pm54Mn55km26CiuL1vDf
	Sc2Zt2vidjoiN/Z5NsvRlO2wyTG5+g5Gf/T9boZbY38ZYV5da
X-Received: by 2002:a05:6a21:6d81:b0:38d:ec8c:7e55 with SMTP id adf61e73a8af0-39fe3f18cc0mr5080425637.32.1775846653622;
        Fri, 10 Apr 2026 11:44:13 -0700 (PDT)
X-Received: by 2002:a05:6a21:6d81:b0:38d:ec8c:7e55 with SMTP id adf61e73a8af0-39fe3f18cc0mr5080397637.32.1775846653088;
        Fri, 10 Apr 2026 11:44:13 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f0c32e744sm4036922b3a.13.2026.04.10.11.44.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2026 11:44:12 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH 33/35] arm64: dts: qcom: sc8280xp: Drop unused second PDC reg entry
Date: Sat, 11 Apr 2026 00:11:10 +0530
Message-ID: <20260410184124.1068210-34-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260410184124.1068210-1-mukesh.ojha@oss.qualcomm.com>
References: <20260410184124.1068210-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: wp-qIywJIizXnqOZZwAuPrMIsMw0z5JB
X-Proofpoint-GUID: wp-qIywJIizXnqOZZwAuPrMIsMw0z5JB
X-Authority-Analysis: v=2.4 cv=cKfQdFeN c=1 sm=1 tr=0 ts=69d944fe cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=PYWmFnaUksdtvJZQtVAA:9 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEwMDE3NCBTYWx0ZWRfX/aB1Jfl5DyFb
 B5ZEXv9wNChzgLWJRVbDq6o7466iaZ5+Frk8NJT5lKjF8wS9O1SZVKJt78LFxj5fJoE6ssBo/4K
 QDoJxuioDJY/L3GJqMEY6dE0fXZTndQZIQjjuVW0sL0MFbSme8ID9fO7e8k19TBldrp4cbqTrMW
 uLrHBFDzRo1JRm77LGKb3eRTlF5tDl/fG2g1YsJP3UysQvdTz6hgJpM//XkfHRF5HbgskS6eAxD
 rZFTNSyhlUGkqq7BCJMYv6x/rA6b0hhTulTvvZ92iT2Lu9h1b3iOxhg6RHdazxPobKLtopMON2M
 TSXbakbKPX7UFWm5AyNdNZ0zuL+mig8KGNgVnkcYEXjjSS2/Ba37dSpeOPNW3ZzLf9YxXpKsRH0
 ZwdHUdkgJrSb0gbtBmlu5ofyTMzjIgKpNHrn/k2nhlg+sHqX8iDaInO1YYEiqOdFDArM8Pi+RHO
 owcSXv/qBXY7/EoUvjw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-10_05,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 suspectscore=0 phishscore=0 lowpriorityscore=0
 adultscore=0 malwarescore=0 bulkscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604100174

The PDC driver only maps the first register region (APSS DRV) via
of_address_to_resource(node, 0, ...). The second reg entry was never
accessed by the driver and can be removed.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sc8280xp.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
index 2c6e48495d20..59354f2474c9 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
@@ -5095,7 +5095,7 @@ dispcc0: clock-controller@af00000 {
 
 		pdc: interrupt-controller@b220000 {
 			compatible = "qcom,sc8280xp-pdc", "qcom,pdc";
-			reg = <0 0x0b220000 0 0x10000>, <0 0x17c000f0 0 0x60>;
+			reg = <0 0x0b220000 0 0x10000>;
 			qcom,pdc-ranges = <0 480 40>,
 					  <40 140 14>,
 					  <54 263 1>,
-- 
2.53.0

