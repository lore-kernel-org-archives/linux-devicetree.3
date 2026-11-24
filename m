Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795517659;
	b=bNaMnZgZqOZX1PMh8rpKDyNrWW9nshP/edWDluB7upYP94oM1J8weJTyBvJhy0INGvj0
	 vKmhgDzIUw89t9Hd/DdNKht1EoOR92ZGj1xfyXnXANoR4fJQvQ9SV9/UNHgDgEKZFyam7
	 3kxx5JwZZHQspY6/9Z8pR0K4uD0wAJIlJxirQhCK5EIR6sNgzJ0lEmMOyXEQmMOug/7bg
	 s1GbBmlRed0yh7VN2h1+qpL+GWWFMYVpbAp36oL/P/83nBzXhngNBwa1tY//wyB5LjUuw
	 PWPdNpV7hcx8UAygUbtxs/WkBTHanaffCqw6yFe9I7HLRPjINBFQXuEmdiXfk6pBhBg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795517659;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=h1XX+HZg6vGWb7gEUaIJKw206kuivjHbdONvxhwcr30=;
	b=hocw1RAfqReyULpAfgMTMfUHq/5QEhJEa8zJXvZ3CZRl+rZyrYpupMo+rjKoJyzTw6UF
	 FmgOBNHlpuITEe+jF0mEmpxkXQI3pgler19hzeTecqGLrnEdyoardGCmk+9uqGG6NEVN3
	 GfsfxaszulvEEXeSPWm0YxQPfwOvbBmtxQfdMY4kfvBdDkfz8Lrq1mCCcUCRQqhfgzfBR
	 x0fB8CpwgVYi5uLwvh7MNeY8vMEkwhCrtH9JewZAM/iBIqmeuje9E+PIFg2Xow/Y2GYxr
	 J7EwlEuSkzBv4Tbiyi3NGm+1cvhb9FqIAFlb5EFBttyV0gzYU8/BNRZgBbsBi6buhVQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=f+tYYpOR;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QqAFPgtL;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79A05606A322
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 10:54:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 79A05606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=f+tYYpOR;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QqAFPgtL
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AO8Q1ou3701111
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 10:54:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=h1XX+HZg6vGWb7gEUaIJKw206kuivjHbdON
	vxhwcr30=; b=f+tYYpORuLxY72FSqHvgd4pGjHoGRDy5dokiCCr6oEGKjKYnjS2
	7hLilPHsNjZH7KHHw8kLkduAcB87ouBCXsOF1ZcPGVAE5b25xbgsiWqvz7qPcVVN
	gHhQqgdLPzHI89Wey76ChcQW6/8HqL/3rDY9UzkqdAKLXarBc01+vP2kE2mVZwoi
	pgkUGalTa4rOVqTll85Mjay9e1tRr0wJdaEqiN4wsELWF+Cic9vgTKXOOsJVNewh
	8SJD2NyEfCs4C3zw1CJiQCVLU6Brl7MaiYl2eSPtheQskzruhFSISV66iMQRB7dI
	6blwZ2r6Ew8YLnmSinr2P+qJNcJo0ea6DaQ==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j50ky267t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 10:54:17 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-1a5005fd0f8so2367277c88.0
        for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 02:54:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795517657; x=1796122457; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=h1XX+HZg6vGWb7gEUaIJKw206kuivjHbdONvxhwcr30=;
        b=QqAFPgtLDBEIwB5ZpmLcbSoaXFUNyWdzGm3rpo0DtJe917jUkeS7jNqbRNIiQJaC4T
         g96FoS2Fc3fZHsoWhUCiI7e04Io3aI/3l9W0avbcSQBe7eHCorTKQjonxsI0qbLip2G5
         A0rSCKNXkEznCo84cuzQW2JHEB+Kde4QwgAp4hY5K95XpG4CzRQsSv7BdD7PacxqSOh9
         eTm69k0B7LlvfS0gmcSFy6g1eM6FJdzop2C7QHWy3XtGgzVftvi/jqxYqHGnU75+M4Hk
         Bpeki82pjVf5ObGaD250ud+0yJ2togmjLSjr/J77HzYdJWy1xo+DdikadBR9g/CTjWc+
         zqcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795517657; x=1796122457;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=h1XX+HZg6vGWb7gEUaIJKw206kuivjHbdONvxhwcr30=;
        b=g6otSMQj9GV6KLsJ8CusPlDrJ4zipR61FejN73/BRrdQPFgMbNXO9LRraYPTnkCEze
         aDjV5uRw3jc+HvXlCx98T0hjBZ03UrH+hS1Fl2CxcKe/U4jRi7XkBA1DQYHY3AfR6F/k
         mJPpyOingjLYjnc7AU87ocxOurTjc8vli19/Ynvol2MeOoJfVQ2TLdr3ratZX6bN5RXs
         39GAAxQDBHtr4FdWrwqklXznpLayJQLk1NH7WigUaX9d0LAcC0eQ6p2jQHmCtA0hDfib
         czlvg4yB5wTLuESgAf/v3LtLpZ8gzoRmOaayNL6er+ER83ev/YdhYxa3qfzJrdnY1+Gm
         +hsQ==
X-Forwarded-Encrypted: i=1; AL+hErEMq1Z+auiIUgntHSWjp+0MsyuIzuy9w+50Hl94YwsR4NPkYLV77aEnFylyxd6CS/M9Hau4Rcv1qgfY@vger.kernel.org
X-Gm-Message-State: APuU4Z9rN2VrdmRRseTfOByFsVZpfCecDTwGwvs3KpwI/QX3K0/V1bXn
	4BLkIdy02aRgcLbFh2f7kcYyTW9sF3A18EZusy+gXSVkOia04WI0/ERNsVBOwt28aVNh354giNw
	q/Zm0ZlwiaPAWTWM4erhvgZsKA4zYzLWYjvm0ZPWyWWTUcJL6PH1mtwStNQF5IG3s
