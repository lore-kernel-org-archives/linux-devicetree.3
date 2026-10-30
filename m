Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793364202;
	b=IOK9S9l9WIzfywEJakHjmtCDj/v3I5KDjOXfZpe4q5onvoqNll++g6Ua0NEs/m8e8sdO
	 PJrQeJuDkSCIby6dz9uYJqsONxw/Ok78h8RKlHf7AnUIb/8RRavjQc1kSFdew13EBVlp9
	 ZUgjh6bv990IyVcOIRN8bHKf1FB6DuKVaUt1F+s4EJLv1fkAoRE67NB/NfJi2QjM44w7e
	 1pcPQ62eIZ267tXn+tEJJmQM1BYRNGbpfqm475BcVOAz8i4ejkBIfcKXoXi+s8Ue6EFKc
	 ufwMbcVH84FaXAcquyY+LbQB713oQ89x/GaO/rU0vPGPbR96dub4XrMcKDqa1m7srUw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793364202;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=v3y02WtQy7EFMYSobYs1C0IhrIzB4b0G9kvwXB6qTfU=;
	b=ha3QJqWoEbTeBeEBaJDTcYPk9iRZvQqk5TvvPWRN+E+mRHwX0W3NEGwWjHvUWSQL8fTL
	 j9bPzpoc+lxe8rvD/W6FQOslD8tkLLIa4YdAZbqj/HnuM+g+wnZE3j97c3bTrUwiXoeAy
	 lguqzglDCL1WA/08d7CciGnXXE9sAqnol44Z1ugsqtoVdk/10Rh2zVDxywWkUeRmOsKw5
	 UrGjI3sSLKRYv++6UR2sj4qj94mxjCnzYs2pe9GfQufs8elUOFTm4WLYOTt0F2hvIXRGx
	 k1pKMeHCxyjR4+gnqLXDk17L6BCaKvbQcdO01SxeBnufu9x4FscX8x9/lmEwHjbTAuA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BYAv2km3;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=adZbRPpy;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C5A6606A31A
	for <devicetree@vger.kernel.org>; Fri, 30 Oct 2026 12:43:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6C5A6606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BYAv2km3;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=adZbRPpy
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69UBG8OC4144767
	for <devicetree@vger.kernel.org>; Fri, 30 Oct 2026 12:43:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=v3y02WtQy7EFMYSobYs1C0
	IhrIzB4b0G9kvwXB6qTfU=; b=BYAv2km3l1v6m4Tj5aaig98jJ3Z54crMH9120u
	pJe++LSGHLYvh/YF7pCkcVpTifWGbxwO5a5FwCkV9BF+vHocv/jbLvtnzqi2Nb2R
	hlgDThcr4a5tIS+MAtu5SP/9jbcyAd0MQrzAnWjrrgnxwsIe24HkxznO+8xqsuNK
	8/xYNdD+u3nna1g/FHfle+ATZJbYKvUMatE3Nb8E4QwFQHXiIC+R/8U4un40a+qR
	XddYKt8Yb5eOU+c/Bdxen6vT7qf4NpTbQJ0Og1KZnuN5FKdXi1Ued49dKYevTJNK
	d0iyfaYflJW+FQPmZi8EYglDOhc8orcz4Vi71yEoqzHhalXA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hme7531h9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 30 Oct 2026 12:43:21 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2eb361b86dcso4452275ad.3
        for <devicetree@vger.kernel.org>; Fri, 30 Oct 2026 05:43:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793364201; x=1793969001; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=v3y02WtQy7EFMYSobYs1C0IhrIzB4b0G9kvwXB6qTfU=;
        b=adZbRPpyv9sDXKrbu0Iyr1D88VVAsUVDHUDO+nMazjm40l4Wa5hHrYV2qaBdOWzZHN
         Kea+nxVyU05mgcDPeDyx8ctKXAdtrO3NhvjfLbnA5l01B5DIgnOELCtf60QAr2oR1yR1
         1fUhhEZygtdP+PB/320xK5X2iWsfT17ai9jvAXSMbK1m36WQ6pbwbaxM3T3IjxGjPeE9
         sOnNYlOmKhJzYooUXEIOfDaHeDgruLYgFA1aUIWuZt2A+xMGFW7vtdhmvl1uQQXgQAAr
         ubE4ufe6rI/jpHN/I9noznxg3vFz5mFcGnLd1RpUI0rwvIToLBHsFIJzsMUcIhQSIDPT
         0XHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793364201; x=1793969001;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=v3y02WtQy7EFMYSobYs1C0IhrIzB4b0G9kvwXB6qTfU=;
        b=LkoRMa6pIQD4OkPKF93hYXXnJP5w036sFUaS8mqKpv2fru32ya4BMJhNEheC1v/8wA
         O3ANTiz1rrtGexvaehUUMSYiPQDkGZs+lwLs3olmwzUeNOHsGc/0ubdFPnvNFzZ29Vkx
         vuYEUcnTbcDVywcW618eJzKK0KF8jXdFsfzsw79YQ2lLgphJhxjcvY+ON/wwWeh3QVx+
         V4HNkWWx0hxby1l7R48ih+T24ivnf1SaR/NrO2DfnCvaZjDqc7ojkNSwj6QHkx576rlV
         BjCSrF7TJwS3rEOklAndwfNJWPsvqHLTgL2SWA/nGxj4L4LXoU2jnAxiJeaashqo+rXx
         93UA==
