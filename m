Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 796583ACEF3
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 10:48:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779187699; cv=none; b=RD+qCp5YnAH4kgE1MMo5SQH0pFTQXUy4JjFdZaCcpXJuB8IfcQNW1eEunFg9U+6mLdKawGkuj3ZTiBGiEl8gkhuDfIcliAJGWwsG7qzF7hqZODXAB+VIN+i5NnvSTBFpS7GvJgtyk33VFDgSIwMQxAeDE+91c++ZneqIs6XMkDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779187699; c=relaxed/simple;
	bh=xYRU6BVEc7MoqdSBzkA9NAynnrccJmvjoEv9mNGS6kY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Gt0OtkgCZp2ew0pj2XHnSI09jy00xXHB0om3BgJsiFpY8XhAIkxUo1hIsZNIr433DkD3f+D1OyY5AsELxgdiz7rO90WvVgujVTeHSdURjAJOnQ30OAvKjdHlXcukfM4q5vtoVTRTds1QNSEqtpcPItkzFHU2KBn+0SBBfuH2Awk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NEEwQRvB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZFu8UJ3A; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NEEwQRvB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZFu8UJ3A"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64J6glv51737101
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 10:48:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	35REuCbpcVViy035ouXJ2Yq1Y9m+z5h75tFEcnvtUk8=; b=NEEwQRvBN2Ysw8Am
	Hy2tNhFLRxp5YjEiY34NSRWEI2s4X5TsKW9Qumq1lfE4lk3nAY3JWoALhT3aqOZm
	4G25y1YMCX+CIhA2ct995gYSBChWjhnpZBtvEYGau3F+bnYwnR/LGp+JhFFNnUCe
	DJH599fjuxgkEvQtvCjdK49C/54ZKfqiTteCmwImL7iGZxwHzARFbVYK8gmw9oXv
	wg5PEpx9mjDLDjS7OEjJDs2aMsW8sE16pnekseSRCikg1U7IZiskxVqsoeSFO3QO
	DvmaCuKcTzpfseVIbg1yzC4ZK5A6N2xT6++hD3p63Jk8syUYLurQUExf20TaVGfX
	MQNthg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e8ju911a9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 10:48:17 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50edf01172bso106474481cf.2
        for <devicetree@vger.kernel.org>; Tue, 19 May 2026 03:48:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779187697; x=1779792497; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=35REuCbpcVViy035ouXJ2Yq1Y9m+z5h75tFEcnvtUk8=;
        b=ZFu8UJ3AqI9tcVDWEZZdSFdb83fsPr2Q70MqxvAD9sFi5C/MdRlLDDmfDrZSk+xWW2
         WDI9Boo668SQ31qPvK72fP+og3MqevPrv56jTpt7QBbIbUhm5KWmuhp7Hn4H0zk/pSJ9
         v8KfhL/4M8BeTX5IYGGwBFsgv2KdKMwe3Pcraw0GmKI9M5v20LiCWIb7oJWw36OvT69L
         myRbW3x7t9Camkc4vHkgj0D8j9U2QEJFSPufr5Z44VAKRRI1YEgBZekf+SjrTvJJwDch
         P3iLaKOMq6w3OHr3FPs22h01FXaAvSSqPu3LJyqo9GDi0JWgNr720Q1ngDvO9eBsVzP+
         HlPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779187697; x=1779792497;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=35REuCbpcVViy035ouXJ2Yq1Y9m+z5h75tFEcnvtUk8=;
        b=b+Yx3JfOf0jSC0LTrwKwDrKMR5JpTml2Yb7S7HFS5HIOTc9+81/BmYTK7sAFm4NRgH
         5MHbCJbzHkDmlY6ZoG1V9yPNS1lCpGr/eE6tpR1z+7R8pB/HJZ69lxmT8DgwMbkVR73T
         bE+ZV5ZbC5T2+pQbstlCfVrz46WibA3UspdVd8RQLaG7vvrepdqh9uXhhncbFW1K08WP
         68g6/kD5mkRsp7/UzZFawe3Wlp3SDLfTSGp6cgUpy8BsUz+r9RwjqlxNaFMg6U7OnrO1
         Qu39sdu3BwOCYr90j+oYFUkmfpC1eZwOuI1neN5ULhRYNj00f8EXFunW07XKm5yFZ3UU
         9eiA==
