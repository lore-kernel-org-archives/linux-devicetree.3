Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B18A3F20FA
	for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 12:47:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784810862; cv=none; b=jUmBuS391VzZQ5J4BlarCyu3cj3qvmT+2U0Dm+dITwgoYfA9mjpQouifdjptyX/v2sCQVHmaM31jp86qECX8kPRMwypKJuS4fhiSaf3JFvyj2MdeiiCb6M/n7LNGuQBPBxp5SoNjkHuOghAxmAINHfkjFx2LGmXYvJEfcFlJtvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784810862; c=relaxed/simple;
	bh=d3wzqvqi3RaZ+1ikGUF+6Vu02QNHpp/TLnui6RrAYRI=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=EXHTb/dxHzvqvpQiENReU07kaU4dk1WJcPpmOs5uy155XmSdC0c16ibgZnxFNM+yyg8DGjP+3LUNM61mf+iFF4conf1WM+JM5vTjO08EZM6Dxy0LxXyPEztWJQXK2qpPw+Axflf6jYt9stS2Tid8KG3sw9Q+HLCci34HV2Oy1BE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RBM32Dpe; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WvLEaxxl; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RBM32Dpe";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WvLEaxxl"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66N8qxnC3789846
	for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 12:47:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=3fqafl7O5gspbJqw6/ncYE
	0MT3R42N7AhG9AbVb85RE=; b=RBM32DpedH3Cxa+YmYGiQjIwoezsL1ZT5/pQKL
	ZCVCviYsORYbkj7RCLPwxbG/hi87B7jIoT5LSNug42kQURzl+M8+T+UlZz50+qPp
	OrjSwV7RUBA61cUT/MjTR6fXBiBhXMRYgFNg7nNhoZ+oDZ99Q6+L7HSlxKIod9Za
	zCYnv7L8XNEZqLXYVZnUBfyn0AGM+B/Ukd1pYwgweMCZdYvm+BV/ndYZ/CPGBiSz
	q36qJX9eJMNYsuD3NpRGGRgKoT6dDzalImGWNYzuZN+7y0W/ebiqA8AV+Q73UFU/
	v8VmSQQN+KdrBc7UYxvn/tP+qwvQhMTufv8t7DmP4vcUz5qQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fk7b52v62-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 12:47:39 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-5276aa86d00so11315441cf.2
        for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 05:47:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784810858; x=1785415658; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=3fqafl7O5gspbJqw6/ncYE0MT3R42N7AhG9AbVb85RE=;
        b=WvLEaxxlhqNn2wuFIkD5jd5AFlsBKny/bW5nQxdRHhaM/u+tEpe+RkNaHQc8peuD3/
         G5pxq36WVpyVSnOp3BWkqgvUHErYpl+YryAArsIGNQUyCYsItGnUIUdS0BeAxwdA4+cB
         bfgvYkV7voYNk90lNYpxesIfjJh0Pg42tn2CmVh64dhDRS8862u2LHEd+jh3X8qx87n2
         enzEoifeGjqGpx/yzmc7dK3BpK3b4V+DuCMuzyCUO5gt+6m2Al54q40I7EKafOhwEBSw
         +GdbQG27N0/PYesIXBrUYtAHl3aImvLta7QgQnQtsxufGHcv8fFRBU7WCpUkzC+QiXL7
         yQ0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784810858; x=1785415658;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=3fqafl7O5gspbJqw6/ncYE0MT3R42N7AhG9AbVb85RE=;
        b=AvmLlig94zqEK9l5N1kNibgZ41Bab8/oGKeDwj/lehUAMrJN7QMiVTkmmT15W/R/2W
         cvs5+5U+nO9CU5br0i3U6IWdpvX9PsFzvaqs31mm474yovCywupycfsgukSs8a8ktmpx
         hCU7xVZ2K+c5gg+F6/cqui1x3mO5Hcd2tw/9OCdFc3vkyOC3VAaR4tYPrJGOPdixaCrx
         9UF40gMfl7cK7fardihxCJK8c0L+RsMwKi1d6qxSkn3bXsum3KhKU6ds09NEmMACuG4B
         3xhBvullGiaKsbMCAsEZSQNdqSnoDpOyKmvP2gs41BYFQm49LrDJNcVFvESg8qBd9nur
         qIyQ==
