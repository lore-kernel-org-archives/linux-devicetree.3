Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEDC23E717B
	for <devicetree@vger.kernel.org>; Fri, 10 Apr 2026 18:43:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775846616; cv=none; b=g+NGyX/6qMRULJUuGh1V0F2zQq+EQQXpI/q1t/2WmuVeJtjKM18ApgSNRsIN7OBKiEG++t77z50eonl/pk62E9qfyw3SKxJP/JvpCva8JKFKFpj94Pt9pGf87ip1blGAktNovXr0oCOKum1odVl6WritbCto916J4WPkVqRS6Ec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775846616; c=relaxed/simple;
	bh=pvCNHwdPXhaghxQS19FFKXjfitLlEPq0ZPz3FiOyQjA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NuMgRZ3ZljRWt5fQ/4CUwZ9g+lLRiJbvHXLYjO/vq8mpVDHp+1Yi0uxvaiPrcNpuYQ6/xETI6JzEdJesDhlTI5JXLBU01B3Px3uZnhcELR1eHHKibijb9/7GuPmGTNzLtxaMo1LBb0Fl3aZy/FgY3csciz4Ure7gKvOwfiijsAg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eVkNkgNm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AaxvbNGt; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eVkNkgNm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AaxvbNGt"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63AHVeoF709084
	for <devicetree@vger.kernel.org>; Fri, 10 Apr 2026 18:43:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=ckzRmD9MxOM
	JNXmhinqGOA+77MV/b4mYUOhb6idPBz4=; b=eVkNkgNmHOYMlrthyUpAyUG+bSi
	oKNVImFWV87H1ITzm2axbBp/HlPPA/etlgb1Y02LH8IAkqzX/cfD//b3QU6aqOUP
	NOexL0rfHvYeDT9+Dw/YlEz4AD1+qqLRl8Ij9ELkZWT+wio4mV22IditkgslXzA5
	qkcVdvHlaFiUgIoWQ3XGfntgCQPRsa1RWJ0OBijhWmeWYPdvg+C5InQGQ7T8Fxih
	BqUa2Lx7gtwf2gZ6jkoXFORP/wtCMpeDf1vE/cJluzBSFVqxkapT1L3VWwXIijKF
	J7361ikVJBi6pQj3KBKW7nzdDwQnmI4u7ZEEOsiKGfHSDlFmqMQ9VgWAFpw==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4deudj2jqs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 10 Apr 2026 18:43:35 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-82cf8dcd079so1490403b3a.1
        for <devicetree@vger.kernel.org>; Fri, 10 Apr 2026 11:43:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775846615; x=1776451415; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ckzRmD9MxOMJNXmhinqGOA+77MV/b4mYUOhb6idPBz4=;
        b=AaxvbNGt/TnIPUmTFJhlvMAmWLeS8UP2VYVRSp6AXPqTUcV5NDU0tTjh3wKyHWKxJT
         Qj86tyeBhBABWAKRLsHPqw8IMnCrByoKl8+Tz6HrfM+ujN5tMdP2AeQ7SOTe36Uo0AFr
         kFLvnS5KWVc5m4EXUVhfpzgBQMgPU3ETKoFvRuPKsm9M9nCP/nZj6p0Q+4WqFqqlPXSH
         XtRrMiGftxMS4DuuobVLaW3AxwMl3uOA6sh8JDT0b4R7zfYuzKp637zjfEEKFRNKtrDs
         //dEhkBP+bIGyF46kBOaYQ/hQGWVuAaS06ZQpHhm74B8CDYM5G3NELYGQDsFTTE4ejFc
         tagw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775846615; x=1776451415;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ckzRmD9MxOMJNXmhinqGOA+77MV/b4mYUOhb6idPBz4=;
        b=lJaLMNfnF9VUVEKiX3LLa6lcHLZl3gVAUcOEgtvDze2e8U304fWO3lfCvxX2y7u6HL
         nLSCbrN2GRQR7yd0nBYPKpajpNdmAQWf1qhFMZy10KnccsgDWoegYEMnl4RnqrhRyTX5
         HF1fZCjxCcm91vPl/0iU4FfcfdbRZNS1/Oysgh/w0jxPZGsMCZngen1gCuHFWf3W+uA6
         zEb5IqhXnGKsYivf5+kbf8jEaHzqVKY65vTqZ6hmcXGWrzaTspUwCH9DatDyr+OjCpoF
         aYx6l6518Wm+kS9veEcLUYmmK0UHOTVZkh5n2hwRkoW7VdcG04Yd4jyU8OPNwo0h5WRv
         YgCg==
X-Forwarded-Encrypted: i=1; AJvYcCW81lwihhsu2AWkPtEzgu9XyoRTl1iU4rEoYRfCqlHtVmKL2BelYYoISzP8www7FBXHYuXZttPIfk2c@vger.kernel.org
X-Gm-Message-State: AOJu0YxXO7aGBqJMaip0w8NH5wnfspjDND3DQeupvDW0JHiBwFyMpp6P
	cdI363vR7k0iJwu6OLEPeRhQ0jgopcDsUlmpxeSwiTVKp3FoonFF/W0RJ4V5oD0XKI9BFTia/F/
	qU7PExykIDtfCP8/1LoXx/6uTJJED1g80EU8mrw9XeUabp1x8FZPkiHhxZxu2HOla
