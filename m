Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE6ED386C29
	for <devicetree@vger.kernel.org>; Sat, 28 Mar 2026 11:41:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774698101; cv=none; b=MTfG9e6ArJAIzg/oqEPMk7vrb7sZ+csm9zsFhUxBzt4UIjc41zLsSOXl/V3dk8y2bP8K6jKD/PD8kerl4v6dl4Et0f4tgh8hXQAXvzr3Gb/KwWungOFFw3218zekW4zA7ulRg5JmCG0SoIX3ttiwwBojvDUS9Ul+Z2ZbcyMV1nI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774698101; c=relaxed/simple;
	bh=bnU6dynflPew875hICHHOHSbmvl2NPUqPBjNWh2PwTU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=TYafKURHJtlvjNcQgR7/uz2qCRMtsqBjQQ+uQPsaOTlV2pTik5sUIarDHjWyWgLoXyzy9UvDzptFStaouAM7cPp1j0iCPj1mtHegn6rzFTymdOAkYSe0PG/zegeWuoDrcEdr0d7cs+0qOGtK/9CVx/gazKbXxc6XFxhJd1SK/Fk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lnZarFSc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aDW7kYgV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lnZarFSc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aDW7kYgV"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62S3Yl92348677
	for <devicetree@vger.kernel.org>; Sat, 28 Mar 2026 11:41:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=EcsKpw5E9xiRYPE8J+Q8nx
	afgyfjjfSrJbk6me1tHNE=; b=lnZarFScLnqIzEFjdrWhRLA0DsE+P+Y1vBEmcK
	jEoEWcuoO3wMkPGANAkuvDZFW9uKVZiZIUp1eV6mI5+MWMTHWO19pYVVzWqZeO/y
	GYIPdLK4F00L9m+UXHJHKiRLKRXrQIR8q2g2nSxz4qHMZfho7GIYhHBr4p07gPWh
	2Zrk+yeY1ai6qLioi+uGqg4p4/W8OMCMvKzu2i1XeyojM/snyHXMliq8XRg7FPui
	zE7attkp/kp9K5msrRPKDPvvS46Ptv9f6atE0keyS4tPhypwYEEHx3CCr+MU43k8
	s1UY6/JOnIw0nKPgTce6gVwA72xVk1917ChzceeW22IUmNOg==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d67710puu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 28 Mar 2026 11:41:40 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c6e2a6ba6b6so472974a12.1
        for <devicetree@vger.kernel.org>; Sat, 28 Mar 2026 04:41:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774698099; x=1775302899; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EcsKpw5E9xiRYPE8J+Q8nxafgyfjjfSrJbk6me1tHNE=;
        b=aDW7kYgVmykPeTYuZBo7j2XgLurh3YXFms41ygUFGjfKwNBKFjtqiGJ0vbjZu5a5d4
         i+7Hp/EaWIoAJvdPaec2kqy4I/gqB0b0ccOYVBiBFieE61olkVC/Gt/fSUy6MxdviZ5t
         nYxWPp1lhrhSc56H7w3xqGysC85lmYycyIAJDeWZZwVFlaYHaY7vMFUUq7nUdq0XgYIS
         D4MO/WXmLGCe3hG1SKsySeX/PD08O6XyUNs3Ra1cfxfw5u1HKUW2MrXdneIBRUXlQ8X3
         4426//WLYfBGCuNpjOo6Kg6oZNSlLbtl906ikqRu6NIc8KVIkAHadI4BoKHa/yVzSwrq
         JZGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774698099; x=1775302899;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EcsKpw5E9xiRYPE8J+Q8nxafgyfjjfSrJbk6me1tHNE=;
        b=H2gsxia6CRhFcdMT7ynPIxmP7HoZdqNjC6l5fmJA4iOmG7tb19HKjlpzvMCLDOdxyH
         xjXTDB018o9EDquE+PKPcIVvpx0hzixKHnWIM0xHtHhYw8Wr7E1QB4JJcjRLZpN1oQbm
         9zWmmfYYccVGCRo7VGWWgQdkm7CewpsdCpN4y79H91+JfNKyzOueCO+8TkFrNEOq7ZOx
         cygGJGDz9egL2McPX51uyyLeq/wMy9OEfnwxBjOESD6KTWNRJXjcIEgD8aItRTg7eesb
         cWeyGNpF7mgFyG0YgbD6ceRunUzr7i++RyQuf/otumK/Bo22pA9l2Qh+ph8j+PUgzCH3
         vOSQ==
