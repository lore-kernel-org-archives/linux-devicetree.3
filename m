Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBE403A873C
	for <devicetree@vger.kernel.org>; Wed, 15 Apr 2026 07:53:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776239601; cv=none; b=k5GhMao/ZRn2UR89DDfmPAn2l3ulsGwOUpC0tQX6j6MxfiTomWSc2he6l4XbfYDH6MWpm5DRinqBhMZCdoHCXHlDGJe/X+/qge25lmyb3YJstJ52F0DncP1sfvlUU4e7i1/y7lZSPTGVNd9nuvSGi4l3RWdNKv5ssi/31cODipk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776239601; c=relaxed/simple;
	bh=5aYWF543kVLpgx3U1ivXA1tZ1qeoebqfz5d3WEy1zSA=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=JPEcQohZSLF3gxKvapSlmval5Pi9TTb7fehwBiAepUNY3LAwKmY1oahJw1JThUNQl6c0R7DLM47kO5eYejZYD5DLaPu85tF3vfODPMZLtxJfWoCfZQeYONLjCyMD/31/ycYvuAjRvCXmUqd76Q72c105OVoT7+R29KbOY1Druqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MmCONaA7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=c5wz7ITE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MmCONaA7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="c5wz7ITE"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63F42E1Z3059023
	for <devicetree@vger.kernel.org>; Wed, 15 Apr 2026 07:53:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=+SP3Imrrsn4PuioRpgBKN1
	A+uHgmoN9H7CQatdg9/OI=; b=MmCONaA78PRny4HYTUiDyKGTPSyOVVWyQ7nIpm
	oA1P8yipNUiqv7g2FtLosAMBkR6hBVWZok8+mMGJPz16VLSxATzGBeuBZy/7MQdK
	aFC8zXk63j2wPOePSrRnRBsWolzplQybvxHQl+3ZKEpQAPCKykLzfuig750jrJsP
	dRJaufbjq6mRfzTt8nAG9fdSWQP+PFcQTNa/YEwJRcC6/t3pY/9uzVOdVNDf1Mvr
	yTTmbadH2qQkRiq6XlR+OrYsCOWPvjxX2rhk1nEbVzsXbnSuY9mja8GAByjb9PdH
	XolVY2YLOKu1L69iJaeMIpeiLKoFrwIO1ZnO2PKQxLao/v2Q==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dhtept7ag-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 15 Apr 2026 07:53:18 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50b4076dc16so173951211cf.2
        for <devicetree@vger.kernel.org>; Wed, 15 Apr 2026 00:53:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776239598; x=1776844398; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+SP3Imrrsn4PuioRpgBKN1A+uHgmoN9H7CQatdg9/OI=;
        b=c5wz7ITEnaR2sg6gKyEapRD/ew1GDuE3yPo1HCBqRViFTBolLb6Pmb1WcD2/AKtDah
         5IGU0VwWcJ1Gm0jDxUF7o9CE6a/kdvhhhw1aUvIdC1wHZSYiv4P7AHFmRIva9sOloHLj
         iRUY4QQOgZg7BVfnypjoVxTWVI8yUSvojRS1/K3LnOhGa/elV581q0otiuKQBko9WLbt
         seBzVFCXzvQtY83kSGgPb/z1zKoSOtjtQVlMB3ONXoeJZ4XMLEIL6uRwd0oROxVBM3qs
         4ZFatY97bnRN4GAJfIdGFTYHMRGlbuNzUTE3D31zOfrymW1rPsGnWRnJXyFuV02ChDq5
         tv0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776239598; x=1776844398;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+SP3Imrrsn4PuioRpgBKN1A+uHgmoN9H7CQatdg9/OI=;
        b=EdYlsnM58HUrXv2cGAXF8Zx5y0TmVNQNYJU+eN5RvmOiwU8NEz+Pcki1prDk9ogi9e
         4I4KFRcpw3pRTb2crXo7OLnkm3E2bsDxWDfADe+FLW/day/GVo21JmkRehjoAIN+cuzG
         r3mb2qhK913PJLeK4UTpSGVGJJQTp0RvkBHfIf7CORgSzjxD/ULYRItlEr3xE7288dnl
         qTPJOw8MPaG31n8121bNFNWKFWavbIURQ0n8h9Bam/E4sec2PO1ZhLm/EMGKn90hoqjx
         znjSTYy6msYk+ERKpdoxnC/lAjQwBZt1rHS/TyOR9Z2RybXaWeSnbBz5VOTPs6AySQws
         PrVA==
