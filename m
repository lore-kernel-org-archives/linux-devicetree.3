Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E31E4437845
	for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 06:50:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789109422; cv=none; b=GwJa8r5bDcOZ5IcR2gnnbEFMueyx4rqfj6SJbyA+iJ2E8faffRC1AZB+pLek2wnTofbl6b63dip99YOYQI4Xkd3c2MEZWKhBnRCv3BIPpPwZbZVx/loE9A2ER67wxGpO1Q3fhkFnxFxgFtt/LLUYfLOvX9ljuE50bipTxFukFDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789109422; c=relaxed/simple;
	bh=NULX+1XQ77Td2Q136fRdbK92n4Z0ZUyf9pgBdD0Rtt8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Z1xnATs5epqF3M3ldn6KIrnou65fB/GoQwvPUVoblSkpE1cHzOW5i4ObiZvynkCgPCyJCtCHqbg1UnPzbgyOX7XupJVuj9fqtJr83yhM+V5Rpwoy30yYrnGgEUoxfL7r2OtipRVM5tjYACVIGUy2xrfHAOQE82B2Y6CWAtZE7QY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RyTVJYvg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QYaxGmwV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RyTVJYvg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QYaxGmwV"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68B6kQ453229952
	for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 06:50:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Vy8W88a0VFCDOKzf5fdSGU
	EkZyr8c6w9FqVojwlSvyg=; b=RyTVJYvgNaP9TQnU2jx4rRFTahQJ+lJh7KGjCg
	POrFUJS2IofoC5bGLyHEXmTJKQ665HSpv0nkpldKD4uWyfCYpGxjg1GQnGQSLO1P
	h08aUfXSl9grwP8OEIIFQ/XxhMsHzzmiGXHvWgGaIFL2+su+gEYeuLObmBG56637
	J7U8fjlvhqx4EFF/elHGTv5XqKHHf4SVCQvSffmLVskOWC87E9DQIe0vvk0+C4ZA
	IJT2E0waX3YZKCLQNamaq/BmiVR7QKb2hCu3TcpbT8jT20Tp54FuDI8ocJsQ6hl5
	29+aky/MSteXlcJltPwlvgseIQ844vSORAhtECzsE+s9xjjA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gm1k2afhd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 06:50:11 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-398fe469aa0so1041126a91.2
        for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 23:50:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789109411; x=1789714211; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Vy8W88a0VFCDOKzf5fdSGUEkZyr8c6w9FqVojwlSvyg=;
        b=QYaxGmwViShU3UqzxJwUgxCADN0scml3Pnh1PH+QKfwv5m7h38QK98+bu0P5tCTl27
         CatxsBdKb2Klk+EeORH0hdrJT+BGh6KTwkLD1TI4zt0INgEhH+JsLIVcgQv8yuXo98Hq
         v1NCZey6cOx7QoRFzvmEQGtBxsqfCpAVPx6tvwU4n9X/2eYIlRe+VCggQ+HIY+bZP1cp
         Xkn3BWb8Mag+fiR/3uADDIorXhu45yddsauTuFwfcad+GAfycnfRm2MbzjT9vopAVgbR
         QCPY0uEwE58MOAasLE2IUmmQQa/NhuvhwzRfRbJc81AOLkQTmdHCb+eB9rWBU1nTRTY3
         SItw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789109411; x=1789714211;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Vy8W88a0VFCDOKzf5fdSGUEkZyr8c6w9FqVojwlSvyg=;
        b=b5pHah4594pdRSB/RxjX9YE/rtqsINU6t8XLjTY5MYJmO4KA2FH8UfJfhVd1GwvZpq
         4P90lHY4G8iLc6YclRh6cG96DcFLrUZ8ZXTnxjGbM/EdyD9EwWT2V19XEFm0SucUlx/G
         DohVDbbDfU6aTHD6B1Wc1RJMMnQ99MCiVOhPKZrKGEenLHca88zE6h6OxE3p0uvgcPaH
         NDwELu7o+ZTq//8HqitvCAuzFctQzuDQ5FO7uPkxnDegxok918kWzUlDmskGHeH5RLWn
         KbT+WuKMUbbT2HaojHtnBf6AT2KtI8CQkkeG62LwzhG/rXwmhrsBkwRWdioH7eA+ugjm
         ztPA==
