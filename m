Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 155923F99FF
	for <devicetree@vger.kernel.org>; Tue, 31 Mar 2026 14:02:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774965782; cv=none; b=C0pKEJIzQ7/3lH4xrIwlc1UXGoaHaf3Dlml/4RF7XZqAXRcnYGOEFmDdrVcX8vnACeSRmEQKChupjTerMjBVmXez0eEwRSuv9DvWox4nMmoDzgr92GPYjz/LEMK5iZc68WCtse9DOvkSNDLVLeSwJavSQdCwjAoz9WnvpiMzidU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774965782; c=relaxed/simple;
	bh=IgGU2Qi4nWwMJY5v3HXriJsfiYRY0AiF9DVkDeg8kHg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=spBxRQUkHSKC9QGCq/XsJkQ9cjFIGvEzc6awSLgoWOCLjibtiKq7CP67x7RLGsgFSgqDnqaG+27GvEn4O1hj6S1MngY8ckN9FYJt+m5VFV+UrB1QCzPNuoA19VCuPGHrOWv/Ip30dau25tsgw9MIdgJ3y+PSfxkJ+4/biI7NACk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BJ9l9Qh9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GpKZ/eo7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BJ9l9Qh9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GpKZ/eo7"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62VBIuM31090272
	for <devicetree@vger.kernel.org>; Tue, 31 Mar 2026 14:02:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=6c+MDxLwjH6fqBjujNa5uF
	kT/1gDt81aZlpAv9an2SA=; b=BJ9l9Qh99pZXvNG2R0hF6FUvBBFgvr4ouuMmHv
	+EJIJSywI1kRcdLly2p23TyPfw5CTSd1J5r5xXkrubhEpq4cfAdDO8eqC5obrnnT
	Kv0lXn19vjzagtjNPrkIm8eKc+a0XINZA7qAvovv38nfnew5QUiYPCe7Edrmd8+h
	pJrCA8xbahvxuGctLBjVJ6lt83JR3hNRLzUal3zvrJ8UO2vloY3mVm6hqjnfPNbl
	XjILtFyA5XJy4XYaR/HTn4j8vTIm7N8d45Q/VacpbjiEJDdC2mbaka6e7p6HiQq/
	FCgVA2d6CO2ouLEL7JAYCFIm+AAuDu1h59crF6OslbH4XpgA==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d7trd56sc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 31 Mar 2026 14:02:58 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-948476b92e8so2560594241.3
        for <devicetree@vger.kernel.org>; Tue, 31 Mar 2026 07:02:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774965778; x=1775570578; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6c+MDxLwjH6fqBjujNa5uFkT/1gDt81aZlpAv9an2SA=;
        b=GpKZ/eo7bVrWa+DkTHjqTb1KQIc4d4We9cfhu27Si7B/Y3dd22y9+rfKfzGMacFphE
         n21aVtJN2qDvA0lQJjAxyhRLP1eAN+NPIY0zqydrhoL+I3ei9yZPargV20wcnUmtGqc9
         LYLmjaDJmPq71M2UXCIp0PVotsvFgMj3y3E9yEawz5qCGjDMt0tUmKhXEN7xLjKYXuXR
         q781IsKcl5PRz85rfoT1S1w4fq5/lNs5KG93mRJGDGTFGZH/p1EXPW8/k/oE2HMIzVuP
         vyDoVP4iXKPtf6iFhUeyh2lPwGmpukstI2l7UeBrPehffZBL5dy8ATlS5G5qWCsGhg5v
         EkHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774965778; x=1775570578;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6c+MDxLwjH6fqBjujNa5uFkT/1gDt81aZlpAv9an2SA=;
        b=TurCZJvR1JGUfE0gcAt2S1/rf9aO9k8sfJHyt6JAm2Y/JHhtR/i6i14lvq9N0Ms7VJ
         WqcrVmAL4rtyiRd69hGu4fB5fa5ukQrKCCyeRMAY7rNQaFuzdp9Hjp/8eOW3YWc+B36U
         dpncnC6oFDr5UciS5mRuu4KM+clGdnFexmFYIqP3ChQU6EwKdpMJCZ/mpcc9/IayJ5Ra
         a9pU4reByi0CIH5h8Ise4J/9dVOV4GveAMTR6R+rqgLjV0YbyJ0IHRIvZbsuGMFg0G1x
         iPs6gK/v+wzLTZO1MrJV1Jm7xdqhtyPxusKei/JGwe3RFoNy95YRJK4NPYnoT2kRnsOK
         8f/A==
