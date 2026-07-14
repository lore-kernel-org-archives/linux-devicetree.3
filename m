Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C396C2737F8
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 04:41:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784004096; cv=none; b=I5VvZRWpJh2HbBJb4XxGjehdepXMMQI+LEWP9EH21xKnlkm/vDc2kELGrKumrB1Sg4BymWPida8i+7SSsEIdRrT65850/sv1wQ/u0s2T4iJPRjAbuowJDOkpmEcTQAielMfH7VzEQyTAfl4FdCmgf92znGWfFCpiwY4RJKRl3ko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784004096; c=relaxed/simple;
	bh=F5tu9JrNna/BYWpAwO56O6y/SAXx4s9KU2PbreLh9bc=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=GdTDCjC9vb1kg9zRo1P++QKYzL4TX6zAqE2okQ23iDU+Diy7rksd8VoOnbrn59vG/GQEKl/0q16IgMIuzyCYHqvY9BfpGO5dcZVo1sSghui5xyfW4P2Z3xoLzHrxoH/PalI834duITFdenXV8Pv7/eMjX2tRIY075iPeDz9JNiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oQqS93N6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=McWGyaQq; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oQqS93N6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="McWGyaQq"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66E38VKG3441538
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 04:41:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=1hXFQ+tyOWVUdf9tznA3Fr
	IPHdtU5pi07RX1K/x5UsM=; b=oQqS93N6nhgE0C8mM+ziGVPYkZ59uP5B3YveB9
	91T7bcUTzBMnNScZiay7Tu+cezkpz0527O5TG4NFwCGgNWeGEzdCbuEMrJHH/zFK
	3yS2F7B2vq3a99aENK8sxjjUgguW2KjBMRSz3kgfJNhAuv8Pagc8Kb9HFq/3E0Ro
	QlHh4vS6K5uMa8vNHY3JiDundCuUXTFbNxnKt2uYEYOEHB8EMhtjxN1gSRj9YCm/
	7xXzOWtXCavqNjlVDN2+WJOZat37w2kZGqKp8IfBnbVyP0+85pAFsT+Wt2glPwJx
	okqBA4N6MR7KanG8gUKT9oLSFQnwKhL/SGpMql7J6+suQotQ==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fdbr48gsp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 04:41:33 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c88ad1558f4so9971349a12.2
        for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 21:41:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784004092; x=1784608892; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=1hXFQ+tyOWVUdf9tznA3FrIPHdtU5pi07RX1K/x5UsM=;
        b=McWGyaQqpuRBjoa2aNvoGj8SSNt57NbaNOM2ictxyxR4qwpSEVDKHXzlVaEhCyi5P/
         Th1dRvZP/9DOqKy66D2Jxv8KwQ00T/C3prYJfTI5YC0rQ8SyEzNcTvJ3eQxFnD470Er9
         V6qgX2nRlxL1JaWGrJjE0H9e08JVrNw6Yso0LfgMmscS5e3ijjyeBvG2KFzwTVI9/YNB
         b7bs+JwhhLiKKpA1i0VrG1QOJM0UuYntmv2hbVWldhYppG3yDxrGU4AJi0RSaN8xAIa3
         r4zfN5ELsJE7CYpwnUF4N3f+S31OHc/4Stgyn9veEokGXfolfXNv3m9UzuhIRYqppFQz
         JxYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784004092; x=1784608892;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=1hXFQ+tyOWVUdf9tznA3FrIPHdtU5pi07RX1K/x5UsM=;
        b=ACw0tMLAUmKSRZw0+YQ+0G6/QQJEymqyxY5blPBVUT6+NHkBBuphfuKoEGy5Iz0V+F
         Luc5syJrVRb55Av9+YpAg4XkdOR+biLCRSjHQxD9fhKmIfUYeLn77X9sla7aPbhzbifr
         5AAQMTlDchnUXIGVOqC0jG4GDSpdVjoIlPemTg5EpEaQ05nIukh0cnXSAhNoJbC4XWg7
         f9VCWcGIm4Wi+b/SRz6BD+sGkY8xOjgg+DcRRA2n0LQLHmDMa0s3O+7aMoWrNrTqAwFZ
         Z9n9BkKS5SxDOTUC9F+6mB9Dy0FJbi+dZvvvUPnScY+O2DWe2HSGYKJH3zlOxprem5dj
         a2vw==
