Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 187E63A2546
	for <devicetree@vger.kernel.org>; Tue, 31 Mar 2026 10:37:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774953468; cv=none; b=K3lf+U+rlQnuVoFxyvrtwqi9cwROln1EOXPay99S1O4d2jU7ON6IzZ20P5kdyGLgkyrH0+6NuI7Wv4VWuxvBz0A8/IZkSn6uat9OUvTHGNV39bv5OM+udIHXbpRzTpi8IUDtf1TEeRxnpVW0h4+TbdUpqBwsxj3bAQR70PR+kaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774953468; c=relaxed/simple;
	bh=HzZ6udZIX0qppZ32YzrIDn8RNYm4NIMigjlFPV3wD1Y=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=kh+nl9oymh2Ws5tIOyQ9MR2zNsHYNlT5KsUr97jSDJMU03QS7d9ldCeyKSJCkQYW4TX7i3vtc+Me2XaupODT1zKWiQhakm9ki9PcAeGSnW+iLUEXRJumPZ6Nhg+yaPp7VuGIwY59g7gGw/YWsgH4k7TDyCfYMKOvAHFT/M9HTjM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IpG/pmsj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WvSzrIqb; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IpG/pmsj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WvSzrIqb"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62V91RY92762607
	for <devicetree@vger.kernel.org>; Tue, 31 Mar 2026 10:37:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=KFts4t4CJZXtd0nDtnnkMx
	cONPs+uLk8hvtA4e7+nA4=; b=IpG/pmsjzqM5bb+Vz6C/RxfqgiXn86wNhYC3Eo
	2dFsfz67ysdXmLVBZ6bs5MqCJakfpeRmGJBMpbRZXWA1PokziP6yg1YQBIASn4Qx
	bT75FAinc5wBOytCjq4dVrsMvKhoiOSVV648ywpxvGZoRCLupXUHScXFr77nYF4C
	T2IUHdBEcCiAbx0UY8VE8M8M/15Mr/HOpOjvTVVUCsmlLDChe0vxv6TzfsSvtlFH
	8TLzCglqM5/OglOpUZnXcxLIqMdZ/c5MmckjGo23jMLLG61URO6K5/zaIjdbXZv/
	mljaGdSEpvUR+r8/XPNwbPacnWikxEn9Rbm4+4DZ6FDMEtTg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d8b930d8f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 31 Mar 2026 10:37:46 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50b802961ecso72078991cf.1
        for <devicetree@vger.kernel.org>; Tue, 31 Mar 2026 03:37:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774953465; x=1775558265; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KFts4t4CJZXtd0nDtnnkMxcONPs+uLk8hvtA4e7+nA4=;
        b=WvSzrIqbJG0xoLz1g2KbhUz4DLT7LIfdoIiBuEb2jnfcgU4QwlHQO25RmlPWUE4tL6
         cXoucZySovxllDYHagm4mjpKFSoTfNEQludjH2zLRXRbCRGsMROIh+NSdJHZFQSVMhL1
         4zJZZzGe3K2GuwRoQJ9GhrNwOXgiN63+Xg0cN0aRa9I3kGN8aR2sGa0Gm0rfX20mpr6M
         Ykt6AXG7MOB6C+PnOFjXpunazrLGdxhzhIQ7bBzJZRlppvw/2QAFSMqEKQtCvp0p5rf1
         Tczpbw8tuEVp9pfs+h5shBDdaFenxrLvYcEWpwV9q98B56UnYxvECeZYtU/r2zXAXqCy
         Cbmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774953465; x=1775558265;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KFts4t4CJZXtd0nDtnnkMxcONPs+uLk8hvtA4e7+nA4=;
        b=q8vEn6WxCF1kpWuiwakc+dgE1qqMlY3wT3v9iYoxtvhwAnzqzzVVTtKa8kAe3Bmnj4
         8WsA1zWX+NCsa4OrvQpGCPoIVog2J9CwmmsREPRYC/JVmStKB7n6XJ1Giul/bLxfWVaa
         3q9HzrOUK1odm0Fz8xLBxiWGg89/mSDaH7nQpn4Ps091F2kkj9uhvEIPjejakgAsM0EA
         KaIeBP91ny+XR256U0uAi/RMh4G9wGhMKFu54T1KwX6vFKQ6Bq2Nnx23or3SlToYqseM
         86ETuCW0lWGjJkK7VGQ1IKHlp+MScrWhf9NqJ0KzfOslB6znainzVPAycL8LO1K/hmMJ
         91qw==
