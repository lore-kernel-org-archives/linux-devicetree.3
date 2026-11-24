Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795510408;
	b=dfghHNI3ttend0K5LhqzjtKCOD19zw3D0ypjRNsu6k3k0Uo542LqldpaTIGSKFRhBIbd
	 f06Y0I05JSwrln1dikgzTVzG7e0lIyjlGYzl9IqnFedTit7XYqHJF+5wG4FtASM5ua75x
	 1ZZz9L8/6ETkdYxog/y71g3nZYkrCriFkdndMVBiD6gbp6URRwiZdutP938Q1uGM0qwSE
	 OyZImQeoCfE3rgZxeEXOEZpy0x//xPoR64K4G09F7zxMblmMRDB4eNEqx/NWmZ/hwEJqj
	 Xe2TTxS6O9a+bjZ0/PIglu15S91YRrXQ+PoOB27S0vqcXo9LaWUyLOrhW6juSMe10yw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795510408;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=CQ1Jnl9WpIeR0ueGSV00aaS8i1VRkjGVw741YTuD/Jg=;
	b=lm3RAAzzN2WCOfOYI809NpCoUY8w1b6B5PKmaZcmMTnCuK3X9fXMoQ0XpEVpi3gd+lX5
	 4IxH+6tjRrsvIsIlXSf9JcG6oNBCJwJjOQ2bBc7Ir9HUP+Vk3m/I4AFd4ABeNCElJEtBw
	 oYMM1X99X86ArtX7lwgBDM6po5nnhcb9sLHKJlrojtU0hRi8kyTjzN4JQ9966k/UX15bh
	 BfjhQEf6GXJmJS/lX63SegqnldQ0NhA4SFEYyHup+TrsSiSblp9EyY85C3+tSYBF3caRB
	 Lw78eMlRw+ym31ZUw6G2aOVjvPUkNhkljdizvvCM01HQH94zmubVietsERGCeiF4aCw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gxJUvYyU;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XEXP7fvo;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA66D606A6A5
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 08:53:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CA66D606A6A5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gxJUvYyU;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XEXP7fvo
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AO8R7WC3701196
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 08:53:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CQ1Jnl9WpIeR0ueGSV00aaS8i1VRkjGVw741YTuD/Jg=; b=gxJUvYyUhv/RRlw0
	R39BOGparYm+4e6TxR4VPLqDmpkNuScZnJqr+9uTcR8ddE6DOcvSmu4RxJmLRTmp
	WYUInxgNABQ7oyKTRCRjBP5HIaoqOfIfGG/xHI7p6/2yIEv33srbhBSLDmT87y1u
	tM+NhB/CHR0qyz1rUo0r3TrKccnr2bEaqCIJHKuNrmGRKIXbISD6KLe506ArHUcy
	9QNvMoMZRNV1BF5kUsFf4VRm4E29OVrgJymaYb2g+UWOv80Cbd6Ph2ZsKISSyfxo
	OQWTIYGzP8ZEYmHcM+K01RMZsvHjEHF3bGxmo/RDdupRQqWmDHSqLLCIqxuBxgTV
	cvrr2g==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j50ky1ksy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 08:53:25 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-38531c1a566so3356428eec.1
        for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 00:53:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795510404; x=1796115204; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CQ1Jnl9WpIeR0ueGSV00aaS8i1VRkjGVw741YTuD/Jg=;
        b=XEXP7fvolTO5PrvpjZl6ahoBsl8kaGO0zrvn8Q4HFwXWMrqjK3ZCVcKylVKK5ZxQMS
         22LmrynI5zofwDPAdGvCWTlPG4YXHlCf74kXBdmxR625+k0LrFImsgftQXwkBcbD3FKz
         YMS2tv5u4CscPhofdb5RK4XwwdMd7E9VO6DWckPXqlH19I/tFGAUpFTidSaU26LLKhCt
         Prr/HvklLsitszXhbFIvAPA30omVBMVbvZrxziUSAWy5Wwbjb16SHP6s00JAMaTZIf1q
         24ka/beT71zYO9y6Z+Cbm3POG2a5rvLrGbHhRftmJQHGqmY2rVbgnj1hWYgO3jGGjyZK
         H8nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795510404; x=1796115204;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CQ1Jnl9WpIeR0ueGSV00aaS8i1VRkjGVw741YTuD/Jg=;
        b=nn/IGg1EP8Lzlg93uvJVTbZsa9Yu3czqRImiCxvd2oyo4moLWtbJK8iN0P12H3+LAV
         NgtZQFQB2wYfsYmbGvcsbVkEAndHhNMurlZbRRTYc/DdBcJhKDn3xySdGTUpjH3lXXum
         SvFZOuy8wDxG2H+oe1BmN6rniuJKVsNEZUEcysnxyIDSjZxdulzsDsQ+b/ukMIqj3wSB
         42z/T+m4WWjq+h8/HQVnotlkhDDChocM8uaa/tGTDNcdlb8geOZIcE+/wq0YH40a4qaM
         RHnRl/i20JLXV9Oxs44QwQZ3mvxJ/Kz+h7d08xY7f46pnHMJ2HA/8G4vBXUBET9C2+L2
         pDyQ==
