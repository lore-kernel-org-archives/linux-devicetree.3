Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795587959;
	b=2r6H8XHuSCxh11lYlJA9pDXzJCzNE5Q6tckoPiZyGTthHpgPlkQrdwzlfnGqZktj16xc
	 hp42jn2MCg+BkZAIlZlJZHw1Jqfn39QeuA2CuTaCIblItXFwUQ8YfK+qVXFObm9kLlU/Q
	 LWjDNtHLrF/pI9VrT//dVhyooB4Xi9lwUHHXCMPW2/z4DoIImcBHGGpvFWVrMCKge2PBb
	 hJgCV1Jx7hA5AXBoG12GmzaHSrUaJgmt9vW0SOE55+rhH1SjK/RJA75ksHsGQPz1BPIcq
	 TqOhFwxeuWW8jzn17voZ8kz/CEUsCchXRI5jEvg3H2Ypwh6cak4zq1n9s1++X+/PxSw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795587959;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=pmawXRSR283Ucc1PSnIiqX8eAjPfNtrwEJ7cQLdMyUA=;
	b=fONL99HXbrd+xxn8J5lnPq4dxTiN4CJZufosWZHCQLdkFUhkeb8ZGhxpKInF8uHIIie3
	 sJSieTkm7pnjg8nmBhTGs/KA8ewnthkxnLsyI//2gIltCW2FdvNSmqJOh9Pz4MT5eKsJh
	 HaJQRCDkjmzOWZ051pMLesaZtB5UGuWMQwa2QuMD9JMmgEJmcyPzcZzkz23oAAPejGzqM
	 V6ciuHP7ps75Ljg9ip8JOoRd7kbCdDofZ6Iqn2FopkH78sPkgORyAY7mclO9myyTu0w0O
	 Jt4R5sAkbUuGuISLpg3Rt5NwQ/KXjmQ7mybPiFYJ0ePnP9aAweGTMIcKi4H5Hnc3IUg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MpZ7ykoS;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jZySGB+T;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 800F9606A682
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 06:25:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 800F9606A682
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MpZ7ykoS;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jZySGB+T
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP68drS3142874
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 06:25:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pmawXRSR283Ucc1PSnIiqX8eAjPfNtrwEJ7cQLdMyUA=; b=MpZ7ykoSA7/sjKor
	fhs3LtxAA4aCOH/GysYC2AxowpPRmlTm5zMFGhEF1UsE1+LDAJ4cPAaORCe8hTTj
	3jLRSUFAT8A0WYN4NrBTqGkq3XQdsAXSpb5NcWzWc+kkVB3FcyW4JHNsP/J26k88
	LwbhHlCylKB2n0njRhvHioNEN5TvPfxe9MsTy++GkI0PUXJaP2MnKrwzMedg23mS
	pniWcsd7+8+Ox0/sgvARTLo70rR/5gVoy3epBzj5Q4kEboPai8vuJC0kbBCQfUJK
	rQ7+fWYJmu3Xi3MPf0DRx2Du9gBCbRSe7H4PhkyABjiZny23Xpzxlyl2XFDlw2AP
	auk/tA==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5mc298ka-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 06:25:57 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8a06750c74fso3909529b3a.0
        for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 22:25:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795587956; x=1796192756; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pmawXRSR283Ucc1PSnIiqX8eAjPfNtrwEJ7cQLdMyUA=;
        b=jZySGB+TmT/P0rELUQthBGfT0SDgiZlB3vTkpwgZui/DHvnXNuRZ/5KVAA6v1p8aBE
         jYizTgRM2sbrD1RszvY2U2mnq0S8hOfe2zM4koMzvXsyjjLP7U5EbRll6Xv6V0JjP1lh
         ktkrcrijoBuoIooIO41zYfUNy5iqc9uhYLGwBZhJKUqDpu0wNDd+beuhDF5Gj4ffciXL
         QgXCVm5ppZrJfgggpAHY3MXVoUyzWZE/G4ogCxeFxeYp6cANDSOrH5x27DD5ehfjR6Iu
         UKj6hxtBVx3iCFVGdW3HxacHngkhnoLK8ZXs4ndbvO2AWEguWYwmTbAPWbfA9l/m0BiC
         p/Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795587956; x=1796192756;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pmawXRSR283Ucc1PSnIiqX8eAjPfNtrwEJ7cQLdMyUA=;
        b=pdEpBgYGGsrysjGjtEsjJEAYNoESxKOueAYl2ekilf70N4axoSVVF1q7dJ2IO3omED
         VgmoDQ8D5245y6aQpGzedMih4YggnBAvMll2bn3sxWldcvWhbB4JJWbILGhSDPukkpS5
         wHVnmUJIF3tJFYXN7rhB1nDGrE4/svaYBVhGV54aHBQtowvokSlniKHsBgBOOgSXqkTG
         o9j3J0NyHIXswoER0yuXXHfyXv7zucrnoT9esTJ0HNZDZjUMh0TeY/OnRVxk5zo+IHog
         SOZkNB461xujfhesbXqt0kyZALUL8qoKC0QyCj+laNubuvLSSh/Qd4rfkKn0QeTEUEEK
         qJbQ==
