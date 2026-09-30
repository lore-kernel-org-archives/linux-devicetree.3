Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C1A24DE71D
	for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 12:46:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790772384; cv=none; b=V8Lv4auJLmlChV7aoT6Kp4Jhr6lPzD/6xJf9Tfl8+lLNBWIwlinFrLJ7dyrT0eZ4cfhLcLP5DU3qbFiToZVaXch6gtmep4lu8H9rlyLfybiwCdhkmMKTgXUFopt9dYmrz0i742/U2lntT77gX4X6gia6Ux+Oy7En2O/xdTo0X70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790772384; c=relaxed/simple;
	bh=dLk7fWdCBteALwvoZRaHU9oeqXBvnyQuhJNHQIKcy48=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eBwdKlK/kkncGkjw+dTdhP6o3WjnjalDNS3aOJ5JmfMNbHM3+o5fSFyZrDVkOcWgDyDKz6mEVQn8NrtWK1e/JsDS4iF3pBaLOS1d++aZtBxb/qdKk1ZInUBfcSXnbyTtWbDF99XltRhGDfLwCCrngWpDr2L8kv4gYrDSVw7Ulrc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HqfTX7sv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UUBsTJIe; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HqfTX7sv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UUBsTJIe"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68UB7aZW319174
	for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 12:46:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=4c/LfuCxFPo
	u3Dn4zlqRs4je55yj9d9+Fv6fC44qfJs=; b=HqfTX7svJQrBKUBq2i4H1KAizP7
	+vtBPJtmvY8oJ8PdCWTMhhQW8XO7ruatv0+gQqFpdn5q/1v6dmJUsZI4vpOVj6Qd
	2OIQM3Zb2dlXY/cRAtNOCOfzUEOvfQt4oivT7Xilbn38uOx8c/y+pylWIUIz0Ulm
	MT1jEOuxdCDIPX+IKhmsgGXeyQJ5wx8+615UtuFO8HsHneVqZJjvGiX/NUxgRcJQ
	oA7PRj9UdaUZnD7xtT/j4x+SfbITyWFcNFpUs5D5q+XcTvYJnMqJbZGxWL7H0fPb
	sm4ORB83gOqU4NVEWh+vr7rsD8ONvdtuykmxJnr9WmievdWs3ZbIFeWr2wQ==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0mfabqpb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 12:46:21 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-988c61af159so160726241.3
        for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 05:46:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790772380; x=1791377180; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4c/LfuCxFPou3Dn4zlqRs4je55yj9d9+Fv6fC44qfJs=;
        b=UUBsTJIe4kStHVDl01KDjm8hDQ5/9ibWHUTkcSSzysILZw8KJw9LcMB/HU89IoeJwo
         ulyFQRlwCcCON3KUk37uHXi3eWzCiar/8DT3f7cVLiTphG9/83kNuRac1mHXRDUfjvJp
         0yRfvK07gitGzfFJzvnP775xxmn+LFh9avH2QKxvHbISTcQLffTNKxiZfJDAYzHCNU6P
         D1acSeSSPL7NUBPv4M2pcbjVdjyjUYV4HcaRx8oMgaCXznkj2u2wodnaNDBq800ydtA3
         c04icwfmX6ZcJUlgNSzIkgXlaudqZudBdi/YhSBOjzvo+W9CE4zrNfILGwUwmWuxYIjn
         BLHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790772380; x=1791377180;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4c/LfuCxFPou3Dn4zlqRs4je55yj9d9+Fv6fC44qfJs=;
        b=ksOvNtYTms94ctC30RfLIZ7SdTVRpRSIReDe5HhVXAy5YrhNBp15+yW+KOoVXU5vfA
         7vNb9DcmRH/+X9Zgk2/NDCGG1CMqRAFz8LUxcuNasMY3uu+FjMO6mqHmLaX9YFX1jlZD
         itpeiuBbEym2W0cTDU3Li5Rejyq26907tVWEyUXLJSSqOvcN3I6ub7QOGGaKqrlufeI5
         AnpdRN1+7earos+1eIcdVDzag0W0dxc4GeRMb191YmdWhhaQB/BJHOMrIf1x4p36mnfL
         4vsq7m1nbPCJAklgyUrTfsxq1zH0+XgXvFE0UBihdNR/9XIZ1gVq+S0J+nO7mziP/NDb
         iwNw==
X-Forwarded-Encrypted: i=1; AKwUvBxAS5OvKrNH1RWuAjvJ5fUHl4VHfH3GQDxIv7TaQB/JI2fr1nRKzynsXk145yA/GqfJdjYHRgFS4pDr@vger.kernel.org
X-Gm-Message-State: AFq9FYL3v6vHA9i61pkp41rIdoQMLgfxOI4iQHAD6nDUvQQMFx3KsNmZ
	hPa0AYrfnMTP7gPEE3oH9cuHk0R+8j61ywVHloxcje8GiX9g6C+uhMNXbhMo6B3R1/wCV7umFx8
	0+OTVRRPrDyEACNcie2EPiRn9fYtocBQSVVA4XURRu4RxLAorwFQQB90jYKM3jfm8
