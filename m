Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD46B84039
	for <devicetree@vger.kernel.org>; Tue, 21 Apr 2026 04:02:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776744177; cv=none; b=I8seN4fWJsXlngumLiGyYHe3MCL4sCgiuuCUjcPNhHd/K/Wel+swQttB9Wc6AtRGYpGgjqrtzC1Qe2EVSHnCpIEz2h1McNFAUdYRKngzq2sxp3xFikqIB4+/cE/uuJWni+f8nuYB3YyeFWAK/qgHQ/eMTNBZJ5Q5rHqlCE/vZ3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776744177; c=relaxed/simple;
	bh=ekwK6SWkg9RnsqKgPm0gyidXKkH8LAkRP8f3NpmOCKU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=q8tlTfiJ3EnumoEDSmPcxBDLdsA9YngdkEmgGqv/uL2CMi+mhAO6p4WK3/ReKiSadp5qAlbf55KgjOfgSWKVSqY+OZzqgJ4bjwTLMzELKtNf7qRuVeXdBhdDS4828d42br6SywFDukC8gL1lGhyf2BUxBQeomWl5/An/pDRKbsc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Smlu2jZR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=M3o8DvWz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Smlu2jZR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="M3o8DvWz"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63L3cNRW3015375
	for <devicetree@vger.kernel.org>; Tue, 21 Apr 2026 04:02:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=szAfKyszr8YVgvZDPe9I0SQ55Pnh8+psxXQ
	HTTOOQ8o=; b=Smlu2jZRX8yBvkYH55s6F6QeGyP7XNqiBeTF2j0l9few+MsgLV+
	k7NmWNTeNw2lR7y0Hdws53OmCw3y+S0NQsjzPRdde3G2oB+s3P/hAYuCfRSuOR17
	ZzPqQQdVChdcNGAerVKiEfGz00desDuKwEydFpYE9hwJHuMRjizSyUA/TVHgB/KR
	REjNwWf4FdJ+cNH4KNmDveGKRcgcOE5maIpcncu2yBa0tlUc3exk2A9+tupf5b1T
	VWawsES7n7F6XDu/fu4DmNfi0J2MSlaFqu6I4Xx7wf2uYc4/15WT1W3PE4fIYojV
	oWoF1rVFg5MertnK78xObrHH5eHEyc7AORA==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dnjuku6rt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 21 Apr 2026 04:02:54 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-2dd1c74508cso6610413eec.0
        for <devicetree@vger.kernel.org>; Mon, 20 Apr 2026 21:02:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776744174; x=1777348974; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=szAfKyszr8YVgvZDPe9I0SQ55Pnh8+psxXQHTTOOQ8o=;
        b=M3o8DvWzocmUqfxtMoOY89LArDWcPxxmvBx65AyDxdH/T9P38DAeRCyKBnjwjR6vw6
         ANQctWK34iu2W+fhotx4giD7bwmAwkzTSb+XMFoM53PU8GOpwkuRIvTc87G22gNG8Qkv
         TL1iqtfRRn0eCoUe8qEusK5K+9EKL94ImuEpvq5kSnCgDSLqLHOJJuHP3Ivm9B7gtuxC
         MEiIXi4W8DA3zgDqsSQVKDdWY+cfbXPuLYRxB8r40QaDV4a4ZWODUQM00bXJH202jCvW
         RnY64J57YtQc2q6/sIKkLkODJ0uNdtrf/ojfK3Vq5LORx+/lnVnV4Wa0uBpkZowRfRRT
         OWOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776744174; x=1777348974;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=szAfKyszr8YVgvZDPe9I0SQ55Pnh8+psxXQHTTOOQ8o=;
        b=F/HaHBjS7eERXzFkomhX8KC0GT14NfThQEEOP9MucRCuzujxG2oTqMFqIxj8oPeY1C
         1EmJEzMC4HLbGY7w4NH0kNYmAgcr4TQzERXLC76cwSfRidKTMyDNwlOCZb7rOevfDgIm
         SHH92yf/lzWeEK2V2gpyWp7BxgGR+/hsRUuGZ69yNJLR3JYi9HCQ4T/qrK9UZXUXOqlH
         ORpTvJAdYSXCTyomIu0YaOU/k7UFskkNEouHogZG2K6CssYhm6RlOF+2yAzEfNF5D5dG
         +tHXefMrm80b5/BqHXYoAHeLyEhJAbSxRwIB152Znja06YSr4vId5DTrq2k3XT+HKHxr
         LUTQ==
X-Forwarded-Encrypted: i=1; AFNElJ9o/jGgC8MQB2YW6i2A1OljwRTSMB2IddG/SJwH3nQGtkqdfK06ehBDwrek5Mc72Cno2oRqee5451iu@vger.kernel.org
X-Gm-Message-State: AOJu0YyaQg0cAnaDah37L4JJGKfdG8Da8UQENBcARIk4YqHhgVuPuti8
	7k8uafNMXfdIU0SentAyxqM8/9SsuDUnAE5QGBWJXuKrhwvhorFdjjfDKtsTYrNB62buq+edE+r
	64KyuehPxeB6zC24aGy+eB0f7lT625HGiXOEhxyR2Xtzudjjtwju6nEqAWzpZIXwl
