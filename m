Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C0244156DE
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 09:23:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784625808; cv=none; b=Sq3htRJ5xQZVapfIttgsyQem5yV+qDji8xi9QV49MF4CYolGHbE9XzRNn0Ap++poueIZ6uIYk8MUXuYrMmGQODsKWazWomEx4tpuwjzMyF38R79J6E88XbXK4GaHSLbtJjKK93NfxoMtbZo6Y4sk4JlUmGpjlxVeSVJvLg6wOgs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784625808; c=relaxed/simple;
	bh=Yt+NMrf61Vi8iFpn84HTy1sddcBDi/iPEb5YrSmYWiI=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=p7zHiryGo7m6YH+7tJmgmPWVomSXVQe0BCLx8ndsaMLoQS+hJqAmdwxe3DD0FKS/NFKXxNWrA2UN6cC91ahlaAIZcMQm1DfiTgI+CC/FySshe2mO3HWz4boQ3eK4yyRK4WGn13QrMfqdcajs9kj6asenQkCbiijdY2g65apl784=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=W9USd1sc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FROn2alR; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="W9USd1sc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FROn2alR"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66L89206091469
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 09:23:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=FkYchCVKwIcZJig5+v/8W9
	v47TfaXHUlnS0aoR6aXK8=; b=W9USd1scg6xvdVYSvtF5DH78yVQZuBbb9N4JpD
	4nhNhxuaJDJ779OhUfg+IzobzHbhl2xPlEMGEqlJpcdgcvs8rUYrPfgQ7PKDUNFi
	OOnmvVWaNklUfBkHQjHJi3haehAb8XMAeF0SvMJViPnRD2Oanwi5OggZCyKNwEos
	+Hk7JZq5HSwkz4Sq6SIZasNqD8N/ypGxlkuS05D8euLKw78IrgkvW5Gon4jjnSRQ
	kIDkFx6I2lv9CTvnhrCAcOAq7CUt4EBjffI9XmLG8+KOw62nioftCKpRTf8hAhhc
	cx1BIrFdVVPg/NMhGkNUB/4HC5kfrWB41kiszOt6K/3PjvdQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fj01a9tke-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 09:23:26 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38e7621655eso3718539a91.0
        for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 02:23:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784625806; x=1785230606; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=FkYchCVKwIcZJig5+v/8W9v47TfaXHUlnS0aoR6aXK8=;
        b=FROn2alRsGdrcYYhwh5dkGS29nTwmHQNpwdIyXAVnzDHSYfbx6YcfzAP0fmdlS0Jc5
         wqyyuFVVphki6PWkr8Qrhx8V9QgMkPAHHcP0QtNeaIOdhmxYkngs7ShNCIuQwKAVciRd
         z01UVx1r2lYiP6TW/8uJJPK743XWYpL/ZgiiH7kfcOEbW6UelZgLxaq1rWvn0mWAyMtt
         d3dGYRBmkjEDp0WYo4+Nm0/rQNyRhU3dZ76pz32a+ix+7iV0R1k4mW6X3OlikXmB+Cu/
         SJmIAoji7JxEqdzlXwVi6ywYhiORMRPDdxV1xFBvVJlCKrL7ZKEtz3OxbcByqaqXGa+w
         S8bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784625806; x=1785230606;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=FkYchCVKwIcZJig5+v/8W9v47TfaXHUlnS0aoR6aXK8=;
        b=dNyNgIg0yXPcjHbspuKQKFr94ggfuBNl56k9umxShPqfs3uY55xsRZ1L2RxdnzGwOo
         aYUjieHHS8wJt/+09HwpPwEgafYEQsbUNG/xhRVB7cemDGI5LCBkUkqq0HbV69RzPKub
         oIoAGooAAe2DXAuJk3kcfYerW/X6mRSNXnrTiVZWZfXw2uoBixk3HMiemdfUXgfh9pm5
         rnNoV63itMg6vWODtWMN+ywUb9CF3heS7f3iYMwd7xzG7f4Gow89VWv8Spd928CiieFL
         pTjFdUhZD6FheAUGQwuFTQ48oXF9Xn5E2XXHxRIB3h+0vFIgPZur/DBaVLM416xPYQhw
         eNEg==
