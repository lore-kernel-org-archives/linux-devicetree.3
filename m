Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794972847;
	b=0DhhkDWYHFLuz3nkbOmi/m0zFe7DeaKX2Rr02+1FojyNmjVokMGmFue1/s4hcz1cWqFO
	 lf2PPSMpFTa66CrqO9A61ZyuCItWPtUdP6u+TK6reLNaMbkw5/vJnAo49KXGxW9UXGzLr
	 GMtd3zKS768sxisa0tgQZO62DOWPFwj1jyoejeYVdz0Ds1g2ek9sNQSWcj8FsuXPflOM7
	 Pb77ttj9XpvFzDKO3whmD8Lj2O2Y6YRES1qBT/WqivfzjafD3DiF9ffF+8b4mCwWXaQR2
	 maY0oJL5YQIWq2TDm6DgPsmmydztXt7yGp4nP4OLqX3DMRRZwSmNB9Bo7c0yM/hexkg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794972847;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=be+nfB5khQE6/SF/DDupLZk9C5kHEWpvXOGk/ycQcC8=;
	b=hM6ZekGZtpDETurWJPlCFvcXtcmkWTaG/OPgiHGHNt4QbGTS+OkPJUHPRumXUl9iFVGq
	 ndHrmwVxNFALRoXboVTujEG4Ou8yT2p2VJqV9S/LMDUjWJZcQZWeQ1XH3Ovb7O9BiDAVM
	 FR/yBc4tO7LLVkxEviWSt30pp7KrOeMbiVwv9el1FUG7YeWlziQi7TrIJsv9G5IaRgR5p
	 Xpc9Kap1hvlY17HBfr4rS5fQqf6gnmwplZecjJYPjwlROfj/e4DwDLZB4MgiyeD3kemuU
	 xM639OHjB7iqxe2Y+RXV4m+/s3I3DuUIK87SdmGb+nMJj5hucu+4SM07Ky0GNenq/bA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DqQkyOmY;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bVEsRgv1;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8092A606A31C
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 03:34:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8092A606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DqQkyOmY;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bVEsRgv1
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI2UuGg472513
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 03:34:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=be+nfB5khQE6/SF/DDupLZ
	k9C5kHEWpvXOGk/ycQcC8=; b=DqQkyOmYM/06TucRwGs9OSTVa9rkZh72T0nw/O
	ScbWotpqhba8Sd/k98VmzBQ/Wy9Mw2NyWW3V7eeCUNcLDTvPPJJu8M4Xa7stYnPw
	qeJxJz0ADOFPPAUkO0XOXsLoffIVJCwcscTpMhDOobV0YQ7lEX6SRb9b9rrB1qLA
	d7gV2uaE1nF9Hw673ynjK2VnjxOiQKLJGITgtfoBS6Fx16BlmcmjlaHoF7zdRt5L
	2G9XrbSzKGe+11hWFT+iS9VJf+UOU9CSTZbMqFXrM2Pn1uIVD/RcsD115QWPQr6J
	t8tH+9pDsl6SoL+9P5LOyyRGlRe34MDS+NQHG+p1Lmlrt3tQ==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yv88yc3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 03:34:05 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8a065d0e9deso376623b3a.0
        for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 19:34:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794972844; x=1795577644; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=be+nfB5khQE6/SF/DDupLZk9C5kHEWpvXOGk/ycQcC8=;
        b=bVEsRgv1PMPytjc+pj97UPs5L5gjtPKyeqz4Ed+kqhgazcO9fxcioe5yR7NFz7UxQu
         +nnHinR1cWAyzCOGNKZLvX6TN/rxx7DrMahF2EUDvgaOmFd716fMxG/vT0BU22Ijnzcb
         Gt/BNEvREM+LFrd9a/kWwa/k7yl1gxntFCqAD+GL8uf/l57GPykmSZ2iTwLRtv0tFrMb
         +pTtmCicrl4H5eeYAdXbgn/8LMJzxBBMzIpuMLkP9dPd3xPAkc9YzUVyifPxkT9ljyKH
         /mqqFutk8hPXWIfCWDKNR2wLI9FIMFawqoFDy9AyKBUkarBt5UvjYaoe8UR+jkMNMWjJ
         35lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794972844; x=1795577644;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=be+nfB5khQE6/SF/DDupLZk9C5kHEWpvXOGk/ycQcC8=;
        b=A+XC0SIORe6KFujApJpIO88JENcsd0jPzLH9KBmECNKUpCoqohgFZ59McdSPuur8Fg
         typL06ZAqkNRYHFu/ahiivGdbIc1zTTF3o2Mnk4J7tdDtLfxNRN/Rwcsqk2bEnrZT5Nx
         UcULkG+ih/ksN67NR5tV9j7DGK40eEvHHOk+Z3vE6sEzCm1o+BA5yT4ong1NINnZyv+v
         N8i36RCKCNsdLnYWMa3QnZJvEh0aFOrgfEyL7lTec0W7O/cDYqu5r6BYXdhV7frpB5ZU
         H0LRi/QeeFedpKdj81idLtxKrN+jW57c1TeZrocr5qXDW+WQ6p7nvJYocn6Nr0kJtDHi
         OpXg==
