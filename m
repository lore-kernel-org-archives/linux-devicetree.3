Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792485917;
	b=cutU3mvzItKxTQUS8BsGm0FzS6Fq219fFdCCAki9LIMDOLlplBUtH1H4Ryy13oxsE+DU
	 2NjacnorProbOgRuYLkf7141ASZLZ/uNvorXmvuSSwVDhAGl/4x4X6ff1IxrbZZZERTTV
	 p8eZZyjv11ZMm73qkl0T4Q+HtHbakG01ByHL/xveAgxM7+nmJb1noOLzEwpTsBYAQuMeY
	 7Tch8fPCQI9msU+5q5pvbXsvr1ONrNTwwiz7wRkiM6fwd7eo5iUk4Pk652A07z97t1B3B
	 MxRAnk+DP8OsHK3bNS8WMp3hsxV4umHNGFtAJ4xf46yL5vcOWCDAEOx0MK6wYApMQUQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792485917;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=AVi0JRv8P3+r3ZGqEi7SkYqg3/i2og3k0aYWvl4OUjU=;
	b=gc7cqfhVnp9vl8Urvz0KcTTLdKgJx6CBRJTMK111K/7gcvIkJ2Pnh9wFfAK9tL8xnEoQ
	 75i9GA3bbZ+RvPZXXomr6BhB7NQB7TYlU+o38rF67w7wpMamTNfOxUxnvVUIqXPkopVWY
	 xQJlkmeJ432sWzt18/IuNXzfnf/lGB8vbbfniuQS0nuVJx8I9WOlfp8R4uJrNINXMsit2
	 IJ/NIj1CA529WM58yJ3pVZcXtZ/4dORpCF0Jj+AgJmG0iuGMX+2QHu91LI85ZoRak+k8A
	 Lo/1JjOVdrq0uK9PBzCV2iLT+6J8gMrXJk7b+ODBk/oeAew0pbtgekN+OmOPOuWriHg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=THWclgoC;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZlNdjfin;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 315B9606A32A
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 08:45:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 315B9606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=THWclgoC;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZlNdjfin
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69K8HZ7i185852
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 08:45:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AVi0JRv8P3+r3ZGqEi7SkYqg3/i2og3k0aYWvl4OUjU=; b=THWclgoC0Obg47eO
	/dvkdhkClTknxpX89zTrsnQSXWyxpF5HxnEaRYD8Pwr/RYqQtNW1QaNLJUyMo9AI
	wp93yW84odpAV+y5FpIDHkNAyBg+I+A3DtDOFQ8zJ2QHSMFVxfQcMzAIEvs0kV+h
	9PecD+L0OvdMO1Hytg8sQhuWJegLCJUvlmHuf5A8yZh8KywK6M2I8esgP+3o9spd
	Zb1Wi3G44EQGZzID2tgEL4PPQ4VeRnaucVhqKLoKgdY9XpWdNAzRr2iQmD4j32S7
	lu0rPSGylQwco1vrXZPy8KymZXrQm/3kfVz/HHJzmp0oBJd5DcfrZp6YL468awvg
	HNynhA==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5nspe6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 08:45:16 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-9179a2035a4so9649066d6.1
        for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 01:45:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792485916; x=1793090716; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AVi0JRv8P3+r3ZGqEi7SkYqg3/i2og3k0aYWvl4OUjU=;
        b=ZlNdjfinE4hnwiGBwU5RDMyxLXuTAUA7sBAze/hbRlpR9N5+fvsv2BZehAN1qNH/ag
         eeyqb0feh9SCd063hqflQ57deUzlFvLfv1P9FB66R7tZ1i4K6+/xecaJNPJwTRcrFWZD
         PPHrnoJ+N29CvKqcY3sfIA6kXB+KOyAW3C/Vq/Jsue6Oi0t48cExGzTwnJsUpuAbtF3H
         SCEz+fQ12EapxwCK6HfCbQJPHDEiuEywevpu7xmZBrAm6bCEsmvyfGbGG4Wy7DVQBHHq
         +ehyhNx/SVbUYNWJguXbxYjaBbL6smhwwP+x6c0oN+1CWOOgDpxgTQ9aFYT+h728Awju
         dBGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792485916; x=1793090716;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AVi0JRv8P3+r3ZGqEi7SkYqg3/i2og3k0aYWvl4OUjU=;
        b=heLfRJ0blqtxThRf7OI0wAh2HYswZ0maBYfM83Kz4equaV1cGECLfhz4lugJLXt7bJ
         z4d4uicPBvdT9vUiEQzeObmAi0wk3pnkycn118TlMrUtFaq/U9A9dI4a6XcHD7fjBqaW
         vNMPC2hGBvYQ4lOa8SEHTuvn/cYHWuMoK/VjrOsOZuIplK5ZhdHDrZpOC0G/g/rlIi1P
         y8pe7SfWoitIL7TJ+St0sTG/EkWrtxWhZBPqSz3JxCGIp+lnILfh/wiBH15m64pZJJkY
         T2Ps6tUIflnG7hyP5dYN/zh+haFADwNnP36xkPVnQx8vqxAZWdrznWI2Hzolj45TYFA7
         /wqQ==
