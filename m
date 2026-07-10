Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34CC93B2FE6
	for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 06:39:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783665595; cv=none; b=g4Q2r5lfUIa85+rS9G802D9BILtxXq+mGVgTec9yLyXVRg1EHCZ8bAkbjk/nFpUa1tBMN4lapoA1PTaNgUqAI7PhpkQs7L1KnJnappd/PePhRRXXLMRObHW2LU9g9esY2IogV4b2LFlNYMsThCaGIpdjBqaHfyukVigW1nyW3jo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783665595; c=relaxed/simple;
	bh=s597SoA0Es6E6Dx7MOn64cbXzPcD1O2u0RndGnPrgfY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pARShJ+Na8Vrki1eJkatbYxrrREeqUiPftf9TQZHZenfnkt0565MRWzo7K59hBTcmJt2rUCLGQ5cUUai9OU+I0wjT82lkkWkzdvHhCzmz5qTZcCuvZR2c1C8PUh6cs1bh3Pz8lIddmS4a4z1To40dJupk6ALpqFnAYWptx09OaI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HAzGR4gH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZXUfXMrX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HAzGR4gH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZXUfXMrX"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66A3nOcV3753137
	for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 06:39:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	musWKm/jLGKUne8nXQRelj3hjTR3ewQpv9iyDeGhvhU=; b=HAzGR4gHoQYB8czI
	wUVP2Lb6HHM1AGfqnQYE224dmkn5SZgdOAy43+wj/UAuq1tiK6Yprfi+98UuISC8
	fKtSqkMraPHzpoB94UAvl4QdmrxN8mo+oJ+302jNboQKBFmlLDuZd+BB2RJieiR4
	KcC+BV30sksCxSCm8bkii8M1KvYfa6cR1JTrYhSZxaoWt+1vdAyBc6Hg+LuviNPx
	5zjQjaaBKBOooYyYFMDhAavri+Lag99rwV/fjgjS366Ku/3wgOkNtKEpSW5j8nGv
	syhgm+euDqYQorndkuCcJSBuvCWJJm6R2zf+5xE+IO1L9af4sTaN8M0lGcDpVTce
	kHjrzQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fadvjbc97-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 06:39:51 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3810e5c5871so1306368a91.2
        for <devicetree@vger.kernel.org>; Thu, 09 Jul 2026 23:39:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783665589; x=1784270389; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=musWKm/jLGKUne8nXQRelj3hjTR3ewQpv9iyDeGhvhU=;
        b=ZXUfXMrXYxOU5mcOYXZmwbLPGCMVXSgBmM6zCwWMVBR0bK8pvFhnGsCK6m4xb0l7LM
         qSfnCT1m0WwDDX1Jt+25qcCTrbb0HGxdUMVLoxoC9d1+lpBGhzUTwb2yAYv8QKHCe4SZ
         055vBb6kT6W7W2imsKeWvuEgJfwUG3tJHJK3jYINP6AOqMcThckrsV97nNiuPuOjU3vW
         /ps180a5F7bLQAUQR5D71uH+rVVXMsXOao/0PQ6zxeL+cqn18quq9wu+i56cfimky96I
         i8FI8JgWJjhJ1/PvJfOti13pKXWkwMbAM8Q7wGfhoyCsMAs6hm4Mmd/f6M/XrITtNr+Y
         0uvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783665589; x=1784270389;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=musWKm/jLGKUne8nXQRelj3hjTR3ewQpv9iyDeGhvhU=;
        b=S5kIFWiYlOtKZ3S7fx7HD8JWWqz0K9dYasPu3//M43Sm8dDueW9+blW+49vNeB4H73
         0Q/ufAFITeqzgY2TJrIAvh9q1u4hrYTB09U6l2UZTBz4wPFryDicvws9+uTkX38Hix0y
         vRg9r/YV69nxTzTUNhXeq0Ysb1yw6UaLty4JqTn2PcF3n59OZcLHtx+CntatWFY4b4xp
         kqC6ALSL56wJFtSsHVVKbc0ocbzkDIkRiGvYLUSqVojHPTTRUnRi/tGa5t/FFJF+fthC
         MVhYJr2+nqvxcRUddwudQ7tMZRqVcQXIt139wTpyDyRmmoy8RhDhqTL0OI3KaHNB6qED
         mZHw==
