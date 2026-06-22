Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F15FB35E953
	for <devicetree@vger.kernel.org>; Mon, 22 Jun 2026 05:11:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782105105; cv=none; b=D3pUYyDUiZmoqNvSy2tQ+5qm+VY++t0MT1UpufminqDk6XlAJIrUzbiNdkyDsdFlZA6PRGArSTBkms9OVs/3T0yLu4xzzz7ZblWGNmxwkQcLi3+Fh4ajOYRzWrc33OJO/B08PY05yGYwHw+MgvN4+Uu+MxykEbybo11KuXPOawk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782105105; c=relaxed/simple;
	bh=4YeWlIEukC55Yr2J3TwKx6HzkQvNRDSFgt+i8fnXgCE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EAXQSa38sN2YsDtgDGTkC9koNzt6448XLKLRKAXzT7Hkt/xXKkIJlHTnO3U7vzOKHaCE3GMYmfISHp00zGaS3aGupEl+wn9vkp68VF1oh9JNadGtcG/mvQckIzzqHf9Kz+B463e+KelIVrF64G1mUHZ17J7TmKRKoWbOUIltWNM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=B2kOIG6N; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UYZCXLe+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="B2kOIG6N";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UYZCXLe+"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65M59QWl3800850
	for <devicetree@vger.kernel.org>; Mon, 22 Jun 2026 05:11:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cAfjiA1l0N3l6JHykhKskND7GC3CBlmNzpO/TGQIE7Q=; b=B2kOIG6NHaEx3F94
	8LjgGP+l5TsLp8ZpYSpKb+TibyZ51V5kkz1uLtNRWQIcvyMvimrQHIYA6AK3Y5jK
	HK+nWdDtXw3kWRiVlMbB4nZPUGiZHM9a9c5rSrRP3kKBPCKKLbjzLBN03TpDe0St
	LxlBKWsgiZaFv8xrr6rS3rt8VtnizOOAB9cofWMmVf/6Ai9WC6/iY6SY/CSfb/Y2
	p4lPfNDwCQ4vnWnadIpnvzch8CY8wHBPOGCn80GIQPLQC0DDL+xfw4cx0Day5WUr
	6pN3U/hXCgy2BEqhMmLpd82ikam7JJkYHIUlNvLtZELW6ZI8XQ53MDOexYEkGBgF
	wKcHHw==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ewm1k4p7g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 22 Jun 2026 05:11:43 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-30bef75a41eso2810946eec.0
        for <devicetree@vger.kernel.org>; Sun, 21 Jun 2026 22:11:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782105103; x=1782709903; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cAfjiA1l0N3l6JHykhKskND7GC3CBlmNzpO/TGQIE7Q=;
        b=UYZCXLe+htDdVzlsNvKtPn2jO2HAyRdDJCJWmNgiktokb2+eVLnhRK8A1UpoLzNvVz
         pMJZd2qx6qJpHfuOrrnS3TcxAep0RESDzVglhsGK7LLJjHFFtINdfuFZOsVNJOfq8b4G
         N67Hk45A+nl0yFvj8zsbW5pL1QOIP6bOgRHozUcV+vv9fOaOHcZB45wuU2bMLWC78ItI
         vsBhzcsgo9QZ4nSycRp5BYs5MOXZsMgTfTID8aA218g817hSyp3SVUArrEE66FJ9qt4U
         G1eA+ikeaqfiuY0416ieiRjZ5S3sB4Ij7VwTI9tBDtieg97wS8LmIrvKUIJ7maNF1LzC
         gwMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782105103; x=1782709903;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=cAfjiA1l0N3l6JHykhKskND7GC3CBlmNzpO/TGQIE7Q=;
        b=BVhFB69nW8kKJgLUQ+EMw48KrEodGhMx1eq6w6dN5hbimb7vB5tR/07lb3MyjdokoA
         C6P9Nai5O+Du5uqMfbWdyhotekW23oHDPd9tc2ZYTQgN6teRvY+uJWpGMSLdDJgu9LZ3
         OifYARqB8/4+siyAvbX0grZvzB1w0rddEvJrEwleLwDOfNcAj7Wpw0asAslx8YAYW0Lv
         ZaN21fnpm0MBP03rjCduolPxjofh8zLLVqmxqvqmvvkZsGW7ZxTBbBJ/jEtqWLD0EhJP
         m819xej5cKEkMu7HZ1BOdAm9i5FgD2l6+7Na08yJjwpsV2lRXz2weJ0/exvSvb225a3G
         88jw==
X-Forwarded-Encrypted: i=1; AHgh+Rr/PKW5Y44P/hU1asI1lN7aGtLZccFC9BT47d4G/j0Go6dNOQiw6LS/XbrcisSDqz1msp8BsDm1rA0y@vger.kernel.org
X-Gm-Message-State: AOJu0YzdSdK0Vi8I74dfpWbocEUtv6aPS3TCv+s45KWoTEKNsspqkmGg
	MLbr3ioiQGF5Cy2FHxoSq+rkMJSZOYtX7IjENijUt5TpW0qG0eZVqOuiLXWxMx0JWnrehorBGmM
	fhnNWopP9DsY+sUqk3g/jAq1ud1iLjqbd0dC1v5ti9m2LH2B/w7Ss/6g/bamoogb9PxKVY2Q2