X-Forwarded-Encrypted: i=1; AL+hErFrQErm854x9C7lPKY9xanSs6F4KjRBiR4mOrjYxsaZqSmrlzG7I9w5etpeELgY/jTXqyLXJ1/DOeZC@vger.kernel.org
X-Gm-Message-State: APuU4Z/zIntDS1mdmVoUodKKYk3yHF9BrusLpR8CWR0gFIT5HsVZLHZ0
	bi4qikaKCWbhTt59lW/OA7zjPv0017kbOcvmAGFYVf1jzjfhWfCtHUujYt6P4Y1aPk7JmwE3iYW
	mbn6Z417+Uy/c9S4zg1KXIzTOS1vduoAp1LUWiytHgQdQ36taaxLX6cBUfrGEHHXs
X-Gm-Gg: AZFdTZdauDavYp70cECVJZaiftphJ2hIARzWDYfUPVNB5Y+0eE8o2UZeESvTzyL+yKY
	l2o9Ir6yjEA7RSqjJxjaDe6GGUEj9PUPxLEYS4aznPtrCxgRu21HqCE0LiWYdQThezMnO1pMUzn
	AKVbP8wUlCGpmaSdfHhbX1VNmyOj4wdnse+Z3tLEOkdEvdwT42w8hCpGTSou/tGefjUoXsNTRRo
	qPSVYJp7RQ+uUxujvitYscqLRvJ2b8G3pZDYZdofOA9WtrVuaw8jtspXT6ZfvbPKGk0YS84VKiw
	f3c9wiC2oUd4KuG+IsltLOoujLCEyJqajMgHRAtoloS2h2Za0uhAEc12jX1FqaOaHzHD+Jc+9iC
	nKd4sgBy+fG4/WSLhjP8Y55ScyShKAtlEpLnbN4KrgMP1dMTgNYjbqHkUtXN/hhNdQAxTRJf39l
	Ggbg==
X-Received: by 2002:a05:701a:cc84:10b0:1b5:709f:d510 with SMTP id a92af1059eb24-1b5709fd63fmr6813643c88.22.1795510404095;
        Tue, 24 Nov 2026 00:53:24 -0800 (PST)
X-Received: by 2002:a05:701a:cc84:10b0:1b5:709f:d510 with SMTP id a92af1059eb24-1b5709fd63fmr6813611c88.22.1795510403539;
        Tue, 24 Nov 2026 00:53:23 -0800 (PST)