X-Forwarded-Encrypted: i=1; AHgh+RoW277pcscTSvd9nT9MfAfhHyAzuf+PR4OtmwCArkkYR1E73pBDz2zbKUAz6u+cKIxXF0w06+jd/yjk@vger.kernel.org
X-Gm-Message-State: AOJu0Ywwe1IsDDxpSygLXIW93vEnPuYcxwEzA6Zlju31FyMBfrw4eWNV
	6ViReQtra2tdWL5cx6aJrZbt8YkrdMpXyNpWJQRRLg2Du2gKehhsTYZYRAhOr1SIicgITEpVNtV
	trVTjB5QhQvMIadZNHJzDncIEdQ7gs3qKaQMXUcGlpWX9vqP5YXQdyIcFf1KFj7ws
X-Gm-Gg: AfdE7clBRcOfQwZeAxiH6UpMq8q6JJLtyj37SVS6tKkSFfKPFej8ubGV1yk4YLAywmR
	7Hgz3QXEbDsw+I0f6RWRCZXGQY/RTTVnQ2cJQwYDKpGlaQJsDnEkV6/eKT2glAviUyOSMiO9K12
	/dvn/8u7RqBbVfKn8gm8YoGyaVE+LfJD7XQYtFVlxEL1vTe0LMPV0I2zVeo4MNQ/PTQ/tcpava5
	FVpZsxM4tASolHlkTebB983LYEhZEgoBhkrjeAz3blo+zdrBJnHq+JV1O6HaDU9xWzbU+5VlEGQ
	jIw7vxyMH+XiBDVOw5/PWTDxr6hAPdriZjZvDfC/Rx9J/VcIGiMpNqhLxkOiRUCBa8QD8TalBcj
	eYBrC0yfR0jpKlhbZFi+Q3wNTp3I5YZdcQ0nBiT+0NthAzDxjHpLY1la1/iZf
X-Received: by 2002:a17:90b:2e06:b0:387:e0db:3d8b with SMTP id 98e67ed59e1d1-3894395305fmr12686115a91.38.1783665588860;
        Thu, 09 Jul 2026 23:39:48 -0700 (PDT)
X-Received: by 2002:a17:90b:2e06:b0:387:e0db:3d8b with SMTP id 98e67ed59e1d1-3894395305fmr12686082a91.38.1783665588339;
        Thu, 09 Jul 2026 23:39:48 -0700 (PDT)
Received: from hu-anancv-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-313af819732sm3578090eec.16.2026.07.09.23.39.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 23:39:47 -0700 (PDT)
From: Ananthu C V <ananthu.cv@oss.qualcomm.com>
Date: Thu, 09 Jul 2026 23:39:42 -0700
Subject: [PATCH v6 1/4] dt-bindings: remoteproc: qcom: move glymur SoCCP
 pas to standalone
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260709-glymur-soccp-v6-1-16f70227547d@oss.qualcomm.com>
References: <20260709-glymur-soccp-v6-0-16f70227547d@oss.qualcomm.com>
In-Reply-To: <20260709-glymur-soccp-v6-0-16f70227547d@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>, Qiang Yu <qiang.yu@oss.qualcomm.com>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>,
        Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Ananthu C V <ananthu.cv@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783665586; l=1457;
 i=ananthu.cv@oss.qualcomm.com; s=20260327; h=from:subject:message-id;
 bh=s597SoA0Es6E6Dx7MOn64cbXzPcD1O2u0RndGnPrgfY=;
 b=tFYMU9w+6SAHzMNvdkV/x86adSmCMhi5D38fX0RisQ7ooF67HiMiP3yqdCT5fpqcDwYxbvANh
 dzHXBHZigy6C9Xth/trE+j6PynegPoF2Z1EX1XQ1x/oVKDo/h3nKYku
