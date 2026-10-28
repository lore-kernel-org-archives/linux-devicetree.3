Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793200857;
	b=IyELWuJ5+s/xNTA9HlGwSN9t8AqHXjSevN9gwr+cxnH/V2I1yHRFlsgTlzHeHUiwg1X/
	 pTe1IAWlsrTF7onkqIIr8Ke65eyqFI3xc0UFHibSUl+IoPqjJe+5Yxv8z4xNGp00IZ3jW
	 LpmwfO5dP9IEaLkIYWVipZpaQUiOzBnrfk1T8PGGIRfEDYW0nDs1+pOjeBK2jgPNXUl5h
	 TlAD8JmTeyqdc2rg24vnS9q0Nwg27nPMRa7vPxHFiPdbukmylzzDGd4QqlccCvmsn28Ao
	 7sy0mt6isRHzBPt/nH/KOgP1wwoDhcbwu39J0qT9/2lBbFwaekWSna/B8FiyuyZxuzg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793200857;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=IbiNyzfqx0jGWwabN/+ItDIDzhYhWzZaMzG7MQNpHsk=;
	b=znExVHn+enFpch3gLufujAS40mWbV2jfBKdbm0m0xOpuqOrPCB9P+2cVyI4s4fLaSJyB
	 NvPnAZqsvFhVGKQNRexaU7QL1grJrye6lWEIubwyHOUePN3ttiVbn4n6USKbl0HYFZQjB
	 y6+e0ZqnY+tjCrToe4rCb5Zjt5JgLp6sfQmnED/72TrVY12ZqHlQVF1XBf7PO2sPg9sNr
	 D0AAfq7BEEmOYs4JbArMDXEnlVbT8pLf0lgSxUcG9mVsic022p2V1IEBpyQQiHBeuLKUS
	 dTZplCCXz5fdsnZWfau7bcE4cJhSGcdOsSAJrUkisAZIjhWxPzmYRdMIWHFtuLZT+OA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gaYc9k84;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=iZrh5Nxc;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39ABF606A32D
	for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 15:20:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 39ABF606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gaYc9k84;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=iZrh5Nxc
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SFA5t4966643
	for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 15:20:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IbiNyzfqx0jGWwabN/+ItDIDzhYhWzZaMzG7MQNpHsk=; b=gaYc9k84PoLq9363
	VhsGb/OPFThRaWzzY3kdP5OVzSpQVOIm3Ang8GUVi7BBUZkHH7CUcYo01bbHs+Kc
	9KIftVFeIzwZNmVwgwXH8GXisyp+A6+9lWH80kMHHngwTD9wkt0k7YoZtRiNJiy4
	X+v9e0uyepI8RVdOQhbgeTVocIlR0Ya6iL9xvgNNsxrE6JT7x2gdpcDRELPlQIkU
	Vw/C6P54c3xea0+HhykvhPE8xBblIKDMkhiEpclRAcjFQOfWYbrZeOeDAdJ4nGYI
	6xllza0er8CNLBkq+mYdzGusuzuyz6GhcHhsddki5byGcbab4lZnecGxu7Ermz+P
	fBvaaA==
