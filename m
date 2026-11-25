Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795611280;
	b=0aYOPVoPrFGd3Kg+rgi+h0Xf/NJ1HQvgTSmAuEvc2vGYotLKJNPC29ejFhdvSduAHOwt
	 Uk4Sa1L68aHpgHsZ0BiMa1T2cZOfvruL9nqP//ntAHrt8/fTOr/bjWa6lyKxbgmjYRU3C
	 WnxQnQs4ctLWarBEmMvO+t+igPrjkD0Tq21c6E4MsNp6AdUTZuK997hi+/XUYo5Y67M+e
	 DB3MGgM/gXN1OlK89NnJ9vIYT+2b3QfL0x57zxiFzJxH9O1R82Lbn/NTvnxfsrj2W0aSS
	 mNicB7uysZ+kJQyMbjlw4g2dPbuZcsLgJ9ub9cHT3+3tXj3gIHIyBl1cNMiMcCAlTXg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795611280;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=BJDioDDua+dUwIQK+UWlYGAtjamz3gG+eeXOxwGF//8=;
	b=y25SLC2m/QGDAJWbJxDveMdtEujq4y4+4AvPbOEE+fXxFxJYMgt2PX9Vvvasf0gNYKTQ
	 VmyFmaKjk01w6meghMQ76Qru8JXqtPlZtwHry0l+5kt7YQSKY/z4LJt8mfeP47lt5Uv7b
	 6mDXIDIiBdVJKfm6xrWBilLVR4cRDxPThsW9u5cE2O7+RMXKT/K0iVaUcSsfqHNgPFUt6
	 eCTUMHAM8KQFCeT4Z2OFRdquc5pdfDmP+IyuLJhSGAmCq37FAOC2vs/cwK9uCI+qvgdZI
	 mfgCNTbjS6Otdi+oOZoTQBf7Jn0yrKuIYhDsllKFI967+hMBlMF2qoaWZjyDpd58q+w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MqZOZgwD;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Su0FrEX+;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F367606A693
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 12:54:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6F367606A693
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MqZOZgwD;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Su0FrEX+
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP9mT5q4034177
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 12:54:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=BJDioDDua+dUwIQK+UWlYG
	Atjamz3gG+eeXOxwGF//8=; b=MqZOZgwDVziczld/GfYZpMp44aNhRNosX47+2N
	il2GNfBe3yFidPC2ichCj1scg60Acm8dFkA31gItY12J+jBCjoTp8WW4XKL/UA9H
	bsxLwYIYFTuxq8q4yOi5bRJPzDdUae637pPbG+x7E7KwaWevV/5MVVmkOAEbVlXf
	wzLY5NNlbTA6URf8147zU26teWkR8cisVcZSHYl45n0hcrk/sD6/quO6TPrso6hT
	5mAUb+8oQhrUmTzYAtw0Z/REXaiWg6VV0fiu2SMMX0IXJn8ivw9EagVJGJuR7azF
	+06wd0Eo0NQO5K9g90cEaBL5s/vyNZlpjmLVHJDURNZBsq5A==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5mqbjueh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 12:54:39 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2f02547a462so10023235ad.0
        for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 04:54:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795611279; x=1796216079; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=BJDioDDua+dUwIQK+UWlYGAtjamz3gG+eeXOxwGF//8=;
        b=Su0FrEX+qUdl9PMdA5EUuA5XSO3mAxzvwf6hDTDHNwvMDUbXjv/M4NLQxE9lng4uyI
         Iwn79H8YXskjDtyA9/CJ9kA2mAwZTtTJmRBK6VvEo9K1HLG1fWuScHL7mdG1SkwOIElg
         K5wkeqxFwfiFkomXwAW54j4MLRYoi3442tM5HXnV4vtbLrfXTeNMbqTaCP27nSB4H2g9
         D0YIBnMf5cbwjCFoYlwR93wwwvDKChXOatABAtzoF9ZY6SnRPeqRcy3zfWPJoYQ9jqX+
         Pm6gZp75pxLPsinJPtsvGIcXT9JpNmq1oRBd4vzg01/hvRX5yKr+rXD7DgYQNHivDrV4
         eNow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795611279; x=1796216079;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=BJDioDDua+dUwIQK+UWlYGAtjamz3gG+eeXOxwGF//8=;
        b=u679s1n4U8Ii8UJ50YFAlOEpRXAQxdaRvFIelNTM90cmkx6sKmdxBq4qWgPanRyGZr
         5FLrQY22iq6exyRcaUXqPlTP3vFVWQpjGYEO1epRuaJgrDQeH6//HLuG4axAxxzxavUG
         y0NMXUloh7DcnlM6bw3j0uGVnRuyKqr2HAj4AFdCE1HlNoNj2BwW2+TV48R1YvMhoKwG
         1z9LDMoRofweatMkoxmslcBdIsauxCr4MnMnCuPtzgL6pXDmrHeiATOUSAwfHmw9KwS3
         vFbnQt7WbXwZuC7YnZZRc+OSTceh4OcUVOetc4NWXkIt1n5enet7p7KsHhK2HOZQG77F
         v3fg==
