Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C0E93909AC
	for <devicetree@vger.kernel.org>; Wed, 24 Jun 2026 14:51:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782312676; cv=none; b=uWsnh1KsflS1phpkLo2z+IBPdcaNV7XuojSzFaZLE+moAfqGQJW6UxyXvogXB3nPxgEMmAopSd//oawb+6QKV6ucBoIb/EDcNtbNe8VEe/fMWhMl2lPam1roXLimoJYuyDBsI568+li+iZVWGsuDtPi+hjRMcudXa7BJpQqb/MY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782312676; c=relaxed/simple;
	bh=Z8QjadXgIGtPgACTtDMUk5aa0NamCujq+Tig0aGsLdk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=DqmjsSHJov9FsWTB4/mDsB357+vN2sOfTr4iUHm6OhNj8bpVUfje/bYZf7UORR3iEGdZ5XKKuJ0WDWirlPZ2LIMxOCzGJtI/lc/FJ8il59Fq/b4MhGXYuEKkIE1O0aJEruxldqx7IznvXmFvU1BJwof0/GPNjtgMdRfHfgViO9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Bk4ok15U; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MZX43UpH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Bk4ok15U";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MZX43UpH"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65OEfvSb3078651
	for <devicetree@vger.kernel.org>; Wed, 24 Jun 2026 14:51:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=QdRom3OlZUqLYrHE52lKlo
	KF1BLACd/ghD9VVvw0yJw=; b=Bk4ok15UkoJD9ZtBz0DcsxzFesht5vH6CauZTu
	zF/6yalTIzKOTnoKTImDoG510/zbUPHy3Fss9T6EQELhASJ+K8jc6Z9bp4q3Wa58
	AnAUZ6V/5BcTENHHqcJCmLu785Dv0M9oqDV6KlJ41IrIzGaK0ZmUwTBvjHwWenHL
	w69KLyAfHXe1tE68B8KxGaIxRdI+GX8b8chDB2yQRm/HL6dPDoe8KB7KrsDU7wMF
	mScFDeSOzGGV9hgdsfCWJDCwGqzAFOKofiHr8/Hibwcz7LooHhv3VxXSVHnmeiVw
	FvcxcJvTUphMgQF1aJEECJ4O2RIrXbOPfadAi5N+zDPmcPdw==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f05bfarmv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 24 Jun 2026 14:51:12 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-845319bb97bso989336b3a.0
        for <devicetree@vger.kernel.org>; Wed, 24 Jun 2026 07:51:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782312672; x=1782917472; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QdRom3OlZUqLYrHE52lKloKF1BLACd/ghD9VVvw0yJw=;
        b=MZX43UpHLjytAB5Bqr/fb+BpOvsEjLojUig4D2WfVUbqefYttJtETlVran9ERjpHkx
         DzYgcT9zMm9UDx3uM3SR80hqx05Qk2nfzO+6gozut1utms2Pfy5n2Z/9LjCOSE32lcyL
         hWdx5Hn8jbDo4pCaQAblE5WITvzomxeeqab+xfYwJXB0np+d9nRdlLD0W5WzMFALAmKy
         F0BlkI2Z0p7gXkk5t5rZwwtTv4diPRIe+zfVyQjqNBUZ7vVoPNB575rxjeLYj3aoLAVt
         0iRpjqV504+PGG2pvRb2DbLe22m921Tl7gs26YItvRg+BCE3Yzzl1z15GmIid18Fg5KU
         49DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782312672; x=1782917472;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QdRom3OlZUqLYrHE52lKloKF1BLACd/ghD9VVvw0yJw=;
        b=bw+y3EAEVoSdYYmWDU99ZfCsj0443GJgp1lzMAKfcakstfWr7ydi2eJSwMCPFuD2Xj
         P3vNEhWbxqnpaaBvbOfvJ0GWvDrED9e/HFVrE4Vw8Ty+Vzfgua/8IY/WHQDxy6LkavUN
         cls3YD9EB4mu+MWLbg7UbLPiRJR4aJdkq1bmpoICNmBBY7PqJ0s10+HR3rGNzTx+DfHq
         t4zu9p+kkqgwBUtSdyGlhVaEqPSi1ZznkCKOLjKp+eb7edEWJ3EEmaW7qsQ7Y/9kyIut
         /9oOi+2yyUz5bmeKKHVdGkzsNIe8vMZQMwC9car3Wsh2YQUEbkNvVpEY2hDFkJFE7VaQ
         Stkw==
