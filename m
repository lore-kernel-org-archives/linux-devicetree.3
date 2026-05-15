Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 765D74657FD
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 10:47:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778842072; cv=none; b=VXQQO5Wsd9qqRG6v8ASj//iQldvRBrzI4ShGKX/XwO5Hu1sUn10MBiLhsFshSGVnZZnBlqxfLNKPhLobj+LyHQ7PzGWNce/H26DBvf5yPngmMl1I6PgBT6EHsAqKgbXx1PL+ipoI9504KSq9s4bYH1O1cMkwSG9QsjMTD/yJkpo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778842072; c=relaxed/simple;
	bh=RijDqSjfKJNIL2BYqA6ow9Z5hjliiMofsCwqL8Aqnyk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=BvhEmqGVy8jM8sAzpBYUhkQlS1rrY0iBwRVLUiODkNu2e9THPyKvYc6YEvx/xvIWKt8HXrKmkuBzSzm5LKQhhgGVmM/djfNoStdgt4CjysUg+syyAvo1sNxuJiIDoWWMbzTkq0SGL5H0aX1Ouri7gFMaGI+SKi4uEmbf9eox/XQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CE1/2tgH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=adFkljcG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CE1/2tgH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="adFkljcG"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64F4w19C3670819
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 10:47:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=H/XXsyRxgO0llNZtCTaH5Q
	dQ6GC0REVLGnyPyOphXoo=; b=CE1/2tgHEt2G7N/4gq2ywgMg2/ZZOrHf3VAgSf
	IEpkbXyv51RylnXz/PT5dJsKdWxw04hniMQDH9vycr49ahGfAFjUU8vPAtcch91L
	XmfwKtvMNU3xOLHb590yB7LR5EBBTm3XylbsssbgsToi4HxaW0R7kuqwSmdYSIBJ
	pxPjggOfptSgZnm2azUIXCDnOwzozd5KGx/kYD5ctJcUFrhv8RUYdgns8OvRWlgZ
	b20ytJhNC6mnjc//ADbaqTPmY8Q1g2SipzoUDIQFqi33wMYlEHxMgJRP1VA06iQA
	lP/+29ztZw3GhARRZKsBqb3K1okWBmhMxDDw24VwdH5gJ2+A==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e5m1s2y50-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 10:47:50 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-82f7bec24fdso5494144b3a.2
        for <devicetree@vger.kernel.org>; Fri, 15 May 2026 03:47:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778842070; x=1779446870; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=H/XXsyRxgO0llNZtCTaH5QdQ6GC0REVLGnyPyOphXoo=;
        b=adFkljcGjWXbAFcGHxlIgshfTwtrMMYgpXt9tfdJepdIinPYB5gpldeJb0AJBk7s4g
         ELDLuNrwBEpbshZqemLzXj0iYN09owmQ7XLdBP5tktxIk5rys2+oi/0/+2+MWfEYcBrm
         MzWwPinnivVxtiapqHndJSyGA5ZOXV9n5TaTszDHLt0wQ/F2rn/klZO3ebkURglEM+Cn
         9zUA+xREGsMYYOrlZt2HOpXNRudQ3WD1jxC+ZR4uMXakXRjQyKokWYMBRm1AZ0aOggk1
         jW+5QvaLW2lxT6gepmVH2Itt/Bu9OPMdYxQSozlLvgvXqzfG90R7crPO1s8VGmSTcABe
         1x7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778842070; x=1779446870;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H/XXsyRxgO0llNZtCTaH5QdQ6GC0REVLGnyPyOphXoo=;
        b=HqRfttphBvTJszcLEJRojuh+IZP9Gok7ITcCZgb8zL0+lLyT6q7CtUrZzCMXV3Lyot
         bYFdQlYfL3svr62rFREALAFaJ5DOh6jBHGWAbl5qVBgOfwLaaNUJeC/vaFbRR1Xm2Suw
         3kT1dtkaXOmgjRK0scFeDfRAJFloRvdJJuLjqA8mRssi01Z/Ol7b0oGzDV9hIYqcYr5y
         jyDazNgno/sxjqye7007ObTOV+GvVQVYTKN+Sd1CV9Agqb8M9cx9WECqWT7uLaMKmfhC
         +AAmge9rSsrnP2/XCWe0FWUftdyP5PuIRoNNB1AEoANMOHaU8Aher5LVVTn+M77H7nai
         fZ+Q==
X-Forwarded-Encrypted: i=1; AFNElJ+8QpyFiTa22XvidsZqT384s962nwRrC1SPVlq8z+nkMgUrsUEKEsqEc1HYAkiiOeYLh9Ao7buoI/nk@vger.kernel.org
X-Gm-Message-State: AOJu0YxISGZ4E2twfwJNXhFGylNUJSGXNb+tAUgP23e+fVnRtwuIlpFI
	FomHa/GJ7M18/VeLMI2BerfdmSBSJpV6vAYIuPsTYtVVIEKO6+hXmsgZQUg7+0AXFFx7irG2CDw
	NKDb4CFPDRZpwJuUpRrnRNqqoRahz2r4JbQow36ffXm6XgIZV76GAuEjghcKo19x1
