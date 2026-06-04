Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67DC248A2DB
	for <devicetree@vger.kernel.org>; Thu,  4 Jun 2026 16:22:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780590156; cv=none; b=HKX0JqUXy8JJ4vpwS8L+cAelEUVkupOESfcfhAezS46F18ixY47pZjuZQ4sui910Bt8sQ56F9tCIg6r0v1XT//CNQuy/vzhIhsolLmaEQuHDpwkOlD6WVj8arfLOCAftPtjgfxctLv3yMY6HTWFMEXqmhu48QLNDbkVfGtUlGmQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780590156; c=relaxed/simple;
	bh=KDONWoVWgo4bQVHIX5jep12WUUSRUxz8kNJF/VhmCpQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Zm8KwwbR5dj97sR78Zkw89j06GM1Sor4XRdLIG8CGACzNI/EyGPWVYJ4FzVQhqbnaAzab1NcxGb1llhYZfnv7IorE3Paqi0sI2YChEHlFn0CLRa+AbCWwoZ6ATZtcK93+lPPz9Uo35I3JJDgZt8dbux3kM/b7iBVEktKh9F1Y4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EZ5jiiY0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cJfgV0cl; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EZ5jiiY0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cJfgV0cl"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 654ECNCx140445
	for <devicetree@vger.kernel.org>; Thu, 4 Jun 2026 16:22:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=k3wL2K3dlb2dNxaCHLSI8S
	bji31i/l3i8H4s1lAhgCs=; b=EZ5jiiY0WHUhzRfvD304C2b2o45tICUlCYvFxk
	qyA0Zs9yjtB+VZMO369CKdOTKD1bp8z1qM2u28THTBVjDQqu1NAKC4GQuBBOPf1T
	VItdDlEQ5T3stAM1PK5PfTqbJcOOlQ+AEVkTUr1aR879ta5sHJWbLzT9zdzFcIoj
	3QKubtLRQ+HtTAekZzBU5O2pIjJTX1sqbg7S2gFRujmZMnIjGJxO1j/gLkqzmQJw
	KxDNEdlKkPAg4QnMu95de/nN+/7uoZs3juGJWmjp31Vhh3+MORqJv38bbIIqn037
	w24veYHzx7qUO3viIP5DWQr/tFBjv4/YZoAGlysin40ZhO2w==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ejyenbdxm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 04 Jun 2026 16:22:32 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-96395e5f46cso965244241.2
        for <devicetree@vger.kernel.org>; Thu, 04 Jun 2026 09:22:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780590151; x=1781194951; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=k3wL2K3dlb2dNxaCHLSI8Sbji31i/l3i8H4s1lAhgCs=;
        b=cJfgV0cliH1hNhe65HWQC8QT+t7KFeeq9JMyOkD518E7n/vDHkgW3FsL6DB7VG0a90
         P4XSKxzG4nrs6lmav0lQ9iGzXD7Ot/VvC5bBgkzvNih4SonNpo2S3tG7uUdJEu97uzxb
         QRYtW1CL2lpzBVaVg+7wDwNqDw/VYIk3pKLKVkE0Vf41iCq+LHkx7NYkRvVD4HWhosXF
         q1HOhWNMtTSKtAbfMvgZOWrJ/+GPj2dZGn+XEZYf82WWZg/9YxR/Oug42MgMNYxhJWWg
         B2kLGnQh4EkwslEpJjZrWvIfNwtkzIm+hL7EFQ6fqqiVGIr94LQrmMCGWVnle6fngG9F
         eQiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780590151; x=1781194951;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k3wL2K3dlb2dNxaCHLSI8Sbji31i/l3i8H4s1lAhgCs=;
        b=KAuwNkw9PO2/zX+NzFqp2av6GzXZ2EZF2O0J/wkvQ5kUko8SO10OFd56b5six89kjB
         mb0+60RGXQymSbFV+zw2RLAD5gAeWbVlhy8mbg+fsVwpNZwyFyK1RLHX+6B1iy3GrHp4
         d8Gu+k3bB6ci2jUNsZtnwMGu1/VC8YcLqI5hBtodZkUBX5YW27xc/2dep0kiyj/0Xbrn
         yRKTuQUh+pxSSYW5e1XRGfJmGXXq7gbrdkPX3IspY58gJOODK44tMBhV4cMGIlyUXniB
         y84lv2gT9uklCQPp1SuyySODSH6Hnp/wHVxtdC7PX6KgWTmLHTu0xkAKFcCRZC+tPeJw
         c2pw==
