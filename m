Received: from mx07-00376f01.pphosted.com (mx07-00376f01.pphosted.com [185.132.180.163])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93990349CE9;
	Thu, 25 Jun 2026 14:30:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.132.180.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782397826; cv=none; b=JfFmDg4n3UhXElRvpe1+CKCJuEYp2wP76L962wvC7j6JU7xeq3brWo4jHZONt/fkeMWWA4i3YoALvYlCweZtg3b/0QriOMAW391FxND28RZ/yS+9BMci4T9qBzb/ohmsaDv9ge4XWj5tIxKUum84YAygWVZbupMPCeQxvV42jhw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782397826; c=relaxed/simple;
	bh=iSZ+AgvC2DWDc+PLE6JDggxMSRLW5Vxm2W02U3jdNjU=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=S4isTcrSYfolwWyKdW8eWoG0vyGpjU/xYXcWtW9jywh93AQpbpT8XeCuk9K0pXtENNV3B7Pbd55y6vG+FDyRc9HH48U4TWJwOG8uAMzDM9bcMsqXlrAtbFyf6at+V+HTDQsnq9YGd16tDpnpcyEPwHN5BgV3dg1ymsRC2QcFS5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=imgtec.com; spf=pass smtp.mailfrom=imgtec.com; dkim=pass (2048-bit key) header.d=imgtec.com header.i=@imgtec.com header.b=Q+bW08MB; arc=none smtp.client-ip=185.132.180.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=imgtec.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=imgtec.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=imgtec.com header.i=@imgtec.com header.b="Q+bW08MB"
Received: from pps.filterd (m0168889.ppops.net [127.0.0.1])
	by mx07-00376f01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65P4JFRl405670;
	Thu, 25 Jun 2026 15:03:46 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=dk201812; bh=OcTQy6whelO1gq+B72/7YO9
	fJ7m0kZ9hwFtZQ6QGIm4=; b=Q+bW08MBvtXvrbd00vATpn9TEahpf0CrWEfhNUr
	dNNS9wXGSv4JddgmcoD93EHs3IJqiU0/Qba4FU4A6dwdwXapYFvrbeyiDMX/XZhZ
	sHFEkVqz756pkDmvMrxKIVSvopVpPOpB6cB75Y3HWKr8zOqlJEoyERNm4vOoMkfa
	JfFyzjiBRJIzDiE38HDVS9JapKFEArWMgWQgIliGEOs6mPBhvpPv9iuFnBHA1Nua
	RNkM6oI9yd0++7dp0u6sPugW9LVNEJaXCIm4sox1tjtdtmcdHZxhR43g4cyf6hUi
	8A+OlCDZ/M/hv6YrNvsKE8LZwHWYAfXu6yt80Jp412gVZvQ==
Received: from hhmail01.hh.imgtec.org (83-244-153-141.cust-83.exponential-e.net [83.244.153.141])
	by mx07-00376f01.pphosted.com (PPS) with ESMTPS id 4f0t728jce-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 25 Jun 2026 15:03:46 +0100 (BST)
