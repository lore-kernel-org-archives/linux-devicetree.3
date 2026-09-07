Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6606C4582E4
	for <devicetree@vger.kernel.org>; Mon,  7 Sep 2026 10:07:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788775680; cv=none; b=vCj5COUrq9aFGrzfbw5Pt7KcoZreXs3Rwa15k9GGB8QBCwpLn4gOUtM5HQQYdXGs4XuQ8yxlzwi2+wQlXIPGImVXW6071VC20pjg4idcOk6oRGjDR/tTPcYQhRDFYQL8kDZeyxsdPltQ1e9EByOXdbIYnE+tteynz3G1c2RZoUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788775680; c=relaxed/simple;
	bh=ED/CiQaDnuIxltwLFiZ2V5Iyv6pQX6q2vdep3Y0gx5Q=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=oHieHYggkKTYEPyuo53eQQQ2F9CF3Gc+2aQdD6+DS7ROtv25iGqde0qpvb7shiwA8wABgayztPOm379PmHqN5R+4uPlElO16WeI/R0vs712XvQYIcsoqtSzSE53e90MtPwFo5uJfD4MTlw0h4+sIeiBah4fToyqlU/q1M7fMCc0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZYblqDQ1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SF8Q7qzM; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZYblqDQ1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SF8Q7qzM"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6879bPjq3189423
	for <devicetree@vger.kernel.org>; Mon, 7 Sep 2026 10:07:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=q5vYoXwna2Xtnz+6OFS0aG
	A7QRjoJeAtRfwx8K7EOfg=; b=ZYblqDQ1fvMq8ip6Kp02oC2rasq2cXotd2bbzU
	32TuXvTh57OfGw8/xp/heW/tUFWEYV9oSBbMWAcsEYlQMcBkLQz5gfPHGwXeCKpC
	7vBtv31wbs2hzfMVJu8DDiwWs2yBytFcpVbcAa5tyHChjwwcM3uO3Qc15DEZrvB6
	SahiOVrknsDx62gfKVNcCGUIDO3Ifm77lFLzRVLDvnqUIa1RonqzXaiFLkLmxK2j
	VBV4E8ZHVCDkVEI/UhM5h5H1t7iN3crQHAMOn2lTczztfme+xKS+XbrHBrpy+z/F
	W0aTHdJ4SXnnjcNoj5EZPsHZxTxYULtKRfnNniziM4pXOtow==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghtfx08e7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 07 Sep 2026 10:07:57 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38e7ff7b375so4276855a91.1
        for <devicetree@vger.kernel.org>; Mon, 07 Sep 2026 03:07:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788775677; x=1789380477; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=q5vYoXwna2Xtnz+6OFS0aGA7QRjoJeAtRfwx8K7EOfg=;
        b=SF8Q7qzML9dl+6M3h13rB6JWutWgtcHT0s2xDdxOLdYPVxljM3nbZOL7HWDSzHvSOW
         rsD0usM6SRKMzP30fcmbp3fANsUc6o8hA8bYKpvf0MvNVPhADKOj0KgW8g3TbpwTq7ya
         soQf7CIUgq0HuzuomICeZum+tA4cb9nVHeg9U81fBfKvu1vovUDG0Emc+rC7xDn9J9H1
         yIkgAH8DSN+e9PUwcyszLmCW0sw+0HhDE4Y5XIsrqCDKGPn/QASArVCpLsXnagXWWW0n
         byDvG6BaPwVHxpTezooj3q9DYDhFf+8H37FhRpgylfPKWWIa8/UsQ2+ZB0tBglJEyGX3
         zcMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788775677; x=1789380477;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=q5vYoXwna2Xtnz+6OFS0aGA7QRjoJeAtRfwx8K7EOfg=;
        b=amBcUhpvyEw4FT0nh/G5aRb3R7DEYbgqrRrlGRNe43EePTGWHHUBtOokEOiwgUvl/0
         d+K8Tov8c3bFSZavMBoCGupHZpP6N6URvdNXdOngg6lQMfRVHfO6rBX3Qw+ebZdfusO7
         mNhzMFsfeDqCPqyFV2WN9YmNukGDafPTPwPPmES8onrKpi+yNMe664rEv4mrOZw8EfY6
         nd916IZqhfk+BdqL+fWwhhKiY5+YoI78+cChyYGQI8olyojDAIRGRvAq6voFvJsYv2vb
         ZDtgn8J1gjVTv6+p6P2/Vb7+zPLEvhNIyrT2hjngGqAobCJMbqZQdydvnPLVht0GxP3a
         SxyA==
