Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70728442100
	for <devicetree@vger.kernel.org>; Mon,  6 Jul 2026 10:18:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783333085; cv=none; b=Zm6YehZNI+XIEIADnmOnOnNqTzL3WRDmyRo37DX0EoFH5jPVvYnp/QiGRyI/QuFE6wrRPWGo+JAZ5BzMQUHklxmPCoB8/EyIm8lvYZviyNqfFSm8C/uJYtfCwhx9DtwPFtrhxUcHngVTvfbHqc21CWaRbcbwsIxAHn8Hj9ds5sY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783333085; c=relaxed/simple;
	bh=wEZxFzfOdORenc2tso655jPsA2uN7AtraSxKNfd4i3E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JKYyCYgmTE2vQ6XomFtrph3xuUUB4fl6aEFV06uTpkee6yak86JOmJHrreSGq5cDG6WRo6QPWjG0o+9K6Dpaxzfo4CH00esPnvZlnTJACPzq81Gl0E/Qe/9sIRpO5UJQENwa8Z2dKybkWSxPvtOUqF/HwSbn3qQiNZL6UOFS5kQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=A43MqP1B; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=g7XrjJg6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="A43MqP1B";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="g7XrjJg6"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6669pAFn250607
	for <devicetree@vger.kernel.org>; Mon, 6 Jul 2026 10:18:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=MAabmaOne1IQZuI2g48uowV5XLIoLFCGQrP
	uaubBB6c=; b=A43MqP1Bii67L/MrbLQjkTqRtD9yjluxdPftyu6/YYK+trzpg69
	lViFy5SeT5ToNIn9/Dv0whRXpBQwvBf7RR0wNqwQB5QotTttqe0qwzthYgRzhkoS
	ekNTBWbjrORprwmJRpxKmX2m9YFaGjtu+nZbfYL78uFrWlVBTllN7efnJnmiVgXf
	sRErlg5HhcnoActqb7JvUrkuNdM6jsYsBnlOnwduyg+EoC/hHFwn6H38eZyTKm3H
	y0u5bCzfvygLzmNFwHoD9JDAoOPjbXRMp8aCj3Tgq2iJAr5+bjlPbNhaeN+c0W5A
	pK3L3CJ85nJiSHoTV8JFo/9OBhhkQ351vnQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8a3gr3e6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 10:18:03 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92e820609d9so203134785a.2
        for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 03:18:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783333083; x=1783937883; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MAabmaOne1IQZuI2g48uowV5XLIoLFCGQrPuaubBB6c=;
        b=g7XrjJg69ANpfXqB7myECzcqyRLP4DJbANyy537M8vHO11rf+AzzoFIzxkzYYfKf1s
         /haT9lWT1BQ778oSwJTir3h4N/oQN+xKFjvssjxx5xT7g0l0pcsLqPE8IrnjYrb4YGJa
         8SKP0jjOvwUAz/uU22FD6egDOzDAN7ItoKPR7kMHGtfrQeDC0MVXAdH1eimQkBOL/Rcc
         m6cu5z7ozHuFnRSRrSOl5vDUJhEw13mZlHEG6PT9C9PeKRNM0betX4AVtu5mrAYSbNEl
         9HUiC1vcRDjd9m9OEw8eWki/Mi6Bo/87mJ2g4m6DqqvUlziWngp4ERzl3LhMA/ud8XK4
         LuqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783333083; x=1783937883;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MAabmaOne1IQZuI2g48uowV5XLIoLFCGQrPuaubBB6c=;
        b=NcFGK4YGoow4BGi2K2RBDRYgV+n1mfhw3mJ8DR0AAzFLO9IvnJPSsmg9a3R/G66thI
         EWCcXiJTusEGJOhGkrrn/mv/HBmh4GfnJ8eGnwVuvNP6Ibg2wPvkWHOMU5s1Xqmq49f4
         c31ZxRHgYtrFbt21WA4l8+g1KWNg2Qv0swmQhFbH8hHFfLwUDTZQKxkoep0RcS70bLhv
         kz2eHemFCTeEDhFZV1bf5mCR56fQbXnVHknFsPG+2Mhcejw/r/wEVzISG20xUYXVgFQA
         Zu/psRrzIlhtj5ucsMm9eYtyfgTvwB/e8SLk1FqTZbkuHYumcEQ30kAqDsAF1/YFlRfF
         B6MQ==
