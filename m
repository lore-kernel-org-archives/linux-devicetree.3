Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82C9D352005
	for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 09:18:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789031885; cv=none; b=ABVc8DQlN+DB/nwIDAFhKw+DDWE8sKc8saeUUX7jSJawTw3NUN2GtlxGFDS+Csc5SMMgctv2+o8TEz3souhQzzyI7CErL2hi6gwXJnb0G/hfFgpWR3L/hIUgCZDd3W9UT5QQPVnOWbqFzyeviwkbVWO0DJmd5VAFH2+KtxznXu4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789031885; c=relaxed/simple;
	bh=oMsTPVxD3adyYqXrZsEmwysubsy2RQPrnblfLqNinT8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=htFmRp+3mx3fhmfvzdMTBWrySpsrkGJOin4bYuXweXN+JFyQbfDxvbnuj60PUA4WN82t2osj/faHarWPjUg29Hga2qCOcsugfpPP5WsO4ntw5lTYI73hz/ElMuHUPOWXAYn6/CMHOr8LDBLzo0XQ5tvv6qqwcPkaRJH5Hg7Cl0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mcL+gMAE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hwPUfKdg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mcL+gMAE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hwPUfKdg"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68A8xPVQ3468667
	for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 09:18:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=34EnVTQRCQOFDP/vleefO0G84CYKnhKOKiG
	flj4Zs4k=; b=mcL+gMAEqYPl4aemhJWYDtTHCKbeNWmqxp7JRl+KojLCtxEZbW9
	w7IEfNqNK+QPt6I64B0Mdr7RLMnAVlj5FwoBTdUFvQD9dtSi8kz9AGsLJqijJ8wI
	buH53sKQEkkWgdLRrG+JfgMKpFMoRw1HSFfXjQM27LYLv7u2iYK2sJuKHJDGEY+a
	D84vEW6sYSGAjWR0BtLozQQWlC0pykonftxWR/eere2xWzbc4XiBgPdtdNkyL4Ma
	zq+DBqrGaHIaoEesBNWAIw/OTx2J1YVCT0p1DNoPCnydcvSL1egok2kDlCK5mBQI
	5UowIlzifqsTi3PZNkxxVCVBuHK7dr0/lNg==
