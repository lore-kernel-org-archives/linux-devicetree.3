Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EEFA3BCD13
	for <devicetree@vger.kernel.org>; Sun, 26 Jul 2026 17:43:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785087829; cv=none; b=hF8fF5UPAe425qifnw03Gnnh03lEgXHokLc3dLcgfU0GXFdvVlG6e5RXRsdQ6Ae2irrj9waY9bj8kH27sHAhqL+87L0oo95c1DJyUTVlrMxBZhXOZRFYQ782xTxcWLSPOH1e7NO0WyTTGo9lm0lA0DXfkYiiTgJZAqfwEjaUp74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785087829; c=relaxed/simple;
	bh=0heBfNfOncdb0dF9IwkvyA9GBPaKA9+Er+Dg3z10Wak=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=cqHdBc3CKbx8iAPLSjqLQwAQhVhBL4IyWa/KtzWG1tnCe8jBLwpGFGf37Uj0gRAFchYF+KZ9SEqQQSjRRfOo1BcSodehbHEBWEGwRF64IQclim6CfjqRxF/ZkkjWV+0hLAc3t0YSksj1BMWfyHloDSy/Xxs2/CPoKKapiSow2ME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PgZxNITu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dEHgibsR; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PgZxNITu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dEHgibsR"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66QH6vFQ2352405
	for <devicetree@vger.kernel.org>; Sun, 26 Jul 2026 17:43:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Si13RHoLBWIyuPF06cIxoa
	9EFvca7cz+q6+0wc7xEeE=; b=PgZxNITueHYgajwyqd4SiujmWwdvjfsfgV0jlo
	U58crE0tlB77ZvmPzZPIqxdg/JziKcwP4kDUjpGdmc6wREjlsVaADb/q9n8EbZj3
	KmQfVL0eDTsmvmpfXgaqca+blVKRBt+RqYYYMAqe94/gjWghvzvtsyOhXMA63RzR
	0B4u9AbzSbWeWdiwJo5NuVnXjHi+E5gNfMaGGFQQzIKgNDfxFtjniAsiQR5VSCdi
	SdOp3AcnDFyOWZK5RKbjtJYIK9nMPA/PxsbEd8+cTjZUnIowjwLwyT3u1w2+arxj
	m4wHHnQ7kl/353txXTctyE5kOwHGqGs0RPjrkGCpfkzN+ctA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fmjufumsn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 26 Jul 2026 17:43:47 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51c0e702df8so25800951cf.2
        for <devicetree@vger.kernel.org>; Sun, 26 Jul 2026 10:43:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785087826; x=1785692626; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Si13RHoLBWIyuPF06cIxoa9EFvca7cz+q6+0wc7xEeE=;
        b=dEHgibsRCJ5URRYaz7qAIoAyxR4s3ySMtmgbt+6+eo+9pfj4uaQ+L1mvBb/rGJ+2Zk
         ewV2HfGe6cMDdzicCNmeuqp+6EoExovq9xhDnxfn7nqOwpm5UcHFVM0mq0h7Ig/3VbQ6
         zvmAia6FqwJLtB+HsX0Dv7d2cg8mz9xxdiZdBU6fEOzWm2flTaqHsJw1xDR3BB0VVRqu
         nLK/fD2gAhOEPCM1+iXlM32S8D54iKfgH37UxToJO7fR5VgWtzs/98VNMOtLUNTphnWc
         mw7hr303XC0Oehen8Hh7ggd9VzNg1mie38KcSBGG9Ig/EAq91o/EAav2hO5vpV4Oghjd
         QyQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785087826; x=1785692626;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Si13RHoLBWIyuPF06cIxoa9EFvca7cz+q6+0wc7xEeE=;
        b=h+2KBRoE4HRh9SLiwZwsrOD9sSpYFpmQiz6sMpoi+Qra1NAcJ7tM6JCzyjHVazW9qC
         BroR+0ek0ZeT1Pr68JgF9gCs8MaepY0KazuKADl8Rlhg2f0NsgWNf93/yIC6LBpY0zxm
         3znQ02PdG5qTiTIp03W2PyE+U9SCkb3V8YFdQ8qlz4EUXzL3s8XhX2Fkj5FtnZ1sKwl+
         ez8zABw14o8Hj3qZ9hl1pnaoI02eYFhXCpIkPV4cJ75sp95MH8b59++o5/FXoWLbs2dH
         ylBvnEpvFsGTj5Tvf5Gsh0tqSF0QrzgI04we8eafO+57kosYnGNVTPOirTouOndSuP10
         Jtew==
