Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E11DD2DC789
	for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 00:42:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786322567; cv=none; b=ZmLVwYf5pggOD9qkC722vhginRcvAmtZD6QtgbdXZe4Q7024mhYb/KFDKZrlhexXAUxtDRX54gvlYn9rYSbIp5P0Mx8M6p7HM/H3YqdfSW4g2rfoziePKpYRGTXBwHMf+Hr17KSpNV0MnuyyV5PH4qPjThF9234NfEDXJQp56gk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786322567; c=relaxed/simple;
	bh=XH9q/y6n0YYgQgp/Q2mx0eNIcicMKwlLjlTfyiTRa34=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Emd52w7akq6mE26sWk+rHBMNzBv2FUnHvHL81C9KRw+Fp6VYXggBgqvWel6Z3v7eCKYrXm2/2858XC9Qw4hHyHKqZMFP49F6JNtP+p4fE+zQ+KZyw2nbQDWSTPWPnu9/zqD1iUHhYpLPc0sl7UwtDcJP1U0ajaCX/1qvGpvWlsk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DMc3I/Mr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ix9CCDWh; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DMc3I/Mr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ix9CCDWh"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 679L8DCP3836059
	for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 00:42:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2MkeqS8Xm/u/rmFehJE2DuhmOxprgWDkQayQ76BCyLE=; b=DMc3I/Mrrfzi5E4b
	LzFUvxKFSkKRTcn0834s6ayo7B4Lws7E6OYu6xttyd4NJdHzc9mEw0yRV6Wi/jZ5
	Qn5lVhATbnPuI2JtG+tpnq+TmPdh8DeyRZV9lMJz7VuRflaun3FU4G7OFwmu8f3c
	UeKLJfKMlbXSKwI9uwjDDVWOSEfOWDEvoA9TMQOhpW15sBBH82qUvXw+gfucg1RC
	ZDkukMCLiAXWJC1bJ81KSwZZEQ/tw/HhkzIQPAjtWJqxgWjcUU1fugskSeINHBgS
	Qk5a8RBDDNXut4vWQS4P2j0HqlXOQbtKliwb2rAn0jKQQEOaPzq+KAJ7mgqpMd05
	YfM48g==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fwvp1krwm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 00:42:45 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-52b4f6ac06aso24942951cf.1
        for <devicetree@vger.kernel.org>; Sun, 09 Aug 2026 17:42:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786322564; x=1786927364; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2MkeqS8Xm/u/rmFehJE2DuhmOxprgWDkQayQ76BCyLE=;
        b=Ix9CCDWhXuOhpImCXvdJes26lSRpOkozTtpNUcBTGdLD9GEi/+LIXVvicDQHDV+Sx2
         OJx/cnIUT9mlVzzwUMv2JJozIaMXOoVS2AO3cnXHIxaOTcJWRCm2QimpK+vP1r/6lXDl
         EDqfD1+Rf5bC6LnYEa86ODjryfhd/Ysw1HtxJFsecRDPP4U7UC+xzkp5gD8zh+T0YjNI
         /aMiDmTnn3es1n4pkE4D14bOQi1tya8t1NmMKJ6DXAhhMZBQYE3L02oj38sMZ8O35mcw
         hINq2QLux/mDgQC92RrRGpROc18DKX3835fP9Ehc9LUxorTS2uP7SKn3byVKv3lPAQAZ
         HenQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786322564; x=1786927364;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2MkeqS8Xm/u/rmFehJE2DuhmOxprgWDkQayQ76BCyLE=;
        b=rv3KhUx7FUoXP7fyLfv/R/Uqo6rpbcLM82LLSFC9knpn5kPMEa0wDKCWLgcXej0TvI
         qMX0xY7yO8j79u1NwX5gmnepj0vQjGGUGQfiq1z9z/x44xQrmlfNIcV+9bmE4nltwcXk
         B0RkaAKA+zpiP7fqYWfAgsXHdOd2pcUpJnHnbWvZ0LmVBsfgnuKaJZLdV7wmleeNLkuo
         1iEysRrBRrn1aL7fpklW300LJf9n9eGR5vhxV+3B7yIe3p7XP/om6lhxKVeb4oC8aUjr
         y9kRCMOiu2vbxSxtNB/XX1xpUuwqjCLvMrlM22iKLn+gR4X5ogFzqDju07n2X7n4LAjz
         XPSQ==
