Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795689738;
	b=WKSZXLLIh1TQljNhZFrRg5TVC7MTFNwsEVIxTBfe2D/4UaaY4PaoNC/tCPoDiZtZVNWq
	 P/PMxwJKzNNuA0bCvZXA6J/oRvPuRJtqvC/FaZqMeLpznRPX4sTdiPKP3F2uCoeM3uG18
	 RSq6gvXVHja1TeYNpFa1JNl2h2fbwqn5iCGnIGhj4zvp9B9MSspTcc9meyOyWKg/hLsLW
	 ZVBfRqvi3rFLiY8ccSqGd/ByJ3YI0Umct3Z0fn/0iRCwCdrbWz8DWCWN3TvEe+gjaHOL9
	 dYODVKEfdpzbpe1nbF/ZaeEK8f1uZmg9B9UkUMY1hsYskRFIRspFx1FJJo81Yqfhq5Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795689738;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=rK88ANQnkQ8rdkZwBarjCwNhsJJa/5niquMyC5QOxa4=;
	b=18xxTZQFBmOQTBhZENq3Do++5My8vs1wqo93FElfgIEK0/1J2RaDzXyVvaKtoHH8ByK4
	 xktFiNFwJtbav5Eg+C5YUjhU3IYSdIbQ1iloboRSBfZegv1IqiNrIAT2smBT7LdEG6O6p
	 TqmrHh3+z7RZCCDYA6y0PGNQyZjrRKr7D0Y7h4rnWwXgc6Lo5EXbNhM0Zn2I49k4XhT3C
	 bx5dMRR2OoQbZ7qLc9I8UqWOK2q/EcxMMUUroWTY2sBcn/vqe5U31mgKuOzki1S/5/PLo
	 5t3kJlmLIqxleMTtQuDuC8IiAxw2medsWUVlvN0GFc0fZV+V4KZiq8v3dAmVRq2MtwQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=p7feRKvB;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BaSOd5Fb;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BF0F606A330
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 10:42:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3BF0F606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=p7feRKvB;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BaSOd5Fb
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQAXLIM1369988
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 10:42:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=rK88ANQnkQ8
	rdkZwBarjCwNhsJJa/5niquMyC5QOxa4=; b=p7feRKvBULmbWWS9MQfITOY6d7f
	cDVD9DqDNyULB/L9w3ks2SNFR3nk+bnQQYOxrVzpO7FCg5ALpFpwMMMqJz152L5y
	ek5R2H/nkv+o0YPlBpMVeF7qoUd6ZUc0UUuuflzz0RGp80YNZKmgdPERzeSMiyq0
	+wIxDJsk9DGwD4Gk9HhRZHOpfkN3FqVa5/e3s5/6dvL0pPqbArZfJNjph18frC9B
	hJl9UwYhqbMp9FLJr3L2NvJCthDzmwv9UC38oiADkbA5IG7xtsPbKuB7mTPrYfhn
	5CAIbivibOb4y1p8bH8+9k17kn78mlvo/Qmfp0ltYeBGoBjl/z6SaSf4BXg==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j662y2psf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 10:42:16 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-375bac6bd21so6993013eec.0
        for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 02:42:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795689736; x=1796294536; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rK88ANQnkQ8rdkZwBarjCwNhsJJa/5niquMyC5QOxa4=;
        b=BaSOd5Fbw1JUgao7ky99iHh6j6oCzwk6pMDkVJz4RRStwGuJKDFnKdEC5WzFhO5jts
         Xb9iaunt7slkqllCC6rx5XcxsxGWfrUFLA57VgM8aO2ZWOfhEOSfSBIlEwmd3YCMSS21
         utOGdbk+ep3ZoS9PL8XA/+L3fXgF0CaXYfRghhjqJ+WH2rRiUM8lfNawNxQa4TUKdPmA
         YmEXApx6CH1DdNc1rtdUh/TAc8+jAYH14edxrf4lB9J5tSFIxM1xSeLsNqom62TLEFpS
         HuArsOLnNCAXPMFn3HnBmMjP4xNRNIOZ7gg9BdhSvdc8zEz89flBGdUx8ASxy7fZGSzA
         4pQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795689736; x=1796294536;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rK88ANQnkQ8rdkZwBarjCwNhsJJa/5niquMyC5QOxa4=;
        b=jrU/QLHsIi3eQSgSji3dhV6EtY5pnmhxDiYKtfm1x4/ur4Wqyqf80VT8xBQDBmf05f
         xLINaUVciRDugmtu+dsJZW8Hv1WCFeuzn/Zf+8780Qwnt/5itz7m5xKhvuSkpKd2mUDZ
         gnLHr1rlB+YM0eLnJZbbnH6kB4P1MSzITs+c+l+sSMBhm8b2e9y9+zwKnYecQKjCBX82
         9+6quIkw34e8FWUpPBt56bH0IUdPqB8qmO4GChTBwIlqlqW4NleZHfmfpS1fkIFXOWSG
         rl9OJQtfNfVti0Zd9G5b2PkSMq1dH5K6wbHRcEmRzaTSFeVJ1DFfx8K+Scka7LAm8yGK
         pR3A==
