Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 848D3516179
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 09:56:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792058177; cv=none; b=BSye47szZe06jykoqk4ZWZL/avWAlAB1cJHzNre87fAQzkgbMm7oiqKBmTTMFWkASrGmV7poRyLD6BrsnULvqOO7rVH46z7TW2sHaOs+Kc58/0lPZscYlaSsxTiKqyX5Qi0KwbFrnrh58itwAwilVVrnBTdj7NPZ7qvfBaD3gA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792058177; c=relaxed/simple;
	bh=M43+I1qLzwSuGMruCHHPPbA8y+igFXWBm9aSDkVCJa0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iqV6sQ7JSIcR5g/PsQiwgU1Ew7qr/0mAqoFzZ/2AoPU9Tcqn3F5LP/zYi2g85vx3gL0qZLSsPKMBnuP4KPZtWoyAL6uvQHIaOgcxlO3KCMgfwXo9E0mxLXF5Y+dFylFS3Te71rFHQcW00Q/IPz64WjkLo/kiqsiMc8lfeo0LScs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jZiqt8k3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Waw5co5x; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jZiqt8k3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Waw5co5x"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F9joV03408864
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 09:56:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	h0PtOjlnqWAv12BSE7gzCp+k2OZBkuTcqbhb6mVsDhc=; b=jZiqt8k3xLXpmDxI
	r6JarZeD9ZHDvjlXwnT6v8N1MGiTTsZ5erEQOq8czo6zLosqbXhna50Ax7UZi1Qb
	sQC/YpUBsxBj3PrZj+zuQtUGJyrcKqSdGo2qwGRp2xSHamGfqbAMd6tvmYKQ5E+/
	PgCMIXf/0e4gWIDDqJj+gi0ODDD2H56Ihq+0LVjGzlNZ5kA9QFN5nSY/MUpbrYnf
	8QW+jrET2SRzfWw1/aXDUZh4la273HgOzwAZ2CBjE5LlAZPRtrL8yUmvBRr1acxG
	iyyYUFM4TCt4sTLF1EGsyJKoRkEn/9+hwnaOXIUyMOv3xt6y147BYM2NR6vNyJqA
	1M1wow==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hakwn255s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 09:56:07 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-155a75f91e1so1404847c88.1
        for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 02:56:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792058166; x=1792662966; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=h0PtOjlnqWAv12BSE7gzCp+k2OZBkuTcqbhb6mVsDhc=;
        b=Waw5co5xAR/OdoZv6GYIag6omXEnGZWeqyev4guE91EdhtiJF+qSi3NXeqKGw7Wa3h
         NBVTdKo80BK82N8fyg63hUHE7Xwyhx4vPCb5UICfPtTeJDBd6Bdr0LYAzxfdwd+Fo7WO
         XQL69GnfqIymuNKuJErLDtKYDPwq1bxfHCuEqLrFO2xcf1ew4+d3f8BugBkGOcHyIkjh
         FkTITuliMCghR/jn4B46w+ZLhcMFAa2UhYVFs+Dhdj903BpIfEkN5BYmB6qFDw97vSWl
         MX6dbEZfeGmlAW+aglRpPXM3ukfwlHjD0P+VOCQ+2qP6dt3AE8/Uni6cnwkfzQepz7Sz
         zmzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792058166; x=1792662966;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=h0PtOjlnqWAv12BSE7gzCp+k2OZBkuTcqbhb6mVsDhc=;
        b=H6GKUinxUeb0cGc4+f2hSqI5gyP0DOei52iPILbuOMfGxI1s4MrsvFNFU1xf99kPVB
         USkEJVi1WnfmOBMTetXYcsrX3pGePQSFhSuwpQOu3JHB5vc9BHqWNjvoOqwKJlvdlVr1
         cOveJrhYRzu79pv0DRUEQ5uStTHaQzNvALUlVu+Pfxyh6+Lsf5rBdFj97vjJpsjOSF/g
         DyUgL0DxU4Ux3rTmrUUlFQLNbhY1WfzJAKgCopXmxDe8xofCq8ozUZXd6TS4KXrgCrlv
         KsmfalDwOM+rkJr07B+fK7Ue45pOVgNEBH34uzxEWxvGlBWJ0zp4kz5gq9xiKDjqg3IV
         Lo+g==
