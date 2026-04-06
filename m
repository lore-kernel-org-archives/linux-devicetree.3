Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FF4022538F
	for <devicetree@vger.kernel.org>; Mon,  6 Apr 2026 06:49:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775458186; cv=none; b=DPvMOwsQlbboBfeYoOZFoi6ccigtfKK+D2OZ9U3RP8vfOqwCuRWZY5Mxh8ZdD+kKFjl/VVvpRQxlmxaqzk7FCcGRFbwbBfYJkCNSfhXMEEJVRSPr1cKMhymsvUT0BCcAgdVW3mTqVJVKf9iKBjYSq0ofFta17yLzTgq2I05bVd4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775458186; c=relaxed/simple;
	bh=KjMbg5skHUDd3NSMfn4Hj+lp9KuS8sG7nmI4B+is1Lc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lDZ6ooLkSPW6ato6cu5/9TgoQox7FPuQze0XZu9B12oTyNM8hEX1ubMsjBy1LavOJmFfLLf+WlHOo21Q9b/WVv3nwZgEdwKAmWEad25f/s3vPM3eOs/Pz3xgwhH7NO+7Te3oMOSn6atAKjkn8yA8fpeIqQQUz2gV5C2X21Cad+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oCTsoJLr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DMQ/wo1Y; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oCTsoJLr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DMQ/wo1Y"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6360oD4f1348440
	for <devicetree@vger.kernel.org>; Mon, 6 Apr 2026 06:49:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=OWmO4BZDYVEyv7D8e8RQja7dWu2xhviNpnT
	+52Eg1E4=; b=oCTsoJLrB/5XG9cwuHQDlV0dY/tWal+wM/yzOkw9RLHp4u652Yw
	8cpYwhkrJxeoqGxvYD0DXgp2ZZqeS1M0AJCzfJrY+dJbrWMCHEMtP+nWYOZz4T6Y
	Zg8KKH8c/8FvNp26iKm+zroXaP5B3swhTMurAw/Cres3Tyz2CErzqpbYsw3cozd3
	3Dkx/fIEqONKAoc0qEAi115PyvvcLcsZjt8WiDmZ18/GK6oymO89GGVAQK8ZnKrr
	G+q/hK5Q7ZdN+U/eGAcYYV0ElVoi3eLCElCRAiiQFjl9XO4FAGmfT+VZ0INguqhL
	slHSoD0JdPZCAIuqaEHbS6oQaCusp0QNliQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4darbfmftg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 06 Apr 2026 06:49:44 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50d8c192b3fso29968091cf.1
        for <devicetree@vger.kernel.org>; Sun, 05 Apr 2026 23:49:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775458183; x=1776062983; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OWmO4BZDYVEyv7D8e8RQja7dWu2xhviNpnT+52Eg1E4=;
        b=DMQ/wo1Y7nXBc+/5312OUWvLUv28J1DGud1HBW9kyLLIvOmuJSOomCelIVBFOrChd9
         VDnalyp6QxrI4HTd99hlh4p1BU4UO5hje9O3OQsa51M1l+P+M8s+64lccIbVPudxQy0f
         uELnJivqMJIndAI2r0VFTCzP5spUn6E75X8eIMVjfH6rZcUEAx95t9gXhOsJLab1wrPV
         QcCYQaXqYM2XpB63wbzSJCUQ+9IcLHP/8D07eqc893S4tRDDog0JcE4UWf3cjKPyywjP
         8DROQeGGS/rDnaQWn8GoJ5vriZBKQDI9L5lj9jKOQsIh78UEfTMlrfK9szxYitehQ/Gm
         cSXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775458183; x=1776062983;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OWmO4BZDYVEyv7D8e8RQja7dWu2xhviNpnT+52Eg1E4=;
        b=SWTyGk7fI9LUiJ2PpJaBaJeFt3VESP/ciO7r/2OVVwR8Yr915V30UXg1D0p+vtMK1h
         M6ULN107UJL8gdtQsYzQIU0xM8Azc2HW22L1CHizZk2GFwon7UVEMP5dpLJkS19gJCS0
         guKEc24YscYL3L9XApKoJUonUSVZ1ifa04bGUuxVO1SaTDvTZjqj8YTuJSuB6GngBOuz
         FKDu9bbv39jPI1JYt/dpJS7Yp4wSzYf8grQ6TOEhyYVN+nTNiX6n494/LkQRtYzO8TwJ
         G+MQP5o0Au2l08iCMlqcUI5zGtgPCkpI86eKIQOG+7dsYbw9XZV3IKWSkI7/QW+gbZ9m
         yrmg==
