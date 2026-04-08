Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCF073B5835
	for <devicetree@vger.kernel.org>; Wed,  8 Apr 2026 10:03:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775642635; cv=none; b=TVL5gTSwnGt+yZW5R1E9A7tHvOvHN6gh+lQHpE3Qrg980VuBQPTqWpACNJmCkjMLU4zMrw0vJLhmChwwOpReE4mF4Eq1hUgsCeFu6eOF2AQBlfI7Ki0ehqjvyRyAUU0AMyTLQgmBPIMgmsa5QmgRLc7wCFgP9XEdiV/HB1aCqHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775642635; c=relaxed/simple;
	bh=k94qEoqP6LeaqMjZ56JkwcDL9Caxb++/1ywGR2aNrcE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=KO/MfFgMSbjPbMl0dn6OJ5kVvjpyOdV7i9lU8lPzCicfjVrU9JJ56X06qKiea+xYKeL1AkQefkQNF1UNkssXQIKMsTUqzOyvyP5Ngt+jYn+zhXFxZUx1FBESOb8PkLKZ/kgkyzwgWijD8gHgXVBQywAalQ5T6wejlYow2dWthOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=E5a+CiVG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WsAW3peb; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="E5a+CiVG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WsAW3peb"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63862rAj1314466
	for <devicetree@vger.kernel.org>; Wed, 8 Apr 2026 10:03:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=7S+jIsI8IolI8S/0NzS+SU
	gTDKQIENCfMEWeyQ17RZs=; b=E5a+CiVGxDzyfBjpQZeW+h8coO6mDpkw3C4VLr
	Il7IruwRRyGVifBF2tWEIh0RITVBUh7wynkqqBDiu0qvVthDXizphb40Z0fXg7l1
	4ePD+LWpuMLVmio17YTK1QVRNMPOyHYbMWFwoed9dZ4dSV6Mg9UfbYAstBHh0LrC
	ZcRfFoLo3Ctd4aDMK0HXfG7wz4TO1bUEzKb0WISeGCY/qyVcs8KZiv5bhjTW+QUi
	MjqFoHQ/Aq+Lu9LM0xUn0dFnnR/PTKUZzQwF1+yIbkQFbo36+N0foO3Q1elT13BM
	ppen4soBoDXUil18hOzE/8lDj63ocv022uBlYiZUp66jejBA==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dd8d6jmhx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 08 Apr 2026 10:03:43 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c76fe944e6fso2183399a12.3
        for <devicetree@vger.kernel.org>; Wed, 08 Apr 2026 03:03:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775642623; x=1776247423; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7S+jIsI8IolI8S/0NzS+SUgTDKQIENCfMEWeyQ17RZs=;
        b=WsAW3pebq2PHl8lUA6Rep2AMMJvNex+3AhplJiFVEOWNTE518MRge/hAYnS0kzzpHw
         4/L98bJ1SlkJaxmoY9SRyNY56161x1feGBIK62eXzHepN09ivBZAeVUzO26vvCuDOv2/
         tW6m2ImbtU+mp9x3FGqDUXMfRw9rmBsiICHlr2NmNyhhwD3nPpsPEr4SJ8uTlT1PsgGe
         5dOYB7N3Xy9XiUaZWjfPb0Zau+76i29KerJ9+hCorJaJTnxJKkHw+dlfZZ24skXyR0aE
         820mGIp4oKs8By7Qs7JeNxFEy3gAYLPxzAe0jH8JR3y7utLOpyzPqQXlZB2Q3fgmgrEN
         Y+ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775642623; x=1776247423;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7S+jIsI8IolI8S/0NzS+SUgTDKQIENCfMEWeyQ17RZs=;
        b=WcXOF1xSNr8LMXFX5OlY1abp/gQnRT6HLmsfROvQYzm6GrbCXsYxMHcGzWmc8G44gA
         Pi6PDMwfPSLmKvWCxpXR3TY5kskhIzJID6SklJ1o76r1M9/8cfQ/5X1wzIveDh6PevMU
         vcqJ4k+uBjWsHBi5/8f49mZ+8x8Jc/+6C8dqYGYiWrlM2K1Eh3QhFPx7WtK0tmy/XlyN
         HZudYZI9/72POiyhOmz+lMxsw/QNGJz5AWT+9tWbBzjfL3g9z42NoMRPD1v4ygvHorPZ
         UVubkqa8zkjEBhgcvIJvZurFVHAY3u+QQ4gzYpC/eMxqarYRUlNRGDP1VJkdrMXS3mLc
         i0Tg==
