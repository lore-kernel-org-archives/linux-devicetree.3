Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11AAA3BE622
	for <devicetree@vger.kernel.org>; Tue, 21 Apr 2026 10:57:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776769024; cv=none; b=fkI8dy22ayxdz/iNSjcSQiPBz1XwyOL/umxHMJcHMqkONKarcxAGLXYr2f4QGeM1eNEswluR0Q5SlTp9aq3GH+N+/VUXgrQXi5mOif0a/dYBwXv1AnQF4Gj/SOu+a01w/Ek5963T/qOoVypSKb4HcCaRDSS9CK9gLJsGnrtOots=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776769024; c=relaxed/simple;
	bh=T3K0UqY6Cu5YfSXiRIl7BiaaPevFsxba0x8aWptwzq8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=e2t4rwX3y5LwPTgM1rU45u4HdxRRexxQsRGtgzeeDcpkrzEXhGziCkRjwpKx0QoCELjJ3BJ0AAAStYMQw+ctw+xjvQZTuTmWwK6EvVsZHdTZSnyj7FcY65WPgbGrLAcYYpZ0BTKSB3vP6ujH4wHzcp2HFymp41M8d0FsfIyxc/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PG7nuSL1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ajxoUWka; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PG7nuSL1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ajxoUWka"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63L5JkhE1011843
	for <devicetree@vger.kernel.org>; Tue, 21 Apr 2026 10:57:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oT9Ij5h4fUVAikSz23Cjq4bChK5oWSJ3cw6Um53IjgQ=; b=PG7nuSL1kmQwOD3q
	l2t7x3v/kpsHd8JZrLBF9oHReORPxEYr+xDImSgm7uEfBTSJrsrAOYP05J1Jctl0
	OwGDbGx6A6OcQY4W589D5xoYb2Ae4w4w7JMPlO4XKjVzUaND72XAwO+MobQNtal6
	S8+Ot+S4vNIkN2b8z2THsrEj5fO9Vhg77flBiCDvJXZTVtbkN0ojccCfNGjphMSM
	i+LKT1nB7mSrSjd+JjxRB/Q3K6+WeYKYGcIha6/Qu9zoTQZY92Dj+sE5MdpAhA+n
	/FcI11YneAkz1/gvaX5NgoJrYpqg9wW2+/wPkpa43MWWcwpo6L6mBnL5iRHBPloN
	PeOFsg==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dnt902twa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 21 Apr 2026 10:57:00 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-82f6b984b3aso2278819b3a.3
        for <devicetree@vger.kernel.org>; Tue, 21 Apr 2026 03:57:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776769020; x=1777373820; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oT9Ij5h4fUVAikSz23Cjq4bChK5oWSJ3cw6Um53IjgQ=;
        b=ajxoUWkaQxTvO99y1QtMeqDJk8nG9f9wTWsiDpal9SaefzA7BaEr+9RcnSYVkMDmJE
         cMaXn2Ij+qH3bEYK25FyqldhomFrx9oC2t0oBxKaB2/nvMP+U2t9R5Qg2MToT2Raz753
         +DFou3cZwhpWy0wXZp7MpVmVeibJ30DYHTyGCQhkxltpmkJSqKRKdem2mqKjCPfp3reD
         Ll5XHh5haG0sx1EKiE/EpDENifceH9y+ZN2dt8MLQjT/CtyjEVyfEK90Voi4uHKelb1o
         j9UtjZmOFCR9O9A9kWK03t9msw88ZF7jLKH2dSlEzl2HwwGob2CecVSU75Atk+BqatEQ
         ceOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776769020; x=1777373820;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=oT9Ij5h4fUVAikSz23Cjq4bChK5oWSJ3cw6Um53IjgQ=;
        b=p9yRtyAi/mbLAl4m6Df6UBlqNZoHCwes2A9Qwtqb0Pa9MsxqQBKLvsyDVkkKCwlhQr
         jb8bNdmxdU6tiQhCQUK4PZwuERbj0EAvK+9/K79xebM87zDWwiZcmvHJZndwMVa2R+YC
         N0fn2p08UfWtOGDocpJtIskrCgxA5jEbw6eYRr1OSF7KJV3u1H1PHG2t45hJtfmwImKB
         HxxvW8B9uxFEt1aBK1uDkkGqOWGuMaqQEwTf/ltqgO4eDRbRHmcAk7gq+ohJ3VBKow7W
         ykrS5PICp4JGe/4vgZIWR+PuwqC+5ESdEzVl3wnYr2tPUwmYwrBW3kzT0mobFdFMctH2
         dNzA==
X-Forwarded-Encrypted: i=1; AFNElJ92LejPWsFIk6kPIBRT6WaJeHk4Dr6KpXTy+CZmNlFxZtHkyA/s+X5DMSmE7R6pOnVv0+NFH4oGP8BL@vger.kernel.org
X-Gm-Message-State: AOJu0YxNqK+yqf1z0DO82sqQTtLHPGbsm68Yl7uVfNDBSr3kubHWLbTH
	hx7EMwDCdjGnOFSL5nnmxOQoRs7aMAiXjMBnfqDe36sLiSvsRuIVVgz2+ymKOUokzihEf+rZVW8
	/NvHuGbZti2uc9JuiQEr8GSCwI4kb+kwZtWBN255gCKGcToOEz2du1C3lV6uu7Iks
