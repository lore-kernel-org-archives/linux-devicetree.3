Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795594883;
	b=iP2tFkmvwuaSwBjuX4YhBEDln93GiYUB7fSv6G2STlmD5OH8DrvSGDpAWWmVNGtUWT6O
	 Pfph+FxkW8arjBF9adlzjE0XPgVPmrvvmSpY1pw34fJSKxQoc8eoA38D5Ea1PYW2OjD+h
	 94cUif21GQKzKFWsDwgxEcHwFSftKH7LQjq3Vzw0yUoSltbRH3L58fq4xBAtm8/OQWUSa
	 CBY5IzmNKN0p5qLUezPmVEng1dwulslG4pSDNnrZhP1D3jofCsQYayHJ4sX3JvslQf6Nb
	 CkupPr5D6LYX5MpiFJqdRjIOFsoQyPrKnpcbFe1UAox04lMOSgRFVWd8uKnrt9LvP5A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795594883;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=DButlC9vfhwyiV/934aVxvWQylOVzcpu0HSHmaAFCVY=;
	b=a5Gw03byErlkoBWND9FT41ezBJdU8F9pkDY47kutfq37f9QxSVo5IfoKppezMRG1wxsa
	 La5EKoKx5Xv4vLeoEF4J5Mwr4/4Ku19S4AkMRoVPaWB3XGNP83l/fUdh8cyWN/9cVYV4A
	 yWfgdq1DUH8+TTYSUxpEDTiMGhKh0CYVdAAVKrk3prjMobJyRdC2F7wyagtBicr5UQVtE
	 UXzvk53zmqHw4PuRl/EbukUqZgWopBGtxDErTctWxqvZ7val32rxL2yCXsCTD0f+gQEea
	 qOLwjaVJPrwhA7dmWRA09/qrXHCOaAWCe81SEgM9UylbB+LF+JUpaKBHlQRYQII29zw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZQ6V7ofP;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=aWdcVufG;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FE74606A321
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 08:21:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1FE74606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZQ6V7ofP;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=aWdcVufG
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP68aC03142822
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 08:21:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=DButlC9vfhw
	yiV/934aVxvWQylOVzcpu0HSHmaAFCVY=; b=ZQ6V7ofPyXdvtRrBlR1dAKsM+B/
	pxuHJNTG1OaerYNKUmszsZPdRiXanp8MRsaZRcQkEl0nqip/Wu7NM0OThFtUhZwY
	HVP1f8JsC3heiP7gGYBEWr5v+a+h8nfZ2pBjKi1m1JnI5+8xDjeO1XihOcWsIpSO
	CO5agmh3zf8aeF+JUGzpVvD05kDvJ81gbOpbty+bwrR6axQSDM6sq2+Pqh9yFP2B
	vSS+kFLhK8E4YRvHWyTWhXLn6yzsdfrvbgvyza3vrl6Gqwh/uKKjd9dxDDJlNRnX
	GmnnLRIhDWVTZp/nZghTWbYwkJoUUeptI3uJTzS2mTQq0zQiRHq4hFXwwIA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5mc29qn0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 08:21:22 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2ed08904845so73752275ad.3
        for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 00:21:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795594881; x=1796199681; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DButlC9vfhwyiV/934aVxvWQylOVzcpu0HSHmaAFCVY=;
        b=aWdcVufGrIq+6e6UthEfQ5GplQyXuM/jmldE4n1fkzImQhF0bF2QQzRltXBhpaPrhj
         9k4LsXwt9L09DH5SRySvM7XWPLvnbknfYSJ6fNpTnk0AzuzEzDDjt9Iw7BoFASSwsUEf
         NxY3v/exr9qULnbZNCeVSoMMoQ1xNN1IgluKbt3ScmOd9UoXlf2eC3nuCEBaDfdthK5S
         w5KRZuEi67b63HztpqBSKW45c5rgWQJOmfXn6pZ8+tu0GKvQ3P9AT5PzNUde4x5jeUGS
         6qUsNwC/DbT5O0uzQtYq9uJfBZCITXeZTVNPa47e7pqNSC8NPFjb2QZHba+UvoZnNGnL
         IA0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795594881; x=1796199681;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DButlC9vfhwyiV/934aVxvWQylOVzcpu0HSHmaAFCVY=;
        b=ojUSNqD33zjwHc1PYGeGL2J6btyVAthPqg6/utZCPsJPKceDJzEn1YRN8/IVxqZU5K
         YzQ0jf2zEzvon2PfQDxy1UTm4boUSOfgvnwkF8nxMYZBhZJJCfuJHFJ0dUzgQp3oiik4
         Yd3wZEydKjHagohdqp2ytgA7yg/w0D5KPz4lkD0YLcqkHyYFJPCEKFxmvXt50dQg9Tqn
         rp0koczcec6FjwnrQAmgR0awYc1BNqnaPSd5p8sgQ0eYA3IVvTTy+8DL3bwI1cLAm5A0
         i5ClQ8UBD6jHhAZGx4LQ6FwMMCjHmMQZ8vTtprqIeycRs6ZmlKJ644M7/6deQ3U+bU3b
         WdTw==
