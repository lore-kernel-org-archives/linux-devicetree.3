Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A97231E83D
	for <devicetree@vger.kernel.org>; Sun, 29 Mar 2026 17:52:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774806781; cv=none; b=C+B3B8rxd6n0cJZezMo3ilZtUFH/DHlb1mHjDSdwReV1IjhO1hZLPII84rrFVW1Hxj9vfLrlVUx5F428bG+gPb+lTwZzXYh5waMz9P9NY55cNYqhEgacnrXWckrdS/meBxDBS6RDHChIVk7tTjqTIN4L4faqfU4ecSiMyX4//eo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774806781; c=relaxed/simple;
	bh=d8P2id2IC+kxZmNPYnq2jpvigp1uHGraqD2gXOiQ0VQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=eHqPoM0wTOiU13MQMQihu4RGw0ASNQU79+fWqCKostgEHzClGX1RZGBCI7OQLIE0ZLtoXSHnCvIptpec8Y41PHqpNOha/y8GsRYCYh4r0dXl1ZeINr1nwzrYbJ9Rl/XC+JIFTXELjDaBO9wJVUEF1a5zs7gbeMjNWavxHmOdUR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MZ4lqIkO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Y9WUD9MV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MZ4lqIkO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Y9WUD9MV"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62TCBa7A759311
	for <devicetree@vger.kernel.org>; Sun, 29 Mar 2026 17:52:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=jslQs59Tp+epsfDp0e/6dfPWKytmm2GvwOq
	6ywz8kc8=; b=MZ4lqIkOCfg/UNB73IlaUqqZkdD1sYae1XrsvwNNhwNZN0Hk8s8
	fJM082ZWf7Kc502kgKXtpytsjT+9+mUEToocpnuq9F/7OPBbKf+XbBLamWJoaW33
	nIQV9NTWHkUXZmXGn6zLkSZuKMUF+UbZ2JRlPbnsS820bOHYuAM1Uu7Bm5HBBNit
	DaqMsQKyaAI9Yph3PEDdVuJ3eV3WKFBOJF5C5idelV4XN3nQopuVQrioN0mAzWVq
	Ht7h3AHAgWv+dWJCERqrMPt866i0lCupsM4J4CSEY2NIu/1ghK1HF5NI9Sk/UZVd
	9x/7ZER5yhHHJIZ2g81heiF86+X8ruhzq+Q==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d65xqkgec-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 29 Mar 2026 17:52:57 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-35da4795b3cso1414397a91.2
        for <devicetree@vger.kernel.org>; Sun, 29 Mar 2026 10:52:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774806777; x=1775411577; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jslQs59Tp+epsfDp0e/6dfPWKytmm2GvwOq6ywz8kc8=;
        b=Y9WUD9MVCLY8wgPkxuXBUvFfUilEvJ35IGCx49xVtG+4fHfkcjOVUZHMl6KSl6jUYS
         hcIWmbGYsqTke0diRLfVdEogowE+4loegLt+pmLLMwrJomL9eM21DPuz75fD58620AiF
         RseA2qTzb7et9jpFhmfVmVtaSp7W58kqidk/T+9u1IdI2KLcmCB6/TlqZU14679u9o/e
         SkcX5KDkvVqqN/GMQG85hGERxoP/0lOj+xRtFQ6uk4p10Lsk7/QJMDRHMgAq0sUFvXNG
         4bhfff5G+6tJUSXy754Zv6ggViQPh6KkQmbCaSuf5Y2yt+1GiTHJIok1Nv2fuLrz6wb+
         HctQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774806777; x=1775411577;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jslQs59Tp+epsfDp0e/6dfPWKytmm2GvwOq6ywz8kc8=;
        b=QY6XbLGPLPflnG0H32XsZmgpogYLQPPDuMqIxdBTkyPzKQYvJzr5dqWFmqbY5eNnzp
         aTyGtAIN0wxCWtNC+YKKZUMWsdiwb6ZWzftx+HU1ngnWAcAHd2ukKK1Rx1+sj0PWg+So
         aO/5KTsS2l5ytf+iy9x6ATEkbtgEDm1sx7ZyPmz0qXXkCc2C0L0dUlnosgQArRSg3JIX
         0XUdtCqUxJakwZRW6T1Q0VaDw1gZLdB/zFHTt8YMhfq1hJY4iZhXv1gTIVhAWATFXf5y
         w6yzpDF4UFsSDmFJLjyQpiy5py89ZKxVkHM4hAnD0Y/8JP0vaAb53rsjw8do+rBHPne0
         3AmQ==
X-Forwarded-Encrypted: i=1; AJvYcCW6I6RgaCrFtR+GLBSa7G68IRg1+Q6Nxw3GelJ3yqKf6+NIBbFLawFnE9QiZsUEa4TsEnHxQ/T1jb37@vger.kernel.org
X-Gm-Message-State: AOJu0YwPNkRMrkNthoiZ/xBDnQxXc3WQbeZt7Je1q9Cu/jY/9PJFKYf/
	p2d3uSMGIRw+IL6LNKppe9bIxI9kXw/xkA4kpdPoMCYc4+Rk2UpKdygqHfrL+FiRBlCKQy0cj7v
	h5Pgc8JCmkPDW/coiTSYdu1QtO3C++mGu/V5N37CZ3xhrSEeScOER33tu5dX1BVxe
