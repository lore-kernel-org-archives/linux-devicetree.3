Received: from mx07-00376f01.pphosted.com (mx07-00376f01.pphosted.com [185.132.180.163])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93A87384238;
	Thu, 25 Jun 2026 14:30:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.132.180.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782397829; cv=none; b=FI5gA28RxU5WyVkTC+Yz6s0mQvRlFxWoyHhlvPVYX0uS/C5flUYzglzXdsR6WBjuxOlapgScMTufXheCRSMGUyywROYnVZeV04kyicPROds+FoB2EHHxf9P1RBv7NlQ/vQsgJHbRLsmXb0pbmOqG23nzCMqUBvfj5LyJXMHRzWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782397829; c=relaxed/simple;
	bh=ydpD6m+FKF1/lPk4QZtgUyTf82YVvzH8VZA5KFxUxG4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=A0hhllGLi6MC83WIEXlhrf0fchyTLJGl7qGDQnn4/1fAxBUBuFiKelMpIsyFMU4EfDO9kloKgBqOm/Pd7ObHLpr3zz7LDnK08CFYmCIiiAieLUKifAZB5++Pmqiv2C/iGSW/u3h5tXxDL1V1OpSFUHwJn1K0BTMkow/lmFO6ZgI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=imgtec.com; spf=pass smtp.mailfrom=imgtec.com; dkim=pass (2048-bit key) header.d=imgtec.com header.i=@imgtec.com header.b=Hmyao137; arc=none smtp.client-ip=185.132.180.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=imgtec.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=imgtec.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=imgtec.com header.i=@imgtec.com header.b="Hmyao137"
Received: from pps.filterd (m0168889.ppops.net [127.0.0.1])
	by mx07-00376f01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65P4JFRo405670;
	Thu, 25 Jun 2026 15:03:48 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=dk201812; bh=+
	HrC3jIL4x1yS9cu9xZTW2cDXWcFT99xVfFhH9ObCMs=; b=Hmyao137FUArnTsCk
	853K5f0FQvC1KScxNlkhGvQ3QsSe0ROcUSzgDpYF6JlzEAeTDHSZBPucrQDWIGCh
	s+TftR3PMGe3wG6fysy84uGkYQP4V9fmjif50EcXIyYuDBWK4E5++9fVrjrY0h4m
	gVCOn54WkcCgDPs4wb/qL1OnpSehJKlnUeti3KADKALjUCf9r8PbPYt1DLJLp4Jx
	Hx001Pe+eTitpbOZU7jVHQeeDc45Ee7Dtea4WaNvmG6oVqbMDgzWyh/cNQF3djPv
	TELDiJzd5xjK7/AJc52TV9JRLng0P7FnThkboL9bscx6Fory/ZzuOKpHib8xjMJp
	YOdZg==
