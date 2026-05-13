Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA8733D45D4
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 07:41:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778658086; cv=none; b=gwufF7t+YCxy1hYy6PfVZGeoOaFNIzI5ocgaXvAREo6TbXsOT5tgiL3LZNEe69tJJd1ppHSd/cf9yEeKvKWG81QB4uX7CxQMHQyMSeuRGHZObns0NCNNV2Qdg2RxqrjP1xpt0r29dwvcc1h99OuEV2097z3t1A4PCjNA6bK0oaM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778658086; c=relaxed/simple;
	bh=oLOiJcuAPPxdCwCWeNt0isxb+Szf0jFt0y9LC5Kp+EA=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=eVzhirrI/iFv5wc1HFskND1Tb66V9eW8ghk4uAUF0ildWpOr/cPH3sGMjGlANZnZpgjRyUCsXmX1MgZ49D/HtXABpt7nVlRUfJLBMT6kv3cBRs5ykCbmT/FG6w6KqzSnZjRCg/J6JGaiyCEQM+9T+92nO1gUOnHdOTBgSCX1RW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZrNHGV7S; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=g4kxPv/q; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZrNHGV7S";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="g4kxPv/q"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64D6FJiS3324682
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 07:41:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=NvTJmxlb3dGbEh5MkGRYO0
	Otz0pNSAiCvFRhGWrGIL8=; b=ZrNHGV7S+hUegJSRpQUROq4KcOUVjxUHhRYQ4c
	b9uvx9pCfN4WWdxBsIi+bN5Ag6XUYNnWBLqvEqOndwoyc3KOj5YC6q1P/SYnVxhw
	2b2IV3fYqMvj3IslMIVNH6ai9B2dk8P01qAdPLtDB4XPYeWoMm10pMVu1O0VrWz3
	X4dWuklQ+xEsmrejEUUfjhdsSKKReWCCpLSzzD3wvlYlEYKl0oLRX2pIruEtW+Hb
	CG4zQBjJ6oMntt7Vnbnr/1IAxKjWHFQ/Ip5H30ryi54QYUIyCfNHJJxJl8uDIneK
	hDkRQupuRPh0WC34STxfw7XEhOXHV5Lx6IjsQFL0i1FbPmBA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4kvd8bnj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 07:41:23 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50faf575af4so147570761cf.0
        for <devicetree@vger.kernel.org>; Wed, 13 May 2026 00:41:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778658083; x=1779262883; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NvTJmxlb3dGbEh5MkGRYO0Otz0pNSAiCvFRhGWrGIL8=;
        b=g4kxPv/q7tTrXo+CljWUsYZnvBT3bkkrocRFw1unL2Fn69WeTxQCRWERpzdGSEexKj
         Va1Bgmpu1mlr2KziJDcq968AZEJJrgcSHQSrtAz1Yd0mefU2bxxBBbCC98xjM5FOiEcW
         8oQ3zPomi1RCZK15H+dRxbHPb8yyWCxNMx06CW/HiplthcHOEmR9v9WaJwjpHvDfMXRm
         DHUD4tM2Co9EECB3whr9Bofo+ZUXRIX7LU97wS5ZATlgKMitOBMobEt+iUU6jRj4tDhp
         lJRdK7IBjl899W3f3ej6iVUCBduJw9EsP30u+FPuiAlaOGon6V5nl+uOrvFVO7kMTitP
         lfHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778658083; x=1779262883;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NvTJmxlb3dGbEh5MkGRYO0Otz0pNSAiCvFRhGWrGIL8=;
        b=oHDECuD2IYbSMfDveG3r96xVmKttgkbIveK1MjWWHcqrz7AitvhejlJTEKX7aAqmzm
         WwRR8GnjQdwYVUdrWcHVWTGkOYXAvMIvIcZg3N2a8iZ96wy12MmwWmIryJC3oTSQPjJO
         u7toGbAHNxv41bIH9Znzl9EQGJAx9PyiQC7pbg9RrKbWshn/Y9p/ITCLSxnWFFKG4LZb
         OrAV8NtvggPADAQLCSqqO7tpX1493XZbNlgm3AAiRYOzquX7sLlsnkjzM8G5IPbImOeh
         pdirHFPRYKzIPw4GJf0juyPqwK6nzme5JCMr7fZYtW9tdJEGCxw8dKUdl5wOJL5cY521
         /rLA==
