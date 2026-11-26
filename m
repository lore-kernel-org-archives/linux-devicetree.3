Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795699302;
	b=ZnerHi5M43wib4uQSvTZo64Tv8azzY6//snYZCHhN0nkAAvSez8UmH6SjEe9+vbvbasJ
	 VVhqgfuFcHe0sdt5gBmBgP5+xZALY5iiOsD5/1gtglWp1fCiF/VMpX8Syv75C11yJof8G
	 PECK62ZQjftKED5RjLVA1WOD7V0XI7o1N/D8Esyto/Nb5MQDEIrcGyf66xL3VFygPcQz8
	 Iqs2OVfN3eKBLkF2bCeaZJL9MpbkkyeNh2VhuMF8x0r66TQh1EtVaWOlLBW67OQS+8ZH/
	 xF96HpCxOAO/b7j0pa+CCk7mrJAw9oRgk71up/L+8/MZWZhAGzcgYxUH1XGZVlWVJog==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795699302;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=ASi9w2G7r/NBiKc+aQ4v78OboFde+sNbqo7EtDF+qdo=;
	b=XDV9TwCvSsu8bCoe/uK3y/J36fPPwBOIve69STmusqnR5qbiK4Mfwv5vZRsSubtSJIuD
	 4O2Wf7dhDH6w8fsDYuq4nUhFd1pYFmVngEHGKdxYJxuRGfA1xajJ0saLWtsb4o0Sjx68N
	 eKkbKSe0n1L0PbVP6Dy/v5WfVs+SR3hWK6W71s575aZUZtyN+rztJWXS4B5ZckgDHJ6o8
	 1h+jweuCmsuqM/Ufx5hIIyWEUKmKsfQQdRakR9dcYaULQNwaYbtoHwP9/LRXshKIW7IWz
	 OD2hNehEojsgu7VoXa1fz/rDUEtwtpam42yGnVoNYYzl0JPWlMTsayA4lKj3nu03i5g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ACZnDq3M;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BDkdwBDC;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3457606A321
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 13:21:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C3457606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ACZnDq3M;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BDkdwBDC
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQBVSCq2785126
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 13:21:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=ASi9w2G7r/NBiKc+aQ4v78
	OboFde+sNbqo7EtDF+qdo=; b=ACZnDq3MC8yaqyoqDKebck6HUKexUs6HjmnTxy
	nuIz3EIPwCvEI1xnxfwdsmsP8t8al5JIVUNtebcXinRFlWU81yxI3Ba6YcbDNrR8
	fr/ICr5UWqrYWTbfs561SWkfU8RngPYxt3SivuzE6erFzOSLpEQkSOQVoeuIhTwC
	pOr0z6FI5g6kgW7NWO78QkySrk1JiAiOOylE2YrbK3YCe+SGyd6wxLGvgz8aENmx
	SvQ+aDLMvyss4gpk15+SUUlOfuPk7CvWq5mk+Ne9c5Zj8Dmyjo5TK65fUUQZZrsr
	e02ZZaXqlD3ommXV7ut18FIiuyX++bVk9TY4pnAaE0FWzl2A==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j66qfb2xn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 13:21:40 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2f0e3ffabe0so16259525ad.0
        for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 05:21:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795699300; x=1796304100; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ASi9w2G7r/NBiKc+aQ4v78OboFde+sNbqo7EtDF+qdo=;
        b=BDkdwBDCCfUnIaJmCGPidLo/YqPGws5tvEmmKPDoHYfyo+ej1DUAFOd5FAHEp8NrVY
         Luq7x2APCCH4V2T+sRVhOVCD3XqW5qr+I+6uWtcdaubzofqLE+CCHas8/HXvhPudu8Th
         S/HMmwb2oOdwM3qNXoXsP1ZjHj7aYUuRDzZm6cbO4yEoDQel7kdrG5wnGef4nh7tzTnD
         quDQNz2wbR8UuRQgDEeigySO9OsuAdP+XsLUjcEbdnSPuZYsxxYzkDP7COwCQyb+Ay+g
         7hH9kV2cWIio1TwluaoyAMDuSRen+NWmiQu534BEw3PdCSArmCp1v44epffpInEMOyhp
         Xm/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795699300; x=1796304100;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=ASi9w2G7r/NBiKc+aQ4v78OboFde+sNbqo7EtDF+qdo=;
        b=VGYjVhuuykq+psnKqmrgd9HWCnYa+LMg4rUl7+oD/e1uwu/MdH58Gy0r5imjIiqMJ/
         wVjSo1kqm6plg2O/aHYDDp8SCmVm6vPOt/U8k/pety/NS/G1NKVPeq8qPX4tzTBiZJqL
         xePpMiIRV5gc7amHJ2SJk9JhCC23HxjIxETquS0ErANmRUy7gNGH7gGZkay5F4caYteC
         F1BJnNBZbHQfqyPSu0sSsRGZpk+8Ipb/N7pxUDeyseC0ywVGGnGgU3ZHzPzYLjrHshR+
         ohTYTz7+KqhyUXrbdFa52xc26JoObPFig5PdohdYQqCDv29zcG8FCCUAfTUZaQpRgiRu
         lW3g==
