Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792595859;
	b=4ktCNDKy20zTMBFUBGEfVlQ6Hv+3AH2R9Xw7Kpe3jHopX5zdFYH9GmB0j7elfNaiPqLF
	 mkiu4aTP6RvhInivimLBlMwLOSuZJ7y0n/OLgOFji6iK3SawdW76/wctQ/2Ih70tOFmOI
	 u5DfMOG8aOpzudBcVsx/5OeZuuul+uuuMkomNEwXW+HtEq0khp4ldph49aAsTVwFcKQL5
	 hb034nhRokUII4Ck0kdDWAyjnxwsd+UxsB8DGMIJ3yH7xemylEauiT6yb7nxkZL7ofGBG
	 VkfWUn6SLCXteghWgzlP+y7BN89KPLC5NPs/MqjO0PqDsaOvC5SKr620ySnmRa9O1pg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792595859;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=sMmjYtG/rjFjeMhRDVGkf/87tw6pvM/e0yvKC2pDRLg=;
	b=AmXfNDrTKbTb51OlQDZbc3/FNzQCz5+PVFDvazY8dr+Kjd6TuTmnNSozFboifMNmVBJx
	 2wVS3qO+JiUCv4KGLcuw/JUVD+xmrjfIwPJ/PP7R25dDSMaGbW4NbQYEEN3hRf0ZnUB7o
	 TAOV5tg2ZfSU7TqlOzVExVa0B6ze4WqkqZdOIRwFvtCw+AUh/bmVl69fHj/IARemLkiXy
	 JVjM9S1mN98Vzv+HlyNokmvPJ75o2ObPH5uBQVKqkC6NUG1RKgdS9uic40ZJTxi7tmwjj
	 g8raGZih6zVCWFsN5WHic/9ANY3LZV/IA8dhZXqyjsFcb3AYblhawoovJT7RfNv42Ag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="I/5/5o/3";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=avTrso4B;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DBE6606A31A
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 15:17:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4DBE6606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=I/5/5o/3;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=avTrso4B
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LEExNG876690
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 15:17:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=sMmjYtG/rjFjeMhRDVGkf/
	87tw6pvM/e0yvKC2pDRLg=; b=I/5/5o/3w+GXYaqYMYOy5XXTKXJ4O+aPrJtD8D
	q8n3+swFpVlK7tsTSeUhbOlkxaO+YtTwARHNPLp6lCzJrGsqr1hnHMcKFfADGpdF
	tMTWiMZN/RjtEpfem5WRIp9wrN9ySsBLyeLywNwxG+uGtpuT6+KanMaEKLC6Fnn/
	0maZclydMceUFEvpyqrSijs0vOHjgcLRCYM2H2s34C500Szl/NQZRhpRAmi4qCSU
	a2jP7tHiO2MRIP9CC1uFz1nVur0wSi9t3+S0BuP+gfgXJjQ/A769vseMOE69K9n6
	XAeCoKYtk94sU4b1auyyPbg3yJA4glIy1tCpp8Vpr7FX2zUA==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hetj49duy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 15:17:37 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-33c35f5ca6cso1591614eec.1
        for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 08:17:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792595856; x=1793200656; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=sMmjYtG/rjFjeMhRDVGkf/87tw6pvM/e0yvKC2pDRLg=;
        b=avTrso4BjPJJaDA9tqiifXSMknqtTNBAHK7NFZhWSCGRhE3tFMOqgOLmvmrHyV4zg1
         K/9q0usXuigzpWbTcmOLtwWxkmrdNCInNU96WK/DSr0tp5QRk89LTB1Mq++nHC6vj0Hn
         P+BJM3YjR+WXf4ib8IVSJ/5PAQztW2tdkpKdPksmj2/xgQN8iUzqXSMIl9xdaGDTV05n
         a7kXeyb150FG3fvJK1S2krOAXvC4FJgSMNygqFMPu3wFlUroIaUT7B1oqAhkTfVh+Sz/
         DH8FvnifYNoOpcwkMC5kvTYOKBs9/avjlh8E8UbqG/EgbQFg7jSu+5CJE4v2tOBlPKjC
         6BSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792595856; x=1793200656;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=sMmjYtG/rjFjeMhRDVGkf/87tw6pvM/e0yvKC2pDRLg=;
        b=ZR/9A+bEyOvFgbKZOzh6HYSJTneQODNHU/QHYkPF+eSsbHT+v1dquCQc4zJzhrg0qj
         jYZX8SLgSjjCFxOnsSA9Uu/8IcHYpgNm9aP+Tl2lDzHd1vhw3a9ge+dehWNxgF/bPnlW
         PBdoYm/s7LWo2p6Qf6Nnu14yWsgZqLiTCMi3/Ns0uqY80q87zuYMZF3H2RHw0/SNI0E3
         6WgGD1ROyeGWLdzaYJHcxYekz3wclTltSsaUpVhv60CYeSxdrRCit+TpDNjeZQ0rFWnh
         PTOy6RFOR4hTZ4k1HZRd2eI87yYfo0lH2+OWd5G/28anwfw528BlfbuDol7gjiM/85Fs
         O6bQ==
