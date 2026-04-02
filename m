Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F9303630A4
	for <devicetree@vger.kernel.org>; Thu,  2 Apr 2026 11:54:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775130891; cv=none; b=bxLniiPhhXlpFF9u6toi1FCotu8++Sp5L3hfqp0ofYnh2+eUVQjxQbqUZtnehOWT1eEOV93gln4mmPd7/Ab0oTrALO0Ycz46BNKkiTmF1C5ygD9Oe8EmmfQOOvQ5aFhC0Cy9D5FVDcxBIdZiHNYn1MYQF0LTkrx/sCHQldSM6lM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775130891; c=relaxed/simple;
	bh=NEf+HxWDRsWfK9c9KQZCsERDb83KXrF9wLodgfVBeN4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mzYjI131q57w+2BiDR/gsJFXxnk5I6dsWOGSkBkiimui7ef/NetjS3yS+CSzQ6SSWw5Ww2RK83536QsrPoeRgphC/CgQvdZ+31DRx2kNzcSkmBTcT8ceqb9BVOCnzTCfMR6e+Dfv6QX6pixf/KXyARfPaX8V/vTWMgIvqDZiDYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=C5r57TnH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XzvOrw0N; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="C5r57TnH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XzvOrw0N"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6329kbGA1551192
	for <devicetree@vger.kernel.org>; Thu, 2 Apr 2026 11:54:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=s5/sP5nLpSm
	lFWIWb0dtTmTRZPj9KiV8hkWLXy5fgck=; b=C5r57TnHlVM+6H8LoMR9CbM+65C
	AHhHZ/ssT5/0TnD0jjIwbv2Q/zDnBnZzp6BHTnY0cIrSXFSd+szUycDWqQhoS3cu
	mKfK8MvyDKLo8yymF0FvPYB19xVqOv12no21LU0XZgCvwMgDMYU4PEPYvH7/FHq+
	BQtnrUFC0xh165aLr/g9Z8YqmZTmmvQiKEjkBH4nAg9+FK3keUrmynKcvm3eB9qg
	368QmW/aMtARwqQiEnH5cgT/vXQSsAJhitCCOuE6j02MykkRykC1xpbNUmLZIlc3
	Lq7gkzzB6/C4llbtImatV338EStkTuAcUREGdNsG9VzNnSz1tchDNLCBK1A==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d9heeste8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 02 Apr 2026 11:54:42 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5093025ffecso19184041cf.0
        for <devicetree@vger.kernel.org>; Thu, 02 Apr 2026 04:54:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775130882; x=1775735682; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s5/sP5nLpSmlFWIWb0dtTmTRZPj9KiV8hkWLXy5fgck=;
        b=XzvOrw0NY2Xqw3Vne3j5iYUEFt4nTeds7zsrxbYRmFSviEoBc9eNzXb3XCdFNr6L0p
         EIcDyGIZJE5DBoVXKmkho5BxIgFsanYzn+CENB2aTJWR7zUbis8lmCoYlZGbl5ss5zHr
         kDca+wjnLTk+GXuMRclnz2/q3CYrGIDlMPC4C12b3T0r8PZRg67wzwMAjnEpv99A7XYz
         uCCxLzQNFrQFtBJ5yZNbWF7lmB11eYeEsmNtaB4rRUsYwj7XgXrQ3sg4HjmRylzt1RPJ
         FHJbXA8c3/7z6H7QVJyLhWFrclbSrm8CtjdtZv4NGyuDZlyMWP3bjDGyksWD0RA6FSeY
         4qhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775130882; x=1775735682;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=s5/sP5nLpSmlFWIWb0dtTmTRZPj9KiV8hkWLXy5fgck=;
        b=Fcsic9GJkVWOw88zZzuZgC6t1hwxL0g6uPIkfkUCvW6h2bpASx+JCrZy/G2wm04kgR
         QweZuB3k6/GL2xXFo928M0GhW/4ou7M6ACpnO5M0bR5dNFAtJpG+RJnBnVjMf7+ulLER
         y4ZWcLkEGE7WsXMnmDK7KnoQNBs/ueq6K1a10S5sMVZL7UFImmVSdrEWj1hsut1z9f7B
         BTgWRCN12j7mbBASE6Ly3m8lmTPIQDwR0saaeYk/UfXVqDK3eElvg3CQ/bG57LuPFyGH
         iKwCo6bSjzFwOov13ILOEuGdhyFGn7qWzYXpwO/M09RVuLLqXS/Sk0MT5yLuZRWQpLi8
         zbSw==
