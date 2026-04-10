Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D500C3E4C61
	for <devicetree@vger.kernel.org>; Fri, 10 Apr 2026 18:42:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775846562; cv=none; b=FqHHK3uV9pNRJ7e5ipfd6M37nU7oJQGmUh8J/h01MlHpEOj3SYepHezeKb2CtDdlrOLqfuT/0QkhsxLJVzGz9CNh0SEeI7C9ZUUpBOplNYG0OkdT1YXn/2/CyaP5CWhkTz84KsMNxX7kyzX5Jc2RiZEE1KWdO87syTfoOEJ7SLs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775846562; c=relaxed/simple;
	bh=2hgokaPjOt5OrTCQLArfgijW1nQy9scMVj+K4FAggJY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oRXb/WVBr8cnQnH3pA3v+ndRww2Z0ffjx7QP4YViro9NnPCslgoyQrDVucF+aaITltsUbPWHa05dpQluxVu0gEIqJhzyOc40R9eg2MViP9I6j5Uv2Ps56j+9uJRE4/MwvO74gRbjCbpOkJBA82g0fEgr22vhczaNNqdBMvThXwU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=V5bO1MGY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kjpGi1ef; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="V5bO1MGY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kjpGi1ef"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63AAhbN01925770
	for <devicetree@vger.kernel.org>; Fri, 10 Apr 2026 18:42:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=RdV1nkqBhKs
	RWW2jhUP4vXyDpWHM4v7t28eNP9G13sM=; b=V5bO1MGY/ebmuDonXs3ZeJDCUhA
	bJmTFug3RsGyAQTQhGpZKsRS8+HkW2FvGLJvLUgr3vmigqSR0cUQNC57MH3mmBAA
	IJHvjWGDphNF0JiB2RQSipXfM9bbFoWQipZGHAFy0BIMOYWfjU9d6jCrqhHQiPec
	PINk3mEYdQaUW6EUDqoh3T0OYnHgppiA1JjfdtCUkREAZBeIDymmFhDU9DuOZgjv
	mn2hkiCK5wljRUACnqDMUbLUCcmsItSTYv3WsAkQgd5SvSEvBWVyN0E5rH2oFddW
	C0qewBW7/nzxUTcEADOdeYzsyGSaX2ze1/muMqrndlyY79pQdmE1+ExznvA==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4deudjth7q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 10 Apr 2026 18:42:40 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c7691378914so1122785a12.0
        for <devicetree@vger.kernel.org>; Fri, 10 Apr 2026 11:42:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775846559; x=1776451359; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RdV1nkqBhKsRWW2jhUP4vXyDpWHM4v7t28eNP9G13sM=;
        b=kjpGi1efXHM+9F2qm6E/N8rjixLQyfKr05hqPzh+eEHZlRhkMg1VWwdjY+8/8/glvk
         EpBiNEihpjhsCDqE/uACKgWuKD+YVHfTUQVGqpnWvG7sp1IgrK/AzQ/NQtcx/HqKcwZp
         cqgwbfXU9pjZtKLXn5bjDE0P9GxsmDsS3IvnIrbImDAORUcIrCVrVjqTOzN6CUojRIss
         PAHowxJ4HLI/neAhAQ/wbipaUVctVYV5TKGtaDn06z9wG0KuTDxE/x4oD1LzQTm3EgTL
         k6oVJj15DzQhll/v3JTmoqbBc0OCvc/SFfwsTuJZgN9tKZPcGq7ftpaeHJsY4dBCZgLG
         ronQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775846559; x=1776451359;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RdV1nkqBhKsRWW2jhUP4vXyDpWHM4v7t28eNP9G13sM=;
        b=Wh2tnvEua5fGjuF9B0dAte2CUetlu1hbgksYST5bR1pgsNc6Ng63dZLpKyeJ7Uz+DA
         YFlr1sBoSPzXzTI9UJS4m9VfghvC4LX++U/FMKs7P9mcnYUyvlCCeLKvSZ8rMTXJUqlZ
         Fv6f/uLeNXGI4oxuUz8sBDSSJOI8M2hcONNJhRuxUtKq8kAO16yyz4wLyQayLw+b5He1
         1rOhwtvBDrroH9BHrJdeSAacPzHGynE57RhvPheKPUY2GeCZq79ja4Z7RZgWsPANw/sg
         V5ixObD8oOfuhJqu+bghlMuB8EJt3lB40z/bu3G2R/oyILBhaq3oQ4BuqFUaxLKVQBVW
         lUOQ==
