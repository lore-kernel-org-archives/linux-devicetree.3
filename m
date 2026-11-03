Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793710312;
	b=x5j8kf0DkQchnMDehISYi9VRT7z6IlzbJGN1dC8k7s6tm7aCfGt4++Dyr7kj8GqfnsuK
	 gsYbA2ALnw0SFKlfz3sP/Fall/qP5NRxiz3Q0KOeCRBNiJG9mGFlcnHnqVCi5zWzNRpAt
	 cfoPf6vQ/y21Ji4dEHUb7tvlLoJXeZzUzBMKDm2UrDrKInZIfJqVK3VhB7iSUrDGU8eTY
	 GczC2M/mBtudgJehUHT1PyVXWPnc8XlXfJLsrjrg8tp5tD5vZdoBt1UdJfdmHkhmXieOa
	 LsnazKhkyrQlpzqgwDLNEYMh94XcZaI3NrJ1I/U7E3jAqSdI4I1H9HYmr3OUzAzlvDA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793710312;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=MvI9s+vxqYrzkFHqaDuUend+Fy1l8uPbk63PrVt4O+E=;
	b=mNytGxyJdXaOEVc9EYIr1BZvGMC/4tWf6QPgz7slilJWiXCQQmr7mT0H8Nt9jiiPwwNo
	 NHks09oNmBiRYvQTQJMaSliCFlu1KG4PqiR5EjgLP9XLzgWs8pInrcnSspGcmks0gOuso
	 KU3bkyK/F8nGouX0XYBIaJp8Hj/ELvBzVMx5i9P3Ws1niEsHHFSX8gLmZQdbJWxwDV3fs
	 H0vTOaBjWbuI54sK8BnXyQxm5PrzScnNn5u3/QwUbivfsbYM/mA7mmzHl9cVQenpHMyfj
	 ZBDdGWDG4XRloPDM9ZfqgDN99BFBu0YudDsfXNS0/WC/EI6CRrYBKFK8DZzK/pwsdlA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PzwMscs5;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PmIBVmQ+;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99C89606A327
	for <devicetree@vger.kernel.org>; Tue,  3 Nov 2026 12:51:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 99C89606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PzwMscs5;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PmIBVmQ+
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A3ClLVe2866031
	for <devicetree@vger.kernel.org>; Tue, 3 Nov 2026 12:51:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=MvI9s+vxqYrzkFHqaDuUen
	d+Fy1l8uPbk63PrVt4O+E=; b=PzwMscs5Xkd/A5f/rDQ/HRTzeOKuj2+NeZwLEI
	lFB6PoprJqYbYcZ6HmlZgV6ol80SmA6ZtmIhWD3Vh+BQAxgv2Ql1waXP1CLJtXl8
	CdWjtFlSV8sssLRrodKUMuNN5BT/PT9LiEZfbHIiVbld00pEyBGlifuBmNLkk5LY
	6Dyagv/KUEoiUYD/8c32kkELZZyCKsH+jmRnG+18CC2kjxXIh2JS5WBzzP6IaNp1
	WFa2T7pwrIm/QCf5MczEgVslISnKqC2HWo2RqyLQ56S402ostqpu0pfBsmeGwSl/
	WzT9Fxi9f1amB9k8yKbNdvpQfCSouAvo+0y3FuUDmV4SWpnQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hq4v5jq4h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 03 Nov 2026 12:51:50 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2e93f266d20so63785605ad.3
        for <devicetree@vger.kernel.org>; Tue, 03 Nov 2026 04:51:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793710310; x=1794315110; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=MvI9s+vxqYrzkFHqaDuUend+Fy1l8uPbk63PrVt4O+E=;
        b=PmIBVmQ+Wbti1tYZ6Tcu92/N641NiGMNuYbLg44D9qkvpC7f9L0/BWyvnfO6bmrOhj
         RRFZ5SeazYLfOxKic1Sqo7N+8p54HmQ3kbYqUiLWG20x18qDZ0Nk5e3asSPYJl4OKzYE
         iV2qBLtIAQpCuzUwviryITb2plpWYCkKcln3zncUZhJS+P1RLWuJ1iyhETBfaRiXexEZ
         qJRvC5/TqI29kCaUMlkVuRd7d+oakQ+28YEIUc5AHK4NuEpIEDzJQESOo+UFMKcgwOQ/
         p2/DuhzLvV28sMG8EgHHi7MOyPaPzPSrsptqRTRCJ55NlCjpAmfg97CYc7OnQC/1cdsJ
         y01Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793710310; x=1794315110;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=MvI9s+vxqYrzkFHqaDuUend+Fy1l8uPbk63PrVt4O+E=;
        b=gqG7Jmc9NRGO7NKdO4hTTGkZKsgA7CwI5k96pbabENyfMb2sT+MkrNPqduXVcep7Pv
         En8aSuMwo4Juk7nxzAhskIMRE1k6icvsA+XHyAPpqe1W/BkY2hrhaOWP34XGH1o0UnNd
         a7lJxvp1cKpvGARjetAix8eHsv+F4+pa6nKYGohMEDXkLhzzkzg+IJvvncBznEfCtv8F
         Tythv7X3hkxwYfS8ptVgufDiKz9Lpjr4h+4bUBbD6VkPBpk5DnNCEHdfBVLD6rAO0yaS
         UrHSCcDQrsgtjhjaSwrcXJD90+c5g8wX7s+V0hqryajR0KGfOo35KBGjSwFA78OdHbSn
         MQZw==
