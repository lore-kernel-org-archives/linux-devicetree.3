Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D6043DE440
	for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 11:59:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784289557; cv=none; b=CexmvrKkxqQAZAaB7f41nKBk6P1wjfIi43289P94adBd5C9JVMgJV1vX985l5KtFONMetZVrko5xTh/1dL/KSODqDZu20y689HuHR+9d5P1ZFlNFg4clvBMGnSog+bNIS+Q11mnJ2lKaNyyG/ZZYeeDkTD3IkCZKCkq7jC/Mkq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784289557; c=relaxed/simple;
	bh=zhAF3clxg2d4IEdqvRWULHoq8pWFPYQ8gc/wyjPetms=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rMStHWohQJxzjQET7hrLK7U1fUmOmfRU/arDKSsv+crzS7m2BXTlu1hgj1aUADN7u3N0zm/grNsD7xhuK40I5dNtLJ0tWkXz3RcPpghhQppd1e6hGb/ucfSah51DoR0G0RzDKp6TL6RKY5U7weHzbOWEWFf7sf3qN6NFrhGMUY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KvDao+J1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LOqLZ5sy; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KvDao+J1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LOqLZ5sy"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66HASdCr1191153
	for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 11:59:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zPUqEZcV6Ndhoz2WcNYj/6S/xhagxfKu+O5tgE0FQ1c=; b=KvDao+J1EEYMfDgj
	X8wgQb1Ga2cq9iQQQSNdzyMHCNPxd/diNFlckqFvOojsG0H3XyMJDH9uwmDjUnpS
	AigFrUvyoV9GPH7X+94YWGf/ZjVrnvSnEzIgFo4kGIV87K4tofQIIbpYA/GXRlU5
	ZJJDA8B9SCs4jGu6ouXPRDsytc6HkLwtUabYIE/Yf536MnpcgKoo1ziJCBRLXceC
	gfAzE5PUAbq8UMZdPRxpxwGuI6FgwgGVPkyy+HP/FYM4BSq7ZLAUvt9VMgGOwcHJ
	+CCqVCijYQ4Hjwib4xGoCDa1ZqfZ++XQRr6rBoBwpfeffLFs1a8991q1m0i6WR9M
	/L5LeA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ffj78rcux-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 11:59:15 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2cce870a060so138790435ad.2
        for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 04:59:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784289555; x=1784894355; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zPUqEZcV6Ndhoz2WcNYj/6S/xhagxfKu+O5tgE0FQ1c=;
        b=LOqLZ5syKfaTWSseDXZIb8eEWTJ50LM8H0cAbUz4lp+R08P11GBmVCC4T4WFBYJuch
         O5Bo2pNyDrlSrDCGxHcsNO7gCVo09fWe7vH17R1i7WxxWe4ySKGDyJqlrjzIcRvKeE26
         YMzhpBBYqTXxo4vqZC0SwcmqCkw2/H7dcmDhCyX3i9IK88jLZL0ASpH/9rZ/8KHhO1dn
         pg/s2eGxYZIlEajmq1YyaV31d+zzO+7HSCYfF0uzNG9FUsjqDPWvbQpUYNaM/P9hksKG
         xLondSHP6lWM9y8owndhKJyM3BQUAX7dZsbbj80RVLtYn6LhGeLJsY3Kwb5tiMEroO6o
         w/QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784289555; x=1784894355;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zPUqEZcV6Ndhoz2WcNYj/6S/xhagxfKu+O5tgE0FQ1c=;
        b=Ofsm1uc44Mm+QH2/zhjXlM16hgclDPcAw+rf/OSv+52UWPWSNO/GK5mXLv1l8G6Cev
         ABf3PlzLrx0mhPRP0ibZ55PuX1h7tRbDqkLl5MJq604hurnai+6p4Pel0SjNu/KNREZp
         VgeNfepqXtDBC2IAE0Yr1Q1kLik8Js7CsVz8nzxSNC51AWsF3X0tFy2G5i1YrjkPSA2P
         qFkL3djC8TGTa10otpkA2y4t2PdEZRIvSCklVtNIkmZm5dNB4uMVd213ede0dTfXhWnr
         sVg7XyIZPwAJQrhI+xjZTAKddKCet+A8FnvyQb748zzH2NOXKvBjKzByFYQmO/wQwxAY
         HgAQ==