X-Forwarded-Encrypted: i=1; AFNElJ8dYeu5qA80N6pSxXXOf9t+IP4dz4LJLnL/TTgVwar87LFT98/2aJ+14CeOubm4ukf25PXST3Zc2gAY@vger.kernel.org
X-Gm-Message-State: AOJu0YwfFkJJgmaCHYVQycEe2PbH23HU7EC7HrZgrrcZiek3c03oYUny
	lZ+HhRFmIiPMjvoXH+p5qm2n2NsSHPC10yAGTYHtez6pCG/iGNugXySStGCJUoY2waorKQJD3AR
	iDI2Bfma6yM+dHA+zNCaoB7Yu17N/OK0TbcHYGonYKOAUfwtOPStsi/tW4yI/zZAq
X-Gm-Gg: AfdE7ckgnswV1kDh++WneyzRP46CGoYR/95NjMGa2Dz6UZ0zBVJlZyPjpVwsbMU1UMp
	0L0jiIyiFTWd9F47wnaJSHv0m4TdUJ1xDZ1VbG1AlXj4r5bymrkpi95Y0AddKANIJ/eYJbFPB4F
	5Bfxv3xdsc40Z8YC8Xwil1qPtSxG4rK6CmUqZJZ96U4c54LjYHVo5YJMWN4gH4LCj2fh5ggCazt
	Kor1GyuG909wWs20CKeSHpz176aMRkGOjPTFrCsDs3p9gclRw5Z0MOlIl5lT467+5mtZV0ufphH
	hds/WrtmavLVa0s+fqamrkffopG7SFyBOxbxZbUjXuBruBQq8O2VJB2ihrL4hBXqxdyZFha+k9h
	o6cArdAEjwMBoOZx8V4FX1Gz7Yfc7qT/Hcwmcc0QtbA==
X-Received: by 2002:a05:6a00:4210:b0:845:44c7:2fdd with SMTP id d2e1a72fcca58-845a2c7d835mr3912302b3a.34.1782312672295;
        Wed, 24 Jun 2026 07:51:12 -0700 (PDT)
X-Received: by 2002:a05:6a00:4210:b0:845:44c7:2fdd with SMTP id d2e1a72fcca58-845a2c7d835mr3912264b3a.34.1782312671733;
        Wed, 24 Jun 2026 07:51:11 -0700 (PDT)
Received: from hu-jkona-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-845a3fcc839sm2643271b3a.10.2026.06.24.07.51.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jun 2026 07:51:11 -0700 (PDT)
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Subject: [PATCH v5 0/3] Add camera clock controller support on Glymur
 platform
Date: Wed, 24 Jun 2026 20:20:28 +0530
Message-Id: <20260624-glymur_camcc-v5-0-a321df74b1a1@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALXuO2oC/3XQwYoCMQwG4FeRnreSpjNT68n3kGWpTaoFx9F2L
 Ssy727Vw7rDegn8gXwkuYrMKXIWy9lVJC4xx+FQQ/sxE37nDluWkWoWCNhBq4zc7i/9OX1513s
 vGTWQ2lDQpEUdOSYO8efBrT9r3sX8PaTLQy/q3n1CDeBfqCgJkhfkoHWoyJnVkPP8dHZ7P/T9v
 BZx9wq+GGgnBlYDvA6krDGLzr4x9K/RqukeuhrOKNsFZjTmndG8GpOnlKYalgCcD4E24b9bxnG
 8ASboMlB7AQAA
