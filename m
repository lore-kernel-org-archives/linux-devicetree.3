Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7544442FBF
	for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 10:27:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785320860; cv=none; b=lbs8hJoS8M7yHcbocQJARGRDai7JGtKBtBPHc6fBJjz5ONxvvCq0pxhb1mzPqYIVNYFdaJe4sMk6oWolFUl7HqOFH2vfRew//NxDLMusCCamK+49lq9+Nln42h6uvbjg9uEU1pTe3cxTDAypXXd4qQ89H/QpgZrKgfgd60zIFgQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785320860; c=relaxed/simple;
	bh=co/4Cj63vyzZmD/2SJgvhrWwCd+mn5OoGp9MJQk7sk4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=N/h2xLiRVmWiYzyVOGYlwOTb4AxGNHaDvMCdJFm4GXvy6NahKsHFbkDzP91LnYTsKsdvrcubDYVq0kCmsGUddkN18BBy/sk+OlPwS02rTXp/u5r4FakCi2uVp0dpaM6c5rIF/WrWwDPtghTWYH+GAlIKC8bAl9dgXdvkqnj8sG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UmG/3q+p; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YRfrhfkk; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UmG/3q+p";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YRfrhfkk"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66T7eutC1167685
	for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 10:27:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UqN3Dgv791e3Yai+1Bq0iyZ5Mp+HF8kacYDDQjRbg/I=; b=UmG/3q+pBBhmVFhv
	zIMUgKXUevtoqf/JZYifERNWUcA3Skh7iGf1HjXuudwQpf3gn4+zBHrZMxxt4o/O
	divjWT5HlzwOelAvF2yLYCaRCH074/x2Q3OrWD2AMu18ERtmKYn06JZxqjtX+6AA
	aaqm6NPB4+0Ap0CfUG84wYPGfltbkJipePM8NXxixFy2ItaRbzq4+uSfVesm2J4F
	MZw5VCPnRmma/RVsKKudjre9CH3xR8D05b2yPDXsXIAJQR7liBSEVIyNwP82aYyJ
	Se3ga/7cXidbo0AXzCDvG2aOon2DzU+fMsG2Lg1DjJ3QX1t/BzEwgeCxUhI4/Ooq
	R3EqKw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fqbhj96rc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 10:27:37 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3809cc5dcccso188085a91.0
        for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 03:27:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785320856; x=1785925656; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UqN3Dgv791e3Yai+1Bq0iyZ5Mp+HF8kacYDDQjRbg/I=;
        b=YRfrhfkkI5QRqxl+II4BjrIRVGWtQbBj97fD6tHmQu7/JDcYDfPiueEqR1o2bz/sBP
         OSUllwVhEROkM4Rcg/MFLh+0lN/IKn1uzi34ZT0gBSWO7OdcZ8HKTzIwAZuj2l/9BOUk
         KfMJLzN7Nb8G/Eq6DNGvPe1r1G94pEqXrMNf/bW7VHjhV2pQR521gDJRZqmBEAwL+U89
         TtB94f7EAWGiwmxly5DvAkvj3NNSyz2Aqzhy9EIV5s0ZimKH6dUHGt92pdwoLXxcWAiY
         /xyEZKnKr9vjbIoWmpe7oGSOYEhO6535kKoycd/BEHNmxUAamDA5f7ZhZb8QH9I4BuUF
         B2Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785320856; x=1785925656;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UqN3Dgv791e3Yai+1Bq0iyZ5Mp+HF8kacYDDQjRbg/I=;
        b=IcgIW4Lh4ilKgIgOcEW23hepqwRH/sTvNataciDDrHLRzkExjwPvRN/xfCcfZNC9E9
         tC1Dw/JBSs9I9aa+EJOeW1ozAzKAflay4D8Es9hu/8TI2pS8YdnEdj9WnId12l6LPkWn
         OVVpov+mkh28KJcSFqVeflrRdeerotzIfhCiyYGFZjoQg+KsoRZ0tT/drPHFVHJHuv9C
         gOfuEMLNb/pKVNyeO5Ni6iO/+qdHHk1SmV1pCSerJAdLm/PHUEbWpfGZ04pcjzcX5Kj9
         M8IvE7eF/8AP/cDIp2XYf1NPgh48qDgGg6AswGzxpItts/aly2zlieggKHUacfUlYSw0
         vQzg==
