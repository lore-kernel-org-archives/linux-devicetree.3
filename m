Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD82C3A782B;
	Tue, 21 Apr 2026 22:46:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776811585; cv=none; b=PCdr42zlqUpywixWZemNMcW3T2JDdA2Mapvxna/Oncs957+5ayOcu7oaDYN2vaLcOAlmhBDKr5Qs7dolKh1Eut6xiIijm/rJlxmWg0VzL3c5ySMTVlT0axIsyXMIp+UHx8rslxTOVL7TSfvffZOl0BE/F+vcQJkpXMJzHhtRiw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776811585; c=relaxed/simple;
	bh=ZXhxxxB0rTMGwKBNxxoDcTxxhtR9Dg07Ve/eZsh+hA4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=V29Uaixz9xWXtkKoB+i0bEE6fxP2XbkcXQcxtoFiNZ+StoFgt7ir0SRKhiNjtPwLM+ggVkddGKpMis3G0fgT/ATumbyc1epxJgKbOlQMoOGSmLWGktg7n9IQtWDXQqJtZ1cA9YIR7ccPbmuvkt+T48FzbUa0xh7c7a8EcRIsqNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=D91ZHNvg; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="D91ZHNvg"
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63LImXLm679940;
	Tue, 21 Apr 2026 22:46:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=vmzMlN5DJAj3TfNpc
	j5dVfDRWJ5iyR0YEC0nsFFtGJk=; b=D91ZHNvgjhZzL6fwoCz8WxpbuH73KALap
	OiQ0xzNgjfj4GcAqQ8kQpzejM0+0DkQRnfm5OvHcNWh+AoiBUOazDaU6r1ZOhyn/
	wQWHvJx0GumbGkYaT4Cuj4LDJHYRF3txYE/NW4JQW0bdtJqLu70hKl6b1pQv4het
	Mrf2GXCxziDNBR7dFFZtYZOEDRnoJSBvdOFn+cZlC5vbRPv/W3/3VGY57BHlbBp7
	LFSvfWWiOXoZ3oRBY8lJ4TiuHIMFqbB94GO23VvvRDHCF11Ydp87L03dbt2QsBkM
	AUPRvQQYEerPEL+XMp84JxhNFCWW5jySdZU+I0x5GpMm5zI7GrlVA==
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4dpeu7gp69-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 21 Apr 2026 22:46:02 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.7/8.18.1.7) with ESMTP id 63LMZPkg013601;
	Tue, 21 Apr 2026 22:46:02 GMT
Received: from smtprelay02.wdc07v.mail.ibm.com ([172.16.1.69])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4dmnsh2js6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 21 Apr 2026 22:46:02 +0000 (GMT)
Received: from smtpav06.dal12v.mail.ibm.com (smtpav06.dal12v.mail.ibm.com [10.241.53.105])
	by smtprelay02.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 63LMk0oZ14025316
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 21 Apr 2026 22:46:01 GMT
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9F31258060;
	Tue, 21 Apr 2026 22:46:00 +0000 (GMT)
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 00C0458059;
	Tue, 21 Apr 2026 22:46:00 +0000 (GMT)
Received: from pfw153.pfw.tadn.ibm.com (unknown [9.5.7.52])
	by smtpav06.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 21 Apr 2026 22:45:59 +0000 (GMT)
From: Ninad Palsule <ninad@linux.ibm.com>
To: eajames@linux.ibm.com, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, joel@jms.id.au, andrew@codeconstruct.com.au,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
Cc: Manojkiran Eda <manojkiran.eda@gmail.com>, ninad@linux.ibm.com
Subject: [PATCH v1 3/7] ARM: dts: aspeed: system1: Add usb virtual hub dev
Date: Tue, 21 Apr 2026 17:45:40 -0500
Message-ID: <20260421224551.1611818-4-ninad@linux.ibm.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260421224551.1611818-1-ninad@linux.ibm.com>
References: <20260421224551.1611818-1-ninad@linux.ibm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-ORIG-GUID: OIZAoSM1Qb0Q_kVv2DW5srhm_dw6vMuf
X-Authority-Analysis: v=2.4 cv=Ksp9H2WN c=1 sm=1 tr=0 ts=69e7fe2b cx=c_pps
 a=3Bg1Hr4SwmMryq2xdFQyZA==:117 a=3Bg1Hr4SwmMryq2xdFQyZA==:17
 a=A5OVakUREuEA:10 a=VkNPw1HP01LnGYTKEx00:22 a=RnoormkPH1_aCDwRdu11:22
 a=Y2IxJ9c9Rs8Kov3niI8_:22 a=pGLkceISAAAA:8 a=VnNF1IyMAAAA:8
 a=ShWUfGWSBk52ZyEv2HIA:9
X-Proofpoint-GUID: xSzE-azazQjZvOlC0hXUBgGX8BHu-_RU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIxMDIyMiBTYWx0ZWRfX+ateUsp1rsZR
 ooto2QRFj4GCj5gc0rkyjkR/r1YBAKVVr3nj05Ccrw+wZHoJgXXv5rCCuHcDhmXFBUif8BAH9H/
 zk4WpWZB7VI03ggc5SRGvy1ZsapysFv2mkxNA3W+EKJ2B92GU05atE86jxuH/i6l6raeJMM69RX
 LTt1G6w/nGJxed68ovSsduXh9bi1mi05H60kfi16y6hSbx2A0+VZuEj/lb0gvFOWWV6x4zeIUJT
 gMPj0OWb7kh8sXZLSg5nkpuCLfsqjYTeGRn2Zc/1nA/xLBekeBwUVHOdV+HstbaKr2/s7y53AiZ
 YHxP9mpahSaAs7+ir3Pzau6Gfyr4aRzuwbDXvTi98covoEvKTidszwRyYKexydcXiWMVrDwZMAh
 X3dHxRkigsnljothcTuIIy2z3JKGUaAsDT2C4I0OZFWgEl8mnOwb3vqCHva4iklTTRpAY2Lnz7+
 7UxuDqqi3CkfdORJ4tw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-21_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 malwarescore=0 phishscore=0 priorityscore=1501
 lowpriorityscore=0 clxscore=1015 adultscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604210222

From: Manojkiran Eda <manojkiran.eda@gmail.com>

The usb virtual hub device is required to pass the typed keystrokes to
the Host OS as part of enabling the KVM (Keyboard-video-mouse) function.

Signed-off-by: Manojkiran Eda <manojkiran.eda@gmail.com>
Signed-off-by: Ninad Palsule <ninad@linux.ibm.com>
---
 arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-system1.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-system1.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-system1.dts
index 0ca799893791..b0eb1767c485 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-system1.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-system1.dts
@@ -535,6 +535,10 @@ &video {
 	status = "okay";
 };
 
+&vhub {
+	status = "okay";
+};
+
 &i2c0 {
 	status = "okay";
 
-- 
2.51.0

