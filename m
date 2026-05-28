Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 015E72FD675
	for <devicetree@vger.kernel.org>; Thu, 28 May 2026 02:29:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779935374; cv=none; b=EOx2tPhJ/1Nn/z1HY4gJI5U1Jl8mspkcvoWSlzqVb6t1XAXHJzhq+82eHBYBadHf1RwZQVtNJkTRttXTOgnUzvX/ZjvMZPHer73Fs57AQHAMCepDuS+uT4L/aSLLOLw/Ahd39fcy6kJRtHcpbbxR0Wx/opHHDk1xhR0fVYhVJ1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779935374; c=relaxed/simple;
	bh=4YeWlIEukC55Yr2J3TwKx6HzkQvNRDSFgt+i8fnXgCE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PuLCsh3DPUd1YLFC5mKQzEdNvQBrQ35IVJRad940isVrpa5QOgCwpO7oANp/pIBkdQR2Qxa9W7cR5ep2FLU+wXAbnCf74wJqd+sp6VKzRczzK63ivpxTQgunrek+NHQv0ZHwzA5Yt1eo0Z3wpmwT8D4q3fZRjjWGKM51w9MMHU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BBncLDQJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZiBy+VYs; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BBncLDQJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZiBy+VYs"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64RKlGjb1975506
	for <devicetree@vger.kernel.org>; Thu, 28 May 2026 02:29:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cAfjiA1l0N3l6JHykhKskND7GC3CBlmNzpO/TGQIE7Q=; b=BBncLDQJBdMMGNdg
	ksMTizsD2A657dRshFN3Mxc8LKJJdDdaWO+nj/FIUoW/EnIUxT/CmpyXK0b8pNj2
	ChQj2LykFj/kF1CM+TeGdJ8aX8YqxX27FZyQECPf5zvYfGfTbdJG7TkQGlCm/CUj
	upFKzCe8gRtP2elGqeognByB2AAQHzknag2nitLbNahHWJ3Iy+wikXxu8beM7fFf
	8DswIjiYDcbBhKiSsT60rVrHPLoiFOLES0I5hQUGMgTws5fYzGRodPOgeI7ET7/G
	or9aPAEELDVjHckmaKiyRSmsPXCO4UgUeNYSzLnZv0U7hTasIJEORDZ/OA75Mjei
	HkipPg==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ee7y3ryg4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 28 May 2026 02:29:32 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-30457ff05b8so5370076eec.0
        for <devicetree@vger.kernel.org>; Wed, 27 May 2026 19:29:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779935372; x=1780540172; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cAfjiA1l0N3l6JHykhKskND7GC3CBlmNzpO/TGQIE7Q=;
        b=ZiBy+VYs2pIb0OnQaxiSljYsdyOp63UA7pDMQ4m5+IeayHUr6JptI9/EF5CIyOGcIX
         0ub0+Ua9M4PCpQcMm1fUAVaVNomEDlQsetWemlnxE5IHiPWvsKv/5Otc/Z3Lha72e3AP
         e++siFwPn8Ek0/afzwIyKkUKXnjFghg+Ry1YCB0HQ1iPyBPju0sOufVNiTT1Ko9nwnHj
         JmZpjDkb92c5gD7hCgShy9hLeAwJ16yZhjM0Fljd7JAGo8v024xvwmNpd4EDookdGzmQ
         Gh7PqOQQJPRBfV4oyqySa6i8xwCodFOa0lP6rnLvpfZHaWuY5+5Ib7cWqhJgIC/uzy8Y
         Im+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779935372; x=1780540172;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=cAfjiA1l0N3l6JHykhKskND7GC3CBlmNzpO/TGQIE7Q=;
        b=c9SukrnJS1vgjzWOvRx2tNY+b4IarjmNwUIEwGK1YpcFwVwWE3cwgWMBdVRTM8KcH5
         ZZbZmPc/YciwpTFhRCsWlvaWvdDTn67ZTrYP2BhF4HDN4Tsu+6hByi0eGYjvKe1NGiyw
         JilktT3lcrSUtfl7fLOTiDUtbin+86hRBUnJhr43bTKzK4d5ACkTRQl4lzIZxknaAjSB
         mwuAJ60NDl3SZfe3Ae3CaU0Hke53mTBhXP2bd06uzFxand41S53GFJ81onHW/L+nJJCc
         PiRP/UlaNMfXWL5HAdAq8RLz/77oCENB9urEMnUkT2HXaYlqoqr8/QvqB6G9anf6qg+V
         tAsA==
X-Forwarded-Encrypted: i=1; AFNElJ+Y/T9HRlooSUNQMZEnYtvuEDq7I/I/La9Ymbj7CVBEkVvlWSJap7ZuiTQFlvFScSRdnm6BAqFyYtfa@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1ARqwWNmJXTDkB8dHDCFQt2yA+oRU74ohUPq46tIjjGBSpIHf
	OtiNk156+rDTya4Hsm+Kwf6Saw3d9ZpxDm34kUZTnN36+pw9H2mgFR7uaT0ygJOc+Gq1omQ8Iy0
	WZngSIrlBN2uY68vLtFy1a/wNkM2In7RLgIVY1/QfCDVYkJhVYKmVYD0pSnEEVD77
