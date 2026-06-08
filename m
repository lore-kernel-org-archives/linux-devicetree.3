Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1C6119F12D
	for <devicetree@vger.kernel.org>; Mon,  8 Jun 2026 04:16:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780892220; cv=none; b=ApO+PLZWGC0BjcAlmbFAxcTPrhX5gBiTlL5gFw0JZqQSLwNBnAVlYHmAZ50q6YeGl+ShEqvI5vyHI0AFfksGoC+mYub5nzPSeCI+xQi9CjEuJ+1NBi9qBWNzf0TPsMi8pPZqnlF7SZjVN22zLF5+Y3Q7bAh8XS+n1gjbCABmrNM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780892220; c=relaxed/simple;
	bh=Q0O53Qi5yC/SbXyECjjdsrVdZPX/nW7yZV+7MOQfU74=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=RLeP/IBX2oRRBlFAtYcti7BkQrE0LccfbEnBB7zJx2VHHW+QYzr2k6zspML7odyvfBbBw/TOXkVF7GBdnrD/G0DvWCvPQqYH/S6RXacc5QR/Vwu2bWVvChdDo/6y8WbW15Ugy0yfhLB52DjLH0fEPypbGrPhgNyRv8kEb2nXVGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oT7LhDb/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JtwXsVoY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oT7LhDb/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JtwXsVoY"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6580G8QX2024477
	for <devicetree@vger.kernel.org>; Mon, 8 Jun 2026 04:16:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=AAqES12gs3yn2XZq7PRpgLohj1tMPki/ZHQ
	t7fhpYl8=; b=oT7LhDb/CrJk7iaop/ZeIu6BX5nuseInQFQN8dR3eeEaoFl8KXK
	iPGOrs1sqO2ktvUyQ0uQSfQrKmYJb2fsvNopKDB6AR2qUqvFbLxXMIpkZS86AAju
	tm3+O2H4VfweD3+nzOUIimNIEom/gJrDc7vf0HzWmVv/cO2akEJ9/qWAOoLa6Z6J
	XtNS6Eej6VMX8amLscUKFanpQo2SKxwwGwtiO9C8uFcygtHF2/HWY2QkLjFlosmc
	iS9GsJh6VyqWPPHP6bCSF4P2D90qJpmbhU8z89oVALUB3ZR27AY4PRbmions+3z2
	NyKh87rEitXfLZJ+edbYyjfXo5WPFZnwNAw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4embmrdtjq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 08 Jun 2026 04:16:57 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2bf30576aa3so26691785ad.3
        for <devicetree@vger.kernel.org>; Sun, 07 Jun 2026 21:16:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780892217; x=1781497017; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=AAqES12gs3yn2XZq7PRpgLohj1tMPki/ZHQt7fhpYl8=;
        b=JtwXsVoY9FHoiJnFgILaLaZZXxd7T02TMb8aJcBWEWD6vMDHGuaJ0a/ej+hYciD9xt
         pZ20fF8X8sqTx2K/Y9ZyR5TwUtT8pr0ZiKA8415gNKeY27tWPGMbsg4dewoM3EvZVX1E
         v+d70gdQ+MwjwNZE6WQHjf2u5OdP3LwOjk1FaaPlGpqXG5uyd+FljbkXf71JNEYJbzkG
         hwmjmkCYzc81dK2WRZz2nexjsjULRPCoA0K30tLc69RDhtO6oYieJ4fn/3u7SD86HoXr
         6UmNnHIOIJ2Wfyh+sKzQjY3+3t1HVkkHb/DniBl0T7MB3Lx6fCNXWjLLpC4tPkNSKBIJ
         IobQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780892217; x=1781497017;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AAqES12gs3yn2XZq7PRpgLohj1tMPki/ZHQt7fhpYl8=;
        b=evcJgEvswhH1TqsZ1W4S6xMi/GYT0jjWvIl44BdVeH755PIbVYXi71T68ROeoSuiG9
         US18/szc6HruShigyBVHvcMQZSGdM31vgwxSZd7bBOLDUJ6msYVTHOpxZAlDDLG2bx4O
         mVc1/GrPzq82V2KtF9grvSw+pc3InFr+QXk6CugtkdVP6wmupLibYZjn1UmtAStYhZ3X
         mv+/eu68yU+l3y5ypzaUl5yXHq7xU/4HlCXD8A13kEPhPs/XJfX5/ilNrBRUnF7k+zAN
         VkFsWhs6HmnXEE0p6GTCLY9fzraZvVMTirMeb4W0zuZuLXkWYvwPa+oiMqqKE0QKAtF4
         BTbg==
