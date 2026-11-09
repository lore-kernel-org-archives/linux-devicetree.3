Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794183328;
	b=JYzr2ZmOMf0vDUuQUk+1/NYq8DZ8jLcmPH7dbpx8hecMyjNfPB2Wi9A8VRlUt1IAhptR
	 dSTvO3xZCnDee3f4Zgum17JcIoZPnPNMNi6Xgxdevb5Ro/5uNjOnf7PzqUJbWc8LavuwE
	 kMuEjzsB5MMUTc54GxskprFSj60IHJHIEouuSQc7mRFc3GS8pE4UFrTBtoNZJpmF9sQdA
	 /xXkbBB0ygi2lFghf5NluvsR/n8TJKrrxK4Vfi1SrGJU1HLJcCiw4JkBuPVggFWNrdO7h
	 /8hmK7PKVBZhWWImQGgfVyT47eTWAF96fCQr7xlGBe1aCiNrfA/MJuo4ekLqlJAce4A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794183328;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=AMRtfRF8O7Ygkgb1lDj8QnegAF0OCQBJ0ibubsM5/r8=;
	b=Mk/PzxAC8Xk3y5JVubZ1kRUB62K8DIAQwlHk4a3ijKtfg+GLiz2fFVZUV+SHcXbIr1OF
	 73YkPHNMmHuW20wE9vEmhKqbMyI02PH/LCnZxoB9mYi97/SyEmPUR753g0UyBbEAxmWBR
	 un8QdGMXvLsj77pcFQU2esnua7O0aKELE+wW08BRgBmAwJlZaNr7eb/4jj5ijYeQ1kD8c
	 bdtr88o3TlZ0VG29ShWCRd7EDRf2+N1rCz6Vk/QDgXEckVbhth7wkN4lykePwIb1sxG0G
	 ToiT4GT3kFtHZz8NYt2igb49S2h1B8HMvb5WoaNmZMdHaxClSHmGTWObLHGFt7jxwIg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="G/cpiHbL";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=U27JTjtD;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 580AB606A322
	for <devicetree@vger.kernel.org>; Mon,  9 Nov 2026 00:15:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 580AB606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=G/cpiHbL;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=U27JTjtD
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A8KeKPR2436437
	for <devicetree@vger.kernel.org>; Mon, 9 Nov 2026 00:15:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=AMRtfRF8O7Ygkgb1lDj8Qn
	egAF0OCQBJ0ibubsM5/r8=; b=G/cpiHbLnZn1edSJkYWdyNV/pQqCb5lrOonGTF
	WEsEt7oqvq5U4X+Hqichy7thG2UIckh97EeDrKnazcNPFLXh8UWoAWFi3s6g5le7
	x4g7SF6ItuJ9KZR1rc4veIB3D/0bgCmXdRpmxQuk8KXdijM4YTp/uVlELVbdLOXr
	7XpcOXYeRh2Pa73TQSSJqpEohSkdaEOumijvT/1v2ont+GQ/HzIUwuYhjTKocwQR
	CrrQ6u/2CY7rNXg7N+gLhnuEZxoB9/1Y0P8BwzYBKOpd12KW1hMT8rlQG5g6ZB9r
	IwyvH+eGgOhsBBd7MkgknrIDfColApjoksOIDK7V5dRxCOnA==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hssbnveva-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 09 Nov 2026 00:15:27 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-1a5005fd0f8so720805c88.0
        for <devicetree@vger.kernel.org>; Sun, 08 Nov 2026 16:15:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794183326; x=1794788126; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=AMRtfRF8O7Ygkgb1lDj8QnegAF0OCQBJ0ibubsM5/r8=;
        b=U27JTjtDUBxJpWD0BK77xruSJWvh2zpDMzZClacRiLUn5eU0VXXW3VsYWK6iI/7abi
         twq2WoLBHKtdPSF6FbVKEBKe8c5OdFYr4KICYr4azo1U+8UX62FpE4Rpt6GpP3adqlZq
         gvFw45XjDShHXR4yyKdrOqJg+GpmJKouWDMQ7GVM65wQuRH4yTTM+kEkh471g+VYkV7r
         Bpd2M8Rqn8dmsWY69wy+CtWTOZ+aPfukFnV2VjL6/aWReqAN9ZnmGc0NpTRxOLh8rnXn
         WvYpqffPJd9dozdDZoSjYTOvvLiVPxPG4CFEhr9pJxD75wVk1GJm8PA0xpjvLp3bTbbG
         2bvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794183326; x=1794788126;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=AMRtfRF8O7Ygkgb1lDj8QnegAF0OCQBJ0ibubsM5/r8=;
        b=GiwA6imxCanpsgVrle12p7ycNehEq3CttgjoDaGA/+43hfSdGpcBnSlXqNMHKWV6eT
         IMUc8cEev1Gsl40PDIFnbv0NFDgYUdSfDqPyFdrq4WktDXS5JnydyvCic/9d8fHFdnrj
         3BXMJvXLEJbb8ifQd4Q9AR585X5Qk4VPFpvUqnTdnmOsYmqrFgZ58tIm0bneXHUnY7P1
         QZ4ocexcqyQpONCAUyooGXd4gvta3hsmZj5FYkskspF5bMKkr+ydERyO5mnRIcyJR7xn
         GJPW4zUb6Tc1wNU4lqYXGHR3MSNn7yZoXkR6PKNlt7iUIgg5IMUBHP0xYW3OlD7cC6WI
         2r4g==