X-Forwarded-Encrypted: i=1; AJvYcCXIoL1rHafG3z9u9qmk9+ngTK0QAnLzGmIGQrnnabg4svtLztWgznUFRfKVYUYUxXEPNMZGszyLATYr@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/lWuxwqYp22tyVmkXWByLBENiaPZWpNwJK+u2XOxjvzXZwlDk
	Ko7gy+nPRa3Q4YCGeWnZda8AqqBbKxwLHObGer1T8LPJkggMAoU4z89RpPn+Gsb/i4V/tI6JdJm
	LTlWm9z+qNYiiqcSKq0XUqyC1Oo75p1ooymqM/Ef+Tap2DNVwPi+EAMCmgnX7Lpu6
X-Gm-Gg: ATEYQzyl08flvDkO8niSxRQwZ5GBjJ90AvzVtzAlzd1tJk+DhPiZ3v31HmU5qD5jlH8
	cKkzHwZFAD+XUsfeF61cpfyE0GkTJasoTTw+HoDnoK7enTBMYt5Y55qL0nbeYiZLvPrT11GpcbI
	Th3RHt+8/7QmNZ8i+mVnzTqZdaMPRf+wS4kTP1qHxTCDyMipGxeCmFKwdwBW+G8UhgIRQu1Yh6t
	BVVVTMqA6S/rHe1XcJD5ntILZXQADe8PsZz4FnpRvSeBbfpDNyNNAbCCUya4O5Dp3Sj0ohENt5S
	QR4v3nsyZOAG181SO1DKFSluE4EVQI3UEJGlg2x4gjSu8nd67HjUlkpSrbd6Ut2kG5BMcTyVz28
	XTQieuGIpy8mjSlcXmdw5KhbcZbbxchClh8nO8B7uhXsS
X-Received: by 2002:a05:6102:cd3:b0:604:e18a:ab41 with SMTP id ada2fe7eead31-604f9101b23mr5641090137.14.1774965777723;
        Tue, 31 Mar 2026 07:02:57 -0700 (PDT)
X-Received: by 2002:a05:6102:cd3:b0:604:e18a:ab41 with SMTP id ada2fe7eead31-604f9101b23mr5641027137.14.1774965777176;
        Tue, 31 Mar 2026 07:02:57 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4887e9630ddsm36610895e9.13.2026.03.31.07.02.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 07:02:56 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH RFC 0/2] arm64: dts: qcom: eliza: Add display
Date: Tue, 31 Mar 2026 16:02:48 +0200
Message-Id: <20260331-dts-qcom-eliza-display-v1-0-856f0b66b282@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAjUy2kC/z2OzW7CMBCEXyXac1fy2o1xckXqA/RacfDPunXFT
 8gmqAXx7hiIuKw0q5n55gLCY2GBvrnAyKci5bCvgt4aiD9+/81YUtWglbbK6BWmSfAYDzvkbTl
 7TEWGrf9H+57YxBydbxXU8DByLn+P4i/4/FjD5vmUOfxynO6Vi23k41yx0+J9UfvmyTRqQfkkA
 84S0HHWgYLKkUx/ontP8MJYV+3KVMdn65zpfL3ZkmaVIjnTtp1PuSNLmdoUdLeCzfV6AwPOiQE
 BAQAA
