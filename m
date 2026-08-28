Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2DD03AE71E
	for <devicetree@vger.kernel.org>; Fri, 28 Aug 2026 03:50:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787889061; cv=none; b=V/DdiMXUR1ypbh9TsxmbejuhdxAE7i+/+IMQRUio5oXCK+Mkr938T7obbkp2iKtSUf9YHubH1z0pMth4oi8Bhclyc0cOcGXqgj2fkcL9B8YWOz6Dh1c47IgO+vBpEkQ97Ml1kJY+XP9k8MULIzaLgzB25mDDBpMgEf8I/Vp4MQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787889061; c=relaxed/simple;
	bh=taHT/FWrTTmTNXum4aFu4vc3zEZd97waKqjHUDl8gfk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qNjAzbXTWXjMRrzF4ZBIO35udcfazef9MAnJRNBDF+cMJb80+AJ9qmbGEZckyKyUo58HqfFhH5XaOE05TMAUV6xT7pZnLRC4Lreng7GrRwaTtuOSqgY7mwzBSsmNVv+hw/AA9rfJR7qGCOL5/NRJI2zuFMlsZXDIu4qtAo58ctw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HfXbXjLB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=W9+AF2+J; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HfXbXjLB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="W9+AF2+J"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67S3K2rp1572410
	for <devicetree@vger.kernel.org>; Fri, 28 Aug 2026 03:50:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=euO68b8p5f2
	lwR2HBSoTd9oe/4Nd/VdBWR8tOJjtlZg=; b=HfXbXjLBQshQXz+sWpgbSt5CBy+
	nWvpdQt2vf6TqXkMgRKydXcK+lsJpRfD/77ydiR9RpFY6bnw/mWNdcGFuxdtM/zn
	70J2Ld1MNsQXUGh8Mk4DMA3OPRWJbbSzNEsa5YsvcUtl38pizj9VJUeutB+YHcj/
	/IQJlVIdf/PNlaSj19H0dxrbkc8bJoo8kZEljZhgwkypA+KI++Wzk+HiCjke2GWR
	LvS7MHiktn5sjRgDcKFERJ0iYDefY02cDPlPuirYf+4OgF3hpopIHh+6YJDG5dp3
	Gmr7yMrO+jX7cxfsiw5ee/GiKvek+pmRPJIO1PhadpqDaSYz6cvd2W+MZXg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gak563wue-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 28 Aug 2026 03:50:55 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2cec4226c70so6976365ad.1
        for <devicetree@vger.kernel.org>; Thu, 27 Aug 2026 20:50:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787889054; x=1788493854; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=euO68b8p5f2lwR2HBSoTd9oe/4Nd/VdBWR8tOJjtlZg=;
        b=W9+AF2+JFcNRqsqG391aZwjjtq8nPJ8dFIGEXFAlL4ZtAhGmH4ehnyCIiPvaLFr+fY
         mckMzr91Di94eNJUzYI32O5SfRK7vSNJhMuVzyq1YTnjD3lTyVhOrozv6HpBcBGoB3ZU
         /0fG++i8/4xG1BW0gqX0JgKjZmj/gr4RyRaEDjfs/ThY3oxBmRXlrpQoBS2MQ6e3P+zO
         hqX28nnz3COA2j5+fbdaLVMD8ZKov5oX71V/ZX5OPcvpbbFuwLM50KbtDzjAjks2QnWJ
         ozQ4x2WHa4xmpikHgQgW9yyREaSqDtK9siN56e6rbIVDzS4kYnCZum3nj6FPZ2Rrx4Jm
         AkjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787889054; x=1788493854;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=euO68b8p5f2lwR2HBSoTd9oe/4Nd/VdBWR8tOJjtlZg=;
        b=sF6sA9mJTUTyhUx7U4duY84PbI/qBxKsgFNMI24Duiar0LAI6xvm1wiSrI7ie1xOh+
         wFPgH1Wxfz+CEW9F/9ApEI3jreg0JflfLdaki57zHE60Jdzf5C793nWP+TN/MPRMCWm2
         2C13b1aT+kGcVwhsx6NetqQcWs13xB5cyngxwWGCDsQB7faTZvNbFm/Gi8LQLkYKl5Bf
         7/7ltA57rX4EC7tmN+KSRltOb5+aXETVMJXRJgcI8FRY1mpT8e1RhuOvUx8lUwhkT5au
         30YSuUub4xW+xILnw5TSPgnMZGFgROIuay46hoEy2xukU0DwtRjlOeFUGSVYjubHQPWY
         VGOA==
X-Forwarded-Encrypted: i=1; AHgh+Ro7vaClWvtWAbSul+HDLzrVBCzAT13I6+LjLNequuvhC+XbG2l4MMpumfXEX3tA3BVkVKBarvC49VyH@vger.kernel.org
X-Gm-Message-State: AFuF++kLXp3UxR6IlfKhn/kD1r6uCbjnv9V5DXdlmAQJnUyBzhJX0ofa
	HT4Xv7LPuc/6zx1/+jUasWgWK/v2HEj4V3cWim4PBkEQkkBsV1NJqqVx18qdiYMcrncRnOtsTPZ
	DAtqOhShRL4yHDKWqaAZc03ViTpPscSkrTE4Su1SlIRJSn6WtHl4pU3yTrKO/4XVQ
