Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E786938A734
	for <devicetree@vger.kernel.org>; Thu,  4 Jun 2026 08:07:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780560456; cv=none; b=RCVpcoZl+3WL6iN5lT32HIqYs8JhN9znleX6ZBbT42U8++jpMDY18rQj8PTFn8kLqUXCyFCoUg01yNExkw9dexA65PM8yg8sW32to5fs8ikZ3kTbcl+lSNBMxt9RkIQFMXZU3jKzupBzwfw4Tkddh0gigazsqLHGQulU5MLNN8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780560456; c=relaxed/simple;
	bh=wNqocs9HiwlRYOUBv788dwD9FXWwqryHgiMM0wn5LKo=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Wkq3A3SjhknmXFp0cy8jOFyIe8wDR7KS+dMDBK8TDgnX8DmowXcUsEcFcvpiYQy5OAnPMyWYphJnllKPh7pdOr5scctEyR9CT3CV1SpFtJerkG3B7OAMIiEgA0jSiffgQHjNNpLpu34Ko++y94ZEZ56iD/OrDDKfwA8RCXpTni0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=T7Z/e2PJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=G7veDGwj; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="T7Z/e2PJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="G7veDGwj"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6542HqEC2260708
	for <devicetree@vger.kernel.org>; Thu, 4 Jun 2026 08:07:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=rXN3B+siA/49uCHBK5RRq8
	e9JZOTCLwpVAP/DtvlG/A=; b=T7Z/e2PJ2KkysHRy7xkvTkA4WZjVQaOLyzy3Sm
	vLjXxvyZCv6H9JIOETeBsIlzVOnvQED4OVLjDh8yBBaBsPtFtZ1bHpMi1E8ohTMm
	yb30JDtR9/bswxyiDeXGxhx3QnoBzk+QJRl/uQ5vT9wxuslcTI0/bHVDWJ8ZXqG2
	L65QU+BxccOelVGgRnh4e/1vLvi+u1PZuj668U0U80DgkNU0z4tLnHwhfGCyDCvS
	xTje5duzXRLUqXr9LVo+8GHo+sTy1ASJnk11Nr8eEAEOz4MPlhXIcLp4v065/E9R
	3TCH82PsdsMWh9D4zA2lRbluAfEmUgvQaed0QH/w1JkuLhQA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ejr2mk1x9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 04 Jun 2026 08:07:34 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-91550e751bbso10342185a.1
        for <devicetree@vger.kernel.org>; Thu, 04 Jun 2026 01:07:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780560453; x=1781165253; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rXN3B+siA/49uCHBK5RRq8e9JZOTCLwpVAP/DtvlG/A=;
        b=G7veDGwji/FM9/rontT0oRj7KEmmusLI2gY5SRCJxSGUVTLlWeyF3x0hx7CWvBBYAu
         EyRuDCUCiT/Tn/2TeZTdTCMFknSrmNsPjVS/dfOv5/1/Lk83L3dYEZl5dyyddcUSKzby
         xOB7P5lLFfYFzCIQAkClr14Jv+sj0wtglliwlam4gTOpTZmdcdoWWYMO1EGeqXCa2C8S
         XqhS12EL7Fcn6OyeioGtZhTJv1bvFXcy5hZeKn433p7AWZZxelSNTQkiztbN3hhLcAxb
         BU+4uaNJBhgMbO4WmT3hTzJ44b23ciarPEl7dncmodqlrJmizuXlPU6Afj8h0gYuOXdT
         cWCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780560453; x=1781165253;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rXN3B+siA/49uCHBK5RRq8e9JZOTCLwpVAP/DtvlG/A=;
        b=ToQ127uLmAexQD0W7zwNJOSJmTsBwo9aTeG5LYhm4RM25N6GdevdQrAVQIYxEea5lm
         agNzp9YMxbP9WFiT83qfqpRslZuNcOjuQcfCV6h4WgYtC0vMPDTp/l/qGikF2Zovb8op
         KJHZcrZrodjdItXxbXZa0diyQvsxuc+vWILWyZmdHCcrk2dgkIKPUiWAsbMOpJPK1if+
         inXGMtwDPXiHKktBqZ6ZkyrD4pw+kqROe1FNU/Jrmj5gRSXcCCFPsKFBUbIqni3dPSd8
         3fToLln5kgaNAH6CIa4A2kOH62d/jnu58MeSkrxQDYMEGvl4NhJAOkSgCMtgvg0z3dI0
         KM3A==
