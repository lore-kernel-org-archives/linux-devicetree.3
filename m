Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1A705437D6
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 12:39:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790080771; cv=none; b=BS21hXC9dluyuNo6At373ctjZDk6JDnUuKBBqumsBqRTDrXo2Cl2Z/viZ9M9iB1on7Kdogk3sZnGqXBRh1v7Ba21p+iuuxYkhZsjnOPBnRLP/Z9bjM7ySlrp5zcOV/Fduc8hMTNEXQXJDA0E01CfUZ/mjIFFy6wyJidMW0vHUQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790080771; c=relaxed/simple;
	bh=G1rCVG0dFYgkD70jsqhOgIwiWXW8VEW9SvwYy5t2zgI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=Vybnbj4o9mYHoRjGQx70fBwyaBnfr9UQGwX1fm1hlTyOu+NHWlpl9nLsmOIp2DMeH7Kgzl33cUcq9sKZKHSpA5Kc4NYzXTkTlQUfyQBgV4sWRckn7mG4DAJyfrx6LMZstfrmZf5c0WUjvgogp7qAuNFYJEPOLtB0/4q6z6WUYWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IFgxg8uZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KCiRvG4M; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IFgxg8uZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KCiRvG4M"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68MBP24h1146296
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 12:39:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=YH0B3GIKgdIgYq6KPJcykm
	lfsGe55OsoYn1Rw5B9E9w=; b=IFgxg8uZII+f3Sw3wUL3G4+WKHQJkEHjE8v4U2
	KTL8x3zxM5fAkUkGVQnAYb5c+PiQXu8NjH6AQ+qvYHDeClTmAfiFr1Uegxel8FKu
	jhpWfIW7zLLeF2wVElfoO0+k4NDjzmmVUb8Xt5MtnxIkDc6KOzo34IFPxlpTTP09
	lAKHBt1ClS3cjRyB6ExlTcNnOjEap7tz/jt8dFG27Ecd9lknLmdAs4eUyB36tcMA
	1P/vhwH4G43YXMNwIATS8Ch5hkPfa47vNMDQdC4le7okD6UqD+KPEx8ohtpeq4E+
	P7X59MS3QN/A+WB1rkAEdd5Rjd4ztzwqEzEmDnu/TAeWdU7Q==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4guqycrev1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 12:39:28 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2cfc52ddc55so54960105ad.3
        for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 05:39:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790080768; x=1790685568; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=YH0B3GIKgdIgYq6KPJcykmlfsGe55OsoYn1Rw5B9E9w=;
        b=KCiRvG4MIFxB97ndlcrLoEcRMQYgO3jDcp9sLs+4/EmXR3iQf2C/JbiL+96sp+KBPC
         FxEgfqOFYmVxbSrsG/7lhGtJzcVqAcWs7m9mnW++yvIh3w7TW3nzqsRy+giczC6z0G/C
         /lcjOppqJpCygP0RdQQMMU4uy+GbfrWtF5Zf2N4e0Pe7VIpX/+Ybu4SSsfnJlzkZQv7s
         dulQf5EkNBghPMmTT9g5nnQ0kI0GD7AKKZeuMKGw2+YpenYSuuVTdecojCtpA3qbK78z
         n+vTDNpkSu7aarQg0egzanBMtQ/31AUoYAcFvcmLJpRdI5KXTBFKBKCLWy3647IZOikF
         x+5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790080768; x=1790685568;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=YH0B3GIKgdIgYq6KPJcykmlfsGe55OsoYn1Rw5B9E9w=;
        b=SXYI/FFQWABWOd4ZxEjiLdm+nvCUTCM2/xtZLhSdzgqlEg0lUryMZ7zSWuoz0IyZGg
         71UNoWx/cDVc9/+Nc3ekvyFiSBZfgeevwX+MS4QMw2LAZaLhSQzdrRg56uWchWn0hLXV
         lW/fKK+59VBAB4fAjjU1z8cgTeAXkDmZzf8ZQPu4IRKvYLD1Uo3JA+/Hn7mQvYgP6Ga3
         OXXpl2y+IeEBwp/Fjph8akjIDI4dTp29YpScKIHeQFSluMILbW6y0siDSSQnGWRLTkFv
         IZuXO2EHFmgJ3ESkINpwPzgMMFDAAigCZSmPwen7oxY/DFkJpdj4TWLhkAJrVhYFiprT
         BtKw==
X-Forwarded-Encrypted: i=1; AKwUvByH3VL98XyMf4hGu1afnArgeHHW0pP3p5faUQN289VX+es6TXv3YFLNFHt0Ld27XzqWnFLeey0sAw4J@vger.kernel.org
X-Gm-Message-State: AFuF++ke4hvtfLU0WBFp3Z92pNKmQNeFqafN1nG0gMydSEBPJlFk/clE
	uSy46YkZ0g6OyxSpaEhLW+8MOo+XjYtSZqhkoB4+F0nBXnDr0VDHkKaDscVFdKfs9nq5Js6g57b
	b3LvuqSWGXyKfz+4b6qjnjWgb2JfqF041PoXnPFwFct8t/7zlJJVh5CTIwSkrHXU=
X-Gm-Gg: AYBFou11LS6bf1epCbCjEf4hje3MTGKkcN1JXy1N/iDLAMUtE9R/AkFGR6t5MsI7tsW
	7efVKPZA59aQz0NVE5WIascJ08YXCF8W+aDAgD2F0CBa8t7ZO9Gf5KQ4DRnD2XPA/mwLf7uNh9K
	7oAcz3C7ynGZzR5FgZsAanKZj3xcF3fT7HdJoEz1iai2junvziCWVaFWCqGMXp/tkyx1GfcCBLc
	1FvaleMxA0rjop2jxFkHjQnL7yMa4ujAGXNnvLwZjDfPVlIzm++ROaVKbEyXY6q0Z1AbE1bhm9p
	BKJ6/gSdzUv55KCvulPS9KI6S5pr8dhKo2hjWWwcSd3MzKMU5dyOZIUewOOi6LRGI9ODgQJew4Y
	Tb4UdEFspqEZzHHLxk969+UDFZPPs