X-Gm-Gg: AeBDietXEk2bcDD+ScwwwgRD+MnFeMuEEj427idD7SVjbakyi3JQoeUxk58Uply5wfI
	X/LDZbU/r01LzcpKyysWRMeielU5lr7Mm1txhvNYei2kc5TEBL+gg3NtYT26KAUuSj8VV9rWebU
	N1u7vlj3lqCL7w9uDyC5vq/i9wuMB/Pjx2t7tyE5r8qNmGDz1NB2bls9FxhXLtM2G8kJu2Wg2p4
	kDksUOSZKUaeY3QKiIUMlGpHuu2UbYXJm9t8eyZ237m9+PrxKY3e5YN5gWOhA/IQfCEy7OCPXCu
	D34Yn/EAJOBBcSIlBvnFKsfZoTDx98WblyJaK94m8F17LTfWxFQOTA7KsZfsYGV1yJeN26fG6+Y
	g0iHb5Mxgsewv2g4rgV3fIcHMiART/OPuQNHT7QIdcVfGYHjulyloTlQKickyrg8E2DAGT98pFE
	5KQ/n6A9Hvq65ucBtT
X-Received: by 2002:a05:7300:fd09:b0:2da:d4b4:c85a with SMTP id 5a478bee46e88-2e464dad10cmr7601571eec.11.1776744173713;
        Mon, 20 Apr 2026 21:02:53 -0700 (PDT)
X-Received: by 2002:a05:7300:fd09:b0:2da:d4b4:c85a with SMTP id 5a478bee46e88-2e464dad10cmr7601545eec.11.1776744173100;
        Mon, 20 Apr 2026 21:02:53 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2e53a4a7ff1sm17386359eec.9.2026.04.20.21.02.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 21:02:52 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH 0/2] Add SoC ID for Nord SA8797P
Date: Tue, 21 Apr 2026 12:02:29 +0800
Message-ID: <20260421040231.1256998-1-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: vDHuOg9LOJgp51IX5E8Zsnyxj9b_8dRC
X-Proofpoint-ORIG-GUID: vDHuOg9LOJgp51IX5E8Zsnyxj9b_8dRC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIxMDAzNiBTYWx0ZWRfX5sMd2RjinReU
 qidwnHKowf5Hv58GH1q7Eu18dGP4A/ObLrrwSmsAj4XhMUK2cg8Lyg1ATrzCKo78ZKO+gSw7n+6
 omKJlaztUKCeIGNbSkyutEdjvCn0wFsnsHaNLS/POGDYFLNmzViMOlu2K2e/75Bf1Ua7sLqNAM9
 zweR0N7R0x3ogaBcEGzu3ha8rEBmkpBa6ftsPyWi5fyvPZbHlWbzpug/0ua44hHewPVStMkhBpc
 1LAb9mFYppsGmUQk24WXHSBgbjxhz+CKbUBXRuaTwcY9HtmQQv5Hw5mUG8I4qD0ikW9wQQeIL1q
 EzvntJHxdMzwUAUiltThAhmjX1j/GOLTkWpbxt1PABpQu4HDPAIXGMY2vvQHPUhoxNLLe35ChNd
 ANO6pBTeKeFj+8nDcXrfo4VC4czBbuPkoH8Fm4Ld7z8WgtdIz+5hthY5etDHFAkQZHJCnPB4OaZ
 qvCTlBMxSXArjaXkvHQ==
X-Authority-Analysis: v=2.4 cv=WuUb99fv c=1 sm=1 tr=0 ts=69e6f6ee cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=lRKjNYthlYtEnXt_nToA:9
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-21_01,2026-04-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 spamscore=0 phishscore=0
 priorityscore=1501 suspectscore=0 clxscore=1015 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604210036

Nord is a SoC family from Qualcomm designed as the next generation of
Lemans series.  SA8797P is the automotive variant of Nord, where the
platform resources such as clocks, regulators, interconnects, etc. are
managed by firmware through SCMI.

This series adds Nord SA8797P SoC ID to dt-bindngs header and socinfo
driver.

The SoC ID of Nord IoT variant will be added separately later.

Deepti Jaggi (2):
  dt-bindings: arm: qcom,ids: Add SoC ID for Nord SA8797P
  soc: qcom: socinfo: Add SoC ID for Nord SA8797P

 drivers/soc/qcom/socinfo.c         | 1 +
 include/dt-bindings/arm/qcom,ids.h | 1 +
 2 files changed, 2 insertions(+)

-- 
2.43.0

