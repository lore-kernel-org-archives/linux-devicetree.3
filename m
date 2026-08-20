Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9F023537E0
	for <devicetree@vger.kernel.org>; Thu, 20 Aug 2026 14:58:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787237937; cv=none; b=p80W+/2yHcqx8XC7q9rz2JHPTfp1ke4h1+D4QFK2MsBCBtZmQ3TwlLEXxwQnw9UJ+NGVmLhSLQjJ6SlaN5FztpXfXrsVQD55fLay8pHuBzxm4XM+CMIUUpDgrRM8Zo1gDgocg5cNASgt2uUlbGViuz5uLKvW8uCTPZtbbIo4qQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787237937; c=relaxed/simple;
	bh=S6cUTVkOjnkG5QgtrHI21qh+KP1x4A77E9/b8qhFb/g=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=m28RzHQgqtQNF/8jU7H6sK0sjurqK6EyUB3Xy7WFzNigEC12biRj8e+XN0f7MGUGuFnUIn65yexKAcmypPeQ/Hy+heeWVWTB44kyAHmO8lwTYnDtpcbCnQYv/aQGSOQ//EbcYEDt767joqCXKfs2kbqxiCUlQsHAv4OyEWXa77o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CA2ONE0d; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=axAz7xbk; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CA2ONE0d";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="axAz7xbk"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67KE7iCC3650426
	for <devicetree@vger.kernel.org>; Thu, 20 Aug 2026 14:58:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=2X8TzexBQtwTv2/p71CBx5GD7JIkLjDcccl
	sF+NZojg=; b=CA2ONE0duTxX4Q85+/itAjDjGLPQulXd6ih/a0pUMcBKFLgzas4
	flmVnvBox3zbX68G9YHQPp2gfjjQ0wQi2aqTiAYkoy045pEZ+gATA5BabxpuxXoa
	YLkDURHjWSiJ4KIeq8hNr4WCUL4RuCYhxXxHTO5NVPaXGkLHa3Syb+972OJ8I7DO
	mYHbaRbTW5pN0nuXNbdK8QdzcQEx1wYZTlQnjyv/K4RBypWuHB0EfUIyp1uLGPFU
	s5uyuC+VTEiAFtQLyKtEeNQhQE66ytP3QYkF7CVwjeDeOjhg62Gy6lWfTp/T7vXy
	uXJclWdB6lY/OLJoEWoLaS6TMUNOF5rTU8Q==
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com [209.85.128.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g5w499ubd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 20 Aug 2026 14:58:55 +0000 (GMT)
Received: by mail-yw1-f197.google.com with SMTP id 00721157ae682-7f582244e9eso72947087b3.3
        for <devicetree@vger.kernel.org>; Thu, 20 Aug 2026 07:58:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787237935; x=1787842735; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=2X8TzexBQtwTv2/p71CBx5GD7JIkLjDccclsF+NZojg=;
        b=axAz7xbk+RjdFtzroQQ5VPVluNZ3ph5NBdtlOMuL1yNpt+v9G2hIepUXF7BM7pgnAo
         vH28riPiELrSZJFuqWxJxgU5sZTcYKA6+zgPc3gUi+kpp45NpQE0yHDtJiTVxlxh7Qhx
         lxONN54VaHSQC/CqKFN9gec9s4N3/mMOmDwuE4P6UISF7FFJGTIoWPbGIhFKjoaiJ4+2
         Crcf+bqyKHPc02SVzEC140uasbfOb7MqOb00zaSSzyZg8updwYbuOcZF/0ZhnkvhuKcN
         vFbDMgLu/DssfjZ0ixN4uo2r6M18XFNd+u/hoetWlVtt8fkNWjhY+8vdAi9udf7v4yFB
         4LTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787237935; x=1787842735;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2X8TzexBQtwTv2/p71CBx5GD7JIkLjDccclsF+NZojg=;
        b=Ov7qhxo9TyEvQHL6nbKRdqxzefF55AlbLRZhLj6AQF/PGFJfLrvK3WYH9kPoU7c7dR
         hqEVIQZelmEdW4QAkqL/bCEDOWY76YrCMieQMHOuiMtRxkSf4UjDync8jyoyAx/AnKxT
         PtY94beBmlpzOZ30YMVLt+bjJTFnWS/fOYJ4YlfTnjamGNRyldHI69NFmpQuKPBjOI9X
         tyeJKdGTfuXBR6LA5IrtbkhOxN1lZrOx+p5I6k5PLDRu5rvMzMwZHx8viG4UmfBFw5Bp
         Jh9r3OsxVL5/gAgqnpk1JPMD4XbGGAzchWUjb/Kw9yDu92JxvezJPjP8TgK4zQSJnBwB
         UWuQ==
X-Forwarded-Encrypted: i=1; AHgh+Rp7iv6IeGew4zO0ZiNAo/lL1o3tncsovk/ddLTlqJbIxiciIiPP3fXBEEW/8K46WbnpyNQ6deXaqQZv@vger.kernel.org
X-Gm-Message-State: AFuF++nwOmDkBTqnKg5mcbbGEz4cFabIJmBmGNoIuiBHzv3X15P6KaD2
	VF8lwDfL0IhOLXXegbTwJpq9fbZSz1pD4OH2sAGfnOj+JrhD3Q8gDGyTaMQPInnxbSi/Gcy39H6
	qF9qhPNcR6Y6xhtCHiYyM3BcsT6EzPtaxcicxDa7aFIwAL6/o01SAjYHLWjD8hbTLY/LNZepe
X-Gm-Gg: AR+sD100SdWugd1uV+3gei/SSNaTKSDoavI1z/yKa2VjNC/iUPE3bSaQJpwlVEQjQI/
	EtRV6EUtm6uMlDtP2EurpzYo4N7x4cHGJ7wGOPBpIQCR+AVcft+xmwj1UgB+MbiCzGQZ7CMgucR
	jpycu4T1I50qz/FxO1Iiq+7uZcmOs3tyzUeI/+qFB07kLY/LsHtGXCRUp2BRco71nqYe2eCMt5l
	zySeTDPakeJhZ4Niu3IOXB8gS37XbmPIN6PJAH2XWANFiTrNvlwOiXWaVVqkyDCi7d/acOl2jNv
	iCe6QgXNtCj7wElz71ijFbWBsAgW7nvFJszeYjW4rP5+vgG3xVHcCrZYe5FABOYa6zAFTDBVOYR
	VUoOJFUcKnz5Z3UT7g+xqWGnTRG8Q
X-Received: by 2002:a05:690c:61c4:b0:81f:3dab:372f with SMTP id 00721157ae682-844e03038d6mr61660737b3.12.1787237934028;
        Thu, 20 Aug 2026 07:58:54 -0700 (PDT)
X-Received: by 2002:a05:6830:439e:b0:7f3:ff22:d8 with SMTP id 46e09a7af769-7f43fa82a2amr11733451a34.9.1787237444280;
        Thu, 20 Aug 2026 07:50:44 -0700 (PDT)
Received: from hu-akakum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7f440056836sm5147383a34.20.2026.08.20.07.50.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 07:50:43 -0700 (PDT)
From: Akash Kumar <akash.kumar@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH 0/3] Add usb-role-switch support for USB Type-C ports on Shikra
Date: Thu, 20 Aug 2026 20:17:35 +0530
Message-ID: <20260820145036.2035641-1-akash.kumar@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIwMDExMiBTYWx0ZWRfX1yt8YsmChK1u
 XzLeVe3vCxz2jLpiEik850Fz4168BPKHo47y2lgE28duOI9sDCkh6EIsVhf/nJt55cyiW0xbvJN
 mHklx9myMb+Gtjj6KuS6OcBwhuYiOSs=