X-Forwarded-Encrypted: i=1; AKwUvBzjILXn97L6u5nXeDp79wyrCG4j86rqNV5CN0giVOBGtuOO+WR26qWSELgKbi2WAtu5QYoKVwL5CjFi@vger.kernel.org
X-Gm-Message-State: AFq9FYK1MHia1ul4gtOc0M5p92XKQYcbbrpmzaKBZNl9G3DQvVE0bwrt
	T1SMzuRlbx1vKShXugMKShySSzJ479WNFZhrwa/rq8Uv5N47r4pPakAdVMPWQpXas9Ou0po6u/L
	NjaaSkaDIBjKtYyaXoxITGha8+0SKVASnkkEkdEl86/it03nIudlSOScY6D05wUvh
X-Gm-Gg: AYBFou1vRNZyBHxhT7ATWjnJGVZlBgC8p3Qx3DgEjoUufOrPZuQXr4jBh85GLe/mMhy
	TmHL+l4frqFvGuss4DqR5CQ3Ttiofc4srN1NXriFmcY9J5ymktgkxYImOg1qvgjHBFEIg+hbcFD
	0Q2Jea3HJG1GigPasL0rSIp9PoMwuLoXvqH2FP+iSPLNkXniwOb2nd06y5/zUYsV1KCrbsCC+UK
	lSPd+/HNBdv4eoewX20QlMsNhnXrW1EZ76mbS61eJjOvUeHXcoqMor+D9HdYmKP7v8NqMQsVOdo
	JnyuRLKVeKF0CE61fVPAdajyg+XtDkjbkzDqHEH9MJlwRajJ5/zjyMnK0i7znTL193b2kQiKapT
	YvyKQfOHChk9i3afKUqKBG1Y4obwq
X-Received: by 2002:a05:7023:a56:10b0:152:dd1b:4fa7 with SMTP id a92af1059eb24-16a5dfd5d7emr23585590c88.19.1792058166136;
        Thu, 15 Oct 2026 02:56:06 -0700 (PDT)
X-Received: by 2002:a05:7023:a56:10b0:152:dd1b:4fa7 with SMTP id a92af1059eb24-16a5dfd5d7emr23585545c88.19.1792058165526;
        Thu, 15 Oct 2026 02:56:05 -0700 (PDT)
Received: from hu-smankad-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-169a442ac67sm84476533c88.18.2026.10.15.02.56.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 02:56:05 -0700 (PDT)
From: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 15:25:22 +0530
Subject: [PATCH v2 6/9] arm64: dts: qcom: sm6375: Do not mark MPM as a
 power domain provider
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-b4-shikra_lpm_addition-v2-6-ac7f1a0d5638@oss.qualcomm.com>
References: <20261015-b4-shikra_lpm_addition-v2-0-ac7f1a0d5638@oss.qualcomm.com>
In-Reply-To: <20261015-b4-shikra_lpm_addition-v2-0-ac7f1a0d5638@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Shawn Guo <shawn.guo@linaro.org>, Marc Zyngier <maz@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Anna-Maria Behnsen <anna-maria@linutronix.de>,
        Frederic Weisbecker <frederic@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Sneh Mankad <sneh.mankad@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792058122; l=1168;
 i=sneh.mankad@oss.qualcomm.com; s=20250818; h=from:subject:message-id;
 bh=M43+I1qLzwSuGMruCHHPPbA8y+igFXWBm9aSDkVCJa0=;
 b=lcqGQ5xOxECngaExoPxbytnqYLcAPF7CZa1/DKLyIQ7/lxzbx4iiXzXOvjlDe36CxW1d+kQuG
 pXYsMSSpiE2AFS/Rfeu/7jfw/23V8SDuRzR2xu0xR565vyl0nx0t1rD