X-Forwarded-Encrypted: i=1; AKwUvBwyIqUX+plx7RYMzurIry86sdqmgK3vuExFfkV5ELlw8OrVe8qp6fKTQ4Ll8ooGROl4qZMHqeSSmNMn@vger.kernel.org
X-Gm-Message-State: AFq9FYLvUKTej7Y7bqaAuMfDkJpU0rzUzPaK7ff1EAcpSx3OQ9xP3Wh7
	ogHrUnusZOS8Fin5rtVpe//fMjv8qrIgMeafZufK8VMSMPt0+eXxkOQeIQhsVWmDGmdZwfCa/RH
	xQ3fE7cUBdpCqxsvi3L2XXJ0nLTNQjvevMQ7q6jTgfsqrU8dVZDLgzOYPYgE4L6Nb
X-Gm-Gg: AYBFou1c283eohZdrjTPk7/6z/U7lfUsin82/Rgbg3SK0yIUiecZEVNikQyFFZhZUgZ
	krmF0J8QVrnt/mKoGN3iBWPNyu91ronlP9luXoprFqUrYGFpMiwSiEdeZnFTlXKN4OpzD+hwkmJ
	zuQNjbPwYOYuXuT7dUcDjeY/JEtyz1jA+YlvAXPZqiKn6ZpwHeyRQB+HIj8r+mfABNV+euI9NzA
	9dDUpxFd+PBoqW9fH04Kqd07D3FJ+ohAbyV+FO9s1//6xYBhK55c3ml9Riyu36vCs6tnD1yeCAZ
	wa2yL8E0ZFlm3DInndmSIwXrS4clBs7fVG32+b7pTBFfOXxB6Y1YrJ40Ni6odsSq+Outs7uUhKF
	Soguf5G5WS7spHgjERPF0wvlNJqsqBXT2fYCJObxUE33QtevnhK2l5HQvLKG5CowtpjqIOFZ0QI
	OHcbwUyt3G2smF
X-Received: by 2002:a05:620a:4147:b0:93e:618f:8127 with SMTP id af79cd13be357-93f4c45172dmr225009385a.8.1792485915581;
        Tue, 20 Oct 2026 01:45:15 -0700 (PDT)
X-Received: by 2002:a05:620a:4147:b0:93e:618f:8127 with SMTP id af79cd13be357-93f4c45172dmr225005785a.8.1792485915081;
        Tue, 20 Oct 2026 01:45:15 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ab20a8b3a4sm27637231fa.1.2026.10.20.01.45.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 01:45:13 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 20 Oct 2026 11:44:52 +0300
