Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACB3B3FBB5F
	for <devicetree@vger.kernel.org>; Fri,  7 Aug 2026 09:51:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786096289; cv=none; b=kDXiaXLP6QlHRFzfTv2fXyjVYZFlMZHX1/VK2OIPJiV1tIm5Oe+/fR76ckiKUwv6oP0cIOiVfPaUtuI8Gzk2/+Sg6B26GYSM8InQo+ipN8+E5Rn99bT/QgPQwGegIQP7+WWz6qpWe+R4DZsov1Pc2fMc3INOs4fRiK+u33tfnac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786096289; c=relaxed/simple;
	bh=xfSeMIln++UVhRK65VIx8sgrep0LonxwAM+JGGCbE8s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=c+JwdeuyA7OdIVo/8lFMIBCRFz5BIJlMfgldWUIdp9LdVNBLt7S1LVwPbCjlT+ais9maJWLOukMoCgoXx2CwHbmYv4bxYJ97UWR/vX4xRlaubNWb+X/9jQNdcEXhxrlVu6IreWxgPHTkaVEBQkka0/Z/2CUk0PuPvbxShrPrKrM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=V0V3jUV5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dm3gO2Qu; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="V0V3jUV5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dm3gO2Qu"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67781BVi3179140
	for <devicetree@vger.kernel.org>; Fri, 7 Aug 2026 09:51:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nmhTlsH9IlSEOdBu8T9ac4bE+ZN/wrQucNg8DtCyyyI=; b=V0V3jUV5Wgr+52zP
	ed54POrbscVsZyD9gsOxScA0a/lqUbRML9GFbl0XHnRO4D5gl3plhCjQTwEFaGcV
	GY/yWozJaViIVhwvc4hXqv9PE2oV3g8xyRuK93CJS8hWTVg7RyORDLTAxZpkgOxH
	nz7Ee6ZoVC6SVqN+EpUjODwkLD30SM/8msveSPisL5+IWn+09m5te5SqnBtcCnQn
	4BZ9FPUU0QtVOUXoeBbLW6AQKtvIyNmNnCg8CEq3wgWk25WWxpVt8vqaa7Wtol9U
	HEm2XIw/1ONQIn6SCRU9n+niZtL/ZGigt8ZWc58lZrkmSFb8I3MtY2tQ3XNijaPS
	Dp+osQ==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fvy6jk97k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 07 Aug 2026 09:51:26 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-84e04598adeso2692370b3a.2
        for <devicetree@vger.kernel.org>; Fri, 07 Aug 2026 02:51:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786096286; x=1786701086; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nmhTlsH9IlSEOdBu8T9ac4bE+ZN/wrQucNg8DtCyyyI=;
        b=dm3gO2QulWX1HJsz/xX4yzfgy9UFEDBAzkOuQoh9ngXrMEqTPT2dGzrzRwMQoa8w4M
         K/2F2oY0dztMV1mgutlWYqqZa+iljujFZGMKIdpkdzPH3rALn4dGZosIq2IJw1Oe5Ho9
         eFs52NJuHo28SUruezMFQgAyswHfWrJOaP6L6gkrwzzE+w5J78dszM/u8ZRferzR7heE
         kfCFWK4Rlp/ueLdH2uxRnmPsXJgLRzN9NEc7XGIZGCiJBWOdvlVmoJkc4p70tS0l4ydm
         +zmrslLoi11LawkwsQ7P/Zfp3OfEd9C9ApEaYfRtOcHi5V15RWJuULYFSiduauY2g6S4
         kj4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786096286; x=1786701086;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nmhTlsH9IlSEOdBu8T9ac4bE+ZN/wrQucNg8DtCyyyI=;
        b=hB5TP+Ps1SS7lfq4yjZ+ctjsxpGHARwPkbIbi3/xCp0gUYjLatJfzBm/pZfTRWv+xN
         r9ozi2cqvDaFtfpFe0Bjr55H1HbedeWW+mJ0YVj0/CmNvdevfpBDUirVTGBabBNatPWO
         fMUNWvIodKMowutAJDp4I4cBhFMBgoNQSk8+04mPSvBDxTAyjW04yz/P718EZ4XXren2
         2J+6f3dsK5qRArvfn+WarVJURorT7wVmoO+Sv+abOIJ3JYz45G6Y1FodyRGzchJSft2P
         ziEJhIdL7L3XBj291CSwHBnUaFMsWaBHQC3DXtkNJZ7T83G4HQkSqZese2Hcqgs+/nOt
         y12g==
