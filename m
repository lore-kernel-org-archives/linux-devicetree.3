Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795689730;
	b=bkJt4QNDxcNTtmYhh6Tnb/Ub1OFZR+QLduIm2S4kfRcsELvORyAh9dx409tu46yiDY+O
	 rIB0PGtFdG31rtgyAPr8XVo/uaZSVEheBcx9R+ijn4eQTSixASkUPBDF+YKiIg0W63/jv
	 C3MiaDXxcf8vEg2yM38TVcWTZow22eLLUWdn6w2O+Z9/sp1QWNpSGZvCqH5h881h7Wu5W
	 B/76X3NX9eL7LLkskLYXL2eloaSvLxvvADB3b36axvI08em26dA+XtYWQYOHhMMiauqq/
	 H+vsqNtIssdHnHE92kEPYaKgI3IfC+lP/pNMfKueGq/Bz3dq9FQNO73QT6V+MIQKqTQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795689730;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=VZkaf3WpOkz48MU/mGrpWfJlT2QhQUHzMJAz+1FO4Ek=;
	b=b63Kw8zBGT1D0byyEm+d6CGFPDooTjHRvEHBBl6qh+UYabHfycOEHUYR6s+oyTr/CIie
	 Tqka7XL17P5eeUPG4Wd2N+qGvqqKztkTjTgOmXXmVO8ANNJevKLiCpDjWjRL37kHS6i6P
	 uoKhATZ+KmFS8br4N/csBjW7PCnzIIUuhKQpJQWWuAKLC7WohCmgMa8Cm4BIKBqjlnHwq
	 qvupeTRUCpn+jlhC5dfFkxecJYnfIGKOhuKhvT2JwEjORs+9JWMOV8YXn1gZXETrb+ht0
	 Jv+ceuAPnrwhcqljD7stCLKiYMq4gULr3Kjcdt+15ZPHtWgpu1p99gdyePO827DwScA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=D2O9bLqf;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Sl0A0SFY;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D70B6606A337
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 10:42:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D70B6606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=D2O9bLqf;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Sl0A0SFY
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQAXSGU3049854
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 10:42:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=VZkaf3WpOkz48MU/mGrpWfJlT2QhQUHzMJA
	z+1FO4Ek=; b=D2O9bLqfZQ+ueWUx1rHztnHWSor7P1LSeNxkGep7ZmvpSkwVAef
	VF4djEgYv1nYdW5YB0WvtINv36V+egw6F4oXF+XnQd4U7oOL/cKK/SKzPFpAjlKH
	CIZBzG7khoL3AosMd3smf1Z49IW1rSxyvUFV1gwoha+ySrX2FnOEdlE/hlZw8NBd
	n7eH2OeV3/dpQLJGeGWzygXf/3nAzHRsQf4hFxqG4C7S7tw6NAYZtmo1wgUxWtWp
	Q7pLiZyvvKOOTac8oI3QrcNCAHGmKJ1IQH7/MwlHylNnJ8F6J1xgm4/03z5TqFbv
	Q/aDtxWbjfC/zTAoDLnjhbAIBgUzWIWJ1Qw==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j662sargx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 10:42:09 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-386a0f79047so7384377eec.1
        for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 02:42:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795689728; x=1796294528; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=VZkaf3WpOkz48MU/mGrpWfJlT2QhQUHzMJAz+1FO4Ek=;
        b=Sl0A0SFYUzBw2AmrNbzESkYobUG6oVas9pX5cp9cN+0EefifixVIHmESFKxjib2UOk
         9+xS4rWx7dzu/3D6W/kAlS+npkalj2ky3hT6YctiSWejEkE48WVXZRHN6vuhOYiC7wgy
         msEv6X3rNOhsxagsZsCyCJpT7QjqgqaQtSFO+qbiZDE9d2vggtm/ZsYka9HpImnj06fZ
         sfgeAph2AMH16a+4NJaAZtZuJn9Rsy4sD/bH51alr8d9TMRU/7Y+Pf+qN1ubqanXtvL6
         BLlXypkVmbkdRpZJ6kNYx+3kIVtv4QaHw7UQoRZVhi7Y3LkoQ1lsy0o2VNrzPqSs9FHr
         4P1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795689728; x=1796294528;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VZkaf3WpOkz48MU/mGrpWfJlT2QhQUHzMJAz+1FO4Ek=;
        b=YEHOSrWNa4FRC+4r+7WHBRuuLU1k5I5Y2FGN/PpBWHvt6p3ELRfoO/vArHOs0NQsH5
         rmPHVcweRSiT7e11aqSzDzO/VgckcJ6fnm2RJmjXoeMLCo3//QkhKoa16XHXNz66hGPE
         jpMc7U5qKF92UPRiS6tcuxzhHEVqJdWseYdRIJ1SqILMRTp2SlBFeNPTYhSw1lnm5aFH
         gcWfUJVXcmjppM9cdxTboMzqTxw+1LIPqNw5McWB6V4EXzlZs93m7xT+nTTjyxElnpJ6
         UzcmdAr2V3MxzezBRZs9cETqv2jORDuet2t0eVzIP0b4y7llMAb9+48bk9g/sIOtAqB5
         wmoQ==
