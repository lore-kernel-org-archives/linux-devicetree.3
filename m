Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793947862;
	b=0HOL4SyWhm4U1TaOn5qgzoDpYMPXQhBNNeCFu0KDWblKk3m3NfIpWoJ7PXuz9giHWMUM
	 PRrb80v4u/oUQPGnqzNnXfDDuHD3fq4TA0fekCkM2yodfiM4/kSt62wGOHDtAOIr+5eR4
	 B2c6BZY5jQt9I3DS552ZUdnd+fNPNUtRrr0d5aF1zWRxIHWeYlZMLGaei8Nqusptj5njK
	 fpEPqdpkpmnimIChbhEmRcdeRs1xfSQNXeKS2j/aI3kznVwDnM0bCPXith4/Nty76dJzP
	 K80CQOB3zMaAV3LZMCyGeLf5jLZ10oGvq0l1cYBm7aHRnBEHMZikrWKqrGWDcjxeC9w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793947862;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=FgTaumbkJseV8Cy+AMTmURdrUUaRe7Y1v1tbBJFyumQ=;
	b=dhqAvewJtYX1Fr/qjjVUZKbcO7psldEPJz+SQETYoatyGTKmOnjiYY8uzICRT1Gbcp55
	 649X4q7YjF2WZNMDDf4eSO794BffTIkaufgGZAvZmxU7LtZpilfUyAYq57HD2zMYUXm0C
	 hHRDeuwdZ7TegSOWt1qa2SXkw4quGWVWNerhnNbyQC4Fz8L5LPhkqAxQRO4vMK8O9My5Q
	 oGKhsusd1axuEEHOPBXAUwfAJawjLj+RQ/Y+TA+NjBQTV5/eucSZkbsg3mpyHe54ONnA+
	 Ssd7wfBKIOhDYfBr4zV0J0f2dkXuY3It2N8TT5ocFmftk8gOESqZZ7ypwFb2IdOUwrQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=eaD9UBMA;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="OXHBAo/n";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81DD2606A33F
	for <devicetree@vger.kernel.org>; Fri,  6 Nov 2026 06:51:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 81DD2606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=eaD9UBMA;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OXHBAo/n
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A63xxU62833000
	for <devicetree@vger.kernel.org>; Fri, 6 Nov 2026 06:51:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FgTaumbkJseV8Cy+AMTmURdrUUaRe7Y1v1tbBJFyumQ=; b=eaD9UBMAJSVOeRHv
	67OKVKTURwH+iv7egpQZoCg5G3IHE7svYA9zTwuWAMBk2L8ieDGEQnyNDBRieRT8
	e/0L7AvJgHxui7qK/WTCwNpYQfYw9ZwBPBJlfnY2cLYjujLqQuYEi7zvubKFvEPY
	U66nqGI4vlO/vEwfZXqM1N3U8Ak8obddu3W1Ol7EjBHZyF/l7P74qh8BfeTpVJzY
	bGP90fmouxQCKsUedjwT3THlU+b1RiqUE2GLgh/9EFfBvRzet5e2W3BCSz+LMJUS
	r07rfw5NJTBIRRd8QG66cI89PIXu0evuHwVfS4tEwMOWRbR5wO9uhZa+28HihK2p
	SepOiw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hs3pa1g9n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 06 Nov 2026 06:51:00 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3b08364cdc7so446276a91.0
        for <devicetree@vger.kernel.org>; Thu, 05 Nov 2026 22:51:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793947859; x=1794552659; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FgTaumbkJseV8Cy+AMTmURdrUUaRe7Y1v1tbBJFyumQ=;
        b=OXHBAo/nMVK2RWzgd3FivT7QEhJoS5LlQP7BrPyVEs7sNY1gj9q0J4tdNdXTweANbC
         8DWzW/HGClaiELMQCuCWLdJrMmb0gr9+Vpe0TKJWejFRnlD0I0x/0JPsA/AzQREzVbj8
         l8l6tKtLjjtPbevRc6TKCon3pGSXE4IpSqEsl3gBLQfpwa45Clk3sB0lImkEH3woehyj
         i273VTee5Gnm3hfU+dub66cWbF/Te4XK7D2hs/hyDA7BKpW6K1b3fNz6O+xJ2UQOOyAe
         MIzbfk4LNQw2e/8DZQkWxvSOVBl+0XxGIW7YMrLZLoyDMtA20MfoIpzgs1xTMBXr0gnq
         DEIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793947859; x=1794552659;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FgTaumbkJseV8Cy+AMTmURdrUUaRe7Y1v1tbBJFyumQ=;
        b=uhqq8AHtggD1X6PvlDu4yfsPTW2OC/f31HBE5WHuZpg50ItvSlfNl8M8vqS3VtIRBf
         e0mdsrasM+RevLMelCHYQ5qZxZYgSKEdYphubEm1d7iYfBerl+JWXYBAHS0yGnETZ/hK
         q1Ok+/4uICjxtfYs+RLRKzqs0/xN3eSGc0mmiB3tZQr9bSrNIM6lo+UfyTFsxC+oY/Ww
         x4kVAYPb1pHZngZNLlqCUt9Tfj62llUfxS2vlceFnFDrw/GW/WspxNBmYwSKz5Uw6QZX
         5TLl1i/hGdhu8oJ4NsQbgkv/eaOHuxqvy4b1RtE37OZdqSPXn63CSSWbRagYyRTqPJE2
         ThVg==