Received: from [127.0.1.1] (172.25.4.185) by HHMAIL01.hh.imgtec.org
 (10.100.10.19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Thu, 25 Jun
 2026 15:03:45 +0100
From: Matt Coster <matt.coster@imgtec.com>
Subject: [PATCH 0/3] drm/imagination: Maintainer updates
Date: Thu, 25 Jun 2026 15:03:36 +0100
Message-ID: <20260625-maintainer-updates-v1-0-35112b2f038e@imgtec.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADg1PWoC/yXMQQ5AMBCF4avIrDWhUcFVxKJqMBIlnVYk4u6Kx
 Vt8i/dfwOgIGZrkAocHMW02Ik8TMLO2EwoaokFmssxKWYhVk/Vx6ETYB+2RRT+avKqlKpRSEI+
 7w5HOL9p2vzn0Cxr/luC+H65h4+V2AAAA
X-Change-ID: 20260624-maintainer-updates-bfc189254555
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=988; i=matt.coster@imgtec.com;
 h=from:subject:message-id; bh=iSZ+AgvC2DWDc+PLE6JDggxMSRLW5Vxm2W02U3jdNjU=;
 b=owGbwMvMwCVWuUfy8817WRsYT6slMWTZmtq/+x1yWuzsDnO5BPYgg4UVp/917TAqDA4VsNSYd
 cNxb9+kjlIWBjEuBlkxRZYdKyxXqP1R05K48asYZg4rE8gQBi5OAZjIKS1GhqO6hZLuLsVCVt3r
 W2MnNi+092h9lruc/4xixc7Aa4fd3BgZpmzdVXFvB7dk7eHnHhyZu54cPz7p624xw88NnDcypCO
 MmAA=
X-Developer-Key: i=matt.coster@imgtec.com; a=openpgp;
 fpr=05A40CFCE7269D61D97100A1747F0A9036F90DFA
X-Proofpoint-ORIG-GUID: _Waomku9iG-GnkieZfxTcdMeDC2gyrxW
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI1MDEyMCBTYWx0ZWRfX3aI0ywAgxuju
 uqLSW1R2Gd68sSM9vw8Hfo2MTmhVKg/9tN5sqajXqsmmAgNlax+WoNYKcpM/Y/TyUG52fphw+tc
 AxLEVAmZUlDReqUx6b9trfLpzzjVijA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI1MDEyMCBTYWx0ZWRfXyZW552nZ5rpp
 cDHIF0v04YcuS45MDbOJ0yCUqyMmZ0WGFWVKMIQStFoTvs8EsQyCoJy3RH8CxowuCj0tG1n010G
 XYD+r3ZImhtemKQwG3b0aw5KP4bIT3lPz3/p+gfmvJReVlM0BakYzTdqR+PkkraWS8U8aOmpaC5
 TFkO+D8763tscH8jfmIJ+borzq3zWVViGSeIK3Vfao3OvZhPWO7zomzCNxnHd1GEiz13kKTFRWF
 oQ2ABCbD4k3YdQlMqwFvcwaFFJF5gfWjszzOqxg7h0HhuDRPQe3a7l/KET5ehWQ5c227OISWdQz
 f6PBCLGCynE6p591h+tlWoc+aRe4i2gGZniXyr4opB6lJZAmpmcwcBm+1s6a2XKsdCE8NxVdsck
 xYo5hSlvW5DqJG23qwBVXp/Zo++78LT1sPH4tHOmgEkzW4er3T7EzTvNw5Em/iyq+9UUePkUzRW
 r+cFT4ZXf+PXA4R2eFg==
X-Authority-Analysis: v=2.4 cv=ee0NubEH c=1 sm=1 tr=0 ts=6a3d3542 cx=c_pps
 a=AKOq//PuzOIrVTIF9yBwbA==:117 a=AKOq//PuzOIrVTIF9yBwbA==:17
 a=e416AD1ZbSsA:10 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=kQ-hrUj2-E3RCbRHssb7:22 a=7RYWX5rxfSByPNLylY2M:22
 a=r_1tXGB3AAAA:8 a=C7lNtc9udWNi9DOn6YEA:9 a=QEXdDO2ut3YA:10
 a=t8nPyN_e6usw4ciXM-Pk:22
X-Proofpoint-GUID: _Waomku9iG-GnkieZfxTcdMeDC2gyrxW

We've got some new people stepping up to help out with maintainership of
the imagination driver, so let's take this opportunity to unify the
maintainer list where it appears across multiple files.

There are also some new resources (mailing list, patchwork, IRC) that
didn't previously exist and had not yet been added, so let's do that now
as well.

Signed-off-by: Matt Coster <matt.coster@imgtec.com>
---
Matt Coster (3):
      MAINTAINERS: Update imagination details
      MAINTAINERS: Update imagination maintainers
      dt-bindings: gpu: img,powervr-*: Add maintainer entries

 Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml |  4 +++-
 Documentation/devicetree/bindings/gpu/img,powervr-sgx.yaml   |  4 +++-
 MAINTAINERS                                                  | 10 +++++++---
 3 files changed, 13 insertions(+), 5 deletions(-)
---
base-commit: 60b5fa6edfef867322fce7c8306e5c4b46211be7
change-id: 20260624-maintainer-updates-bfc189254555

