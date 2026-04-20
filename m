Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2A0C40DFDB
	for <devicetree@vger.kernel.org>; Mon, 20 Apr 2026 02:26:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776651978; cv=none; b=K+Ti78XrVpRoH7mZdshAe7ah2/hy8wNA12OpO7jyRapGrqVF4MUjwqTFYwl6OwxhxJaitOfnKlw/GCjhPf4eEMheYId/WHUxJ5W5GK+d03m/TSv70Oc6T+53ygeptz1OKF812GhL3rQDhisRPqhGEUn4c3v58u8J3LStVA+VlWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776651978; c=relaxed/simple;
	bh=R35Ineh/EC4uwu7p6KSiIzAUo9XtyA7cPMcUR+dcTIs=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=CcWZ1aXnLVPploEkpEJmCqJyhzDFZHjA4lqalkJ9ZcjDWTk//QSQFlVUzB5A5CaR0LO1Y8PxckNwiqMt4FcwFWH4ePpRBO6pMS6o8nLD35EaEXlPwzCgZ+LoZP1ZrKKGJihgAFZYrgHpaHwi985NJrdx0vFdBqx0NkX1m9t6IXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=j0e7vhOv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fyIxfvUh; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="j0e7vhOv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fyIxfvUh"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63K0cXYj2379609
	for <devicetree@vger.kernel.org>; Mon, 20 Apr 2026 02:26:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=6Q9J74je6kR/aQO6XzDjTn
	3A3Q9gcKFGltrlMWhx89I=; b=j0e7vhOvrvf7jYmxJJWRObU0PdiG7b0s6MvN79
	smsF2i226NFNyd/27/JJrPiSWlQjyy9Y2dmlnIF13V5RMLfVQfaw/Hf7GjSQQeY8
	CgBpwyhIH85biimJkrA0iTZ04asuCWsK1swRr8gcUsS7DT8c4BP4jNDPYZPhh6cZ
	jjxry5EZJt608bRoj3y85QH8WpPB4qThBaNXCwIf37JxJRRVg5fjTCTzLIa7t6yu
	PuzPoTIwU4OL5I+shoJnY6a/sXbvPugHwmNCtrLy2MGg3g5oeUe0esLuDG0SGgIt
	xN9YwoUOAhmoSooSYz9WG/DeKyHOdNde6eXrSO4xipnuknSQ==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dm0wr3u22-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 20 Apr 2026 02:26:16 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-12c6ebeb545so1523354c88.0
        for <devicetree@vger.kernel.org>; Sun, 19 Apr 2026 19:26:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776651976; x=1777256776; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6Q9J74je6kR/aQO6XzDjTn3A3Q9gcKFGltrlMWhx89I=;
        b=fyIxfvUh39qf3A+VoFBgaZsnk+tEZhnzO1JXylarpY0rTpAELVSgnu/CA9W9pGIJhw
         J2ODp7Tx/0Vg6wV9pY3WfhrLYCAeiF4CLTUO87z9Zqdpdg5/ufLX2Pe6MTAg/mXiatVG
         c1vDl2nU3p04fF6JJszIkK+BbrhazRugL8AeJycO65QaQSlgnzGE3a5bBOqE5KKrejRF
         2yjUwbCDvyD6/fS62uGy7cz4vdipxG0HccvGu4MImmvNegneUfoP6+fa+pvueQ40Li9O
         N0ursYm9Ig6OFErh3Kbrxce2gKtoSh9Kg/UciSrdSkaRkQkjy9rqa9I1S7o4B93n8Nv9
         l8dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776651976; x=1777256776;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6Q9J74je6kR/aQO6XzDjTn3A3Q9gcKFGltrlMWhx89I=;
        b=cPM9ZpsUR44ktKQMWzZrJuMhbJWyfXCz63kthnyrSmxqLa8IOvmYIuBswDdfPDAzAq
         2poddJsHgUiemYr+6tL7qT+VSyqKfMbERmyIE4z7G9XwP0p6m2iEIf5n4DWScip9QRoO
         La3074pfRqbMDtD3nhJy4oEDcahxUSC/qr2/6m9Pd6lMiJeBFMaicQNNOjpFrQnmtjT3
         nvIeeHVMAYALCNoZ9mwP9Y+QPTxvm4oD7AYre0sEbPRqNc5eyOGwzXIDcIevATRVfaDg
         Gx3Xyc65dtLHA7UXs/uuljpRvLj1r7KtJa4B4iqj57P9FxuMEY9kFeD5J78injioa28l
         h0vA==
