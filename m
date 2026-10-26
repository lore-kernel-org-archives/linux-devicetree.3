Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793008222;
	b=xs+qfq5qyUxQnyjo9ud3n5/C1f+3AJLygCkjFMlBvXf2r6rhmTy9aFFm9+lWZXBih0qg
	 d7Pyad7pSKd3SMwK/ufeqdhepZJcfyxYXkeiXIp8782+W860PGlnlYV0yyykb/UjG5QEO
	 he6Gks890lbfz1oCAJ6MRkKVLFP+U6M35aEpeGq2dbq1ZneBM/SjtOOGNmv92Aq8GR9Cx
	 MjSobvETfdfqeKaVl0TCd+2yP0ZbL9ODxRefmcfgvr1v2Aw+CcYBiOx5IaSOnqDSIKrMJ
	 nHPHHsJmjeZ5XFlXWdivBLxWM3cYnNGaiJcfy4iWzg/OUf0PmPFlVV/6E+PrMx0T3Jg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793008222;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=zKX1jeaJXKjVB7lhiiifJDbywGu1ddtc70oSnHfUUaU=;
	b=nkSoEOgslbNqsIiLr1gUZJK4UGBoLcoT4j91EnfprWZH1e8doKCHZtcynwhY+7bTZvBJ
	 jCjwbzuzhRVxwqDwKElXTsbNiqM5Pn4Yw3CIpO8AQpcafAG3DKICW+xjhQCK8KrI4GzOE
	 phGC4Gn3q7Kc45uwOqGw5zWdjle+N9e7hRG1U5U5hH5HcHlvpwrmX4CGiZmh9ZZKb3eTZ
	 iP5iVeU+IRVgjiF6cM884DcTGzVNmdNs84e3At6d3zjEoCfBzbFCDyqyWkPBe92F8uAl6
	 OotUlWIaxQzn3kwXlfG3HOOr0kSPRp3qqDKM1wp48u8X2LbpiCe8XHtQEIocuZjN8Bw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XRVXsrOk;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JiX0fFzg;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBC6D606A31E
	for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 09:50:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DBC6D606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XRVXsrOk;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JiX0fFzg
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69Q4aqnj1181756
	for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 09:50:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=zKX1jeaJXKjVB7lhiiifJDbywGu1ddtc70o
	SnHfUUaU=; b=XRVXsrOkESbp/cCSaWJSpjFpCVV2NlaUh7gPe17KKmW3HKIpf0k
	B68B2bms9+r2ilQzj1RjSNqPy87FrPtWESIpo43Xuyk7kZIxtrlgcllaxUQwEICh
	yre5PFns5T/ny2mwDdCSbyFTr7b0hyX9/WtUdNsU4xpjDDQLclxAf9SNvgv3X5sS
	7VaGsajlciZGW96Kgb+kMje1hkiqp6VclViG4zGGy9vf4t5rLFVOPsvOICioGx6/
	8MUqCBcKLF/Hqe/pOg20CXjJhST6FuwVtjZWH/2Lv/LFACiyMM77idnqB2RBFXNM
	Fnd1d9AoUqvydsk7QzBYav8NCmkEvYNdxhA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgn27wspa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 09:50:20 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f559420f3so262750185a.0
        for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 02:50:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793008220; x=1793613020; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=zKX1jeaJXKjVB7lhiiifJDbywGu1ddtc70oSnHfUUaU=;
        b=JiX0fFzgcgd7yk06M+3KTwENidi6pxln+1J8unjOw9BYLvBD+Ab6iuRQO0n87fV5Lu
         P3HY0mkE2oxievv1ZRqfK+3wJDtY8Gt2a6qMeEyDrGg9Ivjn7gWEqKfhRXDQoflRs0wN
         2P6c5+uhyjYdbp5soqad+SRRZpGvi6j1QkZNWLUcLBrik7J9xrY07u1ZW1LmD8j+oXbh
         AhI/TLEAKdJY/FbEL13X8LvS66bUzJ3LSs3OFLIzhHdmTSBBeOt32FX+7IiIsroj5xWv
         xhoRXPGZg2inW67tu3G5/1ouhUW1syGzSAzJcsaZ4Fmp99ffPc6gT6hxZeY2Xt0xJQ4a
         JIQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793008220; x=1793613020;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zKX1jeaJXKjVB7lhiiifJDbywGu1ddtc70oSnHfUUaU=;
        b=1jKhO9mH4OHjEIRrgzdQTD7smlLuMBGVTm/STPNqu3l8P51bM8VmBwhjc55qRMba65
         4Dep5/tMcDwbswCrSIQ4j9ZsRJ6izsdkx+7NbvcmH/7mepNkynE8XcI3TjuGmRvraWA5
         uxNK3OeS6y/3QA2g+MeIUaqxJxpgo5j5CMDDBTygpXT3Zwl5Ua4B5L9JsBGeeHWBzh5y
         NXaNj2QwcGNH2nVvR0hZmggLdhjUML5y/4r42y+G3y+Ywq5eh19xeSCGGjadljeyPbF0
         UnVxq7Lc9hbM8zugGJW3e/rvVmb4PWoNJy2JytZMUVnci+ikxwJuKTJY1A9w/QR/g5oB
         UizQ==