X-Forwarded-Encrypted: i=1; AJvYcCXCDcupaVB8aNfWDH9EU5ObIuWWRvJmFSUA96e2Ctf4gNrqzeFolhR8UGReArzhSLB7ryjRmWgCKnG7@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2zRq3md/Ko+l70fDu+zrqvDpK2jkzNHWoMbeX3tnjkp0zWvef
	1NVtNxeg2kdPkrI/vbYHrLuaSs3mKubV3AWXrEDSSTbnSKpWiLlq5fqNC2AeFG74VtyeAgluidP
	PQaJUYDfT7w6ZCRCdtI3MJUP7/pwpqnZtxilISva6cmT242uiJoBMQP3uhsZph/BA
X-Gm-Gg: AeBDiesbOaha3gXLwYcgTvnKhkr6lwvYNC+KO/tHC3TmXVkBei39Cmnlge71VXFO1c2
	gPZIl1flG02YDUBdAYFT4Mc3yrLgNdaA32aICFIZ6IK7rIQ9DQLk5W3ocT3hZtXbV+iTiOPFoM+
	jCi9y5pDqltOPIROEBSSSQwdkfakb6mpWN+eXShvDfgpakJEmgBYjjeOZWbVlcL0QG4IXFQqo0P
	ktlMu3YgSbxR4VJRlUl/29TriCgBcDNNTEpGYFkZ3KQDybWeD8C2iaNxAJfkH+lWt7mXY+o6Nvi
	gOz0et5BbJCbuzSpT5KcDo02mUooeQ7ZxhHaPRWFK8JMrfYcua+q2CANOZQ3o+WqbOEx7re+W7j
	lVlH/N88dSgr0+NES91ij8RD0XC6yhVJ//oknWXqzoJTFAXYf
X-Received: by 2002:a05:6a00:3028:b0:82c:e692:1f91 with SMTP id d2e1a72fcca58-82f0c2b368amr4743571b3a.39.1775846559338;
        Fri, 10 Apr 2026 11:42:39 -0700 (PDT)
X-Received: by 2002:a05:6a00:3028:b0:82c:e692:1f91 with SMTP id d2e1a72fcca58-82f0c2b368amr4743541b3a.39.1775846558780;
        Fri, 10 Apr 2026 11:42:38 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f0c32e744sm4036922b3a.13.2026.04.10.11.42.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2026 11:42:38 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH 09/35] arm64: dts: qcom: sc7180: Fix PDC reg size to single APSS DRV region
Date: Sat, 11 Apr 2026 00:10:46 +0530
Message-ID: <20260410184124.1068210-10-mukesh.ojha@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=X+hi7mTe c=1 sm=1 tr=0 ts=69d944a0 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=oy73fdSuVNde8ymsYewA:9 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-GUID: KEjpU4x1bo-3ODdsaVYmNpuXVsJYHABF
X-Proofpoint-ORIG-GUID: KEjpU4x1bo-3ODdsaVYmNpuXVsJYHABF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEwMDE3NCBTYWx0ZWRfX227wFs8ei3w2
 TNf0DenoN+V1MBPDbnGYOWC7aibaROVi9Oc3xO3yjhwirYEnKBwAngtHiXy/TW9uSEyz1RaAu5W
 Ddn9KWuiVyE6BOo4NheW2Dj+58PMhDatSV/mVgVSBRcap8xm1DOvTF1Ys6HBP65CDTmuY4YXjDo
 Y0Sv/bRRzU4Xb7aBh4l4XUhl7Th9UyLzneXRhadd5zxT0VlHDfa27JMYVnV+cmYh+rDZQZDYYhF
 19ldEjOnKRJHRvi86ifHRPt386ZpVKU/yaPZupjgRk4/bFuBgOqA4QjtGf2g19beILLSEWrH8KT
 of6IULVeEiyWLIOE38XJZRT0ZEzX3Eq/sdeAUHYmv6hJxBg08HxtwVFnpDhrms+zorULIyOzeLX
 SeGlsJtWn9lDGnIc8hSg/XkZffNf+ghwlvZ2DBSekE4+FTrPNp1AbaMxJc5mAteS53jH75kub7o
 75p0o9zgsn68PSy8KNw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-10_05,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 clxscore=1015 adultscore=0 priorityscore=1501
 lowpriorityscore=0 suspectscore=0 spamscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604100174

The PDC reg size was 0x30000, covering three DRV regions. Linux only
needs the APSS DRV region which is a single 0x10000 window. Reduce
the size to 0x10000 to describe only the region actually used.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sc7180.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
index 45b9864e3304..52bc7d1aedb2 100644
--- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
@@ -3505,7 +3505,7 @@ dispcc: clock-controller@af00000 {
 
 		pdc: interrupt-controller@b220000 {
 			compatible = "qcom,sc7180-pdc", "qcom,pdc";
-			reg = <0 0x0b220000 0 0x30000>;
+			reg = <0 0x0b220000 0 0x10000>;
 			qcom,pdc-ranges = <0 480 94>, <94 609 31>, <125 63 1>;
 			#interrupt-cells = <2>;
 			interrupt-parent = <&intc>;
-- 
2.53.0

