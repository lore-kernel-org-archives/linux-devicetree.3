Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793263104;
	b=N701Bf1vjAREIapLbtDRbdg4GRY1dxOlwj+Mk9FP9SlNSH/TOimqjjAFxPNM3rV4d9pQ
	 X1wFSWNVpzxPD1ZSg/4HTIGiaKKIVbxBzL1ny8/IoR0/tsVUrdarVF+sLE6HMC4sPNcYF
	 YdFiu1VfijomOL1+GjpYhe8Cte3TRFlTOTSLXqf2x0sgOwAJt7xVXOe6BZDcHKRColRY/
	 Pt9CaH7HQNc8wGq4j87J9lzME0yAwlkXkFgfGBSztpkBUUV2y5aQ80VhlFjISoWAro9PQ
	 Q47Qg24V3MtUBqNBvWsqcWYieo2wqTbz0E6zQH28mujW8LwrQH49BpEFdCs6Lqnu4Ug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793263104;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:X-Developer-Signature:
	 X-Developer-Key:Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=vIcadRaG/lLLs49WUSCvxD9hZUTSME/z22s+T48ubUc=;
	b=DYpmfPO0oiqUCxP0XsVuOQnnhzPz3M8Mce9y/PDdTYnYmdZsYhdpwfp+yXCN14o0MMbn
	 x1kr0jTr2kWACwr6GFrF38r5eG3SoG1seXjPdE18Lmdp2/Zasfc25mHd4QssZb0OX2gJ8
	 jgoo63NwRw/VEOocBlTJNg7Cn8QFcq8NuHnfbGXWj6VfnQ6VIbKrdasTzZmwb3rZVIV+4
	 vqIS3rldLeP7gLmd/ZSBJD7zenXe6VUvfP6vHl/kB6AjzhPd7+O/WGx5fMD4Tl1NmrzA2
	 KFIUJAFRyEukerHUG1miCm7kejHFa+0JJ73Zqid91CxOWXGzV4xXnt5RIoxOX/xbPoQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=esRjHtj1;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ITFYQ793;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DF9C606A320
	for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 08:38:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4DF9C606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=esRjHtj1;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ITFYQ793
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69T5GwL62793114
	for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 08:38:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=vIcadRaG/lLLs49WUSCvxD9hZUTSME/z22s
	+T48ubUc=; b=esRjHtj18kr6K9P158h0VnRWCOwP7sX7ffywjD0FnNUYZsGiw6a
	JUFnAC3i6RY+motCvxOzAinUsAQSSzvwikLnBt7cRxaCvEp1+je5bYBm0rcYKjPQ
	GIZqayddhDCoF9Ie/tc29XJjca+UGj307P3t5Bd7LkZoZFDS6BXZPlWCjazP28Ou
	3A48tk9Ww/7BHfXUNUsOBqc9ApUXBaYq5IKpXAZNH2T2bcafVO+YwMGtUnROquu+
	wvV+jMRA7N+n7xaFqo6qRfhrvjmnROvtc8+E4MzDA9iCkI/8zwPqBtw3Zdeh1PC1
	xvZtz3dV4aCPyB992m5VmwJNYVPpVdrscVg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hks3na446-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 08:38:22 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-53664602c7fso42856611cf.1
        for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 01:38:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793263101; x=1793867901; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=vIcadRaG/lLLs49WUSCvxD9hZUTSME/z22s+T48ubUc=;
        b=ITFYQ793s+0dz3nJk5+df4Gi90zTfxDmacAVTjkCjyYFlqfNDd+eLSpH8+uLkJr5O5
         ih94xHFNAgeanh0JKMAvwaaBE/SHWKTibQiPIuPX58joe/S87gmyMegOA6400UQHgl/1
         VPFM9s/gOmIIxOgZrCl0eCpn9hPYh8Zuhrc7U4sAEa7XlSS3gYwjeIOYOG1SjSKeaIS9
         /f5AHftLs4cbq6MgYmaiGJ/1klc68ParxxnVx1+vJAVGAhSGS2+9wjdJHO0rTvYbKAlU
         5DFl4fqyU6W+IneOYDlvlqhmKyRdjf3ikZbCJq4sKPYlHUcECsuf4H7fkSOG5pvm2iNL
         2VvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793263101; x=1793867901;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vIcadRaG/lLLs49WUSCvxD9hZUTSME/z22s+T48ubUc=;
        b=q/f9Vcbe1+yL55nQ0fbPHsYe3UB9cr9E+l87MzRRGEcCC7yNAVum5FNu+U/+G1Q5FE
         UBPNHajfnzLxG90RRXVDqK7Y/Lpzpg8Of90g++vuCfxsDj98PQCWWqz1b3r8K0FpIqWR
         XvdmHU78Hi+GjVR8KPNiV/WHOI63LBee/IvQx5xeJONWkM2tGw8x2uuBV0KHUzLg1I94
         KEGsHsinc0KHfz04l/tUfFyw2BOpFJs2MwrSDkqXM9nPguacHvWDKO1VrUv0ibzLMV6d
         uA0b4e5osa2EqZ1wstXDRmOtH0Z9zY0bDz3i0T+SxvyOvP+4SS8Z2SPy3e7F1SAS5/NL
         ScPg==
