Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04D9043E9DF
	for <devicetree@vger.kernel.org>; Tue, 28 Apr 2026 14:23:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777386211; cv=none; b=lHmPUgV6XnCztN6vMNzX2eelIrJKQ50JfrL3n0ycDrDLjuUkLJmQZ3/AkyJImshDzrzYuouKJGjqKZQD9b1mjKhG/g2cMjkBZEH9ukXEceqUzKVuotzAxZMXHqgblEihMnDaqEWaKMvTUt45BRKetOXhq0Am+mcRIzl7SYd8lrc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777386211; c=relaxed/simple;
	bh=iY/VfJm1uaSOqwTnG+ysQb3Ah4zUvNYZa5ApjLpBAeo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hEqbS+RDglsd1rR/Ou/+OfVq1jeRJRXyM7S1bADOawboOD8QDbIKpp3KX/YABIqLNVWfsEuWmNWpwQVQllVcCpACUi0Bnlrn2xZ7DZabbsMgblZbSCygSW1UwGWg2sjhaEh5G6gPsaSeKx9Qu+FGqNzrR831QxC7w4gnS+TpyZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pBY9ODjK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RBAMh3nr; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pBY9ODjK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RBAMh3nr"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63SE0FsB3968052
	for <devicetree@vger.kernel.org>; Tue, 28 Apr 2026 14:23:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	S6j1qnAdZyoQGgOKRaS8VSM6ZBf82wgE0IlMn6k4pLM=; b=pBY9ODjKd57VJ7fQ
	8wU/+JYQXlY52h6b7nn6uMPFeERqAXOixtsF5OYvZ74ld3CJoOYU2kPGd7y7VQ+M
	jJNjX9Trr3O9rvHejYSwkFdrhuAIVUTI3/HKqJE6irsxU/2muTFYon2sJLuQufuB
	xzXXwihPXe4EqPnW/R940HTBX97jdm8/0Gz0up51kSOncR3Lk1BOOq/iR5mY0/PG
	4GWrSof4ZxgaFXS0UGC3ZBKpMKz0NW+ARMW51icCCqtzdqdPJzB1Wn9iRtqzh9mU
	8Flb8meUeZH6O2LQWgvl5uJJ0OXiPrjj4tNzmwJHJlT5Rx8CVCsXv7c8/vTQD3LK
	p+pGsA==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dtry0hgrj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 28 Apr 2026 14:23:25 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-56d849e9277so20834148e0c.1
        for <devicetree@vger.kernel.org>; Tue, 28 Apr 2026 07:23:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777386205; x=1777991005; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=S6j1qnAdZyoQGgOKRaS8VSM6ZBf82wgE0IlMn6k4pLM=;
        b=RBAMh3nrSai8dP3NQGVkoo04mZ+mDslcKH3eOkfwqzA8RPTMDQMagmrZRDjvhVpTGN
         GNA+rm1h5X/f8K9opiTJL5WgtaqejGW+/3143OsmAUk5s6F0GsP2N5QcaLSobQgTD05o
         JOW49CauDMCgSli8trsnXu5GIyEUunFWWpzFWIqB3Uz6pISDFigohzX6nTDlaJvTGkrS
         A6BGT5S3AyX4OeuofqsifhmXd/cqru2PNqovo9m42G1OkkFOkKD4irTURcDzs6u1wX54
         kFXsjiD+/McG1+4hGf/7AdCHN1Hz4+F+jF28Le6qPMEgfVBgBWaxZ7u67d40GbPjgfmv
         eEeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777386205; x=1777991005;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=S6j1qnAdZyoQGgOKRaS8VSM6ZBf82wgE0IlMn6k4pLM=;
        b=CNGBX4ZAfysVoteC2waWVRJ6XE5CdV6uyC18Osg6eCNKxn3pkz0Et3Nc/xvNZXMvUW
         zjWPxSQ2ixGgk9gMySYCmoa51Ue65uAFcnAUeqvRE/Tx7AqsreuOeZedCAZBpvDZmr8Q
         5bt7wzYeqxyVAz1Z2tfUQRmKqP0blmniSvtw54PiR2H78g48sqSEp51x5uomDpSQwMD0
         Ou1H4QGxSbBmBm6TPwA/W4LFdOrGwov61Gk1UngSuZPNVfd9mxoaYHbpD3FIablYPjQm
         2QgGgGiLTgntzly3F+olisV+uO+bZ0gN1ot0Yq3kndYqEXzGKReYjAtyMy7fl/nbaF1Q
         UrNQ==
X-Forwarded-Encrypted: i=1; AFNElJ9yE002D6SLlRH01g6qWbNay750KhzxcI0ZSBtGvttG+fLgAp1ANfmbkyNCK1/41smdmXeyHPFdEwCa@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7H+Hyv9UGui98szJWnamCLUN0zzsMJC26iawclJ7OqaBSTLi2
	/Sx4MvDuOl1TnWC//Lp/NGto3Y/re5Fyz/pCrJtR6vDxqGndQgElN/u5nFzBCGcalc5QQXupoFH
	UWslBdxkM8ArMg2KYlSO42UTWqJwfxfLfN/RAIi9BxI/PLR0QhmvQFm64Z9gPuLBs
