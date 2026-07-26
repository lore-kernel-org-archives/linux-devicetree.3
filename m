Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E15A211A28
	for <devicetree@vger.kernel.org>; Sun, 26 Jul 2026 15:47:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785080860; cv=none; b=IgWmEMSaqiHsuR/4vUdBbBBpGlEd6fxPBgX8X3/0i/ibjdTa1RidNU9M8WJKj9MzhVCp91FgVJrMScFVlNlV2ee4ukwD+nTvBxAe3b0PLNxhIAPOrBSzpjGWZjpFF6rl9Kwim2l41jYnbYViQpG01eUccRdwjOBv6m0GyaBn2Ng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785080860; c=relaxed/simple;
	bh=GK4orsUPb3RIy1Vmq9vddO7ECtVxJEmrticgWOKEMmU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=CgNRgg4UiJ+5IsBWHu1PV9JonQWEFZlqhd/oQBgMI9OSjGuWwlbBaK+qcdCiwYQcdrpFddgDrePoXz9Do2Sv11PvLbmv5cBcrZw7uujBzyfRqsChl7O5jBTUDaB6fKh6AEQXP9w5JS6PtioPekkxLIhBpks7mUGygnW6nS62YuA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZeM1RB88; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fke9rfqr; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZeM1RB88";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fke9rfqr"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66QE2ttq343715
	for <devicetree@vger.kernel.org>; Sun, 26 Jul 2026 15:47:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=gTaGBO7YBeZtS+NJUhnVvQ
	Db3ViHbFaDyBpEamQQ8JE=; b=ZeM1RB88N2HHj8jPcJt0Zdj2f93I1bNVVlCSNU
	I0XO1gwMTLsUdAm+tx2mkgYXhahDQ57oa6VsIFCeYDVIM9a+wU6scNFm35hXZxau
	4dhYV3MaBplPPHbSMbJbTlCCr0JAbaPQxVQvf7rRGbWskSXs814bgs3nkc5zVFkZ
	F3jnA85w5J8lnOm2KH9bHLFCAWA50Nup4fJI0SUgp3n3sxAHC0bStZzLecCn+m8Z
	wFtMSdT6UuMm7M2g2V63Na4P3pGmUT0vtcDBQclbmEUy93oqNx4S8I4oPAScstvV
	cjACbpGaVUIMt6GpkV4oHnS22UTjygy5wZBBjUkjJm0MTmqA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fmpajk26w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 26 Jul 2026 15:47:38 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-526da7e3c9dso23615641cf.1
        for <devicetree@vger.kernel.org>; Sun, 26 Jul 2026 08:47:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785080858; x=1785685658; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=gTaGBO7YBeZtS+NJUhnVvQDb3ViHbFaDyBpEamQQ8JE=;
        b=fke9rfqrN9nW0r348FV1YvzEysMSBiXC4GE1N+20DI6F2kIQZSvxyFVIRF+Qslpd4H
         qn6eit40uSXiZQKhEc09TbWl6pg6oMtI66PdMvr9Nfw4sDaBtCrWn/74mAqpkc7fE26x
         eKo1nlYTY6hcJXvk11o8EBDEngIs7Av6l9yfxMzCc5OL8IKiUP9krGnk7Yr3Rt0/ltLV
         lOnSr3TjmHXxTYt0VhTfs69sfJNvuPkvexM+W1o9B+5xp86lci6oE0YExuRvY/Kd854G
         NLCy8NcgmLAx3Eld/vdM/6z8iKppWTzmygTQdb9CCMEeqEaQjWlC5fYjSlsLun288QdP
         YKKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785080858; x=1785685658;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=gTaGBO7YBeZtS+NJUhnVvQDb3ViHbFaDyBpEamQQ8JE=;
        b=FjDxiTxWKrMNSAkcw2yxluZNkzoA+YN6TVFZ2eInPBQXJI/j2e0bP+29HMjYvS8xe/
         Dk8C3zyM5Lx7un8SK5mhXw5bhhZs3Kfs5K0YYDt7emacDJCM1SRjUlHWPyeSB3eALYIU
         YweRSPByiVyFbHhBv06EjtSSQVnOJS1B8Bpl71LTXbkI8B2dzWFKmOedu3cmthTueQX6
         gEE3l7WVe9s5tlWO+H5HT9iKbSglUitwWhO4aKvzPT9/QlKINeli3AVSic9SCJdcQXPp
         wwtUER7wkB2hTuU+uMYHRGpxBB7lzxU8bUPa/nVLyON89XoNRS6A71KfvILUMrz3qdnR
         CBiw==
X-Gm-Message-State: AOJu0YzH3pGSVxw7sl+PPVkUy9GjjFJegBZQwtT/mkQbkmQEKMES/nL0
	3P8nVeUCa0b+Fwvz3IsLm5nD2hBcp90Hm0f9SAA3BcW47L6W1GR+SFYVpgHZnpkZHWcXuk1kKSA
	Ql80udcS954StMW7TjZ6+ovHuJ9prQWI4U077N8jfZ2IyRHBxamLUj+2iNPp5Bc8b
