Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795779864;
	b=hhwU0Ud713lPwa6MFYvCHeLynsLuTzHius2euke9ekfhWXHyEL0AwiebMgbOZ6bIEItw
	 S2ZfNvcofxdMPPWf3nXJAY6cUJCQq6nJ2brTtfluVO7PkMtlDDnlAdKAx+IxXWRNr16rO
	 ULhOvrvj3Nry24kPiQq8tH6RnNLSveQQJfY9R0OE+X8ALqtYAMFFhbP6gyFz/PM9f7K/C
	 T2FbDzvQjBCJuiI40cQZEXHybiVf/JN2XflRn7MWjEOAYj8WedUz62nhshtrjK6Ska3Sh
	 2AHetBM3YufABE/qL34zQiRyuj2puap8UyRMP5DTFMu0M3uasrByDc4uzsQdDwPoT0Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795779864;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=IJPyYpIYmrR4ZHeGVfNDne7NhRPR7qG67vM1M/zaXQw=;
	b=Xj27Bu0IsFbzu8HgM+mP2UjMAjnq93HLytGmTtnEre1Yl/xYtt84QdV0VjcNwEQC19wK
	 5ZSM0eQ5KaYbsS6gq9dW/b0lY0dyaufd8j/J4/WyjaK1voK9MWD+EOXaFv1mBEuFSZ0qY
	 iHKk5zmpDuZu+dEeWw1C9vieR0zKQvD3zwDkEsHtZJYTWolYEh1YPkPCiFwShAAADbH+/
	 fCSkMtv+2D53sXrdlbL8uoiXF4Spe1VK7U9MUm1reLVd8u+XxKQedMtRon0dMnUriEKCG
	 iX6w18/JkxCvEcBkZjqNB2cHWD98PvxYm2nZx/oeM26Qvt3KNLTCQTerSUVKS6jW7Fw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FI6tTpRr;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ONbZeZ0H;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A750606A321
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 11:44:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8A750606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FI6tTpRr;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ONbZeZ0H
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ARAoxqi1961771
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 11:44:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IJPyYpIYmrR4ZHeGVfNDne7NhRPR7qG67vM1M/zaXQw=; b=FI6tTpRrl2APtsrf
	FWwkmMW5FBuOJ2srE0EuzaMzp1Hi+ZjfR5yNKUdUUmvriG/AC3BEuLbd4Irc6JvA
	ntJXUMxympMhGdUmCkxuSPtLb7duDa0+1ZhZqBoye1SIbrh4jqUwkboXutDoj0nR
	v7Lsgsu2Ep0C5zfxQvcaW80Ev66Hqyn9eo0JRDGMGvggKQzBZVR5SJzM9vd3nIyQ
	Phh48k5jSd5dNQWhmV5q5eCL7qg1Srv6NLo4aZXnM+Px5OoFtnZS9ErfxxYbBbLa
	GaYkjwhidqaLjBDhA7zsajZ7YEXDzwZzM0zTdaxoYEDIFGp/sMFGJlleBXjmbJgf
	UqSt/Q==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6u4htus8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 11:44:23 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3b191f8a9b3so9215536a91.1
        for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 03:44:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795779863; x=1796384663; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IJPyYpIYmrR4ZHeGVfNDne7NhRPR7qG67vM1M/zaXQw=;
        b=ONbZeZ0Hd57Wg2h3dlKF1qYNUpjpfvEigTgIhKNmCxt88+K67fNUApAyzoto4n7wqU
         cgxcPMu8qf7uSW3H9AIULjJQ3spM6y06MC7u9UZa2wQFXHzzUucDkmMtIYuFhv0zHFJO
         Qe1v8pSHXk8Dnp+xtN/43AGgLTz5uoCKcCZB/zNeVw6M7MwZJr43mSqfVRFGcC9DLARm
         djatmEF2p806rYvu6UvoqZSNAkrR2C58/WQXcWZIg8Ol5yA4by86waF0y5jrT9ecZ34S
         GPv0+WRdIa04m82WblVbjEuODCIrwXBLf3c+vfPzdWTZva9rLcplm8hNmlJCNWVjQXxT
         XRTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795779863; x=1796384663;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IJPyYpIYmrR4ZHeGVfNDne7NhRPR7qG67vM1M/zaXQw=;
        b=qqtKypmH4PXJuTXymJ9dq8zZmlg/RibGnHf5SAzSGV/QwcAf2QBxZdqR19dh/PEgy5
         TrTeH7Ddk5j22asiFcV7oQNaxmcxg+m3ZmmHxrLKGUxKqKUiVs553fvu/teqSdL5LFAP
         ymheFTeMDWmA1WtLpzd2TlJ766zRLNhM9ayinMpKA4GA/21fsRYFtn+Ms+pq7knkY9TV
         2Kc228sVjnK+e5AOlgVfCIxjgO53mCz5MvFFI0oz6/LNaP8Gd13dbTt1gxF9Gs9GlD+3
         AD1QmxhLJQZLvV/xe21lUYuiB4bSMnhfOtLM7X2ZHOG0haRJLHEIJzlw04jR4vHvMeYO
         vlmA==
