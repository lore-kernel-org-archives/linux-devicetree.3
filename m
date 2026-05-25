Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 939D632B11C
	for <devicetree@vger.kernel.org>; Mon, 25 May 2026 11:47:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779709676; cv=none; b=P68CEX+xtTforTmjtlJlOO7rJGPw4GAvEt3FkFI+8Hw/ZSafPlezT/n1jlPPTjQhaJaCA2CFB068STLgQQks6Ob2qRimW9Zq8sv+tkbdhLi30LuU3t+sba7t336dq1NcaWBX8lUTBUc9lx+7A42W1Kvdu9xz20Z9a/WarODos+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779709676; c=relaxed/simple;
	bh=8+N5QED5VEX+jyCNs4ib2nwfE4R2izQhQjXVzDqzl3w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=oA7GBQDvfdUauVGAH95f/J3rLLfPm+0QeOU5LEN2yJmSkER37GOodpio/qA75ozm1PqGBlyBUeQ0aWYJKT2wWntm/MU8jokYTB7RbG7spjRXQsaAUN6C41Cl+V348GnVY0i7i5gpKELm3T6X2WhAUfYlVndFFHInC4MMFKTycG8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dfWmbTS/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=D/gJc6Cw; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dfWmbTS/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="D/gJc6Cw"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64P6YWth2580308
	for <devicetree@vger.kernel.org>; Mon, 25 May 2026 11:47:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=9Ij8IFe8zJbhUKC3RaO1er06yyOOiN/I6II
	mtMmgKZY=; b=dfWmbTS/It8D14GsCfpcr/5+9F7SIJxVm088dRPJ6pb4PKxsZMW
	FNDw//GDK/vx6w08C+kqGt4PAmkhJ9vIIww4kP/kDHaJdlum1Ed5yQrfUG58ZI7W
	LnnXC5JL52cMHmOjb0FNSeRH1NvfsmjKc1JHLEc2yGKXOF2qcYEF+GjnPsHl/i78
	SFbImFv+O4MWQYPMpxzWWnSe2ddfkhL0adnT7B2A21AaQbrnv59VFZPWSmiu33fe
	TsFaOYr3Kr2//c9EZkgIA/2bqHJq6IxMaWxwH4CIrKd4bncWQZ1LL0auw1mweU9Z
	Sz05gYFoosA/m4+wKXoOMTZ+uqH2y2mbA8g==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eb36t6nrt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 25 May 2026 11:47:52 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50fbc70cfbdso57203271cf.2
        for <devicetree@vger.kernel.org>; Mon, 25 May 2026 04:47:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779709672; x=1780314472; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9Ij8IFe8zJbhUKC3RaO1er06yyOOiN/I6IImtMmgKZY=;
        b=D/gJc6Cwnrdwld5RmmEsCTPtjS4Ponuf5dO9LfiX6goZ2FsC3RazthRs6bonO7VwBn
         I+iG0TdotxT7OKjOhFVz0vPDSvII3JrfpdANiiC5Nn2IyXALnr+KIsJRMS11TEH5YcWh
         LbuzfuAYyjbR4jDRYqNR3SPZAc27slkyz5seaxdp+PI0HgncqKCmeG61fKuvkOU6NIiB
         A7xARJrGyHBICZpAN1nMtuE2gcZXhtk8Nxv+vuj1bPmPzTtCQmE/9SntiLrfPn678CzM
         GlxBCy85YRQe3k+0XUlohSZQoR7VAhdgnlOlYSYxb6I1xsi40H7V5e1/mWAlBrwZyE3h
         RHFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779709672; x=1780314472;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9Ij8IFe8zJbhUKC3RaO1er06yyOOiN/I6IImtMmgKZY=;
        b=fe6nV7pwv0udPKt47xyN3EzlE3aHDmaRH4YAFdRf19Zjy29fdXA+Sz8pgtmIOMpwSi
         GXJfF1T+kLc4pC/TfOnUG5ymZBujugcT50etJmCWR3RsUTXuUWwgyHO9E5h8eQuBXnWB
         HF2gRyktli42Mymg6M6MPFYCyUgAdDtFsGyOtrQ9sCowPdH8Samzc2dd2AE/rHsfJDJy
         j2WDFGP7RmJDipOj5QlTtH0Z6RWY7Ftt6n4Muqf6v9670a1LL4XYCUfYGc5DHJdEuHo5
         AfYM3wtXf5dY40EibncsveeVyApdZ0AAC4kqtZ43o38kmqcJ6s82Hfw10VbmOXEP6J37
         YATg==
X-Forwarded-Encrypted: i=1; AFNElJ8tdv4HrqrBhIICXyoiXqURYoz2NMoNLKgI0NX9oPRjKWqmIyuKJ1NAFrKArtmhSUrO/CpC0hte+mvQ@vger.kernel.org
X-Gm-Message-State: AOJu0YyvOVyPja0iy6rw/iMYPtFZ5niLADYKCzMWbcFBxEniHOv14xMq
	7mDQYXq0jhT1kDngz5tCj5/7DS8gGCvASiPbzohVWf3bdTVItmCISUpGEH7FaCnKkye3ZGh0Nut
	4xONLe+XULt5k9YJL3BeWaL1CQnrHomjqElnObudP/+hU3wAroozBO5CUeo39duBp
