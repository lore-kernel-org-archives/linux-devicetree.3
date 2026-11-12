Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794458346;
	b=K7Y8yaOnhCrT7zhakSA3KWZyGbqVE1iDBRINQmvSSIhpcRBLsTPxc4P1cJujdeh8UDll
	 uGEP/lvCZ5eYsDJ31QjB/aJRA86UuDYDuiOnd7IFVGmzer3I39nsCNK1k9EGmD4hEwfSs
	 96WauC1HE/jZJxotM2smyKHybySeLT7fdfQNqradgHmDCTVrr2NOHkJyuQX7C0lMrmuNf
	 N08FvA6NxmVJ/nk/y+3bc2N86tEQae6i0jy8FeYGVfJZ/w5PFHwJtNHO8k54/l19i6hSd
	 QRxHQgdHF+Zb5Y17HlvkLjI9DDYlG3I1NinFblkPyPXFVdnrYRtXCX7Zujb60UxteZw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794458346;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=dcp9uV7WY67YAfdBK4ioc7eDyML/68Wx1+8UTucN0ko=;
	b=39cNOwgHezl25x5guhfyTZPULVopbxRLgA7ByjKBLyDsTVNw8mgQ3xErzDOIyg1P6OI3
	 p12IOVxR8Mtd300FamyK615b/AGcwp9xnz4T2AQwm596XgjoiNMb8YCV1hWe/+FqTFXEj
	 S7dQDWPpJvm9YW+LCIeBKuNpLJtKvs3Pt0W0Bn9SZR7Nl0Bd/ez2y4AsvO2Ufo+p691Pl
	 KBl8PZYZ3lEjqp4QWJYucvlIL8nLR0CoLr4KRURAUvhwVJYJ6PtnUcq8KlTZ8UyJQ7ANu
	 WWuaZS2zmmpTQ79ls+7+X/r5TWW5TRsKMGWsYbQwQj/NUwc0YXywbXY5yBtr6f6e8JQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=IY++QUlU;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Xv4fJTNc;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D575606A333
	for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 04:39:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9D575606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=IY++QUlU;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Xv4fJTNc
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AC2Zh78903710
	for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 04:39:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=dcp9uV7WY67YAfdBK4ioc7
	eDyML/68Wx1+8UTucN0ko=; b=IY++QUlU5242cBVSG6c9gq50hlGe4Die+hinVJ
	X5Oels/dJ2YDPTJvW6i8TwEAJGMju6JVZEWWzq2YEdvKPg9WE8O43UoYd6JJHux6
	RiMt5N6vZgfOXWcUlH4q6Km60Aq3xJiMwRWg81q40QmTcPXzUji+hkxvx2+NQSUA
	2Ymm4eEx6hkvuUAsvftCyucx72V1Ak1sW1eqYN6YqjafRnKExWpzh9sCOpBKn2nF
	MbV0SLqKpBzaHgwuGRjePjVtIg3rpPRBDuOl5ZmI5AsobuUZ5XdkqyXsIiiAbeAd
	7los3QLILAlC1FNHR3Max3zFicH67HhXfKqw7QmSsyJQcZBA==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvt1uayej-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 04:39:04 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-36efb506f29so911092eec.1
        for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 20:39:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794458344; x=1795063144; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=dcp9uV7WY67YAfdBK4ioc7eDyML/68Wx1+8UTucN0ko=;
        b=Xv4fJTNcWbuffauOtK7MDwn1yuk6CjPWNPdHW/5cDRF6wCoU/FQS9WAoEclW7YyKKe
         242phyw9x0gqgLeYcY941ie3FQGjsCGaBMyMkELQO4HEtOVVw0KM4QXFk3U6BQ2sCTsZ
         O2UXcIyfqVHXAVdMNXd06KumDaPQC3e1eUd8DCb3cwFeLX2uOW91vNhX7Smn7ILa2t8p
         TXIR88CDRkbG1yYxHcF0lWG0Dk4Dv3fwhAorjnS7U4u0mrqPXkBh3ymYYtrvye4nX9FP
         Oc+g7+GCMMU7Nuo3ALuQdmXtiXqwDNaKZNh7o5+vMAhObpN5+FOMgb2yARjchuF7OixY
         pjJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794458344; x=1795063144;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=dcp9uV7WY67YAfdBK4ioc7eDyML/68Wx1+8UTucN0ko=;
        b=ihp3XwKueoWXKTcmjJSN695+wwZmgAf4V5lDN+sH0oMYSTBqgnIkQrhXsjnecYXvsS
         vk68YvSTtrHQ0VCmKVLtiGSj5/Tk9zukqo0XBcO68w9KzkcN2YtvI7kU33xgtmaO3xMj
         ITANYPDjaSsAQTiibSOaQyTmRmd5YRSha/+u0x1Dc9x59OXU3H0/vGuK20fHmfoQro3l
         He0GnayUXX2yHyOh9k+UpI8/Yru5LfiHkgZB7AuOxGl2TUn3pQahldxf9TAJt0Z4T25n
         e9a+GfugJdgibrUHSb3eFEStKAPg42+1KPgLsn4b5Df9HffJx30T40+6a0vfH0t1O7rY
         I71g==
