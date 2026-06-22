Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAB3E35DA6C
	for <devicetree@vger.kernel.org>; Mon, 22 Jun 2026 05:11:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782105103; cv=none; b=tDjntmklTjeHMPS4uXEi75x0ra5W1bPjkwqOziI20aicaXRylhRBjVCV4Uk+8jSp781yEn/MXZgbhC8N2/yleTltT6t+Tpp4w4x26ynLiBPvCzHH4+kgkBzVzwqCwe7Om2dlDbE5gd6JZD8sRlr5OBogIYbFhaoWR8ofkyeDBrI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782105103; c=relaxed/simple;
	bh=87z1o4XyGauYHYE1QVaxn8pz2zob1D2UjTKFIy1fTD4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BR9wA4n7iaIbIUGBJgZUYcEVdLkzB2A1uQg+tAIHYl8E7uNroHEOXlW79zPkJRH/gKhwzIbRzgwxdprYkxy3/aC9kkbUsIeSyTVlvEUA+u8UUceqkHQvBuBbX5TiWU4be0MZNPQKP1r5UBgZMQ+fYxs03dBTg3HNO7qxxobAW64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NdrEeNpt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=c4nemu6y; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NdrEeNpt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="c4nemu6y"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65M599171275388
	for <devicetree@vger.kernel.org>; Mon, 22 Jun 2026 05:11:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8TvT0X1xsWIx/xeH+6U1rqCWrbGM5yHzwFV2cbUfXeY=; b=NdrEeNpt83Jla76r
	iSnMxqV2vobIs1RxWiAu4zHsqbyGv24INZQwQC2id+JJzL/k3q2RsbX6Fuc1Czgm
	qjuYAws2cMcNvyRWtc0UlFBw2t29eP3ekv+i44jhbC3tKDcrHRRUwNj8DkmnscXv
	wZvVVVkyDlg5djNG1fCr/EHkEy/0/c1kJPzoWq3ZeCgqhxkB0YfpgPSyoGsyz4PN
	lfO9XCaWV2ZycE7OPdvW75JEb22PQya8NFnrc/GUJuDCLyjcaPqwZegapkEmtk61
	IBBrlbsncUA4kyxQw+EYCc3hpiDU9QypddZd71QwLvLfVF5XCwdwYL7dhfrLM7jJ
	NUBgSQ==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ewk32vsge-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 22 Jun 2026 05:11:40 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-30c04cfaaf2so328666eec.1
        for <devicetree@vger.kernel.org>; Sun, 21 Jun 2026 22:11:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782105100; x=1782709900; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8TvT0X1xsWIx/xeH+6U1rqCWrbGM5yHzwFV2cbUfXeY=;
        b=c4nemu6yjGSZubCyu8abzOrfwf64SH4dLUqSK07HfRMef9JfsBxvq5U6xyNFXBZi1l
         MTGTWth9jeoBCAJXTmatTANm5vt712Vnz7l0c6YQcwSXfT8hs5Elh3ptINm3KizMwOBt
         iA2BDJH2fa2WtwES7cJBTBrr9izX/Fht0bj3DmEwVUt7BFCH6rmtuZzWN6fRxywgAYk/
         9nFHhp6Tjd3pjV/oO+iFvDD6sgA9eK+dq4ABKx8LzE/l0Im2tyGbwaT9oJebz0ywJzQT
         k5ywvnnzeVq88CvAnTXxvxQwC4QhbZlytsDxnEKu8OIK4PNLT0ayCfig4GyU5Wfr+5q8
         EPGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782105100; x=1782709900;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8TvT0X1xsWIx/xeH+6U1rqCWrbGM5yHzwFV2cbUfXeY=;
        b=gpXbxLhVLRmq6BWS0D/ZgiMTiUg06hJEXrS3dUtL9huHYHUFXQ9ZH1OdrGxtvTriJG
         0wQCa4by3004eJRKzdnGSOAHxnwZn+CPVHuSbWHMJWnf1duD8ioSgXJXFlxqsjt6KA5m
         CBMyEHkcaLAdaF/7cq5Y3+rrHMEUCZn9nQGTglu8N+kAPPfNwrZg3rnMMG1XG6Aa7VPv
         EgE5/Gu9eNCKqkAqizTnsE0v20cDqepMVEpZRbnDGuwsa7mkbMCoXgRGhoyRqLmhqFOm
         0/Doph1Gig6nr8nzId5synDfpS3rwLEc9pYqDBBpHcWS6rqHKy+3e/ZyaalKL8t0Wb+A
         WVEA==
