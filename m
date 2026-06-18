Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7B5A3783BB
	for <devicetree@vger.kernel.org>; Thu, 18 Jun 2026 10:38:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781779109; cv=none; b=OW1F2jBZUgoW1wHJwKZyQNrgqXvEIhnWDU8z5FohUmcarGxTJNCYX3+mT6Qb3dqt0RJmVjIXSZzptOxSdx6uJx7PDVzohDDzK81wijVLKkrBQAHsDjOttgM88eZaVnpM/Omb5XMnWFTVWNw6++eBcAwWp1Gy+rgP+Ek0KrZ4neM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781779109; c=relaxed/simple;
	bh=Rnjh2toTEuLh3Bv3Ch7kHxW+H+n/XiBjaJXvAhL1PY4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=rnHEDeMEPOSSmp5gV3jfqYqWjduw2pXEkXoZMup3fDPQEaWvZ+0gbZKTjCTGGZpO6yG6SrUoUGmvFH+ONOv0p0AyIMRiALWsLiZ/Z4APOeKFzBzDJyF5gfr7P6RRpS2Facz+2PcdYOL/EMlEgrEG0c6BCVki/x5tK0v7wNlKvhE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=o00SfINi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Yb9Ny6Js; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="o00SfINi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Yb9Ny6Js"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65I8G12s1157429
	for <devicetree@vger.kernel.org>; Thu, 18 Jun 2026 10:38:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=MlFgf2VUgcY3rqZBnlNXeS
	a9Ko1kPb4FJhDkZqbSpnw=; b=o00SfINi466YtQiGNhiCIZ8h2OkF2WFjxkYsv4
	JaQMQfmKXrFMKh79l4klpK5o9MNzSUtpULT7YLPQ1esLMoAKXK7fbH5s/nqWJWqj
	Y3qKCi4OPNEX9RsfV7a5dgQsR/eWJdcGo60NieN1OxDakuR15LGLFmL1btsNoqa3
	63hIvdi6eahhqs31xgc6noOgZb1Zq1bz1aOKc9zut/AWrZ41MHWzRie7nCkr2Krk
	+yQqXiuhldDemS2moTFe+6+Iab7ya8nMNroXItL+w9HVLqS+hlW9o0rmt6I1EbdI
	pmi0qF5rKBQcNMsNt85cC+Ff4ATcZ8YcJilhw75CSv3gsCdA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ev19a30ff-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 18 Jun 2026 10:38:26 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-918622c3c7bso226027185a.3
        for <devicetree@vger.kernel.org>; Thu, 18 Jun 2026 03:38:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781779106; x=1782383906; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MlFgf2VUgcY3rqZBnlNXeSa9Ko1kPb4FJhDkZqbSpnw=;
        b=Yb9Ny6Js5algtCF7kDCtundutlpPLZa5qIvL12XIS0FVas6QnGGvXCkQrY7xKKVJi9
         9VTrpn0HKx7L20WvZDZ7ZNnzyJzbjUNXP8JOxznBblUrVql50COCnbM50ovex/i1NGVv
         hv+GdFc171KQ4S6zgWXoCgKRUWWGLrfuNhk9YxHXPB1HJZZE3xa0MvyzM/Pf4RTtrgNz
         AwjsX8pBqqZuamPKxxTau8t64Xxrd/IdPQdk03M0eO3P14efCkN3opCKYpPCdfQgoR35
         6Y3xO2g2NSG/GcRrmtXCF6EDy5bLIArwwTFT1V/PefeqHL4e5H/vYGDvmiF4fU5NcgEw
         DVjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781779106; x=1782383906;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MlFgf2VUgcY3rqZBnlNXeSa9Ko1kPb4FJhDkZqbSpnw=;
        b=IL9kxvdkm2GmVaLe10qpMtG/FAE+Qy6E20m/KOEvbvtUmAM3IsGExsFwqUh2E1DoYV
         9EXNZWM0l+xe1M/HhdDNCEED3zFgB2JqFLrtBmAegUYcVG3TJSvylsMR9OGMk6bOraoC
         Gx8MjnYCLXPPFF02jU03ZzBnq+kcXtLmn2w36MNbj1ffSAVEMk93ac7otZv1TEZhmevy
         MOjPqE0b3QCx37Xf2wokXzFCpYtuhUuGoOeeERR9/1wIvT8p4DfS6V67lZ3EINBFkbLk
         MmvZS2NPXxpdlyiGhrmtTkXaaON2aeN7GDfO9n90T2OA5cWMQwutW15zjeHjA9LPgN9b
         rATA==
