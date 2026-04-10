Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20A353E559B
	for <devicetree@vger.kernel.org>; Fri, 10 Apr 2026 18:43:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775846582; cv=none; b=HMlJsTly8L+kQAANEVdP1FMEzcirKpz4tWfhMa0iPoU2d2+KnFZfPGywcZzV8xrfTWDLRdLqM3wVjvhiHYDrnlhVIQxWy9e6x4r82/jHl2wOnwL+vPn2F0FS8kasWKESsim27vIm3mm1bDZAj6JuuqzFzlGvZU28d/VOf09vmIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775846582; c=relaxed/simple;
	bh=Cw78Fvu1F5ws7aOB3MvbyYaRExmSgGoqoG6EoMaJ9kE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nHXlb3lBHAAcW5ZXERzYiQd0hb/J1NaxNwq5rdEhglaENaePkSbnmMGRsfIdlKGzDgxRtADC8YDi++2O/ewA0WwnQTcsV4vgvQpADtACOQz0SsYxLp8FcHuxPaAwrUGTuIaHF+GS7mWTANXBtZCkQkrdSLXr0aSNM/JLfC8Rpfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hwm/+Nhh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MilxVCa4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hwm/+Nhh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MilxVCa4"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63AFJUsL3118753
	for <devicetree@vger.kernel.org>; Fri, 10 Apr 2026 18:43:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=issG4w+R9Zk
	qMbv1viAn5kb1NSiShYqlNDRgye4/Oxw=; b=hwm/+Nhh/fkxlKH7p2DlR7qFY5q
	ifMKvSuuUn3vZa1eBoeGhQDN7KLFBW3rkJUUYhbLjCUFcUnlMKP02jwLmJSX+QjO
	rDExbfSOZVpMfwYpkSGpWfqzUDVUpoqx048QolMRY8296qQs0RytNPPX9Qm4AxhH
	h7+J1iSztnHUj2JkngizqqDmkMXdVn0vijvdj7jIG3zbLh0wjyD+FC7+CnMbCIh6
	flk3RYe6ORa31ssPkSQxc8bEKkqwPyI50xWNMhWTTH9lXjOWVqAhYjw9F5nbetA9
	mtoGBQfwtOlznqTs/ugQPCkdJxPjpVaJvLqWoKVTfGi/UjLczGB1z3+/XeA==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4df3rarkph-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 10 Apr 2026 18:43:00 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-82cec239147so1506010b3a.1
        for <devicetree@vger.kernel.org>; Fri, 10 Apr 2026 11:43:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775846579; x=1776451379; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=issG4w+R9ZkqMbv1viAn5kb1NSiShYqlNDRgye4/Oxw=;
        b=MilxVCa4Yr//IBcKPk3NgZ3hwPxNU+Dot8mErfrGY8n5oXWykSCwQsm8ohUgNdgdi/
         PurX2C63k2Xrvh4x32905+1fonrLF4XDwaOYzMZHnxmkgAO1wqHiKLgSTIlv7dfZv6Te
         epKManILeX2ot4RJPk8JUo5jya9ZJcb09uFysgpIM86dGMDNdq1RGKXjGD9Bmnb3P4hz
         fCgVMmf9XUNU8uc0e2yWb7pjoQ7Po98sIyfV6MbZatqKNwz9U6LBG3+cJhHpkibtvj0C
         4wnCIHWwe5Z9IBP8Dv6KfDHUNnXQej5PZw5mASGlkLawCUBjro7iLInp+jwyVNvYFqGN
         PAzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775846579; x=1776451379;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=issG4w+R9ZkqMbv1viAn5kb1NSiShYqlNDRgye4/Oxw=;
        b=aHMXghi94BihtZy5rghpDD3NNR+BMtfFF+4sJVUn7H976QeY9wl8yEPSOsORXn4U8E
         B3KiDwR8BRIRAWXUl4swZwkyxFzMT3T8fkM0McxKyQtfSBU/ZF/f+Pt4nlwT1AT5GZJO
         WHMHtvY/BfKx1TUT/97avBpJ43enV6pPoFR053OzPaNtmcoMkHSzfMNq6dHsE+Z1s7NE
         SUCCSeUC0H8nNGxiO7ZzDFZ8Nsd26GNGE+PfzHPgw2o/R3oXvprjH5dfu6Oz1R5Bn2qj
         yQCLu+drrLGlX/3srm66vCPzbRrFoX9H3xLwPcmqa3p07pSwodwNxuVxzn2VtGJ96MAJ
         Aqiw==
X-Forwarded-Encrypted: i=1; AJvYcCU0p0xyQBOXBsUbCYdFeOpW2Fsewr/pMOtEjLxeJBrNiwafvZWL2ckvPbMpdebgFVemCEmXl9f//NH8@vger.kernel.org
X-Gm-Message-State: AOJu0YzbPqcBM45+jCaynWcpRiVnLNA5NzbNdjVWpk1rB16TAo2UAJ/K
	nExU4Bid4KJ8nTl0+av0tedzNGfqi8TcNyqnI31wJmariDfcFSCOUVtBj0oZB2gC6TlENadNyEM
	Qgbvh7Xx1HlpoPXGVdds7IXDQH5EyJ+8yQFciheFVuHamfxP3UwOxoUI6YDr8pNYu
