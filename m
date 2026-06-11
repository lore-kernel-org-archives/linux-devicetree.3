Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 320BF2ECD1D
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 04:59:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781154003; cv=none; b=fEjUnLwyKW7nScu4L/K0qFHNOzWSDxKd08WAeiTpZ4SgpbNbfTLSVTf5+6jDcBnvXw7yeASagYZ/lofTeHlpp68eG38bmOGqNvGCrQdpOOOB1l3/JSbBCgjDLl/XOLVv0RdOn+IDlIPUmqsPnjl7SYXp6LdjV9PgwmXL62BinA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781154003; c=relaxed/simple;
	bh=YWQTnwwuDj6jKqmNIBBOM458HqBbqXiHVkCLAkWhTu4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GkPUtyBIIwl5UjSqbh/pDCToCKkF7bOe41vRno4wkDkUddnfZXCtmuoBw4CJIM+VdNhHgFE8Mq1jeQZH8QQwxGRg22MNBWTSRC1Axpo6YmKUgccWfUSONyDKhF1hHPeOshEJDN/fU2qCCEHfTjukCXbx/sRgU7zivPgr0DNn2HQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bOS5TBUU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=etHaJy6l; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bOS5TBUU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="etHaJy6l"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65B0NgjU3179559
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 04:59:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gxffwanfGPhkL4TX4Kfzzu4TaWJkNBos2KiB0FBhCVM=; b=bOS5TBUUeuF0rMI5
	+M7zflYkWTUU3a/kCs8UfRUroBlLM4xAPXjt3aSBEt2g1/1V1Ip8FmyL/VO+OkYJ
	zTNxwTHwUw7lzlbepWUGr5g3JWB4qRtJdCxG8jmOl5TvHX3FHjVyjQcL5pfek3pl
	IyYjBdFzHAtNtpnc3Bu+1iNPGQOBNQt90B974CPgATBRHRyOd3rIsB3y4jFg3mZo
	6OR4hrrnYPM66mJdkOdSTyci0ly2vjRjipQMxM5XftRNViLtXPuxXmDwI7hlb2TD
	meNhOtz93HcQu7RO3pWMTE+Dyz7c8MqwkdrWWXDklLEFFJznkgI5DyxKakM04w3D
	Ww7NYA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eqe71hs5v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 04:59:51 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2bf3636d6c0so79371215ad.2
        for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 21:59:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781153990; x=1781758790; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gxffwanfGPhkL4TX4Kfzzu4TaWJkNBos2KiB0FBhCVM=;
        b=etHaJy6l5K+uD9m0o5QIWyLOvHszPtXdxXO5wgB79uBIEbuxGuYAxXWq4gsbWj6L98
         kHX9vBvI+F7Hjp96XpgT8IdVW16wYBGEaqLbOfRNlNyFpPePrgncAPaNjVJCoOGd1Ror
         YO5hpwI9/FWQovUUzIdCQsXAtkKHc3YpIeSp/CxOvKhuRNE4zuy+IJrRrLJMCbOPsRlL
         BhKQUTdriZ+8yF4g+agKSuhImfEqyloATfSyh8vdwUHw6Ybh28oR/CM1B4Q0T2F5O9mp
         RdfVUBhFz4DoOXgqjAUS2rHE/UNL2DMsq2Fqm9RRYRSxQfXIZJRNAOkw1KT4jTeVpseK
         wJww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781153990; x=1781758790;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=gxffwanfGPhkL4TX4Kfzzu4TaWJkNBos2KiB0FBhCVM=;
        b=U+DlMjtcDrWBclqT7iIS/JIWbjUv0fSVsD1sCaWjGHSBNceVyJ++4cq5c8xP3YYwkC
         yVJpzuq8PX7ybgTl/YcLQYcnhtssdIqhQSCF5hALhpvXx+eb883YOuNvi9MLtoG2AM/a
         66MCRormItHy8uPnJ6buVH27Lz25GZdyZI6gDdppQcRrkuXuVw8KG41iTcB58blhmS9x
         sjU/TDSZXlXCUlm7cWfVIliEnTms4cYOlibwPuj0brP/X2t/7eZ58q0WDxz6DnuBx2Is
         gC+UqExE3Pxw8aOc+MmrnKi5aZlPDewijpE+DyHY/2CRUARKRT3CgO6OK+08VZZmxh+l
         ozeg==
