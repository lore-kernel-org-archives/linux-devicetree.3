Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B4503DC875
	for <devicetree@vger.kernel.org>; Thu, 21 May 2026 13:07:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779368840; cv=none; b=Cj0vB6cVcovtxfz8gcqPeZLGLHLqyLh4BPEN+kXnvksneQxubDpwdloHJCUeUGx+RnOJS4AxBaqwZ0PoGudiLM/8l5ncg4X3K8j6L+gVpDSETWH2mhdNXl8ZAlNKRNc2Slrk52OA8BPiYmhFrwIpAgJi5xiWwgVrYJXu/7PsD0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779368840; c=relaxed/simple;
	bh=2Sh2WN9xNHHUCydy4tDU6MYyc2PC3z6DEGT6YvQy1/s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=I0MtWEJk8EwgFA20JqHvLCLvBmqZfKENKMFTLly5BZed4XpLjDM+if/UdC8cENrtqkpvUXzp8SNQXwsz5EXhvL7yPnSYwOTvaVGSRT2hs8U36Q+bHTZPt7jWIBCDOuhcKwezi35BuoTHkkaN3BxweJrQ3rgCvKCOaQelesN54aE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iASd879f; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FboRLnYe; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iASd879f";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FboRLnYe"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64L99sOk3451575
	for <devicetree@vger.kernel.org>; Thu, 21 May 2026 13:07:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	F5Asn9fMcy9vydlOLCYln9tVT0r93l6oEQ4jBWq3Dp4=; b=iASd879fT5XK52mV
	53TU+4vkr4SvCb384fUlyZCOjNjXiaaOn5IqGYcqNQu0We2KT+HYQ6arr8TQkAeG
	8Pb9HZ5UJmDR50YJeMSFAJyKeYEZQKvWiIo1C41AS+U8H0Y5KPZrnTFEPK72uZE8
	AruAppggVHabor+/CSFdg069bd4uN0j5xWPkdHQSreDbSsp1mx/ErEG5wV+bt4o1
	Z+yZH1j7cay2BSUVIYHim3wkXZguzU0oj9/1ahECmsPTaDtdfHjTRm9vnlhNVxMi
	OiD5VYB2mK0egtw14jgYudMO/K5zrd5MR1sU+kIbgogV/ZifIhp7v+s+iQPgtuLa
	kSfOuA==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9y1h8xf2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 21 May 2026 13:07:18 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c82751074c8so9903376a12.0
        for <devicetree@vger.kernel.org>; Thu, 21 May 2026 06:07:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779368838; x=1779973638; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=F5Asn9fMcy9vydlOLCYln9tVT0r93l6oEQ4jBWq3Dp4=;
        b=FboRLnYePwMx4jlym3s1sx8OinRwFpV5yQoV3OM7dh+dwo5NB8EJ7wjPN6CIwMT556
         mWRGgNQdYEQXzONQXe/vcFNU+vaY06PXa1c2+zIf5k0DWikPicESmE1Qq8Ffc4eO8w5v
         9l4efvHsBhWTMfoQzP+vZ4KNS73IYP2TPbILj1yPpCqOTJZSfpZ5U0bG7uViyuV8gzTI
         Lz0D5mRuf+DKQscrTDzS2o92ahX3aJXBFICIesdLMU3TQZ7R0rWtnBf6nmxg6ZAIHnyw
         y2GrVcg2508w7KSxfxIJnuw8GQH6G7p7LBe7hz28O4ES5qXaLP0bpaYl0+hSwEiZxf03
         +SLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779368838; x=1779973638;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=F5Asn9fMcy9vydlOLCYln9tVT0r93l6oEQ4jBWq3Dp4=;
        b=N7VdqobaYTuXBy9aKcJdWEurVKPssE1w1oSpCQFZqs5/s70GduVBlArxC3FhHe7qR5
         sG0EgA2kkjADlnKMGzaXaIOGvyInAKLjLVexiSdBoEiYYc/7GRnZWpmBoE4bIxHXQLtc
         P6fLQi7htq229gtSu/GYngeY8PxCZ9SF9kZ/MLc+8qo0iW7O3EFgYxcYalnkzJroi/74
         6PX6Of5h36qd0Jm42zZvsOBXp9/nqyvjBvgPVj+SGtvttFW/NUztsiN5IPUKsUpU/fc2
         0jlaCsiVioW4coLjx15qqPAo86RH1gALhbmy1Qi6Bb7WiftqJufProiD2kFfTAO6VF51
         xM6Q==
X-Forwarded-Encrypted: i=1; AFNElJ9LHxbArGp43WpzBsoKZ+50LHbr7pg0B2DV30RlxD8gVAyeSgZAIX+U3JGIWdDZ+OVH9z+RaVPBgp7N@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8K1opQqhZxHXjDbakMK1pZ8ACaK9+DaA/oYZ42ljAPpBNHx1a
	Kby41xnvFG7pUSB84EMGM3dtVpYrJA6RbqA8alwj18+79f9JbzWzpyWcilXIsBLsKN2VXuvO1Eb
	Sk25Cl8GyIhR39d4Yr+CO3zkrJQRXE4LRzrHawtyU3vAsp3/KnVji4C6mWeDgSKwE
