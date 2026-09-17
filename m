Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ADE63AFB03
	for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 11:55:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789646117; cv=none; b=uMwLJmSjWwTzGv1dLVFGRZD/7fZ4oz4LDWFs3hIyTTLo9866d/nYeW3i1RgJqr3cUxP7btA48C6MGCpjupqDjBORxrlqBPgNhBjaJCH0R3r5k+3E+SZ6WeI2nKRN09Iv5zjdgcyeAgwBHQVERg6134Tce67gmz859GD4ffzOdag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789646117; c=relaxed/simple;
	bh=qFrl7WrgaxIYzKwo94j2z0epeDU9I+tiR1m//FB9MyQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dXsIOJr7mfXwtARdptUtOPSWLdfjYzAvptxSec0bnLMVYErEj1TYOPqvo+ozKnjLc9fyoH5yvR9uYsbtahaWyv4TjQeVseTnMwr/5mwL5xV/x8ab+Hizvt+Z/HpR2dX15aozE6nJQZ0ypXCWVrkgzK0jyvi0abaVh/D/qQfxfxU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=j8ApK44a; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aSyvN05U; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="j8ApK44a";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aSyvN05U"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68HBowXZ2013663
	for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 11:55:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9k04XZF7nrclELndGiTMJ+Gvnkd8sVoWYHrmD9OgukE=; b=j8ApK44aOG1Lh8GT
	zRejx49i0rhsV0NYm6Rvw7p7NZCi/Jmtf7BuVAWwTZvhddUcWcUTMd77KF9XM9jy
	JyU8SStzYqIHGlgIdNyMeupF0TAJYkWaFLqtUrjbPLYdygUTWmLjHQZr9zqgD+I0
	iDMUjfuGWICxZXtHBFd2V2+0u+vpgZvE4aGwUi32D+VWnLRnPUWj/Q/rjkLh+ul2
	MApcWrdiZ1MoPlDb6x9dTyoL6mRAehl6LFGYiEbXgXbv4cjfFww8V8Iusc4xkPmm
	/T1tfvS+Qn8JfVvCCWN2uYuBL5sgjX7ni6hnknEb7pEpkxpRCSTq9A79PtgtQy6x
	PHwqLQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4grfppg0df-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 11:55:05 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-39e25a5f6e8so1484490a91.0
        for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 04:55:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789646104; x=1790250904; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9k04XZF7nrclELndGiTMJ+Gvnkd8sVoWYHrmD9OgukE=;
        b=aSyvN05UdQaC3mZz1+jIJNBa3y+mtsu4gBVA5RYGdda51zB8K9DfUdit/54DoXDn9r
         gpPHMWgKNBON5LB7qevaAKEpEKH+H1Z5wH9S0Hx28Cu6weF9P4ZmZu7bTpdzoHtoZkaz
         ZsWoS4lNy9zLcQ1ijAh0N6G9bbjY/oiPFlQvr/Q5cS3Xc5hBBpy0y55BGNByseDnmYnq
         56HIFjxVk9/FxHJfx7xfTt3rsfnKQPIWw0sJToEWYWsCJv9Cd2dfV3Lq108k/TLveqyn
         XC6h2oS32Dao2EwvCzDYhzqiSKssJlJEHWGpkYSnZtmAHEW7YvFbqX+aS5aB4CS/uQSm
         a5fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789646104; x=1790250904;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9k04XZF7nrclELndGiTMJ+Gvnkd8sVoWYHrmD9OgukE=;
        b=vtdFnoJoCb/hVqIbgxSid2qFQuqnmH5sYjLrfnwD33qjbH3cNNMxGIaK9YeyXvkj1R
         xBjJpAKbYVm6QpTnOE82/uGXZUUME/HI8+BHWeNPA0kpm9ESbzD/7hC6V/GBUvQBKIQ1
         nyBue4T6L45KKlPYsTN5XhFMZkUHgWao8LaElOMRWEUkiZZ4tIbWSrP3zAcS2l8nMCfd
         US/GBRDXi0Pb91MWPoMLHkWBa/KNBeGgNWgPIHsbOHlLOgPvqtR5HlCrPHQh38jpWbrB
         6v/05CykHpX3qJfCQ7U0SWENy1DDv/oFMuB2DvNyhEC0HvNzcR5NvdyN8VmOIabSKG9N
         0IZw==
X-Forwarded-Encrypted: i=1; AKwUvBwkMWlFx07iSOdbZrQbe+zU965cTkuhW/qJaw7ng5CrWtyiAG69+IR6IJuSJe0NresgdWYd56BP/p4t@vger.kernel.org
X-Gm-Message-State: AFuF++lp9x7ATESvJcLyldyS/PCC/D+iNu+ApFKOTV15FEGFF+rEG1T3
	NZQBH0IODRkUsLXRfneVE9EAqLlWcHqh0bE7iYpDthTw3tL5oMUfg1nwYW2n5RmbfwrlrPlpLfZ
	dWcl1Ja0jqB9aRB5MWlnR0XHtLuOBJidyJKWEFP2BmIw3g++5VXRq/1TLTxWPOQSZ