X-Forwarded-Encrypted: i=1; AL+hErGWjVyvJ0TqUnwFaQco2Vytfp1iNJCZMbhUQRSDUy4bu6/iI8kyQyfbTCcbuk4UW4y1WkQNZkXZgd8g@vger.kernel.org
X-Gm-Message-State: APuU4Z/BB2pK2i+CutiTIwoWn7qPVsAxiRmfPtUf6Na4PpWHYyb4mnNK
	lwC7mFBfCye8BF12ftlGbSfSm090N3eh43d1YTtUzyP4dhJcxJu8UoSRMr6RTy5GASCH3SgrL49
	2WCQlNV0bE4ODu6/a69QAhMdK/mdzKAgQlt0qe4mbt8p2LrEU/8fb4GMT9nebrEZC
X-Gm-Gg: AZFdTZfA+RjuVzT043rWEAceN+Tz09BlGZYiA5GBg+Q+ihXvjMJQ25EPMzZhhxv/0ix
	88prVtJRVw0QihYpzeG11YTYuZw+1e5wRW57rEf9PebJEb33gD/utX88FZPY6D29qNqiMKrh4eD
	+7qjBXgW/NZuDYIVE/C93RO6jEsH24SiNr/Ze70ThooKixFEhoTVfuGw0GObOM4MCFcp2Hap6aa
	ZWkuSSzQhN4vupcXxUgt3qUaxLw0KpgsbslGz1CQnV1xi1E9S8NjwmKi1oJQl7lwCxL6tP/ajif
	XRi6lcitVIbmufOHkT6+n7jdDzT2/BPw6Ff8KjeM+qJg16li1kRdMZ6FfeamLzZTKCigwiM+ETS
	lcsE/UNWJ9UT1i0HP6yIha2JwoFjaq9CuonRj2yioQ1ph1DSwijqJwaDyFUuCHukOpUW4Wkz7yY
	VgBg==
X-Received: by 2002:a05:7300:cc9c:b0:386:a217:aade with SMTP id 5a478bee46e88-386a217e7cemr15496839eec.29.1795689728257;
        Thu, 26 Nov 2026 02:42:08 -0800 (PST)
X-Received: by 2002:a05:7300:cc9c:b0:386:a217:aade with SMTP id 5a478bee46e88-386a217e7cemr15496819eec.29.1795689727698;
        Thu, 26 Nov 2026 02:42:07 -0800 (PST)