X-Forwarded-Encrypted: i=1; AFNElJ+n29WWGbcin9Ppv4B6pjuIllsJYlE2jAG0miM4XVolTeJ+HjCQ8Bt0RFDGNNGJs2/sl/xVttq4gg9S@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8N/7gsGsnXxEjjCfPzgfoV/upMk4jRv9ao29nYtSnTrAvIam0
	lsbaack8xB1yLF4EFzwpMS7I8EBqwVHxKf66m3JP5IBgp30lOroW5HgR12wg0o/CSeA6icyaka7
	b8n/4fqulJBY7dScnYWlJRRYPR8VjlgkbD7ovXetI39b7nK4mjhmXRh7b+JS+4N7S
X-Gm-Gg: AeBDieu9ba0xhygKDk5p16v1hRfTVejn/KevjJRQ/DEchBQcADJKrXi5QCWGVA/NrNY
	yGeb3cbKqsypt/dlWMNKApJa+sM6SAjpF3JJljeVlEhxfeh6cS17wi6LPhKha7v4jHv8Z2LkpyF
	1btGgZ8O1GG2iUJiOeGkA5zH1vbEwEMz8LZTcM+7ru1QHpipb4ZQXx7dvtvzRG5a1aiP6YfEJwy
	3i6r/XqyMk0H3Ga/wycWApeFZ8wRDRNRbx2UcmakWWZFvhRIW+8y/I94ByuOJITDgTBb8sZ8K31
	D5q3ukIlI9VkYaQZsrgOYBKZ4GF+gEYyxZzHXTe29mFx4tl3dimgpliLcDh5HN/VREPuqYEqZSE
	ZPPk2gkybhDKloe/z1wdg9P/2GxHjwJrZvmPlDO+L7EyLEaHPkCbOfKQPNIkZud8vY74It3d1n2
	hytItVKb+y
X-Received: by 2002:a05:7022:6290:b0:12c:8f92:c6ba with SMTP id a92af1059eb24-12c8f92c9damr417645c88.34.1776651976279;
        Sun, 19 Apr 2026 19:26:16 -0700 (PDT)
X-Received: by 2002:a05:7022:6290:b0:12c:8f92:c6ba with SMTP id a92af1059eb24-12c8f92c9damr417619c88.34.1776651975732;
        Sun, 19 Apr 2026 19:26:15 -0700 (PDT)
Received: from hu-fenglinw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2e53a4a8018sm15299023eec.8.2026.04.19.19.26.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Apr 2026 19:26:15 -0700 (PDT)
From: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
Subject: [PATCH v3 0/2] spmi: pmic-arb: Add spmi-pmic-arb support for
 Qualcomm Hawi SoC
Date: Sun, 19 Apr 2026 19:25:51 -0700
Message-Id: <20260419-hawi-spmi-v3-0-b04ee909cb87@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAK+O5WkC/23Oyw6CMBAF0F8hXVsybUcervwP46LAVJrIQ6pVQ
 /h3C4mRqJsmt5l7ZkbmaLDk2C4a2UDeOtu1IahNxMpatyfitgqZSZAJKKl4re+Wu76xXMucTJ4
 i5BpZmO8HMvaxWIdjyLV11254LrSX8+9bwZXiJQdeUYIVSFSwzfedc/Hlps9l1zRxeGZ7KSLI7
 yIUBWVCGFIGf4vzFV58NiOINSACUIbzEwUoIM3+ANM0vQCVTntGIwEAAA==
