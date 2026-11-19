Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795072252;
	b=DHzbcvdN3FtN2/TTzFRU7xPCMuYVsQhJC6NskAyEpFNUU7wfUQ276dtmRcqdPBlUPHtm
	 0d1AqM7Qm3B8XC5OpCQRNISaatA7Q4JKG4GQOnSemomAqfCABUiYWZMRjzkFW4zB9RpHE
	 CToc/F3TSH+MU6NK+HR1UHpGDeyyuhD+InNxRAReMoOYhrauqxqSlOqfJFN9g6GYBw6Oh
	 eMMYow1rgRqWfQTzBFU5xcNYfuQwm6IdlcjAMmMeUZxat9vZMFokqUOR3bvBUhrBkSGUp
	 O3PregkjjQK7iqq6DQ7/gxYbprzYSMTUB3tu9rwfhXHNFeeN0WmOh61QbwqRBh1ctzg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795072252;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=xWWYM5hufS1mOg/9f/oIBWOsERbRGwhQB+M3hkQU4XE=;
	b=IjSZP4wMjxtZ+YYNTHyRY5f51wqn0MwzGKXTJRyZwCBcwO/ro5Hvtt/g9r2GYYJ3M7Ne
	 bRXz6X+xs2yyLTv9A6dklPvCBP0mtNaWkGKeGr3dlTXtsIXadF9H2FesyT6hEy6dientC
	 3NvgQH41Ij7sJTvRzREATkvB6Ln0CtqyrNmYmYOOXV8N+2VDygCooJ987Kc/kQKPk561F
	 B61Quw+YnJ+mzk5At/aehmNgJEzgy9E9jYZmPl+sOwi0DrR5f6dh4Tj2n6WNuohdETrYG
	 caN3RpePtXwykGwNbW1peIQFVLCGTvomJgvgD3LEpAn5fWfNBTrZSsD1QeKIzzVXpcw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="dfspp45/";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JzsZx5qq;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 065D960A260C
	for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 07:10:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 065D960A260C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dfspp45/;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JzsZx5qq
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AJ6wJXT1535009
	for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 07:10:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xWWYM5hufS1mOg/9f/oIBWOsERbRGwhQB+M3hkQU4XE=; b=dfspp45//kaCSpJR
	huucG6KlrK11LS3QF4C3SBGnGx5Bj7g4o/rkNEzVlhCEibADDql83Mv6a8c8jo4h
	0H/PyAJD4HgdZ09ktS3oURtMeU6ecVZe3mkwvIAwfqFlM+b+4Ol4MKl0dMl33cUe
	QwBXFhjpUx0GuUJT48qe5pne1P6zb5vF9L40eZINaXpon3zqErfPFpKBKq23hiFp
	gxhzbEy6G296xrEtMr/mVNxGIAySbTiT0Xbefyh2zkE7DIXUnC8wWDh/R5fCJ3yI
	rMBa6gYuor/BrtDF5V75I5PYwpt/7w6l22ACBOtUE/3mnuGMwFP1KSx962Ihqv+V
	k7YUNw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j1dpcbttk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 07:10:51 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3b0a528ca65so1760601a91.0
        for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 23:10:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795072251; x=1795677051; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xWWYM5hufS1mOg/9f/oIBWOsERbRGwhQB+M3hkQU4XE=;
        b=JzsZx5qqlVHqzvED8zmCg/w05+5WQqbvjhUc0DijfNVurlzfAiiOYkRSuelpVSV7ix
         BAOuiOhy7+eC57OrSScrGlpSd6l0RWOdYHfKBn86OyRzWrBDPY0adOwD5j1Ma78tmdta
         +6kbXzxDQFaX+ccQkvXMX30Bta+hjpJKZNWUOqdffqTEBmzyJyG912HF0BVPXozPvpbo
         pBRG7A+PmzSYvus5ETW7KqegjiNFxh7Fz6Sm7A1M9pn+mAuzZ4Dcfhu2yjqwQYDwjOi8
         OiVY0yYCbq9EJqy5ekRciOn2wVgY6owaKAYr1iDixweKof/KNa8L6Q1dsdQS9gvzJW69
         rZNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795072251; x=1795677051;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xWWYM5hufS1mOg/9f/oIBWOsERbRGwhQB+M3hkQU4XE=;
        b=A7PTbTaDAQEMKdDTwC0HIwdH8V6jB1KOKa5lM6zEs+zowNRC3timwV1eKYtk1oH/na
         0pfQBAKxdWkpQXCtSXSDbh1cKlS+8jePlrigtmnc+DOTGXKvVlqM2kneGn+FYdl9Nid0
         92dDttLYTDeOInxmqF5VGhwSaDDATvgwf2aw/jGfPdjU4sjtvA1DC8/xfDrXJE61hPak
         7p7OMyKYf35T6MfOyEsYuN5M3RzPM8Ae0ll7R/dMX4hJufFpeyGri0k2/KafRNVUWib9
         YBj3ZUxau+6Hq+n67QSPo3B6eyk8bktkK1+7/fL11IC7dpTt6oJLFhqXV7eNq1Vh2V7Q
         NoMA==
