Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794935344;
	b=ike85ngr9EkuUvWLOovJheYsvEbnIDszDmzbvCS5SZUkzkQ3SjfDJ7xB21HkfU9zvepF
	 A1QmOpMfFRHjtgAZ7XQ3vtB9hjuOWu+t6Y9droS+tXk1uGl3wzh1SWQRKzZQ0yEmAOVqC
	 m5ACORF2zHKUfuca0Ztr1AIkY2HyKVaGG+2W6WLEc7bUYgay4HhKLLJIirxYmPgOlU2ta
	 TI2eETKRqshsAsmpxPHpob2HoqixoH+ewYVUR+rdkAi3rs5PjBvQWxDwHu9UvgMxeturJ
	 wQ4cTVE9EJuHnzU0ETXwQ7JdOHnx4VB0fLgKTPBfTGR/aFHCs5nOpdzW4pBe6ml7+wQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794935344;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=VAfyAkYxyYktUSO+F60vOX+g5stCoRKsvnWPeKrgISM=;
	b=D7wG1aLqiamZitjDFzaIoEypytM2rbT4DWswAc1vCRDqZ8YGOexACDD7X2s+8jvMF+zD
	 j5mY8J/n/T8EDU4RHpPXw/oL6nJR4e8xKphaDcOkh/J8f2pBHghs/3e5KfHHoqM0oKnKk
	 /PZmqNwHMIaxd+qe7fz1bVDrZ7ZyS9MSMM6y1IibpKD8SKYmk0TbMLyAy4Tjtuv9v7XPK
	 ymonXkDtjXpMz7q4WHqFiJif0ojath9rQwhFEHASQiUEfq6mXCK21OgiT7miLG9OnW3sG
	 2N/TPTpnwYRqI/p8zsBz8iOhv+hfaw2eaQW1gF/mfLex9scZcU3W8VbDb9o5Fvo8gPw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VvQrKbg6;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=R34SvqJk;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DE42606A32C
	for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 17:09:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1DE42606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VvQrKbg6;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=R34SvqJk
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AHFR2C63503890
	for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 17:09:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=VAfyAkYxyYktUSO+F60vOX+g5stCoRKsvnW
	PeKrgISM=; b=VvQrKbg6YAJNRoLqeywxzQApdWHhLYpK3IWofb6bDkLhFku8iEu
	7HSUQfW300l2xR0gzH357+e3ETlEj2OSzPdHLe35Hl1avAOnZVzpkMkaDchT80Rw
	NPtNoTGx8ceJG4gYBOmMlYZtiv5u/JKm+U9CK7PTsjp0skTxX2ZamzzErb5f8BTE
	xE6aCZIVdWl8yIEHbIpls5Lby7eKAHt4WXvkpyez46VMeBo/5fPI8+xK269BBj12
	r6/xa6jizijESq05TOQXM8bZbyNZsqBHDdldP/VFkm+E0Jzo68tYbWx3wEZNh3tZ
	QZvKhS6VmXb1T3WUuAbJNqYVnSeU93VsbWw==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0mv11s7s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 17:09:02 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-33713e5e6daso138629eec.0
        for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 09:09:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794935342; x=1795540142; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=VAfyAkYxyYktUSO+F60vOX+g5stCoRKsvnWPeKrgISM=;
        b=R34SvqJkgmldOrBZLin3eH9Rx1JAtQAtPmQrFsy91mZAvGNyqWMUFectI5DAF3Vg6b
         z+q++xN9pHSatGU4g4XWzYQFIqMu8aQ1h0gItBXFhk1LkHhEqbtxN9b+e4yOHp99AKsc
         GglvDe6Cxk5M9xpcvFIH+Tbo5t1RY1RaxoJEP2HEZh5XvuulMEcgj+98G4i40PLD1+Pa
         Nh56qYG+SQYlPonimAlNqrQljjoZB7ECUR0sI+eqdi6bqyEr8dThwL8L4WE3Ea/+Pa8l
         vs/CfwGt1yxFGZOvbIxNnwjbSmecjh4BLnugVgp5eVvG1p/3ZXXfVhxFf7ThVgwrCf5X
         iXVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794935342; x=1795540142;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VAfyAkYxyYktUSO+F60vOX+g5stCoRKsvnWPeKrgISM=;
        b=uRt36chvhUUeRNcqunYFw0rcp/ZCswLCFLpbedSAtXZh7UhnowTTlY0RMPcp7WkcqI
         gaKpPZmNxM0evGXwQpjUwETVbw4hu7qiMvrke2/goEE8IK4LxfSMqHvCzWCogSxlMd3z
         JJnDvzUstAsHe7RCQbk0lzLsvXFpeBh+fDaNJhjYXovMb6GREmBOtPYvtpRMwCGDo5SO
         2MmyPpbWE4aqDuT+srlsmvQIjl1BsmHgmj4p6dzCCXcavQL3TxgYkqR2lBKF0rjzMG9R
         Gh379gDn8WnCRmF16bUfpYlC6gyehMFChlbycf+WHuuDaC0BSvtyMpYbyoqE/nMXsjuk
         M74Q==
