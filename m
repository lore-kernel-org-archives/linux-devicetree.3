Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F90729DB8F
	for <devicetree@vger.kernel.org>; Tue, 31 Mar 2026 16:56:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774976213; cv=none; b=qeCITrcQTs/3rbpKciNyXY8wKQ7KA+FrDXGRVhhKIAxW2fbOPBn+QAOzObyfZ7cBOdTCQJuJydRCmtY/oKBcsYb3gq3WhRBIbmulDQqHDr9MbsCYrXeYU6wCFUl8JTI1uNY41QGBJQQcME2RJ66EKlFZUQT0hpwMdGcVty/lU0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774976213; c=relaxed/simple;
	bh=92089Z6mrHRNtYKNhqqcWsVrZlIsvT9kMeVOiSOimL4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=svjRjOGiUV3CN8YP9Gh83n0qnJLPhu9U9hGfQ0Vese2ZYqYoPFS7MJv+cb8lywn2YqxMiXWbiYCB0l4z/uYQ5vU36kFn2TTI1gKMLQSF1/T0msii19JPzkQtJOZjmLRJZ1eoOfUJ9kZUqRzs3p8jT+s9C9E/m9dvPgrddWsAlnw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KA7LCdeZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NP0lhFwe; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KA7LCdeZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NP0lhFwe"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62VGdUE83239966
	for <devicetree@vger.kernel.org>; Tue, 31 Mar 2026 16:56:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=UB7Gu/9Q8VnQb5MCE8i8fRq/HQaV/Lfs03U
	luz4BRYE=; b=KA7LCdeZw0b+aHT7tPjMB8N7QSuRc9MgeP5BxqAUQyS41ZJKHHW
	VJlUyxe+r8ffFlb9pLgFEL6Bx+gVsTIiPQUrxbBaDjeBfNl/hNKjqWxljEiRk3PS
	DF5dhikY4gMq/KmrmgkbnE2cO6jkUQ7NcLCtYbldE+QmkHXao43rDudH6gHXTEVY
	kMFVr0IdvRM0IhcZM5cprNzAUoFN9aiHk4XgGO2Ah72fE2ajPykuVfVOgwsJVJbo
	IhxTmsAnTF2MzVe08iwUdk2Ir5UT4nkOBKyxE53RtsuQxYIAQauj/ZMPvvmPboBu
	mV5pahBsN5tWy0sj6NNw+nWdkIaT/r/xdOQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d8b1yt2hb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 31 Mar 2026 16:56:51 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50b802961ecso77728281cf.1
        for <devicetree@vger.kernel.org>; Tue, 31 Mar 2026 09:56:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774976211; x=1775581011; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UB7Gu/9Q8VnQb5MCE8i8fRq/HQaV/Lfs03Uluz4BRYE=;
        b=NP0lhFweKh2SmcgCQWAMQJChn5vxQW03MiJ6dORHKY809dl8fwMvKyJx+he62o7BJD
         6WGKCswxDgIx093umoK5bxdvg+B1b6Va+EFosX0DkXbbc5Sz6gsXcMw1K16EiU6o448L
         yw0xl1cLXtG9XdPdRAsXhA8cs/JqEJ8LjH9o2xAK/ne6rp3e3Max2qTu2SahOyr9NJ+P
         lTWKjwvydrk/Hbxgu6iBIKA9mjcHFkUXuw+OzYOfSDA7nCJkPr2RySqgIApy6xf4UQ5p
         fVI8gLhp9m6lLCxfFBU4KXvWdfIXAsj1nRDueeB5wX8psA7p50MO+yH/pORdade2P6/n
         2OKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774976211; x=1775581011;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UB7Gu/9Q8VnQb5MCE8i8fRq/HQaV/Lfs03Uluz4BRYE=;
        b=PpNP/TXkhf2oajORj8VxKjXpKKMSALmM2eq+du85Yu1ehlNhwN1VUJxj58hWhLZoXt
         TgkhQMuy5aZjGUhK9OMI8LHrRn9zJ/s/9+bThMutxXlQWMwsWkC4aJu2a3Q9qa8LsDss
         uI8gej5LnibCx5nrV2vZcTDys78t1d1JTiYOZhCvYhDipCzKijXDHDixyBi2Inz4gu08
         sfgQDs1BaXyp66jUjasXswDu15B0yx8p7zY6BxKD1zvSzpF15rH6cAmMyLxsr3sj55cY
         tq/TZTWe5Mwk8GILvPsCtif0y1BC0tu+M9zVK8BsSN9VSmIZZFG1K/POpqWqrtgEF6H0
         h7yA==