X-Forwarded-Encrypted: i=1; AHgh+RqmUs5lTHuYcscLshXam93ZEdF7CaLOAKWID0Ulrx8wZau4GXRxbIF5LBkiixx1j1Oxq0QhJgUdE0ne@vger.kernel.org
X-Gm-Message-State: AOJu0YxtgkXOPxUWDWDjl5IajaEdajxI5SnGNPOXMlEz2rwjW0G/qmxp
	wnmvxj8Q/1AhoeetfmfB90NXVyEX/LcIMvNxB2t26CoB73TD4CZN07xoyi65wH+s/LqtsXtzaLq
	VwEojqpHkPslZR27GXDPQsi9qo+XITCMcsfdpt5/SRFHb83gn3i9SVnK0XxB8DY4+aMvxGdxs
X-Gm-Gg: AfdE7ckM/YpTippHP43C1ZUgZ91keLpg2Uzcot5dYHFYnYLQv3z0/UIuq3SDGjjiDyJ
	hrksLaWGQC9k/uvNhIeBf4RwVx0YQ6fbt5fBDVe77yvvwVRz9QKWWaghsVWy15q4CcgqRXLQ0nZ
	dmdQ8tg6iVMUQiQsllROxNRCo+6JCycamwJ4xA0MEwh1uoo7YDPK95uEx5IIbx5x8VFwAlyNiqw
	nqvr5VtwbyeuP19cUYX8UNJdqLVu6YF6VZUukMv8jxcWaXD60KIdsXXxTM0MKGHc6L4t6YN7zVi
	+WP3kPtc6yaFDU56wGHq3G9PYQVf14wNTA4Vfg5YjW0u2mmhkfhfblT0zhi8wY7KTBVD6rxZDWi
	oFVbu89s6lbxYTMzIJoFyKCA1X36uRyqefsPAcIy/v8vOTphpTpP9BxuMk3YRJQLVRux6H7wMQl
	iJH1UpylE5++A7uT1Tp7iH1LXE8BYiJ5Kcp6MqDRzg+UUnfA==
X-Received: by 2002:a05:6a21:1b81:b0:3bd:394d:addd with SMTP id adf61e73a8af0-3c35741cee1mr972224637.33.1784004092459;
        Mon, 13 Jul 2026 21:41:32 -0700 (PDT)
X-Received: by 2002:a05:6a21:1b81:b0:3bd:394d:addd with SMTP id adf61e73a8af0-3c35741cee1mr972180637.33.1784004091926;
        Mon, 13 Jul 2026 21:41:31 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b659d87a2sm68624567c88.13.2026.07.13.21.41.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 21:41:31 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Subject: [PATCH 0/5] Switch PCIe node to new style of bindings for Qualcomm
 IPQ SoCs
Date: Tue, 14 Jul 2026 10:11:19 +0530
Message-Id: <20260714-pcie_move_to_new_binding-v1-0-6bb25887a0dc@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAO+9VWoC/yXMWwqDMBCF4a3IPDcQI1XoVqQEjSd2Cp1I4qUg7
 r2pPn5wzr9TQmQkehQ7RaycOEhGeSvIvToZoXjIJqNNrWtj1OQY9hNW2DlYwWZ7loFlVM1ddz5
 PtK8ayvcpwvP3TLfPy2np33Dzv0fH8QPpooW1fAAAAA==