Received: from mail-oo1-f71.google.com (mail-oo1-f71.google.com [209.85.161.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gksh8r35r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 09:18:00 +0000 (GMT)
Received: by mail-oo1-f71.google.com with SMTP id 006d021491bc7-6bc3374cb0cso1777933eaf.1
        for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 02:18:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789031879; x=1789636679; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=34EnVTQRCQOFDP/vleefO0G84CYKnhKOKiGflj4Zs4k=;
        b=hwPUfKdghaB/oh4d9iaAtljQYaQvxxj0ZqQK6l3m9tTfD/P66wLIXY0fF8lG4cA2gz
         NAFZmOkfpII1luLLCbCCE4tmmGvOtpHESATN/27IHgH4hwDcI+RsTva/EGQ74bAUHD7L
         tZgSXbobwqnCuOkGrSS37B99TFShuz+nIUubjPGJ0jaxI2Xa4Ar5EtrDNddgnNd/mTEm
         Wf4nF38vNFfwTuLC9EoXnzdrsu9o67UzfJEY+z5d62AjfXa8WARSHiFGI7mjO2WpcBq9
         96NfFde5zqj6hnQai3iaTaNi5oRhozUFo1TjXjNsDwP+hNESCXSzzSBUye+muGiNxUf1
         KYLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789031879; x=1789636679;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=34EnVTQRCQOFDP/vleefO0G84CYKnhKOKiGflj4Zs4k=;
        b=ep1JicimsGzBYAJ1yEB51BSAYas535nCB1VqETUFQ1TQDTrwE5KVELcK83Sm4fBzKv
         +87u89TN0pwaO+6KOXtkJO9g+KntT2SsFq2N4Ph8I26zP8YeNykAKyars1EhaFaBB1tD
         KemRQZK0dq4iifP+n3uISFiD2Jin0ezRqvzJCZ4Ec4TIYuZ/3nJ3y8+V4XICvoSIiaxI
         LVb3MpKWJcqp/uSE1EDOZ50wxcQRGotxYMle3imtLCi/C2ooEDNhEcjwU+V1KxsvHtVA
         OfY0XdaR5jr+4zlrkFM2Z1GSEHRuNZ8wJnCfMjn04yvErejbMrumYZ4KeQS1IS9mDSwf
         TlVA==
X-Forwarded-Encrypted: i=1; AKwUvBw+8/fIYhBSPelGKgif7HJraGXhdPPincnO6rfRl6eYCmK5qdftRIU3HOcu8BG24GahTT/1jE6x42XT@vger.kernel.org
X-Gm-Message-State: AFuF++mbjuhQonVhK+EIQMWm0sfsW//aOu3ghJJ5Mqu8sSSiyCd7UIHM
	yju30lBwXdUHQ4hM0Ata/LdMKnzNW3vI0RigsKLoG4SXgh/G3ZTqarTKahs8tivgeyBak2aCFgl
	o3Pd9KAIKjDnmaVaTEM30K0MNJMs2SzXnTBP1SmJEFSmV0FAi59phUGV3xPnjtrDF
X-Gm-Gg: AYBFou3K4J78+SgnKdE9EIvJhKSuAImbFsRo/4K7xfk08DhESY+MtaLwatPEADWHXn8
	WQMFcK9K7ce3X9soWlGku9YbxKKzhbnjGMo4Ok7DrGLtJBGS28t9LDPWzpJRR55daQtrFd16fbB
	9aEVKEUmRpT0C/FoZLcBQP2buHuC7lmyJwnRqe7XPwSYMQ39olqdiKmJP67ulA/GAfqUQlqvoVT
	EQBQABMytrx0P1vQHJXapIxJiICPYF5tcMANFazOt+jIwYwxS6P1v4V2PjgOcknD52fyorxExWe
	T/CsxM6snZYBn66SqzgK8xddW5YgZ/nEicaNKWMZBd9Yc+pbsun/rAjzCJjjQ1+DqWzVZRgFvO6
	xGG7bf1S5dnhZCQ5VfmwhI875atWSc+bK4E1ewi+rLrEeVmuIv/DnKvOJ1X6x
X-Received: by 2002:a05:6820:4dc7:b0:6b7:8396:f3d4 with SMTP id 006d021491bc7-6b78396f84amr19858898eaf.54.1789031879239;
        Thu, 10 Sep 2026 02:17:59 -0700 (PDT)
X-Received: by 2002:a05:6820:4dc7:b0:6b7:8396:f3d4 with SMTP id 006d021491bc7-6b78396f84amr19858879eaf.54.1789031878830;
        Thu, 10 Sep 2026 02:17:58 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1433171a97esm57395988c88.12.2026.09.10.02.17.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 02:17:58 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH v2 0/2] usb: typec: Add onsemi FUSB15201 support
Date: Thu, 10 Sep 2026 17:17:49 +0800
Message-ID: <20260910091751.819264-1-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: DYUQ83invLu74r3zo_IktPoXuWxTOuHV
X-Proofpoint-ORIG-GUID: DYUQ83invLu74r3zo_IktPoXuWxTOuHV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEwMDEwNCBTYWx0ZWRfX3d/Hij2MOaRb
 pGC5FtYyb1YgwBf+Tr5DiPoaYWCCaN/ndaGx0v7GEjdZY29k8vQl/RB2gYBXKFI5fTQCNjIouBs
 PSwij1FJ/QfVgmpMnj933es5CXV/8g6yrftjRS4ECk/2BW1vz+8i7mgLXfBZgU2ctCeDUtJfrsV
 GGNQbY8CdJCmNYcsckKmhfyhmlqZybcpECZi2jVPjNvgE8dSO3G611cY273RGneZ2+ukebc8Let
 ohRRsnPnxTvEmnY9cmmnNlvzmU2e2m0twqpOhHzAzg09QOeVTnhOIE57r2tuKX1QZazNmhRKBVN
 tQfNlrz++wH47AtwSjJhdHEd7V/9UA4c7JhLs8P+afNTZZ8iknpTHlut7NMhgec/WOAwoI2MLm6
 z5PXAA1mJ4rId8y1hBT3IJYOelKDONP37B6wu5TnuSAfwq8rgY5GVGbeU2ov/QqxpeCU5NUf8wk
 1siMeZ6mSLu8G/eYl+g==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEwMDEwNCBTYWx0ZWRfX2QbMShu5O7vQ
 Fq8pH1q+0wtw7NZ5WZYQ6Yltt0QV/qcudX1uD3tEBQG1uuTNma9urrpHmyS7JIhIW94Q9LkSzma
 zgQZfX2yXfFVW73hOUDPdUv75jnTjQk=
X-Authority-Analysis: v=2.4 cv=a56lZkSF c=1 sm=1 tr=0 ts=6aa275c8 cx=c_pps
 a=V4L7fE8DliODT/OoDI2WOg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=Sth0529Ve8dJX5Jf890A:9 a=WZGXeFmKUf7gPmL3hEjn:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-10_03,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 priorityscore=1501 spamscore=0
 adultscore=0 malwarescore=0 phishscore=0 bulkscore=0 clxscore=1015
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609100104

The series adds a driver/binding for onsemi FUSB15201 which can be found
on Qualcomm Nord reference design boards as a dual-port USB Type-C
controller.

Changes for v2:
- Drop include of <linux/mod_devicetable.h>
- Link to v1: https://lore.kernel.org/all/20260902045938.184221-1-shengchao.guo@oss.qualcomm.com/

Shawn Guo (2):
  dt-bindings: usb: Add onsemi FUSB15201 Type-C and PD controller
  usb: typec: Add onsemi FUSB15201 driver

 .../bindings/usb/onnn,fusb15201.yaml          | 152 +++++
 drivers/usb/typec/Kconfig                     |  17 +
 drivers/usb/typec/Makefile                    |   1 +
 drivers/usb/typec/fusb15201.c                 | 580 ++++++++++++++++++
 4 files changed, 750 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/usb/onnn,fusb15201.yaml
 create mode 100644 drivers/usb/typec/fusb15201.c

-- 
2.43.0

