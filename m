Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15539363C61
	for <devicetree@vger.kernel.org>; Wed, 24 Jun 2026 19:10:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782328202; cv=none; b=iLyzIMnQcnzi4urDnjn5BetF6hUFKPYnuXAhKYUJssK+iebXDsrrp8YOZ11AfAKQ9JpqT+f9yKK5f0aPMyBBV1ZYBPNLZli+xZD7n5vTeqFIKxqB+zneVKQvxPyVf+Cz0PoYADA4hWuNEhMXkLuClcRugfqUlj+4Y/8pLbU5aJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782328202; c=relaxed/simple;
	bh=SKGjni1KOiKZfXVYqG/Wt+yBdTIJXei8jtnT1CjWOEw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=roAhUljr8CWOsaz6JmdKVqJXn/1jBz+EYt+zMlLTG5ol/UrQLYG0cHwd5lBBNU4c+TjvT9OWVT7OsF7zBIVCElp6DdINCnDsJS5TwU+EO2ayHjS620j34KoSTUAPHgqifoAi76i/ih933J4YTIzkxZcRRbi4neK3E1ojP/fFbpA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jjBZ2otq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=T00HVRwS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jjBZ2otq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="T00HVRwS"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65OHixT03580283
	for <devicetree@vger.kernel.org>; Wed, 24 Jun 2026 19:10:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Emdn15EHeJD
	m/lHbAteq3SywOd6bYN5Ikcxq0cltRzw=; b=jjBZ2otqX/o6Sw9Zyd4YJ8ZPeBq
	A8/Qb+w59Ofd2VHlHo0F4OyflR/+kMkF1ApGpCv65JRNJna8QoIZOHZp51nVFvqo
	4pcsznyQHrODRTwD3Ys/HamdhQfdIYx3XoTt6tdiWicNkEZ6q6ysu5KxMp3BWp2J
	a9Lb3qt6GQjLxpumCO/hYfyR7c7k0X2W1dE8PLm62o56Fi/nko0c94bBCCR6FLxt
	ZFCJ2cXvY6RuSFcjU85USZUdnFncTrTS4La2lknmleS785w1SwcpgkSPtdf6Rrav
	V9E+GZ2s0eaw52Ddm+5W18TfnHNrl5Mh1FTYtzh69qkubvu8pIMvy2rZWBg==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f05aqbw4d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 24 Jun 2026 19:10:00 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-84256bee9a9so1077144b3a.1
        for <devicetree@vger.kernel.org>; Wed, 24 Jun 2026 12:10:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782328200; x=1782933000; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Emdn15EHeJDm/lHbAteq3SywOd6bYN5Ikcxq0cltRzw=;
        b=T00HVRwSp9BJZeIEalIymS3LW0RBVtyujqYJ1wjZQLt7cHujZOuGjQcQ1F5AdGcgDd
         X5FX2gqgISchQA/YocKzSAdKrcIanqbASFSVKP2/5JKiu5xpJKHB7ulURcuky4z1tZ4R
         JKpZBJ7MvR+b68o22LMvGY3iV26UCYM+xA8Wmwb7Qe1urVnbexWb33J1l8AQ56vI29jX
         Bn3idWCE5sXP1LQQd9kkzK3LH4ezw9lcHnAfG8WwWMev2OX77DX4/hrFtQK0NImw5eTh
         5CF2p2nwBIcV6a/3mhZ8ho0SrUL6Q2+7YBgQbVtfvThLV+SYCKe7JlHuNtiXph84i47/
         kVwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782328200; x=1782933000;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Emdn15EHeJDm/lHbAteq3SywOd6bYN5Ikcxq0cltRzw=;
        b=jOHejFWPUh2YR/D8CFk7jmtPRabxNRYIpBSYjIM+Pj3ZSF/T0tPZF96JbpcFHi0ew/
         em9o39qVO9snV2Hyt65bfLOzwTOm9yzvdp9p2kufwmo8tD16RSt0hO+FRoYWIh9JkiWs
         J8eX7w7JanvQDL8PZKkeGJyw9Q8WqjtReqiAbbIo3ZJxQGbYo/3SEClB1kjRvh/hmYW1
         XCdPoiilVKT3IMyFZwfICvHZP9/FxDfZ/4dZwpDT/XIC9ho2OZqw68+zROjZ+nfMUYhJ
         nZPxoC3P2DZ9Blo8iq05++iSFIyf/XlepZYzGY+EuzBFKr2+H0JzLUL7uCy1nf6x3IGv
         6YFA==
X-Forwarded-Encrypted: i=1; AHgh+RoU3JsWj4k3nDNDHiNo4s9nBE0sw7Dn5QzuejLsLioZe6gddn5H//S/cO4ZsL7sfuWtd52kxuYvP2nr@vger.kernel.org
X-Gm-Message-State: AOJu0YykL8vUI/XZtDiIhXk2iEN2Q48k3EYtLKRRQCRBOkyAfO7S6IkK
	12JnIyndBpqcrXgQ2p8tPSLfm+1VdWoXvZT9NBQqbQazNDhASaeRFNcvr5XKu3r6HU1XFgu/I2F
	WxJunwikxe8CA7DtSoDaKK/f+X20QJfy3bAgGXNF7KW9mAqh7IL9JpSs/5ClfPuT1
