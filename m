Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7509F51477F
	for <devicetree@vger.kernel.org>; Thu,  1 Oct 2026 12:46:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790858821; cv=none; b=q1q1RQge7+9hxtgSYG+52V7NxBHP/u1EfSQztsrQjQfIm3XtoN9seEu3xagrFBr9uPHyzLF2lBG8vqfEAT0Xbo2YUiPbe3lx440LpfUFFtd5LAdeHbB/dJttDaW6qzHnB7+/Z7ry305H8IXkLczPguN+anes2S9eOFyXDEsK1no=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790858821; c=relaxed/simple;
	bh=dukl1Ljyz/HQATlIcbIQ+m05MS/1fL9Uh8qLiZk8FkY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GSKafSVChHTNvUJbZFmUkWQn+mFSnkzNYZQke+77GJ2O9FuH2kS27voWSEUmPu2j5HGAi3ulLCelreSgtfflsOZRvgVl0RX0nIuthp+/E4qaoifYHROFFtYKeJVaD0PczlaNnIRlWiAnOnDAYCBVTiyKlRX7Di1owQpJcGf7KT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Xzi86fjV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=F5aa/ypB; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Xzi86fjV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="F5aa/ypB"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 691CU4Oc396309
	for <devicetree@vger.kernel.org>; Thu, 1 Oct 2026 12:46:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GqljWHmubT+QY/DDdNs+Au/WeKxBS87FKchbCGNuj3M=; b=Xzi86fjViShIkO/Y
	cOlkGwCFgWRKObawzPT0yQZcV1ku3jbjQNxJ3UNwu22Lu7FFX7k/zaC7pm//f5io
	AGre6/tjv66WWFH5xQP60taQCijh2Va5+z/rL5zi/2Na+ZSN28A6puKDkBKUEefh
	mp3uuaGVY8dt8qzsHY8TVJNTkI+2NX72wMZOGTD6aH8WQyl1i2o0XOq3LRDEcf3I
	f1lFA3fEU8u9XlWnDWwUksBfnyVGqPhBmaxB+wS2snZFWPt6AvVQyf8L+JCjLpeo
	lBBplUgPUZYCVSwpMlCDx4CdSNZE8SsB6nOdkRCjZ+p3l4DtQBXLgmxlwrKWDr0Z
	MprhVg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h1bh5axv8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 01 Oct 2026 12:46:58 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3a4f7eb79f2so871714a91.1
        for <devicetree@vger.kernel.org>; Thu, 01 Oct 2026 05:46:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790858818; x=1791463618; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GqljWHmubT+QY/DDdNs+Au/WeKxBS87FKchbCGNuj3M=;
        b=F5aa/ypBupayPqbIGKl8TbEuE5quiRI/eVNHBa14YjPZvxP1wGVlr8X0M3YLs/tHk6
         +viFQ8o+LNURFADfoBUXudsnuGAYOIMxkvfIi8JMfyDWiEcMCeyDb1ZG6POvoalujVQL
         ngI+8T0hOYDr1mmxW70SC1Z6DrdU9ceIb4dSTWOXEtLtCGMHNx55ikQgsvHu+69nSmF3
         +wWLe2xIEoiuUPEAWGgKCwocWLeocbFAj75R0NLIskvR22XIeii9KdnePJX3n7O0phTL
         l+PrjcByDImu2LFe51CKLVuXDEGN7o1xUrL4BMmro6BbbIIjV5Rf9bp0V3QmqpE3e5Rm
         UE8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790858818; x=1791463618;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GqljWHmubT+QY/DDdNs+Au/WeKxBS87FKchbCGNuj3M=;
        b=ZjRGc+XxKzf3FSHsPtTVY9eNVemlHxhV5DAzLbEVWkbv7Hj7nJRjod/ev8bkk8o7Wa
         zRkAc5peE3D8Ft7uFCQxboEnjQIYQ7DplssllXJVk9nFKjfHYcpe4iD6KNdA+D/oQA6f
         LWhnhR/f24ZupBTvKConS0U/15RPkF1SfWaOMLHb0QMqL/bIXUeZA/piC+0wPmbc9zgc
         eC+EvXA6Tb5LZYQh9+oEQ9T9l+B/XdAn2RkaoslW3SwGSg/PBS/LC7kFo9jV8s+PKbJe
         BMlxsdkAK+aDtkN0toY6Ca/yoJBpo0AtHNj03JYjwbTmKLDv1tZxLxUpJCH/HrcTby+u
         7HAA==