X-Forwarded-Encrypted: i=1; AKwUvBzv4cLPqKc8mVS8zuYAkP+auloGL4kd+3IRiUTW9xmeAJEdYRD62sdcND8hP/tZxqiBEGbf4FiQhynm@vger.kernel.org
X-Gm-Message-State: AFq9FYI4PB+A1j+ng+mNkxAxP7SNRh5PX05HShaGJRKcNeq2kln3NZnl
	zLgZzZM81wFsACSfbbG1yl7rebTi7AVbcupZvVPgTfSlLhx9FmFzrBliUbGeQFAVQFHu4K/W+bL
	PKzlcWIyNmxXDTXARMZhOh6iCazf9rG+y4c3064FMsUfIm8/ZfmmeWh3hnM8Sy+S7
X-Gm-Gg: AYBFou3OLNONSDaUV2vArQqEoAV3NVus8xFlOzvmGfMv+pkVxQu5eB7us5RHKkTqd+c
	3plZ2YnVQus6Kghe3Oplrn2NQYXG8OKjMn/eHEANr9fDS339Gop3W6i7A7WvwMIXPqrjI+eGbWd
	ACLkZ77EPAOB/bTztKw0Qn60RltdUTtV9mdL2pf7+xItbAQc6xPw+v6lQchqrigtLDWfy+KgJ86
	snYShNuijMLAOgdqaN0Y910Di5yNmRDxeoevPcD37eBzvYGJzQQjgriwUuYdZ6WOJn00SKeeNse
	I9oazqVhUwAe354Jlah0qckklZHv26FRwOaVZdV6gjwfAIrZM3KKz8ReUgR+Aq6rD2D7qENNe4m
	MN4QECQkAc8EwYfDlOJjjTJsbgzwu2v3hIEtcl8t7hCQgIVDOYxCRwbjUMtYAHQ==
X-Received: by 2002:a05:622a:13cb:b0:535:bfc:329 with SMTP id d75a77b69052e-53fcc9c1a8cmr79181491cf.61.1793263101182;
        Thu, 29 Oct 2026 01:38:21 -0700 (PDT)
X-Received: by 2002:a05:622a:13cb:b0:535:bfc:329 with SMTP id d75a77b69052e-53fcc9c1a8cmr79181181cf.61.1793263100577;
        Thu, 29 Oct 2026 01:38:20 -0700 (PDT)
