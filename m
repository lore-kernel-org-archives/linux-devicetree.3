Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52AA2356755
	for <devicetree@vger.kernel.org>; Mon, 28 Sep 2026 03:20:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790565624; cv=none; b=QbzMUA/EuUHyDR2dwYMYYjOVePbDsXmhXonnhubZ0Fswn9ohfWIEED0pKrJbg7lTGuQBCNHNnkPGmOxay6ANLlTUUvzBH7A+nQPL/0N67PL/tec2voRz9/Je7IcHeOOEp4BTzEnR5Hrf5eE61CoJcyqHfMCR9l3SS8e1+SX3V8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790565624; c=relaxed/simple;
	bh=+kOjkpPIp2O0Y2TcarFiCr4rotgxnSe8KeYiGN1+xbU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=eDdCWb/Vk4WLHvIFsmUMBilZDTqEmU3VsX2Jb7bJWl9ipPgRCMXm487hOoNv3SqcfYtTdRWSsp/0srCHlu1QkvjcgMVC9+5pW4Pra1VBhN1/hM11aLGqnVGm4wEA9tpr0rMCpr/n6BHrTPq3ZPUfOBpoXeZ3TcWSOplsBdr3vxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Rr72TvMk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=b8fbZKjH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Rr72TvMk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="b8fbZKjH"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68RGnRik1449996
	for <devicetree@vger.kernel.org>; Mon, 28 Sep 2026 03:20:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Lnkt77Nj/YGUnzV32lk9F6
	YUGD9V84nL5hweolWWiPg=; b=Rr72TvMk8lTQ5yMdpm+GmugIFk0OSsAzLo8YCg
	iDY6nwiqweflNjfAteRG/toYCMWo9HXTvrxHNpsK6ia3lv+qG2RJIbIIajOit+cw
	ixCQj/UcbPfRV6S/uAoP8F0BGUGK7SvyMs9R7MxHoQwHs9NR7muJbl9WUe+3fZdu
	R5Gx65SuGVGRDbsiqv2Zr2Y80nm3QlX3URoRAVJrIOaDCGr73ZAJIy4vZzhpuqj2
	KDP+ZfkarRTckiOrvAENbjWM4o7pb+6WXc2fzzYRLngcLaS2SzWILxJeNYxv4BTG
	qDxaTouTswoGOABLU/asQ4bjkk7BcSWhkukJHezIfboAi4Qg==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gx3rfvmne-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 28 Sep 2026 03:20:22 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-1466ab2bc8dso1558741c88.0
        for <devicetree@vger.kernel.org>; Sun, 27 Sep 2026 20:20:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790565622; x=1791170422; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Lnkt77Nj/YGUnzV32lk9F6YUGD9V84nL5hweolWWiPg=;
        b=b8fbZKjHiwt2lC6PoBKmhYyaA5OetDKPtoWJxsE45AuHjjOBCcvLfV7Win8xsAiH1D
         vh/A3stOQR7JgHKh3965JpQHUXVnGhTqmrgDrOuQCxwPGICIgBrvryjgqCaUTFyFu4/4
         +8SLlcaA8dvYt8sooDKAHdysCyqEb/0h4RwNZ+cHsu9tdSPe2sufKvrhz88UxnjRSNB7
         CF/zx4puaw5EUAMF8sqw8Z2NXv7REWfAQl4rO1feEkIHVuluxzAg6TX7uQCTyWfetiuF
         QrNEbkyC8K8aMcASVD1I/WH+M/XL5KKcz9j4PGdippI1HnFhzXtNg+PGIIIPi0K9aE46
         HgkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790565622; x=1791170422;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Lnkt77Nj/YGUnzV32lk9F6YUGD9V84nL5hweolWWiPg=;
        b=XjY53rIyJfioO7x8PWzC0WlZmIe4wHMl8/+0TQ0vy9tzaGK0bfqsO/tX+eaF09WWXt
         gaUyJ0Cbs8Fi8ylNhbfEKawei86KG40ExJwrs15Rwn5Q0tjIeSblJ8EP5huWfaSHwrQH
         c7E3/rblfr6CGBccWbdwv2emBEw+KhBmUvObwV1vcQmRJQSQ9JzVw8QqD1QvrXcH/szX
         9R7ghzstiLRS2b4LwNCpf165zEyJh/St3BOfjqMflBlWXajR0f18FbXuFXoHTYITYF9+
         RHIOozF1vS3pQZIzkPTaEJxU1b/Jw5Vz0mTbOHH189CvsMsKwPnIIb75Z3SgXuFRZ/4h
         b9uQ==
