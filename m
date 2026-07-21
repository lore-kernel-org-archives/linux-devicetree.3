Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 751444534AE
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 09:53:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784627638; cv=none; b=DCa4c7TdU9to1+E4Fph6+38kBWZPQ5Sach4cvEBl5yW5GLSVZ+eju7C2VHKsSqXzlELcWVFwKPO4ou4/fI7RaCHNZ6QkA4ZVOmf4ImCshEfQhpXxVTK4oX3p1OyUNlw7gaL0s9CUBXwkIK3tYbNUHgKr3271W0BPO5hdvTNRHLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784627638; c=relaxed/simple;
	bh=5wovXRtxQxVSftIs+VhuWwKggYu9JE/xPNlz/SJVNaQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=lz7yL3favF+05R/UIRXlw6opewPePkvEhvffGYJ9vfHMTh5kNPXZrnN3GJtQfRLABRwbbk6e0t+EwFSjDKKPnOyo9eGbQxYsCRQV24oy9vH2rz7IMYVXx1p6lukZM538Y4A6SrjOQVjOcsMAlwEZj4xILuzqZzvXXHr5TSNoZDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mPhbr5r3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=I4f3KVpJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mPhbr5r3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="I4f3KVpJ"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66L8cHsC535002
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 09:53:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=WoL/PUprJ09q8xiq7zNvIs
	cbkj2dGq1LaeMtDkyQ6Dk=; b=mPhbr5r3pKAMw+jgY6tPZmK5aHjAJBN6kk6fBc
	rUKX05LsLGTdpwtNiabi6sbk9QH5Yj5HuHRRw3DtuyxL63kfHuzw6M6QagMhOK3j
	ddOVVK3m17eNYdXjoSxgMW9yBDj6KeFuWhh6cnrEwlxb8MJWLFqba8DtPVvYipft
	r70JMgEOKTM6gQiBdpa3gfmDbT+JoDP1vpbSHK5LuqDMeuBjk7+pt4AiQPOvuoR3
	EmHjB0InJV0Ux65L5yeiy0WMsgKYIeutl+ZdAjeAI5/PbTCjCFKoGBFP9+s2INAe
	iDXMZq55XRfytGj6PnyEfRulT0bJNMoE3vMmezg/yZNZ2oGg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fj1duhkav-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 09:53:56 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2cf6acd760cso25886335ad.3
        for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 02:53:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784627635; x=1785232435; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=WoL/PUprJ09q8xiq7zNvIscbkj2dGq1LaeMtDkyQ6Dk=;
        b=I4f3KVpJU2UljHiXPj9kcX8E022IOcBImY/ozuokzXsYHUFt1hAo5WdSgUwUIeyql9
         VOOTNOtoSbcoiFSEWWJ8zykac9PuFw+6j/Y6lXIledUX0+57jpLl57sL+WGj3JzjL3P+
         hSxpnOhZtQ4tX22KVZXSWZ7OynlEao2PIxnpfyepmPeNr3awuqnHkvpgWOh/USCVF6Fb
         UPStmfJsZIC3ygyRpA/4MaxzgN5LbqZMDdzJQoSE8aHGyoIr0L91vBqcRqQ1M1Nkb8zt
         waSXDI3Jl0MpROnnaF4R2JozO2UEbXfpHRkHLOWCZGPCbLSmHYrtbnjG66pLjqhxn05L
         hnAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784627635; x=1785232435;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=WoL/PUprJ09q8xiq7zNvIscbkj2dGq1LaeMtDkyQ6Dk=;
        b=inSPdY3x4gNoDmwJySU0OIce9Pizzg+nKlz4mLgkqtsO0Oe4Ci25/KhV0xlMS8Wvrb
         aKg8uerMfACHe5TF2tdJocngnNJccVOcSudXcIi8fEwwOpM9Zr2MKglxY5Wc4pWzUtOU
         QqMNZAmdB/gqQ9ot+s1/YEZu+t355VpuFoM72uoe7mBV6yC3oWB2iB8uSZL89cW6zmmt
         ZATX1ooKOFm+c3/lGHSnl0OYN/WbHyvYbSGUrLb4UeNhIWxTKFfbO8mlIRsmtKygDHes
         zKgyT4jUVps2LwtyO5jlhyRJaTd+WkUzf4pfJBlCSajMZ413mZeKPsZIAjVKmGsl+pT8
         6EPA==
