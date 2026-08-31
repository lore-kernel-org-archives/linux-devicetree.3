Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42AC43E3D93
	for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 10:03:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788170599; cv=none; b=ZHpo4x42Llh03asDjgJlRrwaZIHoPfIxXsooGeFamedv6291r5q+6fKe4hHay2avbnXqQULDGqt9dRoWzak+DtIQgc/94ok23WgZMUlYrdn4URIp4+i+SpSZ+Uk6iggxD2cqb68zksGDotMp35kZJAakU+2JNhWfelYb1ULISSk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788170599; c=relaxed/simple;
	bh=E3Bl7IOJLWC2ncwLiiHDAe5gFUZwRKnRj9M4ZT8jOpM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Po66q2Sk5wEOkWK1ZAijFvTUCceNdeFpcxWIBCcag4j3VLidVL+BOzTb7Dz8Efn67RolQLic7ftyV8NDKpVKDn4qNtII4qHnK/5gNsOumzi4tSeJFV2jH0GY8XT0S7ZHTmA1kgb+P1+wkaSwwcVPBAT5rkhi6cbB5nk43t+COsE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fOerb1an; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WOxfTU4t; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fOerb1an";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WOxfTU4t"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67V9In1h2516540
	for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 10:03:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1QWom6wqkGmwAYXK96+Qp7vhh3Al0ftle0VXl6TTN2M=; b=fOerb1and/kf85Cx
	GTjt61gvSOwW8cAkisoDYx8FA/uOWPhGQcC+70l/fmvR1HYC9xSOE0EzbCiqWtki
	BZyli4EKdO3JxjI9BMmYb2mp8ZUsdj52Htk7uiZjSG6WgpPO/BqYQEyyk6P6aWU5
	VdXl8mRQPfTjCQiNRAJxmdGRtqHoSrJyojnkMEfBEbnDgJrrnfshEkk/IaGEpQvB
	+zqG/a0CEgu+qzzaveqgY5IxblEFI00JyQCFAG9gxtkCjAgzmEFzBwpAjmPWqvlF
	cO/1yPsAno2i57ZqndnoSyeodDeoPBKHW8PFba+tiwciEoR5y6ArMGmBPsg4EglR
	aflE6Q==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gd6vcr608-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 10:03:17 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-784eaf6cdb7so913726137.3
        for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 03:03:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788170596; x=1788775396; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1QWom6wqkGmwAYXK96+Qp7vhh3Al0ftle0VXl6TTN2M=;
        b=WOxfTU4tvj/jjmqH7gR1jaEmcK2BEByyrdCuCO7Yh9LSjyTdGgDOL8a21akEC2Ta8P
         PUQge+FKA86AmoEFmztqhc6M3QBcwu8ntThaqfMpA6vipxe04BddPuuPSJ+iqss99iAS
         Ge/IqOd0gD7IWRGXm+M3Z/FNZ5yNDFLs35mIcvHwmvRBiPRyA65JnSUSZz1FIZfaox1n
         KFQYz8H7xsQByIOhrbRbcBxWnLIzVfpEXMhK+LKm20SCW9DR2r3QdlfK6xgbftCpJwD9
         I2mh8Gk3foAvzK77sV8jNmoTWByfIVbGV1G614g6KvRVusSw+lvtqfNuyisA5Oa7TNob
         +ClQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788170596; x=1788775396;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1QWom6wqkGmwAYXK96+Qp7vhh3Al0ftle0VXl6TTN2M=;
        b=JHltA1MeLC9Lf/xmDQR9xij38R4hxlbM03UkL+6DqHfgPRm4jG2sy17QaIbTqyvG4M
         S4Nz9DOgjskDaKCKjtk1X26uZoVEch5AbCm4dHkKzO0flobJIFnQLLI8UIHlaUHxa34v
         UNinKkVsajzq/wRjaDoC328J2k70+qZFVgXTo4bjquzMYwAaUubwWYWGwvGWq5FUe3j8
         YH/R0EkO6eRaZlDUIYELt8B2R075i1qi9OTvv8c3waN+kbE9TvQB/6LXl/FZULwufblh
         KGZYo6Y3vsA2zx8CqS7dyVpJqIATF7jjlPNf1Fy8NnN9UrR8Ku4qMoE3zcqGY6FlD8ru
         LybA==