X-Forwarded-Encrypted: i=1; AKwUvBy10eQVZnrO+EJix4sxLMQ9wPYrDYgZAzx2nzvyVqandA2z3Fnw2C83ah6cDrUxQZU2+xWmrjTdvEfT@vger.kernel.org
X-Gm-Message-State: AFq9FYKQBUwqV+pyHb9cSdRXW2aDxqzJJjehLJB/Jtku/TeAOSIfjG42
	H2F+/sGtmKrBAIjT1oNb9TkniRV3fzqVc2xiAyayDM5+HqvDH6vCjzRtXVKeB+dprmGQzGXVVnH
	Xe+x544ugbzXsDyrReXXSAFQ/KKOhY4MzsQOz6JzjvtGJm5L3UG+BMPyoOjDBVM9k
X-Gm-Gg: AYBFou18YGnWemUE5HEDeAMMHbr3I3HKEo3Y4nS8rLkvw7wClia42azH8ZypnVsbV8J
	n9B+hYxtRQjz3Pwgoke20AcSd6/JAC5mzWp3n3Iqiac6+d/pdKT7cquUFAhMlvt5zTNsaf4KtZi
	kV9avi8GLff+79kA3PnGGKxpb7OtFpbLPNNQyYfYYdDL4FL5q4i3T6nKTWcUDG37xgZ6oI39pPJ
	GBO9N7aIvE/7pgQGkIK5RrotQrYKah7/5CYwIEXbxqEHZSjez5UvTtue2R2/8rEPEMyis5wdBro
	+phAJY6Ni0Fz7F3bmWRm2yz/UOo9vS4xdryL3v+ofls+qF5/Pz6H/5P3tQrAp3de3a+XhLp7Cl7
	eWC75lLgSicJWw1G/M7o8QLmud4xWCA7Q
X-Received: by 2002:a05:7300:de42:b0:351:dbc:b663 with SMTP id 5a478bee46e88-3674e54a412mr3556452eec.31.1792595856398;
        Wed, 21 Oct 2026 08:17:36 -0700 (PDT)
X-Received: by 2002:a05:7300:de42:b0:351:dbc:b663 with SMTP id 5a478bee46e88-3674e54a412mr3556416eec.31.1792595855604;
        Wed, 21 Oct 2026 08:17:35 -0700 (PDT)
Received: from hu-anantiwa-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36740cc8c6dsm9142117eec.12.2026.10.21.08.17.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 08:17:35 -0700 (PDT)
From: anand.tiwari@oss.qualcomm.com
Subject: [PATCH 0/6] arm64: dts: qcom: talos-lyra-evk: Add display overlays
 for EVK board
Date: Wed, 21 Oct 2026 20:47:24 +0530
Message-Id: <20261021-lyra-display-upstream-post-v1-0-585caa39cd7c@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIAITX2GoC/yXMwQ6CMAwA0F8hPdtkW2QRf8V4qFC1BmFpB4EQ/
 t2px3d5GxirsMG52kB5FpNxKPCHCtonDQ9G6YohuBC98w32qxJ2YqmnFadkWZnemEbLGI6xjiG
 eqHEBSpCU77L88sv1b5tuL27zd4R9/wCrlwP7fgAAAA==
X-Change-ID: 20261019-lyra-display-upstream-post-24656268a902
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
        Anand Tiwari <anand.tiwari@oss.qualcomm.com>,
        venkata.valluru@oss.qualcomm.com,
        Mohit Dsor <mohit.dsor@oss.qualcomm.com>,
        Shashank Maurya <shashank.maurya@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792595849; l=2465;
 i=anand.tiwari@oss.qualcomm.com; s=20260717; h=from:subject:message-id;
 bh=/x6VoMzCsBiTnvMH8LNkojMMeM9fxxZt7W8E4IaOH9U=;
 b=AuvkK5Dy6j2wfe5kYXF/E2SbeA9MltC3kcc7mwKTrxraE7JHfYgZnPiNHnMgUDVZg3iCUQwIC
 gF1B65Jtm6ADjLInfuOs5fVdHgQ6+KRPsO/A7bpuuO2vSGgyMuKR9bY
X-Developer-Key: i=anand.tiwari@oss.qualcomm.com; a=ed25519;
 pk=ygURjl6LxwG8EhgPNHYYgCZLsaXFgWZZoHRRyud5B40=