Received: from hu-akakum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385c6830815sm55627947eec.20.2026.11.26.02.42.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 02:42:07 -0800 (PST)
From: Akash Kumar <akash.kumar@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH v5 0/2] arm64: dts: qcom: shikra: Add CYPD6129/CYPD6229 Type-C controller support
Date: Thu, 26 Nov 2026 16:11:59 +0530
Message-ID: <20261126104201.1613183-1-akash.kumar@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=B54sQ+tM c=1 sm=1 tr=0 ts=6b080d01 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=0SHhRi3bvSNplQcU8zEA:9 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-GUID: kApNruJLE39qQn_oHzfkHw8eHZXJAb3E
X-Proofpoint-ORIG-GUID: kApNruJLE39qQn_oHzfkHw8eHZXJAb3E
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDA0MCBTYWx0ZWRfX5ElCLHpn3Bjk
 eJnwoU2D3yugWaLNIAwDEHP9RXyT5BvI7zyIETqjNxDMP5JM157dgcBhJ56RYrpmg8QvtgQUgDZ
 dkUBVoglU6FkMtWgUxqlKJHJN8j5GEy4I6HQnSng8dKWfekuwFv/4msl4Xrvddcy5AUy38ilS3v
 im3UTWjQKayeNWES/nB+a/AKKPvnNFTxI2JHJkj698ZRc97l/USSRSv70hVGl0Hy6cQtJ58qBM0
 Xa1EkORE0307BR5VNA0vnurjuYzzsNLw34DWILL+Ag55qRs1GR4FJAL3LveKkgum89BxSidlaj8
 gEH75Tq2xLEAyRGTqTq2cbmLRCQ3nmO6FKO7Q4SaJk4jf84Jo2hpko/ypMHeuGBdlocCx3LHnEP
 bIWAtIaYRsgIj3p4xXoCMhmrHQcvk17defNmXMNXeJ5d0+9a90F9JQ8d2RPTWmQclc1Gk2uFWCU
 ub5cMR5zWUzQjNgINAQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDA0MCBTYWx0ZWRfX8Kkv+KULOH7S
 8Ba4aXaNbXvX05vdq01zHHPFvzPrie3KIBZwhfx6Dd4A9mr2xJE7M9ZMlpwWP9dd8FvmlQiDxAh
 z6mJAYCVtIbUoEwoqBi+gu4XvFnIRQM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_02,2026-11-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 phishscore=0 clxscore=1015 malwarescore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260040

Add Cypress CYPD6129/CYPD6229 Type-C PD controller support for the
Shikra CQM/CQS/IQS platforms (patch 1), and CC orientation-gpios for
IQS's usb1 port, which is the SuperSpeed-capable port (patch 2).

Link to v4: https://lore.kernel.org/all/20261123122857.2424213-1-akash.kumar@oss.qualcomm.com/
Link to v3: https://lore.kernel.org/all/20261012094835.647882-1-akash.kumar@oss.qualcomm.com/
Link to v2: https://lore.kernel.org/all/20260820145036.2035641-1-akash.kumar@oss.qualcomm.com/
Link to v1: https://lore.kernel.org/all/20260820145036.2035641-1-akash.kumar@oss.qualcomm.com/

Link to Driver and DT-binding change:
https://lore.kernel.org/all/20261012091658.635441-1-akash.kumar@oss.qualcomm.com/

base-commit: 909ef7a9a30fa139e69e555e3606680f5cca7726

Changes in v5:
- Split into a 2-patch series: patch 1 is the base controller support
  (previously posted as v1-v4 as a single patch), patch 2 adds
  orientation-gpios for IQS's usb1 port (the SS-capable port), using
  the ucsi_ccg CC-orientation series linked above.
- IQS: fixed vbus_boost_5v to regulator-always-on instead of
  regulator-boot-on, and dropped vbus-supply from both connectors.
  Neither ucsi_ccg nor the typec core ever requests a connector's
  vbus-supply, so the v4 form (regulator-fixed wired via vbus-supply)
  was left with a permanent zero use-count and got disabled by
  regulator_late_cleanup() shortly after boot, cutting VBUS to both
  IQS ports.

Changes in v4:
- Rewrote the commit message: this is a single patch, not a series;
  clarified that usb_2 is HS-only and usb_1 carries HS+SS.
- Dropped the unused ccg_typec_con0/ccg_typec_con1 connector labels.
- Replaced the re-declared `port { usb_2_dwc3_hs: endpoint {...} }`
  overrides with direct &usb_2_dwc3_hs overrides, since that label
  already exists (empty) in shikra.dtsi.
- IQS: converted the vbus_boost_5v GPIO hog into a regulator-fixed
  node and wired it to both connectors via vbus-supply.
- Kept `dr_mode = "otg"` on &usb_2 (and, for IQS, &usb_1): a separate
  commit (9b8dc188ffa6) already sets dr_mode = "peripheral" on these
  nodes generically for all EVK boards, so dropping it here would
  silently leave the ports in peripheral-only mode and break Type-C
  role switching.

Akash Kumar (2):
  arm64: dts: qcom: shikra: Add CYPD6129/CYPD6229 Type-C controller
    support
  arm64: dts: qcom: shikra-iqs-evk: Add CC orientation-gpios for usb1
    port

 arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts |  55 ++++++++++
 arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts |  55 ++++++++++
 arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts | 107 ++++++++++++++++++++
 3 files changed, 217 insertions(+)

-- 
2.43.0