X-Forwarded-Encrypted: i=1; AL+hErFE/Shi4rQvN7g6Q7v7nvSD1qei3ijRHABsL4NC9Cdo/4K0Zr+fZQlqctf58InXCT7qSOG1PvRjq4tj@vger.kernel.org
X-Gm-Message-State: APuU4Z/cW2Was34ZAsNUxG8CX1hFDAIkYqPMkJI/1NpXhCqYOJ+5KZU8
	emUxBaFgzf7fZEVvv4Ongjv5BSSffEN3mDzLkqr0SQvKMvmXWMwF1p66uYoppc2LaCZ8ueGm6by
	0jE7wt6d3QLYLaUzMxPKYL4qHhL9wm2oy9kNQcvpufoc7YImkzxjj8GXh7Wzecc1iTiHBd4xy
X-Gm-Gg: AZFdTZdGLazHXeNtlKq+sNGPqeT9ZH6/av9CIrIfZWMVNUArxPZUevIuax6xKwChBOf
	YIiPz0jm4PTb7TYWc1bnwr8MF967rw/QDdQSTF6U2Anl/MdIjV/NXJf03LwBffcgtHbNC+xGUoI
	8uN3VSGm8kNcfbxCm3jGPjDMnrbPEmsC3Dl051l/z4k25nLJP/Y1+I5NLF7uXXvX5NndiKREsJF
	4ZOZ+VeneuYjBVQaiU4hvKo/Up+BVXtjI6LnFY2eLNSEviqXBT/DhERK665hKahxgbzKTBeA4Sz
	CfPhnd+OAEJa/V2CCqLZc0IjQPbNY6Ln+gvsu2/tSDvisgtpvjvSPnKeLLgIYcBz7cZWDcPbml5
	/+VtgNZVMWn69+cnhvk+GGk8+F4iqFBdXBjMMZ48YLywCikXIy1OsKL3wb35vL/tsl2XVZhJ7Jd
	+4qqxdsvm3JBGqTc2Oguw8R9rwYucpC3f/c/bzTLzvP6LRXCGBNjbW6b4Swt5KfqnNISv3MxJwi
	fgD9dt/oUKnOPeL/vLkq4c7a2pw
X-Received: by 2002:a17:902:da48:b0:2ed:29a5:782d with SMTP id d9443c01a7336-2f03f1903b3mr290972525ad.2.1795611278897;
        Wed, 25 Nov 2026 04:54:38 -0800 (PST)
X-Received: by 2002:a17:902:da48:b0:2ed:29a5:782d with SMTP id d9443c01a7336-2f03f1903b3mr290972175ad.2.1795611278463;
        Wed, 25 Nov 2026 04:54:38 -0800 (PST)
Received: from hu-vishsain-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f0b58fce71sm31940575ad.45.2026.11.25.04.54.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 04:54:38 -0800 (PST)
From: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
Subject: [PATCH 0/5] arm64: dts: qcom: monaco-draco-evk: Add display
 interfaces and overlays
