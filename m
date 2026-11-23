Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795433778;
	b=1W04st4iNXZ1ZwrZXjEvewtGyb6TtzzBDA97xx8SmqWatvlwa8Q3IvPJvgHRiDjmRy0R
	 bhfsJrjU5t/XXP4JPMzt9d9+KAeY1AQX0SAK9Hxz7GYEAGo/+g5G5DZT1S3A7fOZWT79h
	 iLk10DBL9EQqrj+v+SufSQF+uyJgLSLK033NgFFGe9NAU/ulPAt/GWTZX6koOnhyqRRYN
	 68FlJMVx33IRCK7zbp+0b9RiLf2VHH3zF1sylRFOda7pMqkaRhQwTHzsayMDFXnTHFOyR
	 Qwo1l0Yk3K6zhSqsDw0O5hEJXLhCKXaznbaFBYBxAP9xgixaG4Ad/eBJqx91J/0PZzw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795433778;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=H0lU3jlQEaKoyGca77UmWWN4srY4UKoUV0/x2GOHDbQ=;
	b=QFw5HHLcuNdlcXJ7xRIfac5TmTXU9tfnFeadjdToiwOaXOw7+kxu2xr2ZuIyfCGI0WTQ
	 LWSf+iuqo0EpjDvCxHMnUhfKKQ51rKVjW4PQ5ixeM5T/GuK8XnD9QeUPxxAzXlLFJ/ZyR
	 zB04DSMBT2zGWrrwFzPqC41xxkjVdkwHgGIxvI32SpedHGanu6kpkMihFC2S6Y/++FIgj
	 q4DPiU/oqyNzI9uejT+UeP1Y8CXKwH1cjLVecF6+drwhSrCs33XZsQZqzf8Ve+wxDlQs3
	 Z7chLLAWbfD0ePM2a7ZEOztOcB0xqBj3/GS2NxwldZe4SwggYVFEQkTXtWcdTkHbIiw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DQp1Mz6J;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=keTUF1xv;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79F10606A32D
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 11:36:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 79F10606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DQp1Mz6J;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=keTUF1xv
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AN9G7a44095727
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 11:36:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	H0lU3jlQEaKoyGca77UmWWN4srY4UKoUV0/x2GOHDbQ=; b=DQp1Mz6JSfNUAkzm
	De+IjjIf07j41uVRuHOwhjcx2lBv9o8kPJAstvBkVYgDW0TS3vySyyfMCrShtIii
	8u3SBaQK9OWf2mdYkIQ4tn93EsEhAulmhb2l6iEppEZUt9ojXVm/sU8P5Oi/jRrr
	CJxhDAVjEwrl5dq3BcRoYDAJKH3rSh9Xvb3VySkcvbxo2Cu5ToohSup3YX4bO8D6
	clgokL7myiHZ4sCnnpSHuHoD9GJuwfdpuwIOBR2S+bQRzCBADfpxKif5hs3AfL3j
	PNlQLABDYIi8SmaZC396ukSPCHJIrwtAvlNUEEtqoEcN6QhIXbF6MhtJ48JSG8ow
	/h+rBw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4g74162v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 11:36:16 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3ad53f538d2so816629a91.3
        for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 03:36:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795433775; x=1796038575; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=H0lU3jlQEaKoyGca77UmWWN4srY4UKoUV0/x2GOHDbQ=;
        b=keTUF1xvRWA1qsmstOg8yucmR+XnZpxk4vEWWwsVp2gaZ27jMp3uiYpdGj9E6zscU0
         iFx/P/uH/Duqm2BEw1cnxHjqtF6EH0ojzWytIRHgS2aXxwGluvJqiWfPmtvlWdUQmv+Q
         p7jSfWjVemX2ZlhYmISIpUWxhZH+uhhts9aEWxS9dK4lcQpCZAnyVF/ZuLo4s4ztL+ew
         +UMKZiSsNJZm1LAiEwZYXSfgiB+bUSVVbMULcEEfDqFJw2jX5t1ZE4ZiNa/gdxEKS2td
         7QzRIxjOtbLBVTj2bPKBJ6VarB9Hw3gSbGFnQE97JLXZ5pgV0TjOyU7A2RokRBzlr2ZV
         E/oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795433775; x=1796038575;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=H0lU3jlQEaKoyGca77UmWWN4srY4UKoUV0/x2GOHDbQ=;
        b=vqvwnole8BwLVi86q/rAXRs9H8PQUi3KAkO2ysybQgV3CinvNcoc4RcaEyirq8syHK
         fhl3Gcj1FQJRd+193gKjJKmlT5bO0o98gzNYpFvA51VdjVvJ68nDU40dgldALwqgoaiX
         +3BqYk5Smz6SIXKU5LurKngdoKLYjxNs40ZZPyIuRiSzCkWqEC5kt5zSykFJMCYrOh0G
         rKiWATm1h38tojrKHR7HGYDqOhYjQT7eaZOMGJYnI926RgH3AQg/V5QEjMbNuY9cUfVh
         J5vBzHn1M6tZERSle//Q7KTE9zMYm/3+59srWXjDIn/ZHG5FexTMCMh97dJOMgBD6D16
         f9cQ==
