Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDB9D314D26
	for <devicetree@vger.kernel.org>; Thu, 18 Jun 2026 12:04:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781784245; cv=none; b=A8IWGnPf9bjHIKlgppdaMfPxftA+Neypk/DtVBBx1HDF1e1LCGx4NgWrbiJRFU0r4nQ/AQ2d9srTr/DQPJBipq5ztqE9VlNHVPSc9g5BFp/2igDV4i/iVBRCYORBaz+CWjz3M/u+JW/zF8QvhHpZxWaXOIKdgfw063F8QePPunM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781784245; c=relaxed/simple;
	bh=lM/+HQ10tvf1R701ouGCzmNMFYljSAHwzFnpHVHglxM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=To1ITAoZH615LiQ4fjP8G32ssoQntdHtkbaTYQO3qFYXV3hwa4+fF+KYFiIGwCfV02aEbdSDnGMxiGsSpWNa/iRQ68wAiaIEu+dOTeyonyghUdn6I/2YvEggdvDeEasdWq3J1uZTfrHRfojN162I0c7DWD3e4MSHB2QIpOGJ9k4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZGGP8bHX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VzMA4Jj1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZGGP8bHX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VzMA4Jj1"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65IAs0KW1030375
	for <devicetree@vger.kernel.org>; Thu, 18 Jun 2026 12:04:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Tlo0yxFkGw3BQgSZUCX0Ll
	F+Uw1OrcPE+1KsAp0V8TY=; b=ZGGP8bHXCi6l4zAGGBUOm84pbQCxDL94VZF8Cw
	l8yzd/aSFlBacN10DxwHVpt9P3K71UCupA3UNY+eJ7m5WCO97bj5ClW0zQZ26Jl0
	oMMGHf4gNznwefm9+ipG2d7SMFRtD0Lg1bWPWI7wmsAPIg3LfFdoyoXLrOCDZY42
	aYAbhrZPMx9VWRlmv/3kl7GeHOYbcSkEEzV7P9YGRLgbY3vjap1ZhFurvabHU8P+
	uwOBoqs1tutQWEYs++uybygWSR3LXeKlXzjzH/7ntbG/MyhoU95QqF0vxG0cTn3G
	M/bzWLTigrjT92tC5rj3FaaTtAxMTCRRsM0W49TNmMJZ/c9g==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ev0vm39t8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 18 Jun 2026 12:04:02 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-304f23c55b2so896516eec.0
        for <devicetree@vger.kernel.org>; Thu, 18 Jun 2026 05:04:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781784242; x=1782389042; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Tlo0yxFkGw3BQgSZUCX0LlF+Uw1OrcPE+1KsAp0V8TY=;
        b=VzMA4Jj1wp53yQiFoVK+1jaC+fgippfThZCi8y3L9ZeG1VxW12JRifRdjqf9wHTOf1
         qUuT6slXqwBkjaDwhwyud8JYl66UzSQSolpBxrm1tLHhYJrYWWgx8NQiOxLrENpkeyDe
         iPXdMydWyeowuCnlnTuJ+Q/HQ3zjd6i45mHUVsMxrlGQX7W/Trlb3meVTEFvJlBHvgW0
         c13KyRsy5681cpTNwbuv33g7rwB7jRYE18F3GLGN3PPn2z2U+M0qxO54fF5q3QKWq/lh
         MknhL45s46PEikS5NcNvjQ2tfEHHhi7u+RWkpZEAgsswacdUtVwl2DqriR80W95+T+qZ
         vFnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781784242; x=1782389042;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Tlo0yxFkGw3BQgSZUCX0LlF+Uw1OrcPE+1KsAp0V8TY=;
        b=PK6zNG7+SS/6BhLbw+6L837/N3PVtjGus1YoRPqNYH4W5lyRR1IFDnI33SiMGXrUAZ
         VATGb1D9O+9WWp0f3cb5mjjlpC6ejkRr5SrlImnEQUN9CNVcDfIBhxijRMjOCO6TMcn4
         NszhPUvGjzFndMyE/ztaG1snBp/8aaF8WGzzU+MY8CuL7V14258P+WiLmRUUF6Uc/Jzu
         92m8Ow5m5Q1XKDm/G3RN45R5Xkela32VEFeeMP4s2kyFZ2KSSy80KQZZA+aQWAhRzuP5
         XK5tYqYqe/L5JvtA284fSiR9dNyWkHRAO2jDZri1dBQNoXQi+Vw1TX+KNS5X8Ca0TEYI
         G6gg==