X-Forwarded-Encrypted: i=1; AL+hErHkHKtU7LFAE8mDRB16BhbgCZnfHEhJd1QL7VNJ3ktGhH0HFwJ9H1YOa/MUFy9rpTj8airg25tcJcNK@vger.kernel.org
X-Gm-Message-State: APuU4Z/StuT+toUpQjCBNignfHa/E8S7qiEfYjO6xJ3y82KJB8WUu/D4
	VpqH9N2vXoTGhOEGyAKj0BU4yxPlO9qmw4BrtWThNe/pWiqzhWUq0rcT9XZ3qalnC+dhrCas6+K
	TAm4pY6bgR/IeW5Yn+9BXWG5gaq3uNsTV9lq5SODfHRosL7YQ2ZJXmV0UfVH0khUo
X-Gm-Gg: AZFdTZeJrHkEtQMwOaATGtu8x4wpNfJj7dNC56VqfF0WvHRHNlUjMs8d1rcIAcAHWTz
	yi/gP2X6DYdAPKZM0CdCJc5lRrrTKkvHWDxtyDQ0AD+vyesqd4ASOkV91yRtqb/OuyMPG/+JWTZ
	HkvDv6hyZIBqm4BtbwQyrGa0cc9RATu/xBOKSkBK4sfrbvmvKWDNQpwtt5S/yZU3Iwy2r+hhPGH
	yxiTZ8Uww7s0OQ5uF3PoT+s/mwzSZOp+lnor6HqDMyuDiMGyOfHloP9Fk6S1IUz7QM+f6i9nWqU
	HVVCG9O0fCTJOcoYSyg/N+z9tqul7ZtaG75anS/4lnU23kZSR8ccYa07EWKpVxApPxMlClGMF4x
	nklJB+Gki6OW7V9sxWCp2l8MnjrQ6X5jTI+u8RO80H8QzJsEBzFo6uW5v/X/pZnX6XFURnmEyAb
	gQsfhN+beuEg==
X-Received: by 2002:a17:90b:4490:b0:3a0:abc3:afb5 with SMTP id 98e67ed59e1d1-3b3d07656f3mr5176722a91.34.1795072250598;
        Wed, 18 Nov 2026 23:10:50 -0800 (PST)
X-Received: by 2002:a17:90b:4490:b0:3a0:abc3:afb5 with SMTP id 98e67ed59e1d1-3b3d07656f3mr5176704a91.34.1795072250005;
        Wed, 18 Nov 2026 23:10:50 -0800 (PST)
