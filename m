Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B349C3E9C10
	for <devicetree@vger.kernel.org>; Wed, 20 May 2026 14:18:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779286726; cv=none; b=qX+dPvsVlzWaxlgFwyaUlZfJWWruLLOOSp/eVceY3t3Ntf2A6so3NC3RSrSRNe36KxzWWdZgeoprNkqi6YrylSc9kdPWmktvcGybSjT1L+2uzaYM90Rk5ZaCDlCk1k9Fj/FJVBH8AgW/Af6Tx83Ukfl5wyXonSiH/iW4JSTylkw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779286726; c=relaxed/simple;
	bh=WJud/LzUXHpuZnvmDnaaNQCWHb2XT5oMZj3y1B4DnHA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=FBruTnnG3mYpH7jabhTMS0AI5XUUG+PLEEYORZaUBlfhMwLW4epC4F/sJz79gSCmyCRV7hE7CuDrMLY1OEQ9yj/afSN1W/v0yl8CoqZxQ/DISoWLWwgBp7EutXY9VxqqPpJHj2JBYMzLK+eN3AfDGo6xRg1inqvXp5wXKko+/sY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eEONiNEw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MJ8AFLgs; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eEONiNEw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MJ8AFLgs"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64KEFYsG963697
	for <devicetree@vger.kernel.org>; Wed, 20 May 2026 14:18:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=Uz7tDg3ey8acYtYjEq8oOd5DW80KoUUi9kI
	sP4bdi/8=; b=eEONiNEwzUNSNUCwpBRbHeHyr+P5mGB35dBF5TtVdNmEH7HnbQZ
	hbF4uSol8c999Afy5lZ49Vk+2U4t5TgpwGb/n4rN5nUJ1uRot1L2lOXD5j1hcCf/
	zW+2tt7NVSRI86r5wSnT3XDfVCttJxDJBAZacvaVBC7AIXgAc0cO9LJKw4gErxR3
	Znov/Du8a09sPJsCt9eU4OemxFkSmWAvyO0sLNB7VCfHRQlkf0wk7f0xC6if4/3f
	liRQCn4mBuWMU6WaYhzaKIHmWEquxfm6od+Dh31NUA22bxsLMvaxyvv2EXaH+C5x
	DiU0oo1cKKeY9gnpPNGd5XVpRicXDSE8U0w==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9ejh00bq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 20 May 2026 14:18:36 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-83f7e7f7457so2504477b3a.1
        for <devicetree@vger.kernel.org>; Wed, 20 May 2026 07:18:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779286716; x=1779891516; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Uz7tDg3ey8acYtYjEq8oOd5DW80KoUUi9kIsP4bdi/8=;
        b=MJ8AFLgsZNo4okCz2zFjVQ5+uNM5EgPFfQm0g4A+VMQset+7h9+3/fzqzl7ksOrRMc
         K4eCmAnJvFgArB7nDmCaeG5X+kzSHvM5n5ugjYuR3WBRwuGJ65SZjM1MN5i6T2MIESC2
         lP+rWePoC6gCN8oru7ytFb5k2S7saJ4B8PbNQIorH05xEktpwQP1jNf0Dax7SzZMilqS
         LojHw/H91P8oVv3s7aGuWwvhAYnebswOZwJpNCYGHHrsGLJXYNEc2AgnNpaxRYK6DrZ6
         Np66VYxtgIEq/AP0t5BtW6nFeWO67flH0jTfxRiA5+BJ/STLiuSrmNDr+87uQbQXx3mo
         1t3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779286716; x=1779891516;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Uz7tDg3ey8acYtYjEq8oOd5DW80KoUUi9kIsP4bdi/8=;
        b=sxXqBfk7uyjiQz2U3R9yFiNWI+kHQtrQf4cPPHNhFl2Da1ivYetj8Ku1z08M/ZTAZG
         pXuB8RNIYa2HhPjRF0S3DXgF5cfPEyWQmzHOfa6c3lE6Wt5BV0kMhO1CwHAQqaKtQdyD
         qV/kolBWrkolq/unvSkfKZGQmUj1HvMDqLQZ4UoHZsnwLwK+iTV2FPjUXEwVH0ln4eef
         gvR4cFMeDtftyw5x8vf0/vAD6URganenQhIP0d2eOkSb3/8DNcm3OVtOLTQi0eDMuERB
         0/rZ7F18JNNgEQvB8EfMXFfpyRQ+wshsKfV0sKiBZrpqffpugqxZETrPCKUfN6W/EZ4v
         yo+g==