X-Developer-Key: i=ananthu.cv@oss.qualcomm.com; a=ed25519;
 pk=Yyv4ldZGagB5zyqtlYRdUX/L9FZ6y/INQAXO9L3wfl4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEwMDA2MiBTYWx0ZWRfXzunk1rWb/Thg
 2lMUpa/zKh700jOYjr2+HsdIrP99VTJeqMkikrcdqSCn4axaLu9dS7G3UmaryeXOFOXqDzjfhio
 VsQ9ME+rsAgBiX7RtQmEFN6kzcy1MskLE1Bl7bOzvE4ejK+3RuURCntpWto4Ue13RohJ//I927P
 w1tzDPgEbYzNDUxduhoMYC06ceL6tM9zM5VBNGT98bWP4uF6csuKj/8vvGSB/BbD1Y+nJQOpvP4
 g8ZUtcD6WmnXNyo9TXPPyc0iqYqKvgPzTooApuXqN7I5AHa2IZDOoCnUWnwwhDCAV5E5pYiQgN+
 LXxEUPFz7Hv5lcnFGQnCZ8fxR4s64Fx97ETSpfYeBDs4QOrCaXDD3kqEm+mwS7tj4KIviwWFWi0
 +afhdaMQwkgC5AaTPoZ/3Jgm/iq+SYNcNSyDQNyasp7be7W1Q1bcLUcRToNsl5ysdZEnN3p/D4F
 NMTb6TsZIn2/AS3SwDg==
X-Authority-Analysis: v=2.4 cv=WpIb99fv c=1 sm=1 tr=0 ts=6a5093b7 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=-Y8H4alDMU1xk5usMAgA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: r_CPZ75httLSbcZVNElrBFmoPhqcXock
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEwMDA2MiBTYWx0ZWRfX9b3n8MdHq+DH
 roNxwDugaNp5RGm50VONXtcMayhf3EcdXNWL0x+2V+N2le+IXqXunR9v0Vkw7Ni5/cSJ9pby6Da
 Ll1VxuFsZrJMZjMWK/mxpJoEdO6+BK4=
X-Proofpoint-ORIG-GUID: r_CPZ75httLSbcZVNElrBFmoPhqcXock
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-10_01,2026-07-09_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 adultscore=0 lowpriorityscore=0
 clxscore=1015 malwarescore=0 phishscore=0 spamscore=0 bulkscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607100062

SHM bridge creation is required to enable memory protection for both
remoteproc metadata and its memory region on Qualcomm SoCs like Glymur
running non-Gunyah based Hypervisors, unlike Kaanapali.

Having Glymur fall back to the Kaanapali binding is therefore incorrect
and breaks subsystem restart on Glymur.

Fix this by decoupling Glymur SoCCP PAS from Kaanapali and registering
it as its own binding.

Fixes: 8b54bacadc0c ("dt-bindings: remoteproc: qcom: Document pas for SoCCP on Kaanapali and Glymur platforms")
Signed-off-by: Ananthu C V <ananthu.cv@oss.qualcomm.com>
---
 .../devicetree/bindings/remoteproc/qcom,kaanapali-soccp-pas.yaml        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,kaanapali-soccp-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,kaanapali-soccp-pas.yaml
index 8fd6913e414d..e6c78d621d17 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,kaanapali-soccp-pas.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,kaanapali-soccp-pas.yaml
@@ -20,11 +20,11 @@ properties:
     oneOf:
       - items:
           - enum:
-              - qcom,glymur-soccp-pas
               - qcom,hawi-soccp-pas
               - qcom,maili-soccp-pas
           - const: qcom,kaanapali-soccp-pas
       - enum:
+          - qcom,glymur-soccp-pas
           - qcom,kaanapali-soccp-pas
 
   reg:

-- 
2.43.0

