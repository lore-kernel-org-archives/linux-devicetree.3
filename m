Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4194E30AD1A
	for <devicetree@vger.kernel.org>; Mon,  6 Jul 2026 07:03:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783321429; cv=none; b=MWXsf+v/ce/A5QyaOqi3TXPShFChDetl37E04ItYOW7ChftUNZALZkcUZzHMv0JmsX7fdDBD6nBa4TBOSsbKDknZW6T0uW0LRAw7CNH7h/kFWKW0nLmNGlukmaLJzO0+LtLwzKZmEtAv+7J+5HUoYfpFh9niPsSdh8MdwYlOUC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783321429; c=relaxed/simple;
	bh=miD4Mgr6Yf5dkHoOBZw7YCpXIMq5bx2jRM7ayeGZN0A=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=DykUo1L7b/QI1GOv04Im+01lhqmyJA/X0/Z8tYH7O6qZadOwD99dsHW8oWhUg4Hxh0OqdOWWgeNdJ6Xai64LhwuVq7VT2EmmycyQXsK+QoNYq2s1/VJaDABjBmwZLti/nGNNVewOpS4O3pZE0jWa00NNF3LFrhuv9c0k7xq5aDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bYdUER0p; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NDlnsBmW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bYdUER0p";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NDlnsBmW"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666423j43595200
	for <devicetree@vger.kernel.org>; Mon, 6 Jul 2026 07:03:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=kCIYPUxXkQWyMhDQQt60df
	6gXpnYv03MUiZGcW84po4=; b=bYdUER0pSunzdM8uyq+rJVt/br6Z1S6ZC8gapN
	RzIAOgZrwvVGqzON5mMSzD5kRdfrCIqwLs6qkKS3q+Ol6cnJ7E/UKGcZTjhkQJ3i
	8kNvH1V9ecQrBXUJcH8rK4UUE8M/sUnYMdJwtfylhuCG0gm6Qk0BYiwT9d1Im0FZ
	U9AhBMFFpQrG5jI6hh2mw0pZYWmdccrdNRvk4qaGCRhUb0ZWSDYRDx76upZZbVei
	lmE0De8VbgX0fy2xeE8niw4I9vJaJY8JXcTgqzOM7c8GHFheTTyhEESmaiRLcUPY
	PF5izXpt8V0yDUkBOXRoQJFbd/ElGgBoCL2lNOsdbLdqokLA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6qvgw8ye-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 07:03:39 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-915f6ff639aso496617985a.1
        for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 00:03:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783321418; x=1783926218; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kCIYPUxXkQWyMhDQQt60df6gXpnYv03MUiZGcW84po4=;
        b=NDlnsBmW6HIzeHhD5HU9EJP/YwjvubYqhJCJmtH6lwr8lm3sGG/fSpk7f8Su+qxoM0
         +vFBuKsI+ExTwElipgOBlo9zcZW79w6v//Kx8/14Ov5vE+wKrbKEMpIFgklHTksiehwD
         jQRb0XTeZEgpcUqnFQJMZlkDtNohWG6U9NTcDtU8lETidUTC/uyMF3LZdw6fbygV4fYg
         SSWANg94fqDoUEVvb6olUqBZjlTcTlYc3Ar9CG8vlBnGjwjKwaxKHZtQobL5lTz4djp9
         z10JpYc05SvfKLomsrSN3lrkK8M2IMuCEOmgaZ9tk/iU94z57Ev2fxEqjDSGKrJ5RwOO
         //Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783321418; x=1783926218;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kCIYPUxXkQWyMhDQQt60df6gXpnYv03MUiZGcW84po4=;
        b=rHztV4i8693AZT4IF5pEocczwQ6eyQ8oCn+dnrIDe94S0AeJFaWMR60gHDF3Z0dInp
         BC5u/X2brKK2NtQtJDKlDG0C0n6Iteu/5OSvek31AjOje/zVNrh6tc3nvhOwxTAIvv6G
         R7YhQZBI/PMvKvka+VV1V9EbtSVsJMzLHXlB4mcEc3VvjGzmVKkFCMMIufQL5ycP16uV
         qOlaTtQZA85WJGJspMM/XmCeJRB40LfD7cvsfaG590vzR1qwA+zSSsVJqv1Ss5VtSFpn
         Pi/5comL/U/ZcvycyrGacdb1ssydqHxJabAiUN2lDpsyyOWOxlMmckWAWaS2OOAET0Tp
         fBIQ==
