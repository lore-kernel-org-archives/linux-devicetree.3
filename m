Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792592532;
	b=oSoOqiJi+yhjHkCTNSmbY76ggXquiL6zZ8Kce8/VxJ2mAxwY9ZDYoNnMq2fkNTtDiRr9
	 DaoNP0Sm21L0yUX+LiGeuX2kCnT268638xZIBDmpb7bVWLVkST37xV0j/tpdfkiqoSNBJ
	 1gYOc5k9zrAciOwmKNm1+SvWIhF0pLncvkbWvOw3tF9vGuJhpRwU6BsOj3ciVoscf3chH
	 lTNO2IPw+zNISaA1FyvkVHGWC7VT/no7AiwcRvNmdtRTIk+4EXBgsKzVjh0lwBv8EYOLV
	 /T300bAAQfGoNm4FXYnt2c3wDbq7kySjgViD/8wjwHHv9bWKjWEkUIXAoWhsnbQwv0g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792592532;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=uY7GWI5QIyzAWEBLfUN/IGVontugXjIcJCsl6jocYRY=;
	b=Wx1CGiMv3wndUjUHvRD/l80FfgfWxR+JkpR84Alu02QyD7PMdGtKGwZWwxTaAOPCM5OF
	 l6g7ZfC45tWQWqzdtEwP7ajkK4ZBTEofoyVcmsMwIlaC+V9umXmctI1/De58yjZ6KfHmS
	 UK90qe/nCm65Mx87I3W6DZRfCaY4WrInl3ACBncsa0tpvrqinp7OsNXM+JawtTSt7tBk/
	 8AyUSlb2bNCDg0rFV31CbMSyxHysasGzMzczY711MlmWhrWH+Yd0c3BPGiCc9QMvlH/tW
	 CPSLfbi6SZc4NZsqySRM+TRSavlYRKcw1PWYC6X4p0Sw6GxEXS50Pu0d6VN+8h2sBxA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="XVMDFT/t";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="JAfV/fLJ";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7790B606A321
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 14:22:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7790B606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XVMDFT/t;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JAfV/fLJ
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LEFFA01314215
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 14:22:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=uY7GWI5QIyzAWEBLfUN/IG
	VontugXjIcJCsl6jocYRY=; b=XVMDFT/tYvv2HSMzR+bLrJ0MWGWXNX8HlXIHHR
	09uruKxVqT+rIUDIKTngbOpYo83A8597ICwJgAFSXaXWFf3j7ubPe+uymlGR+6L8
	7DpWZZR+6H+4kJOSvXX1yjSfGywWqTmyhdwGw6rrpTLKAHoI4TZHgEi0YMr9+Psq
	6FIfGsfPlAxLm2oCSLDb3bxDdmC8RlCozcmN96UEdoJrzpY7YnZggF8iXTgyQiwg
	eJctNKjAKBvzINShEQ6ZsdVCXaxl8CBNEVYbZ23+e7aquqDxK4EcgSIiJIOamXSH
	3a9guUe5jlN+jChNns3M3Btk160ZeIXRv9Dl0d+hYZ4ZmXPw==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hegs03jv2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 14:22:10 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-34e650cff93so100347eec.2
        for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 07:22:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792592528; x=1793197328; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=uY7GWI5QIyzAWEBLfUN/IGVontugXjIcJCsl6jocYRY=;
        b=JAfV/fLJW1uLInsfT0pZSrwg4shDp7/kVnMc0XzRIb440kRsPNR1jpQH4NXHi+c44w
         y9AuwupF+1tjXhjw9JHqs96oAqSYfn2jyzhQsFtJgn7twqu26MfXKoIkw1GP5sPCcWi1
         RQGq/Jy5oHrlKN5qzHJCQ/vxI0L1JFDmpKaLFZZz/E8l7EhaXGXFtiK3/TIJ7sgep++U
         jXSlMBGm2dX/ADThGudzn9/wxq1NbK411AdXlGZkpILNXQ85quBpZIZib8cKmGVNB3se
         OEqhdz9iF6VYTpBkdZbfssUvbX0eJF+FTHa+nF+CT3igx2lXdLw2n2Mm1dC81CTDaRv2
         gIsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792592528; x=1793197328;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=uY7GWI5QIyzAWEBLfUN/IGVontugXjIcJCsl6jocYRY=;
        b=nACMUj5UyUxBLMOLzG3FWRkO4MX7TUKTcF5KV0QVuuK3H31D6ebFTGyF9g6n5Fqyyx
         Xh+b+bSN8jlQNa3yQP62+9auVF4JPgQVLT4T8FRm8C45hXq8dBuMjU7SqfOQ7ERjvUiR
         VJ10CROCU7soDFQtjQXiinmyz7ddYgjw0NX1qQFEx/Mb1j7Xv5FEVevMYbVy1QnMpRdj
         WZOWZC0h9kDFpwwUEieJp1uMcVRoD+Cgafy4x+S/7WIz+fyzYtXq0J4k96GHliam4wdK
         /bLMATUrgCKnLeKJwQHiy8cs79EODUsJ3iVLHDs8nU+TY6tD8AQd/+5IktAmsfYgTZXm
         FGDA==