X-Forwarded-Encrypted: i=1; AL+hErGdfCqrLDPvr5myc92osWHhmZehozmDEfpdYBLDyYg9v3A4c+0IVNdk8ppZ4hTXzPCuYpkV7j55qnKa@vger.kernel.org
X-Gm-Message-State: APuU4Z8JOdv5zH2qOTrh/sEOOPYb6ghlM+PC5ZeMqIozr2+GJheo0dHT
	k6nfR3DDPc71uWGse0iwQRNr2ThM7LiVu7ZbGM2suRrO70anH/Jhy5vT60zcfSVHQTKaosi5oyg
	yr86qd6CjQ37jsrg1PnntSOVTCCAhMVdl5YCf+so0jCW1PTgua6i4omDVdmEAI/8l
X-Gm-Gg: AYBFou29RauEQ/HBPKXg187cxkK/avdjslaG40yiI3j7C6RLE7p66ons/dP/3DUc9mG
	/RprTPSnTg9y7C3GayxPVMlsZHH45U0XLEn3Nx+aHWyIsGBgmDAR6CvhYOIJHe7zkjyhXbMjxHk
	+bmSKxiV+Y5aCeFEDpq4EgVTkGPFBM3bJqrwlwZZlf+P/EtpoEbf0Nrt6DU1mMu6uePIh/pt1su
	fSq9ZZfbS37IpptQhRUkPBEKFYl5xZ0tSaXD8kUfnyVKdicPuXRH80UXTJzwpVUX+gT20Ebvruq
	ZoX6kgPCm31SwDzhZElf9MZ5onSr23a4gYm1TWG1KArMd1frGH88fZcXYIhIH0EyfFjkFdv33gi
	vqqAhNmn5HdydC4NOywZNmpwttZm6rEP7n9XY7wdyHzNhmo0g+aS4YUnn4axvKWnhNw==
X-Received: by 2002:a05:701b:2802:b0:1b2:6d5b:36bc with SMTP id a92af1059eb24-1b39feadb75mr3802718c88.23.1794183326013;
        Sun, 08 Nov 2026 16:15:26 -0800 (PST)
X-Received: by 2002:a05:701b:2802:b0:1b2:6d5b:36bc with SMTP id a92af1059eb24-1b39feadb75mr3802676c88.23.1794183325325;
        Sun, 08 Nov 2026 16:15:25 -0800 (PST)
Received: from [127.0.1.1] ([2600:1700:b450:a0df:c754:9665:1e1e:bbad])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3771ea85bsm9105109c88.18.2026.11.08.16.15.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 16:15:24 -0800 (PST)
From: Jason Pettit <jason.pettit@oss.qualcomm.com>
Subject: [PATCH v3 0/2] arm64: dts: qcom: Add HP OmniBook Ultra 14-kg0xxx
Date: Sun, 08 Nov 2026 16:15:23 -0800
Message-Id: <20261108-hp-omnibook-v2-v3-0-f489fd0bdf33@oss.qualcomm.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJsQ8WoC/12NywqDMBBFf0Vm3cgk9UG68j+KC43TOm01NlFpE
 f+9UXeF4cKBe88s4MkxebhECzia2bPtA5xPEZi26u8kuAkMClUmUaWiHYTteq6tfYpZCZ0jJUq
 jSZIUwmhwdOPPLryWB/upfpAZN8vWaNmP1n33j7PaeodcovyXh0Mha63zLG+oqbCw3sfvqXoZ2
 3VxCCjXdf0BN8ukf8UAAAA=
X-Change-ID: 20261025-hp-omnibook-v2-970e4290c445
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Jason Pettit <jason.pettit@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Proofpoint-GUID: q1Mo0cRanDzCqxit28BCJntKAIhbc2wo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDAwMCBTYWx0ZWRfX8dYfVNunotqX
 WhbDZ5u3V9iklv6Ozace1uHnKo5Vh3zs5iGoqM62XX+PgR43l89rXf2zWzS/G6mIcdS0ijKjaF9
 eAMhjVkDDfhRWjXfU7jaJtYL61YmoYLEyRF/ondSd/Phl29fK5bDfVRsLBoAZOgouMEOUCuVOUL
 4swv+roLbGrDtXiPS27NQsEwiCDGzDSI8yLWvZ7zLx6sEJiVCBc7zgYatTe+hDwuBAsm+/lxco4
 op6GNA9LDhCiHay2Wb9kgcMYdpZUG1MgNHFlCdEyJdwhX8r4QCbi0nIqBBFC7QkYvY0KjUjiPBd
 jkEd/1q7thNpjnJEjBg/UK2S32cbCOz4VYFkCllit7cLt7lPYSHh9fWqZ6H2JSfDHoUZjIpsTVy
 N1VWkpScJqYnJx93+8aidkKF+DjYZnd9cuJlMFMEuusJUu4BTzN3s23C7g9XEFYS80KbMITojqO
 QeYu8JXEOXIvH0ylpOw==