X-Forwarded-Encrypted: i=1; AJvYcCXjjgqUYd+D9SMLdkJIt0mPt1aB+QBYqeVjIjj9Sid0UZEGS2JwtgTNhFh6wIk0qlsCtOs9M1n80Or5@vger.kernel.org
X-Gm-Message-State: AOJu0YxXOB/t3DPGlwSZsnp+++CSLiFs4FJzCWTthXTc5hxUWYoPBwdq
	AajDI3cny9WYhNrcGJyn1Yfoc6KGpU8BEl/UnSpTyyMcz9Q0nvZ9Zv64k/hrmRK3QEbWG/Ri7BM
	vhFgpc7F9h6UD9dzNPd+q7SHbv8nlv5lv+BOWuI/ofSq1aP8Zor/QKnZles8fbszB
X-Gm-Gg: ATEYQzwW5KadkkOl1ZGm5NTpRliyWQJKt2WEffAK8sDQGLpV3IPNvbmQOCOIdamxFhk
	gE6tibiiXWvN8vkWpa8oqrGDUfeawhlJk2+/eBddkY/qnUNlU24X3dWLLMIv/MlajqagjepRe5h
	H4S0P8fmLjJdccg5U1jbmmVmLh6BB6FnUKtJlHCEPTWB8+7g+VS2P2Oon/8iToJRtZiboC4fU6e
	unKwSE65xfud3lcsfi74ielHv+qVY7tp7DibKk14TrGr36CBqpF+L/PERI6NWbp7XeBjPMAREUJ
	p6fCJ4wEyZs5dVDf8C2KjObjz8r8+dOvy2k//BGD01XErenNkevIdtUE09AUUE7AAQ9vmFHOh2C
	/CI9A9bps/8P3nWWQVQdoNsoD0+z05g==
X-Received: by 2002:a05:622a:4a11:b0:50b:3e4d:7ff4 with SMTP id d75a77b69052e-50ba3918815mr247941311cf.35.1774953465333;
        Tue, 31 Mar 2026 03:37:45 -0700 (PDT)
X-Received: by 2002:a05:622a:4a11:b0:50b:3e4d:7ff4 with SMTP id d75a77b69052e-50ba3918815mr247940701cf.35.1774953464589;
        Tue, 31 Mar 2026 03:37:44 -0700 (PDT)
Received: from hackbox.lan ([84.232.191.214])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4887eb5aff3sm34178175e9.15.2026.03.31.03.37.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 03:37:43 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Subject: [PATCH 0/3] arm64: dts: qcom: eliza: Add ADSP and USB support
Date: Tue, 31 Mar 2026 13:37:21 +0300
Message-Id: <20260331-eliza-adsp-usb-v1-0-d8a251be20c3@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOGjy2kC/yXMTQqEMAxA4atI1hPoD4h4FZlFW1ONiCONiije3
 eosv8V7JwglJoG6OCHRxsK/KUN/Cgi9mzpCbrPBKFMqaxXSyIdD18qMq3isKBqvvYpBW8jRnCj
 y/g6b79+y+oHC8lzgum5k/GsjcgAAAA==