X-Forwarded-Encrypted: i=1; AL+hErHIgjNYs1meKeV5jxTzMoK+RpTEqSSkJrdLHIvVNTBkH2GYIQLCAUVURPHH6qmFyWNF6QZLM5erT6DN@vger.kernel.org
X-Gm-Message-State: APuU4Z92byLzi/Feb2cNOg83BNFn3LltGmyx1jMsD1vhXB2PB6aZ0bM/
	fLM+h/R0hSmP7SfMsJml/1iUEG8UdVOPTwGYOGjoXQ+HWDbN9UK//SvGIf8QTDQ5V5EY8uMMjW7
	dQA31L1WnTqrKzhvb+e9WPXjbLpmKwToZjdxNbvfeWzuQ54K9OOi25x0veuiRMD7p
X-Gm-Gg: AYBFou31Gm72m/CxHpEuHNNxNtRA/Z4oVFryNe3H16SWmFMjNfPK0R01/n/Tpx0CfDA
	35QF0Wic/qSE3MTk0piISpTkC4RaBfVPi6pUDB/ontTgDOnvtjuXyuEx66MJkBPSMdP9X6tXDP7
	tG2kZLZ7UnTSHLlw4WnqLMueKjOmyC4FmClszFUMM23L1jnxGfok+1sOtAMMAsSxiwvT+vXjDkD
	kBg5RS5gg0vWKhWXkZrYW4FLzy477WU2iSAonFkGE3DD9pzbHBQa5WS3oTR0MvAQS0RkS48la4L
	Sqe7O/YnihuLqC21+wFA+goxdATqML9Viqp8/AYXp+xFfFmFR6yNpMkkY6n0XuBlq3NX6V9/EIQ
	axcOFLGnb4f9AoyImkMdcemOKg/QIHbzeAdMvLCGtkoG74SrPKG/dj5CAaJIJZ8MlQCiCiSyZ3a
	AXa0I3UWdswc6tS0aVrNuE3neh1Tize4x5vrv5uD5Jbg==
X-Received: by 2002:a05:6a00:ac89:b0:8b5:fbd0:cb49 with SMTP id d2e1a72fcca58-8c4566c8716mr3247354b3a.21.1794972844030;
        Tue, 17 Nov 2026 19:34:04 -0800 (PST)
X-Received: by 2002:a05:6a00:ac89:b0:8b5:fbd0:cb49 with SMTP id d2e1a72fcca58-8c4566c8716mr3247339b3a.21.1794972843553;
        Tue, 17 Nov 2026 19:34:03 -0800 (PST)
Received: from yijiyang-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c5c5327088sm431644b3a.0.2026.11.17.19.34.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 19:34:03 -0800 (PST)
From: Yijie Yang <yijie.yang@oss.qualcomm.com>
Subject: [PATCH 0/2] arm64: dts: qcom: Enable WCN7850 on Maili MTP
Date: Wed, 18 Nov 2026 11:33:12 +0800
Message-Id: <20261118-wlan-bt-v1-0-18bb1b059a17@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIAHkc/WoC/zWO0Q6CMAxFf4Xs2SWwQUF/xfDQjU5mZOg2lITw7
 w7Qx9Pent6FBfKWArtkC/P0tsGOLkFxypju0d2I2y4xE7mAIheSfx7ouIq8EgYJlJaNQZbST0/
 Gzrvp2h4cJnUnHbfzLaEwEFcene630V+Ugp5egTuaI9/fFEX9M6bFlCrFQ3sY9DgMNl6yWhtl6
 rMG0CCpyWvCshKoTF6VQGCgg0ZKBNau6xdux2Kw5wAAAA==
