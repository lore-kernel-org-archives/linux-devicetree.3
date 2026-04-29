Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB6893822BE
	for <devicetree@vger.kernel.org>; Wed, 29 Apr 2026 06:41:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777444862; cv=none; b=GhhBdwlMVJ9xiLm4I8lQGCocYt+b9rLpK+HBnvzjCzO3S/0YZfz9Je++WKpGh7eb/895DoWS1+5lOKpWOz1qriX6PKkLOeFP8VIve9QEcHJZ9qVudY9QJOAgFBdRKE0L0sh5tS9WcQSY5PB/99aWTLiOoCFTs5FA53Uor6kujCk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777444862; c=relaxed/simple;
	bh=erY0kQyqF/hdTAswYgm1+uOgS9QTVMfy3EgzOqMjSto=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=MzIARWfBtvQJr+oGCWraMirfBAGCNqzi+ndWXSviDzdJ6RS65eNG2Sx6gZLoWGRIi2uHJJK2tqoK1dzXNppi84DifdjvEydSMIFomnoNL9/MWJc9Kd8kgyoZn6OOfBu90KKAmX7NNRO4x/cXYdOe+VxPhHgnLhqUu/2hnlXlZyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SrRUjn0h; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OqNBJfds; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SrRUjn0h";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OqNBJfds"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63T34JW82984834
	for <devicetree@vger.kernel.org>; Wed, 29 Apr 2026 06:41:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=1BN2WbIeDfW/CmdnL979tx
	eW7tV/N+jKAOjbRdJsve4=; b=SrRUjn0hHdJDeiImyM8Z4QY9H1MFHMIM1Eh7Eb
	4knz23X0n71bJOIdHJAfPeb4uCCutn/vFVG5Kpmu4wPf8JI7txOABLOIJkf2Iq0Z
	bTUC82BdzpTaoBIKN9iZU4LWm5wnGPf0Co0NDGqblAfX3yjM5abZuNLjDT1j5Mbc
	UQgOlatu8GcxnFbEbqagLTtLU0ntmDk+zQC7VI0KPH688YLh50pj33QmbniRN700
	FJ9FNFdbQtvrl7bCjH6LFjwUYH7DZbpJk07Upk7gYTa1Qs/TiLL8hgz2URH1bVQr
	bglOFSXNG9LgiKcBz0MG0wIMbgNHm5TEzmoCMGcpcZBJJfDA==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4du0u1tf8d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 29 Apr 2026 06:41:00 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-82fa860e71eso5914783b3a.0
        for <devicetree@vger.kernel.org>; Tue, 28 Apr 2026 23:41:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777444860; x=1778049660; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1BN2WbIeDfW/CmdnL979txeW7tV/N+jKAOjbRdJsve4=;
        b=OqNBJfdsZIQczTy/ZScSD1DFlqX2H5jp3WmhbEsQgfQMVyXWmweFJbhUYxob3qpOzv
         hVuC943YYLSS7bPwpVdYB5RcRlBfKi1W4r/xZoE9+wyXk3x0PXRTKUyQ3uk+dDdB4701
         ok8pRWbLVtw4560CawyBvPVP/qZkOfpJeetpe/VHWcc4Hez4l9wmOXs/CGn0XUNB+FjC
         XFRrq1d19FZ6EO7dGsfzgYj8LxTN7BvpO2IfRpePGelFyLT/ITP5D/seGLcloXePNYgd
         ECGIQ+HURrrmvH3ijaJUFTEru+Q0Q2WLZjxldyB5mEpLQxHdP8DNq/8gSKuUgYcLPlzb
         uh+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777444860; x=1778049660;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1BN2WbIeDfW/CmdnL979txeW7tV/N+jKAOjbRdJsve4=;
        b=rCFhCy4FoAcim96aJsCtQNrAqxeaMNdhjj98lgcdcvE9137qUBIJluaX/7q1SkARYp
         wZmLKc2ruWe+1nl+j6h8M5E11/loAWy2abpeejwW8Ya5Fyab16CvVmNa755WnRo1xekk
         xnVf2G/1To2ncraq0t5R+RMzUYvNEYk6Ft3JwgCWwqM5tzt5GdjqKrzzCbbT98uY74P0
         MKqUKZ28zSnJ0z5rkTK6NmHGrCr4wvc+0SY6bLSq5TjsPV/RoiUvHpcE9bg8K53KdETp
         4qW102nPdbCZeFyyEmxH7plz/j5dNV+FQ9lOkR0QzDlTyiN0Tci41NJ2M4mF193urkYg
         Efdw==
