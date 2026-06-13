Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CE1A3242CA
	for <devicetree@vger.kernel.org>; Sat, 13 Jun 2026 08:09:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781338198; cv=none; b=Jl6vMsQ7+1sCFFRPG+sDdPNTANh+1C1nP1EgHaFFwAr/RmVo8HTLWkry6gRSPWctpK+YRzC4U98nd9G9dZbBZ0BYpCHKqjgATSPp8N+DTb3VZ/t0T20xl9dMMQ1QGUqrNax9SHJGrlA5BMiMVZBs8t0e4kC+Nv1iWFPhx30/LJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781338198; c=relaxed/simple;
	bh=+7laVCDEO1nBE9uR5JZO5I+iOzHGe9JCa3pTLrz/6bo=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=XWqjz5teopL6wmU5SI8F3DuoyYgRI0TpB7R2VfLTvBmIRlKOt/ykIyMIUv49x46/B4BfOGWyHFpE2CRvUva67ExgfaTvy7uhFPHQMvX9FzL7gtdVgktRmImIlnh7DNp9jSBXdZFU7dNksvpTfxeM7TjAOuFft/DE+0EndBqFCfg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Tywa36MP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=N11BM1pB; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Tywa36MP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="N11BM1pB"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65D6ehcA1747174
	for <devicetree@vger.kernel.org>; Sat, 13 Jun 2026 08:09:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=AWJntzIPAF4nht3b6zxnhn
	bi368k/yOuvIPyr67PFG4=; b=Tywa36MPYyvw1mAGz04tUamfNgZThkF1EajU/Q
	IN55PYIeC+YHSARqb/kv8YIeYRL/LmhjUMoQES2dIKtOF2H1BS87UjtZnR42HrVL
	9kCtd0upba1YU/dYFovkryo+YDl19fZqXluQvlr47Qev90AAyUXkXBgbpGGrjddC
	zdHLQBnT5cKl3Hj+m2oFxf5kO/kcsyptya80GecdZ+V07rj4pY0VVkFNxHOenM8r
	qpmu/ko71Tyejl5lHcdN7MLyeKnEUbqu5RMtp9D8qdSv8iQCbMJ7KKdfioqO3eBB
	eR+1gj+M7DE3ke1MN2nzgk0vXut/4trRdB3BEsg2wgWgA2uA==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4erye10gbd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 13 Jun 2026 08:09:55 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-842308adb3bso2357029b3a.0
        for <devicetree@vger.kernel.org>; Sat, 13 Jun 2026 01:09:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781338195; x=1781942995; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=AWJntzIPAF4nht3b6zxnhnbi368k/yOuvIPyr67PFG4=;
        b=N11BM1pBiFJDfZqjb0QmyHb/SwpI7tch5cn/GHy580Ijic7ja8Hb2H6AL7iwaZ6ne4
         D08QrkirEXO7HKLIVNXPdv2wq60ufaNhMdPjrHd2YQQwiSG8SnELJDt/psHEV2qqbZ4n
         DcuEmo4EUUuYptLYR4mfMKa4pfGcT4JlWRlRf/jo06RtJJCWEoDVEwdgwOAgp7BZISvi
         fISytIqtNNYxi4/iCfkw50GVd1ZEXwS8MWMj/baE0tRWxcHYMVwJJEhW5ulgBqgC7ZPC
         Vo3sRDHoczzCwNcJao2Q9jo2Bw5GQ58jo4vGrb5JvM9eXzXpCAUhHInUWAfvmxuF/bZJ
         I/VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781338195; x=1781942995;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AWJntzIPAF4nht3b6zxnhnbi368k/yOuvIPyr67PFG4=;
        b=H5bHRGF/CqmhUVHRHGNfIF6MIXS6/Bf7HLMT89T60GD8khAO5/k+pKfCbPIWWlNKaj
         TDLxbEl9ZNLupwbXFCTCy84nTapDMbtpV9JZzQesXPHf/V2vQ5EKoMlpM6S41243k4ii
         lIAQJ4uTkWv64t0eO3vAuQUlsURuDSL+3IJObgtpSxNMrlOBZIJ44qQ3FnwmDW9uvC9n
         ttiUGxuWKoNKoluCfTW9Kux7/gedIPeJhhCbVzBI41G4sv3Cak65uxM4s4PkXhm/HcY/
         oEMcxK8wGYwnrIcuAZMVvEp/Si9h4zTIg0Dq9flG/PQuJvTKF6SF3lPpd0OsXtolFGTl
         XBBA==