X-Change-ID: 20260323-hawi-spmi-a29ef97409a4
To: Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>,
        David Collins <david.collins@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, kernel@oss.qualcomm.com,
        Fenglin Wu <fenglin.wu@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-17187
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776651974; l=1247;
 i=fenglin.wu@oss.qualcomm.com; s=20260324; h=from:subject:message-id;
 bh=R35Ineh/EC4uwu7p6KSiIzAUo9XtyA7cPMcUR+dcTIs=;
 b=i3Tqm3t2JoV0GoFWhdY2AWS/iBlj//c7yXcelQNe86fZ+t5iO4hgWUhXxwvPFCZN/lFfAUHAm
 tQNRBlkxI5wBDcXEAhQgPlvwb0sgmEozePu01PkVM8SwjqYprVuPqz2
X-Developer-Key: i=fenglin.wu@oss.qualcomm.com; a=ed25519;
 pk=hJdt3E7o54lql+miD2GaxwF74cDyhgNwMbmFOZ46bRU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIwMDAyMSBTYWx0ZWRfX0m2zg3QXLOtt
 TezeawbDiCbCbZYPIglaHRD29HD9OOBSHjgVnmynFKIetygUZHCaN0q39vP3BoNgkdBXxvI8nAP
 MdPprs4rZXDXTRCu81aDuZkWNi4VlaiOSNN2hWZSQtfuGDHTu+BQM/CkDb6cdfQEvWiT2KVLTFP
 cFZEI10/BgvSCE07SN5/wVlkdmpKNsmezvz7xNDYUot419MI1XyaYIn2CIAJzuajM2ozaR9S45i
 VSUBZt3H8Z9hdrnNEWGq3H02N+v5Ch1xNkRGYJff9+jex07+Pu9YRP1HIK50VFx5vlLNwldydUf
 NORlNwNuzyYObw+8Zb1I9OtXF4rg4K117Gjup/FGVS9gbzKqhEiDRN3+/YkE5afpotQNQqFk/3Q
 MzxCu3hCnGx8CABz0Q/rzPj/71XBFm+G898aUtNpkxTEfWwG4SVSSij2tk/mMKbTvi4h0JXNoCn
 kMKnbxPe2Cr3KQlFNfQ==
X-Authority-Analysis: v=2.4 cv=G9Ys1dk5 c=1 sm=1 tr=0 ts=69e58ec8 cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=EcyeceKEuQ6cqTFU2J0A:9 a=QEXdDO2ut3YA:10
 a=Kq8ClHjjuc5pcCNDwlU0:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-ORIG-GUID: 0W1BD6KiFFIvTRzc8IYp7z3PO8vYyxzg
X-Proofpoint-GUID: 0W1BD6KiFFIvTRzc8IYp7z3PO8vYyxzg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-19_07,2026-04-17_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 adultscore=0 impostorscore=0 lowpriorityscore=0
 phishscore=0 spamscore=0 priorityscore=1501 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604200021

Add compatible for Hawi SoC and add pmic-arb v8.5 support.

Signed-off-by: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
---
Changes in v3:
- Updated the driver to include a "*check_chnl_status" hook function in
  "pmic_arb_ver_ops," with separate implementations for each version,
  as per Dmitry's feedback.
- Remove the Reviewed-by tag.
- Link to v2: https://patch.msgid.link/20260402-hawi-spmi-v2-0-0bbe811fe3f4@oss.qualcomm.com

Changes in v2:
- Revise patch 1 commit text to highlight the new features of the
  PMIC arbiter in the Hawi SoC, and clarify how it is compatible
  within the Glymur SoC.
- Link to v1: https://patch.msgid.link/20260401-hawi-spmi-v1-0-c40963041078@oss.qualcomm.com

---
Fenglin Wu (2):
      dt-bindings: spmi: glymur-spmi-pmic-arb: Add compatible for Qualcomm Hawi SoC
      spmi: spmi-pmic-arb: add support for PMIC arbiter v8.5

 .../bindings/spmi/qcom,glymur-spmi-pmic-arb.yaml   |   1 +
 drivers/spmi/spmi-pmic-arb.c                       | 142 ++++++++++++++++-----
 2 files changed, 113 insertions(+), 30 deletions(-)
---
base-commit: 840b0dd6b8c169e963f74265f508c54f1fe3c968
change-id: 20260323-hawi-spmi-a29ef97409a4

Best regards,
--  
Fenglin Wu <fenglin.wu@oss.qualcomm.com>

