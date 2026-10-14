Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEEE2541E62
	for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 15:56:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791993387; cv=none; b=DidNTReD1QaKZHQGGSd4tPRAKQwQhbwLjrxeaNRQEi/ybIg25Rv9aP2f0qBQCTS4QsBhpqWxRNlPyYG5HPcscZYnlsYtL5JVBATOvZeq82aIRJH13NbVY37saA6J8IKtM8XHqrUj2Oa1B08VoBdajgT4Rv9xgBxmKUswLNXBj/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791993387; c=relaxed/simple;
	bh=QcP01yeYANmnSOpCckxi4SHgUGs/ns1aGF7CqSeJ3UI=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=EsQ6wVHXwHat5tJXGt4vXjruo8ZePK5m0pwBfHAWTh8TdNKo3IV30GKGpMOdrsoUL0M4sX+l/yhSMATBmkpZ75cKVaV/Z7UAIG2GMg/npDuB6OiuenKFmYRCNpW2/EnRVNq0hb0Wkjs9FdEwxs4jvjfVIvQ3oH4D+elySaS70rA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VvjzfRk5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=URkttb1u; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VvjzfRk5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="URkttb1u"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69EEbJE53642833
	for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 15:56:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=nRN5mwPXK5jua7t9LUgDQO
	MkK+R4yZYyk715f9CNhO0=; b=VvjzfRk5J6Z9CkwIJwodw+ihTsee+ukv63IqOX
	Q6WCjbh4ntyQsNl40UV0YtscS8XbHAdRr1bSL5Lwkxd3jYJQPOdWAsMF+a+byAjn
	35O78uSyLMmGd+S3EukL4LU1QVoUfA12dDj4tlsGrsIO+mHvy2h/ZVFhFiSukeTS
	/5Acr0uNCgHGOGLKOD4cwQwAiEsEXn1PgSImFhcWwDYowpNtjbqbzh7eX6aqwZqw
	8vgCAyuoLnXxJdI04NgbxrW+XRC6Gke2cjuUNaC8UNVrSr9A3/BXMS+HiAmXJ7uz
	XqJT2pK4mL6e28eD/AIb7o8SWS8IbWXweKZyKtMVnlRUP8gQ==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ha470ab3w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 15:56:24 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cd5e41413e5so3807747a12.2
        for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 08:56:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791993383; x=1792598183; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=nRN5mwPXK5jua7t9LUgDQOMkK+R4yZYyk715f9CNhO0=;
        b=URkttb1ut8eimOCDpWhwtTxTZstoPc9C3UmmbNqVbdM5lQvNR+Ij6iNk03ZQ/EQlQE
         Lz6X2VvCumzJJryuNWf5IkiOT5rqJ/9JtWDukWYqMFw/mzgtADKrcWELI5Na1bd1XZyg
         KoB5K0moxBJcCqRjwgyPVvci2nxxDOzTU07Zlb7gbTxAuo0c12qfJjykXEqDaObLZwd0
         BPyGSWt4+qYM61YHSrxGKbRC1vSKVgfb/HnO6DPDnExY6f5wLLc6ZmEBxilagIJ346DX
         oAS0wrZaVlkl7s/hwjbd+cIJjQsZCy275jRO27mfJW58sfkaFPJaRZMfCK/K1Z+l7WT6
         XDqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791993383; x=1792598183;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=nRN5mwPXK5jua7t9LUgDQOMkK+R4yZYyk715f9CNhO0=;
        b=Nzufb5T48duNaKTEtyCVMU+SVV6SlCgPS36LkjIAtSwiQMN68GTrZOTT9fIKvw6ynl
         jJMm71vTXVnWRiD/OHnv7gmGE5SDoAnWUBu/7jqtvAu9aGXS8vYBogQ9IZts6+1KZGET
         lkfDIH4wfp7ezcTT6roSqpGijhC/OP8lCp4PboaIBRFi2/uTyAnrFrObPoInZYRQmGEe
         7PYsKGjqczeqkJXX3JCIDnlSyrgcZle8Z5gJCfBaEZeDHrW9sVmaWwRTlqoCQyz8SPuM
         kphSEEtVJDD8Asa4LbMZLRA4N5i1ct9+wfl3yGHh7POm7cbyrjbTDiIAb8crZFSlQQv5
         b9jQ==
