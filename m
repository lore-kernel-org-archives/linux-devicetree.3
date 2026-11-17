Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794905187;
	b=TUe+S/O0KqC7LvQH7i/tuEUtB/RPL8I9W/9l9UWASWHhcMB8yUrBCvPyGcH2knv2trc/
	 Qbk9r3QbgYW+cRWAzsVNAghm+wgbV2NS5nx1VJJDSR2326D95iP5sSIkts1IQ7Vo2q2jw
	 MFRKXyB621k3m5PTm3cvmIDxR+wxFclRh3GAQ/qvEVgTHI3RHpWOLdCHAtTmIJGcDopfx
	 uY1y8pBt8oOK5Ec61eglrrgRc6S8pjpX91t1GwRsXY9MuZ/5n8i+l1v4SdWAjQnFcSN3W
	 tg5zSbUqyVeQ2an5GcODJbbLjI9ESlsPv6Cr+WKuEgc9ZuCDmbSr7xk/3l0hRW4WblA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794905187;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=/CONjcZjTX55AH41Bp0bQLrb1YEIFyeZD5sSZFFOtU4=;
	b=xtYdf+jAIJ/J0KyyH+zTYndwOjkqLikgpWEnZWH2ST7nc7/E5S7PaZ62Yi5Ug21RKQWg
	 RYCyPW70RnobreFIG9nzT01PDuN3FY4VxAt5KX//FjD6a+N9jzUUkY0BTIFJX74bRm8/X
	 pBR2ZrI0xOPrbzlP/Ttnm0u4L4kikJU+cVEJ8cWD+kbZpB0MSZK8EUOHwhlcPkshT59nI
	 Nxg7h6dVra74b8wdHcnoacRYIDE3xk55jadrNFybS2lnpRRXBZZ8IwpZylsrqr3yUj7+Z
	 3t4M18gSJnbXVcrRcAcpKvoWBzr1Av/BzDQwEXD3jrjx8lYmGFEgC4WBLu/kq5oKDlQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=IyplU1dA;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Jed2xX2c;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 326C3606A8AA
	for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 08:46:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 326C3606A8AA
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=IyplU1dA;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Jed2xX2c
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AH8flTb844332
	for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 08:46:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/CONjcZjTX55AH41Bp0bQLrb1YEIFyeZD5sSZFFOtU4=; b=IyplU1dAU8whWxwY
	15GN8SqxkDSjAlPmXp2m+6+oGJ1jjHOdBBEypHzq+BySvPA9zN9YAYNVH+8hvrZw
	iyrkn4SIXCqMTCKLX2Dsiq+J6oFlDt7SFxNl9432m8DTRHMdsO23O6eFgOTyaFd+
	ndP51GqFQD0g1xkUgHrvpHjlu0uG5jJ34gBS4GohoACtcOSHdwMKquKTtN9QkoCy
	HiIy7/9VmUwm2mSL09SeIB9GqKIFHjB49EXGWzkPmDdd2javXqY5zA1g+IgFzkJ8
	feHpcFax8BRKxbkvIKnyoP3CoOqDJ/LZkXZnZpiM104qSOvxGSHHvs2BDWOZ1WjB
	p6qLGg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0c7h1mgq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 08:46:21 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3ae72da2f57so7105315a91.1
        for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 00:46:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794905180; x=1795509980; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/CONjcZjTX55AH41Bp0bQLrb1YEIFyeZD5sSZFFOtU4=;
        b=Jed2xX2cQ7crAuNxLV07iZOjmovpn/Iy/v9GT7nsSYP8ZykKmaohiOFHI5JuNs67ZC
         zdCGOaQVaDRZZ3+aMBB1nmlyLECoTsTX6pg0n8xBA9Irtus12rWh1s7aHdmSKZySTaS9
         mD9jKvB/klJX3EdC3GVwZS/anYAFAWD0wrbYz8VJPYtMz69ss2Xrr1qx7WTvExXfRfUy
         GKE2HGtU7ULlYWcdMFW/M8UKjZ7JhN7YHtyRyWbWx8RqSIgRXuqI6NLRdQBNBiDJQ6QU
         BO5520+uI75k17MbEM9oe/1CzEve7SEMOX7E1K2+qhLA+3HQ0o5yzlNVsaAEPtoFgmlE
         16sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794905180; x=1795509980;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/CONjcZjTX55AH41Bp0bQLrb1YEIFyeZD5sSZFFOtU4=;
        b=jgXFpZ1Um31hlGpk6DvlfBzcGWlafp4A8lXuSMg8CNqDQivuOEf6Uw9w+pnrTkQKYv
         hm/DsyuuoGqD3Wapx1mnaW0i5Zj/d1+PflAb9vaMZDKqGvYFWeb2V94CjyOQpRS7dK1V
         Hb6AeMkgX5vUVfS4MZ2SAy+QQd+ot3gMuSc8Qy6Ox515NoNK75lc1keYs4O5R6E06rkI
         gCYAfygel2gArLnmTfIJYDRnlzwoiW/Oi01NfniDW/5mfAVsrM1QBs0v5UzFWXHleErZ
         /jfvHW2vLfAzvyTU4wLrmsXERCafbD2W7YysaA7uuspkjqYRSNz70OuP3MLy3rP8l9+n
         QasA==