X-Gm-Gg: Acq92OGTqxTo1hMyQ/KD/86l0qWlm1Obru36CSeWasaR1IfU3oC/l85b3I6nOHslZDt
	vy5k4/x1orS6dbnCeI+vO6B/K2IkURnbyhuu5fP6yQIVQHQ/JNHeGahn5c710ZLCr101uTdgD5T
	AXOOnEo5YMWy9951jz53RiRbtNn/SX5p4PE/l0WFsvuWraugVfywDi/uYK/sZwbPvUo07FwCYkb
	DuilSMaX+GUW+scf1wBttt/zUL9HOjq9zIuNf/E39uwNvUirlP9PiMOvlxhAPdWgQPlBjoPxrAh
	cFaM2k6gFy/pI0MZ0NDc2XUKt4KvAMF9VvrXi40Qeool63jCoZOQRRZbdrv2QFLkY7n5JYgg5xr
	BOwkfDB+cWrbQhH2VKA9GSaPg/xtdSiLA0PiLN16KKWpoBAa1mt1WQmUG1AX3Von2HtfqmFKs9a
	js1pC0Vt3YV7f1Kb29K5rQ3v/vnqkbr9IM
X-Received: by 2002:ac8:5e10:0:b0:50d:edcd:4f39 with SMTP id d75a77b69052e-516d467d82cmr193557561cf.40.1779709671878;
        Mon, 25 May 2026 04:47:51 -0700 (PDT)
X-Received: by 2002:ac8:5e10:0:b0:50d:edcd:4f39 with SMTP id d75a77b69052e-516d467d82cmr193557271cf.40.1779709671515;
        Mon, 25 May 2026 04:47:51 -0700 (PDT)
Received: from t14s (2001-1c00-0c32-7800-07d4-cca3-ec08-7ac7.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:7d4:cca3:ec08:7ac7])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bddc66dd3efsm384096666b.58.2026.05.25.04.47.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 May 2026 04:47:50 -0700 (PDT)
From: Hans de Goede <johannes.goede@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Hans de Goede <johannes.goede@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH 0/2] arm64: dts: qcom: hamoa: reserved-memory changes
Date: Mon, 25 May 2026 13:47:47 +0200
Message-ID: <20260525114749.5939-1-johannes.goede@oss.qualcomm.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: _IvKIrRi5sIjm9b7yuPcnJv5CzCFVHCU
X-Authority-Analysis: v=2.4 cv=Fto1OWrq c=1 sm=1 tr=0 ts=6a1436e8 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=NGcC8JguVDcA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=Um2Pa8k9VHT-vaBCBUpS:22 a=cqqGCi8gh-Ng8vU-sSMA:9 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: _IvKIrRi5sIjm9b7yuPcnJv5CzCFVHCU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI1MDEyMiBTYWx0ZWRfX8QNZ8siwqGGX
 73O9pMQcWnYTgwqXFAa5JczGU7lKyDz1hNRsOUJoWx/Wt4rtQUmVYozc1NuXhgBcGZy8gyO1gXu
 youwHaALPLXM0JzEbHaLSanH1lnub0vW5fPqzmsoe9Xeh7FphYJQHyzEBsEBPdUyOfl1E/MmaBi
 0zRPVYNpG/bZJkuTcSjNAf1zGZlSKZ//glcOSXfYBiZ4Hr04wpF987Cts8sN4N3PSC+osFk4HIY
 9F8JVwsLXFPzqHecr9Md69lpjE8qmzAeSu1o6FlcjYQexh3FQrAhBvGvsl7M1iS93/NzafFTqi/
 um37vLeWQRtadugbh66bwIXUvNXwuIr/IPiNa94+gQdLMVwjsGk1xSsYRSf7js3ElipTKk0HQVw
 sqKMRQ6CkO3XykCEstBdF7/twnwAl/xFb6h0Mo/lfr6Vj86JGWPMsLWV+qr9eJ+jnJxCmJpNSZY
 j3sLdcBhCsumg22ybEQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-25_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 spamscore=0 clxscore=1015 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605250122

Hi All,

Here are 2 patches to hamoa.dtsi's reserved-memory node:

1. A bug fix fixing the length of xbl_tmp_buffer_mem
2. A patch removing a bunch of memory reservations which are already
   reserved by the EFI memtable and which are otherwise unused.

2. Is marked as RFC because I'm not sure if this is a good idea, but if
the reservations are already handled by the EFI memtable it seems best
to me to just let the EFI firmware handle these.

Regards,

Hans


Hans de Goede (2):
  arm64: dts: qcom: hamoa: Fix xbl_tmp_buffer_mem size
  arm64: dts: qcom: hamoa: Remove mem-reservations which are already
    covered by EFI

 arch/arm64/boot/dts/qcom/hamoa.dtsi | 60 -----------------------------
 1 file changed, 60 deletions(-)

-- 
2.54.0