X-Forwarded-Encrypted: i=1; AKwUvBylQ7EuBai2vXEYBJpnr69xn0rfrfJiwxyosoQxPFm63pqlfkf/DcKh3YjDuWCUG4KR1+6z/9rIQvrb@vger.kernel.org
X-Gm-Message-State: AFq9FYIWa99SmDTPuru2u6sIC4+Pmlgw6Wp+KZJ327ZGLKKzWyhC1RoD
	QXNfchQOOF6/fKzMqc2W8ymfOtjhUhnNuupaZ/7V03NF36SYrp9SeJUBi23XoMAvUm+0PbSqUgm
	58c32vE6MI7+prF8oO18Xij6tmDrnieb3dNgthHn0DsqykvE5ZWirga4gA8g+3GNSTsMQ290B
X-Gm-Gg: AYBFou1Vs4MO0nCslnrVgxgRZpyn5+r/HbIAblAh5HGGPDCvBQg2xuWRI34spMsPKTV
	2ng63GHlcJEr3Xz0lPtsrsyvEKbe/v2+a5iWhMfqk/Gctj/qPmdKrKynpFujM7A3q7Qi9z5YV+O
	k5ME68JbsRzgN/mHNXD6B7mGSxNURPhGTl+QOzRr1FXdCVVNuzsY4NDKOw3usYozwcRs88FMlpD
	87DkZz9e/0ftGX4sihWm9s7YKlW3VPKWsJ5t6xNoEkDFkUj5hioTOo+FYaarucNmS1E/0LFifi2
	gK2FzK9tvdb4mcRZUF7OQNDcsDtDJTwgeQwD7w9wEjWT609MBTbXyjiJ72bYW1lqfMCIPAzxdIf
	XFo24UWbzksl5iNjl49SeeE0RFLIzlHSx2L6wchW0hpeoFOpFDlrkdLKuRX990ABE/ryWQGM7TP
	plSX8=
X-Received: by 2002:a17:902:e88d:b0:2ea:8442:db72 with SMTP id d9443c01a7336-2eb364f19aemr22543365ad.54.1793364200951;
        Fri, 30 Oct 2026 05:43:20 -0700 (PDT)
X-Received: by 2002:a17:902:e88d:b0:2ea:8442:db72 with SMTP id d9443c01a7336-2eb364f19aemr22542955ad.54.1793364200386;
        Fri, 30 Oct 2026 05:43:20 -0700 (PDT)