X-Forwarded-Encrypted: i=1; AHgh+RrGCFgzms6biu6wmQ9FFwAbCi7IdsldlU5S1MH7Ii5uRZPT0B54SlZ9siPtpx/ut/uP6MQm/kglHNbN@vger.kernel.org
X-Gm-Message-State: AOJu0Yxqkuz+ZTtTMKWKp8qKd+W9GV8+O3+Mch27SStELJAgcuQchVjf
	4XB5iy2WmFa2MOWakDuX0oE6bZ1oBtdkrhErbeZDyWzBfqCWsCsb023cIRMg1uRpqrCQqPCq3Ny
	A8Dg1Rl4UUjaXtLYD3Wf1Ip3ajFu0c4vUQ8MQdUVmKqoTNtsCHbNqIVQlcqfit4kF
X-Gm-Gg: AR+sD1254EhuGjrzmAxcca+/zmrZ2GFBZQruUykv05PnXBHLikKyl72l+qnPPpspT8y
	o+Uu79kICfImVhxCx8qfL3FrqBXNHCoVQK6BvaB6PIXfC/wF8c4GFc2IsCYW+H3HOX/KUllJker
	huHfDvvB/59pUO/WJjSJZWQGlLh6Vww+QbLu3WlXs0OMtuzmXIaRRCYMQ6jE6vMEsHqEP99fKht
	K5eG8HDVXqhl28WMTHixbTilWSW0gmH5Hh5LAoOpEBCgrWKibtHElJmAUSixPH8MK3gfItAkzm1
	2yici6NHSqkNCHdj6mzE4qILVTjfmiPemNVtZSp1Mj7n+ZkMqwuM8ZkZZFuXlcO31nKqw8PcNw5
	x/Twra89I
X-Received: by 2002:a05:622a:4d96:b0:51e:49d7:771f with SMTP id d75a77b69052e-5283defb54bmr24391061cf.57.1784810858574;
        Thu, 23 Jul 2026 05:47:38 -0700 (PDT)
X-Received: by 2002:a05:622a:4d96:b0:51e:49d7:771f with SMTP id d75a77b69052e-5283defb54bmr24390581cf.57.1784810857599;
        Thu, 23 Jul 2026 05:47:37 -0700 (PDT)
Received: from hackbox.lan ([86.121.163.114])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85c531afsm14814283f8f.24.2026.07.23.05.47.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 05:47:36 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Subject: [PATCH v3 0/3] arm64: dts: qcom: eliza: Add CDSP support and
 enable it on MTP and CQS SoM
Date: Thu, 23 Jul 2026 15:47:25 +0300
Message-Id: <20260723-dts-qcom-eliza-add-cdsp-v3-0-b535200996ed@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAF0NYmoC/4XNTQ6CMBAF4KuYrh3TTsFWV97DuCjtoDUKygDxJ
 9zdohsXEjeTvOTN956CqYnEYj17iob6yLGuUtDzmfAHV+0JYkhZoMSlNCqD0DJcfX0GOsWHAxc
 C+MAXkGhtGczKW48ifV8aKuPtLW93n8xdcSTfjtzYOERu6+b+nu7V2Pu/0iuQkGNOJjcOdSE3N
 fPi2rlTKp8X6YhxrMcvDtU0h4kjRTkWZaG9wglOf3N6mtOJW2lShpbWaJv94IZheAHJpfludQE
 AAA==