X-Forwarded-Encrypted: i=1; AFNElJ/NqeFSnn6fiSLZ34ECnOk3ji3mo2yCu/8gZLhNo4Yt+8tTHi59eKLvbf8JPLpMZ42Bx2OUZ+Q7wG2m@vger.kernel.org
X-Gm-Message-State: AOJu0Yxpgw+08LyBf5AyWVVMJEtyGuvuUHP7TkJL3OuOBRXfYDW1rgev
	tmE16sjoUK0QOEiVwWhFm1qNBr+V0T2V61HZclIZkWWd2GxwiWVE3bYv7ypFe7EDF5ioX62yAkY
	LvXxWtz3vj7lOhYQBhR3XvGqkuE5w0cVJwPEY1gzvzvxJc8i6V/T90zMblHQ7TIVM
X-Gm-Gg: Acq92OEAalWnb8HGydjFzI1VkZmmEbUKgQR+1MADkSY0deW0QmpywVzSNYeDz7rycnV
	I7emjjcPZfWkXlOYPdhGTxE3nSrA+ZxO4zLzmdART2uXPnWoB12FQnPI2dQZzEpS0Z1sFLymyQA
	MbTn207jlBS37sIenDc8GCyveh1MkuCYll912qhfCU78ic3N+rmdhApTkoXX2r1reJbGBmfncHd
	MB2q0MGQQ7exbaenAxtLMsrHu6iNdCt6adXTFSAvN/VEeOK/vSfr1VRDdZ/HHeMUoObS2Gm1eyb
	dGNS73tdsMzOySSc8LDSMjHWOiVIwgZ+GaobclAwQlKMtMyoLMDwWdMRXlGBvxh551zNt8D5AlE
	Y379qI82mnSyKtltkfCpoGQXzsxXqFEB5Sm5ILJPeSZ8m5qvUhDkZMby7MUT2+MBNYgwostLcer
	EVfpXsVLoO
X-Received: by 2002:a05:620a:17a7:b0:915:4ca0:1210 with SMTP id af79cd13be357-9159e1cc1b4mr150368485a.3.1780560453254;
        Thu, 04 Jun 2026 01:07:33 -0700 (PDT)
X-Received: by 2002:a05:620a:17a7:b0:915:4ca0:1210 with SMTP id af79cd13be357-9159e1cc1b4mr150365285a.3.1780560452726;
        Thu, 04 Jun 2026 01:07:32 -0700 (PDT)
Received: from KDYBCIO.eu.qualcomm.com (public.toolboxoffice.it. [213.215.163.27])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bf052097992sm272304366b.26.2026.06.04.01.07.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2026 01:07:32 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH 0/4] X2 Elite Lenovo Yoga Slim 7x Gen11 support
Date: Thu, 04 Jun 2026 10:06:53 +0200
Message-Id: <20260604-topic-yoga_submission-v1-0-57c70c23d0d6@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACcyIWoC/4WPXUvDMBSG/8rItack2RLXgbCy6oXi0DndUMZI0
 7SL/VzTFOfYf7frdiEoenPghfd9Hs4eGVVpZdCot0eVarTRRd4GctFDciPyWIEO24wophxz3Ie
 6KLWEXRGLtbFBps1xAVHAQ4kvuaLDALXbslKR/ui4b6tTbtvvStZH2LlRqa1thfWphjJljOiEo
 97Eu31lDdaza3oTErt4WnjSf6iWE+PPh8umdpN8Lj+nxI+86d3VjM4Tb5wJnTpxd2WRHR3fid0
 DjLiQ5CWYQsoSGg4YZMRCrIg7CFg0Loxxtlak7T77DSJCdxc/+tzl9H79XL6MNxZELnLZQNr8u
 TzpaR8PGSPEoaxPOXdhAEYH2jEiT0T1r/4MoRCnu8xWEJcWwhoa1v7BOJUDzANKsPwJWh0OX4I
 j7e/rAQAA