X-Forwarded-Encrypted: i=1; AHgh+RpIRUuV2nlaVdoyQTjiBwVFKyUZA1nOudAe1fR8l2kMbZinCNW7jL0rt651NSYDAkrt/QaG/F3sOcW9@vger.kernel.org
X-Gm-Message-State: AOJu0YyV/wEs8UVip57tpvsMCRR1Y+HmpGxodawfddhnrrwFsl/qBcIG
	kd4xBAp2jNLklKtPrPWdL2sBRmqD2MDC5I0nhboFaFIVATewlWwUW9rc8omfYpABB4iG/SjLqHn
	/7jP9vw4E2fXqENClqHDiDvEtg1E/6u6uTz30g30r3Go7u8Kc7P8aaK7wNmcuBXBr
X-Gm-Gg: AR+sD12GhGEQ3PIcjl3Ttc3xIdHMgTVMt01vo0bS9gRgYTLk2gP5sYTvPZwoP3scaZb
	t5XnITK6Sff0kwLAdz0V2xeOkgUMV8isFRzNbu+CCT3MDAeStAgcZfdAz7rH92qRumKR2Zf6/pM
	lacv1rPJaxqSpBxLu1gh0uUunNeJ5GYmCUktTJbOtB7L++4Oakk69vWx5PhaGV4uYVzexXpHqsE
	QmSE2K0W8p0Gg4Hk/uobM3iEbEnE3Ke1fby3caygUdR33w30yXD3EDwYSz15N0P5BVdIz1BnZFx
	K1CZQdZnEI2njpSLvxF/EScsZI+FL3U37HQkJpWJUrDLekUctHAy8Hhb3bR7ljXhootcGwPftaA
	UtzMUqGmG7lWLNnHCEnFyvasu
X-Received: by 2002:ac8:5f47:0:b0:51c:2149:52e8 with SMTP id d75a77b69052e-529a871379dmr57979951cf.70.1785087826471;
        Sun, 26 Jul 2026 10:43:46 -0700 (PDT)
X-Received: by 2002:ac8:5f47:0:b0:51c:2149:52e8 with SMTP id d75a77b69052e-529a871379dmr57979701cf.70.1785087826028;
        Sun, 26 Jul 2026 10:43:46 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85c63bd3sm41576093f8f.27.2026.07.26.10.43.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jul 2026 10:43:45 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 0/8] arm64: dts: exynos/google/fsd: Trivial white-space
 changes to adjust to DTS coding style
Date: Sun, 26 Jul 2026 19:43:33 +0200
Message-Id: <20260726-b4-dts-coding-style-strict-v1-0-e9e3e9879d05@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/y2NQQrCMBBFr1Jm7UCMpVGvIl3YZFJHJNVMWiqld
 3fUbj48eLy/gFBmEjhXC2SaWHhICvtdBf52TT0hB2WwxjbG2Qa7GkMR9EPg1KOU94N0M/uCzsQ
 6xIM7niKBBp6ZIs+/+KX9s4zdnXz5Fjcj02vU17Jp6/oBTqPmaZMAAAA=
