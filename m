Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE34A35C183
	for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 05:14:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785474843; cv=none; b=YqhcyXSPTJLGH/PFt5UE6lIosjawmNzzG5wuF4oRI/ZdmKuPO6DEJkVN5z9F1tzUx8dpxGhvm/g0wGygjFDotYO6Qa0Bq1l47fnVk+Bl660y6yNXvWENx6CQTaLnUrgLg90fnOZph2DCV3KbNb+Zwh8GiqUewNepBp8ihMnmkqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785474843; c=relaxed/simple;
	bh=mEJl/T+z6tFrYZ3D9hQa0mJ+NIP86nQKZj+r+SNddfw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=A6SkpnUb34q0BUO3g8hs37PH0SDOWGbwI43lUneeHYd8XOxzFyyi5kKaWwGsIaJKsuMOCNhcYrhqNcfBMcTlFgQ+dRqPYevGxhNYcAbIgjYfrBuDWT6FH9oNoTBVDFHm1zqQmEHxFhr71fp7xVE9wu2YjBJSf6f9L47iEipfmcQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YvBRJyNm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AKStRlb1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YvBRJyNm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AKStRlb1"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66V4uoCE2860180
	for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 05:14:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UyK0q5er6ozhcg33SbPg20I8Bg5HHjeDXhNPQa7k6ZA=; b=YvBRJyNmHbe1BuBM
	SmZKM1Rhq/+l7Hmc+c+OWykDbKcem9q1cKtIjaiqh05tXTevWlaKAy3LTg61xx9P
	O7wVM9T25D5P3PRhv6fC9iHCtNzIX1jpmcTl1i10LpPyWbe/8vO0jCSsdJhn1XH4
	guN4ysNOE3D9qHtjTNY8RsLnPpqcgPK35U9/n8KFPtbGMCP/Sc6M25iZCc2uSHMV
	Pfgy4R3VdoeWyoJDCNZVtMo94gmf41STsAQrB2i9cfYkNPE90sptHlSxbE1Ulv/0
	kHURlLjkZCR4+wwKhfP8whNv4atcBGqmnvIBWGlvuitCMj1huZMDKUCaI4frEg0M
	1gp6EA==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4frmyqg2dn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 05:14:00 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c89704da8c7so847103a12.0
        for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 22:14:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785474839; x=1786079639; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UyK0q5er6ozhcg33SbPg20I8Bg5HHjeDXhNPQa7k6ZA=;
        b=AKStRlb1MLIFdMiCCP0pC55OsxJA0vxtNaByFCx0oXOXC8VN/ETIgKkrJlCRSWyjEs
         dglRrGYftqeT+MD1GH2y83ZIKy9/Oen4WacO/VoSvUxqAo9nbo5tGc94AGRPWzztZ0B3
         fT08/mN/jGY6cvyxs9JM0imPRInM8Fz/kLTtw++5j+9t+eD3eX+mTITw8OgxjcCQ3+eU
         oeXPLb50CWPaISykPreKKlMgQLmFE4/vQHEneb4Xk3opJCM7UFdCjDmT9vnihCFN1HwO
         rJaNpn4gBQA1jIdgskaqSWL8xlATknepXpIgZSFcsuhkNbmu0lfHN37Yiide5iZS+fH3
         yc1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785474839; x=1786079639;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UyK0q5er6ozhcg33SbPg20I8Bg5HHjeDXhNPQa7k6ZA=;
        b=elMWSlH+XgzNgnDcJowetVlqibr+GP5oCpZnxz1wkBWKQeNfvAywP5p91mLjg4Skxr
         FpU0xVV6udjfV8qP0R6DAo+uvxnu/QWt5+cfNwXAu972jJR38gOCkL5QJdW+1biTqBeH
         NOnFOQY1C815NlasSz5U0WIqjP2C17eiVeABVKZY3Gth+bMp+KToLz7ie9+72wMrTazz
         EKSw68R7ZNVWAyxvSCYU+un1DE0fFDv0NiWqLzx+6jVjU5kN37WlAkFsCV8pZAt1t4N2
         ZgOqY/1ovEfM8JOOlXdqRA4ZJF04UXnWlaBe1F0xp4Fg+YlvltOOjLW0bxm2kEWJIlzf
         YGDw==
X-Forwarded-Encrypted: i=1; AHgh+Rp+ny4xjSDJz9vAA/fYP5/68UXQwezwiNXgI6rs8E0fPiLBDbYzs8wXpeae25lIZOMh7aBcvZ8TEbF1@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+bGn7K6age3OM/7aJsNe2jTp7/4ribiHMLdNZRQedw46Eq1H6
	Zrug/Dw7tIT22uZ0tzeX36nQ+jHHYdWr8EN7eDfb416xaAEY3cRUlELi4AiBof4i58OZfACnW4v
	f24J+yqtTqrVW8YgG0h1wTpmM9fSWsoUEKC5f3Z+tv4I3vlmAnZxPKldAMafpbDNA
X-Gm-Gg: AR+sD13fVsoom7E0cE8xcM8852SzSxwSPS6SDQF7AYD/Tq1X5zZks6kh8GRmNKGj6FF
	fMBbbvmRjfGTlI0Eigu5bzCQK7rFYV7EceHeAE/ocq6W8c2qmkEMenp5YJ4NNyflfHw+eATh+fq
	LSarDt5R06dSWyjLWxM49thSoSsH4VciXO2EjEYoYuhVoxC6nXyktGWWYtAbUZUJ2Vr34c7bPLa
	C+Xk1Im3YUD8bFL/5oH2P2XnvJyRTxlzuGE+VF2mR3hZ1NWEfSNkOhVjwo4ur3Crm8dX4xpuXEI
	mPAdr4w5oIeU9SBXsuviN1fdX6iSe9YspRzpGmoI5p+YQbiZwaXES287hSOKvwrqz1s5f6dfawE
	KweayuoVYhEwNnSckXCTNIosPpAbr17yjpzVDnE4FM3yMKCc=