X-Forwarded-Encrypted: i=1; AJvYcCVIrXTfI12YPjSI1E0eqkjNOe4yJSIGnQ+ra7+84KUIUlD0IlLlcAnGzRL7eRRXRwaDpYvRxy6FPEc5@vger.kernel.org
X-Gm-Message-State: AOJu0Yw09XuKs1BhyHIpSu2U2Vh8lKpA5AmcgdJ0ijmmiMi4HjI+SRuH
	6CP6hAPdI37FcDuyhUm2uYBT2lYwiOR7X2MMuEntBfEm+aktV73d6CYmXyKaJUwbjnmVShGioba
	WsNoHtNJheTS/088YxVGoX66LfIbPT4l/M4L72tF4krIh6znIf9ZFek6zzU+Nmqv6
X-Gm-Gg: ATEYQzwnQMwN7XBYc8r09xm6jCsJ7yuILXXLZjWJAL9ZQaDwR027lzWlMKTOE8NDrhu
	rCwJ9VItOVTDisRukk7/61TjWi0YGeOlbMbJTdBpeInaT9EJyTYKKNni0+bC8SzjD+zgEjJTx/G
	eeUV4BPcGwYk8/Sb3Tsvmb9MCMottzzDJn80IoMcvHfsp8/U/U9E7jdem1MQDEhIItRvd+4Z74o
	zrne68Z7Whi2YqGRvmFwNQC/+JsSVFIyx4biV7uNIkKCQmqPjRJigQATTA4Sfzb7XQEwPm3+w2Y
	7R7Cw4yg0y8OTngUvJe6YTxcH6D12rsQOs2usmIpwOttM2OzJS2GK+ZfDk27GdcUJ0IaUEaO2mf
	s/hzvqN68GV52fzFJNCoJlF8s8/T2F8bNJv2p
X-Received: by 2002:ac8:7c54:0:b0:50b:3f50:178 with SMTP id d75a77b69052e-50d3bb93149mr4425051cf.14.1774976210575;
        Tue, 31 Mar 2026 09:56:50 -0700 (PDT)
X-Received: by 2002:ac8:7c54:0:b0:50b:3f50:178 with SMTP id d75a77b69052e-50d3bb93149mr4424641cf.14.1774976210097;
        Tue, 31 Mar 2026 09:56:50 -0700 (PDT)