X-Forwarded-Encrypted: i=1; AKwUvBwbCyTR6fzTj1s4pbQ2OQXkceeW7pbhjlbVyIoVcBZVB8UlmSf5Bmtj9K97f29V+HJk2xXDRHFEVh9y@vger.kernel.org
X-Gm-Message-State: AFuF++n7A/ID/aF9iG8gScttHS2+CyLUrUvcoB/RbkQIRlTtMsCC2955
	hix5d4PhyNjs7exOM0HqudD543Vo+bP2VwkNzk0C6YzFXccYe7FC0Qd3tA7LJx7+jqJSo9Q7p8I
	e728nhWpZumg/Xe4usiplroIqFnAI6b9XRa6zdzZSsKnr6pg2JuX40YYi3Idbwn2f
X-Gm-Gg: AYBFou3+UDQJ+uMqjJoGfafbnwacooW5pisCV2GWrOEypMh0kXqksVlUlvxcrd8AaCg
	lGmLrSp/I+V4JtFamgLTgrg8woqzvIyXc911eUFgDG2kANdZmsWrfQSh6x4PqkU5nUjIT79NzCY
	NLJ+OWHgwOKnQOnE56OMbs6zlSSn2Vybmr3doZ7cvVxNGuKno+CEG0Uc7hTrxs/8O/0R6YhseDC
	NSUhlQXJyRbM0wlra3ZrgxwPnWa7RRRlDQhyJ/2ZEYcfg8o5cbWBP3JfhQZE9cjx+8l1Z50bu31
	VOcZDmyTPK+hHblJCphZEiQ2+UGYjYJmK4HxYmIcB1mxm95ozSC28yW9vR+rv5fAB2jzzrfHad0
	OzGA+a5nsjelhtCCX+3xM1HIO/efwrIE=
X-Received: by 2002:a17:90b:5287:b0:38e:6a44:671b with SMTP id 98e67ed59e1d1-39b25eeeef9mr34849118a91.0.1788775676825;
        Mon, 07 Sep 2026 03:07:56 -0700 (PDT)
X-Received: by 2002:a17:90b:5287:b0:38e:6a44:671b with SMTP id 98e67ed59e1d1-39b25eeeef9mr34849051a91.0.1788775676384;
        Mon, 07 Sep 2026 03:07:56 -0700 (PDT)
Received: from hu-nihalkum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339aa37dbdsm22891332eec.11.2026.09.07.03.07.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 03:07:56 -0700 (PDT)
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Subject: [PATCH 0/6] Add CCI and CAMSS support for Glymur
Date: Mon, 07 Sep 2026 15:37:43 +0530
Message-Id: <20260907-glymur_camss_dts-v1-0-6c2ced5ea5f9@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAO+MnmoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDSwNz3fScytzSovjkxNzi4viUkmJdcyNDA1OjZAMLEwszJaC2gqLUtMw
 KsJHRsRB+UWphKdDkEqhgbS0Ap8yyPXcAAAA=
X-Change-ID: 20260907-glymur_camss_dts-721052c08486
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Suresh Vankadara <svankada@qti.qualcomm.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788775671; l=2327;
 i=nihal.gupta@oss.qualcomm.com; s=20260608; h=from:subject:message-id;
 bh=ED/CiQaDnuIxltwLFiZ2V5Iyv6pQX6q2vdep3Y0gx5Q=;
 b=a1h2zv9isKpVtJmklFLCU6Z1VmLt/f7spBslU+YpAVv2v9g427DbtMegTcywfwNHqK1AsNX4L
 TEw6rulaokYCLPn1R3is19H7GCZkqn76MP7pDvKS96yGlH1MpV2GDFS
X-Developer-Key: i=nihal.gupta@oss.qualcomm.com; a=ed25519;
 pk=DIbyFMNwqU/iMvU/0pCQp2wmRVgtHFBT3PcSu+A+Ncw=
