Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794183330;
	b=IIc30bmzPE9pcqFa4+6MvrP4VhB+JdY2/lkzQ5K/y8RXhAmgqVKV5estdkeI56XZ4aLT
	 Ym/Imnw3QgE7ETMcgG2ANrurhZDBP2jkc6j5kRv1klLQ38y/xxYD3nuwDpeK2qBENiadu
	 J7bcxs4o3BF49uVi4YwqzDs7WzE+pPlMm20/o+bfLwDQ/hHNyr2lXoya+QRolNarxNsnu
	 1P2qeVDDZx2H5fYtSXdKDcIF1G04BkBlYA+90tJjf514dd87kGF5YuwWTjiwXcSV/3Tfg
	 Mxj46iWoW2nJkrBtEW07NMXXI6DlQW+tO35wSinenvSRYw6ARFw1MAgEOXQ9PzaO4Qw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794183330;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=atcqyVfN1zAKYh6SH9e+X1cocOF3Ki1ITDoA9b75HF8=;
	b=v7FAz170McMC51XbYBKmT62vw909J2DfKYksR8tfwK9SgCAgzeRE+DAl2JZD1ge770H3
	 +h9UaLZcDWWNLgR463ex0Hg9I2B+iwM8f21Cbic9drgug+agSVdl4BmNcw9Ms69sFqK9i
	 1u3pqUzFLq2iTSvNNHQVPT4TzmT7SuNcm2/ZBW2g5yNnQLNggqX292QKPQYcw2Qmb9RjH
	 PJbFGFmoIu8FztJiGNnE5k4yIBrlrXVEUsm4Bo0L32IF/tsDq6M72DUWMfcGgwaVgtoCn
	 8DBK1R5AxlrR7UI4btJY1h6kLVDU93IUxjnWa3e2am2NlMwvxJiKLBPk0EhR43zZ41g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bjrIIsE5;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FwGI0Shx;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC8D4606A33E
	for <devicetree@vger.kernel.org>; Mon,  9 Nov 2026 00:15:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DC8D4606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bjrIIsE5;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FwGI0Shx
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A8KeFJl2113860
	for <devicetree@vger.kernel.org>; Mon, 9 Nov 2026 00:15:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	atcqyVfN1zAKYh6SH9e+X1cocOF3Ki1ITDoA9b75HF8=; b=bjrIIsE5UjStFi/9
	jKbRcGHt46Hbhao8TnWpV0EYDWG6HSasU5PNU/Y9lbkxe81roSDy6Ks+5U5Fvhhb
	e5U8c3dF+gEGi+4kzJYPMmbXX1upf1AsZ475bVN59oFMz5T+DjsAyxERqnRS2Dc+
	VgZ4aG0Y+Iqv8r4Po1DCKblEPYiOqNEnGRiL+7X1SR37FvPJYboHmKH7aCkCqauk
	VrrOqmNCAAqK8jV0+Y7VacOI45nswCQnMZKZw3tdqJDzVMfeCHy+tb7IHWbNx7/k
	UObeBZHlC+xZb/pd0R6/SvfAA8it2eCJNyRZKpPIlPPy1J+qwabp5vWB+qWa6ypz
	6b7heg==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hsuagv3t4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 09 Nov 2026 00:15:28 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-1af203073e0so523489c88.1
        for <devicetree@vger.kernel.org>; Sun, 08 Nov 2026 16:15:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794183328; x=1794788128; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=atcqyVfN1zAKYh6SH9e+X1cocOF3Ki1ITDoA9b75HF8=;
        b=FwGI0ShxRRkijK1Z36+klEQOsQzr/ymfICMUvSoet3RawoO0mBRpfrSQoOyMViNcjm
         EOlTU7rEj2miDfmUcW/VPhfmqMTNQSM7FtznoLiGRFHou87hmFCQknBo6sV2HNwuhI6Y
         KEEvwcl0UK+67N67LCbJXScZj1Jrne57V5yYHEqVqsCv69fQJDxTieMfX6KQgt6mfsM9
         U9lfu7s1UZjROm38/ioJjF/grwkSX4pVouo9ETSnVfkmk3+29zQ9WtdB+ZAVJiW3IyDq
         vTOT8L3+BEwxgVOBYeniUchZqlFZZDzitCBQmsfWSEit6k7bg+fOJHjw5xDSm1CgMZmt
         pi4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794183328; x=1794788128;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=atcqyVfN1zAKYh6SH9e+X1cocOF3Ki1ITDoA9b75HF8=;
        b=sAri7Lf9rEPjSHygNAr/iDGkI49k88/OJVvqYoeFBeK0TA8URt9AtMZ6Mm1r1esaIv
         34Ecun2u+lrvX9AF0OOlDNpbUa1AdQBycDGNTjV7Yx8x6JmNFi/R4lIVHobtMSeyBh+6
         BJ6zBg54ENeTwTBkB6hg13cHpTz/mTixnd1ImZqyxFSF+T6sUTO89CMqo5d9KrzeFIrq
         t82Pm2UWdJ1sjadPodKzGuAL8+lAVdj1gDdmO4Y+crm3rW7J+iPPAJz9wWQBrioJdzvQ
         fyB8mtuaMqoVJr4Ih7X/VMeVJMGMCJIH9r0RqKj+fMtnsEaeEwIvT7xyjrXQVIfkfj27
         HAiQ==