X-Forwarded-Encrypted: i=1; AL+hErE2Nkv9gusnmP7R+efR5CPM26Vvf+FgAEYy9MKh9lTzkOMX5Z0F0cQPJYLEEHTWZmexNKSX4QhWa8fM@vger.kernel.org
X-Gm-Message-State: APuU4Z/pQ/BTTVMKqWC9WOaARvw+vSMgC4/mY3Q4SRRNZQzM7N1QkesU
	OSUy00/LWQKc4sVnvhCf5/vP1YHhKt2wXFNky+I0oVR8EswVt4i4PS8HX9lxxH3cBQIcJ1ROmYu
	R6HWkXrgxxCW/Jjiw1+e0PJdm7BqyAWOH3ntwLB0Kr3FXsWiEznyy3p6INlYvVbo4
X-Gm-Gg: AZFdTZdFqywv4ItlQ7t/KHcu4AUcxso6KVqOh3dIiYOBDeUsCwhrBS6u5+tCh/4gwoB
	iLk5yhgw1pQ8IvmEPjkMVjq6cLEQLQYVyPAqj+HI5cbGROUQ8qNgt+RkrH0rOrw/9VEOjVMn96L
	sxVaFQ2G4Ml7h38MFOOQayYTsdAyX7SNBxQMMtS2FEG/RVgUrW8jUAbn6Olltj4HMO3PTtfDY65
	GIP3iZL51pznln6Ha6+ExZZ6z68oTK/UNxOqmyXAKRNGWtrXFl1aj095C8zooPOo1gxdI2HQuCX
	QR1FRaDHNWu7JIIYX+C2H2wbFFiPS9m9W+m0UEn1hxaYlCO31U0SyPheSJy2iEoGLEs9JglsfFI
	IQ31D89QGXgjHAe8t2iSA/cm11oCoewqx77RuXLC1mH9FxWVv+3j7h39ZnS4ES6A6mk+D45MkxX
	Nixwrx
X-Received: by 2002:a05:6a00:94f4:b0:89f:c441:580a with SMTP id d2e1a72fcca58-8c87ca522a0mr14601699b3a.36.1795587956319;
        Tue, 24 Nov 2026 22:25:56 -0800 (PST)
X-Received: by 2002:a05:6a00:94f4:b0:89f:c441:580a with SMTP id d2e1a72fcca58-8c87ca522a0mr14601682b3a.36.1795587955918;
        Tue, 24 Nov 2026 22:25:55 -0800 (PST)
