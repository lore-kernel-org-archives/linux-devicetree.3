Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27E3143744A
	for <devicetree@vger.kernel.org>; Mon,  3 Aug 2026 19:28:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785785325; cv=none; b=L3sF8ZYitvUkgKGJ8l8etU5L+pTx4XP/DprRCorqUfuIAbLNDEPgz7AbbV8L7szH4sm4NbKPSQZN3rUZLpAAuSgr76CDNUU0uwKNN6Rr19AFXUcJGoIeNVJCgX+rhWTOM69EfX4Z6TSyqdUki2qObwzEPHTIx379q4GMiisYqMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785785325; c=relaxed/simple;
	bh=4FZGsEeKBJan6pXgYOjNUjuTyyrjSLTqxJwnLlXfxPk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GnMdN9yQiiUlxx/mon0pbRE0uHGRCRa2NwFGmeAqV7L4+bxu6oGAWcx1wp9WbZUpc6Y5WfaZPF6+6V6PQbFSBu2TRlDMRx/fp5XuGBtXe3HTMj4pXnHHV125ftTkggUSUmrem5FhSf5iqHC4xgRtmqbtUVNXz0yiRk0qRlFAgVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=njlU0JDq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XCRKoPDD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="njlU0JDq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XCRKoPDD"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 673GwKCB1529999
	for <devicetree@vger.kernel.org>; Mon, 3 Aug 2026 19:28:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TWn0jGAX/JCFoCMtmHVkUSNBCb88RMYT03vyTiaEeqI=; b=njlU0JDqccejE/Wa
	O81EeYUjcMzIJp6tLCCpiYVS6RdAqrnpxSS1MA2HdHLw0+a7oF0wETADuTMDar9H
	9HxM8wSXLboz+Msx86cZnHGrisDWTu1RyXtwc7fqzbwiMMkMHq4oRPCkMMkKjL2d
	tTTdGfA+qPubBVKXsBV73/XzaQdZPzpDB/4xWLQSKs/WmF235f/fv0nphETfy/LX
	XuFFEuCjhBqQ9RJT2iWSlHz3v4TpNBBh+rB73krgO7PvbQnjltPO5Wbc5puxRrOq
	KpGLOVXannZb94ZpFhpqe8uVeARaOzRsitg95fh3tywnTgU15wP5KAgPuDBKOqfl
	n4PVaQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ftnrbbbb2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 03 Aug 2026 19:28:42 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38f5ac7416eso4148816a91.3
        for <devicetree@vger.kernel.org>; Mon, 03 Aug 2026 12:28:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785785322; x=1786390122; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TWn0jGAX/JCFoCMtmHVkUSNBCb88RMYT03vyTiaEeqI=;
        b=XCRKoPDDOYh5Bui5TufN8l1Nqim3fnhi/rApxFsZusHZQsXsvV9Cn5k7Lt0CvPjRVb
         c2FjQUk3X1mPtGkA7DODHgQ6P4e1SXrPoX/E+4SDzi9bAbStJ+CnBHnJBx134nPhd0Jg
         FbDIGMbUilmc74NhcMmfCLGjiv454ivs2iLoHSj2dsSwuMEbv1e52ZKa0oJZodV2yHw4
         qatnzOxHnZkIW87ef/ntzM//zQIZc+iGSJssbWw6FUVjkCzcVhHxyAB+/5me770XWcY+
         +X1DmvAtbiDVglR7580YSYg8JSkFe+J3fgN2tcj9X78Za4appzqIecxYDoTR4XA+gTcj
         07Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785785322; x=1786390122;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TWn0jGAX/JCFoCMtmHVkUSNBCb88RMYT03vyTiaEeqI=;
        b=S9Fly4U0WCykbb7c2DuCGy5FZp19iE4mzPDj1CkIZjr4iZaCXhQoGFl9M+HPCVAlwu
         1SPkQgWxaAG+G1h2EAVOgxJlypL9Qb7IBTK06ghIJ3y3PkTvuvFXVymvcJOAi6uQYVq2
         ABxOP7JbjP5Sos7wohluc1rq/zdvXiOq6aryp2YvIsFaBsA2svfRpCYZv9K+dJvGA0SD
         m2jCZft790iaUujSnMUHrpO8247rvYQH2TYA6EW7FACmPqrDmkOLDKbOUui060eFl8R2
         wCtFE9t3zyq0/f8SflUqmKPrlOvx6WUbOn/ZvNUpGzrUsQzh70BbAlXLtmTYivsKfUHo
         Wk6g==