X-Forwarded-Encrypted: i=1; AL+hErHcSn0Tw7aazCD7mY8hEHUWYx2eccbqlxRfBPwy/95uJF08SJc3R9SyBTpY1j8YfliVVt3TK020luQ4@vger.kernel.org
X-Gm-Message-State: APuU4Z/Gt3OK9Wb1xWmd0rTCETHq56VgcmffooV2i0AQLtind2dGbg5m
	c6UZt2LKYS/4xwxVlrskrqq4yANAUIj3WeJ06GSoiXlQ0UGLShhdxlDaR3i2XVMXJJRGPldK8/u
	+ZjLRiGZy1yEW9CHSStmSPkuidU0ihro23R04St38JRfUzPX0A6C70M11njHkL2hA
X-Gm-Gg: AZFdTZe4xDTtRyzLICsENixA4Cd1VKZdom2X9cJxZfIB/xCQ7YDOi9QO4LlKSOEgIX8
	3bJK4Qfk923bpnYea6l+d2TRPSHLlIN/VkVi+2RdR84upwCssWuiFrmHvLBAfAc97asWFmOohEk
	PBKHZHUTBGiwB/brMRlBRCtm8O8PYSeFAF8fqGqzyVE33n29UZksDbZpd0e4GpOA1UgOhl8eiEW
	jwaBLVLdZiQayyt2/7y4QbXV2YltENIxuiZArcXgyAgBNgQSaRpevUH2gf/31jvotr2blF5iXPy
	GaGaxBp8iBiBgapLrHKGZwSKBhBfhIh6aJ89VhGePxyBEXT5aukzuB1+iRAefsXq4FU51U25luW
	TTc99yItfnSuzvYqljArAwqwnNfii33ZzHId2DvJBXEkdc/b3ZenJWNkCb9r/uwL0UzdVZtpFRv
	42H67R
X-Received: by 2002:a17:90b:1802:b0:3b4:e19:e127 with SMTP id 98e67ed59e1d1-3b41cb5009emr23189357a91.63.1795779863083;
        Fri, 27 Nov 2026 03:44:23 -0800 (PST)
X-Received: by 2002:a17:90b:1802:b0:3b4:e19:e127 with SMTP id 98e67ed59e1d1-3b41cb5009emr23189329a91.63.1795779862628;
        Fri, 27 Nov 2026 03:44:22 -0800 (PST)