X-Forwarded-Encrypted: i=1; AL+hErGlHoQKvdDpNs1G6oe6PouCrKo6F5+LI9PhSkn0VRxOhVFy859RNvWoIvrNqGyLtHZdxEUnD6oQIzNz@vger.kernel.org
X-Gm-Message-State: APuU4Z+Zuxm2QMbkK09LEkEAVekLmHCGgxYa2EM20qjPv6XGRFxEq0GP
	6cNM9dw2Ay1LXHE25/qzcT8xLkPorfbWOhG9i2aaPs3/njWoTWVwhWNbQdrOINYLMC10B96RhMl
	1s9uj2tOzQ2Pcj5Zq6NrJ+sJ8AnGlQ3qxUYUFx85gdjFFkbIXyzg4jYivX2lN/OVX
X-Gm-Gg: AZFdTZczACSavRaojQ+1WVxsB6xr9sTdBu695qzr6AoNx/Udcnnepi8FoZplKAyNRuE
	Ds2494H1N8R4VbNzyMAAj4JpfIyaF6vbRQf8ibwKr4v3bJZQats9pEEIgB00N2oPybMSUHAS9mx
	41XzdSibnOWa/4QrIXgqCrdr634iXy/yJ77Z4guqsnr6BVyS8M6n1OBwcNcKebfvLSxqvQW2wOR
	LSddLo+CXp/BMoT3rUN2cd8Ro1hG7lAE1xzmpnK1bhFxbFAq+bs8i3QMa1kswa8r7WbCBfuX2x2
	y8u8NjPxJt3NVsIUJ4W8FLD55Jan8Qpuq8bZlEUBYwlNVQepQIWI4TbNLenHr6WxMEiONixUL+m
	wTWo6ynvDwr9tbk0zrjCW1n8oGJ79lBugVgbl9HL2n/NWSiWshIEPl9XJMtz2O5HJJjWlqiUJsk
	q8K9fqa5It
X-Received: by 2002:a17:903:2acb:b0:2f0:a7c2:7d7c with SMTP id d9443c01a7336-2f0a7c27e29mr78192555ad.35.1795594880925;
        Wed, 25 Nov 2026 00:21:20 -0800 (PST)
X-Received: by 2002:a17:903:2acb:b0:2f0:a7c2:7d7c with SMTP id d9443c01a7336-2f0a7c27e29mr78192225ad.35.1795594880465;
        Wed, 25 Nov 2026 00:21:20 -0800 (PST)
Received: from hu-mchunara-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f0457fd68dsm73135825ad.39.2026.11.25.00.21.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 00:21:20 -0800 (PST)
From: Monish Chunara <monish.chunara@oss.qualcomm.com>
To: andersson@kernel.org, dmitry.baryshkov@oss.qualcomm.com,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, mani@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, sarthak.garg@oss.qualcomm.com,
        pradeep.pragallapati@oss.qualcomm.com, nitin.rawat@oss.qualcomm.com,
        shiraz.hashim@oss.qualcomm.com, monish.chunara@oss.qualcomm.com