X-Change-ID: 20260622-pcie_move_to_new_binding-750af0620f37
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-GUID: Y1O_wwo162A1C6Yx4H1A_55vIaotjcxZ
X-Proofpoint-ORIG-GUID: Y1O_wwo162A1C6Yx4H1A_55vIaotjcxZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE0MDA0NSBTYWx0ZWRfX69px2SikxwmH
 4/+DCAcai82h5S3QN+3O0DGTqi/cZxdm4nbA0k6rhwsHfL1XvbuUmA+4TCJu3kqmykuEVJlY03h
 x5Oo19jzVHASlh4IgHDH2LJz4WNYQJyuAQoDVrsRmCrFJvuZyDijiPQuqubUXUNM4mUoqOZBdkQ
 vsp16c+esKTSdS5MdDznYy0unV5GfsoV6N6zbwuu94QztnpCjeektBi4O9Qy6ErzpJgMPoNkBgS
 TPyZhF4MBeagSErcfd5JY1ZLHAOFR/vsTyTLgsnM7rxoSdDEU4y0HvYp4b57pFqPCoLEUl/iv2N
 vxzWwnsQURipPd/Vfob8Sz55C7SxKg6LNp7TiQBlSRigc8GQGpAiO2sp8LBp6rEYh3vgxnSIYe9
 6/FH7WHzILSAAwlbGFlg2MDlb7UuoQWisu5bV9w1szPQiV1plTJCsxjlFiiphRy6eAV/TNnGyjZ
 vPhF7rrhXud5wIinMCg==
X-Authority-Analysis: v=2.4 cv=F5hnsKhN c=1 sm=1 tr=0 ts=6a55bdfd cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=KChmRlnxpG4Vddxeym0A:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE0MDA0NSBTYWx0ZWRfXzEWFYsuovNlj
 ZPMP6lh44T4ajrElmEs3LIM3BmYFEP7VfHkE4QVnhfYOLECBk4tpucYGRuLcqiMWB3VPK+u5W0+
 z4P1ZTbrhH2d6v9pwAFE1DynywIs9Gk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-14_01,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 malwarescore=0 priorityscore=1501 suspectscore=0
 clxscore=1015 adultscore=0 impostorscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607140045

To align with the new style of bindings, move the phys and PERST# to the
root port node. IPQ9574 is the only SoC which did not have a root port
node yet; the other three SoCs (IPQ8074, IPQ6018, IPQ5018) already had
the port sub-node but still kept phys and PERST# on the host bridge.

In addition to this, enable the PCIe support on IPQ9574's RDP454 to
enable the Wi-Fi support.

Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
Kathiravan Thirumoorthy (5):
      arm64: dts: qcom: ipq8074: move PCIe phys and PERST# to port node
      arm64: dts: qcom: ipq6018: move PCIe phys to port node
      arm64: dts: qcom: ipq5018: move PCIe phys and PERST# to port node
      arm64: dts: qcom: ipq9574: Add PCIe bridge node
      arm64: dts: qcom: ipq9574: enable the PCIe support on RDP454

 arch/arm64/boot/dts/qcom/ipq5018-rdp432-c2.dts     |  8 ++-
 arch/arm64/boot/dts/qcom/ipq5018.dtsi              | 12 ++--
 arch/arm64/boot/dts/qcom/ipq6018.dtsi              |  5 +-
 arch/arm64/boot/dts/qcom/ipq8074-hk01.dts          | 10 ++-
 arch/arm64/boot/dts/qcom/ipq8074-hk10.dtsi         | 10 ++-
 arch/arm64/boot/dts/qcom/ipq8074.dtsi              | 14 ++--
 .../arm64/boot/dts/qcom/ipq9574-rdp433-common.dtsi | 33 +++++----
 arch/arm64/boot/dts/qcom/ipq9574-rdp454.dts        | 80 ++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/ipq9574.dtsi              | 56 ++++++++++++---
 9 files changed, 183 insertions(+), 45 deletions(-)
---
base-commit: 49362394dad7df66c274c867a271394c10ca2bb8
change-id: 20260622-pcie_move_to_new_binding-750af0620f37

Best regards,
--  
Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>

