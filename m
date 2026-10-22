Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792670230;
	b=Dt7EOD/wXYTPGAZWWAHArUvo5thWIB5kKiTMbyD7AlDWPph6Wrhux9L7bvJBWRN+n/dG
	 vXtKKO5yLkgYxgkiaWzKn2sWzI1IoixSxOU2H7qzK7Lf1JdrnFu+SICYbyLx7ssTHLSkc
	 GmkvVtlBZB1LmKowJzjH0+DgaSw468Hm2g/mfE+HRwvUvNW7wFmopxPQMMK6UB0uweEr5
	 56eXUMez4y5X0lep1YieLkbgTcmZpdY7oGrmkk6Vuq4e4GWyalZE8uzgd/6w3l+jEgJcj
	 NLDQra6N1KG99g8udbk1qWqTajJMQS5o27RF7iEEInJtfe0vvOOy7TpAZRfkud/oOOw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792670230;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=mOwAwzFd2WVduFaSrJgF6lk2uZ7C8rbJnvsg/D136XI=;
	b=oQDXVaCACpExrxH0S9S7rmxIbLtRcCTAlcm5Gu9tnfN0F2Ah/3Y/Wkd1rKrYSDjDXJWC
	 +V2DyzJ9eJTER1DcJZJMfECGp41G38D8EaPMhX4Ah/i408jCWuNYgPvo/3Vd0TtMkJrXK
	 WGdi9d15rUJKy43TGECyLBJx+66iIi7kzAQIbsl801Kx4HP8pd8bnoP5unSwT3qRMrU2D
	 kyJTipQ5olpMSPQtsUljFpXmK/Lw2dt7U91vzHWiy4S13pB2PltnHzMukXuud34MTwanL
	 hIK23LUC+WHYOlw5zb8ix7tHVKdo6kl9UnBkyyvlDNkKH70dEJV9+aQYpI9thvJKpQw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=InjFgFMT;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Qdvf6n+u;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72447606A31D
	for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 11:57:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 72447606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=InjFgFMT;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Qdvf6n+u
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69MBNvoh019601
	for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 11:57:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=mOwAwzFd2WVduFaSrJgF6l
	k2uZ7C8rbJnvsg/D136XI=; b=InjFgFMTaaO9CUH8H71Cq38uJeqHymsn4drf7Q
	GiglKBA5vRQEjiuNPs3VEzjYv2Gd994OBV4AhdXLu+5lqrUnpIlvrfbqduplIKzT
	tJK/t3yqzs8ImswSDAJYYLFi4oP4uCy3kltKe7iHwvxQNuZ0oE+0Ig4AeaYoA2RQ
	g3lcPy7PRzNksJpX7JukGmcg6pr5xMQepRC6djIWdie7v4FCEtVdTq6G5qYZzUei
	92WnGCOPgE3cEb3fAGa/a4+kAo3DpuztYpy1Ev4lIUV0HEBFCGPloC2jDKs8FhOJ
	r6+DGO/ssc0NTdqwAluKsXNBYYAb68HDpclNZM4u+GvL5zJw==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf93caxp0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 11:57:09 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-147be78cd56so2041317c88.1
        for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 04:57:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792670228; x=1793275028; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=mOwAwzFd2WVduFaSrJgF6lk2uZ7C8rbJnvsg/D136XI=;
        b=Qdvf6n+ugGJi8rJzc3ugpU0M+m9dTiWRqYaLSxc8okOG4VsyjncW5lNA/hsgb0jODm
         +ga9zxtEh626dAasEQh8bTXLzrRA6yMI4VQtZShOV3D/8PozAQaGTSGZDoEaOEKObgkX
         kTQ7SxOam5fLe+cSoyQUc87yBD5LjEvJ38hvk1kWGeVU7lPjQUV/6939jluLy7Wlqszj
         KPqEKM9BTnZN/aSE/Cc1nlakimlViq3flh3g7w/WeeXskQKFbtNXL2GasDPxu7mC/Jlr
         ALHE30uw/kP5Zpq4wuudELv9LNH7kgNYm02jo6xXs3gtTWrDuDsnASO1gRJrKazdFqAt
         5fZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792670228; x=1793275028;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=mOwAwzFd2WVduFaSrJgF6lk2uZ7C8rbJnvsg/D136XI=;
        b=BmaXwNsDOKbn8PsJBH+26uUBmjy1KatXpa4DAAnhl9FvVndDwlieOyfgU1ZfTpetxh
         PldpBSbkdnZwNE7JUcrj0oNsOUTswOXN1EdjgrWWu2sXTRPRQmFvBfsWcczJ+IM5vqXB
         tL8C4D++F+DjMstWrsntDslRKtUSCy3XWhhSYfHGUdW4ZRJ+6GQeYRDCtz/II2X044bp
         5i5kq5YZ7lT9+ke9jAxq7swkJqiFCt0ThCrjpae5tkeHYchDkplvjcNyYeKiSEwjSZ6T
         qq6yPvpr2AePBE4bc7pU1De2TJ5C9VQ5xD9l+sRx2JdLds/kmtgFiAJL8cWkpd23rVcv
         Gvpw==
