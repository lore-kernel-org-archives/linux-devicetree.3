Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 583ED36D9F5
	for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 06:20:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789971632; cv=none; b=Si8OVwsoWVoJWp/SfuW6v6jWKbdwrXgAMECZO8LQvX1lynTmuElCCj0rDssRHe4ls0reuMycZFLIf7xvosaBhTsqd6kBSzmGfRHrgqS5IpZPjpXVfzErn1qIv9ZPMfNN3jh/kafRRCI40+DggTujnfVlRjj/nQWcSF79nvHTtW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789971632; c=relaxed/simple;
	bh=xwyDh/gqIKThBIDqDIaDn1f6CWzTkjln6k/sldLENWg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CL5wuTzcmARD5YL0dmF3bpMJbJl7ubhVhLOeX+NxG6Q9wZH1U04iFx5nKxJ2l/7zlpGWauotb3QyEOBtIy8fRS3GDPZiEe/Yz/877UFSgny2RgzRKX0tk9dBM0JhpVZA2Qat5+lNPdsFzGWjGq6R73TH1IhfhPlEMYimZi3Q76o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kFSdfblI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HpJQd/nr; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kFSdfblI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HpJQd/nr"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68L3Z6K6993464
	for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 06:20:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MM6fxEdC63BYt4I9p9mHc3crUkRM0DfxDxmdNan0WwU=; b=kFSdfblIN84CxHNo
	/E1xDSz9N0L1oPeatOKzBH4/3eF5j6Z6ekWOb++EYnCGGHpX21Jg7N+CC2wsU5KI
	sdhDzIrMPL6eolEw2DUSTzjca3WwplAlDpzMfR4+IcBOLE/ye6ALxZCHrh+VoXe6
	pVNJCCZ8dxnzg4XOQ4OxtEmLIH6cHgPI8R5zF7B3g80yfxxeleZtp/AvEpTcEozO
	WHLGDEs32Cs0o6gE4hiDIlvCRI65VMhFDPB5fGE2Ai/eUBFWA+XbHJpACUMFWZmA
	sknvuZXoe76rPwaiCD3odFh+uUKUh1ADMGZw/hQmguQY7mj6Qlct0K6+raF1ycGy
	++CGeQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gtt3v8wnu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 06:20:30 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2df375fb9b2so16072005ad.2
        for <devicetree@vger.kernel.org>; Sun, 20 Sep 2026 23:20:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789971630; x=1790576430; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MM6fxEdC63BYt4I9p9mHc3crUkRM0DfxDxmdNan0WwU=;
        b=HpJQd/nr2yHmoBjmC3IY0/zdjTQFmhap15sTThwadxtx+ajuGu3P5yRcatsk2Cln2x
         NldGNl8TZTTMSSpna0Ti6sog0K8593sS0O6X+0+fDKBPxFOs3TdTUTun+E5oi7DuD/UB
         UYExv+17v+9qYPRuQ6Lhq7kIhUd1+ocx5UefueCebLfTJiBev4AHDF35kMWQPXhfHdV0
         AagCOx1qeHGjIrgNwk1J3kHYBRGYDfNSe7w9eE6LauT9RRjUJs05+emnb8Q32pIFesik
         eRkJY4bA2wQW8Lq1JEjaxhkqDcC2m7cJ++daVBei6xn3CKTbXQOdW+tLq+nuQ5F56rps
         JRUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789971630; x=1790576430;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MM6fxEdC63BYt4I9p9mHc3crUkRM0DfxDxmdNan0WwU=;
        b=dGaO5GGIM82vM9jx7TFa6Uo/g24iu0vG3HbEIxUTM+a9LyJkOk1OnrndO9aW/E4MFv
         PTS9NMWjTE8Kwdi94D0Dkm8FqlLv1C3tPIq2wxMBSAl3Vl2+QVhDmVqm2TYyFCu3Ewh5
         2Rv5fbt+tJ8fjnNvffMBbak39BLTP7HzFU8QwTOmy6AUuRz8Ni/T1OeRFBtxbuJ5+T60
         AMWYlSDgZV+1Cuo69Nl17RJiDKGxU+EiItYlQNNhU3Tm8wZxRqcxNZVKvw3otZ5O7CRI
         YOoXbR8oSRk9V/pZxMAMaszY8fdiKMK4CR8spGJmNTfno/Zt53xVnk9RiPMQ/rF8kyxY
         d1cg==
X-Forwarded-Encrypted: i=1; AKwUvBwuYy/p7PO/JJ2j2tcdJzI3tjcx5PPl1HaD5CbHSC7B/0fH6LEx8ysKUo70UQ4IdxjYEaie1HZjWCz2@vger.kernel.org
X-Gm-Message-State: AFuF++keTg+MB2BicKVp2/t3LXGRs36sRC5S5haLi2cJsFi7w1w058ii
	Bo0kFeFgwmilN5TgLHbsKyxhRAfUS4Fs0Zjq24ZhouZJfb/JtOSydA4ywwwqXnJQeyU3j/1v2p/
	v9Fu7UgyC+hwgg25gEZcXjUaaW5Du5ADxVBDdO8omSnc78Q6a+YqeRrJXl4E4fjSV