X-Forwarded-Encrypted: i=1; AL+hErH6A0iaBkcD5dvStuM+cEdG77oU0ftGyuxqchAS9PHX1KtXEm6c7rwe+bjOBZ7oP9lX+tw00Cj1gWEj@vger.kernel.org
X-Gm-Message-State: APuU4Z8btElHMGpzsi0ENsUv8so9JjUBi3uafGRD7DN0ooQXABjKylNh
	64Gu92pWtg/t0NIiyLRUxa20LnlicjARo+ys3R53qxj2aEtmGE1WAz1VSum9FgEecQpnoIZ+zWQ
	C7q4uN6OSE91mn4Q+kdCdv92ijVkxPwNAimzf4m9YLhUC47wokz6aDt9JScItqvIb
X-Gm-Gg: AZFdTZflOSCjCqtHvePVSR8NVYuZbN/dCeeJzUBkNjYXPVQ390eDh04ONg1fiur3UOA
	9I6BLFA+TJcmhkfPYbJ4eBIhb8BvtCHEV6LvHMoTRSEDEBF96qrg+tqARlFNYDMeoJ5QCdpvFeS
	wMTTs6/3wm2cwICrZJ/+ooZ8TKpu5drn3P2h4H1UKQOk7qb7x9efdUxWiSDYe/746fwE9XIsEHY
	hJjushC+ooMWjUaBVPf/wbY85vKwLCA6sp/2ms4JupPsvdRHYBfg5RpcvCrjJ0iU8Q9gHUTTOz9
	P4wRXW/8zGCgqQTEhF8RknDn7NiBnTJj2DMY9ENxq9yFQm2uWcu3Q/iQiJKXufdenHd7l8t1rkS
	Ulc4wpepO5w9Sli71zPGL44YKLQ4U4/VYatAyI5XD+jLqyLs5bheuvStBR7uxu0DeAaPjPNeU1q
	ezOQ==
X-Received: by 2002:a17:90b:17ca:b0:3b1:fad:b1bc with SMTP id 98e67ed59e1d1-3b1b0d77ad2mr13585162a91.63.1794905179637;
        Tue, 17 Nov 2026 00:46:19 -0800 (PST)
X-Received: by 2002:a17:90b:17ca:b0:3b1:fad:b1bc with SMTP id 98e67ed59e1d1-3b1b0d77ad2mr13585149a91.63.1794905179060;
        Tue, 17 Nov 2026 00:46:19 -0800 (PST)
