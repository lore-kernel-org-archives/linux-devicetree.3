Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61DF4377AB7
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 07:08:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785136126; cv=none; b=K8AtCZ/f7Vviw12zh5TOSbfCpGQifcA0NdZ5oa2UBKtpWsyk5KBpBFlCcTNLhPBbK2214Su9/3DyLMkVPu53oTmE2knf7Uye3/2YMh9AQGu8ca/dPofPOiHQbAqu7TMiL/SF2BusqIeCVxjA2clR506OCaIaG1tRR+NXFVLo/d8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785136126; c=relaxed/simple;
	bh=5gTQD0boQ1ilO/JLWUnLWcEAU002dv7Sx8o4V7MlDP8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=kg6sMC5xfpIfjLY70aDBtrmgTCzmgkr3M1wUZRXLTMVIPsCV3zuIInOw2RV9PuumaqXt/qeF7radG9W1LKFvP3dWXdG9D2avB05ZDX18rdvkR71cuwPPPaQ/1nkGGQaxDNL0aZryPYjrV/+OwhXGx26YRy9ElkZXCnAvHiEX8Aw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eDs8VUTs; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Pb97HtLE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eDs8VUTs";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Pb97HtLE"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66R1g2b22257276
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 07:08:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=crKknPLPq3cWKwHUWqi14U
	28b1SrzD6KXx97IuuHm1U=; b=eDs8VUTsIYZgeeoUzpQLChKGWCaICavmz3jQcd
	a+OzIlA8Ap+QroysNNubcjlb3k024fO/SOGfVxaOrKhh/zArSK4UpuOrdWOe6Y5r
	wtWLLltF3OgezNw9yBp6NOu8MGjlEmkPs6TFcJEIXSd6cU6wmEHZTbqPot4B+GqC
	zASw5iR+0pXJ+2uJRgX8mt0ii7UtC5ESUkK/B/AaLwuzINwvedLBVXtw/bL6gvwD
	pBOsktZnhIrvc7qd9SAGZUgAtNSsFvqsprJU/ti9UaXpdtHY1OBoP+f6y95USSEy
	UCfKM6x8cy6J2HCppIj3Sg3JXQBOTUEuZ5v/DVBeb5uFsEcQ==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fmmfgw20p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 07:08:43 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8ee593a5a2fso34594366d6.1
        for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 00:08:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785136123; x=1785740923; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=crKknPLPq3cWKwHUWqi14U28b1SrzD6KXx97IuuHm1U=;
        b=Pb97HtLEkLUJ3r8w7Tlji/z1bdJGsICHSYJtTkC9u6Z7XK2a42SS7Q/FOR//DZL8/E
         KB0tY0U2yuTDtoKJjMjzlx3iilk9O9ZPsoj+/VpWXmxbGIlxnAPQ/WGlUvLztXwWFCl0
         egbMGc13LS8eBZx6InFw5gW/54xahVVg+CVJqHU0hQkVnkkgXod+Fjibx2I77zgtsbzL
         o9ifp27LXs6h/NBBC3/wHcwzSsvtEhdogvf7QywGBgjx+bH8qPm+7P3D5uSWI2oMVERo
         bTfC5HCjUWp0KdyXswyKVnGiGVwv+AWuav2uUaXRFajA5HUosUiFu9OPwrRdnK5u1w83
         b40A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785136123; x=1785740923;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=crKknPLPq3cWKwHUWqi14U28b1SrzD6KXx97IuuHm1U=;
        b=GuEfsTWy3nz6Fs2+S7N+8X+8BzVo7wGCqnS6E+veD3KifZxUTnT2ImquiJKpu6LThi
         xhby+2lXVToE2ZROFk+LSzAlqiw7+yk5yM2PLB2u4E6gtC3m1HnsLl9KxpnvMQbDagj2
         EsW89wIXLNY+r/L6tQ7+HMVKaflN6njEtUSWStCpG7Q8dg7/4S0OkOKXaDpkra7RThrv
         iWnCfuTI8gRNGdpP2pstE1l02nHPqCmP6lBZMq50bvOSeSFpZqMjKxx/mPOaMYrfI4uf
         kWMbSsr9prrtVAVDMD/yDGkzKkt6CgBnY+ZFt24ODflzKYbE711OEnEZITC8y4VYT7xO
         M5Tg==
