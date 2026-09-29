Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 245C251122E
	for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 13:10:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790687408; cv=none; b=g3zKBabxoUpP2jMXPgiVyaB1SdO340WIMmS/FeEASSuaD1DQQDPNSL+TvyjRU2M4Ka9yox9U3z13ekBVr0mrekNisgQCDtGH9L2GInLN0tTQIv6Ca+JR2zp33C1BOJ9rERtTSZx4iq9BGXcJXXMs6WxltS2WGG4llOdnIoNSFJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790687408; c=relaxed/simple;
	bh=9HxEUtXiFoTX4SHdOnc/9dLz9j48pEMhLZUBvtdAKbw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TgBXIekNwvEoGQ/su7uqY55yjxPA6bLhb23qDME99Myoa1mCK7MdOFaITip1AM7V3WznPUG+w9+OvpwTgHDxSpV6xTrC593+hvHtaBwboYVd2SVEX0+nCDi68518nrqMAa1C0P3McRRK1WLzD0FODSXV3xt/w5yNOMbwox66kPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IZWIUxrM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=U8nxgG3d; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IZWIUxrM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="U8nxgG3d"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68TCvsRV3300547
	for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 13:10:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QN6s1/Bps0mw1e5rLu6Bfb3VEeJotKzT6mLwiXsGK4o=; b=IZWIUxrM4xnsa87O
	QrFMCZONDSsjLZCzOUiyFY+vcgcvBoWOHtYZJwynmVXJdFQV0LssWfz9OLcP/Vys
	8ewrm4a1tQy6rnWUYij2VovS0tEISAoApWmkCoNoKeeSXsZK5p921bHmdmvLNxFj
	Q3tmvueZJmAXBCUDla/nc6VkX8zuY63RsbDf+/+ne+zGJ22NFu641TXF8f9z6n8/
	wleZZeFZo/levRVu5VDHL8/KRwu+k3oAgn8y+SN8knO/A7r66pafymopgxsP032N
	tf2h50TPkESvQ2Xm/dszbf1hNus8W+82h5DzVU8F5eItZb6epvr7VPa7SfwuGRc3
	nK0XZQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0dsx028c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 13:10:06 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-9175cbd3beaso37974636d6.0
        for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 06:10:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790687405; x=1791292205; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QN6s1/Bps0mw1e5rLu6Bfb3VEeJotKzT6mLwiXsGK4o=;
        b=U8nxgG3d9sOlpOm5trOuPcqzo9gg6GxSoRuyvO6XPp6ApF0XxjGxohKX7GEEWXYzRG
         2B94+tJLg7s5cbKhI18up7fVnUMdnLlHt6Q7+v3Ai/f1PH5z+YEiHEU35w1Oij6pukro
         jUPNkMU2K4dS9uxt0shGspuZU+UAYKku1nGrcaPhc/FFSdooP2+C7QURQ1A1KXw3LQP1
         DXVfgeJ4XcqoD/oEsI7sxDmLZl444nu/rBoHCltiwckx5Ns21zT1cFwKhMMo2ocTcw4C
         CrgritdRQUpbAUowqQGzuF1OOC00019MTE9ojvvBv+PBbbbZuQmCzCD4t/mvqkR3qA55
         IjYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790687405; x=1791292205;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QN6s1/Bps0mw1e5rLu6Bfb3VEeJotKzT6mLwiXsGK4o=;
        b=JV6eCpPHl/aUoQLGpq3alEJKC7Oh5kxFoTul52U+vDhEneiX7EEcdBxx1EF4HAEhiw
         jY0zWYyvMRZtwznosPFHPtX5pU4bWy3Gv+MkcHJDQs6sjC0xdw6Jg1bdidElgHnAdYs7
         kSrsK2R+/voaUQI9GORMv8rLUXP0XzEyjiiC8wLC2C7v+zezmIkFLsVnkLo36skL2wIU
         ESH79+cjDYWYTO8JWCQDOXePwnKxIKp1utuxCo34/WHpWRswJ2o/DEhy1kvz/OPCYLGR
         c/M5Hx0lkGaqEw78iVK0yjmTpoz6a68osc7f88CeaGByZOMTljBJNxUU3Heda1J1nNJa
         qzLA==