X-Gm-Gg: AR+sD12xXhYS5j+vRJVq/twgTaZmn2oFe8Z2/dNlrprIoP8GdH+TpjIh2Cc1VLkO2n/
	BgybwLKNDDMkoS180Z9bFPgLZoMM31X72bHYXvuFG7eENJaTAo3jgz6W56G2x771hq+wzdYRUoN
	iCiLDXDXOVWXzjmH1+zOLMTXgY50MKV/Veqq4lbeseix1cDEL91wh8G6rBKUbIN7baOuQ/fW7fD
	o6kNEZVXPmM5s/OOBSRD5AzYXpWNxD6NN/hOoOFuC/crEDQ5EF0Yt9sYtgp3K72oLzaKCZDyxy8
	ahiu3Dkg+AXhX88jiUKHPe7Fg4H/IqJH24MqsVPhxN3KGdZqpILp+8M7Xgvoou0GhEZwtp+SyJB
	jF5OxNez6SBhIHvV5Hn3I76zW
X-Received: by 2002:ac8:7c44:0:b0:519:fca2:346a with SMTP id d75a77b69052e-529a836c2c1mr56907341cf.23.1785080857665;
        Sun, 26 Jul 2026 08:47:37 -0700 (PDT)
X-Received: by 2002:ac8:7c44:0:b0:519:fca2:346a with SMTP id d75a77b69052e-529a836c2c1mr56907181cf.23.1785080857253;
        Sun, 26 Jul 2026 08:47:37 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4957f9ae5c3sm236848035e9.3.2026.07.26.08.47.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jul 2026 08:47:36 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 0/9] dtc: dt-check-style: Improvements for false positives
Date: Sun, 26 Jul 2026 17:47:19 +0200
Message-Id: <20260726-n-dts-style-checker-continued-v1-0-b05b8f897670@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQ6CMBAF0KuQWTtJaWJBr2JcQPuRUVNMpxAN4
 e5WXL7NW0mRBErnaqWERVSmWFAfKvJjF29gCcVkjXWmsY4jh6ys+fME+xH+gcR+ilnijMC968w
 RtmnbU03leCUM8t7/y/Vvnfs7fP6ltG1fzwRcE4EAAAA=
X-Change-ID: 20260726-n-dts-style-checker-continued-b6a05e278891
To: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>,
        Test User <test@example.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3024;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=GK4orsUPb3RIy1Vmq9vddO7ECtVxJEmrticgWOKEMmU=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqZiwL9vWq1XJuAMgAdVJyZOg+Q2NZmjFCGD3ms
 k/N3VLwIpaJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCamYsCwAKCRDBN2bmhouD
 1+jID/4yYQg7x9tW2lF5KoD4zVxzh8o7rjwvkEHF+/KKbYfRaxkwnW0MoOmIYjcKuZoIj5r+uOT
 xrN8z0m7Prt+Yfam3jZCAeJ8tg8sZJ8hvBgSzIlUHQvuU410XF+tjh3bPmwEuDATFLH5+Dq8Hcl
 BMK/KDa1Qc2m2j7hs+AzQ4nIFUgZoQ5lSggU03r9MS+ih21Jm43g7kSw0Dr+d1YBKHG49irKZoT
 FLenMwXFRS7kjPAiDU6awVRi1OyxfFomLijr4RGxkOLmIU77+JTX8Z6DKeDNgzaBu1chof9OmYt
 nLCmYLPSMmweP/geTYnFyK1oLacN8FYZfmFNSPIeaqDyPP4xfgygGy02OSJrNebss7RrAhAUfcz
 c+ZrssbuFrtkU6PWEyb5fS+9OJ0tIsiNxHh1FLnxzhElF6upPEOSmzylxgcXj05WAkLH22q44Qy
 31iAFjZHenUDN6mP563awggXRs3g9yJprc4NDMM4QHHfJU2e1oiDChMr6/+oEhz73aXnsRz8Vk8
 BHeP7vjpa3dDgl9LlOz8K6xnsH2d/6KTfP7TKYXjGvEFTl78wjFZdHcchPiF46a9QCR4kbuuP22
 oL5/NBfRzTXwF4OdGahNyS2kANP+nWcHJpeDo3osx/rLui/pW/TggIHNpbAh+i/J/9OVtDgCONv
 9AN76JEoEwYggwQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-ORIG-GUID: 0RfsnmPnW780DYRD_ivlSo61UpTv5AWs
