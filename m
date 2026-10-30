Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793364218;
	b=sOMimYrzNbeOPXn23Od7f+JAwfVOV+dFTDN6dij+6jrciDWPL7j9CyhNMd4tcpRBhcef
	 ImokxBcsPhCkoWDNMdmC1N8XDw3JowuzjcFMMx1g7ODwHzjklgM5q9sJHWIWY1x0Z/lsj
	 syRavk+jblvlLSJ0Q8evosxtG1hIK6J98ckKPQCfAOk/G5C+G2X+jKnFKi4GTOqcE6hwY
	 wkg6i0Yiqkpoa+r4UrMhHDionGKfwW9/t9aEsSy3F+3f1BI4KFlyNxgeQrGibJYCOLkGK
	 qQfKuT6EQaUhNdDQXXJdbQFklGru5fxvmDUUoWMBPvDPbp9Mjt4rCg5UxCIki0rD3IQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793364218;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=JQZcWnzFgAmmFYA/sHLwHEakiYPJA+ODTFEZ0NO5CyE=;
	b=X5NlIL7to2ul/ZxddhYjlhTHXpw5Pw/AX14yXNjCjPd52B2z5O0g5/6iu33F7qMuP0px
	 9CzB9OYC2A1pZI6z6wTfb56xRMjZDZSbC/ZPUJzGBMTeUVcc0Jde9ZAyuPz9WjSM/jbi9
	 93HAc3B6Lae0rSW8A3B40FD46fozAgqdYgvSvtLmB2jx7Pjztdht59pmU6wjFjy6giN68
	 kwHdyA+QSbxhGYEZsR5LmdmS0jtMW9rLWf5Eaj0O5hWhj6kukt6TQHE5IXwLkpy5AdUXG
	 kKHX6Ua1wQdyXjdlgnOoAruVv8RdosW73eBFnmXXDxGGuEu99KJViPRDWobWlZOmTpQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=aA9iACs4;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MT6f40vE;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F7F9606A31A
	for <devicetree@vger.kernel.org>; Fri, 30 Oct 2026 12:43:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2F7F9606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=aA9iACs4;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MT6f40vE
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69UBG8VU2541703
	for <devicetree@vger.kernel.org>; Fri, 30 Oct 2026 12:43:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JQZcWnzFgAmmFYA/sHLwHEakiYPJA+ODTFEZ0NO5CyE=; b=aA9iACs4OIHPhKAx
	z3tAtDDkGHfnj0GwoaR/slfHPfGvqOuHHRebmCPc0vKZEmRLfCL/kkd2mYx7yypf
	mesFwnqXeolYDZbXWyw/2WJjzZkxDcivijWVA++Mw8Kc5Okcsd27AgNxMT3BV2gY
	foM4Gw5Y4Pm/oOzO+AaEpUt6VN3nUyG/s2+1PpwxmsmWbTRPH9ouxdMYB8gQ+P4C
	y43RHRj3CDalDugNjW3SGsw3hANONVoRAf4evoN5NA+pddkVW5N+yacfjWiLVdKZ
	RjC5uy6qBeyo7JPIvNfKdebTPOl7dQz/pGAaA1PSeMWoQq04xPyi3HRiVUXdGvIf
	yX3C9A==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hme6qk1w9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 30 Oct 2026 12:43:37 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2e60770381cso6749915ad.0
        for <devicetree@vger.kernel.org>; Fri, 30 Oct 2026 05:43:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793364217; x=1793969017; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JQZcWnzFgAmmFYA/sHLwHEakiYPJA+ODTFEZ0NO5CyE=;
        b=MT6f40vE9No5RHTEIrzbyLe18caae6v1PI5eYbcp0c13AIhzo2HAn0prZ7dIn7nUYi
         KugvKwv8OLcGnsRTTcbZitX5K0+rnG98YONIsOGEOPg3pUAzNhjPNlMN7XYncgoQhvEF
         6bA3WC7l8TLPLYWWP6/LQpiG4o4TNIBagzq1u1tQQ38nBLt4UPsu4kHYRbNsmvCQc7LB
         gU/1kC8KWMguEAXnmnFUBc56m+OsqIml4+G85NkCsxtqwpa7zT4U+qXVbwKVkzJXZSb8
         Op7O4vfwCunprQ6aIOXIcFZ9RMseMQta/8QnilIf8ZQ+iBLmb+qCxGhQqEGhqwxCrSmb
         q5bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793364217; x=1793969017;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JQZcWnzFgAmmFYA/sHLwHEakiYPJA+ODTFEZ0NO5CyE=;
        b=LOUXGrd63XAzRgxjPji6jFskl1HPiWExcwSfMfvr2zasbi1o2dlEjPl7oY4P1RP3Fy
         Eyi8z8vlUS9YFHsrMxLPun+712ir5vN9obImJSWr7nUmG02GMilMpau+OpmNjvwQJ1h1
         CgbdIVPvYxVE/8Bisv0tMlaeiY6uNConAVupGIzy0aa9oayKk8jjrxrXcOs4SoJADpsr
         QRQzZly00upUfzaLFMMgzMeLoJXRWbdnhe1AqQ9igtVonRHR3MizwVlRag6he7uhatOu
         dn6qGQthWVKdX+hKvEiygPUFkTyZhguyukUf3fGiXZBQg5cpiJkyBbMSSCa0yt6DAbwJ
         Y+Hg==