X-Forwarded-Encrypted: i=1; AFNElJ8EmUh1e9pff9pw1TbpVEWPJ5ED03fBMvjwu52+SinYySYf7M5jiSZ+MWY+C+TKBO2kL80y6TEzrCS7@vger.kernel.org
X-Gm-Message-State: AOJu0YwAbKz/Km7OIOHd5tdkuXNxKOSlD9/zTtUvvEcdApQ+3Jb0NdkW
	LxKHHTKpGxy054mDp72TWRjtFbcc1IcH6BF2WtWgdF9wUnBY67aM07GBV2P3YfB9X8YTZSGpblK
	UV647+UBzW150nY2NW2O4CKjB2LIbdKnr4aB/BAGDEvOyig0JLv6HNHd5SHgS+il3
X-Gm-Gg: Acq92OGjdJIfoAVT3iWXtSnF4omv4CilVZQJBmFljMJ8tZ11g7AYRnbJNkVgmBYrZfw
	Tk++LaWqrKSXqSKMQutjT+DlqwBiGsCOZ1B0ZMkHGp0gQ+G/jDBZMJAu2y02i/qdxVvMwPQN+o+
	BkWVVhRxYkWsCxquEgMpHJ38htLWoQbyZ7dgaeCAyNtEXU+aBte2KdYDd+7D1N9I6mq2H3NIb1T
	vj6Fgkj5P8ctOcMajAWQ1OksOBAD5RyVjA8rRZN48ItGdFK1upBbXLR+kZL9hC4pOP8173hXJW1
	GR6RUi2RExZWtAW1DqBm+E6NQ/R8VbkBRppjqFeoydI+4FDVInVYfeD1aXh3VEKaGBHeYg2xZDS
	tCdqIsrvwIjerKaiJky2YgNuJx80US8ewdhiPu05EJ4uP987/bNVEg8Reo+Y7WK7T08JEYc8M/D
	iI8qUBNWlxyzkoX1NXYGs3WkswizNsoSpvNIxu
X-Received: by 2002:a05:6a00:806:b0:837:8342:abe5 with SMTP id d2e1a72fcca58-83f18e7709cmr23766517b3a.18.1779286715859;
        Wed, 20 May 2026 07:18:35 -0700 (PDT)
X-Received: by 2002:a05:6a00:806:b0:837:8342:abe5 with SMTP id d2e1a72fcca58-83f18e7709cmr23766483b3a.18.1779286715246;
        Wed, 20 May 2026 07:18:35 -0700 (PDT)
Received: from hu-sibis-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83f19775c97sm21990803b3a.15.2026.05.20.07.18.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 07:18:34 -0700 (PDT)
From: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
To: robh@kernel.org, srini@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        andersson@kernel.org, konradybcio@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH V8 0/2] Enable ADSP and CDSP for Glymur SoC
Date: Wed, 20 May 2026 19:48:26 +0530
Message-Id: <20260520141828.2724689-1-sibi.sankar@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=QptuG1yd c=1 sm=1 tr=0 ts=6a0dc2bc cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=9v-nsc7hOUgGWHzJVNoA:9 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIwMDEzOCBTYWx0ZWRfXzJxiPFr6Huk7
 np84SG1fUO17mFMGbdUZSiU6V49uHyXdgt5r/37boRb4VyZ/Re960v/zQT8AcklTwtZ5LsvlDQS
 EuzFe23ar4R2bmCGYypAEp7yppPHGHzMWKGnDu00NS2hXJfYscUmklpihx4E5TMVdZ7lqz47DK3
 SLDpMv59Gxclk6BhMdBFarUrP4IjNMovd+iQD4ILiM/mWNUQyvKkI4WVK6G291I6tG8c05Qq5v5
 qlSpwTe//9RsbaWVL+9Z3WNeyMNUQaZ9Fw+zxGzec3e7+KviTDcrV/1CLJZH3XOWaddBy9fex2m
 zLQiu4UaMw0tdWHxMPS2i3jQjf+xN+Lr2KcetJD8zeWLMOsi5Buj/35N20a0KA6+o1N+e+SUeUb
 GaA9ylROuSFv7nGg4KIUCrPLvL+j8aptZZg0BwNjb0vvbwhkDbnPO1bCNWNroSFXAHWzokGf/+3
 tpPKx2hbBTwM4moNsgQ==
