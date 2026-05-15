Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82879450917
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 10:46:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778841992; cv=none; b=YxZ/AB6wc+K5LnSYXb8Pwob57Sq9nD8aLrjtpeaQ0tldZFEbHubqfA18wpi2/5MhThRf6jZUWHrc8F7br+C2IRucRwbAXEqm3tD/JSdnlrPjJWGfIyFw9JbIrzznMAuICIuumNhhCUbdrUd273gqZYdJkgkjE/UuprxEbGpBoGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778841992; c=relaxed/simple;
	bh=wMUv2/vsDA9bEMUw/tVu9wXRo/rcLzGAUiB5vdQjm/Y=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=tj+D3LoypX/xB0brzouTsEpDJ8xaeCZgsitsj2nHukoT/tJujmqkw3+/zCbYVVxwl6WC1KwN0wl34aPpWmAb9hcloNf+j9Uq6AKnwLFe5ipgwQz7QzzqzbV52gxl4TQ8e2Fdde44oAQ3rLuaNULmbx8jOCK5+rbjWGOijYCkgmE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jysB++YI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=grulyFCs; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jysB++YI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="grulyFCs"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64F5UJIQ3198008
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 10:46:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=XBHTerfjmV+1YAC6GpRFKu
	v6kE7wy/lSovkWyzSWvKQ=; b=jysB++YIDrt78BuRdhn8gRSmZRBLVioHkiYKYE
	da1/34YsCzJ9Gg4SrzmvB/8XDR+FXfL/4U4z5o+ysE2EHApV1ZPBKBQsgmNQ9Pbh
	ZaCNVjHdrpA9wpHCXmCpvpxXifUct9eS3rlFJex8BszS7qSK94SCbj40SvlQqdzl
	nOjaydbNxf4RS6xUcAniHaaW7opkEBCdngx0XJTSjJTsYJv16qc3cFC3Dc85f2Vd
	cEjC1tCJILuzD1dVF/Ddmxc+W7jkQMM41RqQmkbzugSVdS0HDFLRYhAsRpXBkT4V
	FfOKClBIdY0O7XNKHacrnPdl6JR6o2gnn8M1krFBXxKo1l8A==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e5m1qaw9y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 10:46:30 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2bc763c7256so139073005ad.3
        for <devicetree@vger.kernel.org>; Fri, 15 May 2026 03:46:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778841989; x=1779446789; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XBHTerfjmV+1YAC6GpRFKuv6kE7wy/lSovkWyzSWvKQ=;
        b=grulyFCsOm5L+H5LU8GaP1MpuKTTSTfOt4k81TKs0ihm5P2HW1BddZ+ipHFrOY747+
         LczWxdBJrVllrfwZsPh7uBa9qUDLlKT1vXhAC6xkaPiLEYjz1xR9Fg2CNMlmS424KFi3
         JQ8t5Zamej+jxJkQaiYrkgL68RKeKksSJw0kZG94U+dpPhHY2Js+6T+wWv5o/Yzb/cL3
         FpG4Sghi6L8uvIHQgKCiTyiNHnrW050gl/AVQw0olV//LUvQe+roDTEaX5YLqbUMwLfK
         kbKF4peC3FjzHeFu8Wu6dQvEBOhQDfF60F+RNfHOxjI/6JCL6D/jy57cpsV3EC4ixyvI
         45Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778841989; x=1779446789;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XBHTerfjmV+1YAC6GpRFKuv6kE7wy/lSovkWyzSWvKQ=;
        b=WBhp5DTv0T9r5y9LQuGFaV0y90ljjCD6mUNiat7vOYtGTmco2yr7oQG1GwQnLo2wRt
         DhpggphNlhoD5pCme6crOgbBNbY2nYOeaFQaYiRgCvNcZrWFy7TpQc07VKuXBAaDVX/1
         xWpLWi8v/nhmyhPanv0Ul8auQntOe3fxxrSv/RFbuBtqWweZsOg876b12E7ix6m1B7Ad
         bfLzN5qipMq3zpcQpPc+P82N+KiDKaXReWInV8gB0Lxs+JXXeaGfNCIZbdhj3jj9aBmr
         VZk/2LTNpxAePUGlzKuQGoSoUtq96lEeGh5YQwPAYa8WDKEFCC2BVx93lmFRssIdR5hZ
         sH7A==
X-Forwarded-Encrypted: i=1; AFNElJ+WhVBa60GZ2om6y3c1BC4178Dbu4NJh0GR6XYUlkgBeWU/hxR06ZTRQh7N2Zs4/PzPzE5ZWAW3fP1F@vger.kernel.org
X-Gm-Message-State: AOJu0YzEmMk9GtF1ONV39Q7UkCePWIVAX8yVUd9ANs6EYVa6ja0DrJpK
	h71el6LYbVOK5gGOO7hLj8HeDiqQFuvMlsXWWLbkXoS1J3QVMlo93/c9442j1A559X1iHlJQ7n6
	AoZA0plgqdafaoHJPD0XBsz3ZtMyLoN45TGLOBPAmgIqa8jrGCF0VbM2zriLrormn