X-Forwarded-Encrypted: i=1; AKwUvBybmEhsuW9okuVpObyIOxJiwDByXgEGGw9wuQ7PLyXGK91CMUE8di9jBBUMRGgGU2t8hPcXys1fsiZ9@vger.kernel.org
X-Gm-Message-State: AFq9FYKnR2ToIZFjUcFKfPDkf0BVMJGgeOmDcHedC011v0hkmpYWL3mb
	mhLiqlB9rTbLa0k9pO6k3cyB325nAjqSfVFHty7uVmXTNBh/1bhQIhgrERbIgGpzu99mqf9Ofaf
	KIDLO8kBCoYni/XKnsnlyR9TIhQabQlo230qxxGSd5acbLV3j4E/+bxUOEvov5jOC
X-Gm-Gg: AYBFou01VRfeMQc/W5qRM3z2yMsxD3dPGiZ5pxzbsjrdZfbBShJEQ1p4AzI9/Q9ocOo
	WUPqMOQaa1uJ/Z0ajrxx3akcsQpmdb7R4o2PNns98duMMcNo3PNU2kGIyDLOXQBtrdXEW77I7u2
	q3Sbg1YMzHa1ep6SarzJcedPpVS6bj9xm9u8ETfo5lSqohxDrNNfKKEFFKEeI2PABKojLLi8olj
	lTxbHhZanntLcHeQuSHsHeD7Wwndr5lu2SwPihbxcqd+D1DcMe2Fd6H3nvODprXX2U8rpbau60b
	icxsUtzq/c37o1xMlFX7MZMrm58c76LO6+Ta18R0m5WrFhOgslNTUxkFyTrk0iEkpxm+HHuYHwT
	cHhPI5naD4CJbZd9ZDgMp5UW3eUMqYH3oczmzkuWPmLdFElYh38M/5wQdfkHKjJ1RpgB3mQMJBB
	hHuNE=
X-Received: by 2002:a17:902:e5c1:b0:2e8:1929:c8e4 with SMTP id d9443c01a7336-2eb36527d99mr22525515ad.60.1793364216738;
        Fri, 30 Oct 2026 05:43:36 -0700 (PDT)
X-Received: by 2002:a17:902:e5c1:b0:2e8:1929:c8e4 with SMTP id d9443c01a7336-2eb36527d99mr22525265ad.60.1793364216294;
        Fri, 30 Oct 2026 05:43:36 -0700 (PDT)
