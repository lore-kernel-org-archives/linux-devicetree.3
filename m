Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E8983D6CDE
	for <devicetree@vger.kernel.org>; Sat, 16 May 2026 12:34:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778934870; cv=none; b=De/iO9Ajo5FL3j5ARwoOf8oSPGhIYZBe+oYj+IQPGruhHBp5407Qzjgb07gX2H2zHlpXE3/VxNDoOxTrUhRdneRDAdFDsvYgrC/8GDYf2b77w78IlWB4sRhkHTTiEGbEwGcIW2EL/TR1KHolZ9Ywq6eRTwPcJkt1rhuUC9Q3oBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778934870; c=relaxed/simple;
	bh=+ZLfc3QA+QBsQTaKp+HhzOK7CJ71bHrL5yqZzxvE/mg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TpZ7oqhXTWGaeoWgKH9LNjyAPnKnobPALuJcuW44L5eeeA+hpkJwiLPf4NdrkI9oUPX6xtVMkvU5nbE6sOljdB/eNSQSkwvv89v8hJr7bxnBokm0/ptg75gjfhyr/U8MVkJVKBoPxPJFxWRCkJlewHpD+D/L4qjRdBAjSRB5nQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NQ4pcXER; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=T6ILYUND; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NQ4pcXER";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="T6ILYUND"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64G4CgvR787014
	for <devicetree@vger.kernel.org>; Sat, 16 May 2026 12:34:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Jw0cReuBvl0p7xYPoFikX0tHkyYFstCR2xf8gOH3em0=; b=NQ4pcXERhzYssk+B
	N4JUNVLNprCKeNfSq4UTXr4H1qEwb8oqNeRCh9A23ITnl88Sqw4fcO7lUm1xAA1q
	8wKj84FLXmx3c4lhs3pzVfa7YPDi6z6kPVxHJIzMFxwhDZW251JciNtJ/lJVynxL
	adFwLBUhtMvkcaRUpDtE8Leode5vvOr9ZJZSC+xAPhpGohX4jV4gbgfSWac0R5ew
	Hy2O6nnt0KFBXi3GbeN4ldbCTCzmgmlnImgEMGnVT5xzOnhXYO3Qodtle1URdZJX
	rD3H5ms2e31hRDwK8KzkpEHyKqC6QBIXae5J5gYocOeA3BN5HlYTRtUuZZH+kYLn
	Hkan8A==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e6hbc8sx0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 16 May 2026 12:34:28 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c82751074c8so1029526a12.0
        for <devicetree@vger.kernel.org>; Sat, 16 May 2026 05:34:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778934868; x=1779539668; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Jw0cReuBvl0p7xYPoFikX0tHkyYFstCR2xf8gOH3em0=;
        b=T6ILYUND1Dy5SWncRaL2Go2yHEbJtMyUlpyNSzqr6H8LHXBzcqXJlksJt9XsbkDUEe
         PVFNPSugfMgumse06WfHJkTtv4HW5VnP4A7CNQn3R2hCp+bxnNNvtDwMXEmYV7GKC8Mu
         k6ktOd7f/FUAMsvkOWQ+y3ejeXI0a6KJeH0urxZyyXM9BnNLHo1dRgI/PyzoAdCHW/Nx
         2HdXQTnFe/rgaliBWV0hnZmYEX+D3iX42wXiDBPYdORXylHBNvliWT5oj0t2fV3rKgBS
         +zCU5+rx3ze/4xR/VNOnpmVGllglxG0d6MVcx8h/OVPB4n7vZX+SgrLVNFpurJq/sK/V
         BhSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778934868; x=1779539668;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Jw0cReuBvl0p7xYPoFikX0tHkyYFstCR2xf8gOH3em0=;
        b=Pe3qviEPQqKaB3w1HIMVCHeZIyzykGve+LpVI24hzrhB2aOUltRBJ1UAQ8NjKSw4wF
         FtYj7ivkw37kg4rvPx2iFkyUS29GBCadv0dnvRnn+GB8czjVFM/o3gLj7595Rf6NpfD9
         gcG489MwWggXunUecEpq0nJkbiuLOLr1C9bX8k1aqjUXFqOUJQ35y1e8GTsD24U/NuKZ
         LdC0mYi2/yGpiyDNYkcRbaRk+dOVpjlvfJaVzfp6wHomlL2OrDEiM0iAI+r6hxGKs9+g
         I5i8DPnYuRfL0o3B2LjLpBSDAI6tkb+CrD8/VfjDrWohfQWRjuUIBE2KBaDzaV6I5mE7
         Cy3Q==
X-Forwarded-Encrypted: i=1; AFNElJ8SD88SY2vjpF++ybFtzMvK8/YfWaMd0kpQlWB+KplqEt1rxByxNYyaPBXNJrWIdYYVDS1mBoid+x8e@vger.kernel.org
X-Gm-Message-State: AOJu0YzOB3L4hHq4LhOSl7zannxSCYKhBJHZioXYT/aw4d+iitfI1mFe
	KOkRy80tIW8wHc4GvgN7pl3jQBbz5D8IdqmlC4V1wfKm6w1ftbrCRmMBZ6NIeEUyFRF4SKhE+Hk
	J1pnH2yuMnhy9g1kJk5P8Ugy5mR9+8T7cLI2VC1GEzwzacrzhI8mWupqFuZtiXDsheJV6i46I