X-Forwarded-Encrypted: i=1; AHgh+RpOAs78SjsALD4BMUJdTe8BuSwfZKp0g2gJ/+kt7ZfI3fTqqSREj7OvvwKB9eDJs1cIH6y268fnu7BE@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1R3HekifXiuD640E94lwwlkbvebCTDQhQzNGBv1gPg9tvNMNF
	7odrFwHDDZN5sqiZ/BcCWYYNZ7SNPDo3B5HLrQP+lJCQumrykEsT13Xi9mKPTzUExGkwYE9iu57
	0VmAylLtGcqm7qmwwGe0ZmaIcxoVlTpy8VjJYTIX0MwtzXRhVitzPUqUZSxoHARFw
X-Gm-Gg: AR+sD11hW8SMOC/8KicLBLYyJEsVcrzR94LkYrSgdK9hjfAGFZW25t4fMgs+KSWXqB3
	Yd7bHA5/x4cTOvyBVegcjW+4FUMbLrKK0ydnoWgK8YqZyuTH2A0LWCiLGdOeZ/b/xxmmlHtK7X/
	OVh0DXy9e7aOoymcryNF3C9S0ssIlVGXrleGSUIDpAj1rWhdclFyBHalYkXb4Z/25x4VmhRx8QL
	awsl/AYUJ8l7b+VJrfnGoGM4JBgAJGzGzmFdOV7xe6iZYm4EbqXzuox6RAyV+sr4ztAglv97pCE
	O3KKoqqESVmsvOFV+4DATPzpVompujMNVvXsh6eBfmuueszQU1pKy9Gq5ZfxxXaJ/n86tPvNoN8
	tTxtLJ8VdIy/Q0u6CW8Yu2AaWFYSt0Q==
X-Received: by 2002:a17:90b:5690:b0:37f:9cdf:f037 with SMTP id 98e67ed59e1d1-38fbc4d9f82mr10742134a91.26.1785785321874;
        Mon, 03 Aug 2026 12:28:41 -0700 (PDT)
X-Received: by 2002:a17:90b:5690:b0:37f:9cdf:f037 with SMTP id 98e67ed59e1d1-38fbc4d9f82mr10742107a91.26.1785785321427;
        Mon, 03 Aug 2026 12:28:41 -0700 (PDT)
Received: from hu-mohdayaa-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3153dd4e5b0sm38622738eec.1.2026.08.03.12.28.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 12:28:41 -0700 (PDT)
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
Date: Tue, 04 Aug 2026 00:57:59 +0530
Subject: [PATCH v2 3/6] arm64: dts: qcom: lemans-evk: fix SerDes PHY
 regulator supplies
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260804-b4-sgmiieth_serdes_regulator-v2-3-c4bc688177dd@oss.qualcomm.com>
References: <20260804-b4-sgmiieth_serdes_regulator-v2-0-c4bc688177dd@oss.qualcomm.com>
In-Reply-To: <20260804-b4-sgmiieth_serdes_regulator-v2-0-c4bc688177dd@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Wasim Nazir <wasim.nazir@oss.qualcomm.com>,
        Mohd Ayaan Anwar <quic_mohdayaa@quicinc.com>,
        Umang Chheda <umang.chheda@oss.qualcomm.com>,
        Yijie Yang <quic_yijiyang@quicinc.com>
Cc: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785785297; l=1746;
 i=mohd.anwar@oss.qualcomm.com; s=20250907; h=from:subject:message-id;
 bh=4FZGsEeKBJan6pXgYOjNUjuTyyrjSLTqxJwnLlXfxPk=;
 b=3PNx8Q2peALp3P73LT5Tp1DjKcUaYBq/vnmv4LOKH1fssusUZKAjavov3a3WwQhrvfWZOHevs
 Sc0RFLA1syUBHg+UdiTMM1t0/EBFTIenVfk5A+WTllVffl/XPbwJErA