X-Forwarded-Encrypted: i=1; AJvYcCUukQ2oLef6JBwQ19b/pX+arY9BfbmOa3Za9GB4SFpQ+Fne1bhCKIlsghNEPuFGky+XClfVw2LwdImP@vger.kernel.org
X-Gm-Message-State: AOJu0YyLJsEuizKPvVK9vXJkcJ6guBNuZLBDMO+e3HPcPavW5kWq4ofC
	a59EsZSCYFJptBaH3iJuLHJPjE7QDCoiNVVjOx+pjNs/PZErWgTyDDddJiAeMcj+zg1akUb0+60
	rTowlE1Gk+rqmeAap2rXjK8OLLdOLJC3DHv0U6x8Rmzyw0TqJ71geAIM7MtPm/2si
X-Gm-Gg: ATEYQzzLtxjBIo83Y73cJ7VNicWzG44B4/3PPtbeW3WDHTKQPLg7r0O3BXT3Dcey3H2
	NWCsXJxgDJtm/pExweFc/MWIAYOXpaJM+6ZRaCsAC+QI/pAHm2P5M3aQcZSkyjsaM9Tse7FPTmO
	oYpuG7agUwfj+neI+Gmnj7RvPKMRThuud6Nktce5dp4Vout1jL0UX1v2e79bwonaUIDAwxVeMXS
	RzVzhQY/juRO612N3bNPVv75xHjQ9BPe9Eiq8mIemOZg643TaRToZiJovJuzr7QMCky5aWXQNuf
	RAqoH/5R23/2TgcO3x3aQPJJAzDYumtqduYS0UPCzlyYNn0kklW3GiLyVPmMYgnuTx30hXwQOZD
	b8dPwWKwz5cSC2JNdnQzAo4C6IyHMoWfTtmU3bJSDE/xU1xZqldia
X-Received: by 2002:a05:6a20:12c9:b0:398:6e91:8554 with SMTP id adf61e73a8af0-39c87b98675mr3770939637.8.1774698099478;
        Sat, 28 Mar 2026 04:41:39 -0700 (PDT)
X-Received: by 2002:a05:6a20:12c9:b0:398:6e91:8554 with SMTP id adf61e73a8af0-39c87b98675mr3770926637.8.1774698099074;
        Sat, 28 Mar 2026 04:41:39 -0700 (PDT)
Received: from hu-uchheda-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c76917db535sm1681238a12.30.2026.03.28.04.41.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Mar 2026 04:41:38 -0700 (PDT)
From: Umang Chheda <umang.chheda@oss.qualcomm.com>
Subject: [PATCH 0/2] arm64: dts: qcom: Introduce support for Monaco-ac-sku
 Evaluation Kit
Date: Sat, 28 Mar 2026 17:11:16 +0530
Message-Id: <20260328-monaco-evk-ac-sku-v1-0-79d166fa5571@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFy+x2kC/yXMwQ6CMAyA4VchPdsEt9Cgr2I8jFK0EDezAiEhv
 LtTj9/h/3cwySoG12qHLKuaplhwPlXAzxAfgtoXg6sd1d61+EoxcEJZJwyMNi1IPdFwocb7hqF
 07yyDbr/n7f63Ld0oPH9HcBwf+AwxMXUAAAA=