X-Forwarded-Encrypted: i=1; AKwUvByTxnOSncsD25Nh0kMKP0Ns9i/vEcMAgtXWuFFPVdKE1t8L9Ikn1yhcGMUVJAkUy1E8oJ4ZLjqdRw5Z@vger.kernel.org
X-Gm-Message-State: AFq9FYK3v2lU6bwUVvxjzpxuPHTu1m8jVNs5k6n/p3U5BdQHbGndHqSW
	ENDV1n5Q4LO8S9bueqfQlIsJJEOfxpqZnJ1C2dd3q6whbsHEHpQR3N534ev1BTrgGKADeA2nJp3
	vGpYYhp3PhIqTiToNcsUEr0Y4iXLeIa+DezOcq/NSh8QN/eks2tnzSMXOzVcaelUM
X-Gm-Gg: AYBFou201l7LhF4mnL3OY7HqcOq8b0mA6t15Iq0fuSajguiDy4Z++CX82+aYr8zcqo1
	+vhFDLksO6NDjGGXgaFW7SPbrw61AUkQ4aQnropUgKU1is9ZA+fRDt0qsns2W8nN9ogENSwEkdp
	VnuihZmTAE+5k4+4Lt1p2zEQw0rqSUCERCIRnC8yVsk7Ibt1xJSa4Zx2aZVMQKZV8WC0Vll6Bn1
	7FuhHXUoSuoqHkM9v9v/7f3q2S0Yx58G+Rk/3ZS/97BYEObIQVwq1cxqqTTxcN3gx6rJOV4qBW5
	u83E1KLzD0KjB3MDyGGLGw8V89p/XLUgzJBZktwDwDbui2KDI8/TC2irHFHwTHEFop2o/1LDcDx
	T0JMtdl31rLV/J5eTc7ukxBsPXH2dgeBvnzbUpCvDdohzrHhMV169B/BZrMAKtBW3kd1mtHNdFH
	gfVtpknFH7HaRQDghr/Pmk+nyXfXmb/s7eBmQc/RXcbgXVbkBMrOk=
X-Received: by 2002:a05:693c:638d:10b0:35f:8c5d:5938 with SMTP id 5a478bee46e88-3674bd455c5mr5364075eec.1.1792592522826;
        Wed, 21 Oct 2026 07:22:02 -0700 (PDT)
X-Received: by 2002:a05:693c:638d:10b0:35f:8c5d:5938 with SMTP id 5a478bee46e88-3674bd455c5mr5363948eec.1.1792592521142;
        Wed, 21 Oct 2026 07:22:01 -0700 (PDT)
Received: from hu-vishsain-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36740cc88b5sm8074818eec.10.2026.10.21.07.21.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 07:22:00 -0700 (PDT)
From: vishnu.saini@oss.qualcomm.com
Subject: [PATCH 0/7] arm64: dts: qcom: shikra: Add display overlays for EVK
 boards