X-Change-ID: 20260603-topic-yoga_submission-fb6dc076e28b
To: Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Douglas Anderson <dianders@chromium.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780560429; l=3568;
 i=konrad.dybcio@oss.qualcomm.com; s=20260604; h=from:subject:message-id;
 bh=wNqocs9HiwlRYOUBv788dwD9FXWwqryHgiMM0wn5LKo=;
 b=dGIkjowM2M09oxEXfRw0hzDa5SpDlUk/YIp7OwAunY8FNPyANjNtGeGnWZbB1QDEpgTaP6QwC
 zFjt9BpnYMDDgRTpZWhMDEkWqpoG2dpKqEWiYozvGWGbsSYI43jyszM
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=SGRRMmlLTuP/lGKdQ0f4KPvxn8VVsXtXaTpdGc8i82c=
X-Proofpoint-GUID: UvwTJCJrOeIZXJaT4_6KUl6kEYKbQrZs
X-Proofpoint-ORIG-GUID: UvwTJCJrOeIZXJaT4_6KUl6kEYKbQrZs
X-Authority-Analysis: v=2.4 cv=A91c+aWG c=1 sm=1 tr=0 ts=6a213246 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=aBIYUfOEhgoR9egqXYNcqA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=0kKuASbsWRo6JP1RYPsA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA0MDA3OCBTYWx0ZWRfX4zBXmte3gAYf
 fbhDbSCCgCRItiobgMZ677Yz0mvUEK+o6FshwP0KbGlCsvAfcORbaGDcoHLQ9HFOCN7C+IwfDeT
 MJPtnRGqRGvdE7qtoNU50wMZ8mH3+lRePKPxyjreHKSYBDXlIMooILZBvVPkakBFqT2i7HHlqhc
 XGx3NuKBW2EXSMXUlpMsl8Z0bh0zSUfscEFow9nHcYlFaYFCZhY3BiALSCp6PqMVEtZgaM99iru
 EohlSnSp8eLHWzZMGaGAsDlAiM238pe5xHTRSuJ+NC4tZKIXMgPQqVMWMstGfY70Sfl8Eq/d+yz
 RBAj30crHfAz91/F5gcWqXoZ6rMP0RN4a7Vp8StRt0nlv8e+kzeRcO7j3vvoko9207rWwwkWtiR
 FZHpZt4n4HH293qqm5ewflWhPZJgjUCPyJ3DvlXiEydqFM0IjvDKdcErJRg2PSwKkgPTzpSp8FT
 ImpoyH+ugmtypAfWQWA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-04_02,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 spamscore=0 suspectscore=0 malwarescore=0
 bulkscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606040078

This series brings the bits necessary to support the Lenovo Yoga Slim 7x
Gen11 laptop, based on the Qualcomm Snapdragon X2 Elite (Glymur) SoC.

