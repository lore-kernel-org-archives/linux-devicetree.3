Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BD963FC5AE
	for <devicetree@vger.kernel.org>; Thu, 21 May 2026 13:07:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779368864; cv=none; b=k8On1M/kJ+roCUjCoN6KqfAhHDBJPbxWmlxSF2/2mxhzmtPKPYvgj759tu8wKvtyuEsWOLttI8srHnng4KdtX+eAetbEaJOpr2WzJyGkJ7plPh1YDbbnMlLG2MzNJhaO2V3cfUShGmzGDkcjCHyYvODAOLG+sGhBHx3pgcuVD8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779368864; c=relaxed/simple;
	bh=MB0nViV4TvVTTFohe7gXC325DBwjVk/OFHUgRfGnU0M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YBx2hJgQ18n2d9Jn+lAOb919XeNnVcH8gxZtBjpWwLHk6hABMYD+ZtlMsc1o5ZhBxDPMGLgJzKOPmk1YTIn60kMgvqtUI66JAlfclq5GMzyFVq6t0pFoP1uMH0Lft8ONqNh7xj85LcjA8XQuDhX6+/M8gbMO5eHQK1YpGkgedbY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aepdikLX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Sv+orFkH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aepdikLX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Sv+orFkH"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64L99hKj3527248
	for <devicetree@vger.kernel.org>; Thu, 21 May 2026 13:07:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9wUwDhg3dsVMHGU8J81+cNtN8Z1vmBifp1XZ8s57MQU=; b=aepdikLX8jKqBTo9
	w3F0K9CoJgS7K/9rETNBB/djHaAZYjFNqA+wny0jvuOI9bxjHan48CzF2P1d21gJ
	xdbS9Jy/ebNQXXs2+QshvReprP4iL7zfCwx/Mv0wXK2YqnkdgVXMStCHQ5dvpcXt
	7oftRMzHVpwyo8P8FqziTLF5W96Cf6R+clVYQW1Keq4ltLCjIdGkQ1oyykw9iKL/
	E4wvDmRA+fseRYExE69+DJoFDCWIw8TlwNlpB/hdpVFVMA1Ay6kZs9eHdV31H+wO
	+j7wvWi67MupeekVsnSOK0GvOg2DB0+RkiUEyHeS8JaraMYt/+XnwFa6RWYRc9oW
	z/PDdA==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9vhbhpf3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 21 May 2026 13:07:42 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c829366cf25so9043172a12.0
        for <devicetree@vger.kernel.org>; Thu, 21 May 2026 06:07:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779368861; x=1779973661; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9wUwDhg3dsVMHGU8J81+cNtN8Z1vmBifp1XZ8s57MQU=;
        b=Sv+orFkHhvn+Fbc/kRz6YLQN1E299Jy90SDXSfjQBcF6/8ksJND8/bUGtP13rDW0qL
         NbhEd7Z9DNYEPg31K/guKt/PwJclr2weoVw3KDLoAtWsSyNwyBoH8UlJR/dzTMOQn72w
         fJcc+6Fq9B8u3pYvxJBMn38qHlhbgJntrSfFSjxPD2UOr5k26y7CzW+kf+rKR39CHVmS
         sGj9HGD0gQJcGrEL4KlD5hXjrK5PddQcC184qtS3f2hips37350xcHLH4uW8SoJeTBTD
         qST0RvY2y3+chuzbxvDhgR9fApsAAW+fLVDIfH9JoWNfGWUva0wlzucFPoVF4KF/5lno
         AnMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779368861; x=1779973661;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=9wUwDhg3dsVMHGU8J81+cNtN8Z1vmBifp1XZ8s57MQU=;
        b=kkLhVHOpIM2eCZRTuPSZq5PUhgr0Wd0TJHnK9L/HH382KYd9gk3NwsGCuEKRgIUT0Y
         Nyu+/p+XzfMBno2vADF6HsQ9/GjvK1IHBRqk7RD5z4Z3e1HG1iLxdr2741EaFzUAS/hc
         i0JvudYfHuBpqmpcVk6OE2dm2SCXGV9MwfbmVYx+e8FkgWzTlYEOJOwPUjGjcdVokSQ2
         esRUwpvYf6UavXQvoxbU2ejiqtAijnmuvpdCnbRxUd0EIakWQ/oljNJDcuwGOzAXSv8u
         E4E8W4JtkQA4J4RqINUiq3BCxmk4kDx68v0FrqP+RnPIO+tLYTSGV20tIbAsl8K/zUue
         ytUw==
X-Forwarded-Encrypted: i=1; AFNElJ+3D7v787T4Vha+VKC45wmPOLMwPhVKQOR05CnDGz+GzO8W4d5LDWxTUHcZ/QtqjXa6IBiqSWdwSnwS@vger.kernel.org
X-Gm-Message-State: AOJu0YxHLLBhrJkpKlacYTbTEwf4gEnJNa2LRSFaoiLNYjzpgSufSfT8
	u5j0x52xPd/WohAQ4QjRtiUPKZKzaMYNaT8iBJaqf0SzkenUbilNb5yh820HX/PZ528+pVquy3c
	MArLuyTMG55y1fjHSVtTyio/hOgc5M703p4UzVr6NZ9VnUluLLq49WewbZv++ExR2
