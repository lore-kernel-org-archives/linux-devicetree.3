Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795019033;
	b=CDsEkh/Gm+TfNY0dHak+rla3K2FsZuqRJHkd+KAax91Cn3zs51JOKLFG9JtBX4zSzkHo
	 hpg8Y96kyVmQsWNftrm8S2oT5mRNCk2bhYm+CC3wK/dShgpnOf49ctygwxwRgSdW6ScIv
	 cn7CFF3xK1jDeEg0N0qMMYPwOhy7nY+KNI8khLu6+r/PgElbwpuXy5QXqM1zakGIKmx4V
	 xM4ShYOpViQgjOKAkgxd+Y71wh/tP562RfvaGCLPYmv47yzMNqp4t/sk+juJcboqY257d
	 rrBGPheMnbczfVtbFbUR9Iw5S8gs32XW+I0oXzymKTkHtIX85nWiwkyS0nYyKsFjZFQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795019033;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=gja9id1+VOW1RNlfA96nCbcm7qe2Qf7QRAaccXjN1QU=;
	b=xVfiL0yprGpbahnKerC0+9zR7Vtlpog9GFNbyyJX0qLyVoxj6ojJxpJc2WxefIxahVZH
	 0bnS4dH/XeRxDkxxp+BKp56OlQtj6+h2n6QjipvQ9W0tW4fu0f1IiZBvzdMwVKIPuvkfu
	 AB6xqENjZ7fFGtBcGg0fCjZHQO1c5isgX0Zspl5ZiXP9dCkT/gc6mYVMWxx5N4R6rEYw0
	 8jVvwGrawY6zqHZwGOEHQukabY/a4B1fwZnuygTmXepyeFaRboIe8wR1YCXLSup8YKzCF
	 78g/Rt++8HLrUpkjRyUShRFPBx7W/a83VsIWwpjKYLvooXzrPeeAh6RuwyyO4aOR0HQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UnQIASL4;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KqjOXKK2;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B129606A32A
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 16:23:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6B129606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UnQIASL4;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KqjOXKK2
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AIGNYlI3848068
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 16:23:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=gja9id1+VOW1RNlfA96nCbcm7qe2Qf7QRAa
	ccXjN1QU=; b=UnQIASL43i2iU6Q01eD9Hmky0gd5FzKSUjCz9YoNvM/zIRd0Bmp
	8aS2V/oPSRt8TZ3IBh+gAGPz4S544Indo17t996TZvOF4hfno7u0z57RPTPGXHzN
	LNvDcb6JPMc6e99acqFrLBEUymEevIBJJRDZNTooM61u7d7WzFSJEdAiEZRwaxge
	xhl5mpiyKgw39gq9gNI30C4jfronNINTpp8UJoLg2EAWfcIDqKbi+ueHe68NGXgk
	jBiTHDlmqN2ae4cFZjP7C5ID5NKftsyysuXSVLK5kOZVnLZjVilcZvr0OARIALUC
	jqhFyHLOURq9v998o8mXJVc5nFQiKEcK8BQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j1fgg002n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 16:23:51 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-94970ad532bso199180685a.0
        for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 08:23:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795019031; x=1795623831; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=gja9id1+VOW1RNlfA96nCbcm7qe2Qf7QRAaccXjN1QU=;
        b=KqjOXKK2oTxDJBol7Nlh+NKBaSyTHZ3Op0rfFmjb2rUVyVjMBBrrHKdNofS/Gm3xiR
         UbB/0E/2VOKVW/T170Tii8rP2IdahA1v938SYjf9723heP2Mo9+aqy/qHeJ4xuouxPVH
         9f+PA77z7YhnzeoT4tV7I6QvHMC4Q6JJE/Dv/vWzIBaAmXmYQkaemhddDNTNZqLrjjdB
         ra+W2wrd290auaNkfC88Ose6D27DlNLVaq8Uhnu+YBuyWZZ+E/icawvRvPd54TekK+mk
         WRDCrjmGZM1mW7A+q4kZbfh82LOLVgHvCIjAvNabRxhJWYU1/Uns0xk1xQk+gDhuQLpC
         gjEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795019031; x=1795623831;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gja9id1+VOW1RNlfA96nCbcm7qe2Qf7QRAaccXjN1QU=;
        b=ztWv4yo3My3afqQJKzrdpO8syH87omR8+W+JVTlSrXGbzL73EawHDd5K8/iSgYCv4m
         6CiW7Nx7qC846bxsl/JiKT3B8mD93c6DMx+xNN/vQpeKUcoB566zSI32g1ZYJgLzbqEc
         n8WRgS7o3jCHfJr0bN2nNRQ1WuksiejgEBoccnKUNBjscgwRQLWXTFF5ks83j//UlBUY
         O6lTn0osL9uB18CzstVdWz+zDvX4XPvQCFVQIuAEIKwle152lyD1oqCfY/Ua+DPoHKrm
         ozVCTQIAU88KJ3oQjl7olvAhBIKU86WBVDVnT0l43NHT0tMdAz6B0IxejJ3zSKFgL6Yr
         +gzg==
X-Forwarded-Encrypted: i=1; AL+hErFdMPtfyutSu5FOBENdJmgJMIptaLlV1KX881gwHPJtAUVBGQCHt86biZRkcRkqNf/TctA77BJEKFl9@vger.kernel.org
X-Gm-Message-State: APuU4Z+sjrAyPWIJcZr3XlnLMPba3j6m1dXOKFIabJWPQxvv11bzIY2l
	qyXS4luiIgyUvPC0oh3PG4NIWrBmmrKARhdY7u9qSzQgT0oid8SEARLAhWmnxNeYHmufoHW95iW
	TfgwMvkqGgrYI7Gtb4ilfanGPIdzG0tFm3alJVl46iy1ik+7dPwgqJjYkO1n4PjgA
