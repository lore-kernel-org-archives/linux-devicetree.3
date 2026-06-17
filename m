Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1F3E1DE8BF
	for <devicetree@vger.kernel.org>; Wed, 17 Jun 2026 17:38:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781717937; cv=none; b=uB5b4wuvup3VamgBPValeF6V0T9urMQLfJwMwwi5vduMHmAAmeC0N7RImlh+YUTWl5sKr8YPbC6WmPDGAL7Q7qw8D9A2dDHbx/H279eRW0ln2YenKh0uBBup50E27Gzr0Vi4flJ0hpWSv4c0GQXHcIH5esIZFc/Cp1VlUvfyQHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781717937; c=relaxed/simple;
	bh=zBII009NXCK6txLdpkC8tQvBqYvLEm8yfzpj5ca3VaA=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=YbYc866uEMFIOllqyTQ/vRQuxXSOY/YEWB7brpnGhEOyRwlPvaOZq3+j6ImWLA5b+Opn7dB0PPNAFmXDaKRbwwPLrXqmluxs9t8YJVoZyqZ+qDNRwyWNcG73pRhd1iTviDG9M7fB8kL1SAF50i5p8U4Fiqo3LvZBTp3cxyjpeKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lTluNpmG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bXjgBEwE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lTluNpmG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bXjgBEwE"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65HFoVtS083331
	for <devicetree@vger.kernel.org>; Wed, 17 Jun 2026 17:38:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=CjI6CtgCxWDvc4aY1Dbfru
	ezal0p/zh3tfHibXZjGT8=; b=lTluNpmGJG0/6lUWJYVREF3aLSDSTJzf+Scbzi
	QT4/CmgvAS5w6eJnA4ChsZ+xoyOKV1fPRaMpAyZAq15YT4tkIu1PHo07MJqsE0W6
	qFdEnggvcJjqMJwRDtQXzNl2XbtrmBAGLcv/dQJvL/rjvC3a22Eayk3x8SlffceP
	tz02gjh2K9aE9Gt0nNs/LNLnMOsOsSXlt73nsPs1S+ciPfcojQR5sWWBGsGx26VZ
	fAzw9Fg8QVW0LhrbDVpSbJFHKQ83BV3Cfm7A+70ZBsl1DsjlE/Kp/SJNXstHEmhV
	nRFFRrOLryUGNyBGZ8G9gLJkYPITqtoz7Q05SBRIzJJO1K/g==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4euw9vh576-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 17 Jun 2026 17:38:55 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2c0b1bb53a8so112965ad.0
        for <devicetree@vger.kernel.org>; Wed, 17 Jun 2026 10:38:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781717934; x=1782322734; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CjI6CtgCxWDvc4aY1Dbfruezal0p/zh3tfHibXZjGT8=;
        b=bXjgBEwEMAw+AnJsKIGJUbgbjKjXb8ptuIfRqzBQgfMWEXuWRoGM+Ivz3jUTkP2aDl
         pTG/eG9uSh2ebPoEU7iSGO+f+XxEFFG/Qu0DHzgwj6Spn0hkcz0NoEw02v1S/rm3PfJD
         F7TCXSjD1ii0zsRYfzDMibwF7CFOsqhPBlrpOPTrsaDg05nc8hl6Vb3mdVmg1FDVUqgr
         fLuwPS0YT26SxedlX7vHqpIic/9F6AnYwHlN5+kIcKsm3R8dKTjUZk20ksgBuNI+ojm5
         xU5SF76LZ5eqTY6mPiJxiPa0U9svspmrywCtgjVuPNtCG2kyYrIz6o3qyXs3eFRiwIMZ
         chAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781717934; x=1782322734;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CjI6CtgCxWDvc4aY1Dbfruezal0p/zh3tfHibXZjGT8=;
        b=mA+CmHkF96MGZnvt+gE5FYS8pCWMW1o5NVKgn8yF9/+vm0NZ63/fGVMSBG5a73bLJy
         KOmqrQ1rcDiGRtDsSnWc9W0ytQ3UtVYmu8SPUI6jBlXvlg6ohk6YnpB9ZkXHlaEAUfJC
         e+RsJdGy4139odpss1yBiSp87FPH94nVxsOyRN8e3UIV5/ytGzdxGn3C2mRiO3e23mL0
         TrCbO9LOrEtXh99C3LhFefKE7vdAismO+A0khBPnZMI5A7ho3mmEMloi0UN2RWYGH/zo
         yS1I8+E8C6Wwl3Vd2SNCfNSsV/IZEYGypA4lkyYymWua7gBHvopoHVAJ7rZUJCXdfwZ9
         mQxw==
