Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D8EE3B27CE
	for <devicetree@vger.kernel.org>; Wed, 20 May 2026 09:39:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779269954; cv=none; b=aWWuquQYLIDzw5cSe2PiCvxgsAU0zCbrnMigB7ht7V0i0YHeDzoAhfZ7A2AiPeSb6qXmijpvsMtWoMhCPfxG518EVB+gPj4cx0waWxGrUlBP1fYSO6h3Z+MElOLAzAMh2ZtBNP+uezpsYDALLYbqNnBoDOxCxdhNChVoE9qyaxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779269954; c=relaxed/simple;
	bh=1ROATfcFnGfXhhsL0vtkdzZWxKejY13e1mc5l/KMd/U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=l2+yCJG1l6KZos2Tp3euUFJaUxDs6+PZdOIpZEYvLaNGx0lj/Pl2jbBiFJmzQ6mLapnes+7iApVwkFsV06rodcfxU9IqIM1DhPrEPlpDJsinxKPv3QMpDkh/iaR9mCVkW/j/aRdeNX/u6MUBePcjxLFnPOHWFvEWiXX1TQ1Tnbw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=T+YV0UwH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WLcp36Da; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="T+YV0UwH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WLcp36Da"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64K7dKek1636897
	for <devicetree@vger.kernel.org>; Wed, 20 May 2026 09:39:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=I53qzRPF4Onl70g6cIzN+NmpkesSx0F6VI3
	lb4bNpyI=; b=T+YV0UwHvsJoEkGr3AJpgncHysLAS4mC4GpJrz72retPH225pcq
	G7vDmRwN/T67MZumvkR0aoRGvydBaQ5YojOWHTwvVxWUvlja6m0/hu7T13Y1mTRY
	oijcT8ozS7mNRGPu1HplHRPJnwfouus0rh6T7K3itC2l06vPbeinIBpi5yyl804U
	fpCevBPLOneNPb+dHXdEwnmsLIAMuulSEF2TuwfFvHjDtwYQmi89u1DDTcxKeHuv
	2KDua6YeHv9Jqq0J8l4bci4vhFHf05iTviBhixgBgAV5I+n2BcwadHxGJIGQAPWI
	ebI5WlaZwlB+5DqK+wAjZTDffPgET6ZW3fg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e8t3sbyf3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 20 May 2026 09:39:10 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2ba6fe41283so47151575ad.1
        for <devicetree@vger.kernel.org>; Wed, 20 May 2026 02:39:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779269949; x=1779874749; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=I53qzRPF4Onl70g6cIzN+NmpkesSx0F6VI3lb4bNpyI=;
        b=WLcp36DabVpjvAEIRjz0iMTE9jOmic6LLh8dg6acY8K1L585pFoE/RutL9wXgOUX6M
         0earm7Yd+NhJ8SrGS+eb+BMKnVajFiKoJXXhRpRI/rCVghGx2jpl7lLJtRqDOPql6BAz
         XD+BGUG3dWiDSONXhcyls+qIJJ7YX3Ph0b/B5f5Y+2I9LtG0EUG3CaAaWWvp6xDn8rkb
         ni+wnHaLKVMxLZc8b/TU66LkNwpNinYUrqIbiGLThV/a11KLSIZHjB81jsAlF/g0V3vB
         taiSUMdEmGE/smVGLtwKFRg1ejGQ258Gbnsg2Sk3YIRXpn/S0z9SCaU38dbWZdcOQvjr
         NaFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779269949; x=1779874749;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I53qzRPF4Onl70g6cIzN+NmpkesSx0F6VI3lb4bNpyI=;
        b=jE6loomhxvRo+G7JnRvlbJw841v4ytTXl8rzWV5yX9Sm/7/RuLRm/KNSpUdVpMDe2U
         AEQngF8EWyTHso2JD1VXYEwljfLgDUqsPMHtUQgTshpHthcJEAouxB63jvmtLn9heyJA
         ruaBppP8pnVz7sNGeLOYU+OuSC/9f93HX+OJ8jcyhE2UKWPgz+F2t3Bn8nZBvrbS624U
         iGzehBUaSX1QdAImEhyCJixoqCZ/iYyU+1I1P9M1W70oIJ6webaBa1VcYQY6GIuqZLP2
         QUa+yI2/kvRUxgOI9cvJoqJlvSoTkyWnS4osmDsbnvxTLG/1TCQgpAArw725b51pTHeu
         etdQ==
X-Forwarded-Encrypted: i=1; AFNElJ+KXC1xLaoI2K7KldTxY/amPfpVHnX94+HZGEAPNjIdLWlgeTyUg6zkvH6KPrKKKlBNfXSYEdPDrj/z@vger.kernel.org
X-Gm-Message-State: AOJu0YyA2Hl6fymVJihMe6bc/jxRozpiSTSnAUOSb+GVJfi8ruWIB/84
	yQ4iJduaKvktDpRhbbXXmO4nNROQRwr9Pa2raplBKR9iIWANCXGuHBOZOGnewSl4brIZgCEKAyL
	7AoXWmlLertEDbSjKtd27n7KxAGbRbBxdoNEGkHGH+UAfHMPGvV3TB3GMtDgqYAZV