X-Forwarded-Encrypted: i=1; AJvYcCUSa89DCbTL7fgVH+wgcIPKxUHjsTvOkCtIHGAh7fZktnJAEXR4ir0NGZr7wrKYa2cchCRij9QDgBUK@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6V98BibxVCzJ/S6gcE/fVAqpoqOLObq6wvdSxfJvP4lDSaG7k
	8LU4u9klXWk79ei2e7H4tR/k9piTxv1D/b4IKNbXN7mwLOzu4Jkkr35zIN2NoXVIpccwQngF3Ef
	PqRuPZ7omF/rTxLsYIpQE+FYj1TvpmqXTauozTp93mX+jX/GeK2sdwufT/4Armq9q
X-Gm-Gg: AeBDies73/V42h8C6jyBfBgoZWilPadD058O7qjcjTO2/G1895G68ai+BGyZULXiXxh
	ZyKTPEx87hWIyJ9dE4Hn7DQdY7deogWjVmngpeA+3/6TgUbc0/F/Hwx3FH1BnMc4Rdc3EhUL0ZZ
	9vBezTMZImmJjEM+cyDdUUFqvw7T7zUlx7EY3Gr5FFMp2eqZrPpqgb4HxLXsXJ9Ve9hTuL8HACy
	PhMbtIb+2g8xWQXinh5jgYfplAd8pJBLcDy74tP4iJuXIjj/zdOsuuSj9RRKAmXmqc+x1lP6Ni2
	po/9VYYP6coiJqfYAmMBxFDQ6gPhhd/C6PHnjynIR95Y/Y0Av9YaRPeSXSCvt1JJdM13CX9LzbJ
	IsNYdgW8K5wM5fI2bb9cTntAyzjfg+PJZ5+dCexF32rjj3YSKUThCNNZy
X-Received: by 2002:a05:6a00:3696:b0:827:2a07:231d with SMTP id d2e1a72fcca58-82d0da77231mr19594615b3a.17.1775642623071;
        Wed, 08 Apr 2026 03:03:43 -0700 (PDT)
X-Received: by 2002:a05:6a00:3696:b0:827:2a07:231d with SMTP id d2e1a72fcca58-82d0da77231mr19594542b3a.17.1775642622439;
        Wed, 08 Apr 2026 03:03:42 -0700 (PDT)
Received: from hu-vjitta-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82cf9b5fb22sm25805584b3a.26.2026.04.08.03.03.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Apr 2026 03:03:42 -0700 (PDT)
From: Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>
Subject: [PATCH v13 0/3] of: parsing of multi #{iommu,msi}-cells in maps
Date: Wed, 08 Apr 2026 15:33:24 +0530
Message-Id: <20260408-parse_iommu_cells-v13-0-fa921e92661b@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOwn1mkC/33PQY7CMAwF0KugrCcoTkinnRX3QAi5jgORCmUSq
 ECod8ew6qKwsfQt+1l+qMI5cVF/i4fKPKSS+pMEcD8LRQc87VmnIA1lja2MM6DPmAvvUn88Xnf
 EXVc0kHO/VY3ctqhk75w5ptsb3WwlH1K59Pn+vjE0r+43bWi00asALTETeYZ1X8ry/4odydRSi
 nqhA5ip1MxJYISiykZC9Aih/kTBhLJ+lgKhIHJET4ZrS58oO6Hc7H9ghQpMMTjjmbGZocZxfAK
 rbA/VmwEAAA==
X-Change-ID: 20260301-parse_iommu_cells-1c33768aebba
To: Nipun Gupta <nipun.gupta@amd.com>, Nikhil Agarwal <nikhil.agarwal@amd.com>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Marc Zyngier <maz@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Thomas Gleixner <tglx@kernel.org>,
        Saravana Kannan <saravanak@kernel.org>,
        Richard Zhu <hongxing.zhu@nxp.com>,
        Lucas Stach <l.stach@pengutronix.de>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, Juergen Gross <jgross@suse.com>,
        Stefano Stabellini <sstabellini@kernel.org>,
        Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Prakash Gupta <prakash.gupta@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Cc: linux-kernel@vger.kernel.org, iommu@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-pci@vger.kernel.org, imx@lists.linux.dev,
        xen-devel@lists.xenproject.org, linux-arm-msm@vger.kernel.org,
        Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>,
        Charan Teja Kalla <charan.kalla@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775642611; l=6465;
 i=vijayanand.jitta@oss.qualcomm.com; s=20260301; h=from:subject:message-id;
 bh=k94qEoqP6LeaqMjZ56JkwcDL9Caxb++/1ywGR2aNrcE=;
 b=Fa93m6jMAv59XO0RGhV08H7u/lbeMgEu+VO89mYeYe9+udo03+OfW5l6aRjt+/+cujOgn9u6U
 /txq4POfFP1D4nQK6IieIAafLv29dRyBbPOkaAXwmZAh5zFPlwXVp/j
