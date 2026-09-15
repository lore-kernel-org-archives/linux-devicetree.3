Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6F053321A1
	for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 01:20:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789435238; cv=none; b=lX/DDqvTSB4e2R2nuOrk4tKtk4G3szRaEun29t27yw9iMIqSZtu7m3hwQVdgEOrH2EUiVemkzQpkMzzdCUzQHscro4WsMBNlMMIfgu91GxwInPf3611kaFe7gRGj32DUyW8J+CmlW/RLmC0TPXEogLso92bNgG1A5simjTUaHl8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789435238; c=relaxed/simple;
	bh=odgso7si0D+HJtBaRRkr+elkQ6gwGtPGCZeiSn/buw4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=gIdCRusd5IioTvv4bXAiNX4/cCAwdXqunE8ZpW6zgeaWbBn4xHGa5FBCpF+SYdI8fE0W1Yihqj3OpqT7ExlGnSTGQNgJLRHlzWyCMupWiHUzyOfsXoSYaw/M+VZ4CtHW+y5IeAq3/S2L+TWjcwIYi7L7TTbeOv7YYGssyr2WkcM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=E3JbfoxO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Wp62EmjA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="E3JbfoxO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Wp62EmjA"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68EN09YP1813406
	for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 01:20:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=2wqGhKhCvfksusQnfhBnSQB+Eve9RoX70et
	djYEZIzo=; b=E3JbfoxO3Uv8ltyHcugsZQeWqsYtLuR6Sw7/59+b0dC8Qslxkwa
	1UVVhIkp7lL9K74TqBVAUFe2TyJezH9P1wkb8CrWtmvBeW73dTfVHEX3dZDwcwJ3
	eq+13cn6avh0RxUGLoIpIIAF6Ykt4mCBHtrNxXBuIk9847Iv/7i7kG20J927rLdS
	/tgAa/V4oYiiFPMf/vc3PGBfv5C/rH+/VnLp8TdXaA+Xj5CMyyAwtTWW/wz3Woxw
	OHgSNUfG+Qt63vSFQhTgj40SZxRN+npDZCJywq+mxcWzNkYUBtBAc3c9PD5xTekJ
	xNeq3WLMrBsFYnS+HhIgrqggGX4LKwdO55Q==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpgvtjuaw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 01:20:35 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-385d2703b64so400736a91.1
        for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 18:20:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789435235; x=1790040035; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=2wqGhKhCvfksusQnfhBnSQB+Eve9RoX70etdjYEZIzo=;
        b=Wp62EmjArbGlgWuw5mNcikkNALRpYyN3Sw5XJRaP59XEAX4GbAopzdrETy5sljsUui
         eYboJxGDNAUcR3qeAhmqsrAWQtdYW9v0I8WxvNRYsmY0q9EKjoCdad+oaET+ZeZwu9og
         yk3tkJkMnNqJ/TBCxLeBHg4zo+dH2YH+B92YQNn0Fv/KC44fSRnOW4VG/Icnq3k+jTSB
         /EqUiuW5h/ZXuoRCCPbZeBTFp9v0unjDWrMI5jUmON/DaFyiAl1pM0do3XojYddRg+yE
         3UuSr3gEYi7rOms2TY3R7kPLlepDZo0+iu1syBUx7Chz2ibicbMgwosiZTAySHlxCSvX
         1VrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789435235; x=1790040035;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2wqGhKhCvfksusQnfhBnSQB+Eve9RoX70etdjYEZIzo=;
        b=Teyo9bXcDZyuEkOsQSq6DgrEU/iN5idf/g0J+hNlJ1HzHhqWKVRqtpW0Vi+UPlr0Y6
         n8sv8tcHpMQWTV0QSsMFEeCiCgl2QZpawiIvjMnwdsf/eJ9cHQAHWeQ+OFjcnvmC4sdm
         A9cc66HdJ414Y6j13iy+IvOs3h7tkKpQoglp9lZcZQYrEF34TJ897oDcebskqfHkdQIo
         WtYPKEIUhBwQ63P5fun9pGOLhjHirqnKHQ2Lq1CW7YYZs5cGqZO24Rb1Cf1U9VjHAIb7
         z/EF3MKZdH+sjVFNMbvoL2B/B7hGPJSgsU0rMIlfgz3NlXenfjSCEGWFBiDFkf30/ch6
         fCVA==
X-Forwarded-Encrypted: i=1; AKwUvBwRfDZCe4HwEvWKqaTYDgiKU+xZqMc6vDbqS5WUo20OJJO8ZOz+sK76eHjah1DUtJ+yX7IQ498D9uYl@vger.kernel.org
X-Gm-Message-State: AFuF++lCB8LHAkYtxvBnmrO5hkmN5F2DM5v/x2RkjuWZtD4A8UB7YcWo
	xeqeG0wsFzQpnOIhi+uuOiBR2OWEjU7PUfdd5SctQM9ZjOVfC49QtL6XrVCKPqe9r+xjU9EALmA
	T/l4bGeHmJJ0q6ZqoiGxnh0txXf7hxSeAxwIS5urcvqblNQfdb7QETte+C56rmX4r