X-Forwarded-Encrypted: i=1; AFNElJ8skX2h1YdFjB+dXL62VS+M8VcC78Fb81BavPWZx58LJKtj3z2HHtKUhl6+GucfAdYu0nVn45PEg9gh@vger.kernel.org
X-Gm-Message-State: AOJu0YzECqv8mgAy9OCoaU2mrxqQjML8SvxygXj0oM2TetmVkd4vHKiN
	lZHGhQo90lUBn7NGW9tPyq1vkPz+jN+f+qT0+r4ktAm5ILOfAgU1XCLIHBGLqYbHoC9q3f4qAxw
	AiY857zQYGx6JbiJN7M7F+NKaQThIzTuWSsF1W5n9h5xkhVgHNxEPLwHVOzMWQrdP
X-Gm-Gg: Acq92OE2IlAt9mChiYBWVHpCwXvQ1c5B2nQWqfe0IA39wIkmJKZrZ47Ws/ys9WLfS1B
	sly1yYPUdwwWIytQ+oxpl9FnFqwfO2wsmFEgoTlVQDp8GwoLOBqmlVYCzDchyLjN8Mxcg4ZJT3e
	MHWKbIfhCEgLVrDOmz3qqUdbo8jxmYXjXPbs1ovOK5deBx9Cs5hMUlnqiXQQDHlwn/mDKXwA6io
	Ipu+zNtssxHHX0fCrMBD/Q5yFmnKyN8rXVRlDKM8i+ecA9Ghl/JkWHBFupC/maTgabVccN347Z6
	vZs3LOcwJh1dpqc7ZyS3m6lQ7JPTwgCRGVnTpuznz5XRh0UWbIxk0kY41F1jVYYTav9hjiTmM0a
	6GgTyC73Fn4HHLSI9ZaSGokuGY6HP484zQ7ZtlEAs
X-Received: by 2002:a05:6a00:35cd:b0:842:459b:d61b with SMTP id d2e1a72fcca58-844e1a62be1mr3040905b3a.32.1781338194724;
        Sat, 13 Jun 2026 01:09:54 -0700 (PDT)
X-Received: by 2002:a05:6a00:35cd:b0:842:459b:d61b with SMTP id d2e1a72fcca58-844e1a62be1mr3040888b3a.32.1781338194283;
        Sat, 13 Jun 2026 01:09:54 -0700 (PDT)
Received: from [10.213.109.130] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8434ac9dc5esm3926647b3a.10.2026.06.13.01.09.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Jun 2026 01:09:53 -0700 (PDT)
From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Subject: [PATCH 0/4] arm64: dts: qcom: Add PMIC thermal support for Shikra
 platforms
Date: Sat, 13 Jun 2026 13:39:20 +0530
Message-Id: <20260613-shikra_adc_support-v1-0-57d5e6c7f47d@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADEQLWoC/y2N0Y6CQAxFf4XM844ZQDrA0/7Hxpi2lHV2RXAKx
 sT47w7KS5PT3HvPw6jEIGra7GGi3IKG8ZIg/8oMn/DyKzZ0iU3hCnCQl1ZP4T/iETs+6jJNY5y
 tc76Bygl5YJOKU5Q+3N+jP4cP60J/wvO6tCWiXJdkmz8xM4gqvm1ttrmKzWW72d7AOgsETFXd0
 d7771F1d13wzOMw7NJZZwlV7PoIc5sJu7LJCyDfI++lxL6shJgRPUPfENS+Iqxzc3g+X/Zqg8k
 HAQAA
X-Change-ID: 20260613-shikra_adc_support-0079650eb76c
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
        Rakesh Kota <rakesh.kota@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781338189; l=1622;
 i=jishnu.prakash@oss.qualcomm.com; s=20251014; h=from:subject:message-id;
 bh=+7laVCDEO1nBE9uR5JZO5I+iOzHGe9JCa3pTLrz/6bo=;
 b=v7tjxhob2A6FDGE6d7h+znfxPdaRvPLDP7T8DrQD9KqDEPwLo7vIKyka+FA9q6wPndNJWyDIv
 sddBRFpD88JAxCx9WXOhDikpxiK6OxMUNVJJ7YITqHoO/ZvI3Oo3uXc