X-Developer-Key: i=vijayanand.jitta@oss.qualcomm.com; a=ed25519;
 pk=Lpi7Cs3wHe8KZtqvyci7FTOLzsKpEHKGCaPNZw+1zRI=
X-Proofpoint-ORIG-GUID: J0KyPYwpGU5YracYFhvFJFGcyHCUJVWj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA4MDA5MSBTYWx0ZWRfXwo4NVv7A84Pd
 A8Gc98K14qbGdWTVc6aW25yFH46ZQ/kvlzee8RfTJQCcUHGZhdrQovzFW9saOO56j2RmCDfp46y
 zcundO20Ni/cAbOF1hb8l7nh6g06/uiVSUwckvFinghdfTdXmKKYbzEz497Z9zXgCOWQ0ifGF6P
 o3Y1GVQZpVI9YWn8QVVGy3EmmMRMH1qGjz3gX4bBI7N4Za3yDwmduBdAOOJ1d4mFuktIlBLv5OP
 MEJaA/rDfehvNbuPVOi83w4htIDEKN5nNTzx8WgvhGUbC4UgXR+PgVhEAVGc/VfgLFgJ2nYn9LR
 V3tK0zlVGenPwmoRUM8Oq7SDtvnmN3Ezi1St74pmfrDcGSepXUfnRIc+LIuIo76G3gSXTWCbBB+
 ChPlUOp+iC2gd9n+ge1OSdjefQHn6qEYvnAhz+WgfF+wlQDQQ3k63VRoc0d0MF4fncQvi2JT4JT
 5j7tsHS6nYpYJ27PtzA==
X-Authority-Analysis: v=2.4 cv=GN041ONK c=1 sm=1 tr=0 ts=69d627ff cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=NEAV23lmAAAA:8 a=bC-a23v3AAAA:8
 a=EUspDBNiAAAA:8 a=qMDWySynzQg1s02BiloA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22 a=TjNXssC_j7lpFel5tvFf:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-GUID: J0KyPYwpGU5YracYFhvFJFGcyHCUJVWj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-08_03,2026-04-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 phishscore=0 suspectscore=0
 clxscore=1015 spamscore=0 adultscore=0 bulkscore=0 impostorscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604080091

So far our parsing of {iommu,msi}-map properties has always blindly
assumed that the output specifiers will always have exactly 1 cell.
This typically does happen to be the case, but is not actually enforced
(and the PCI msi-map binding even explicitly states support for 0 or 1
cells) - as a result we've now ended up with dodgy DTs out in the field
which depend on this behaviour to map a 1-cell specifier for a 2-cell
provider, despite that being bogus per the bindings themselves.

Since there is some potential use[1] in being able to map at least
single input IDs to multi-cell output specifiers (and properly support
0-cell outputs as well), add support for properly parsing and using the
target nodes' #cells values, albeit with the unfortunate complication of
still having to work around expectations of the old behaviour too.
							-- Robin.

Unlike single #{}-cell, it is complex to establish a linear relation
between input 'id' and output specifier for multi-cell properties, thus
it is always expected that len never going to be > 1. 

These changes have been tested on QEMU for the arm64 architecture.

Since, this would also need update in dt-schema, raised PR[2] for the
same.

[1] https://lore.kernel.org/all/20250627-video_cb-v3-0-51e18c0ffbce@quicinc.com/
[2] PR for iommu-map dtschema: https://github.com/devicetree-org/dt-schema/pull/184

Robin,

Could this series be pulled into an immutable branch/tag, if it doesn't make
it into the v7.1 merge window? There are client changes dependent on it,
So it would help to get them moving forward rather than waiting another
cycle.

Thanks,
Vijay

V13:
  - Fix bad_map handling in of_map_id(): 'cells' is re-initialized to 0
    on each loop iteration, so the !bad_map guard was insufficient, cells
    stayed 0 for all entries after the first. Fix by explicitly setting
    cells=1 when bad_map is true on every iteration.
  - Collected Acked-by from Frank Li.

  Link to v12:
  https://patch.msgid.link/20260331-parse_iommu_cells-v12-0-decfd305eea9@oss.qualcomm.com

V12:
  - Call of_node_put() unconditionally in imx_pcie_add_lut_by_rid()
    thereby addressing comments from Bjorn Helgaas.

  Link to v11:
  https://lore.kernel.org/r/20260325-parse_iommu_cells-v11-0-1fefa5c0e82c@oss.qualcomm.com