X-Forwarded-Encrypted: i=1; AHgh+RqwRCjkQanJngqrwwRf8dN4mGNyhB+zQg+SnBkH1xo1NIwehV9pg04VxveCMCOLN3XsrZWA0NM6UvgG@vger.kernel.org
X-Gm-Message-State: AOJu0YxZrFPUs+Fj+fJHcip2osY/UXIW6Dhkk7SpyENbZO1/JDQkAnxL
	VWv8lv75R1imLs51CeB7qeFEzdoXvDwH/7PDgS0h6nascXQbreynQWLt7/MWQMzMJrf2K9+FGS1
	Rp/x164XCC8y5ZJoClKj0S//cYr4JU2K3ilRDNkKZlWNYoQQAC99apqzoFMRsMc34
X-Gm-Gg: AR+sD10NTL13UuLp1o/tHJtQRjCSVD3t3hTHJeTvWJE81UVVbL77ZRaQCzdZZU1Okr8
	4inp90IJOX5WNn30M4UAJsJBGwGJcQFypESCAWW48deNZwjYu9GPk7plWhyXltv0tDhoHf2NjCk
	77TLQfpWOmxbNW8JRWG1GWBy4P8t7aYXTpB/+wDF7U2fUWUw0lD19klT9X62/nuCz94I45Wt3Zv
	YoNsAaaZ1G2Al8KbcJasYs+R1HO823b7sIt8HuVMBzbSodwjdiKwS8UqoIFz3bYQcgv6OcKNN43
	jAEFRKwP6sqY4uLzOP2HkmX57kZmy8FuP6xufSez3v8fvzBrJ7fP11khWoR7JkCjjgi5oJuqf47
	Q+E4Y99i0gEIsxAfTRUGdPF50AUjvrYVL62lqLQjqNw4/0UvL3oPGA1eJyF0=
X-Received: by 2002:ad4:5c8b:0:b0:8f2:22c8:e71b with SMTP id 6a1803df08f44-907e666fb1cmr119901106d6.24.1785136123174;
        Mon, 27 Jul 2026 00:08:43 -0700 (PDT)
X-Received: by 2002:ad4:5c8b:0:b0:8f2:22c8:e71b with SMTP id 6a1803df08f44-907e666fb1cmr119900896d6.24.1785136122759;
        Mon, 27 Jul 2026 00:08:42 -0700 (PDT)
Received: from YUANJIEY2.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-907e8522e88sm58884446d6.1.2026.07.27.00.08.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 00:08:42 -0700 (PDT)
From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
To: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, yuanjie.yang@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com,
        Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>,
        Ziyue zhang <ziyue.zhang@oss.qualcomm.com>
