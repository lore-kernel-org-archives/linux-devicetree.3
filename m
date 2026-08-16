Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEBB411CA9
	for <devicetree@vger.kernel.org>; Sun, 16 Aug 2026 12:37:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786883827; cv=none; b=jwfRTjToKBDULsAU5W2QvU0ENupF0shnYh2qsJPVoWc3zrRhWJahG1sLlN9v2NNj1J3iD3Y4h8fwvwRMtpxJhwmj96chSSwHUZ4OPeXp/bAv4fUhStyWFrNZWZZp3SXr/XTnwnWDad15a+DcS4AE137Ho7leO5Lgq8xOzf4ELAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786883827; c=relaxed/simple;
	bh=1v/keRZaqkzcW4ftGeGFyG82kJauSKfHcxDLIVbqNiU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Wl3jBhZaO0w+oDFpmaxJ7/aionm9VTdnN8cA1l8loDtFNh7ZsU14Ru80gkVxlzaUUQMufTXMf0FVeNaqwDGZmfIAELjyKgaNk/sbHHnaQf4ud9FucNZOIMDqRcoTA6e07WYs7L/s3ba7RV31/rSv3ofBbncH73zayKo10xIHaD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XPh8ws0W; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=P0/VojfK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XPh8ws0W";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="P0/VojfK"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67GAh4F13075025
	for <devicetree@vger.kernel.org>; Sun, 16 Aug 2026 12:37:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=u3+0mYShXgV
	KPEXiTrpEtDfmgLeQVZax9kjcimnThUc=; b=XPh8ws0WBrSV+CfNs8bKdCs06Hi
	eRgdBO7nrOB6zTwMfoxFGLG5/8lZsKG0nuFjC6X44wQX+UPPoB0fMRa9dOehPqy3
	xz2vgHTouVz6a/Pr2WcWyvdnLbrgnH4u7xXzkMHj6DV+LCmtldZJPrjaUkDMGv9V
	uQ9DqUrTOo6Oi90V16c/jnmklXpYAeSpS0YVhSK1MqzCe8VNaiCAlvrqrkvwRrhh
	O0BVDvyh//NJHLxWfefge1oWtpHNh6ggajhvAhxU5zmmMU2e/FszgP3P5JQl7OGP
	6pezs2sjplu/1KE2TfFAlDXsBr8XwiKnvRW0tPm3SJwxTE4+gThDPwucv0A==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g2ghk3dqj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 16 Aug 2026 12:37:04 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2cea6a46766so43538395ad.0
        for <devicetree@vger.kernel.org>; Sun, 16 Aug 2026 05:37:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786883824; x=1787488624; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=u3+0mYShXgVKPEXiTrpEtDfmgLeQVZax9kjcimnThUc=;
        b=P0/VojfKFu7+QLRkWLSbetfyLHtSf8XWeXgQZ9DP4akIEBsJ+QMiGyPaCxxsZ1yXyH
         HSRZpRVfsxVlROCPpOBvMJgRiksF0+wsdQAXAFAkfR81h2T0tp8n6Bv85Q1/DvaXTSAH
         Bs+VsrOaFxjv+AiAgP5T43VQ+HVAYeAj1RPTESfKuFxzMYr+q6kGsiIdK156LDmSi2WP
         D5uBS9iRxAOETQSaTqSEZYqWy6bJD1XvpAZrEzAMT8X+jG1EZJo4YiL/WF1u2WKDI1zJ
         WCKKFTd+SuuV8FFhgtpxtVgJhlUxeUWCsKUNcvhrmKhE6FWo1KPu+v5cOCjtTGOWfKWr
         OezQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786883824; x=1787488624;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=u3+0mYShXgVKPEXiTrpEtDfmgLeQVZax9kjcimnThUc=;
        b=b9pFd/vHp5LXW80bO7FU5EYWo+9Lo3Pzg45OWaNYH3N0vqEEx6nsGxO/97d9ibNYn/
         5H4Rp9MuDyeCcfQyU2LrH1YWPdAuT8C1XClW3a17hNFn1NjFYzqo+2nHV0Z4LcMS9nDr
         tZkw1II7XqQ5DgTzOz3sN/2uekeZtHgrFZS57jhMUOTLSzyMxA7h5Un+u9UHh5Ml5Zfk
         Nn3lAePin6gUdvSKMIC4SDCSxMsTC0purlLJ0RNyGHcWOz40GlLBVqlo3eHEEBdsVSjD
         99CTKFRR4KsltmDwHk9PjLN2OWjrIdVw9VlaF6D1pQ4380MHXcI7/DMQEPdFY8GVAjpG
         IRgw==
X-Forwarded-Encrypted: i=1; AHgh+RrtpypefqrW65D7Hd9fQOrRupUBgHNGDJwkjgImsfoXiYEXbR//RvhYc6qXYCrlYlq2bC15r4uTTpXQ@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+gToLfEZlLCDp4jsvAKOEoaxw7GNjrYsVEJY/TC+VXmWjAWsz
	iejYX9USmHX8L4JrsXTUX0NK9dSlijE1jFnO4Qnr5/T/HSCq/nO7S4bfe/EpPZU65rn9Ei7+5tC
	YogUPVYRMOZhVcQ8Eoa/wpdYTrX5/8M/ROOI5+JhDz+Nqg4L3V3n6w1lJctZk3XBO