X-Forwarded-Encrypted: i=1; AHgh+RoCvV54bh5IOY2U4EEiEa3CWOY2ZNRQz19fdGxGWfiXfB06bH8iMAIiobx+ZQHrsDhyLH5iq51cM8Ro@vger.kernel.org
X-Gm-Message-State: AOJu0YzSZgqmrdE9ZAhvxWrsBI8ZRW5m2rr9K5zA5BLbKSG2nQTkckXe
	stNHCTxW3DKV0Hur0KirCAsWrYZcl6Ek7U1h1PXnx9S/UT+kypGiycy9QWViqoB+v0vjxir5dPT
	9uWaE/x9LPaUn8Iom0ANd7bKE568eUSC6+Rt8hBXHHxm+eN4Va6/EzimVAbRE4nJO
X-Gm-Gg: AR+sD12Mghuangi5m01KtQO0dwoRq+qHodmN/FJJSA0kzSCTEJRKSEbibfKq/OeQAJb
	tRorfr7w1EZD8oGPdrm14RZqrNh8Cp8XE+53ofR+XyEpgceukuBooppn6Z1z0et5tYqSWY+2z8/
	e3Qz7JNkQGuzbjF+VotF67+5m44caRPUqz94tDgkCT1BsS6dh0EHvCITwwMK4BKxtril2lfAI2F
	HV5yiooAx935sm+UZ4Dq/p155jeITXNeU0TM+7sm1aXeQbUBPtfsVD84jyEwTi5JQzWjyWUJBvg
	QBWjpRovDNInKczjW0iJeNgDy+T0rzyxri5qigxb8Wz1KSxlB3xEC0LVeYk5GKpiXfVyL/9H0r7
	6S88ULXiAV0pE/RDCyRBaTHZn/y3wH4xOl40aRkwKw9ohzlFBers=
X-Received: by 2002:a17:90a:e7ce:b0:38e:6a7c:abbc with SMTP id 98e67ed59e1d1-38f7c991f61mr5225489a91.3.1785320856404;
        Wed, 29 Jul 2026 03:27:36 -0700 (PDT)
X-Received: by 2002:a17:90a:e7ce:b0:38e:6a7c:abbc with SMTP id 98e67ed59e1d1-38f7c991f61mr5225466a91.3.1785320856025;
        Wed, 29 Jul 2026 03:27:36 -0700 (PDT)
