Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 327CA32B129
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 10:48:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779187693; cv=none; b=L9OJ40XhkSrCTsYSzhlyzcJoWOMY3rlailGnIRQT7LFOp+tZVGxj8M8IsIjNkEhM6yXQ0bZSeSFyCcn8+1GelXEntYl1wjF87bLR50hkJHIHXxlvOLnC6a368C5qPoHRl3asMRkrTav5yB5kAmDgxza6WCzhD9eMGa3pivSNlbE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779187693; c=relaxed/simple;
	bh=4fWwIr7NvRH0x6FmEzFYjJm0PsCxwUfiJxfBSBAF93k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bK6AP4iJelP6+7ZjX6c33kogM0pT9GpkWH+OdJIyn4kbEkoekpkGvUIv9RiBONPkT4T/1UHN7uLcWYtz2d5DYqO+2ir998CICZ9ImvfOxdUhNet/GGxZmk0csg+ZauotkcWdkcf5EsQL/CKMfoPPDVELD8e8hKRXo2FYL9qoYSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CvzVjYFR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hLgPnZT0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CvzVjYFR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hLgPnZT0"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64J6gnTZ1737124
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 10:48:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tv1d8PFp+G+OAAG44DAFTPIFms3boK9ZgzhCBxGWI+8=; b=CvzVjYFRfE6ul9mG
	yP8OXxNOsI2nmmhFKzZs44CIsDWEM2Mu9/mVTJ7KTg3tsLnikkv7ZD/XoIpuoCr1
	CPat8/Z8o6i1rFsLTmsIcDETmZ2Ih1MQSmJB7gfj2dEkuwQrIqVgOX2VxXJe8GTH
	IVD2TQIc1Gn9DWReDotAyd8mzbeniXkueZXmNvY7nZv2RB8GhT8wB9GF0m38tvAX
	m6oW/v9yuPp2+OQusk96znYiu6CD+sGdrKEfnfbuteHMcu/82SN5+0HZIb0VCpOx
	pZs9/ROseewOfSsSDSBISpm6FnuC8p/8CmX5aRNLoLgldWtQWKmFOPRaQpy2s/7X
	2a1MsQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e8ju9119f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 10:48:11 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50ea1a7a5d0so102415501cf.3
        for <devicetree@vger.kernel.org>; Tue, 19 May 2026 03:48:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779187690; x=1779792490; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tv1d8PFp+G+OAAG44DAFTPIFms3boK9ZgzhCBxGWI+8=;
        b=hLgPnZT0tXJNcPoqlJgtseF/LDtapK/9yEebR7/ulkIz/7F9yuUttAC8pSRy2rda15
         eEQBN0Ri84JMcZp7l1BUsABV8Meyc89DYRGicNfSUq/ct4HRFaufKhZC9jxmluEeI+Y5
         f1i75UOqkaRdF1vBrQeosKmcW17aPw9iaVQhSoUyP0yoW8bZYgXBiUe6DX3U2IiVqJuz
         Zjrp0Kyrnohe/M9/+AWk5D0Lb3OyaumLF7DVy2QFWBdvEuaPmrOSmmZgaNO0XAUOvbMP
         b0GdNds2DTB1MQ/nrxMxaEwtTgk4idq7G9LzBNk3LV1sHyhe9mqTQBp2kki+PIcxErOg
         B5yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779187690; x=1779792490;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=tv1d8PFp+G+OAAG44DAFTPIFms3boK9ZgzhCBxGWI+8=;
        b=pC2GsTkzOzarWNVUdjpFAGf9/rsCUcE+ElZMTXxufoU7mJxYYnoHqMjuOoDvrMpzn8
         sW+6faO3r8N+lftPiZG08wKkfi3544TY5DnRsYsE5L74ZYKFVt5UfOL0CfjhViUCbceL
         gNNWY4u2LNQjxJ5BZxCpM33njIecwd14Mb3VyxT9qW5mppWQL3Zz6VTYjfkev53/jb7N
         2aWmDglZx8M9uMerLtyLlT0j15jU8NquohUyhU3hN7TuMWx6IN6U4nFczpV083DzlHCT
         V2+EOFbe/0MyAKMhaXc9CJrLnTQCymcNGsAxsnRNX3t7L4Y8yqfhxBoH+yM8CAVvTY8p
         yPbg==
X-Forwarded-Encrypted: i=1; AFNElJ+xb0EM1HjyIzgBy+e2MAK65kJx4V4re6tHsYnCD3imeDtEhkLRULjcGaWpfsezow84sEFDF7Wqauhq@vger.kernel.org
X-Gm-Message-State: AOJu0YwGiG425obmf5aX2NsN/zZPSRTDd4TjubCdJEESeRz21zx6sDUd
	buDpUqEcoqep4WkLBNZ4/WWIZfjYUBtk6zsSgO9TGXVmaIqU54fxzsRmjkE9ypBebg8yF3ytnL0
	pE49+4AIp3q1Kqx1DsTMIsBGCFsFOENI4sdKY3BJ5lFJqQVjpSrwXmP2XUUOAHLcp
X-Gm-Gg: Acq92OGqvvsn/C5oHAmU1ZKDnQFxqzuWvmdSZupslUEejZtalWYcV2d7ycvE0SrLXk2
	dZkHmDy/yTgHtl15cNXrEV0jJ2cV0kHcx1LTDz/zDYwQNJvSqHYIEeKa1ePpyGRP6/7JlfrTbz8
	Wh0h2saB/ODaWv/nMVL37TpqJcpWdUYGMSyKqhbTTlb6bkWPmBb37VG7gJlYV3w5oix8gqbTFSh
	h0V6Nomo3uv1FAfzYIabfmB50AKboIud0IYFcY5ENOi6MCUpeuO4IyKMfLTXlmtlaEueQHpIOdk
	u8Mpfdu0qnQ8ZbYVs+FGjacr43/ez8l6Q8uqU+zG2NwHMl4bsmXJHJybokO0DtUumcDzBnTkrO5
	j3j5KQKtPPqRcW8zhUEV4tYtQ45V5+O7mehnyQz5FzCY9KlQoRZDDOExkwMtegzIpP5nrKRclDo
	5k1ZQqcK5DVDoCdqVOUvfWN9fGpVRYlxo6ksQ=