X-Forwarded-Encrypted: i=1; AHgh+Rq+LxbLHKzBkxNSkWP+ykH9IMbMDvEcnXNgzLAqDcWC7W++RaCc8u5/WX9if1UnKGc3ZVKqCELZnAxR@vger.kernel.org
X-Gm-Message-State: AOJu0YyA4FXxxuhg9PhAXKgj49Nb8zDt4s1Yr5EEfmBU4li5NVLBPDz7
	uPskrurmCkjgnRPtFoq8FjDPhDpQmXwGd6SYT/bjY2Ht5yLWN7p5WcxsZ1Ax7L4r8rYqz8XqU3u
	XxnRH9oa1lkg7piX4soDAs0wiXvhyuvtTYqIJPd3Kr+wF+DABygltsQZEMf84XGIb
X-Gm-Gg: AR+sD13qQsb87j5tTczVWlt+ec1EIcwL2Up4p8f7vyR++UxAOkGZyXBYzQsfhY/C+ah
	1TdPINNF6kr0ItapnMKBCKhZZoHJAzm4uAXRzWUfex2VIusASb/pHD3b+a7f42pl4PrvdpcDzRF
	TBUmdCQ0CrvWh2Uxe5zdL1W/xaH7vKPgK+YVhq8VGdO6yMfyUa9cup/pczHlA1WYXowEEyVjlLu
	BgLn2H2XVKK1GJ7PKTh8Chu35AsiLRqPHJFR0FNbAPJeKvetkC7HFKCrdd3A4PvvFJp7RH3Czg9
	A+FHG0zif9ZiXZ7lRKQCDcwIy2KJZu0+Lck+nVvfVCFIHRnytJg5JwNHy0iSTP+fa0zRYBsW+fX
	i0ov9H+Li/FEV+JEEOFx3cdBxwyt8a6IM0E7XMqikNr+SYJrp0HN2cwxVmrmuAwgnFzZ2Aifbtw
	==
X-Received: by 2002:a17:90a:dfc4:b0:388:1927:fb1d with SMTP id 98e67ed59e1d1-38e4b41120dmr18953466a91.12.1784625805882;
        Tue, 21 Jul 2026 02:23:25 -0700 (PDT)
X-Received: by 2002:a17:90a:dfc4:b0:388:1927:fb1d with SMTP id 98e67ed59e1d1-38e4b41120dmr18953395a91.12.1784625804684;
        Tue, 21 Jul 2026 02:23:24 -0700 (PDT)
Received: from cse-cd04-lnx.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38e4801e0f3sm2308661a91.2.2026.07.21.02.23.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 02:23:23 -0700 (PDT)
From: Wenjia Zhang <wenjia.zhang@oss.qualcomm.com>
Subject: [PATCH 0/2] Enable ICE for UFS on Hamoa IoT EVK
Date: Tue, 21 Jul 2026 17:22:32 +0800
Message-Id: <20260721-devtool-v1-0-ade633accb41@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAF06X2oC/0WNSw6DIAAFr0JYlwQQQb1KYwzfSlrFAjVtjHcv1
 UWXM3mZt8Fko7cJdmCD0a4++TAXIBcA9Sjnm0XeFIYUU44FYcjYNYfwQDVuqxZjqWsiYVkv0Tr
 /PkrX/uRon68SzKf89zpw1jBBiqE0+nuUg46fJYfhGCWLHDXc1MphpupuZb8HJYvXYZp87gBrK
 06rlhlphHGcayqYbriQVJCiNcFaUqUa2O/7Fwdz1T3lAAAA