X-Forwarded-Encrypted: i=1; AHgh+RpysGaTIxz6+JiL0r75j4ecM+CLHAD1yjTMow7PWEq1kZpcsqxCExigXtPoq5/DwcaUesna4lZ3mk2o@vger.kernel.org
X-Gm-Message-State: AOJu0YzbaiciXcA8/aZNoBmLcbVaXPFp9/rObfXk3slkTHCl9en4sYrE
	sg/Yi7krZK9RhWGZeLPd3F4idsfvW0TZ/UQIJZByViePSQ0y/+W4kaj/51S/d9YJNNkpTP7vtnY
	FPtEOcpZ1TlrsCecfwoEaAw2CYQM3M/F75cWU2veG0x4RUINc1LDaHlDaJxv4mCPl
X-Gm-Gg: AfdE7cmxodN6ayUL/FKbUxXWG7uUK5o8N9z4ydBgOQvsvQbHGJORXZ9eZ8I/HSTpumZ
	GToMMmMuxv628HK9h6n6FNZqfFF9foGyKpZLpyqcOB7MMHxsjasbcKvl8hXTCIWDmoHqAsZv/zQ
	09i4laI28BHJscZuX13/4sHoXtGtlBHfAHNBqsELdSkmIBgEaBMUgkU3nm/zV5NXUVB6LhtU+b6
	1AFXirRXdWRJKZ9nA0/NFGDZuJaJ+imJwfT8ymn7fI0zn/cDJkonGu3nFEOOwm0W5QZjQh0QUgW
	2jRmaPLWZFjCFKk0GHDsHjdGTtU9OPYrNXLHQv5FadBdFiLuq9mdksc7NzwiFTokWI6TSK0uOs3
	ddEzYa/xngeOtM3Nb
X-Received: by 2002:a17:903:a8f:b0:2c9:abe1:c352 with SMTP id d9443c01a7336-2cf3485335emr25318665ad.13.1784289554748;
        Fri, 17 Jul 2026 04:59:14 -0700 (PDT)
X-Received: by 2002:a17:903:a8f:b0:2c9:abe1:c352 with SMTP id d9443c01a7336-2cf3485335emr25318415ad.13.1784289554299;
        Fri, 17 Jul 2026 04:59:14 -0700 (PDT)
Received: from [10.213.96.151] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf346da07csm9444305ad.52.2026.07.17.04.59.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 04:59:13 -0700 (PDT)
From: Pradyot Kumar Nayak <pradyot.nayak@oss.qualcomm.com>
Date: Fri, 17 Jul 2026 17:28:34 +0530
Subject: [PATCH v4 1/2] dt-bindings: input: focaltech,ft8112: Add
 focaltech,ft3d81 compatible
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260717-add_focaltech_ft3d81_touchscreen_support-v4-1-5dd091e25801@oss.qualcomm.com>
References: <20260717-add_focaltech_ft3d81_touchscreen_support-v4-0-5dd091e25801@oss.qualcomm.com>
In-Reply-To: <20260717-add_focaltech_ft3d81_touchscreen_support-v4-0-5dd091e25801@oss.qualcomm.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Daniel Peng <Daniel_Peng@pegatron.corp-partner.google.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-input@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Pradyot Kumar Nayak <pradyot.nayak@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784289543; l=1172;
 i=pradyot.nayak@oss.qualcomm.com; s=20251128; h=from:subject:message-id;
 bh=zhAF3clxg2d4IEdqvRWULHoq8pWFPYQ8gc/wyjPetms=;
 b=xMgWkNyP6Z6wk23Hs2Lb7jJeGjb8wLnxlixolqTuG0i8CxVq6jTzTkI4gb+s/UFIvjtL8kkGw
 AuxMub2H2YVAPDcd5VSbiJQFQXSlA071SWDLqRJQoCh1OCC+bKQ1Xxe
