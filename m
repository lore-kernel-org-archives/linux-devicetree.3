Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 346B756260A
	for <devicetree@vger.kernel.org>; Wed,  9 Sep 2026 13:11:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788959466; cv=none; b=p8s9T990MBqS6SFvFAgWPla8ETxyh6QNne7Itl+9Dxstd6MecYc+3Xgc7jo69ytCgo+c1RSK9ZgoAaot9vK8/MARDOp9r/KxjpOpgnIEzp+peSPo2WiPOpl4jG1gzhWQCSAnlNH9yi3RnUCGOHMUptQo9n19eICg5nqmoR8ycPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788959466; c=relaxed/simple;
	bh=Ue6midJSVmgV6ghv2VQrE9scJG+SviUg2vZbqL6/1Ok=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rV6Ke3s2gl0JhAmjOukzwsDkJlvo6wILd9n/wRBGLXZha9Os+Pf/pubpI9KAks36QyGtIQ7i2HFkLYTCBHTJzxMi5dQJpACdhYpOaZp0YwsquFGv8eg33v3226YdphZbfhmYyO1YTMROwImDrS4qdCtm3BZlHebtuOxP2EMNxSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=F10twoDN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KL7m2E4Y; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="F10twoDN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KL7m2E4Y"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 689BU7xq2375926
	for <devicetree@vger.kernel.org>; Wed, 9 Sep 2026 13:11:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	A/C1tmOXI13kUzfS0ML+iY5IwGKaZltTvEDgs10XXe0=; b=F10twoDNyO0LODhw
	rwN87gP+QPXEmeCIP1YUR89ef/UOyxAd2KmukXwv5i95U2cFAmpxIXUEVPLHGTC3
	k/i/qqCGUCRKae8dCO5JWDKoBvvWcwvqgKHWlyiqZCTbNOD3ynUKDdOGtKH0hGW2
	hoMq6ALqdejXOoTLabL1fknTHQDYyUK8vtX3kjz0zw3zVsMilbUkvtdhfC2xHU3m
	r5IZA99tA55xVLSWzR9ZQtZ9pYL5BKmsAw4jDutEZxtSZA6Gd9CSaK3qhdI3xGE1
	RZU6Ls1UdxTuB5yjm/EgxN/FmQnS+q+j+07vAbRUaas5ZYinlQPY2Ng/jVe2SsLw
	vHOWcA==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gk5ru0jg2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 09 Sep 2026 13:11:03 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-73858d44c8aso1288855137.0
        for <devicetree@vger.kernel.org>; Wed, 09 Sep 2026 06:11:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788959463; x=1789564263; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=A/C1tmOXI13kUzfS0ML+iY5IwGKaZltTvEDgs10XXe0=;
        b=KL7m2E4YLStqcKNlNfsUgMuhxwdvstO8jcuPwTEJ7MVu5Y8O9fe+z886DVCi115N/y
         RXU5EWCAYCYMOMaLwZPpL7stWljVeVi4fO5Fdik2e5nPnAuPnfx+xyHKeKr1ADWnvCOn
         C57reL08sfaaCFw3l2g8G+3Woi6m1dKd5uvUBJnnzo7ycqxxpOb/vSJYVQ+4vvza9eTk
         a3x+q1MkGrUHjYXurN+tOW7BpEF40lPD5ZE4VDuKHqplaJdAJ/U6Hv+8Bnn43YzP9kll
         nep0LxdWs3Uvxeslbtv/PbZ+MqnTuIQl6wSAEtr6mxRWmeGiomyqydsTHyNKbkc7Zq/n
         qx2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788959463; x=1789564263;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=A/C1tmOXI13kUzfS0ML+iY5IwGKaZltTvEDgs10XXe0=;
        b=FtHrdubrMByNv8RzielsaBAVPQxpUsIi02It+OIpPhFb1Du2fJoMq/G6VKr5iweb3I
         DClhKvuQ/UPgncUf7BsW5ru7H7lUjN0JjZ5vRmvM9/2lN+6OZE7szIufVZxtzCQ7HqWU
         I43Kj3oKqOKmpSK69IFwa7Qluh5AQkMQqe8tH+De+RKxj0dZYwTdciVwY3k1GX5iSDh7
         haAAPGDO3UneuBmr6VIGNEOys9gkjhZGFGdq9vhXOtWhE6u1BT7VP6GYHzH5qeIp2XmS
         Luvgm++1vqMvNgg6+Yaa9IwmJ1H28kdeDGnvUHIz8xC12bvbJkF3WGNgd8PxJYYxcc7Y
         UHRQ==