X-Gm-Gg: Acq92OE1zllSgRZyK4GK+qMy4l9jcTsU/2xlKLkjPOZlYCZY/2vRl5E0XLAVdlGydXm
	QljsyhqCwXMbtwAPK694LwcAp8C5kshoceCZtihKl34yCDpsdP5O90Us7RYyB2Zn/3L2t2ju/Pn
	NhbEIoxJWj+iMUe934Z21DZZhBLL/qiQ7msN0f2b/B9DOArCeeoLapXkTR2RXjaWoSwYk/Aoe5Z
	ekxbfiJebOq1dW5cbJWsM9oES+WY6fFQmSxdrlp1pvXjYmMftrimQ3gpdEHTePB+kTD9xfFjwU5
	JeKDVdZEFO5L2ypAbt7dy8MakHPJSFyxeZwHeGPkGOwuPPfA6F4DS8pcxlBTzXXRSFn8BTmF4MB
	O6fajD30DghUA24QBRrSW+D4XMM50/qWs4KDnVqq+jHiU+vPzZOVXhcUu
X-Received: by 2002:a05:6300:6cc3:20b0:398:d6a9:fc9 with SMTP id adf61e73a8af0-3b308540f31mr2181439637.5.1779368837617;
        Thu, 21 May 2026 06:07:17 -0700 (PDT)
X-Received: by 2002:a05:6300:6cc3:20b0:398:d6a9:fc9 with SMTP id adf61e73a8af0-3b308540f31mr2181412637.5.1779368837119;
        Thu, 21 May 2026 06:07:17 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c851991ab10sm294602a12.22.2026.05.21.06.07.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 06:07:16 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Thu, 21 May 2026 18:36:38 +0530
Subject: [PATCH 05/18] arm64: dts: qcom: sm8150: Fix PCIe wake GPIO
 polarity
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260521-wake-v1-5-d822567be258@oss.qualcomm.com>
References: <20260521-wake-v1-0-d822567be258@oss.qualcomm.com>
In-Reply-To: <20260521-wake-v1-0-d822567be258@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Manivannan Sadhasivam <mani@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779368813; l=986;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=2Sh2WN9xNHHUCydy4tDU6MYyc2PC3z6DEGT6YvQy1/s=;
 b=AFwhFFdPHrmOzBm+Y5cDHbjYatnjgL7nxcK0Pxfg55a/qjPxkHmJ3RE0nxD0cpPJi9w/ioPY6
 2YIjGnP0BRzBZFYtyoO3Ru5f2+q01qLa759D2O643MtPgN7j5wXQ88h
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-ORIG-GUID: LTyx-JeeN6FuZOmY-y6hk-bzCLVrRJds
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIxMDEzMSBTYWx0ZWRfXwmafSEWSkbz9
 J5i8hI2w/squMS8qZZB4g3QHwW1LlH3DJWhjMhkdOfok7aCBCNSCSKIq0pZbLXOjsW4wig3u9/p
 HwE6910YEaAErITRyUd5CQg5cfvEV8ygJMs7jWWyR0yEWmyYDvevJfrDCWqLA9rw4c3RdMtgigE
 Q4ozn4NiR2X5o/v5KJCy4jop8uEAF3N4rpMJ5YoqqlLR5M2x6ZRFG1nL6ebCvDQ3iMKd8KJHAls
 LHU64lVHPmDst5WBZj69Mf+38B+PPTgr+ZLZ3G2rLv+aWgEQW28NVbMvPLtoLjo6mCrBRHXz4VX
 iJyvMMafwvXoMNbQHLxTc6DIlnvs1isxhKjfHNmW6X37V40XEUaOFC8i2S594FJUqjHOx1T7zQt
 8NonPawfG2SFCmy6Fpv9dQKGDK7njUK+QuTSTBekbHy0Q/MXGkpZeQTUC+xKm8bMyuG/VyXJJhE
 jkU3ZzKsnCRRsq+NgBA==
X-Authority-Analysis: v=2.4 cv=YfyNIQRf c=1 sm=1 tr=0 ts=6a0f0386 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=t4RzHNKIQDbQSdFyBH0A:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-GUID: LTyx-JeeN6FuZOmY-y6hk-bzCLVrRJds
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-21_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 priorityscore=1501 impostorscore=0 phishscore=0
 lowpriorityscore=0 adultscore=0 suspectscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605210131

The PCIe WAKE# signal is active-low as defined in the PCIe Base
Specification. Fix the wake-gpios polarity by using GPIO_ACTIVE_LOW
instead of GPIO_ACTIVE_HIGH.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
---
 arch/arm64/boot/dts/qcom/sm8150.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8150.dtsi b/arch/arm64/boot/dts/qcom/sm8150.dtsi
index 0e101096209a..8da494de4308 100644
--- a/arch/arm64/boot/dts/qcom/sm8150.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8150.dtsi
@@ -1905,7 +1905,7 @@ pcie0: pcie@1c00000 {
 			phy-names = "pciephy";
 
 			perst-gpios = <&tlmm 35 GPIO_ACTIVE_HIGH>;
-			wake-gpios = <&tlmm 37 GPIO_ACTIVE_HIGH>;
+			wake-gpios = <&tlmm 37 GPIO_ACTIVE_LOW>;
 
 			pinctrl-names = "default";
 			pinctrl-0 = <&pcie0_default_state>;

-- 
2.34.1