X-Forwarded-Encrypted: i=1; AFNElJ/XNWxgtHHcozqYOLErIrzl9d0uDt19mlNPektbkVqMVCrSHWTZdSD05a9Iz3dC84C2ux5uDSjUfAK7@vger.kernel.org
X-Gm-Message-State: AOJu0YxS8bnpKC7YaDWMBCi6cHmjkRARGAZAvZWGKpDgk3TsRBEO0oEe
	L80oZlZOHu0eW6vw3dCSleE+JVs81pU8SMXo7BKdRg0M+Ary4GfLQ9f8jdu6RqTFB9JYAezxU6a
	0SzVKQXZQ/Cy445IyCGPnN2m/Y7EN7AAMCyjIIFTqom58yYZY7sfSlb9HwtmoEu9o
X-Gm-Gg: Acq92OEizm8ElnWkEkIg1IT+R0e+5fVowTAMFxhHtA1i+1vmOmhHPXDCdu7WzHrHhvQ
	vlBr/pbanYZhvVILMyPOf3h7gyT3m5B/0sP4LBvuxi9eT0NTmZHKb2XP5fhJfVBN4Tb8/WnUjm+
	YoI7RvRniILZnAgjWY9eQHnOLoZu0yTLCGlF0eMGJRh0hZFdRIXfx6NAYB0nZnUL9wkxf1+9NFO
	rEY2xU25zA/PuAOL+MdZjInoH7Phd/dxh3hI7LpQqsfRZA7YAXTpsuH7N0QqcO1SMciHnuP2m/P
	im3j+7P5D1/NmsWOWnSNIANkuWzIkSaKoLwB3TWjHtDiM6oc7e/5Zx1Wj35NlimA5VI2pTNtGCy
	B1K2fMcWV3vm9Br4CJHLDN8P65BXrmbh9JUSWYljELR4QaslqWkMdDnldvVSRDlMQmeLgFO8klv
	4Ui2LqBRgCxyBBVLCsCC85OChjBFpwmrcTpsTFfJPedtu+wQ==
X-Received: by 2002:a05:622a:996:b0:50f:de06:45e2 with SMTP id d75a77b69052e-5165a0d077bmr241432561cf.31.1779187696678;
        Tue, 19 May 2026 03:48:16 -0700 (PDT)
X-Received: by 2002:a05:622a:996:b0:50f:de06:45e2 with SMTP id d75a77b69052e-5165a0d077bmr241432281cf.31.1779187696221;
        Tue, 19 May 2026 03:48:16 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a90f11a59dsm4031413e87.25.2026.05.19.03.48.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 03:48:15 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 19 May 2026 13:48:07 +0300
Subject: [PATCH 5/6] arm64: dts: qcom: pm8150b: move vdd-vbus-supply to
 connector nodes
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260519-fix-tcpm-vbus-v1-5-14754695282d@oss.qualcomm.com>
References: <20260519-fix-tcpm-vbus-v1-0-14754695282d@oss.qualcomm.com>
In-Reply-To: <20260519-fix-tcpm-vbus-v1-0-14754695282d@oss.qualcomm.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2428;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=xYRU6BVEc7MoqdSBzkA9NAynnrccJmvjoEv9mNGS6kY=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqDD/mkFspQoJLegLkYv9FlQQPdVRasWCokg8YT
 +MaN2NW3eiJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCagw/5gAKCRCLPIo+Aiko
 1YToB/9/CbyLaoTjhEspKcExQXJN+jofoDLLW/BYnAhuBV0H2L0YvkcSrSr2Df8+JziYHE+FLKi
 P1uqzK1gEGYjwMdiju47i0yToZhZktwT6HHNE7yQ62Q7H0qxmM8ryjI6ebAhLieWj19zA5/R5MF
 fK/rwhYqoqEcIT02LRNzd31T1MXYZTQBrV0lZ+1/t00rfSUBClU09uaDq3yYi48sFk65u9ukYUx
 iWfy4ao05sveH6iYHFvsNx4YjNOeiLHrI/ozp5vkAjEOeWYwkHdlPJ0lo3qMCODwMEu0EYoZ3Jl
 7Ydtzhlkf5XCkwpfSAKGPfe2F6C/eccp4wB4vnXUHpTlyoFB
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: c1NjrAwpqsI6_-3Dj1KzuaCk0Kr6C7yj
X-Authority-Analysis: v=2.4 cv=eeUNubEH c=1 sm=1 tr=0 ts=6a0c3ff1 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=W78v0XRATXHzZ1sILyoA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE5MDEwNiBTYWx0ZWRfXxwtRAzgZ+1jg
 dnru+dMYumcavGWfsA99v+UNQ7AJ/5iZ+xryWMYakB+OFcJ3YMt23rnPJSlBfywSjUxCCmrQ4HR
 BubHBsnxUN09BJxK2rhbmoSrTtR/D9Zjbzhsbl3vSoa7ncsGqRvfY+mleppEJgoCVu5s/TpLVtD
 YI8gWzlTKDAvQDhjkkbALHrCxK+RLjjjQKwW1LuHhUNcoodUwZXlHI9Dj6NJ7WDaCqZwxY3VxZw
 +OaX2/uxs6Q3OiRU8bytSXnV05nV75OpbucTsu3Ft7BSE/KV7mtnF7b+c2+DtmIhQBtBQU3DI7y
 CI0KBcOr5cPiqEZn+o26EPReaY1A66XIdHoUIFFUxlyyiYUUNYU+ioYD0VVjjy8dSVQ/aTqBgsF
 F0g6nxATcUvXnnonr1U9oHZ5dvDA4RNW2dbTryivBbDuXjXY2p6zB+pgbGrsSa+WE7Whl3OcJfz
 7VK5b7Fxyww3IhXIR8w==