Received: from hu-nihalkum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eb3922f5dasm6450075ad.25.2026.10.30.05.43.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 05:43:19 -0700 (PDT)
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Subject: [PATCH v3 0/5] Add CAMSS support for Qualcomm Hawi and Maili
Date: Fri, 30 Oct 2026 18:13:00 +0530
Message-Id: <20261030-hawi-maili-camss-v3-0-9742bca8cef2@oss.qualcomm.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANSQ5GoC/32S0WpbMQyGXyXkeimSbNlWr/YeYxeyLC0H2mbNS
 bON0nef08IgoezCBhn9n/RLft2uflx83d5vXrdHPy/rcniaQfqy2dpen374bhkz3hJQAaG02+u
 vZfeoy8OyM31c113nYTkpgA/aTtnPo8fy+x357fuM98t6Ohz/vFc44+X1P7Az7mBnvfdMzil7f
 D2s693ziz7Y4fHxbl7bC/NM/zgI+BmHJidMEhENbWKfcN4+mj3688u0ffroeNt19d0laTndbzS
 JCUODQpiitIIDIAQqiZqqEgYNYX33rSfbz2ndb2ZPLVxb7SHsJIgB0rtXFw7lVCyZJ6nXqp5y1
 VHAcuVIkLhDdqulZnQI7DwhzA2uVaqMjmxcpI2UiV2qWEOI4CylYW2aSu7XqtmGR7N5mM1LXLZ
 HVmPKkDgn9OEZNN/Ucq41MqKZDfBiIywGsGuxHpa8VTdNN764eAQAMUrLXnoaWlKi6m7oYaM3l
 LlovFbV0roLqcHIOUvCWkYM0zEGTZelosxK5UYlAk0ztMHEglC1zMq1waiYq43RC82x0rjxZWK
 UpjmJbGnmK9SRPHOqqVtJc9sWInStGkQ95v+CnlO0gG4kA3JmH70OV+91IvvNDKPPGdTixlinK
 ca5VgrPSpobacmSybDw/J5vfwEgP+6YnQMAAA==
X-Change-ID: 20260923-hawi-maili-camss-b5dc43a00ed2
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Bryan O'Donoghue <bod@kernel.org>,
        Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Suresh Vankadara <svankada@qti.qualcomm.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793364192; l=5721;
 i=nihal.gupta@oss.qualcomm.com; s=20260608; h=from:subject:message-id;
 bh=lsMwYHuyept0TY3G1YvNs+p8Iz3C6tF1vslYFSKw0VM=;
 b=pnWdy0oGgt4NBHEuPPXjYTiu2Dtqebe2LXDZiG5LXd38FTl8q4HOFxYtX5igdHTNXjA0Q3doH
 fJ6AY1mc807DS+GpLcOrzy8c0dH1EL4AA3rd1E7udAhOa+gAudMgBhu
X-Developer-Key: i=nihal.gupta@oss.qualcomm.com; a=ed25519;
 pk=DIbyFMNwqU/iMvU/0pCQp2wmRVgtHFBT3PcSu+A+Ncw=
X-Proofpoint-GUID: 8c3t2aIqDQO6GB8gMYSbeiyRI_J2RPLe
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDA1MCBTYWx0ZWRfXzsFW4swSuio9
 D+E2ivBfXmJOgJc+131grjUsO63j/vzC213Lh5bPiO9230r7ezBWkmZl5GeGy7uNzJ7ThwfxEzg
 PpJ2iMfnU0uhPVxLhgh9NM2PefYx/Ga9pk7DyOuB1MlPRVZ2xn5mM4kQi+FgD+GYsHhVJPqrcw1
 4fU3TFzPU8nOAVAnPuIyipp26CarnCEG7liatTA3rWMH9cV42W5lm7bEc4eZizWUTBbkwe0zgUb
 WDJthwcyE/+LeSX20x30a0IiYIuXMqWr0XKwPpyLqm4LHreUIxBmw4Z4ZXc7VjO8wq0cCxFLUtY
 snLTcdDSdVvyeKgxx7vXMIyfx/s5UDyo+FGHpXVIFkVsT+DUGNeWbtEU5cZNnT9nYAUoQE9SLXw
 FpqI3qJywqU9xqaHZbV8zUz23MfJSjLEIt1uRAZGw7pDc3gxiM/XW98yJH7UEUiZtovVdZuoE33
 4WEiytUFSpQbFMJF3hQ==