X-Gm-Message-State: APuU4Z/OwE+0LwA3ZdLOcZzZciDaNkFgfZiBaHjFncar2vJasw3t3mZU
	3tpKNrDftN4i3rRx47d1k5GqrEj8qgx9zMCUmbB5gEvfzzA2QXb3i+8k5nS+F2chtC3alQmfFrx
	Zb7VER1Tl4nJ7QZZfwAzpdvnFsb51hBNoJEETey4SHuj0b4WY4bSdbxycUX8Kpszv
X-Gm-Gg: AYBFou3+EZ0rRI5paxsmRgsZcYpjfBQ94dajv7LwZBxyENsbDmN8PPdvL28Ku0xPz9+
	NcPoJFkZk+PP3pzQjSRBHVq40ullgk8QVNzqg2pPGisRd2ztWu1GEWYb/oIn8SLYrYKgxWOG7VH
	RNAOpaUIMA49BdKmTWmmfdi7Jch6medXd8dLrpkhRgjkFF3NdQoIMYs/A5vmW4zFogEKFsck1qF
	USrrz4VVCZL0XLAG59oW6WkW2wx02ae/JJ8EBLIS4u1u5Sa7Hni5fFl4RB0RAGUtW75eq1AmHP5
	0bQT0mp6b++XFRQ/1aMx0gyh28VmjE1M8BytUnkviho37tXKIkP1L0Wgd0WFJOYnK1SAvYZ7v4a
	GvlxmzxakL1uEVGtzpxoOs7EOzQi3Pl/X1bExTwl6jvO8M5M+1z87ibhNZE+2w5qJisz5EC4Wdy
	tHoeQhptzqieF+TzL+kPTNp/CCeCyacU4ZbYdzl2GyYEvUOJgQcB+pRglz7HSpDZpe3g5XQ3VWb
	SKArY3dsCre
X-Received: by 2002:a05:693c:66cb:10b0:36c:b138:651e with SMTP id 5a478bee46e88-3768675fba8mr5074203eec.22.1794458344040;
        Wed, 11 Nov 2026 20:39:04 -0800 (PST)
X-Received: by 2002:a05:693c:66cb:10b0:36c:b138:651e with SMTP id 5a478bee46e88-3768675fba8mr5074181eec.22.1794458343339;
        Wed, 11 Nov 2026 20:39:03 -0800 (PST)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-375212e9e03sm42344790eec.23.2026.11.11.20.38.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 20:39:02 -0800 (PST)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Subject: [PATCH v4 0/2] Add support for reporting boot status on Qualcomm
 IPQ9574 and IPQ5332
Date: Thu, 12 Nov 2026 10:08:55 +0530
Message-Id: <20261112-imem_restart_reason-v4-0-3c7177529526@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIAN9C9WoC/3XPwW7DIAwG4FepOI/KhkJHT3uPaZoINSvTEjaco
 lZV3r0kvfSQXWz9kvl+cRNMJRGLw+YmCtXEKQ8t7F42Ipz88EUyHVsWCpQFp5xMPfWfhXj0ZWz
 bcx4kmmA6Z6Lzxov28rdQTJdFff94ZD533xTGmZovTonHXK5LbcX5bmlAAFxtqChB7l00aB1YQ
 HjLzNu/s/8Jue+3bYi5qKpnSq1TqlEW96CD1VaR/ofSTxSu/7vqRpHtMEZzpNcdrlDTNN0BXp0
 TIGUBAAA=
