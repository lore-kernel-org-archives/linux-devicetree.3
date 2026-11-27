Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795779859;
	b=i/xW+FZek7DQWVKjKnICL+hJs4f3QKb4fvpBgosJODjWP6bV+Q+w4rKGtFxHRBxn2nhM
	 vx4ifSJHUIoWA/qkYIFFPEqe5e2C65MKQ2bH42cZopdddeqGO08pj+tpKYveGqVFYC2ce
	 OmeTtmYatmouYLZhnMHJbqB28L82Bx95ZNPo5Wo8YLDEL/bxJuXgBz0h3EOHXxY8zpPn/
	 ptkZm0kw7sIPn78U54MlSA0Ln0ndzY0Plm7MBOHJQpozVuMxW7m9Q4LzAgcTEq6pG1MIa
	 A7KbSuT5asGsYV0GHcZaFXwWB+lNGl8YaVquYmyyIYiHRFQtUBj6BJPUGlQGk3RZnYw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795779859;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=pmawXRSR283Ucc1PSnIiqX8eAjPfNtrwEJ7cQLdMyUA=;
	b=v/Loj88BDu54WGrm2TkKWr64OmeLsGsrG8FBr+yEmLkoJ3QBFT05oVqyZdnaoh8mFsDn
	 g+Kf4F3P0+0pi0Plc/ywLUL9+dDD2zBnXYfPSH6AX7/lSvBrzEXBQXyaAnE4ObsnHEchB
	 NAMWCKuTVrWmk/OXA2LWNtoMaZZjvE+o2YCgqC4pUnvd57DWEEJf/07HYmV2HgLj0eALb
	 Mm7b2PnVomyZZK9UTOB8dw2nQiLuQS6whud4P83yB4h9vr7k15hpFluCMVbeWt9y5EA8k
	 w6Lxt0OVSmHou/5az6pQqRMzpnFcveO40g/pGG3A/XIDLo/bS4uqXSCbZzaRlqePJoA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dBJS62rl;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PkAODmPX;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DF07606A321
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 11:44:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1DF07606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dBJS62rl;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PkAODmPX
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ARApJE6273462
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 11:44:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pmawXRSR283Ucc1PSnIiqX8eAjPfNtrwEJ7cQLdMyUA=; b=dBJS62rlsuED/DG1
	i78emq4hKj8H6+mhm64WNWUuIK6yv3k5Q+ImF+Rg1xgdvNYWi0PqHeCvH4O8JZgJ
	wnyeneyFKDJkmMOgbK2Wa9jgyPbn7KZePKZxmdvaayGeKvMyzIjCXpIahCEOLfua
	X58GM2BzgRtxltYL88RxBMUY5LAs9FgqM/zD/DQmEl1ggiL4NEJOJKkFewPr+v6I
	iB5moLuw6cO6naPdIrzRUkBVW6DqK4+SMLJCR7jv5j7qbHbOxYOaVIISZvi9+fFU
	/2m+QM28yWN8Xk4Pe//kqe0Gh+yR2CD4rKMr3AGZApUsK0NnGXq4v85QhfizMRSv
	E0875g==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6u49atvg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 11:44:17 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3ae7faf4ff7so9399710a91.3
        for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 03:44:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795779857; x=1796384657; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pmawXRSR283Ucc1PSnIiqX8eAjPfNtrwEJ7cQLdMyUA=;
        b=PkAODmPXjF1/fRy6BgTKi93BYrgym+VcinhmQMsBJvJrh64GgnBnYrMFNP5q7xfgqN
         ZPpAcyff9quKRKLYKb6VyjKdtBScyPaggeWnP93xQ5mGqAknYUgVkR1aSFdn6MCcJXLy
         +LW40g2ZQZd79AtTrqjLtVRgPGmFmO5quMKnSONUMfmjLekPvFFuik4JT15qB5XAlrQ+
         uhTXJQMQ7Gt9SdMBkGNiC07NQieaZQuyxiR3pVdR5qJTUT6xLP2UK+ScxNYRL4Yo+5R8
         6FuhatIIltTUwQ8oPR0XarKtWy05rs1uMW/rkuhQJ1OqQsPNzx0FiL/kwGe1QqHqVbA0
         SSNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795779857; x=1796384657;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pmawXRSR283Ucc1PSnIiqX8eAjPfNtrwEJ7cQLdMyUA=;
        b=c+1yKyZ43qxX2uN8VKC51pOZ1betBzTOKnQdlbF5vA/uspK5VD+vqyodEgCftqpgnH
         RRrqIP5wrPsaCBTv79C1U04vFMNbntYRi81fFlN8CQLeloWmTwB4vjyH3dQi9/jpG8DI
         p8dF2aCogud8MJo7KU22e/dIY9sTqh3AO2yWtcvueKV5guSJryiLJ4/MeFHHqphbsy1N
         kXE05ZccMmMWe/qWa8WeCqN4qUy2M0rr8BluYORJ9lKie7EjiaaNZ9JV/0O4XWREl8/u
         hfIZ9RSTWJmp1RINC056Qfw4NkeSgiyrcPS2SCfo6HiQVzz7MbMrGHsDhN4zS4Wvmxtp
         gSZQ==