X-Forwarded-Encrypted: i=1; AFNElJ8LjeAQush02C8GofcE3Js5aipNzmxHrTBNiycedbU57WfAdmX9dP8DU5FljcYbuoSzvdgfU6zzaaoZ@vger.kernel.org
X-Gm-Message-State: AOJu0Yyd9xa1XhCp4J8jH8pn1fgQ0IglPGywkcxd5LiZYqaAgoGK9HwR
	bLPUYZue01OOd3xxDgbL45kdrcT/S3JAOCiBgI5SMgxwkRZv/QQ50KEFTkNWWOh4kxEkuf211br
	lT/R50f1kQnOVQz9HFIuB50dfXj8XaTRAicxF2w7cYyL9WTUzMBY0TCmwXCZAxZ8aM/YIQShT
X-Gm-Gg: AeBDievru+49LXwlE3Cfed/12uWMXfEzPd6hdBTObVjOCCIAgbYlqBuAJmb1AeiH96/
	/BzG5OeuHQ/oetjkrQnx0Hb06M+5+EqftR3RpIOxGlLPRypg9v9jrjatiq1GoYhGXTThtD297e0
	P/55JAJUd3o7vSZO0LpRkYTEbOm2vHPlOPPOPKxXHjMP4wNm54SPTpy0ljG8nsp1uaOEnPRXeaM
	0g+yiVfpiXNv0Acbi/X2q74MCHrVqzXI0q3hsqWaGehedZAowE/O2Yb756BNJAIaAd4DAo5Dktu
	0vp/+QRIXVZmVZsrDmxvOu/+ZB1G/sEkQv95RFN9XNp8eDfqffC1I9JivUJIjpRiyU5+6E9uhC1
	x1MSx3S0APQHgTnBpVc2ph5MKrEEBTz3jLeMQAhPgq5AqZ0aOASbkM76l1rU=
X-Received: by 2002:a05:6a00:b908:b0:82f:559d:ece3 with SMTP id d2e1a72fcca58-834ddac6945mr6775423b3a.15.1777444860088;
        Tue, 28 Apr 2026 23:41:00 -0700 (PDT)
X-Received: by 2002:a05:6a00:b908:b0:82f:559d:ece3 with SMTP id d2e1a72fcca58-834ddac6945mr6775364b3a.15.1777444859203;
        Tue, 28 Apr 2026 23:40:59 -0700 (PDT)
Received: from hu-mahap-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-834ed7eb78esm1048478b3a.44.2026.04.28.23.40.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 23:40:58 -0700 (PDT)
From: Mahadevan P <mahadevan.p@oss.qualcomm.com>
Subject: [PATCH v2 0/3] arm64: dts: qcom: kodiak: Enable 4-lane DP via QMP
 Combo PHY
Date: Wed, 29 Apr 2026 12:10:39 +0530
Message-Id: <20260429-kodiak_v2-v2-0-c3a703cc30eb@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOen8WkC/2WMywrCMBBFf6XM2ilpbGNx5X9IkTQPO8Q2mmhQS
 v7d2K2bC+dyOCtEE8hEOFYrBJMokl8K8F0FapLL1SDpwsAZF6zlDJ3XJN0lcdQHyYTumB47A8W
 /B2PpvbXOQ+GJ4tOHz5ZOze/9q7QOU4MN9nttlRBjb5k4+Rjrx0velJ/nugwMOecvCjW4xakAA
 AA=
X-Change-ID: 20260420-kodiak_v2-d7a06d50db5e
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>,
        Mahadevan P <mahap@qti.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777444855; l=2256;
 i=mahadevan.p@oss.qualcomm.com; s=20250923; h=from:subject:message-id;
 bh=erY0kQyqF/hdTAswYgm1+uOgS9QTVMfy3EgzOqMjSto=;
 b=rTBjehIQsTN43ccI64AZ3+63W/lbBtXV2VqanJY40Wy+Sc/irQZkGttu3uPIHH+HJGTPQgLcX
 u9ZXCd4voYuBRlz0cO+SR3mUxlluDTvoNBG6Mu3KKfHD+bK9Z0ZCs34