X-Forwarded-Encrypted: i=1; AFNElJ+4Pm+P80s2pc7CB9DLc+ULneN+YW9ZisbB4VUUuVz11k5jzaRo7LJZ5fOYffYtYNpSrR5/ZzI134Kn@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0HnSDHV2+DpeyJ+OyQqbNX349pb63wg/6O2sFgFvsOlL582eA
	bxlIi6hjV67cZE7tsKebz3Xh4Y1E/GamE8FVUX8T/lHyrW1fwhZN6P6wIPxwSEBHi3tTBXMl242
	fzPdnMw0MHEeVMe/qhRMdqPOffOVrlixQ4GYmlZ2b8jXr8t7W2Ywx7/IRFBnmxbFR
X-Gm-Gg: Acq92OH2VTUfWelzWF1hCvwNKYHJtiQaurykZefpNNIIwcV6GoG0n8SIyqLXqyVwU7I
	aTBLG/sFe2kczyDBEc+jRbVtR794PzFjowEnRMsDSZbcj10bWq6NMDBy0gctQ/xgNSdfiQHOf/h
	jZ68t95NC/hhHY0QFUJeHJ1q6Ku3qEaro6l/Qk1/a7chm+pKmxIFVp/WV2YG1quu5F20e+TAzx5
	4FpIxyYwwfPZ76Te0dDhZFWGmNEkYul8ZgDFEoLtMbtVK5nxWDLJWHUd/hmoFzSwLhMyyC5pWFz
	sv57GtqcEbkMLOPzsPNaFHjxuZCZ+hhvu4NI0ECH/dcxBA6PRYorFOZup/mKGfCIidPNv048L7k
	mmhZGMAVlRRbAUslCM4Sf1iA40LrHWLwMrar01MstTMilZ7O6W1ijqdYle87OkNFaKXb13yUw6D
	veBHE=
X-Received: by 2002:a05:620a:28ca:b0:912:1:b415 with SMTP id af79cd13be357-91f282a5fdamr455636585a.26.1781779106334;
        Thu, 18 Jun 2026 03:38:26 -0700 (PDT)
X-Received: by 2002:a05:620a:28ca:b0:912:1:b415 with SMTP id af79cd13be357-91f282a5fdamr455632885a.26.1781779105865;
        Thu, 18 Jun 2026 03:38:25 -0700 (PDT)
Received: from WENMLIU-LAB01.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9161a04b472sm2029316185a.37.2026.06.18.03.38.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 03:38:25 -0700 (PDT)
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Subject: [PATCH 0/2] media: i2c: Add OmniVision OG0VA1B camera sensor
 driver
Date: Thu, 18 Jun 2026 18:37:42 +0800
Message-Id: <20260618-og0va1b-v1-0-dda71bb83009@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHbKM2oC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDM0ML3fx0g7JEwyRdU9OkpDTj5MSkJINUJaDqgqLUtMwKsEnRsbW1ANL
 atodZAAAA
