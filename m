Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 249D94446F6
	for <devicetree@vger.kernel.org>; Thu,  9 Jul 2026 18:42:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783622567; cv=none; b=Nd7fuAhhSTHKp+uo9UO3t3vidnFRbzXMByFP55SDvbsUJR6gDma+2iLc9hBOoRCW0al2MOvuPx3dOD93ET/7FoIRpYb07aNrCKuQ0RdeafyxibUN9I6oAM3pK+6TaEBbLqxPIMQDs9+LTQOQ5Ofp2FEF0hHyzy2Qt7Yq1Oj0fj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783622567; c=relaxed/simple;
	bh=rYZUtLoMbkIwkI8yFMTr/hVq0ZeMXm4yVfo/qe4LXmc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RDe069swAU11kt/o7Fz/VPsamluFpexN3oozrOehB44Vx0ZhAa++lWj/85LiTtbTJp+s08EnWQmQYidLWhOYWUWRA6gtOt3j5LN6Dnm79NAc7y5L50zr4W6C+jfQV+IB+TdMCRbb/LYw2hDn+x26Q/O3KAVZ1Zfk27JY1laExf8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WXBqxrOa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QVQcKi3E; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WXBqxrOa";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QVQcKi3E"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 669HYt9G2424499
	for <devicetree@vger.kernel.org>; Thu, 9 Jul 2026 18:42:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	exxwhZMTU/he8IZUkUT7QVw1F7W+mPM7cjzl+8AkNbk=; b=WXBqxrOaqkH3Gwi7
	ynIky3z5jsmrx6eW1ol8QXMfbBkHdq0Fo/t1FgDFME6hbvhhLUC3XFMsrar/swQJ
	FOQOjeFamd2ipwcVMyQnGiI5i0MkkINOC2QQqMTb2ei0OMkVCMzWB5f5A2rzC5O5
	8b6hyFb/D5Fic+DbEa/aax+aXxDqQz6Q94skVrr+LfXNp+sW0C+MmsrWUDMntbKD
	lu6cyJWPNtmdqTJKnZ0ON8c0W+wpJA6kcnMcMNvQpTJs6i4ToEIpmO8pAcIhQ6+i
	9ubALVyFK/yMyZ5llIbwQ3/ObPzRPtWItKkS4Y/e/Aj97o/JPSKz+Op0ipn4pbhC
	46qdVg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fadvj9498-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 09 Jul 2026 18:42:45 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-381ed6616f7so233254a91.1
        for <devicetree@vger.kernel.org>; Thu, 09 Jul 2026 11:42:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783622564; x=1784227364; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=exxwhZMTU/he8IZUkUT7QVw1F7W+mPM7cjzl+8AkNbk=;
        b=QVQcKi3EQ0qaAOcSj3B3OEP56Q3DT0G1BfCnpUID/Ua/KSBPxQqRWbiP4cwMu+GzQn
         SXD+bgfgEG3qa4Q5FBmxR7lTzks7muEa+eZcvqCv3hAiY3A1SYFps4OM4Y/k206iT+lX
         91Wx9Dz9woYTH/WEWIqVaGQuQ2DnIDKiFKmI3bOvCqplxLBt0ob5cs9NiOdl0umIpeNe
         VKKOMM/wDpTEjSROdxYl/fPW6BiLBsIbFD1F1CSYqsneCY7cHDpUTwicBBatPP+YTded
         zGF/FT8b2ddMJAVSRJZ+Ty2nyoPSpifn8i9ucKaXL3lXhCc7DYv7Bui3fVfnPai9yQFe
         nXgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783622564; x=1784227364;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=exxwhZMTU/he8IZUkUT7QVw1F7W+mPM7cjzl+8AkNbk=;
        b=bx1P3wryDUG7EVQvIQ2E1JST2AuCLxiR8qYXmNmMikOaIqJcv7QeDhoBmVOHTiZTOu
         wa8EnOQCB/I1TcxPyKog4RoC0giB/4y9D9u8o0sUPnszeUccR+dyEwqg9RQCgYkRxClv
         4hIuFxDFgZsR1r5N6Yx+qWZFLljDio1Bk92lOs1wT0ZjP09Z6VC6rwTeWTbP5Njy4dbM
         ulhBfccB1Rt646LpSdeHE2jgiRLjuEHFa9ZYGz4x0KYQ9B5WFf1QK8Q2+dCqzZsZqwT8
         sK/mXPx0V36KjozuJV1u0Ng/vNrIGuHkX6KPzFSEif/LmZe18HjxCbw6lKgNGbPa/8KS
         nHyQ==
X-Forwarded-Encrypted: i=1; AHgh+RrIURuCWWci8s/DtxnQIM2cKCe7Z690I3lFzY3zePWWGFd8256JXpS15by41axaQhbsbqWB6CJ61bFt@vger.kernel.org
X-Gm-Message-State: AOJu0YzSIXLc46LYccI5Ut8lu7yAdouV1q+E8ufg5NLhlFazopcFdxUi
	q+cqpudUWaR2gPMOYUbAjmHL+o4zFMp4LVQpfXGPZ9t/jtLBznQoGhI0IfHh3DqMXM+AKcvVZw2
	J7j4sdTRjtFFz7edL4E6y7Ro839LtSFK0c4goHzZMfQbicZmndKkCttwOTwtcKBQh