X-Forwarded-Encrypted: i=1; AHgh+RoKd/0fXkXk8wXCiQ8h2wY9xEeRRcxra6qPtaW23qamYNgTVdffLKCHZFS0Al4QUjcXGuhKG5K8QDKX@vger.kernel.org
X-Gm-Message-State: AOJu0Yzz7XThVcmuh2amcErbh1L6UwSgbCcugJjSd210vkMtnwJoUYV1
	jYJwe5IlBvLMm/rE+fKcJRtgEf3cWyX9Vo8SuT/IISOpLOfKWEh2K0LV4vLoUlUfmJ5kGFHtuWw
	o4LQzsOiAPsNzP/48rt5QDAsD269Ms5qD4uotW5w3bywFwtOeN0top4VItWX9Om3G
X-Gm-Gg: AR+sD12iw+F2LyPhTZe2I6yusqX2xc7XPT72nN0Oen0qzFTcIj+3AmOiRnvwRk7akcR
	yT8UGWGoHechFZW4wJyyn4A1xIg/Hy3v5UEX2qUBRUlr7/8uXfknTIaztfRjkkO9t0Pf+LOj2m+
	/SuNIyjKFHphLke9BfU0pwym6qiZgXvzuoinJa/4QSJe1XXjzVPCmuehlbvTgam2b3mNB28Iv9z
	Kv9SODx5Nqu1uwanJjDSbKiAhtnkl+XyFVs9y8G0NQ0KKkUuJN5Z4pw+ea7xqfDLUIMbNsC8wVo
	4yRAf+Lo783ZSUFMNtJG3mVoIcuJvcJhUWnx5As4Th02o+1A5R4sAlOdp+xjp3nHaDnkYp6PUZI
	zVFIZUIfVCT7Q8v/qijxnJDK/Cz95jXaRF8+mEzGAREMZQW0=
X-Received: by 2002:a05:6a00:10cd:b0:848:8445:6956 with SMTP id d2e1a72fcca58-84f4fe9f90emr8430224b3a.18.1786096286238;
        Fri, 07 Aug 2026 02:51:26 -0700 (PDT)
X-Received: by 2002:a05:6a00:10cd:b0:848:8445:6956 with SMTP id d2e1a72fcca58-84f4fe9f90emr8430189b3a.18.1786096285823;
        Fri, 07 Aug 2026 02:51:25 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84f5a3cad9dsm743785b3a.23.2026.08.07.02.51.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 02:51:25 -0700 (PDT)
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
Date: Fri, 07 Aug 2026 02:51:13 -0700
Subject: [PATCH v9 4/6] arm64: dts: qcom: glymur-crd: Add PHY supplies for
 pcie3_phy
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260807-glymur_linkmode_0807-v9-4-dd1c7e236e29@oss.qualcomm.com>
References: <20260807-glymur_linkmode_0807-v9-0-dd1c7e236e29@oss.qualcomm.com>
In-Reply-To: <20260807-glymur_linkmode_0807-v9-0-dd1c7e236e29@oss.qualcomm.com>
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
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786096278; l=1201;
 i=qiang.yu@oss.qualcomm.com; s=20250513; h=from:subject:message-id;
 bh=xfSeMIln++UVhRK65VIx8sgrep0LonxwAM+JGGCbE8s=;
 b=xbyLKWpl51FuOlCPGi+JKtVv0RFxgfKtfffeutIKs+gFwmCplAjYi7HAoqDBksiX+56T4UV1+
 qanA3BWmJW0BwDHTgzCogepMUUgzb+EqZIk3RwtycHjuJglV5UPWyxB