X-Forwarded-Encrypted: i=1; AKwUvBymWY+rBuFDEe9ixODnX14SofKaUFkQuLIBqAU43aCNl7Yr1bWbgVXL5ZCW/Y7bRnLHCW2DNRMwyeKO@vger.kernel.org
X-Gm-Message-State: AFq9FYIAK90gGBRVDQ27Ger5zvoZZGLjAGawtcSQziq8pPUnC0JAjotS
	iWLSIPbxs46A1/0RGRcl8pVXV8kzAEUD0S0HzeAM7yTsFX85TcqSZCwNP1v81oesSnYPDZjtgOU
	H8/jjPI1Hiubs5b64a3sPiA7JsGAjvEgnVeuZqPbodLTsgrzM2t9qIUTzgMklGcsS
X-Gm-Gg: AYBFou2LBIIqYfhAl9ikU9CT9WYaafRuHqiZoS9xAqhhuy4NYChLhie9Sogq8DkCh+I
	LT4LFM3F9CXKCjuRWPbvBFc0I9mzY2vXUstNV8NhyJe4BbU5Q2jsEpNpYOrzhaULBxRQasV4l00
	oCeGGBB7FoKNrWK0+SiHd2mONm4mN4Ya9vVszTya03Jh6o8ef6x7v5XJr2Pxvk4S6y56z+x/19W
	Goi712I1yXYwkpG8kY4uBeaEL/yuvg1GDx4HIEfwRfi8Koh7kYhZOhePqOCmn1MplX5JAeOiJHS
	EuxAqUWjUHIq/EcXO+2Fq9rH7amPEjT8PC+xS+BhkDB+syUFnmKgA9gFwGwaRS/x/h8JNfdgVEo
	VA+yx+tnsTwMSy9IFfPI=
X-Received: by 2002:a17:90b:50c5:b0:3a0:c717:2db with SMTP id 98e67ed59e1d1-3a4d1534cb9mr1845986a91.27.1790858817740;
        Thu, 01 Oct 2026 05:46:57 -0700 (PDT)
X-Received: by 2002:a17:90b:50c5:b0:3a0:c717:2db with SMTP id 98e67ed59e1d1-3a4d1534cb9mr1845973a91.27.1790858817203;
        Thu, 01 Oct 2026 05:46:57 -0700 (PDT)
Received: from [10.213.109.130] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a4f479dc9fsm4567467a91.15.2026.10.01.05.46.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 05:46:55 -0700 (PDT)
From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Date: Thu, 01 Oct 2026 18:16:29 +0530
Subject: [PATCH v4 2/4] regulator: qcom-rpmh: Add support for
 regulator-off-on-delay-us
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261001-regulator-off-on-delay-v4-2-258ba9612da8@oss.qualcomm.com>
References: <20261001-regulator-off-on-delay-v4-0-258ba9612da8@oss.qualcomm.com>
In-Reply-To: <20261001-regulator-off-on-delay-v4-0-258ba9612da8@oss.qualcomm.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Saikiran <bjsaikiran@gmail.com>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790858803; l=1514;
 i=jishnu.prakash@oss.qualcomm.com; s=20251014; h=from:subject:message-id;
 bh=FWP3PelIkgib5aeKAAfKPek7G4zEKRyEuHJz2tWubsI=;
 b=NCKe6DqW0jrdBRouJissm4D1foiw3igKo8u/iGZc8LyD/ZrM3lj0gnz1obYkO+hvNG2UaZfq4
 ymgvHQu1lhCAd7KfwzJwA7v1kIuYkE5Fk9Rgv314FSl2no87KjtgqQo