Received: from hu-nihalkum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c87077944bsm8385066b3a.2.2026.11.24.22.25.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 22:25:55 -0800 (PST)
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Date: Wed, 25 Nov 2026 11:55:41 +0530
Subject: [PATCH v5 1/3] dt-bindings: i2c: qcom,i2c-cci: Add Hawi compatible
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
Message-Id: <20261125-hawi-maili-camss-v5-1-1483b7f68dce@oss.qualcomm.com>
References: <20261125-hawi-maili-camss-v5-0-1483b7f68dce@oss.qualcomm.com>
In-Reply-To: <20261125-hawi-maili-camss-v5-0-1483b7f68dce@oss.qualcomm.com>
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Bryan O'Donoghue <bod@kernel.org>,
        Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Suresh Vankadara <svankada@qti.qualcomm.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-media@vger.kernel.org,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795587942; l=1476;
 i=nihal.gupta@oss.qualcomm.com; s=20260608; h=from:subject:message-id;
 bh=BTDhy4Hj9RCXelLYOtQYezLS7KR1Rsj0YchhEiP5678=;
 b=JJ7++Y37/ybPg6xYkSO8GXSgnBGrAyv+rXXF2osM/rznJEoenCuk1M+2TlUaPQdogEIt3/ino
 hdkz2L+nvH6CnKCXfVEbGONlEbDBOzbv3PQo0TSb82cLrdMDuKHn3vP
X-Developer-Key: i=nihal.gupta@oss.qualcomm.com; a=ed25519;
 pk=DIbyFMNwqU/iMvU/0pCQp2wmRVgtHFBT3PcSu+A+Ncw=
X-Authority-Analysis: v=2.4 cv=aPJlOr9m c=1 sm=1 tr=0 ts=6b067f75 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=LDBv8-xUAAAA:8 a=AartCDbB9JJyHY4DVtoA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22 a=DZeXCJrVpAJBw65Qk4Ds:22
X-Proofpoint-GUID: Ctj481iMyNARNbaOvWkJakqV_uH-g2lP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDAyNSBTYWx0ZWRfX1dcLvGXpYGek
 VRiGXOne3lWMGobDkhPNr9ucL7JFEFRLcCixYYHp1n6LyAgDOn7N0ClRpuGO4sMRK8UJeuOgY9f
 laCbLqcTlgIzm/iQXypY4d5AeMXxBYAHyPeW/0VgWAd9dngTAvf9fRz+WWSEooTui8WS9pP3n65
 whD2InE59AU7tJuBhsBcke9Vppf5ML9MoRiuTqAvPbkUKQFyI3k2nnhViPEL9+6zyNsJF5AhZK9
 H4EGEBRTipYuBv0aS1yNLM6+wueoIC6RglSLEnr5dJELhq1GXNkvRAoxs3+bcAP1BptbJS4kXsO
 +FyRrM2t6MJ/sgvZyqrQFHJ+nk5xe9mSYM1lJZAnxpqm1N7+fc3a0K2amD2amFTzc6+Q0nVLsew
 GlfPdp2ocnOBqXr+ib2ni59FjWlr5z2+MGefIl8NU9wyaLi7dtrqvqjwokqm9yNhvGGb+tOpKSY
 3pDbYpYpgAtD/M5u5nw==
X-Proofpoint-ORIG-GUID: Ctj481iMyNARNbaOvWkJakqV_uH-g2lP
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDAyNSBTYWx0ZWRfX8eJdqJGB7xCC
 k6gLtKYIwJxNP74JD9MdoS4jTHv62m/DSguqKG712pV9rrgmYMvT1T+1G7PHBQsA0Z03D/faTKb
 DsRwK4vh+PqVi6tLwIWPHgs28dYHapc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_02,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 phishscore=0 lowpriorityscore=0
 adultscore=0 spamscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611250025

From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>

Document the Camera Control Interface (CCI) compatible for the Qualcomm
Hawi platform. Like other recent platforms it requires two clocks, so
add it to the corresponding clocks constraint as well.

Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
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