X-Change-ID: 20260929-imem_restart_reason-15c5b95f9a5a
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDAxOCBTYWx0ZWRfX92xcgLBj2Awh
 QpV4MfZMgYccOfhw2kBVRAjXb+6+hnY/NhBzrzbaD4HAlV3v4ms8Zsu4tqoMFPXBlQFlhhWwcUk
 uGe6bqg8iL+Dkq9qC/jsa6YFfianxGA=
X-Proofpoint-GUID: dO1kd7hZRsYCtRTiCn40XQJVEptxki-i
X-Proofpoint-ORIG-GUID: dO1kd7hZRsYCtRTiCn40XQJVEptxki-i
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDAxOCBTYWx0ZWRfX58u1Yb/+oxbm
 xkdKHdRbPcNP8w4IysJRTvt95fRYzKkOri2ZHceokWQ8neSD++c9iuyECTFOzsxXew738YL1Arq
 Qlc8ndN2P37e9f+/IpG40aFvQ7F25bgdhlTLfrqV+YEx2xqJKcDqZBQlz7cloT7JB1CkdN+mhgS
 CUNwqSM4Ir/QjmU5BKLsL/0JCyg/gU0aCp7x+82F/GbTk0pqMEBb2RLZMEn6JlOBohfC9322vrx
 7vW/eut4F3mXJKp4/R1Tz+tGx9D+7Q1X405L06K9S/dJZoL5XPiMtEgRnpTkL3dy8huzF4fqtw+
 sYK42X2laXyM0nXsT/seliEqCUVzm1o9PXcbsLlNI5pYJs+T0hFm8YA/Zd0eEewGdm2Otosv/0p
 oSio9B5qkE6mzvPh8Q7m5v2BgWZq7xz//M+veLuk/Y7nbkmGE8F+0MWrb6DOhY2cd8A30fw1W2k
 nyU3v42ClBbSE7hZYvw==
X-Authority-Analysis: v=2.4 cv=LvcHWXdc c=1 sm=1 tr=0 ts=6af542e8 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=q8ES6JJDbZgftUInmsIA:9
 a=QEXdDO2ut3YA:10 a=PxkB5W3o20Ba91AHUih5:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 adultscore=0 suspectscore=0 impostorscore=0
 malwarescore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611120018

Similar to IPQ5424, add the IMEM node and the restart-reason child node
on IPQ9574 and IPQ5332 to enable reporting of watchdog boot status.

Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
Changes in v4:
- Rebase on linux-next next-20261111 to fix the conflicts
- Dropped the binding which is applied
- Link to v3: https://patch.msgid.link/20261019-imem_restart_reason-v3-0-e6b1ff5de841@oss.qualcomm.com

Changes in v3:
- Picked the A-b tag
- Squashed 2/5, 3/5 and 4/5, 5/5 into one to match with the schema
  definition
- Link to v2: https://patch.msgid.link/20261002-imem_restart_reason-v2-0-61703c6362e3@oss.qualcomm.com

Changes in v2:
- Placed the compatibles in alphabetical order
- Fixed the unit-address in the restartreason-sram node in 4/5 and 5/5
- Link to v1: https://patch.msgid.link/20261001-imem_restart_reason-v1-0-79f516906010@oss.qualcomm.com

To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>
To: Abel Vesa <abelvesa@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.org

---
Kathiravan Thirumoorthy (2):
      arm64: dts: qcom: ipq9574: add support to get watchdog bootstatus from IMEM
      arm64: dts: qcom: ipq5332: add support to get watchdog bootstatus from IMEM

 arch/arm64/boot/dts/qcom/ipq5332.dtsi | 16 ++++++++++++++++
 arch/arm64/boot/dts/qcom/ipq9574.dtsi | 16 ++++++++++++++++
 2 files changed, 32 insertions(+)
---
base-commit: aaa2f954c21b205a0bcd0961e5b2be4e82e58455
change-id: 20260929-imem_restart_reason-15c5b95f9a5a

Best regards,
--  
Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>