X-Forwarded-Encrypted: i=1; AKwUvBy1ySY5Jp4aETyjP7pHBsIougXvb6dYMiL9kZm2XWDnvjsle6xGuMZF6TSjNQy+31vbhEjcl9F11wyn@vger.kernel.org
X-Gm-Message-State: AFq9FYKzPAXCjC9pQSrj145OxOttUW8N1Tf1h9mszMnIvYl8U834fHT2
	OvifH7fkDR1ifC4DrlyuOZgw5rr6VYF/9BCaZ5C+sQmvmO3YSVpnQ7h5Hq58pL549Jvfj7sXcJN
	Hjv8n9vae8N8vBwa0Beh6hs+/oLorl2cHl1x63SJ0Lht35PQuGOf4lHEH2XAT8CUNZCZcPmsj
X-Gm-Gg: AYBFou1f377JcYr80exRdYWAoIY6TmrJs6j1L1yKLujik7ugOpdLukcvtw6KTGXxoiC
	8cWrI1eY2TzUK5abgucP+BJlGYsbxQX8L1nNiHBW5BTCkd4Jdi3w7iEVGnIRn3asLtPvdxyYMum
	NRZ7v6DvF1R3vdX314XYbNgtG+cWnFrJkVpX3U3fI8+yxIAXqlWFLCKBZZ2WMF6WSkLriswNo/9
	yFxxldE89MioHz3VJjhG4ufvGk/1T4dLsYWvc6TbrzTLLwSldf8R8nvibwsQ/IL1ycmyMjEIr2Z
	fxhsEfatbCaytoG6keiavHyrEdo7muVf7ObPERfGZ7aaAs+czIXleq6/BipfWgy5qMFudLl71jo
	phlvy0r79h6fWqWTQbsrGThrkjuc=
X-Received: by 2002:a05:620a:4509:b0:93e:bbda:dd06 with SMTP id af79cd13be357-940ef682ec2mr945162785a.0.1793008220206;
        Mon, 26 Oct 2026 02:50:20 -0700 (PDT)
X-Received: by 2002:a05:620a:4509:b0:93e:bbda:dd06 with SMTP id af79cd13be357-940ef682ec2mr945159985a.0.1793008219740;
        Mon, 26 Oct 2026 02:50:19 -0700 (PDT)