X-Forwarded-Encrypted: i=1; AFNElJ9RcTWBhe4PhAPK0VGtw7W6zYV0YLTHhRlo7m1el6lkRPpG8BsJ+tKxhMUJibAYhbDXmgYDzZ9qmN7M@vger.kernel.org
X-Gm-Message-State: AOJu0Yxk3FYfc4g6mpPyNfCK7Q/nMlbHNfWzEVW8g0i4S5scOP3/hfVz
	sCK/8pNMMcxbBV7VOZId8RlEH2wkgmpL+P1/x0KsvNMMCgt5t/fF7OkeuNy06d6HXg7CpHks4i4
	S3R4H0JkEP4/ORD1Xv1ntbnBRX5ood3kTj3kupKejVzvfEPWqwAJg7+3T62JaAvkN
X-Gm-Gg: Acq92OHxiuC/H5rEnTeP+XDplTpyu4r/vccIt7vyFZbuaJMlLHjH5cVjf3eTtvD18/D
	jyOaHzkmCxQlq6LFHl/jDAa34rPhsOxELsX9E4KZ372Nx5CQmRWvObpjZfCv2nHIm43ng0Hz43C
	V0Kk5OwyI/6cNoTL6eImsgfu4c6vy0Fq8WvAo6PjJr1rEL4Qq9v7IizWufaHm22NTmD/4vD8SWV
	cRSdFnu1KuvZqRc5FDqesUq189nbyyvuwRyoTMEj7sIh+IqmjP0vUngRU8Nza38ihWl1t2EINdn
	OKC2ivyicSJV3VoOl1UIsFbPv7Esi9mt2WLS7PSfLlPbFvE5ntP+0aNzR4Ho+/Pqo15Hcx3x31h
	J6vdlzzxQF0borMKsZLOycY5YenTp65MXo/qUDI7fP0by+U/DRNGlbD8sQPF1WR8SIJ5iXHp8/H
	dGdMSqwJVxBWxVb/tu8QcCO5SHmY1AoC1cP1CvPCjYYk2JPQ==
X-Received: by 2002:a05:6102:94f:b0:631:ec2d:12b2 with SMTP id ada2fe7eead31-6ec2b17cf54mr6178849137.1.1780590150153;
        Thu, 04 Jun 2026 09:22:30 -0700 (PDT)
X-Received: by 2002:a05:6102:94f:b0:631:ec2d:12b2 with SMTP id ada2fe7eead31-6ec2b17cf54mr6178772137.1.1780590149625;
        Thu, 04 Jun 2026 09:22:29 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-396ac2d5034sm17591591fa.29.2026.06.04.09.22.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2026 09:22:27 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v7 0/2] arm64: dts: qcom: fix power domain handling on
 SM8250
Date: Thu, 04 Jun 2026 19:22:22 +0300
Message-Id: <20260604-iris-venus-fix-sm8250-v7-0-7bd2f0e5bae8@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAD6mIWoC/43SS27DIBAG4KtYrEvK+5FV71F1ge2hQartBGwrV
 ZS7d5wskkVRu0H6YfhGaLiQAjlBIfvmQjKsqaRpxGBfGtIdwvgJNPWYiWDCMC45TTkVusK4FBr
 TmZbBCc1o9NKB8GCVtwTvHjPg6c19/8B8SGWe8vetzcq33b/ElVNGWyM1gDHCqe5tKmV3WsJXN
 w3DDheywat4YIJVMYGYiYr1WKY75yuYfMZUDZOIWRaDcaBt9KaCqWfM1zCFmMcXBqYs752oYPp
 fmEaMBSGk0b3UTlcw88A0FzXMIKa506ZvITr52wCu91FnOC34c+b7vEkbCtCtKM37ZoTz/DqEM
 kPG+usPvdAjxXECAAA=