X-Change-ID: 20260726-b4-dts-coding-style-strict-70f4df3789fe
To: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Peter Griffin <peter.griffin@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Sam Protsenko <semen.protsenko@linaro.org>,
        =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
        Tudor Ambarus <tudor.ambarus@linaro.org>,
        Krzysztof Kozlowski <krzk@kernel.org>, linux-fsd@tesla.com
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3194;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=0heBfNfOncdb0dF9IwkvyA9GBPaKA9+Er+Dg3z10Wak=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqZkdHPyln/j2ooJ2F7tYvn7cFNfhORymfCNuST
 Dx/SbUU7VmJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCamZHRwAKCRDBN2bmhouD
 1zSVD/4+1jmer9co03ZaY5J58u3UM2b6wO4SMgEAuZMpX282OHXbvhVsyG9lolbMXkn1KMm7ACw
 9XBjFwL6azYrxSvtjz4PYvPsRZOgbl7jbxJX403das1PvYD9D+pcDWE/cMPF3P3pYFH3aCt5Hkl
 E+ljIoaXK/PukiEq2xikrr7BKgtU58YNtSCfqyU+uLDVN8vWYoYfpzoBvrpM1P+5fBIp4CLg3ao
 LWeKwBH7hZV4YHHD+eSJw/4JaZEsqnzXP5ARWArjQ0Kcr6VPH7KqpGyzWSpzGvBn9VtpTgxHW8O
 HxRYkpa+YYeSQTZ00baN2/iW7hO1oSfAbJXfDAJy7g1fziy6nez5p63ByA9sIWNbmpkX5nndUUy
 Gs8LBYafbCY0nH8Z0dSRa9bLaBT5wz6xnSxQ1ykzy2ep4c9xzEJPVilz95ipBQjS1bkm9FhskNa
 GisDYuIOALwfUFc/sH8l7E9ccUC2GilnuWQs0D3nwqAoVnMKEMW0UEYtTpoyfhEhsXLvXzr0A92
 sUtFPsOkRUeyQC+6k3dpyH7r1SeimO56P2tBJmuWdLTbqEqsfJiKBrcIsHP7fddX+Sc2DV3iOdm
 TI53AtHFgZzUCvszVNxbg1ZIGghsxY1wzBrX4rKjYLIoQdiNOJZkFmpWixUTQBHA40+7dXxFOxN
 NoxHH3Bf+ZXeS3A==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-ORIG-GUID: fN8n6b8EdDziVThGx_rM2CyjwnhH_ruN
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI2MDE3OSBTYWx0ZWRfXzC7Y2oiVLr71
 i31wbE7cnkW/PddxIEZxWplX8u4532VkALigi19/m3+pqdUYcE3hyMO0DHiXkAiRCGMLiHHIsNi
 POGShlxKdgIp+jR8gkHcndg/kKhu3SQ=
X-Proofpoint-GUID: fN8n6b8EdDziVThGx_rM2CyjwnhH_ruN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI2MDE3OSBTYWx0ZWRfX9RIDNBKoy/oj
 B1sxefeXdqxd2G98+4ZXX8vaBAmclB01ZLEo8NfdqNdbjGHX0ros9teFWhcJiIXS/tBCAoeYqnA
 guSYjrRBjUpQSO+BPY4eun7+ACaoD5okBPGyZ03/S1+oEQQyTuoKwEqj3r1YvKbPXRjZXfaFOLz
 +qyhRAA/cPloiSMZj6eOQe+k5et7D4SaCPcjS0jqAV5ZIwxUHhhd4K7mc916voKenxv1kL6iJir
 24HOT5QwiA8qD8FbrwBRM6w3SOkJyjs89nUJAzpyDGTBu6WB5zOXtOZSr/itTc/wg+VMcxZUFFj
 D5bE3Z3SXB2/Cf/541/NS67sNHJiyx2uKpDhatcjMOGajExSMRV0u3P7U0v6O32JBZjfBgWZYqU
 BacZSdNP8VvZ7eLXV8npSQwmRybIO0td58b+RDLupzeBMGoC9U99H1XZ+Bs567hQw8emUX2xN+t
 izAL7qaPkWAdVJgxTow==
X-Authority-Analysis: v=2.4 cv=F5ZnsKhN c=1 sm=1 tr=0 ts=6a664753 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=gZx7o9k1dQs2gHzPI9AA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-26_05,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0 bulkscore=0
 spamscore=0 malwarescore=0 suspectscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607260179

Fix a few obvious dt-check-style strict warnings.  No functional impact.

Best regards,
Krzysztof

