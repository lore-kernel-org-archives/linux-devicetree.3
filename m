Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDD7E3E1D01
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 10:40:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782729645; cv=none; b=Y6YOme6hgRCuNQC52rjwKUJFTzl7pyss6WkbxLvDvEpW3eHZhCX+GsqcuN6gEzWyYStCM5n1V4X3lUdu5OQo4JSJJ0TMeexI1bB09CqaAjcIPxgrdPvsO3BffFMZmGDvA+CVcxjGa7RNU9CWTmUvx3FnApinIKidMCoibjQgN48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782729645; c=relaxed/simple;
	bh=v7GJK9TIu9yr3dF5vF4jQAR563uwmKoRa3pjANQ2RmU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gnWMp8DpDuUJ0axlkQR3aYaenAnLL+HqhEkTIgpvqE9OuA0TDWhlnLGApi9IzCB0MpIJpY3EN7M/BaEvpAQEDpzPHpHPVHemEeu0RWypEqGVb473KaH0IPFMaj/pcqfkGg45UmzuhgB4DHC0x8kR6M84vmwPS++oWxfWJ8Fvt6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=drs+7ALu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=H6IoSq0b; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="drs+7ALu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="H6IoSq0b"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65TASuTj2640837
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 10:40:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	V3hiSM8FxtWrf5QqJf/JCZffCi9CGJEKZUikvpPr/UQ=; b=drs+7ALueo4Ha5Jd
	Lsg5ifXC2AsOb648GprmTlVmQXsWJ99Ov5Cl1Ta7xk2/UDuRtsCMSxM0LgaZBHF5
	qllt9wMKsdlXIbRKY2GnDjgL/l81M/b1nQ/gFcr0FZqYbCm9Z0Zbi/5HSYt6bzU3
	vbSCMKzXn3FDpUxZxwz/2FxX5HTMND05h8NW9Xcm6hXRWoQVUoCc/2JhI4xMVg6d
	viJHvMSUh8dWnSXWis3oVFtbzcYo+4qBqDej9KGtoxXlBC5gnQ9MSheQR5oZRoP5
	SqyZjEgzHJlc/BR5LuRTGnEd69PNqfCNd60LiZk/fbBJiXC6MVZmwtV669fLTo5p
	PvvMPg==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3n5s0jmw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 10:40:42 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-139ca26403fso1345049c88.1
        for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 03:40:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782729642; x=1783334442; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V3hiSM8FxtWrf5QqJf/JCZffCi9CGJEKZUikvpPr/UQ=;
        b=H6IoSq0bsTZjIAfAinpWThzJGVfG8mwPJ0cyP+T8rqaGIFrDozG3zCUJ5I6Mbh8v7U
         ugNMkQ2M6Cx7s0qYSXTqApoVGge7Ao1j8gQyPMPdcEokEHJeOHNnnlDbXOxkhmDpBeOz
         /P/znO0GdfppDr25r68XSRV5r/hLd92Wcj8zQgNsAHjorikv5Sboo5PFDJh6uAxWeN+R
         /NzZYoV9NRTshk1HWkf+ON2LHYVccgce33hRlS6KvwQXIXjsDAebOYo+bdpUken4f4uQ
         xy6ayXD95BVB8oZH7kSLuGR/QZ15/RpNh+G+M+eCtUOVkvfTJKGSBqtTAJCwHphAjEbk
         0fxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782729642; x=1783334442;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=V3hiSM8FxtWrf5QqJf/JCZffCi9CGJEKZUikvpPr/UQ=;
        b=WbGQpTU7X8XfGothhRVb6ZvqCNOuFua41S49D+0bn96m5oZbGaRfhWOe2AQYUku0wh
         KesYrwVEJkZFp90AUaQ8rRDBuPlIBa0+S4JG3Ul5pohaOf1B2AuGl3o+eaSrxn/fd+Cl
         fgUjPb/I0lZKwvcU8STMtyolqpIn4urwV8+hQCBmKsd81RWkprDs1B55tpj3t30/yy2u
         w2xcV7K0Qt5mTagoupcGOQJ+9zJkfLs/3V5Ms7NTV6z5WJH5AsYZwhIu3PAIKW4NvD2w
         Xpp1z6j1ZeS0HMtiR8G+B+PM2UbDCQk2EM4G7bCrDNLictTnn9uDgs8LdcPO1MySxsmt
         AP6A==