X-Forwarded-Encrypted: i=1; AFNElJ9fH28FCVN4YsbzCUlY8lU5eK0e6xfP5puYmQatTgSfM/e5V1SKE7puaEP1T+jzlRHUHyd4rGsq5qrU@vger.kernel.org
X-Gm-Message-State: AOJu0Yws5MvdZuGtKAg0R8d10z37swCbEh19s40L6e3/iU8XbPmWaY9y
	3/qdSgxG7E3GSBqh9JMxTM4MsTbxpCw9x7gq/SLlecjWnxyZKgjlcd1Vl02AlgQDSh0RbHxYXaj
	I+QOadD9HBG4pkILI6pYQvt1GzFjvDsGVNNqf43BMqQ/bZkb2r/dWoKpmNOr/g7Gw
X-Gm-Gg: Acq92OEurAAnnLJfjU2EcTs7XnPQGNjEG0XV9U/FU0K+RI8cKC21DodUyclPqLv12BF
	G/e12WVHjM7t4OMUNosQvYmT8LwFRjVQtGHpDDn+rYvrHHC2wN13sbALuHhqYUVTUz2RG3QEimD
	Oe+8MeDgY0+6EMYsaUBj6OIyO64SoSe1y8mdBLDkUqaGyij/znVitWgzOt4jI3Bt/YLegn5HP/N
	LrOaQ1z6vKdNMb6TJgZ0Opas035Iva76pvzUNalO0X9WMqCNjp5SCPRMQKB/mlxP/2yolzXq0Fj
	I7aPCHrfCdeVcmZMArDvOcClr+sO85B/V+F2ngqXjR2o7zx+X9pSx77dzK9c7dhpHPc+UCBsJyf
	TbS3RhDy1J0sidqpGuSeI2hAfWSjOJQ==
X-Received: by 2002:a05:622a:1211:b0:50e:5aed:caf3 with SMTP id d75a77b69052e-5162f453c02mr26225391cf.9.1778658083137;
        Wed, 13 May 2026 00:41:23 -0700 (PDT)
X-Received: by 2002:a05:622a:1211:b0:50e:5aed:caf3 with SMTP id d75a77b69052e-5162f453c02mr26225141cf.9.1778658082599;
        Wed, 13 May 2026 00:41:22 -0700 (PDT)
Received: from hackbox.lan ([86.121.170.241])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fce05f41csm48999335e9.5.2026.05.13.00.41.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 00:41:21 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Subject: [PATCH 0/2] pinctrl: qcom: eliza: Merge QUP1_SE4 lane functions
Date: Wed, 13 May 2026 10:41:06 +0300
Message-Id: <20260513-eliza-tlmm-group-qup1-se4-lanes-v1-0-1babc6118829@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABIrBGoC/yXNwQ6CMBCE4Vche3YTitKgr2I8VBxxTSm1S42R8
 O5WPU2+yz8LKZJA6VAtlPAUlSkUmE1F/c2FASyXYmrqxtat2TK8vB3Pfhx5SFOO/MjRsGLH3gU
 oN501sPsyXUulEhOu8vo9HE9/az7f0c/fLK3rBz3mXDeDAAAA