Received: from mail-yx1-f70.google.com (mail-yx1-f70.google.com [74.125.224.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkhtjght9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 15:20:56 +0000 (GMT)
Received: by mail-yx1-f70.google.com with SMTP id 956f58d0204a3-679b96a1e29so1903304d50.0
        for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 08:20:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793200856; x=1793805656; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IbiNyzfqx0jGWwabN/+ItDIDzhYhWzZaMzG7MQNpHsk=;
        b=iZrh5Nxcg7bjlqo9uBRMOCl5zKFFvt3Hu/6UUz866QL0MRNa3NvHjNM2WN1WYhzSAG
         /JaU3/nvyAPcq4bJ6Wlne08FdCGNB5I+a00bUDmgrK9v/+DFMoyC1OGQxlyFAwQVoMYq
         g6IlNONX1Nl2ioR7khyu8p/bu60o/MeylYEnmYKGBp82mpZjXEI62OzVTObPkRztRi8D
         hAHGqLZ0Vu/gJFR/a5vUjeXOl9SnKTyyPWDn/iEZmAh6ZUht7PJHFuO1QzYTUMIsEfkX
         21YKwysxd3288n5LNqZ/i/+MtHf9cc5pAosq1pZfl0NFjF7hsIlx79D3Izz81T0/DmWR
         F/8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793200856; x=1793805656;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IbiNyzfqx0jGWwabN/+ItDIDzhYhWzZaMzG7MQNpHsk=;
        b=g8WNvnwN+MFV7IVJkoe/txsw+UVJcpvvHcI/EuL/WQvDU9CLlFeeFWVp5x9kCDZ2xU
         OZICWC2/pJK84EJ9opQxUIOg2K2D7rDBwfskl1VgqUa3b415tkDzyfw+mt/Eucn0eecz
         +bI5VdL0AHnxcSlVL+nYRbIntdzm4msuxNa4hO2t258iBFOT/fjkw+B0h4jErRYZ1ajT
         X5uUiP6y62EiHLcm61wKm2JrPxRsb/iMDMpXLjHDT8vdJVBcSDtUpSiEaI6zqG821NCQ
         w4Nst1Tcqlb+RV8V3KfYC3AQNH/uVkRGvD+Z+QglwQScWNd+cShpNWuN5JEqgd9SlOaE
         at7g==
X-Forwarded-Encrypted: i=1; AKwUvBxQzZCufzKeRy8RpJO3LtCmUDfGv0etgAb1POWffSEYPVPvppH4VJS0q65cuQvjBvvkdPNJ8IO9FBzf@vger.kernel.org
X-Gm-Message-State: AFq9FYLBlp4L51cjsSGm3RWk2qYN+WLKrJVdypvszSe46e2bfObHetMT
	8m1XG4JcNyFxDrAa5Hko0H7O6aCRbqvCmuWcZNYjSNQGCa09j8bnV85eVSt+2Xbvwi1OdlQzd8M
	E9CPAqbQYQtQFKO43VtVBIRjmgtlaVKxCT0ZVMqByIkEmoM3HTfJmJ/UC+4FixIzg
X-Gm-Gg: AYBFou35MNYLUP6Vmazh00dyXCDXECt1ILdmJEDmSW2j+giW11EaJOprdma2hmZiNtY
	sib02DHNtyFE9Hz1UuApGfn+3LI7yERZ24v767P7/zo64CMFuL8eHcQKvBLpXzE3DhGiOH+txoT
	HkXmxCdyI0jsSsfnmSNFj8jb3a1UTWjR6msOeiAjOVgGXDf4nbfcGPkEZpMbBwDOqmDpj9Ltlat
	yVWMDQTgd+YqY0vEdXCm31GfrnP8wD997L/qiGLiesZtLOryK7jE4ht6anWMs5iiZ3eDHerqF+u
	Q7Pvj4iec4mTcYjh1uMyjsMg3lLqBN2Ef3+ke9KSighfqsz0bMbtQpANI2J6dICF8XGWbv8PjTn
	SbuDkx9tqwbuaL1JXwiHiSl07zHMnmjCtC7AgO4//EPdVyfsl7I77q1gQUI8mBxu41JJxlBf8NZ
	RDngagGvziZkAFoUhwwLz+IYPQvb1vqF1craoCQfBoX3DaYil3SEa9UiIupDf3
X-Received: by 2002:a05:690e:4548:10b0:677:b6f0:63c0 with SMTP id 956f58d0204a3-67a7bc5eab4mr1474804d50.39.1793200855460;
        Wed, 28 Oct 2026 08:20:55 -0700 (PDT)
X-Received: by 2002:a05:690e:4548:10b0:677:b6f0:63c0 with SMTP id 956f58d0204a3-67a7bc5eab4mr1474784d50.39.1793200854685;
        Wed, 28 Oct 2026 08:20:54 -0700 (PDT)
Received: from hu-hangxian-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67a803cdd1asm1107541d50.4.2026.10.28.08.20.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 08:20:54 -0700 (PDT)
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Date: Wed, 28 Oct 2026 08:20:35 -0700
Subject: [PATCH v23 01/15] dt-bindings: phy: qcom,x1e80100-csi2-phy: Add
 Kaanapali CSI2 PHY
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
Message-Id: <20261028-kaanapali-camss-v23-1-95f250b18612@oss.qualcomm.com>
References: <20261028-kaanapali-camss-v23-0-95f250b18612@oss.qualcomm.com>
In-Reply-To: <20261028-kaanapali-camss-v23-0-95f250b18612@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        jeyaprakash.soundrapandian@oss.qualcomm.com,
        Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.16.1-dev-17221
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA2MSBTYWx0ZWRfXw2YNVij67xBv
 rSC+RWMLdjUhcccKnK3LdOWpbCIh8wk2GswK2piFupFIOad2jwq/gEmDpitCo6idWrWZf4N8UhB
 eIqmf4+5EaWUiRYE3xw6Tgf95hC1sbb/UgRRRC3uLpxK5zzJFIlKSFCPWA8bmtxwizETr4wvRrA
 Hr/mx7CQ6uXxDS6wVHuC7Xpi+LU/nJzYI1ERPvSQLL7WB3vE8EoygWzrB6RZOnToTOHNaSauUzB
 HjGvUtzY27Od6uY2ITK6IrvoDlzSPekBMdF80hcp1a6X26OXg/5aeqgGEJCMQvZHtSeyZwDwdg+
 WTEb3nZM7vkXT5sg7lkjr1xIeZ96RZaT9Ilp6PxK8ggOL8kIjqbNkopILRawh/pbz8edFYvsgYy
 4/doN1q06lM44izTHuhYCkTFcR9zHlgrtMFDTXeyZQVetu7siAcbolfACRjKxN+rTwndrdhaolO
 1yHhEeu1o5WuTIrT+7Q==
X-Proofpoint-GUID: OzeBWzU3GwErjNSI0xR1kQrdXoXjWSoo
X-Proofpoint-ORIG-GUID: OzeBWzU3GwErjNSI0xR1kQrdXoXjWSoo
X-Authority-Analysis: v=2.4 cv=LdipeTfi c=1 sm=1 tr=0 ts=6ae212d8 cx=c_pps
 a=S/uc88zpIJVNbziUnJ6G4Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=mZPZtqNPFm0sPOGUM0AA:9 a=QEXdDO2ut3YA:10
 a=nd2WpGr1bMy9NW-iytEl:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA2MSBTYWx0ZWRfX4ks+x5IeaWyW
 HQlRf51rXWwtolkRzcRbm4aFqqTDMtbB5XB7kmAU7hn6WFWbzDEatwZRYReQyhCNkn4/L8a5U5L
 Gf6YyySWyh9R2r574Lg7z2TfLqbluy4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 adultscore=0 priorityscore=1501 malwarescore=0
 clxscore=1015 impostorscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280061

The Kaanapali CSI2 PHY is compatible with the existing x1e80100 CSI2
C-PHY/DPHY binding. Add the "qcom,kaanapali-csi2-phy" compatible.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
index 1f1e2a4993b2..6e9eb8e265df 100644
--- a/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
@@ -17,7 +17,9 @@ description:
 properties:
   compatible:
     oneOf:
-      - const: qcom,x1e80100-csi2-phy
+      - enum:
+          - qcom,kaanapali-csi2-phy
+          - qcom,x1e80100-csi2-phy
       - items:
           - const: qcom,glymur-csi2-phy
           - const: qcom,x1e80100-csi2-phy

-- 
2.34.1

