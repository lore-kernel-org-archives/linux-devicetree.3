Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795756996;
	b=HniafHTaTNV/+c0eTHVC6Oi8BSgLNVnCMjMOZZLwWDAsl8x11badQT8vBabE+6znvqqy
	 qcVpnHiAAryEGCryA+dpa7+LrN/w/fHkdLuQaqBdcldhU7ECGm24+MnT3m6iHMmP1WNRE
	 1VOs+iJXKtzWC24uQ8u6GtDwKvdyBclOQB8AG2yvZq9C4dBJcHQJAhZmynODmPMcjVcrh
	 aJY7mCFcW7lm8rBvTw3E5a/s7NJ385q4sUjEvv8E6pJ22FcYk9dmooFzZ3GnsiXJdaZX9
	 i/9BrelfRBEUwNYW+EhgXhJdjhHYZiuJfKOE9Jg3Mi5r/vJZb0szwuYVbDS+p+zpjHA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795756996;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=EAGgXcLUFrPzdFT+vediXnDt2ttji9J/V8iM8d9PPz4=;
	b=Qttz5qvFhDgSlVjpL4fFPj2nMw1VM1VnRoD5jUIUghczv/AT4PchKjjFPeHCc45cORir
	 pKoE6OADxIK7cPit1uCXRzastNfRJfO01IcJrmZxncOa0kUluOSQU9oUKzUftiOhcW1fE
	 TcmzZxgsVX1jlmqW+WNAGvHO+e0aV3sWFcIGElA6hoHGu1q9qhD6++ZwC1GVpNydt35k3
	 htEMJ8JGvZFNocjMgwG/Dj9F4g0S9TsikBBxPNEVQ1VR9EtUJRNRRIRX0AroKLwipBXMd
	 FOO+5CPAy61sMepFuyOGN69RLCCwXV6wS9ysQAvSNQZoLttT/p3KcE/abNPwUXQvSuA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=a6tDHM61;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ST9TcywH;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F17F4606A326
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 05:23:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F17F4606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=a6tDHM61;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ST9TcywH
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQJwDX13864425
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 05:23:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=EAGgXcLUFrPzdFT+vediXn
	Dt2ttji9J/V8iM8d9PPz4=; b=a6tDHM61NCKQGAXOTdDYFT2eUPx5PGXZyI9jD0
	ebSSE2QcdZtlPqpwMmQf+YmhbGoBQOz2EsJ22rxItFrmBJ65m+2SXGWzbJQR/Faj
	FnaBXRMJvxoTN3TBushNePmvjhy2WkZOKsxm9+suIXTO5C3bLNmCNitn3muLYVMB
	aIhHoQOVuHZsk+0MtDYRZ1aJssUdeMWN8/5m+numPLKIZOryK7IzTAlPKtFjqjBY
	ZyegnpJxBnkuTdO2D4rNmrBr9HEHixTzYw3S29XJlxvPepFedyRko8IV/0vU2u25
	q93dhMU9LJ07QvC2PA4po/aZhbS7mMvg28ANWTRUjfNquWag==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6u55s9rm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 05:23:14 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3b08727641aso1583672a91.2
        for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 21:23:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795756994; x=1796361794; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=EAGgXcLUFrPzdFT+vediXnDt2ttji9J/V8iM8d9PPz4=;
        b=ST9TcywHKDeq+1Ktb2eA+v/m/SsDB24sdO3STtERpqPeXfiTdGtSrVp+CJNUh+b+ls
         XoJ6gePheBFJ7BDKPk1rQNYyQZIpnGtySNrDn7qKbzkSXBe9aOdVj+XJ1mx6EAmMP4cg
         zUxeKga2cZR2NMVcZ3IL2eyakLWREz3iLVJ6Pj5Bv+jhomH4FIUcbVkqvJgmj/aCYFit
         5SLGCPtyNIYfkGvSpXnXaoaldFa8jzbCgyBwscfe65kN7DERAOJn5rqrshxtuZiotanO
         XlRDB2vODBcEmUQ+UNsiJU7K8fN/8P5kio6h36TyVXM1Cqq2DZRCvu/AU5u+Ke56SV2Y
         swIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795756994; x=1796361794;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=EAGgXcLUFrPzdFT+vediXnDt2ttji9J/V8iM8d9PPz4=;
        b=2t2hzEJNKINXVQCeBkX9tz2WZNFPstglzv4L7T9qLTnN+WOLCFXQgYnn5Z+/35HzJW
         7bNEho/OoGIsfx3wAVZYGxZ3bLqmNojTwAkWbsfx8b3XW1SsHAgP3puWF/E6tqnHHj6p
         sUO2j4kBhSrgFHEt6kibqzLUFZgoCvf7l5mmWZpCI8u7CuBBAMtPE4M/57OMOZ0cxlj6
         KH1xG3q0sGCfsbkTbkBki1vwRnRqf/+BJBaWmfvX0pSNTxTXT8oUEp4RJhpfDuu956c/
         YrsD300nRVsc9Ljf0J9jPMASMLvvZ8ZtdMPCt9rnbVMldkjyla+UjX9xzX4neqkzZBe+
         vdOA==