X-Change-ID: 20260327-dts-qcom-eliza-display-64de3cfc8a50
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1620;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=IgGU2Qi4nWwMJY5v3HXriJsfiYRY0AiF9DVkDeg8kHg=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpy9QKHOOaaee2RRE1qO/JO29kNJR2y2izRb++J
 pjc7khaSj+JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCacvUCgAKCRDBN2bmhouD
 13uED/9YLytl+GlMoU1XT8lizljkfUjwb3d9e+grYJRYbrx6tAdzwN3WrVdCZjM/5+lNel6nXg4
 DYncGi9n9XxfMM6lbUXsBy0eONp0RBDnzfSRnGqPqVNwx/3fFs8XsCpkfa6CwRNTwiyocuqy+Ws
 i+s2wl8Bf3ee4qEGvFSDMhGwqeNFFqoeSZh0DKucJ8Xi1ET8YI3Z9IUBoDUWFICelwc0Zm9mAsQ
 rA6C6haiGVdJkCtBnDPaxHZpcYw3W9tgFCSityR2CphPirEfdF2l0cjrzfnRlYZJep5JvFwjoD1
 Qww+COWTKSfETvnwmRAkjZHJZaAhtQ/7K9vqkGmVdVYPtmIFHlYXhldmvWo9uCYxiTzzEW8md6Z
 lVYm1t32BEmC/KcuuX2+V5A5EhXykKctrhnmd4WZmuetFm/xHFkBGX49ZLWr1CzThTaX3+5yDzZ
 oVch8FaZI3EVMJY/U4XP97r93rNHChTYa4+CwcAeMh6O2zq+euZ747qsFe5lnaPvN9FDm5lUWJC
 /PuE87+ZsIh0hQIWZAG3GNk4xytofOgkmfqgaSx+yNO6PMK950H8wtnkgmG4u8jhlO7DtU3uo+s
 qgRq+gwvBQi41OH0fpclzLJg1fQoYhpjg4nBJC8S/nGdXloz9jqh3bGjfozxTtjc9fva8YD5cwR
 xitn2fDqMNhJrug==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-GUID: kbwTHpwJf2XjqUPdXSB7wXIiMoILjezB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMxMDEzNiBTYWx0ZWRfX0jNNTyyD89di
 B+4fKnTWpGlIorydAa3fvih2kmew2e3A1HdvBMOTdpSgKU9AbT3pxmBVtD4+4xN4VvC6pL7oNsY
 1Yem3XFh+Foz/5knWwjz0UL15FPuksBKsyRvBt80hKjq4KHrV8CnJJ7obp14sUMiL+F8E5mS3Fa
 aZZU0CTtX+ffwhN36hgUcaoyh8WcMwC21TUoLos0guSt4I2Mr4MBkRpx+addVKLRnfPUtjIRFaL
 MU1ZQ3tAsDRbGD/3g/dr8e3+D/InHcDdj56Iu1j+Z5OWSA9+48jzkR51EBzwt+4YLE+vt97N2mK
 pzlHddxpKSFIy64bhjliZAsdFmmRk2ctuNY+RY/Y0cx4ijDdf+uymllpJgvCRUDBnqF5S5ZyQAr
 mFq4lJW5s0lgqUwJlWTdE4+6E+Fe/kPnGs7aY+hQ0BNC0NSbfhfB3Y77lnC2Ft/SWDnqnly0ROw
 /qn0yBa4ee9fF2mIQHw==
X-Proofpoint-ORIG-GUID: kbwTHpwJf2XjqUPdXSB7wXIiMoILjezB
X-Authority-Analysis: v=2.4 cv=H8/WAuYi c=1 sm=1 tr=0 ts=69cbd412 cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=CeEFVkMbncPIoWIB1aUA:9 a=QEXdDO2ut3YA:10
 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-31_03,2026-03-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 bulkscore=0 spamscore=0 lowpriorityscore=0
 clxscore=1015 impostorscore=0 phishscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603310136

Dependency
==========
Depends on USB patches, which are being reviewed, therefore marking it
as RFC as it cannot be applied.
https://lore.kernel.org/all/20260331-eliza-adsp-usb-v1-0-d8a251be20c3@oss.qualcomm.com/

Unmerged bindings used here
===========================
dispcc: https://lore.kernel.org/all/20260319-clk-qcom-dispcc-eliza-v3-0-d1f2b19a6e6b@oss.qualcomm.com/
(DRM MDSS bindings were applied)

Description
===========
I did not enable DisplayPort because it does not work on my board and I
don't know why. I double checked QMP combo phy and other bits, and
everything is looking fine, but still no USB display, so maybe I miss
some other dependencies as this is early upstream.

DSI panel works fine.

HDMI is not yet ready, because of lack of hardware with HDMI.

Best regards,
Krzysztof

---
Krzysztof Kozlowski (2):
      arm64: dts: qcom: eliza: Add display (MDSS) with Display CC
      arm64: dts: qcom: eliza-mtp: Enable DSI display panel

 arch/arm64/boot/dts/qcom/eliza-mtp.dts |  63 +++++
 arch/arm64/boot/dts/qcom/eliza.dtsi    | 433 +++++++++++++++++++++++++++++++++
 2 files changed, 496 insertions(+)
---
base-commit: 1f68839a688f612e0dc183559adf9161f15db297
change-id: 20260327-dts-qcom-eliza-display-64de3cfc8a50
prerequisite-change-id: 20260330-eliza-adsp-usb-8ef2b1b0fc13:v1
prerequisite-patch-id: e0744310fa58e080587218e62aa6686ed841689f
prerequisite-patch-id: 1b4e40eb33adf28c8b6105f25f6636f82239a962
prerequisite-patch-id: 4671af784a83f9ce69cc2c502912698476ee7719

Best regards,
--  
Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