X-Forwarded-Encrypted: i=1; AFNElJ/Z9q9B+4dfVT1NHW/sfoJVIOjFloTIy8NHWYDxyDPApZnlY5KmTJ2JYOxwMA/AxsRl/B+VsLtii6/C@vger.kernel.org
X-Gm-Message-State: AOJu0Ywbgegeak38zbHGiE1yaQBpOipmcxMkazlcqJHnSGkSiin8NA6S
	9TaSVDQWUHauHO++Sgv4x0X9yVzdNytjCFIETtortZYDUyOJsRW/LvaU00kCBkc/T4axjFyEekd
	f8kPbEckh8O5UGgsWf5gFYYmsl3LAdW86EJfTxEduAi2ikZRi5u9oyRP1IVD3qtv5
X-Gm-Gg: AfdE7cnbTv36ZIJU0xoEJgbX6qokIMRxXXXSQPsPmFdkpx4zoEWrqiZs5kxqTXY+aAQ
	/liSGxKgdqofUJTnKt44v6CE0+RmxGgDBZqon00m2GegaKobA5nxJimG6aMIbUWFlpZoNuGvU5b
	fvOeZ1g3Bh+a0tsPuxH88aSKQFUW8qbiuvDP7MUmZ9DTYNM+d+5UVW3D4AT1UtYVu8U8OcUwX3z
	krt6VntJF6vLYaXZDmcaLOrFzUXTBbFwrqaTzMKSSh66nfRFfjCollReecvX+/yukcqpoMR2Dpo
	BblTfLgR8PuR0n33c2A7ehikJIBNr3PT2ltqwmQEVxz8NUX6vlc3UgYriqlNnQSXsi1HF+S4gvh
	J+A+UOQVd7PXJDkaEMif/iZmm1qBA8twh+4/j/2kVE0HZdETIvcDCz+FDxdUuGbg5Jw==
X-Received: by 2002:a05:7301:7c0e:b0:304:d32e:65e7 with SMTP id 5a478bee46e88-30bc915f658mr4891005eec.0.1781784241730;
        Thu, 18 Jun 2026 05:04:01 -0700 (PDT)
X-Received: by 2002:a05:7301:7c0e:b0:304:d32e:65e7 with SMTP id 5a478bee46e88-30bc915f658mr4890952eec.0.1781784240967;
        Thu, 18 Jun 2026 05:04:00 -0700 (PDT)
Received: from hu-hangxian-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30be0c45a16sm4177713eec.14.2026.06.18.05.03.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 05:03:59 -0700 (PDT)
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Subject: [PATCH v2 0/3] Add CCI and CAMSS support for SM8750
Date: Thu, 18 Jun 2026 05:03:49 -0700
Message-Id: <20260618-pakala-camera-v2-0-9fbb729fd242@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKXeM2oC/12OQQ6DIBBFr2JmXQxoi+iq92hcoIyVtIqCGhvj3
 YvYVTeT/J+892cDh1ajgyLawOKinTa9D8klgrqV/ROJVj5DQhNOb0yQQb7kW5JadmglqRqaYqo
 apioBnhksNnoNvkd5Zovj7LXTWUIlHZLadJ2eiqjHdSJBzVkGB9BqNxn7Cf8sLBC/6fxvemGEk
 oorkWeCX3PG78a5eJzl+7DH/kC57/sXIU7s8+IAAAA=