X-Forwarded-Encrypted: i=1; AFNElJ+d4KjkzRHTUxiA+m3fayv8yLld9g/5tlThtJ/1CB1IvhrnyQi9d4f2U/tbhgClyLihapuxp5OXF72g@vger.kernel.org
X-Gm-Message-State: AOJu0YwjwUgvF2HMxS8V/gXeQ0if4JNBpR0e/ktr9NwtPq81HlMsXdpN
	uVsHyrhQ9D58wb/Gv4XHIJmEtij/dHaFpGCEhWq1nhzH9ZNwzKeWQsACgvcG9f925fKQN8OEXD1
	bRvslSI/GgODkqbeujQR6xCL0CK4n8yEPyhgkEFEDuBxv3MkTQSLezGjavf2cag4IPW5o9Dnr
X-Gm-Gg: AfdE7cni1KawI5N0CbipIiWGE7yvTeSCYOdN50CRjTTdGM0anEHAexkcLwCIjLByib0
	iB9Otg9ogfpMd0L/MbJYA8MLKG87nhITK3/fd6Mx7rB8dBITZLhP8ZyAjcve8kfQkvnMNHYsf4B
	MwokCDmIToyz5askxWYA6RICA9h8/mO5/zdhn+h9W+xZ/ChQSGJBH6L1yuFvhUOfrHaEW3X1WdI
	tpzXy96zLF+l6qgUYdJEQLq5CMuf0zKPMtVGK8BHLPV9KSe5IVlMi/KmGS4T+T0thg5KorhavVt
	O95pR/RAqHOb94YgPa5r2vJtK5AlRQ/IvTgASQ6SBCiqD0GT9n7J5lBDtWZwWuKCZn5sEQkrST8
	R7f5Fprvr7A8VYrlZRbvYyNTL7itpRnftbKuHu08vM9IsiV4SwlUgrcqphGTiQkXDNLEMJ2Nbed
	aE0T7qbYMyglSr9WAYQRlQoWI=
X-Received: by 2002:a05:7023:b0c:b0:138:14dd:16ba with SMTP id a92af1059eb24-13b22714f85mr110565c88.38.1782729642290;
        Mon, 29 Jun 2026 03:40:42 -0700 (PDT)
X-Received: by 2002:a05:7023:b0c:b0:138:14dd:16ba with SMTP id a92af1059eb24-13b22714f85mr110539c88.38.1782729641785;
        Mon, 29 Jun 2026 03:40:41 -0700 (PDT)
Received: from hu-ajainp-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-139eac62642sm25413085c88.10.2026.06.29.03.40.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 03:40:41 -0700 (PDT)
From: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 16:10:18 +0530
Subject: [PATCH 2/2] arm64: dts: qcom: purwa-iot-evk: Add Embedded
 controller node
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260629-ec_support_for_purwa_evk-v1-2-e082b70138d6@oss.qualcomm.com>
References: <20260629-ec_support_for_purwa_evk-v1-0-e082b70138d6@oss.qualcomm.com>
In-Reply-To: <20260629-ec_support_for_purwa_evk-v1-0-e082b70138d6@oss.qualcomm.com>
To: Sibi Sankar <sibi.sankar@oss.qualcomm.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Anvesh Jain P <anvesh.p@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782729630; l=1264;
 i=anvesh.p@oss.qualcomm.com; s=20260313; h=from:subject:message-id;
 bh=v7GJK9TIu9yr3dF5vF4jQAR563uwmKoRa3pjANQ2RmU=;
 b=JePb+JTSZVweQe4J3f9mxF9F1NTcoU1qKfY8gYtpf5DPNRhk3X+D6lEdfrIyJbf9cQTTXdg9n
 x4M7MrneXkOCnaqtWlkuaDAY21IgUBRk619eVBCApUQ65JYEG+TySqJ