X-Gm-Gg: AYBFou1Lmx2KS8MRsMsbfnTmwnXLSMJKt77UzOmq0URWgl43UuUB6ZGVPRbRIV/JpaH
	3CF+vus1riS9N+yGmdlg3ENE3uzdVl4lok0hZfDCjra5RIv3ASYaOk0jYGxM7HARCIBT6G9YGe2
	lJdcv1g4jNaFLInWIQA6U9nCpZgw5jcYKlcQCpDsm9p2ux6JPpJ+JvYT+ZG1RgldlvMvRfvIckp
	V3fQSwQC3RYhNOl9vtOzLTf6Y1kw0DuQjlA3t6s1h+zQRqJFofT11229D+8pim2i/Ql5uHSpPiz
	ZKFG0rSYi/1o7FdSP6kCBDdr9/yZATuxMahKwjWkN9s7wVxnYLrJSBDXnyNlNPtbpZykf+o7hZC
	WDO8r+okQNCHDegIzjlhvbNEQcprbBtcAdw==
X-Received: by 2002:a17:90b:2ecd:b0:39d:f770:774 with SMTP id 98e67ed59e1d1-39e1e4e534dmr14854986a91.20.1789646104480;
        Thu, 17 Sep 2026 04:55:04 -0700 (PDT)
X-Received: by 2002:a17:90b:2ecd:b0:39d:f770:774 with SMTP id 98e67ed59e1d1-39e1e4e534dmr14854946a91.20.1789646104072;
        Thu, 17 Sep 2026 04:55:04 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33bf596e1f6sm18249500eec.1.2026.09.17.04.55.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 04:55:03 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Thu, 17 Sep 2026 17:24:15 +0530
Subject: [PATCH v2 07/18] arm64: dts: qcom: sm8350: Fix PCIe WAKE# GPIO
 polarity
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260917-root_port-v2-7-0d627d0856d5@oss.qualcomm.com>
References: <20260917-root_port-v2-0-0d627d0856d5@oss.qualcomm.com>
In-Reply-To: <20260917-root_port-v2-0-0d627d0856d5@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, konrad.dybcio@oss.qualcomm.com,
        mani@kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789646072; l=1200;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=qFrl7WrgaxIYzKwo94j2z0epeDU9I+tiR1m//FB9MyQ=;
 b=puig+0BmWukdWl8Y9ogPXz4mdKTiHsG6QDjh0p9xlpu8lR8z7JmfHfZ5Me6nodhoy/zvogCSM
 8O48bAaAp/hCmZJqJY/0XrpiRsQhRx1Ur+UoK11g9JhjezNGf2zpzpb
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-GUID: 3UZG4DMfI5LP6TUnhUO-xEaZUiJ7nZ3U
X-Authority-Analysis: v=2.4 cv=YcYodARf c=1 sm=1 tr=0 ts=6aabd519 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=_k9ig2nQFDp-gxZIyLcA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: 3UZG4DMfI5LP6TUnhUO-xEaZUiJ7nZ3U
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDE2NiBTYWx0ZWRfX/f0mIOkX5ZdN
 6xeuZXg+pOTEM2hLFiTAMXqWyRoiARwtyHf1QCpw/FB2eAORosuMTVAiG8oXZg8TuPk8G2Imyvo
 W3ze+2hyQJSy0jOYRNkBcKeEaHR1+4j2rDgGRsI/w6m4tTMChjzZYRkJtuIrS7o7Lc3YOzmdVnl
 T5F3T4mNwp3Y3/lPRNqhfVv36FormQaSTreGOHp35oFcz8hEGwgByA9mhFZjACMykoUQcbzFIqY
 wd1nIKk9kvE1mul5n7jTbqr+SAPm1iYVbAvS/3vV6bvmt89QMYrFYZQ51I3DOK8F6gJKQRA+Pvc
 dcJBYRn5jUN81C2Rud3L+dVRf1GnLDj/PRaUUn6R0GzoEb73iS9ONiVpDpv6Py0HgYs/EQEDYp0
 e3neY3YZPg/yEXsBC5sTVED4AaZfd3Sikp3levIpHzVbzTLZbNzAOFPWtM0umAyauWaPT47OhLA
 lQOyBC4K2uKFkIsDJtQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDE2NiBTYWx0ZWRfX+tq22u500lvk
 dQCG/zz/yU28u67vaoBrEXWm/5BsEyAzwsaCnfOjyUHlmPzLF70Ko8j7aUIyfC/LgDTMi0/+fFJ
 PACq2fQONOuB6H4lUOke8i1o4wzFPkg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-17_02,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 spamscore=0 suspectscore=0 phishscore=0
 clxscore=1015 bulkscore=0 priorityscore=1501 lowpriorityscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609170166

The PCIe WAKE# signal is active-low as defined in the PCIe Base
Specification. Fix the wake-gpios polarity by using GPIO_ACTIVE_LOW
instead of GPIO_ACTIVE_HIGH.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8350-hdk.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8350-hdk.dts b/arch/arm64/boot/dts/qcom/sm8350-hdk.dts
index bb93c3e9417b..e9b9e03f725e 100644
--- a/arch/arm64/boot/dts/qcom/sm8350-hdk.dts
+++ b/arch/arm64/boot/dts/qcom/sm8350-hdk.dts
@@ -500,7 +500,7 @@ &pcie0 {
 	pinctrl-0 = <&pcie0_default_state>;
 
 	perst-gpios = <&tlmm 94 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 96 GPIO_ACTIVE_HIGH>;
+	wake-gpios = <&tlmm 96 GPIO_ACTIVE_LOW>;
 
 	status = "okay";
 };
@@ -514,7 +514,7 @@ &pcie0_phy {
 
 &pcie1 {
 	perst-gpios = <&tlmm 97 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 99 GPIO_ACTIVE_HIGH>;
+	wake-gpios = <&tlmm 99 GPIO_ACTIVE_LOW>;
 
 	pinctrl-names = "default";
 	pinctrl-0 = <&pcie1_default_state>;

-- 
2.34.1