X-Forwarded-Encrypted: i=1; AKwUvBxzcowS+U33LVeMSz4VNDutQ4tr7Rz4blfnQ9HhxnPXrIKEBOXtQbeZatzrjSXyQ8KoU3l5kvhaOCJ8@vger.kernel.org
X-Gm-Message-State: AFq9FYKaRfGPJP9z+VSxiahC6+KS/VplN3qcXNwh19bAyBxnYhJMFLTf
	xlpcrJusZWc7LALAqigX4wliXe2qePKBN05iDxfA1kVhSdRlBM3ISO/tteRdt3nOMYiaFvtlXVT
	Vnw3mTvDMK0DjwGSOosyARllB1MgI8rEkz1yreq7i6XYohUoFoCTNNbCnptDqyWpi
X-Gm-Gg: AYBFou09UIUQbYY1QnveMQr2i8u8aikAqSutwRtda8H425ahkg9nuM/yFiskmXkP0NN
	d3UpJ0lxXnMCM5ltxmt0jReTYL54yVii0bK49toRYksTXr4NzZBuqmmi7HzSx85R437dXRvqiDN
	puhvtgz2kGt6dq7fTOgregz7cuO+9zL+fYxIP7TFivbyypfz4vzPfJ+3dVFNrcqcnK+bcmqCw6V
	7qHlCQM0eUoqCH7zUvv5RvaVnVHIb4ygULjRm6ElBgHzUFubZ64z2H9N7xCgWC3LLvYfe0um7zA
	NT7CEN5MKSIByNl9V+8uAZkDPsGmHotOYMmJmuLiPYhMsNURjQUu79KTeXq+8Ww/kNd3BR3K3mi
	fFwWUWnwYlF3SRqRcR3N574cvzGFTGBDJycE=
X-Received: by 2002:a05:7022:61a8:b0:168:3243:c910 with SMTP id a92af1059eb24-190a6adcc45mr8961692c88.13.1792670228202;
        Thu, 22 Oct 2026 04:57:08 -0700 (PDT)
X-Received: by 2002:a05:7022:61a8:b0:168:3243:c910 with SMTP id a92af1059eb24-190a6adcc45mr8961638c88.13.1792670227588;
        Thu, 22 Oct 2026 04:57:07 -0700 (PDT)
Received: from hu-apateriy-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1903bf5d0a1sm14508007c88.14.2026.10.22.04.57.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 04:57:06 -0700 (PDT)
From: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>
Subject: [PATCH RFC v3 0/3] arm64: dts: qcom: nord: Enable SoCCP remoteproc
 support
Date: Thu, 22 Oct 2026 17:27:00 +0530
Message-Id: <20261022-nord-soccp-dt-v3-0-1a69a4d54c42@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIAAz62WoC/23NTQrCMBAF4KuUrE3Jj4nVlSB4ALfios1MNWCbm
 tSglN7dEFxIcTPw5jHfTCSgtxjIrpiIx2iDdX0KclUQc6v7K1ILKRPBhOaMK9o7DzQ4YwYKI20
 aI0BUlVGakXQzeGztK3tncjoeyCUtbzaMzr/zj8hz9eX0goucMorIZY2tUlA1exdC+XjWd+O6r
 kwjg1H8ItUSEQlZw4ZLkFzjFv4g8zx/AO7Brvr7AAAA
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDA0NyBTYWx0ZWRfXyO5E0bOpHfhh
 o3mdKF3GHo5+ppX66fyPN+i/AygI9Iy0/nvq7/PavoWkUZJr+OhvlEEbwdQUP4RBxUkQUAq90yE
 38FqThbr+xAUuUtm5pBwFSkcrQJvz1A=
