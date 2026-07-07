Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98F8B43C7A9
	for <devicetree@vger.kernel.org>; Tue,  7 Jul 2026 18:14:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783448044; cv=none; b=O9j+Ztig2Onk+P1VJECvMfRvy2BDYdsaDRCMmerrA6KgeVlE7hpVSzCxxgO2gAsqmU3jq8oOi8DIrMXqOV/rcKWsYk5Q9SQ6CooT9PjIe7y6+QRKT2DNOF20QzbCqPFOWHPx5yn/RQpXTkDBdW/7rOvTaNIxPDAYrIukMP1Kbc8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783448044; c=relaxed/simple;
	bh=BGy/5gEdVT+7XTzhpb4+IvxeTSPEkTOt6XHz/Hi6cY0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=L1MyHKgNS34iBIOQn5YQctT1VFBNQ1hxP7Ry6StlgiGEz29gkaWV3R9a/9gFcI3HJMBnTlS1CHHXZyhAI4Wp6d+c2KBZCVSW2E/Tw2yxYiJiJZXbETWJbUx+fR1atmYuQrx4O6F08WMOY+ZL27/yfhTY0xlZd/bmTb0oACjGSK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Jc8dBups; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=H0sm6gst; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Jc8dBups";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="H0sm6gst"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 667FSwg2045485
	for <devicetree@vger.kernel.org>; Tue, 7 Jul 2026 18:14:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=1+OqwGRz2H4vukNpCJikeL
	pVYIsHXk9ZwelFw2XK69s=; b=Jc8dBupsMS+EmxX9AK5aMZWOo6OTpKOClntIWC
	Srw3SfH6BgyBOPJB4YM7Aa06Jd4ASCse5VGYMJpb5Odu97dFDYhcqAh2zRP2TfGZ
	U7xqRQrW62/MDYQx7+dRHDWW2RC+9vKZLuIunQfjgsPgs4WWI+8ChpqoEcLsshsj
	z+90EmrIhS0LKhD7ZRIebHFnHqGlhJpet9wdR+Di7DpybDN5gThSvids6ICEU02X
	f/VDyQatSb5uLAizU0EPSe4+KNHMmVZ8u7E+vTlNLI+FSz0iq6E95bxXytzjt1kw
	F4Vlza7MSZGriVHjTm6IC10icdOEmQGyf4CUDeWB6mA8xtDg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8w11tqtq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 07 Jul 2026 18:14:02 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-380b630c505so1180416a91.1
        for <devicetree@vger.kernel.org>; Tue, 07 Jul 2026 11:14:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783448042; x=1784052842; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=1+OqwGRz2H4vukNpCJikeLpVYIsHXk9ZwelFw2XK69s=;
        b=H0sm6gst998Z40C5HA8+RdJ7D85gJriq/PHTXb5NKk3BIeAfGFUisDwbSU53qzpOkq
         A2aTiKL7iaBTHSB35nLI+f10zzJ/51FEUdy2rRx49cxbNEltEDsIvw/uiIdqfch3jNJ5
         L4frUBjU6Kx52/fOwbQPhrpXr/phsZNaso7GZOi3TbW4U10LG4ob0GiBlS9+uV5uvo1R
         lv+shFKxfJpkL2X66k+wz3t7ylU/3MZ3y2x2GYeWd/56DMI3jweX/xOuLzk9sU+omoyP
         CqpXSxxfuPxCgUn6A5Z4Ye5bfBKYBofu3f2oRDB4gO8HRymFj4ebE3sma3T6tD2Xoqyi
         7Y0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783448042; x=1784052842;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=1+OqwGRz2H4vukNpCJikeLpVYIsHXk9ZwelFw2XK69s=;
        b=nomBiE1b/VFOziHEOkz1BI+XsRhU/GAYTEWcM69fS5SVth1nuWUoO5HnqVmKclGvBe
         AGIhUlzNZhRApDE3Em5dh7H8uakhE4U/a6viGdVeaZWlh82VwP54KuX2OrJUIkN+JJmV
         DaPXXBDbfL7ATAlZxEDdEMAVwZirKeOCUm2inN/jZV6mqD3QFia4yqavQWtgV3R22qhv
         J5eEPk41Bt7l1+uuDpX5zTeqyYl3RA5vFzJCiiwIvzQyXG8qL+vWeJGVOnv2RI+QHQjl
         xklfOEKfCtTYCvf+fCpz7rSKHaCBwrlLhm0eT5szagG4hSwt4HMYtF3jbP8MnjBiOLFW
         Q8TA==