X-Change-ID: 20260618-og0va1b-55bbf3cabb0e
To: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781779102; l=1057;
 i=wenmeng.liu@oss.qualcomm.com; s=20250925; h=from:subject:message-id;
 bh=Rnjh2toTEuLh3Bv3Ch7kHxW+H+n/XiBjaJXvAhL1PY4=;
 b=s0H63bG+QSu683GNKV14NJU8bBVH+TUUZBaseFtkQ6gUEXOWPLMnscn4GycOseCD+IjIiEEcs
 +NI9inDYCawD4gdPkKRFFMbkwY3FDjr2It66EwAxCMiePUlGOnZxoAV
X-Developer-Key: i=wenmeng.liu@oss.qualcomm.com; a=ed25519;
 pk=fQJjf9C3jGDjE1zj2kO3NQLTbQEaZObVcXAzx5WLPX0=
X-Authority-Analysis: v=2.4 cv=YbmNIQRf c=1 sm=1 tr=0 ts=6a33caa2 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=4V15NcdV0gEvtUevzWYA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE4MDA5OSBTYWx0ZWRfX/U9XkZcuF8dH
 jyVRZ/IH/cZSHQ+SKYfF0k97eahE8TSK3PTq+/8LSgSHDx874AcWZddkLVEgBybgSn/Idr3IVbQ
 Qi5KzzzauKVjbmaCpK7coOKsg2F59+g=
X-Proofpoint-GUID: 3rbLt6fpV1I1AUC3OmwD7k5YmoVU-oSr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE4MDA5OSBTYWx0ZWRfX9FljoajjfRyt
 PznnO9IVOCSEzItMFXiqBHb8pYrDdKiy5TZ12E0h0fmEvIZJsWq0n9uB7dkqMBa51aZ7iqXBCKK
 WVB435wf8XBzOh4kXg24wav2RBMMsza8PUUbBR0oNkmGhaCod9YE3PVrRH3jOwoOIJZ4o9q1Hkl
 rxRqLFQtK3ns1Weri1/AZstsOrTXKRK6hZ9zoBhzGeazC6h9NOZckbmKcerFpPlAAjOJ8aCyJgB
 eynBy17/Uf7tiAvqO/B6nwy+UqoFqfl2zUy7P/p99FFwQUWNWp+w5XDiCZhbynXHlV4bdynBjI7
 CkpqcYEvZC+hjhexC8YZHkKnDQ9k1Az88ok1HL4yXuGgpe6bcdP4C2GJtu8qVzBbbMhGMHOy8t4
 UtcAu2o0ax7D3SCrziIemV1/77pubkIPwF79wIZK7Gs8d0g/ZQYwVaX0guexSCPtbTmjIiJlnjK
 JMRd3nvhsEMOIC3pJaA==
X-Proofpoint-ORIG-GUID: 3rbLt6fpV1I1AUC3OmwD7k5YmoVU-oSr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-18_01,2026-06-17_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 clxscore=1015 impostorscore=0 spamscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606180099

Add OmniVision OG0VA1B driver support. The OmniVision OG0VA1B is a
1/10-inch monochrome CMOS VGA image sensor. It outputs 10-bit raw (Y10)
frames at up to 640x480 resolution over a single-lane MIPI CSI-2
interface and is controlled via an I2C-compatible SCCB bus.

This driver has been verified on the Purwa EVK.

Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
---
Wenmeng Liu (2):
      dt-bindings: media: i2c: Add OmniVision OG0VA1B
      media: i2c: og0va1b: Add OmniVision OG0VA1B camera sensor

 .../bindings/media/i2c/ovti,og0va1b.yaml           | 104 +++
 MAINTAINERS                                        |   7 +
 drivers/media/i2c/Kconfig                          |  10 +
 drivers/media/i2c/Makefile                         |   1 +
 drivers/media/i2c/og0va1b.c                        | 867 +++++++++++++++++++++
 5 files changed, 989 insertions(+)
---
base-commit: 4fa3f5fabb30bf00d7475d5a33459ea83d639bf9
change-id: 20260618-og0va1b-55bbf3cabb0e

Best regards,
-- 
Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>

