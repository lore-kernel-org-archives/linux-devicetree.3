Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45A0E3E9594
	for <devicetree@vger.kernel.org>; Fri, 10 Apr 2026 18:43:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775846640; cv=none; b=IiktnTUlefRxsXxqZcn3trayFJEU3X5SVwuhqWQdKAfhaQVRrQGEA3TKTe0jUwFyQf6rkHE+r44TyVU9dOECJKMWwtQGRBQ+lV/Em4og7MOIbeplE4j+Q3/KCFctMW6m6GE4Rja/AwYjWveGCM1c2T/hMYHOpLB9qr8n2U4u7t8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775846640; c=relaxed/simple;
	bh=aEBAnLlxCZozHzOwGXFnubDkSflswiY+W6QfvA/HVhg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=t+eAB3s9MwHkL4BOST/jbepM6StI2zuWVTz0Q0hw/vbYE37JTO7F6TnZfTuoaFPuH8JmvSXPiIlSWNAko3DswM4C9tz8dcds4Qo+vQ0uxe/rlKP46Rs+hH27yTHnd41HFUkWG8/Ux2sN3D8iAbFP1bdFiv4VQasmqe/spUvPAEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KvVJjqbk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XtjQdhYK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KvVJjqbk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XtjQdhYK"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63AIKQdR3743046
	for <devicetree@vger.kernel.org>; Fri, 10 Apr 2026 18:43:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=61VZ+Zf992l
	YtRYAJuSIdkeDIpmhb6h081Ez0jvr6hI=; b=KvVJjqbk56EDSzP7ydEl4AyzaoP
	KBwu1RotbRANVdv0Ib5F2/Vz2Jmu5qWx/ERf+7IhxMJcbJS3LRCJJ+juZj+S/5lQ
	/XAvXN230aFKYSLYrzl3lFQx0uOUpz7XrcbadBN2arFsfwhhMpRnj6yTvn6zZmpi
	pjJbWSDPLpk8mpgmeV+Ba40vHJp46KD7X7DYCaZE+WfafAKWJHCoHCnbczbIbn75
	9XJLeLfuBEWyzsjr5jTiw0c/8KWrgrQzDnSmjxDk2ttCLqXKZJeyklv1h19GpYH+
	n7RV4DXkCASVfDJHx/qEPOEnOyuep3caZa9kvalKFKnfbLfxP+svstOfTTQ==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4deytnhdqh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 10 Apr 2026 18:43:58 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-82c9364612fso2682027b3a.2
        for <devicetree@vger.kernel.org>; Fri, 10 Apr 2026 11:43:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775846638; x=1776451438; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=61VZ+Zf992lYtRYAJuSIdkeDIpmhb6h081Ez0jvr6hI=;
        b=XtjQdhYKPsXfpWrpuNIWC7Kr11cAkK1lPGlhRWP6y4m8j4qLHDmiS1/e5WSfDWgl4w
         smtBCQC/RgtDpMscKFzAOZefCrhvY5GFeZbFDye1tELgzpPYrir26MSjKwVzmyu+8kRV
         ec5+e7Hi6I9YnG6L1GN1/pr/kEb4d0SsnO9RCpFoc0He6A3daMKrRpjbNe9F6ltMsui7
         V3w65UtcRz2ZP1RRo00jpUqsRV2CO/DP89kyXP0ZVOt2CgayAy+WxWrjttWRqk+f3eV1
         +UfTKgnn35e2DzKd3OubQbxGm33+Znim14hAaUd8p8y3HX5MAmwprCcGXcoIAAa9k8lG
         52xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775846638; x=1776451438;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=61VZ+Zf992lYtRYAJuSIdkeDIpmhb6h081Ez0jvr6hI=;
        b=ZWh25vWa01ekbfJNVro8K+2to31q0hsTgWOHR0h97go5/Fa9jK8B32SjDZVmUnzNZi
         FsqBIbzOiORpbwoSzpxvvs+e6IZUXgtJ4N7fmrSIX3++HlSWTzH7Cn6kYGTB0kFHIIU+
         5ihd49euFesCCZu0f58AnBuB2KII79xji2I7XZ/VV8U9e7OqOsjyQ0IV1j1bcdGrws/8
         RDfGaMviAMH+l3AaReW2bKQwB8LaWQ47Vqewk0TTqNekAe/7iouWe1i1GEu4pClrTio4
         9as1xnrZPctfRatxim+gnBXvqSMLX0sYlWifpXAUhcLen5N9ae0ZLJATKIVw20M7cuFT
         yV6A==
X-Forwarded-Encrypted: i=1; AJvYcCXBQh6+lBzh1vlVkDcIZJf4Ca2X6SRua8uvNe10Sw9A0BA3UZzKctvYtj+csW/3vh/meWHT2yESp33Q@vger.kernel.org
X-Gm-Message-State: AOJu0YzJ8UIm92tm4BzvSlrk9WPepo+75XX1wdaOBmdR78yik8/rJlbm
	Kc5PN/+liI1l7L5KwRqtv26IDsUPvSPfe1cW6aukAcSL/XTQEdSDaIcl1A91F5HO/4cYrBEsrH4
	e74dD9QjpnGfPFJConqQjvqWY1ttFWcGkkhm4PZpdZq/tg8xYrQ/srg1sJhl69sIU