X-Forwarded-Encrypted: i=1; AHgh+RpkFE6Hct7FQZ5Nj3j23AR6zlxUjx3l8fvezT5Hx9RevGZlvoS/nZnuMCE8wpW3V4tegOw8A2LdmIa2@vger.kernel.org
X-Gm-Message-State: AOJu0Yxq1ml+pIbK80RlopuPrSnsJs3KYLjd5AiGmJRzStbBq/eq/m71
	0vaol3FJeEnh66v8r6FRZwlzLM1+z/3Gga7Kj44nbYNemw5vBL2/9NvzxBag6ck3jVl4/VEGcjI
	VfNMpuLnmyix4T21cWdR1xrty/OA7OdQQgengzZWpHIevxEzGLsOB6LA6GIuL2mYc
X-Gm-Gg: AfdE7cktWxSuR7Z0yWni8IUdKfyTOqH5rTigwnw8EIRFHArS7g5mKqtMAT1/C530398
	ffGkuGuRwAbmJG/KWq80JrZBqmHCr6mgQoPOTTQ5TlWosuFvIjoCTSIvTkBVBTsmhfxELoo/wfk
	qY5uzlFiH/CDmyBoG/SI03fI9xRAxvbLeC/N8NTW9GlHdYbFQQkhA+wkXVVQf9b6Jo9HKrsrGIU
	lidPXE4e/EqCgysZpJtTUtVD6jYuSA4WC5DHyjkrriBx/oPIAjk4BMf0UCOHcmm1/ZB4ohM8YOr
	MzupPFdM8uCxLSSyvFcvw46nEoRKvkBsxelVYhGIcV+ZEOp8jO+U7xFRPEoT8ICHVbU3CAg+kHZ
	iIlWNqvx2ntW6vL32ns90/pkRkDs=
X-Received: by 2002:a05:620a:4115:b0:92e:71bb:d1c0 with SMTP id af79cd13be357-92e9a3447fdmr1369297985a.15.1783333082772;
        Mon, 06 Jul 2026 03:18:02 -0700 (PDT)
X-Received: by 2002:a05:620a:4115:b0:92e:71bb:d1c0 with SMTP id af79cd13be357-92e9a3447fdmr1369294785a.15.1783333082237;
        Mon, 06 Jul 2026 03:18:02 -0700 (PDT)
Received: from quoll ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa09608d4sm24579558f8f.25.2026.07.06.03.18.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 03:18:01 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Thierry Reding <thierry.reding@kernel.org>,
        Jonathan Hunter <jonathanh@nvidia.com>, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH] ARM: dts: nvidia: tegra114-asus-tf701t: Correct trailing whitespace
