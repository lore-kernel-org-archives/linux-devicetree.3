Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F33D230DEBA
	for <devicetree@vger.kernel.org>; Tue, 25 Aug 2026 05:08:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787634523; cv=none; b=k1X0iibAkp+8GsfuXLHsVqFZ9OrXCMFhJCV3BEUQsCXRSwgkvk07QGl+UjM/RSoQo+3SfAJ8c9ai39LHz58+BZsMfChtldrIqVcbIiu7kmmFOU/1yqwscmgfrqLtLCmK8VLBdCNWpOUuwL49EnpdXPqv9Mm0nWakUPnYdzt4fcM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787634523; c=relaxed/simple;
	bh=bKVyWC0JA2sBKmeI8R044MZu4rQ4yvvMXpcdkh+IlrA=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=HFVoCn1yCPOfqzcjW5Eq4on4nNF7BGY8Hm1YIdqfsoCe+eVpN73Kdeui+MaOZ90BBA2sMUMjbhyweFdO8E+xLJxx9M13S/iCHYAKxsD+RV8tqp9c5lg/Uoef2pN+0jr5Oq5Pwgierwo1rJr9tLSYVf4YLemShfJe9wD5CANIG6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mXvnAnTO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JcG0Djki; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mXvnAnTO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JcG0Djki"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67P40mW2228307
	for <devicetree@vger.kernel.org>; Tue, 25 Aug 2026 05:08:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=gFx7jxzHqWJADEiBCOZtF0
	jm9jFO7g0TZHDt+OXlOEo=; b=mXvnAnTOBM9NN8TQHZDjDGgD9of0i1Nmrqk9IQ
	tzBseYJAvvTH45USJh4OtHDRdBIyQvbWBdZN+Qm5gNICXeDmqBtrM2/YDNNQmQQY
	X8Kkp568FoqdVcdZK5sSB4Pw+DHB88FcdPKDGaMZhghDe2VbohaJm3rfvGenWdVY
	Ysez58oDN2Umj6x7Iaw7UjnIRxyvCopDktmPUqz8C60+ZFZrDBppmO3oYHPj3TVu
	3yw8iG6KhWtlyhNNR7ojhVB5aQ5epv585HGToy3PyWsLMStDOBpYTskWv9R8LMRv
	1tZcRn0+bFRmYy+NkCgdkyeO7atgPlxMq1YUXz6Anv0T0L4w==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g93nar5sj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 25 Aug 2026 05:08:41 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38e11baa66eso6454732a91.2
        for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 22:08:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787634521; x=1788239321; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=gFx7jxzHqWJADEiBCOZtF0jm9jFO7g0TZHDt+OXlOEo=;
        b=JcG0Djki7t0Mei0J0xu794/5tr1h6ajJr3IiAeIyZQ1JCs6gPO5rdCrVyFvNIwJRx9
         7SPcu+Sc2TeKGuHNJufBi7ZPYm8wx7cK7d1xgwqLmWX/yR29YYF0hQD83xNRUzVG//WS
         wLzurN7eemGgEp9JxaDzt7c+EehbTebprk0ad6ra1Rgc56RMd4bMAFPrFT/hTr4ZKCb1
         6QF3gKbNkHuEg90kP8c465q2YfBWz1ZYIrUEnzn5XWQwEyrpRoFkI/brm7BLC8jYLNNg
         xjd8vUcR6XpuPK4eTdCXG4tj2ey/04uMNwL8P1pTvQ81MFi/KyUVZ7MIOepG0lI/Nj3g
         XruQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787634521; x=1788239321;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=gFx7jxzHqWJADEiBCOZtF0jm9jFO7g0TZHDt+OXlOEo=;
        b=jOkfP8iFp19oWR8oZqyF6Wa8SBz0AhRXyChejpfzl0zBUuWrNuo99tmEnJUYtBArJI
         SnO8SKgU8/yEM0uHmheL5INcWKgDC0LhhsVWMI+Pw4abDqty/TZC25gbyzTz1zkAe5SA
         Y0GMvOlk9xELLZsOGmYQf/KvhGH+GxahWkQgIuGN3OO+1wiDewkEvqSS863q5h72sQCH
         HhDxV9uh8ltPGsnYsCQa6gvgwrH/4YrDVRbTZC+pusOArr0+GhxSpD2Atu23Lc9srv71
         ex+eDTks98K4oAc3xndKWxeP8iJNPFJlbsU9eayzcF2CzEx04GsiPiWQaFVdmkA/Y4oS
         UoEA==
X-Forwarded-Encrypted: i=1; AHgh+RqpT6dEgdh69RQYgI4WL1rwwocu+Hmgu3KmnTFH5AtIpAStPurR4+++FrvRCIu85m2dpN50gMXD2bQ0@vger.kernel.org
X-Gm-Message-State: AFuF++meP690PWGqJi7Bguq6C8LZ9Ez/honx/KZ4JaoWRTS+MxfLQNUD
	qm1YWonl26UjtHyDuedWYeJceY/WDT+xEBvEFAdZDO2qA/TnRYgJYuLnOp0qrXLo9iKnyvckS/O
	HokKFDN0ktD167uKFXGbJMKp4keBmDeIgiq/wiQFqoFM9knHT+ZG+zAIe/3kcj+TZ