---
Krzysztof Kozlowski (8):
      arm64: dts: exynos: Move 'status' to the end to match coding style
      arm64: dts: exynos: Align continued properties and add missing blank lines
      arm64: dts: exynos5433: Override thermal zones by phandle
      arm64: dts: exynos: Re-order clocks and align continued properties
      arm64: dts: google: Move 'status' to the end to match coding style
      arm64: dts: google: Align continued properties and add missing blank lines
      arm64: dts: fsd: Move 'status' to the end to match coding style
      arm64: dts: fsd: Align continued properties and add missing blank lines

 arch/arm64/boot/dts/exynos/exynos2200-g0s.dts      |   2 +
 arch/arm64/boot/dts/exynos/exynos2200.dtsi         |  98 ++++
 arch/arm64/boot/dts/exynos/exynos5433-bus.dtsi     |  29 ++
 arch/arm64/boot/dts/exynos/exynos5433-pinctrl.dtsi |   8 +-
 .../boot/dts/exynos/exynos5433-tm2-common.dtsi     | 167 ++++--
 arch/arm64/boot/dts/exynos/exynos5433-tmu.dtsi     |  49 +-
 arch/arm64/boot/dts/exynos/exynos5433.dtsi         | 571 ++++++++++++---------
 arch/arm64/boot/dts/exynos/exynos7-espresso.dts    |  13 +-
 .../arm64/boot/dts/exynos/exynos7-trip-points.dtsi |   7 +
 arch/arm64/boot/dts/exynos/exynos7.dtsi            |  58 ++-
 arch/arm64/boot/dts/exynos/exynos7870-j6lte.dts    |   4 +-
 arch/arm64/boot/dts/exynos/exynos7870.dtsi         |   9 +-
 .../boot/dts/exynos/exynos7885-jackpotlte.dts      |   3 +-
 arch/arm64/boot/dts/exynos/exynos7885.dtsi         |  21 +-
 arch/arm64/boot/dts/exynos/exynos850-e850-96.dts   |  13 +-
 arch/arm64/boot/dts/exynos/exynos850-pinctrl.dtsi  |   1 +
 arch/arm64/boot/dts/exynos/exynos850.dtsi          |  47 +-
 arch/arm64/boot/dts/exynos/exynos8855.dtsi         |   5 +
 arch/arm64/boot/dts/exynos/exynos8895-dreamlte.dts |   1 +
 arch/arm64/boot/dts/exynos/exynos8895.dtsi         |  56 +-
 arch/arm64/boot/dts/exynos/exynos9810.dtsi         |   9 +-
 arch/arm64/boot/dts/exynos/exynos990-c1s.dts       |   3 +-
 arch/arm64/boot/dts/exynos/exynos990-r8s.dts       |   3 +-
 .../boot/dts/exynos/exynos990-x1s-common.dtsi      |   3 +-
 arch/arm64/boot/dts/exynos/exynos990.dtsi          |   5 +-
 arch/arm64/boot/dts/exynos/exynosautov9-sadk.dts   |   9 +-
 arch/arm64/boot/dts/exynos/exynosautov9.dtsi       |  86 +++-
 arch/arm64/boot/dts/exynos/exynosautov920-sadk.dts |   2 +
 arch/arm64/boot/dts/exynos/exynosautov920.dtsi     |  64 +++
 arch/arm64/boot/dts/exynos/google/gs101-oriole.dts |   2 +
 .../boot/dts/exynos/google/gs101-pixel-common.dtsi |  12 +-
 arch/arm64/boot/dts/exynos/google/gs101-raven.dts  |   2 +
 arch/arm64/boot/dts/exynos/google/gs101.dtsi       |  81 ++-
 arch/arm64/boot/dts/tesla/fsd-evb.dts              |   8 +-
 arch/arm64/boot/dts/tesla/fsd.dtsi                 | 121 +++--
 35 files changed, 1166 insertions(+), 406 deletions(-)
---
base-commit: 392dc8766489bd451c5f20928d01cc24ff9eec0d
change-id: 20260726-b4-dts-coding-style-strict-70f4df3789fe

Best regards,
--  
Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