Received: from hu-nihalkum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41adcafe0sm40480933a91.16.2026.11.27.03.44.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 03:44:22 -0800 (PST)
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 17:14:02 +0530
Subject: [PATCH v6 2/3] dt-bindings: phy: qcom,x1e80100-csi2-phy: Add Hawi
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
Message-Id: <20261127-hawi-maili-camss-v6-2-0f4844eb63b3@oss.qualcomm.com>
References: <20261127-hawi-maili-camss-v6-0-0f4844eb63b3@oss.qualcomm.com>
In-Reply-To: <20261127-hawi-maili-camss-v6-0-0f4844eb63b3@oss.qualcomm.com>
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
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795779843; l=1527;
 i=nihal.gupta@oss.qualcomm.com; s=20260608; h=from:subject:message-id;
 bh=VrCho42XU53GTqUrn16AUx0FovtMl7rE/ickbc+QQAU=;
 b=W5uq9E750RzUKhnaGzYYrCYRSi1zcSdV41r8VtcB9zOLrSDHmR229EBNX0VaZHK74x3ZUv/YG
 H/qLd+NcDIiByN4CvMriKujttm9KK3BN5LrjdhPHnwZU7c+Bx915XLv
X-Developer-Key: i=nihal.gupta@oss.qualcomm.com; a=ed25519;
 pk=DIbyFMNwqU/iMvU/0pCQp2wmRVgtHFBT3PcSu+A+Ncw=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDA0NiBTYWx0ZWRfXxDfGMxYLJ2rv
 +ru1mxy8ErK3UL2sUB6AjWNO3MeqDGZIE9g9vV3DB5J5Vh6kphZYniEljBc+GzqVb01lNi70rZz
 Y14WF9fwGIy9SJaH5FWWA77Kn6JLU6U=
X-Proofpoint-GUID: T29RSUAxnksGJuP3BuDk82dfGlJIcSfe
X-Proofpoint-ORIG-GUID: T29RSUAxnksGJuP3BuDk82dfGlJIcSfe
X-Authority-Analysis: v=2.4 cv=M9fYuCws c=1 sm=1 tr=0 ts=6b096d17 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=Qbo-v1IXpRF52dvEqNcA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDA0NiBTYWx0ZWRfX9TwNAuIgIte2
 /JAnkG0B17rqFINiqEGob0hLS8bWMa1ZrYVuQVIBgnmq+L9C9Yg1H+k0fZUOl1NtTItHqrPsnQo
 QQc2fE1xrrlKwh9kSHF0lth9aWVVlyKHKfD9y7tYfwUpL0hHqgi5nA0rcvBzBsnsvAgdqY1TPOB
 fkY3N18cH9yPmF//0vyKRluTYkOPP5k6B4eQso1oklsUPH473GhvMI2SUKUaisQRBAr2+5n+mmc
 0DqsVTVx6sW+Wy3Gq2a468J3ihGfVm/MAQxDPGHlUGd4ZvKHgXiG2HhT0vPKk0J3Jpq5bPGdzjM
 9X13EL9TH6o8X1ZHh9TLobZFfNEsZVnBx8BfgSF6liX6x/Eu0iTgwFrMRbRA4w6zyEsq2nBw2nL
 Ho7o5ne6ordmy9LFikwk/boNcEmp8lDW/Env3b2iUd5/qU+vNDOVAQiS7Fs9LxPBJDwNPewhxt3
 WuaKcSIvuEc4xDqQVOQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_02,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 impostorscore=0 suspectscore=0 malwarescore=0
 spamscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270046

Hawi and Maili integrate the same CSIPHY IP as Kaanapali with an
identical register interface. Add qcom,hawi-csi2-phy and
qcom,maili-csi2-phy falling back to qcom,hawi-csi2-phy.

Co-developed-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
index 0dc8b7859447f378282732813aa6886bdb1ea4b5..40e9a1725d57644e480c2d25a5f1c0ee7e1f5dd3 100644
--- a/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
@@ -18,6 +18,7 @@ properties:
   compatible:
     oneOf:
       - enum:
+          - qcom,hawi-csi2-phy
           - qcom,kaanapali-csi2-phy
           - qcom,x1e80100-csi2-phy
       - items:
@@ -25,6 +26,10 @@ properties:
               - qcom,glymur-csi2-phy
               - qcom,sm8450-csi2-phy
           - const: qcom,x1e80100-csi2-phy
+      - items:
+          - enum:
+              - qcom,maili-csi2-phy
+          - const: qcom,hawi-csi2-phy
 
   reg:
     maxItems: 1

-- 
2.34.1