X-Forwarded-Encrypted: i=1; AHgh+RqZ8hDQfBJyDyAWnLZXQDnTiNfXONgFJ+cAvpNAdWKbn12DzwVFAcHFRGH33S0X6MkAHQQonHeRpOpi@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9Ie4MS+5qXS76LHlmSYi4Wy8c/uRFxLMMzHjj3mOiFRGaLyF8
	qRK81dB0gc4/Qdy3zEwGa6lHZErx5CUA9x38Ao5o4DVQocaGpN+dtYssg/2TK90C/gkDIQGOUHy
	yCi3hrHjA39yX5qOwdsBkrLN/yLT1gPQo6KZZyMmQoUhuS1UuG0D16Wa2qxjDZLsnrRo5eGvD
X-Gm-Gg: AfdE7ckaZROV50EISbFpua/HawfqkCVen+WwEB8ayHZwQVMjMy8ndYU5NSY4GJv6ALM
	oWkqEe2vLJYJUybJwoHBGs4qnCEaEYE+PMBLw1dyNFRGK2sReO37Uo6/VUTQE8Q0/QyaoQiqU1X
	BO1Xosv/LRuwIbcl4okn2va3+bDAEnwzhEPyRyHRlRc8N0bbnVA+56BMOfyyMI+lC2lri2VI6tR
	d4bYooL5ZUNuT3mZVoxwr0RKsm0ZIrgj3Por7fqsC5gkKYxlNI3k7hp81LWhW9tH8dazx8fOYvE
	EjU4iMdKqs5CUklwVE0ieApn4foaKSGtCbV/xFLtit9j77tW3B+mY2HwFa31Km9a0y2kYPBXw6/
	w+WRFkHmSVCPEg3U3EZBC6C7NhbWpcA51TT8=
X-Received: by 2002:a05:620a:4550:b0:92e:5e38:8ca3 with SMTP id af79cd13be357-92e9a4190d2mr1240009085a.35.1783321418552;
        Mon, 06 Jul 2026 00:03:38 -0700 (PDT)
X-Received: by 2002:a05:620a:4550:b0:92e:5e38:8ca3 with SMTP id af79cd13be357-92e9a4190d2mr1240007085a.35.1783321418056;
        Mon, 06 Jul 2026 00:03:38 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493c63bfba1sm397143455e9.15.2026.07.06.00.03.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 00:03:36 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 0/4] arm64: dts: qcom: Few style cleanups
Date: Mon, 06 Jul 2026 09:03:25 +0200
Message-Id: <20260706-dts-qcom-style-checker-v1-0-16ce82a2bcfd@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMyw6CQAxG4VchXdukkIjEVzEuhs6v1AvodDQaw
 rs76vJbnDOTIxmcttVMCU9zm8aCelWRDmE8gi0WUyNNKxtpOWbnu05X9vy+gHWAnpG4li506wg
 VCVTiW8LBXr/xbv+3P/oTNH9vtCwfjIv8tXoAAAA=
X-Change-ID: 20260706-dts-qcom-style-checker-108a85dec00a
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1659;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=miD4Mgr6Yf5dkHoOBZw7YCpXIMq5bx2jRM7ayeGZN0A=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqS1NAe+bBeSd4SbLMVT1R25d6OVs0h34Yn3a1/
 WLKie7zadyJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaktTQAAKCRDBN2bmhouD
 1xhGEACWT+rqFgBvYTMEMf0s3TIxeLV8TbeV3ML7oLLWzuNIe78ykbQ2y3PmC7E0tHYi3ATqsft
 k9WF9jnY9RfV8bZP8xemeXq+i0IsH0NJeMyn8a5C8DWWxi5QhqVilhDkyYknDlVZwsyY4NmMyNJ
 KfSkdZUcdaKdHzDjEiitOMGTRwGZcjv4DtlAjjlgt5sv2eY7QUPISt+8hfZRvYfQGaFxteq549o
 +Q3kHdKxEeRjExXdmI7KVtuDXHE3uE2bYihDMaz4QbcBOQM23mxBcGTEtSncICwMrhwYhKuYits
 jyZRJsHvirafR/+V1NHZg7Q9oGq3E4b5LuXR1LkqxWcOQHz1/uXspoJufKX2ZR6ofQObouBN/wa
 Wl0TkeRYEung+Mt1UR81FBfiMbGs1V9vEXZuroxwNNvkIpse1+seGzzYQ5tdkrUfti9WAYSHlW2
 SWbUPfxxvusidkt3/BWWZENgX+n87hUBvQABFYq1LmQ2/9Zkg9edlpUTyQkG/+l7GgXzbHJaEac
 tdiOvwuUk58zWHexQMrR9HmoCKx51SiAjUFEieYaD6GW3KTJ1CrZQs/05nV9I04UMW8yQSPyl1z
 9/z3Zn7I6ypPV/46q8l5boW/997Tjt3tji+b+BluabPMLIR3MVH+YPZ23nvgUaUS+vJJvO06Qob
 J1A0OGkDmtJaReQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Authority-Analysis: v=2.4 cv=VvoTxe2n c=1 sm=1 tr=0 ts=6a4b534b cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=KJvvn_RG4jDztkv-m-IA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: MyWy0ZKdJU6TpW5kG6FxRjYin18mGK26