X-Forwarded-Encrypted: i=1; AL+hErFbVqCRUdTRNcBFQBdwJnNk15GYxHvXEKJZbMpi60xDqPGjnco8JFa/ET7AMRz7qlNd8ISV30rIouXw@vger.kernel.org
X-Gm-Message-State: APuU4Z9E65bGK+dCORepaUJ39yyzuWHLQCebrcQg9/Sh2wiroY44dxtZ
	l9FQ9k67Utz2XgC5GhQK4uH0GDUqlPNVg3X8HxmBMFv7XcFnCj8Y/MtSIl7ns88wvOpy5dMgFUW
	PtgbILd3FExEaw0ex8JSmCRI7gJhxBXoSIwuhAufzb8NO4VRjj9jRl45NqwSNYPdG
X-Gm-Gg: AZFdTZePORodWr0zinSsL5HUf7Yu0BUucP7dkXB3d12ox/KNWoK8cmksJwrelK1faoJ
	ozemZk3n+PLBhbmgHFLJPL5ib/PxnkKXEY5HPMbuybdI8ExqPV4QRlSNF5Nq4s4j68dLypq/xjm
	84IJKVQULUH9aNzN8SthEjWPPSsOfShxzEUhYYVI01eUiVooQVpozM/96cYQFvQqnfWZke1VmL6
	8tk+jAtNe2RBsjI6sO/Yy19bOe88E+rHiGouv91oXcmUDIDkPAfNylcQCz4mmyCSH2kYjFa1iH1
	ek/yu64zShauLwT9fbe5q6mtkunt8gL6PXdC1+p7QmwPrj2Qb15pSpAjvISjvjAN9fGEBPfhUDY
	N7H+o/7/oU32Ix2gWoZqb3sgP7L/USETJ4MCzAocUfbh+/64a60LrPWK9KXsfyJhcChojXxfnkM
	K+fWbo
X-Received: by 2002:a17:903:1c3:b0:2f0:41c7:9a3c with SMTP id d9443c01a7336-2f041c7b2ebmr216491595ad.8.1795699299711;
        Thu, 26 Nov 2026 05:21:39 -0800 (PST)
X-Received: by 2002:a17:903:1c3:b0:2f0:41c7:9a3c with SMTP id d9443c01a7336-2f041c7b2ebmr216491145ad.8.1795699299241;
        Thu, 26 Nov 2026 05:21:39 -0800 (PST)
Received: from hu-gouravk-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f0c2091sm102542225ad.20.2026.11.26.05.21.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 05:21:38 -0800 (PST)
From: Gourav Kumar <gourav.kumar@oss.qualcomm.com>
Date: Thu, 26 Nov 2026 18:49:27 +0530
Subject: [PATCH v2] dt-bindings: media: qcom,nord-iris: Add nord video
 codec
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
Message-Id: <20261126-nord-iris-binding-v2-1-95c960de80ff@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAN4xCGsC/yXMywrCQAxG4VcpWRvojFAvryIu5pLW30UqiRWh9
 N0ddfktzlnJxSBO524lkxccszbEXUfllnQSRm2m2MchhDiwzlYZBucMrdCJ0176YzmE8ZQyte5
 hMuL9e16uf/uS71Ke3xFt2wdiyN9TdQAAAA==
X-Change-ID: 20261126-nord-iris-binding-a3e08c71f9ab
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Gourav Kumar <gourav.kumar@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795699294; l=1952;
 i=gourav.kumar@oss.qualcomm.com; s=20260921; h=from:subject:message-id;
 bh=rwX2X/KJkEINyry/GicIz/WsvjLRsBN0nV+dyEuYIMA=;
 b=rcwY/jvWWf043otwYuucp8QOsqWmrZ2NrtAO9aH7h6sP7KfVUFUlc4AA0l8teCPK21aQDs8A3
 sD+W7kjoTFZDuHCE9PzKzON6qvRzL+ulh8cLUD8J6SwuAbJ69cbDZYk