Date: Wed, 21 Oct 2026 19:51:43 +0530
Message-Id: <20261021-shikra_display_overlays-v1-0-adaea735999f@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIAHnK2GoC/43PTW7DIBAF4KtYrEs0gPmxFVW9RxVFgIcGxY4Tc
 NxWUe5eHLe7LLoBPSS+eXMjGVPETNrqRhLOMcfxVAJ7qYg/2NMH0tiVTDhwxYA1NB/iMdl9F/O
 5t9/7ccZU7kwlk96YwCQ4Qcrvc8IQvx7y+27NCS/XMmBaH4mzGakfhyFObaVqXQcLGgJ3Bphwt
 TNaFExr6YwXDhUaa/1CD5izfTRrq+1SDBoBv8VoN9G1eKazpEAN2qCksYDCvI05by5X2y9TN+V
 4fcqVPeUf9zmm4wpJBC05506B/TcEhvZToxjzdNZ0ZrpADE2QZU0eWPME2t3vP6sVWbKWAQAA
X-Change-ID: 20261019-shikra_display_overlays-515c88f150b3
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
        Jessica Zhang <jesszhan0024@gmail.com>,
        Mohit Dsor <mohit.dsor@oss.qualcomm.com>,
        Anand Tiwari <anand.tiwari@oss.qualcomm.com>,
        Shashank Maurya <shashank.maurya@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792592515; l=3439;
 i=vishnu.saini@oss.qualcomm.com; s=20251113; h=from:subject:message-id;
 bh=Y+zJhUSQ15wVjj0ICYb4OoQC+kv3UWa/33obn42FQiM=;
 b=6YaquSOSb9Af4655/GhnWH7C6gUaVnevKEJHswXkwk3wNVypVHgvy5mEOinv+7w1To1V0UrWf
 hBt33ZiFNEWDVMfJh3fGJjPuuNaaouOFXQRpQW9cmS4e3IuLDIgnoWR
X-Developer-Key: i=vishnu.saini@oss.qualcomm.com; a=ed25519;
 pk=8hlXlF8j/3GeOaDK3w2LYhkv9FanCQru0c7kRH/It7k=
X-Authority-Analysis: v=2.4 cv=S/NMU4sP c=1 sm=1 tr=0 ts=6ad8ca92 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=1DmlGK3jZovgR-jo5ScA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA1NyBTYWx0ZWRfX3AuGsf7n+SYV
 74MlDy+zSvnYIFBKnxzjqwMF45+xjF977qV2Ki9XV24oxlxkhHNCyzJR2pVMtIeykKDRImUbX+4
 Us4ie0WKRsBT2LUU7j2to3xvP15zvp446epli0muLHDVOaP5rinqbVSawxdZcBsfumNRp4ihLCO
 N1Zz4C/YTlsdgiEr3H+0Q8bTQVMT2jCWnTEisxnoDXqbB8s2wW790hMM73HobV0c5JrX2jfU1th
 Lgr3fnMgmX6ToLyqedXbim1lgrho0hh8x6UOVQBOTAliF7+VeQQodraO8JvpVXQF+QImorW56fq
 jPjO2IuIy9Xlb8jLh/+DaBONhny/qKMBIu49waz4FRPbAOnD+PsMol05wlbdhH9ogO8rG6ekm5E
 uQ7xDgtoaxdAuy/muROVjsDt+Q34U5ecO8PciVUDFj6Y49qfZC1w9UUkGXtzOMR2FFlq5Mz5/LJ
 Q4uXs0Wwbr/Fg3qRvqw==
X-Proofpoint-ORIG-GUID: W7rHHNOr4v0gYMId2NlbqeenhnsSlXSd
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA1NyBTYWx0ZWRfXyhyWcUgDJbd9
 YAoN22WGiyu5flEv+IpS28NnwAEujz8/nSvKKzrojpmeMxQqoRZlOl+p6h/+feUk+SHPnvllGZ1
 PtXNKRzQQdufb7eM0VA5nQEyuGSmYvo=
X-Proofpoint-GUID: W7rHHNOr4v0gYMId2NlbqeenhnsSlXSd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-21_04,2026-10-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 priorityscore=1501 spamscore=0 bulkscore=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210057

Shikra EVK SoC cards (CQS, CQM, and IQS) are mounted on the Lyra carrier
card. The DSI0 interface from SoC card is routed to either the 22-pin DSI
connector on carrier card named as JDISP1 DSI0 or to the B2B connector
named as PDISP1 DSI0, though a MUX which can be selected by a hardware
DIP switch. There are multiple daughter cards designed that can be
connected to this PDISP1 DSI0 B2B connector.