X-Forwarded-Encrypted: i=1; AHgh+RqyMwx12DDGLpKPWDI88MZiJGkHJ80zXouTIL8TKySqet8/OsB4oN6AeJ8/SwfialG4d0z510gmUs92@vger.kernel.org
X-Gm-Message-State: AOJu0YwHcj6CV2ioBLwZJJdokdJX44glQG3MNzL9FPBdS9aG5fIolI8M
	s2iIv7UBhfXsJRhpM987+vMyaIa4TjkXsDEiIHq8b+vjD+kK8i1JuT6SPrsiM+I406ZDrmd9/kB
	bVKWHRN6iY80b6c7D33hWyzAc/llcJ3tq6ztU0Bpa7+yAWQ3CyRq37HuImeZlewsXIkVLSIoz
X-Gm-Gg: AfdE7cnvycHSYUhjx8WgTHMDQr2sTIT8ZZz5lOLIFY6S3trbEsfX2aKs6RFNgXYtcbj
	Tg8u49F7Qi+i8mi3Uy2DNgaAhU4/RU/KCYMtdvNxqNtK8r+6a+5RZ72GeFfUw+jTIxhjmuZ1Xrk
	NzNvuti2MyvpUIw9jPPFB0l1geK6HaA9nOyfsG8U0VHRROASkJRju8tye8NwOJMvEuTjw9uiHtW
	N+iUIataiYH2uw20lIAQk5Ur8Gq2KoU/a7/k1yW7slICXeOsDT1n1Jk8H6R2rXtj2P1HzbL4Z8h
	egK7Fyy4biAvWtwsrQSA/2giSvCH4YDP/Uyz2ZCfYO8z+r4cwZMjWwim8uoEaVnAh/QpKsuz6Rb
	M53/WGk0JZeXv4fWuf9AxQjuMkPlUROEKlypTbhbiNvutY3Yf9M3TLzSTUg==
X-Received: by 2002:a05:7300:3082:b0:304:5bee:f59d with SMTP id 5a478bee46e88-30c071e7a4emr10186949eec.29.1782105100374;
        Sun, 21 Jun 2026 22:11:40 -0700 (PDT)
X-Received: by 2002:a05:7300:3082:b0:304:5bee:f59d with SMTP id 5a478bee46e88-30c071e7a4emr10186937eec.29.1782105099882;
        Sun, 21 Jun 2026 22:11:39 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30c1bd8d779sm8947716eec.17.2026.06.21.22.11.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Jun 2026 22:11:39 -0700 (PDT)
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
Date: Sun, 21 Jun 2026 22:11:29 -0700
Subject: [PATCH v6 6/8] arm64: dts: qcom: glymur: Add QREF regulator
 supplies to TCSR
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260621-tcsr_qref_0622-v6-6-c939c22ded0c@oss.qualcomm.com>
References: <20260621-tcsr_qref_0622-v6-0-c939c22ded0c@oss.qualcomm.com>
In-Reply-To: <20260621-tcsr_qref_0622-v6-0-c939c22ded0c@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Qiang Yu <qiang.yu@oss.qualcomm.com>, krishna.chundru@oss.qualcomm.com
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782105091; l=1625;
 i=qiang.yu@oss.qualcomm.com; s=20250513; h=from:subject:message-id;
 bh=87z1o4XyGauYHYE1QVaxn8pz2zob1D2UjTKFIy1fTD4=;
 b=ERbwFbugGaGe4P+UwsrTcFlyaZDuwjk5RauNrGYedxo6+Ewtx0mEWDY13Y6WufJuVqSDSD+fd
 m+gS5ZOKEWhDDNJbK/ITdLPWSgFTQ1cooMDuviQ4ndPaeQa6ZD3Cqqn
X-Developer-Key: i=qiang.yu@oss.qualcomm.com; a=ed25519;
 pk=Rr94t+fykoieF1ngg/bXxEfr5KoQxeXPtYxM8fBQTAI=