X-Gm-Gg: AeBDiesTipPchUc4nrcXtQ7OT6RBxVQGe8IxbWNKtbSwdzesvdZn95V3dzN+2izulzj
	UrIJm/UHV2/CjxJfUTw/ig5O4qljyxn9mZfpxmV/aAqvdyBC1YPZtqs4BYnajot4pDovLzUnmOO
	uwhFs6mYy2gXNETuzC297ojoJwCSQ6970CBhVmnwIYNvm4r79cCf5wie/ZIQ6PcdH5QEGQ1T2fG
	X0L1Ew3ifuunai/ki4vWL7hjS8J4u/ew9TJhmMxED9sEA1EhWSoHUVCMnWuFm8KeJtbODsEZHGl
	UNyR2c4l+XpyC5KBI77Q/RgFg58ZmfcAPpOi4kCuEburnUEaF9DdV+64cbVHNE1R4zP0wpYvG07
	l26ecY2zGYWs7FpO67S377WmiiK1b6BVnZuCMwD1axZcFajer
X-Received: by 2002:a05:6a00:14d0:b0:82c:d8c3:6983 with SMTP id d2e1a72fcca58-82f0c2781abmr5187729b3a.51.1775846614396;
        Fri, 10 Apr 2026 11:43:34 -0700 (PDT)
X-Received: by 2002:a05:6a00:14d0:b0:82c:d8c3:6983 with SMTP id d2e1a72fcca58-82f0c2781abmr5187695b3a.51.1775846613825;
        Fri, 10 Apr 2026 11:43:33 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f0c32e744sm4036922b3a.13.2026.04.10.11.43.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2026 11:43:33 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH 23/35] arm64: dts: qcom: qcs615: Fix PDC reg size to single APSS DRV region
Date: Sat, 11 Apr 2026 00:11:00 +0530
Message-ID: <20260410184124.1068210-24-mukesh.ojha@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: _-dr38yS2Uq9inqrGWGvKCnEHMcywopd
X-Proofpoint-GUID: _-dr38yS2Uq9inqrGWGvKCnEHMcywopd
X-Authority-Analysis: v=2.4 cv=cKfQdFeN c=1 sm=1 tr=0 ts=69d944d7 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=i9AciLLx_FHxuiQYw8EA:9 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEwMDE3NCBTYWx0ZWRfX5DR3kHXeZXkW
 LTXMUNllMxQy4BKehRZ4FwwFLtd1yHipjY3YsnUaXZ4C0KhNDeIDry+YIYr4I/lyqyga+azJ911
 GTizMvJyvpOXNLOTjkeT7Ip3FwPF8AXBY2PDc8jZrtVumkbymlFpR1cRliBPoIXApOlqdAGe9aL
 xuOTBTTIzY6Sjb0mbtinfPkgG65uXpOUdm3P0n91W3hYbiZSML7VWImcQopBbhub2IOdAsbEm0I
 VjFIqOEhBn/02I+h8nveK/30qYXmcotE5X2tyS5oUQ4C7iX5YEV9X8P9dKdF9okBXxVinn2auA0
 2asRzXQHrazWHjFOS8p8jxZzyqpDzUUA4a8LxN7okixdm81Jmlxg95hxZWpF67I7UaH/cbjvnXP
 FIKpgkFJsxA7vl2MEREEwJ8qTaA23nnlNq58V15UeUsTA2dd9GHq/8jptV75VwfDQ3/iljkvMCG
 uVSKDS0Fg73Yxh99Jzw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-10_05,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 suspectscore=0 phishscore=0 lowpriorityscore=0
 adultscore=0 malwarescore=0 bulkscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604100174

The PDC reg size was 0x30000, covering three DRV regions. Linux only
needs the APSS DRV region which is a single 0x10000 window. Reduce
the size to 0x10000 to describe only the region actually used.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/talos.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/talos.dtsi b/arch/arm64/boot/dts/qcom/talos.dtsi
index 75716b4a58d6..4b038fb22071 100644
--- a/arch/arm64/boot/dts/qcom/talos.dtsi
+++ b/arch/arm64/boot/dts/qcom/talos.dtsi
@@ -4080,7 +4080,7 @@ dispcc: clock-controller@af00000 {
 
 		pdc: interrupt-controller@b220000 {
 			compatible = "qcom,qcs615-pdc", "qcom,pdc";
-			reg = <0x0 0x0b220000 0x0 0x30000>,
+			reg = <0x0 0x0b220000 0x0 0x10000>,
 			      <0x0 0x17c000f0 0x0 0x64>;
 			qcom,pdc-ranges = <0 480 94>, <94 609 31>, <125 63 1>;
 			interrupt-parent = <&intc>;
-- 
2.53.0