X-Forwarded-Encrypted: i=1; AKwUvBwNeowQqy6x7TNTryLRA1WovN7mJAl1mri35RYiZ6LiGGxQxst2sWmEL4/D3MbBsxRzFIccbgUYiaqB@vger.kernel.org
X-Gm-Message-State: AFuF++meOZLzFWcAcfWs7BpaukB1/YGM+234B2v/C/nxAm1LcJ9cAMpe
	SJO+xIW/vNZW4K4HNMAWMqsg6F9OYnLH0ougfND18HSOclpq94LbMnN6FonNsbeSE4iZNRgM4XK
	A5CqePkMlzpkCsTt7WvXlNHrJG7l5CEJIK1AqMOQFplkV/K+R2QSSFmsUmeuc6NsX
X-Gm-Gg: AYBFou1FvImn5dhAj5RwR1ZpEyslCJFA0YHtCdKnmexRk4QqgShSK5v7h0QNkIY7YAr
	PCJTQjB9XOeNNDYiMBOn/OIWjHQAxmduzDDmwsl1uxGBDAOanUhb1Pw7i9xbmrFXjU/7JvwPI30
	RWLD8k3xFenaBN/wvJJsJ7UyQ8/9bEnSXwmmBMAuLOO52mX7K6OpaF/+zWteTnCe7O3OkLE7q/b
	24i9l8Bia8gJeV2XJ/ifjDuooWKQnZMjtVFKKGDBD5cEq9oWOQtmp5vr6v2vmA0F1+OympDOoMM
	v6CQY0I8qNQHeYVo2OOvoWWAKSpkpZpTsQeSHOoOQEHiAI0tuPaNOTj+gHe0yJ/MmFcXbd+n4SH
	jqQ7pVQ1upcOLdkX+VKPn5lZZLLMtadoiiHc=
X-Received: by 2002:a05:6214:ccf:b0:913:fa79:99c3 with SMTP id 6a1803df08f44-9142f94d216mr261680626d6.43.1790687405289;
        Tue, 29 Sep 2026 06:10:05 -0700 (PDT)
X-Received: by 2002:a05:6214:ccf:b0:913:fa79:99c3 with SMTP id 6a1803df08f44-9142f94d216mr261679986d6.43.1790687404649;
        Tue, 29 Sep 2026 06:10:04 -0700 (PDT)
Received: from hu-manafm-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9178d013e8bsm10225326d6.0.2026.09.29.06.09.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 06:10:04 -0700 (PDT)
From: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
Date: Tue, 29 Sep 2026 18:39:35 +0530
Subject: [PATCH v3 03/12] arm64: dts: qcom: hamoa-pmic: Enable BCL sensor
 node
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260929-qcom-bcl-hwmon-v3-3-f5ca00889cf7@oss.qualcomm.com>
References: <20260929-qcom-bcl-hwmon-v3-0-f5ca00889cf7@oss.qualcomm.com>
In-Reply-To: <20260929-qcom-bcl-hwmon-v3-0-f5ca00889cf7@oss.qualcomm.com>
To: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-hwmon@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        mfd@lists.linux.dev, Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790687377; l=1673;
 i=manaf.pallikunhi@oss.qualcomm.com; s=20260206; h=from:subject:message-id;
 bh=9HxEUtXiFoTX4SHdOnc/9dLz9j48pEMhLZUBvtdAKbw=;
 b=/vuXxbLlqSAzDejgYnMcuPPH1hXmQ8UXDiYuQ2CgBfgDbCNwjv/dPe+PwPtxF6/U4BN9UwvpI
 WZq/rzboEA1D4vTxchbBlzEkQESYRNsqN/UWKIjeLl29hbOAGNnBncN