X-Forwarded-Encrypted: i=1; AHgh+RrxhkbLkaL8178uzN/GKg7Wj0baDyNvh0KZRe5KXuuyBn2mjRyzpn/pCLMI0Rp4kUArFvRogkjqLPKd@vger.kernel.org
X-Gm-Message-State: AOJu0Ywj2BSIwt7ZA72EqDL/K0hCvW744YiYLYLMvg/e+4Tw5lLHOtP1
	7Bxe/T0ncIRG1FQS/wcBN42XsKj4ckXV++STDneGk9PRxC/ERhBEDmXmoB/9rJms3l6bipnrsWv
	Q7cQEMqud02UwRUjd6SyyIP6ErJ9Bgx7ty2lFrprhUvNn9qDcCHFRPOQywOIBq+RS
X-Gm-Gg: AR+sD10y8g8fD4cNSKBRETJUZuPdhzsEPfylKoTDLfulDDWxG088ftYXYOFcKh9ovye
	VkZaJv/agiYNMymoDYHaT9WynrLPdI0a7wYVx0UG+hTubqsdw3Bkyii92jd5SqSozBStt6XZl/i
	w7FwaLrrY8si0xS+YwhDjJ2jX1hYAs9F7EY2Nv7SB9xAK80QNgXIS8hn7KQRN7z0PWR2quFkwGW
	MAM0T4aLzSsHCWXl6r7f/L7JpXdBLp6VaeAvFD/EepDzCohhGpNfqM6kJgxT9Tdu45ItMsFctaZ
	87VizXxOEO/WDzkTaBU5qmwnTXdK9REvovn4FI3a+bvL0yiqSMVW5fFHWxtNBvMiZI6sG8XoiF1
	uWAMLtDMcfh/KKlIPrPrKdlYonPWQih9V7/NJt8etpVfC4k3ekpEIan12M5VBFtz8cwSgTQ==
X-Received: by 2002:a17:902:e748:b0:2cc:ffa6:462a with SMTP id d9443c01a7336-2cf3481bb85mr183523335ad.10.1784627635239;
        Tue, 21 Jul 2026 02:53:55 -0700 (PDT)
X-Received: by 2002:a17:902:e748:b0:2cc:ffa6:462a with SMTP id d9443c01a7336-2cf3481bb85mr183523025ad.10.1784627634682;
        Tue, 21 Jul 2026 02:53:54 -0700 (PDT)
Received: from hu-kriskura-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf346da139sm71950055ad.40.2026.07.21.02.53.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 02:53:54 -0700 (PDT)
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Subject: [PATCH v4 0/4] Add DT Support for USB on Shikra
Date: Tue, 21 Jul 2026 15:23:44 +0530
Message-Id: <20260721-usb-shikra-dt-v4-v4-0-2e7a092d7f27@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKhBX2oC/yXMTQrCMBBA4auEWTsQ02DUq0gX+RnNKMSSaYtQc
 ndjXX6L9zYQqkwCV7VBpZWF36XDHhTE7MuDkFM3GG1O2h0vuEhAyfyqHtOMq8Vkgj4P1hlPBD2
 bKt35sy9v49+yhCfF+feB1r6sZ6xJdAAAAA==
X-Change-ID: 20260719-usb-shikra-dt-v4-d2b083472aee
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784627631; l=2253;
 i=krishna.kurapati@oss.qualcomm.com; s=20260707; h=from:subject:message-id;
 bh=5wovXRtxQxVSftIs+VhuWwKggYu9JE/xPNlz/SJVNaQ=;
 b=MmULYcQmR0qH4A3xpASgSbtrIBu9/qhpDtF0X6FmXxx7auh0S8/wXPQ/F4W0bRXx0wjLAD4xK
 NkQ7ogNrvqhDsTePQrs8sHfIJV5SE3REMZ3e8vjWl0/OeWlkUxhhGOj
X-Developer-Key: i=krishna.kurapati@oss.qualcomm.com; a=ed25519;
 pk=6PmiuwGCdov3wRO+bdmRlRxRtmJyDKz3ED57LLPVgds=