X-Developer-Key: i=jishnu.prakash@oss.qualcomm.com; a=ed25519;
 pk=g89pXdLVwRjdTeQ+uX1QzvBO346E3hQAc1N7fcTXgmk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAxMDA1MCBTYWx0ZWRfXyPSYBEpU6xWZ
 T2SGDbFk/343O9ZdhvdOq/yLJQeL3Hzf33LqT2Etx0QBZ+GlHs41n78fxKIFn8savSqqhQRwkij
 N0tXccrfTv8pBCxOcsuc+MH70jF+H6yrZOVofRv5/5BPkZjIXu/UwAcfZUetE4+4iuAUYLxYaGi
 O7RzZkmbWpIAdhvJQEZyG+wrVGKjhKMSFTM7FE5/21CC2S8Ga/KBewnT3RbcwmrYH6aWpFOCPLn
 7dBk1NRSEOb/ShkrVo+0RjtnOiEY8u1kMm2RhN6C1ooBR3mZNcsh/WqiijVAVNR+P/fQBFJriWt
 +xYDWu0581xcX/2ITGjLHOTMaIWPhyibW8ltv8PJFdSkt99kHzhaV+v2TJ1LgC22jsMa1WhCNy4
 FlMV/zrmB300AS7rbalT6NyXGGlZwLXlN0u6eIvhrC2dllqVD3QQezuEzCXQqDBGbEkOlR5HbAh
 /L1/nEdEtEgdzELwQKA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAxMDA1MCBTYWx0ZWRfX3Hk3i9Bp7H1Z
 k73GH1MXUlrbW4aMvj8724E4rUTSvBDhqBu9cheokal4W2okE4ukEVoKyjgSgAcrWZu5yqUcL7f
 vpLBSpMrH+zF/iEfpfWEkBaSfNfHr0Q=
X-Proofpoint-ORIG-GUID: -nTJLxp8w_wbSZG1V55mPWXXcMdl2JYB
X-Proofpoint-GUID: -nTJLxp8w_wbSZG1V55mPWXXcMdl2JYB
X-Authority-Analysis: v=2.4 cv=NrJE4MdJ c=1 sm=1 tr=0 ts=6abe5642 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=l1sNW-6lZsdIc3Gx828A:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-01_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 impostorscore=0 clxscore=1015 bulkscore=0
 lowpriorityscore=0 suspectscore=0 malwarescore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610010050

From: Saikiran <bjsaikiran@gmail.com>

The core regulator framework supports enforcing a physical off-time via
standard properties, but the `qcom-rpmh-regulator` driver currently
ignores them.

The issue is platform-specific: The Lenovo Yoga Slim 7x (Snapdragon X
Elite) has large bulk capacitors on the camera rails (LDO1, LDO3, LDO7).
When these regulators are disabled, the voltage decays very slowly
(passive discharge).

If the rail is re-enabled before this discharge completes, the sensor
experiences a brownout and fails to initialize.

Add support for parsing the 'regulator-off-on-delay-us' property from
the device tree to enforce this physical constraint.

Signed-off-by: Saikiran <bjsaikiran@gmail.com>
Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
---
 drivers/regulator/qcom-rpmh-regulator.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/regulator/qcom-rpmh-regulator.c b/drivers/regulator/qcom-rpmh-regulator.c
index 25c14de3cd8b..4773034b5d42 100644
--- a/drivers/regulator/qcom-rpmh-regulator.c
+++ b/drivers/regulator/qcom-rpmh-regulator.c
@@ -552,6 +552,9 @@ static int rpmh_regulator_init_vreg(struct rpmh_vreg *vreg, struct device *dev,
 	vreg->always_wait_for_ack = of_property_read_bool(node,
 						"qcom,always-wait-for-ack");
 
+	of_property_read_u32(node, "regulator-off-on-delay-us",
+			     &vreg->rdesc.off_on_delay);
+
 	vreg->rdesc.owner	= THIS_MODULE;
 	vreg->rdesc.type	= REGULATOR_VOLTAGE;
 	vreg->rdesc.ops		= vreg->hw_data->ops;

-- 
2.43.0