X-Developer-Key: i=sneh.mankad@oss.qualcomm.com; a=ed25519;
 pk=sv57EGwdcfnp6xJmoBCIT1JFSqWI+gawRHkJWj/T2B0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDAzOSBTYWx0ZWRfX0g/hbDVXxdC7
 gJMrJESlFQ37F9tga4nkW0/q1FSkpC9QVhxHdGpzjKsLUYT8SgwpzCLk1sRdqaFvLCpbdfkkhKI
 LMlc2V876KrCF/S/I2TCxJs1Avx4PjYm62o5DBWloGKiVrGH8mboGgtj2LpIbpCe3zqzhWcjaTm
 m2eN1fW5VXZ6N7nRcr2VrffmjskG1i3Qr+FVf6R4YAgESo4qDvbHxyHKWDAvFPrcsb53UMmw/3q
 TRuDu/vJ4Jkis166IFhkdt8moceqiDYRqkJIp6JiBDvKyVuHDyexJH+HkD3lP+q6WyYZ2fq3uDL
 owU+0IOYAmGt9McwceSVACMFDtBtDEjKKn4BHNC6cxjGXFrd73wMDFEAtj/xu1cqh2ua8WQrftD
 yTIPxX/f8jKU69pvWT9GbA+THkiZpXsYouJ/erL9zriCBXOZpPKLq0kVaHFzFLHymyk5BFr2Kfb
 MI3RiDwycxbIeKtsiGA==
X-Proofpoint-GUID: PCloP5AdUteR4n2GhJvz9hDqslsTahod
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDAzOSBTYWx0ZWRfX2C2ASSeZ4d0E
 IenvJqQtfmUxvK5TJwHMR4BXl5afetugI1GzEfd3K9EPGBtePFcUoyz9syFNN0mycnXWu9112Am
 JUTDihpFgA+98T0aR0iaARGXXg7JhjA=
X-Authority-Analysis: v=2.4 cv=BqUIUoX5 c=1 sm=1 tr=0 ts=6ad0a337 cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=OikB9Wl6BtP9lw8g0jQA:9 a=QEXdDO2ut3YA:10
 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-ORIG-GUID: PCloP5AdUteR4n2GhJvz9hDqslsTahod
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 spamscore=0 bulkscore=0 suspectscore=0
 clxscore=1015 malwarescore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610150039

To make the MPM design more logical and avoid probe dependencies, the RPM
notification is managed by registering for CPU_PM notifications.

Remove #power-domain-cells property from MPM device.

Signed-off-by: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm6375.dtsi | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm6375.dtsi b/arch/arm64/boot/dts/qcom/sm6375.dtsi
index ccf572bb1549bf6b86b5232be216c9dfd51bb22d..76683c32aa583cdcb04f23f7de874ead83a5b4ef 100644
--- a/arch/arm64/boot/dts/qcom/sm6375.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6375.dtsi
@@ -318,7 +318,6 @@ mpm: interrupt-controller {
 		mboxes = <&ipcc IPCC_CLIENT_AOP IPCC_MPROC_SIGNAL_SMP2P>;
 		interrupt-controller;
 		#interrupt-cells = <2>;
-		#power-domain-cells = <0>;
 		interrupt-parent = <&intc>;
 		qcom,mpm-pin-count = <96>;
 		qcom,mpm-pin-map = <5 296>,  /* Soundwire wake_irq */
@@ -505,7 +504,6 @@ cpu_pd7: power-domain-cpu7 {
 
 		cluster_pd: power-domain-cpu-cluster0 {
 			#power-domain-cells = <0>;
-			power-domains = <&mpm>;
 			domain-idle-states = <&cluster_sleep_0>;
 		};
 	};

-- 
2.34.1