X-Forwarded-Encrypted: i=1; AL+hErFL6mufoJrbUowCggMfIgOKgKNokYlGU7OXHwc07AG2txI7XVHb9PlLshd547bPP/Cn6lpKGZWhqHFN@vger.kernel.org
X-Gm-Message-State: APuU4Z/QVmGw6sy6xLI6fthQMxb2uvHWCgTFA+TjZR2arkOqYz0mDXrY
	kqsTeb76/LcB9da2DvpUtulajI4102fUFItM1v9YDk5O2XdXBtgLfdCaasa+YPZufUTs5SD12YP
	11MbFMd0FeDzJGSKQaxVdeKJW1tl4xXgIeQ39rOnC6KdiU7Wno+Po43t239qhKylS
X-Gm-Gg: AZFdTZcTEp0tedkv3cV+gC6cAdclj9MH3CeSnKvXCcvLYtcD3THnjkbacHQkNWmYWrC
	8BnU0nb0aeyf0mDXjPBcRq0sIkQqj9DdQv2sS4EC0tYVcZ/WX2Jkx026EpyxSK86Uq6drD8oBR4
	zJfJEVUVYkPwskYFxYioCvuY6cNFf6fFRHdABOZPqKdK+T/e0lBp7cuavUFrrDugzx83LNUlT2p
	7Kbjw7v5HlDvkdo9c33OemFVeGBj5G/BaExZoBjzV3ac+O+JBhuycyILAeXs2DzzMWb7cyPhAwX
	M70M38TK2G7SRq/J9AVhK83XztMAIA3zLMaHV/4bVRdJcDsLdJrNosDN69oC41u0WHDwIktXI9J
	o17fV98iL9eD0MOt1Ts9hx89JabB6y6RH1zEiVe8yxSdz/0Acd3OXWOtFNvMMPpyk16vKYrhvgz
	e/
X-Received: by 2002:a05:7300:d210:b0:382:6868:b1aa with SMTP id 5a478bee46e88-3828101e947mr70408eec.21.1794935341291;
        Tue, 17 Nov 2026 09:09:01 -0800 (PST)
X-Received: by 2002:a05:7300:d210:b0:382:6868:b1aa with SMTP id 5a478bee46e88-3828101e947mr70377eec.21.1794935340795;
        Tue, 17 Nov 2026 09:09:00 -0800 (PST)