V11:
  - Added explicit filter_np parameter to of_map_id() and of_map_msi_id()
    per Dmitry Baryshkov's review feedback, making the filter explicit
    instead of overloading arg->np as both input filter and output parameter.
  - Removed of_node_put() from inside of_map_id(), making the caller responsible
    for reference management. Updated of_msi_xlate() to properly handle reference counting.
  - Collected ACKed by tags, and fixed minor typos.
  Link to v10:
  https://lore.kernel.org/r/20260309-parse_iommu_cells-v10-0-c62fcaa5a1d8@oss.qualcomm.com

V10:
  - Move of_map_iommu_id()/of_map_msi_id() from include/linux/of.h to
    drivers/of/base.c as out-of-line helpers per feedback from Marc Zyngier
    and Rob Herring.
  - Add kernel-doc to document both helpers for discoverability and
    usage clarity.
  - Fix of_map_msi_id() wrapper and all its callers (cdx_msi.c,
    irq-gic-its-msi-parent.c, drivers/of/irq.c) to correctly use the new
    struct of_phandle_args-based API with proper of_node_put() handling
    as per feeback from Dmitry.
  Link to v9:
  https://lore.kernel.org/r/20260301-parse_iommu_cells-v9-0-4d1bceecc5e1@oss.qualcomm.com

V9:
  - Updated TO/CC list based on feedback to include all relevant
    maintainers.
  - No functional changes to the patches themselves.

  Link to V8:
  https://lore.kernel.org/all/20260226074245.3098486-1-vijayanand.jitta@oss.qualcomm.com/

V8:
  - Removed mentions of of_map_args from commit message to match code.

  Link to V7:
  https://lore.kernel.org/all/20260210101157.2145113-1-vijayanand.jitta@oss.qualcomm.com/

V7:
  - Removed of_map_id_args structure and replaced it with
    of_phandle_args as suggested by Dmitry.

  Link to V6:
  https://lore.kernel.org/all/20260121055400.937856-1-vijayanand.jitta@oss.qualcomm.com/

V6:
  - Fixed build error reported by kernel test bot.

  Link to V5:
  https://lore.kernel.org/all/20260118181125.1436036-1-vijayanand.jitta@oss.qualcomm.com/

V5:
  - Fixed Build Warnings.
  - Raised PR for iommu-map dtschema: https://github.com/devicetree-org/dt-schema/pull/184

  Link to V4:
  https://lore.kernel.org/all/20251231114257.2382820-1-vijayanand.jitta@oss.qualcomm.com/

V4:
  - Added Reviewed-by tag.
  - Resolved warnings reported by kernel test bot, minor code
    reorganization.

  Link to V3:
  https://lore.kernel.org/all/20251221213602.2413124-1-vijayanand.jitta@oss.qualcomm.com/

V3:
  - Added Reviewed-by tag.
  - Updated of_map_id_args struct as a wrapper to of_phandle_args and
    added comment description as suggested by Rob Herring.

  Link to V2:
  https://lore.kernel.org/all/20251204095530.8627-1-vijayanand.jitta@oss.qualcomm.com/

V2:
  - Incorporated the patches from Robin that does the clean implementation.
  - Dropped the patches the were adding multi-map support from this series
    as suggested.

V1:
 https://lore.kernel.org/all/cover.1762235099.git.charan.kalla@oss.qualcomm.com/

RFC:
 https://lore.kernel.org/all/20250928171718.436440-1-charan.kalla@oss.qualcomm.com/#r

Signed-off-by: Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>
---
---
Charan Teja Kalla (1):
      of: Factor arguments passed to of_map_id() into a struct

Robin Murphy (2):
      of: Add convenience wrappers for of_map_id()
      of: Respect #{iommu,msi}-cells in maps

 drivers/cdx/cdx_msi.c                    |   8 +-
 drivers/iommu/of_iommu.c                 |   6 +-
 drivers/irqchip/irq-gic-its-msi-parent.c |  11 +-
 drivers/of/base.c                        | 215 ++++++++++++++++++++++++-------
 drivers/of/irq.c                         |  11 +-
 drivers/pci/controller/dwc/pci-imx6.c    |  34 +++--
 drivers/pci/controller/pcie-apple.c      |   6 +-
 drivers/xen/grant-dma-ops.c              |   5 +-
 include/linux/of.h                       |  30 ++++-
 9 files changed, 242 insertions(+), 84 deletions(-)
---
base-commit: 3fa5e5702a82d259897bd7e209469bc06368bf31
change-id: 20260301-parse_iommu_cells-1c33768aebba

Best regards,
--  
Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>