X-Forwarded-Encrypted: i=1; AHgh+RqYvFAEz2oOGJmTojJjR6FD0Fm43OwxHoaKf9WAqHfWSWjVFMNqAIUDxpGZAR4siZdkE923h4VzvusL@vger.kernel.org
X-Gm-Message-State: AFuF++lgJg2ChoTOZO90iOPRLJh1ZaTKqdjtwJ1Ls0RAT4cOQ2pr4BsL
	MaGbs/ejjojBcTx/gjNNaVQc3vjRH5oGWEgbsj+Qv2Azsk5Q5f1qTlavWx+6izve0qcg3C7ocp6
	9nmx+Rrj2hxPrcA75lXBDMtFwmSf9hQaRhe3+Rgxby/pJytu//eoSlzk3WyO5Ltyo
X-Gm-Gg: AR+sD10J25wdP2qZIio2kkz6lkdUqIumVpnIZ08JQCEjyDZWfchjg1dJJE7BTz30/zp
	1sz6YsfyHqjJGlsaITDMEp6SuN7T29Ntbb2T7xftAg5Ur3R4ajb13xzRb71uuRJrqtz+0XiPUjA
	bu50HvQc5OjBFJPpFFdNq+zmEQwZv8ueit5DbhTU2AQTGKaPQuJd9pVgMl5AmVxhVW6u5CG6dbO
	MNOZEBgikJ4S/vXuG4JvWe4kbG5Flai5tiICFGeh8HrveVFOKBkg3F2DRFeGyvjR1XaFVqlqpWQ
	0rr3j+4f0LZrh1v5j3CMrKyuTDy0k8Pmcy4u7CYzyxd7D4RT/+VaOgdaNKx8dHrsr5actJ1Jqqv
	XOlgOpg==
X-Received: by 2002:a05:6102:2907:b0:782:de7b:eead with SMTP id ada2fe7eead31-785962b3b4fmr7225464137.1.1788170596231;
        Mon, 31 Aug 2026 03:03:16 -0700 (PDT)
X-Received: by 2002:a05:6102:2907:b0:782:de7b:eead with SMTP id ada2fe7eead31-785962b3b4fmr7225429137.1.1788170595657;
        Mon, 31 Aug 2026 03:03:15 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.13])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b9281772bsm131001555e9.1.2026.08.31.03.03.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 03:03:14 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Mon, 31 Aug 2026 12:54:41 +0300
