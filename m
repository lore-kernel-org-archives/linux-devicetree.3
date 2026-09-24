Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 915F849F121
	for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 16:12:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790266332; cv=none; b=JBFtd2uIsoySOSaVej62ZrGmsmD7QCW1nThY1ncE9jfZb5mZdnL7S2LM/0DzIbDBGh1TUYZNelG/KM1DSo/uTb5udpobZB2QjFkHlsnmozZy2VfaLZ/LKQvzGHg2XzPrzhr+rnm4QLokxYe95cfJZlJXxg0D2ZXRNvn1V2yodiM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790266332; c=relaxed/simple;
	bh=/O2oE55TkYbnpIvKwb0/1s+B308H3SwWLlaSWMfxGs0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FjBevGlg6Qul5LRlOVTjFo1Mld6iTVBIuFDWbjJLIeT/9rXlMlT+T8ZrwJPQ3T4hxZWm3W8dSUZifM/obPkDHWIzeMHba2G5Ny+vVvtjLNIKsUKKnJYvvZdZaMGVIXlS09UwcTRT/5dPrNvz7R6JcTWgeLjz3aSXmu2Zm4K+YgE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ef4RGaoU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GJAncYqP; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ef4RGaoU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GJAncYqP"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68OFeexJ3605108
	for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 16:12:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=ugTsmfIzgAuOMRX1V6QbeKSew05fzVnUj1t
	/FuGrVsc=; b=Ef4RGaoU+pgseqLTVZrs/QL6j3yhqWKdrWgnZ8tlcJ6TBnoYNL/
	kCI584CSK8vfjBFG88bdDlugSjTyLoIXIWIbUPyYM9gUuudWGC+5Ub+rgONsWqqi
	oS4l7f/0wKBruK4dN6klZuC5h95IZmMVzXIeezo6lt8pZtk0ZSjyod7IxuJDvZbA
	+TKtTDY2q1FhV6MS3G0JhNCyrDYrSVJCkkmtkcaWx96z5IBa/h7tvKTtkEziwfYn
	fwF8ze8ta/Gn37FgXucRb3KdZUiz3Ew0VW7WaKXCCX/ULDPG1B2NtfbxZpNYGQoj
	nRYBW/SAoqKbDMdPJ8oj5bX8YYMca69g//A==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gw1rahk5p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 16:12:09 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-912348a0ffbso276456d6.3
        for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 09:12:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790266328; x=1790871128; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ugTsmfIzgAuOMRX1V6QbeKSew05fzVnUj1t/FuGrVsc=;
        b=GJAncYqPSHxPBPFe8xBkdqAWvq4V6R8uhHjLnHVlcZucZdkRmIunuB3NiUIHGElsNZ
         dByFIfREJ5dfeoq1GefYfP8BgsWfNrXxO8qpA3vKuVS9oN1ryEaUqMMb1ZOM1+E5zRLC
         Fd5XD/B8etQVyfg5ZiwkaXPf6UKlIHupQFjEyNP1P2KbM+gjGKplUXpJSKCtGSJHC4E8
         g/0CVgMwUY+rGs+o8qrAmV489Bt1kwo7I68XJBbU8Tf42Bnzf+96vVvswwi3QWwtdLkk
         gyN/I+PhQbLyA/KJLQZIOXq/x8CYnwYFwdMSpt0zptHieMUzcQODc0NaNE93XMGjrUKb
         Gc2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790266328; x=1790871128;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ugTsmfIzgAuOMRX1V6QbeKSew05fzVnUj1t/FuGrVsc=;
        b=r8/7bbp57mjq+2ufe6LlzyV7wR5dSXoyoq+PE+BKR07S5+UBa0K0kJF31Tgc8Y7YGy
         GVbfo71WM2J00OAdMGoyco4J1JgGUfaikAa7GfH2p6R3A0/CTuglxaTDuLvF2Eh6oG50
         3ACDT+G9OWNKu1IjQ/T3hnVOT2Imi9qDOj1bCyVUzYn13dKYRdIOTsQoPiRX9DuVDOo+
         S76npxxQrggRz2oQwEDE1RNGyVn/0pA2s84Gx5xahJtS9wW5+2ayIPIdAt0f+wNq2Yxd
         E68sOXMSH5F6DG3s/gOrOcEKrmedzZXY6p69vjNPfNS79Mgs/olmrFBos09R04ufJNNC
         ZpzA==