X-Change-ID: 20260714-devtool-5093900ac51a
To: Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: kernel@quicinc.com, linux-arm-msm@vger.kernel.org,
        linux-crypto@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Wenjia Zhang <wenjia.zhang@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Authority-Analysis: v=2.4 cv=BL6DalQG c=1 sm=1 tr=0 ts=6a5f3a8e cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=M4l5zgTsi59Zh--6b5wA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDA5NyBTYWx0ZWRfXyunDHtzwV1+j
 2//1zKbKf9OXrfbbmfWxRu4pWn4bpUHJFxELEWr2a2Gel0VLoNMIoCT/yPbZTCPlm2db27SU/ZD
 wMFIX14cDrloMeQjahNi0CSrAT/l+yTdrAsXKlkJWvsnRe9y4QDantbzfaFAmsKb/7VRRtJva7l
 ggzuwmKmZkh6+8A7idl0RwoiGMq7ry7ZZC3wVJDvteAo6lVCeworsu5JPnDUvDj4PRjPgAT0KmO
 2wm/4eezrHfiDeG9mCzIBpZUuP4ikyQ68BH2og2H4ahEvpDCSWwN2tj4m+Bbsh8q3UICccbzOmq
 wpWDFrKBLvvLFjEkwtidIr+B6WQi9el/iJs11b3afV60Wta3Cn/4MY8mnKjeIfyrIYkXHLJD9hT
 2uEnxJfYN6AdoS6r7/wixcvivrjwvFvo5lN84o5loTBet8JZMvKZ5yDE3tufU3FyC91EmpvnWgC
 UhH77W8PVL6rRGNYJfw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDA5NyBTYWx0ZWRfX4p5RQRzCDvQo
 0mK6Yeu4HfDypTjKi5A4WXWAmIiBhxtIGq+gfnLZMmgUBfna+fkzE23fUKRl3Zj9VDSJjE/VlRe
 tKrJ6SRQSoOCwL9/l5mRl8M7Wp4yU60=
X-Proofpoint-ORIG-GUID: OCS_ZheTxkMvzKBhokTzyMnrWiZ9AyCe
X-Proofpoint-GUID: OCS_ZheTxkMvzKBhokTzyMnrWiZ9AyCe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_06,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1011 malwarescore=0 suspectscore=0 adultscore=0
 priorityscore=1501 bulkscore=0 lowpriorityscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607210097

This series enables the Inline Crypto Engine (ICE) hardware for UFS
storage on the Qualcomm X1E80100 (Hamoa IoT EVK) platform.

The ICE hardware provides AES-256-XTS inline encryption/decryption for
UFS storage, offloading cryptographic operations from the CPU. The
hardware version on this platform is ICE v4.0.1 with HWKM v2 support.

Validation:
- Probe successfully
- Standard key work well

Patch 1 adds the new compatible string to the DT binding documentation.
Patch 2 adds the ICE device node to the Hamoa DTSI.

Signed-off-by: Wenjia Zhang <wenjia.zhang@oss.qualcomm.com>
---
Wenjia Zhang (2):
      dt-bindings: crypto: qcom,inline-crypto-engine: Add x1e80100 support
      arm64: dts: qcom: hamoa: Add ICE node for UFS inline encryption

 .../bindings/crypto/qcom,inline-crypto-engine.yaml          |  1 +
 arch/arm64/boot/dts/qcom/hamoa.dtsi                         | 13 +++++++++++++
 2 files changed, 14 insertions(+)
---
base-commit: 49362394dad7df66c274c867a271394c10ca2bb8
change-id: 20260714-devtool-5093900ac51a
prerequisite-change-id: 20260701-b4-shikra_crypto_changse-f2d6d5bf04b5:v4
prerequisite-patch-id: d5bc84db11dfa16371755109d32bafa6325a7706
prerequisite-patch-id: f653bca04deb0f4fe7d51b3064644c8e6b0d9c99
prerequisite-patch-id: 615f80abf57c155bbc190c1a70fe615a783755cf
prerequisite-patch-id: 59d8102674ce98be1a0e9b4d7939ffd8a7289ab1
prerequisite-patch-id: 691ec3b8a386d2c5b991a4311236f7f06adfc5b1
prerequisite-patch-id: 5b949e801e9bf4b5593a1f7cb8f02709eb3e869a

Best regards,
-- 
Wenjia Zhang <wenjia.zhang@oss.qualcomm.com>