X-Forwarded-Encrypted: i=1; AL+hErGmim5vGKsgBozSnzfw6dgedlRURZwj0yl/9BO4gXz68P4IIfYAS964DrdvuJ+ZGXTCwuVF8xpntYLB@vger.kernel.org
X-Gm-Message-State: APuU4Z/PEqPereE22sp2vhuogbJclbGQh510T18Q/CjGZ5m37wfUyoH4
	E6gOvSweFBb2OWJ3oVOEu1o+tgR/CwGo30D2rq4YbU27zA9zejaTzR7UEzmaw8kehA9MRofV44W
	f5OymEoyp8htygxdEldfRFfeLMugnOftx/Pacg9yDoMp6ixVtUtnXww60273DI49g
X-Gm-Gg: AYBFou38oEp7PkOXk8wBLTB3QuafP86jM7PVZSgz8dHlR7s8shTNq6tZu/hUCUzKUQq
	p8c2ww3HcI97sqJ4dVmSJzpvg+L/6AdqN1cVF4+2FRmIFfeMkocWlrWEVERuryxCWirqgBNZIQO
	4yBsGWRo+4RLzoqb1rJmu8IpZwqIGpATfqf8LAoJ3t1e8juIO901Cmw04ZiimXFDm1PFzJZuK7f
	txy5YKbWueOK+4f5DCQkdj2p74hv95avH4YDZntANNF6sMCp7mEK1I0+S0WvYiSxbKSI9ntEXPr
	6DBRCMRmKsd27SwMR8jJ1xQT8P8RgGfE4o6KDLkx1b+bTu5d0Tnu//+xx4YRdUWXyPIRjaFhsBP
	eaqSnGpnddBI5Gm9ev/ckSm/QNyWA+l1VHxgpjO+xHzwDReVSSYu88cxpE78E3FPYtr9bPRJvDL
	kizcWE
X-Received: by 2002:a17:90b:48c6:b0:3ad:47ce:3876 with SMTP id 98e67ed59e1d1-3b0db71a865mr1318367a91.61.1793947859417;
        Thu, 05 Nov 2026 22:50:59 -0800 (PST)
X-Received: by 2002:a17:90b:48c6:b0:3ad:47ce:3876 with SMTP id 98e67ed59e1d1-3b0db71a865mr1318343a91.61.1793947858870;
        Thu, 05 Nov 2026 22:50:58 -0800 (PST)