X-Forwarded-Encrypted: i=1; AFNElJ88QftcMNMNKsrCqqLazBhLLl5mHSygo/KyKOyII3bxZ2MIV80aXkR5VYSgkkuyINFSUNC5atZfAtTp@vger.kernel.org
X-Gm-Message-State: AOJu0YzKGHeDjtv9zTAUZEZQzMLYbSy1OSBHyTxbblRxoCrjaSy0mIAy
	FIYDqy2rLrzsYdP1W5JH/gNk+p5Ch1ic+7LmrCP43K6JcjBiR/1MFCI2bBoJZyn4nZWhhtqIT7b
	fbWfq9e6oC37WxmNXUqyvLTNWKiTo53A4lOasbehjI/J3LgeEdIQS7MyeJvt242Zx
X-Gm-Gg: AeBDieufPL4++4g51c2xAdiOitpeW+enm2K7cBzj12IZKq97vLP6A++Unw3UwsOKCTV
	eceoXVTSAnTxgP2p/v8TqtY6yL4XrpSD0YitRZKsPLRna7T6EAHq5IWIatYIRW5hNRo+ykCsfw7
	vraiazuvnv20QtTjiGBgLX2SRANufy/fBOg06zC5YKttXML/fO3/2njRMfBKb/ej65Q37m4s3sz
	3OEHrOdLGQcR4wDlEpPbojq7h0iaf2ceUTX5ISY1GTGyTvTFiXG+/5pTrYBvi/qheAn578ae9zB
	9XJ+eSCYd56CIx1XDa1cihtcAIBStcMsaDgOgjLK4vyu6eoB3QaFXbogV/8QOYgkRtcvhc9m3Lq
	9kGmPQU//LE2RG8fc79veNVvW866myuLwVD8=
X-Received: by 2002:a05:622a:1247:b0:50d:91cb:d715 with SMTP id d75a77b69052e-50dd5d621b9mr327508481cf.62.1776239597993;
        Wed, 15 Apr 2026 00:53:17 -0700 (PDT)
X-Received: by 2002:a05:622a:1247:b0:50d:91cb:d715 with SMTP id d75a77b69052e-50dd5d621b9mr327504161cf.62.1776239588242;
        Wed, 15 Apr 2026 00:53:08 -0700 (PDT)
Received: from hackbox.lan ([5.12.73.26])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488f0e7ef99sm19334975e9.8.2026.04.15.00.53.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2026 00:53:07 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Subject: [PATCH 0/2] arm64: dts: qcom: glymur: Fix USB role-switch
 configuration
Date: Wed, 15 Apr 2026 10:52:55 +0300
Message-Id: <20260415-dts-qcom-glymur-usb-role-switch-fix-v1-0-409e1a257f1f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANdD32kC/yWNQQ6CQAxFr0K6tsmAaNSrGBdSCtQAI+2MYAh3d
 9S/e3/x3grGKmxwyVZQfomJHxPkuwyou48to9SJoXDF0ZX5AetgOJEfsO3fQ1SMVqH6ntFmCdR
 hIws2xOXenU9pBMn0VE73r3K9/dli9WAKXzVs2wckorSshwAAAA==