X-Forwarded-Encrypted: i=1; AJvYcCUEDGX0UGAr2HAIgjLh5O5rKzXJaYpwkJUUIF6yaz0eaQsb/kCAoxViunzv963Q6RWbvwm2ECz10gDn@vger.kernel.org
X-Gm-Message-State: AOJu0YyYOaMh9odIFTf1qnWf/+InBS1R29vLfy3PBtLb84F5aeCuqbVv
	k/LNNdqq1byl5Mhm2uJQ2/ZSUmvFIi7JFqiUH1GimOYb16UCQr4oJ0cF73HY4fJonZeh2SKw/gZ
	IPwfcCVR8T/6RjevTyxD8gRiwb3WuIvgG+q3/wtWyV9Gl9U8JUXkvatOrg09bT7muR20bjK4q
X-Gm-Gg: AeBDies6kzkk7x3MKu5agSn1GK4vv4qAFGNbYifaMhpYhX1pdNrNXfzrUO8xmBO6Gjy
	tGMIVzRY2kgjFsLoJIdCSk/C/tZ2OGHzpV4jvR8giPoR5bK41X3qcc+YD7mMQbBpk45p/8zqap3
	HbaSE4UUzk9ez7BBQLZMvpagCp6nQ+mFeWGJ2Gtv0U7OVHWFaLAmScKKWpaMoXDraWl+JaJYYCa
	MlZ8xB9k145gZKw03YDSABdQ1MzydLrcF5VdZQ0hysIINnAAjLL+hLfZeXRx1Ge/dAW4zR0MWbU
	zThBYCgn98yNrp90oi9nQ66pPvVuExRP9xwt/Ieu0uc3GWIXZM8NFbhVgIcPyy5CyZfwkClqR2D
	v2W2j8pLoJV09cntVHNUoa5W+tS7BG+j6SAx1
X-Received: by 2002:a05:622a:835c:b0:509:5bd5:6be3 with SMTP id d75a77b69052e-50d62b1f5cdmr148099961cf.57.1775458182942;
        Sun, 05 Apr 2026 23:49:42 -0700 (PDT)
X-Received: by 2002:a05:622a:835c:b0:509:5bd5:6be3 with SMTP id d75a77b69052e-50d62b1f5cdmr148099861cf.57.1775458182469;
        Sun, 05 Apr 2026 23:49:42 -0700 (PDT)
Received: from quoll ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d1e4d2738sm38990714f8f.24.2026.04.05.23.49.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Apr 2026 23:49:41 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Thierry Reding <thierry.reding@kernel.org>,
        Jonathan Hunter <jonathanh@nvidia.com>, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 1/3] arm64: tegra: Correct Tegra194 p2972 interrupt flags