Date: Wed, 25 Nov 2026 18:24:24 +0530
Message-Id: <20261125-monaco_display_intf-v1-0-8a27d60b0d94@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIAIDaBmsC/3WO0W7DIAxFfyXieVQBElOiadp/TFVlwGxISWghj
 TZV/feRto/by5WPJR/fKyuUIxU2NFeWaY0lprmCeGmY+8L5k3j0lZlsJQghOz6lGV06+lhOI/4
 c47wE3jtyxu89BUWsXp4yhfh9t34cHpzpfKny5bFkFgtxl6YpLkMDvjVKIRnfAegOgRAU7jUZM
 mg7ApCgW2c29USl4L3V0Lw+S6lnKe7zlqvkLVdEykql+yDgPZWyO19w3B7uarz9bxoXUwfHV81
 XYapIBEvSattLIf4QHW63X4p/oWZEAQAA
X-Change-ID: 20261124-monaco_display_intf-5cec9d8def3e
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org,
        Vishnu Saini <vishnu.saini@oss.qualcomm.com>,
        venkata.valluru@oss.qualcomm.com,
        Jessica Zhang <jesszhan0024@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795611273; l=2959;
 i=vishnu.saini@oss.qualcomm.com; s=20251113; h=from:subject:message-id;
 bh=UntkIqu5gtOG78Y3H+5C9JxD3OMVpiptaackWjar/4c=;
 b=0nAeV7G8mBlu622PkRUYOCkewMlIp3G4sknwMpUynLAeukdjnR2qA5sethiRIAgUNDoO65VXo
 WYhoL4RQxd/CxRoyuGdzkQKGrtjnvlw4abGNtj0vict7xJykKLWik2H
X-Developer-Key: i=vishnu.saini@oss.qualcomm.com; a=ed25519;
 pk=8hlXlF8j/3GeOaDK3w2LYhkv9FanCQru0c7kRH/It7k=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDA1MSBTYWx0ZWRfXzOJiYzDMRk1N
 XUgLqVjor2KDs25DLWFOBd2IxG5e083h/iC3hg6Fl4O/tJH1a4KpHZPq+ra07PDJeGO9OpCGE1l
 FaEISauTFUeZj6B47znUVZNKSKyOuuA=
X-Authority-Analysis: v=2.4 cv=Bb9NQbt2 c=1 sm=1 tr=0 ts=6b06da8f cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=p_bOUqcuj8HARrLJNMsA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDA1MSBTYWx0ZWRfX/tPN3CNylm1J
 9Ujm9CHEUq+cjmAhYMY5QJjXOlZASJ2mgo/jmXnuBCsIx8DYfjlHN/xB1TnKcMVasldUgVYkn9F
 DDXSx+qtNzLSQJmlQ8PdvUzgUCxMhQd7wdqWhiajA8tA6CwG3rEGDrVKRd0t97OliYstZ3FO4cC
 JViOwpr2prxAk81dmo0bPOC/TBuMo05TAEWgdT7AZfAcjRBRRwlK4kc/Ta+gx3poXdMASay1B+b
 3ddXu0P3RCKnNa7TsFNlOHAnTjsgtUZb3L9OSnWnAG4aftBOAvv0K4manXnRtzYQdsmExf75hL9
 cd43T0ZJE0ph/k2MEactx4Cf0GBrnpqe8pL5QocqMRboaPP2EKTf4s5f0ssOyuLyv8d7lEFlp1d
 Bv7U/++Fy2753pPBSNG4VhE5vWjaCLQIfaiMi1rHW+CJKqq/KKVLK2nVcjeDu2mIH+bNxJiQWaa
 QF+KKXnymELELxsa93w==
X-Proofpoint-ORIG-GUID: ZUIzgJ3fHmcQTdTrlA8C-FxbmE5YMR40
X-Proofpoint-GUID: ZUIzgJ3fHmcQTdTrlA8C-FxbmE5YMR40
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_03,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 malwarescore=0 lowpriorityscore=0 bulkscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250051

