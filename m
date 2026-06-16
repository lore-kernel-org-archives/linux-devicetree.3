Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44956429811
	for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 10:27:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781605652; cv=none; b=lkKwHDYL/Gw3/m4xPnyQiJgIdnm1mcrs63gVzOWfkTQtqHSuX/TKfv463AgkFiNrPYUc0SDcy8NxgrKmgjCi3I5uEhO5dXcrfzTgd4VCtKIMlRMXdC7aLPpHVQY2Da2GDpsE+Qg7eMHU4P0273mDIizO3S65DXCLuylKVTs67s4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781605652; c=relaxed/simple;
	bh=lZzGwcp1RbmXBuhxY6qnZq2nvbiemlZxoipH7l6wYJ4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eZnYSXQnFs1xo6A3aePQH68BxZDYhJuYteCH9OxeL2QNvW8E/TaiBs6VVyWU5aBqfzhR9ksjd7hzyxac1JYzR8FOoqkl+CNcRxhN5Kpk7g+/UXlbaY0d0VEXzoC8cYHFXgbAREEy2/q9/V5T1cF3bqGzYFlY5629HczN9zxY9Os=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gS+Ila/Y; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BuUmyAU1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gS+Ila/Y";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BuUmyAU1"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65GABm353384102
	for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 10:27:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qldGy+HqkY53uavymykAUk/HfKiP5fsNYXFtm5E9aFk=; b=gS+Ila/YfQEtzyYY
	E8KZRSkAzocPvQoDgMDQugJnXMm1bVvlgrBwHGYSwJJ2pV9CQXEzbdSLzmtMMktG
	RkNVhgYdHQ631N+IfILIC6Uzm+pzPBO2dS2mgZ2gzhnKYT6tkcKdn7UqXTIzUs8+
	zgAwENhvjMVrjVQuqGy01IUt7AQA8EpemvapVg74v3pdYwfw72OpVs49CuWx3AQz
	Ow57eqsQJqwTDGnk/37UuaFkHcVlYXLJtD+zRQUwbXsdgz4eKCH8JVN/XpV3CCHe
	fjNouvxMHUus3t545EWveNkm4XtyTFE+IjAeuRNsR5tUQqnLO6PpE+kkDdZtAeTW
	xvQrkw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eu1ep8w5y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 10:27:30 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-36d97a4e08fso4315218a91.0
        for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 03:27:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781605649; x=1782210449; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qldGy+HqkY53uavymykAUk/HfKiP5fsNYXFtm5E9aFk=;
        b=BuUmyAU1W6O7oh0RBWTU0EmD84sNuBP4RzMH812ore1M1ULL9YW7qOJ7Kcku1gJtl2
         XP8vdV9H7dERFdYGx55hk+6pMqlYKU7SeEZzQDhInbOLB781Cq3+fGsbVji9O6wl9me0
         R2DzbRZ8yQQnSsXS3f6r50XSfr8ywHDUzVf30jUZcYeIzrWqMJRxajjM9Ks/Q5u3JilV
         Vmk32WDIHHvgzbUsDkhUtB4c3zAieZ3a4Xnp7nZ5xK/WIKpSqOiFBCP9VC5JJnhXwO6m
         p4QR9Exttz4Mjgff097ozyzE+Y8IixWu3fEuvbd+nryRwJRr3ggYXghpu5Sh6d/2SeWw
         UiSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781605649; x=1782210449;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=qldGy+HqkY53uavymykAUk/HfKiP5fsNYXFtm5E9aFk=;
        b=dSAOdau9SkWSJt6XLRyLpn4AMhaaz2715Qlg9AA+Cg5wvBzWAE51t4rQzuBTD0yLGq
         U6HTfFV2UWJxk4qWxnhxTbpUYidvWyFeJnZLmyR2OkwH2T6aR7QQgrQ0g9V2T0Jy9SNx
         xSvms2cPhZOx1xUf7KMCIIP2frm+gPmpMjrbkTT1tJ/l1c9+EbGPeb7FG2KLstAvooUv
         hecBgxhDtMhFTmvazRHgOpis7rzoi1IDC9QR383KWmvUeEQ6cXduiPS3nGvi734kpbd5
         B5TEIRNRvlZd7KjQTXwjuMdAUIqU0kRNpLFK+7grUDsE9Nui0OBBkrvOt7gDqvmXR2EI
         xXeQ==