The below B2B display interfaces are enabled by default in base DTB:
- IQS: DSI-to-HDMI using the LT9611UXD daughter card
- CQS/CMS: DLC0697 DSI panel using a DLC daughter card

This series adds DT overlays for additional display configurations:

- shikra-cqm-cqs-evk-hdmi: HDMI output for CQM/CQS with LT9611UXD
  daughter card
- shikra-iqs-evk-dlc-panel: DLC0697 DSI panel for IQS with DLC daughter
  card
- shikra-iqs-evk-lvds-auo,g133han01: AUO G133HAN01 LVDS panel for IQS
  with LVDS daughter card
- shikra-iqs-evk-raspberrypi-dsi-7inch: Raspberry Pi 7-inch DSI
  panel with touch via the 22-pin JDISP1 DSI0 connector for IQS
- shikra-iqs-evk-waveshare-dsi-8inch: Waveshare 8-inch DSI panel
  with touch via the 22-pin JDISP1 DSI0 connector for IQS

These overlays are applied on top of the corresponding base board
DTBs.

Signed-off-by: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
---
Anand Tiwari (1):
      arm64: dts: qcom: shikra-iqs-evk: Add AUO G133HAN01 LVDS panel overlay

Mohit Dsor (1):
      arm64: dts: qcom: shikra-cqm-evk, shikra-cqs-evk: Add HDMI overlay

Shashank Maurya (2):
      arm64: dts: qcom: shikra-iqs-evk: Add RPi 7-inch DSI panel overlay
      arm64: dts: qcom: shikra-iqs-evk: Add Waveshare 8-inch DSI panel overlay

Vishnu Saini (3):
      arm64: dts: qcom: shikra-iqs-evk: Add DLC0697 panel overlay
      arm64: defconfig: Enable RPi touchscreen V2 regulator and ILI9881C panel
      arm64: defconfig: Enable Waveshare DSI panel and touch GPIO drivers

 arch/arm64/boot/dts/qcom/Makefile                  |  15 +++
 .../boot/dts/qcom/shikra-cqm-cqs-evk-hdmi.dtso     |  90 +++++++++++++++
 .../boot/dts/qcom/shikra-iqs-evk-dlc-panel.dtso    |  78 +++++++++++++
 .../qcom/shikra-iqs-evk-lvds-auo,g133han01.dtso    | 127 +++++++++++++++++++++
 .../qcom/shikra-iqs-evk-raspberrypi-dsi-7inch.dtso |  91 +++++++++++++++
 .../qcom/shikra-iqs-evk-waveshare-dsi-8inch.dtso   |  77 +++++++++++++
 arch/arm64/configs/defconfig                       |   4 +
 7 files changed, 482 insertions(+)
---
base-commit: 6474fa070f2b8013b4b87350b775b8c3be6e8aac
change-id: 20261019-shikra_display_overlays-515c88f150b3
prerequisite-message-id: <20260930-shikra-dt-changes-v5-0-8eaf658a0e38@oss.qualcomm.com>
prerequisite-patch-id: 7631efa76e1fe98ae45c0f68e93ced4c523af27a
prerequisite-patch-id: 49396fb33427bd9b9214b537221a1c582d5d62ee
prerequisite-patch-id: 3cbb70da0a3009a2730813b562c29f432bd0fd8f
prerequisite-patch-id: 1c9ff594613a4cef8d605cfd37a3270866ba6414
prerequisite-message-id: <20261015-shikra-work-v5-0-5e075222b60a@oss.qualcomm.com>
prerequisite-patch-id: 326d8620d592d8f5f75fe62f88a2cb4dd8ec0b46
prerequisite-patch-id: 327308970dffdb2b218d4834e1badcc9e05cfd01
prerequisite-message-id: <20261008-lt9611c-v7-v17-0-1e8f5f2b2f19@oss.qualcomm.com>
prerequisite-patch-id: 49f1e01bb5594ce9c4301ce4b16715834ece7f41
prerequisite-patch-id: b909fe50eb311c7d8ca6778a29952e2c1a28d7ee

Best regards,
-- 
Vishnu Saini <vishnu.saini@oss.qualcomm.com>