X-Gm-Gg: AYBFou2XSwDUxW6jZ8D+jpntCo2iSsK4e/HMo67Y+bIQiKLtKqh1BBB++VlSA6huV6b
	jMFPdsi+JkEHRg6w4v2SwxiFFwfM0Hjo0l02duPGVn4RAo3dk5mBw1N3zArQb0hOlqVcJ07kbA0
	Bu2eO18yhpbYDu/Ieqqfp0biQO7UhdAa2ZgyoIsdo0msEJhcywHG0UqeB38c8Tsz2Cy0TbD2pUP
	/hlVpVigc+6AuV32NxM6g04A+0kKtxLHxSJMDoCSBb05iPpJzob1RXtBveNT0T0YUg/i1772bcC
	gdnSoR0etPeGahkddgEYQ5zhdYggo7XOCmWcvtgdb2CYb47UB4/VGVQbPYQZT0dDH5E40cDk4KR
	JQEvp9sxy+2DrCuV3QpCKHEykhIidiSvvLBWFPjEyhYSyjkz7QUe0QkEn
X-Received: by 2002:a05:620a:268c:b0:949:698f:8bea with SMTP id af79cd13be357-949996896a6mr571641185a.34.1795019030534;
        Wed, 18 Nov 2026 08:23:50 -0800 (PST)
X-Received: by 2002:a05:620a:268c:b0:949:698f:8bea with SMTP id af79cd13be357-949996896a6mr571635985a.34.1795019029889;
        Wed, 18 Nov 2026 08:23:49 -0800 (PST)
Received: from t14s ([195.50.164.66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb7843bd79sm153190055e9.14.2026.11.18.08.23.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 08:23:49 -0800 (PST)
From: Hans de Goede <johannes.goede@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: Hans de Goede <johannes.goede@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH v2] arm64: dts: qcom: x1e78100-lenovo-thinkpad-t14s: Fix touchscreen power on
Date: Wed, 18 Nov 2026 17:23:43 +0100
Message-ID: <20261118162343.16197-1-johannes.goede@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
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
X-Proofpoint-GUID: uj05S-lmiZWI31cbh3LMrPwytM3JZoON
X-Proofpoint-ORIG-GUID: uj05S-lmiZWI31cbh3LMrPwytM3JZoON
X-Authority-Analysis: v=2.4 cv=fOSsTpae c=1 sm=1 tr=0 ts=6afdd117 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=Jk2/TV77q6/E6wQq2oQJxQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=rYM_yondQcVyUL2waWkA:9 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDA2NSBTYWx0ZWRfX1yze0guKE2gC
 tJCHBAr32IFd7Qh3QiGzWZUjQsO1ItGrB3kHekSFiCrZtZlnJEnvDvGDn6DpyI4cjxE9ZZznkm8
 3+ItUv3tHm/0p2vZmOeYvaImOyXKV8Q=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDA2NSBTYWx0ZWRfX/q+SQg7gNx3i
 OW1Mu9nPmb3d3oHhlwat+lEtBZ3jf7zxiSxBtAQNN2sc382WviMF+AX4JMJ1qOc4owdWy893Lux
 ZxfeNCV0gaU6FH3NKqUXkgA6VBpkkpTXvGxL5IGyrv2586ELGl2iO+BAs/2glMlKr/2OPdCLdQ/
 aBt7jhBf8J7caBg9b5PSBuoCDvts9A69V0MiaYM52DP3X/grTXEDpaLaDX+tRdVK3KEICv1v0us
 jDXEkhHDp38mC7vGCAGnAKTBTPRODrQk9F7Ufhya+VlxK5sN3EtzHZBLMNEfuH47Vlai0nvGfzM
 to5IyktQ5fQh/K0svQSLMwzEkW6LV4xQuT7XznL48szuVA10WUVDzHVbEObxRgI8Ljoh7KA5NoJ
 OLAHz2ovLjz7xexkHxTx2jtMdzG/bzXVr1GYiKxnBft70bBVmmirvFwfHyM2eJov2Wsf229Jo5y
 uyiWy9gRSZiiJziH0Yw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_04,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 adultscore=0 impostorscore=0 bulkscore=0
 malwarescore=0 suspectscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180065

When the i2c-hid driver is builtin the touchscreen on the ThinkPad T14s
fails to probe at boot. When the driver is builtin the touchscreen gets
probed immediately after being taken out of reset. At this point
the touchscreen is not ready to talk on the I2C bus yet, causing
the probe to fail.

The touchscreen on this laptop needs a delay of 200ms (taken from ACPI
power-sequences) before it will accept I2C transfers.

Add a post-power-on-delay-ms = 200 property to the touchscreen DT node
to fix this.

Fixes: 7d1cbe2f4985 ("arm64: dts: qcom: Add X1E78100 ThinkPad T14s Gen 6")
Signed-off-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
---
Changes v2:
- s/touchpad/touchscreen/ in commit msg
- Add fixes tag
---
 arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
index 7c9424248120..16b25e596f0d 100644
--- a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
@@ -1349,6 +1349,7 @@ touchscreen@10 {
 		reg = <0x10>;
 
 		hid-descr-addr = <0x1>;
+		post-power-on-delay-ms = <200>;
 		interrupts-extended = <&tlmm 51 IRQ_TYPE_LEVEL_LOW>;
 
 		vdd-supply = <&vreg_misc_3p3>;
-- 
2.56.0