Subject: [PATCH V2 2/3] arm64: dts: qcom: lemans: Add CQE register region for SDHC
Date: Wed, 25 Nov 2026 13:50:54 +0530
Message-Id: <20261125082055.488583-3-monish.chunara@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261125082055.488583-1-monish.chunara@oss.qualcomm.com>
References: <20261125082055.488583-1-monish.chunara@oss.qualcomm.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=aPJlOr9m c=1 sm=1 tr=0 ts=6b069a82 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=cLkUB6twTbeO1ZdPm1UA:9 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: s2KmJN5i5tVqWIW9dp27lF8WI9BOsqCW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDAzMyBTYWx0ZWRfXwd5uN2OPYM43
 5qOqXuonU5REXfvZFwUakdRXSd8YQhyQyv+inmU6FVLJ8pzolrCKGZeC5h1riBrDIEaXeh20GBQ
 6Sa7Lc8d/LdQmdQjHVqZ395nkVSOwEH/pCIHXfjiE8iUqM3N1p2lTblPoqMZgPt6fqaIigfFhyH
 gImK7vWLzA93nTOuMflDPGCth6euBkpTyuf++ZNblXWF3KZ42JZH6GSrYLYyLYHzT7Y3m2rXwKU
 gha98xzBMpQZeFKVRPHAODyXQ08DeZgc6m8JPLSaNU69sz9mmt+bP4NpD5ORNT32aUKPbtc9yr4
 icIoi6rOXJzs9AQGFrv5cdkXb2dnP42DfD+Ht7SWmKb8+447nMFrdI4SFiftH7/zdUPubwoi70A
 Vs7wm4+Xd2mE0dablv7OKAVIm/ayOI9daMPu+L7yJbLf2coP6jPojkITS1EjPgGfSSSv1zWFBlA
 wM7+o3Z/sJNlazBVZaQ==
X-Proofpoint-ORIG-GUID: s2KmJN5i5tVqWIW9dp27lF8WI9BOsqCW
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDAzMyBTYWx0ZWRfX3Erw51AXUYEw
 JZwQjXringA4J9ACEQwgrutcLE5XT9nhfYVw/qywCg6TAA0nGK8va+VznHct6Pr9m+wF1OlvPXE
 ZW5U9e0ry49zNwmAz5nvhQ1p/V3QDT8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_02,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 phishscore=0 lowpriorityscore=0
 adultscore=0 spamscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611250033

The SDHC controller on Lemans has a Command Queue Engine (CQE) whose
registers sit in a separate region after the host controller registers.
Describe this region in the sdhc node, along with matching reg-names, so
the sdhci-msm driver can map it and enable command queuing support for
eMMC.

The controller also needs the XO clock as a reference for its internal
logic. Add RPMH_CXO_CLK as the "xo" clock for this purpose.

Signed-off-by: Monish Chunara <monish.chunara@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans-embedded.dtsi | 6 ++++--
 arch/arm64/boot/dts/qcom/lemans.dtsi          | 4 +++-
 2 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/lemans-embedded.dtsi b/arch/arm64/boot/dts/qcom/lemans-embedded.dtsi
index 0be39bb9de1e..2ae492455fae 100644
--- a/arch/arm64/boot/dts/qcom/lemans-embedded.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans-embedded.dtsi
@@ -1636,9 +1636,11 @@ &remoteproc_gpdsp1 {
 
 &sdhc {
 	clocks = <&gcc GCC_SDCC1_AHB_CLK>,
-		 <&gcc GCC_SDCC1_APPS_CLK>;
+		 <&gcc GCC_SDCC1_APPS_CLK>,
+		 <&rpmhcc RPMH_CXO_CLK>;
 	clock-names = "iface",
-		      "core";
+		      "core",
+		      "xo";
 
 	interconnects = <&aggre1_noc MASTER_SDC QCOM_ICC_TAG_ALWAYS
 			 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/qcom/lemans.dtsi
index e298747c06bc..2946853354f8 100644
--- a/arch/arm64/boot/dts/qcom/lemans.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
@@ -2937,7 +2937,9 @@ apss_tpdm2_out: endpoint {
 
 		sdhc: mmc@87c4000 {
 			compatible = "qcom,sa8775p-sdhci", "qcom,sdhci-msm-v5";
-			reg = <0x0 0x087c4000 0x0 0x1000>;
+			reg = <0x0 0x087c4000 0x0 0x1000>,
+			      <0x0 0x087c5000 0x0 0x1000>;
+			reg-names = "hc", "cqhci";
 
 			interrupts = <GIC_SPI 383 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 521 IRQ_TYPE_LEVEL_HIGH>;
-- 
2.34.1

