Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1C83388E43
	for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 02:40:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785292845; cv=none; b=rmuQkrXxuJC3Pxf1dbBm2Gs0paHYvDD1iihKekn7EfJ1jSOO2EKuZK/yWPxnjeoDkkNq0pBFFbM+RQYFLLqrwtvzSllpACW+z2tlVx4LXX4EgI/Zq3PJDrUihgB22+tq2+AHqMWayTEG76OnN/3g+XRk3fyLEL8m86Uak3Sk/dA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785292845; c=relaxed/simple;
	bh=8FPGCM/3nQl6Ae95OG1Sc2zmHY8E2bujtMRY1AVbem0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RSlxhpH7j6TP0sgJL3MuUa1pJXDHy7vGy+FOSTu13F0+a/vNnuKNlqo9JK5v7yQHBVbKrHJaSf8ewdTfsJVcpqMfky5102dDF2TOPh9qqXGKNOGHipVmFwiaiyY4ugki/MS8aq2DJROeQPsN9g3pRNvXHsTg7+a634CLBNRIrHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=R1jaBMxl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=J2VHCx1W; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="R1jaBMxl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="J2VHCx1W"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66T1GxP8481821
	for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 02:40:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IHeL0BsD0/dyUBTKXpeuMnDx9bMYhzFRhxErLeZxXHE=; b=R1jaBMxlRige+yVn
	7kxbpU3HfyRmDhaEDMBn40ds4GwF4VQ9ZpGO/JEk8OaPmxysTzNMCMrFG6f3XBOx
	JHlCdSNVQy8jLTlZ5rqVm8Jtlln6JUYjKLbu28vyYqi6YuvnGP7xDy2ujphQIwEG
	XWq+GFz5W9d02PUHGoFXJ+/a4UZbd+HXGMJbziKNDdSvxwSy/DUo7jrn0+Ij2yYH
	J27ZVH/886GCXP/XukYq9l56ilflZefwO8u8lKT8MoFkOqcKgpvNUREpqfYlellA
	BD/YOIx+v3rzyp9072VF9LryL78ewRequpGy/iYOboHqzM2cHQP1jVrfajP0pXRf
	j2LiVQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fq0q6su0m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 02:40:43 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2ce756aa72eso1024665ad.1
        for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 19:40:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785292842; x=1785897642; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IHeL0BsD0/dyUBTKXpeuMnDx9bMYhzFRhxErLeZxXHE=;
        b=J2VHCx1WSrBw1WGWuc8brzmTByaFdIbGOVtZa1rhr3tqQHYfJ0r8vD6aDl7lAHo0Og
         44nnE2BFo4nqVN/O0VxifzoUni31xscEQFQ3J0YHU7Z6KAeaNV+e+dqXXbkzk7GFnWfV
         FlooR6R7hBiWMb6vfiGfGT3AtfMqK0MG/QjGzyyQSJoamNMtfcmXq21heSjESMzhoEE+
         CTOH1sCtXO7D/C0MvHEIsGFwm0EOl6CY+FqRY8zNJ9eUm8WfluOjtJlSyi+A6jP9mu5N
         3KEge7bkB5PfZ9w9cdy8pJXYwJlfPko/0uZtg0lLwGaIW0ASOLBVjnP6EY2mlDZxAra6
         Zcgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785292842; x=1785897642;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IHeL0BsD0/dyUBTKXpeuMnDx9bMYhzFRhxErLeZxXHE=;
        b=d0cRS8FgeQQPiUcYe6C/2yjULPEKhHUMBvkkdHi3rbPDo0gCgU+cM/vhkHJ2793eLg
         m4hsKeKd56326z3x5LwshLr4C7wctDVCz5NWnl0hXjTfWj6ThKp2PVjYHEFYg/d+IaV5
         vOIA9ajc2yZ2FfhUwCb2sTGzA37gP1AZc9jarONrbTfi0w9UFo+fRcQiPF3QllNSMIDP
         +uB4VZyMoFK9bt+/Rs7flwP95Vd3I2SaGZ7Npf7nNZhw436Ol/mZ1rjEcOTmeLPoqnfQ
         +VgdeIyLbGF1046NNtXiVjYIXiUdgTb3iZBRuJ1SDhbYD5GpUoBpmtexBggdAY3b2v4U
         lmwA==
X-Forwarded-Encrypted: i=1; AHgh+RpY68TiKkZDGdo1MYQlkltguzN7KOkXFaIdOh/qXHL5CAlh5JAfTiG8HjPbyNcnIzVVlRyZ3qc/2vv6@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9Qrz/n0vkM3uIJVbTXuAlRg1CC4vbQTR4Lc0Zvy5CDV41IqJe
	fvPyFFAq+mTHGzE7Ur3bk6cUBTW0GkMLfUyW7IoOiftRENEgvmc5GBP8AUsksZxZV7EGHb7ccNV
	62sd/mH7QhrgPgh12SxQnDBMLuyf2jPXAZwrr9dmgOKSWP6NDdKZ6RWxSIUNhqzJSt7dw4aGN
