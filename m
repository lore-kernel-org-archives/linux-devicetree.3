Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794630512;
	b=ZOjtzX1SvmhsUrCt0OFWGF84XfArg3/OT6CFDXtEzz3U7rooPoQj402iXKY2cBrxBGqf
	 lcliPct253K0nAXxkpr/dQ2KDyRp1/pfINe97Znllnm2CkBxFVZaSGdNp2df70fnyw7Ep
	 aV+Za7tkz08syOztVyxvzdG9lgx2zB4hIojBvzEs7HoTRbsUBsvb52A1uVkr+xj1Ib+bT
	 3VN7iiRhr6t+aXp4ZxyukYJx11eeEgXq1FHdWSLC6oIURB4IJKjmdxoA5ZLyhFMh111+f
	 zWC0ljd5NAOYUwP2EMqx6FpWLaDMeyuwShscfFxd7YO/YIFLqUuN9uIN0hBhiR3n24g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794630512;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=OLf1pkZ1wiJ20Rs6pMacxktk9K6drlv7pkb9kjyp/Nc=;
	b=pDXt2CIe5Dipz2xnowlPTWyYXvQFUaTcpB4gFZTuOXxey7oA/TBPiWllr8T57G/E4KpR
	 9qW5fmDsUrjrRISmfHkWy++54OwxxS8SxOz63J5r7rOlbmBhgS2ph0XWRtvNRrG++Cs0D
	 7rgCpfIBFcB0fai10frq+kjL7jRtZoiIlkZKDP3SX3VRTtgC7zuDUkIWD9FkuECmlwSMN
	 gWOHOVZs42xDg12167U3UJ9Mk4r8eAxXnrogfNS4jfObZfaU2B9cZQBOvA3/wFIBdbcyp
	 wq+txPCNhOfXFBRtU3xCdeCLDFzvT6/gPt5+hgjJL/YY53wUm2XEbTNpA9VCM+K2rrA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ioDHB81B;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Oi01JzR5;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DFF0606A339
	for <devicetree@vger.kernel.org>; Sat, 14 Nov 2026 04:28:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4DFF0606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ioDHB81B;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Oi01JzR5
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AE3PkGw2909692
	for <devicetree@vger.kernel.org>; Sat, 14 Nov 2026 04:28:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OLf1pkZ1wiJ20Rs6pMacxktk9K6drlv7pkb9kjyp/Nc=; b=ioDHB81BfXceHfv4
	iMY5wYQ068QYisiNVD4e6i3prUmrxrz7G4q76TTkYWwOY51JCRyp3KD92A+Uae+3
	lAsnfLcFYU1z2Pw5b7d4XgVPS74JAjZe/dxDGHmzAnVMuDAGf6bxpqU2W3zLiVdk
	mWkOjtVCi4uGUjeg5SkYUbnZomQxJRCXMHnHBXWsVibRTaobt8lHeOPag1h40eRL
	MXEF3jIOXZHs1pFCjddUO9n7406HaRajkh0GJQR05D4S8IK/J1/A2s+fiBDbtf5O
	6cUdb6VDaCiXb4rYkOyPxe3GP05hnrKpeUq8Vmg1tA1nc/dNmL91GrboX/8WbIEf
	xMaUFw==