X-Gm-Gg: AZFdTZfjBbHuBalpC0nI/ri2PDcThoIRYg1GPjTDdUvCR1CS9D1MUtJdv2h9BkDH4ST
	cLs5sh2g7x7IaHmpGBRfE4mUbAe1g1zUi4x57QlOIXEapcQDl+PWONVp0w60lT/3AAQbuQ3CR0I
	jL1MvvWhfuOg1YGIY5xlVgfMFcceptYHIPbzpDmJyLrClkUpsGdIlP+6f9jfFP8CquxW/NNQKti
	aWJGN28wD+mYYj1Nh3Qwwdc0m4BSdYpstI0ZBH3USjWAqwVR0Gj/IgT7Tf33Yh8HqVUovytQhiQ
	ijkZNk4r7QeDZuBhLPrFVLcf1guuam+mm1H8J5za5E0mOQf5gH/fMTTtdkTdml02qUPuPvgn1S2
	x2XyT/ZlVUnusBdf1b93UX+AlQll43polBFkfpQO4Drc9oiuOlK5cYrFF8mYQ34oTs+oc2a0AzX
	FsmROPrqVcgWnwaaL6jwAf59kvD3flDSNEuXI1Mj+CbLfxta2jJKha2N9/
X-Received: by 2002:a05:7022:1586:b0:1b2:559b:67ed with SMTP id a92af1059eb24-1b5568fa3e4mr16355906c88.26.1795517656952;
        Tue, 24 Nov 2026 02:54:16 -0800 (PST)
X-Received: by 2002:a05:7022:1586:b0:1b2:559b:67ed with SMTP id a92af1059eb24-1b5568fa3e4mr16355873c88.26.1795517656489;
        Tue, 24 Nov 2026 02:54:16 -0800 (PST)
Received: from hu-ymg-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b55682d301sm34644018c88.10.2026.11.24.02.54.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 02:54:16 -0800 (PST)
From: Yadu M G <yadu.mg@oss.qualcomm.com>
To: Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH] dt-bindings: interrupt-controller: Add Seca PDC compatible
Date: Tue, 24 Nov 2026 16:24:10 +0530
Message-ID: <69d22406d920bb2ca437604092b22648fc14384e.1795517650.git.yadu.mg@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=Y+ptIReN c=1 sm=1 tr=0 ts=6b056cd9 cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=lHObh2IfMKzVuqTG74EA:9 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-GUID: Un-tlKVCoCY9Wb64PctZN9-hOb3oGFSV
X-Proofpoint-ORIG-GUID: Un-tlKVCoCY9Wb64PctZN9-hOb3oGFSV
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA0MiBTYWx0ZWRfX7yG5aCZpE6ZP
 FhVn/vYWv3J8YPLER3FGD/4EQFCCEJX7Yuw9cx/z/7aztAzjnC3dNdysIxxhXrVXZAs63SfG/1H
 dGQpd0X2nvZ7AoN6CNJ8wsFkSdBba74=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA0MiBTYWx0ZWRfX/yWo26ZZo1zK
 xTYCZ37QMZgmffuHDwRThE4aX/wPbZv6/zHLLb99ejVYH3TZ10QAyiHfpzpIcq5TogzsUYvcJy0
 LvKA8gdp6m8ao1N2w7LFMYqUvymSio4PEUZwNvLCPEP2jNBtf0M4TbPpM3GcmUW0s5B6A761F9q
 Ty1cBtcLB/owWdg/ggPpGCYRgqEyTwJoXFUoukueFGUGdJO+xL0MqMIWzSDNAG/GpC6tXf0yQPN
 Cn7OCDu92vq4HdLH67tvhO7OniPxgpD8TJl7N/zdPASbaUkaokaHHDrNY8EZxeD20PgOrfKdi3T
 myBaEkCiny9ZBmMDS8IxS199BsugFnck8m2yiPNp3Zuta7fdbrSKfJyQBkwrVsPhL+2ThmxslHU
 mklN6Wdic4pdZTZUB0KI+LxudaWWUq9wcoMzduW5D/9y+cgWdYgMc9iVU/YEKaOW0NZBA7xI7wq
 6kHvg72LANhyLrfmppA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_01,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 malwarescore=0 adultscore=0 spamscore=0
 lowpriorityscore=0 bulkscore=0 suspectscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240042

Add qcom,seca-pdc compatible string for the Power Domain Controller
in Qualcomm Seca SoC.

Signed-off-by: Yadu M G <yadu.mg@oss.qualcomm.com>
---
The Seca SoC device tree using this compatible will be posted as a
separate series.

This series was prepared with help from an AI coding assistant
(Claude). It assisted with review on the device tree, bindings and
driver (formatting and alignment fixes), rewording commit messages,
and running the validation steps (checkpatch, dt_binding_check,
dtbs_check and W=1 builds). All changes were reviewed and tested on the
Seca Ride board.
---
 .../devicetree/bindings/interrupt-controller/qcom,pdc.yaml       | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml b/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml
index 8401d3b48e0f..e6ff08a4e979 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml
@@ -49,6 +49,7 @@ properties:
           - qcom,sdx55-pdc
           - qcom,sdx65-pdc
           - qcom,sdx75-pdc
+          - qcom,seca-pdc
           - qcom,sm4450-pdc
           - qcom,sm6350-pdc
           - qcom,sm7250-pdc

base-commit: 3191063649dbf7c0d0b768e1f3655e4c5fc6edb5
-- 
2.43.0