X-Developer-Key: i=jishnu.prakash@oss.qualcomm.com; a=ed25519;
 pk=g89pXdLVwRjdTeQ+uX1QzvBO346E3hQAc1N7fcTXgmk=
X-Proofpoint-GUID: I3N8ivNDl2zLnpc6PYb88mp8MSug-6XL
X-Authority-Analysis: v=2.4 cv=MNlQXsZl c=1 sm=1 tr=0 ts=6a2d1053 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=0ecBSjoEOrMiUCtx3tEA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjEzMDA4MSBTYWx0ZWRfX5KT7hRQkAir8
 zOCbtlkbt60TS1QA805p/Y0EfxMHvjmr+TCB1WAyf8hxAVluPf9/uIs48s2jbI9CTWWpcx7Ibk3
 BGKBBk3gznESqBrXMEBj67FFjiud+sY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEzMDA4MSBTYWx0ZWRfX07yBP/ivvFei
 XOwDGmr0wCITIauGrOIqIvqLBd0pGU9985abJYYnQn3/P8Cxbx262tLQmhuc4EnMLQIE0fVnldQ
 u97r6yXJ76eywokUUDy+SXAi8NYljIOvSXFbzMDhGkbcBAaYmXdZkkSC/OpXpADL+m0gXEhN403
 uOSRCp/uHunFKk0xyq8NWNWR0SPrMUnSFPcH56k8DOXD7D2EvI9QpHfhDaVpLu1nompc9cszouU
 Kh3oy6K/olTW4gR/JnChH7g/pynq20YgF01DJr381U0ChiaY8t9UwDoHegcXjp4TmEt7qClA25E
 THPrTyA6J6JQdbeDX34lIiAK2SV4Ai6ALdoNR1Qit6XBo5k68Pt25kvePL0C6qBtRIi8RBiYRzC
 ud8AxKKpkKTxUcoKphNNImy0BDwgWXsHB9Y+FAnmVSv6QWaogCuyLL+tgcxsv9zX0dRsVUpezN7
 CAwOHM4j5BWkrDKO5qQ==
X-Proofpoint-ORIG-GUID: I3N8ivNDl2zLnpc6PYb88mp8MSug-6XL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-13_01,2026-06-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 spamscore=0 priorityscore=1501 phishscore=0
 adultscore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606130081

This series adds the following:
- VADC and temp-alarm devices for PM4125 and temp-alarm device for PM8005
  which are used for thermal mitigation on Shikra CQ2390M SoM platform
- ADC thermistor channels and thermal configurations for same on Shikra CQ2390M SoM
- ADC thermistor channels and their thermal configurations on Shikra IQ2390S SoM

Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
---
Jishnu Prakash (4):
      arm64: dts: qcom: pm4125: Add VADC and temp alarm nodes
      arm64: dts: qcom: pm8005: Add temp alarm node
      arm64: dts: qcom: Add PMIC thermal support for Shikra CQ2390M SoM platform
      arm64: dts: qcom: Add PMIC thermal support for Shikra IQ2390S SoM platform

 arch/arm64/boot/dts/qcom/pm4125.dtsi         |  77 +++++++++++
 arch/arm64/boot/dts/qcom/pm8005.dtsi         |   8 ++
 arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi | 184 +++++++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/shikra-iqs-som.dtsi | 113 ++++++++++++++++
 4 files changed, 382 insertions(+)
---
base-commit: ec039126b7fac4e3af35ebccaa7c6f9b6875ba81
change-id: 20260613-shikra_adc_support-0079650eb76c
prerequisite-message-id: 20260612-shikra-dt-v6-0-6b6cb58db477@oss.qualcomm.com
prerequisite-patch-id: 3a689e8dda5fd2755b689d94d095806b3f2e6eed
prerequisite-patch-id: ac83151a889855498d36288ddd36216d451340c8
prerequisite-patch-id: 2357cac636e019eaf14d6a493a1c72bca56fe405
prerequisite-patch-id: 2885f299e711582da312ca9d13983d296a3dd5dc
prerequisite-patch-id: 91af5f3c01e766a53ce8de69aa21847a2d6bbbf8

Best regards,
--  
Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>