Received: from hu-mohdayaa-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cddc18736b3sm5699585a12.7.2026.11.17.00.46.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 00:46:18 -0800 (PST)
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
Date: Tue, 17 Nov 2026 14:15:23 +0530
Subject: [PATCH net-next v4 03/10] dt-bindings: net: qcom,ethqos: add
 qcom,shikra-ethqos compatible
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
Message-Id: <20261117-shikra_ethernet-v4-3-c41902e5f2fa@oss.qualcomm.com>
References: <20261117-shikra_ethernet-v4-0-c41902e5f2fa@oss.qualcomm.com>
In-Reply-To: <20261117-shikra_ethernet-v4-0-c41902e5f2fa@oss.qualcomm.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Andrew Davis <afd@ti.com>,
        Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        Richard Cochran <richardcochran@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Giuseppe Cavallaro <peppe.cavallaro@st.com>,
        Jose Abreu <joabreu@synopsys.com>,
        Maxime Chevallier <maxime.chevallier@bootlin.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794905144; l=4189;
 i=mohd.anwar@oss.qualcomm.com; s=20250907; h=from:subject:message-id;
 bh=GRQtM/wcadv7R+zn5eLlwrFMFCKwmZZnZ+Dq1EyLMP0=;
 b=vXb7kOSstG43o/q3shWkjmBlZAzBQVH15p6eBFVgAtPSKoZkFBlueCr7u5Z34ABx7iod2hFj5
 ZEVlUNAb9IpCpN3w6nDQ5+dEskZeeF5E3loNHtTG+i15xoo7wywUdzB
X-Developer-Key: i=mohd.anwar@oss.qualcomm.com; a=ed25519;
 pk=7JNY72mz7r6hQstsamPYlUbLhQ5+W64pY4LgfSh9DJU=
X-Proofpoint-GUID: J4GRQsGNz9Xecx7Lt5wYJYhek6v4113v
X-Proofpoint-ORIG-GUID: J4GRQsGNz9Xecx7Lt5wYJYhek6v4113v
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDAzNCBTYWx0ZWRfXwi0UtXBi+C7A
 TMUJN8+9lKsVnAGYsuJhehp+UrogBrZUPRvsoWZB4OC8C3OH6ruT6vXsxCeN98vnMxbA9ks+tfZ
 JDoqyIDb06i1u7yN6UnLNwle15YLwt4lM8xZXLDVY7pCXP4ewOE0FUhGEJO5JTz7a3EdEX8UXx+
 sh6eCTjezVwiBPLzW9gRGIPYpMIiRkdddW6CYzDkDUzNjKIt8blIAGDCIEmi3CvjzsFUnMcWGWs
 TTcn0uhERm+FRdrNTfPzxUAS2rse+M4BNqI0pPf9Xd/zyxwNYmAoHgSBDAh5rPKghDR+7s9x7F0
 a8togUS0ge8Fyx+4m2nhR9gx6NEna77kb5WrszNLITPNTpCJr0pK3MGefvKGVTpxKG9kBdbfBYZ
 53KLybPUoINuYJ+hcNGmR77MvzqlAJOc24UPFID9KmkLwvDR3Uot8Ktf71mSrXsHSUeQEYpZnGO
 OPQVpspz0e1f3YBzktg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDAzNCBTYWx0ZWRfX0rE0rqWvLG6T
 owgq1OlWRHYwmI6zfkaF9XV6oEfmSgdiUQ6JDiKfs3b+ewPeM9kXI1amE1X4Uy2pe7jv06FFt0F
 VEmHtS/Kn/wHHyYQ0v9Pvj52vNd9Jho=
X-Authority-Analysis: v=2.4 cv=bobZl0ai c=1 sm=1 tr=0 ts=6afc145e cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=iZY8vWlYZPOy4iMPn4IA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 lowpriorityscore=0 adultscore=0 suspectscore=0
 priorityscore=1501 phishscore=0 clxscore=1015 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611170034

Shikra's EMAC requires two additional clocks for NOC interconnect
access (axi-noc, pcie-tile-axi-noc) beyond the standard four, and an
OPP table with required-opps to vote VDD_CX to SVS when the NOC clocks
are enabled.

Add qcom,shikra-ethqos to the compatible enum and use an if/else
block to constrain Shikra to exactly six clocks and require
operating-points-v2 and power-domains, while leaving existing
compatibles unchanged.