X-Gm-Gg: ATEYQzzpFyUzNhA8aeL0cgWuQm9PNZx/L+ErOTIEyCdEzv4YENF2qz1AGE7tKGk80lM
	wfP6zbSNYZ0No506oZDWo07HxKS6DgUKQukDw0imKc43jwRRiXW8EhGEN9rS0TGN3Osdx9r0QEQ
	u+aiSLk79H5Jso+AgcruwL/Yhkw3JiDbmH3lufeGSq7RNxEnTYT5jVoTnTZwfNsoVBIAgN6xRmM
	99RmegN0ypXfzh0UdaLPMjU36Y0kqIjRzStnlKvSd3Xd7Qn1JL31Y4jB+6FmrTeXTneviYdFiRe
	LeAP5/z9doCXo224iqKX/JScl16l77YdCUCtjhMI6OJDNye2l8+K7wis8Y89GnBi9rvgpUeFKV4
	ZG+tvptMPJsQPGx7iEYp/45sA19+pd1LRkbO/T5oS1Tdddv5rz6RoXwIYw7E=
X-Received: by 2002:a05:6a20:394a:b0:39b:ad63:4792 with SMTP id adf61e73a8af0-39c87c1518emr10652693637.63.1774806776971;
        Sun, 29 Mar 2026 10:52:56 -0700 (PDT)
X-Received: by 2002:a05:6a20:394a:b0:39b:ad63:4792 with SMTP id adf61e73a8af0-39c87c1518emr10652675637.63.1774806776508;
        Sun, 29 Mar 2026 10:52:56 -0700 (PDT)
Received: from hu-kriskura-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c769179e2f3sm4435891a12.18.2026.03.29.10.52.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Mar 2026 10:52:55 -0700 (PDT)
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Subject: [PATCH v2 0/3] Add USB support for Kaanapali
Date: Sun, 29 Mar 2026 23:22:46 +0530
Message-Id: <20260329175249.2946508-1-krishna.kurapati@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: WQOSsY5roNH1xSk2cBdFCC-ucCcAgV1M
X-Proofpoint-GUID: WQOSsY5roNH1xSk2cBdFCC-ucCcAgV1M
X-Authority-Analysis: v=2.4 cv=evLSD4pX c=1 sm=1 tr=0 ts=69c966f9 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=v9h4A0QrD9t0TD2QtpMA:9 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI5MDE0MCBTYWx0ZWRfX2XQV0RVGy1/l
 LLpBYDesVlrxQCj3L3mLmx0ZJ+qAeTy6OF3GGa0KEpBPNVrpt9x27HNHTM0yp9vGmLSFO/JF/VU
 gFRsC2eKK9D7zRbIEFp/92oJjQMf3jS/iwPIIzsZ/JAv7kRsBhd0zsfrwIZKdt17nJ8MtZPuAPa
 /KX50DY8/lmQh+9TJ+HBfD2gTrJ/B8J00oq6j3xqRlFhoFuUjiFp2K0E7h5TTDd4LmRCi5mX3cD
 Movw/gHu2/UPIJgwkDS9ozjH+brx1wR4lqllLCPV9oVxUmm0M6JaPJKYnx4WhyaDZFZ0+9O4OHK
 PilWjcPkQ1dY7ZTVsqfcyRRkSnWIUfnFkMivE9kz/aYceBRcqBLvHeVYisEroYwd5fKpm+3ekIT
 RsB9Z1oqTg147aOwDKq6u4yW+OMbZ1g3hPVvtX/gMMGpLMwFzJYm07jyKA/eX+10zPdDDlI7zmp
 WYQ+cHvn4+N8j+aUgsA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-29_04,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 bulkscore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 suspectscore=0 clxscore=1015 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603290140

Add support for the PHYs and controllers used for USB on Kaanapali SoCs.

V1 of this was a consolidated series of many functionlities on Kaanapali.
The first patch is patch-6 from v1 unchanges. The second and third patches
are parts of MTP and QRD specific changes (patches 14 and 16) and commit
text modified to indicate mtp and qrd specific changes are being made.

Ronak is the original author of the patches. Kept Jingyi's and mine SoB
(with no CDB) since we just rebased and send the patches in v1 and v2.

Since SoCCP changes are not acked yet, enabling only device mode.

Changes in v2:
- Sent USB specific changes instead of all MTP and QRD specific changes

Link to v1:
https://lore.kernel.org/all/20250924-knp-dts-v1-0-3fdbc4b9e1b1@oss.qualcomm.com/

Ronak Raheja (3):
  arm64: dts: qcom: kaanapali: Add USB support for Kaanapali SoC
  arm64: dts: qcom: kaanpaali: Add USB support for MTP platform
  arm64: dts: qcom: kaanpaali: Add USB support for QRD platform

 arch/arm64/boot/dts/qcom/kaanapali-mtp.dts |  27 ++++
 arch/arm64/boot/dts/qcom/kaanapali-qrd.dts |  27 ++++
 arch/arm64/boot/dts/qcom/kaanapali.dtsi    | 154 +++++++++++++++++++++
 3 files changed, 208 insertions(+)

-- 
2.34.1