X-Forwarded-Encrypted: i=1; AFNElJ8/j9ns/AyQSF13JSNNkgi/7n4HXQMix9rz53cxWCQBPHgt04ivnWqim8RCMEth9LsHtjk2tPCzcpC6@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4hwV5V6NWt4p0BV0AT50hANjouUjUk3/cFI0Mn3F4ATeMsHmC
	Ggj5AVzqZJvjyBSx3aNwwMNazTa2j2x2cKSOhyf5PfxOfxjdZaGV1xbcLFJhwY/z/wd1xmmLfiE
	7jddmiR1dVaC8qNB+CEqHBsRsfetyKuOGggnRUqKiunlccBho5m1JzjAK8+mtESm2RcKTe4DM
X-Gm-Gg: Acq92OE0beuUw2i1AaOXkDjZ2RclFCfZ1m3CWZ5B2Y6C0PXH2WERIOSuzvCRY5FemTX
	C8mHrRrbVF1e9ZDxIqwBquNnmAT5GhiaRIUoqZmQDPOIk420dx0xTEYq281Po2CuWBnodTU9TX/
	KRpuFsYl6+jkYb3zAvYKqUVfMGvP6Xs958UcHM6bVpEH5FRDWi2QFeMH/wZWRYa4wA08/TetTvD
	duf3zTqvTG2h/fIFveJCdj9NMpblw0LvNHlKfS6E//Nz01+0Md6WPtigHuWZizuvyCXoWZ1cS6S
	nVWHJ4gQJIXO20/r5sgY99fQxHBXqVJzFKdT3T6+3sC6G9ae+mhPNmJrB7dCTiUkU+gHi/yawt7
	LC9OfLywbegykYKdZ1bhrQ2dlSvj1TgAfVzzHJiwg0qKtADzNzA==
X-Received: by 2002:a17:903:2f04:b0:2c6:95d1:3bbc with SMTP id d9443c01a7336-2c695d14508mr48138735ad.24.1781605649193;
        Tue, 16 Jun 2026 03:27:29 -0700 (PDT)
X-Received: by 2002:a17:903:2f04:b0:2c6:95d1:3bbc with SMTP id d9443c01a7336-2c695d14508mr48138405ad.24.1781605648747;
        Tue, 16 Jun 2026 03:27:28 -0700 (PDT)
Received: from hu-mkshah-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c4327ac79fsm118343685ad.45.2026.06.16.03.27.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 03:27:28 -0700 (PDT)
From: Maulik Shah <maulik.shah@oss.qualcomm.com>
Date: Tue, 16 Jun 2026 15:57:14 +0530
Subject: [PATCH v2 2/3] arm64: dts: qcom: purwa: Drop the Hamoa workaround
 for PDC
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260616-purwa-pdc-v2-2-8dda7ef25ce5@oss.qualcomm.com>
References: <20260616-purwa-pdc-v2-0-8dda7ef25ce5@oss.qualcomm.com>
In-Reply-To: <20260616-purwa-pdc-v2-0-8dda7ef25ce5@oss.qualcomm.com>
To: Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Maulik Shah <maulik.shah@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781605637; l=1132;
 i=maulik.shah@oss.qualcomm.com; s=20240109; h=from:subject:message-id;
 bh=lZzGwcp1RbmXBuhxY6qnZq2nvbiemlZxoipH7l6wYJ4=;
 b=dPWpYEeHwQiDxSgLW+vou2TEli23CGbueIqAd/PbVx+MHfUG+xsU0LWQXTS4YpZZ859SLqcQi
 WAmuUpSZLZmCnwNcVtbhiV5xBcYoztuiAzeOvmPCW7DQmx4BGZE4zvy