X-Change-ID: 20260518-pakala-camera-bf03e3df1db8
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        jeyaprakash.soundrapandian@oss.qualcomm.com,
        Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE4MDExMiBTYWx0ZWRfX7b9WmRsRhDSz
 qwOPcInslVOKjBuptZQKW0OlXJ9kBEXf7I7vLtTpFWR5OGRUk9OUZkZezcsYJJoQEdM5bX4Krsd
 0Ere3Ve00YIKnygeyoza7UpqbQ4ufOfjsC4DLKpMlHESYQ5VCCs10UHVTAYN8Z+cDKOZ5FL4qU6
 +DauZ843soRfV2EZstBPDHjPcGyPvM4CJCWYdes5xPx9WXXpkH5ARzZdVQDLgsBkgIZJmJwsmfz
 sfkbHnyQGLYUsL+4nM2d+UMEg3ea/mKjAF5qfuFzX4LJJ03bkAjpiPwhe4y11S6XcjrLf1OHJI3
 em8LLtJPXtKpatcv7wtPVHUeN7qx79Vcz4/NlpJ3zUqrFBxiA0c5SkX6zqnGOEyzENjyywXk9aU
 zUOVhJDQKkbEDxwzc/tiazwwDsVRY27OJ+y0e1WsMRD5dy9XoI+uJsUTlN9adtqYrAjx6VeqBGW
 vPgEDGt68cZWJW+o8uw==
X-Proofpoint-ORIG-GUID: 6ZJsIL-IVsMt_K2eUbWus0U9vpwdaKxy
X-Authority-Analysis: v=2.4 cv=UrRT8ewB c=1 sm=1 tr=0 ts=6a33deb2 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=OFdHJre5LK366wQswZQA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-GUID: 6ZJsIL-IVsMt_K2eUbWus0U9vpwdaKxy
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE4MDExMiBTYWx0ZWRfX8Q0DKP3k80pY
 JsYAkB8HqNib5nxX5I5H4NmNkcO3dX05KdGhpb7N2NZ6HIgQ/qxs9ItHghCgarURbBlA1wzJQ0P
 y110oTnU7Z/xKpfmOKHzWBTUiidUhlQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-18_01,2026-06-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0
 bulkscore=0 spamscore=0 suspectscore=0 adultscore=0 malwarescore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606180112

This series adds CCI and CAMSS support for Qualcomm SM8750 SoC.

This series has been tested using the following commands with a downstream
driver for S5KJN5 sensor.
- media-ctl --reset
- media-ctl -V '"msm_csiphy2":0[fmt:SGBRG10/4096x3072]'
- media-ctl -V '"msm_csid0":0[fmt:SGBRG10/4096x3072]'
- media-ctl -V '"msm_vfe0_rdi0":0[fmt:SGBRG10/4096x3072]'
- media-ctl -l '"msm_csiphy2":1->"msm_csid0":0[1]'
- media-ctl -l '"msm_csid0":1->"msm_vfe0_rdi0":0[1]'
- yavta  --capture=20 -I -n 5 -f SGBRG10P -s 4096x3072 -F  /dev/video0

Driver and dt-binding are waiting to be merged:
https://lore.kernel.org/all/20260601-add-support-for-camss-on-sm8750-v5-0-dac36a190de8@oss.qualcomm.com/

Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
---
Changes in v2:
- Fix typo for mclk2 and mclk4 tlmm function
- Link to v1: https://lore.kernel.org/r/20260519-pakala-camera-v1-0-b6d897864916@oss.qualcomm.com

---
Hangxiang Ma (3):
      arm64: dts: qcom: sm8750: Add camss node
      arm64: dts: qcom: sm8750: Add CCI definitions
      arm64: dts: qcom: sm8750: Add camera MCLK pinctrl

 arch/arm64/boot/dts/qcom/sm8750.dtsi | 541 +++++++++++++++++++++++++++++++++++
 1 file changed, 541 insertions(+)
---
base-commit: fb80987f81756cb697a01362654a8e55fb505600
change-id: 20260518-pakala-camera-bf03e3df1db8

Best regards,
-- 
Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>