X-Gm-Gg: AYBFou3fctkHEtR4dQUkVKz+q1l5dDK/dZv1WIb+T/hEaTvPC3NqE9YseOpOOh6gZ0B
	9ddAus4DQr2RCKjeadx3LVVE2doW0W1CLu+tnKDLfzWYYLU3UQUxYVgHBAdnheU42QXa7BVRtDS
	w9s8ZDBamQButgV3PQSe0RZdhY8esknUsp83mzZUPqPUEnp/uAztreC87zvNKj5Ce0TBU6ZNMMn
	5wjVHxprk0BO32qkiBK38F0wUcTRnu5QGuwHuj1ipgGlOLyIDxFN94rVbab88JkEmrVgrmF5CjL
	JvP5eM/BFhnnY2U7b7/rEHR+r5nPefkhc8XosC4RkRWTLyMggSlGNCmlp9NURsSBdvASbRTw4Ya
	1fwushxP23uFCdqk+657yjy5zL5sQMjHzHWnq490tYiRK4Fq0JEQrrUhGFP3SS002NNWEurKBrC
	bK40WMIAE5S5Mb6UifqRS+2QF0zCuF6KxKxg==
X-Received: by 2002:a17:903:94b:b0:2d5:2f49:b3f4 with SMTP id d9443c01a7336-2ddb1ac1c03mr132240365ad.2.1789971629726;
        Sun, 20 Sep 2026 23:20:29 -0700 (PDT)
X-Received: by 2002:a17:903:94b:b0:2d5:2f49:b3f4 with SMTP id d9443c01a7336-2ddb1ac1c03mr132240005ad.2.1789971629268;
        Sun, 20 Sep 2026 23:20:29 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33c331d3f2csm14091444eec.28.2026.09.20.23.20.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 23:20:28 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Mon, 21 Sep 2026 11:49:39 +0530
Subject: [PATCH 06/11] arm64: dts: qcom: ipq5424: Wire up USB3 PHY PIPE
 clock to GCC
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260921-ipq_clk_changes-v1-6-d242e3d49648@oss.qualcomm.com>
References: <20260921-ipq_clk_changes-v1-0-d242e3d49648@oss.qualcomm.com>
In-Reply-To: <20260921-ipq_clk_changes-v1-0-d242e3d49648@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Georgi Djakov <djakov@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Varadarajan Narayanan <quic_varada@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Gokul Sriram Palanisamy <quic_gokulsri@quicinc.com>,
        Sricharan Ramabadhran <quic_srichara@quicinc.com>,
        Kathiravan T <quic_kathirav@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        stable@vger.kernel.org
X-Mailer: b4 0.15.2
X-Authority-Analysis: v=2.4 cv=Ytia1IYX c=1 sm=1 tr=0 ts=6ab0ccae cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=0BHkJw7pG0aoMaekWq8A:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: X3LvrN2Ad7ELWIp4J7ZAck6IEJHyMHRz
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDA4OSBTYWx0ZWRfXzJwJ5wndq8CS
 Ebgfal0Eg/pFN/Bl+NzNAOD9uQwJPPXYAqxtu/Z/ShKnqewYcaGXZ1VaF+4nAlMnsL7O3GtoRKt
 YqXcibalQnhROIoONP049LGQXAs3J1k=
X-Proofpoint-GUID: X3LvrN2Ad7ELWIp4J7ZAck6IEJHyMHRz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDA4OSBTYWx0ZWRfXwFPwmMJDIHHG
 /eMFvfSFhz5uSeLYu1oZpJ1xFAOIFviXFk1uwfZ/P01B237TpLGBhq2ykpNXM8nR0Z2mI9nkBey
 eE2Yu51nfm0iXBSc4dMW0KGrT8seUFmntqcHiCY1o70iCJkAZqCWEwtUvICcdKda6HO+Y2UhLGC
 IpAZHkWvyAQ670JXn0fryp6ihLNoWjzoq7e4XjKBgIS/PSbFt5nXPJ7c/o4qAweDYDd0ygYdJC3
 K3kt0KsghJs6/9e9x6w4uThnbn6mqb9cBcHU9VpTWajJNNbrQjvJu6elp9aUK2z5A1Gy7K8uUnt
 c0WDltuEakoevvdClmIl/i8Wg6cDO8F26jFWRIGvf8on8Jme5+60WYSL8Cm3aEAGGlH9Gti5M1Z
 wZDaGdL+PqYn/MTyxravS04o20ulaJ9Ki0NK0tabohOhx/dHVNs4md9RLAS8Z8cap1P80agXTH2
 7h+cCPPCdFwSa+1jtQw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_02,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0 bulkscore=0
 clxscore=1015 impostorscore=0 malwarescore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609210089

Connect the QMP PHY USB3 output to GCC so the USB3 PHY pipe clock
can propagate to the USB controller.

Cc: stable@vger.kernel.org
Fixes: 113d52bdc820 ("arm64: dts: qcom: ipq5424: Add USB controller and phy nodes")
Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/ipq5424.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/ipq5424.dtsi b/arch/arm64/boot/dts/qcom/ipq5424.dtsi
index 702061e16a58..95e2508ac145 100644
--- a/arch/arm64/boot/dts/qcom/ipq5424.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq5424.dtsi
@@ -486,7 +486,7 @@ gcc: clock-controller@1800000 {
 				 <&pcie1_phy>,
 				 <&pcie2_phy>,
 				 <&pcie3_phy>,
-				 <0>;
+				 <&ssphy_0>;
 			#clock-cells = <1>;
 			#reset-cells = <1>;
 			#interconnect-cells = <1>;

-- 
2.34.1