Date: Mon,  6 Jul 2026 12:17:58 +0200
Message-ID: <20260706101757.340149-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=844; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=wEZxFzfOdORenc2tso655jPsA2uN7AtraSxKNfd4i3E=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqS4DVioZ7v8bMLwiSgrxj3rjQNh/7ub1IcpWES
 jfotTRUMSCJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCakuA1QAKCRDBN2bmhouD
 18aTD/wLQspJgy/98ONkyLrE0Q67FcG/7ibLVzkMw4C6lnoTGeHYRhV0Aip7GtPoKz5vhvU7+JM
 aVR9Z1fq7EzYfa/4S/fZv9olQRpZhgeqRpkOMdcZnr0t9QRlt/zdejzEWgTFuJAJZoaE/7NE/EI
 YWb5wwowZiu2F6q7AA+St531Uq1AHHlWqbz232lnOnH0tMrF0KCb1r1RFKG8LV79RqkKUxjn59I
 xtAHrum66H3xRt1r9SJF7IYR1N8Fmva0VZJSS5c80kUZuo/D3xsjENwzcALr2fsnToeHKEq8NAn
 XiIuKzqpVOSPJ2EhFx9jaP+uRxPFBNIF65GsM+yeeQAgNl0SedJyneW+61+AYI9PwvLuUNAhbE+
 R4xmIywI5mI/mR1Gn8UYIvvi7e5zFL27EbBIQzuna0xbQSEjumwNJsYyYoineV+eo7f/o8W7S+Z
 0VMifZTyhEc1YV4IYxqO5D2WTjGlUf4D/+f4h/ZV4quY5GNaSlQNIeG7JBOfb4TdVa37+J+d6u2
 TmVAquOrNS6spdRif+sBOWYPcpCENHHEKtCcoKMNzX/18yhdYHXDWNLoVAusndGLrzqODeGRwPa
 DdjfEX70sUyRM7zCXSBXH4nPYMLuUdudctfRgcMZcI1zfkU2YDqjmUg7gOjmHXL+X4iZRJVrEJK OKDph4SjuOdVThA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 3uvO0hcsG71csugVdD2zDWRTTbFOWExV
X-Proofpoint-ORIG-GUID: 3uvO0hcsG71csugVdD2zDWRTTbFOWExV
X-Authority-Analysis: v=2.4 cv=CPYamxrD c=1 sm=1 tr=0 ts=6a4b80db cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=mzNmfwoBUIZJ0yLm2cUA:9 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDEwNCBTYWx0ZWRfX9p3R3Dqk94U/
 qn0QJSbWRBSokn63I4Tj4zbYtkRHnA5tRtPX2n/+E9I6dgDO22+W7afTZKAf5u6vpcghLNFMhuK
 YyWSXoz7REhU6D5c0tHb4EGIRKPmPEXS1M6rdjZTASqCk+owKLl+6IHxmmBIAP98//x6+CYY8gJ
 QfXL2R2moiCO2je4QvQ6HkuStvxjH2BWLwLjDZIndQwam620CJ41EX6X03UruQ12prdahJYwNzk
 5cB2XdfKCGfz2JR5LIj3hqgIO6RWMMsepC6JpPH9b4jDriRL6NsbIT4VWwO3JZN137RUJp/1qEe
 YtMINUNjBWxTK7j1kVCTZdagX318lPdze0oF7hs50U46tZzTgHUcQJzPhw9GbiXB3YPCGFBcNVJ
 Rl4JLHOfNXlNFW4J7sS3tCXDdr7E6ymPvUyy0jvb0+tFcmNRItlFkWi4kUnLJlzUaIVZT23bs1B
 272taLCfTsj+exY4DAA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDEwNCBTYWx0ZWRfX18YRQ7N2oFH4
 J5sRFXUieaueK8DrQ0SaIcYswfr7FSTQ735GoF6fAqs6jnDTn3p5QqGqtEgtZuwnHUOXQiS8f5a
 FvkjXyAnScCmqBbf1Fb2QLafi/13/C4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-06_01,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 malwarescore=0 phishscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060104

Drop trailing whitespace.  No functional impact (same DTB).

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

Ongoing bigger work for all bindings and DTS with built-in checker (dt-check-style).
---
 arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dts b/arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dts
index f02e2cf65fe8..e563beaa2bb1 100644
--- a/arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dts
+++ b/arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dts
@@ -386,7 +386,7 @@ cam-i2c {
 				nvidia,open-drain = <TEGRA_PIN_ENABLE>;
 				nvidia,lock = <TEGRA_PIN_DISABLE>;
 			};
-			
+
 			ddc-i2c {
 				nvidia,pins = "ddc_scl_pv4",
 					      "ddc_sda_pv5";
-- 
2.53.0