X-Change-ID: 20261023-wlan-bt-52fae6bc38fa
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Yijie Yang <yijie.yang@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-d5d98
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794972840; l=724;
 i=yijie.yang@oss.qualcomm.com; s=20240408; h=from:subject:message-id;
 bh=R9AtMwTL9Vvm5vUIfktqvmwQq6sgOwn2uhqAMW302Fg=;
 b=hpLO0dh2Dpl1vjcjXW3xry0vWqRKE048m5ZUSJ0mVkcmQM/iGitLq4uBN3zCo/KtDlzrCYq3m
 AEhlJ+rx6A6CuQBMqQUrGL9/i2sHJsfDOHKeJhNZIyXiB929X75GXN1
X-Developer-Key: i=yijie.yang@oss.qualcomm.com; a=ed25519;
 pk=XvMv0rxjrXLYFdBXoFjTdOdAwDT5SPbQ5uAKGESDihk=
X-Proofpoint-ORIG-GUID: LqpZMvtJXzXBx7CaFyEJQmIo8dB1K2sd
X-Authority-Analysis: v=2.4 cv=N9u8hG9B c=1 sm=1 tr=0 ts=6afd1cad cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=hXh6KkJ9KS8hL0CtB4cA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAxMyBTYWx0ZWRfX3hNSr1VhmXro
 9uiOyUYJmh1CIT1GLBYsW8ijR+kaN6RSVoEuI2cDH/Exk3qOSjI8+UMDe+SkP4h0xzi/NGU0yjh
 ssl2ADTfCtc+aOMsQn/F79N9th10v4ULvLCf7yRdf7o8IFJQ071xDZB29d9QxqeMdnFd5hewPiZ
 pFFWdzhRcylgnfYAJwhl/+SpKqunbxgO/+QeKm1bvLgItXwJnmlVja3dEQYNdi1V2TawRa1s9P0
 js41Srz2FlkdV2MSNMgzaH3TMDDvpen5s+OAJmfxeWAifaQDWPfeT8ZtzZECrzjoBWXkGn6ltb4
 DKmDyz6QPVwYyDoSud/yeC8t8YxuXuCUdc3SpuSe5y8mEm44h6VKAkxorBxQIViIAtXe0Gx5daO
 SqASDnDI5TYbbypFUYtp7HIXe/FWLPqjljOQsHnOAv4W0nRST9zEuuqQ0BeeLFnYVh7yX7VpTIq
 LMpexLgE8sqvaCmWvSQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAxMyBTYWx0ZWRfXz6obtqAFNGJl
 DiWLfwJgT2mwAzAslZgNryggq8T8cEwevm81Xyfe5DWh6rYHOY3Bdw2kDuR3ZxepcgrjOze4aos
 nQLffDqgFwqP2rbN7rpR93R8BqLbulY=
X-Proofpoint-GUID: LqpZMvtJXzXBx7CaFyEJQmIo8dB1K2sd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 suspectscore=0 clxscore=1015 impostorscore=0
 priorityscore=1501 malwarescore=0 lowpriorityscore=0 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180013

Enable WLAN and Bluetooth support for the WCN7850 on the Maili MTP
reworked with the Hamilton module.

Patch 1 describes the shared PMU and PCIe WLAN function. Patch 2 adds
the Bluetooth enable resources and UART connection.

Signed-off-by: Yijie Yang <yijie.yang@oss.qualcomm.com>
---
Yijie Yang (2):
      arm64: dts: qcom: maili-mtp: Add WCN7850 WLAN support
      arm64: dts: qcom: maili-mtp: Add WCN7850 Bluetooth support

 arch/arm64/boot/dts/qcom/maili-mtp.dts | 121 +++++++++++++++++++++++++++++++++
 1 file changed, 121 insertions(+)
---
base-commit: 7cfbf79c66c63e807ea452abf0546e6f6d6833a6
change-id: 20261023-wlan-bt-52fae6bc38fa

Best regards,
--  
Yijie Yang <yijie.yang@oss.qualcomm.com>