X-Change-ID: 20260513-eliza-tlmm-group-qup1-se4-lanes-2861e6928685
To: Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Alexander Koskovich <akoskovich@pm.me>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-bc6c4
X-Developer-Signature: v=1; a=openpgp-sha256; l=1062;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=oLOiJcuAPPxdCwCWeNt0isxb+Szf0jFt0y9LC5Kp+EA=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqBCscsQCWStxlbkGuDMjg6heKxOMi8c0mu8uap
 Rg0EIM2EXuJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCagQrHAAKCRAbX0TJAJUV
 VvNPD/9gZStAFxu3i4oFSy6c0i4FHfCQCdwOqlFt7mrGMyTqqdkXYpJf6GN8i4inRH6HqtHwmKB
 SFQRZll+rcg5nPjZM+L9eSO57azoqXxYOLE8k7igu+/87EPGzYZJyS8/h4nkyIc1uZnmPLV6Ub6
 xPQxfD94zMRvVQLZ14AaPVmH7Au/uLQmxD5PmMChTNDYL6RtX7fmYTh+vykdzg/WcUJDcBMNDtp
 NjkcjgcMYhzvMySnXGLk7t3LLFDvY5NtZzHfxgrudKilD/SWFletuKO2yH3obLQDhX8PnvH2jjc
 SKt+LbI5LoonqsMcjr1KsE2r4PO9UXs4fAT8yZpRHFQBSAlc6soe1nbQeoDEJQT8Z9eX0No007W
 UuJoxr3apG7UrgAEMcRYsLfq4BXJOOqZ+cALAsnXm0E9JTgJD3hQnoTVzvhIgyDuOzAtHGnbqP5
 Q1xhHC+sBpzXRKmJj3GH5r/1wp25oxOv3IDoN5WMIDQrGm1smA+l+U6vBqC3MHxNMVj0tiYZuMV
 OQLOBJ2+CApRKZAQHW1CbKnHq13zAH66rok2yA4/AeGuMVMddjBtOAL00wzMy2PwXGoyihf17A8
 bZyyGslgHXLusZXibYqgCKjY+OEh7gftdklu80gH31Mv1AnY6/OSrR1E2C5zeXcqtgE6O3xvDv6
 qz+Fr7XJQZHQKGg==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-GUID: UnEJsxHFLENKgntOLp9Sb8_MZXNAANoD
X-Proofpoint-ORIG-GUID: UnEJsxHFLENKgntOLp9Sb8_MZXNAANoD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDA3NyBTYWx0ZWRfX5Mqqht0gW0uQ
 PVoVq55vo1ZkGkQ6qW/DoY2X2/rGyN1hNm+HzngGxx2lnQz3ip5uBvRd0ZGdZLVuVyw1vqRv/YE
 bN36e9pZqrCkIAu2rB534OrnnN16i52oXnR66zJhSeTDNx2PsLDJ86DI08V0/vxDZCOu8OUtQZg
 bj+pmfmkFaVol/Rq1zXHK+kN0PAGivqXtZYKV3n/mSx8vGgQHVnv8aKNNenmXpD0yp5Y3b8gLCY
 AV/gBy6TMD9p7HtSjhOMLCWhHsW8E1T0xkW/fDf7ZZe+i/QlJTAUP/Aw9dNpzgBLnKMolxNwZeJ
 ScLVRVdzC4Au4Hz8SNL/Zr1xzck6b82rQUoF+ialqs6Km50xji6S75X2/Ywsx47acDk6X1GelSr
 GNNvZoq+evawfS/Bdobzz/99h2XWgAzn4ggJ0DeVoqgtNgsUE1Hh2V1v/qcxzMh9ujnqr9LMpyD
 /zaSAo4VSmKagU82cYA==
X-Authority-Analysis: v=2.4 cv=Iu0utr/g c=1 sm=1 tr=0 ts=6a042b23 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=NtgjAHhJo3Q0P2g9Zl9R/g==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=dcaIaZEKivGm10Cz5W0A:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 spamscore=0 adultscore=0 impostorscore=0
 bulkscore=0 clxscore=1015 malwarescore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605130077

QUP1_SE4 uses GPIO36 and GPIO37 for two selectable lane pairs.
Splitting into function per lane works, but it forces the devicetree to
describe a state per pin while these are usually configured in pairs.

Follow the pair-wise scheme used on Qualcomm Hawi platform and expose
the two selectable pairs as qup1_se4_01 and qup1_se4_23 in both the
binding and the driver.

This has been proposed here:
https://lore.kernel.org/all/agIZOAa6nYSb5PWX@baldur/

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
Abel Vesa (2):
      dt-bindings: pinctrl: qcom,eliza-tlmm: Merge QUP1_SE4 lane functions
      pinctrl: qcom: eliza: Merge QUP1_SE4 lanes in groups

 .../bindings/pinctrl/qcom,eliza-tlmm.yaml          |  4 +--
 drivers/pinctrl/qcom/pinctrl-eliza.c               | 32 +++++++---------------
 2 files changed, 12 insertions(+), 24 deletions(-)
---
base-commit: e98d21c170b01ddef366f023bbfcf6b31509fa83
change-id: 20260513-eliza-tlmm-group-qup1-se4-lanes-2861e6928685

Best regards,
--  
Abel Vesa <abel.vesa@oss.qualcomm.com>

