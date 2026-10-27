Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793104525;
	b=Lp09AED9hS/AMq/g9F78f8QuXN1SSBoZBWWNHmFV2yD2DI8HPZYpb8Hs+3XkdDOvpGAe
	 5vkt2eYgNegHix3Z6VNoL0v0l8m/SIuF+VPSyeEKtxWiCZWFKJ9ou+iNYDjeXOtR/FYBc
	 xd/MmrI82w/VHBqZWK2AA7P73jkkSvAxAtr4vdHI3SkBKBo+0mNLw7mu5GP0Ni+BgbWop
	 4NSKqec+K9URl9Ks1FWMTvm7TjwpvZTTfJUV3iyyKFzKkcKU/ske+vvksUekh0/J1ozIW
	 RTwOFTpygf6LF7bf2zRHwESFYls96WCVLIqZ1oev9XV61I2hBoDgc88eCwgn6ZuIAGg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793104525;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=dUg5dX/Iyj3+xcEdcf3gOFDKbltB8d8ZVgvvQ64fkzI=;
	b=Ou1Gp9WI55LcCvxBbr1TYxU2ysZ3nxrXoQspLX9PRZdyCnO2dmLc6wY5wiHBOFbdxFgo
	 pdNCMrsIRDSo4a9KZftPK5x/hHXkEPpd/nlITeaGEZY6faZumdwB18kbAX5FhnT0V2/nV
	 kd9GIj+e46K7BrF8XMJkf5MYEEI2nY4WKKUSx82Go51Um2C3idyYIK2enfeqnAu631J37
	 t+rWJXn1FUSV6v36ZJzzvR5Kzen+LUK25z2yL2NUXjvhx93voLgz5pdiOtu8s/jmZLTpo
	 2nCPHkmwGxUx7uTxlfWfmBkbh7HNh0k1kk4ScGJFKZVjc6Ssb2cNbhyNX9AjlM2iNoQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kSARHC9p;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PDN7sIEj;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C158E606A323
	for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 12:35:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C158E606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kSARHC9p;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PDN7sIEj
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69RAe8kS2458558
	for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 12:35:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dUg5dX/Iyj3+xcEdcf3gOFDKbltB8d8ZVgvvQ64fkzI=; b=kSARHC9pIv7rT6Qc
	DNQ0xudpnbuLzyp33PUPFKhNGszS10J8MMb5fi2QCCl1k9OZn0l49F/KFJqFbE9L
	xc6QWikzNWBwC/SF0MTO9Z1Mz19aYiQyVlaSrx9l8S29RKzRdJApyxQQkvO3EgB8
	k9b1fzhaoYV2kOHkW2HDEvRJRkY6LuaT8GW7rK9A5bIrR7lg5yB5ik9OSgfDKnie
	BYrJZ16f98cCcur2bhXsGKAnANxEv1HF3fFEYfSri51fGPAP7LbZyqWQats0aSo9
	9ubJEx3mox4AUcQWyRzqUQXNS/UdgAoa/Uc5o0xPGX85obR666OD3PSIW51JHjPV
	5MenUw==
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com [209.85.128.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjjbta8tf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 12:35:23 +0000 (GMT)
Received: by mail-yw1-f200.google.com with SMTP id 00721157ae682-8b0adb0b8dbso64570977b3.0
        for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 05:35:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793104523; x=1793709323; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dUg5dX/Iyj3+xcEdcf3gOFDKbltB8d8ZVgvvQ64fkzI=;
        b=PDN7sIEj/OiIxLqIes0gwT5vZFk1H4e9vkm9BTdoRqRe3jbUggUHzAzknzra+h/HIH
         7Fxjr2STkMHP2T7cleTTkr90iOQkkBV5o+UMoKHXZ9ZXnk0BDpAVvtWd0H9Pc46sIjsk
         m17ByaR/aGwl9cbLf9URxNdLQkL9f6C//j+eaJ+qT1C8BPEQyvVhE/Nd8qj6/FK0/wQx
         zpkyEL0oblzFIo7iI+ynWCo5ffs/Gefw8XrAcpic578S8XAdWxWZ2IbRJKr7U2nocSbs
         aMS2pKIIjBxR9VH1XgZXu8ZSalnGrnnUCL2Hcjp3SaAjvdKpjxpRF4ES0A+tQwU8udYe
         zOYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793104523; x=1793709323;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dUg5dX/Iyj3+xcEdcf3gOFDKbltB8d8ZVgvvQ64fkzI=;
        b=fjZFTJVaFKDD6kaTzVA14tDEAW8wkoVJWwXGvRVMoHUABZ1pQDFg4EfaGCSLhegnPb
         +KzpwcmrKpO7H37F9LGmrNlqvf/Y6OoX12XK9PKyqnelDZ/cUXq1KzcLN3B9iA9I89Lz
         ibSw1MrfCaqtsqHBAezpuCPnQZX3IWe2t9BOxv2AixkuzKnevWiKpjp1VjBMTKWgqH4Q
         nJj0mODIyKi0NOpFk7t9JAv9hs40p/HWtFquN5Fd/Ruuwue+BflXqizAuJlVJSg/C+JW
         JrvzbFCAiORBfUHVfGuKFYTFyIhbU25HWwLvuaP59kT7aVZZli/yGHEcc4fg1Yimjldb
         Ks/g==
X-Forwarded-Encrypted: i=1; AKwUvBxj3OhU6WvSJ8rjuoJpyHwhJdtXv3EADLt1Yh92dfIQMqVC7a/lqIKxwV7lSIo8tVGXs7k4nma+pSYo@vger.kernel.org
X-Gm-Message-State: AFq9FYLF3Lh+3P0wVl6EglE+tFro9fQUFgVN7ovsQYSdur43ArKXqziD
	FGrck8wNkpfLh3IIG+zD3s2NEkWLBdkrTIj9k+Hd4Be6DXhpdkxer85MEehPZFmzpNDeX8RkKA4
	1i/2rf8IBFhVbd7fAbdnxTuL4xYKpWYrdiR/Bh+koE+SF2iRjO9rGVICfHAoNuwZi
X-Gm-Gg: AYBFou0yqBA74C04EWnO4R6yPWyawDl1jjep1gXZGTo6lNH59iIqPY7L9nvJPlpTpRr
	ALU32V05EDKLMUA9WKaIv/FhlF0Q4GiAO7rlemYpRhG5kIMt5u7B3rmgszfJELcLmMkLeC4BXva
	HhO7qFNRtWnXKnzgqjAd1TAMuRxAuOWzrc7S72IXBfTYjy2ohiuy5mZqhL1ZpxU8cbWQcudD006
	LmZU6vEg0wxTE0Occb8nalrtIpc9Yd1VsG5DK0dHKpeguFVYIoRNMh8itE+yzvJTDIBLQkqxw7z
	pXU2cGJu8wxAHdeJi9m0c29nWs2mDyAPDz0rovguizstaJJtOnFX0lOvDHOvSspuPeFi6eobgtm
	ixcnM/tiEEBZEaEFBcg==
X-Received: by 2002:a05:690c:fd3:b0:8b0:de8c:a3a3 with SMTP id 00721157ae682-8b166cc62damr80032007b3.69.1793104523147;
        Tue, 27 Oct 2026 05:35:23 -0700 (PDT)
X-Received: by 2002:a05:690c:fd3:b0:8b0:de8c:a3a3 with SMTP id 00721157ae682-8b166cc62damr80031767b3.69.1793104522417;
        Tue, 27 Oct 2026 05:35:22 -0700 (PDT)
Received: from [10.213.109.130] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b19e57d131sm10413507b3.20.2026.10.27.05.35.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 05:35:22 -0700 (PDT)
From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Date: Tue, 27 Oct 2026 18:04:18 +0530
Subject: [PATCH v5 1/4] regulator: dt-bindings: Add
 'regulator-off-on-delay-us' property
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
Message-Id: <20261027-regulator-off-on-delay-v5-1-f9c3b128c6d0@oss.qualcomm.com>
References: <20261027-regulator-off-on-delay-v5-0-f9c3b128c6d0@oss.qualcomm.com>
In-Reply-To: <20261027-regulator-off-on-delay-v5-0-f9c3b128c6d0@oss.qualcomm.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Saikiran <bjsaikiran@gmail.com>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793104512; l=1438;
 i=jishnu.prakash@oss.qualcomm.com; s=20251014; h=from:subject:message-id;
 bh=8ZlC6sJQp0U3FTSKTP9WDG1CV81XRr9JEfHI8yU8VFI=;
 b=/hPOEDNrc62EetvSsVAYKEj/2yA8UIrOp4yK7jzuwlNRf5eES1bVf/l1yc98V/f29ge5qKXJq
 +B2K1PTKPcsCibm9wVwWF2GOb+B0CRFIENx/XeteZ/tIud+ahZX6Ube
X-Developer-Key: i=jishnu.prakash@oss.qualcomm.com; a=ed25519;
 pk=g89pXdLVwRjdTeQ+uX1QzvBO346E3hQAc1N7fcTXgmk=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA1MCBTYWx0ZWRfX+xtPh8DnBSA6
 o6k9QdcA/gIgUwKsVeX5RhP0xmHxcrEzdx4USRsP6qDMXrEzqFm9CrY43wNeqcen5yc9nY+1BoE
 bx4ARQRpiss0VplwvXLzEmBZI6v8jSg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA1MCBTYWx0ZWRfX1/H2lp4A3izD
 tQT8kJX+QSMoRSOiozPdQqd3pkxn+srcyEi5EG8c+9L3a4mq8hTH70OBVP+OfWjNs4u9U2hNxQW
 MGhSwUM6wgDwr+h/DhtRL0bKs0CAIE5P+n34+sSggFu0np6eSNSW+POUqSqboKgJxvN/t3dBssG
 xPbHkuXaXSbe8GHP7mmCGhSTWnG1nUZs9R3l4Xw7P/Rj7fgZYFyZMChMv9tuTs6DJqtAsBpI6dO
 M8gxkKDpl0MglKdXyu5Jf4uG9oHk8IbnZ+rm6c+C4r0wL7kB1RJI/EaQ+baVI9DoEEzRAgDFWYV
 vZ5PXISYISNoU9VssPGoEUFkqw0YswHaNDQnlEeG245fFrvmE48W61+0gUl/U5zqIGSKSZWv2uw
 T2j4pYOP+vvlz7LHIpMpQ+eXpB2LZFyS/9kE2ctGOpRMObCyeuypMhLzPue6Tx7hOeE0YbSGuWB
 m6ZQS2o0dpShmY7gspw==
X-Proofpoint-ORIG-GUID: aN_ktGFEsJHNKy3leaQVMr5e18MXO2oi
X-Proofpoint-GUID: aN_ktGFEsJHNKy3leaQVMr5e18MXO2oi
X-Authority-Analysis: v=2.4 cv=XaIcX455 c=1 sm=1 tr=0 ts=6ae09a8b cx=c_pps
 a=NMvoxGxYzVyQPkMeJjVPKg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=pGLkceISAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=xl1xDpuIGGFnwhC4BG4A:9
 a=QEXdDO2ut3YA:10 a=kLokIza1BN8a-hAJ3hfR:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 spamscore=0 bulkscore=0 priorityscore=1501
 clxscore=1015 lowpriorityscore=0 suspectscore=0 impostorscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610270050

Add a new property 'regulator-off-on-delay-us' to specify a minimum delay
between disabling and re-enabling a regulator. This is useful in cases
where a regulator discharges slowly and needs significant time to reach a
safe reset level, and re-enabling it too early may lead to a brownout
event.

Suggested-by: Saikiran <bjsaikiran@gmail.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/regulator/regulator.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/regulator/regulator.yaml b/Documentation/devicetree/bindings/regulator/regulator.yaml
index 019aeb664cae..73e1bea87adb 100644
--- a/Documentation/devicetree/bindings/regulator/regulator.yaml
+++ b/Documentation/devicetree/bindings/regulator/regulator.yaml
@@ -243,6 +243,11 @@ properties:
     description: Maximum difference between current and target voltages
       that can be changed safely in a single step.
 
+  regulator-off-on-delay-us:
+    description: Specifies a minimum delay in microseconds between disabling and
+      re-enabling the regulator. This is needed for regulators that discharge
+      slowly and require a significant delay to drop below brownout thresholds.
+
 patternProperties:
   ".*-supply$":
     description: Input supply phandle(s) for this node

-- 
2.43.0