Received: from hu-nihalkum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0b313c0dcsm6597274a91.1.2026.11.05.22.50.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 22:50:58 -0800 (PST)
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Date: Fri, 06 Nov 2026 12:20:42 +0530
Subject: [PATCH v4 1/6] dt-bindings: i2c: qcom,i2c-cci: Add Hawi compatible
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
Message-Id: <20261106-hawi-maili-camss-v4-1-d528c7a797b4@oss.qualcomm.com>
References: <20261106-hawi-maili-camss-v4-0-d528c7a797b4@oss.qualcomm.com>
In-Reply-To: <20261106-hawi-maili-camss-v4-0-d528c7a797b4@oss.qualcomm.com>
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Bryan O'Donoghue <bod@kernel.org>,
        Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Suresh Vankadara <svankada@qti.qualcomm.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793947844; l=1414;
 i=nihal.gupta@oss.qualcomm.com; s=20260608; h=from:subject:message-id;
 bh=Of5la7TwZQ/Mgddi78WKNJ7A1AYscECPq7KHX0+sZaY=;
 b=oc0WJiOjPuecbdNW1PjeNotzAGfBEPLfXzNtndxTCk2cf10DpBvORLSkKxuww98qe+zxAI9A8
 lfekXCGU7PsCp9YWcgzQ1PxbW4ejGV5eowPCbBGqQ/1I2hpLJV7nV60
X-Developer-Key: i=nihal.gupta@oss.qualcomm.com; a=ed25519;
 pk=DIbyFMNwqU/iMvU/0pCQp2wmRVgtHFBT3PcSu+A+Ncw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDAyNyBTYWx0ZWRfX5LmaSUVlurAM
 c2LcqHdWxCN8Nq8JUQ01CcEBP1vI9n2nwD1j/MDsP3GwcncC0ip9FtplgTI6H4lVeBQZrmZPuvK
 AXrJlZxxqslCd+HiRdKM2qr3JmLbF94xE2KnoslAIMdpD5sa1TSubx2nuY25lUzvjFYEjQeje3X
 Dvm36lTFRGvOIIrc5a5ItqVs0XZwKSPjgCKnFiAVsf2rwIhv68igj6HJhPPX8CmTZnUzPo9fPIg
 EEb+S81Ov6lNkAcwbWhwEsaX098btew++zwjgfyS+osxkeaaW4+RHBcksTcrpP01DXrPjewnzk3
 cHoFfl8P2Cj+M+U+N0rZLMIv9BtJ1q+aBRQLUaD5keItK7CyahlTtYXhGWSvLwrv1OyE/unzw56
 UA8QR4IdyDlJu6TJZQr/5Z0/ciyZRoanDYvTIcpYR+9gY/1I5Xg6iL7cMcXHlW4fqhhhevUzYDb
 PbPOwxTsAabiaZajMUA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDAyNyBTYWx0ZWRfXx7XEHeA5Oo+B
 ey76lv68+dVtDtYkI0wSs+c0D5K1DwWYFraScaUOICLSh21uMs5eTEDex/rAKI6VVhAuvWiDK0n
 L/3Nt/HFnyj4AIKRIbc5IaKePLCaLXA=
X-Proofpoint-ORIG-GUID: d_dR8GgeB4TI8rwf4_2_vFFPpQviU1tB
X-Authority-Analysis: v=2.4 cv=GpzXaU1C c=1 sm=1 tr=0 ts=6aed78d4 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=AartCDbB9JJyHY4DVtoA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: d_dR8GgeB4TI8rwf4_2_vFFPpQviU1tB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_01,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 suspectscore=0 adultscore=0 malwarescore=0
 priorityscore=1501 phishscore=0 bulkscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611060027

From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>

Document the Camera Control Interface (CCI) compatible for the Qualcomm
Hawi platform. Like other recent platforms it requires two clocks, so
add it to the corresponding clocks constraint as well.

Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
index 1e8def25ec0ec1ef6b34859709d10a2a36fe36f5..b2b4d4bcf780792515ec153c873bace1764fb3e3 100644
--- a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
+++ b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
@@ -27,6 +27,7 @@ properties:
       - items:
           - enum:
               - qcom,glymur-cci
+              - qcom,hawi-cci
               - qcom,kaanapali-cci
               - qcom,milos-cci
               - qcom,qcm2290-cci
@@ -137,6 +138,7 @@ allOf:
           contains:
             enum:
               - qcom,glymur-cci
+              - qcom,hawi-cci
               - qcom,kaanapali-cci
               - qcom,qcm2290-cci
               - qcom,qcs8300-cci

-- 
2.34.1