X-Authority-Analysis: v=2.4 cv=YP+vDxGx c=1 sm=1 tr=0 ts=6a87162f cx=c_pps
 a=0mLRTIufkjop4KoA/9S1MA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=nkNBJ8IO_oB5ijvGOQsA:9 a=WgItmB6HBUc_1uVUp3mg:22
X-Proofpoint-ORIG-GUID: of1kl-kwUTeLZyC1I2Qar1YaOoAukrGP
X-Proofpoint-GUID: of1kl-kwUTeLZyC1I2Qar1YaOoAukrGP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIwMDExMiBTYWx0ZWRfXwcaXKsbLvxeE
 sbj67P1g8bpwJ4exSOurfSUsf3azXp5muYAMb5k97vjavA/Fumcc1RbIXXCX1v+Xs//9FQD2BPT
 lsBLoxDEFvqPBPKHHiwjYaiUsEIo5F1sW07o/fNM7JeaiHuLjcSCGLMmJXrWMgNqoOFtwUhs0yj
 9TF1hoVbtU8K8+oxSDGSbXDcUadL1YXzYQ2YP2ac/qNP/HHjE7dVOtt98JmoBNNtmV9d097D4EY
 pu2S8xbMp8FyeHwx4jw17mMRCSjaUSgTrXMFrKWH4u5++WuGTsOCjsDYmPIVVs8b6G+rpMYWSsk
 F0JYsciv9G2Pyw4Jgkuzcv0QMW2v4gRTDLl/fHRTBA14Xodmld5OovT5Lv2eKnlksRdURIMzVno
 m0Q6U3B38HcOJjS2k9OffunErXTrJrBxm8AaRyhNWWtKbrKCgzYJqypiqJNZVBoDHoyVDN0InUM
 /LrahDkJzeBCfAWPxWQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_06,2026-08-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 bulkscore=0 adultscore=0 impostorscore=0
 lowpriorityscore=0 priorityscore=1501 phishscore=0 clxscore=1015
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608200112