X-Proofpoint-ORIG-GUID: 8c3t2aIqDQO6GB8gMYSbeiyRI_J2RPLe
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDA1MCBTYWx0ZWRfX0dPHugr1Q3F1
 EUOGTfytTEy+TcZPOR0DYAbe8/GCOI1DcEuagxz0hP4o9ENQbXqq/ru3WSXh94KVe0SzVAYJRxL
 QvN2ejk19RTQll0F3zfDFSng4VJe00M=
X-Authority-Analysis: v=2.4 cv=KdtHIgYD c=1 sm=1 tr=0 ts=6ae490e9 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=E40xv7DK0V-5u9Ck0vwA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 clxscore=1015 spamscore=0 phishscore=0
 suspectscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610300050

Hawi and Maili are recently announced Qualcomm Snapdragon SoCs [1].
This series adds Camera Subsystem (CAMSS) support for the Qualcomm
Hawi and Maili SoC's.

[1] https://www.qualcomm.com/smartphones/products/8-series/snapdragon-8-elite-gen-6-mobile-platform

Hawi's camera hardware topology:
- 6x CSIPHY (CSI Physical Layer)
- 3x TPG (Test Pattern Generator)
- 3x CSID (CSI Decoder)
- 2x CSID Lite
- 3x VFE (Video Front End), 5 RDI per VFE
- 2x VFE Lite, 4 RDI per VFE Lite

Maili shares the same IP as Hawi. The only difference is Hawi has 6 CSIPHY
while Maili has 5.

Used following tools for the sanity check of these changes.
- make -j32 W=1
- checkpatch.pl
- make DT_CHECKER_FLAGS=-m W=1 DT_SCHEMA_FILES=i2c/qcom,i2c-cci.yaml dt_binding_check
- make DT_CHECKER_FLAGS=-m DT_SCHEMA_FILES=media/qcom,hawi-camss.yaml dt_binding_check W=1
- make CHECK_DTBS=y W=1 dtbs

Dependencies
------------
[1] https://lore.kernel.org/all/20261028-kaanapali-camss-v23-0-95f250b18612@oss.qualcomm.com/ -- Kaanapali CAMSS driver and bindings

Patch grouping
------------
I2C CCI bindings part for maintainer Loic/Robert/Andi (1):
[1] dt-bindings: i2c: qcom,i2c-cci: Add Hawi compatible

PHY driver part for maintainer Vinod Koul (2):
[2] dt-bindings: phy: qcom,x1e80100-csi2-phy: Add Hawi and Maili compatibles
[4] phy: qcom-mipi-csi2: Add Hawi support

CAMSS driver and DTS part for maintainer Bryan O'Donoghue (5):
[3] dt-bindings: media: Add CAMSS device for Hawi and Maili
[5] media: qcom: camss: Add support for Hawi

---
Changes in v3:
- Rebase on next-20261029
- Squash Hawi and Maili CAMSS binding as a whole - Krzysztof
- Add description for IFE and IFE_LITE IOMMU in CAMSS binding - bod
- Correct the lane count variable fallback path - Sashiko
- Add CAMSS top region to binding and DT - Loic
- Use split addr_update/reg_update in CSID and VFE 1190 - Loic/bod
- Add SOF and EOF enable bits with top level RDI status offset to
  allow their corresponding interrupts but not configured on - bod
- Move the common CPAS/GCC AHB and AXI clocks to the pm_clks array
  drop them from the VFE clock lists - Loic
- Use the GPIO function with bias disabled for CCI sleep states - Loic
- Collect RBs from Loic, Krzysztof and bod
- Link to v2: https://lore.kernel.org/r/20261013-hawi-maili-camss-v2-0-fc93222da89c@oss.qualcomm.com