X-Forwarded-Encrypted: i=1; AL+hErFrgsngVoQPEhG67hJ13KnK0as84/tOiJvq5oM/u0Jv16fxjvGVtc2hb+69VV3QCXclD7hLpLLv/aAs@vger.kernel.org
X-Gm-Message-State: APuU4Z/7SRIr1qJ4+JRtl7yynvXi7hNmcwVCCRxan/Ylf4QwLurZxrCq
	f3UFSPax8YW2zIMxOMJjo4gCb2x/4k/yZN4lY4LLgLpENJ5zMVlloTb90l9+ZwOGKMlp5WTsw0Y
	Oz2XxLql4fKfWArrklPhhcthHCrGfcO7z7UDUpZ9S02PdIQBBg62BUShPs+uAQ3aB
X-Gm-Gg: AZFdTZfsTI9dvOiu/cI8GTO+KuaGoYbWw1ErZyYAItmJiuZs8PRnJkiMnGZ4LPIrJKl
	SBGu3HLaf7jejgjWJAGW8yo/ZI5LyG+oCJmyyWeccbrQYVdO+45TQDcoZDocsV2PYDwTgYaM/29
	YnlDLH9UkueXGT9rqZnauOAz4rCrqsdvrGF71h2HqPa0WTyI6E1pjM46LuJ4YkEpl8AYEB61Qfp
	dDg1Se/7KFcer1fwq5QZD/Mk10VIDD+k9BgGo6nSlkAOg2JMmwURu8jUV05PLs4+iGW3QULBgrc
	Vx2pn+WbB1kGw6bVmBswktergdqO0ZwWr3mnqdfhk+TOMW4rqWmVDAlf9RSZY3RGKfz57663E/K
	MefswDlWyARUmG79EVnGDsl6hzBe/yOrsXzi3Ayljc1m8cf5CKivEsDLPRl7VozIrustoH1LK3U
	9TqIqb
X-Received: by 2002:a17:90b:2f8c:b0:3ab:3437:554f with SMTP id 98e67ed59e1d1-3b41c92a519mr9916304a91.29.1795433775358;
        Mon, 23 Nov 2026 03:36:15 -0800 (PST)
X-Received: by 2002:a17:90b:2f8c:b0:3ab:3437:554f with SMTP id 98e67ed59e1d1-3b41c92a519mr9916282a91.29.1795433774905;
        Mon, 23 Nov 2026 03:36:14 -0800 (PST)
Received: from hu-nihalkum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41ad8e93asm17489024a91.11.2026.11.23.03.36.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 03:36:14 -0800 (PST)
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Date: Mon, 23 Nov 2026 17:05:59 +0530
Subject: [PATCH v4 1/2] dt-bindings: media: qcom,glymur-camss: Use linear
 CSI ports
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
Message-Id: <20261123-glymur_camss-v4-1-d7db74f59e22@oss.qualcomm.com>
References: <20261123-glymur_camss-v4-0-d7db74f59e22@oss.qualcomm.com>
In-Reply-To: <20261123-glymur_camss-v4-0-d7db74f59e22@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Suresh Vankadara <svankada@qti.qualcomm.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795433764; l=1681;
 i=nihal.gupta@oss.qualcomm.com; s=20260608; h=from:subject:message-id;
 bh=zjnor/BWgyrwK6XP+tfmoWltCexIIqOeeDD8ZoHZrVc=;
 b=D2i60IsClkxDgo2LFO2Fp0mVDOAaqsoJMbmRuw/7mcKjIsPCRStwSDKQezh6yKM0TR7PFY/KC
 Iho5S9xtIDyBKr0n99/buIibSEyLHV24bQB71iCdGuhO9EKpSCwRZ8U