X-Forwarded-Encrypted: i=1; AFNElJ/MOQjM8xh0dAhpSnoMWvEoT4W1L1507818ys1AFcvMR6ul6YaVYLuStOzxFfQxwuew7aUh/zgonQD8@vger.kernel.org
X-Gm-Message-State: AOJu0YxmNPoeCLNeTfD+xCpLxENGR6BVU07xgsFRHi95cGONUNjfIR0t
	PpqCca71KlQdjNmFEUkqfrlpuy0ER+WQZuLQbd0Vosski9jXuuzc0wxHQSeNtU0O6Y+2YAvgJpG
	JhxwEo667PFgiM31DWiMo3p1rcuB3DMf3itOdc8ymYSgX8kOkz0wjFRmJ5WV3vcc4DklPiKgg
X-Gm-Gg: AfdE7cnB+VXo6cGA5NdZFuTa94a6N/K2fZJCE+39DcXxg5K7s1nwppjDsNkZrEXeT+I
	WoZgs6SQsw+wY1EPIux1UHoyKazv83oGXFISJ4aqFVLbpBilc6p/kLrArtEnZ+oGz87cBAkQ0AG
	MdRfErKyenYuOUfK/paIHKT1KNj5gX0kfzWOmVh+jATsVUDTdk/LF3jGyv2+y7j0Uf8rk6gpTYG
	7X6BvBuL43piU/i/glyyFo4IMq8VxypND3ir6xh19T7ANYxqYPTQVpFAlfsaVe0Ows8WtMQlyH8
	smo4JW/YH116zcV2DoSEytv8bC7P8JIMkDatvqRs0OWGwg66bnR4X26dMULdMb3Du2igBgG93gx
	dkiHbZ+RgY5ByLXyRS9oltGpNhekrPh4E6qNBA7c0Va96lDfaRNraLU1l14ZNAevxo890fU8Ami
	Wb0a3Hwvj2hHnKuzY5jI1HGO5QjHjBL95ABW3Q7L+wG6yTdg==
X-Received: by 2002:a17:903:3806:b0:2c6:b3dc:b838 with SMTP id d9443c01a7336-2c6de6673edmr3240135ad.18.1781717934395;
        Wed, 17 Jun 2026 10:38:54 -0700 (PDT)
X-Received: by 2002:a17:903:3806:b0:2c6:b3dc:b838 with SMTP id d9443c01a7336-2c6de6673edmr3239865ad.18.1781717933924;
        Wed, 17 Jun 2026 10:38:53 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c433369c8asm173973215ad.73.2026.06.17.10.38.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 10:38:53 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Subject: [PATCH v4 0/3] Add support for the REFGEN in the IPQ9650 SoC
Date: Wed, 17 Jun 2026 23:08:42 +0530
Message-Id: <20260617-ipq9650_refgen-v4-0-c505ea6c6661@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKLbMmoC/3XOwQ6CMAwG4FcxOzuzFTadJ9/DGDNGJzMCyoBoC
 O/uJhciemnyN+3XDsRj49CT/WogDfbOu7oKIV2viCl0dUHq8pAJMJBMAKPu/lBSsHOD9oIV5Up
 mYsvyXWYYCUv30HfPD3g8Tdl32RVNG5U4UTjf1s3rc7HncW7CJYNvvOeUUSEQtNXCWpkeau83j
 07fTF2Wm1BIvNHDTOF8oUBQciW14rnIlMI/SjJXxEJJ4i82+BISCcr8UMZxfAMMYN2XUQEAAA=
 =