X-Gm-Gg: AfdE7cmmKIDRqVLcvi+WlYVjqeoQRgv2gAkUq2gK+ncaPGmkFdQ4vDb1xDFGVwGeczR
	s/WgvFfdJDydaPxl382vMkZBNK9egUbqlUf4Hj4RnG8Qiy3LTa8g3c9kH+TCBL63vempEvKZG2u
	6YIXevb/0gCXxydpmMl0D4NtZnNtBXQbplShijNvl+YOS4qmUj7BsjEutmbZe+Ojh8SjvfsteCc
	RexE5YWlwGX1gHt8Ntx/gNooMbbcHyejBBKXR2XM3+jy+Z6VWoFN/TTL1snSvss3Cbj1pik8us9
	VNYEi47CD4AiYc/bH4zGpbR1AJMqWXRUo3lirSJ3Pif+QWC8OYTwl3uNelDwcGEZEvEnmysYjrd
	rGVQ6/5d02b8Gj+4Pak2Egf2Lkv5mgUJ1eE/RCQ==
X-Received: by 2002:a05:6a00:2d81:b0:83d:b11f:7979 with SMTP id d2e1a72fcca58-845a2793386mr6016871b3a.29.1782328199930;
        Wed, 24 Jun 2026 12:09:59 -0700 (PDT)
X-Received: by 2002:a05:6a00:2d81:b0:83d:b11f:7979 with SMTP id d2e1a72fcca58-845a2793386mr6016835b3a.29.1782328199342;
        Wed, 24 Jun 2026 12:09:59 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-845a412e5e9sm2932120b3a.54.2026.06.24.12.09.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jun 2026 12:09:59 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>
Cc: cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH v4 19/19] arm64: dts: qcom: sdm845: Add minidump SRAM config to SCM node
Date: Thu, 25 Jun 2026 00:38:30 +0530
Message-ID: <20260624190830.3131112-20-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260624190830.3131112-1-mukesh.ojha@oss.qualcomm.com>
References: <20260624190830.3131112-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI0MDE2MCBTYWx0ZWRfXzX5q9z7yurb4
 OCSOWim8+HJ4ktxdbZhe7+Ptrx9n/l/EwhsDoc1HG2mn+kEsK0CUcMX16x+szNmC16makJpe7PK
 VhmXPHQ7IF8bMGwvn8wJwm77S68e5ao=
X-Proofpoint-GUID: rnwdK9F4_1ggQurVZZRWyo5QMa0677dm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI0MDE2MCBTYWx0ZWRfX0KduLVV8QKYw
 rwhWYOo+HswYFIa42SsE9IKADRmULILLQxRW9PqF7dhfOIN+WOTvXXinPAyV45ItF4l9WQrj1yp
 x4TdsrllYvFYgalnluNjM10o79OpSoJi0o3Iob6+3OlNXthtR1ACk0mSOuKO0v5U2wJc8nzK0Nx
 HQ7I/tsyhgPbDk0fvTc5NRcc+Ew2IVz3a/g7vDpE6ZTp1lN1fYl5B6nQ/EtIKm+3YRoPn/yYwGe
 wJ4eamZMw4Tf5eY/tEsOIyMnrFlRUKCydbKyAHv3kv/4oNZ95xTc/oKbz8Az8zYTFHgqsk5c6B+
 9mizMiiTbIAn4+Hqcjp00MhBcWwjbRazVoImrlfXwt5HQNvIvEAWelISVgMcv0+67GyJ9uFhX31
 U6Qa/A/p64/oXCbwbmM21MzrYXXBYw==
X-Authority-Analysis: v=2.4 cv=UphT8ewB c=1 sm=1 tr=0 ts=6a3c2b88 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=0qvS_bSzHNCwZkaZnqgA:9 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-ORIG-GUID: rnwdK9F4_1ggQurVZZRWyo5QMa0677dm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-24_03,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 phishscore=0 spamscore=0 suspectscore=0
 malwarescore=0 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606240160

Point the SCM node at the minidump config slot in the always-on SRAM.
Boot firmware reads this word before DDR is initialised on a warm reset
to decide where to deliver the minidump.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sdm845.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
index 4ae8627d6dbc..2179988dbaaf 100644
--- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
@@ -363,6 +363,7 @@ cluster_sleep_0: cluster-sleep-0 {
 	firmware {
 		scm {
 			compatible = "qcom,scm-sdm845", "qcom,scm";
+			sram = <&minidump_config>;
 		};
 	};
 
@@ -5192,6 +5193,10 @@ sram@14680000 {
 
 			ranges = <0 0 0x14680000 0x40000>;
 
+			minidump_config: minidump-sram@1c {
+				reg = <0x1c 0x4>;
+			};
+
 			ipa_modem_tables: modem-tables@3d000 {
 				reg = <0x3d000 0x2000>;
 			};
-- 
2.53.0