Changes in v2:
- Not an RFC anymore
- Rebase on next-20261012 and drop the external CSI2 PHY series dependency. 
- Drop DTS patches; they will be posted separately with Maili DTS dependency.
- Collect Reviewed-by from Konrad, Abel, Bryan
- Split CSID and VFE 1190 into individual files rather than in separate
  combined Gen4 files - bod
- Remove reduandant is_lite condition in CAMSS CSID and VFE resources - bod
- Replace bias-pull-up and bias-pull-down with bias-disable for the
  SCL/SDA pins of CCI nodes in TLMM, as internal weak pull is inproper
  with existing board level pull up resistors - Loic
- Drop the unused reg_update_after_csid_config flag
- Add lane count fallback path for CSID RX configuration
- Add Hawi DPHY support by tuning register table, which prevents
  potential stream stalls and SMMU faults.
- Add a standalone Hawi CSI2 PHY compatible and make Maili fall back to it.
- Resolve conflicts introduced by Glymur in CSI2 PHY binding.
- Link to v1: https://lore.kernel.org/r/20260923-hawi-maili-camss-v1-0-cbbb42e534ef@oss.qualcomm.com

Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>

---
Hangxiang Ma (4):
      dt-bindings: i2c: qcom,i2c-cci: Add Hawi compatible
      dt-bindings: media: Add CAMSS device for Hawi and Maili
      phy: qcom-mipi-csi2: Add Hawi support
      media: qcom: camss: Add support for Hawi

Nihal Kumar Gupta (1):
      dt-bindings: phy: qcom,x1e80100-csi2-phy: Add Hawi and Maili compatibles

 .../devicetree/bindings/i2c/qcom,i2c-cci.yaml      |   2 +
 .../devicetree/bindings/media/qcom,hawi-camss.yaml | 314 ++++++++++++++++
 .../bindings/phy/qcom,x1e80100-csi2-phy.yaml       |   5 +
 drivers/media/platform/qcom/camss/Makefile         |   2 +
 .../media/platform/qcom/camss/camss-csid-1190.c    | 417 +++++++++++++++++++++
 drivers/media/platform/qcom/camss/camss-csid.h     |   1 +
 drivers/media/platform/qcom/camss/camss-vfe-1190.c | 217 +++++++++++
 drivers/media/platform/qcom/camss/camss-vfe.c      |   2 +
 drivers/media/platform/qcom/camss/camss-vfe.h      |   1 +
 drivers/media/platform/qcom/camss/camss.c          | 229 +++++++++++
 drivers/media/platform/qcom/camss/camss.h          |   1 +
 drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c | 136 +++++++
 drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c     |   1 +
 drivers/phy/qualcomm/phy-qcom-mipi-csi2.h          |   1 +
 14 files changed, 1329 insertions(+)
---
base-commit: a39c950806213f6861d00f90729acaaa21f2d95a
change-id: 20260923-hawi-maili-camss-b5dc43a00ed2
prerequisite-patch-id: 6108fea87bf95e2911f09bbe7e95fa536c3ce397
prerequisite-patch-id: b347ad60c475f3035b04ec76741e0f1b5f095580
prerequisite-patch-id: aa51e15c5698d3425e979c810ff54968178a364b
prerequisite-patch-id: 5faef8cef855ce6fa00e2c7f10f125431ede40a4
prerequisite-patch-id: ae577f411cccd0e6cdfcfd05ea6cbfc3e87eca37
prerequisite-patch-id: 56eff00251984e6b3da63327eec1efcdb8194ef1
prerequisite-patch-id: 768be92ac0d44493176dfdcaddd24256719a3761
prerequisite-patch-id: 9908a408d5259107a6f00780d7147cddb625b02d
prerequisite-patch-id: ac9c23e579f4c3078a07d3e45373bc63729cf992
prerequisite-patch-id: d22bf3220b43f8f0bc29d0445edb7deaeb7e57b4
prerequisite-patch-id: fb4e676ec517317515f02fe4a2a482a64942c165

Best regards,
-- 
Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>