Received: from quoll ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4887e843a55sm37072775e9.12.2026.03.31.09.56.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 09:56:49 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH] arm64: dts: qcom: sm8750: Fix DSI1 phy reference clock rate
Date: Tue, 31 Mar 2026 18:56:46 +0200
Message-ID: <20260331165645.233965-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1047; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=92089Z6mrHRNtYKNhqqcWsVrZlIsvT9kMeVOiSOimL4=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpy/zN4y7oXAG4S9rdenj6FGu4WAaNzH+5B4WMb
 7BF3MywTSuJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCacv8zQAKCRDBN2bmhouD
 1wL4D/9qfWQJtNQPtwQgMDYmi4l4Hgw+sJy8sW+QWWaC5Ie4DIL6mCK5iovTgaU8cUSoNpBLvn0
 vs1LqQEV8qMKMLMhXre00hspGIcuo89R2974i1oR15N7k9vsvwePqNuP+bGgywCR3LllfLCF3gs
 D2C+AN4PEecrKbZqrMWApTFagtpXf6l8DgzcfItuK6DMewVHVryn0QHxX73jQKs8N6Cy30z0c83
 Oj24UUQQPJIKeTHbalTHJxelaAEMPncHTeFu8N7QV+lC5WiLDHscs8a7gNsH+49b5fKv//yA++0
 FaKk/ojoayZspGb3hyEDJbXwoL3jDYy1iimHa4O6eQ+jQoaOpxmCqm2su9698DHTEBYRmWKEC8x
 eYhOB/AKEeHpTvTikLAnFRHi8cGfNmovS7ykwgM7SzXlIFYqhmr2b5NsyoYiU+gCEidYgaemHnC
 aD1DJn0vDnH8Yb86uNVsflVwVWqFrDJfmTYlOU6BE8t4yNXamI4qW1ByAcAObQYnt/orGZUG7SL
 TUsLXDXqMYB5GG9XtpkE4qrT4dlLhOiVR/n+K88myoPlE8Dn9MFeufy5k/wSgiMbDcIqdGIsdlB
 PcyCCjNm+rwoX4ZVHuwPMhx55g4VwsPXT0bTlZEZQUaQxQOmoaFCrVV7TyzFTmsMzUhWK3s12BD V+OvnYc4oOHsm2w==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: AW4lhggT_IIX_V1B925HiukzGumEWu0V
X-Proofpoint-ORIG-GUID: AW4lhggT_IIX_V1B925HiukzGumEWu0V
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMxMDE2MiBTYWx0ZWRfX/3JuNvcfRLyo
 I6g1e5CvauNlycKNPuAkgFX0I+fDwr7LuTHqyxfqbQdJz3mJbg7nrvVd+wkM8WhBsHr0PgzKuCN
 YDayER9K4ifoayPMDbDOZnaa2WOQBTkQeZyBHgSSrftXONs6WLYGYucLFu5umwZ2raOCWgX5XFw
 J3O1ED/rpjRPvCwor6QM2ElUKcCbX26c4DHtYiaDm0wFLPCq7CCWA0+z8giBjvGzn/IrYkdCJ0n
 CqHtf/VqumhuYiWcHxZRI6wz7GxoEbhtZ5Ejq7OGWQuohKP25fJJoqmSQj7BVTfuNP07R5YX3l+
 brbYCJjw1utOKN6EaZL1IKbHMZmyXBHIHEdNZ7q1y9VtSvUXVNEmeotb3F+F5s6144gggFWoa0H
 L6dcWfoY9stbAsyxprW3y0tVzSNMXPuYr4Qt0716UCBkuB1bkP5lenmVwfkFuuWQ9nVXSOwn6TM
 OzzGOqc9i0NLAHMIF1Q==
X-Authority-Analysis: v=2.4 cv=aJT9aL9m c=1 sm=1 tr=0 ts=69cbfcd3 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=13iKjLuWfy0j0Tg89WsA:9 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-31_03,2026-03-31_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 phishscore=0 bulkscore=0 malwarescore=0
 priorityscore=1501 adultscore=0 lowpriorityscore=0 clxscore=1015
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603310162

The DSI PHY CXO clock input is the SoC CXO divided by two.  DSI0 already
uses correct one, but DSI1 got copy-paste from SM8650.  Wrong clock
parent will cause incorrect DSI1 PHY PLL frequencies to be used making
the DSI panel non-working, although there is no upstream user of DSI1.

Fixes: 818ae2b389bc ("arm64: dts: qcom: sm8750: Add display (MDSS) with Display CC")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

Fix for next branch.
---
 arch/arm64/boot/dts/qcom/sm8750.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8750.dtsi b/arch/arm64/boot/dts/qcom/sm8750.dtsi
index 18fb52c14acd..320aec62e462 100644
--- a/arch/arm64/boot/dts/qcom/sm8750.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8750.dtsi
@@ -3313,7 +3313,7 @@ mdss_dsi1_phy: phy@ae97000 {
 					    "dsi_pll";
 
 				clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
-					 <&rpmhcc RPMH_CXO_CLK>;
+					 <&bi_tcxo_div2>;
 				clock-names = "iface",
 					      "ref";
 
-- 
2.51.0

