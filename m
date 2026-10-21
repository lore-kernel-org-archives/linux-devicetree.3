Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792564801;
	b=t1VmAfDJ2OWTAaNhjRLCTsWQbt0Gg9YiubfIxW8z6NfxvstrBWVzkVEvupLwqNlJCiHJ
	 S2HoWA4pS0WtHdifM2c9IM1rCJXNFOO2hO0Pp+fcFYt7b52OWWxnWm/gbAsb1zOzzeYXo
	 cQH+NknZkjIIiV59feQfM1ZkrC099KqfseRsEYT0Ig4kzdU6BMEmk3XZ7gEI7bBqzu17q
	 JIAXN5olcFh016+7ApvwXc65iDAZUKzDjM8xGrq8LxwtCupBWtirg9e3695PX7XiGRGiJ
	 SwOpIvHfGfiezTacVspoWgybdEzzLFKbNYiILi6roYco0jOD1ngePQ4pDuSZDnH0K8w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792564801;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Go5/h6FVonbcrlXkL4gMkuNu7d2LqHDLKl45lEDPQ6U=;
	b=y/LLmulivd93VYCGOiZBbTePbDdlXr8Rs2fIvTtwkbtsUdt+l7EsQ0Z1j7iCVpcjgMrs
	 0W0YfBMVIMpd2RiD8+Pwt4BSlcupGitUfH0kRS8sXJL3lLzbci9GZGL7Bgg37pkf5vkVw
	 wv+OLhc0OeNLtwvSXLS5NpiPsDV70otQE8lgg5dMfiKY3CPI7s4fbdz3o/AljCUpuzi+j
	 r21zbveYqlDs5zTbRD0C7bFXTlK9me71dMe8CWefUORBmaW/d1XC7bpza29JZ8chhpRVO
	 p+w0NQtKBvN9XoYmGSM82EAB38kZIKKZ6gPt2YwtFSo6WqR39O9wPzW3ZYR8+cYoPBQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="IWNUfv/s";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FlDdU22W;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7F62606A31E
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 06:40:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D7F62606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=IWNUfv/s;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FlDdU22W
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69L5j4aU248187
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 06:39:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Go5/h6FVonbcrlXkL4gMku
	Nu7d2LqHDLKl45lEDPQ6U=; b=IWNUfv/s7L0Xbv8mDtAt7iV0x60ZltrkcK0mRw
	ykwrWpYMfshPknfyU/05WonEVlWILfhh3m4sVpkM0DqPXGwCS4LVQzQV+a74yOjg
	K6uNtn38nVpu2be43MnhL3fTzmq2khnYHPelByNe9XSk//8B24UZ/YAPQyqs0F7S
	HvN/FvkozdilSF6Q3/ATqp8pHvAb+ALfZb+A5HlfmJGkYHXjyof1H88VmDVmX6I6
	BJYxW0c9mv84h1tQ0WzioTP04g0e0zT8GNAcpmwNO3yy59/Ai3bko9DHQ/Ge4EYI
	eLJYbABbI6flJ3m+7BS0YkS2etZWQQQQplnq/g4wlQg+9t4g==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hedajjcdk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 06:39:59 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3ab67ff8ec3so385043a91.0
        for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 23:39:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792564798; x=1793169598; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Go5/h6FVonbcrlXkL4gMkuNu7d2LqHDLKl45lEDPQ6U=;
        b=FlDdU22WMSHx/t0NRsDkdDxsD/BAEpR7XcYRL1QEY+AJ88x2vV/9a9+7lSupyIXdzP
         jgMfwktu2P91t4xNhCqLlywA5bWhaEnWDENBmJDIR/PtgxwumFAOv+1OF/oI8OhRvLXg
         bSlXMOaTWAdZq7PA9utcXO//pg4E/xXwxSQwQzYfFxPM9ymvKjlVhPWmB9AvEuuemGW1
         pLXyafBLi5XV5yqkridZrV22X4fFVelG3D/HguRCcPHZQLqJFNFXTo4Okha/NWDYnuC/
         ftRfdrZD3HL7EXCpntO2mc9FmBTiM7H0jvX/IqqrZJKr1Keo1GN/P/udYehIBdOoRgkI
         ba2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792564798; x=1793169598;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Go5/h6FVonbcrlXkL4gMkuNu7d2LqHDLKl45lEDPQ6U=;
        b=jOE8Sj+LIa4pmuaNev9JaBE44BwOhrO4OihSh2gVMIwouUNnK2gmeix2jhs/Dqabab
         WV9hLNNy+t+nmyjK+wpaf1W+HdES6+twKQp1Su2KYmpXNM7APgS7mIchCFeJEqlFY+DD
         3pzjiX6/jP0CFAw+YfseH7XWMMvPONymYxE3rV9UNBTnWt274LQHgRrCP4o+Pf87dXM2
         wKDLUkwdmNUMFCZiUS1YhKUTretLfF3tN5XAYIT3fsao2kCSHjOTwX1eZTqgat5lARGf
         rVFyAtdNGcjQGy02cfMxtwdrRNfcx/j3CFGw+KDqXvXgtrPCk4Apg0qdRCqMGgFzo0ZJ
         fnjA==
