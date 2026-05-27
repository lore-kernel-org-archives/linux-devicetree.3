Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1D763F1672
	for <devicetree@vger.kernel.org>; Wed, 27 May 2026 09:45:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779875105; cv=none; b=kyBJnHuBjb7w69efNWPCiOv8R4KwFmHQ6s8NDlgbFd3hqE1KYhH9PwF8smTLmVPjxMLi2wwd/6luUWSFh3ohuUC7yNuGYSQ9KWTRlXh9fjfvHAXRrNTk63J4AbI3RRPAG+q3m0zJf1cEKm3rVLX2OOtvOLdjwgvu3vZqCbckFis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779875105; c=relaxed/simple;
	bh=bcYT0ign/NPjTE4xVsFmlHq7OIYkEpCE9pjn6SenNjA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=K6mtBldPkBva4OhGdWvv0kqCD49mmet20zmZpnei2ZbEPF0BHKp6+CJbuHWKU++flNEXv8k4QwDYfSDLHTnl29OZs6kJuHf5SG9nsh8/ua18BG2bn9jFONXZl7R34HyKnXxngKiYJCeIWjoAhmVrqQY0NpsR3YvyoMU9Kk4bCM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gc9pvkfw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bMy3+YiY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gc9pvkfw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bMy3+YiY"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64R8mS0w2282530
	for <devicetree@vger.kernel.org>; Wed, 27 May 2026 09:45:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=gWrgcJbHnRY
	cSajb9j9GR9hO31dn2dD+YvfxxA8lS9c=; b=gc9pvkfwoGuUyJCQuabOti/ZCbL
	GFItzYn6SMcvIz/y3PaCiGfG+FFB8Yf0eBBdy3vpjRTYfZLVvxN0UHBCMjBZHUmn
	If10ssu97coFu5nc5Y8lC3Mb6cou4Vc+q3A+G8jamXb6Dfq3ZE8fQaYDh3sYbRpH
	a91ssLX1f1pmmuma+gel7npv+psO25qH3DjnmExV1TU1r1VRx0VXV3w4+gvNPqZm
	ZiPniueGqGgKZX4JugFRfackCpFtNtygPmjPYydZmscSDcJeEZihQFYq8+ijbIPN
	/G9piFRtqMn9IVNO4G6a3yX+nqPUh2ZxJ0wQjaWTsZm7HruColFWeQrth+A==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4edtvcrv1r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 27 May 2026 09:45:03 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2ba718173d1so62144635ad.0
        for <devicetree@vger.kernel.org>; Wed, 27 May 2026 02:45:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779875102; x=1780479902; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gWrgcJbHnRYcSajb9j9GR9hO31dn2dD+YvfxxA8lS9c=;
        b=bMy3+YiYDDFzJnYkVKmXbr/QypHqohdOmiLdBvIXT/KQfrRxPamgJQSP/JtPwG2Dj3
         aNLcFbsWaRcGhJySXHA0bHQaS2dTmCwE/efsJi/VUQW/4tY+zGl3uyV+laokgtZ9pEl5
         HwBk57cmu2MnLcQCiBn/0ZUw+3qr0VbXQU7IDsHd8NsM+AR5RT81xCZKRPPJsbId8JfZ
         utHV8ckt7wztFw/w1XH86xLUrp/9qmuY+r/ZNihsWdU4AXWrFx5sK6yZ9NJVM2+g5QZl
         iC4D5gLs0T6jjBJRPi3o8MomSx7NI1HGO6F0f/Th8ABKdX1MUm08tjecDqdmAfaE9J5q
         t33A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779875102; x=1780479902;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gWrgcJbHnRYcSajb9j9GR9hO31dn2dD+YvfxxA8lS9c=;
        b=OvUi5tMifvmYVk46bzYv8ZzmKek9b5JJrxgR5yB9nT8XN/qrBJMPW4wI/XxqkOa4G7
         4s31tPTp0j/s1DWw1F7BYd68yPM96U27+fRtrowcgYeTMySAMQIBbc92sIkT5htZTmBy
         GM5XkH27qZy4mRYBXmNJQMZl8NPwSWDNFRw7loll4O0Vat7PiwcWcr2mw4ZDNlv4AZAD
         C5ej//XU+jUDz+OPhDyh3+Fi930s+Uk5QW5AEmeU0KrGy6kBvCKNo6pa+u+eulFLFSfC
         KqAo98fq0tf4Hzlq9v5J260eMwb1B+RoljZQq9W7MSRLKFjHQE5lAYuEkLm67ubpR61u
         lJjA==
X-Forwarded-Encrypted: i=1; AFNElJ815R7izOg9GbZRAff4mAEC1iElD5IQGmZ3kKjdhBKc1HriMRwGnhvP7UxYFdp/2/8q5wWCZv9/tfK5@vger.kernel.org
X-Gm-Message-State: AOJu0YxIUPUTL1PoGmxl/delWhFjD+Y/dphky7Z88m15KdYcrpeI76e0
	Opc0GWu/Beqc0GSe7J1bSE44YxGxodUSTMTKwxAJAjPI9UMuhs14AkLThGTDFTvC6c1XXkPaem6
	sCNUMw/GjuJCuFSD1a4fBSetpNT2KLAriTFXSWekVGU0t7+khGY4fYW8M2uIaM24v