X-Gm-Gg: AeBDieu5jRwytcDX88krBhB/Eb9YhbWIBZca3+mquujRb4piA57CFc7by+Uoxhp9LjD
	8Sq14xQJSzOax1awW/q8/xkR4HBv3wTHGtULYXnzLo0RwBNT81sGhVGbCgDj6DTMX2DJyFYGZDs
	tbPdyFB8Kw5i+iudvSR4Egc2w2Btoq/TJZmfxaR8xZV2bmSXHljIF1flc0phYu8PmA8alWXjK4G
	tfG6HLJqX8JII219zh+M+5A8DoLLB6EeU6ug5KNHzeGlXYIvuUIBnDYVC88OmFMav0PgB39TAny
	VFowFTd7Xm0PjGWp9mqpxhIuCYX/vLyrNy/W9UEzLsDizsusrgkFxiGgqwBUVocEXuxOcIUgwK5
	w0M0SahzJse6WaEYdbdjCUyKq9i6p7RtRZ7AjaI1svNQEyP5e1oG0VW8Lc9fOF0HqoMVUtO6zAK
	d5IjTCjMo9WQO3Cik9hOQ=
X-Received: by 2002:a05:6a00:3397:b0:82f:24e:6a50 with SMTP id d2e1a72fcca58-82f8c830359mr18924270b3a.10.1776769019642;
        Tue, 21 Apr 2026 03:56:59 -0700 (PDT)
X-Received: by 2002:a05:6a00:3397:b0:82f:24e:6a50 with SMTP id d2e1a72fcca58-82f8c830359mr18924227b3a.10.1776769019138;
        Tue, 21 Apr 2026 03:56:59 -0700 (PDT)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8e982fd3sm17077339b3a.10.2026.04.21.03.56.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Apr 2026 03:56:58 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Tue, 21 Apr 2026 18:55:56 +0800
Subject: [PATCH v17 7/7] arm64: dts: qcom: lemans: add interrupts to CTCU
 device
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260421-enable-byte-cntr-for-ctcu-v17-7-9cf36ff55fc0@oss.qualcomm.com>
References: <20260421-enable-byte-cntr-for-ctcu-v17-0-9cf36ff55fc0@oss.qualcomm.com>
In-Reply-To: <20260421-enable-byte-cntr-for-ctcu-v17-0-9cf36ff55fc0@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@arm.com>,
        James Clark <james.clark@linaro.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, Jie Gan <jie.gan@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776768976; l=769;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=T3K0UqY6Cu5YfSXiRIl7BiaaPevFsxba0x8aWptwzq8=;
 b=b2T5tvM7Z5dlcLvy0cV59xPMvqbTJFaBuQUUugkQICA9axzELwlpam1IcT7YKgFOLanJbdpiB
 BXYSo6uOlOHD07DlzveYRvN9Vd65yQfFfTQ0/1FxkUKmazkoBNJ0/oc
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Authority-Analysis: v=2.4 cv=KfbidwYD c=1 sm=1 tr=0 ts=69e757fc cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=gBkj9RZkAcI1HbXH1KoA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-ORIG-GUID: Xq8fv3E0awzdXcquIO7tjh3TtMUixBWQ
X-Proofpoint-GUID: Xq8fv3E0awzdXcquIO7tjh3TtMUixBWQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIxMDEwOCBTYWx0ZWRfXzKoS+bV26Dpy
 JJxb5Clyqy14C0cCn6Q/T0T1UPQewMhpyYEVGKf8KkPjkcCqPtlFhJZZB4bImMsk/3MOB3fY+iA
 O7haaxRhaR3F/3S+0iSo7pSfHJtCnOWng4SSTz4uWEGW8sEcNo1jlFxxuf8g2BVmchDBUn3U2pT
 16OeBrVH2jOhhFG9U+oQ2jDDBYFjayT+nPoUurjkyBPMuouKUsyM+rNVcl5GfNX9RPPw2J4HPN+
 Syz3Bcl8xR7hI7/OmrWGiTaeec7eRKwmimzXZQa26K6n5Y7iUsibE4Iqa7XYQPFup9OxICzssSO
 JWNfW0G69vgp/HXLYkXwa94esuq3QLV5XHO/LCdRq/L8/Nv0WZuL5aEkGv+Qk/dvM4uvMhtd01W
 ZumfeM6jtVSPtxw03RgoXNU/hifdSl+6O6kFWPQk3cEOYgonka09KqHxT202q6GJsCvwhfbD6FP
 eTgYEtRDObrtf8V/NIA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-21_02,2026-04-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 spamscore=0 suspectscore=0 bulkscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604210108

Add interrupts to enable byte-cntr function for TMC ETR devices.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans.dtsi | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/qcom/lemans.dtsi
index fe6e76351823..2cc855ec9759 100644
--- a/arch/arm64/boot/dts/qcom/lemans.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
@@ -2800,6 +2800,9 @@ ctcu@4001000 {
 			clocks = <&aoss_qmp>;
 			clock-names = "apb";
 
+			interrupts = <GIC_SPI 270 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 262 IRQ_TYPE_EDGE_RISING>;
+
 			in-ports {
 				#address-cells = <1>;
 				#size-cells = <0>;

-- 
2.34.1