X-Gm-Gg: AYBFou3LU8+gvfyGtplYwN1wPdLVbuXfJUlCL5Xo2AIYpKd/dOtggeiKhSQUa4PUsy5
	Fc6VChT/aeNw1vB3dLFbdvc0o57hfzRPKZA0XK5OxmI5Py+z3bLL3VxA0QkiCbGzi5WpPzxdU3E
	5Z3kTMvrdrGbL5zVX6LHknJAAV5VN5410INWBETl4D66t72rAwXdQ8RmqDccvOINcGbF3iLry+8
	djzrFrT4YGk83iLKPElvrAxHwCTqVoEl11g2SAzAo6XscYY54nJosRVW9O4fX48vnjDSD8Gs9ji
	Q6trmNkftlhS7LkQCI2SUX9eG1Amdp1nPgfu5n6A9UoMvF08qFfPJRUWkCnswWv0m3JHdAhSXpN
	InZJNqUYgZ3QK
X-Received: by 2002:a67:e7c4:0:b0:7b7:3acf:bd3a with SMTP id ada2fe7eead31-7be61e96e8bmr188594137.4.1790772379677;
        Wed, 30 Sep 2026 05:46:19 -0700 (PDT)
X-Received: by 2002:a67:e7c4:0:b0:7b7:3acf:bd3a with SMTP id ada2fe7eead31-7be61e96e8bmr188588137.4.1790772379200;
        Wed, 30 Sep 2026 05:46:19 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a01b1e7a46sm32549195e9.0.2026.09.30.05.46.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 05:46:18 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: Alexey Klimov <alexey.klimov@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        mfd@lists.linux.dev, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v4 1/4] dt-bindings: mfd: qcom,spmi-pmic: add compatibles for pm4125-codec
Date: Wed, 30 Sep 2026 13:46:03 +0100
Message-ID: <20260930124607.1109167-2-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260930124607.1109167-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20260930124607.1109167-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDA1MCBTYWx0ZWRfXycd3bzdNfMfL
 mm/WacEflsNcB9wCF1kqSfqOKYnKiWLbG/nSoYg0qgp2w3xZMZOtE1MhRvR5aKKWhQ6P3rUkQ1H
 WUogcWPNBw798xcAK81n0fOrWZNfcayy5tryYrQXz+Xlf0Ska2e0G113Jl/vzDOviIrjVoQqV6I
 YsouZCREmDyIyJb2505LWt6q11X7Y3Q2OvZiEP8fr4s4Xy+eqMZiMwntI1XHsOynnIWA7AM4Q2H
 v3C6LW3bnRrl2dLJYBXKT4qwot3LvgLAgE+/42ij/qtfyQt7WSo17MAL7ydk3O3fGYZzFu9+9f4
 CM9CiPiY8PuJs7GiyzhUo4TkzbRxrG4Zb3G7iL9ry+oHIgtfXibyaiNKWNnQnURRSu8YWULHq7M
 gdcajaYR+rvBUIwbjbYeu0GO8nmG4R2+ZvKGHRh839oSe8iN7pAENiZX31wVdITYnZXguNRma28
 7vJ0mnnTzkTu665Og1g==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDA1MCBTYWx0ZWRfX7Spe8CZdbKAs
 a00PsZ5G657VnDDMp+ntnRQXtZRBRs2IbKHe/zWcWkBUS0ZE5phXbb5ufMZ3xbPTPG/trIHxXZJ
 boyury5idPSUzwBzM8jV2fHAvWHqxmQ=
X-Authority-Analysis: v=2.4 cv=RZEFmFtv c=1 sm=1 tr=0 ts=6abd049d cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=1S9TnuZ4X9D0nYt2MHYA:9 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-GUID: MOqrd4DC-zCXHeIzifRZbInAs0ob_K_c
X-Proofpoint-ORIG-GUID: MOqrd4DC-zCXHeIzifRZbInAs0ob_K_c
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-30_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 lowpriorityscore=0 phishscore=0
 priorityscore=1501 suspectscore=0 bulkscore=0 malwarescore=0 clxscore=1015
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609300050

Qualcomm Agatti SoC has PM4125 PMIC, which includes audio codec.
Audio codec has TX and RX soundwire slave devices to connect to on-chip
soundwire master.

Add missing qcom,pm4125-codec compatible to pattern of audio-codec node
properties in mfd qcom,spmi-pmic schema to complete the audio codec
support.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml b/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
index f6534e9e9912..7a889d888383 100644
--- a/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
+++ b/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
@@ -148,7 +148,9 @@ patternProperties:
 
   "^audio-codec@[0-9a-f]+$":
     type: object
-    $ref: /schemas/sound/qcom,pm8916-wcd-analog-codec.yaml#
+    oneOf:
+      - $ref: /schemas/sound/qcom,pm4125-codec.yaml#
+      - $ref: /schemas/sound/qcom,pm8916-wcd-analog-codec.yaml#
 
   "^battery@[0-9a-f]+$":
     type: object
-- 
2.53.0