X-Forwarded-Encrypted: i=1; AKwUvByL8Lo6FcwxUEcKSRaXSpkGjbgjcEoDInDJ4Sy2x55txiD2QfdY29h5P9J4zikgT6pjvxQN1PdGnkXi@vger.kernel.org
X-Gm-Message-State: AFuF++n8ab2aiGIysMALc21eYBeeV22xv73tVG8hONfohszzAvi/xnbU
	IvRAYL/eF+9ICdxZVCweM+NVkafpStwTgwbJ8w8EzBIdV0sqpylYwtva4pDm6kiFaUCeI46IbSG
	4k94hojg//TkiBIKK9oj6i3yR4FoeUnt/t2CvZs89O0tu6tzqMx0Gnu622py1jqbZ
X-Gm-Gg: AYBFou2r2Bx1z0fwyitsBPvwBVGVplJWkshzaB6dbOGR2LSXaIuFBuD5QNIN2YXe+Mp
	/sFVDYNFG+SGHrkKTmvR+CeKmoa3VKVS+LGl7LiHHSarM8I8XYgk7LfoSyYq+IFf37wHHN+8QQE
	ybAPJu/G8wMwtnqUZCBHe5m7OQsSBEry4GhW8RzjSPdvEqbJSYI9IvQAvcTzC0/+b8Igent7wQR
	oR7ZyMddRDd4g7Y9RzwarwDKaeHKhv0WFUYJAk0Kyk1UOMedmgrE7c/8uEd/Ld5jqrGsNYFgzKl
	mdqsXfqkgMQ2u9aloxy/5z3++0rg7reQRbSOyWNg2sahudJIhlkMZ9TqriCe/wNPzqOlLf8q+Ik
	6ba/OhpczNhEX5uyjqHxgMsllvhjAn3BciaH8JQQJZpgMJjM4WuhaYmPFr78=
X-Received: by 2002:a05:6214:246c:b0:912:517b:7bdb with SMTP id 6a1803df08f44-91421eeff50mr30499716d6.38.1790266328176;
        Thu, 24 Sep 2026 09:12:08 -0700 (PDT)
X-Received: by 2002:a05:6214:246c:b0:912:517b:7bdb with SMTP id 6a1803df08f44-91421eeff50mr30499076d6.38.1790266327491;
        Thu, 24 Sep 2026 09:12:07 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91425cd8416sm9698296d6.17.2026.09.24.09.12.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 09:12:07 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH 0/3] qcom: videocc: Fix sleep clock on Glymur/SM8750
Date: Fri, 25 Sep 2026 00:11:49 +0800
Message-ID: <20260924161152.1162301-1-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDA2NiBTYWx0ZWRfX/SWufL+jsYdK
 BiDJbNzfb64HtuiATgYJuXAS5lSTZC8kM+cXglmm62zmp2q0Jf6Kd4QK8iGF96W2B7ckXrXf0nA
 hJo6gvaL26czLoj4TnR2DS+prgyFGmozQHbo2ZDldIikxJvpyADXu8z/OPEX4SRWdClWAcu7dVL
 i2wih3DhO0G40P2TzHBwb0UY2V0Wt3x2bKir9mYOd36OFoQfG5iFXqK41zGzhb7sMng6DSdmmcs
 KxRKDr4AOlcRgs01LyekoZyyQ5S+JcA2gGsL7GIH9TPKHQ4Osmzyg8MyDlnx4svhPxNiXG3AFPz
 56kjthdWVWQhsSkRBjXyZ7g39dGx5MiT/6pAIqHAmZiCIaBayv7cHx3bJWEefIwwB/QjF/uIjtX
 tUfPmvt+5nha1R6QuP60TsDEhGgEnkTLl3RhPOOc49jpDzQ+kUE/jKQAoICcJEzRndUR+1En/WE
 qo6vFa3IECnpZqt6t6Q==