X-Proofpoint-ORIG-GUID: c1NjrAwpqsI6_-3Dj1KzuaCk0Kr6C7yj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-19_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 adultscore=0 priorityscore=1501 clxscore=1015
 impostorscore=0 phishscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605190106

Instead of specifying the VBUS supply as powering on the Type-C block in
the PMIC, follow the standard schema and use vbus-supply property of the
usb-c connector itself.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/pm8150b.dtsi                    | 1 -
 arch/arm64/boot/dts/qcom/qrb5165-rb5.dts                 | 2 ++
 arch/arm64/boot/dts/qcom/sm8150-hdk.dts                  | 2 ++
 arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-common.dtsi | 2 ++
 4 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/pm8150b.dtsi b/arch/arm64/boot/dts/qcom/pm8150b.dtsi
index 3f7b0b6a1d10..b83be4b6cb1c 100644
--- a/arch/arm64/boot/dts/qcom/pm8150b.dtsi
+++ b/arch/arm64/boot/dts/qcom/pm8150b.dtsi
@@ -95,7 +95,6 @@ pm8150b_typec: typec@1500 {
 					  "msg-tx-discarded",
 					  "msg-rx-discarded",
 					  "fr-swap";
-			vdd-vbus-supply = <&pm8150b_vbus>;
 		};
 
 		pm8150b_temp: temp-alarm@2400 {
diff --git a/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts b/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
index 54da0d759a67..690b484352ed 100644
--- a/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
+++ b/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
@@ -1499,6 +1499,8 @@ connector {
 		data-role = "dual";
 		self-powered;
 
+		vbus-supply = <&pm8150b_vbus>;
+
 		source-pdos = <PDO_FIXED(5000, 3000,
 					 PDO_FIXED_DUAL_ROLE |
 					 PDO_FIXED_USB_COMM |
diff --git a/arch/arm64/boot/dts/qcom/sm8150-hdk.dts b/arch/arm64/boot/dts/qcom/sm8150-hdk.dts
index 6ae6e07c37df..8fb04ce72f91 100644
--- a/arch/arm64/boot/dts/qcom/sm8150-hdk.dts
+++ b/arch/arm64/boot/dts/qcom/sm8150-hdk.dts
@@ -572,6 +572,8 @@ connector {
 		data-role = "dual";
 		self-powered;
 
+		vbus-supply = <&pm8150b_vbus>;
+
 		source-pdos = <PDO_FIXED(5000, 3000,
 					 PDO_FIXED_DUAL_ROLE |
 					 PDO_FIXED_USB_COMM |
diff --git a/arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-common.dtsi b/arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-common.dtsi
index c017399297b9..51b57c697a75 100644
--- a/arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-common.dtsi
@@ -725,6 +725,8 @@ connector {
 		data-role = "dual";
 		self-powered;
 
+		vbus-supply = <&pm8150b_vbus>;
+
 		source-pdos = <PDO_FIXED(5000, 3000,
 					 PDO_FIXED_DUAL_ROLE |
 					 PDO_FIXED_USB_COMM |

-- 
2.47.3