Subject: [PATCH v3 1/2] arm64: dts: qcom: sda660-inforce-ifc6560: fix
 ADV7535 interrupt parent
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
Message-Id: <20261020-ifc6560-adv-v3-1-5da1a33fdcbd@oss.qualcomm.com>
References: <20261020-ifc6560-adv-v3-0-5da1a33fdcbd@oss.qualcomm.com>
In-Reply-To: <20261020-ifc6560-adv-v3-0-5da1a33fdcbd@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Marijn Suijten <marijn.suijten@somainline.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1412;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=DmTKjB3QIqYbObmXidiYRT4oSJp1+xTSHaj7ZXe8IAI=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBq1yoUcZCLmPIuiCrrKuhPYzhaWXWm+UG7avV5v
 UZ9PZHWTv6JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCatcqFAAKCRCLPIo+Aiko
 1aPzB/0RwIyXb9VnyXDj66X62KUv2xFp4PEQijR32P+50x4bbRmxwUb2Oa3J5DXhwzjmdNTVfFz
 k21re3WEGi/kD/QfLVeRN+mozxvL2wnt3XUBjz2Mg6bCRGzvPxUkl9ZLbo0Qtt2pd0vShpHyN8l
 ySBwpsiVtIlCNWcdmVUYEZRsxIndW1GrnW8kcSEQfCIh/aZhWQFuLa6kZDA/22zheM6aHSCCxRU
 LvqGBmnxmYM3s4rTGQndRFSUH88/tAr+sFHEJIVtB+nu1DklFpuCeXsl+O8drvzMTLIvWWR4U2D
 GNQLOtibvO/yj3+4ifeAcYetNbwsg1Cnra9TQGbnVsCqovFH
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: WAcQv64dMmw7EIxKvzaORlv2Z-C0ZEt7
X-Authority-Analysis: v=2.4 cv=DZOCOftW c=1 sm=1 tr=0 ts=6ad72a1c cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=nq2omAUuIs4UQwLT8rkA:9 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-ORIG-GUID: WAcQv64dMmw7EIxKvzaORlv2Z-C0ZEt7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDAzNCBTYWx0ZWRfX7a/4GG6bsogF
 4M3vr3vwLEOrRXXss1zYxpnWmfckv2/nzn07xGqc3zynRmYbd6iDv75hYai6g+EmGf/8NySkb5h
 xPKPUfNcZJY/t0isf7pvqJqcx6F4/NPL8Pcw/iFt21WHCSfmWzK16MQgDdps0f9W2iwwhklEt71
 4VYvY9IFczqqGg30fAyH+cW5SUSbG33Ix3OUoWWc/fyH5897kRrDgL0AEEulD+jZYyBpeCPATdK
 VB9N5czRwv3zh2iPfA30ibuBSpJ4rX1VAgikiObajFb4zwmev3P0zEnTJTqUJd5eMITPXEKQVku
 tYd1sIMCdzVbpuHGR71BEpHq7mtByjqv1AB0bkaa0nz3IjyIwvI549ADxPf2L8Y7YHYNLB1uD3g
 4zQ2S7eodPnGj4C87x/zfk7wCxZdLU2vG7szkv7w2YftON+ge5ri1PfMF4wj0/qYkEiIdhpLCF2
 9rV9t7OVK3XPE0htwrA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDAzNCBTYWx0ZWRfXykLPDwKnGMWS
 ROEPMKcXv2mCvrv4Kc5PJOIOC4uMuO9m3ADLJpjaGcFPgbvC34a1st0Awxd6/AqAUgrGEBsst6u
 za6lhRsUE+XGadiS05lC7dZL11u22ng=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 phishscore=0 priorityscore=1501 bulkscore=0
 adultscore=0 lowpriorityscore=0 spamscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610200034

Probing the ADV7535 HDMI bridge fails on the IFC6560:

  gpio gpiochip3: (800f000.spmi:pmic@2:gpio@c000): gpiochip_lock_as_irq: tried to flag a GPIO set as output for IRQ
  gpio gpiochip3: (800f000.spmi:pmic@2:gpio@c000): unable to lock HW IRQ 10 for IRQ

The bridge's interrupt line, HDMI_INT_N, is wired to GPIO11 of the PM660,
not of the PM660L. PM660L GPIO11 is LPKs_CTRL, an output which the
bootloader drives high, so gpiochip_lock_as_irq() refuses to turn it
into an interrupt and requesting the interrupt fails.

Point the interrupt at the PM660 GPIO.

Fixes: 34279d6e3f32 ("arm64: dts: qcom: sdm660: Add initial Inforce IFC6560 board support")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sda660-inforce-ifc6560.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sda660-inforce-ifc6560.dts b/arch/arm64/boot/dts/qcom/sda660-inforce-ifc6560.dts
index 9e14f53b552e..eef4cab8c200 100644
--- a/arch/arm64/boot/dts/qcom/sda660-inforce-ifc6560.dts
+++ b/arch/arm64/boot/dts/qcom/sda660-inforce-ifc6560.dts
@@ -167,7 +167,7 @@ adv7533: hdmi@39 {
 		reg = <0x39>, <0x66>;
 		reg-names = "main", "edid";
 
-		interrupt-parent = <&pm660l_gpios>;
+		interrupt-parent = <&pm660_gpios>;
 		interrupts = <11 IRQ_TYPE_EDGE_FALLING>;
 
 		clocks = <&rpmcc RPM_SMD_BB_CLK2>;

-- 
2.47.3

