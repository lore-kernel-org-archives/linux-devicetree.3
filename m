Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63BA44AA1DE
	for <devicetree@vger.kernel.org>; Sat, 10 Oct 2026 16:01:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791648099; cv=none; b=UM3LK8yswPugoT3hUgtSxStQDnQOgtJKPnflhNTMW1oERGZ4REpJ3BqAWs/iL8nsr69ogXK0t45HlAcbAcafqYDP8nCWr8mTFics5d3QdFpr0YpT6vqwVT8+KmRlD2P3Hc8iCbwjwXhZ83s3xPz20Fobalzf0a7eBjMiQSaPejw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791648099; c=relaxed/simple;
	bh=pxHyg/jfZ7eJ6o8uVk7w4Q38gLsjYlwkLC67UQT1/wQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pq52dYDlxUHxsFMhjdXUZQvfF+Wcven+zeuYxwwgOrvi7gdRJC+fMhZ51Yhs7Xp+M02G21dsjpV2N2oBAwB5aBlRxCq+EOAmEMJtqJgQmHDohKa0m74aOauHXlsOYrZFpi4eztt6UZScsOfnYmoLQ02bL13T1B+NAPHfBhgFQqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=h8i/hsyI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=brWy0h+X; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="h8i/hsyI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="brWy0h+X"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69AFPQZ9640583
	for <devicetree@vger.kernel.org>; Sat, 10 Oct 2026 16:01:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hnv0qmK8/nEJAwt/Str/SSMG0YhjSM3cMdd5FG5Ong8=; b=h8i/hsyInNhm3QPh
	nh3+34tnMSsNLNX6z6DzVq28hObujikHmP1pUDbbXSt0C98tb5jdWUqawLo+gtqF
	b/zwoquChDDL9R8PeJLjuuZG0umPyJnAc+wCqQWvVXNmthbG9aWBiSF+02VtxS59
	SLvfkBMvjLjegTOl6ABVTNft+GcdDr/0AJKDT5OfWwm0E5RolXRhxMRzptDeeL9u
	aZeL7e716BKuvpR5B/furPqQh863mPFKENHjM0qmWWvpHexFXaOcb636gQtYFSQl
	35AOMFJw3YTJf9p0LlL5L0REBVg4QuD1UqH3SqlZ8VLjKHmmIVnAK/x9W2nYg7Ub
	F22+Yg==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h7cpghet3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 10 Oct 2026 16:01:36 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-34ef0362d95so1802095eec.1
        for <devicetree@vger.kernel.org>; Sat, 10 Oct 2026 09:01:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791648095; x=1792252895; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hnv0qmK8/nEJAwt/Str/SSMG0YhjSM3cMdd5FG5Ong8=;
        b=brWy0h+XT9Nla6JNaRxd14L02c9stJUXkMIk/l7NxJiD69BFK7Q4oXnCx6ftC/sCRH
         gsOXi3hrQsIfyKJL+MD4vhq41CObRv2MHqAXmmj/iVEhHEtALqKHRyVU51LvJw1iauso
         NKjL9bmG3pA/hcSfKuBaSUsWquTiYKQ5h+ldKdlR5rguHqUpOZXrlgZrws+ZIgHvsyJy
         tnqZfeFQgU2YCvMoV1wsLuRtWYFLrIzQVCC1Q3dPfjdVt1C95DOB2P1cgu5+V17Cndu9
         rh54bouK+0E74WGpBMjr17aZ8K5DoAqqYvYnQHQLJzV3PpJmIdvg7lo1SYkdDysS+Fat
         tt5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791648095; x=1792252895;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hnv0qmK8/nEJAwt/Str/SSMG0YhjSM3cMdd5FG5Ong8=;
        b=OuHcigHUQBXKJ+bSkq024/x1LUH43+dL84KnWPw+i+nBS2Qjwskp+69fGThrlmZjTl
         P0+oMGE1jNI6yPfhY8z/cvgstk3GA4DtPpafMU7EQBqUl6OA6z9+Ll1dSm3/uaAYDYbq
         SQDIZfVgZI7Q63UmL8P/EpqZ15bYLhfR/w42rfZ1IohonuJmG2D33AMZ3SU8bkVAtWyz
         unBVzcMHNr0640qEe/PVn5cEIbpsxaSsqtFPk66d61M0qbxgBExkAx6DIqA/WE1cXx7M
         MirIvjEytuG3M65RFjHRSJWZNvwytZHt5sHtx0KHJy09IQCtihnnjCW+uZ5OjeihajAi
         GfLQ==
X-Forwarded-Encrypted: i=1; AKwUvBx5m2zYPxhyfcw1FFgRRBPRWPlJjU22VsKBxQlnJrUfIf8nJAnhJfEMnwJV8NboynXkRt740p8tAmkg@vger.kernel.org
X-Gm-Message-State: AFq9FYIiX9GWZj6xy0BoCKFZDlNSu1zOvZaN6yzk7tsOm0tDHb48X/Zx
	AlK353/gQ8rtkHBB4CVJz6JO8IoOmy1xLahOvuOS3pEllvvZBYFDARS2F9Jsw1UftqXsfTVN2cB
	mLIaSbS0KP7lV6nEceoge8eW2CyRwvg3ixQHPGthd+5RDYNu2Ws/vVGEEV5HsCxCN