X-Change-ID: 20260328-monaco-evk-ac-sku-6d66f965335c
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Umang Chheda <umang.chheda@oss.qualcomm.com>,
        Faruque Ansari <faruque.ansari@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774698095; l=1074;
 i=umang.chheda@oss.qualcomm.com; s=20260328; h=from:subject:message-id;
 bh=bnU6dynflPew875hICHHOHSbmvl2NPUqPBjNWh2PwTU=;
 b=FlZWSA6pubdtWMQ/f7H5e6M7GADZn09t+Xr9Mp/pKLgRMci+IeEZlgO0dw3ApZLl6KyZEt5bp
 LH7cRpieaqiCxTps92iQYlufx1vAz2bdhP/ojutsR99pfWCjg1fUUU3
X-Developer-Key: i=umang.chheda@oss.qualcomm.com; a=ed25519;
 pk=3+tjZ+PFFYphz0Vvu4B14pBQSzqcG0jZAQspTaDRQYA=
X-Proofpoint-GUID: To-sKmDDL_KNHicUkV5GP66Gn6xKIHmU
X-Authority-Analysis: v=2.4 cv=efYwvrEH c=1 sm=1 tr=0 ts=69c7be74 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=4V7GHvCDef1FtlI4rEYA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-ORIG-GUID: To-sKmDDL_KNHicUkV5GP66Gn6xKIHmU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI4MDA4NCBTYWx0ZWRfX7WJ2dY2u5/aQ
 wWX2w0pWzDNWHl78+l4YqjM9XZBVUOo7KhkAjK7Y4SKob7cUuCb+APKmRX9AD+Po5DERgcrhCyQ
 3gSGNwGAN3fGlBN9F86pexjz9X2BempvdkZVPmklf99J7ZW+WHWAEwHe07AG2ML/uYgUl1We7Vt
 RXYZczaLTfYT79qrDM/ELrwWiMiVj3ni1fIVfQvjNLu/tb2I/68vwpDIhQTZEhDlB8foh32wqwA
 a31VGcfTp8hqaH4Feenjh+LHeY7W6Yj5ZawosMKTpda/qvMcPDbfpYNaKIae7aMradddxwmlcxI
 s/4lINzJjFOOMTUTwDtHvkJMcLRHUeM3c6abZngX9UGTBnJ1ko7SobHZxcG0/RmsyazTvwqCBs5
 ep8x0ld7aNZe2rSRwIWqJsp+OGr1eFxRb6ZXTdVt0ERZ5wdsr/CRYweBziwxV8+xAnZIhFqbt0b
 2YMqcORb4fSS9XsBUBA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-27_02,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 adultscore=0 clxscore=1015 spamscore=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 phishscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603280084

Add support for Qualcomm's Monaco-ac-sku Evaluation Kit (EVK) without
safety monitoring feature of Safety Island(SAIL) subsystem.
This board is based on Qualcomm's QCS8300-AC variant SoC.

Monaco-ac-sku EVK board is a single board computer (SBC) that supports various
industrial applications, including factory automation, industrial
robots, drones, edge AI boxes, machine vision, autonomous mobile
robots (AMRs), and industrial gateways.

Signed-off-by: Umang Chheda <umang.chheda@oss.qualcomm.com>
---
Umang Chheda (2):
      dt-bindings: arm: qcom: Add monaco-evk-ac-sku support
      arm64: dts: qcom: qcs8300: Add monaco-ac-sku EVK board

 Documentation/devicetree/bindings/arm/qcom.yaml |   1 +
 arch/arm64/boot/dts/qcom/Makefile               |   1 +
 arch/arm64/boot/dts/qcom/monaco-evk-ac-sku.dts  | 730 ++++++++++++++++++++++++
 3 files changed, 732 insertions(+)
---
base-commit: 3b058d1aeeeff27a7289529c4944291613b364e9
change-id: 20260328-monaco-evk-ac-sku-6d66f965335c

Best regards,
--  
Umang Chheda <umang.chheda@oss.qualcomm.com>

