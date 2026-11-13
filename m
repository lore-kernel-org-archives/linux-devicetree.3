Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794558051;
	b=L6NFvdEb1B6r1J1WcbSL/ehzeTUP3wmjXq5NkTad3dQegVggpE2HgW8YKY4Qd+N4QdFE
	 E+M1aWQRbzWvLo8UrhgY93E8oE7npq7I0McG75NSBwWR4fbx0CcKeRzJKwohAZdT5Jnlf
	 rL2Eb3f3Ubde91HrU2U+e5AMyYtVN+R2gCMNcp5izFIBQjSnH1SI0/z3vWa9O9fG65Q+V
	 9Z7UCsryKCsCVCnpdQX2IAxQDfnvskEeTGWusD/nscKs820kwA/sEGF7F+gm/2t3pkjei
	 /ZwH1yrQd96DdtCVMQtuPx6luvI3kGyTWMykLdwB0W7jmvoORKsyI5cBgsI7pwkN2MQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794558051;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=GB8bdyIAenUYMRW0QZpRkLcjvw/MrzilhnvYAl3NvF0=;
	b=5e4+S52vbJAqznBgNd/b5SDo9ZC1X7quMQzoxfouzxYTUxR2G23NyzavXur5Cc1LFtvI
	 OBRw6/7r1ebwgLm0h1rQZyxtHNLFqnR3PgVvS7p74BUuaozAiXYWuJvalmfZX7/IP64gf
	 Cpi++B9rfc8JRWAU3K2HUDLwouXkdX2FQF82N50m6hFxjGRrdlauQLwJ/18gaiPZhAa2Y
	 vQBYuQcIFbvnuNL8/iesWVtN/lgf8o+X3inTGP9JOEu7z0drRVkxKJmElyjEkIarACi8E
	 nlHCKvlC7gcG/OVfEpKrhPXenIcRycfmBU3dLZa3d4zOiFe5AGON35JpBBvFvk66GRA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XOnar0iu;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FsSJeJWM;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D315A606A8A3
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 08:20:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D315A606A8A3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XOnar0iu;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FsSJeJWM
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AD6ICQc1164168
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 08:20:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GB8bdyIAenUYMRW0QZpRkLcjvw/MrzilhnvYAl3NvF0=; b=XOnar0iuZvP0vmra
	srGEP4McvcKdTGb5rWUtyf9UovnD38hxYKrVFDe1yhtN9e4DfqjDHP6d02zqYqI2
	VxtFjCk1o/AjS4Gujc5zUZo3Ma1pJ3X1ErGLf3uc6wjRuoo5YTWkE7wGy1soLNP8
	zNbjMlFSr8YVk0lQOM1181dOFGn0pblNRrj5TH+8GCcm545fxBq2BrKX8yWJycae
	U/pE5qhwi/Nto1tATrbt11ts4iL+GNOlSPSdti+Jd0R45WLVLHusUo3iduQ/CteG
	Un9c2TlG+j6g+HPFPrVijhUs4kqFlAKK+lNRm86dPnvTXexftWQ075TJeZ7bi+E6
	bsi1JQ==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hww5r8d01-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 08:20:49 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-370230d93efso3334298eec.1
        for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 00:20:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794558049; x=1795162849; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GB8bdyIAenUYMRW0QZpRkLcjvw/MrzilhnvYAl3NvF0=;
        b=FsSJeJWMSrCY5YLT4Y7H1Loni1WXW2Fih51KoJdqPV0+36RryA/o6jlLQqK/V+Ouof
         mztMHHzfwFOMD6wNyzMDKAeSKR0L+nX9lpADD7o1WvO8lB3c0Nr4ZQM4VabT5bEtCMlS
         6PlV54CBhZDHJngd1dfgp/lyfB5E9GTufFsLYVrWsUpph11dVrVQDZywo+wbHCs9bNnW
         +272W9TcFsgQclQ5lLWJm8Pt39IhlWclEs9bOYFpJ5ozKCJmgHvSC9+XJ9A66btPA6qe
         fN3A2E9YUlRwO1EDuZbYL+sbCPpTDfCY4rHrE8hP2uLMGTO7nbjUsNqwD34gLAywVrJa
         9Rmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794558049; x=1795162849;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GB8bdyIAenUYMRW0QZpRkLcjvw/MrzilhnvYAl3NvF0=;
        b=jjsqoa1Ro5dOi0YENN3kW3yZaAxy3aaVrAOiWKOlppzYMsvm4ncGhPPbUGH69h1FhX
         AssNoY0g0oPKWg0kjnSeSELRq/kW0Uc5n6t5qjSbPaTletRwvRlO9Ec9anm9WcRYms2T
         0tks84tvlhAelWeC0PEM55Gyx2vszDoMv+zGrCWmmmkCr4ynBttSjETwbz2d+/ZB4+HQ
         uKigsVcEXEtyD5bCIvubDvV13XvEQcveG6DEKUiLpJiebwhe88v7r6WuRz1DHn+uJOee
         epmGq5gNpSG7s7v6uOtI4qx3xFBC4wP5fnVqXSNbZxSxRoJsRkHaVcT9brStyyyK1qxN
         4/AA==