X-Forwarded-Encrypted: i=1; AFNElJ//8VfKEzJDAowrQ5OKY9STkkiHHE3akHIMTK2yrpiRQpCj8KLSR7tPSQaWamn9pxYZpBDFDoWf8a2C@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9e4JP6yGjhcboA96O31N9gm0uXGy3FLH6f9L5Xnh2d/29XFHD
	tMPbLu6Nu2nGjVstRlDCiSQzOgi7MqLPI9K7DBVBK5MF3QUBcqRaVzyqtA1ID7Dr6R2kWU5adZi
	Z7kCGlEdU0mzNLyVnID1tKhJSuzRHakkMUHsz641Eo7LWYeL/0WRwpZ2NctgwLJjsWgh16s9p
X-Gm-Gg: Acq92OGpcFt6L+ro5MBdgPf2Tm7XyfUZy3jlB2uUv6TV0iYa29sIS4K02yXPsvBYlFo
	SWqg0zIxLgE2aV0JACYbk9jG32aXD1XUSvkMMQyJFP/SJ8Ji6C1/ZknddelENcckCCfXqEY9v8C
	0MJiM4AKpBBWu0ymtEkVK5LfvoB24uf1soV4VdGqmrAZN2TPwpLPUX0VnEEC6ECky58hkmEX9eC
	htl+vZHm1WjaHyeheJjTQ/4CejYB2SIy/leJua8STSNNC4LcqIQx3XEwJvb+ptfAjxUcemn1pdz
	CqVkXKrkw3uHC8vCnkhz5rY0AYDynOfCFwYCalz3tEa5qzsuwGMP/Ys0iO7R/pkCSa2MJbe3yKw
	Ix1vJIwl3DBwDCC+LDNFT2FZnhR/tCPzwjNtmZDhWNm55FjPnpGjhSSN3IqdOlILHtJQ=
X-Received: by 2002:a17:903:2310:b0:2bd:9b0f:5f2e with SMTP id d9443c01a7336-2c2f2c64ea6mr13681785ad.22.1781153990523;
        Wed, 10 Jun 2026 21:59:50 -0700 (PDT)
X-Received: by 2002:a17:903:2310:b0:2bd:9b0f:5f2e with SMTP id d9443c01a7336-2c2f2c64ea6mr13681435ad.22.1781153990106;
        Wed, 10 Jun 2026 21:59:50 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f8bc5asm276188335ad.27.2026.06.10.21.59.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 21:59:49 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Thu, 11 Jun 2026 10:28:50 +0530