X-Gm-Gg: Acq92OGc4lLqPBjtXt/aGohtgPeMowOHBMLuWOeHHD3DuVf971N7HI4Uekwad+CfnSW
	j6LvMkclG9XgAbtkfMdy9EuZvJBLjhrSSke5ujB81rV2VktvyQGUNAZ3UpvXtOS00F9lIf1CaGx
	IgPAm0LjyhLoenvwJGkr4uXg6o8nrS1XqRyif5YTPP0EjC805tOfbP9FXddPg1/5pEjAG7//+11
	TlRxHDOkt5YSlRZ9YAjhFWpLTjo62ckXzIrArNKPGdHUQAQCZicZdGvhOUIPxdpN+16v2d9H3zq
	PZCp70+5WeGuUxZtk5gJ5bssrV5Nm8JXgSxggLswN/uD7DXC6EBTzcgGnD4Jh4IBnfdgQ5TgXK3
	031emFX6htTuc4NC47WOTvBWrFs8nLRqpIi7AdPv8K7lNgM6I21vm
X-Received: by 2002:a05:6a00:330c:b0:83f:9c6:9c with SMTP id d2e1a72fcca58-83f33c32d67mr8367653b3a.10.1778934863041;
        Sat, 16 May 2026 05:34:23 -0700 (PDT)
X-Received: by 2002:a05:6a00:330c:b0:83f:9c6:9c with SMTP id d2e1a72fcca58-83f33c32d67mr8367629b3a.10.1778934862594;
        Sat, 16 May 2026 05:34:22 -0700 (PDT)
Received: from hu-bibekkum-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83f19f7cc9asm11405217b3a.53.2026.05.16.05.34.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 May 2026 05:34:22 -0700 (PDT)
From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Date: Sat, 16 May 2026 18:04:03 +0530
Subject: [PATCH 1/2] dt-bindings: iommu: arm,smmu: Document optional
 interconnects property
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260516-smmu_interconnect_addition-v1-1-f889d933f5c1@oss.qualcomm.com>
References: <20260516-smmu_interconnect_addition-v1-0-f889d933f5c1@oss.qualcomm.com>
In-Reply-To: <20260516-smmu_interconnect_addition-v1-0-f889d933f5c1@oss.qualcomm.com>
To: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778934854; l=1523;
 i=bibek.patro@oss.qualcomm.com; s=20260408; h=from:subject:message-id;
 bh=+ZLfc3QA+QBsQTaKp+HhzOK7CJ71bHrL5yqZzxvE/mg=;
 b=cApZ3bZQJ/56u9eFXAcmzjTKWoxsGgJHT9Bi/cl0ETuWX9o9MT14b3Fo6lOx3Pt0yomP7WFkP
 q9xu2/KDLtlAEnmD60hjWV+2pIhb9TEKp1TLdexxsINRIILaVNMoHF6
X-Developer-Key: i=bibek.patro@oss.qualcomm.com; a=ed25519;
 pk=V4oTa+TgRi7dib76fc92V+rslyRCAKbK8D4b2RVsMbc=
X-Authority-Analysis: v=2.4 cv=cuSrVV4i c=1 sm=1 tr=0 ts=6a086454 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=h2u_PYqE-o0iKWOXq5gA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE2MDEyMyBTYWx0ZWRfX0LkRgVJ98/CT
 meB1FTzfTQODcsuFeBMqANVylWW50DROZK50JXet9p9VfFjSXyXet1PeIRyEn9hb4K7R37fR9+k
 8S4P/O26Ro8URr9Jbei24e0B5WOXF6m9PMfCGuR+Y62GlABqyzqAvS9fhzhf+8uUlyP85nBPVmZ
 EgvaVq9Y0vBCZIregAZ1ltqh5DcKT1EaxU+mGKLMhXzVm4vOjPlYO4IhGMdnt2TWiR4nXltV+90
 3DYbfs9Vaix1xG27hZiZhNjNa8/P+trgUo3WOk1heEN8rHqRWRS7GRb8ygpQn6qRhpJGJsk3R4k
 4Bjf8bjcZ2k7Ey1MZZDQcGo4iz7pEla1EP0lj+dwHR4rxZhwqUl+yID9Owmjs/us6D71inkrERj
 K/mITuY6JgNga7YKsVn1Eil8OjO01NsidzxM0alLsS/vfZLWt/ozX7Jvq1Vn4ot+O6orY7bS1Zz
 nbPrOsjor62wmcONzeA==
X-Proofpoint-GUID: jUhS4AONXcGIDS50BwK7dxrkhKQK8jtd
X-Proofpoint-ORIG-GUID: jUhS4AONXcGIDS50BwK7dxrkhKQK8jtd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-16_01,2026-05-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 impostorscore=0 bulkscore=0 adultscore=0
 spamscore=0 clxscore=1011 suspectscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605160123

Some SoC implementations require a bandwidth vote on an interconnect
path before the SMMU register space is accessible. Add the optional
'interconnects' property to the binding to allow platform DT nodes
to describe this path.

The arm-smmu driver uses these properties to vote for bandwidth before
accessing any SMMU registers and releases the vote on runtime suspend.

Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/iommu/arm,smmu.yaml | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
index 06fb5c8e7547cb7a92823adc2772b94f747376a6..5cbf944f2d3e178b3723d4dbaa19ee0d33446979 100644
--- a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
+++ b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
@@ -243,6 +243,15 @@ properties:
     minItems: 1
     maxItems: 3
 
+  interconnects:
+    maxItems: 1
+    description:
+      Optional interconnect path to the SMMU register space. On some SoCs
+      the SMMU registers are only accessible after a bandwidth vote has been
+      placed on the interconnect fabric. When present the driver votes for
+      bandwidth on this path before accessing any SMMU registers and releases
+      the vote on runtime suspend.
+
   nvidia,memory-controller:
     description: |
       A phandle to the memory controller on NVIDIA Tegra186 and later SoCs.

-- 
2.34.1