X-Forwarded-Encrypted: i=1; AL+hErF1PUslkYfwWPdgSbCqHhfakSX2V5/KWOgQJONTUUkdl2JwMpjvFz3qBmK86uTrlgy9YWieSFIvLdsl@vger.kernel.org
X-Gm-Message-State: APuU4Z/OaSziuasu+e8RaZ3y7KDyxgtGWBvERg6huLmDbnjGj/hprZXi
	PoqGbpLtiBzw5KP9Rd5daQ21uAS+Q+nOn8fQuD4AwsLAshIG3ivL1mIyey08NeZh6perK5EwmPm
	D5oHPn3/SwK9RT2UvNmn/MMMKtB/e7pmCS6ASiL0nZz5EG3TycICuC2V2WG0AuahE7yLwpy1b
X-Gm-Gg: AZFdTZe6FwZ2wTmJwymQvENYucHe2UQoXxeZ7eXiNmDS5NDfzFnKJjnQ+2x0OdoZTrn
	TmDVfG6BCv0JraSobx5STU1KMn6R76O3hIkVNpvxt9Z4fDMU2iMO1Ej/eylw0Qya+seBW1aIVcc
	GNcH8mFDyPXlcA4QO+R46z0BN2uifou6DRf/ADjrMQ3Rl+wXFB0EVonjiU+m3WRQnyFzVkZiBsI
	PIqp1/ZqdqiUuC8uT5ndgDwd5hMjArzPgin3lpqf2pbqnnjPOLpbk65b1lQ9PLOcoqku/YJ0wQ5
	bKzUnSSmoBRq7lvdOTB/CxsI/gujwB2RKHhr8ekOQtbYCaMC0NCxF1iWKYEr/OFhr5uZsBJC0YW
	VRbZar+0JFJx7HCiLJFsJdf4VL9WS/EGX5N9diMSl8rH8b5gUra0lIQOreayPKpEnTm2STmJBXO
	P+UwXd1hIt+y7U5F+lek72vPc05r3SA1cJryqzT2rTEHZ/TN7KBbBo2Tfgu10WopXTqrUaRZ3RU
	9FQDm1OqIi7tBVUrw7xEvbz+OBZ
X-Received: by 2002:a17:90b:3d8d:b0:3ab:a188:b898 with SMTP id 98e67ed59e1d1-3b41c80b970mr36632094a91.2.1795756993739;
        Thu, 26 Nov 2026 21:23:13 -0800 (PST)
X-Received: by 2002:a17:90b:3d8d:b0:3ab:a188:b898 with SMTP id 98e67ed59e1d1-3b41c80b970mr36632065a91.2.1795756993296;
        Thu, 26 Nov 2026 21:23:13 -0800 (PST)
Received: from hu-vishsain-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b405ec698dsm38637787a91.14.2026.11.26.21.23.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 21:23:12 -0800 (PST)
From: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
Subject: [PATCH v2 0/2] Enable DisplayPort over USB Type-C on Qualcomm
 Eliza EVK
Date: Fri, 27 Nov 2026 10:52:59 +0530
Message-Id: <20261127-eliza_evk_display-v2-0-e4223634aa2c@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIALMTCWsC/32NUQ6CMBBEr0L6bQnd2IJ+eQ9DSEMX2QgUu9qIh
 LtbOYA/k7xJ5s0qGAMhi3O2ioCRmPyUAA6ZaHs73VCSSyygAKMUaIkDfWyD8d444nmwi1RQadu
 5wsARRdrNATt6785rnbgnfvqw7BdR/dp/tqikkmVltXHdqbRgLp45f7zs0PpxzFOIetu2L9rl4
 Ru5AAAA