Subject: [PATCH v2 14/37] arm64: dts: qcom: monaco: Fix PCIe wake GPIO
 polarity
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260611-wake-v2-14-2744251b1181@oss.qualcomm.com>
References: <20260611-wake-v2-0-2744251b1181@oss.qualcomm.com>
In-Reply-To: <20260611-wake-v2-0-2744251b1181@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        cros-qcom-dts-watchers@chromium.org,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Manivannan Sadhasivam <mani@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781153928; l=1812;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=YWQTnwwuDj6jKqmNIBBOM458HqBbqXiHVkCLAkWhTu4=;
 b=QcMYcPNer4wJPXKb5G8XP/7QwlIA6BrsZdIyhVDxDbUY7PrF0juJClpL7tMhpTWVpz3kcOuq8
 5lmIAj/MbHdAoiELR62pH7t6EEfGsI/lMlAvfdK61j5t0vzNbaKF2ch
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-ORIG-GUID: OqHqO4lNbGzyGSEutmY81ryZMWXVJJIS
X-Proofpoint-GUID: OqHqO4lNbGzyGSEutmY81ryZMWXVJJIS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDA0NiBTYWx0ZWRfX2/Hj6QCkzWZf
 7n7G3ZyNjQTTquPcrKrhawRABn1xPYPB+9WkYuIerwzMDS1W1YqABLDqEQRJs4XarIPbz5ywQ49
 CYmAFsh6f1BHuWiqjwmQLftbT1jjBvrwJHxYLK1Y23fPShIbHZEcTP0moixjrAtc/paNbbWdpH8
 P+0mQ8JfxyjbyQ1jY1DSwt0qXug3IJFeqkFpvwX2jgtlKmXykMfe3701X7iSKlVduq0jTMokdXM
 AYomsH+0I+YBhGKvsR081YJ6+JGj4kDFkoAoMoi4g6yNDBiPKEpzC0TjcAEW30kSn2PW+G0oxFB
 9AAgrmic8tGlRCRka5k+Ka67QfUtk3JAPx61e/KI1yGDbA/TrcZOGF0Ac1pGDZ+m1RIhF6GAxNy
 dtyyKCwUr9ZKy5QHVoTsURP0DZVwEW5jupJF/Ifprg+lf6D2P3J0MY92aqmOWA8mzm3oR762hPe
 niBQ5WNYVA72tzf4XAg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDA0NiBTYWx0ZWRfX4DPkVLqOxvPX
 n6y4aWXh55aGOQhjjNYlvxRo90Pa80AggYylRMKACOKD5+TNHUzGnS76SGQ29pFYRt5XasR48KV
 yl9+y8o28cZjdj1K5GGYM3Hju19CsYo=
X-Authority-Analysis: v=2.4 cv=Lf0MLDfi c=1 sm=1 tr=0 ts=6a2a40c7 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=TRJGHeO7bdl8qYu8Ap8A:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_01,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0 malwarescore=0
 suspectscore=0 phishscore=0 clxscore=1015 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606110046

The PCIe WAKE# signal is active-low as defined in the PCIe Base
Specification. Fix the wake-gpios polarity by using GPIO_ACTIVE_LOW
instead of GPIO_ACTIVE_HIGH.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
---
 arch/arm64/boot/dts/qcom/monaco-evk.dts   | 4 ++--
 arch/arm64/boot/dts/qcom/qcs8300-ride.dts | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/monaco-evk.dts b/arch/arm64/boot/dts/qcom/monaco-evk.dts
index 9d17ef7d2caf..b30fc7ecdf32 100644
--- a/arch/arm64/boot/dts/qcom/monaco-evk.dts
+++ b/arch/arm64/boot/dts/qcom/monaco-evk.dts
@@ -643,12 +643,12 @@ &pcie1_phy {
 
 &pcieport0 {
 	reset-gpios = <&tlmm 2 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 0 GPIO_ACTIVE_HIGH>;
+	wake-gpios = <&tlmm 0 GPIO_ACTIVE_LOW>;
 };
 
 &pcieport1 {
 	reset-gpios = <&tlmm 23 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 21 GPIO_ACTIVE_HIGH>;
+	wake-gpios = <&tlmm 21 GPIO_ACTIVE_LOW>;
 };
 
 &pmm8620au_0_gpios {
diff --git a/arch/arm64/boot/dts/qcom/qcs8300-ride.dts b/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
index e9a8553a8d82..f9891fbcca90 100644
--- a/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
+++ b/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
@@ -615,7 +615,7 @@ &pcie0 {
 
 &pcieport0 {
 	reset-gpios = <&tlmm 2 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 0 GPIO_ACTIVE_HIGH>;
+	wake-gpios = <&tlmm 0 GPIO_ACTIVE_LOW>;
 
 	wifi@0 {
 		compatible = "pci17cb,1103";
@@ -651,7 +651,7 @@ &pcie1 {
 
 &pcieport1 {
 	reset-gpios = <&tlmm 23 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 21 GPIO_ACTIVE_HIGH>;
+	wake-gpios = <&tlmm 21 GPIO_ACTIVE_LOW>;
 };
 
 &pcie1_phy {

-- 
2.34.1