X-Forwarded-Encrypted: i=1; AKwUvBxqUVGaqB6RCDxrRsAjC+sbWPwWqmKjdxYcwU14cfO8+ieQUviyYot0Dlw8avQjE6J/K4bGRioQTyiV@vger.kernel.org
X-Gm-Message-State: AFq9FYLStSgXRLZezLtPp+3hJSX1QO4uudNqz+L7pk3PcTS9uzSVbyPi
	BoxISQwKQlD4AErf6apbQxdF7UaBh2h2/iw9pipxqZJewOQPepbN4w10KBWn5Yn85bpkUJXIop4
	OhDvb1rOkLLXJBkETQlqMl6CEeXC1v+7oCM3erS+RnqFmMp7ClxIgD7XyYmTKrE9L6O3QGDBf
X-Gm-Gg: AYBFou2JFjK6pHy41eydwfRJKVlfL1jkOPfEDgUTunyvrdD5m7wmr35f0uk2KXa65Nz
	RpPwu2SpmV5H/Ns53JaWw+GpF1SlLhvahkNmgKdOUlL4nlEx8WUfo4LaPrwUsqrt2joncdnG9m3
	yIsdDpDXWhDafxTA7oczCDJQPXE2ryApWOrjw879+2+LQmuAWCpa4VTzaSJFa4t1qWSnRQ3KHZu
	p+EfhQctiRk7b2V+7L3DjzAJt797+jJYdC+7C2W7PQV8M4aP6IuHEnaBCfn11oiHfOMSdnWP76M
	n8P+I33y4w0nVj4M63WqnEIO/q26pgvj2AmmQfxtVlSZQ80vThb5WwJ8J60+FRpzDkwlzusz+69
	eQ/jePok7GJnvd9xgnhAtLMg2hpXvi1BYOA==
X-Received: by 2002:a17:902:e847:b0:2e5:e1e2:21fb with SMTP id d9443c01a7336-2e842ac8aa0mr158858155ad.37.1791993383385;
        Wed, 14 Oct 2026 08:56:23 -0700 (PDT)
X-Received: by 2002:a17:902:e847:b0:2e5:e1e2:21fb with SMTP id d9443c01a7336-2e842ac8aa0mr158857925ad.37.1791993382906;
        Wed, 14 Oct 2026 08:56:22 -0700 (PDT)
Received: from hu-faiyazm-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e8422e14f6sm71961375ad.69.2026.10.14.08.56.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 08:56:22 -0700 (PDT)
From: Faiyaz Mohammed <faiyaz.mohammed@oss.qualcomm.com>
Subject: [PATCH 0/4] edac: qcom: add DDR DRAM ECC reporting for Shikra
 (QCM2390)
Date: Wed, 14 Oct 2026 21:26:15 +0530
Message-Id: <20261014-master-v1-0-aba3cfcfbac9@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAB+mz2oC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDCyMT3dzE4pLUIt1EM2MLwyTzNFPjtDQloOKCotS0zAqwQdGxEH5xaVJ
 WanIJSLdSbS0AIWU//WoAAAA=