X-Gm-Gg: AeBDievcUu2ms6Cag20BVZHRLlznUGFXJ72ngl+Ow1IIgSUpAmbG5pJZ1Hcjw7EimF2
	qJmnn3jVf98ulzTEl9ddHqmuvoyGqrRBr5oBGS9he0IolDDkfyPUSuoKRd8z5eQmzUsUxLRoaX9
	NkQKV6DbvUuP24UM0ioe/7rq3HaqEPHP7AgeWhCfcHcRZJygL4C3bm/zo1bASvfQaO9M4SHZ2Z9
	HInqZwuJsF77K3+NZ3UvgLZl5Z/XuDqeRVrkKQ4Du2gz6Pp0OPZuwtlDnCsW0OX4zcYDqTvkGYt
	nseFZTMqYPnQ9W6cmCxyi8KXMM/5AIEvB1cSuB1IZPrYkxa5WOEUNXgLY7ABtMseTaEW9pPz5nx
	nDS7nwrTOfsncBBuTtN7cpSxfYKpcfr9spsmwqZieLVSDaFbB
X-Received: by 2002:a05:6a00:8d43:b0:82c:dfea:9e2c with SMTP id d2e1a72fcca58-82f0c1dab05mr2927417b3a.9.1775846637894;
        Fri, 10 Apr 2026 11:43:57 -0700 (PDT)
X-Received: by 2002:a05:6a00:8d43:b0:82c:dfea:9e2c with SMTP id d2e1a72fcca58-82f0c1dab05mr2927403b3a.9.1775846637334;
        Fri, 10 Apr 2026 11:43:57 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f0c32e744sm4036922b3a.13.2026.04.10.11.43.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2026 11:43:57 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH 29/35] arm64: dts: qcom: kaanapali: Drop unused second PDC reg entry
Date: Sat, 11 Apr 2026 00:11:06 +0530
Message-ID: <20260410184124.1068210-30-mukesh.ojha@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: oH8KfNwKvfXiT9TjdaeXqL_HSPfvGGOp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEwMDE3NCBTYWx0ZWRfX54epvhJnysaX
 mvz0l4AS+1JsnG8ZjfS9IXw7b287LgXldJ7VXMpLBnn6MWTUmWjInG60T8Ejxbsakqcmzqw/9IR
 btNhyup3lhsMIYe5MUgX7WwHD6nJxPm+/fzpybPH/ER5FvpZikAlk7cGRvXchW8SV4lj7CqFxJI
 Si36hhSwxMJllpcUfLSLJ/uEmyrlgCB8yWGKtBfy8X/rA81kVmAfSO6JuBdS0K+yaF93m2Axz4R
 jGyp2UbUu7mFdw/shArrF63ePeQQ/WEQvHizuVc0R03H8dewW3g6BTK76hGQ9KwUOKQOVG5GwVK
 dnM3GN1nJ2bDo1MvlsjnN30JuIIeRQPFWVls8QCbl8ek7HLr6NMTIUCcYSvfZHWuYH3SoxKM56G
 eHFdA7lPuikePbqcrQ18EjcQPqhv3rEV4fogkQS2twoOVm6HfLyRUmuAkqjJ5RXOLeGBEYZzc9L
 e8PFcaC+Gt+dxZ/ogCw==
X-Proofpoint-GUID: oH8KfNwKvfXiT9TjdaeXqL_HSPfvGGOp
X-Authority-Analysis: v=2.4 cv=crGrVV4i c=1 sm=1 tr=0 ts=69d944ee cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=kyxYCa5QF2EFglN99kMA:9 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-10_05,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 bulkscore=0 clxscore=1015 suspectscore=0
 spamscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604100174

The PDC driver only maps the first register region (APSS DRV) via
of_address_to_resource(node, 0, ...). The second reg entry was never
accessed by the driver and can be removed.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kaanapali.dtsi | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/kaanapali.dtsi b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
index 9ef57ad0ca71..7cc4ff48b3f5 100644
--- a/arch/arm64/boot/dts/qcom/kaanapali.dtsi
+++ b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
@@ -960,8 +960,7 @@ opp-202000000 {
 
 		pdc: interrupt-controller@b220000 {
 			compatible = "qcom,kaanapali-pdc", "qcom,pdc";
-			reg = <0x0 0x0b220000 0x0 0x10000>,
-			      <0x0 0x179600f0 0x0 0xf4>;
+			reg = <0x0 0x0b220000 0x0 0x10000>;
 
 			qcom,pdc-ranges = <0 745 38>,
 					  <40 785 11>,
-- 
2.53.0