X-Developer-Key: i=gourav.kumar@oss.qualcomm.com; a=ed25519;
 pk=pp/OfJjGYucjyEYKqArAaVDesbfWZ44Dom+QtAdDZ8E=
X-Proofpoint-ORIG-GUID: M605BM6KoN_TuIQafy2PeecMRYeaBQYK
X-Proofpoint-GUID: M605BM6KoN_TuIQafy2PeecMRYeaBQYK
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDA1MiBTYWx0ZWRfX740HPWZz3pdE
 IFgdt4vhFygG6lAMM4Vfz0A160awhqog3bTMCub/2LyOI6HFTgTLeca6uaTVftVucWvh4TK6URy
 godyHRuum3uNw6C9I032I/Y6WhoJ1CY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDA1MiBTYWx0ZWRfX13MzB3LDPL7r
 WCHiUCa8+AAs9ni5J+9VL7bJiqZhoUF/0069pLG5Rr7bRH0+5cp+UhnGXxaid0oSzHsUPvLqYJy
 nDsWKlU3LDQ58TipbVVixR5aYnwk3ZpoD6M4hVnWuP2ubMACKYE6Sf4vpyne2ATVXwVOPogMkw4
 5SWYykkK6So5aMIbI/lr96B1LwMM2zri3UUok3//1etru0SikmU7Jea1T92eqpgRd+axDVoMSu6
 dN96JTTxG2YXWjZ1gle3Zm5ghFWPOIwHXeonS6lFVWb7z/7D/K2w/pQ9M41UNirw7cydJw+ORhI
 mCQ6tfrw+hUHY2xH8eS80qYc/02KdtmhCo0jcEBbo1A8j/vGYhAQxJK+kkiCYyHybp4IIYqQ+7P
 anLjJH4DpwLa86aRgIr38glE5bXiUqRMoGWRETP0DA0pT/srylV9WgKWXGl4LH1vfeMqwotKkDU
 a0XYoFkAbZAHTtr8ltQ==
X-Authority-Analysis: v=2.4 cv=Q5VHcI2a c=1 sm=1 tr=0 ts=6b083264 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=ba9tQSLWzef1rn2_u0MA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_03,2026-11-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 spamscore=0 adultscore=0 bulkscore=0
 priorityscore=1501 suspectscore=0 malwarescore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260052

From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>

The nord platform uses the same dual-core iris video codec hardware as
glymur, with matching clocks and power domains. Add a qcom,nord-iris
compatible string that falls back to qcom,glymur-iris, allowing nord to
reuse the existing glymur iris devicetree schema.

Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Co-developed-by: Gourav Kumar <gourav.kumar@oss.qualcomm.com>
Signed-off-by: Gourav Kumar <gourav.kumar@oss.qualcomm.com>
---
This is the dt-bindings patch of the v1 series, sent on its own so it can
go through the media tree. The matching DTS patches enabling iris on the
Nord Ride Embedded and Nord RRD boards are sent as a separate series.

Depends on the glymur iris binding, which provides qcom,glymur-iris.yaml:
https://lore.kernel.org/all/20261125-glymur-v12-0-5c34dfd73fc2@oss.qualcomm.com/

Changes in v2:
- Split out of the v1 series and sent on its own, so it can go through the media tree (Shawn).
- Link to v1: https://lore.kernel.org/all/20260919-nord-iris-v1-0-94428761ec06@oss.qualcomm.com/
---
 Documentation/devicetree/bindings/media/qcom,glymur-iris.yaml | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/media/qcom,glymur-iris.yaml b/Documentation/devicetree/bindings/media/qcom,glymur-iris.yaml
index 9c34829a451ba..73c2d54a5498f 100644
--- a/Documentation/devicetree/bindings/media/qcom,glymur-iris.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,glymur-iris.yaml
@@ -15,7 +15,11 @@ description:
 
 properties:
   compatible:
-    const: qcom,glymur-iris
+    oneOf:
+      - items:
+          - const: qcom,nord-iris
+          - const: qcom,glymur-iris
+      - const: qcom,glymur-iris
 
   clocks:
     maxItems: 9

---
base-commit: f1df3263878748f8995d25f3ae566c49c20ab155
change-id: 20261126-nord-iris-binding-a3e08c71f9ab

Best regards,
--  
Gourav Kumar <gourav.kumar@oss.qualcomm.com>