X-Change-ID: 20260330-eliza-adsp-usb-8ef2b1b0fc13
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-bc6c4
X-Developer-Signature: v=1; a=openpgp-sha256; l=1430;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=HzZ6udZIX0qppZ32YzrIDn8RNYm4NIMigjlFPV3wD1Y=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBpy6PtcHDwk4QtDAuxp8kNuuW5ozZI0FrTJxa0k
 z2LKPUYHOKJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCacuj7QAKCRAbX0TJAJUV
 VjIfD/wPevrmH/ODAm5hhDSSl3Zz+aJpwVFD2Kf6ktwmsMgLSP8FLgJ1rVRNrXEeLRIC+Xu3ALn
 XJrrwXoQzQLS5q7PPzFqU/wKLKz3k8w7hFVvt1PE9zTEojt/c926LC+dVo5NKP6Dtq1yYNCtrsp
 AFmXN19rsNzVCX7HJV6I1N/shX2y+NsDPgI7/KdCMFt3yVKuSGZfixCdAtdMZA2V4swGW9wRt7b
 vLtQVNLbs6+STLVq2EglmxgVYSerCmtVwDRkGk9cLdVonQLmXaGUDGh26pg1GC4Tpb7L/AICsF7
 7++53Lm+5XHwer8RlyM4GBoMX2McxsDbTu40wMgrxYmLcQ3CgUmPon8hrYcvYMNLpkl8X2UrbK8
 2UpL57wMKdWAE/lRcB+sl2+lHPGBzX+XC14mO+bkvOPwoM88JjGflcBPsp53WkiGcKVeZ8iDIJm
 5X7A/OGlHajxnezgxPfoi1pzynw/T414XykWFhshnW4o2lrjIhv6JozMQJhwCW9S1xyxIW4DcAo
 e1swwkf6qegt4D46YrHSgeD32yF6lhQlXaAvE4SzRqQwxH16vWdyEgi3gOJapeDHuZnQIcUgUrl
 FKwURzkA7fD8GZmIliMWvXveY5q/NpmB5qm4QeJ622UXL7SiHuv+PLDj392gz2/eg5M0lDjZUvP
 KEB0+GI4vIz4jdw==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMxMDEwMiBTYWx0ZWRfXzXfb+MStEivJ
 juUhexOZAOo44SAWTycB33QpHgg12PqZxEGA6DHqaVMpYziZZLLvBmvxLRYdQ+wfz5BXP/bultK
 tKPVakm9shL3Fgss73cFcf6EDkhiV6A0VOLH2JuxWLI/eRT+Jnr65DPDRYcd/JHUNTlBNt+nlkY
 EN6rSg6eOB1gUwhTxcJrdtIU+0WWuhSdl8iHV8Ic4eV3D0XJU2RPkd0WgvbBefxdO9wsLeG4C0T
 yjdd0yfh5ugCTXNYGMvFIOlm8bCjcpfRiVaEcIq3pf7ydRn60vaKG6Y4W2GIKAf1H7thtA+gf0D
 Qanz/525n9/9zUsFyw0GB2yYxkXu3TFAi/JpXA/1PGLN2r45+S149nka81WpQmGXeWoBNHxS1sV
 NXcbzXKFjLYq77WBA0IQhmxB9be1IplwoWRhMeZxru+rAA5ETUaZnoMXREDzNOdEgMOOo7ueqii
 LbE5ZK3LholLN7BqWkg==
X-Proofpoint-ORIG-GUID: 5vl2duIdxo_7aKGz5xFhBrfk2_J6xVKv
X-Proofpoint-GUID: 5vl2duIdxo_7aKGz5xFhBrfk2_J6xVKv
X-Authority-Analysis: v=2.4 cv=NLjYOk6g c=1 sm=1 tr=0 ts=69cba3fa cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=1UCgTMz9MQc3icybWezSFQ==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=54TDNL8im_h_8_rPNEkA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-31_02,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 impostorscore=0 spamscore=0 phishscore=0
 priorityscore=1501 malwarescore=0 clxscore=1015 lowpriorityscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603310102

The following patchsets document all necessary bindings:

https://lore.kernel.org/all/20260327-eliza-bindings-mailbox-ipcc-v1-1-3f1c89bdf72e@oss.qualcomm.com/
https://lore.kernel.org/all/20260327-eliza-remoteproc-adsp-v1-1-1c46c5e5f809@oss.qualcomm.com/
https://lore.kernel.org/all/20260327-eliza-bindings-phy-eusb2-v1-1-1f8a9ad6a033@oss.qualcomm.com/
https://lore.kernel.org/all/20260318-eliza-bindings-qmp-phy-v1-1-96a0d529ad2d@oss.qualcomm.com/
https://lore.kernel.org/all/20260327-eliza-bindings-dwc3-v2-1-28439482ebce@oss.qualcomm.com/
https://lore.kernel.org/all/20260327-eliza-bindings-aoss-v1-1-70df76adc69b@oss.qualcomm.com/
https://lore.kernel.org/all/20260327-eliza-bindings-pmic-glink-v1-1-f9a65495f599@oss.qualcomm.com/

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
Abel Vesa (3):
      arm64: dts: qcom: eliza: Describe the ADSP and USB related nodes
      arm64: dts: qcom: Add Eliza-specific PM7750BA dtsi
      arm64: dts: qcom: eliza-mtp: Enable USB and ADSP support

 arch/arm64/boot/dts/qcom/eliza-mtp.dts       |  83 +++++++++
 arch/arm64/boot/dts/qcom/eliza.dtsi          | 261 +++++++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/pm7550ba-eliza.dtsi |  69 +++++++
 3 files changed, 413 insertions(+)
---
base-commit: 5e59a51e3378f5d31e1f4f8efcb9763db3e322cf
change-id: 20260330-eliza-adsp-usb-8ef2b1b0fc13

Best regards,
--  
Abel Vesa <abel.vesa@oss.qualcomm.com>