X-Forwarded-Encrypted: i=1; AKwUvBy1fNh5LWiISWoj1hLjde7fPXLo9dHpQ57g74/6iy4lD+66sHbFi2CVeAleZQ4XkTQ3zjOsEz9Z1lWh@vger.kernel.org
X-Gm-Message-State: AFq9FYL19ZtQKtCsw2szBnmpyHlOzic4wWuo/4AAw5R+lDJhNuQJYyIQ
	/7VGBs60ta8Zb2RkyMeoKAfA3d4gDTnPkXhRkxf7uHKWeJ76xEW/hvlCmBCboRQPlfbtsftxqfd
	CyHRamyfGcR1hCKLRaE3/mtRNIWHzSkw4fsP8XkyTFVS86b5s4pxrllimjfzq8DX0
X-Gm-Gg: AYBFou0mGYAdiPudQ1pw8kWii0f3qj4G/7yFh7HLqxj71rRZmNZLP+LiGdNCMl+bAIk
	FwjEv54fgLRe5WbNKlCqVGVGi/O1ZBYfdWqT+3ZZr8LrW3GIfk7kX4zVeVYttrpTgVCWcFl2gAb
	qOQQH5GdPLKxinBOFwEXf3TPECyM092wEIWpL3CiAMSrGors6OUztbZiX7PoRpD0JFTYba+B5Gh
	vn2gKYPTG0EjvAYT1ZMzr2uG+r/ex6DIfZ0a2jSeTnzhfMrLBVWGpS36rE3nFiLnUb6XDZSt1gX
	eZ60Yw/eJjijMNyyuInFFXoYfuRmia0KGHlB56bVOPsdsU2XJSmUnPrWxfG4fz4tZK7gxJ584qy
	mpKSw8VFxcZwdHltfozAqNLtItLZ84dUYfgc=
X-Received: by 2002:a17:90b:4d12:b0:3a0:c276:1ec0 with SMTP id 98e67ed59e1d1-3ad86d50c08mr1005121a91.28.1792564798356;
        Tue, 20 Oct 2026 23:39:58 -0700 (PDT)
X-Received: by 2002:a17:90b:4d12:b0:3a0:c276:1ec0 with SMTP id 98e67ed59e1d1-3ad86d50c08mr1005109a91.28.1792564797759;
        Tue, 20 Oct 2026 23:39:57 -0700 (PDT)
Received: from hu-vishsant-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ad82f0c0b1sm1163101a91.0.2026.10.20.23.39.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 23:39:57 -0700 (PDT)
From: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
Subject: [PATCH net-next v3 0/2] net: wwan: qcom_bam_dmux: Add restricted
 DMA pool support
Date: Wed, 21 Oct 2026 12:09:42 +0530
Message-Id: <20261021-qcom-bam-dmux-vmid-ext-v3-0-cedd1f681102@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIAC5e2GoC/4XNTQ7CIBAF4Ks0rJ2GHy2tK+9hXFCglkTAQktqm
 t5dwsaNxs0kL/Pmmw1FHYyO6FxtKOhkovEuB3aokByFu2swKmdEMW0wJ0eYpLfQCwvKLiskaxT
 odQbV0bZTPSNYEpSPn0EPZi3wFTk9g8stdMub0cTZh1f5mEjZ/8MTAQxsoJ0SXErBm4uPsZ4W8
 ch9W+dR5EQ/WkfxT41mTQ8nKSjhLePtF23f9zdNitNZGwEAAA==
X-Change-ID: 20260714-qcom-bam-dmux-vmid-ext-d9289db310c1
To: Stephan Gerhold <stephan@gerhold.net>, Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Sergey Ryazanov <ryazanov.s.a@gmail.com>,
        Johannes Berg <johannes@sipsolutions.net>,
        Eric Dumazet <edumazet@kernel.org>, Eric Dumazet <edumazet@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, netdev@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>,
        Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792564791; l=3014;
 i=vishnu.santhosh@oss.qualcomm.com; s=20251203; h=from:subject:message-id;
 bh=Wm437G/2TEyo8uw1Mal26euONCvxGzUjWUp+GjfVFiM=;
 b=M/CCaVJWr7jkoQByJ6f99qQqnw+PM+8ClscrF859MYpuCSFQk4sJdg8/ie3XKEiXGCeODGB/T
 AV44PtlB15lBJ6cIWOyHCONbd9BSecCHJuQeWKMkIxZTAWBhXey2229