X-Forwarded-Encrypted: i=1; AL+hErERUCpHM2lc4QlIbpD3MYE1CQ5rXqOy7nlEXjH4Lhx4NyYmrmck4u7bp5J/eUZ5iO1+4L0Lr7yktNCs@vger.kernel.org
X-Gm-Message-State: APuU4Z8/PxoMpueL+TZcEtDiHQ8ina7RinbtHoMiy3L4qhONMfuuG3of
	41v0AQZjrSspb2UE33QH9dp6pawFNOPlNt/q5wMqFObFKQK+LXr3c8Ej5TiVfnXpCpBCv8bV4TP
	F3RO1vTVscjlyNbZQ++Q9anVz8/Zznv2g8e/Q9wrLrG/kRdIF6Dn2r0xHdFR2E233
X-Gm-Gg: AZFdTZcpGvVv2fR7nqpwMPE18WdQ0v22cea10Hpy+U1CR7Y1UcE6/KlGrGplmpW1p2u
	LvQj+DzSzs+fLMvl4N9pCgGYkXNMokmGQwFd6zwBhgNISM0BiY3cByFthlCeLxbf+Q/2lccpJGf
	WkUd1BD8vncINKW6uQp6z10j4cLQvDbiLQleIkjFWG8scxzVKHlnZCraPAOJACq5OYwQZ6EkDn7
	wyRBBFTNNg4hGoVRK9e111r+SStYqt7eAZ3i7RQ/bbPPh98KQbv6X2XmTSbH3AqWkbZVvmrJdC3
	yNkkucagGTS4P7DU5dhiBj/x9nOFbX/LQKghmS+Ieqj96FOo7AgdYHNuijn1zP3rORmKQtLNqgw
	5RVQFIITr7zGM/r4o/CS60DhuPAuzT+iLLPeoM1gTtsKlLSeIlXmYKMQDwfVrHKcP3wYHvS4mPC
	/h0Q==
X-Received: by 2002:a05:7301:5098:b0:381:5fe2:a079 with SMTP id 5a478bee46e88-3856c6b010amr21103075eec.1.1795689735700;
        Thu, 26 Nov 2026 02:42:15 -0800 (PST)
X-Received: by 2002:a05:7301:5098:b0:381:5fe2:a079 with SMTP id 5a478bee46e88-3856c6b010amr21103057eec.1.1795689735187;
        Thu, 26 Nov 2026 02:42:15 -0800 (PST)