X-Proofpoint-ORIG-GUID: sS3RBkspdofIsejEBGzoTFh0d8dW4jgC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDEwNCBTYWx0ZWRfX24gEKEM1MwVh
 3Wa371Sdx/uCoWMBvoqtjDE5fxHGYf0I+u62qEyLq6THJ8auFXswNWjrlG0YLmnjMbMNz4owXeT
 gnVkqMQLF85grLPFqckWB/NcowndgUNVgMF+0I+XzY6kQbvHr8SFUd/7ckW27APH61AKUdtpmnH
 pElySRx76UghnpMZQIkKhMpakoLJMiFDOLXhHCCi0vxjF0XwcDLJiAjlEoxbNAXbZW0eeSRchVY
 u/+fvHUK5cZRWQ46HFO97sIJcJ5KQ4peT6R2IisVcuohPx1cOZEIGvR/MpEPLHtu9EsMHA0LbeU
 AoqZDjLrhSePp38vzNhiEM4MjaRKm/IJEwUH71yS8d/sHoVkNIO3c038gvBX9LNa8rb7eIj+Ljk
 gFsL25Oe9TE7tBmQwPqCM7XllhXt0EdjJiuNzxmeezFuvzwANrzKtLMhDZ2kLH35IVY9qy5YoKX
 nwZeFfiTQAdH3pAtKWA==
X-Authority-Analysis: v=2.4 cv=I9JVgtgg c=1 sm=1 tr=0 ts=6a5f41b4 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=_AVwzdTWJwZJkuAtZNAA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: sS3RBkspdofIsejEBGzoTFh0d8dW4jgC
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDEwNCBTYWx0ZWRfX9Vr/1aG18aYW
 6WOA9FqPjC62gBxfzNBGzRq1T2mhaqFrwVTeAOO4z6CRcl5WvqrxcIfbuo2DpXal6IZdB8/8kfN
 7RM/S+woDvBSdPXB7nb9DlICo9XcMo8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_06,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 spamscore=0 clxscore=1015 suspectscore=0
 lowpriorityscore=0 phishscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607210104

Shikra has two USB controllers. Adding both USB controllers support
in device mode in this series.

Changes in v4:
- Enable both controllers in CQS/CQM platform
- Fixed iface clock in usb_2 node
- Skipped adding RB tags obtained from Konrad since on CQM/CQS, second
  controller also is enabled in v4. Also specified dr_mode as peripheral
  for first controller.

Link to v3:
https://lore.kernel.org/all/20260716-shikra-usb-dt-v3-v3-0-13f73a0571bb@oss.qualcomm.com/

Changes in v3:
- USB changes were sent as part of consolidated submission in v2, but
  they were later dropped since bindings had to be updated.
- Remove double vote on USB3_PRIM_CLKREF and also removed xo clock.
- Uses &mpm as interrupt reference (sashiko bot)

Link to v2:
https://lore.kernel.org/all/20260519-shikra-dt-v2-0-c01b90fb4395@oss.qualcomm.com/

Changes in v2:
- Moved to using mpm interrupt handler for ss phy irq (sashiko bot)

Link to v1:
https://lore.kernel.org/all/20260512-shikra-dt-v1-0-716438330dd0@oss.qualcomm.com/

Binding dependencies:
- USB controller: https://lore.kernel.org/all/20260711-usb-shikra-v4-v4-1-9d59b9d9aff7@oss.qualcomm.com/ - (RB'd)
- QUSB2 Phy: https://lore.kernel.org/all/20260712-usb-shikra-phy-v6-v6-1-1b3e51bf1541@oss.qualcomm.com/ - (RB'd)
- QMP Phy: https://lore.kernel.org/all/20260712-usb-shikra-phy-v6-v6-2-1b3e51bf1541@oss.qualcomm.com/ - (RB'd)

Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
---
Krishna Kurapati (4):
      arm64: dts: qcom: Add support for usb nodes on Shikra
      arm64: dts: qcom: Enable USB controllers on Shikra CQS platform
      arm64: dts: qcom: Enable USB controllers on Shikra CQM platform
      arm64: dts: qcom: Enable USB controllers on Shikra IQS platform

 arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts |  35 +++++
 arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts |  35 +++++
 arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts |  35 +++++
 arch/arm64/boot/dts/qcom/shikra.dtsi        | 221 ++++++++++++++++++++++++++++
 4 files changed, 326 insertions(+)
---
base-commit: 7b3363bc5e08c0a7f64b5a822a9b6e2fbcfcc401
change-id: 20260719-usb-shikra-dt-v4-d2b083472aee

Best regards,
--  
Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>