X-Forwarded-Encrypted: i=1; AKwUvBxu/g1oJot0+pqBMkkas8w9UEzSx9ys5p+kYjD/tFCrpu+9WEXLZCQBG/WkzmmHJVGqrT4wWuhPx21R@vger.kernel.org
X-Gm-Message-State: AFuF++mhIn7QL9iKQa5XxoUbMug6XZ8XEeuGCeJa82uzWKSN/LXBss5M
	7AlQJ3iU3J56DQ9veAYMvOe0iBtQz4u3jH/fNAxBaIfHdSx5IYyGPwJuqJ1wMDCMqJ51Q8Qgm4e
	bYNASmt4iZeMZ1xwpJc5Dd59hdbZ6kC2OLVbH/34gn/UbH1kZ3vRY60F7B+ualTzH
X-Gm-Gg: AYBFou0DzwIkr384G15mY+ubwkGAEOxvnJQ1c5M5/pvClC5aqJXUWJ3D415aZ075y5e
	IamwHTJKBtoogzLKzWpjhrSMeKL1u7tyWWr65Ntnd69VxtsOTiosIAT9KDyuFysv/X//7ajvpja
	+joySMaM85CyS2/z29EUGei1BzGhGGN3fudFgKj5xpZbNSDIpgGzY+2Z2hlwsPXJJjem+vct03y
	ejc0bLYZMTQp7AWMU3ox0eKj8g5RXGFkdTiC4iDlolmuucWiwPNysVZYp5iG2TiB1H1KCuT84LC
	lvwFZpmSBs/q1gzZdY7GarSmZKKm4wxDyH3cCJgp01XgsVE6NzWvX2CWUyvufZy8tAkRe1iX+xl
	KdoJPVJf0cjVX/XPkh5iJOo5n2HFsrQ+E7iUBQzFXjV5ZTE63X/dC
X-Received: by 2002:a05:701b:2406:b0:144:fe70:dac3 with SMTP id a92af1059eb24-146cec4a0cbmr8573076c88.12.1790565620504;
        Sun, 27 Sep 2026 20:20:20 -0700 (PDT)
X-Received: by 2002:a05:701b:2406:b0:144:fe70:dac3 with SMTP id a92af1059eb24-146cec4a0cbmr8573045c88.12.1790565619945;
        Sun, 27 Sep 2026 20:20:19 -0700 (PDT)