X-Gm-Gg: AeBDieuTzqwksEPOonalLG+NBzx4XDZAS+ClfKsRBlVT6eDRzOX6F6z/pUySzlehOtC
	wrov00dGFwdeFrmwI+AJMTfyJGJLfi1v2tyD948sXANmEyHYU9zlnX3XCef9nAaDYXm6YLhHoZ8
	hb34nE1oET7e+v3LzOdvbJW3pyMvTHcS+9tcrgvQf0sKwYrZ+iFxkVgNTwRqb3fnoks8RElGXBT
	uw5vg9xK0dk9iKXMoMFKNk3Dpr4Nh1IIksPcf6GuBIUN5BDCwZ2tUlzUIN8BAcYuRI207jRUhNN
	8JDStGgqSr+/kqC8Uw+lbh/8jQx7jIMufWd680aiRK35RJFgQ9bjbQ8gjXPwvA4D+Jx65yOjnRC
	PW3ptz7hR9Bo/SIn5TFSo2+O0lY6SxB09OZ8+hnafDvTRfCCU
X-Received: by 2002:a05:6a00:4c0b:b0:82f:f4b:637 with SMTP id d2e1a72fcca58-82f0f4b0b7cmr3403793b3a.18.1775846579099;
        Fri, 10 Apr 2026 11:42:59 -0700 (PDT)
X-Received: by 2002:a05:6a00:4c0b:b0:82f:f4b:637 with SMTP id d2e1a72fcca58-82f0f4b0b7cmr3403767b3a.18.1775846578396;
        Fri, 10 Apr 2026 11:42:58 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f0c32e744sm4036922b3a.13.2026.04.10.11.42.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2026 11:42:58 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH 14/35] arm64: dts: qcom: sm8250: Fix PDC reg size to single APSS DRV region
Date: Sat, 11 Apr 2026 00:10:51 +0530
Message-ID: <20260410184124.1068210-15-mukesh.ojha@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=Vs4Txe2n c=1 sm=1 tr=0 ts=69d944b4 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=CNeQ3Hq6_2vApw1mA3IA:9 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEwMDE3NCBTYWx0ZWRfX3vKLecBLsFWF
 HarsNgZS/SsoJa1AVV6bBjPAnijhEZoM0A4gGcDXgQwOTVcafYfu6/+rOKpkljQYxDGpDKvPYLv
 Ai0nfYySldJIINz7NwnAIm9vAP65vf71GZ5pIP1Fq+1MM162EU0Fvc9KkVuALCmCRBR4hEDcM1h
 w+bVd7LSp5Jk0I0ikt+oYxUJxFg/MwLCHPI6e7cLOCVvBzv+Vmdgnjf5EGdpPGbMNhOZJA/Xk3x
 SKxwSv7FJW4ePC+/xJv2LyRJMJ6AYoWezayFPm7dQk/3oz8ZCFoaYJIUjAn9NXFHfSoR3t6PnqH
 zgEFS+5nf3zQlOleaN4w8tqGVhUahjx92NfrqoPv6wAz/KXDu2fgqVlTbV1Dtwb4USKk/GDrx1V
 lNWUYvQvAFnO2SwG6Jo4vFwph88CQIqQrh2yfn2y22DOhiHJKm8kIzsIj/5CGwGB1vPoZ/10rmD
 Izpv0Pr1SF6behjB6Zw==
X-Proofpoint-ORIG-GUID: wX6XCHyN0xc3xLyQZBpWSm4NaL5fPMsa
X-Proofpoint-GUID: wX6XCHyN0xc3xLyQZBpWSm4NaL5fPMsa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-10_05,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 adultscore=0 malwarescore=0 bulkscore=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604100174

The PDC reg size was 0x30000, covering three DRV regions. Linux only
needs the APSS DRV region which is a single 0x10000 window. Reduce
the size to 0x10000 to describe only the region actually used.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8250.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
index c7dffa440074..e6dfaf47fa41 100644
--- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
@@ -5048,7 +5048,7 @@ dispcc: clock-controller@af00000 {
 
 		pdc: interrupt-controller@b220000 {
 			compatible = "qcom,sm8250-pdc", "qcom,pdc";
-			reg = <0 0x0b220000 0 0x30000>, <0 0x17c000f0 0 0x60>;
+			reg = <0 0x0b220000 0 0x10000>, <0 0x17c000f0 0 0x60>;
 			qcom,pdc-ranges = <0 480 94>, <94 609 31>,
 					  <125 63 1>, <126 716 12>;
 			#interrupt-cells = <2>;
-- 
2.53.0