X-Developer-Key: i=mohd.anwar@oss.qualcomm.com; a=ed25519;
 pk=7JNY72mz7r6hQstsamPYlUbLhQ5+W64pY4LgfSh9DJU=
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAzMDE3MiBTYWx0ZWRfXyXERw/N22I3P
 sKxNURXyqvP0VX/5HHRDwhhPpdIHsd0CE2Oj8rlOmd0B2FuLnWM/KrJyagfW3YCJWNbitYYnbwb
 67FL9LHujLdqfvx9asFI0LVYmRyaHVc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAzMDE3MiBTYWx0ZWRfX0sLBnabMCDC4
 gjEmIyOw3drxdLXT+Ljku/8sy3khcUtiq28i/J1sb50ZppTiaciCPL7bpw3kC5KhvXV8GWQS0/N
 6FLuHUKZTajfh/LlhaRPQNyaKbMqTeLmX8CyeAYte47QsJmptttXLcTR047r/AvqNkb5Coubke4
 DeiYRAP1w49iVsN4SrpCyOzc+8tQP5v+7ckaA2drXy0X3n4BBKkhs0IUqVOJWs/vE7abDApUAWZ
 eGxJROXbMBjZYkE/nwjhQ2VWcHrrlPqG7U0qF3O3C4D5JeGoZrxGCkrzEJCYFgMlyPX/h+pdVvf
 rr7cxn8BA/Rzyj7iHfpec+kL7sYom5gomTOALeYvHNiETAK7aBhL8JuBUOV2D6VsutIfiZm42b9
 qrKmJxQfWECg+gmOQcYZgvBiTAUnniVjWJB6XlzI08l71Ze7CDcrkLY2LLNh9YRvsn43ZpwDr+Z
 EMv5ZQfPxf7q5WDnjRA==
X-Authority-Analysis: v=2.4 cv=RNSD2Yi+ c=1 sm=1 tr=0 ts=6a70ebea cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=iUjljtK-pkRXqhAa9_AA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: e0RWxatNuw06uqJQMcTq46w_fUAAImUx
X-Proofpoint-ORIG-GUID: e0RWxatNuw06uqJQMcTq46w_fUAAImUx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-03_04,2026-08-03_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0
 malwarescore=0 phishscore=0 impostorscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608030172

The SerDes PHY nodes were configured with 'phy-supply = <&vreg_l5a>',
which was incorrect on two counts: vreg_l5a is not a supply the PHY
requires, and only one rail was described whereas the hardware needs
two.

The PHY requires vdda-0p9 (vreg_l4a) and vdda-1p2 (vreg_l1c). Replace
the incorrect phy-supply with these two named properties on both the
base EVK node and the IFP mezzanine overlay.

Fixes: 71ee90ed1756 ("arm64: dts: qcom: lemans-evk: Enable 2.5G Ethernet interface")
Signed-off-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans-evk-ifp-mezzanine.dtso | 3 ++-
 arch/arm64/boot/dts/qcom/lemans-evk.dts                | 3 ++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/lemans-evk-ifp-mezzanine.dtso b/arch/arm64/boot/dts/qcom/lemans-evk-ifp-mezzanine.dtso
index 6cfa0bc1440e91d32df0695ae4059050e4e20b56..8651c412d0288fcf2ab69fbfaed86f68fb2b4fc5 100644
--- a/arch/arm64/boot/dts/qcom/lemans-evk-ifp-mezzanine.dtso
+++ b/arch/arm64/boot/dts/qcom/lemans-evk-ifp-mezzanine.dtso
@@ -291,7 +291,8 @@ pcie@0,1 {
 };
 
 &serdes1 {
-	phy-supply = <&vreg_l5a>;
+	vdda-0p9-supply = <&vreg_l4a>;
+	vdda-1p2-supply = <&vreg_l1c>;
 
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/qcom/lemans-evk.dts b/arch/arm64/boot/dts/qcom/lemans-evk.dts
index 0c53640c42a65c62375e71f7ae79cbc834a05888..5c046b9bfb3cdec59cffc1dfdbf9f2a51dc9721b 100644
--- a/arch/arm64/boot/dts/qcom/lemans-evk.dts
+++ b/arch/arm64/boot/dts/qcom/lemans-evk.dts
@@ -978,7 +978,8 @@ &sdhc {
 };
 
 &serdes0 {
-	phy-supply = <&vreg_l5a>;
+	vdda-0p9-supply = <&vreg_l4a>;
+	vdda-1p2-supply = <&vreg_l1c>;
 
 	status = "okay";
 };

-- 
2.34.1