X-Forwarded-Encrypted: i=1; AKwUvBy3ftUXA584ppgux3evBaQIn3Qro/ksUZTpVUQptYCtDBZqDaoD3cVJybeJrjSUOmXAAk60ZZOI0E9J@vger.kernel.org
X-Gm-Message-State: APuU4Z/kPuNZsrtP6JR1HPjpP2Bs607VPGR1bZu5gV5TPRlDbWlt2ar8
	kH0sIdBGF9AEI5ZIO5eOtMnx50GFUTj3v1AIYJdm3ORVKClkMD/d2Jkx3N6o/k/i+OLfvqCP6B1
	0Ul/ZL8HzQgpHhia2hiw0z0uARWNLM7W9amIBay8HJbuKeDVhYjJXNv55uIw+zwDU
X-Gm-Gg: AYBFou2RiZfnckpQ/ESDXOCuDGpN/MZQGMYtRiD+CzTpx0PX0xvEGcsoEGt42n3G902
	w/4C8iKqrNRC40L6WXh9wiqGnCuA29ug121o1QTv//+SvnploLSYz5+HgXp5v+MYyZK7vmh1zQo
	CjXTWM2VCr3R3fmcjoFfHBMeUyZeG4I8u1uMeNsnWUMX/jZCHV9uZs9eJbv2Cu6+Ug1dmHhJpWJ
	xcR0PKwtGz5w6jKHo+4LrXWpSH7PZItTB7BWUFR+LerCHJ5u6PMutEqFDAoZOwtkEY0Bd2nIPD2
	Vi7ef06aVjUg7OcYbq8Pjbm5f4dnsAzONt5ZGEfu5LqwFzATSCjI/WKV6dWuYZQFXSfu0qe6trH
	YuSrxOqwmce9hruAXruSdVaxpqTMMu16KtCgFqu6css30TAsRpB6xk5rkE6K67Z2/0BKASADOPl
	27QYui6RdjsA==
X-Received: by 2002:a17:903:124a:b0:2cc:6018:f030 with SMTP id d9443c01a7336-2eb36495fe9mr124446725ad.14.1793710310146;
        Tue, 03 Nov 2026 04:51:50 -0800 (PST)
X-Received: by 2002:a17:903:124a:b0:2cc:6018:f030 with SMTP id d9443c01a7336-2eb36495fe9mr124446545ad.14.1793710309688;
        Tue, 03 Nov 2026 04:51:49 -0800 (PST)
Received: from hu-nmalempa-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eb39266b84sm41027435ad.43.2026.11.03.04.51.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 04:51:49 -0800 (PST)
From: Navya Malempati <navya.malempati@oss.qualcomm.com>
Date: Tue, 03 Nov 2026 18:21:44 +0530
Subject: [PATCH] arm64: dts: qcom: eliza: Add RPMh sleep stats
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261103-stats-v1-1-3dc062db66b3@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAN/Y6WoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzNDQwNj3eKSxJJiXeMkY0uTpBQTi9RkMyWg2oKi1LTMCrA50bEQfnFpUlZ
 qcglIs1JtLQBSH9slaQAAAA==