X-Developer-Key: i=anvesh.p@oss.qualcomm.com; a=ed25519;
 pk=8o9EG7gkPe2Er9y9UVCx8MTdcFCwU8Pa54hBZPuduXE=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDA4NiBTYWx0ZWRfX09bG5l4WEVUd
 etOe2bUuG7NR5Y03eJASKDmSKifaITEhWiAoysO1K07FisTUDvhEFBJN3X/abt1SqVYy0vpbCAD
 d7C0ce9olkZfpzCbhkbtOSLW+79QVZ8=
X-Proofpoint-ORIG-GUID: Qa_SHWjZXwQFN7cxb2FwzkoIUdUxSc2N
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDA4NiBTYWx0ZWRfX8NexwiN+P81A
 TWIFiMTZe1NJ1+4dLGokeAJdB257SYr8cCX0eZn0kTPwZ2+7vG1SXDM3uHzWVpF5hM3++e0OBrb
 0C9HehFGP9/rUWUUm/kW6ct1Q4INoMsbxWqKJIKODSXlZ0t1WNxeZw9e2JMPzq7pOQwYd8qqgSt
 mWSbBFeWw5mm7/aF4qMl7pfiAzGHw7UROzOY4ANwbVM8qOdZiSZF8KuJF3sodthoD2NVmkfSkBp
 trg6cyKWxNc77THdeqP0FrKNbaRqh2TCJJXjxSRoT32AxLDJXNtJqQTH8PlSf++IBy4rezbY9nx
 lZWL0KBeWf3Edy0lXwzRH2tpiPUPK2XLe7K16QqiAMvfijK8qNLUl/Squ2sxJcb9JodN/PGGBRC
 xmWZ6+d/bgl/KQ0haFhlRmafIQLMWrgaWLFnoRR0k2tYkh3n0vUNbvGkd70dCoX70/hki30Kskl
 dG2mAMFz3oxIRIFZ+6w==
X-Authority-Analysis: v=2.4 cv=NZzWEWD4 c=1 sm=1 tr=0 ts=6a424baa cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=um1wo07bdbQtbc5qrgwA:9 a=QEXdDO2ut3YA:10
 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-GUID: Qa_SHWjZXwQFN7cxb2FwzkoIUdUxSc2N
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 spamscore=0 adultscore=0 suspectscore=0
 clxscore=1015 bulkscore=0 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606290086

Add embedded controller node for Purwa IOT EVK boards which adds fan
control, temperature sensors, access to EC internal state changes and
suspend entry/exit notifications to the EC.

Signed-off-by: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/purwa-iot-evk.dts | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/purwa-iot-evk.dts b/arch/arm64/boot/dts/qcom/purwa-iot-evk.dts
index ad503beec1d3..491ea7769cd7 100644
--- a/arch/arm64/boot/dts/qcom/purwa-iot-evk.dts
+++ b/arch/arm64/boot/dts/qcom/purwa-iot-evk.dts
@@ -837,6 +837,16 @@ eusb6_repeater: redriver@4f {
 		pinctrl-0 = <&eusb6_reset_n>;
 		pinctrl-names = "default";
 	};
+
+	embedded-controller@76 {
+		compatible = "qcom,purwa-iot-evk-ec", "qcom,hamoa-crd-ec";
+		reg = <0x76>;
+
+		interrupts-extended = <&tlmm 66 IRQ_TYPE_EDGE_FALLING>;
+
+		pinctrl-0 = <&ec_int_n_default>;
+		pinctrl-names = "default";
+	};
 };
 
 &i2c7 {
@@ -1326,6 +1336,12 @@ right_tweeter: speaker@0,1 {
 };
 
 &tlmm {
+	ec_int_n_default: ec-int-n-state {
+		pins = "gpio66";
+		function = "gpio";
+		bias-disable;
+	};
+
 	edp_reg_en: edp-reg-en-state {
 		pins = "gpio70";
 		function = "gpio";

-- 
2.34.1