Received: from quoll ([178.197.218.7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a93103e72dsm74803635e9.2.2026.10.29.01.38.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 01:38:19 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
        Griffin Kroah-Hartman <griffin@kroah.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Dan Murphy <dmurphy@ti.com>,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH] dt-bindings: leds: ti,lm36922: Correct filename to match convention
Date: Thu, 29 Oct 2026 09:38:12 +0100
Message-ID: <20261029083811.43354-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1270; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=d6Jp+0RIHBCNlV6gtgrKIkhG26wE4IX5xBW5hZVHTBM=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBq4wXzWhkJsZYHBOCylT4pXM3rS8M00JmhjiYIN
 5k690VVTXqJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCauMF8wAKCRDBN2bmhouD
 15LyD/9ltaVg1EUjpFcEb/437yVxGxymBcAUnF5XFesq4P9G1f1NTbheRv/QRPJfv7tft0Ly0fB
 0z/wBmrXN/fzJpTZBCtqQuWg+SBFZaO9LfjviIlu5zzzU8u4Oy7k0wUGWJDpBe9mjT6wNur8mTv
 xDCmOJcY3zsqTe4rYVR728SmKZBx44kwQRgUQnuAIlPA8Zd6j0o1qnSBCeLfPyJ442GQotyUo8l
 uF5ZUFGN/s5wCA8UWBHyIWW/wbGg/RoGQ6zFGOYgh8HlJOO5yNc7s32uWAJ2qKbx+S2VnW+bv2k
 mZCSjutDZg9M9srxFkkpy3mtW7LSUhtTWI46fqr4g695oX2fmNJao1YagHkLxc3743zUaiEqsWi
 Rwfxf8G98ArIu/IK4K+L5Rzp15VWLt7W54pUVY3I+Gnp4fjiofYqZ9SFo6b7ZS1LCvc+0OQXIb9
 rn1gM0RsOA+2tBwpfHKW/PU/dA2A4RLi76ur1YUWVyJuEM6Yrh8SxA65NeewyhKMLvwANuzfq5b
 prx2LzQBAxbtwS0kKYVlbnS6ishcGSBgqdRHPt2NOJmZq15H9D7+oxseZWpWcGDPib+1BPCR5FT
 4nYdM2YE0QruPkRdwAosHCrlaD8AAC+AA4fGeks6jd9UjHBudmGAkZEDEfTkcErxSb8QVkPZT79 8wo2zHzfN5e5+5w==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: P17ue6qjuEnQTDO4Fgw1W4GVSF1jcTXc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDAzMyBTYWx0ZWRfX++wLjLbaZhLV
 ViUbmX2O9lZ1vROfntKO7w0oOUoSDtAVs27NDPfP/tJLAyqNBZhaogBYHorIFoJZ6xuRjtpAZqO
 8edXnDpj7eBLOESV314FvlOjxoUEUaDzZNI11pnz4zFW4XPj+PKFrx6aCERghguBmz3nlP+BS18
 Z7B6vIT9l3ya5iVOR/4LhNPRBXDicrJBxlLyWc8YynG0kJdIHhPwLhXjSZDq2z30sOST+4oPr5x
 DT9vWx7AByf/NgNktjAeGfWlYBnFlAMv8sv3ieGAWtYYUKEX/uqbmqUsLs/9nhb/uGEbi3Eky/5
 O4UOL3s/SDpiADmNeoD6IOYUyafPjryfFg5HxA2z60W1LyUYDoJNOX3xYs1HMzCcu0Nh79BK9H1
 RK669AAh4PbOTn3rDVS3rwedMfSO3FufFwvByndqlfmOx970DtjLyi4S3J/mWFOVxCSVtB18am9
 1KZzxnd1tZVLN0Jlnxw==
X-Proofpoint-GUID: P17ue6qjuEnQTDO4Fgw1W4GVSF1jcTXc
X-Authority-Analysis: v=2.4 cv=XZEcX455 c=1 sm=1 tr=0 ts=6ae305fe cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=uyPgTw0bjBTS2cVxpiNm5w==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=gEfo2CItAAAA:8
 a=EUspDBNiAAAA:8 a=gbLkFptvmrSoAGgJOCQA:9 a=uxP6HrT_eTzRwkO_Te1X:22
 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDAzMyBTYWx0ZWRfX07L8SZ06yi6G
 x6G3LadN9fMLEzipjvRynzx+AbkV+2jbvhjbsx7iPsMObAR4dTneoQxq89ghWx3O+Zw/nb1VkfV
 wCrj5yiilnZuEvl6D70MpA+tHoqIVcU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 malwarescore=0 clxscore=1015 lowpriorityscore=0
 suspectscore=0 bulkscore=0 phishscore=0 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610290033

Convention is to name binding files by one of the compatibles, so fix
the typo in the name: '.' -> ','.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

There is no maintainers entry to update after rename.
---
 .../bindings/leds/{ti.lm36922.yaml => ti,lm36922.yaml}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename Documentation/devicetree/bindings/leds/{ti.lm36922.yaml => ti,lm36922.yaml} (97%)

diff --git a/Documentation/devicetree/bindings/leds/ti.lm36922.yaml b/Documentation/devicetree/bindings/leds/ti,lm36922.yaml
similarity index 97%
rename from Documentation/devicetree/bindings/leds/ti.lm36922.yaml
rename to Documentation/devicetree/bindings/leds/ti,lm36922.yaml
index 8ffbc6b785a3..1c267e549a44 100644
--- a/Documentation/devicetree/bindings/leds/ti.lm36922.yaml
+++ b/Documentation/devicetree/bindings/leds/ti,lm36922.yaml
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
 %YAML 1.2
 ---
-$id: http://devicetree.org/schemas/leds/ti.lm36922.yaml#
+$id: http://devicetree.org/schemas/leds/ti,lm36922.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
 title: Texas Instruments - LM3692x Highly Efficient White LED Driver
-- 
2.53.0