X-Authority-Analysis: v=2.4 cv=A8Bc+aWG c=1 sm=1 tr=0 ts=6a662c1a cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=2TFSt5gUgT4i81Ipdt0A:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: 0RfsnmPnW780DYRD_ivlSo61UpTv5AWs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI2MDE2MCBTYWx0ZWRfX7EOLAfakyXMe
 7w+aWAjIbaSe7DQkyXutm/M/WGzOuh+4WECCd29Ptg3arhITPk4jNWdOMuk2ILFGmZ0lUqsVFMq
 Xc1Z/BYlrQxkSFWYVm/MJQj1YbR+Zemn8BGsHzsX/rJeHKM1rRX5t0dhPgVvtcrOcKI91qWNRNe
 i5trZ4edysJIXAP+w5iCSIInAXKskOgCvBvvHYSAdU5bzZn5jmaZuzlXlEGYi5veG/4CwZwiaUw
 aHAOkjaRLBlUyZeioW7odmWPnh3HfHu1EiNvEf/yXFSsMmR/G+ze1z6iGJwvQl+E0BJRAHVEPWi
 U3mpDNL1PR56Ucwk6jxN1Eg9Shur3HQvmXqhLjAFdjb9OtiCSUvjzigyjidi2sOIdCCdHF50ny4
 kbWlaCtue8LlB56tqXWrRZgrrCKwV5qc6HKDOyG1PIFw4UNO0/GDNktS477EPlfl4rhEcGnmGbs
 HmvApNW7E9Pl6fvcP3g==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI2MDE2MCBTYWx0ZWRfX88Sz4AMPLBjE
 FjLc18E0tTm8JVdCl7cL57xDPhT8GYvIogUCH3d2lyvOR4Wu5rU+rzEf9S3UsgpPWkAdeoPSx9Y
 gIcqVZD0Cng/GHwNl0gcWq2sSOvWtMQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-26_04,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 bulkscore=0 malwarescore=0 priorityscore=1501
 impostorscore=0 adultscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607260160

Few improvements and proper handling of top-level node (name, not unit
address sorting) and property (model before compatible) sorting.

Best regards,
Krzysztof

---
Krzysztof Kozlowski (9):
      dtc: dt-check-style: Add missing /dts-v1/ to few test cases
      dtc: dt-check-style: Simplify setting depth of DtsLine
      dtc: dt-check-style: Handle root node in overlays
      dtc: dt-check-style: Handle sorting of top-level nodes and properties
      dtc: dt-check-style: Drop stray backslash before quote for continuation-alignment
      dtc: dt-check-style: Fix alignment of values in continued property lines
      dtc: dt-check-style: Consistently call 'kind' as 'file_type'
      dtc: dt-check-style: Introduce 'stricter' mode
      MAINTAINERS: dt-bindings: Include dt-check-style in DT binding entry

 MAINTAINERS                                        |   2 +
 scripts/dtc/dt-check-style                         | 151 +++++++++++++--------
 .../dt-style-selftest/bad/dts-child-name-order.dts |   2 +
 .../dtc/dt-style-selftest/bad/dts-cont-align.dts   |  23 ++++
 .../{good => bad}/dts-digit-node-order.dts         |  15 +-
 .../bad/dts-extend-node-child-name-order.dts       |   2 +
 .../bad/dts-extend-node-digit-node-order.dts       |   2 +
 .../dtc/dt-style-selftest/bad/dts-line-length.dts  |  21 +++
 .../dt-style-selftest/bad/dts-property-order.dts   |   5 +
 ...-property-order.dts => dts-property-order.dtso} |   8 +-
 .../dtc/dt-style-selftest/bad/dts-unused-label.dts |  21 +++
 .../dtc/dt-style-selftest/bad/yaml-cont-align.yaml |   4 +-
 .../expected/dts-child-name-order.dts.txt          |   2 +-
 .../expected/dts-cont-align.dts.txt                |   8 ++
 .../expected/dts-digit-node-order.dts.txt          |   2 +
 .../dts-extend-node-child-name-order.dts.txt       |   2 +-
 .../dts-extend-node-digit-node-order.dts.txt       |   2 +-
 .../expected/dts-line-length.dts.txt               |   2 +
 .../expected/dts-property-order.dts.txt            |  12 +-
 .../expected/dts-property-order.dtso.txt           |   8 ++
 .../expected/dts-unused-label.dts.txt              |   2 +
 .../expected/yaml-cont-align.yaml.txt              |   3 +-
 .../expected/yaml-value-ws-multiline.yaml.txt      |   1 +
 .../good/dts-child-name-order.dts                  |   2 +
 .../dtc/dt-style-selftest/good/dts-cont-align.dts  |  11 +-
 .../good/dts-digit-node-order.dts                  |   5 +-
 .../good/dts-extend-node-child-name-order.dts      |   2 +
 .../good/dts-extend-node-digit-node-order.dts      |   2 +
 .../dt-style-selftest/good/dts-property-order.dts  |   5 +
 scripts/dtc/dt-style-selftest/good/soc.dtsi        |   2 +
 .../{bad => good}/yaml-cont-align.yaml             |   8 +-
 31 files changed, 254 insertions(+), 83 deletions(-)
---
base-commit: be3b57e0fa77f8a1c8e6ebea5cf62ab71453ef54
change-id: 20260726-n-dts-style-checker-continued-b6a05e278891

Best regards,
--  
Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