X-Forwarded-Encrypted: i=1; AHgh+RrPpEUhL9HcXKcvHGLkP1SDb5bIhIvcyvj6F+kgME3w8rUpu8EidrnA7/XnAFRmigb/TO+fAW5/qaok@vger.kernel.org
X-Gm-Message-State: AOJu0YwoRbh5TDD6IXx/oT0hkJ/SEe4s2qzVoEr7JGcO0v042jwK38Gj
	2ZfMTfwLjJzncGSXlVpoy6+9nhcmKU4mgTpjpEvpv8YyGsLTymhySjP0eymz2D7KMFHUmy11u5h
	do4BIGlYsZyvPzqXsSkWfk/QdL7I2bYMdjolm1/l4E/nUk7585k9N6P7QcgJ8jy41
X-Gm-Gg: AR+sD12X4fyOZpfgsALpaxAvGabpv83YZIp/iS4xzrhO2GyQ56tFbJNCuQml+QF6dZx
	flBvrrrf4YryeQb4J9SMJLkXakPrr0psPPUJqf3iHS3jJ/g9XvKbGFlF80Nit/7d3XVyEOfI1ZF
	pujgZljhIDc9aoq3gaUrnBsTem90CyRbPJPjdu6Nu5cvY7X2egRJ4zoYCxPI+Pfw+YLOGE6qU/B
	LgaXX60bEOFJzTIusojDovHDk1YND5MDYpwipxpl+9p/o+Z6O8LJ0RRCRJS3EwOpHCiKSaqUI6p
	qa9ShrRjMoTsRU7wFuxPRh74oOaupycqLI2rFyAZ/scAquRCTy9+7S5GIuOzp2gkz2GWpRxdqkD
	7q2kqnj1jmF0HhkxyxeQrEzBwh7Tb4MLPTbKxBw6WI2QEyg4HwtQ3/KY0GZB89uXOMBtySvaxY5
	Fl0HNI+zG3h5NF0A==
X-Received: by 2002:a05:622a:64b:b0:51a:329:e802 with SMTP id d75a77b69052e-52d0b29a339mr256082511cf.41.1786322564140;
        Sun, 09 Aug 2026 17:42:44 -0700 (PDT)
X-Received: by 2002:a05:622a:64b:b0:51a:329:e802 with SMTP id d75a77b69052e-52d0b29a339mr256082281cf.41.1786322563756;
        Sun, 09 Aug 2026 17:42:43 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b3055f3d56sm1679742e87.69.2026.08.09.17.42.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Aug 2026 17:42:41 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 10 Aug 2026 03:42:32 +0300
Subject: [PATCH 1/8] dt-bindings: usb: ti,usb8041: document the TUSB8040A
 hub
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260810-msm8974-onboard-usb-v1-1-08a805768328@oss.qualcomm.com>
References: <20260810-msm8974-onboard-usb-v1-0-08a805768328@oss.qualcomm.com>
In-Reply-To: <20260810-msm8974-onboard-usb-v1-0-08a805768328@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Alexander Stein <alexander.stein@ew.tq-group.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Oleksij Rempel <o.rempel@pengutronix.de>,
        Matthias Kaehlcke <mka@chromium.org>,
        Fabio Estevam <festevam@gmail.com>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1540;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=XH9q/y6n0YYgQgp/Q2mx0eNIcicMKwlLjlTfyiTRa34=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ1alXPWLGz5vl9U+WrOVn3VPMXPVIjmhexsP+q7mzdwty
 lwgNnlWJ6MxCwMjF4OsmCKLT0HL1JhNyWEfdkythxnEygQyhYGLUwAmsv4cB8OCgC+/8r8HCt0W
 cO6K272jM7S9o8FhlsjKLGc+y3aRWU+X7OhoaNvusP2GhW3z+zdu7XIrZ2Rfq07ztjM98Ll8sYP
 yAWs9HufNwht/6qnklNzga9DpfbwkIvO7ay7zuZLJlXO593wKTbA8xvtt/k+RhYn+118d3bi+ec
 IR0xeyczX36/v8WjQ/XzRV/vu9HZlXZBdKvWIvb9aKDGneV9zJLCphb7fdpJPvnbZF9teVvVHzR
 d5e9i3ne2JgpvxNpyZl6sfpIc6WbacvCt6xMnJI4Ite2lYl/cavXW3H2oUGoRGqTTfZZGI6a/LV
 vQPOZfoyB0bvOGb6kLew02F9svWldf6uiyrPbM7JfvwcAA==
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEwMDAwMyBTYWx0ZWRfX9PVOKdDyeJlB
 OWNPcRjFdeXfRhUpOx06bW05BDCMEWakj/slY29D3NBPyWtZD4FdetoK+splzU5iP0P0vPGjAVI
 pG/utM/58ksPwzovBgsbQXECb6p8Th8QeqG7sQS7B06/HHNkUvyIAB5WsbGITqKfUOhSoAJU9oz
 hCu/gzZA2k+FREsOta437I/tlwKOBmiSK+0ZrUbRFvJdl7hxRNZv/sipml/Mr1tDH+Yigh8X2Lb
 7r4o2MxBTNgKZqfGJlhgkh+U6tx8IGk3Oft1aPWIdBnuYkDrLL9Lq+zOfeSZWOUVAAQzeft5Lx8
 I33VwW5xn7lH7yROqR5shJtsD4nNkyP9A/iU++6Rs9t0GKlGsV1w9upmGbEXssZtWTz1oS7TkXE
 dbwjBfjNTvwj3v/9aYueOBgQhvoaoJjDtfdYLHR1CYtZXCHU+7CEOyEq9ifc0AqH55gmETN5MAV
 JlcNy75CLFTqz6KSmvg==