Received: from hhmail01.hh.imgtec.org (83-244-153-141.cust-83.exponential-e.net [83.244.153.141])
	by mx07-00376f01.pphosted.com (PPS) with ESMTPS id 4f0t728jce-4
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 25 Jun 2026 15:03:47 +0100 (BST)
Received: from [127.0.1.1] (172.25.4.185) by HHMAIL01.hh.imgtec.org
 (10.100.10.19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Thu, 25 Jun
 2026 15:03:46 +0100
From: Matt Coster <matt.coster@imgtec.com>
Date: Thu, 25 Jun 2026 15:03:39 +0100
Subject: [PATCH 3/3] dt-bindings: gpu: img,powervr-*: Add maintainer
 entries
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260625-maintainer-updates-v1-3-35112b2f038e@imgtec.com>
References: <20260625-maintainer-updates-v1-0-35112b2f038e@imgtec.com>
In-Reply-To: <20260625-maintainer-updates-v1-0-35112b2f038e@imgtec.com>
To: <imagination@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
CC: Alessio Belle <alessio.belle@imgtec.com>,
        Luigi Santivetti
	<luigi.santivetti@imgtec.com>,
        Frank Binns <frank.binns@imgtec.com>,
        "Brajesh
 Gupta" <brajesh.gupta@imgtec.com>,
        Alexandru Dadu
	<alexandru.dadu@imgtec.com>,
        <dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
        Matt Coster <matt.coster@imgtec.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1735;
 i=matt.coster@imgtec.com; h=from:subject:message-id;
 bh=ydpD6m+FKF1/lPk4QZtgUyTf82YVvzH8VZA5KFxUxG4=;
 b=owGbwMvMwCVWuUfy8817WRsYT6slMWTZmjq6P4t/H7CBaVOLI9OBp0cLXhxJLnuyY6MLR/0LF
 tuHLtOzO0pZGMS4GGTFFFl2rLBcofZHTUvixq9imDmsTCBDGLg4BWAixyMY/ntObjL5cU/Zqavm
 54Jtwmna67Yzybjf1fnAkevgxztL/wwjw4y3eTcnMX6rNHjptN77kHXEgt9i3yKD3VUzuU97pt4
 /zQ4A
X-Developer-Key: i=matt.coster@imgtec.com; a=openpgp;
 fpr=05A40CFCE7269D61D97100A1747F0A9036F90DFA
X-Proofpoint-ORIG-GUID: 0h-uhC25q-GYcnCuCyo3jJmsNCevR8GF
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI1MDEyMCBTYWx0ZWRfX0PRfwS35jUz6
 fb69f3usBKfdBMN2MxE2592e6wivYPC1uccEYeH0A+nDjMNu9TEWkoQD3vbbUd6Mv5vG3tnsHxx
 GiTIZe4Lin3OxwE+mOGBUoeudXgcqSI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI1MDEyMCBTYWx0ZWRfX62EFOb1ja+tV
 rkKBcqXkoLH1dg1fxfhmau1zV+3a02bd7VMKak3BXFSXs9Mjah/eo92MXf4b7SrbUNI79VHSJIZ
 v78R72bf5fmiCj2AosoYYcPaxSLAdhQPc3i/gVVaL1t2BSnj+naD0MFZ+3Er1Y5a5x56aupH6c+
 rxygMLWKpnpvstNUNWIK8c6lM/byT5mUyapaeICgiO0tsBxotgSY3AhWdYHnJsl3J0rc0hUhT3m
 FeOiPfUGG/cql7amLzA+4BeRWr8h0n5mnHnRgTWmbWBGdBNSKSkRk35ba9Ot39FKP+4u0jfo68m
 /ijrbVkMcE5P7/BARoynN6VcgQY8XM/iqv6jhlw30F0+b5ninfAjuA3veJrj+9nwi7PquDySrZU
 kMW9vdbJ41EUUe64Kl2sIc7rJHZXr1bOSzkcFfx3ZeXyv0dSR+HMYxjb1lNkzT9flaL2K8kVajR
 1OuG06QMJa3OUOQw4Ew==
X-Authority-Analysis: v=2.4 cv=ee0NubEH c=1 sm=1 tr=0 ts=6a3d3543 cx=c_pps
 a=AKOq//PuzOIrVTIF9yBwbA==:117 a=AKOq//PuzOIrVTIF9yBwbA==:17
 a=e416AD1ZbSsA:10 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=kQ-hrUj2-E3RCbRHssb7:22 a=7RYWX5rxfSByPNLylY2M:22
 a=gEfo2CItAAAA:8 a=r_1tXGB3AAAA:8 a=rC20Y6xFHIYgf1721XUA:9 a=QEXdDO2ut3YA:10
 a=sptkURWiP4Gy88Gu7hUp:22 a=t8nPyN_e6usw4ciXM-Pk:22
X-Proofpoint-GUID: 0h-uhC25q-GYcnCuCyo3jJmsNCevR8GF

These entries already exist in MAINTAINERS, add them here so downstream
users of the bindings also see them.

Signed-off-by: Matt Coster <matt.coster@imgtec.com>
---
 Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml | 4 +++-
 Documentation/devicetree/bindings/gpu/img,powervr-sgx.yaml   | 4 +++-
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml b/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
index a1f54dbae3f3..91e4ff61b394 100644
--- a/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
+++ b/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
@@ -8,7 +8,9 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: Imagination Technologies PowerVR and IMG Rogue GPUs
 
 maintainers:
-  - Frank Binns <frank.binns@imgtec.com>
+  - Matt Coster <matt.coster@imgtec.com>
+  - Alessio Belle <alessio.belle@imgtec.com>
+  - Luigi Santivetti <luigi.santivetti@imgtec.com>
 
 properties:
   compatible:
diff --git a/Documentation/devicetree/bindings/gpu/img,powervr-sgx.yaml b/Documentation/devicetree/bindings/gpu/img,powervr-sgx.yaml
index f5898b04381c..3e7df7344430 100644
--- a/Documentation/devicetree/bindings/gpu/img,powervr-sgx.yaml
+++ b/Documentation/devicetree/bindings/gpu/img,powervr-sgx.yaml
@@ -9,7 +9,9 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: Imagination Technologies PowerVR SGX GPUs
 
 maintainers:
-  - Frank Binns <frank.binns@imgtec.com>
+  - Matt Coster <matt.coster@imgtec.com>
+  - Alessio Belle <alessio.belle@imgtec.com>
+  - Luigi Santivetti <luigi.santivetti@imgtec.com>
 
 properties:
   compatible:

-- 
2.48.1