X-Proofpoint-GUID: W47lWQ83ftKpULt4BhJk7gT141m5rOqU
X-Proofpoint-ORIG-GUID: W47lWQ83ftKpULt4BhJk7gT141m5rOqU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-20_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 bulkscore=0 lowpriorityscore=0 priorityscore=1501
 clxscore=1015 impostorscore=0 phishscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605200138

Qualcomm Glymur SoC variants predominantly boot Linux at EL2. This means
that the firmware streams of the remote processors are managed in kernel
and not in Gunyah hypervisor. Given that the Peripheral Image Loader for
Qualcomm SoCs now support running Linux Host at EL2 [1], this series
documents and enables ADSP and CDSP on Qualcomm Glymur SoCs with its
fastrpc nodes. A few variants of the SoC are expected to run Linux at EL1
hence the iommus properties are left optional.

[1] - https://lore.kernel.org/all/20260105-kvmrprocv10-v10-0-022e96815380@oss.qualcomm.com/

Changes in v8:
- Drop bindings and remoteproc nodes since they've already been picked up by Greg/Bjorn.
- Fix SID duplication between gpr and fastrpc nodes. [Sibi]
- Fix Incomplete DCO. [Krzysztof]
- Match model name to the one already used in Audioreach topology. [Krzysztof]
- Link to v7: https://lore.kernel.org/lkml/20260331032121.1279203-1-sibi.sankar@oss.qualcomm.com/

Changes in v7:
- Rebased on the latest Linux-next
- Split patch series so that Greg can pick this one up so that
  the dt changes can be picked up by Bjorn.
- Link to v6: https://lore.kernel.org/lkml/20260325035338.1393287-1-sibi.sankar@oss.qualcomm.com/

Changes in v6:
- Pick the audio series up. [Srini]
- Pickup Rbs from the list.
- Rebase on top of the lastest linux-next.
- Fix up address size and other misc fixes. [Konrad]
- Fix the ordering the various audio nodes. [Sibi]
- Link to v5: https://lore.kernel.org/lkml/20260313120814.1312410-1-sibi.sankar@oss.qualcomm.com/
- Link to v0 audio series: https://lore.kernel.org/lkml/20260311124230.2241781-1-srinivas.kandagatla@oss.qualcomm.com/

Changes in v5:
- Fix commit messages (patch 1/2) to accurately describe compatibility [Krzysztof]
- Link to v4: https://lore.kernel.org/lkml/20260310033617.3108675-1-sibi.sankar@oss.qualcomm.com/

Changes in v4:
- Fix SID used in ADSP/CDSP for correctness [Konrad]
- Link to v3: https://lore.kernel.org/lkml/20260129001358.770053-1-sibi.sankar@oss.qualcomm.com/

Changes in v3:
- A few variants of the SoC are expected to run Linux at EL1 hence the
  iommus properties are left optional.
- Add fastrpc bindings and nodes.
- Link to v2: https://lore.kernel.org/all/20251029-knp-remoteproc-v2-0-6c81993b52ea@oss.qualcomm.com/

Changes in v2:
- Combined into Kaanapali series since they are fully compatible.
- Link to v1: https://lore.kernel.org/all/20250924183726.509202-1-sibi.sankar@oss.qualcomm.com/

Srinivas Kandagatla (2):
  arm64: dts: glymur: Add LPASS macro codecs and pinctrl
  arm64: dts: qcom: glymur-crd: add Audio sound card node

 arch/arm64/boot/dts/qcom/glymur-crd.dtsi | 110 ++++++++++
 arch/arm64/boot/dts/qcom/glymur.dtsi     | 263 +++++++++++++++++++++++
 2 files changed, 373 insertions(+)


base-commit: 6a50ba100ace43f43c87384367eb2d2605fcc16c
-- 
2.34.1