X-Change-ID: 20260517-glymur_camcc-e230d1bdf3d3
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Authority-Analysis: v=2.4 cv=X8Bi7mTe c=1 sm=1 tr=0 ts=6a3beee0 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=NfzWakH2hsC1MMCkln4A:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-GUID: 04KH9Dp12cIWQsN98VqQIimQIIU9mf0s
X-Proofpoint-ORIG-GUID: 04KH9Dp12cIWQsN98VqQIimQIIU9mf0s
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI0MDEyNCBTYWx0ZWRfXx2+I0hHGwy+O
 pt8H8sVf8P2i6F9OlIzsrWs5xgSV17bCuyQOlx0A3d0uJjFFLnIiKX1pFgrIMexpbLhesUq8k7E
 XcOkmpTGigOhChrfCIvFJ+ce+4ixnhM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI0MDEyNCBTYWx0ZWRfX45M8hLtBovM1
 +he2LLKMH+Ti9ZsfHU7JS+bnpBHokcXRFTaes/PfnAk7Q6MPNvNEqwxi5ChwnfFeeyWuIsVOEqJ
 jmXoR03mohY9wxDIFp1RcVeadg6cnk/lJcHM5Ni1+m1yscsbun6Ka8S0jVvxy9GUFlZXSpG/J9c
 6oqZZgmfcrae7lbKD7VO8OG7IeVSlAt6YaqnKZ5V4h3eG3YD1DScnmzXarFmXqMyrktN6t5c3VV
 xzca5/OFRahsGF/fs864csUnd7CAp1jy5utyMhRPP9Iau83LbzKO1aozqhmkal+FNvO7W482/bx
 XLCiUOAyn/MrDnl3G7vj+U/2ARpxB8ZXYQHSOYzV1btrJFU4246gGbzIjyQdyydhcVHG2usSqOQ
 7tdEptq1HSlZ+o5xectysv17lW00zg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-24_03,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 phishscore=0 malwarescore=0 adultscore=0
 spamscore=0 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc=
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2606150000 definitions=main-2606240124

Add support for camera clock controller on Glymur platform
for camera clients to be able to request for camcc clocks.

Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
---
Changes in v5:
- Rebased on top of latest linux-next
- Added R-By tags received in v4
- Kept PLL configuration settings as is, since defining these fields isn't
  really meaningful to end user & they vary significantly across PLL types.
  Link to discussion: https://lore.kernel.org/all/23e910f0-f996-49b4-9ba8-5acc3bef2172@oss.qualcomm.com/
- Link to v4: https://lore.kernel.org/r/20260517-glymur_camcc-v4-0-9d00acffdbf7@oss.qualcomm.com

Changes in v4:
- Fixed parent src in ftbl_cam_cc_xo_clk_src to align with it's parent map
  [Reported by sashiko-bot:
   https://lore.kernel.org/all/20260513215441.E17B8C19425@smtp.kernel.org/#t]
- Added R-By tags received in v3
- Link to v3: https://lore.kernel.org/r/20260512-glymur_camcc-v3-0-a7196fee2779@oss.qualcomm.com

Changes in v3:
- Dropped separate defconfig change[PATCH4] and included it in Kconfig
  itself [Krzysztof]
- Included glymur camcc header file in the DT patch
- Added R-By tags received on v2
- Link to v2: https://lore.kernel.org/r/20260429-glymur_camcc-v2-0-0c3fd1977869@oss.qualcomm.com

Changes in v2:
- Updated DT node reg property to use hex for 0 also [Krzysztof]
- Added R-By tags received on v1
- Link to v1: https://lore.kernel.org/r/20260402-glymur_camcc-v1-0-e8da05a21da7@oss.qualcomm.com

---
Jagadeesh Kona (3):
      dt-bindings: clock: qcom: Add Glymur camera clock controller
      clk: qcom: camcc-glymur: Add camera clock controller driver
      arm64: dts: qcom: glymur: Add camera clock controller support

 .../bindings/clock/qcom,x1e80100-camcc.yaml        |    3 +
 arch/arm64/boot/dts/qcom/glymur.dtsi               |   17 +
 drivers/clk/qcom/Kconfig                           |   11 +
 drivers/clk/qcom/Makefile                          |    1 +
 drivers/clk/qcom/camcc-glymur.c                    | 2280 ++++++++++++++++++++
 include/dt-bindings/clock/qcom,glymur-camcc.h      |  122 ++
 6 files changed, 2434 insertions(+)
---
base-commit: 4e5dfb7c84012007c3c7061126491bbc92d71bf1
change-id: 20260517-glymur_camcc-e230d1bdf3d3

Best regards,
-- 
Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>