Received: from hu-akakum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b56ef9fd16sm21748199c88.4.2026.11.24.00.53.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 00:53:23 -0800 (PST)
From: Akash Kumar <akash.kumar@oss.qualcomm.com>
Date: Tue, 24 Nov 2026 14:23:07 +0530
Subject: [PATCH v3 3/4] dt-bindings: usb: cypress,cypd4226: Add
 orientation-gpios property
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
Message-Id: <20261124-ucsi-ccg-cc-orientation-v3-3-73cd114e5393@oss.qualcomm.com>
References: <20261124-ucsi-ccg-cc-orientation-v3-0-73cd114e5393@oss.qualcomm.com>
In-Reply-To: <20261124-ucsi-ccg-cc-orientation-v3-0-73cd114e5393@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Wayne Chang <waynec@nvidia.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Akash Kumar <akash.kumar@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Authority-Analysis: v=2.4 cv=Y+ptIReN c=1 sm=1 tr=0 ts=6b055085 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=kY59nFXYWS7NJFzbzp4A:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-GUID: b18QTlVjsrMBO9n_F4dc-6p_ADAD2wdn
X-Proofpoint-ORIG-GUID: b18QTlVjsrMBO9n_F4dc-6p_ADAD2wdn
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDAzNCBTYWx0ZWRfX1WoHeK+lVUV4
 ZRG4PbKdi0mQ1OIQlt1kdVz79q94Pfe4255XpSvLs7Vhiqq9YuB51DCTroIeix8t3L0FVCbdIoK
 0yTY7vEma5Ra5MJqBR2NNWJwCy+soRw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDAzNCBTYWx0ZWRfX7r672HpKQToL
 rbFavSt+53imK9yyKAuI1KG34okc6fwaethyGwcRlf1uWYA5vvo8rgZ+jrcJCdrNJgd+JSn5p6N
 vtfm1aTy48Vg1ndhYS46gij5FKtUrchaxFJUGT5IsNpxCX+IUeqFNe4/6k7bT1K6hmNxFpuM22s
 4MZ1I0RdVF0GRvW01imKtjwSR0onjKsqYihVU1kzBR39UBsRkbPH/YVEHFzk6oKuwz3jWDm8ibH
 2EcTmSBUYcq3WOctYUbFu3p9tzP0b+eXDqorqNJsZzkryBdXQYBmfp96z/pdQxiVcmHpTle13wF
 359Eb7Mm4dAvZq3jiEpgRqte5p/T6IdODCyBwYwWvmsvTUNkCOwFBAyQARXKjUBrOVpadFo90ip
 88Eb8ISKm/3qOZ+SYpEJHy+1Mpp8hdORAFBRn9beGmGJuOGrcp8yaTAtBZDA1x1p5GUNRCOY7+t
 9Us8woCxUrVRbn+28Ug==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_01,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 malwarescore=0 adultscore=0 spamscore=0
 lowpriorityscore=0 bulkscore=0 suspectscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240034

Add the optional orientation-gpios property, used to sense the CC
orientation of each Type-C connector on boards where the CCGx chip
has no HPI register exposing CC polarity. Entries are ordered by
connector number; an entry may be left as <0> for connectors with no
sense line.

Signed-off-by: Akash Kumar <akash.kumar@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/usb/cypress,cypd4226.yaml | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/cypress,cypd4226.yaml b/Documentation/devicetree/bindings/usb/cypress,cypd4226.yaml
index d923ef82ecfa..298afd2542d0 100644
--- a/Documentation/devicetree/bindings/usb/cypress,cypd4226.yaml
+++ b/Documentation/devicetree/bindings/usb/cypress,cypd4226.yaml
@@ -59,6 +59,14 @@ properties:
     description: enable IRQ remote wakeup, see power/wakeup-source.txt
     type: boolean
 
+  orientation-gpios:
+    description:
+      GPIOs used to sense the CC orientation of each Type-C connector.
+      Entries are ordered by connector number, i.e. the first entry
+      corresponds to connector@0 and the second to connector@1.
+    minItems: 1
+    maxItems: 2
+
 patternProperties:
   '^connector@[01]$':
     $ref: /schemas/connector/usb-connector.yaml#
@@ -129,6 +137,7 @@ examples:
       };
     };
   - |
+    #include <dt-bindings/gpio/gpio.h>
     #include <dt-bindings/interrupt-controller/irq.h>
     i2c {
         #address-cells = <1>;
@@ -141,6 +150,7 @@ examples:
             pinctrl-0 = <&usb0_intr_state>;
             pinctrl-names = "default";
             wakeup-source;
+            orientation-gpios = <0>, <&tlmm 137 GPIO_ACTIVE_HIGH>;
 
             #address-cells = <1>;
             #size-cells = <0>;

-- 
2.43.0