X-Developer-Key: i=manaf.pallikunhi@oss.qualcomm.com; a=ed25519;
 pk=oZ3x9jh+FDyPwxHmCbyzEMQHMzKqrH6hUbbL7dEBe2g=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDA1MiBTYWx0ZWRfX+Ya9j++wZ6n+
 TFSYXQyf/P/JWUqP5Qck2PbokMvucwV6rRHPD5Kwf4k3WjGpjU0W8vKd3DnZvgRiXtXWUd/uTqt
 nyrABCngOi717LHitzS7k4OlP6NTOLGSAy26O9TnFcd0W548hoZ3cKIfSR7C7yHVLOxDKVGSdfC
 jQ6nNMhi1i52MpGOMqdqGuwXe7yk6CwXEQ+t9+83V0ZswmRK4A6efe/qKoAy83rzFNzPkeVYw30
 anaJKdj2FpubMXQJaDekHps34k/0j1ksVFlXnXr7r4b4g8/9Zy5G5y8s8FJIZSRcbOP6TrBet8K
 Fdts4decGPWmtdYu5RgnSgBzl4+KP8Gfa7yK0v0wwLRZEHSrP/7YNpGPkUoe5EH4aJSbz0Y1Bg6
 w0MPW6dr2h6BHnvy9mG70CvqEKGp6dy76DdphHLJFU2xQSPckhJzgQ2XwVIvJo3fVnv+A/7whqv
 7+nKiWAnTJfcOva6LLA==
X-Proofpoint-ORIG-GUID: 2AxpakD56wWO3xCWD4QeQ2fQvf0Jj18t
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDA1MiBTYWx0ZWRfX949ZxeE4Slcb
 bLKSHXqE9m7h/igrpDIrnJtCRyosA5rPnrAI2gBo4FKO2OJKHRf0w5oAPnwJ9DpBNbm3w+B99ye
 w3uBUuWNXx4naxNemM9c6yMpDYR5z18=
X-Proofpoint-GUID: 2AxpakD56wWO3xCWD4QeQ2fQvf0Jj18t
X-Authority-Analysis: v=2.4 cv=DqvDa2/+ c=1 sm=1 tr=0 ts=6abbb8ae cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=pei3ZxCQ2QdDqwo0ZtEA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 phishscore=0 adultscore=0 malwarescore=0
 suspectscore=0 lowpriorityscore=0 impostorscore=0 clxscore=1015
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609290052

Add Battery Current Limiting (BCL) hardware monitor node for
hamoa-pmic. The BCL monitors battery voltage and current, providing
hardware interrupts when configurable thresholds are violated.

Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/hamoa-pmics.dtsi | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/hamoa-pmics.dtsi b/arch/arm64/boot/dts/qcom/hamoa-pmics.dtsi
index 7fad4a9b92fa..6b17d568188e 100644
--- a/arch/arm64/boot/dts/qcom/hamoa-pmics.dtsi
+++ b/arch/arm64/boot/dts/qcom/hamoa-pmics.dtsi
@@ -426,6 +426,17 @@ pm8550_temp_alarm: temp-alarm@a00 {
 			io-channel-names = "thermal";
 		};
 
+		sensor@4700 {
+			compatible = "qcom,pm8550-bcl";
+			reg = <0x4700>;
+			interrupts = <0x1 0x47 0x0 IRQ_TYPE_EDGE_RISING>,
+				     <0x1 0x47 0x1 IRQ_TYPE_EDGE_RISING>,
+				     <0x1 0x47 0x2 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "max-min",
+					  "critical",
+					  "emergency";
+		};
+
 		pm8550_gpios: gpio@8800 {
 			compatible = "qcom,pm8550-gpio", "qcom,spmi-gpio";
 			reg = <0x8800>;
@@ -674,6 +685,17 @@ smb2360_0: pmic@7 {
 
 		status = "disabled";
 
+		sensor@4700 {
+			compatible = "qcom,smb2360-bcl";
+			reg = <0x4700>;
+			interrupts = <0x7 0x47 0x0 IRQ_TYPE_EDGE_RISING>,
+				     <0x7 0x47 0x1 IRQ_TYPE_EDGE_RISING>,
+				     <0x7 0x47 0x2 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "max-min",
+					  "critical",
+					  "emergency";
+		};
+
 		smb2360_0_eusb2_repeater: phy@fd00 {
 			compatible = "qcom,smb2360-eusb2-repeater";
 			reg = <0xfd00>;

-- 
2.43.0