X-Gm-Gg: AYBFou2ECx8aXp6e6RIceiXeKEJ+2kJvG/cMlZHg8AlGqMd4cnC7qltgWo9F2/9/Hkq
	Mn42zVBlgN7YVWDU3VXxgDOvU3vpt4Rb9n17n1/tJSPXuuLoQkaXAPzrnUxrY6M+BY00ufUD6R1
	9SP6ijGCtnlfQpmfHMdOsCNV986qsM9SeHnPDvAIrxywXgSf6NV9m1yxFbgJmU/KArHrwCa8eHb
	GYSfzLcNAq0mvdHavduCkQ3tvKgNVR1w2P/v5UZmX/WuF4Kf5h2kzKqjogmbaHt2agl2DvT0qML
	y5CorwtoNWHArTcVihX7edO7QrXJNPHoSMyOfUkIPGEC/YJop0D3acVcq6RQHn4NnCPytMaSJe5
	Eo65xxNkEb5nzEpvBWIJzj6ghgCsDNjg8ydM=
X-Received: by 2002:a17:90b:4a92:b0:398:9beb:a2b9 with SMTP id 98e67ed59e1d1-39dfe1ca2dbmr2501324a91.27.1789435234670;
        Mon, 14 Sep 2026 18:20:34 -0700 (PDT)
X-Received: by 2002:a17:90b:4a92:b0:398:9beb:a2b9 with SMTP id 98e67ed59e1d1-39dfe1ca2dbmr2501272a91.27.1789435234220;
        Mon, 14 Sep 2026 18:20:34 -0700 (PDT)
Received: from hu-hongchen-sha.qualcomm.com ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4e4fb3esm29216573eec.7.2026.09.14.18.20.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 18:20:33 -0700 (PDT)
From: Hongcheng Zhang <hongcheng.zhang@oss.qualcomm.com>
To: andersson@kernel.org, konradybcio@kernel.org, abelvesa@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: hongcheng.zhang@oss.qualcomm.com, hangtian.zhu@oss.qualcomm.com,
        miaoqing.pan@oss.qualcomm.com
Subject: [PATCH v1] arm64: dts: qcom: qcs6490-rb3gen2-industrial-mezzanine: Add PCIe wake GPIO
Date: Tue, 15 Sep 2026 06:50:20 +0530
Message-Id: <20260915012020.2667577-1-hongcheng.zhang@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=c/0+0h9l c=1 sm=1 tr=0 ts=6aa89d63 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=6FOz5cXy--B9gFNoW_kA:9 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDAxNiBTYWx0ZWRfX3a2Ojagq1MhW
 +gQ3fKZpTWoI0Vr+ZtEU0dOZQmgDLMVf7Pucd6DIMELzcpGucvQlo/JxInM40BwCKEKAhhpxGNl
 drlEZNo+nQi75RKsLWobrbn7TmYoW0AM4CkY/nBfrTAO+2Xg0KeawAXVJiXWPNHzLDTW57+aXiZ
 JrTsLT8wjMgcMD/0Zbtqjc4WSDvdMxJU2FocE2NnO4cPm1vkKGMGGZ9CayvjwPgfviyS9arzmH6
 /2me2tv8CPYVS4smZDFw04LuvVGimfgpJK6PW941bnm99VD+vSUOlWs/kJNvRAWRfWYgypILW2C
 N5R0yL4OWd9gvDscbxEuPZ8zA12ZhsqQO6i9Y4qh7vCL2Igaxvry8R/WZ8x1u5NlzEOvkC64B7+
 XnVXLb6BQTRo0CXpRABRaIImXkM6SCNeIvLVWEq8RqK7jWidfDSCEI+xagO0hSYZEj5/4XT7Bfk
 3Wi9foWtqxiUEB5eE4A==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDAxNiBTYWx0ZWRfX+klrI0Ojx+15
 53I1gvfXFyjWrnfs9twwWyJNWa5OzQKILbaRgLpo1114KAhsrkbnnfYnUucmVOn0uslvom2k47c
 fOjDrA0naV5Zri5f0T4CeRWXQJkJRlo=
X-Proofpoint-ORIG-GUID: 3IFu-ZrPug6fIxzswzI1AgQBVkM2nbYb
X-Proofpoint-GUID: 3IFu-ZrPug6fIxzswzI1AgQBVkM2nbYb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_05,2026-09-14_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 bulkscore=0 impostorscore=0 clxscore=1011
 adultscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609150016

The QCS6490-based RB3 Gen 2 Industrial Kit cannot wake from suspend via
PCIe Wake-on-WLAN.

Add the wake-gpios property to the PCIe port so the WLAN wake signal is
propagated as a system wakeup source.

Signed-off-by: Hongcheng Zhang <hongcheng.zhang@oss.qualcomm.com>
---
 .../boot/dts/qcom/qcs6490-rb3gen2-industrial-mezzanine.dtso     | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-industrial-mezzanine.dtso b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-industrial-mezzanine.dtso
index 46bb52c667a4..b2bd60dad1cf 100644
--- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-industrial-mezzanine.dtso
+++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-industrial-mezzanine.dtso
@@ -78,6 +78,8 @@ &pcie0_port {
 	#address-cells = <3>;
 	#size-cells = <2>;
 
+	wake-gpios = <&tlmm 89 GPIO_ACTIVE_LOW>;
+
 	pcie@0,0 {
 		compatible = "pci1179,0623";
 		reg = <0x10000 0x0 0x0 0x0 0x0>;

base-commit: ac38b483e5aacffecdf0c91f7d767ce6284cf57d
prerequisite-patch-id: afb3d6a9952fa85d5ea4e9a6e19fdb54b03bb9fa
-- 
2.34.1