X-Forwarded-Encrypted: i=1; AL+hErGF7Dc/VOwqwDY3LxnmeYb/zsdetjj/EcsSYrNjQhhrUr54v29Ol6eogVvMWu8YpphlM0sqDrA8zYyJ@vger.kernel.org
X-Gm-Message-State: APuU4Z8ITMGmw4CP96QwkUy2NqT6qd6ZKsBXb8fKxEIh1OLUWEO/o1zz
	DajZog8KDWR+DS98c7nB6qUGcdhkrurCjxVvCwFsCGVUfka9zi/K455HThYx2G3pwo744ehmbuf
	oFe6tODQj/mqYPDw4BDI2a28uo0ggZPaTJ6nw438/YOvz2yJ2reiS4fHgRcEff7TyayxYul0L
X-Gm-Gg: AYBFou0+dFjEBXjzEQLkP1lt99j5OPe5HWTVvFO7EDpecpUXPgFoUcjLO4SQPQ28RvU
	Y8TuyR3g2+5D6hpvxzcn/cGVBlYVGBn1oFJcdtFaDZeBbtSU/+qXFc4byset0LwYrqP6c9yk3uC
	XzvBp2tJ+oaLxr1UbcjqGVG2qqe76oi0X+D+S1x3qeJVTZxZqORu6p2aBMp4niG4hs5OUTPYi2v
	cmU0pYn/DTKM77Jtrue6msLWtFFYGmzDyv8gmoQzduHFe0lRPcrbn7IRHwLQktciEk0/dOaGHdl
	AUcVFTYWfJq8A0TLeBCwcvtPul2N3dtOABbDHpykmh3CO0OJOV+wJnCOQTRl696ER5RnzQdzo9J
	E46pmU/rOFrAiTzbQAW3TLDjcD1X6IeRtgdehz3hp5lHFq8fCJDiDXnkg0uLyUz9uksaNCgIrT+
	Gtxy6i
X-Received: by 2002:a05:7300:2717:b0:36d:394d:e696 with SMTP id 5a478bee46e88-379679e33b8mr1576629eec.29.1794558048594;
        Fri, 13 Nov 2026 00:20:48 -0800 (PST)
X-Received: by 2002:a05:7300:2717:b0:36d:394d:e696 with SMTP id 5a478bee46e88-379679e33b8mr1576597eec.29.1794558047883;
        Fri, 13 Nov 2026 00:20:47 -0800 (PST)
Received: from hu-nihalkum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37955822d58sm4971713eec.10.2026.11.13.00.20.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 00:20:47 -0800 (PST)
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Date: Fri, 13 Nov 2026 13:50:22 +0530
Subject: [PATCH v2 1/2] dt-bindings: media: qcom,glymur-camss: Drop port@3
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
Message-Id: <20261113-glymur_camss-v2-1-b1b76509c744@oss.qualcomm.com>
References: <20261113-glymur_camss-v2-0-b1b76509c744@oss.qualcomm.com>
In-Reply-To: <20261113-glymur_camss-v2-0-b1b76509c744@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Suresh Vankadara <svankada@qti.qualcomm.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794558038; l=1388;
 i=nihal.gupta@oss.qualcomm.com; s=20260608; h=from:subject:message-id;
 bh=PuZTlOZoHF/pMdejS9tAzCDoNgWwALKveQWqW28u/qw=;
 b=dCoQcm5zUnZnBakJObf5tk4CG8Voi6YOt44Tna9inGh6/wAOgqc4RUMwPQxcpHgbv6UiTpU0p
 04G/ojRWDWdDiCivEY3L79mZsI4Kx89yVjXuoas0P6pLpQtScEZmFSt