X-Gm-Gg: Acq92OHLXYwWyQI/jfCUYIB7xeeTVU3Zoc2mjmPUsdOeOtC0paj8a9VR9p1VK+T8r3R
	uFCnm/A50LXeenCcjPrWB8Z7MbuxpmeyuN0KmhdzlETCp5Tms7f++ed+3I1p+LF8ynE8Je5o/w3
	UaFVpx9U6gQEjiYLQI1cRhhrVFx0+v57i1t4oz4vFuDkVM2KQFq7PYikxlajJrI2Xph+4TFBbAu
	slhqahFxmQjcLwQgX4CyxsqhSLzbiHm93eFqIIj11f3QXniD8ZNS6IcxufzXnOh3m/w1e49Z2xL
	FN+QGlZ4QAIxAMvhHZJQBkG7B1cVxIXxQ2E0+zVGKFub+WCn2z+hOT9MwM4o2ZmA0YepsHHxpuT
	4LMQdBRHBJxmiYIhBMlGw2rr6pe7zzk+CPHgUOv7mxZlQuR9VFmuoVa0TEoPiVDFt+l2+QDG8ML
	eKLB7W0bbeRC/g481+acU7HVKLi6YLGQKDR8Lx6lhUmq01VCIb8fw=
X-Received: by 2002:a05:6a21:33a3:b0:393:74ed:7de9 with SMTP id adf61e73a8af0-3b22e66471bmr3673862637.3.1778842070105;
        Fri, 15 May 2026 03:47:50 -0700 (PDT)
X-Received: by 2002:a05:6a21:33a3:b0:393:74ed:7de9 with SMTP id adf61e73a8af0-3b22e66471bmr3673829637.3.1778842069588;
        Fri, 15 May 2026 03:47:49 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c82bb1006fbsm4955221a12.21.2026.05.15.03.47.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 03:47:49 -0700 (PDT)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Subject: [PATCH 0/5] Enable ipq5210 USB support
Date: Fri, 15 May 2026 16:17:41 +0530
Message-Id: <20260515-usb2phy-v1-0-5f8338d466bf@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAM75BmoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDU0NT3dLiJKOCjErdpBQLU4NUw7Qk45RUJaDqgqLUtMwKsEnRsbW1APe
 eit9ZAAAA
X-Change-ID: 20260515-usb2phy-bd850e1fb3de
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE1MDEwOSBTYWx0ZWRfX4Ypc6x3xXLmf
 mfXFZ0tg34o9vTcy1LHwyjBlEv3VuFB6/MnYkBUOXjICf+3LrvbBUwlIjskry+jByfNcfjwk1dw
 dcztjFoE7pXZSNnJFpAc4d7WeMms3EUd0M02jblXg6azhgwcuA4DloIOWWzjyuPauMZ+Gj9wEeQ
 tnRVdfAd+NYIWdhIkZvtAantfLvcWXjfi7+j4CGs/D7P4yCWghJdzj8Zo7qjR/Ng2OxVVrBC+CL
 V0w0s1GR5Gw2Tk90Fudj+GmLjOM/KLfjlKPxka2VpG9kGdqmxFbqF2V2BeyG11DO8gJmThHBZvt
 ABU4G3ZqdL2BfhjdDuMR0bwBcdlPF/LVTVc5qm4a7HuooeZVM+hdfNHUgfRoxIg3Nc11eF6lo/m
 yV7gOT8Kv0yuO+at282EeYpcoiM9vla056NQaU7N3XW0Q/A2LnHYSi7RqD8b+4O0wCKfvacEgWy
 1RP4io3OsWt3X00fhCA==
X-Authority-Analysis: v=2.4 cv=Md5cfZ/f c=1 sm=1 tr=0 ts=6a06f9d6 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=6L2eJvA39pK3U4l1HDAA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-GUID: bfu3mG9T0ULKVk9hXWp-zIf2Tj-plwn2
X-Proofpoint-ORIG-GUID: bfu3mG9T0ULKVk9hXWp-zIf2Tj-plwn2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-15_02,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 impostorscore=0 malwarescore=0 adultscore=0 phishscore=0 spamscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605150109

The ipq5210 SoC has both USB2.0 and USB3.0 controllers. The USB3.0
can connect to either of USB2.0 or USB3.0 phy and operate in the
respective mode.

Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
Varadarajan Narayanan (5):
      dt-bindings: phy: qcom,qusb2: Document ipq5210 compatible
      dt-bindings: phy: qcom,qmp-usb: Add ipq5210 USB3 PHY
      dt-bindings: usb: qcom,dwc3: Add ipq5210 to USB DWC3 bindings
      phy: qcom: qmp: Enable ipq5210 support
      phy: qcom-qusb2: add QUSB2 support for ipq5210

 Documentation/devicetree/bindings/phy/qcom,qusb2-phy.yaml              | 1 +
 .../devicetree/bindings/phy/qcom,sc8280xp-qmp-usb3-uni-phy.yaml        | 1 +
 Documentation/devicetree/bindings/usb/qcom,dwc3.yaml                   | 1 +
 drivers/phy/qualcomm/phy-qcom-qmp-usb.c                                | 3 +++
 drivers/phy/qualcomm/phy-qcom-qusb2.c                                  | 3 +++
 5 files changed, 9 insertions(+)
---
base-commit: e98d21c170b01ddef366f023bbfcf6b31509fa83
change-id: 20260515-usb2phy-bd850e1fb3de

Best regards,
-- 
Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>

