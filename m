Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 780A03F39D0
	for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 08:26:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784795215; cv=none; b=aNAU34oVcg8CWN6OKb6TY23o4XxWiyCXVFpdAr5gIbIhRFtv2ezT5Cl3ozqgCnH4spJ1Av2juLTAkfoJF5kwxsbg2QBepigNL3A69lHPc3DP7833ATdh0xJZZbTSbs9Nr6ygfVSJBwN8gtF2xduqcTFy3+E6F2xvpg4Brp2uXM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784795215; c=relaxed/simple;
	bh=MOchWqzaakPoYge9h/NHI4gz2lgR0ESiXhWS1Ls/prI=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=QhRKV0FlZ0sHKq0/L+KJOMQ5NJQUFd0YTBsZLWKcm+31pL/rTPRMVvYZiRv3n2GVl6oHnNt1PU1Lz9nLTySuFxWxbSYk1yWyPA9A2R0qDiC6/zFwr8MBsV4X+n0KG1xlB8RHy55GSFN/fU3jd+EpHXYzAYHkCE2zKjGxw/dCpVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KLeqsqgP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Z0BVWYLy; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KLeqsqgP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Z0BVWYLy"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66N7Bckr3416133
	for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 08:26:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=MmAcu1RFLDltkgsIHTPtmb
	o1LCphZ7iKioCVFV/glhc=; b=KLeqsqgPrxkbaqPJqsrbaGzdkZ4BgSEw6ZZktM
	tBZqZiCPoBL7KDO5bKOvZ790ezwKOqpmq1zbmpdTuyhomjyklWlwmR0CfONk3Zl/
	i1Qd60lTBTWZKxc19+cpSA0T/suVK45k5i+hYfyd8PD2PvNyKxO41Dek/wJBDxjU
	/x1WePoU+DhpH8ILY+m3tzs/ttpYXE+Ups1BZyf0iPrl9hYfIcpDezGbWIRFOiu3
	sHWWsJ7gRZaTkYFsRunAGhOeA4nAW3m/2F35VoPazKHr36nocSMA1jqRA5WfwK2e
	YSUPVX/l3DKV4R3uH+q+adc/YvrApLse4w/KOhkQMOpHP8Hw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fk6c7j194-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 08:26:48 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38e8e864ef0so936189a91.0
        for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 01:26:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784795208; x=1785400008; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=MmAcu1RFLDltkgsIHTPtmbo1LCphZ7iKioCVFV/glhc=;
        b=Z0BVWYLyO1bLxfgoeUqV6X7IW+zXAo8AHewCvFUSN6oDMnIzADKAlMdUzNK2mAU/GG
         OkldDqYtgsiNuwsfs9gjN0F+ir7Nn5Re5vW3BWt2iJHsYudwZgsMRmuAHGsudWd6myd/
         qDpaklHPSf/3/3mpVFl4p8l6kzYCbeWGpAYiXUlfPd1ATJQMF3b7xo7Wm6B52jVLNqhm
         j+g2XpvMJCvOJbK5ysVXew+xz9EsozRrakENws9fP0AbTg6oZ0Xwi8Yrz3LKpD0GfvJd
         uosWu+VxC9kHCmSxOl1pZ8SDLPvwJeEJQDCvuf4hXsiOkP3PBQdl7XJJS8iYsR3I0nGg
         pJJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784795208; x=1785400008;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=MmAcu1RFLDltkgsIHTPtmbo1LCphZ7iKioCVFV/glhc=;
        b=iY8iHMSNQsNMD1CyRxhOHWona/MPbspoDOlnTfcSwLPDqpGLilyEikTzEae82DIvNm
         +KcmHQ8Bqo7uCYkS3MsB9EIOM59+9ykb7dugIUcU2cBrLsWzl2dq3lUcgF9DONtfo//d
         HplQ5znvSBz3TnET2v8hbuZCFNZtbPtLbcXw+7pIh1RrPlQyU6BK4gmHgAqPqz7mNqZc
         9xd7zDk7k5let1Rf0LPOLfE/aRm6eU8W6Ki02ZK0P9k3xpQ5r+IHRfoarDf3WSmcI/Za
         lQfp+Z8Sl50I6d3n4Ira57YqaRrb/eiROkyn82q3z1db9yfO0MJrwBr5PV7wXT5a6BwY
         B+kw==