The USB DT support series for Shikra ("Add DT Support for USB on
Shikra") enabled both USB controllers in device mode, since role
switching support was not yet present:

https://lore.kernel.org/all/20260811-usb-shikra-v7-v7-2-753e928f37ae@oss.qualcomm.com/

This series adds that role-switching support. On Shikra CQS/CQM
platforms, usb-role-switch is handled by PM4125 on the primary
Type-C port and Cypress PD controller CYPD6129 on the second Type-C
port. On Shikra IQS platform, usb-role-switch is handled by Cypress
PD controller CYPD6129 on both Type-C ports.

Patch 1 adds the device-tree binding for the CYPD6129/CYPD6229 dual
Type-C PD controllers. Patch 2 adds the corresponding compatible
strings to the ucsi_ccg driver's of_device_id table so it binds to
boards describing these controllers. Patch 3 wires up the CYPD6129
typec node on the affected Shikra boards and switches usb_1/usb_2 to
OTG mode so role switching can take effect.

Signed-off-by: Akash Kumar <akash.kumar@oss.qualcomm.com>

---
Akash Kumar (3):
  dt-bindings: usb: Add Cypress cypd6129/cypd6229 Type-C controller
  usb: typec: ucsi: ccg: Add support for cypd6129/cypd6229
  arm64: dts: qcom: shikra: Wire up usb-role-switch for USB Type-C ports

 .../bindings/usb/cypress,cypd6129.yaml        |  99 ++++++++++++++++
 arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts   |  64 ++++++++++-
 arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts   |  64 ++++++++++-
 arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts   | 108 +++++++++++++++++-
 drivers/usb/typec/ucsi/ucsi_ccg.c             |   2 +
 5 files changed, 324 insertions(+), 13 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/usb/cypress,cypd6129.yaml
---
base-commit: 96c901471bf7948b9b9f70d38ea11631a8c33b4c
change-id: 20260820-shikra-usb-role-switch-a3f910b2b2b1
lore link: https://lore.kernel.org/all/20260811-usb-shikra-v7-v7-0-753e928f37ae@oss.qualcomm.com/
---
2.43.0

