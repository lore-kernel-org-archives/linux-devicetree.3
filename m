Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 217DF4334C1
	for <devicetree@vger.kernel.org>; Thu,  6 Aug 2026 09:45:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786009520; cv=none; b=ZzSNxx65PlyDB6w6+924OhU4dFpOiZl9ht/HLwJkEofOuJ486CLWXlmYrCmltUGjWy4xt1g2bXI8KvbEcA1F+STKcKdmz8vhJJukbhl7Sw0gWfT+pfnxzaKQx13TT6MhuqaKF3KaF4jHLCVUua4Lqu20JV3qJjsFRpPYIrpI1x4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786009520; c=relaxed/simple;
	bh=+Xrn3lUDvDr/uL0efeX22oKdVysXjhb6SbzkIRLws4g=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=kYtjyTeQJQkeezR9H9EJdf1peeWvdgXsSC7zMAz1GZ4swoF5p8Cg9OZCQlN0woGVcviWkcjd8e+gqRJ4M67fOhkcYBNsmzAO11UZuSyPEosh7XvKLNo0yuNRuvB6nk8jXYpJvZlizFAbOtA1xS9IljanB6t28ed7SG/ULzAkQ1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QxqV0Oy9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=R1KFJ9kb; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QxqV0Oy9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="R1KFJ9kb"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6769eoaN1288465
	for <devicetree@vger.kernel.org>; Thu, 6 Aug 2026 09:45:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=EPtZ1AG3ZDCyOb2BfAXMJ5
	iCOPotbDu/Yk2DcjuLziI=; b=QxqV0Oy9vbgH88q9wG2bbwPfr9MjzZDQumjjfp
	F8DZxWxywN6XmQdCjWL/MPymCbFPZ3MeMScR09GJ5EWAknUySjBsc82aNkstLWCr
	N9orl0Wqa2uL+/SFKbiyqi+bMN+PFArFOlRcYOyk2rnfPn31t5I8jpH98FBmNl2G
	qjTweG5XHU3WPlvkxf6x0rJMHJpBU1OMPkg9v9OEnCuHw40X2XrhYfOx3fxEnMbH
	vjT9q4DMw4ZuvKrO5ZflVGiESPIofU0UI/OrNrUHZHk7HPBCQva9KAPj40p9jCyT
	twf8o0XUjgMVY4vpjChAr4ZDlllR5sWCSOX1LXw041oRGPVQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fvp728fs5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 06 Aug 2026 09:45:17 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92e5fc4c7e9so202619285a.3
        for <devicetree@vger.kernel.org>; Thu, 06 Aug 2026 02:45:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786009517; x=1786614317; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EPtZ1AG3ZDCyOb2BfAXMJ5iCOPotbDu/Yk2DcjuLziI=;
        b=R1KFJ9kbkwLKs8w2mFOxY2FreZT1O8L6XAphslRol3/8+N77ZqPDFwvLG1MoBl1zVY
         hE1lfcw59HAQ4JnF5ktYU4rUqirQ5DWEob7DxRMP/wku1fdcefdGIXEBeP54Fl2OkNyW
         jM4bLNHDOOdaEPL7AQnf9r/2DuWIAswubCycTwfNGpx2HYYbGtaDoYLFz4uePxAMe6nC
         +Yvq49xoy1uHmUz0UlKAjF3zul+chjsRuNddvFamkQeWpicUyplaSgWXbrwQquK/1jUf
         2fZHCV8Fg/QhKbrT6Y/2Zi6JdPzxpII6SJOsli7o2REePhuwT1pzJhVqbGobrWoSBFpQ
         WlhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786009517; x=1786614317;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=EPtZ1AG3ZDCyOb2BfAXMJ5iCOPotbDu/Yk2DcjuLziI=;
        b=nWK3rA4i6BtjXo7q6gU8dxDIk1UasQ7cC4VxYnwzmNLH4qfp7JLcDi8EA+RNIqTxAR
         nLCtHiaDuwFr+DQB2Ms5u9hTJ8jOHcCKYwPf+ORj6/ry/jueRKczY9cjRSoSIAr0pJi5
         AertA9UzPUOBWiT6LFaLuc7M3/YkKmWTb5F084z8PawdHDFa5T7Lcn3CrrzI8Os2v5zR
         gks6v2CBzdRjU9p9OMpVIyiNzh/PY4ieVc5nr68oe6sqFLEIMNoURe7FQHp27EjY3lqi
         5AwPKqOVrttttm+FzC2BldVsLWkUkebt1OKe0YHC61x+bNw12bhFcTlT/raHEtRIKqpE
         fS/g==
X-Forwarded-Encrypted: i=1; AHgh+RoB3cGkobnBvDBckzkHDZq+2u26XlCOlP2djD7XfpT3IjOLPLFuGLhhkkdsrJqu81+uwrFzyp4Mm59L@vger.kernel.org
X-Gm-Message-State: AOJu0YwQpyxXYPUHgKtmA3UDAwUIL2+lAlYp3ejvimhK29Nk3zNmy445
	6aZ3L1FAtwILta1vTjb+h/GI8+L9E0SQldc36Qv/a4IJ0VM7nAMcZr1Rjsqiet9Zf1yL2zAmq6y
	Yj/1sYkMY6ZVo0IzjMLxxdnOeT6fvq+EXWRGmFPqJ+YoaGvA7W2c3NVrl91UpwEkF