X-Change-ID: 20260714-dts-qcom-eliza-add-cdsp-0288fd79c8c2
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=1542;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=d3wzqvqi3RaZ+1ikGUF+6Vu02QNHpp/TLnui6RrAYRI=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqYg1jfnamRUrzCr0DLx2fnn3/OoJSYW+ijXN8l
 XPY3a2xEaaJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCamINYwAKCRAbX0TJAJUV
 Vh4fD/sGuhB1DSZBQrHfAvBkritTqTGI1rm3oa+jV8K5FS5n/XXDIEaVHVY/5sZ0NeBH4y7NjoO
 05cDhO1voASWynoX1ujsu2tb0HdcnoIEYXDpkLKMBq9uApuUsIT+OLPYg8QCC3ulcfxQHGY+btk
 mAlVfXp2FVouoZYqufB5nyB1xlDtrB2Q3Pc4UT/aSXxtTrO6GIVyRrhErcyTZwfDsUIwuzqP4mc
 umPDL3XBE0Ay8LM0xLzyw3U/nBDicD5NtVWt3+K7WlvhZqyoXO/raTjANpcuQ7BaNHQevy+XP2Q
 T+7Os9Et0I0RMQozefAZztZTYbDIn2lOCc4F+gUTRYmqEFzSsr6AXz58P2eaQ76nsmlBCfjiTh9
 GsgZuMKE5BTC7I+B2YwuLRGylQIgerpuiWgT/qF9c2YHK6IvnoqFTxyeFOboqu4qEsPaZfOD32g
 U27OF0l+pO9jvW4HwZoY0Ee15zpIspNOD20WbnPd3MkAFCgNmGEacDOj18ywLfKWrjZIaMtD0kB
 Q8wGape70AFVKNFUThq96bs7CQT6omHlpm9SPf2mv2F1FOamvDCfzxfXZYvdCCpaIARB7RRXged
 IGfUbIwceoLknekz8z/IOmE2uz7f3DkAXsJQ1hRiHqCCWsApxyT60HiOl1NibH51A5RpWe7BB4U
 0eAGHBgFT6vVOtA==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIzMDEyNiBTYWx0ZWRfX0N0ZOoqejYGX
 50UT8KY4JiklRoHMS4ocJrWynl/bj3gBRHdGlNwc6b41wD/SCEmHwyvhchougtV7lLR3oBI6Exf
 bZTtYgU+17utUPdBqOOTUIVQWPAX+jcwsqQGl6rhQk55wtba+pnHeeKtWYDCshh71H/8MI4fQk/
 jUHSGojdIOqd/XWQyIg9xP1U20gXjRqivlKcAdb0CfRgSNFl2DPR8G6m5AMNuNiplLmUt+jWI3w
 fLa4I9cItSFniqOAB/ZNX6CapKelbXpfc7YgMgJBhD0g7ACnnevBX/Z1n2K97WctBajINx8+A1o
 yhWovpgONG396s54AhtbZnMil01QYFIH2/H3Mb6QSMgSi8/w4qHrwdpEV2c7Bbbi5fkTX+WQG9B
 ZuMqegrQrfY6CyHBbLkzXs7ZzslIofEFD6j6lL7Jvoxvu9SEckiGHgACc/Mt5x9MWyNcVO9WHbq
 WRrAuv9n6J2tVg6eyrg==
X-Proofpoint-GUID: n63F9_xEPaTTpwMsvXpEBjZyfctNSvvp
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIzMDEyNiBTYWx0ZWRfX210a+tfsXgto
 Uij3RgUQBsuCqd+Tx4FlT3WlGeoDOnDavC4Bq1Q3KnZP3o5VJERCk/NVizTlJtG3dXkZKXstSbg
 p+WwGDVbu5ib+E8mCW003bT6IFKVuSY=
X-Authority-Analysis: v=2.4 cv=btx8wkai c=1 sm=1 tr=0 ts=6a620d6b cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=6dw9+iwJWV8PcCi9M4lOBg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=bC-a23v3AAAA:8 a=l8yhyBgH5Rc5wHxOoCYA:9
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-ORIG-GUID: n63F9_xEPaTTpwMsvXpEBjZyfctNSvvp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-23_03,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 adultscore=0 lowpriorityscore=0 impostorscore=0
 phishscore=0 priorityscore=1501 spamscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607230126

Describe the CDSP node, the glink-edge and the related SMP2P, then enable
the CDSP on both the MTP and CQS SoM.

FastRPC node will be sent later on, along with the ADSP related one.

Driver support and bindings update are here:
https://lore.kernel.org/all/20260722-remoteproc-eliza-cdsp-v4-0-04c6eee70cb1@oss.qualcomm.com/

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>

Changes in v3:
- Rebased on next-20260722.
- Picked up Dmitry's R-b tags for MTP and CQS SoM patches.
- Reworded DTSI commit message to suggest that FastRPC will be
  sent separately, as suggested by Dmitry.
- Added the GLINK edge node.
- Link to v2: https://patch.msgid.link/20260721-dts-qcom-eliza-add-cdsp-v2-0-e1e52bfb3c12@oss.qualcomm.com

Changes in v2:
- Rebased on next-20260720
- Picked up Konrad's R-b tags.
- Link to v1: https://patch.msgid.link/20260714-dts-qcom-eliza-add-cdsp-v1-0-525e757a23b0@oss.qualcomm.com

---
Abel Vesa (3):
      arm64: dts: qcom: eliza: Describe the CDSP remoteproc
      arm64: dts: qcom: eliza-mtp: Enable CDSP remoteproc
      arm64: dts: qcom: eliza-cqs-som: Enable CDSP remoteproc

 arch/arm64/boot/dts/qcom/eliza-cqs-som.dtsi |  7 +++
 arch/arm64/boot/dts/qcom/eliza-mtp.dts      |  7 +++
 arch/arm64/boot/dts/qcom/eliza.dtsi         | 75 +++++++++++++++++++++++++++++
 3 files changed, 89 insertions(+)
---
base-commit: b4515cf4156356e8f4fe6e0fdc17f59adab9772f
change-id: 20260714-dts-qcom-eliza-add-cdsp-0288fd79c8c2

Best regards,
--  
Abel Vesa <abel.vesa@oss.qualcomm.com>