X-Developer-Key: i=maulik.shah@oss.qualcomm.com; a=ed25519;
 pk=bd9h5FIIliUddIk8p3BlQWBlzKEQ/YW5V+fe759hTWQ=
X-Authority-Analysis: v=2.4 cv=I/ZVgtgg c=1 sm=1 tr=0 ts=6a312512 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=vCmKDeXsP24Y5dEMWNIA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE2MDEwNSBTYWx0ZWRfX5BD5+UdMBBnX
 X3hHIO+RA2Hxm/mDzwsrCUW1R9PJIwyjq9pB2D4D4Qh6gwS9yIs7WyNWf5PgK0qkotsCHkT4hFS
 tSOYPSLu1ySpWMhMC3PpX3Fc+UgjrAA=
X-Proofpoint-ORIG-GUID: ZsOxJab11-weV3zSzpuKcMF1XmhUGGQu
X-Proofpoint-GUID: ZsOxJab11-weV3zSzpuKcMF1XmhUGGQu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE2MDEwNSBTYWx0ZWRfX42q1OElVHyaV
 S5SRKqS6K7dJRolqWOSs1/eSSbVKP91vUrVpoSQiCsDywC4q2gmFXhruYSY2uQnii8zJFgWQhfm
 Jzoy0BhybjuCAIlPoywkNHlLrJ6DK4/2bBwQbAqf9WsoE5u6+YDpcyDYdr4A/ET7Qhk+ishraFf
 FrPMlBDN070iB1X1ZRsfjeG1Ll2BpyXY3Io07izhCsQENuJl5o8p49OY4nl+y4vWDyKUNvRcJsK
 8z/Wv4IUxrJqPBBicu/ccHrtYp1x9uOzShDMvTLX/IU0MwPOBw0d101WzsoUOhF58sFy+VA9Ec6
 Wc+nw9D/Se2ddLTAg1BCzMQ3E0Kr5XHMTAGjvW1WPHr9q2QFpG3tWSjp/T3CIx7M5aLAWd94h/F
 qPGQX0WFjofM/gmMHLO6NiF73ZzLJMvJFYd/4MShu/z+uRpZWaWfCJqv8IkOqvoizFRGA5sMzj3
 8qu/oUPkaDbbctucSWQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-16_03,2026-06-15_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0 adultscore=0
 malwarescore=0 spamscore=0 clxscore=1015 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606160105

X1P42100 (Purwa) shares the X1E80100 (Hamoa) PDC device, but the hardware
register bug addressed in commit e9a48ea4d90b ("irqchip/qcom-pdc:
Workaround hardware register bug on X1E80100") is already fixed in
X1P42100 silicon.

X1E80100 compatible forces the software workaround. Use the X1P42100
specific compatible string for the PDC node to remove the workaround.

Fixes: f08edb529916 ("arm64: dts: qcom: Add X1P42100 SoC and CRD")
Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/purwa.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/purwa.dtsi b/arch/arm64/boot/dts/qcom/purwa.dtsi
index 9ab4f26b35f2..0db8c561e7ba 100644
--- a/arch/arm64/boot/dts/qcom/purwa.dtsi
+++ b/arch/arm64/boot/dts/qcom/purwa.dtsi
@@ -166,6 +166,11 @@ &pcie6a_phy {
 	compatible = "qcom,x1p42100-qmp-gen4x4-pcie-phy";
 };
 
+/* X1P42100 PDC is same as X1E80100, but without hardware register bug */
+&pdc {
+	compatible = "qcom,x1p42100-pdc", "qcom,pdc";
+};
+
 &qfprom {
 	gpu_speed_bin: gpu-speed-bin@119 {
 		reg = <0x119 0x2>;

-- 
2.43.0