X-Gm-Gg: Acq92OGucGqeR8mGIQ7V89k8XRSw2AnX6IXyslqOgymMehLSkJ+6P3DmEZiKxituePP
	4wr0F4beI9NtQWMIJicXlQ8R8jQq+smpZiBk9v9B3HCegrVpnZgbeEE1MbDTzGARkYLv9RKD2kE
	WVZqRauFuHD04xsVew5nrDdvw6tzkbbJraG2wuxfsbKnKp22i+ucYkYsTIxCi8V8TTpzH7O0+z6
	PHwhw/TWsqZUBmAK+OY4+jAx/oddJZ0o6rZTWQ4jPPzq7J2aAqYp5BY5wB9zKTPuYuBhRFHJfvg
	SeaJ3vNNtdN/Z9jvzUbC2xmi8C8Q78StBaD633wWL8uMDibEnx060ROHyVhwJ6j0PFoppBM/eHl
	2tZ5AywzPOS4x0Xl53zMwNsQ0fgpPwlyjckV7KGOis9vEyyIxIFyoLsvW
X-Received: by 2002:a05:6a20:9389:b0:398:a1ca:7a2a with SMTP id adf61e73a8af0-3b308b40bdbmr3593496637.48.1779368861249;
        Thu, 21 May 2026 06:07:41 -0700 (PDT)
X-Received: by 2002:a05:6a20:9389:b0:398:a1ca:7a2a with SMTP id adf61e73a8af0-3b308b40bdbmr3593462637.48.1779368860772;
        Thu, 21 May 2026 06:07:40 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c851991ab10sm294602a12.22.2026.05.21.06.07.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 06:07:40 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Thu, 21 May 2026 18:36:44 +0530
Subject: [PATCH 11/18] arm64: dts: qcom: sm8750: Fix PCIe wake GPIO
 polarity
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260521-wake-v1-11-d822567be258@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779368813; l=919;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=MB0nViV4TvVTTFohe7gXC325DBwjVk/OFHUgRfGnU0M=;
 b=NMg8q7aCUe7yDl+w0GgJbutm+iiQhagL49JPvlJpCs88tTgOzeMn+o008tq56Ynn9IaQgWCoQ
 T0v89kHRikeCeOwzuGotAL7kyWX85M8QtyOyj3vtGjMUwG+TA3jrzFw
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIxMDEzMSBTYWx0ZWRfX6ins0IXQqPrt
 PKZXOfsfp/8zl7yVOxI+Pd6MHv4Aut7hJJ7MHXxMgW1GpROpp6VZk7dR2SLUL7LfONnEIPAR2Y0
 7uFNAreZi+yJ3DjTOvelpUbi9+NU4KSAiDAzcsJNI4PhDFGro/fqxyWqoSB8WSPFX81p8yWkSpI
 vwmd7jxCvfA8DNaOvuT8hUHqwVfYkEy+flQ9wyDubKl85XV2XpVUMIxYjK5rpZ88nz3NbJ6GEKz
 rpEnot3jzJ9dCGn/q2z+MQ26HZHFKxuBeKr+sgt7iKqnsh6pffjz/C33hqd8kuYCne4xy8tks4u
 yVxbvjiMvPZCpZQV8Zy4egX3YuMVJPDL+LW7K0me370Xsj/mwGBsuPh+ozIFTz61ljaoJ7Z6qoe
 ezTmQXIYR/FojVwh07ftKfAiq9adSbSLlUw/5vYenrTTR8Y3XVgwik1fVIbCrE5kYomPO6q/kUy
 cCEoNNClyWKt+YmN2kw==
X-Authority-Analysis: v=2.4 cv=GYAnWwXL c=1 sm=1 tr=0 ts=6a0f039e cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=t4RzHNKIQDbQSdFyBH0A:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-GUID: SYGhybTghu2-1rAzqQNYPhqvnGDtWV7n
X-Proofpoint-ORIG-GUID: SYGhybTghu2-1rAzqQNYPhqvnGDtWV7n
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-21_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 malwarescore=0 spamscore=0 bulkscore=0
 priorityscore=1501 impostorscore=0 phishscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605210131

The PCIe WAKE# signal is active-low as defined in the PCIe Base
Specification. Fix the wake-gpios polarity by using GPIO_ACTIVE_LOW
instead of GPIO_ACTIVE_HIGH.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
---
 arch/arm64/boot/dts/qcom/sm8750-mtp.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8750-mtp.dts b/arch/arm64/boot/dts/qcom/sm8750-mtp.dts
index 3837f6785320..2c2753683c69 100644
--- a/arch/arm64/boot/dts/qcom/sm8750-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/sm8750-mtp.dts
@@ -1119,7 +1119,7 @@ &pcie0_phy {
 };
 
 &pcieport0 {
-	wake-gpios = <&tlmm 104 GPIO_ACTIVE_HIGH>;
+	wake-gpios = <&tlmm 104 GPIO_ACTIVE_LOW>;
 	reset-gpios = <&tlmm 102 GPIO_ACTIVE_LOW>;
 
 	wifi@0 {

-- 
2.34.1