X-Gm-Gg: AfdE7cmRmD3l6Ow4TSyMn6ZpwYTPT30ur9+kgjCpfR4yu2tXOPSv4zux3uOjHAgy824
	fOA5BgTHTfxH2qsOn3I9xI2Oc0lIsCx1dsRNr4PrVudegsCeifmVsyON/AHbl/yBe73tzVfGJ7Y
	cBKPM4OdddtcX/8bkYXD81/LVxE9Wv2LFZdBXCR5Rm4LNYD7bFlSqCmS8fNy5vZOZCv/IvLdWpg
	U1II6ZvH4QgWyYHAsNk1RYdzDHLJUDdjjVHAC3RttIqVoVI3V4/t/pR2hbzi/fpFveMmm/KEgey
	1ViHqY4HmlVFqgo/6NM6eEBVTzJ7L55ANPXbeqelNgSk0ZMg0CyTiI+EK63AClWzDL/M2TuH+KG
	6QQV+iPb8YzA1mAaxKlfZJb5ctSrXvaBKBlkKcDp9kID5zYHEcgHyTXULgw==
X-Received: by 2002:a05:7301:7c12:b0:305:56a:c38f with SMTP id 5a478bee46e88-30c1dc33984mr5769433eec.26.1782105102713;
        Sun, 21 Jun 2026 22:11:42 -0700 (PDT)
X-Received: by 2002:a05:7301:7c12:b0:305:56a:c38f with SMTP id 5a478bee46e88-30c1dc33984mr5769409eec.26.1782105102259;
        Sun, 21 Jun 2026 22:11:42 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30c1bd8d779sm8947716eec.17.2026.06.21.22.11.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Jun 2026 22:11:41 -0700 (PDT)
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
Date: Sun, 21 Jun 2026 22:11:31 -0700
Subject: [PATCH v6 8/8] arm64: dts: qcom: mahua: Switch pcie5_phy ref clock
 to RPMH_CXO_CLK
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260621-tcsr_qref_0622-v6-8-c939c22ded0c@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782105091; l=993;
 i=qiang.yu@oss.qualcomm.com; s=20250513; h=from:subject:message-id;
 bh=4YeWlIEukC55Yr2J3TwKx6HzkQvNRDSFgt+i8fnXgCE=;
 b=KA58cYmVTiU1YBfsAht1Jj+TeO0E0gkK7ERLNDktiQ0TY/dUl9AIVZ+6hed+oGmbejXwBRbSh
 1OcZxjE+lqhD+vrPL5vu4mGvB1cdy3UFHSHSfC9Nc59rwdTSsXNFTie
X-Developer-Key: i=qiang.yu@oss.qualcomm.com; a=ed25519;
 pk=Rr94t+fykoieF1ngg/bXxEfr5KoQxeXPtYxM8fBQTAI=
X-Proofpoint-GUID: ezMpggoC8c5fimj9aS7nHjvpPZMDyyM5
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIyMDA0NyBTYWx0ZWRfX2daCzC0D6vcH
 +MJE4mo1Ukj+LNBoJAm0Yh3YrFh+xKyra/F1py0LuvObSFSNuGb2uOrGFqEyTSHeIHBZuqLPTEr
 H9USWLy2oO1zkZeHy8in6Liux5fICJA=
X-Authority-Analysis: v=2.4 cv=T6S8ifKQ c=1 sm=1 tr=0 ts=6a38c40f cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=CR5IuhOMo0Dix3IxAI8A:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIyMDA0NyBTYWx0ZWRfXww/rs0QyIfUm
 Zinp28mrdkO4vvHIV11k524zp4fY54dLSzR527kwOUWdQVoP0PzS0ZFYe+Kf1eWmNoSAhHj0jXw
 qZ77EjdoZi7Ce3r/ENEgnwowA4tnFDYQaABdSbTex3le7u1tUDacMN5AHIbj/PPczOE2f3hIBRH
 p8wtg3QqgcaUq/xwRqBWR+2lOgirUasSJ9HtMdnhN8jwxLujXt4l5yhmn7fxR9bcZgxZu0P+3dm
 qS5/HVxybNs43dcUNBG+kA9ysVq++k9ypE7fWWSFXanJbIIXSBDJO96yp3N3totFyI4qxIi5Uz+
 17jz79iEqKDgQGMdnZC6LZRJxhq75dnY8Er4gKlvt46agNipyWVgL4krJ64KW5hpH9+gbga5LmV
 FEc+Kg/t+RXy6gUrECROy07HL+X4ILzAj20zNE9/FL7YI+Ejp0KZhKb4lniAo7o1zlPILTZ3Qbc
 /T9otrYmHjAUS8GCwig==
X-Proofpoint-ORIG-GUID: ezMpggoC8c5fimj9aS7nHjvpPZMDyyM5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-22_01,2026-06-18_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 malwarescore=0 adultscore=0 bulkscore=0
 impostorscore=0 lowpriorityscore=0 spamscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606220047

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

