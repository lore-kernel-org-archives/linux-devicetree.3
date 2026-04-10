Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 401D03E95B1
	for <devicetree@vger.kernel.org>; Fri, 10 Apr 2026 18:44:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775846644; cv=none; b=rDWNJJa25bNK/Dk7BCC9pKvi1m6tBUIjC8w17JKmj9t9+5uTSr8RWyWJRSc/tEesuyCqefn4VhYIAECmM6wA5q4ST6UrKEjJcLsOBrPxLtwzbrg81WcUoneQlDPzj2PVGFdUz5DEFFc/aHwCz5yzsN0qA67LJWrR8AdkqnThaao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775846644; c=relaxed/simple;
	bh=aO/ds3TjNStgfhHB1D44+j7Ui4RPphjRAyEWpbzLt7k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SEYUyhmqB4rKOyXXdFkL+TMTgXfHvJjt54QpM+/tQFr6OUmjkRblTqWhJGCDkybkxMX+msgTI9+xNO8fwPTH0C1pfhn8tto92PPoV739W6rZyb3Q85OWzjJWmF9OxM27hH1FJ85emJ5JAH8enhybAjOoilzh71LNZ8f/HkIQ/0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=b8S8qifC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CzX2MV5i; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="b8S8qifC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CzX2MV5i"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63AB13Pf438888
	for <devicetree@vger.kernel.org>; Fri, 10 Apr 2026 18:44:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=2YrNAn2URfe
	wArBADgP3zBhtItuxP5QH+d8687n80YQ=; b=b8S8qifCopiDFbgTjPWhW5H+ru8
	0ynVul3JUK6trz2fvxSkQAfu359vusIpejnBKMfsjo2BO3Zkr+nA7dMJC/ZFvUMs
	V6N8zZRPS94A9w4+TmyYIVm8hnttULYX57dIqF9dPC/hBvPCJj2UGQXvEXg0J/RZ
	zg8zTSgZaQr00UW7ityhlDE5P3wEWz1Xhr0XI9TAuHKZyWJCkBsioTVj6YNPD84b
	DM7GISvOmjxOeGH1IUop/yqaozwgp93/Y1zgwmrz5jiVOOQvwbRX4b9zkXCsSWg3
	6CZPnCP3GKIUDropNJJvZc+/sxiMlhGIeJClXEroBOwSqYKfIpq44UJ0GKg==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4deyy9sek5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 10 Apr 2026 18:44:02 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-82a77f807e4so2557484b3a.3
        for <devicetree@vger.kernel.org>; Fri, 10 Apr 2026 11:44:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775846642; x=1776451442; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2YrNAn2URfewArBADgP3zBhtItuxP5QH+d8687n80YQ=;
        b=CzX2MV5igd4rjKrhAB5E6UuJ1DQKV6vdO61jfmI/F19gcWvEyXwv9LvQsLFWU6VpJG
         aJ8TtKgFDwFGTNJfi8uwsYX6ZpSKsnTlKNBpGCk6F+jeCWdEjiieX3DgjH8kNPpi9Xm6
         IQMSaaXbLCUHGiZZmBph4kC+Bf8Po2KxMx3FPNXRqdjBlZxprEk7xM9W5lzBIbt+tWZM
         DovduH9K01yURgwrFd11ozjh5TRNybawEY4dfbp9dx9fEjY1S4b3AT82mXeaZX5lX7hv
         T1vu461hd20UCqwpthFZpdSxurWFdnV5IqL5NCfvaMp62ctbt5l5mA6IsriFU4g78u4w
         3hDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775846642; x=1776451442;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2YrNAn2URfewArBADgP3zBhtItuxP5QH+d8687n80YQ=;
        b=f7u3SS3FMQ6OrhMSEukUX5ewyBPySMkZF4MyrRvg5pGq9tTf0aSEYyEzpR4XEiandF
         gNeYvYYjFdarfMCeJfAgBaohsW7MPOVLsCEBL8Ie+jTuZ0yC37YN5Phvufx6udN9T/F9
         yq2u7wUZHhugAAOAmqKHfJz0fRxrUVYRwtgboPNyrhBDMejJefsoPw7/OpVnfqwk7V+6
         XiqPgYDlycPOJFYWaIXddqtpiBFaAon8H/p9XBGJNFJ17eJzlFnl+f8Yb3BSVMZLb2wP
         Guik9bFWWXL7pmSHPBzoyNeRLfcuHp/toFMeCuVLsM2tQ15LDulEIJoX6ijHXaNe1KY/
         aVmw==
X-Forwarded-Encrypted: i=1; AJvYcCWALEBZOyram7SXYNX/HVRYCDl7BZBGkyyAXjOuxocC0bmlR9Gv12YAuWyUpH8Md+HBkjUgAD7/tcKt@vger.kernel.org
X-Gm-Message-State: AOJu0YztzvqPuOBUAf1TDrKQ0XCdirJMZpr1AiW8FBSQEpRrrbzNoSmZ
	rj6c1/ja2rIJGXYLUpEt4rCsqtnr4Og7Wb0/AALdC9q84XWsfKHDxJspuuu2ASNzHw4VBRecWHd
	K9qb89YW6jbS/xitJck/C7Sr9gI8LwJFLiTXa5EVLjagOXajtG//8iXrCy/rniImM
