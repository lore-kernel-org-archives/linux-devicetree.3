Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793783293;
	b=ucrTu5Y1v28wo+d/ureNdtEvfxr7eciJ1oXoBVVqRgOz2gnIrHcw/Et7WrXcXbWgRRS1
	 0mxpHg6f5mZmg2JCIcCaLURWWtBQtwek2+4DDlLXWyN/rjZw09sYKJHbn+IUui6WEVogu
	 X1wnGoyOysewQslVp3YVN81L+dMF2YaCQy1bFZOrNKKMZCTpqr4WeOtcEJs4YhxN/wOxL
	 u4uTLBTw461k7gLIdcnEh8ScoMexwFtOkMlB5Pbc/AgX2HjAQHjOzAEgKd12b/KWyM+TD
	 oH/NwwAdOQM6be5x/iz+ad5pF+wcGeHZn/I/q9OSFDI9+5lkzTyURvJ5OYMCgAwJ8iw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793783293;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=D8me2QpoNUYpkzCrzP/COkjEOzARHLPsOFtTfm8ZtJ0=;
	b=ZV3WA9MJ9v2G659HJ4BhID9MdJRRfv0QCoD+HIpRUtojbcr8R57CxgMeczGPZgIkyOLG
	 8qqhv2ExRmdMXDHFwSwR7r0Wj9EgG0OimjJSpNYCT+icn5bmySxVBz0JB31mwWkHE18qA
	 /SI7aaTsrESVyCA/PD7e77AeGUkxo3JnqEqtyknHa/OleK7FFd9AS2xSDO+i9Cm9Sn3ne
	 vfRZolnBTXY5U8cUl/k1jB9JqNm0aZOuU4rW2P31rS0Sdi+ahMlFe8Q7E9UkXnWGaFokA
	 8i5yif/2fz8BSO7BRgBhbuHK6iJ6TZ5TfvqGXckxC9Z5tAacHv/Xu0wHasxbLw0AjJw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cOyzIDyj;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=d1Z2u0uV;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A335E606A332
	for <devicetree@vger.kernel.org>; Wed,  4 Nov 2026 09:08:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A335E606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cOyzIDyj;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=d1Z2u0uV
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A48OnF8309849
	for <devicetree@vger.kernel.org>; Wed, 4 Nov 2026 09:08:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	D8me2QpoNUYpkzCrzP/COkjEOzARHLPsOFtTfm8ZtJ0=; b=cOyzIDyj0a2Iuht5
	k9JzBA0s6Lx3awvT38wo9fsLbOjYVLkvyKWAW2Cv/RaDkQ6JtpKMkrIa2eiYE/c7
	9+QeWk80lsvgrjUxqee5ZXrmUpSWEd2zHxXnlwGT58DswAuXoHdfV7LdiA5W4/7Z
	YI3ExzuPi1esPo/dvGwmDWZk5XsrhkgmOSJFNWYw1KFWu00JnB4CNlzL32cBYfCu
	2HLOguKmaXxqXSp88HqLcctetV/TBCyHOB/yWwHqwuZyAbn93xYyXgM5b7CSDwXj
	Xps25NLLOO3LOWyfztjJYvIJjtrk1Kkeag6zjTndhhgYxtoiOE3aRbw80HI9CowI
	0VQ7fg==
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com [209.85.210.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hr163g68r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 04 Nov 2026 09:08:11 +0000 (GMT)
Received: by mail-ot1-f69.google.com with SMTP id 46e09a7af769-8255327a28fso616442a34.0
        for <devicetree@vger.kernel.org>; Wed, 04 Nov 2026 01:08:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793783291; x=1794388091; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=D8me2QpoNUYpkzCrzP/COkjEOzARHLPsOFtTfm8ZtJ0=;
        b=d1Z2u0uVUc6BBvhiM5lYH6Ot/Ywjl7cq2Ru/F7Y8Etbs1GqAfXE8fSKao3C3o8bMmI
         WgqB70Fmlv9bKHl27NQNjizYOEFUObYfpL5EHdpk1LVJPxTshtas2MtWYzRRbhv2IzxH
         zz7Tdam53M7exAa9F1KTBhIv/Mk4B0mE8gDpqJDeaDn1mXVdgasAXOOTQyQ0I85M8LbO
         RzWTAJj6gmqpeU5RhN+tklI87wEFQsGSz5urnaBpgL9s8HahoazhTVmkY6Q8Vvz0S6k6
         K5ewdbqbfmukULxzcL7lK7fUm2d70ABxSz/0x3YPSjL3aSogbQZddFqubmo5iOvji1dN
         0iPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793783291; x=1794388091;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=D8me2QpoNUYpkzCrzP/COkjEOzARHLPsOFtTfm8ZtJ0=;
        b=ib3kHKIc/AXkLmfDYrOREXW9LQP/Wg+1mvKt8wT1wLLnSjK4pJ2hPgcz9IcJYLHm4x
         oI2hCETw48Ei9IBvA/2hGaSHr3vYKMmeCIdvOVeRHDvrvJa9wyn1nPQfRKckYVfJOz/w
         IpOy/8lU8+KE+3DhJb48Bylv7GKuYZAJ2jE9WOeQfblnNr+CyLR+yB3zem/unZy1X1yj
         07lpEytQfmuicmDsj2vlBACdR520ZoBJxJmAEt9CxXVbmk1Fo0AKm49FAc8gE46HyVH9
         yTP5hk9dN8I/ZGr7d0MjVg4HzyGd0gTlcd7bqrZiu8CWRqC+e80pU+zUJN6xsh6ma501
         iBjw==
X-Forwarded-Encrypted: i=1; AKwUvBzGdIgKg/zDEaWW0GRN9nfLrpWMaHGCIDw4n8l2JdU8BiLMVGvG7C9tbtmeSS0NJqX8THUqvN/hajBv@vger.kernel.org
X-Gm-Message-State: APuU4Z9zxoN+YQbfjYHFR3TPPZGhtpZZFSzIJbr1aQ+979VF9xHrhDqV
	CXjT/ZYrEIyLyCgIKLzCejHdrB8VT852xmuHqbBWlNdP/5Bmji1Zfrd6yXgVXtzR0AZXcwFq3gu
	hILYLuZ3n3OMy2y4Z4wVjNv9znBwERSgtRhEKqI7+4v2Q+Su+UdfxiW/dBbWK9vAa
X-Gm-Gg: AYBFou0+CA+wEKqVlUSTMiMVSHVhOHsNxocoYcHpwimFJk7k31TSuzQILz0dTStFV3S
	bb2oxnpdcqGYQ0pKtDdl8cbk98afwwlSnlHm2jq82SoPliKJcHrUiNFM0yD/Qa6yKwGpmZEhj0A
	GU9ll9G1pJ++sc31ejK4q6mF/IuKWaoa841L1Qs6g4Z7WktE5Ai+l+3Do8J9GWXcE41pSpopxQR
	aBLWR1/lMgtrdQaRfXH+VEENijjey+j/eMEoWQXY7WUW/29tYOk3yP9/duyVtaWq5DVH2SZhmxh
	gNfMyCxhnPPY1nGIHyDXtBq5s7fpKRHAt4XUkaNQr/FNAaJ7tTU1RyibC4+s5Abnmqwg4MZ/RaM
	sgUSw4RSFpEZPE34d1Qjk4JLw99Dij0Ims4FTl7iBaqgboWNAMm4PyGmfmy+qk91R/GimxjZunv
	E6mXogL5Aea92w0PqsdU8=
X-Received: by 2002:a05:6830:2b0e:b0:821:c75e:5309 with SMTP id 46e09a7af769-85d3636e246mr12595629a34.7.1793783290889;
        Wed, 04 Nov 2026 01:08:10 -0800 (PST)
X-Received: by 2002:a05:6830:2b0e:b0:821:c75e:5309 with SMTP id 46e09a7af769-85d3636e246mr12595602a34.7.1793783290473;
        Wed, 04 Nov 2026 01:08:10 -0800 (PST)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85ef3d768c8sm1519846a34.8.2026.11.04.01.08.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 01:08:10 -0800 (PST)
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
Date: Wed, 04 Nov 2026 01:08:01 -0800
Subject: [PATCH v4 2/3] phy: qcom: qmp-pcie: Add vdda-refgen supplies for
 Glymur
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261104-phyrefgen_1104-v4-2-ba508fc6ab40@oss.qualcomm.com>
References: <20261104-phyrefgen_1104-v4-0-ba508fc6ab40@oss.qualcomm.com>
In-Reply-To: <20261104-phyrefgen_1104-v4-0-ba508fc6ab40@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Qiang Yu <qiang.yu@oss.qualcomm.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793783286; l=2038;
 i=qiang.yu@oss.qualcomm.com; s=20250513; h=from:subject:message-id;
 bh=X0zqKLQgxtFqsdr2c8NqWI9DTymrR5SFOBpbqURcmZU=;
 b=jOmVb1vGw8nEqcFE5bWnDz1WHLHxQTvffqHoM0iOlxKkPjMbu0qP+0COeDgjSm43OG0So7hmT
 x3ll492AqDnDr+4Py0zhLe3Smv3XmkxJ/2pgmb3yWL9VHEsYZvwRN7a
X-Developer-Key: i=qiang.yu@oss.qualcomm.com; a=ed25519;
 pk=Rr94t+fykoieF1ngg/bXxEfr5KoQxeXPtYxM8fBQTAI=
X-Proofpoint-ORIG-GUID: VLerIGEnAqXp9sFnBcY0keQwhiV22KmW
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDAzNiBTYWx0ZWRfX036NZFRn/IlV
 8iLJTrwQHCqCX9K0qM/GFIxD4bAmlzlC3mePRHab1NVE541NFw3uWynBMvA7Ev9rOM1NFCWD84F
 MrhkXnFtUypSf3NFr9pCuRvMpFOw38Q=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDAzNiBTYWx0ZWRfX3hJoGXa0zW9Q
 wZyT/sru1n73Bf0+lwGo7Ill2GmnzINhWc+QVqt+kbk5pRWPRVSfVEtgLVqexHUUCG12Rc7J5XK
 Xl0MD341Jg4Bb+78gkbP0FFF2NroRpGHO9bmkB2n1Ggv1ZoxG0ahNV1GVa6MyncMEiVKSowVk+O
 Hr+GXiSVOIHmV3Ixvq2bfZS159ezrx5wN7BCITJDSxn07nZ+oiz48wb6Y6QH+9UYMrV5bg75suQ
 nFz0+dxEWhuZbiyHwbbkVSKvGt4g32UMzEG1fSIKrx/6KAAsL2Dvu1cdrMUb9SJpGnzvWS05vP5
 FeBOtyFVNotr9gKVc65jVmVk2am1QZdABsvHF3Dx1ztdldia9o0S3jP2s+1vVv7lv7fYQ3Ziad8
 Xbz7JzEDZMySzlZN1bfXeqpm8Biuwirl9AudBwOgQeBPknZCCQIe9tF+qiaO596vsygQzWae4oQ
 fJrkdpEpCLtyJDBE3TA==
X-Proofpoint-GUID: VLerIGEnAqXp9sFnBcY0keQwhiV22KmW
X-Authority-Analysis: v=2.4 cv=O5OsLx9W c=1 sm=1 tr=0 ts=6aeaf5fb cx=c_pps
 a=z9lCQkyTxNhZyzAvolXo/A==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=m2jQVEIWa0EwQwJFt7gA:9 a=QEXdDO2ut3YA:10
 a=EyFUmsFV_t8cxB2kMr4A:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_02,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0
 clxscore=1015 impostorscore=0 suspectscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611040036

The refgen providing reference voltage for PCIe QMP PHY on Glymur requires
two power supplies independent from the PHY's core and qref rails. Add
support for vdda-refgen0p9 and vdda-refgen1p2 supplies with a dedicated
glymur_qmp_phy_vreg_l list.

Update both Gen5x4 and Gen4x2 configurations to use the new supply list.

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-qmp-pcie.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
index 9cfabf474fd6..e226b65ec7c6 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
@@ -4106,6 +4106,10 @@ static const char * const sm8550_qmp_phy_vreg_l[] = {
 	"vdda-phy", "vdda-pll", "vdda-qref",
 };
 
+static const char * const glymur_qmp_phy_vreg_l[] = {
+	"vdda-phy", "vdda-pll", "vdda-refgen0p9", "vdda-refgen1p2",
+};
+
 /* list of resets */
 static const char * const ipq8074_pciephy_reset_l[] = {
 	"phy", "common",
@@ -5555,8 +5559,8 @@ static const struct qmp_phy_cfg glymur_qmp_gen5x4_pciephy_cfg = {
 
 	.reset_list		= sdm845_pciephy_reset_l,
 	.num_resets		= ARRAY_SIZE(sdm845_pciephy_reset_l),
-	.vreg_list		= qmp_phy_vreg_l,
-	.num_vregs		= ARRAY_SIZE(qmp_phy_vreg_l),
+	.vreg_list		= glymur_qmp_phy_vreg_l,
+	.num_vregs		= ARRAY_SIZE(glymur_qmp_phy_vreg_l),
 
 	.regs			= pciephy_v8_50_regs_layout,
 
@@ -5571,8 +5575,8 @@ static const struct qmp_phy_cfg glymur_qmp_gen4x2_pciephy_cfg = {
 
 	.reset_list		= sdm845_pciephy_reset_l,
 	.num_resets		= ARRAY_SIZE(sdm845_pciephy_reset_l),
-	.vreg_list		= qmp_phy_vreg_l,
-	.num_vregs		= ARRAY_SIZE(qmp_phy_vreg_l),
+	.vreg_list		= glymur_qmp_phy_vreg_l,
+	.num_vregs		= ARRAY_SIZE(glymur_qmp_phy_vreg_l),
 
 	.regs			= pciephy_v8_regs_layout,
 

-- 
2.34.1