X-Gm-Gg: Acq92OEb75Ygpbe9u+6+6xpd47ZA8P1X8HVGv4hbSOWgy1Ed7BpuC3xkgzeIsxazsTF
	2y0VqYN1hFN96DIz95p5/axM0b6nZdW95W3hHIXysQZIxU2oSWOLJwTGj+tAzWbZRGTJwardzcO
	fnxU3V5iMG67fTK7Snyy1apjh+/CD0DU+yV6IFh9BbLkauaLyVryZFVEIoqbrHPUAAzNGwUBte2
	dYRHuaNcTZ/Pi5NcC0OuTQToD5dptbvNQJ79Mw79fMs/j59gTN6dNDjr7k2dsGwStqkyD8aJoEK
	BvPkrtd0WuhoEVSdOp5l+sAWE+I9HySLOO1Yqxw5sYEI31hDCwhlkz9+Y4THklRfxTZXIaCBhFW
	qkHUOi2eMck+dxGo67uoZN3jjrK8FpQu3XAr0bXNAKTKY/AD+
X-Received: by 2002:a17:902:e548:b0:2ba:78a6:7dec with SMTP id d9443c01a7336-2beb05c07aemr259277365ad.13.1779875102459;
        Wed, 27 May 2026 02:45:02 -0700 (PDT)
X-Received: by 2002:a17:902:e548:b0:2ba:78a6:7dec with SMTP id d9443c01a7336-2beb05c07aemr259277155ad.13.1779875102012;
        Wed, 27 May 2026 02:45:02 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb58b386esm154738185ad.44.2026.05.27.02.44.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 May 2026 02:45:01 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH v2 20/24] arm64: dts: qcom: lemans: Reduce OS PDC DRV span to 0x10000
Date: Wed, 27 May 2026 15:13:25 +0530
Message-ID: <20260527094333.2311731-21-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260527094333.2311731-1-mukesh.ojha@oss.qualcomm.com>
References: <20260527094333.2311731-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 8Hvqb7TLlJSWESF7xCXRUKH-UIdiBiEi
X-Authority-Analysis: v=2.4 cv=CY84Irrl c=1 sm=1 tr=0 ts=6a16bd1f cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=xoE1jMPZzYIr1SwPS-oA:9 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI3MDA5MyBTYWx0ZWRfX7o4jkRn4lCG9
 oMgXmf+gqbukFdVs+TDhDszYm95Ecp8W0lPcX/7vy0jg0/Nd6hTT+gx1HU/glkbw2MvnG5NAZNS
 8PPltG2NasTdiuis/L/0R4hzQcKSUoBB7cPV+e5/AlhjM5ctsJ5iS9ksi592Es1xe3ArcsseQQz
 4SjK4A/ELy6KIvZVJeWmvU0HoaCqcbIbWy6pogbU7PjzrRqiX/WaNwabrcjaZLZx/GBsNx2ygzk
 FkXm5hoo2raI466NMgf8d/rvK1iEINBkFI/xY/m+w+XbEHMN8IRFGfrVh6i+ce/vdvfO8nae34x
 ahSxr8wPhgq6qkbTPX/S9DSRcCKjIKkZ/wZ4Bf40caa4b4cprPCKxGmO6OnNdbE/YOSzRiIGBtX
 QNLpL9FVeOjzwfW9OcYjffJp+MplDBIuPo+sXpvtB9TsrFAKPzb83T4pLzJFsAlSjm3jEIwP/xD
 5hF3I+6Uu6TptuEdCbQ==
X-Proofpoint-ORIG-GUID: 8Hvqb7TLlJSWESF7xCXRUKH-UIdiBiEi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-27_01,2026-05-26_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 impostorscore=0 spamscore=0 malwarescore=0 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605270093

The OS PDC DRV register window on lemans spans 0x10000 bytes. Reduce
the size of the first reg entry from 0x30000 to 0x10000.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/qcom/lemans.dtsi
index bc7b4f65ad5e..932948362eb3 100644
--- a/arch/arm64/boot/dts/qcom/lemans.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
@@ -5865,7 +5865,7 @@ dispcc0: clock-controller@af00000 {
 
 		pdc: interrupt-controller@b220000 {
 			compatible = "qcom,sa8775p-pdc", "qcom,pdc";
-			reg = <0x0 0x0b220000 0x0 0x30000>,
+			reg = <0x0 0x0b220000 0x0 0x10000>,
 			      <0x0 0x17c000f0 0x0 0x64>;
 			qcom,pdc-ranges = <0 480 40>,
 					  <40 140 14>,
-- 
2.53.0