X-Gm-Gg: AYBFou3SKXRPA01Bvylp8Q+B0iwVyf6HGSAZabmGo0vx/V+zy8KymMwhuxP7QrMIc/X
	dOTIDAfE7ugp5G0FeMZM+uIqTg3w6qZHMDcPntjLsOee6etVGYcnstiHrd2AKyDz1KVNVKvVnQh
	dUWVw/lk/oitHaJPfmJkNCmWFzXdu7huUlkYyFqoIgXJ6OvHSss4y8B4GuTZYW0P2JF/mbF7BK7
	LGCkw1rKJ4aqweB84pOFdVTaXdRBcKD81Twg1n3hLdGCQ6lqRb5yX7+ww/Q1b4rT1fvMe6O2I1T
	iJcMxtN4Cml1p/YY5E+/dP4y4vHQZcFB7Q0CbukqreHWD95OZa3jzpZ/6p+EcYF9sTdViRtJeLY
	Km8ks/eXAyBF5gdH4TizEJKuDLM9gsrVKdhY7MvEl81HdScCMtlrC/b3FPzUDS2ffiJm28NfziW
	30GxMcgxv3VA==
X-Received: by 2002:a05:7023:a56:10b0:143:46a6:b01f with SMTP id a92af1059eb24-16a6203dcf1mr6420833c88.31.1791648095051;
        Sat, 10 Oct 2026 09:01:35 -0700 (PDT)
X-Received: by 2002:a05:7023:a56:10b0:143:46a6:b01f with SMTP id a92af1059eb24-16a6203dcf1mr6420791c88.31.1791648094402;
        Sat, 10 Oct 2026 09:01:34 -0700 (PDT)
Received: from hu-hangxian-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-169a31f6be0sm30786022c88.13.2026.10.10.09.01.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 09:01:34 -0700 (PDT)
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Date: Sat, 10 Oct 2026 09:01:17 -0700
Subject: [PATCH v20 12/13] arm64: dts: qcom: kaanapali: Add camera MCLK
 pinctrl
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261010-kaanapali-camss-v20-12-63e98ce9ac0c@oss.qualcomm.com>
References: <20261010-kaanapali-camss-v20-0-63e98ce9ac0c@oss.qualcomm.com>
In-Reply-To: <20261010-kaanapali-camss-v20-0-63e98ce9ac0c@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        jeyaprakash.soundrapandian@oss.qualcomm.com,
        Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.16.1-dev-17221
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEwMDA2MyBTYWx0ZWRfX20lvXIbKEB6b
 dZa6+m/SJP1FKu2atNwAKaElNe3FkU7H0xCFeg67869W1+YhdAFGd7Axx/RYzxYvWoa4vho+PIo
 9+yM6rFTh2A0aFiRGmcF4W/Lo4x66vw=
X-Authority-Analysis: v=2.4 cv=StoFe/O0 c=1 sm=1 tr=0 ts=6aca6160 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=4Dwyees-64n8yO_2jeYA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: OcznpxjmMSbiSVY0tloi5TLtMXciUlFO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEwMDA2MyBTYWx0ZWRfX+xKHYS7id14I
 apltPo5tnot7Hxs/Y85u8UmmE1xYEdqigd1kKtKkN5ElYYGhkYA/sjk/7R+NxEhhV7AvzPSZeb1
 bCVbQop+XnJaXjeuJmwwcwVhAYoUiZcXWEY87pmnNCHxx9PRM2s8ryX3XR8OVcKZE+ltMae9jX9
 JATLF92jUKP6D7Yngum39v5oCy/rAT4BYeWUfH9KMqs9ppF8P/elykFRQ67/IM+a3/p50iF4fT5
 XSfsihaJQtLqpeI9fHAxCsI81zgkmPR0iG+nx4nEBE6YTnx3dsJv2rRL+NVdAXoiAYMvJWAxxOq
 utWZEy0InggbcI8W/4ChsyPWwi5Kutc2NmLnbKUhKWYiyAXAuoxogisex7sGTr+IXls4Oay74/r
 PwW4tERHU6gYPFIk6vXCynGKO2lOev1cxaVXLG9N6FUdb3sB/U/7A839oO5Wiv8//nvbEFYpZ41
 KVjP92ugVU6TyRNZTCA==
X-Proofpoint-GUID: OcznpxjmMSbiSVY0tloi5TLtMXciUlFO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-10_03,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 spamscore=0 lowpriorityscore=0 adultscore=0
 phishscore=0 clxscore=1015 impostorscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610100063

Add TLMM pinctrl states for the camera master clock GPIOs on Kaanapali so
camera sensor nodes can select the proper MCLK pin functions when enabled.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kaanapali.dtsi | 56 +++++++++++++++++++++++++++++++++
 1 file changed, 56 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/kaanapali.dtsi b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
index 62f02bff0227..63fae1bbfe66 100644
--- a/arch/arm64/boot/dts/qcom/kaanapali.dtsi
+++ b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
@@ -4648,6 +4648,62 @@ tlmm: pinctrl@f100000 {
 			#interrupt-cells = <2>;
 			wakeup-parent = <&pdc>;
 
+			cam_mclk0_default: cam-mclk0-default-state {
+				pins = "gpio89";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam_mclk1_default: cam-mclk1-default-state {
+				pins = "gpio90";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam_mclk2_default: cam-mclk2-default-state {
+				pins = "gpio91";
+				function = "cam_asc_mclk2";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam_mclk3_default: cam-mclk3-default-state {
+				pins = "gpio92";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam_mclk4_default: cam-mclk4-default-state {
+				pins = "gpio93";
+				function = "cam_asc_mclk4";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam_mclk5_default: cam-mclk5-default-state {
+				pins = "gpio94";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam_mclk6_default: cam-mclk6-default-state {
+				pins = "gpio95";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam_mclk7_default: cam-mclk7-default-state {
+				pins = "gpio96";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
 			cci0_i2c0_default: cci0-i2c0-default-state {
 				scl-pins {
 					pins = "gpio110";

-- 
2.34.1