X-Forwarded-Encrypted: i=1; AKwUvBzF6X6IhLjVvd8J4sBbTQTUAxaRdGQ4/98+EGZBuW9oVv2XHanswqTkMhITnNRKl79J6QhQ4A6zXy2K@vger.kernel.org
X-Gm-Message-State: AFuF++nhXT9jzgDbYQ3CCypUg7BZoGK+BL9X//3lRC1T4I5mNHOutv5a
	KEGNGRfJOQcTjySOl8oNWvCMBd+/uY1Sp9qVYEe5cAB/P4QeTGSFFWuQVuB1T/fakhfB3y30XvV
	XVgVeMxRJgwZeMycwOZHrQPFBHmVT2C4IjlGjhIr51wOen5erjTvbuyyeN+Fnkwbz
X-Gm-Gg: AYBFou0EGcqFSOjGAz0bXb5BwUQLTha2GqoyjamvbfmjGBhAsItdZUfusyNhV6Ke0ea
	R+O3q3Z5hPvmOanX+JanTEO4THrpmLosK/2uTxoO1fTRq3thXdSy1FPZZc9uKd5ku92M44F3NwV
	jM8jvdn168Sc1DDYCL3GdKDvTyUb+tAdMZDYitcEzyCjGKiSk8Ge996eGgcZQXTGT0gx893v8Rs
	G7d3rTrlhjYeoD3CoXpJ8E+P5bI9nPCQY4q3Ju7o2zzyXyr+OhG8fp3HgiVGh2gWJuTxjHLswME
	jboAhT4yeQjhoUhfAhw/1wMxOJ0RVKrL4zZGrLpzsnr34mdjzqRe9cgsysmI91NdyL0tByJrOdS
	MtMVDlAZlSbeLUYp4Z4DeE5o1+FrZhWs2wIU=
X-Received: by 2002:a17:90b:4a03:b0:39d:84af:a0b3 with SMTP id 98e67ed59e1d1-39d9c3651damr4461821a91.18.1789109410603;
        Thu, 10 Sep 2026 23:50:10 -0700 (PDT)
X-Received: by 2002:a17:90b:4a03:b0:39d:84af:a0b3 with SMTP id 98e67ed59e1d1-39d9c3651damr4461779a91.18.1789109410130;
        Thu, 10 Sep 2026 23:50:10 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14365a598aasm3934383c88.1.2026.09.10.23.50.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 23:50:09 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Subject: [PATCH 0/8] arm64: dts: qcom: Add t-power-on-us property for PCIe
 root ports
Date: Fri, 11 Sep 2026 12:20:01 +0530
Message-Id: <20260911-t_pwr_on-v1-0-c9eee197d082@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJqko2oC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDS0ND3ZL4gvKi+Pw8XQMzyzQTU5PUpCQjYyWg8oKi1LTMCrBR0bEQfnF
 pUlZqcglIv1JtLQDvSkYIbAAAAA==