X-Forwarded-Encrypted: i=1; AHgh+RocOYmDNLoiKWnhfetjWiGq83CN0zp3/8epEp2PvGZ2bQ0uN30Bmz5IJkPKdnlpEtDAn1CpitrdZ/30@vger.kernel.org
X-Gm-Message-State: AOJu0Yxy/hK4d8YcG29buY9WSPRs0Si6Yp+qGupsF8z5fVOi48TJad5P
	SwEMYJz32sMT6HeXl8/SH8ujnnpkJpfXvPXrooSePduACtF3blZaa4ugEXj8bK1IZ4XQtAp9Qf0
	zPXxHS9YCg1oQvNPTb9aI71BEFqVy7ap084quSdG1WGTwjTcWmdOcE6HeXLz3CZQJcCCVModF
X-Gm-Gg: AfdE7cm8DuLnOugXc3FAjXWKyfH9dRnHQdASa+3LB/QMPtj8B0J60vIOhwlVK8UhCxw
	l/HjwXghxnY3wcrE59bdiEp4nMQz8NDG0EPW/vBXvqrzwJTorylnNsUHEOD/Acje2ca/6EkyjvS
	AT+tKBV6ZNDZnTo+ph5UcusDdYYccJnFheTgLY5mdaB+mgLFv8i5zXPh+W//VHrORaJDsD5Go76
	FtUhj689dIdnXGVTJoh7wkAV9aPDgbsmfwpVpOKZzSk9B+wsciLV6xFCdvgMioB528anMMIBHMQ
	uYlm3B566F3U+LfqqmWj3ifSyGRQlYO6D2o4iScVnGnMOnMu8E3wvq6uvLX6isiAzw9AuXc5w/z
	6OInJLsK2lWmM9AL4aSXUpiriVR6UAleoBLg3WCqXlg==
X-Received: by 2002:a17:90b:3c45:b0:37f:fb1d:63fa with SMTP id 98e67ed59e1d1-38755f379admr6287852a91.15.1783448042210;
        Tue, 07 Jul 2026 11:14:02 -0700 (PDT)
X-Received: by 2002:a17:90b:3c45:b0:37f:fb1d:63fa with SMTP id 98e67ed59e1d1-38755f379admr6287805a91.15.1783448041698;
        Tue, 07 Jul 2026 11:14:01 -0700 (PDT)
Received: from hu-jkona-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31174accae5sm15731521eec.29.2026.07.07.11.13.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 11:14:01 -0700 (PDT)
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Subject: [PATCH 0/2] clk: qcom: Add video clock controller support for
 Qualcomm Maili SoC
Date: Tue, 07 Jul 2026 23:43:09 +0530
Message-Id: <20260707-maili_videocc-v1-0-ef0828c0bf6e@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALVBTWoC/0XMWwqDMBCF4a1InhvIGE2iWykiyWTaDvXSqpWCu
 PdapfTxP3C+RYw0MI2iTBYx0Mwj990WcEoE3nx3Jclxa5Gq1CirrGw9N1zPHKlHlDGoaIiKDIM
 V2+cx0IXfu3eujh7o+drY6Rj/apnspoGfyR1P7Jsamx7vEi2lIcu1ik6VM3zx4EeS2LctT2WSo
 9UYi4tyUCBglpG2mnT0IRinwQWIBB5SUa3rBxaYlcbmAAAA