X-Gm-Gg: AfdE7cmPVUOR+Li8cWWbUlQJGCCxag+FrYTk349RBEYbvSj2arNUl4zJ0V6aJT3SEAG
	1+xKozk/VTRWGModU02X3WF9s+OKfz3ockzfKyanpxH+pkZChyLdpJ0xbasjom8xFp0LUk6abz6
	tNx6g/dGSlX6aTxBlRT9OvVG7Ez8Epc5rOPG0G6TZsIA5iE7pfNuf5Ex9l3jLceTtZ7pxVl1IG/
	4opft8eeaw1RYrXAX6sWOciPWtvb3sVpUZgsbzlk9qyGySIKZj4WooUTBnzeE1jRMlcp2zrVXpL
	FFiFOHI2udNjfBcPr0c0QAyuef/10phaKsoN8HTOh2tUEez++NWW8rGP+bhQYK/2NSvEFmnij8k
	eBogYwtnnaqso70X5b9chIpdkVRRdBS69eAU=
X-Received: by 2002:a17:90b:4d8d:b0:37f:db06:229c with SMTP id 98e67ed59e1d1-38942f7105cmr7852568a91.22.1783622564153;
        Thu, 09 Jul 2026 11:42:44 -0700 (PDT)
X-Received: by 2002:a17:90b:4d8d:b0:37f:db06:229c with SMTP id 98e67ed59e1d1-38942f7105cmr7852522a91.22.1783622563682;
        Thu, 09 Jul 2026 11:42:43 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31174a56848sm34205652eec.16.2026.07.09.11.42.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 11:42:43 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Fri, 10 Jul 2026 00:12:01 +0530
Subject: [PATCH v6 2/7] dt-bindings: display/msm/gpu: Add support for A704
 GPU
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260710-shikra-gpu-v6-2-b388ec5dce77@oss.qualcomm.com>
References: <20260710-shikra-gpu-v6-0-b388ec5dce77@oss.qualcomm.com>
In-Reply-To: <20260710-shikra-gpu-v6-0-b388ec5dce77@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux.dev, Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Aditya Sherawat <asherawa@qti.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783622535; l=919;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=e0reXjU4841qQsB76OT4bfKmGmY/z//RRWVRYHDWGzM=;
 b=U1bXBRrZl0X7p4f7phkaOBLRRIm0dBDAxAxqeraekRPEoZjymcovUAG/9AJRQPrN14gyQCzS0
 cOS+uX42ydIBnzzAcoCdQhe1IOFCJGt5PmboodpVnhVnhZ62hx9ApLI
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDE4NCBTYWx0ZWRfX2Q3cF80yoktE
 IHZFRJ/DeHiCwo7IeYBwaPWQb37AWbNOmQRRDTLE/X1iyICgcUKQOVgyj0HY1IaAxJiDD7JP1Ti
 q8mcGl8kMlUm/7BgVPmfrebqYhGW4GEi4Cz4tQNKl7q2zhLEJbvjH9W0jrQZYDNVxvJVrC2vGmN
 ni4RkSMjm+pMA8JapcXEQ9+z1ZWEEIEBsgH/24WyvOFzbXurINLd3nQ7/SCtwA+RPGWf38zMV/4
 zNNAs/0P3Nm/0fHN1QkN7TfS+rPnoQkY08A8Z91zulyZ2+b9Nb7ydDLPmCOuJHtTQ7evfHhp75i
 sWEazFK3UeN3h1GdtOO2UZl0M8a1PSxkYbFPj4g7j5Ubul7ulGnDVuoB1Irys7a2CnEz+kas0rk
 mjdHibTAfg5Q6O8dREikg9xC/sRkW1DyrVvc/Fg8Ulfm1N3bF8c9Dws5kRm0B3BF9NGAastI8SD
 FqVj1FDYEIWVzKIJ9OQ==
X-Authority-Analysis: v=2.4 cv=WpIb99fv c=1 sm=1 tr=0 ts=6a4feba5 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=0BLMfrXV4dllX2mv9u4A:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: AXk8wOgDtslGBlqcaL179GZ4anGGkyop
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDE4NCBTYWx0ZWRfX7OAKUknA7RAh
 iKU5+9j3IzgtlhfXFv9W5m14l/i43zQvEQwRlKi3aFJrSOtbe6yIcBc53uJ7IMOG493egKvCVZK
 cj51fCtSf/5jSBW/jF0ReCHiTMcY6YA=
X-Proofpoint-ORIG-GUID: AXk8wOgDtslGBlqcaL179GZ4anGGkyop
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_04,2026-07-09_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 adultscore=0 lowpriorityscore=0
 clxscore=1015 malwarescore=0 phishscore=0 spamscore=0 bulkscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607090184

From: Aditya Sherawat <asherawa@qti.qualcomm.com>

Adreno A704 GPU found Shikra SoC is an IP reuse of A702 GPU with very
minimal changes.

Signed-off-by: Aditya Sherawat <asherawa@qti.qualcomm.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/display/msm/gpu.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/msm/gpu.yaml b/Documentation/devicetree/bindings/display/msm/gpu.yaml
index dbbd8b814189..8e648bfb3b23 100644
--- a/Documentation/devicetree/bindings/display/msm/gpu.yaml
+++ b/Documentation/devicetree/bindings/display/msm/gpu.yaml
@@ -353,6 +353,7 @@ allOf:
               - qcom,adreno-610.0
               - qcom,adreno-619.1
               - qcom,adreno-07000200
+              - qcom,adreno-07000400
     then:
       properties:
         clocks:

-- 
2.54.0