X-Change-ID: 20260415-dts-qcom-glymur-usb-role-switch-fix-fce43098888c
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-bc6c4
X-Developer-Signature: v=1; a=openpgp-sha256; l=1352;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=5aYWF543kVLpgx3U1ivXA1tZ1qeoebqfz5d3WEy1zSA=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBp30Pa72DMteI2bKbcCiVeXzMAj/cTgk+uG0VYo
 OEE/i+uLPaJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCad9D2gAKCRAbX0TJAJUV
 VmtLD/wNM+NaEgsTNkHW3lAG6pZwIXdmBbPYLjUwQE4HQ/006J+vtyvL3vb7ZIIDhEcyaB21d17
 drTWL55ihzb3PNCCgdAe21Tq6ayfrrlGCxVNHS+XG/CwQfIuClkQGNKrWB2ODdMB941KcdH9ePl
 bECkxK/PW20zN8aZCVwAWlO2dl+COZEjIOaN1jeH6UuNbAWyGPMJv58VoKlpSbJNh/LK2yrUUY3
 5LKrZBi/ZBae7J66eGWcRXHjrr3O8Le+srLMgXyZ7gQsLtM/nF7BzXRJmQ5mgHtemYFIn8wJssa
 WhV+gZzXMtFFAQbwBQWi5SApIbFayEvgCahDuwkJVMTSEsIa0LgyNBKgeQwCl7OKx7bBEpD+QbT
 H1Jkoc0GMFYCQsjdzwdeUnubm8gGagLotPDmTRSvBht18GcmR20518CMAzwUsr4L3QvV3oiAJEE
 PW0SKB/26L8gQtsQwBvyWCaq1pYyIJbiNLq6bx+IyayeUI26Z8EHc5wWRQQxzm9cczHEBN4hgVz
 5mht226iATGmsZfROSR6rw6a+9JdchckRZ/PJ927M/SNWY8bPgccNv4Fz3eKCBLVWwh9cNOlVBv
 0+A0NTQjbvvlGVbEMIhiFd6O+5xwJeE3/VdPyqwxBKmJe3tcEGhOlbZrHu69NSaLIPCS/Luwdpf
 r+uNUIPnNUrUBhA==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-GUID: CKvq0BBEmqyAPCGtm8dVlaaLn4x2XsR-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE1MDA3MSBTYWx0ZWRfX1Xhxc/XhJ4jv
 gikjNaaN3UE1IvCEf7Pt0jsLmwntP8w1EH5H8u+dwg0xVritTUjvobHVTAjUrVT5UTqj2v6qPtl
 944WL3BxX6QjdGUH8nphh64Pfs5qaJzxm07WmSRr7I50h2iL6/E+1YYJmm76wX9UvwKYu6qm20w
 SSD5cqVXN1XjZMXD1chrmXZEo/PPZHLQqO9JHuShoNihLtXXOW7c2pXOXbg9vmx1Jld37JeQQPj
 QVCWsHYRYIPD4eKK9XgtkJByAQNmdC2DSgUtU4ZdkzBoWpLSMtywZr6DL9FRD18jpVa8QBlNW8d
 Qebqd769JXMDIGuG+zvZ/deZW8NchW6xwYO3yoPK50SsTg7OjIoYAY3BEoWK6FiPK3HI6ZbgTv7
 wg0geVBY6oGXmwjwjCK5kxW8YLmBBjE2deG39FoRV9xmqY7hBRVfced9Od0u8uuhkoORwA6PvUS
 uQm1/1Yrzs0hFLScVIQ==
X-Authority-Analysis: v=2.4 cv=CoGPtH4D c=1 sm=1 tr=0 ts=69df43ee cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=ub0iOiB/G/eXZwGovfl9ow==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=6ht0NzhcwQN5_5-c278A:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: CKvq0BBEmqyAPCGtm8dVlaaLn4x2XsR-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_04,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 priorityscore=1501 bulkscore=0 clxscore=1015
 malwarescore=0 spamscore=0 phishscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604150071

The Glymur USB role-switch description is currently incomplete and partly
self-contradictory.

At the SoC level, only USB SS0 is currently described as being able to
switch USB data role, while SS1 and SS2 are missing the 'usb-role-switch'
property even though the controllers support it.

At the board level, Glymur CRD forces the two exposed Type-C ports into
host mode through 'dr_mode = "host"', which prevents them from behaving
as dual-role ports.

Fix this by first marking the additional Glymur USB controllers as role
switch capable, then by dropping the forced host mode from the two CRD
Type-C ports so that they can operate in their natural OTG mode.

This restores the intended dual-role behavior for the exposed USB-C
ports on Glymur CRD.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
Abel Vesa (2):
      arm64: dts: qcom: glymur: Mark USB SS1 and SS2 as role-switch capable
      arm64: dts: qcom: glymur-crd: Drop forced host mode for USB SS0 and SS1

 arch/arm64/boot/dts/qcom/glymur-crd.dts | 4 ----
 arch/arm64/boot/dts/qcom/glymur.dtsi    | 4 ++++
 2 files changed, 4 insertions(+), 4 deletions(-)
---
base-commit: e6efabc0afca02efa263aba533f35d90117ab283
change-id: 20260415-dts-qcom-glymur-usb-role-switch-fix-fce43098888c

Best regards,
--  
Abel Vesa <abel.vesa@oss.qualcomm.com>