X-Proofpoint-ORIG-GUID: kccs9dqiJwvCfUwF-MyTJSBLgAgNMB59
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDA2NiBTYWx0ZWRfXxYT1Vuap5eM1
 XPhkeuGnYA2piWdbTx7BLUsgvlV6XLbSY0qCRGv4jrrtR0T069khlss7+s9wEJ5HlgXDjBVO7SM
 5644Ye67QV31NdB0kqw9kVgfkkM7sEc=
X-Authority-Analysis: v=2.4 cv=fvpJ914f c=1 sm=1 tr=0 ts=6ab54bd9 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=L1W_g4kGIw0p2SgLEucA:9
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-GUID: kccs9dqiJwvCfUwF-MyTJSBLgAgNMB59
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 impostorscore=0
 adultscore=0 spamscore=0 malwarescore=0 clxscore=1015 bulkscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609240066

videocc-glymur.c (qcom,glymur-videocc, qcom,nord-videocc) and
videocc-sm8750.c both declare three DT clock inputs, DT_BI_TCXO,
DT_BI_TCXO_AO and DT_SLEEP_CLK, and parent video_cc_sleep_clk_src on
DT_SLEEP_CLK.

qcom,sm8450-videocc.yaml, which covers both drivers, documents exactly
two inputs: a board XO and a video AHB clock from GCC. No device tree
can therefore supply the third input, and video_cc_sleep_clk_src can
never resolve its parent. It registers as an orphan clock:
clk_set_rate() on it fails, and it appears parentless in clk_summary.

Nothing breaks at runtime today, for two reasons worth recording:
qcom_cc_probe() does not fail on an unresolved parent_data.index, it
just orphans the clock; and VIDEO_CC_SLEEP_CLK (0x8138) is listed in
the critical CBCRs of both drivers, so the branch is force enabled
through regmap and bypasses the clock framework entirely. The sleep
source keeps whatever rate the bootloader programmed. The orphan still
blocks any future rate management of the video sleep path.

The two-input description is not wrong for every compatible in that
schema. videocc-hawi.c, videocc-kaanapali.c and videocc-maili.c really
do take DT_BI_TCXO and DT_AHB_CLK, and sm8450/sm8550/x1p42100 never
resolve index 1 at all. So this series narrows the description per
compatible rather than changing it for everyone:

  - patch 1 lets the Glymur, Nord and SM8750 compatibles take three
    inputs, described as board XO, board always-on XO and sleep clock,
    and leaves the rest at two.
  - patch 2 adds the sleep clock to the Glymur videocc node.
  - patch 3 does the same for SM8750, and also moves its second input
    from GCC_VIDEO_AHB_CLK to bi_tcxo_ao_div2, which is what the driver
    expects at that index.

The sibling qcom,glymur-evacc.yaml on the same SoC is the precedent:
evacc-glymur.c has the same shape, its schema documents a sleep clock,
and the glymur evacc node already passes one.

The Glymur and SM8750 changes are not tested on those boards. The
equivalent change was verified on Nord, which binds the same
videocc-glymur.c: before it, video_cc_sleep_clk_src appears in
/sys/kernel/debug/clk/clk_orphan_summary; after it, the orphan is gone
and the RCG is parented to the board sleep clock at 32 kHz. The SM8750
change is by inspection of videocc-sm8750.c, which declares the same
three DT inputs. Both should be runtime no-ops otherwise, since the
sleep branch is force enabled as a critical CBCR and index 1 is not
resolved by either driver.

Shawn Guo (3):
  dt-bindings: clock: qcom,sm8450-videocc: Fix clock inputs for Glymur
  arm64: dts: qcom: glymur: Add videocc sleep clock
  arm64: dts: qcom: sm8750: Fix videocc clock inputs

 .../bindings/clock/qcom,sm8450-videocc.yaml   | 26 ++++++++++++++++---
 arch/arm64/boot/dts/qcom/glymur.dtsi          |  3 ++-
 arch/arm64/boot/dts/qcom/sm8750.dtsi          |  3 ++-
 3 files changed, 27 insertions(+), 5 deletions(-)

-- 
2.43.0