X-Gm-Gg: AeBDietPNI8fxKVhdPgdvaU7YmcZChjlD35+/RGFGM+0JDOgJhcbVCbdW+TiUenQQto
	xxmAlL9VEUL79E9EgZM38gXQ3qoRo9WO6Z1tWkB6SoNpsd0R8zXH0TyEegf2nDfPE4bi49QDsYK
	Fk525CVBvnGFo9mP2eHBPq96kZkl5yuaaBipFX7Pzr8CfyKxAnSXPDslAx2L4sy7Kh+iQY/V6Us
	0m4OOf6gMIbHV/mjEwxjYcsgTlkwT9rILNBT/3HOy5etH/Fr27e7Qg1Y5ix+PTbPgBGAp/Tml9V
	lHFZAVzpQtV3MSw5yYvTg9a9uQFUXWDmPXXhk0nuIkrqBtoxU+p8V2HAcxXgZ1DJdkrk17yT4dY
	BHLPvyAISeIIPgzbzNzfYD7I6Pr//uSXB6CfICtkUtW9ojW6L
X-Received: by 2002:a05:6a00:18a0:b0:82c:e601:3601 with SMTP id d2e1a72fcca58-82f0c2c20aemr5367872b3a.42.1775846641877;
        Fri, 10 Apr 2026 11:44:01 -0700 (PDT)
X-Received: by 2002:a05:6a00:18a0:b0:82c:e601:3601 with SMTP id d2e1a72fcca58-82f0c2c20aemr5367847b3a.42.1775846641253;
        Fri, 10 Apr 2026 11:44:01 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f0c32e744sm4036922b3a.13.2026.04.10.11.43.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2026 11:44:00 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH 30/35] arm64: dts: qcom: lemans: Drop unused second PDC reg entry
Date: Sat, 11 Apr 2026 00:11:07 +0530
Message-ID: <20260410184124.1068210-31-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260410184124.1068210-1-mukesh.ojha@oss.qualcomm.com>
References: <20260410184124.1068210-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEwMDE3NCBTYWx0ZWRfX/jCJQ+FZ/dT0
 HJW+kfJK9lU2N3N/dQxo7DEx3p0WlRyVRWhKJ6JJPajtR5wV89S17MGndUnxp/DaFREyOkaDRzS
 oq6Gm81Vru9ejQDrD2G8OHxluEl7b4Az1OVdZj/mBC1NPCRANjbqJMYavnUYE+KyWcQChgR1u/p
 7BQF4Bppi46X3/NQzWVHRwFYaFn4Uy9/1VtajQKTJJTkjv1fS3CTG9+f8ghBVxnRx8/SRnvlD7U
 JHwv55VIZi08E+GO1BCQJVVFO403C49z6XnOicS37+0H4kshrb9Rpa4Y9vxn82CHTvUAyULonVq
 /jL1NRcn9eWbUZCKBFnq2JKljhBxTVdgkiEVU/VN6rp60Y8WJ3fjddzPc3utipjI8+sMyqMfkqH
 xC/w80ItMJ8KROk70aLljOdDbV6A2VFRLj72r/6YFSNPPwJw49UV7AntzFl/6UkdmySKaApkrig
 qoY/ul1vD2h6UAJi86w==
X-Proofpoint-GUID: 5ERVNMnRQ2rML0xVJmW5u4h3JT4YyCxv
X-Authority-Analysis: v=2.4 cv=d6fFDxjE c=1 sm=1 tr=0 ts=69d944f2 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=b1R3E_TPsH7j7qtAm9gA:9 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-ORIG-GUID: 5ERVNMnRQ2rML0xVJmW5u4h3JT4YyCxv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-10_05,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0
 clxscore=1015 impostorscore=0 adultscore=0 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604100174

The PDC driver only maps the first register region (APSS DRV) via
of_address_to_resource(node, 0, ...). The second reg entry was never
accessed by the driver and can be removed.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans.dtsi | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/qcom/lemans.dtsi
index 1724df115873..e48c8ef7d8a1 100644
--- a/arch/arm64/boot/dts/qcom/lemans.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
@@ -5536,8 +5536,7 @@ dispcc0: clock-controller@af00000 {
 
 		pdc: interrupt-controller@b220000 {
 			compatible = "qcom,sa8775p-pdc", "qcom,pdc";
-			reg = <0x0 0x0b220000 0x0 0x10000>,
-			      <0x0 0x17c000f0 0x0 0x64>;
+			reg = <0x0 0x0b220000 0x0 0x10000>;
 			qcom,pdc-ranges = <0 480 40>,
 					  <40 140 14>,
 					  <54 263 1>,
-- 
2.53.0