X-Authority-Analysis: v=2.4 cv=Weg8rUhX c=1 sm=1 tr=0 ts=6a9e8cfd cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=R5umFiV8t45MmT4L2-QA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: Z7x0iOdE_9mfeEnOIy_Egyc26hykWD9v
X-Proofpoint-ORIG-GUID: Z7x0iOdE_9mfeEnOIy_Egyc26hykWD9v
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDExMCBTYWx0ZWRfX5MXaeHfgHdQv
 tniTl2CSE8xX9XPXv/iMgKrA1k7LiuXEN5TX18tEfLLQksOBwpK6c7eBijFiAM9qHEPIf9gri5l
 pGLZzKJGIlpubC+zSoGufRvdiiceXcQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDExMCBTYWx0ZWRfX40yJZxs/AOn6
 5B+1T0Tayh58iGBQPwXILveIa90TrQQ8g/RYIw/3hIPhWd+1UNnD9BZS+UeuW4pBgQU+SsGH5qf
 UkJPX0GBRozd2dXMjpA1MZ06xWShNkmAmuPnyUG11FYe8T3nI5dQE9QvLWwPAG8Bx7JwhhL0zbb
 MWQgAQLrhk46cSSEKdI4PleS1lItwlNq8q7K2jGlWfnjoP+6VaG/Y9vX6X4DZQ3M+xdl4hp2W0t
 1Ygmax+3xS//UFr+snMLDytLgG1qERvw2pc4c628zQfQUVsYXwoo0QXysHvcBde6I4XVwnndQu6
 Yz45FU3OFDI5UmMsAfu5+blJXlXb9aU7iEdJkyvNLjWHXPuQsXjtjrDkCj4oBQwcUVVBLWutKOj
 OY3msEd4OnDr1X552OfCk1hzL7GWmX6+yVUw2gqpJwxRlVpC0wUU02EkZ+JoTYTOrGKNoMtG6Vx
 cJQgZndmtSiwpKp6+7Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_02,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 clxscore=1015 suspectscore=0 phishscore=0
 bulkscore=0 spamscore=0 adultscore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609070110

This series adds the camera device tree support for the Qualcomm
Glymur SoC and enables it on the Glymur CRD board, which adds CCI
support and enables the OV08X40 sensor via CSIPHY4.

This series has been tested using the following commands with OV08X40 sensor.
- media-ctl --reset
- media-ctl -d /dev/media0 -V '"ov08x40 6-0036":0[fmt:SGRBG10_1X10/3856x2416 field:none]'
- media-ctl -d /dev/media0 -V '"msm_csiphy4":0[fmt:SGRBG10_1X10/3856x2416]'
- media-ctl -d /dev/media0 -V '"msm_csid0":0[fmt:SGRBG10_1X10/3856x2416]'
- media-ctl -d /dev/media0 -V '"msm_vfe0_rdi0":0[fmt:SGRBG10_1X10/3856x2416]'
- media-ctl -d /dev/media0 -l '"msm_csiphy4":1->"msm_csid0":0[1]'
- media-ctl -d /dev/media0 -l '"msm_csid0":1->"msm_vfe0_rdi0":0[1]'
- yavta -B capture-mplane -c -I -n 5 -f SGRBG10P -s 3856x2416 -F /dev/video0

Depends-on: https://lore.kernel.org/all/20260907-glymur_camss-v2-0-75f7982dc983@oss.qualcomm.com
---
Internally reviewed by Konrad Dybcio:
1. [patch 1] Remove stray blank line above CAMSS node; keep blank line
   between last property and first subnode
2. [patch 2] Use preferred phandle list format for CCI: foo = <&bar>, <&xyz>
3. [patch 4] Replace qcom,pm8008 with correct qcom,pm8010-i2c compatible;
4. [patch 5] Move csiphy4 port@0 endpoint to SoC DTSI; reference by
   label in board DTSI
5. [patch 5] Reference camss_csiphy4_ep by label instead of redefining inline.

Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>

---
Jishnu Prakash (1):
      arm64: dts: qcom: glymur-crd: Add PM8010 camera PMIC

Nihal Kumar Gupta (5):
      arm64: dts: qcom: glymur: Add CAMSS and CSIPHY nodes for Glymur
      arm64: dts: qcom: glymur: Add CCI definitions for Glymur
      arm64: dts: qcom: glymur: Add camera MCLK pinctrl
      arm64: dts: qcom: glymur-crd: Add ov08x40 RGB sensor on CSIPHY4
      arm64: defconfig: Enable OV08X40 camera sensor driver

 arch/arm64/boot/dts/qcom/glymur-crd.dtsi | 133 ++++++++
 arch/arm64/boot/dts/qcom/glymur.dtsi     | 560 +++++++++++++++++++++++++++++++
 arch/arm64/configs/defconfig             |   1 +
 3 files changed, 694 insertions(+)
---
base-commit: af5f12805e5cefa4fe68d6127c7e1fb78cd5535c
change-id: 20260907-glymur_camss_dts-721052c08486

Best regards,
-- 
Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>