X-Gm-Gg: AR+sD10vrV2tMgysay+Lzp36eXCqBYjO3nOXyXrWHBwdJ10Y0P6Nwhxrays4GG7rz3B
	uqWEprNVjr3MgvSVyUM2uTvq2VHpupemuBzeA5I1ZcCNIGPEVy2cHXcr1dTbhZ+Z28c662AdwBS
	sQphOngizqIAf1lApzPF5MC+B0xtTUKJWalUBI2sllJaW1dx3Vce+eA3/MKqDECom0EVq2ZWZh4
	qxKp4W+BwK55DNq2uBLz0tiAcKx3g0L0QEXmUOdaKtH0WAGPaG8gd2qA2U4VzppbHD0UAruJLaw
	TZJ2Jx8yfAcdEMyPjWgsNE0qqZXxj7m0FEV4iw/+pi2R8eW0KxU+jezRAB0brOqSuDdV7c9EF8z
	bQf2+SCiQiAJOyd61+szfeX0sjpXy+YakgVahMOS9PgKHHsG1igYUoLd8pOLC
X-Received: by 2002:a17:903:40cf:b0:2cc:864b:539 with SMTP id d9443c01a7336-2d74dc6e884mr74007775ad.6.1787889054473;
        Thu, 27 Aug 2026 20:50:54 -0700 (PDT)
X-Received: by 2002:a17:903:40cf:b0:2cc:864b:539 with SMTP id d9443c01a7336-2d74dc6e884mr74006905ad.6.1787889053979;
        Thu, 27 Aug 2026 20:50:53 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3286f995e60sm1133357eec.22.2026.08.27.20.50.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 20:50:53 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        Yadu M G <yadu.mg@oss.qualcomm.com>,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH v13 4/6] dt-bindings: arm: qcom: Document Nord reference boards
Date: Fri, 28 Aug 2026 11:49:56 +0800
Message-ID: <20260828034958.3165-5-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260828034958.3165-1-shengchao.guo@oss.qualcomm.com>
References: <20260828034958.3165-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI4MDAyOSBTYWx0ZWRfX9Yhse3MECiS/
 s7lZWiTRtISl10vhKej5vGmdSePi9UggarlXrycUrgN5Lxh3JJtuPgzOS22sKCAmHGVJDYnSnGp
 0YKehNkuWLe2pjA7jPfooTBDe2H3EcI=
X-Proofpoint-ORIG-GUID: T3xlK4p79D0X36awrJnjXDqirQxeTu8d
X-Proofpoint-GUID: T3xlK4p79D0X36awrJnjXDqirQxeTu8d
X-Authority-Analysis: v=2.4 cv=G+Ms1dk5 c=1 sm=1 tr=0 ts=6a91059f cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=3mLb7b5QgQ_nS9KBAK4A:9 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI4MDAyOSBTYWx0ZWRfX2G90F/RT3v6F
 EmOHLI2woGy338PagYZAeCN1Vw2DzpaICmyvvvRHsBkvXavyDUIcx06VyTL8LwQzOWaC7SiXc/G
 6GanMY81Sk1SYcTGzohJl5VmDnVg2wTasBkUnethg1Cbw+/1Aes3Y3TSx7xLdYj3EjQOpIBMY75
 tuAHEA9FjaX/WqA4gWoWxBdC7z4TN7HBUY0s2MGeQzDnAuJO2u4k1ZdrZpQaLchDvJo5qv7Xv++
 PicdxH2MhzrDGvQP6B9gmfGnSP5hMcD2A9Dp55yymFBW4QwWS/S/uWUsRa4epMiNympGWY80R5Z
 Aq6TOgDrQRK3pQDk8ohr6UXfqWJ3BIwLzQlYfYopTGYX4KHlBBl1iz4QXeMuC7WAp92YFcd0SzP
 ARLLtB6gna+QSWjbmw+116n3Dwc6kRImmX+R8S3hkcDynyPOV3TWVvH9SD0NP1mSilg8Yn9hjFC
 JaTaqNg1zZ4oneeq2Cw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-28_01,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 clxscore=1015 bulkscore=0
 phishscore=0 spamscore=0 impostorscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608280029

Nord is a new generation of SoC series from Qualcomm which includes
SA8797P (for Automotive) and Dragonwing IQ10 (for IOT/Robotics).
Document SA8797P Ride and IQ10 Robotics Reference Design (RRD) boards.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index ff8a35df7862..198314ddaa84 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -402,6 +402,12 @@ properties:
               - xiaomi,sagit
           - const: qcom,msm8998
 
+      - items:
+          - enum:
+              - qcom,iq10-rrd
+              - qcom,sa8797p-ride
+          - const: qcom,nord
+
       - description: Qualcomm Technologies, Inc. Robotics RB1
         items:
           - enum:
-- 
2.43.0