The DT allows for a decent UX. Among the features working are:
 - Audio playback and capture
 - GPU, Display
 - Keyboard, touchpad, touchscreen, lid switch
 - Privacy LED
 - Charging, Type-C
 - Wi-Fi, Bluetooth
 - Modem should work on the SKUs that have it, but it remains untested
   due to lack of access to such a device (it's just a PCIe device)

Most notably, the camera support is missing today and there is no EC
driver (the one used seems to not implement the same interface as the
"Qualcomm Hamoa CRD" driver services), making the OS unaware of e.g.
the keyboard backlight state (although the backlight itself still
works).

These patches are a result of a collaboration between a couple of
Qualcomm engineers taking part in an internal sprint and were created
over 3 days.

There's a number of dependencies (audio, GPU, SoCCP series), but those
all seem to be in a fairly good place, so this submission can be
reviewed in parallel. As a result of that, this v1 submission is
almost expected to trigger some dt-bindings warnings..

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
Konrad Dybcio (4):
      dt-bindings: display: panel: samsung,atna33xc20: Add ATNA40HQ08-0
      dt-bindings: arm: qcom: Add Lenovo Yoga Slim 7x Gen11
      arm64: dts: qcom: Add Glymur-based Lenovo Yoga Slim 7x Gen11
      firmware: qcom: scm: Allow QSEECOM on Yoga Slim 7x Gen11

 Documentation/devicetree/bindings/arm/qcom.yaml    |    1 +
 .../bindings/display/panel/samsung,atna33xc20.yaml |    2 +
 arch/arm64/boot/dts/qcom/Makefile                  |    1 +
 .../boot/dts/qcom/glymur-lenovo-yoga-slim7x.dts    | 1237 ++++++++++++++++++++
 drivers/firmware/qcom/qcom_scm.c                   |    1 +
 5 files changed, 1242 insertions(+)
---
base-commit: b7bee4ca5688e30ca50fbc87b1b8f7eed7006c17
change-id: 20260603-topic-yoga_submission-fb6dc076e28b
prerequisite-message-id: CAJZ5v0iRE2Fd1uWSWAcDPrXCsDT8Xvt9knTczN1DfANK=R2TkA@mail.gmail.com
prerequisite-patch-id: e5bba0850a9f380c1d369dd56076a7ffbf7e57a5
prerequisite-message-id: 20260519-knp-soccp-v6-0-cf5d0e194b5f@oss.qualcomm.com
prerequisite-patch-id: 8459bcae98ac156f6576657fe9233badcd385218
prerequisite-patch-id: 9ab2b37c0a11c3a9590be921fefc8709ebebf6a3
prerequisite-patch-id: 21440dddcc340d35558010fe88bad9265e43c6ac
prerequisite-patch-id: 162f8b373ead5344ae0f29c92432db57a0d75f39
prerequisite-patch-id: bf5532cd5c8b66127e20be0677adbbbb3bd9578f
prerequisite-patch-id: fa7954f6fd2d27a6f0e805c9643b70e7e201c503
prerequisite-message-id: ad9ygQD6962M_UpV@hu-anancv-lv.qualcomm.com
prerequisite-patch-id: 48c26c428cbeaa674a615704d1abeb87e4e965c8
prerequisite-message-id: 20260523085511.2532669-4-sibi.sankar@oss.qualcomm.com
prerequisite-patch-id: 43e96d8a5063f51e2b5ee75fc8c9e10682e5670c
prerequisite-patch-id: 2e71d345f84a821d89da2a6064954409fdb1277d
prerequisite-patch-id: 0b9f5995044bb3d3ffda227ac986b755fa118c63
prerequisite-message-id: 20260522-glymur-gpu-dt-v5-0-562c406b210c@oss.qualcomm.com
prerequisite-patch-id: 9175e9ae77ac032c2f0502e2c63bb7b7d1ae4ead
prerequisite-patch-id: 916e96859119985c09aa265f45f69e0800d56988
prerequisite-patch-id: 36f4bb7740fd65d808fa6685bce4b03798a547ff
prerequisite-patch-id: 054631082c45d3ab3117f541f0d4d90b660dac73
prerequisite-patch-id: af18aef027c45213c11b436746fa31b3b6ebe46b

Best regards,
-- 
Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