X-Change-ID: 20260131-iris-venus-fix-sm8250-f938e29e7497
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Taniya Das <quic_tdas@quicinc.com>,
        Jonathan Marek <jonathan@marek.ca>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Dikshita Agarwal <dikshita@qti.qualcomm.com>,
        Ulf Hansson <ulfh@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-media@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2209;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=KDONWoVWgo4bQVHIX5jep12WUUSRUxz8kNJF/VhmCpQ=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqIaZBXqz/eOv6SsVdSHfYNYXRqRBPY0J8sui/B
 jhNDL2e2HyJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaiGmQQAKCRCLPIo+Aiko
 1ScVB/9o14pbiVemUmz9SJ3JKaNgvASIRblAOhzAS3YU6g1eiawgEsP08a5cIbYb/xu7mxrQb0e
 wVhGoZLEwnzHSOldaIX9uk7a/RJRPc+uDViiI+aIpN8ShCnXI5F0VV84GRakr69sSkzFw+lEBqE
 TtIPeLyQn9AiTKOTwcWvaYVqX1NBS+N0Yh6ZBVj1FGCOMPWsGy4UOe5j4DUdjmBPknCy4aa0yc6
 Eq2B0JOytVwTPNlYRAi9azpWY6c1rgzPAl7wKfjAk2KDB1xm8qB2Baah5F1B0PPk3Gw4wLSun6K
 q/bwYSfQYdm1wy8AtKfSgG0aGYxnIqSt1pUFng3k6503FYdJ
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=JaSMa0KV c=1 sm=1 tr=0 ts=6a21a648 cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=bC-a23v3AAAA:8
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=cvYA71F9yvrgsMZaK7wA:9 a=QEXdDO2ut3YA:10
 a=TD8TdBvy0hsOASGTdmB-:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-ORIG-GUID: XxR2GNIEJdgDO_Nxc85hapPF1o55Nrm0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA0MDE2MCBTYWx0ZWRfX5P+5l4fbSPI8
 WaAvVG4B7OawqlkCWWdVvJzeHufngRtNq+v/qPwyHOII8sMRH35/0akirQTXYUyMtuq/I8Lgxs5
 UGH8W/1ldUzDYZ6bGwjjaRlhr8zjX9j4XpFJpZNx7YsC5VUXg/xbt9KED+iVTfSbjyViM6AICqT
 FMoafmq7S/K3v+Mu4RtCGCNEejF/Ua1+43XRoA/FcJWgjg0smTrcz3oeD7JrCfmhBC+UTR5ri5P
 Lm3+hr85VTarXhU//lhYd+zxbO9G88FlQ3f77eq53K933aYlVWia99JTbttEyDfG5RS4MK2aTDA
 pWBnV3DmcuWRz0WPJzMQNZMrI0vcfet/K0gWuASphVqFen+32+rtNodQZ77fIwtf9vXYMJ+PkkK
 H0YtFs0TA0rDpSREXZCemlkSmcvEndm3bv5H3XGRSrxkZKE9FXuiORaL4yZ5NMu0Oh8flkNSOKq
 sXihwSdldjna6OG627g==
X-Proofpoint-GUID: XxR2GNIEJdgDO_Nxc85hapPF1o55Nrm0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-04_04,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 bulkscore=0 adultscore=0 lowpriorityscore=0
 suspectscore=0 clxscore=1015 malwarescore=0 priorityscore=1501
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606040160

As pointed out by Konrad during the review of SM8350 / SC8280XP
patchset, Iris aka Venus description has several flows. It doesn't scale
MMCX, the frequencies in the OPP table are wrong, etc.

Let's correct the Iris/Venus enablement for SM8250 (unfortunately also
stopping it from being overclocked).

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
Changes in v7:
- Revert back to the levels in v5, they were correct
- Link to v6: https://patch.msgid.link/20260512-iris-venus-fix-sm8250-v6-0-51856dbef83c@oss.qualcomm.com

Changes in v6:
- Dropped patces, applied to media tree
- Corrected levels for MX rail. Dropped the review tags from the patch
  to enforce the review of MX levels.
- Link to v5: https://lore.kernel.org/r/20260209-iris-venus-fix-sm8250-v5-0-0a22365d3585@oss.qualcomm.com

Changes in v5:
- Fixed maxItemx -> maxItems typo
- Link to v4: https://lore.kernel.org/r/20260209-iris-venus-fix-sm8250-v4-0-9662a0471d82@oss.qualcomm.com

Changes in v4:
- Dropped MX voting by videocc: it's almost-always-on (Krzysztof)
- Restored minItems for the venus device, preserving the ABI (Krzysztof)
- Link to v3: https://lore.kernel.org/r/20260204-iris-venus-fix-sm8250-v3-0-70fa68e57f96@oss.qualcomm.com

Changes in v3:
- Dropped applied patch
- Fixed typos in the commit messages (Dikshita, Konrad)
- Corrected MX OPP levels (Dikshita)
- Switched Konrad from Suggested-by to Reported-by (Konrad)
- Link to v2: https://lore.kernel.org/r/20260201-iris-venus-fix-sm8250-v2-0-6f40d2605c89@oss.qualcomm.com

Changes in v2:
- Fixed example in the new sm8250-videocc schema
- Link to v1: https://lore.kernel.org/r/20260131-iris-venus-fix-sm8250-v1-0-b635ee66284c@oss.qualcomm.com

---
Dmitry Baryshkov (2):
      arm64: dts: qcom: sm8250: sort out Iris power domains
      arm64: dts: qcom: sm8250: correct frequencies in the Iris OPP table

 arch/arm64/boot/dts/qcom/sm8250.dtsi | 36 ++++++++++++++++++++++--------------
 1 file changed, 22 insertions(+), 14 deletions(-)
---
base-commit: 7da7f07112610a520567421dd2ffcb51beaefbcc
change-id: 20260131-iris-venus-fix-sm8250-f938e29e7497

Best regards,
--  
With best wishes
Dmitry