X-Change-ID: 20260520-ipq9650_refgen-196b570d8bc0
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        stable@vger.kernel.org, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-ORIG-GUID: BQhgcVmJ2yrAvw71otx5mzZk2y8LtR2h
X-Proofpoint-GUID: BQhgcVmJ2yrAvw71otx5mzZk2y8LtR2h
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE3MDE2OSBTYWx0ZWRfX56arkPLIZZaL
 KOblP8WC5rh0b8be3j3xVFBGmpM/dz6tkWAVy4ValH4LRJ+4WaP6nbeeT4YXf24ZY47bEhiiglZ
 wP85cQH+OASXhEw+9d4K7IEjQ7Kq/Xsua9evEX9cqUmPYfps+sPUUjQtWvmaLNkyZCAR/b0+8Gl
 OqiXSInidQSGiSHl7H6sCDBqC8pmYXiMDDZUs4TAUHMA052OZNu0HNa06biII8FWRU+b645BYaj
 UpP7ZLKVBHdPEgLMwKYcRrt9TwYc0Pwxe/ayMcyqsS7TB2GMKvVufsPIkyBB7KgorwwHTF54IFO
 mswu0bHEaC2pTwxeH7rdBz00LvX5FTwTmqF6UwNou4KT1WDWjqzEkAsx6P71vwsozTeUL7j+IAt
 m43w9DInrOCPWys50iiVLqbRQQ9czOAWpnIwbTUxf9hNizqGjQDgh45L2/pFQuRsX0pqt/cc6v1
 FXD+/T/adJCNLw6y+XA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE3MDE2OSBTYWx0ZWRfX2QUfMxdh9LDN
 SZF6AXiZMIV/yMa8YtPElPzmhXoUf30x470+YiKXoJJFrykdn77HpljOmtEMdITchqM37d334SD
 L70HIdAKPNTkIo7RNsfksaA1XCNVPP0=
X-Authority-Analysis: v=2.4 cv=YJKvDxGx c=1 sm=1 tr=0 ts=6a32dbaf cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=VwQbUJbxAAAA:8
 a=jDu6XcLu4sYahdmiP6UA:9 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-17_02,2026-06-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 adultscore=0 impostorscore=0 clxscore=1015
 suspectscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606170169

IPQ9650 SoC has 2 REFGEN blocks providing the reference current to
the PCIe and USB, UNIPHY PHYs. For the other SoCs, clocks for this block
is enabled on power up but that's not the case for IPQ9650 and we have
to explicitly enable those clocks.

Document the same and add support for it.

Correct the regulator type to REGULATOR_CURRENT, as the REFGEN block
supplies the reference current to PHYs in the SoC, per the REFGEN IP
team, aligning it with the hardware behavior.

Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
Changes in v4:
- reverted back to the logic for is_enabled() as in V1.
- Added the get_status() to report the regulator status to user space
- Dropped the Dmitry's R-b tag due to above changes
- Picked up the R-b tag for binding patch
- Link to v3: https://patch.msgid.link/20260615-ipq9650_refgen-v3-0-5f611623629c@oss.qualcomm.com

Changes in v3:
- Pick up the R-b tags
- Use the lower case hex number in patch 2
- Document the IPQ9650 compatible as separate one not as a fallback and
  move the allOf block after the 'required:' section
- Link to v2: https://patch.msgid.link/20260611-ipq9650_refgen-v2-0-d96a91d5b99e@oss.qualcomm.com

Changes in v2:
- New patch 1/3 - change the regulator type to align with HW behavior
- Add the constraints for clock and clock-names property in the binding
- Read the REFGEN_STATUS register to find out the regulator is enabled
- Dropped the unused slab.h
- Link to v1: https://patch.msgid.link/20260602-ipq9650_refgen-v1-0-55e2afa5ff64@oss.qualcomm.com

To: Liam Girdwood <lgirdwood@gmail.com>
To: Mark Brown <broonie@kernel.org>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: devicetree@vger.kernel.org

---
Kathiravan Thirumoorthy (3):
      regulator: qcom-refgen: correct the regulator type to CURRENT
      regulator: dt-bindings: qcom,sdm845-refgen-regulator: Document IPQ9650
      regulator: qcom-refgen: add support for the IPQ9650 SoC

 .../regulator/qcom,sdm845-refgen-regulator.yaml    |  31 +++++-
 drivers/regulator/qcom-refgen-regulator.c          | 113 +++++++++++++++++++--
 2 files changed, 135 insertions(+), 9 deletions(-)
---
base-commit: 4fa3f5fabb30bf00d7475d5a33459ea83d639bf9
change-id: 20260520-ipq9650_refgen-196b570d8bc0

Best regards,
--  
Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>