X-Gm-Gg: Acq92OFhN9KXHkMeuoR4HeHxIzvqV3w1yrOxWgZBmjALunfZtwSFUEO9TmwiQmXp4Uy
	uClZELwrqg6BxBOpyBe2fn7MG2CPfwzzYsgH4/NZ9oxm+0dZoQSjYbDhuSnad1EA7njDFMhCM+U
	xxbTRDMPqwqeIjh1szzoW2TVpZpXZ0/WNOWfFwyH+RpAIu+yy/HoLVp49aT8UcG/8sPQsQYHx9C
	9mOxsnNHpzheogehW/AYePYxL4D1XJQyGk4q4hucZI1TIK9xhqbvbpzhp4WPtGMq4H0dSS0Z+gj
	mGKkvUzRUHUNKK8Ii4MkAmosEznvXlo2wN41NFc3pSyAHI3MS0fVQK9s/Ld6dGcNVOFRziF9uFN
	rBhlvvOX09UEPEQQv6SYltRH8yGE/QIF57ek+D/wDdXr+zSkz3dTJXKs=
X-Received: by 2002:a17:902:ca93:b0:2bc:eea4:83c3 with SMTP id d9443c01a7336-2bd7e87d79emr27810705ad.25.1778841989497;
        Fri, 15 May 2026 03:46:29 -0700 (PDT)
X-Received: by 2002:a17:902:ca93:b0:2bc:eea4:83c3 with SMTP id d9443c01a7336-2bd7e87d79emr27810405ad.25.1778841989051;
        Fri, 15 May 2026 03:46:29 -0700 (PDT)
Received: from hu-kuldsing-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5bd5f2dcsm55839755ad.13.2026.05.15.03.46.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 03:46:28 -0700 (PDT)
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Subject: [PATCH v2 0/2] Add support for ice sdhc on shikra
Date: Fri, 15 May 2026 16:16:02 +0530
Message-Id: <20260515-shikra_ice_ufs-v2-0-2724a54339db@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGv5BmoC/12NQQ6CMBREr0K6tqQtFMWV9zCElPKRr0K1H4iGc
 HcLxo2bSV4y82ZmBB6B2DGamYcJCV0fQO0iZlvTX4BjHZgpoTKhZcKpxZs3JVoox4a4zmthUgV
 JelAsjB4eGnxtwnPxZRqrK9hhtayNFmlw/r09TnLt/eT6Xz5JLnglq8xCvRda5ydHFD9Hc7eu6
 +IQrFiW5QM7aBYzxQAAAA==
X-Change-ID: 20260513-shikra_ice_ufs-59d0a42e3482
To: Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Proofpoint-GUID: riu62o1IgQV_kxIdNbNrO8PwGiHYuaa5
X-Authority-Analysis: v=2.4 cv=GulyPE1C c=1 sm=1 tr=0 ts=6a06f986 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=bC-a23v3AAAA:8 a=GDFvtG6j3FZufZSdgfMA:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE1MDEwOSBTYWx0ZWRfX/z/GbkBs++Tm
 i8TMYW9U6f0N7vAT2FD+TRJzUO6YlKOxqUrA82vUmKOP8qv0a+4iS0g34cQtKWyLDbMeN4JDDuU
 vkeNVaJUZuDYd/vrsWbjB7Kuuz6X3fWDjEGdLPSJFMmH4ylth2k0HR0JaptQElZzfJgVEdFYevv
 UiJoX4aVu26WmFYkC/UJkL2/1zc1gGGotSQ1JNhkkOfHXzIqggzYG5yXFvNjb2qRCdiCZyH/z9s
 w21fD77dMLAaY4eAdw8F4kC/RPCajMq6pb8+RIOtZYET9AYG1sVp1mapO6oVSHgEV3wjk01Vinb
 BtOEL4HprlB+mYP2qHpbYkb80V4/ZFVAM0qaoAmdctNFL4C//T2sGoezLhbX7K5lNYBvzf90iN6
 rgPtHRN7ftfr9hu/SbWZ9B2sZo76/H12aLz49VDprokP5D+Iz4ToKrCeuCrclRkW5hgmEMTD+17
 8VTZPy32X1/AVK6pkZg==
X-Proofpoint-ORIG-GUID: riu62o1IgQV_kxIdNbNrO8PwGiHYuaa5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-15_02,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 clxscore=1015 impostorscore=0 bulkscore=0
 lowpriorityscore=0 phishscore=0 suspectscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605150109

This patchseries attempt to enable ice sdhc on shikra similar to other
platforms.

Validations: 
- Driver probe on bootup.

Dependency on:
- https://lore.kernel.org/all/20260512-shikra-dt-v1-0-716438330dd0@oss.qualcomm.com/
- https://lore.kernel.org/linux-arm-msm/20260416-qcom_ice_power_and_clk_vote-v5-0-5ccf5d7e2846@oss.qualcomm.com/

Signed-off-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
---
Changes in v2:
- Reword commit message for patch 2/2 and cover letter.
- Link to v1: https://patch.msgid.link/20260515-shikra_ice_ufs-v1-0-b1b6ced70559@oss.qualcomm.com

---
Kuldeep Singh (2):
      dt-bindings: crypto: qcom,inline-crypto-engine: Document Shikra ICE
      arm64: dts: qcom: shikra: Enable ice support for SDHC

 .../bindings/crypto/qcom,inline-crypto-engine.yaml           |  1 +
 arch/arm64/boot/dts/qcom/shikra.dtsi                         | 12 ++++++++++++
 2 files changed, 13 insertions(+)
---
base-commit: 7e247866bbe72314f68036d5171c1af354ccdbe8
change-id: 20260513-shikra_ice_ufs-59d0a42e3482

Best regards,
--  
Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>