X-Developer-Key: i=vishnu.santhosh@oss.qualcomm.com; a=ed25519;
 pk=G8/AJPecB1feGI7wxArGWGN0PPGQS0GUaD4THQCbdis=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDAyNiBTYWx0ZWRfX4bQhpYwGxiQG
 uWJbwkt5g5ncG7TS831IZb7MGQbuSTY4eBLHec+jnSSWfBzrPNMQtNxCiT+ZGx8hOEqrKqybJsa
 YAiGxq5RBJS1A3kFlAw2iQHUoWb3eFQimBhE+TM5BobmpGeI6ZZcw6NPpXEksdzp+K9sOZ+S4eR
 Z5a82jOtNIM6IhpkFLT3+qevoK3z+OFRla0pkJX+5nzWYEf6p76GsssjxBtvf0t6jplub9WLV5/
 BAc0gK+QnvpqHnDt/yloyNrZH1n6Yeg2XjENf5WcjZNFKuKyzS+oxhDbT2stI9Ym9k4MDJ1/TUK
 /n0if0zyTFcLItzRI/AkWgYp5BP1ge3FsdJ8KpfS8F+y1Zcp0VLs5qMt3ioo4B1zB29fxImIwWe
 LY9qKEQpcqjZst6C2Cn/30RrOPOLlHuAgh9FJFcOjOyje1K5h1Av7MCx7hX4uWOIvhbOkWfdLpn
 22XBUot5pt2lty0Oq2A==
X-Proofpoint-GUID: zPyWom6e6Vn61-a1ziKxRxhiPOXokDEt
X-Proofpoint-ORIG-GUID: zPyWom6e6Vn61-a1ziKxRxhiPOXokDEt
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDAyNiBTYWx0ZWRfXwkf2IM0FaCUs
 1g8Uk6N2F+GD6xMQR9f7OdYgNJNG01bUNC/ciJ8MkrSAsvBjE3PqJyvqIdK7AlbZHHIudQ3CfS1
 pVX3yiiJ/YJNGNOSqi2rBhk4MPbKbsw=
X-Authority-Analysis: v=2.4 cv=HrTjiETS c=1 sm=1 tr=0 ts=6ad85e3f cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=tWlRu96VJg_J4rp9qAYA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_02,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 impostorscore=0 suspectscore=0 bulkscore=0
 adultscore=0 priorityscore=1501 spamscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210026

Some Qualcomm SoCs, such as Shikra, run the modem in a separate security
domain with restricted access to system memory. BAM-DMUX DMA mappings
and BAM descriptor FIFOs must therefore be constrained to a designated
memory region that can be shared with the modem. Accesses outside that
region can trigger an XPU violation.

Add memory-region and qcom,vmid properties to the BAM-DMUX binding, and
a qcom,shikra-bam-dmux compatible that requires them. When qcom,vmid is
present, the driver SCM-assigns the entire restricted DMA pool to the
local and remote execution environments before requesting the DMA
channels.

The restricted pool then contains the BAM-DMUX mappings. When the BAM DMA
controller references the same pool, its descriptor FIFOs are covered by
the assignment as well.

A related binding change allows the BAM DMA controller to use the same
restricted pool for descriptor FIFO allocations:

https://lore.kernel.org/all/20261021-qcom-bam-dma-vmid-ext-v3-1-299355e8dd3b@oss.qualcomm.com/
("dt-bindings: dma: qcom,bam-dma: Allow memory-region property")

Signed-off-by: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
---
Changes in v3:
- dt-bindings: Add qcom,shikra-bam-dmux, with qcom,bam-dmux as fallback,
  and require memory-region and qcom,vmid for it (Krzysztof)
- dt-bindings: Drop minItems from qcom,vmid (Krzysztof)
- dt-bindings: Drop the example changes (Krzysztof)
- dt-bindings: Drop the statement about the local VMID from the
  qcom,vmid description (Sashiko)
- Reuse remove() on late probe failure, since the PC IRQ may already
  have powered up the RX path (Sashiko)
- Skip the pool reclaim when the remote did not acknowledge the
  power-down (Sashiko)
- Fail probe if the restricted pool is not attached to the device
  (Sashiko)
- Link to v2: https://lore.kernel.org/r/20260920-qcom-bam-dmux-vmid-ext-v2-0-ef5ca2178378@oss.qualcomm.com

Changes in v2:
- Replace the Shikra-specific compatible and coherent RX allocation with
  memory-region and qcom,vmid properties.
- Use a restricted DMA pool for BAM-DMUX mappings and BAM descriptor FIFOs.
- SCM-assign the complete pool before requesting the DMA channels.
- Validate the remote VMID and restricted DMA pool configuration.
- Link to v1: https://lore.kernel.org/r/20260714-qcom-bam-dmux-vmid-ext-v1-0-3f29da7cca76@oss.qualcomm.com

---
Vishnu Santhosh (2):
      dt-bindings: net: qcom,bam-dmux: Add memory-region and qcom,vmid properties
      net: wwan: qcom_bam_dmux: Assign restricted DMA pool to remote processor

 .../devicetree/bindings/net/qcom,bam-dmux.yaml     |  36 ++++++-
 drivers/net/wwan/Kconfig                           |   1 +
 drivers/net/wwan/qcom_bam_dmux.c                   | 119 ++++++++++++++++++++-
 3 files changed, 152 insertions(+), 4 deletions(-)
---
base-commit: 78974bac98eb0581f85aab56ccc0377cdcedb964
change-id: 20260714-qcom-bam-dmux-vmid-ext-d9289db310c1

Best regards,
-- 
Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>