X-Proofpoint-ORIG-GUID: q1Mo0cRanDzCqxit28BCJntKAIhbc2wo
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDAwMCBTYWx0ZWRfX7qC3AA6qZW4n
 hK2xEFh/F/zn3gOBsAwxOm74VLZfxFWcsAWc9pnqb7Tlq85sI6OQcRWXnKVCXcg0Ab6C+7W8NXs
 W7PYUat9volQQikA2Uoeg/DFhxX/20U=
X-Authority-Analysis: v=2.4 cv=JtBkP84C c=1 sm=1 tr=0 ts=6af1109f cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=IlVBBCHpe6Su3lOAXoAA:9 a=QEXdDO2ut3YA:10
 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-08_07,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0
 impostorscore=0 phishscore=0 adultscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611090000

This series adds device tree support for the HP OmniBook Ultra 14"
Next Gen AI PC (product SKU D29KLAS#ABA, board 8F03), a Snapdragon X2
Elite (Glymur) laptop.

Working on this laptop with this series applied:
  - Internal eDP panel (2880 x 1800)
  - 3x USB Type-C with DisplayPort alt-mode, USB, Power Delivery
  - NVMe SSD on PCIe (pcie3b)
  - Wi-Fi and Bluetooth
  - HID-over-I2C keyboard, touchpad, touchscreen, lid switch
  - Adreno GPU and GMU (Freedreno GL on Mesa)
  - Audio playback and capture
  - Real-time clock
  - ADSP and CDSP
  - 5MP USB RGB Camera + IR Camera

The device tree builds and boots on its own. USB-C DisplayPort output,
including over retimer/HDMI dongles, additionally needs the qmp-combo
DisplayPort PHY update series for glymur (not part of this series):

  https://lore.kernel.org/all/20261028-glymur-phy-v3-v6-0-1f1d2e565a66@oss.qualcomm.com/

This device tree was prepared with the help of an LLM (Claude).

Signed-off-by: Jason Pettit <jason.pettit@oss.qualcomm.com>
---
Changes in v3:
  - Rebased onto next-20261105.
  - Dropped the firmware/scm patch (3/3); Bjorn committed from v2.
  - Removed the reserved-memory/linux,cma node. (Konrad)
  - Dropped the "Assisted-by" trailer; LLM use is noted in this cover
    letter instead. (Abel)
  - Included the pmh0101, pmh0110 and pmh0104 PMIC dtsi.
  - Added "serial0 = &uart21".
  - Marked vreg_l18b_e0_1p2 regulator-always-on; it is the reference
    voltage for the pcie3b wake and reset signals.
  - Added the NVMe endpoint supply.
  - Carried the Reviewed-by tags from Konrad and Abel across the above DTS
    changes; please re-check if any no longer apply.
  - Link to v2: https://lore.kernel.org/all/20261101-hp-omnibook-v2-v2-0-1b99767deda0@oss.qualcomm.com/

Changes in v2:
  - Rebased onto next-20261030.
  - Addressed comments from reviewers on v1
  - gave sound card its own model name
  - dropped redundant items already enabled in glymur.dtsi
  - annotated gpio-reserved-ranges
  - Link to v1: https://lore.kernel.org/all/20260830-x2-hp-omnibook-ship-v1-0-9feada71dc79@oss.qualcomm.com/

To: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>
To: Abel Vesa <abelvesa@kernel.org>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

---
Jason Pettit (2):
      dt-bindings: arm: qcom: add HP OmniBook Ultra 14-kg0xxx
      arm64: dts: qcom: add HP OmniBook Ultra 14-kg0xxx

 Documentation/devicetree/bindings/arm/qcom.yaml    |    1 +
 arch/arm64/boot/dts/qcom/Makefile                  |    1 +
 .../dts/qcom/glymur-hp-omnibook-ultra-kg0xxx.dts   | 1013 ++++++++++++++++++++
 3 files changed, 1015 insertions(+)
---
base-commit: ddfe51b0a0f5dc9e415cc2c8ad8db17532dd426b
change-id: 20261025-hp-omnibook-v2-970e4290c445

Best regards,
--  
Jason Pettit <jason.pettit@oss.qualcomm.com>