The Qualcomm QCS8300 (Monaco) SoC card is mounted on the Draco EVK
carrier card. The DSI0 interface of the SoC is routed to an I2C muxed
display connector, to which multiple display daughter cards and panels
can be connected. All of them share DSI0.

The below display interface is enabled by default in the base DTB:
  - DSI-to-HDMI using the Lontium LT9611UXD bridge

The following overlay DTs are added for additional display
configurations:
  - monaco-draco-evk-dlc0697-dsi: DLC0697 DSI panel based on the
    ILI7807S controller
  - monaco-draco-evk-raspberrypi-dsi-7inch: Raspberry Pi 7" DSI panel
    with Goodix GT911 touch
  - monaco-draco-evk-waveshare-dsi-8inch: Waveshare 8" DSI panel with
    Goodix GT9271 touch
  - monaco-draco-evk-lvds-auo,g133han01: AUO G133HAN01 dual-channel
    LVDS panel behind a TI SN65DSI84 DSI-to-LVDS bridge

These overlays are applied on top of the Monaco Draco EVK base DTB and
disable the HDMI bridge and connector, as DSI0 can drive only one of
them at a time.

Dependencies:

- Monaco Draco EVK board support, which adds the base DTB:
  https://lore.kernel.org/all/20261123-monaco-draco-v2-0-3ee3b2375f16@oss.qualcomm.com/
- Lontium LT9611C(EX/UXD) bridge binding and driver:
  https://lore.kernel.org/all/20261123-lt9611c-v7-v19-0-1fbe2b7b5211@oss.qualcomm.com/

Signed-off-by: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
---
Vishnu Saini (5):
      arm64: dts: qcom: monaco-draco-evk: Enable DSI to HDMI output
      arm64: dts: qcom: monaco-draco-evk: Add DLC0697 DSI panel overlay
      arm64: dts: qcom: monaco-draco-evk: Add Raspberry Pi 7" DSI panel overlay
      arm64: dts: qcom: monaco-draco-evk: Add Waveshare 8" DSI panel overlay
      arm64: dts: qcom: monaco-draco-evk: Add LVDS AUO G133HAN01 panel overlay

 arch/arm64/boot/dts/qcom/Makefile                  |  13 ++
 .../dts/qcom/monaco-draco-evk-dlc0697-dsi.dtso     |  79 +++++++++++
 .../qcom/monaco-draco-evk-lvds-auo,g133han01.dtso  | 147 +++++++++++++++++++++
 .../monaco-draco-evk-raspberrypi-dsi-7inch.dtso    |  97 ++++++++++++++
 .../qcom/monaco-draco-evk-waveshare-dsi-8inch.dtso |  94 +++++++++++++
 arch/arm64/boot/dts/qcom/monaco-draco-evk.dts      | 114 ++++++++++++++++
 6 files changed, 544 insertions(+)
---
base-commit: 6d0933ae9d46674a6ea63a87e9e9ab4e662670c9
change-id: 20261124-monaco_display_intf-5cec9d8def3e
prerequisite-message-id: <20261123-monaco-draco-v2-0-3ee3b2375f16@oss.qualcomm.com>
prerequisite-patch-id: 6e31934c1ab65ae2ab7a9e7f0a3ce1cf2e4df9bf
prerequisite-patch-id: f3d2572189774e17ef016652733bb7a33375c0d8
prerequisite-patch-id: a1ffa461060aec6d03247fab5d6c1422aa851e11
prerequisite-message-id: <20261123-lt9611c-v7-v19-0-1fbe2b7b5211@oss.qualcomm.com>
prerequisite-patch-id: 49f1e01bb5594ce9c4301ce4b16715834ece7f41
prerequisite-patch-id: ac9c419ccfd8b3816e05867d6b09ad49ccf12a24

Best regards,
-- 
Vishnu Saini <vishnu.saini@oss.qualcomm.com>