X-Change-ID: 20261125-eliza_evk_display-1285afd0624e
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org,
        Vishnu Saini <vishnu.saini@oss.qualcomm.com>,
        venkata.valluru@oss.qualcomm.com,
        Jessica Zhang <jesszhan0024@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795756988; l=1478;
 i=vishnu.saini@oss.qualcomm.com; s=20251113; h=from:subject:message-id;
 bh=jOB9ZaPxV2ojh2yhuVh2IcgiDE59d5e+lxYsxG09L/E=;
 b=4LOLxl0vTdCdDcjNUzPZ6hF225Qv6qmwXN8izFm7tMvFRvnudXnNo08C/zXwOU0CSxF3jgnTT
 zv3djEtBoxVDK7PuhMGdIswqO8Np9FiqrzwGdgWrPAOpP49UbbkJr+k
X-Developer-Key: i=vishnu.saini@oss.qualcomm.com; a=ed25519;
 pk=8hlXlF8j/3GeOaDK3w2LYhkv9FanCQru0c7kRH/It7k=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDAyMSBTYWx0ZWRfX1zo/8ZzKTXuE
 toyNTmA3zPMXFczGKBYn2NyE3LrJOoEFPuQKQrUH5NxEYXD6Ch01iiy2VZzWmHVpaE76J/rGnQG
 1YR2NRdga/eDw1IO+Dkmsd3xO1Tc5Ww=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDAyMSBTYWx0ZWRfXyXR591rXKJQ5
 8A1KlmwQhsmoF5x/enDJQ2bl9pX42pJ87yC8zqbhH1hqO+NPfCRVJgflmmb9UWOkIH3pLlCWGo9
 5Q/FrtPx1FWRB/mmEInCSBN5cxvB7y0MksUWYASSLJE/9K2x4xc3adpdmTMLysGAIQ+7MQDeqxl
 xX3gYpktn8en92pRCZ0yD+scCZGQn+iJ5qQnIRs0aVWlOkOUBAMd0C66FZYwGvc0WtDDy2MMVCQ
 kYnxI5m9Q35vmQ1zqRWSoVeRWnC3gguffS5D/63YPoklZ/pH1P236zEs6zAXmNvDlVFhCGoH6p4
 dl3WcBleTw/nb/TmZyf5+DfDybczqE0RRLTGqQ+lCm8BeZd0O7ZtxG1ZdJ8WiMkwjiu6vin95H/
 l5nat6la0B6LE6WkX/OI9LZTSsuCyYcDqrLUgonXThaHiMvespoZKqYsfGh+8SshJsfcnyKypOI
 XoETaJDsAebcsohGnVw==
X-Proofpoint-ORIG-GUID: NTXCu6bAHREcXKn43UrHLQoFRCsOF3iS
X-Authority-Analysis: v=2.4 cv=Z795j3RA c=1 sm=1 tr=0 ts=6b0913c2 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Gqg12Ns95l8UnY95JVAA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: NTXCu6bAHREcXKn43UrHLQoFRCsOF3iS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_05,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 malwarescore=0 clxscore=1015 priorityscore=1501
 adultscore=0 spamscore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270021

Qualcomm Eliza EVK routes DisplayPort 0 to its USB Type-C connector
through pmic_glink. The board also uses an onsemi FSUSB43L10X
GPIO-controlled SBU mux to route the DP AUX pair according to the cable
orientation.

Add optional vcc regulator handling to the gpio-sbu-mux driver so boards
that provide a vcc-supply can power the SBU mux during probe, while
keeping existing boards without such a supply working as before. Then
enable MDSS and DP0 on Qualcomm Eliza EVK and describe the SBU mux path
needed for DisplayPort alt mode.

Tested with a DisplayPort sink on the Type-C port in both cable
orientations.

Signed-off-by: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
---
Changes in v2:
- Add gpio-sbu-mux support for an optional vcc regulator.
- making it 2 patch series for driver vcc support and Eliza EVK DT enablement for DP over Type-C.
- Link to v1: https://lore.kernel.org/r/20261125-eliza_evk_display-v1-1-78a56df97a26@oss.qualcomm.com

---
Vishnu Saini (2):
      arm64: dts: qcom: eliza-evk: Enable DisplayPort over USB Type-C
      usb: typec: mux: gpio-sbu: Enable optional vcc supply

 arch/arm64/boot/dts/qcom/eliza-evk.dtsi | 49 +++++++++++++++++++++++++++++++++
 drivers/usb/typec/mux/gpio-sbu-mux.c    |  6 ++++
 2 files changed, 55 insertions(+)
---
base-commit: 3191063649dbf7c0d0b768e1f3655e4c5fc6edb5
change-id: 20261125-eliza_evk_display-1285afd0624e

Best regards,
-- 
Vishnu Saini <vishnu.saini@oss.qualcomm.com>