Date: Mon,  6 Apr 2026 08:49:36 +0200
Message-ID: <20260406064935.27968-4-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1361; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=KjMbg5skHUDd3NSMfn4Hj+lp9KuS8sG7nmI4B+is1Lc=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBp01d/cgIfyXQl9ryx2rVsOlVTtna0m6Dt9V2i2
 KP8itVEbrGJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCadNXfwAKCRDBN2bmhouD
 19EOD/wKTvkYgcn3CO8IwkXaJfk0BsmQAV57q+bjnkRb/lI5ud/tPNfxV6qgZwfb9qCt253xxEt
 6ivM9MBaSVUDbyg1Dun/4lVVykh2jvISuHluQPhIrbfuHCH/HpFT3KRgr2jIUPBM4R5355vDnhy
 njG8XODheP4PcvH8w5jU+l8LhyA7PM3SnLUUpsqkmLK0RAlH7eoD4T+CJfm6P4NW2bCe5mC+aAl
 AElpE4zdHV2YSKRC+t5FuAa50AOmLQCq3V6G/xnoHhJMI9/Fx2j4jzh76npfKqAOxxJl+fxhIm/
 H0IT/jg/Hr0OWZVSzdevuoowDDSGtUGMsYWyPpfBWHSSTaDIKHqyjOdZ0bh1DcJKEdUiP3RI+Tu
 fAvpuMuPZxrHuF1sXvENlEAcnEfbz2YRTg3w3jTV2M6C5rW8bnMnOBe71MTIc25CkwD2Xp+Zg03
 tDH38cl3nMUTBrDXGLnvudXkYFXqxC7InY/nMR3hh9UpDsVt9bRrNttmoO3UfmMv/wVSHBYmcye
 H8o2xVmdW0BSzAX8VOap2ECVvu6S0VgBrR+dfTeO1aC8cB4m8HIeRX7CKz6wrZcxQ+PQZumyEvj
 VguxxATO9+4ynDFr2MLt29Lth9SMht0olZy9ybZz6YabM47X8OdOH80QQhubPwqMTXHQrbuFkSL pI7+nn9aiVCRACg==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA2MDA2MSBTYWx0ZWRfX+8323jq1Eniz
 hk5vKlqZ/h42k35Ghre5G9UHuUj5kugERfrv5LO7lyukhBS/82Wvj3OYevru5+CayDvqjDhE2c3
 q0FbnF5T7yQwv1557gQgjZW7rNXb7oyiWlhRgTlRlYpm+wT7mbV0EFQgWH94ifp80TZVEzxxc9y
 yHjreJY58ZTbdeBbMnczHb/r/kY1+F2+8+iRcDRWh1N9FaEWZV+fr4U5rYsbjGf2zC7UEaw2LHm
 TRcPs9vptDGNHOX8z9LnOGy4ozw1QhGUc+iPqJCvS2Ys0b6g3OS4EFgwy4SIPI3kQTdFOS7ASiq
 EA1AnXj5pJobDAREk0NuR9ff4K5KXOPEZa7jPJtTGIC0eajZUQxuHyYMi9iam9h0pr70iKzH8K0
 aafXzJrg3Lrge3en0JjuhNd3IoKQ5Jh6qjxPM1x0edglSsO3IsbMzc9IyrZnJleAcmYvid6QrGq
 mIfsIz5QHN9CP5vljQg==
X-Proofpoint-ORIG-GUID: lvY9x-MWzj23cMrzY7w88cUHjGb76eDr
X-Proofpoint-GUID: lvY9x-MWzj23cMrzY7w88cUHjGb76eDr
X-Authority-Analysis: v=2.4 cv=I6Zohdgg c=1 sm=1 tr=0 ts=69d35788 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=0oGBXvcucFHjQTZxw3UA:9 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-06_02,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 suspectscore=0 spamscore=0 priorityscore=1501
 malwarescore=0 bulkscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604060061

GPIO_ACTIVE_x flags are not correct in the context of interrupt flags.
These are simple defines so they could be used in DTS but they will not
have the same meaning:
1. GPIO_ACTIVE_HIGH = 0 => IRQ_TYPE_NONE
2. GPIO_ACTIVE_LOW  = 1 => IRQ_TYPE_EDGE_RISING

Realtek RT5658 codec driver requests interrupt on both edges, so correct
the interrupt flags, assuming the author of the code wanted the similar
logical behavior behind the name "ACTIVE_xxx", this is:

  ACTIVE_HIGH  => IRQ_TYPE_EDGE_RISING

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm64/boot/dts/nvidia/tegra194-p2972-0000.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/nvidia/tegra194-p2972-0000.dts b/arch/arm64/boot/dts/nvidia/tegra194-p2972-0000.dts
index ea6f397a2792..5462200f1176 100644
--- a/arch/arm64/boot/dts/nvidia/tegra194-p2972-0000.dts
+++ b/arch/arm64/boot/dts/nvidia/tegra194-p2972-0000.dts
@@ -2170,7 +2170,7 @@ rt5658: audio-codec@1a {
 				compatible = "realtek,rt5658";
 				reg = <0x1a>;
 				interrupt-parent = <&gpio>;
-				interrupts = <TEGRA194_MAIN_GPIO(S, 5) GPIO_ACTIVE_HIGH>;
+				interrupts = <TEGRA194_MAIN_GPIO(S, 5) IRQ_TYPE_EDGE_RISING>;
 				clocks = <&bpmp TEGRA194_CLK_AUD_MCLK>;
 				clock-names = "mclk";
 				realtek,jd-src = <2>;
-- 
2.51.0