X-Received: by 2002:a17:903:1aa4:b0:2dd:c053:e0f8 with SMTP id d9443c01a7336-2df60b3c1afmr12055475ad.39.1790080767967;
        Tue, 22 Sep 2026 05:39:27 -0700 (PDT)
X-Received: by 2002:a17:903:1aa4:b0:2dd:c053:e0f8 with SMTP id d9443c01a7336-2df60b3c1afmr12055185ad.39.1790080767496;
        Tue, 22 Sep 2026 05:39:27 -0700 (PDT)
Received: from hu-kotarake-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df5d0308ccsm9265805ad.42.2026.09.22.05.39.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 05:39:27 -0700 (PDT)
From: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
Date: Tue, 22 Sep 2026 18:09:15 +0530
Subject: [PATCH] arm64: dts: qcom: shikra-iqs-som: Correct PM8150 L10
 voltage range
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260922-fix_l10_max-v1-1-d0c99f063bf4@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAPJ2smoC/yXM7QpAMBTG8VvR+Ww1U5hbkcR2cOStDa2Wezd8/
 PX0/D1YNIQWysiDwYssbWtAEkegxnYdkJEOBsFFxqUQrCfXzAlvltYxlaeSa5SFzlMIj91gmL9
 aVf+2ZzehOt4E3PcDoZbBcW8AAAA=
X-Change-ID: 20260922-fix_l10_max-c7390de98d73
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
        Rakesh Kota <rakesh.kota@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790080763; l=950;
 i=rakesh.kota@oss.qualcomm.com; s=20250919; h=from:subject:message-id;
 bh=G1rCVG0dFYgkD70jsqhOgIwiWXW8VEW9SvwYy5t2zgI=;
 b=Fej1M6tLTP1ii0ZqzqmzwzgOIz8MDdbliCWGtJeUsmfjqC7G5AHeik9ihRMv+a2bN0u/ks/fO
 lKvlNlix5tEAgh7fhY9dXaqwI6+nF9EP5oUZX7SuriIvOS5pzdN9ATu
X-Developer-Key: i=rakesh.kota@oss.qualcomm.com; a=ed25519;
 pk=dFhv9yPC8egZglsSLDMls08cOvZKZkG6QQn1a/ofwNU=
X-Proofpoint-GUID: 3X094Bek03F9shUq2LOXRaUoJmV8h9rq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDE4NCBTYWx0ZWRfX/d5HNteQdS6u
 acuXjEQro/fKjcHm6/Z2lvXi3WmhYF4dA3zwk1Bupc+UasdtT76UKeHSZ+70jnMdxmfdGKJ1sHZ
 ChlGDpGsyuATi6UtMfwR7x1ktpKACqtgwT0mzIg3S4yBz4iipJOUcP4G2kp0GI/Q/FmaKbAvXpk
 gUilPyJsxkJ2zMNTOr9Xkj0D08xa6WGTW2twtf7cDWdCzTTKsNqs9NZE+XblVp3Md4+n6g8C0cW
 Xr+nflzFpr+uiNwpmqAkttjrtoBTBFTuzzlDgj6n8Up4mkd3MaclPyHs8MPsZo3vIvBNdFD0pYc
 u1wAAONKeaecS3h39iM9rgMbLGFUoSxs/+IdxN/loNEXpmNQ7JRPqZLNgGZAmAMfW8zAvvVOrRw
 xtk7Wuq35Og3W9iRa1Tu+NzTSHPePMUHHn0ULmH8wUijIl6IgMxTtKJge7cJB4ErHv8F2jP2MHs
 VsI7oNxr+bsoci5k0/w==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDE4NCBTYWx0ZWRfX+Ji0DOKHaqjh
 MpjmoQ7xId7LTpzFaO7KbiFKvDcZ2mpBkovebFpNxQ79YK7NORD5haVfR7D6Yh8WshBgRNNNPEq
 Mw7QgI1nYGKlNTWRgNFJbTM5/XpkWQ0=
X-Authority-Analysis: v=2.4 cv=c8I+0h9l c=1 sm=1 tr=0 ts=6ab27700 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=giemrxp5VU2KOmXfWaEA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: 3X094Bek03F9shUq2LOXRaUoJmV8h9rq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_01,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0 bulkscore=0
 adultscore=0 spamscore=0 impostorscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220184

Update the PM8150 L10 regulator maximum voltage from 3.544 V to
3.3 V, matching the supported voltage range for the Shikra IQS SoM.

Signed-off-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra-iqs-som.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/shikra-iqs-som.dtsi b/arch/arm64/boot/dts/qcom/shikra-iqs-som.dtsi
index e119ace54e58..ba8c93f01546 100644
--- a/arch/arm64/boot/dts/qcom/shikra-iqs-som.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra-iqs-som.dtsi
@@ -172,7 +172,7 @@ pm8150_l9: l9 {
 
 		pm8150_l10: l10 {
 			regulator-min-microvolt = <2700000>;
-			regulator-max-microvolt = <3544000>;
+			regulator-max-microvolt = <3300000>;
 		};
 
 		pm8150_l11: l11 {

---
base-commit: 5c4d4169604b335c38bbc79bc1fc03042981fc6f
change-id: 20260922-fix_l10_max-c7390de98d73

Best regards,
--  
Rakesh Kota <rakesh.kota@oss.qualcomm.com>