Subject: [PATCH 1/9] arm64: dts: qcom: x1-crd: Mark the EC reset gpio as
 reserved
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260831-dts-qcom-hamoa-reserve-ec-reset-gpio-v1-1-5b202de8c74f@oss.qualcomm.com>
References: <20260831-dts-qcom-hamoa-reserve-ec-reset-gpio-v1-0-5b202de8c74f@oss.qualcomm.com>
In-Reply-To: <20260831-dts-qcom-hamoa-reserve-ec-reset-gpio-v1-0-5b202de8c74f@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Marc Zyngier <maz@kernel.org>,
        Aleksandrs Vinarskis <alex.vinarskis@gmail.com>,
        Konstantin Shabanov <mail@etehtsea.me>,
        Srinivas Kandagatla <srini@kernel.org>,
        Georg Gottleuber <ggo@tuxedocomputers.com>,
        Ettore Chimenti <ettore.chimenti@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Konrad Dybcio <quic_kdybcio@quicinc.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=855;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=E3Bl7IOJLWC2ncwLiiHDAe5gFUZwRKnRj9M4ZT8jOpM=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqlVAAZIyy7ye6ciOZ+4uJhM3RuNFexVLbi607h
 1ZU3xcKXXOJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCapVQAAAKCRAbX0TJAJUV
 Vv8VD/9Z5GEo+B9eOGEodRBXir0ytlbuQJSg2gAPlEqbVp7+UthBwuBcwyJsRNQ7wQnwyAow0Bf
 pg0EUHsouEoJ/4wG1KN5kuwRbtLhtidpHAi8mjcUtzeSwVpKoHBBLWpppFwLqrPd5iaE/bB79wi
 PO00TrmIqAobR5kBGFVgBhp+5KAwvxim2mRcfR27C59yB/O7dmbjhCTKyqDXgmcRv+6Og1h5YgL
 qb72j0UY9jIw4GjPBSf+38+f0+FBj8m//qLDTo7q5x6+3/PIiDDUfA/S48XHXWUR3PdPSffk0g3
 oSVMmxkZcgQUUXLibbQ8ZOo7RusmQAgIfGW+njIWiu2BhNBfBkwDP3jws00lgw1xTbilND/uD+i
 E2lpIvxAaXaeTe3kA05ZCePuQTbO15HVe2gFbkpnEyzyRQ9EA4+paqabXpWaseathTPN3NchEY9
 UAfhWEko8xNyyiAqp0oHmmUUfVcMccLz22hPoyro4r5oWSYMW7zLQia2PYzwHhuCxhzr0H9tLma
 D5ri41f35pWU/A58duC9ANHqHUoTz7y31JcXWMthZROaresG9IUdNbvLT0zLNiDVsFFAjvDzqJR
 o4QQ3cZyCglG0aZjJPhkPASCMDDpCtUCscCpcJLOjUlTApb+6Gc+OH+nhEqoX9eNkxOo9qNYH7Q
 qTP/6EijT4sGBoA==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDA4NiBTYWx0ZWRfX/3ax749bNMDn
 OuhC8XWBycelECk4XX7Z/hjfdS3N+9y+4rtcEWeD9A3jaC0cXzcGs0NvEhcMNCZH/WFEe/bTeEQ
 m/bBhPIHhxtXjgiPiqCM8U9fSd8lgoHUBmki2wre5UkPGhDkVwlSAsF/LNDPCuPlzhjVhBlt4dk
 5DE1xF3IHs3s7tgPpvr4o1KUH72S61+Ty73YJ/XTFhpR8oNBWXB4aJmQX3PMcjSvNpyvyQLbz27
 QLYX6cK4fa5HDh+AbZtgpDBiRXzkst8LxaQyOi3wtzhzCrSMF/b2FClrECvFro1XQqTdOKe3a++
 LAu3bIrYxxHEnncXvlLGyNczUsPaY1jFCc7WmEKEI5A+DTe0lpKrK9XVG7O6iz+IGRx5dZBUuFu
 ZKRrAvuzdZHZGmuudtW8OrWoh2XXWD0p8HPkk1VdZeB2zgl3AM92uqAEsJK7sQO8P6X8wd1plid
 6n13lWgW9Bs0aqi/Rbw==
X-Proofpoint-GUID: m18lljESizhGr04Ak4px-WLX-d-M8qau
X-Proofpoint-ORIG-GUID: m18lljESizhGr04Ak4px-WLX-d-M8qau
X-Authority-Analysis: v=2.4 cv=Eo7iaycA c=1 sm=1 tr=0 ts=6a955165 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=clBUptZa5v5FR042Ey+sjA==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=nR7Le_ho8Ysjy6FeGUUA:9 a=QEXdDO2ut3YA:10
 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMxMDA4NiBTYWx0ZWRfX+8n35yBM/gDy
 23IwsRSeQ/K3jOZhVN3WstSIpbmlkwMj+LJCyiAFfUI641Zc1Mc3xJWymFFIP9lF0A836SvgJFa
 /Bvkp3GYv7+iW3f9qHLUEbzCgI7eOEo=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-31_03,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 malwarescore=0 spamscore=0 adultscore=0
 suspectscore=0 phishscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608310086

GPIO 65 from TLMM is used by the Embedded Controller as its reset line.
Reserve it to prevent Linux from requesting or reconfiguring it.

Fixes: bd50b1f5b6f3 ("arm64: dts: qcom: x1e80100: Add Compute Reference Device")
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/x1-crd.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/x1-crd.dtsi b/arch/arm64/boot/dts/qcom/x1-crd.dtsi
index 60db83b8985f..d1bed84725e8 100644
--- a/arch/arm64/boot/dts/qcom/x1-crd.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1-crd.dtsi
@@ -1531,6 +1531,7 @@ right_tweeter: speaker@0,1 {
 &tlmm {
 	gpio-reserved-ranges = <34 2>, /* Unused */
 			       <44 4>, /* SPI (TPM) */
+			       <65 1>, /* EC reset */
 			       <238 1>; /* UFS Reset */
 
 	ec_int_n_default: ec-int-n-state {

-- 
2.54.0