X-Change-ID: 20261103-stats-3b394bd48ec6
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Navya Malempati <navya.malempati@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793710305; l=956;
 i=navya.malempati@oss.qualcomm.com; s=20260423; h=from:subject:message-id;
 bh=wE2xDtIAvPUdGZyRloTfBF9zn9w5/LoqpVgngsrVQh8=;
 b=zZEZVY5VueQtgva3+BAomXX4FHzWGKO5L2Jf8Y5WbW7OGlu10RAFhGcfUCk2fXE1biU2pXWUK
 2V+RCa/iWcEAxQw1qV5JHek74UOlGi1uh7Y6dv6KC7lsXALgionaiOq
X-Developer-Key: i=navya.malempati@oss.qualcomm.com; a=ed25519;
 pk=XWkaQ4rYqw3tflaJ4YH+9iUHSq1kn9eQh+CAbSvNrdI=
X-Proofpoint-ORIG-GUID: ANfRKfS_nYQrmi4pJyli9lFGE4ga8INi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDA1MSBTYWx0ZWRfX8pdem2SwSzTZ
 IX/GdEN2tmckisLf29QToZHLk9Ujl8IhJXGKdmJ2p6VVMtWRhH/GfwAJbDtZBkadCWkmOgpT8HR
 2S7nLP+hnFoKJ5sDWJILpFJyhipT/UdpBL7iMm4wLjlcZJX4lmbyiFc3Auh/WyFvrUxVA6V7Sma
 vx68kiCsNZBc/NAq+bURcVj7jFK9e/XDPTIDryUWySXHQUHW1gMXpoiYfHjfUHo/FyX9TF3PHHF
 zpjN+zkGoBdpHDRobw+SKHJi+GOX4Jc5l9gF2qxziT4Bk5TGP5w8r8jq1VFZtWrcTohVOXT7DQo
 mGtDMajnbFWabkoWFDX0lH4JEXAKJgmSOTonz39+IGdk1+GHhsiCo1vX+Psbby7H4Nbs2ruzHd7
 b1L113VK4JE0Vikbp0b4D7gVhAaLPGxNT0YHu85qEe6z5gE06ie+HLuIN2VoCiUwFwDzK8HDh2a
 QSRrZ/7xNrgPD9njRsA==
X-Proofpoint-GUID: ANfRKfS_nYQrmi4pJyli9lFGE4ga8INi
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDA1MSBTYWx0ZWRfXxC8YEWJ6UspS
 UvpDXgDE0lYPMi3c57UOvdbAnJX/mUf0LtipPGAKBapx/ghJ7Yu9+0BDb1csZOlM168R8BMU3QP
 5b0K+Q3vZBhw0wm0UoOZHnRzT6Ox7dc=
X-Authority-Analysis: v=2.4 cv=NeZzRGD4 c=1 sm=1 tr=0 ts=6ae9d8e6 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=bzhEBfGdM2i4AtwIHPkA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_02,2026-11-03_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0 priorityscore=1501
 adultscore=0 suspectscore=0 clxscore=1011 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611030051

Add RPMh stats to read low power statistics for various subsystem
and SoC sleep modes.

Signed-off-by: Navya Malempati <navya.malempati@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/eliza.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/eliza.dtsi b/arch/arm64/boot/dts/qcom/eliza.dtsi
index a8042291bd07..13792ee34e22 100644
--- a/arch/arm64/boot/dts/qcom/eliza.dtsi
+++ b/arch/arm64/boot/dts/qcom/eliza.dtsi
@@ -3517,6 +3517,11 @@ aoss_qmp: power-management@c300000 {
 			#clock-cells = <0>;
 		};
 
+		sram@c3f0000 {
+			compatible = "qcom,rpmh-stats";
+			reg = <0x0 0x0c3f0000 0x0 0x400>;
+		};
+
 		spmi: arbiter@c400000 {
 			compatible = "qcom,eliza-spmi-pmic-arb",
 				     "qcom,x1e80100-spmi-pmic-arb";

---
base-commit: 2637bdec0535a2044cd830eba9a79363651d9043
change-id: 20261103-stats-3b394bd48ec6

Best regards,
--  
Navya Malempati <navya.malempati@oss.qualcomm.com>