X-Proofpoint-ORIG-GUID: bSoxw2RcPeqLR-cSOmc3V_QtSW59zbZQ
X-Proofpoint-GUID: bSoxw2RcPeqLR-cSOmc3V_QtSW59zbZQ
X-Authority-Analysis: v=2.4 cv=N768hG9B c=1 sm=1 tr=0 ts=6ad8d791 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=tMPW8O63IxkL4n0aSRoA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA2MCBTYWx0ZWRfX5O1MwpikMAYU
 RQYVWjEdEbC/8IrNv30WwVup5/OcVqbyg0prsvarS9lk1gaRX+yBN0LLwspn/HEV5VSA919FItA
 JXIiJLtmoP4C57u9YmcsiNloMdM1Nb1Hz5+2Sd93iny0qgG4URjVAi5XoUnAMniW/2Xsv3x187b
 6GabFYeSqKYuKylOEVXAlG1AVeis4yu682BQp/LzzvSn9y29Wts0zaZrS0B6EQgeWRnbaNvKFPr
 0cGIPSomdBzhfbcTagFnbshFFdI2Qx82iZgwoHLeb2IgOYkhZ3fusGrCWysjUv2m8Dx3uTUUpri
 ApWvQm6ZlXc3kGsMFKg2gnVmx8LF8R2SatWMMex8LUHkT4n0sGX2zz4Oej3TAgekf1Dtu4LazH6
 ty2OCwVmm2crpSB7Uq9OklRYSx6WoKJ8BFKwezC9L9d46NxBFzP7LAAZxbORXPLOJndk7BJpNpb
 +/ztbjR+dz8AqFdiATQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA2MCBTYWx0ZWRfXyOMXMl7E/UZv
 bECcU1b2nsTV7e3Ue4PQc1KOZkz5hln5jW8uPaAeXwcdsKQy9iEuarKVJo1o4HesYDMkarqLt54
 lKEnieujo5z6h5m7rWcTZuees4YGUYE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-21_04,2026-10-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 malwarescore=0 suspectscore=0 phishscore=0
 bulkscore=0 adultscore=0 impostorscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210060

Talos Lyra EVK SoC card are mounted on the Lyra carrier card. The
DSI0 interface from SoC card is routed to either the 22-pin DSI
connector on carrier card named as JDISP1 DSI0 or to the DSI0_B2B
connector, through a MUX which can be selected by a hardware DIP
switch. There are multiple daughter cards designed that can be
connected to this B2B connector.

The below B2B display interfaces are enabled by default in base DTB:
  - DSI-to-HDMI using the LT9611UXD daughter card

Below overlay DTs are added for additional display configurations:
  - talos-lyra-evk-dlc0697: DLC0697 DSI panel for Lyra with DLC
    daughter card
  - talos-lyra-evk-raspberrypi-dsi-7inch: Raspberry Pi 7-inch DSI
    panel with touch via the 22-pin DSI connector for Lyra
  - talos-lyra-evk-waveshare-dsi-8inch: Waveshare 8-inch DSI panel
    with touch via the 22-pin DSI connector for Lyra
  - talos-lyra-evk-lvds-auo,g133han01: AUO G133HAN01 LVDS panel for
    Lyra with LVDS daughter card

These overlays are applied on top of the corresponding base board
DTBs.

Link: https://lore.kernel.org/r/20261012-talos-lyra-evk-v2-v2-0-dcc9316ebb59@oss.qualcomm.com
Signed-off-by: Anand Tiwari <anand.tiwari@oss.qualcomm.com>
---
Anand Tiwari (2):
      arm64: defconfig: Enable PWM_CLK for backlight PWM support
      arm64: dts: qcom: talos-lyra-evk: Add AUO G133HAN01 LVDS panel overlay

Mohit Dsor (1):
      arm64: dts: qcom: talos-lyra-evk: Add LT9611UXD HDMI bridge support

Shashank Maurya (3):
      arm64: dts: qcom: talos-lyra-evk: Add DLC DLC0697 panel overlay
      arm64: dts: qcom: talos-lyra-evk: Add RPi 7-inch DSI panel overlay
      arm64: dts: qcom: talos-lyra-evk: Add Waveshare 8-inch DSI panel overlay

 arch/arm64/boot/dts/qcom/Makefile                  |  18 +++
 .../boot/dts/qcom/talos-lyra-evk-dlc0697.dtso      |  78 ++++++++++++
 .../qcom/talos-lyra-evk-lvds-auo,g133han01.dtso    | 134 +++++++++++++++++++++
 .../qcom/talos-lyra-evk-raspberrypi-dsi-7inch.dtso |  88 ++++++++++++++
 .../qcom/talos-lyra-evk-waveshare-dsi-8inch.dtso   |  75 ++++++++++++
 arch/arm64/boot/dts/qcom/talos-lyra-evk.dts        | 106 ++++++++++++++++
 arch/arm64/configs/defconfig                       |   1 +
 7 files changed, 500 insertions(+)
---
base-commit: 1128acbf0e37fb5fe5b67d7e2494fa45905afda0
change-id: 20261019-lyra-display-upstream-post-24656268a902

Best regards,
--  
Anand Tiwari <anand.tiwari@oss.qualcomm.com>