X-Forwarded-Encrypted: i=1; AFNElJ++BnBD9xeJiQQWysBWToqlM6IRlBi4qwLy9ec4wlxbWlcJOeidQiwvSsw/C5JF4mMYSWtvelcPTDJN@vger.kernel.org
X-Gm-Message-State: AOJu0YwfR/c/cHYzgpCor4SkQElDHQi3L/P3x/iT7Kq6yVuEMi8V/gwG
	GKNO2AcOCXhVftiZ0pUA/o+HoUhyV9ia4aP+o7t/NLanPc6MHd/CXtvD6BP8Bm+imFCmluTpHXE
	f7pAOwlL7SXbC3F+20W08+aEAQ1YFaSCBqMPjH1Zqmv0ljInN4SshF4kIj6YLUama
X-Gm-Gg: Acq92OHKZQ+4/FDDRU/IsG7f0ms5Xor2C0ysEvU9PK2gma9u+1Ww1hAdhg6r+kB7EFD
	NzUj87BUaRJLDWD661Me8S72Es1gAsCyFaa77q2avytL4cbcTEFeI46pPnHpg3C6dYlwbnQyjy5
	7HWgsLTg6Bb3eqE0gUxVDzWmwMXlMV9Qn7IAYRtAZJtCKgXV2JoClhGT//R50opiW6RLInF7T3w
	pknpV8r39TnKKDYrQBa3WbHnbGAYIfLrB76Bmgg0wr2i3csD+WiAE1eSNfzu6uy+8ukFv7WzxIJ
	zrLK6HK/PcT8oOymUmGrE4esMy2Lx/6WtnU/ffa9sOJRB05YwQ8DvipZ3giXPQ0KV+Bu3F4Ll3u
	KjP6YRWkeV3cRJzchB/TbDUaUj0Mh66IGeCbfJareoSNhuQZtWks+DFNos8jOilo=
X-Received: by 2002:a17:903:2290:b0:2be:3434:4e28 with SMTP id d9443c01a7336-2c1e8220d05mr153941135ad.19.1780892216608;
        Sun, 07 Jun 2026 21:16:56 -0700 (PDT)
X-Received: by 2002:a17:903:2290:b0:2be:3434:4e28 with SMTP id d9443c01a7336-2c1e8220d05mr153940695ad.19.1780892216073;
        Sun, 07 Jun 2026 21:16:56 -0700 (PDT)
Received: from hu-neersoni-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c16649fcdfsm209392525ad.78.2026.06.07.21.16.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2026 21:16:55 -0700 (PDT)
From: Neeraj Soni <neeraj.soni@oss.qualcomm.com>
To: ulf.hansson@linaro.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, andersson@kernel.org, konradybcio@kernel.org
Cc: linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, neeraj.soni@oss.qualcomm.com
Subject: [PATCH v7 0/3] Enable Inline crypto engine for kodiak and monaco
Date: Mon,  8 Jun 2026 09:46:47 +0530
Message-Id: <20260608041650.541502-1-neeraj.soni@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDAzNCBTYWx0ZWRfX4Yp0pBYXCsSr
 4Aido0aCg8Bxf4cLs6FgKZ8o5CNxk1uhkrWldXhoytahRE8V37LOrILgx8qtawh+Chaozbu/1eN
 pk80+H1ioKlSBOdZKfqA5QAxGVP6PnWO7LmIfGphQl4hytM6VQo5er0kPs4jiBWAe8ViDaMasPa
 jBHrRsHf6kihi7TRIVje5K2+lPDel7ysc98ZgW/46y4+1nBuIN+BGNJpheUql1Zs+Ia2PBof4EI
 bSomfMqOpZdr6ds275NCeVMiVbSQXby2c5T29rHPIwbOTouaB4BntkoVQz3BolfrHcTjbvUCVXx
 2XgXXe5R3vSczYs7PpZiDBfuQnFNumZJ67qf2dvbtOqVPwNYkcWRB2Z4mqinDRtKW+YpBqQ0j7C
 XNrSTFed/rdDG819mONbzGo9LVkl3+KxiIRdARZoUhgWwEYT96raUFS7b7XEZ1bkNlafWhioya5
 ukJqTBdBBPZjANO2uYw==