X-Change-ID: 20260824-master-a6381b7f53ff
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Conor Dooley <conor@kernel.org>, Jonathan Cameron <jic23@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Borislav Petkov <bp@alien8.de>, Tony Luck <tony.luck@intel.com>,
        Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-edac@vger.kernel.org,
        Faiyaz Mohammed <faiyaz.mohammed@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDA2MyBTYWx0ZWRfX04U8IAw3yJxt
 4ewYkVGiLTjfHMDNgeM0nUOC9m/sWOZR94Oos+OZHcalUa2sgOodStDukrTz19xYP39rdBeN6sO
 zl9l9iX0lsomdisMmJqzfa9s2ZXINebgQ2S07TiK7701BOWebA+FQj5wH/ImIk3T/QITcNdHhjV
 a10FJZZv5bHthCtWJ2Ws06qqipidkGmTfEvCeNXl39zvbBRICnTyw4jKNgwt2sqaSggj5p5Tq7q
 vx2NYUHns/2d1r/R40CxImFLRukkSXgIP60fSh4L1251p9fVU0D++g949zT+MOD87UNlD570Cnp
 ZgdlOo0MCNumrj48Y86TpoNkmXIfqGIQJMUQ4Ak8zgKGrC3WQAs9blao+nrsy0Bg7UQP5llHLP3
 FOy7ye1s0j8TT192wT25fwuw2cv37O0EhIPWRr5+eFihS5kNfFAn+54zEMnfbduGsDLsGAjmavX
 ly/nG59H1xljlgVO/qw==
X-Proofpoint-GUID: pd7VdGUmeUEVBKmvN8VFb9utoi3z7J15
X-Authority-Analysis: v=2.4 cv=P6avFSAu c=1 sm=1 tr=0 ts=6acfa628 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=28_99TRhucPTTWWXKPwA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-ORIG-GUID: pd7VdGUmeUEVBKmvN8VFb9utoi3z7J15
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDA2MyBTYWx0ZWRfX3a4YnvZmVXZA
 dPvDW0HmWuvrqNz3GwFOdFPk+XU/wX1a7dY+9ib0sqMF0KdFuWj+wODij6Lk5FgGQh7yyG5L6Hq
 9z9E2PPWW/cP9VYJePdhwIdWzwJYOz4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 suspectscore=0 clxscore=1011 impostorscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610140063

Add DDR DRAM ECC reporting for QCM2390 (Shikra) via the LLCC EDAC
driver. The LCP/SRP block between the LLCC and DDR PHY signals CE/UE
errors on a dedicated interrupt separate from the TRP/DRP cache ECC
path.

Patch 1 updates the DT binding to allow an optional second interrupt,
adds interrupt-names ("llcc-ecc", "llcc-lcp-ecc"), and enforces both
are present for qcom,shikra-llcc.

Patch 2 adds LCP/SRP register offsets to struct llcc_edac_reg_offset,
populates them for QCM2390, and adds lcp_irq to struct llcc_drv_data.

Patch 3 adds qcom_llcc_lcp_setup() to initialise the LCP block and
llcc_lcp_ecc_irq_handler() to report per-bank CE/UE errors via EDAC.

Patch 4 adds the second interrupt entry and interrupt-names to the
Shikra LLCC DT node.

Signed-off-by: Faiyaz Mohammed <faiyaz.mohammed@oss.qualcomm.com>
---
Faiyaz Mohammed (4):
      dt-bindings: cache: qcom,llcc: allow optional second interrupt for LCP/SRP ECC
      soc: qcom: llcc: add LCP/SRP DDR DRAM ECC register offsets
      edac: qcom: add LCP/SRP DDR DRAM ECC support for Shikra
      arm64: dts: qcom: shikra: add LCP/SRP ECC interrupt to LLCC node

 .../devicetree/bindings/cache/qcom,llcc.yaml       |  26 +++-
 arch/arm64/boot/dts/qcom/shikra.dtsi               |   4 +-
 drivers/edac/qcom_edac.c                           | 147 +++++++++++++++++++++
 drivers/soc/qcom/llcc-qcom.c                       |  45 ++++++-
 include/linux/soc/qcom/llcc-qcom.h                 |  13 ++
 5 files changed, 231 insertions(+), 4 deletions(-)
---
base-commit: cbf6c6b201561342d673223d1e59ef771c7a9dbf
change-id: 20260824-master-a6381b7f53ff

Best regards,
--  
Faiyaz Mohammed <faiyaz.mohammed@oss.qualcomm.com>