X-Forwarded-Encrypted: i=1; AJvYcCU4KZjm1dxTvIn15gpQebrFBfVqq19MzDHTcQ+h5bunbLg7wzCnnN3ATNYE3oTQjvIkaQyxi1zpNyRO@vger.kernel.org
X-Gm-Message-State: AOJu0YwVAH8aoI46J222l9kyypqpSM2viXAP0KtY3kxF58pshjK0PQMv
	tb81K7e+GCQBXLTOMBcIt4JfEuj/4zlZtoIIoaJ8FCXa4thj8z7PXSctZYs3LmZzS3BASGRsa4C
	5mL+hf8YQhuarj2t/FM+fpc8mTLUDKh2ViK4vS2+RDkIvfdH03ifQt66jrZ1PyxO8
X-Gm-Gg: ATEYQzw5YiWrZZJ7ti9DKCHOuPEHGTn+BJ3QD4pNSkkyJbDNYz/o8yA5KnG3y4ML9Lk
	WdNsvNMjKutFQyudIUK5vOSvkCyQ4W2ot1FKc9SIcNk+fI1wPw6BTzP9BA/NDKnitUK1NM+ZWbl
	RMnjSYlgAzqg178jEZHE4MpNJNfQscX65fSqCQvC9RS27Gs5gBBS7fOKWdwKP54F8IHM7h8TqQH
	3LwHqA0Uilwt1wZpiGSnOZTpEgM9xeq9uO641wtkntczcjCViT0YJnvE0aIe/aTkQSM1g4Nkzo/
	zFHz9s8DXZgdHIJTMlbimX5uydaQul8MnrwLpRMixgVaMD2HRkxWofYQQexYpK7f4AYbfRvbGDr
	e2H5Ev9Q2Xzq+426zj5cUeTi3qs7eYiuOpsM9
X-Received: by 2002:a05:622a:1243:b0:50b:4e60:93b7 with SMTP id d75a77b69052e-50d3bcd3797mr93570741cf.43.1775130881974;
        Thu, 02 Apr 2026 04:54:41 -0700 (PDT)
X-Received: by 2002:a05:622a:1243:b0:50b:4e60:93b7 with SMTP id d75a77b69052e-50d3bcd3797mr93570291cf.43.1775130881452;
        Thu, 02 Apr 2026 04:54:41 -0700 (PDT)
Received: from quoll ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4887c8bc9dcsm111501545e9.6.2026.04.02.04.54.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Apr 2026 04:54:40 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 8/7] dt-bindings: display/msm: qcom,eliza-mdss: Correct DPU and DP ranges in example
Date: Thu,  2 Apr 2026 13:54:30 +0200
Message-ID: <20260402115429.100365-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260402-dts-qcom-display-regs-v1-0-daa54ab448a3@oss.qualcomm.com>
References: <20260402-dts-qcom-display-regs-v1-0-daa54ab448a3@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2740; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=NEf+HxWDRsWfK9c9KQZCsERDb83KXrF9wLodgfVBeN4=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpzlj1/WZN9obM8xHyJscHB07EsJnP15xwOD5rG
 p3ZNsns+u6JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCac5Y9QAKCRDBN2bmhouD
 1wqZD/0QEB7FL+7msgmMtu27RNQw9D6QuBXN9x+EJBNV03f7D5y1Z00sDOmh7kILklCpfIVrjfU
 yNiFSJc0ULwCFZuK/cKq3ob8ElN6/8nKKgQyT99wvE4fvrvwOrer8dYtV3MEHnMQuKbYUYLIQJo
 ragbbWnUV9tKf86DGBAmbWQZfMljbKQVihuZFSkVwNhlbizLWrYloBiX+hXUqY+ESTBR+qaSHpP
 zACGMaoXk0xngVpLMCclRZpVLMwVPSVGjol7PGrB+uJwIS/U2Q32n1f8W1le4nmYb/rkDfbQ7hu
 6R988SxfsMI3m2LdUvM+AF0jm0DAUJQ87F+AfIb3nWffTkdmlad7sVQG/incSvU+xyHug4m9ooR
 JVe16dspxQ7dkIWlFJ1szkXbfYBO4EF7UAkC4boCM/mhfYv70tEBPS8ySjTQtTCfl1z8Etdh3aN
 IbdfG1tTGEdbhy3pXAlw2S9PFMfoDd83kgKk41P4iojiDO5go/K/5l+pz64LwD+WamihC53ZwuN
 8FTVgYbIQEtvwEz04hL00mTaC3U84KpSPU43hCYkPNQJgJcUlw7nu8y9PtU3QE1RWe+/Z/WdeBo
 irl4Kr4nf1t/9/05RYfOHkJuv3rYKKsYO2HQB0wWQxrEDnlKzXx2Lh33A95iwifS3sWaDBi0zOB hM/rFqfnW9ogUWQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: N_0S4TLEdl0j2QH0a3gAKcC-vARnPAbb
