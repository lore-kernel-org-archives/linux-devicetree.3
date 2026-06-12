Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 792B43E16A1
	for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 07:51:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781250680; cv=none; b=OJYJC/URzOpH33ZYa9DEXuUGYv8ryZ7FsVI+3g4UHUgkpPAyFeoPUPidBHcDy5vOtWgJUQb3ugIYE4vI3++zEsagPqDkudGAdN508NjQlnp83GYlml4czpLXuwH+EMVlgjRBBI6iMU+0rdXzgqfLTVw9iVlS5KYO5UxXPoAoFd0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781250680; c=relaxed/simple;
	bh=tDaa2GIQNYzrJXEHHFWUJQbVOLYpKKq8qCdms4Nv98Y=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=cQEGspGJ6536FwT8Db8QVWWJiFXCKRy4Ui+fWEGaXKbZU/YCgKR26/KS9ICzxXHnNMAAX8425WOwUncUaqdJJnwkXVb9ocnJNMDJ5K5vczgWA74+fWFdoIKKzW75aKVUVEVBF9nY2cz10Gn6j90UvpZI9zjKjCuTNFezC/XW7YE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MW8nM3w4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fnypcLFb; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MW8nM3w4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fnypcLFb"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65C39PVX2475903
	for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 07:51:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=E5Dk7W1on9zc2CAG5PUvEN
	WzEFC8IfjL74+2bjLgydQ=; b=MW8nM3w4XwDaBy6gG4t9Uvfkji6aVM9DvSWDBH
	2ThSK6S8dZzF1XSG9zVlV/WfPUhimjpBPCWi5KcI6ftClD7vQreh9DoWVY0YFm1a
	d5WEr8THezabn85ILEOpu5UzWj82Rv7VfuRVRGuGbQlR/pRlAM3vZWQTuWQlQfT0
	JEzaQlEOyJXxkouOA36CtI4m7eM8TL8EQPWXw9L61MzYpxeWiMNIcQnbrVruvjFD
	kqpmXf6g5OXE6XgplnvyaoTx01x7bRGQp7AX7ZMlEI86Vj3QE5xTjAm2yCfoyCO/
	kBgRKqWxKtGrVGC6VXpJr55NtxEZGamAZCDfIDsWlNkuHFjQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4er2r5t4sc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 07:51:14 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-36d6389bbf4so801323a91.3
        for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 00:51:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781250674; x=1781855474; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=E5Dk7W1on9zc2CAG5PUvENWzEFC8IfjL74+2bjLgydQ=;
        b=fnypcLFbHZ+FFc1d6fske/C5xsDIfnpYd/27Agc9Itu13voqkxNpT+ewUkuI1DoNbP
         tv2IXoSXMUDDGXCZHqcadjO3DAL3bH4ugld9IktuH8vPELRFpYeWHwroGBC4q2LUF2B1
         FriOO5tX5pyggU0p/WGJXQEMHdyg/6OTzVn0urJoX8mWeR5KtEVKVr6+/tTxnxjcL4at
         02vg5FnxgCU0cep+mxmfnK4m7dxKiFjz08EafLZkcNHDR1uSrAUS6PrYvVTjhx9D3o0t
         PJQ/RvhPL4G+hTfX7d8UY1BNdF4sp16rNQktRYAPejGss9HWWg1/bYIMPMv1oqTSm3gv
         gHdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781250674; x=1781855474;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E5Dk7W1on9zc2CAG5PUvENWzEFC8IfjL74+2bjLgydQ=;
        b=hsJ1Pz835jRnUO2j60eBvdrFa5qNwbcKewCHOj26zD3bmutruh/KUlpbJfv3NhNpS9
         vIjo/+aZxDqH5IjFonNTfsTe+BMAlyTPJS+oZzxWmyxXMhuHnMBjzydSndGT8tjWbM5W
         h7fzDUf3spp3wFEg89XHhaZkPJ4z/PYDMNeKP9P91nKbzRQOvVdU3fDOY4BA2CYd6f4u
         3AQi+i/+j8RyWu2cKCnOXW3p67Nn69wP39Xbo53sfbC7B3kB5RyOco1PfwcUPLwzQqgU
         OGMqyyKDY5vwtUEAPCpFMOcOXHe+8dWIOBXf9c6ue0iDSjk0/rPZCSaVyV2Z1qnhkTTu
         Xzmw==
X-Forwarded-Encrypted: i=1; AFNElJ8mPY0z3cazsrsxsr5sDm5TzEts8xv8YUMpa9DoqMvipyr2cnSXmroCJvoZLFMpsY7RBhM2eKkXstJY@vger.kernel.org
X-Gm-Message-State: AOJu0YzOGU8j9MixwQaLwfPjP8Mokd2wI1yAu/jDUkHFR25LAM2fY+Me
	koDJLozz9QkHnougBGDN/MjT/gNOBoUz06qSka1m014y8BGCu9oUMM5GavJzpUqn4VlOvB4y6Xw
	PGIL63iaYhaDQCkJHaVIq0hRrkncaOe2uIYVc/H1e64VXoGYVWqDPugaeloObXsID
X-Gm-Gg: Acq92OE/A/Z71k9f8qTgGeTmrTpN3bS1mOpq5+7O8S38pNK9MzZc1bKE2CAeFAcEpEe
	rDPVolEK6RC1JyTINeAIn5hjbO4Ghy9cPXA9nS56RRfXQ4Uor6fKN+sLEm23odioA8gf1Ma44en
	+uUcKtP45fosAle2JtbHOP5sokemqNCfcfdvCZ/dwf8YAC1OuPUIRtX2PqgzT5uovqs3yMUlKPE
	eVsEtxughb0vG5eD8MW4riyFcEpcYxyU3xi8m+JocWD2WDeBGKUIr+Hm/OA8U4339DFWgP8iXDC
	68MQf5c4HqKFz0ZasX+GqT4r8bVCKXWhwwBBgvXlaa2vOb8WdPGdcPyra1x/MWkOw8Iq2YkPo/M
	BaE6cJi3TWBSxkNyVCUhjUX76tDhS8OZjdhuE73UGS9uKxevt9k7jLvZql20oa+J2fi//tIKawJ
	H8Ff0mbavzruMSr110MpproOowXiNEsKAZiP+J