X-Developer-Key: i=pradyot.nayak@oss.qualcomm.com; a=ed25519;
 pk=ZAwwH8thDSb6bq4dCgFHWr80BqB7MmUAKogkd9BsiXM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDEyMSBTYWx0ZWRfX+oFvsZldn+sL
 aDh0EWVDwyqshFsVHtGEdWbFzBn6UWyUPLRyQ2ChZ8AdnD7HyQpXB8zLkbOLqKmN5kgTRlAFWDb
 Ke7UCZgGSzdB0mGllAgo2OR6Looe+Fmrcvtpg8GbM5LGyNpq8EsNvX4WL1AXYW679Duq+bQWR2y
 lhAMGw71KqkEaYORkz/a2PcRKDGslINSSDsTKUDHqyhaHC81qiOfu9UEmD2dEAcXvf/ObFUhyx9
 2jwPzLCf6G8IFkBCrY9a0huV1B4mMVOw9ud6yOq0Uv/M+lhD27qEPUF1X8sA89vd/QsVkeA8uFE
 xrT0pGzKhXEGV2asoYHxJao5RMxUM6kiSri5pAbORJ4S9nOdZKI7M5OTDlIIxffWYlS8n3WVC5z
 P8ubCSp/Za0lL8a2+TJfcCdVT+VnMXT3LlYIyTooHYW2zECO6JEBGVxd/f1g/aNVT6GEnZZscWQ
 8UUopBzDBHpVN6k+Fqg==
X-Proofpoint-ORIG-GUID: e2eDkiJexCJh4W9Fq66r2rbSNtfK6EuG
X-Authority-Analysis: v=2.4 cv=U9Ciy+ru c=1 sm=1 tr=0 ts=6a5a1913 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=dn7p_KMudBFJuDJgD_8A:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: e2eDkiJexCJh4W9Fq66r2rbSNtfK6EuG
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDEyMSBTYWx0ZWRfX0oPaLIN+U3iT
 20HasRDV0lkZ3zVtEPHo0pdgX8O6mFqYCvO1QAZExeu6FTgcYykx3a/p9JrNwdLSQxDf3EHfmhy
 7QbfJQNJzLs22oHq4aw1G2ffDnddypw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-17_03,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 phishscore=0 spamscore=0 lowpriorityscore=0
 clxscore=1015 priorityscore=1501 malwarescore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607170121

The Focaltech ft3d81 is fully compatible with the ft8112 i.e.
it uses the same I2C-HID protocol and the same power-on/reset sequencing,
DT nodes for boards carrying an ft3d81,can therefore bind to the existing
ft8112 driver without any additional changes.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Pradyot Kumar Nayak <pradyot.nayak@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/input/focaltech,ft8112.yaml | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/input/focaltech,ft8112.yaml b/Documentation/devicetree/bindings/input/focaltech,ft8112.yaml
index 197f30b14d45..5ffa1246aba1 100644
--- a/Documentation/devicetree/bindings/input/focaltech,ft8112.yaml
+++ b/Documentation/devicetree/bindings/input/focaltech,ft8112.yaml
@@ -18,8 +18,13 @@ allOf:
 
 properties:
   compatible:
-    enum:
-      - focaltech,ft8112
+    oneOf:
+      - items:
+          - enum:
+              - focaltech,ft3d81
+          - const: focaltech,ft8112
+      - enum:
+          - focaltech,ft8112
 
   reg:
     maxItems: 1

-- 
2.43.0