X-Forwarded-Encrypted: i=1; AHgh+RruPG4Gkp/zEVMDq5K1g14xJ3ClKPzEB+UTMDdmClK8VE347kzK2AMt2pdl2yIJW2PvErrW5zSKg7KQ@vger.kernel.org
X-Gm-Message-State: AOJu0YzxVCtPAT0DfoNCbxDGvR9RdVHwGeR7FJYNPQCDt093kNMqJYVm
	AfC3j6VW5OMtvhkLO/zuAn0vC27aETT6Um8jZjeCa3UuWEc9gJmJIUCn+QQjD4a1h54TlGrCphB
	AyCja608sAt1nmyO4xUA6r6lZEkbW8rErcXV7mwVpzlZqvyfJVh1WyPWAC4WKFOtz
X-Gm-Gg: AR+sD1298SYfRrCqVFwCDGTQKVmIsMQiPmCFcGSvbJdn3d+iFJpmhNcfktN2IGJ1qNn
	tX2rUa9r4cdYem2SBRvWWHRvDfHdhrkqjluqbuli+HcSyp1vs07P/HB5foX8Sbt+BHEB/M44Sgk
	eHiUFzaAx2gPTqmOGsEL5ivIfnFBLl4oO+xl/LhZx6zXLZIdwvoZWN4Ia+nvSO4VxqL/3p8/agE
	tpfUwcGUbTtaIap2Oij/4V3IhPouWnLyBbEcxCtC3yLWuB9h2mA2xaiLUc+ddq/IvA2L9aSk5lt
	sblVmoyaWhCyRkA9dm8c2ThOjqXK2M3ur8N6php+URNqE6oRAZNfg+O+UgMnbL6q3sP82WjHUef
	2Wu+6VXlFnyUO3yhHeMaZX2c0XM2hG0plFEXNxAwT+FPut/Rngl3FkwY/RqfBZTg=
X-Received: by 2002:a17:90b:39a3:b0:36d:689a:cb27 with SMTP id 98e67ed59e1d1-38ec66113a0mr2059336a91.24.1784795208121;
        Thu, 23 Jul 2026 01:26:48 -0700 (PDT)
X-Received: by 2002:a17:90b:39a3:b0:36d:689a:cb27 with SMTP id 98e67ed59e1d1-38ec66113a0mr2059297a91.24.1784795207654;
        Thu, 23 Jul 2026 01:26:47 -0700 (PDT)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38ea598f67bsm1427988a91.3.2026.07.23.01.26.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 01:26:47 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Subject: [PATCH v5 0/2] Add CoreSight nodes for Qualcomm Shikra SoC
Date: Thu, 23 Jul 2026 16:26:29 +0800
Message-Id: <20260723-add-coresight-nodes-for-shikra-v5-0-fd5494471b36@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADbQYWoC/4WNQQ6CMBBFr0K6dkhbLIor72FYFDrQiUK1g0RDu
 LuVxLWbn7y/eG8RjJGQxSlbRMSZmMKYwOwy0Xo79gjkEgstdSkPWoN1DtoQkan3E4zBIUMXIrC
 na7RguuZo942RhVMiSe4RO3ptgUud2BNPIb633qy+709d/FPPCiRUlS6V6Sq0ypwDc/542lsbh
 iFPI+p1XT/QEUlR0wAAAA==