X-Proofpoint-GUID: MyWy0ZKdJU6TpW5kG6FxRjYin18mGK26
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDA2OSBTYWx0ZWRfX83YN+HLIOrRl
 FiR50xQXagzB0UXj0O90sGNGYT7KrdsPiimtgouKPboWkVCPlNxPqLW/+3a/l40x9Sq5W7cay2h
 9SwI1qF8+CVMinpXYJQLJxvXORiRQRs=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDA2OSBTYWx0ZWRfXw1yrQVdtkzkU
 +qCfl09HWFSEh2rsCrTchhaXNVTPVg5lPtRsqcoXNVumVd0fNFc2/n4vL5ItRxRfupC+ogylz2U
 lrA6wZhHunI7fAx+iK9WmZCArYfJT8mOeEGXH/AYU2y9N0fw/FwjkKWVPOT/FngJAeVwSfI1OpM
 I7G0Hvokbxd0vWPkGo2RRc7HYmGfLxgOEmTPGgArSQvkb13wpG+KcX4J/PIRVdgxB11VWGgPwVF
 FWUBLKZ29gfwq8GKl4uLEg054INaIf7vAyZuNNrsA83i7bHHAS4QRCHeTQNpHHA9s64T24vBXta
 TlOExhGdTtHTEgDv7/zPVItJVkLzKOKiTPaP5DgZLVFp2TFpRHsY/GXmMmGA46lxTsO3WDRrmxz
 4+wS8zVztVImgAS1El4IgFooFIRa5POkHPJBXgq4/iy/3Yi12eh0Pjus8BB6GVogIubKLFe2myX
 cb9kt1fXVtRVPH7Cjyw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-05_02,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0
 suspectscore=0 impostorscore=0 clxscore=1015 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060069

Few style cleanups from my scripts and one thing pointed out by checker,
which we will roll out gradually.

Best regards,
Krzysztof

---
Krzysztof Kozlowski (4):
      arm64: dts: qcom: Use hyphen in node names
      arm64: dts: qcom: Use tab for indentation
      arm64: dts: qcom: Use lowercase hex for unit addresses and values
      arm64: dts: qcom: Correct whitespace around '='

 arch/arm/boot/dts/qcom/qcom-apq8064-pins.dtsi      |  2 +-
 arch/arm/boot/dts/qcom/qcom-ipq8064.dtsi           |  4 +-
 arch/arm/boot/dts/qcom/qcom-mdm9615-wp8548.dtsi    |  2 +-
 arch/arm/boot/dts/qcom/qcom-msm8974.dtsi           |  2 +-
 arch/arm/boot/dts/qcom/qcom-sdx65-mtp.dts          |  2 +-
 arch/arm64/boot/dts/qcom/apq8016-sbc-usb-host.dtso |  2 +-
 arch/arm64/boot/dts/qcom/lemans-evk-camera.dtso    |  2 +-
 arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi   |  4 +-
 arch/arm64/boot/dts/qcom/lemans.dtsi               |  2 +-
 arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts   | 20 +++----
 .../boot/dts/qcom/milos-nothing-asteroids.dts      |  2 +-
 arch/arm64/boot/dts/qcom/monaco.dtsi               |  2 +-
 arch/arm64/boot/dts/qcom/sdm845-google-common.dtsi |  8 +--
 .../boot/dts/qcom/sm6125-xiaomi-ginkgo-common.dtsi |  8 +--
 arch/arm64/boot/dts/qcom/sm8750.dtsi               | 14 ++---
 arch/arm64/boot/dts/qcom/talos.dtsi                | 64 +++++++++++-----------
 16 files changed, 70 insertions(+), 70 deletions(-)
---
base-commit: 2b763db0c2763d6bf73d7d3e69665222d1f377cf
change-id: 20260706-dts-qcom-style-checker-108a85dec00a

Best regards,
--  
Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