Received: from YUANJIEY2.qualcomm.com (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-145ac67c0ccsm21235372c88.4.2026.09.27.20.20.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 20:20:19 -0700 (PDT)
From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
To: andersson@kernel.org, konradybcio@kernel.org, abelvesa@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, yuanjie.yang@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com,
        Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>,
        Ziyue zhang <ziyue.zhang@oss.qualcomm.com>
Subject: [PATCH v5 0/2] Initial support for Advantech SOM-DB5830 board
Date: Mon, 28 Sep 2026 11:18:47 +0800
Message-ID: <20260928-b4-hamoa-come-v5-v5-0-05940cdca85b@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Change-ID: 20260928-b4-hamoa-come-v5-209048957c20
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDAxMyBTYWx0ZWRfX1tSBSKGtNOVd
 gUskvaMRufexdItCSOWSwAU/OayfhCO2zHOlmCRa90iJk4QQ+23/tv8JHQrL+q077wZZaZvt226
 BUT7413wEc1mzu2jrxl58sMIYLDIEzc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDAxMyBTYWx0ZWRfX7dMwmA5mERSZ
 c0RqQd/5NShQpQ6adu6mbMw3H982vwyfFtUeOKgrmvvBIjUtWQFpm8rfTz6EEHDSBF4wcm9Xnzh
 L5Mgz3pRFKZ4FD6C2a7D2lA9cp7WKgwT3N79HIBRvTiktHup6kGhjm3egc+hG5Zgwq2HNMC94zH
 3O81z+9pnXoTN/ty7ney47Xb1wgEwaCRvO8a7MbUpXCKrAlZWzxEMC2qbLlvlokZCltBHHnkEdP
 8n9768LsKH1D1YHl+baLTM46PrGD4yx5GABbipyWOKKA+ZoDfACCOzlSoIAwSQTlf3CW9CWddwG
 3DYiljcvhw09bfVikfHbDuVV9EelECS8FniWTFGZuRFxqy60K5E8wP0tsDy3DXy+JNw8GaTSX+6
 GhxKHmbAzOL+AWbYL2YDEOppFnSMclh6zcVVwT+NlVKpLb6xkB6ArWCDDT6IYY8gNw7+iiz+Hot
 76CpGukU1xZS8GC775Q==
X-Proofpoint-GUID: kRlAE1zDBiYJzwTNyUGGP1cmJ7EoG_3Y
X-Proofpoint-ORIG-GUID: kRlAE1zDBiYJzwTNyUGGP1cmJ7EoG_3Y
X-Authority-Analysis: v=2.4 cv=K6G3jCWI c=1 sm=1 tr=0 ts=6ab9dcf6 cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=oqdWaPmN6A6clvLYvxEA:9 a=QEXdDO2ut3YA:10
 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-26_05,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0 bulkscore=0
 adultscore=0 priorityscore=1501 impostorscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609280013

Board layout:
+--------------------------------------------------+
|               SoM (Advantech SOM-6820)           |
|                                                  |
|   +------------------------------------------+   |
|   |     SiP (IQ X7181 EVK SiP)               |   |
|   |                                          |   |
|   |   +----------------------------------+   |   |
|   |   |   SoC (X1E80100)                 |   |   |
|   |   +----------------------------------+   |   |
|   |                                          |   |
|   +------------------------------------------+   |
|                                                  |
+------------------------+-------------------------+
                         |
                         |  Plugs into
                         v
+--------------------------------------------------+
|         Carrier Board (Advantech SOM-DB5830)     |
+--------------------------------------------------+

Introduce the device tree, DT bindings for Advantech SOM-DB5830 board.

Co-developed-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Signed-off-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Co-developed-by: Ziyue zhang <ziyue.zhang@oss.qualcomm.com>
Signed-off-by: Ziyue zhang <ziyue.zhang@oss.qualcomm.com>
Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
---
Changes in v5:
- rebase on next-20260925 
- fix merge conflict in Makefile
- Link to v4: https://lore.kernel.org/all/20260806-hamoa-come-v4-v4-0-706021d4bc8c@oss.qualcomm.com/

Changes in v4
- drop fix HAMOA/PURWA IOT EVK SOM compatibles patch
- rebase on next-20260805
- Link to v3: https://lore.kernel.org/all/20260805-hamoa-come-v3-v3-0-20463c43eae1@oss.qualcomm.com/

Changes in v3
- add patch to fix HAMOA/PURWA IOT EVK SOM compatibles
- update Advantech SOM-DB5830 binding and dts
- rebase on next-20260804
- Link to v2: https://lore.kernel.org/all/20260727070758.528-1-yuanjie.yang@oss.qualcomm.com/

Changes in v2:
- update commit msg
- fix binding error
- update pcie and usb DT
- Link to v1: https://lore.kernel.org/all/20260630071022.3256-1-yuanjie.yang@oss.qualcomm.com/

To: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>
To: Abel Vesa <abelvesa@kernel.org>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

---
Yuanjie Yang (2):
      dt-bindings: arm: qcom: Add Advantech SOM-DB5830
      arm64: dts: qcom: Add Advantech SOM-DB5830

 Documentation/devicetree/bindings/arm/qcom.yaml |   7 ++
 arch/arm64/boot/dts/qcom/Makefile               |   1 +
 arch/arm64/boot/dts/qcom/hamoa-som-6820.dtsi    |  54 +++++++++++
 arch/arm64/boot/dts/qcom/hamoa-som-db5830.dts   | 119 ++++++++++++++++++++++++
 4 files changed, 181 insertions(+)
---
base-commit: f5f84daefcd92d7a630066635ecea1433ed5eac7
change-id: 20260928-b4-hamoa-come-v5-209048957c20

Best regards,
--  
Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