X-Authority-Analysis: v=2.4 cv=VY36/Vp9 c=1 sm=1 tr=0 ts=69ce5902 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=2E8fMljBJZ0eQ63lGZAA:9 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: N_0S4TLEdl0j2QH0a3gAKcC-vARnPAbb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAyMDEwNiBTYWx0ZWRfX0E67dS++KDoA
 WWt+Bw0AFKe2hgzTgpu4nTP3FJinX30t6/fIjmDiOGM3Fyl6xHfvlizOo1vN7tvBm2zT1sGOo/S
 zKsWR2GmrVLZ+7PeQgYivAXyzzXANAanFw9rrMHtDAB7w2lOBDVlYA6gnzW6hoAiHgKdBdA2d8H
 jWIi5lBy+ADKn0mSa6tpemTph03ma9EvJUKCSMgcmwdwyrMaKztBiEFh31I1ImcfnRUjADp06VM
 1q9RUXN5PSFgXcVp7ijtM2hapyVNFMJ77c0sVTYGp3ZrdgySkjo9okgFUnLxjLEmFBYSwq4GZHC
 NcSgEQq7hi9lKp2FwPBYePUtLS+F6RB+SMSkTVTyhlUdY5yQL0dvVNB+cr41dmy6ov/r6BXXvaU
 Zvwz2JjrlFvgMuogA+yI6O+SOWqKdJGGFTneULMp6HVQOAKH3+4QK1pAiLAU5ioTSwRQqhqFnNe
 GGIRlNh/pNR4RWS9npw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-02_01,2026-04-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015 priorityscore=1501
 malwarescore=0 spamscore=0 adultscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604020106

VBIF register range is 0x3000 long.  DisplayPort block has few too short
ranges and misses four more address spaces.  Similarly first part of DSI
space should be 0x300 long.

No practical impact, except when existing code is being re-used in new
contributions.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---

I forgot about this one, so patch numbering is a bit odd 8/7 :)

 .../bindings/display/msm/qcom,eliza-mdss.yaml | 20 +++++++++++--------
 1 file changed, 12 insertions(+), 8 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/msm/qcom,eliza-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,eliza-mdss.yaml
index 47938d13d1ca..bd4ba91a171f 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,eliza-mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,eliza-mdss.yaml
@@ -119,7 +119,7 @@ examples:
         mdss_mdp: display-controller@ae01000 {
             compatible = "qcom,eliza-dpu";
             reg = <0x0ae01000 0x93000>,
-                  <0x0aeb0000 0x2008>;
+                  <0x0aeb0000 0x3000>;
             reg-names = "mdp",
                         "vbif";
 
@@ -304,7 +304,7 @@ examples:
         mdss_dsi0_phy: phy@ae95000 {
             compatible = "qcom,eliza-dsi-phy-4nm", "qcom,sm8650-dsi-phy-4nm";
             reg = <0x0ae95000 0x200>,
-                  <0x0ae95200 0x280>,
+                  <0x0ae95200 0x300>,
                   <0x0ae95500 0x400>;
             reg-names = "dsi_phy",
                         "dsi_phy_lane",
@@ -388,7 +388,7 @@ examples:
         mdss_dsi1_phy: phy@ae97000 {
             compatible = "qcom,eliza-dsi-phy-4nm", "qcom,sm8650-dsi-phy-4nm";
             reg = <0x0ae97000 0x200>,
-                  <0x0ae97200 0x280>,
+                  <0x0ae97200 0x300>,
                   <0x0ae97500 0x400>;
             reg-names = "dsi_phy",
                         "dsi_phy_lane",
@@ -407,11 +407,15 @@ examples:
 
         displayport-controller@af54000 {
             compatible = "qcom,eliza-dp", "qcom,sm8650-dp";
-            reg = <0xaf54000 0x104>,
-                  <0xaf54200 0xc0>,
-                  <0xaf55000 0x770>,
-                  <0xaf56000 0x9c>,
-                  <0xaf57000 0x9c>;
+            reg = <0x0af54000 0x200>,
+                  <0x0af54200 0x200>,
+                  <0x0af55000 0xc00>,
+                  <0x0af56000 0x400>,
+                  <0x0af57000 0x400>,
+                  <0x0af58000 0x400>,
+                  <0x0af59000 0x400>,
+                  <0x0af5a000 0x600>,
+                  <0x0af5b000 0x600>;
 
             interrupts-extended = <&mdss 12>;
 
-- 
2.51.0