X-Gm-Gg: Acq92OEVYtIArcGUyQ8xTdXZqGwrDkaAJ4LBR7Bxnfqfcqc8TSJXRk7OyUwZJp4czyt
	UGHf/3cgrPmsjoCeI6HIglLe5SOGpRKwH2v8uoz5BEZcqLEWHsnbq7O1T47mwiORxDAKZCjeHrA
	XndKj1LSrD7vCg9SxRZNVQqE4nIS+UvYWAO1L8BhPggzrAn4I/trqFyZmELVV7Zl6s5zO+Lhcfd
	Dmufdc2nyUhSLi+l2PcPnTXNKk0v+9e6lGJG1BtE7qqxrexkX+8EgN8B8SlthuF5mcEVyDOX+WL
	6JA3VACL7J+ZALhdcYIpgc4JEp4hcQjE16GQ9/Go+8N0gdyen4oPhIK8QMDwuJod7IaBkZGkAY/
	vKX8pSHinsPT++fVSIGas4yQN3uqz+2yMtaIwHxqzTBS+yZF1/Q==
X-Received: by 2002:a17:902:ebc3:b0:2b0:6e6a:8504 with SMTP id d9443c01a7336-2bd7e973c40mr258310125ad.27.1779269949188;
        Wed, 20 May 2026 02:39:09 -0700 (PDT)
X-Received: by 2002:a17:902:ebc3:b0:2b0:6e6a:8504 with SMTP id d9443c01a7336-2bd7e973c40mr258309785ad.27.1779269948744;
        Wed, 20 May 2026 02:39:08 -0700 (PDT)
Received: from hu-akakum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5cfe8baesm217052215ad.47.2026.05.20.02.39.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 02:39:08 -0700 (PDT)
From: Akash Kumar <akash.kumar@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH 0/3] Add Cypress CYPD6129 UCSI support for monza SOM USB0 DRD
Date: Wed, 20 May 2026 15:07:31 +0530
Message-ID: <20260520093902.2064730-1-akash.kumar@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIwMDA5MiBTYWx0ZWRfX+f9LZy8rB/DE
 ncnfIxdSDVG3gahtLYgDGAsbGqt6y+DH1OPkol8RQxUdyRaw8Im9p1iwO2IXCBxgt74zJ4Je5bC
 WPYYpUi/yKCbNhh4WTd1uQvkI75x6inpDlPAd9E6jOicwBJhfXnK7nRaKGN8w5GLkGx7LKfDTQA
 D418Ufq8R3hxtuNDXxPbApbW9lJxlMrHUcQxooK4shxHPugiftrr0BLJ/d5eW2P0sJi6JfU9AVG
 7ZAm82ETZI72G0xlgnVPDMivuafFUGTK4rVwo68Z5cUi4dGp5kcKblzV2olcCcZCKu6vYqJ69Mu
 G1mDE9J1mTD/UurcFmq7wmCg/q0n0EeA1yixou/Gcmgk8JfuBEB/wfBhORWwlZ2tMJGaMF+vRWh
 WNra/WGHIxAskd3sSgcfIi9/j7ItLEhVxHSOSroojqmWEcYwy1uyjQUn5b1St5rOJh2P4ZfMoSg
 PLzssmVgYn3t7+eww8Q==
X-Authority-Analysis: v=2.4 cv=Oc6oyBTY c=1 sm=1 tr=0 ts=6a0d813e cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=C9H03ch1PF7tVjC8yJMA:9
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: Ngj95XrgmEp4YjnFdJWqpP76JQ64sVao
X-Proofpoint-ORIG-GUID: Ngj95XrgmEp4YjnFdJWqpP76JQ64sVao
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-20_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 clxscore=1015 bulkscore=0 malwarescore=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605200092

Hi all,

This series adds support for the Cypress/Infineon CYPD6129 UCSI controller,
used on the monza SOM platform for USB0 dual-role operation.

The series consists of:
  1. A dt-binding update to document the CYPD6129 compatible string for the
     existing CCGx binding.
  2. A driver update to bind the UCSI CCG driver to CYPD6129.
  3. A board DTS update to enable USB0 DRD mode on monza SOM using the
     CYPD6129 controller over I2C12.

This enables the USB-C controller, connector, interrupt routing, and the
USB2/USB3 endpoints required for DRD operation on the platform.

Akash Kumar (3):
  dt-bindings: usb: typec: Add Cypress CYPD6129 UCSI controller compatible
  usb: ucsi: ccg: Add support for CYPD6129 (CCG6)
  arm64: dts: qcom: monaco-monza-som: Enable USB0 DRD mode

 .../bindings/usb/cypress,cypd4226.yaml        | 73 ++++++++++++++-----
 .../arm64/boot/dts/qcom/monaco-monza-som.dtsi | 57 +++++++++++++++
 drivers/usb/typec/ucsi/ucsi_ccg.c             |  1 +
 3 files changed, 113 insertions(+), 18 deletions(-)

-- 
2.43.0

Thanks,
Akash Kumar