X-Gm-Gg: AR+sD11TDcwQey66U4X+cGHV7sLgBj1se+vJ/guNungWRQ/mcrJWz0bQ7umaW3V6SQ9
	XMrPKtmlDRj307R33/Ae4k/KBqkuda6w1t60VKqg2dpitAARnQVqa0e4pZDM+tP8rs0gVNS4M8o
	unkQ1L81QmFfdfzu2SNF1a8GyLnDK1jir5x+QOl0zbZEuW26fd/FX2Sd7Fo/rXfLYX488CzqlZd
	2CP/oQHuiBpbwdouR8hXTvRkg+pRjVcjQYd6Fq5ZOO0wkONnfzmq+nsTgaex5YwoTSdnOrOx1dg
	8ZBFvzdYMAlivgFCuvz2OayETm530swEKQiZ2fN6O4bBSTwJZP2S+1s3KijDlXZM5ylz9InmhVZ
	M4y5dSGyvi2keriyUg59suAFKHskOG9L5GH43GE1D4PQ/irarhOrO4z+Rl5I=
X-Received: by 2002:a05:620a:a405:20b0:934:9f87:a00e with SMTP id af79cd13be357-93649155466mr1027772385a.11.1786009517258;
        Thu, 06 Aug 2026 02:45:17 -0700 (PDT)
X-Received: by 2002:a05:620a:a405:20b0:934:9f87:a00e with SMTP id af79cd13be357-93649155466mr1027767385a.11.1786009516788;
        Thu, 06 Aug 2026 02:45:16 -0700 (PDT)
Received: from YUANJIEY2.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9364a570fa9sm358566085a.38.2026.08.06.02.45.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 02:45:15 -0700 (PDT)
From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
To: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, yijie.yang@oss.qualcomm.com,
        dmitry.baryshkov@oss.qualcomm.com, abel.vesa@oss.qualcomm.com,
        krzysztof.kozlowski@oss.qualcomm.com
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, yuanjie.yang@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com,
        Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>,
        Ziyue zhang <ziyue.zhang@oss.qualcomm.com>
Subject: [PATCH v4 0/2] Initial support for Advantech SOM-DB5830 board
Date: Thu,  6 Aug 2026 17:44:45 +0800
Message-ID: <20260806-hamoa-come-v4-v4-0-706021d4bc8c@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Change-ID: 20260806-hamoa-come-v4-f7033c4204e7
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: DX4LRHcoS1n43i2nSwGv2Nlqf4zXnNPX
X-Authority-Analysis: v=2.4 cv=JYCMa0KV c=1 sm=1 tr=0 ts=6a7457ad cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=_lCz1UgtcF59JPfKSWkA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA2MDA3NSBTYWx0ZWRfXwtMVImv8hSYu
 I3x4zzqjaA5jIVOkcSyQNe/bRX4CZg4CYDtrcn7z7ipuBThwDnRb65d6KhpNzLdEK22sl1Gw7og
 tmV18rSQbpKFKZqmVGZyeJh5zm9SJduGHBTb9FhTZqtkHJayEdHqveKLS8xSC8RiWyKk1zO6OOV
 vCcy2LrFs/SLXSmLiDK5jHUK2+4DywwZpnYgO4YzG4XOITPZJwPPw858El/BXxN9TpUmuqtw19k
 Fck4ZHhbaWHp5TPIp0zIlYuIPAv6lEloza+RjMDzjqgAx7uqKzm8c67SaULP2favf/LKKmmPyO1
 9M+/k0eHX7a3CrWM4dY/kj49WJIFG2gbpM3eZ1rTYDFcU5zslAZOAnoYOkVfm2z4TMrSugVAyrg
 ibowS43P/nlXAv4BsCZq9EIZikgYg958LfnNfyL/97gxASOvKM0+DcBpfPED4ezAY8kFm6FEg3r
 g+KDEajn0bdj9CCVmXg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA2MDA3NSBTYWx0ZWRfXxunkD+LMHlHK
 NhQCxhYvcj3c42QUEXmW/rCLnePB/wrkW9ASYboXk1JpW0xAuCeSI+J441438flcrRRawLhe2sY
 4V58eDJGDn/ZY3xzW/umzOYI7VX07p0=
X-Proofpoint-GUID: DX4LRHcoS1n43i2nSwGv2Nlqf4zXnNPX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-05_06,2026-08-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 priorityscore=1501 phishscore=0 adultscore=0
 malwarescore=0 lowpriorityscore=0 spamscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608060075

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
And fix HAMOA/PURWA IOT EVK compatibles.

Co-developed-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Signed-off-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Co-developed-by: Ziyue zhang <ziyue.zhang@oss.qualcomm.com>
Signed-off-by: Ziyue zhang <ziyue.zhang@oss.qualcomm.com>
Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
---
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
base-commit: 1701fda2f58e345c050f4309971bdc07cd6146ba
change-id: 20260806-hamoa-come-v4-f7033c4204e7

Best regards,
--  
Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