X-Developer-Key: i=mahadevan.p@oss.qualcomm.com; a=ed25519;
 pk=wed9wuAek0VbCYfkANx7ujIG4VY0XfCYrffFKPN2p0Y=
X-Proofpoint-GUID: 2t1pK8hd2H_UbLF17JF1fO-hi6KiVRhS
X-Proofpoint-ORIG-GUID: 2t1pK8hd2H_UbLF17JF1fO-hi6KiVRhS
X-Authority-Analysis: v=2.4 cv=aPPAb79m c=1 sm=1 tr=0 ts=69f1a7fd cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=q2dzgMnl55gs7i4ReAQA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI5MDA2NCBTYWx0ZWRfX0T5Tjrz1/dTM
 BW2OmoemBmHKTM+IOnTRj9nFMSzpnL9t54nw8aSJSwq7WGTkUftYL+Fkw0sSvnDnkESScosueyv
 jSsubtk9sTQmpOSb3CXyjtVY9I2P28/y13yrRKmekZkmIEv9e453GORRx2+/kvb2Sx8N6xTuDVV
 eS9bLKFUZUdSnGfeGzzvat7DFPVMKtcuu28RfRtsF+7kzCu4FshXAo4UsEyDo7ZT88gdnrDkknu
 OC5SEBbpiSUbiNwdNm87xC20dasJ7qMiJYrw60TVyZWm7OLTaP6qINBjLEsWbqZbff/kvFqhXoW
 KVJNhVKfj9jYkMvkuJioiDDDEbyPAIecUl3v143/IP2qoZOa0V4UntJjv70WnEigMin5qJ0oO+g
 QRSFZOoVIN5UrLfYMCQ4OKGRIVSXwSjYMj+H+k915hluqnhMLTj5EZV7eEbOeBC9meaTymWUi6y
 5kmAE3j4ss2HinDYqJw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_05,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 priorityscore=1501 adultscore=0 impostorscore=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604290064

This series enables full 4-lane DisplayPort operation on SC7280/kodiak
platforms by wiring up the QMP Combo PHY correctly and consolidating
the DP endpoint configuration in the SoC dtsi.

Patch 1 adds mode-switch to the QMP Combo PHY node in kodiak.dtsi,
which is required for the PHY to respond to USB-C Alternate Mode
negotiation and switch into 4-lane DP configuration.

Patch 2 moves the data-lanes property from individual board files into
kodiak.dtsi since the PHY-to-controller wiring is fixed in silicon.
It also removes redundant remote-endpoint and orientation-switch
overrides from qcs6490-rb3gen2 and qcs6490-thundercomm-rubikpi3 that
are already covered by the SoC dtsi.

Patch 3 updates data-lanes from <0 1> to <0 1 2 3> in kodiak.dtsi now
that mode-switch is in place, enabling the full 4-lane DP link.

Signed-off-by: Mahadevan P <mahadevan.p@oss.qualcomm.com>
---
Changes in v2:
- Split single patch into 3 patches.
- Move mode-switch and data-lanes to kodiak.dtsi instead of board
  file (Neil Armstrong, Konrad Dybcio)
- Remove redundant board-level endpoint and orientation-switch
  overrides now covered by kodiak.dtsi
- v1 received a Reviewed-by from Dmitry on the combined change;
  that tag has been dropped pending re-review of the split.

---
Mahadevan P (3):
      arm64: dts: qcom: kodiak: allow mode-switch events to reach the QMP Combo PHY
      arm64: dts: qcom: kodiak: move dp data-lanes to SoC dtsi
      arm64: dts: qcom: kodiak: Set up 4-lane DP

 arch/arm64/boot/dts/qcom/kodiak.dtsi                          |  2 ++
 arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts            |  4 ----
 arch/arm64/boot/dts/qcom/qcm6490-particle-tachyon.dts         |  4 ----
 arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts                  | 11 -----------
 arch/arm64/boot/dts/qcom/qcs6490-thundercomm-minipc-g1iot.dts |  1 -
 arch/arm64/boot/dts/qcom/qcs6490-thundercomm-rubikpi3.dts     |  3 ---
 arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi                |  1 -
 7 files changed, 2 insertions(+), 24 deletions(-)
---
base-commit: 452c3b1ea875276105ac90ba474f72b4cd9b77a2
change-id: 20260420-kodiak_v2-d7a06d50db5e

Best regards,
-- 
Mahadevan P <mahadevan.p@oss.qualcomm.com>