X-Gm-Gg: AR+sD13a+eBg3zNftoJrylTTNUWmX3oJg2D9CeBIKRaLsPPPbAW3K50dfdC+n93rTuM
	jk02tjvKNEbgotGtUtrkDjGvSJ2STJ90w3l+LBN8CwnSWmQmtPzowFi2Nvln/KhDwEVgVShZlBl
	uEymNg0QRuJrp7ONmLjXNriEzjupFCj2x7NpAbRRhK7lV/lOqJypZK3uUvvEwUcSvXtGvoP8v2C
	QM2TqdtJOxV4OMt2shaRADUrsGR5LeUIQV15H5DdrUpHkaCNx6mjENalRCcBP0yZTxTkyjDzGea
	pRC4oz8eNx6h+isVlrFVRrZXHV/Y6POQdBBjxMsQ79dxt9d+chJI1SKE8MVf5q8fpBdyY5bO2bN
	Yw3gdVIP6csilNMPUpHuqFETcdv2Iz+ngYNXG7uZPiYHzWLkxfoKB526P1XalKxfbHJQ08lQ7FR
	Vpb6ZK2KWGvsBRZxYvCVfM19LWWv6W2Q==
X-Received: by 2002:a17:90b:254e:b0:381:28e0:6259 with SMTP id 98e67ed59e1d1-396464d2917mr8090899a91.9.1787634520667;
        Mon, 24 Aug 2026 22:08:40 -0700 (PDT)
X-Received: by 2002:a17:90b:254e:b0:381:28e0:6259 with SMTP id 98e67ed59e1d1-396464d2917mr8090812a91.9.1787634520191;
        Mon, 24 Aug 2026 22:08:40 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-141860ec7f7sm32335970c88.6.2026.08.24.22.08.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 22:08:39 -0700 (PDT)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Subject: [PATCH 0/2] Add support for IPQ9650 USB controller
Date: Tue, 25 Aug 2026 10:38:31 +0530
Message-Id: <20260825-ctrl-v1-0-609e2291814d@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFAjjWoC/y3MQQqDMBCF4auEWXdgkqoUr1JcaBx1oMZ2khZBv
 HuDuvwfj2+DyCocoTYbKP8kyhJy2JsBP7VhZJQ+NzhyFT0coU/6wopsybake+cKyNe38iDrwTy
 bs5U/36ylc4SujYx+mWdJtQm8JrzEApp9/wOfPTishwAAAA==
X-Change-ID: 20260820-ctrl-6015e1503b24
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI1MDA0MSBTYWx0ZWRfXytNEbWVmlRdR
 SXLlxNfZE6DYRvx+kjzsh+W29VCD+NNDxNI/cbm7vRY9nzCXz9X33jnRmHjdiHGWk4diu/1q4pv
 jRd2Hy7QCo2ao9XT/lUcRWcdDH1NTMw=
X-Proofpoint-ORIG-GUID: fkI-7DzsJDuJP6DesNgtNd2u-mZY-4nC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI1MDA0MSBTYWx0ZWRfX9Y07a3ae2Dc7
 gzAlTNuqWz09uAhplEVWu59mxfh34NjltCL0pRd8USXGmyNb9+GLQ9soykiDsIioHa1P6Zak9jN
 Tb8hvClanTIOyWWTAB1jyLwNTbb8logms6Y+9FmkSlIFoGDBer4P+/yLE1SDGHefCIv0gsd9bHa
 6iOlIhjc5PJLMP8KTh+x7D17ePSZlaTh3MRSinPYD13D0QbNHwmSB2thg+TliyD+foZGAWS1hNE
 223kcbjYfkfnAQt9KXVLz3e5NDORdmDGr1psSAjo+uCq2NoPJUoPVAUSks2BgiKE6/RC0svhisI
 PFDsQpxHiinEB90juHeEf8db0lsAV3pmsIa6MHUYDt3A7wbaZYvqqFSZu0NBQ2hKfzFXNaKSBgX
 tETlpTtPTdnZwY7RZR1gZKclBIrzFa6Or6KDpomaQmGbcp+T7MsOh0icxzjIl3wOTvQqevSxl6F
 JpiVt1nQWtAEN4wFh9w==
X-Proofpoint-GUID: fkI-7DzsJDuJP6DesNgtNd2u-mZY-4nC
X-Authority-Analysis: v=2.4 cv=W74IkxWk c=1 sm=1 tr=0 ts=6a8d2359 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=rjxQJijIFNsto2uecrYA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-25_01,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 priorityscore=1501 impostorscore=0
 clxscore=1015 spamscore=0 lowpriorityscore=0 bulkscore=0 phishscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608250041

Add bindings and dwc3-qcom glue driver changes for adding support to the
two USB controllers present in IPQ9650.

Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
Varadarajan Narayanan (2):
      dt-bindings: usb: qcom,snps-dwc3: Add IPQ9650 compatible
      usb: dwc3: qcom: Allow the glue layer to pass ref_clk to the core

 .../devicetree/bindings/usb/qcom,snps-dwc3.yaml    | 22 ++++++++++++++++++++++
 drivers/usb/dwc3/dwc3-qcom.c                       |  7 +++++++
 2 files changed, 29 insertions(+)
---
base-commit: 7c5f62582256b505a57975d1a8faa501c8d8878e
change-id: 20260820-ctrl-6015e1503b24

Best regards,
-- 
Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>