X-Developer-Key: i=nihal.gupta@oss.qualcomm.com; a=ed25519;
 pk=DIbyFMNwqU/iMvU/0pCQp2wmRVgtHFBT3PcSu+A+Ncw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDAzMyBTYWx0ZWRfX26DHCE45ws1R
 uf8rUsjwmuh6uoLln1qg5K5nxxZCWRgbxUl/yL7J6/wz89RcU0gHA7tIE+f2GVt8QNYr+6gKwv3
 9spansQn7UMpektb16Fgyznh9q9G9S3VHCzAOOnfsCDo0b/Rl0vOE9z7OYBFqJZP5NLNw6j1RMf
 EnIUD9yMJTTsfoy+K6yQGZhCWfx5UKEa7aqQorgOTlOVtN1ZZr2s4+fGpxAgCKQ9p8REh7wjV8j
 M+NYSycugc6yQQpndLb8nq0SSgryvTBAvXQsEmXtYOT9KriM8bhJmUm6nTOw4hVB44UjSR0riiQ
 dPiMm7bsLRKuE84CEuGvMuzxDuTJgIOItvxYjgoxDYT6rSZea8iGx0KIc/w24Z0Ww4UtSRwdFwh
 YeBWZkK6NSYnGluKemhIwkfRYnj3s8z3zuQNigFWOQ1VstsILn1KXxK47sS28NXDcwYibC3Lbo5
 86xvTXJLsTk964W62Ng==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDAzMyBTYWx0ZWRfX/G+zEcdhHGhj
 K3YtC9HoLOg/+7wWzNgYnkr52z+qnMwRaHBdiawPq0ClcKjXIKMBCCFAEjKtvyAeLKc2N/3ex7Y
 MRN3HaTXiQE38zALak2KUy/Q9r0lueU=
X-Proofpoint-ORIG-GUID: _OrcxWkL5xMQpHtUy4t4GxeNkR4o-Gj_
X-Authority-Analysis: v=2.4 cv=Vqq2kO2n c=1 sm=1 tr=0 ts=6af6c861 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=cfbElirpQlrRZ6I-D6QA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-GUID: _OrcxWkL5xMQpHtUy4t4GxeNkR4o-Gj_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_02,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 clxscore=1015 spamscore=0 impostorscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130033

Glymur has only three CSI2 PHYs, so there is no port@3 in the CAMSS
binding.

Limit the allowed ports to port@0 through port@2 and update the example
to use port@2 for the third CSI2 PHY connection.

Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/media/qcom,glymur-camss.yaml | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/qcom,glymur-camss.yaml b/Documentation/devicetree/bindings/media/qcom,glymur-camss.yaml
index a0b77edc212319fad69113f3d55ca24f184d4b23..18a38fc4f9025f6b927780f55ed4fab194091c02 100644
--- a/Documentation/devicetree/bindings/media/qcom,glymur-camss.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,glymur-camss.yaml
@@ -109,7 +109,7 @@ properties:
       CSI input ports.
 
     patternProperties:
-      "^port@[0-3]$":
+      "^port@[0-2]$":
         $ref: /schemas/graph.yaml#/$defs/port-base
         unevaluatedProperties: false
 
@@ -288,8 +288,8 @@ examples:
                     };
                 };
 
-                port@3 {
-                    reg = <3>;
+                port@2 {
+                    reg = <2>;
                     camss_csiphy4_ep: endpoint {
                         data-lanes = <1 2 3 4>;
                         remote-endpoint = <&csiphy4_out>;

-- 
2.34.1