X-Authority-Analysis: v=2.4 cv=B5eJFutM c=1 sm=1 tr=0 ts=6a264239 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=AioB4BDzo5DgHM1MsdcA:9 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: ZderHs7WBUzGJbKSolGy42E4PIvLXEha
X-Proofpoint-ORIG-GUID: ZderHs7WBUzGJbKSolGy42E4PIvLXEha
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_01,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 spamscore=0 malwarescore=0 phishscore=0
 bulkscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606080034

Document Inline Crypto Engine (ICE) handle for SDHC and add its device-tree
node to enable it for kodiak and monaco.

How this patch was tested:
- export ARCH=arm64
- export CROSS_COMPILE=aarch64-linux-gnu-
- make menuconfig
- make defconifg
- make DT_SCHEMA_FILES=Documentation/devicetree/bindings/mmc/sdhci-msm.yaml dt_binding_check
- make ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- CHECK_DTBS=y dtbs

---
Changes in v7:
- Rebased on latest linux-next (sdhci-msm.yaml renamed to qcom,sdhci-msm.yaml).
- Added links for previous versions.
- Link to v6: https://lore.kernel.org/all/20260310113557.348502-1-neeraj.soni@oss.qualcomm.com/

Changes in v6:
- Wrapped commit message for patch (1/3) as per Linux coding guidelines.
- Signed off the patch (3/3).
- Link to v5: https://lore.kernel.org/all/20260306093332.4193993-1-neeraj.soni@oss.qualcomm.com/

Changes in v5:
- Updated the constraint for SDHCI 'v4' vs rest to reflect the 'qcom,ice'
  constraint.
- Link to v4: https://lore.kernel.org/all/20260217052526.2335759-1-neeraj.soni@oss.qualcomm.com/

Changes in v4:
- Added a new patch (3/3) for device tree changes for Monaco SoC.
- Updated commit subject of cover letter to reflect "monaco".
- Removed the text description of constraints from "description:" for "qcom,ice" and
  wrapped the code.
- Corrected the schema code to reflect the constraint of "qcom,ice" usage properly.
- Link to v3: https://lore.kernel.org/all/20260206112053.3287756-1-neeraj.soni@oss.qualcomm.com/

Changes in v3:
- Described the purpose for phandle in "description:" for "qcom,ice".
- Re-added the "if: required:" description for "qcom,ice" with proper
  encoding.
- Corrected the uppercase for base address and reg address space for ICE DT node.
- Link to v2: https://lore.kernel.org/all/20260114094848.3790487-1-neeraj.soni@oss.qualcomm.com/

Changes in v2:
- Removed the "if: required:" description for "qcom,ice" dt-binding
  as the ICE node is optional.
- Corrected the ICE dt node entry according to the dt-binding description.
- Added test details.
- Link to v1: https://lore.kernel.org/all/20251124111914.3187803-1-neeraj.soni@oss.qualcomm.com/

Changes in v1:
- Updated the dt-binding for ICE node.
- Added the dt node for ICE for kodiak.

Neeraj Soni (3):
  dt-bindings: mmc: sdhci-msm: Add ICE phandle
  arm64: dts: qcom: kodiak: enable the inline crypto engine for SDHC
  arm64: dts: qcom: monaco: enable the inline crypto engine for SDHC

 .../bindings/mmc/qcom,sdhci-msm.yaml          | 95 +++++++++++++------
 arch/arm64/boot/dts/qcom/kodiak.dtsi          |  9 ++
 arch/arm64/boot/dts/qcom/monaco.dtsi          |  9 ++
 3 files changed, 85 insertions(+), 28 deletions(-)

--
2.34.1