X-Gm-Gg: Acq92OHH6Q3o8BmP/LhvUhXe/PneLrehyGFg34ZDTQgINLngKN3SiftErcbtDtFy6XY
	xbtZ40jbsK/6jUdoWOt+NEKDFIhILS8NIewZiBK5v8L8I/dnMBRK+pGOKJwpM+6qIcAAwzvSQSJ
	/sy1EJLKnL5GEZVl2PG+8fqCd5vAvhjaqWfrfxf9xULMwQZI2X2yX40StviuFnfVbc/5zFQ13UD
	hci3/NG/EDeLHwGv00WFTN1Z7b9q3/1foON1fOUeOodUfcvi++AOvvsRB4iHbxXPhDsGGlOA7zH
	LXSpooSQBUogLgp18ZvawbiBmcEPCHhkU/UHeO6Zt6R/rX2dXiz7GMFc2nVFdHNwduW/rJvUjQM
	i0afjRpByfM2fyzILH8vYd39A2cWHQWUYbsvE4Zdyny4OXyfR4iYza/F7WBvz/MktIZmtIFVYXx
	LkRmc=
X-Received: by 2002:a05:693c:69d3:b0:304:5b65:5971 with SMTP id 5a478bee46e88-3045b65727fmr6618468eec.20.1779935371838;
        Wed, 27 May 2026 19:29:31 -0700 (PDT)
X-Received: by 2002:a05:693c:69d3:b0:304:5b65:5971 with SMTP id 5a478bee46e88-3045b65727fmr6618454eec.20.1779935371287;
        Wed, 27 May 2026 19:29:31 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-304d4222060sm691653eec.29.2026.05.27.19.29.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 May 2026 19:29:30 -0700 (PDT)
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
Date: Wed, 27 May 2026 19:29:18 -0700
Subject: [PATCH v4 7/7] arm64: dts: qcom: mahua: Switch pcie5_phy ref clock
 to RPMH_CXO_CLK
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260527-tcsr_qref_0527-v4-7-ded83866c9d9@oss.qualcomm.com>
References: <20260527-tcsr_qref_0527-v4-0-ded83866c9d9@oss.qualcomm.com>
In-Reply-To: <20260527-tcsr_qref_0527-v4-0-ded83866c9d9@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779935361; l=993;
 i=qiang.yu@oss.qualcomm.com; s=20250513; h=from:subject:message-id;
 bh=4YeWlIEukC55Yr2J3TwKx6HzkQvNRDSFgt+i8fnXgCE=;
 b=COh3DLSrUdls4S9gugZcPaAmxGOWG2zHoFNWQeMaQwF0siTs3LgLdHwH7udGTkA7m5AZol4NA
 NGkgV3i0rAvATSrWtmxtT3wBl0lboI0maZuI9rRecrfHpqUXoUSqsZk
X-Developer-Key: i=qiang.yu@oss.qualcomm.com; a=ed25519;
 pk=Rr94t+fykoieF1ngg/bXxEfr5KoQxeXPtYxM8fBQTAI=
X-Proofpoint-ORIG-GUID: NWDkvMm0jQuqqQY9PcVi1G8dgaZ8wQHl
X-Authority-Analysis: v=2.4 cv=JMYLdcKb c=1 sm=1 tr=0 ts=6a17a88c cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=CR5IuhOMo0Dix3IxAI8A:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-GUID: NWDkvMm0jQuqqQY9PcVi1G8dgaZ8wQHl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI4MDAyMSBTYWx0ZWRfX3IOAvThm+b+i
 zmsBtUpmYSqhyga/YmjgKY2Knezmmumzo/yAFngmcSm/6QZEsKETY7BYgl5b9ReguGASWbMNxsy
 kKwiMwGxbvUBbYENhbmPOx22josqWpifx0agnVils8lAtGDzkvV/GjoWN+7sHJaMEHmVRycnb3c
 FcdXuH9ZES6k6UFI9q+XW+VU5nKVt7WfF0HvFK41XjUvavnD8fJCAW3BC4Lyv+JCfHAYdLY9UWB
 ZdIcjhUcOiHr2QaBpSPYWukqvftiBBs0X+q8KHf1s0F2TH9xtBU1lRREbTZGdhmHpyvWkBP/e2y
 s0nCqb2DMTOI1IHPJlBBnbeAyyRWUeVesMhZK6d4hnMtnzO8yahR5P5b+g2Gmfpl40VHQXgGDeu
 DwuVshrACM1D1UxdVglj8eQfmrKvEHOzSdro1d9N35APibmqK4nkkUvsON9hXfgv6wf4OUTesTU
 JQYA4unDO49Q20+bSFA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-27_05,2026-05-26_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 malwarescore=0 suspectscore=0 priorityscore=1501
 adultscore=0 phishscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2605280021

PCIe5 PHY on Mahua gets refclk from CXO0 pad directly, so no QREF
clkref_en voting is required. Override the clock list to use RPMH_CXO_CLK
directly instead.

Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/mahua.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/mahua.dtsi b/arch/arm64/boot/dts/qcom/mahua.dtsi
index eb45adc8a0a2..e6c059708912 100644
--- a/arch/arm64/boot/dts/qcom/mahua.dtsi
+++ b/arch/arm64/boot/dts/qcom/mahua.dtsi
@@ -115,6 +115,15 @@ &oobm_ss_noc {
 	compatible = "qcom,mahua-oobm-ss-noc", "qcom,glymur-oobm-ss-noc";
 };
 
+&pcie5_phy {
+	clocks = <&gcc GCC_PCIE_PHY_5_AUX_CLK>,
+		 <&gcc GCC_PCIE_5_CFG_AHB_CLK>,
+		 <&rpmhcc RPMH_CXO_CLK>,
+		 <&gcc GCC_PCIE_5_PHY_RCHNG_CLK>,
+		 <&gcc GCC_PCIE_5_PIPE_CLK>,
+		 <&gcc GCC_PCIE_5_PIPE_DIV2_CLK>;
+};
+
 &pcie_east_anoc {
 	compatible = "qcom,mahua-pcie-east-anoc", "qcom,glymur-pcie-east-anoc";
 };

-- 
2.34.1