X-Change-ID: 20260911-t_pwr_on-069f454ebb23
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, mani@kernel.org,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789109406; l=2349;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=NULX+1XQ77Td2Q136fRdbK92n4Z0ZUyf9pgBdD0Rtt8=;
 b=vW/t6Rf8jXGiwujgNIFVkbYVxLDdRbkpjW8gE2Ou+mXJwxyD8TaJsIaDcs1edBXzHxgvHbYe9
 LPnO4SE24I1CyahCOVRjVt6dpDfZ89AKTQJu7HA6kXFvnD9OMfWCRin
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Authority-Analysis: v=2.4 cv=cM11IVeN c=1 sm=1 tr=0 ts=6aa3a4a3 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Fm6EAR0vVewXWd2bb8wA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: tAVUBrsNq5jZDGvvZCO-5FRx1sKRIBjD
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDA5MyBTYWx0ZWRfXzwqiVEa+2gmw
 MXkhgXB7U11TEblCi7lOc7xHpvjVVL5Ki2I5CNdWLXWX0Esn/ULCUakg3n1nEb/S61OaekZlMLT
 bsBtNMwdjU8NYszZaKbMrQU165vC/QY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDA5MyBTYWx0ZWRfX+Mepm1bVeKQW
 icpM3RMD6rCZAaDEyJeSOrn9Up5bnibVsa6/9l7M/YagTK9Ic0+XedTPAhXhTdPMvcDvigeOCG0
 GJk+t9IY/Rj/eYD+X8a1Ov9IRkl5UHuuCHTX5KnIVT5MO8Fiz/h/MZ667MhZzksVnvsytbCxLEj
 gJLJBNoFl4a2o5aHUEp3pNa1rv9kCzAv3hXPrL7Nrt/1h9i4MA8MB7MEqRHoV0/+OLVQ4/LzLJR
 LHzwWA+F0UFB/TibsxxCkuOuzBkKmsPnE/T9/Af2RKmUfmjoieli8+k9HrWklLqtbZ7pNa5A3zh
 kSNUqLLOuTIpxuPQQqVI3Mjx0yp/ueuypKmCu3bdPiSM+P2Gi3kZ/Co7jIaDAYeRWJOPfgvlyhc
 Uw5k9/UjqEDKn0g9o5LkMu0BwgnkChdKwcDs07iMOE90ISB37hjIT0rGbMzZUdP41bmtlib568O
 ZFjJKpovTttyunUkyQA==
X-Proofpoint-ORIG-GUID: tAVUBrsNq5jZDGvvZCO-5FRx1sKRIBjD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_02,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0 bulkscore=0
 priorityscore=1501 impostorscore=0 malwarescore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609110093

The Qualcomm PCIe host controller driver added support for parsing the
-power-on-us property[1] from each Root Port node and programming it as
art of host initialization (PCI: qcom: Program T_POWER_ON) [2]. Prior to
this, T_POWER_ON was expected to be programmed correctly in hardware or
by the bootloader, but not all targets support this, which can lead to an
incorrectly calculated LTR_L1.2_THRESHOLD in aspm.c and improper L1.2 exit
behavior.

This series adds the t-power-on-us = <80>; property to the PCIe root
port node(s) on the following targets, so the controller programs the
correct T_POWER_ON value instead of relying on the (currently incorrect)
hardware default:

- kodiak
- lemans
- monaco
- hamoa
- glymur
- talos
- sm8750
- kaanapali

[1] https://lore.kernel.org/all/20260205093346.667898-1-krishna.chundru@oss.qualcomm.com/
[2] https://lore.kernel.org/all/20260428-t_power_on_fux-v5-0-f1ef926a91ff@oss.qualcomm.com/

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
Krishna Chaitanya Chundru (8):
      arm64: dts: qcom: kodiak: Add t-power-on-us property for PCIe root ports
      arm64: dts: qcom: lemans: Add t-power-on-us property for PCIe root ports
      arm64: dts: qcom: monaco: Add t-power-on-us property for PCIe root ports
      arm64: dts: qcom: hamoa: Add t-power-on-us property for PCIe root ports
      arm64: dts: qcom: glymur: Add t-power-on-us property for PCIe root ports
      arm64: dts: qcom: talos: Add t-power-on-us property for PCIe root port
      arm64: dts: qcom: sm8750: Add t-power-on-us property for PCIe root port
      arm64: dts: qcom: kaanapali: Add t-power-on-us property for PCIe root port

 arch/arm64/boot/dts/qcom/glymur.dtsi    | 8 ++++++++
 arch/arm64/boot/dts/qcom/hamoa.dtsi     | 8 ++++++++
 arch/arm64/boot/dts/qcom/kaanapali.dtsi | 2 ++
 arch/arm64/boot/dts/qcom/kodiak.dtsi    | 4 ++++
 arch/arm64/boot/dts/qcom/lemans.dtsi    | 4 ++++
 arch/arm64/boot/dts/qcom/monaco.dtsi    | 4 ++++
 arch/arm64/boot/dts/qcom/sm8750.dtsi    | 2 ++
 arch/arm64/boot/dts/qcom/talos.dtsi     | 2 ++
 8 files changed, 34 insertions(+)
---
base-commit: 08df884136f1c1197bab2a27814404fd329d9aac
change-id: 20260911-t_pwr_on-069f454ebb23

Best regards,
--  
Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>