Received: from mai.box.freepro.com ([2a05:6e02:1041:c10:7d20:e20f:a77f:4ef7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebc3dcbsm15405472f8f.14.2026.10.26.02.50.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 02:50:19 -0700 (PDT)
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
To: daniel.lezcano@oss.qualcomm.com, robh@kernel.org, krzk+dt@kernel.org
Cc: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Conor Dooley <conor+dt@kernel.org>,
        linux-pm@vger.kernel.org (open list:THERMAL),
        devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] dt-bindings: thermal: Drop thermal zone node name length limit
Date: Mon, 26 Oct 2026 10:49:56 +0100
Message-ID: <20261026094956.2323036-1-daniel.lezcano@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=G7GJgNk5 c=1 sm=1 tr=0 ts=6adf225c cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8 a=F35qRUJZQmyXIphswqcA:9
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: 4P9PpnmclG6_AzwcsDj7zPC5M7XjfQLp
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDAzOSBTYWx0ZWRfX6bsRSnbhiRtf
 IyTSdtTFVIsa5U3ZZPrZK9n2LA+Nn2F5d5ir8YU4I8u8Ti49UGMhnown9FjKoL9ZVIcNNUR/IpJ
 oht1rQKBRpDnuzwBvwifg707ZHRPInA=
X-Proofpoint-GUID: 4P9PpnmclG6_AzwcsDj7zPC5M7XjfQLp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDAzOSBTYWx0ZWRfX0VxngAu0Mgk4
 SGLsVgYO7xU2nz7/BSBT19DLCc1B4oJ2Y5+QhsS61hoQ9mk+VwqvaZIprChqb5Pfr4smUbkHxvG
 RRFQGj/7XBPtLMZ6BvR8rogdtVg4XoPdxl0xIDXONeye2t6kFFuPF+KuEpI3p+e88CjUWcLyXWJ
 FDNZoronhPTF2LJMb8UHmG9o295oL8Jgl09KlF9iN3ucs2dA+ggSyR/+wgtlw0GPMVuQH7AOSR4
 qH6d6T4ocN5V8Y1XqvlbAMZB1Wn/97kE0crmlmYZvFfyr2y1eoiFjED0/xmqxf2LdBV3kIJq06n
 oZyW+Grf+KhFZWF8QQbWHOXqiMWeUM+9wvIKyuogBncIJaXlltztwo4k552+6Cw0pfOBy+1QZfY
 y8GZQk7lfqlRqBek6u3sNaxwM3LYarcKjFwrPEsY1lqq/vaieCwVnFhGnlVlJsvfMbLKCxn/Y6d
 U8Wd+aRXBZQCozlIM6w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 clxscore=1015 adultscore=0
 priorityscore=1501 suspectscore=0 bulkscore=0 phishscore=0 spamscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610260039

Device Tree bindings describe hardware and must remain OS-agnostic.
The thermal zone node name length limit is derived from Linux's
THERMAL_NAME_LENGTH macro, which is an implementation detail rather
than a hardware requirement.

Remove the length restriction and its accompanying comment while
preserving the thermal zone naming convention. Any OS-specific limits
should be handled by the implementation rather than encoded in the
Device Tree ABI.

Signed-off-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
Cc: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/thermal/thermal-zones.yaml | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/thermal/thermal-zones.yaml b/Documentation/devicetree/bindings/thermal/thermal-zones.yaml
index 999ad40a20d5..6091e886829d 100644
--- a/Documentation/devicetree/bindings/thermal/thermal-zones.yaml
+++ b/Documentation/devicetree/bindings/thermal/thermal-zones.yaml
@@ -49,10 +49,7 @@ properties:
       to take when the temperature crosses those thresholds.
 
 patternProperties:
-  # Node name is limited in size due to Linux kernel requirements - 19
-  # characters in total (see THERMAL_NAME_LENGTH, including terminating NUL
-  # byte):
-  "^[a-zA-Z][a-zA-Z0-9\\-]{1,10}-thermal$":
+  "^[a-zA-Z][a-zA-Z0-9\\-]*-thermal$":
     type: object
     description:
       Each thermal zone node contains information about how frequently it
-- 
2.43.0