X-Gm-Message-State: AFuF++lVF6H+JDZXQBm2ECGkveU0VszIuAh6aLTya+QXYf16I8CvGfnw
	Z/8umd+yqQLc0LVJJ1xlGKKFGrQq2BwrOy/8adRMf4AGkEGqbE56SD649K/OKtj6QgDHug7OEsf
	p4Y3PL8+Smj/VK07r+oGynSLEl1cFUDIAPAvxxG4LK1MfqCjvVwXaHRrZgUO49KSJ
X-Gm-Gg: AYBFou0z/fdPZjao0p2IKlP3xuDonM5gg3F5Psobfhz6m3sXSxsHxGXiH4pxAGAYjpr
	xR/iWXftIQpctAX8k/AFwiLgRtIbntAMCccUZ02GLqt3ARol83NUcd0T7k3DX82sVpui3DzG+q9
	i1aGc2WbERit7vZcynkS0MpqErmoOySk4ae9zkHwuL4i0n5Lda5POOtWAx5xD990J2XPQ+OrckK
	W9eXLUhlZ5it2WFdnVo1t2eU7GrH0nYb7bGCmeyPcqjcACi0RLz5jUzIA6QQKpTe9PpARS7Nczx
	d/plvd7S0oy9f2NTQNXFvArpzIOM6Bs6ZorA/KPf57Nwpb0RWcP83WqWjt9lRvYNM4YgXWUqk0j
	4OkEgO8BQf1C6yqedJxwSK4w=
X-Received: by 2002:a05:6102:2907:b0:778:9033:e337 with SMTP id ada2fe7eead31-78a4a7186d7mr13868979137.7.1788959463047;
        Wed, 09 Sep 2026 06:11:03 -0700 (PDT)
X-Received: by 2002:a05:6102:2907:b0:778:9033:e337 with SMTP id ada2fe7eead31-78a4a7186d7mr13868901137.7.1788959462533;
        Wed, 09 Sep 2026 06:11:02 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8993253b3sm114594e87.52.2026.09.09.06.10.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 06:11:00 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Wed, 09 Sep 2026 15:10:39 +0200
Subject: [PATCH v3 5/7] dtc: dt-check-style: Right strip whitespaces,
 leftovers before comments
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260909-b4-dts-style-checker-continued-lines-v3-5-474bb324ae53@oss.qualcomm.com>
References: <20260909-b4-dts-style-checker-continued-lines-v3-0-474bb324ae53@oss.qualcomm.com>
In-Reply-To: <20260909-b4-dts-style-checker-continued-lines-v3-0-474bb324ae53@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Saravana Kannan <saravanak@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1119;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=Ue6midJSVmgV6ghv2VQrE9scJG+SviUg2vZbqL6/1Ok=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqoVrSDM2IbCyPpO2rKNkkugN+JiRfuzZxYZt7k
 LlhL1lU1f6JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaqFa0gAKCRDBN2bmhouD
 125rD/0b1CzXHuHBW4O3c/s8PwdOsFKkSMQ96G/EaqO+aQ1L4NkQbr3B4AGGV+5V8YWwzDTZzQd
 BNpus1cS1sgXm7G7IIk2h92CT1Qu4XzgxcbELNmXl/7trpKvSF1ZFbr2HnoGJTrbsatD6t685DH
 Xt4mHmPNVH0YPg01XuOUlnV11wDrkRzhhsd0e2uHuorQY0+SXQyV0J+bkuYcwehw0OxpzhwbMpv
 q/GIoK2v8dBISevSg++RtSexn2MRRBWxHZkq60Pu5J8EL5poPaalf98HidMGRHszZv7D5zhj7nG
 4gab6iWMcXqlyV9dVC4EVDecc4U6YEvHPikr8sCVCK1KtwvFe33hCcCWQH6F6EWWg7Yybbe7i2J
 O4S09qE3cnVFpY+lGRZCme69rutC24Q6xfndWsV0DZGPTV5p4bWD97KyUtK/F22wiAFZSxlef/r
 Q2o4uaQtsAozYoQ702bJRN9g2fnadO1RiXUYkLdgvmt0rpa9925nVl+GHUOHDxpiMx8bsk17JyX
 UNISuJ8lkQiFznb7IPi4QcWRdmjdqrzQ8wkkcNk1drZFwsSMmRW7kvaQmg/7esG+adUu01SSAJA
 Jn2Q6OpQ8gJ9JleGuEDRQGTB0alI0TWZiU0ud0Bj8YKvdrtkVeQ0wJjNoBNZMRRoj9f3skEYg8s
 bt/aem7qE7/qY8g==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Authority-Analysis: v=2.4 cv=M+997Sws c=1 sm=1 tr=0 ts=6aa15ae7 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=3nWb1Bopbj9nUPZVt68A:9 a=QEXdDO2ut3YA:10
 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-GUID: BCNcBOl0yZHTTWkBsbt1zQ2kzYCT1oci