X-Proofpoint-GUID: eVaAeKbFCgSkpZjRf85qpZ0u6FsS6CEj
X-Proofpoint-ORIG-GUID: eVaAeKbFCgSkpZjRf85qpZ0u6FsS6CEj
X-Authority-Analysis: v=2.4 cv=ebgNubEH c=1 sm=1 tr=0 ts=6a791e85 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=gEfo2CItAAAA:8
 a=EUspDBNiAAAA:8 a=8f9FM25-AAAA:8 a=e_ZJ_HNLQjvR_73SufcA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=sptkURWiP4Gy88Gu7hUp:22 a=uSNRK0Bqq4PXrUp6LDpb:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEwMDAwMyBTYWx0ZWRfX8ugKc6x81bKP
 nTLFs5xf3bVU3AphdZoiomFmi8qVlQL3fRy+/59+rApwxt6XD5MDFYJOt8vheRfcoz0rAdwXz2i
 VbV5wWeKAEON2/9iDa6aGPu7deIhF8M=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-09_07,2026-08-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 spamscore=0 bulkscore=0 lowpriorityscore=0
 clxscore=1015 adultscore=0 phishscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608100003

The TI TUSB8040A four-port USB 3.0 hub is not documented, so onboard
device nodes for it cannot be validated.

Document it next to its TUSB8041 sibling: the same reset-gpios/peer-hub
properties apply. Besides the datasheet default 0451:8040 / 0451:8042
IDs, also document 0451:8041 / 0451:8043: the configuration EEPROM can
override the product IDs, and e.g. the APQ8074 Dragonboard programs
these values, as seen when booting the vendor image.

Assisted-by: Claude:claude-fable-5
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/usb/ti,usb8041.yaml | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/usb/ti,usb8041.yaml b/Documentation/devicetree/bindings/usb/ti,usb8041.yaml
index 07e13fae640b..a7ce487090a2 100644
--- a/Documentation/devicetree/bindings/usb/ti,usb8041.yaml
+++ b/Documentation/devicetree/bindings/usb/ti,usb8041.yaml
@@ -4,7 +4,7 @@
 $id: http://devicetree.org/schemas/usb/ti,usb8041.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: TI USB8041 and USB8044 USB 3.0 hub controllers
+title: TI TUSB8040A, USB8041 and USB8044 USB 3.0 hub controllers
 
 maintainers:
   - Alexander Stein <alexander.stein@ew.tq-group.com>
@@ -16,6 +16,10 @@ allOf:
 properties:
   compatible:
     enum:
+      - usb451,8040
+      - usb451,8041
+      - usb451,8042
+      - usb451,8043
       - usb451,8140
       - usb451,8142
       - usb451,8440

-- 
2.47.3