X-Received: by 2002:a05:622a:1e89:b0:50e:5de8:6458 with SMTP id d75a77b69052e-5165a26c6f4mr257681551cf.57.1779187690358;
        Tue, 19 May 2026 03:48:10 -0700 (PDT)
X-Received: by 2002:a05:622a:1e89:b0:50e:5de8:6458 with SMTP id d75a77b69052e-5165a26c6f4mr257681321cf.57.1779187689930;
        Tue, 19 May 2026 03:48:09 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a90f11a59dsm4031413e87.25.2026.05.19.03.48.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 03:48:08 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 19 May 2026 13:48:03 +0300
Subject: [PATCH 1/6] dt-bindings: usb: qcom,pmic-typec: deprecate
 device-specific VBUS
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260519-fix-tcpm-vbus-v1-1-14754695282d@oss.qualcomm.com>
References: <20260519-fix-tcpm-vbus-v1-0-14754695282d@oss.qualcomm.com>
In-Reply-To: <20260519-fix-tcpm-vbus-v1-0-14754695282d@oss.qualcomm.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1279;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=4fWwIr7NvRH0x6FmEzFYjJm0PsCxwUfiJxfBSBAF93k=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqDD/mDo/9hF9YmNtf22Hh0vmjASmvXnXTPgK0e
 IuG3QEymNGJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCagw/5gAKCRCLPIo+Aiko
 1V9oB/9pNJFUqdVJq025KehmqUU8Fg75+ChcgiP/zBpiv6i7H/kt7vrPuUn3xRMtQSasoZbHYvW
 7zuIFbTgpj1gVBS/usCI+GdbChO2YI6/Jm1aCHStYBPRVIfHY00GUXfvcb7IpJIC5RYCC8ootxu
 1n3p+7NnxH3OCFC0uEfyezt1NeXj1BcsVOLV7VzNv6RtC9zAlLOsPOvWmY7AjnQ2RueK1VHM7Gk
 XC+bMZT7Z8V1KnQ09qX7niKQs3J1F5yV9eAFCA5Yf/1OKV9C5HEFk05YNYW4RGqb+SdTDG8AVmH
 Ci8UB3fiJk1FWmC2c41K+A0/McTf6lMsS7xSXelzfdqI4r30
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: -YbMqcbib4ClHEsAc5NRFYQDcT5nLaPI
X-Authority-Analysis: v=2.4 cv=eeUNubEH c=1 sm=1 tr=0 ts=6a0c3feb cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=NGvXnOm9UF3A347_PzYA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE5MDEwNiBTYWx0ZWRfX3RGiroBTnsjx
 843nr/P1E0cUNVeokIbFwqCadBB5OoTIIzZ+uAHpFAtpCUKsrN059oGspi1Rf4U6G49oTKvjw/f
 dqpKFdw8KNSXDjXIl+nkeJR7WLsDlUprVOn6FOb+w+4fttlD+L2zMHGlyw+GM2es5e80IBvyBem
 til0iMvwX+X7AQoXslfE4ot+N2EfbGkc6OJ+tGmk1eFIuqcWWJJottVIu0D2GqzXegi4KSDAKmv
 +/ThCwIWEo2Xn3/mn3gj9W9aqRbQHJYrqYuoFv8ComqXcLP58Gu36NTDXhV1eJLmMVt1s4mrW1L
 wB4+cI0PI+KzNaNTcanPQ37mqOvtB/+zdtu7vbhwNdxuJVQeyOOiRNNOc3GhwqiTByBG/l7Kuaf
 DfmASYEwYOuXKTy9WhXlouezwG5sWSFeG3GesW6onQXBpciSLtarWSjUQXr++lRHVzu0jIjTaFf
 GWwU1QnHxg8Y4PZYVMA==
X-Proofpoint-ORIG-GUID: -YbMqcbib4ClHEsAc5NRFYQDcT5nLaPI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-19_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 adultscore=0 priorityscore=1501 clxscore=1015
 impostorscore=0 phishscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605190106

The Qualcomm PMIC Type-C devices historically provided their own way of
specifying the VBUS regulator, via the device's vdd-vbus-supply node.
This is not ideal as the VBUS is supplied to the connector and not to
the Type-C block in the PMIC. Deprecate this property in favour of the
standard way of specifying it (via the connector's vbus-supply
property).

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/usb/qcom,pmic-typec.yaml | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/usb/qcom,pmic-typec.yaml b/Documentation/devicetree/bindings/usb/qcom,pmic-typec.yaml
index 6d3fa2bc9cee..7a68423fb97c 100644
--- a/Documentation/devicetree/bindings/usb/qcom,pmic-typec.yaml
+++ b/Documentation/devicetree/bindings/usb/qcom,pmic-typec.yaml
@@ -79,7 +79,8 @@ properties:
       - const: fr-swap
 
   vdd-vbus-supply:
-    description: VBUS power supply.
+    deprecated: true
+    description: use connector/vbus-supply instead.
 
   vdd-pdphy-supply:
     description: VDD regulator supply to the PDPHY.
@@ -94,7 +95,6 @@ required:
   - reg
   - interrupts
   - interrupt-names
-  - vdd-vbus-supply
 
 allOf:
   - if:

-- 
2.47.3