X-Forwarded-Encrypted: i=1; AL+hErHjaoBcgJ9mN/X1e86ckTL7cjXcY3koL8EZUs6BFTzTk9u6M2Fk2y+PjZJ739InIYt1BkxfGmJyzKPa@vger.kernel.org
X-Gm-Message-State: APuU4Z8OmtzQwMuFVjnFF0JhEHh9nZ/hadyakCwKS6xmolSPlFDZ31t6
	JwbXPDfM4ov+caww77un4maPh7wDtR/jwqUawrsiPnm0xbldL+EqM2w2Gc59O2QJIPnrRTlNbcD
	e/pIfCHmYljIoNnd1qkwafRCOFsdCqC3cpLIuuYe1mY3J0rSfMXi0nF2643FmTfhN
X-Gm-Gg: AZFdTZfi2pvOZRVpL/Xrl1vMyA+EzZpC2hLmC2hra+GYhYxygKp1BL8IEy7cGMUW2+E
	b/26nukkmnDEguB1Hj6qNMPtDDXfEKA539JGMNPDoYxJN5UTRSvhLMZIKMzeZR5Cz/KT8QIbwxO
	0xQuyg+Z8Xg4ADJs9legnmWu3lMw3999OCYcRY9SfnG+9/uUHeyLotKmGE0nUs0KKmDFaP+TLl8
	BZ0eRxWjJjrgfkX2KSaMbrJOStytcWLAXE/OmecmXi0arVAnbYsK0fkXF1gU7oUwwZYJhGVc4tA
	C1pLpL5OsZJNAXDxwCd0RigXH24ubtwIceTgJcevZb/1osQtG3ccZy9CfLBWPMVjHCSyjk7sy77
	hzcjkcRmWOO98RlR+cZwxGV2Bbb2xJdJqglRrmm/7qJu6EVwfc99KLps8n5LgWnszM2BOTP5H5G
	Goj1ZE
X-Received: by 2002:a17:90b:2d8a:b0:3aa:6b5d:a00a with SMTP id 98e67ed59e1d1-3b41c95b7femr23643530a91.53.1795779856725;
        Fri, 27 Nov 2026 03:44:16 -0800 (PST)
X-Received: by 2002:a17:90b:2d8a:b0:3aa:6b5d:a00a with SMTP id 98e67ed59e1d1-3b41c95b7femr23643480a91.53.1795779856250;
        Fri, 27 Nov 2026 03:44:16 -0800 (PST)
Received: from hu-nihalkum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41adcafe0sm40480933a91.16.2026.11.27.03.44.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 03:44:15 -0800 (PST)
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 17:14:01 +0530
Subject: [PATCH v6 1/3] dt-bindings: i2c: qcom,i2c-cci: Add Hawi compatible
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
Message-Id: <20261127-hawi-maili-camss-v6-1-0f4844eb63b3@oss.qualcomm.com>
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
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795779843; l=1476;
 i=nihal.gupta@oss.qualcomm.com; s=20260608; h=from:subject:message-id;
 bh=BTDhy4Hj9RCXelLYOtQYezLS7KR1Rsj0YchhEiP5678=;
 b=rZ37/Dykad1gUgWkePEK4ua5jVhBcm3T2Lx5wifTU22AKkzobNwh7SmlpOFwcEJqJsLvINRXJ
 qiDvisd2FMKD3dK8zMLrc/vaoMNTITRU+1dVBsO61/rl+XrMfL5girf
X-Developer-Key: i=nihal.gupta@oss.qualcomm.com; a=ed25519;
 pk=DIbyFMNwqU/iMvU/0pCQp2wmRVgtHFBT3PcSu+A+Ncw=
X-Proofpoint-GUID: d_rwqG8yz9QR9ngrkEqRY38j__o2nmPT
X-Proofpoint-ORIG-GUID: d_rwqG8yz9QR9ngrkEqRY38j__o2nmPT
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDA0NiBTYWx0ZWRfX/1ItyYlegB3N
 oRIBRY+XiHCxCd17fT3XqVNG0P0eVXCNT1Wy1O+gaASDWuMUXlbJ8GZkcvjNT2tZ6dcG4hX0z06
 fjER7V52qyyh6RdoymgimB9XtcffwpY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDA0NiBTYWx0ZWRfX5GYeYH7JiqcO
 JFJWYpEBXFEkmWbuodAwpZJnDq+4ZAhJ+FNn9JtBGn5gCn//q1fKIe5r0htmnZKz7EQRq//DbJX
 GZDMatyiXmGTJQbBibO03arVBcmZeHNBriKwRdb2lENudP0KZBLR9bSq2smsz+WDipyYImmORr1
 YdAtl64KMTlR5metEsjGciSIlevKJV7aUDFd8iUr5oou2ysS/7DWO7Kc+t8nVOJLe+P3frZGSIL
 UcBdRPdQzYVT9YMCx+v/AQOFyDLYvxjG+ONPtbHhm5GG115NtvxWlZPgWydpZKt7yzryNlTjP0Z
 GeSZIGzxHrPBDk5+7kSWpxQ4IBNaVn5668C8lMkkeZ+vwD1A1RdYit0BmcbapFBkdDOyO+ZQo9/
 OrBnakUd2Uqy7cEW+iBBLlnpMJ3ugj/V8qxArIc7oX0ECgSn6w9nkmA6GWOW9+Kwc5KerpMLQyi
 3wJ6sNlhPtFvWOjwzxA==
X-Authority-Analysis: v=2.4 cv=A875rKWG c=1 sm=1 tr=0 ts=6b096d11 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=LDBv8-xUAAAA:8 a=AartCDbB9JJyHY4DVtoA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22 a=DZeXCJrVpAJBw65Qk4Ds:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_02,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 priorityscore=1501 adultscore=0 clxscore=1015 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270046

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