Received: from hu-gthawre-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b409330ae8sm746348a91.7.2026.11.18.23.10.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 23:10:49 -0800 (PST)
From: Gopikishan Thawre <gopikishan.thawre@oss.qualcomm.com>
Date: Thu, 19 Nov 2026 12:40:12 +0530
Subject: [PATCH v3 1/3] dt-bindings: arm: qcom: Add LeMans Draco EVK board
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261119-lemans-draco-final-changes-bringup-v3-1-db08f12f0cd5@oss.qualcomm.com>
References: <20261119-lemans-draco-final-changes-bringup-v3-0-db08f12f0cd5@oss.qualcomm.com>
In-Reply-To: <20261119-lemans-draco-final-changes-bringup-v3-0-db08f12f0cd5@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>
Cc: Gopikishan Thawre <gopikishan.thawre@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795072239; l=1219;
 i=gopikishan.thawre@oss.qualcomm.com; s=20261019; h=from:subject:message-id;
 bh=J11m6SiF1xvvFn7gQOySTxQ2FArKpUmIzJhDjDucqOA=;
 b=UI7Icu9B2hyFZ0Or791SCaVxL1Mj1EMf+ZP50u+Wua5lXmjjJXMrRtIzH7/1MtGxAl+OwBc3o
 JSbf3jvT6AqAOaY1bppb4hNO1dw8luWlkGYf1SkU6OWki+Epwx5N/vk
X-Developer-Key: i=gopikishan.thawre@oss.qualcomm.com; a=ed25519;
 pk=l7diN2ZWn/39T24vZixhPPrGDEUF6RKc19MsWZubM6s=
X-Authority-Analysis: v=2.4 cv=YJ0KWhGx c=1 sm=1 tr=0 ts=6afea0fb cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=jgbjWhLY81TnJwHp3GQA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE5MDAyOCBTYWx0ZWRfXyohZAOi5gxBE
 UWLlEUw4TXqxcJE8nq2QJ2YUDd2BGC4po0UHq5uSBF+CeIaqIpnNotHltZ8guCCde2bTIcFy3Gs
 WjxW/vCw8z421uRcPM0MoThIDwXhzjqanOf+Zom/e5nweWkbS/SJsr+Ll1EUZgXtK+IROxwFpic
 d+N0+DBmKEzu4SINy7Pg+eEFUJUx7l+RlGdXw4SLGVPILOMEG2i9FX1oKB+xByPoxJgfo5BwgzJ
 NLzBm/ITNSAA+z5GiuMu5pp6V7viznsbZpL5KqNHaen7cbyX3SLpPqC8ZUqreA04sQV22s219X0
 xZ3T0AuPd5iG6qNA6E1fme5IEeG4L5Vba1foKlPRL1z3hKWsER1KGmEqsMNICKtNzRRONJr3qCt
 QeInYWaQDPXARkehlkNAPdPUA9wcYGPisFgZW8BELDMfztBO/OCkTUSpCS0Rhm++O9LrqQ4S9Bd
 kTVnwApbuV7EsghrwOg==
X-Proofpoint-ORIG-GUID: tZru6Cebot-gtCqjUkvo1iBjf0xeGUGU
X-Proofpoint-GUID: tZru6Cebot-gtCqjUkvo1iBjf0xeGUGU
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE5MDAyOCBTYWx0ZWRfXwmAzVwMYSt09
 dT7LE9qlgp9qsGefJEJPoQWNf+x+67ZXVMtcf3E4+VDQYzeXRlKB/kwWMtNVclrF3V/DL+FAhnf
 NPjrafYT7byWPWzHun5lUIKoloJaON4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-19_02,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 malwarescore=0 priorityscore=1501
 lowpriorityscore=0 suspectscore=0 phishscore=0 spamscore=0 adultscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611190028

Add compatible strings for the LeMans Draco EVK, an evaluation board
based on the SA8775P/QCS9100 SoC family.

The platform uses a two-board design: the LeMans Draco SoM carrying
the SA8775P/QCS9100 SoC and core connectivity, paired with the Draco
carrier board providing application-specific peripherals.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Gopikishan Thawre <gopikishan.thawre@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 7ffa4f69987f..3d63e797cf60 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -545,6 +545,13 @@ properties:
           - const: qcom,qcs9100
           - const: qcom,sa8775p
 
+      - items:
+          - enum:
+              - qcom,lemans-draco-evk
+          - const: qcom,lemans-draco-som
+          - const: qcom,qcs9100
+          - const: qcom,sa8775p
+
       - description: Qualcomm AR2 Gen1 platform
         items:
           - enum:

-- 
2.43.0