X-Received: by 2002:a05:6a21:3395:b0:3b4:8f18:33a with SMTP id adf61e73a8af0-3c91b0a05a5mr554813637.1.1785474839535;
        Thu, 30 Jul 2026 22:13:59 -0700 (PDT)
X-Received: by 2002:a05:6a21:3395:b0:3b4:8f18:33a with SMTP id adf61e73a8af0-3c91b0a05a5mr554784637.1.1785474839131;
        Thu, 30 Jul 2026 22:13:59 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3153e06f88fsm976435eec.20.2026.07.30.22.13.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 22:13:58 -0700 (PDT)
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
Date: Thu, 30 Jul 2026 22:13:55 -0700
Subject: [PATCH v8 6/6] arm64: dts: qcom: mahua-crd: Add PHY supplies for
 pcie3b_phy
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260730-glymur_linkmode_0731-v8-6-a455265ad8bf@oss.qualcomm.com>
References: <20260730-glymur_linkmode_0731-v8-0-a455265ad8bf@oss.qualcomm.com>
In-Reply-To: <20260730-glymur_linkmode_0731-v8-0-a455265ad8bf@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Qiang Yu <qiang.yu@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785474832; l=845;
 i=qiang.yu@oss.qualcomm.com; s=20250513; h=from:subject:message-id;
 bh=mEJl/T+z6tFrYZ3D9hQa0mJ+NIP86nQKZj+r+SNddfw=;
 b=NVdbGP4jq1dYuL1jb/dKfeCHOIrTW+w5alpErC/xht55pn39M6ZIHMOEzFTD7sADA0k7ULpg6
 im5GPrV+4EdDr7IQ4JD38Sh3FCnLlfQ1N6plJUJcoIh58CcNH2Y2HMP
X-Developer-Key: i=qiang.yu@oss.qualcomm.com; a=ed25519;
 pk=Rr94t+fykoieF1ngg/bXxEfr5KoQxeXPtYxM8fBQTAI=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMxMDAzMiBTYWx0ZWRfX97xZ1xZhBS0F
 pzav1c4GXvNqckmsv/RD1j8XX+kFwZVj2OOrt6+FbhQ0kndZQw8shumFOnS3dDDMzM5kA3MG3Bx
 +igDoFk/Z6vENhculMZ3gBfPa2Chb4Y=
X-Proofpoint-GUID: h6wTNZmspmDwvUuuqli4cJl_hZJ1bQaO
X-Proofpoint-ORIG-GUID: h6wTNZmspmDwvUuuqli4cJl_hZJ1bQaO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMxMDAzMiBTYWx0ZWRfX7A+XyRecESDI
 ZKg/QMcITn/Zuf6j4/Gt1tlDneZa5Ux7/dpsVPnhUx4bub64e0erNiU6eqBhoOm7apN0wDB6J0u
 Yg4tsioWw5So5j45FTCYpK6Pq/NDZw8E9AqtiHg5LndAtOaRZU5JAE8ibuWNnB/n13Ga+zJ5uHv
 ArD4ICFmdY8/UEFmHHfdlDtZY7ltM5CkDyIgLTMKp2c1v3yIb8k3wxJxPoMXmmYnlwyGDsSMPUb
 OJbLjDubGNB0dWnWCkST3qb+oCxVeOnKtQgtO9rECl0JeBjS4ESfCNaSYfDLuUTJV/l4W0WQTc/
 vlsz+0TMUsGPo7xHhVlYugwQECObyHqxNNbCcNmqY+nj7GUm5PUw8/MRBrCHrp+U3tym2tJKhFb
 ZHCRdUJFJ+I+OLedxQL8zzalSrkErxxv3MgxsRx1E3+/FYTs3GH0bObRcTZXgNk7yr1jD36BMFJ
 pIWwrWm669uTdIemOQQ==
X-Authority-Analysis: v=2.4 cv=Xb65Co55 c=1 sm=1 tr=0 ts=6a6c2f18 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=FJ594BFJAeq65zshAlMA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-31_02,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 lowpriorityscore=0 phishscore=0
 priorityscore=1501 bulkscore=0 impostorscore=0 malwarescore=0 spamscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607310032

Mahua CRD wires the dedicated PCIe3b PHY's regulator supplies through
board-specific PMIC rails. Add the vdda-phy and vdda-pll supplies for
&pcie3b_phy.

Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/mahua-crd.dts | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/mahua-crd.dts b/arch/arm64/boot/dts/qcom/mahua-crd.dts
index fa5229064b10..17e40f2a6259 100644
--- a/arch/arm64/boot/dts/qcom/mahua-crd.dts
+++ b/arch/arm64/boot/dts/qcom/mahua-crd.dts
@@ -20,6 +20,11 @@ / {
 	compatible = "qcom,mahua-crd", "qcom,mahua";
 };
 
+&pcie3b_phy {
+	vdda-phy-supply = <&vreg_l3c_e1_0p89>;
+	vdda-pll-supply = <&vreg_l2c_e1_1p14>;
+};
+
 &tcsr {
 	vdda-qrefrpt0-0p9-supply = <&vreg_l2f_e1_0p83>;
 	vdda-qrefrpt1-0p9-supply = <&vreg_l2f_e1_0p83>;

-- 
2.34.1