Add the relevant compatible to the binding document for snps,dwmac as
well.

Signed-off-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
---
v4: moved operating-points description to the top-level, and added
power-domains as a required property for Shikra.
---
 .../devicetree/bindings/net/qcom,ethqos.yaml       | 54 ++++++++++++++++++++--
 .../devicetree/bindings/net/snps,dwmac.yaml        |  2 +
 2 files changed, 52 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/qcom,ethqos.yaml b/Documentation/devicetree/bindings/net/qcom,ethqos.yaml
index ef520f810577..6bd4bded650a 100644
--- a/Documentation/devicetree/bindings/net/qcom,ethqos.yaml
+++ b/Documentation/devicetree/bindings/net/qcom,ethqos.yaml
@@ -14,9 +14,6 @@ description:
   dwmmac based Qualcomm ethernet devices which support Gigabit
   ethernet (version v2.3.0 and onwards).
 
-allOf:
-  - $ref: snps,dwmac.yaml#
-
 properties:
   compatible:
     oneOf:
@@ -32,6 +29,7 @@ properties:
           - qcom,qcs404-ethqos
           - qcom,sa8775p-ethqos
           - qcom,sc8280xp-ethqos
+          - qcom,shikra-ethqos
           - qcom,sm8150-ethqos
 
   reg:
@@ -57,9 +55,11 @@ properties:
       - const: sfty
 
   clocks:
-    maxItems: 4
+    minItems: 4
+    maxItems: 6
 
   clock-names:
+    minItems: 4
     items:
       - const: stmmaceth
       - const: pclk
@@ -67,6 +67,8 @@ properties:
       - enum:
           - rgmii
           - phyaux
+      - const: axi-noc
+      - const: pcie-tile-axi-noc
 
   iommus:
     maxItems: 1
@@ -81,6 +83,14 @@ properties:
       - const: cpu-mac
       - const: mac-mem
 
+  operating-points-v2:
+    description: |
+      For Shikra, the OPP table specifies the rates for the NOC access
+      clocks in "stmmaceth", "axi-noc", "pcie-tile-axi-noc" order.
+
+  opp-table:
+    type: object
+
   phys: true
 
   phy-names:
@@ -95,6 +105,42 @@ required:
   - clock-names
   - reg-names
 
+allOf:
+  - $ref: snps,dwmac.yaml#
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: qcom,shikra-ethqos
+    then:
+      properties:
+        clocks:
+          minItems: 6
+        clock-names:
+          items:
+            - const: stmmaceth
+            - const: pclk
+            - const: ptp_ref
+            - const: rgmii
+            - const: axi-noc
+            - const: pcie-tile-axi-noc
+      required:
+        - operating-points-v2
+        - power-domains
+    else:
+      properties:
+        clocks:
+          maxItems: 4
+        clock-names:
+          items:
+            - const: stmmaceth
+            - const: pclk
+            - const: ptp_ref
+            - enum:
+                - rgmii
+                - phyaux
+
 unevaluatedProperties: false
 
 examples:
diff --git a/Documentation/devicetree/bindings/net/snps,dwmac.yaml b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
index ddfc32ba29cb..b6555ada21da 100644
--- a/Documentation/devicetree/bindings/net/snps,dwmac.yaml
+++ b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
@@ -76,6 +76,7 @@ properties:
         - qcom,sa8255p-ethqos
         - qcom,sa8775p-ethqos
         - qcom,sc8280xp-ethqos
+        - qcom,shikra-ethqos
         - qcom,sm8150-ethqos
         - renesas,r9a06g032-gmac
         - renesas,r9a08g046-gbeth
@@ -568,6 +569,7 @@ allOf:
                 - qcom,sa8255p-ethqos
                 - qcom,sa8775p-ethqos
                 - qcom,sc8280xp-ethqos
+                - qcom,shikra-ethqos
                 - qcom,sm8150-ethqos
                 - snps,dwmac-4.00
                 - snps,dwmac-4.10a

-- 
2.34.1