Received: from hu-akakum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38116afd7f7sm8859876eec.17.2026.11.17.09.08.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 09:09:00 -0800 (PST)
From: Akash Kumar <akash.kumar@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH] clk: qcom: gcc-shikra: Use retention for USB power domains
Date: Tue, 17 Nov 2026 22:38:30 +0530
Message-ID: <20261117170854.3257471-1-akash.kumar@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
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
X-Proofpoint-GUID: bcXtEw9pXfhFLEMGHgfesqs4gWusFAPs
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDA2OCBTYWx0ZWRfXx5Tpf1UfYmd1
 /tIVp1UkuN8rE3VjX5tiiopoR4IOhzF7he0hmch25CrmmLOxO42z3AdUBMhfm+htsUa3iiUW1Bx
 FTaO8kVrt/G+oH0gddNZgWaFS3NBPGw=
X-Proofpoint-ORIG-GUID: bcXtEw9pXfhFLEMGHgfesqs4gWusFAPs
X-Authority-Analysis: v=2.4 cv=Cuwq4X4D c=1 sm=1 tr=0 ts=6afc8a2e cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=iCUNF_J1gHVpXzmuRuMA:9 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDA2OCBTYWx0ZWRfX2VtJzrVLHqiz
 IDf4sdJDX7AHiMMOa/jaLJXEiol5YbND4Fyu8bDbhVIsWqQUnIY0n8Wd94i25TC32GDM2dGHpsg
 dtze2YxeMnUkEBILODTEc5S415pxksw4bS+N2EFWntF+nNw7l7Xb7fmOL3rH8UgAUr7uviqpioT
 TeO6HXFrYUhAfabwG1kKeavEytljyv9OamUeyjFTSF6/dqHBcbiMKKTMmZAClGR0L6cN5mb2NMf
 ygSVtPbsmInxj/j/BlWDanxbLA57e4kZfpTTMsVFopJPXYwpdGMH1bLPckJ8khFYG8uANu5WOSO
 fUT+JoLQcm43Rhh2KUgrYhwtynZ+XRMS4GleOS7Sls7ximGPsvNX4Rc5e1OMyMfjUwE+EHfhmyj
 zbzTV2uqJhNAjblWGFGuG1LrZDiDmPq4RDmnLpAhdOMjPCXHQLW3oeyupR2mHGeNl73QXVWlLd8
 EIAtV+Q5nBHunLnBQKQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_03,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 adultscore=0 clxscore=1015 priorityscore=1501
 spamscore=0 malwarescore=0 impostorscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611170068

The USB subsystem does not expect to lose its state on suspend:

  xhci-hcd xhci-hcd.1.auto: xHC error in resume, USBSTS 0x401, Reinit
  usb usb1: root hub lost power or was reset

To maintain state during suspend, the relevant GDSCs need to stay in
retention mode, like they do on other similar SoCs. Change the mode to
PWRSTS_RET_ON to fix.

Fixes: 01cf3e27824d ("clk: qcom: Add Global clock controller support on Qualcomm Shikra SoC")
Signed-off-by: Akash Kumar <akash.kumar@oss.qualcomm.com>
---
 drivers/clk/qcom/gcc-shikra.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/qcom/gcc-shikra.c b/drivers/clk/qcom/gcc-shikra.c
index 13c99a883e29..4f860985a8fa 100644
--- a/drivers/clk/qcom/gcc-shikra.c
+++ b/drivers/clk/qcom/gcc-shikra.c
@@ -4049,7 +4049,7 @@ static struct gdsc gcc_usb20_gdsc = {
 	.pd = {
 		.name = "gcc_usb20_gdsc",
 	},
-	.pwrsts = PWRSTS_OFF_ON,
+	.pwrsts = PWRSTS_RET_ON,
 	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
 };
 
@@ -4061,7 +4061,7 @@ static struct gdsc gcc_usb30_prim_gdsc = {
 	.pd = {
 		.name = "gcc_usb30_prim_gdsc",
 	},
-	.pwrsts = PWRSTS_OFF_ON,
+	.pwrsts = PWRSTS_RET_ON,
 	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
 };
 
-- 
2.43.0