X-Gm-Gg: AR+sD10NlXMdh/vVVelcSU1dqziVodHFJKgNSwADEU/uq/S04qokhfSXC3WHF47Z1ZF
	8vmHj8ucZbfNS6GhU/SY+L73T2LnUsyB9bswcR87II3G5mmbggpRKpx8zX7i3XCB50F2pRMD0Lk
	ZBnny7jgGMHWnj7AnB2VBV/MiMU2FhjTCEAhfG9EWTBdirHBanFzz7AvzQ0bK5Db/4r/hR9MEA2
	dVIVSfbH6VEmPdwVUBcwgYYMWvJZGRRa9Xsr8aEcx3i+fkkEtkv0C+c/8BGMblP5rl5XI1uS83m
	tP2j2l4t/JKWDvLZ/dLns23HQJn3GgaWVMetN2S+zfNqI+vxhUlpNKvWGYsNs4i91NeRdsraSWz
	WWbx09dpWi5XJ8Ou1eNrQX7SXS8v7wWuNWjDv3ocrPDQw9drpYAo=
X-Received: by 2002:a17:903:2411:b0:2cf:7dfa:7f56 with SMTP id d9443c01a7336-2d015adf09fmr49172425ad.2.1785292842542;
        Tue, 28 Jul 2026 19:40:42 -0700 (PDT)
X-Received: by 2002:a17:903:2411:b0:2cf:7dfa:7f56 with SMTP id d9443c01a7336-2d015adf09fmr49172225ad.2.1785292842138;
        Tue, 28 Jul 2026 19:40:42 -0700 (PDT)
Received: from hu-weiden-sha.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31504cc64c2sm4052694eec.19.2026.07.28.19.40.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 19:40:41 -0700 (PDT)
From: Wei Deng <wei.deng@oss.qualcomm.com>
Date: Wed, 29 Jul 2026 08:10:30 +0530
Subject: [PATCH v2 2/3] arm64: dts: qcom: monaco: Add graph port/endpoint
 anchors to pcieport0 and uart2
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260729-b4-monaco-evk-m2-v1-v2-2-0548e1dab760@oss.qualcomm.com>
References: <20260729-b4-monaco-evk-m2-v1-v2-0-0548e1dab760@oss.qualcomm.com>
In-Reply-To: <20260729-b4-monaco-evk-m2-v1-v2-0-0548e1dab760@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: quic_chezhou@quicinc.com, cheng.jiang@oss.qualcomm.com,
        shuai.zhang@oss.qualcomm.com, jinwang.li@oss.qualcomm.com,
        xiuzhuo.shang@oss.qualcomm.com, mengshi.wu@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Wei Deng <wei.deng@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-GUID: 9LoG1MlcZRt2Onx7nRg2gjpGaqwHzplz
X-Authority-Analysis: v=2.4 cv=DqpmPm/+ c=1 sm=1 tr=0 ts=6a69682b cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=YQEAmTBiAzzqGyEmVFkA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: 9LoG1MlcZRt2Onx7nRg2gjpGaqwHzplz
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI5MDAxOSBTYWx0ZWRfX0+3fVnInFCL9
 N/aCb61+sCm8eoA1qg314Qj48t/qIqO8DaYKn/mi8lWmpAMluWgO6HUlvPSpBr1vUGsxNOX6TbU
 iEvZ4NhZMmsQjifCHUnJI1Zd2E4TPBY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI5MDAxOSBTYWx0ZWRfX/KOhCLKjELPR
 nOxm3K+MJx+kAmcrfOnRn/zRBvNkyvRLJCNRp0lUGdlRiVzeLq6L8C9Fafn+98uPVmE5OQT/a3e
 hVB83o8CGZWgVx6xYJNhaISbWQgZ1LjxDDoMXdvQJcFqXnCxxkixn3EtHHmcUJf8SfDDvFZGGQ1
 yF+Jcgb+8PZU6SRMvzyTyQVmsCHfg/O9mNm+EryYzYqQqB1gzL8wwe/9qDi1tHYaHCSPCOj++ZC
 x1QRuAFHE3MPUjGNRkDY2R0400SPmRQLTtgNgz9Qf71bot59KBaDwSchjaeYdRzrbbp1Xzuq0lc
 L49fP0wVEfw2sZY/6wNHkeqOSCqMTNGOEePQxITx9VLbX11Lp3yER1XPDy9D301EQqveGVMveLl
 f283wXbADa0bLI9ec2BFlDJZJsQ8i+XPXEg/KMx6xN4ypuTmQTzlW+5CNERpXZNxrFVfNEbxX0S
 oYwN35qrZheRBEABLaQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-29_01,2026-07-28_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 adultscore=0 bulkscore=0 spamscore=0
 suspectscore=0 lowpriorityscore=0 malwarescore=0 priorityscore=1501
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607290019

Add empty graph port/endpoint nodes to pcieport0 and uart2 in monaco.dtsi
so that board files can reference the endpoint labels (pcieport0_ep,
uart2_ep) to describe connections to M.2 Key E connectors via
remote-endpoint overrides.

Suggested-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Wei Deng <wei.deng@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/monaco.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/monaco.dtsi b/arch/arm64/boot/dts/qcom/monaco.dtsi
index 438ccf6eba64..b17d41059e7c 100644
--- a/arch/arm64/boot/dts/qcom/monaco.dtsi
+++ b/arch/arm64/boot/dts/qcom/monaco.dtsi
@@ -1184,6 +1184,10 @@ &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
 				power-domains = <&rpmhpd RPMHPD_CX>;
 				operating-points-v2 = <&qup_opp_table>;
 				status = "disabled";
+
+				port {
+					uart2_ep: endpoint {};
+				};
 			};
 
 			i2c3: i2c@98c000 {
@@ -2402,6 +2406,10 @@ pcieport0: pcie@0 {
 				#size-cells = <2>;
 				ranges;
 				phys = <&pcie0_phy>;
+
+				port {
+					pcieport0_ep: endpoint {};
+				};
 			};
 		};
 

-- 
2.34.1