X-Proofpoint-ORIG-GUID: BCNcBOl0yZHTTWkBsbt1zQ2kzYCT1oci
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDE0NyBTYWx0ZWRfX7QLCfHj+t9TH
 XT5iVR2yRCFxN+MUjQrWXqfIbVcycGsC+9rRkU2OByyjPUoJ7smZePDHT1ilS2hZH60F/jvmdRo
 HwKEbkOSv/PhR8+rT9NfTaw9PdTUqpM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDE0NyBTYWx0ZWRfX9RTc3nYLT0B6
 GCPX3TDyNe4sycyIEoOFk2pIjnVTtwkLZyQK+jfYXE8Iq92czinAUHDXENGJB6M3PckPbu/Cowm
 NXigwiEPsGhP9BC81PMhu1Q69L1cYkBb3TeDZGJ6D8eyNFFH2wDcmFGfBrSdkuafbt5f1OW0osl
 f2MYPRfiLBtieySXJ2lGfbb9BEubDqsrgaA9RFuUBt74azi97QX8KIXf9jRoSx6hhA2ygakLCK7
 b3NSIPJcYh/SHTVzl1reeAZ5G7h0hjVsxxDaPwgw1iGNXrvwn3/BEgTbDY9S4UhE7A8UEZtcGzH
 rLbyJPOLtF7DIoYyKbwUuesrlZjsV/qcUWugt4hIQWyrdIMdCocKvuKmb+Y+ul3tWVzLJOrb3iI
 1ZEloMaOwjUX03G5hdTJiBWRpioZ+mvYISEgQeunstJGXLI0mKG8jtlEo3nc74SdhAcFTuoS/dm
 D0dp2Bq6orZr8TMo35w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 spamscore=0 phishscore=0 impostorscore=0
 lowpriorityscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609090147

Stripping a comment from a line to get the code leads trailing
whitespace (e.g. in  a line like "enable-active-high; /* comment */")
which will break DtsLine.code.endswith() checks.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 scripts/dtc/dt-check-style | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/scripts/dtc/dt-check-style b/scripts/dtc/dt-check-style
index 2ff9fdc50367..b10e30f9d5b9 100755
--- a/scripts/dtc/dt-check-style
+++ b/scripts/dtc/dt-check-style
@@ -91,7 +91,8 @@ class DtsLine:
         self.indent_str = indent_str  # leading whitespace as-is
         self.depth = depth
         self.stripped = stripped      # Code without indentation
-        self.code = _strip_strings_and_comments(stripped)    # Only the code, skipping trailing comments
+        # Only the code, skipping trailing comments and space between code and trailing comment
+        self.code = _strip_strings_and_comments(stripped).rstrip()
         self.is_root = is_root
         self.prop_name = None
         self.continuations = []

-- 
2.53.0