Subject: [PATCH v2 0/2] Initial support for Qualcomm Hamoa IOT COME board
Date: Mon, 27 Jul 2026 15:07:15 +0800
Message-ID: <20260727070758.528-1-yuanjie.yang@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: HMTVDUKWaK7trff4WQOg2rWDZpI_d23I
X-Proofpoint-ORIG-GUID: HMTVDUKWaK7trff4WQOg2rWDZpI_d23I
X-Authority-Analysis: v=2.4 cv=GdYnWwXL c=1 sm=1 tr=0 ts=6a6703fb cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=cTtBGgEW6hCVUSiMXaMA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI3MDA2OSBTYWx0ZWRfX28XqchOGJRsk
 TEGbFIH89t1Kn4jGYmMbu7mcIr1dGVSsw5qruuzYlmBL+qcEdKE4yOC+Bx/akoZQZLRB29Uk1x7
 D4h5229xUdbx/h9X64jDZhI7bvIu8jk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI3MDA2OSBTYWx0ZWRfXxcPY8OSQGLZh
 LtWZ+4fK6VBYf2499MlbEfPhNAZ4mLQ7QJ3vx/f8VQDB5Op5j8oxSlTyDwUexhqs3OkCwe4jGFc
 zUOtWEh0gtuYs6f6FGJ3kn2lsMXqyuvD6FAiuIs9Jwam/6BdwtP9QmeTilOwRLVcampCxcgAU9X
 ndTm7xJEmgYI3KXq/z7RhPdBF2dULgaN45UvDVX7A8Eacl3d8K64fYCM6v21Cdftgm2TfPxDliP
 utjdSLT2tDMLnG6aDSfY1WrNR8VPVYEO17v/rCoQjFtePXHSJ+C993KaBWVef6mp3n1370b3/zX
 mZJdo9l3gktdGupOWUsviuhZRIFksRfv1ME9eH4Ts7wGNXVlVmwuvS7yvxaoSyXOv+1XYUlMaaI
 tRE2IKpZu1N8NIA20zB78zGfID7fBiqcyID3g2Qam0Ky2FL4xhpt9JGZvoWSuLqKPxHSsnwgzHY
 pBBcm9Pp51gQovA2VqA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-27_01,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 spamscore=0 malwarescore=0 phishscore=0
 clxscore=1015 lowpriorityscore=0 bulkscore=0 suspectscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607270069

Introduce the device tree, DT bindings for HAMOA-IOT-COME board.

The system consists of a SoM mounted on a carrier board. The HAMOA-IOT-COME
SoM integrates the core system, including a SiP that contains the SoC and
related components.

The SiP on the HAMOA-IOT-COME SoM is equivalent to the HAMOA-IOT-EVK SoM.

┌───────────────────────────────┐
│          SoM (Module)         │
│   System on Module (small     │
│   pluggable board)            │
│                               │
│   ┌───────────────────────┐   │
│   │        SiP            │   │
│   │   System in Package   │   │
│   │        (chip)         │   │
│   │                       │   │
│   │   ┌───────────────┐   │   │
│   │   │     SoC       │   │   │
│   │   │               │   │   │
│   │   └───────────────┘   │   │
│   │                       │   │
│   │                       │   │
│   └───────────────────────┘   │
│                               │
└──────────────┬────────────────┘
               │ Plugs into
┌──────────────▼────────────────┐
│   Carrier Board (COME)        │
│                               │
└───────────────────────────────┘

Co-developed-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Signed-off-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Co-developed-by: Ziyue zhang <ziyue.zhang@oss.qualcomm.com>
Signed-off-by: Ziyue zhang <ziyue.zhang@oss.qualcomm.com>
Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
---

Changes in v2:
- update commit msg
- fix binding error
- update pcie and usb DT
- Link to v1: https://lore.kernel.org/all/20260630071022.3256-1-yuanjie.yang@oss.qualcomm.com/
---

Yuanjie Yang (2):
  dt-bindings: arm: qcom: Add HAMOA-IOT-COME board
  arm64: dts: qcom: Add base HAMOA-IOT-COME board

 .../devicetree/bindings/arm/qcom.yaml         |   7 ++
 arch/arm64/boot/dts/qcom/Makefile             |   1 +
 .../boot/dts/qcom/hamoa-iot-come-som.dtsi     |  52 ++++++++
 arch/arm64/boot/dts/qcom/hamoa-iot-come.dts   | 116 ++++++++++++++++++
 4 files changed, 176 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/hamoa-iot-come-som.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/hamoa-iot-come.dts


base-commit: c5e32e86ca02b003f86e095d379b38148999293d
-- 
2.43.0