X-Authority-Analysis: v=2.4 cv=ReAFmFtv c=1 sm=1 tr=0 ts=6ad9fa15 cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=fqOI0YBPAjHUksOb1HwA:9 a=QEXdDO2ut3YA:10
 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-GUID: VBrWYwythKDnyFsxQ8lBVdihF0Fcu-zU
X-Proofpoint-ORIG-GUID: VBrWYwythKDnyFsxQ8lBVdihF0Fcu-zU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDA0NyBTYWx0ZWRfX7Nh7sq1nT7/9
 RFJ0Q/UfPPaTCXCPUvNRnKtvrxanEr8ivqmbV5qB9Dt/CCkR6yDliYIwvP4AeqSqGVKD8A96h/G
 kJ4PwXUHhNHoNlA2W3nSfSkoPSc/uP1pjfeFSx2Mg3hAtzyDL1wkHNKrLea90frxJn+4SlBWGyG
 YqF+Wc4PijzjkSrn2CiNtvPxUGXCxse07X/E1YfRTUn4C6rIfdB9IZ96WsulEJACT+SAKIVxiKe
 s9zRAWbbaik8i2bKQzIG2CHRqBC44oxY2tG+lSMNSn7MboqIT7WcZCL+S+cw0e1IjnjIINp+QM8
 6o/Y9dGD8nXoBwDaOKiTWZMty1DNV09YgpNHOIP2DV1NuAvlzxo3IHtUMKlxhD9PFpy1mlcEVD6
 xS54rydIasybhf502+/8pZUIvSdqC7fFXXP6PXzaOTKcWJCuELPY16/mSYrPx54Tu7hXpsyfC92
 dHsVxLl0v2sx0NhhoSQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0
 malwarescore=0 bulkscore=0 clxscore=1015 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610220047

This series adds device tree support for SoCCP
(System on Chip Control Processor) on Nord platform.
SoCCP is used for hw fencing for display and other
use cases on Nord.

It has the same interrupts, SMP2P states, power domains
and clock as Kaanapali SoCCP, but its firmware ships without a separate
SoCCP devicetree image. It therefore takes a single firmware-name and
memory-region.

Prerequisite series:

[PATCH v5 0/7] arm64: dts: qcom: nord: Add remoteproc and PMIC support

https://lore.kernel.org/all/20261014063953.549379-1-shengchao.guo@oss.qualcomm.com/

[PATCH v2 0/2] Add binding and driver for Nord SoCCP

https://lore.kernel.org/all/20261014-soccp_driver_dtbinding-v2-0-09d9c1378e9e@oss.qualcomm.com/

Signed-off-by: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>
---
Changes in v3:
- Rearranged remoteproc_soccp node in nord-rrd.dts alphabetically after remoteproc_cdsp3 node. (Shawn)
- Replaced nord-soccp-pas compatible from nord.dtsi to nord-embedded.dtsi to resolve binding check issues in nord-ride.dtb.(Shawn)
- Link to v2: https://lore.kernel.org/r/20261018-nord-soccp-dt-v2-0-4d713d316e9d@oss.qualcomm.com

Changes in v2:
- Drop the BWMON nodes from the Nord SoC as they are outside the scope of this series. (Konrad, Abel)
- Enable SoCCP by default on Nord and drop the board-level status overrides. (Konrad)
- Amend the RRD and Ride-Embedded board commits to describe the addition of SoCCP support rather than its enablement.
- Fix missing whitespace before the opening brace in the RRD SoCCP node. (Konrad)
- Got Reviewed-By tags from Abel.
- Link to v1: https://lore.kernel.org/r/20261016-nord-soccp-dt-v1-0-ee13aef55d8b@oss.qualcomm.com

---
Anurag Pateriya (3):
      arm64: dts: qcom: nord: Add SoCCP remoteproc DT support for Nord
      arm64: dts: qcom: nord: Add SoCCP on RRD board
      arm64: dts: qcom: nord: Add SoCCP on Ride-Embedded board

 arch/arm64/boot/dts/qcom/nord-embedded.dtsi     | 10 +++++
 arch/arm64/boot/dts/qcom/nord-ride-embedded.dts |  4 ++
 arch/arm64/boot/dts/qcom/nord-rrd.dts           |  4 ++
 arch/arm64/boot/dts/qcom/nord.dtsi              | 56 +++++++++++++++++++++++++
 4 files changed, 74 insertions(+)
---
base-commit: 2c56e56f4d1a6bf41a09412436fdb305e8c46955
change-id: 20261015-nord-soccp-dt-bbc2d288c560

Best regards,
-- 
Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>