Received: from hu-nihalkum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eb3922f5dasm6450075ad.25.2026.10.30.05.43.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 05:43:35 -0700 (PDT)
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Date: Fri, 30 Oct 2026 18:13:02 +0530
Subject: [PATCH v3 2/5] dt-bindings: phy: qcom,x1e80100-csi2-phy: Add Hawi
 and Maili compatibles
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
Message-Id: <20261030-hawi-maili-camss-v3-2-9742bca8cef2@oss.qualcomm.com>
References: <20261030-hawi-maili-camss-v3-0-9742bca8cef2@oss.qualcomm.com>
In-Reply-To: <20261030-hawi-maili-camss-v3-0-9742bca8cef2@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793364192; l=1461;
 i=nihal.gupta@oss.qualcomm.com; s=20260608; h=from:subject:message-id;
 bh=O6JOHgjWCf6k0+eXloLMxj3S4Nm7SEUIMrYIjwRLIus=;
 b=3q6SA79to3LhfP25KLgv4CM/jRHI+Eaug863piJVxiwfuCDVLNdBFSp3qPp+LcZTmyL2pUt1c
 Wpi0ylH0f72AaZBoTsPa+f9i/u7hEkQPP2ONknjq1ttyu4rISfN1TDl
X-Developer-Key: i=nihal.gupta@oss.qualcomm.com; a=ed25519;
 pk=DIbyFMNwqU/iMvU/0pCQp2wmRVgtHFBT3PcSu+A+Ncw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDA1MCBTYWx0ZWRfXyyGYIx0eqPsX
 fykzH27BPKkv2IIhzL6TeCJ+WC3RXDD2jctPHYT5sB2rej/OODG+cul8x45XyCcJmkULqeMLTQq
 bkTNuPyTQ57kgh2c2AVLQXHB9ah7uC1JMtaKzCjp+QWIQeLwOywkXuvg9IT9xFgyiVI/usCoBkR
 uWyJwdfGOW7dY3XFFoFbblkXny9vsy86kznzkukItnZyKxmlPDAQkFtjpa+JuqTvS0rCTG1BIpy
 SPqFKwbuNWFVp1T7yrVcb+rQNoVe7VH45wpGTBmxF0LaHcVV1uvkcRvv65XK7vZW3Hdl1/Ek7B8
 SDMU8eO0OfNUANhqnQqKRC9Fsv0ic8Cz0aE6emTd2kFCmOeMpnDR45Gsl1StyM8szBUGWldsJ0/
 FhV3DgMvA/mjc/O/I8dDvRyLUqY9RHyp4gnVVCJsXir87pHsBwFlCd8fDn/nDgD6+WaM70/DZlx
 +vhC5FoMQ1HcwokXEIw==
X-Proofpoint-GUID: NXkHkI0nEEtxhAFn6djmRKBmXFdWcrpn
X-Proofpoint-ORIG-GUID: NXkHkI0nEEtxhAFn6djmRKBmXFdWcrpn
X-Authority-Analysis: v=2.4 cv=IumL47/g c=1 sm=1 tr=0 ts=6ae490f9 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=Qbo-v1IXpRF52dvEqNcA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDA1MCBTYWx0ZWRfX3WCr+UY6f//D
 wFLhsDRgoSYcKWnncKgYEMrMhyCZXw6PpCYL48lfcM+lY1dmaEQwDJd+xmr/qT4al2+QiWf7ymi
 4Q6shNTXzPSKdfCIGQ1aAK2TEPbIsUg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 clxscore=1015 spamscore=0 bulkscore=0
 malwarescore=0 phishscore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610300050

Hawi and Maili integrate the same CSIPHY IP as Kaanapali with an
identical register interface. Add qcom,hawi-csi2-phy and
qcom,maili-csi2-phy falling back to qcom,hawi-csi2-phy.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Co-developed-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
index 6e9eb8e265df93b631101ae13f31f6365b6239b6..627aebc7cd9b7ca313457d3f70f72796e9671e8a 100644
--- a/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
@@ -18,11 +18,16 @@ properties:
   compatible:
     oneOf:
       - enum:
+          - qcom,hawi-csi2-phy
           - qcom,kaanapali-csi2-phy
           - qcom,x1e80100-csi2-phy
       - items:
           - const: qcom,glymur-csi2-phy
           - const: qcom,x1e80100-csi2-phy
+      - items:
+          - enum:
+              - qcom,maili-csi2-phy
+          - const: qcom,hawi-csi2-phy
 
   reg:
     maxItems: 1

-- 
2.34.1