X-Forwarded-Encrypted: i=1; AL+hErEc2+QXVqoxizAahVwMD4XWMyynsVq2Y8jgSmFY8rPxV3cCPwehWkDs8U+3HWIku8VUCrVnrCnkfST/@vger.kernel.org
X-Gm-Message-State: APuU4Z80oBE4yZg9xT3UEbaQmEoh/2u/NTwgQGRMOwiFEkwksQbvDvQG
	0zHjlfZDYgYZwZPEPafpdDUFx1ThOKEHyeiewQoZnETQmcNNgxZQ4fNMcXJLDEZ+1hTvsf4i4UH
	aBgkOc82HB3T9Tk5PwGCUbRUkbu67DmvDUVcXi0TKUTqOv88LX7I0isbn3abZOoCy
X-Gm-Gg: AYBFou25OFwiyOmxJos8h1fDqr+yz+W5JsMSlzA75Rw9SyyHOc1bqKXygsdeAgIcB0x
	aSR3UYPZoKIzP2NXsjT8ey/uAuvKjsPyFdNe8xxW/dDdYjodMtA3FhoGNdvIxhjyZKa0t+aud89
	BnbjWqqVeRXu5WC8QNiNZWye9CP03HMT55vyhJkhL7C2L9t8M+18o23oILhhqXN3HQONeJKW4p8
	jos0GP9LUImAOpGIamVeK9ldJeLmbhSmndacNvdSwwleXEVJn6XxlawlaVpNg3ivelfctnWCtKO
	Lz5UtVyFcVr+DRKGXxMHE9dJ81lZC+TWOJeHWJbXIeQR1CtbXnbn18n/iOqJL1qTBwH4SWWY0pe
	TG5wxlVANutQeTuFED366qMrbxwdpM6QPxmho/dpKpq38yRnVV02FBqwePOJHjikieg==
X-Received: by 2002:a05:701b:21ce:b0:1b2:42e3:e5f0 with SMTP id a92af1059eb24-1b39fec1d99mr4134345c88.12.1794183327603;
        Sun, 08 Nov 2026 16:15:27 -0800 (PST)
X-Received: by 2002:a05:701b:21ce:b0:1b2:42e3:e5f0 with SMTP id a92af1059eb24-1b39fec1d99mr4134290c88.12.1794183326715;
        Sun, 08 Nov 2026 16:15:26 -0800 (PST)
Received: from [127.0.1.1] ([2600:1700:b450:a0df:c754:9665:1e1e:bbad])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3771ea85bsm9105109c88.18.2026.11.08.16.15.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 16:15:26 -0800 (PST)
From: Jason Pettit <jason.pettit@oss.qualcomm.com>
Date: Sun, 08 Nov 2026 16:15:24 -0800
Subject: [PATCH v3 1/2] dt-bindings: arm: qcom: add HP OmniBook Ultra
 14-kg0xxx
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
Message-Id: <20261108-hp-omnibook-v2-v3-1-f489fd0bdf33@oss.qualcomm.com>
References: <20261108-hp-omnibook-v2-v3-0-f489fd0bdf33@oss.qualcomm.com>
In-Reply-To: <20261108-hp-omnibook-v2-v3-0-f489fd0bdf33@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Jason Pettit <jason.pettit@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDAwMCBTYWx0ZWRfX3r8hzvhvpGXR
 8gE9+lSxsU87Z0kJ1em/ZbTIC1ulANSlm6Q0X1+4jrzyb/zCP9kJJT1IZw6DL7Oo6usMBnJREID
 RPPGjbM4l/ogO/KLrZOBtbE653pWfC9+MGvRSpxS1aLPuKA4MKKkAHyf7eUOSywGF82riGdYp5I
 zU0hRj2A5SrE7kQ05249dhONZPHt5K4KkNRcaYh639aZdR/Ea/ctO/f3hsl6CpZ/Yn9Yxte1Du0
 HXj3PFkaqaxrlp4QQF3TE5L4ZrraWJtiowILRxgWkuZYW0DM1jJ8sfeylYCbUpTdaZa02esgrDA
 iuSAtfgFt+QxeQcij3Wbd+ZCna9xSBE3/bMjkMAS9O3zXiqdnkCfctyfDBQCt3SvoVNFm6FzxNm
 dJpmoqoD/dklsuhLDaRNaB4C+xb3fge+Rv24SBkYEpGpd1mv5GxDuk7IYvc6QTQOgqhsEDb2yL/
 UTBx0nLfblZ+d3gVIpQ==
X-Proofpoint-ORIG-GUID: 6vVnGb5NZlRBoBhtmpIg3us1IUjB4rRA
X-Proofpoint-GUID: 6vVnGb5NZlRBoBhtmpIg3us1IUjB4rRA
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDAwMCBTYWx0ZWRfXwgsORwHkq9NU
 ENn1Z9eaEnzu4GYR8KiJhrP4+STALqRuFRMSzErDdG5oTGqW2Slb1HC+7wbLZzCxLLFYfYAwzZ3
 ljV8Gyf1PCCk9FUDDEzrv15kBRpMRr8=
X-Authority-Analysis: v=2.4 cv=V8LoQuni c=1 sm=1 tr=0 ts=6af110a0 cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=ryRoqLvdJD4GBdKZh0kA:9 a=QEXdDO2ut3YA:10 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-08_07,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 malwarescore=0 bulkscore=0 impostorscore=0
 phishscore=0 adultscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611090000

Document compatible for the HP OmniBook Ultra Laptop 14-kg0xxx, a
Snapdragon X2 Elite (Glymur) laptop.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Jason Pettit <jason.pettit@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 121ca557ce1e..ff30fb4a91cb 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -89,6 +89,7 @@ properties:
               - asus,zenbook-a14-ux3407na
               - asus,zenbook-a16-ux3607oa
               - hp,elitebook-x-g2q
+              - hp,omnibook-ultra-kg0xxx
               - lenovo,yoga-slim7x-gen11
               - qcom,glymur-crd
               - qcom,glymur-qcb

-- 
2.47.3