X-Change-ID: 20260707-maili_videocc-db0d6ee94cb7
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Authority-Analysis: v=2.4 cv=DMe/JSNb c=1 sm=1 tr=0 ts=6a4d41ea cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=zXpIYuPf6sbHbxCr7fwA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: OUwzc2H6hjwYMMld9XcLuBLnm_D6Z6EX
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDE3OSBTYWx0ZWRfX6gAQ/qZ6VN/E
 6QBN8RwSyc3HA1wbAJunwW7onMfp77++wjqdbfAtllBT4VECvmbJfkEFmov+EOoiCg5Msmc32O6
 5sQPT15WOXmCUysumDCOHP+iEesU52k=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDE3OSBTYWx0ZWRfX2IansGyXRVlZ
 q1oeVNvKu+Rd1DJ3v/E2eZaw7paMpDfUxFi3mzeUFz+irVTw3rz4UoypgzGscPPvu+w7ds9to3x
 9/mB7VbQu9pbBsgLR7RH9mYNexkHv5MAOBfqzGpLinYWkn0l1NkUxf8ZB51pFMhGrAXZjxMbeI8
 wSuZrfLVi/Sqp0vZA8+RtUCToJKjnzhrz4eHGtC65RML/Dc7DCJyyPiQ2EKpDgDuyzMvTlYbdMk
 fquFM84wcsIk5djuhGnmAiLXRMb5gMTV+Ba0esiCXiBFPs1ALBJFLABOrzycN6NPkvEKGSUZQ8v
 gU+6Aq4zGG/I6nCFNkI8r4SP8+iyDwesszAz62V9qXPfIfXElbE9sz3UFvmBO3CZdrJhZpV66Hp
 m7pdcPDbFFbTag4v0x1g6CtwX1SiBGt4cJJJI0vx6Z0/4PiqAzO8yyg78avAlyHzXKjiWmGrj8r
 w7Tv9HfhOcqEUcmjnvw==
X-Proofpoint-ORIG-GUID: OUwzc2H6hjwYMMld9XcLuBLnm_D6Z6EX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_04,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 suspectscore=0 phishscore=0 clxscore=1015
 spamscore=0 priorityscore=1501 bulkscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607070179

This series adds support for the video clock controller (videocc)
required by the upcoming Qualcomm Maili SoC.

This series is dependent on Maili GCC clock series:
https://lore.kernel.org/all/20260618-maili_initial_clock-v1-0-d6ede0352113@oss.qualcomm.com/

Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
---
Jagadeesh Kona (2):
      dt-bindings: clock: qcom: Add Qualcomm Maili video clock controller
      clk: qcom: Add support for videocc driver on Qualcomm Maili SoC

 .../bindings/clock/qcom,sm8450-videocc.yaml        |   3 +
 drivers/clk/qcom/Kconfig                           |  10 +
 drivers/clk/qcom/Makefile                          |   1 +
 drivers/clk/qcom/videocc-maili.c                   | 660 +++++++++++++++++++++
 include/dt-bindings/clock/qcom,maili-videocc.h     |  49 ++
 5 files changed, 723 insertions(+)
---
base-commit: 5c73cd9f0819c1c44e373e3dabb68318b1de1a12
change-id: 20260707-maili_videocc-db0d6ee94cb7
prerequisite-change-id: 20260617-maili_initial_clock-c7e2b4530d80:v1
prerequisite-patch-id: cb2499a822715bf6d411ea000e525e5feab52e7f
prerequisite-patch-id: 4280283ee9f782a5ba46e4419ab0b7186add0211
prerequisite-patch-id: df7cc303a60331fa30c828cf5c68d76a1b0819e9
prerequisite-patch-id: 9139ea0ed0cb5e61cd45ac1e490596102e57a38c
prerequisite-patch-id: 7e5ac7db1fba3258b45b689b11d0ca93d65aa38a

Best regards,
-- 
Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>