X-Proofpoint-GUID: qKGNHJS-FdM_j0E4OnEOkc2Hyqbm4BLo
X-Proofpoint-ORIG-GUID: qKGNHJS-FdM_j0E4OnEOkc2Hyqbm4BLo
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIyMDA0NyBTYWx0ZWRfXzcMRrNZqDVCS
 U5MntH5syQsfRWrZ6OiJjesRw+VN0iWZ6bg013rvnmAZJNfR5slUEuKYeaUKDGE5/TZ9GvIRjER
 kErYbSLHdcm5docz71lfY8oqk5Rfw2M=
X-Authority-Analysis: v=2.4 cv=NovhtcdJ c=1 sm=1 tr=0 ts=6a38c40d cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=J05kOiREooJSWT36y8oA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIyMDA0NyBTYWx0ZWRfX3KmrnVrVM4bz
 fU/peJ23tYe4vCclPmaUsVVk1ME+rIwKtftVFYfmvL0WFMZQTLw6qOqU+qJYceaXmiEChQBsFdl
 yr/It8M2Qs25edfD4m5CG4QEXq/VL6jgtn02I82cqb0WHUb1rWo9l1ax1F02ruxCzRAjdA7SoTr
 YVGCXFMcawnscZD8iW6EuQNIR49Mdk75qAteja581j3TrPEq1CtoqDPOUGFVAsV6jowYjsfeCP4
 cOlxtoIZZ82n1hVsBo2AV4SmW/BI/HsLolBRoesXm+c4rMBpkq2QoAvFJJTO3af24BGk5n2NPu0
 djwDFmVGyDyXgvxVRREzDA2OSO8ESFRygsecec5IGDVHI+8ltFUS+uuS3qJ0GVTags8GmJtgTlS
 q38NJwlj39ZCmziK4A1rlawW+uvUizSvKNPBgOfR6Qxzf4E96DWDqltVgBUwVNqAKwyGhjHS206
 L2i+9N6VgyPP3ur2Wmg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-22_01,2026-06-18_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0
 bulkscore=0 priorityscore=1501 impostorscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606220047

The TCSR clkref_en clocks gate the QREF block which provides reference
clocks to the PCIe PHYs. Wire up the LDO supplies required by the QREF
and refgen blocks on the CRD board.

Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur-crd.dts | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/glymur-crd.dts b/arch/arm64/boot/dts/qcom/glymur-crd.dts
index c98dfb3941fa..92b929ee3448 100644
--- a/arch/arm64/boot/dts/qcom/glymur-crd.dts
+++ b/arch/arm64/boot/dts/qcom/glymur-crd.dts
@@ -278,6 +278,26 @@ &smb2370_k_e2_eusb2_repeater {
 	vdd3-supply = <&vreg_l7b_e0_2p79>;
 };
 
+&tcsr {
+	vdda-qrefrpt0-0p9-supply = <&vreg_l2f_e1_0p83>;
+	vdda-qrefrpt1-0p9-supply = <&vreg_l2f_e1_0p83>;
+	vdda-qrefrpt2-0p9-supply = <&vreg_l2f_e1_0p83>;
+	vdda-qrefrpt3-0p9-supply = <&vreg_l2h_e0_0p72>;
+	vdda-qrefrpt4-0p9-supply = <&vreg_l2h_e0_0p72>;
+	vdda-qrefrx0-0p9-supply = <&vreg_l2f_e1_0p83>;
+	vdda-qrefrx1-0p9-supply = <&vreg_l2f_e1_0p83>;
+	vdda-qrefrx2-0p9-supply = <&vreg_l2f_e1_0p83>;
+	vdda-qrefrx4-0p9-supply = <&vreg_l2h_e0_0p72>;
+	vdda-qrefrx5-0p9-supply = <&vreg_l3f_e0_0p72>;
+	vdda-qreftx0-0p9-supply = <&vreg_l3f_e0_0p72>;
+	vdda-qreftx0-1p2-supply = <&vreg_l4h_e0_1p2>;
+	vdda-qreftx1-0p9-supply = <&vreg_l1f_e1_0p82>;
+	vdda-refgen3-0p9-supply = <&vreg_l2f_e0_0p82>;
+	vdda-refgen3-1p2-supply = <&vreg_l4h_e0_1p2>;
+	vdda-refgen4-0p9-supply = <&vreg_l1f_e1_0p82>;
+	vdda-refgen4-1p2-supply = <&vreg_l4f_e1_1p08>;
+};
+
 &tlmm {
 	edp_bl_en: edp-bl-en-state {
 		pins = "gpio18";

-- 
2.34.1