X-Gm-Gg: AR+sD11rCFJe5BBtDIDi3gPZqCNAmSCTgeLlZFyEPBAPGIug7i3Ql8U7MdRLVjhJx1+
	E/n2dAz9nHppWtqDOr+x1jatVYk/oLsreJPeEqxo+KoS/pACBR6yAI7aoms+MHile2mLhjtFnvO
	/X15/XlDAm/n8cAXHPOMyNw1VA/F/Fb+bKfnUm+jyDM8KQNv0Nh8WM1MXzbjvsQetrqC/18DT6w
	t/PpWa2XkB60hkSOSHcV3t525HQV8rtgea7OZ/VmTzz5vl2N/bojnabce5cYo8DfyQCwkyO0uqF
	38/DA3AgSb27cNaLKb3Iay+4aBWhlkkhSDLoMKhCO/qWIVMyRftIxLNBXlgW1Kh4cPXI6tNfSH+
	XRDdXJOzEZqEx96aYAStkyTBwjjQAloUgwi3Yj1kRpi/pXDYbh0ZddifFRzs8
X-Received: by 2002:a17:902:f64d:b0:2ca:619f:9733 with SMTP id d9443c01a7336-2d3b0c88987mr234163145ad.17.1786883823635;
        Sun, 16 Aug 2026 05:37:03 -0700 (PDT)
X-Received: by 2002:a17:902:f64d:b0:2ca:619f:9733 with SMTP id d9443c01a7336-2d3b0c88987mr234162745ad.17.1786883823238;
        Sun, 16 Aug 2026 05:37:03 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-320e9df03f9sm26146956eec.19.2026.08.16.05.37.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Aug 2026 05:37:02 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH 2/2] arm64: dts: qcom: lemans: Use hyphen in rpmhpd OPP node names
Date: Sun, 16 Aug 2026 20:36:48 +0800
Message-ID: <20260816123648.1632681-3-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260816123648.1632681-1-shengchao.guo@oss.qualcomm.com>
References: <20260816123648.1632681-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE2MDA5OSBTYWx0ZWRfX6f0rRDCa1rO6
 UjF38asRUkWqjSErdA7U17gR4pEpek2EOY//xFC4eyFY2LR7ICyrQ9fSqg9KBiCMu+Aghb/R3Rz
 ctHHY7etkE+jxN/ZxRvqZAuzGXLSxaI=
X-Proofpoint-GUID: 14xJDhRXBkCYzQN1obtnBl67-3mbjeZu
X-Authority-Analysis: v=2.4 cv=f+14wuyM c=1 sm=1 tr=0 ts=6a81aef0 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=jHMX-OgH2kBFWhD5V08A:9 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE2MDA5OSBTYWx0ZWRfX02SqeL0KXyyy
 dhC7znbjkdZ+PHyOdW8L/MMPKQs0FwV1HR38/1NdABi+KYM8ENmK3Hh9/tYybezfzxUvgwKz+dP
 GomsAWQWoxydOKh7+DTc6iN/NaNTwaldEE/JfLxPlO+13MjG5CMJFVIYJ0QrwFZrg4uB12ndD6e
 qdyZ+/ZS691n8ZmTFV0VXxjQGoVH9RHTDzhJUgou6x7xlduzihtZG2sxpA5Goi91RvMMN/9qjWu
 YWzU0RYmYSkxV/OV2AIa4Akt6kBXi7IPd4b3AyqjyeecmPJkQrG5xQyAbnhuv+hbzce6Pt1dMF5
 iigRO6GlbB3MdWwfpeE0WhVYUStXUtJZwvLm7+kKKMvZYxWTGGrQu1fcr4S5QBetG1DOaMTzcZx
 Q7Ic3Zspby2a6B2jkSwRx8apwC9IN7QX3ZtZAUian2Y4//BW40fB+BmSGcZNWNik2lJxb885HDI
 5d2yUZkZ0B7dJ2GiLVQ==
X-Proofpoint-ORIG-GUID: 14xJDhRXBkCYzQN1obtnBl67-3mbjeZu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-16_03,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 suspectscore=0 bulkscore=0 phishscore=0
 malwarescore=0 impostorscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608160099

Two OPP nodes in the rpmhpd OPP table are named opp2 and opp3, while the
surrounding nodes in the same table use the opp-N form.  Rename them for
consistency.  Change should be safe, because node names are not
considered an ABI, and all references go through labels.

Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/qcom/lemans.dtsi
index 695eae1b7256..fc55624f5043 100644
--- a/arch/arm64/boot/dts/qcom/lemans.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
@@ -7168,11 +7168,11 @@ rpmhpd_opp_min_svs: opp-1 {
 						opp-level = <RPMH_REGULATOR_LEVEL_MIN_SVS>;
 					};
 
-					rpmhpd_opp_low_svs: opp2 {
+					rpmhpd_opp_low_svs: opp-2 {
 						opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS>;
 					};
 
-					rpmhpd_opp_svs: opp3 {
+					rpmhpd_opp_svs: opp-3 {
 						opp-level = <RPMH_REGULATOR_LEVEL_SVS>;
 					};
 
-- 
2.43.0