To: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@arm.com>,
        James Clark <james.clark@linaro.org>, Leo Yan <leo.yan@arm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
        Mao Jinlong <jinlong.mao@oss.qualcomm.com>,
        Jie Gan <jie.gan@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Paul Walmsley <pjw@kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
        Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-arm-msm@vger.kernel.org, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784795201; l=1945;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=MOchWqzaakPoYge9h/NHI4gz2lgR0ESiXhWS1Ls/prI=;
 b=sfxIuZNqm3Bpqd1nqDWD1pzZTWpo3Wb9YX8UlpZzkAQGebha07Vq+0uXOc2Qqr19fpmDtOE0I
 IIZsDUfhuM2CqaglN96K+ht6QraxZpeGEnGwvHxm94Z94mV0S+9pBLd
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-GUID: wgaUVVIC-Utwgj2Yc_LRwPxBx8ZzOJkc
X-Proofpoint-ORIG-GUID: wgaUVVIC-Utwgj2Yc_LRwPxBx8ZzOJkc
X-Authority-Analysis: v=2.4 cv=baZbluPB c=1 sm=1 tr=0 ts=6a61d048 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=8s71dIhK7fIjNjj6m3AA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIzMDA4NCBTYWx0ZWRfX8OzPP8cQjv8t
 VKBFkrtS4deKrGXDwjgungtIBBlkKXn1Vl3MUMEH4BEiuXoUeTaNg6so3o64i40dwfb+5ETQa5d
 E+YDjuvEaTBqY+ZxNncmJqYwZU4KdvI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIzMDA4NCBTYWx0ZWRfX/BeChHI9yHOD
 JhsufLWb4CEXDpcqBjh+aes9cBAG06tvrVbBOfFyOLzBv2qNsnJRlvKmkPHPAzk+4bxNv/RMUhM
 J/9yoY0NOZ6DVtx0o1+XHJ/gxGq3nC2WrSHdC2kizJ3TjN58Ja3+q3RWeS8ZuIMgFZG2yP8PIsr
 9g3S5fUAMqPoWAY5C3ODcbyWRYqSpXakjzLKIwQJRjV39AHfq7S3kVOlF0D2iFX/pDjCXkXgoG0
 Mr2mW/J4S6FWPZ1ZVIEUgLNDD4ZmqcJRY1Tt0rZBkAT9vVpjI49U7+UWc2J3vFnM82ssjuaaF1t
 YnDmN/6tcQ95KQJ7OIhGBHjT+fiBESl5Ph7zXmCHxw+G7ECVTV2USnjNRE2lA6zV+OBbmZUE8t7
 WA/dnn+t4dEYfk4EjRKg9xECfiokLn1qMqKdGPD1hxR/sHD4/Ho13QAROzmIGSWNwKlXAb1VE7J
 K38skbjbnjG8/nUZfJA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-23_02,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 phishscore=0 suspectscore=0
 adultscore=0 impostorscore=0 priorityscore=1501 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607230084

This series adds the CoreSight debug and trace subsystem for the
Qualcomm Shikra SoC.

The first patch adds a fallback compatible for the Shikra CTCU (CoreSight
Trace Control Unit). The CTCU on Shikra shares the same configuration as
the one on SA8775p, so "qcom,shikra-ctcu" falls back to the existing
"qcom,sa8775p-ctcu" compatible.

The second patch adds the DT nodes describing the CoreSight topology on
Shikra, including the funnels, replicators, TMC sinks (ETR/ETF), STM,
per-core ETMs, CTIs, and the TPDM/TPDA trace collection blocks, along
with the CTCU and the dummy source/sink endpoints that model external
trace sources and the EUD sink.

---
Changes in v5:
- fix the incorrect version number: v1->v5
- Link to v4: https://lore.kernel.org/all/20260723-add-coresight-nodes-for-shikra-v1-0-992615f9ea15@oss.qualcomm.com/

Changes in v4:
- fix the wrong subject for the dt-binding patch
- Link to v3: https://lore.kernel.org/all/20260722-add-coresight-nodes-for-shikra-v3-0-1400a3454e9f@oss.qualcomm.com/

Changes in v3:
- add correct subsystem prefix in dt-binding subject.
- Link to v2: https://lore.kernel.org/r/20260715-add-coresight-nodes-for-shikra-v2-0-ebd485e39a51@oss.qualcomm.com

Changes in v2:
- remove MMIO for the ETM devices.
- Link to v1: https://lore.kernel.org/r/20260714-add-coresight-nodes-for-shikra-v1-0-b1cf85962455@oss.qualcomm.com

Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>

---
Jie Gan (2):
      dt-bindings: arm: qcom,coresight-ctcu: Add Shikra
      arm64: dts: qcom: shikra: Add coresight nodes

 .../bindings/arm/qcom,coresight-ctcu.yaml          |    1 +
 arch/arm64/boot/dts/qcom/shikra.dtsi               | 1295 ++++++++++++++++++++
 2 files changed, 1296 insertions(+)
---
base-commit: 290aaf24a551d5a0dce037e3fab30820f9113a10
change-id: 20260722-add-coresight-nodes-for-shikra-5fb8a4b503d1

Best regards,
-- 
Jie Gan <jie.gan@oss.qualcomm.com>