X-Received: by 2002:a05:6a21:329b:b0:3b4:b6d7:a992 with SMTP id adf61e73a8af0-3b783b4f2a1mr2382073637.8.1781250673764;
        Fri, 12 Jun 2026 00:51:13 -0700 (PDT)
X-Received: by 2002:a05:6a21:329b:b0:3b4:b6d7:a992 with SMTP id adf61e73a8af0-3b783b4f2a1mr2382044637.8.1781250673382;
        Fri, 12 Jun 2026 00:51:13 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c8661b5ab99sm1307544a12.6.2026.06.12.00.51.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 00:51:12 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
X-Google-Original-From: Kathiravan Thirumoorthy <kathirav@qti.qualcomm.com>
Subject: [PATCH v2 0/2] Add support for the QMP PCIe PHYs in Qualcomm
 IPQ9650
Date: Fri, 12 Jun 2026 13:21:00 +0530
Message-Id: <20260612-ipq9650_pcie_phy-v2-0-b938cc2fc267@qti.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGS6K2oC/yXMQQ6CMBBA0auQWdukHdOiXsUQAtMBxkWtLRgI4
 e5WXb7F/ztkTsIZbtUOid+S5RkK8FQBTV0YWYkvBtTotEWjJL6uzuo2knAbp0057Ws/nNFeDEH
 JYuJB1t/y3vydl/7BNH8/cBwfr5xw63QAAAA=
X-Change-ID: 20260521-ipq9650_pcie_phy-60d7df32581c
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-ORIG-GUID: zeRReVG6MpJFXfX2dbl-lRFo8kgRBEYH
X-Proofpoint-GUID: zeRReVG6MpJFXfX2dbl-lRFo8kgRBEYH
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjEyMDA2OSBTYWx0ZWRfX6+K17hpglbxY
 3nYYATPvNW3keWS91ObnfNFL8BW9QqLIX5e1CpWG2l3oYCTQ6QGHiZ0CRZR7UDmywk05h76BHCy
 fVjaeJjocX/U82rsf2RyHjuhuSI5mJo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEyMDA2OSBTYWx0ZWRfXyo8aemAJFxAO
 IO/d3xMPKGHkuYz4hTjcIWIrE4cnj74rCr1WI63yTqvmfIyULiv5xN2skPUHackpdqirbAh+p9P
 LxrpHuInIJU8SQU2QBd+kaGXJvRtCCflMxJKBNiypJUPFgcsWEIF7BRh+hY2Xcw8AGGcAW1yWiL
 5+sSVfxekc4AImai8ows9dXIDULBllI7SSBIkYpheqBTQslwLL+AXpxFRq2Rqo+8wa7o/kgIwHc
 OfVg7dzPhXnTDCX0etQmG2zZ1nZLkWE8jZbZVUEMtyeqVi4PbCMpKY8iU1h1laaU3/RveY8V32w
 ZppljnV60ymrTGL4VM57GRrwR67AB4n8peG4/2oTHx5926J6j0Tm9Ih1YeB0Vb/afV5CqObf4Y9
 r7P5dPU553pRYDtc6VrFQKV7HwBOpA4bw4GyClyHOWvrHvzfKvfVPHWFSJXMz8PD8ohqIkzPhsr
 vAZpLjJ1SxaHWcJQAMw==
X-Authority-Analysis: v=2.4 cv=M6p97Sws c=1 sm=1 tr=0 ts=6a2bba72 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=JfrnYn6hAAAA:8
 a=cqutcY1mnIGKQfsvmZEA:9 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
 a=cvBusfyB2V15izCimMoJ:22 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-12_01,2026-06-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 suspectscore=0 bulkscore=0
 phishscore=0 clxscore=1015 malwarescore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606120069

Qualcomm's IPQ9650 SoC has 3 Gen3 dual lane and 2 Gen3 single lane
controllers with the QMP PHYs. Unlike the PHYs in the other IPQ SoC,
refgen supply is needed to bringup the PHYs. Both single and dual lane
shares the same HW init sequence. So reuse the tables.

Document the compatible along with refgen supply and add the phy driver
support for it.

Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
Changes in v2:
- rebase on phy-next
- pick up R-b tag
- Link to v1:
  https://lore.kernel.org/linux-arm-msm/20260602-ipq9650_pcie_phy-v1-0-d8c32a36dbd9@oss.qualcomm.com/

To: Vinod Koul <vkoul@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org
Cc: linux-phy@lists.infradead.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

---
Kathiravan Thirumoorthy (2):
      dt-bindings: phy: qcom,ipq8074-qmp-pcie: document IPQ9650 QMP PCIe PHYs
      phy: qcom: qmp-pcie: Add IPQ9650 PCIe PHY support

 .../bindings/phy/qcom,ipq8074-qmp-pcie-phy.yaml    |  19 ++
 drivers/phy/qualcomm/phy-qcom-qmp-pcie.c           | 220 +++++++++++++++++++++
 2 files changed, 239 insertions(+)
---
base-commit: 2ace2e949979b82f82f12dd76d7c5a6145246ca3
change-id: 20260521-ipq9650_pcie_phy-60d7df32581c

Best regards,
--  
Kathiravan Thirumoorthy <kathirav@qti.qualcomm.com>