Received: from hu-akakum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385c6830815sm55627947eec.20.2026.11.26.02.42.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 02:42:14 -0800 (PST)
From: Akash Kumar <akash.kumar@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH v5 2/2] arm64: dts: qcom: shikra-iqs-evk: Add CC orientation-gpios for usb1 port
Date: Thu, 26 Nov 2026 16:12:01 +0530
Message-ID: <20261126104201.1613183-3-akash.kumar@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261126104201.1613183-1-akash.kumar@oss.qualcomm.com>
References: <20261126104201.1613183-1-akash.kumar@oss.qualcomm.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDA0MCBTYWx0ZWRfX7rZPwEodTQ1y
 ehdkuqTd09JGmOJoYRsRJOrLS0uex8bQYxP1Sqz92gA02tKXY2ciflb4iVT6guo8cQsFs8TaqIX
 tioyLw98Pp0MFNQDLaJrPRrTfPBg3ea/Kbmwx8erpqCSglr0qptwuSfcrx3iq4TBGn3rSGB4x6m
 P0ajOhqEypzQdrhWVcsa7QeN1baHacRuSZfwN4yCm3UycglSjwFJkBsGCQxAbzdXnWdfbDtqzFp
 +FxF8B6yLZAEDf5DJUtJ6KyF6BL4T+nLLdPgzOL16b+OzaOxgX7k0EWmp1rU+SWxoWdslyYa3+c
 ciEinwJYVccAP6VY8gCQo/ryGBt4byrE7o4bux93xGB8Bxrnc32zhVVdhm5auvqjuNq5IDtWBru
 +yxCLmTbM20LB2g9afTE1defpqNSugXp5uoX/bwbMLLSysICWv67sgt2heY/AiX7Uzz6SyzlzMg
 EWd4ZCDlIiQiyJWrruA==
X-Proofpoint-GUID: WqvuB74mvhq2zGFFrMSD145wYWTC4W6t
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDA0MCBTYWx0ZWRfXwsLrHabySaet
 Wx2OMkFT9T5x5QK2qrvHXxAzK+gWL+J/bFYgxWJkIQ7+5rwOynn9pOQWAf6HlmlB7HcluuereoY
 MEo3X6VuizkQKMvZaebKdcUrvdDe3OA=
X-Proofpoint-ORIG-GUID: WqvuB74mvhq2zGFFrMSD145wYWTC4W6t
X-Authority-Analysis: v=2.4 cv=W/KtxhWk c=1 sm=1 tr=0 ts=6b080d08 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=KsdAzPQAT_6ys4-rp0cA:9 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_02,2026-11-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 phishscore=0 malwarescore=0 adultscore=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260040

The CYPD6229 PD controller has no HPI register exposing CC polarity,
so the usb1 (usb_1/QMP-SS-connected) Type-C port on IQS has no way to
report orientation through typec_set_orientation() from UCSI status
alone. Since this is the SuperSpeed-capable port, correct orientation
reporting matters for lane polarity, so IQS wires a board-level
CC-sense line for it to TLMM GPIO90.

CQM and CQS get CC orientation from their TPMS instead, so they don't
need this property.

Add orientation-gpios to the typec@40 node, using the ucsi_ccg
CC-orientation-sensing support added by:
https://lore.kernel.org/all/20261124-ucsi-ccg-cc-orientation-v3-0-73cd114e5393@oss.qualcomm.com/

typec@40 has two connectors on IQS; the orientation-gpios list is
ordered by connector reg, so the entry for connector@0 (usb0,
HS-only) is left as <0> since that port has no sense line wired.

Signed-off-by: Akash Kumar <akash.kumar@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts b/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts
index 0e770dafa9d9..fc0bdb20c7a9 100644
--- a/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts
+++ b/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts
@@ -46,6 +46,7 @@ typec@40 {
 		pinctrl-0 = <&usb0_intr_state>;
 		pinctrl-names = "default";
 		wakeup-source;
+		orientation-gpios = <0>, <&tlmm 90 GPIO_ACTIVE_HIGH>;
 
 		#address-cells = <1>;
 		#size-cells = <0>;
-- 
2.43.0