Received: from hu-weiden-sha.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38f7f0ed10csm1121477a91.4.2026.07.29.03.27.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 03:27:35 -0700 (PDT)
From: Wei Deng <wei.deng@oss.qualcomm.com>
Date: Wed, 29 Jul 2026 15:57:25 +0530
Subject: [PATCH v3 1/3] arm64: dts: qcom: hamoa: Number usb_2 HS port and
 add M.2 endpoint stubs
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260729-hamoa-m2-dts-v2-v3-1-4d7ef9274575@oss.qualcomm.com>
References: <20260729-hamoa-m2-dts-v2-v3-0-4d7ef9274575@oss.qualcomm.com>
In-Reply-To: <20260729-hamoa-m2-dts-v2-v3-0-4d7ef9274575@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Manivannan Sadhasivam <mani@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Chen-Yu Tsai <wenst@chromium.org>, quic_chezhou@quicinc.com,
        cheng.jiang@oss.qualcomm.com, shuai.zhang@oss.qualcomm.com,
        jinwang.li@oss.qualcomm.com, xiuzhuo.shang@oss.qualcomm.com,
        mengshi.wu@oss.qualcomm.com, Wei Deng <wei.deng@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI5MDA4NiBTYWx0ZWRfX1tmvvC4M+Yht
 uH56QB+8q0EMvTzW5NVrPElqaSCXchGbaWJ9Uy69hz8AP3MNlb6VqHEWizLgYXPtp4rD15p4+PO
 ksfze5GDsSelzCmiAUG2GtnrLNlFcl4CUs/m9cUEoWgrvzMR8STPESC8lE6LN/LwCDF1SxazeNH
 nAAvHTq6tzQ9YqtVE+0BvrL3CIG0Yf8jDDWJcF5/c0D2M4BdnHzry954fH4xsbEi1tz7CMwU1Ox
 RjYn7YCDuNxp0wBOBaRhkRb/DgM76wyvIE+cw69fs0Qlo28c+Ccx+/GWJ2oYl3gJ922KcbKtm0H
 zHP8V+ZidouvR1Bk4hnJTCR1soqrBEoA7xCer3Ji9/JAU2nzSTHgE1yEJLoQ2BkZDoIbjat5D2d
 mDEMrxUv0DyJGvWojbFFXBKmvDuPs5T7973ey2xvm4B4qzgej3FUjyXCsWFu417BjP/Ce4f/jUQ
 UWki7ja2iEy2h42L9dg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI5MDA4NiBTYWx0ZWRfX3HxTQ2DyVjuO
 LfOTawqt5y5e7CtawqNmI5FbJrOCxbiyFZeOmnsRoiIvHjbXLA2IczhhX3+hKMmz9VZcEeMyS50
 Wal9CcFUKSg97bAMnNgDvGeNwiCrO6s=
X-Proofpoint-ORIG-GUID: j78yOi1lK0d_nmAME6SDXPWeH1216A1a
X-Proofpoint-GUID: j78yOi1lK0d_nmAME6SDXPWeH1216A1a
X-Authority-Analysis: v=2.4 cv=dsvrzVg4 c=1 sm=1 tr=0 ts=6a69d599 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=1XLr_2yElgjNbZB0CYAA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-29_03,2026-07-28_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 suspectscore=0 priorityscore=1501 malwarescore=0
 adultscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607290086

Number the existing High-Speed data bus port of the usb_2 DWC3
controller as port@0, consistent with the snps,dwc3 binding convention.

Also add an empty port@1 endpoint stub (usb_2_m2_ep) for the USB 2.0
interface to M.2 peripherals, and an empty UART endpoint stub
(uart14_ep) in the uart14 serial controller, so that board DTS files
can reference these labels directly without re-entering the port
hierarchy.

Signed-off-by: Wei Deng <wei.deng@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/hamoa.dtsi | 28 ++++++++++++++++++++++++++--
 1 file changed, 26 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/hamoa.dtsi b/arch/arm64/boot/dts/qcom/hamoa.dtsi
index 09527dcf9576..724471152fab 100644
--- a/arch/arm64/boot/dts/qcom/hamoa.dtsi
+++ b/arch/arm64/boot/dts/qcom/hamoa.dtsi
@@ -2025,6 +2025,11 @@ &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
 				pinctrl-names = "default";
 
 				status = "disabled";
+
+				port {
+					uart14_ep: endpoint {
+					};
+				};
 			};
 
 			i2c15: i2c@a9c000 {
@@ -3785,6 +3790,11 @@ pcie4_port0: pcie@0 {
 				#address-cells = <3>;
 				#size-cells = <2>;
 				ranges;
+
+				port {
+					pcie4_port0_ep: endpoint {
+					};
+				};
 			};
 		};
 
@@ -5134,8 +5144,22 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
 
 			status = "disabled";
 
-			port {
-				usb_2_dwc3_hs: endpoint {
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					usb_2_dwc3_hs: endpoint {
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+
+					usb_2_m2_ep: endpoint {
+					};
 				};
 			};
 		};

-- 
2.34.1