X-Developer-Key: i=qiang.yu@oss.qualcomm.com; a=ed25519;
 pk=Rr94t+fykoieF1ngg/bXxEfr5KoQxeXPtYxM8fBQTAI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA3MDA3NCBTYWx0ZWRfX7j8TX0wYUzPo
 7Y5ghy6HZIqsMJLISlReKY17qxKEqMe5pgq+nTVJv9xIabUqBewYbVrUW37M6+xAvjglNmjMg1f
 98cnMY+gX2qpolfwgjXt9VDVb0uCPaAvqsiGD9p35DrsS1i2JYUZBx/vQEv+em3Kf9m1WBg5yag
 tvgV8haINWW3JQnDW93q0ytHnWiMFcH8FNDkvoORb13iZYEN6mJEw+UH5PhqIvtR2bvxquLe3WZ
 rOb3dtWsO9SRh9mcbNy5R8U61hu7CqNmZ0uq5/XWm0TVXw+wiepu14jbUywVzyabZI4hV4qr8G/
 2oVR4uLubF/jCw/StZgZcIwLRKp+Dq+3jiqhwYNYuy9toJN6/K2Diz36QyYv5TwU1OjxIGpUKhX
 zZ1PYLgDU3s3CBb07WzKtVigjZxLsBkw98XEA5hnAMZzBPanTUG4MStfEdlcTzPyoOIIVrPtQKo
 Ruh+p0VEudBfcxWsZBw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA3MDA3NCBTYWx0ZWRfX/+T+hUuYhUTt
 8y/ZLLJVgZ2Pu9g8HetpCste9k6q6+vxBxXGs8EDt7p0TVK3la2l/0j/i8TLlxOYYNT4pPx6NFt
 8waa9DDz90c/3VfWyyNs2fVEg1RdMLU=
X-Proofpoint-ORIG-GUID: 8ohq-Xy7BVgEXU-Mwh5f6nTjDYVfcjQO
X-Proofpoint-GUID: 8ohq-Xy7BVgEXU-Mwh5f6nTjDYVfcjQO
X-Authority-Analysis: v=2.4 cv=e5Y2j6p/ c=1 sm=1 tr=0 ts=6a75aa9e cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=QdOup1CusybIpKGx1HsA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-07_01,2026-08-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 spamscore=0 priorityscore=1501 impostorscore=0
 bulkscore=0 lowpriorityscore=0 phishscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608070074

CRD wires the shared Gen5x8 PCIe PHY's regulator supplies through
board-specific PMIC rails. Add the vdda-phy, vdda-pll, and
vdda-refgen0p9/1p2 supplies for &pcie3_phy.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur-crd.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/glymur-crd.dts b/arch/arm64/boot/dts/qcom/glymur-crd.dts
index 44766a73b0d1..b8e3fedcdea8 100644
--- a/arch/arm64/boot/dts/qcom/glymur-crd.dts
+++ b/arch/arm64/boot/dts/qcom/glymur-crd.dts
@@ -29,6 +29,14 @@ &mdss_dp1_out {
 	link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000 8100000000>;
 };
 
+&pcie3_phy {
+	vdda-phy-supply = <&vreg_l3c_e1_0p89>;
+	vdda-pll-supply = <&vreg_l2c_e1_1p14>;
+
+	vdda-refgen0p9-supply = <&vreg_l1c_e1_0p82>;
+	vdda-refgen1p2-supply = <&vreg_l4f_e1_1p08>;
+};
+
 &tcsr {
 	vdda-qrefrpt0-0p9-supply = <&vreg_l2f_e1_0p83>;
 	vdda-qrefrpt1-0p9-supply = <&vreg_l2f_e1_0p83>;

-- 
2.34.1