X-Developer-Key: i=nihal.gupta@oss.qualcomm.com; a=ed25519;
 pk=DIbyFMNwqU/iMvU/0pCQp2wmRVgtHFBT3PcSu+A+Ncw=
X-Proofpoint-GUID: hkutUNzQ51NZ2MBYCAXLnvywXdgaHam-
X-Proofpoint-ORIG-GUID: hkutUNzQ51NZ2MBYCAXLnvywXdgaHam-
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA0NiBTYWx0ZWRfX8GfuiKlFz+or
 ommtrrbILK91d63euuNE9nErwJoXmuKxKMt+ugZHWSju9KLqKW4vF3mMSLWC+4O5V1Fba9YtQBV
 8h0si0SPHubXz5MvVwNHV7dr30n6mII=
X-Authority-Analysis: v=2.4 cv=T/cZ3PKQ c=1 sm=1 tr=0 ts=6b042530 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=oASzbMbbwVaaZ2OwXzoA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA0NiBTYWx0ZWRfX57kJQpDsrJV7
 nSNbOlq4w6azlEnuLZHaUjSIzQugJ/oaWNV5Fq6ayc94XJ1sfQvp8IRFk4X0dDTh6ov4yrvK6+8
 +Qz4JCPMj8HkGuZ4nLNe7VIzFZp+OVMjIRso6k8D72c56xzdGAL34A+IumK4eCQrrWg4HhULvBY
 FM5j/orWl3OWPF8SU0ZyKB7U/TwA/+WV/lG0Df+d52jQh6kkl+SoDiSDbr9ZEmF6wEXGbl2ZZgB
 kxJX5EkgKTOP1I4/iCnoxvVM/ukWwkcxHott5v+UalHUn1ErOMyT1y7a/ghAgK1hm83JAC97WKO
 Eg5Wgmm/wVyLu1o0MDbdUKDBrEWXwzlEYmWsbqMHpLWj9wRS7SbQ2naN9etbk99X3mHxUZ5Bi0i
 Qh0cnA5CyS7Hrk6Zc5wEi6UVRdoFDhzsqLIg022JWNUcUW4WuaGe8pE7mnGRRNEAk2lbtX3S1w1
 Jq27Ak+JbnOn+by/r4A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_02,2026-11-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 bulkscore=0 suspectscore=0 lowpriorityscore=0
 impostorscore=0 priorityscore=1501 adultscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230046

Glymur has three CSI2 PHY connections: CSIPHY0, CSIPHY1 and CSIPHY4.
The binding documented CSIPHY4 as port@3 because the initial driver data
reused the X1E80100 CSIPHY table, where entry 3 maps to hardware PHY id 4.

Fix the current v7.4-rc ABI to use linear graph ports 0-2 by replacing
port@3 with port@2 for the third CSI2 PHY connection. The matching
Glymur driver data maps port@2 to hardware PHY id 4.

Fixes: 1e0c8f82d710 ("dt-bindings: media: qcom,glymur-camss: Add Glymur CAMSS")
Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/media/qcom,glymur-camss.yaml | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/qcom,glymur-camss.yaml b/Documentation/devicetree/bindings/media/qcom,glymur-camss.yaml
index a0b77edc212319fad69113f3d55ca24f184d4b23..18a38fc4f9025f6b927780f55ed4fab194091c02 100644
--- a/Documentation/devicetree/bindings/media/qcom,glymur-camss.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,glymur-camss.yaml
@@ -109,7 +109,7 @@ properties:
       CSI input ports.
 
     patternProperties:
-      "^port@[0-3]$":
+      "^port@[0-2]$":
         $ref: /schemas/graph.yaml#/$defs/port-base
         unevaluatedProperties: false
 
@@ -288,8 +288,8 @@ examples:
                     };
                 };
 
-                port@3 {
-                    reg = <3>;
+                port@2 {
+                    reg = <2>;
                     camss_csiphy4_ep: endpoint {
                         data-lanes = <1 2 3 4>;
                         remote-endpoint = <&csiphy4_out>;

-- 
2.34.1