X-Gm-Gg: AeBDievKYWsZGN0FSL+aX5pbQ4d46BKiP+t6RiI9+RO5pVhFf4NniWFYmUwFeRVL+gg
	Qvf91/7K1ShbZeo6aom7KadSJIVvkQ2WBTM8zgONQVzN4iD2c4maqN4S3PJguxRtp2E3mgo92UL
	NixmlzDKmKfEHEmhlz8pSgEgrdBLh+k5mfbvbqBwddBdqF+3aQpneOADm20FFZo26bPyr2EHG/Z
	7C6xVBp7YwQ1Kk8DGE6Co3Uq43OjFnwrkt+urmm/D7CD9zIz31pGiy35MkN9dAHdoNKW0WKrwSg
	xrjxjTQpcixdHyueygViXkr9Oowa4u0UWpBizcvcXR6+5lpwQavPmoftXB5a8H4iJsf3H/EZAdH
	dN7AKfnEo5rJ+yAmlH4BLOO2ibLGHEf7NmaHXHbUWtdL6wUceN9slyHJPLjVAOHUCxyg/HugJTT
	OlnQIgezfLF9ywB5jH7q3y4JANNsw=
X-Received: by 2002:a05:6122:1d4c:b0:56f:8f5:b135 with SMTP id 71dfb90a1353d-573a56fd202mr1557359e0c.14.1777386204956;
        Tue, 28 Apr 2026 07:23:24 -0700 (PDT)
X-Received: by 2002:a05:6122:1d4c:b0:56f:8f5:b135 with SMTP id 71dfb90a1353d-573a56fd202mr1557313e0c.14.1777386204513;
        Tue, 28 Apr 2026 07:23:24 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:653f:4d28:6a78:a6ca])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bb80ba9b8c8sm107072666b.48.2026.04.28.07.23.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 07:23:23 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Tue, 28 Apr 2026 16:23:10 +0200
Subject: [PATCH 5/9] arm64: dts: qcom: arduino-imola: Get WiFi MAC from
 NVMEM
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260428-block-as-nvmem-v1-5-6ad23e75190a@oss.qualcomm.com>
References: <20260428-block-as-nvmem-v1-0-6ad23e75190a@oss.qualcomm.com>
In-Reply-To: <20260428-block-as-nvmem-v1-0-6ad23e75190a@oss.qualcomm.com>
To: Ulf Hansson <ulfh@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Jens Axboe <axboe@kernel.dk>,
        Johannes Berg <johannes@sipsolutions.net>,
        Jeff Johnson <jjohnson@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Balakrishna Godavarthi <quic_bgodavar@quicinc.com>,
        Rocky Liao <quic_rjliao@quicinc.com>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>
Cc: linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-block@vger.kernel.org, linux-wireless@vger.kernel.org,
        ath10k@lists.infradead.org, linux-bluetooth@vger.kernel.org,
        netdev@vger.kernel.org, daniel@makrotopia.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Authority-Analysis: v=2.4 cv=KuJ9H2WN c=1 sm=1 tr=0 ts=69f0c2dd cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=w5cLSrw8bnM9wMX07V0A:9 a=QEXdDO2ut3YA:10 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-GUID: MzcLVnkOFVRDc_owJkZlU5ZaD53NOqx4
X-Proofpoint-ORIG-GUID: MzcLVnkOFVRDc_owJkZlU5ZaD53NOqx4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI4MDEzNiBTYWx0ZWRfX8Gxh1I8LID7d
 tOeoFhevzhNWYCWmrLNxK2jjvVIJWtMUrDdUv3nFgIRs/KX6jHSoDWNRtPnMySX3STNUmig/bvV
 QAf8VG0k5kHRHbD5BAutWvI7AlfdsMMYlf/8rgsM64KAtUep6VYqu5fcmJTfpXLKkYKRcX8GwfZ
 NZ65wGRhITtuASE4yFRbX+BY8KnhdroHybyTDeT79nR6wkycdcEkE07E+eHplHjQCY3s3+7qaYZ
 /ocVnmGBl5RPkCXzPKFKqNWWVBBeMIFLWBqro9olyVo869ExBXfLaKeieFDMOgVmQ3hZ6So5YmF
 p802negewWiVGk8Lv07mJWfNCAqVozcJXso/FovYXe4rPwZmFmouA8Nce6XQv8Xm2mLzU/7IWsE
 bVReBaK2JTYVq1cvKpFOg88UNB7yOKFEVXjDqHmVjqhMvGnWKn8n+PGBJwe8buMgORNkG9gVHBC
 3vnkXL3Rm7f4Mu5rjQg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_04,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 phishscore=0 bulkscore=0 malwarescore=0 impostorscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604280136

On Arduino Uno-Q, the WiFi MAC address is stored in the eMMC
boot1 partition. Point to the appropriate NVMEM cell to
retrieve it.

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts b/arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts
index dc85cf94f71cac8666cab30ccf37cc2d2f8fd941..35a30cd6f47d6d2e018f6841a05fe929fec15738 100644
--- a/arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts
+++ b/arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts
@@ -581,6 +581,9 @@ &wifi {
 	qcom,ath10k-calibration-variant = "ArduinoImola";
 	firmware-name = "qcm2290";
 
+	nvmem-cells = <&wifi_mac_addr>;
+	nvmem-cell-names = "mac-address";
+
 	status = "okay";
 };
 

-- 
2.34.1

