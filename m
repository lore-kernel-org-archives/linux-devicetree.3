Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4CB737D128
	for <devicetree@vger.kernel.org>; Mon,  8 Jun 2026 12:23:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780921405; cv=none; b=DHQC6AB9R+l7t/bbAyAbJjv0q0GwCTj3QbtOQcL4Tv0Esqs0Kk2qaMnUXoGkUjAF3riV9G8ye12pycO/sJJnyxE+WHnZM/0omjf0k5JFjRY3WjpfsNIooRl9VHj8GDDYMsc7C6n/dcusyf7Vv+xJsNQ1cEcIrW1NzcISFQqBpu0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780921405; c=relaxed/simple;
	bh=vQxUV7jYWXzMq5Bmu/8yTnsosmkeyas+t1t65WaotR4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=brCGF+PujmbqVYpYER3zp4cPP++jKtM5bZiap94aZx+BjFXuZjW/taJIh30K2DnTEeT08wtkHSdRs3Kj4EsbteuJwaWPF3EkIzHEUUlclWd6/uKm1GZZlPsWtE0h/CGARUDV1IUTxWK/DuR5v0Q3MOxoREJSJKUqt+GUECt3F2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cTqr6O8s; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EIRnrTDY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cTqr6O8s";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EIRnrTDY"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 658B9KER2992933
	for <devicetree@vger.kernel.org>; Mon, 8 Jun 2026 12:23:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	izYmYod060ZWJNtBK45Vny8T/m2n8qzGVzVsdM8Pb+Q=; b=cTqr6O8sjUmf7Aj8
	y/nyPXfBJ6Kqe70RfG8sV/37JQXJAhBz3va98kFnr5tB2PazEa8y4DvP1V+De6Mo
	zKqhqfA029EhXLYhhPL5mMU3ZeYyVKi6SO/xoxDoA2bpljurw3IJ8NId775ue/dd
	VA49gXhoRSrjaeTO3v1dEJIzGjUkezG92QvepFfPzMHypTpOFNiFQkBSG5es6rJs
	0K7BbqqbCQBRviRYlH3uuHUTEzNokNCOZJ9d6DpELV8/nBejJGiEAlUIxHQFzxap
	1euMUzZakbEubNxuHYpbUFWLdA/syshJ4RgxGUGIklvXe+Vf0dcGkjlcbrAQ5Zjs
	3r+ZLg==
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com [209.85.128.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4enuna8jh9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 08 Jun 2026 12:23:23 +0000 (GMT)
Received: by mail-yw1-f200.google.com with SMTP id 00721157ae682-7e04b938a59so73342277b3.1
        for <devicetree@vger.kernel.org>; Mon, 08 Jun 2026 05:23:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780921402; x=1781526202; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=izYmYod060ZWJNtBK45Vny8T/m2n8qzGVzVsdM8Pb+Q=;
        b=EIRnrTDYC/3Bl5aGZo2DTFruj+6oMsXIveX9ZAci0P28pb4f1X+//abSCz3mFZxBCX
         0wxVu+dexTOoFbxrd+88AWW64jM+sv2DgNeFEzmot5N1dPlgK2Ykh8Zf1S6r7kBIKU4z
         Kc3Zw4kO99cxmC05trpklZl7Mh+VTCcOriOA+m/lZTZQ4reGhUYBHrysZmeg+3X12seQ
         5PksPVxDh0VsU4l7f0sGvce/ZTzFBkMoEIiax0quEw/BShUDYlE9tzhOBR83U7DwmfV8
         gLcNuEvKYoOsAP1NnznVxNuhDZtiPjkbiBZQIuZsvt0pN5N1M7eYK7VXFUkhVWQk2hTC
         aMig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780921402; x=1781526202;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=izYmYod060ZWJNtBK45Vny8T/m2n8qzGVzVsdM8Pb+Q=;
        b=kQdZeLBBXHCSsL5DNtPJCj0B+yPWydnOoHntwQmpvTMKAY53qXPTntyEGKAJkMdQZI
         rYIkFZMJZOdQAxYAZ16n1DuLBSyitSEvSTDybmmDYE7IYxLE/v3LW71JzyuIN43q3yvd
         0Tnf1YC+JKozU9Wr6rrQRhmNgXHmFDiP5qxxccUcKD4NLId5oPSW/Y8BUNpAe3bMMtdC
         N3d7hODn8t57goHMPUzXqy4bZ/i06H1Ww0tZLdvRIllWrpyOAQFXdSBmuoouP9Ix1kiU
         QIYYHaX9C7feGzfTgHA8KUz9zOHL/hD/BYdv3G6L8UNgNkCZAQwrZlwZIwrJhSoztJCH
         JRlw==
X-Forwarded-Encrypted: i=1; AFNElJ9We+hL+HB/7T2O1eGt/ls1g7kKlegdQMyUr3p/If1LSEJnsvJs6zw4Gt/MCHmantQUH0Iw7HhBzi9Y@vger.kernel.org
X-Gm-Message-State: AOJu0YxTSCSkmoD398d8eaI+i7ccuwnTL4x4Ep9SsDiSCk2QAdqBHmg2
	gsCiPBJlAySlNQbeSDqJcmGbDvq9jHp3F9vSqZYNzJcc+3b//ECKCVOQ2pF95tlzm7z/fDPn+nX
	a9uRMr97x7h6xNVbmKfvs6wluaRtfLmEyQXWDVNlEvq4fpiQKtOHuzpZ2F5PLs/4q
X-Gm-Gg: Acq92OG3SVvZ6vmVIEvRazX/dHDeMAbZmyFAT1ldWxANGb/3mc1BR74f3e3efuirzTE
	GUZI8/6vsz4WlbDIEx7cfT1V0gyRfn6WMiJdcKIuGBxtzTTDTfjhOMplzJNy30C+6Q8ewTUZLR9
	MnCyIg3YshgXUrsaB3IjUVNr/czclTAGjUzgK0Ee20Iju78ytFvRznyqQYQ6Nvwp/ePqDSORhsW
	EFB35qZpBm98J6Pm91q2ycODD0mzD59JLv4+grH0l9QzNs71z/RJZNaGrELFfnsbbkNR1jaXMM3
	4wMatoYso3X64orNT0p1UhtdwmsOVwA+aOlz1JYSnE6GGLdvLRJk1FMD4zA1P5F+pdk2Pa5WCyd
	p4159kF8qNEKiD7NAxoW8+2z5dCVWIZTbH+gi1E7V7PiDH8JST2kJ0wY9o9ivEAE=
X-Received: by 2002:a05:690c:6389:b0:7e2:28ba:28e8 with SMTP id 00721157ae682-7ed0ba6363fmr140919067b3.21.1780921402219;
        Mon, 08 Jun 2026 05:23:22 -0700 (PDT)
X-Received: by 2002:a05:690c:6389:b0:7e2:28ba:28e8 with SMTP id 00721157ae682-7ed0ba6363fmr140918707b3.21.1780921401820;
        Mon, 08 Jun 2026 05:23:21 -0700 (PDT)
Received: from hu-imrashai-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7ea20ea8186sm84076257b3.4.2026.06.08.05.23.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 05:23:21 -0700 (PDT)
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
Date: Mon, 08 Jun 2026 17:51:51 +0530
Subject: [PATCH v5 3/4] clk: qcom: smd-rpm: Add missing RF_CLK1/RF_CLK2
 clocks support on Agatti
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260608-shikra-gcc-rpmcc-clks-v5-3-94cefe092ee3@oss.qualcomm.com>
References: <20260608-shikra-gcc-rpmcc-clks-v5-0-94cefe092ee3@oss.qualcomm.com>
In-Reply-To: <20260608-shikra-gcc-rpmcc-clks-v5-0-94cefe092ee3@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        Brian Masney <bmasney@redhat.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        Imran Shaik <imran.shaik@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDExNyBTYWx0ZWRfX258s/JHU/xQY
 MrJElmvFPh2R9qhHrcHN2CCzZsoWW11wFhm0MmrgX5QQBDQ27hrx8c4vtDjBG/2paQfQnX14zaX
 oSv7moxxfrqVEclsrZhhEFza0h2MBDsag8Bon2rTstCRbaDOY2qkNSsLoHoxet8b1VEMVuOZyG2
 qd5SwiGW82fmL11IvE8j523T/eUcrfzihZ7jNDsNpJCyXm7ATCZdX6pfstBpqPmjtsKxqL1p03g
 YwKyUxvqIJ1jKvzzinwtiTmmZNAPWfxA52RcaZyFckPgPfXPPe2TBRx+KlAGveGPUAXskP6bfR3
 vNKPGt6T3TIwFfqlDPJwgBGFp6Pw5aWa8s+R7ZZxlAXLHvbh3IeQ9idqYdyIqncz02DaNWpYc93
 TrYDCTjbCkmlpNHbAtVtGs9WJq42kaCozLmwv1ayF2y5triyt+iuiQxCoC3UwiofEY6u5FFtAEU
 TbUmw6IFS+YbCbpLtpw==
X-Authority-Analysis: v=2.4 cv=RfugzVtv c=1 sm=1 tr=0 ts=6a26b43b cx=c_pps
 a=NMvoxGxYzVyQPkMeJjVPKg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=j4Xy8Qu2vJQzfQ2CmTYA:9 a=QEXdDO2ut3YA:10
 a=kLokIza1BN8a-hAJ3hfR:22
X-Proofpoint-ORIG-GUID: 5M3sAnZSzps0JhZRute2pWLiMiicINAH
X-Proofpoint-GUID: 5M3sAnZSzps0JhZRute2pWLiMiicINAH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_03,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 adultscore=0 spamscore=0 suspectscore=0
 priorityscore=1501 malwarescore=0 clxscore=1015 lowpriorityscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606080117

Add support for missing RF_CLK1/RF_CLK2 clocks on Qualcomm Agatti (QCM2290)
SoC.

Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
---
 drivers/clk/qcom/clk-smd-rpm.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/clk/qcom/clk-smd-rpm.c b/drivers/clk/qcom/clk-smd-rpm.c
index 103db984a40b950bd33fba668a292be46af6326e..0b624ed4715c75042b92ec49c073b281533cace4 100644
--- a/drivers/clk/qcom/clk-smd-rpm.c
+++ b/drivers/clk/qcom/clk-smd-rpm.c
@@ -495,6 +495,7 @@ DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(rf_clk2, 5, 19200000);
 DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(rf_clk3, 6, 19200000);
 DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(ln_bb_clk, 8, 19200000);
 
+DEFINE_CLK_SMD_RPM_XO_BUFFER_PREFIX(38m4_, rf_clk2, 5, 38400000);
 DEFINE_CLK_SMD_RPM_XO_BUFFER_PREFIX(38m4_, rf_clk3, 6, 38400000);
 
 DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(cxo_d0, 1, 19200000);
@@ -1262,6 +1263,10 @@ static struct clk_smd_rpm *qcm2290_clks[] = {
 	[RPM_SMD_QDSS_A_CLK] = &clk_smd_rpm_branch_qdss_a_clk,
 	[RPM_SMD_LN_BB_CLK2] = &clk_smd_rpm_ln_bb_clk2,
 	[RPM_SMD_LN_BB_CLK2_A] = &clk_smd_rpm_ln_bb_clk2_a,
+	[RPM_SMD_RF_CLK1] = &clk_smd_rpm_rf_clk1,
+	[RPM_SMD_RF_CLK1_A] = &clk_smd_rpm_rf_clk1_a,
+	[RPM_SMD_RF_CLK2] = &clk_smd_rpm_38m4_rf_clk2,
+	[RPM_SMD_RF_CLK2_A] = &clk_smd_rpm_38m4_rf_clk2_a,
 	[RPM_SMD_RF_CLK3] = &clk_smd_rpm_38m4_rf_clk3,
 	[RPM_SMD_RF_CLK3_A] = &clk_smd_rpm_38m4_rf_clk3_a,
 	[RPM_SMD_IPA_CLK] = &clk_smd_rpm_ipa_clk,

-- 
2.34.1