Received: from mail-oo1-f69.google.com (mail-oo1-f69.google.com [209.85.161.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxfqug3xs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 14 Nov 2026 04:28:31 +0000 (GMT)
Received: by mail-oo1-f69.google.com with SMTP id 006d021491bc7-71aca016fdcso954761eaf.0
        for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 20:28:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794630511; x=1795235311; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OLf1pkZ1wiJ20Rs6pMacxktk9K6drlv7pkb9kjyp/Nc=;
        b=Oi01JzR5vWottlb3A/EUDav8MePPlBsZb0E8z/xnUnshFTWg+WN0SFpaXawSlCpDxn
         k6PtveGu1Wu90+Slgl5lqgPq9oHXFO/qnoLxofTkiVFeEWLpgevjhYXEX4ZcV71KfzX0
         6zPlhRktFz3OjR4MKqr0Umby7PZXd0PbNkzAA/5KLGVR0+Sg28R0T+KGuRFH0oqmMMcZ
         l2ZnvFKIkzyTo56+8MWmcb3DQd/wkIxqwHm5GG773bhGo19sbFXI0roQ2DnU0z6oh8YV
         cIZsZyVA8RBORhJQWDd7WMCfVXL1oTl6Ca5xgefo6SckYBlBjzE/CaHaDFN/bAf5mT2I
         8j7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794630511; x=1795235311;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OLf1pkZ1wiJ20Rs6pMacxktk9K6drlv7pkb9kjyp/Nc=;
        b=UQYCDu5qTljGIloZEO2aoEQShCp/FrmVsvRnprjWaFExtS1+TBcybPKONa7L2PwNy2
         u1+couVQ28pUcA+9VVa9h6Hhg0LhgqUzg78nhIp9mcRKIk5h58Jvu0nM1DuRd6uK7yL8
         Ta9gt5DjmAiTH1rmVWVgbLRYYOwMSIDcUsgS/Q4KlWrSCXp/DDj5Rn86+FksuNAzHZ6V
         buwsn5izXHi/PEBJ3IfZg31nLdO2BjrCrcrVg2ZjDKga1SGUZ/vKZTn5HZPNOlrHHtTW
         hvOqCIJFSmj0awNHdFvtm1hUJ4EoV+Bn5EhIJloPCx1Tu6Kpen0hMOE1l5K3L5+Vceho
         oWvw==
X-Forwarded-Encrypted: i=1; AL+hErGSugQIb+M4EGjErbUGG0awlFZW4bUUZ9LorIKtEwETUuzGZHIgn+f+vtdY5BuCE6mLRpQO1mpRq5q9@vger.kernel.org
X-Gm-Message-State: APuU4Z+OoEtmzMCihdqgkZe0frktOfayrWMedhhQV4J6mN1wCIWAl22A
	noRrS1HSaAcLIW1V3jlqVnTvf7GDCt/nrNAcK5Nd15Y/k8ob6vONX5Rtxnn9EoFZhNM+WkZR4Yc
	4XdgsqFN2rqMR35CWtp128SrgwwLzVyUTXZofeDHKqz3l6bPGS9maiP+FR48lag39
X-Gm-Gg: AYBFou3jbDupfJr9jbCJr5YPvx5pStjzvFVOEVzYKD4Vpg+AIahIhrHOk+joFnB5MpU
	F/L2/BiQ6vx81DGMJiU3xs0TaGReUv+/ZKKi0icNOryZVoYNphtGDvVAyW+IlS7NnBZo7AaBkhy
	GYJqaVQB5649KRX6UyCkUKWpY7pq8EX1CSg9gnuuejADfLotrf42QqEWPvOwGbacNRam9FBWNJx
	7xrnlwRetKVF9OON8McMp08Xj5BP/684qHcxND3HGtF7JFBIezihUg23yh39HZXNM+jtIdE8r5Y
	bN49G4UVZE2tcMvRDu5QYKD7QHfqSoWYUol/4Hp1URMR7GoIhezQyUZuHT12uFSPPvLmbO2KFSh
	7xQO3ANzZVG88uCD6pCqdAgvTn+eopLHlIm8eFVlz5tc2pE5/UCP77Jxd9ziDr1D6QiM=
X-Received: by 2002:a05:6820:c3d8:b0:713:e433:f41a with SMTP id 006d021491bc7-71ab4f90849mr2009251eaf.25.1794630510611;
        Fri, 13 Nov 2026 20:28:30 -0800 (PST)
X-Received: by 2002:a05:6820:c3d8:b0:713:e433:f41a with SMTP id 006d021491bc7-71ab4f90849mr2009242eaf.25.1794630510169;
        Fri, 13 Nov 2026 20:28:30 -0800 (PST)
Received: from [172.17.0.1] ([104.57.184.186])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71ab3f44dc4sm3292269eaf.0.2026.11.13.20.28.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 20:28:29 -0800 (PST)
From: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Date: Fri, 13 Nov 2026 22:28:25 -0600
Subject: [PATCH 1/3] dt-bindings: arm: qcom: Add ASUS Ascent QN10
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
Message-Id: <20261113-qn10-v1-1-e09b2aa7ccbe@oss.qualcomm.com>
References: <20261113-qn10-v1-0-e09b2aa7ccbe@oss.qualcomm.com>
In-Reply-To: <20261113-qn10-v1-0-e09b2aa7ccbe@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1074;
 i=bjorn.andersson@oss.qualcomm.com; h=from:subject:message-id;
 bh=S6c+yjHeZx/zmv15ipToxQXjhTE2iJLWHtMISivi76A=;
 b=owEBgwJ8/ZANAwAKAQsfOT8Nma3FAcsmYgBq9+NrkGbtaQM40xsXsB493yUVs9ZNBFhOl+mSp
 UZUGWk9LaWJAkkEAAEKADMWIQQF3gPMXzXqTwlm1SULHzk/DZmtxQUCavfjaxUcYW5kZXJzc29u
 QGtlcm5lbC5vcmcACgkQCx85Pw2ZrcUDpxAAm9Hl9MpWhIv4CbKN1nXpIVyQbzrzB7bdMbTpbIA
 eCAEK2QDL9wTQoMup1lo2DdjIYRauXdODw1x28dcWxj/J8ZWXX+nEE/X94Gv/v0yNdeYThqHsHe
 MvpHYbmcVnWhqTixkzznQeUXPV3lr1UVMiXi6qQ/Re/lbyiWKv4iOsEQTdtnyf44SJatkleT9Uu
 gLQVhm7J9lmXLm7iKDEVEOeNiebyUvgxzYlgw08J6KIZALtm0gCRZipWRyehfW6sMJWzp8Brcvn
 EQwrOME4C3dPfWCz9qSMlDYhMrbFwICU1iTL/3DCgHGxliACkXv2oXh7v9EpnABUYHskQ82GPDG
 5NdFLlald2+JYz9dGAoN0X9JpY4UpEm/W6/93yfuGARjUKjqSpyhzTdsPudBwKxl8h7QK4VBk7F
 1yoAWDOZ9jCIZEot6dnsxkJDsqwYqd1F5QAyrJS+jsCHMLtOWADYHyhQpJVUVYUELVN3CaczPve
 WGdIbFOJLjaQ1v1FqnpnkOJhUHbBQSmSjoPpwti+2YeKuza0797mGu0Egonf+hYZXMOkUdq1Zc6
 xhl4XWznkYOYkVMB+rIpsQ6WR8rl6KFPSgH3JSsFy6198xvEyq4EM8tye7a0FereRo386p7RNWq
 6C4kt1jS/QO5skSm33HhM1r+7a/C/IfpBV97alV6NLsk=
X-Developer-Key: i=bjorn.andersson@oss.qualcomm.com; a=openpgp;
 fpr=05DE03CC5F35EA4F0966D5250B1F393F0D99ADC5
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE0MDAxNyBTYWx0ZWRfX9/jdOdHEs5bx
 Ud/qJoXE1XwOcdEEn4vaKsphVq5hTRdLU/K2v+bAVUrv2aH+XVUb5Ud9RBnDvkQb+384IMFldEr
 ApAJsWvGyoutckD1XthR2TZzofMGGNU=
X-Authority-Analysis: v=2.4 cv=CfGdd7rl c=1 sm=1 tr=0 ts=6af7e36f cx=c_pps
 a=lVi5GcDxkcJcfCmEjVJoaw==:117 a=DaeiM5VmU20ml6RIjrOvYw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=VllWacnbf50EjFFOaB8A:9 a=QEXdDO2ut3YA:10
 a=rBiNkAWo9uy_4UTK5NWh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE0MDAxNyBTYWx0ZWRfXw6VUEi45oqfn
 l3VXkECQcFCK8LbfaszH0I6LL+3HdJef06jrZkNf1JSVUAgJOwcjBHX4rDiIzLSUFK51B/TwhwV
 7V3oG52kB+BxNleTTyI2aG3L7YSqy8d15JJlAQM+pQ8+yTaT3iL4sALx63xwyOccGxvwUfTKGJm
 YAY9YJFw64kzZBOkmf1dbp6N7jBAUNIYE07H+wDBfRBLdvrtDzl+wqL/3KWIf+xRV1ztfEv+U+y
 HAbzHyydRhSAxmu4UCWYKHg5sk2GC4BFK12xoAIaUjjWpZOo1ts9ioxQS1iZcuzPw7huHM1YtQi
 Nh1vLcGOR1hcgyPwXuUjclN8M6eeh4Dmad57L7uCf8t3iMfH6u90/rNLVeziAV1ehpUW6cFGrjb
 aqAvB5156fWqiAdiP14l+vmECmidhUy0qugNJdamY1/e+s75MnE233T1f8/IYK1jHas95tx6TFZ
 M7uBDLf1H6vwcpzXZ0Q==
X-Proofpoint-ORIG-GUID: pp_aMwRxigxHQTKyCNQJW2b14GhSBByk
X-Proofpoint-GUID: pp_aMwRxigxHQTKyCNQJW2b14GhSBByk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-14_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 clxscore=1015 bulkscore=0 spamscore=0
 lowpriorityscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611140017

The ASUS Ascent QN10 is a compact desktop computer based on the Qualcomm
Snapdragon X2 Elite (Glymur) platform, featuring an 18-core Oryon
CPU, Adreno X2-90 GPU, and Hexagon NPU. The system comes with 16 or 32GB
of LPDDR5x memory, two M.2 NVMe SSDs slots, Wi-Fi 7, Bluetooth 6.0, 2.5Gb
Ethernet, three USB Type-C ports, four USB Type-A port, and HDMI output.

Add a compatible for the device.

Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 7ffa4f69987f..a7157795870c 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -96,6 +96,7 @@ properties:
 
       - items:
           - enum:
+              - asus,ascent-qn10
               - asus,zenbook-a14-ux3407na
               - asus,zenbook-a16-ux3607oa
               - hp,elitebook-x-g2q

-- 
2.55.0

