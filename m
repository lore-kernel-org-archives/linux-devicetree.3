Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA4C43F411A
	for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 13:21:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781270470; cv=none; b=Ibv02WP2z9jtnDTPvc9s+yv7YSxAp3l85VPsnJPdsZPSJgqSs+yy6SRMe4Lsq4F47MpVibbn2Dn5QbXleUmgi38MIjbki0Nps37joEOj+4pwioihoRmD1bLTgWBuAjlk7aW+NqGSQI6xh/b5jM7CuOL0lE1+PKSho2HuQeYF2M4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781270470; c=relaxed/simple;
	bh=X0Ai0achBf+ZwxyXQCLBkT4mksbIzc1fznSydl00GqA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=j4kQP69cI20uC8QczSqQ3xgkV2ySTq3GkOE992595ImNCHfEM2m6zg5NBhWRl9yJ7U3q/+zlXhFgBuWe1wSDriaYDG8cVQW16Tj7qHJYCHxE7v3pnI4AqATmXrtdoxfyIXdCi+tGJAxPWCb+/WsPg6vxyD8vQg4uJrFQUKtPvL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ewQgfnCL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=P9Xl72Qz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ewQgfnCL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="P9Xl72Qz"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65CCj8fu3760577
	for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 13:21:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/uyx06x8K5ep74cMiQuw/AWSjV6qe5TglOy6xBBnhww=; b=ewQgfnCLI68ej6Qo
	9OvW3Hi1cjrVzZolpkfEcfXgnbQl6gVVUQe/0Yp0LuwgvD0Qsc5IdUDcrmpsOF7V
	Z/vHzjH/RTaUpBynaPr3gFnmOdDpnUNPNDzQPhYR+o99ADjRTwBodu9jeRTtmWvz
	te2fZaZFzkN4i1pVF6a9pk9+tSgxqW+YMd+WkNoL7CrS0KCHdRVFHbfvKF7kvEZi
	wgOgDbXctH61qgfVv8uE9WrR9AZtA6dq0Dc9JuSq3QgoIBeREWczdf+29NpOtvH/
	dZPxZfyuZezJJmJ7EZ7SwhXPEK3ThzjcIIOlzKvyJhxy9QkoLOOJ1VYlLWUX/Yrz
	NCLHdQ==
Received: from mail-oo1-f69.google.com (mail-oo1-f69.google.com [209.85.161.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4er29uu2h8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 13:21:06 +0000 (GMT)
Received: by mail-oo1-f69.google.com with SMTP id 006d021491bc7-69e89d83663so1114381eaf.2
        for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 06:21:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781270466; x=1781875266; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/uyx06x8K5ep74cMiQuw/AWSjV6qe5TglOy6xBBnhww=;
        b=P9Xl72QzhYLQXH/GBjYt6pTxXaZxUAwgL5u7OR3qDUVugoEEJtZftcymlbbYBGp/cE
         po5pwnoP9UU3t/Pq2SD679RUS5fifmLbihW06h7c72WZF1vKC04YXaQzNuB0oQkb1ReP
         y/AE8ZKaEYUx7Ns/ZAg67tHRAsP1BpN8c148s1F4iQC4rlNInUuYRQfjTSezvaKy2UqC
         k3j/kgDoAgcxhKLAJ4XVdlO51caiRh/AfVz4+P3PGenuM0/3Iv9+BTRB23XIq9X0m9TN
         vj3U1Y5//t8nGLTuTTx2yeQLLX3HOwteqBpKqkJOKFPOvlUoWZEPQb14J46uXbnZM8AE
         Thhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781270466; x=1781875266;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/uyx06x8K5ep74cMiQuw/AWSjV6qe5TglOy6xBBnhww=;
        b=NS1f2dXWIgRLvb+4EdxZIYLbRGolz2z+c4IyQl/vd5HBAzuhsKEQ+4RmkreKgvxZyf
         fY3XnBgviGTApKau/FE60kO9cv6IgMzDG5fFFOoi2i7GKC09AtVMxAWF+tEfuCjlgbvg
         C81z/th/nvQDgyzo9Kw5XZEzWoUGm+pXDuhDqWbi7ie5WqyC7zbu/72NOrRxiz0vBXLz
         zNc/vSBwr+1xKAQeubFwZK+JJJaIl/0CfvyvPfIIe6WyY8lqtr90pFqEmOErFTSAMFlY
         1xEIzxJUVjgz5Z+GqpNkrkaiUa0HMKj3SXrQII3Zzxp9ZvrxZHV0Wc+p93qE4hqPRSKH
         TVBw==
X-Forwarded-Encrypted: i=1; AFNElJ/JFkE44G9c4vocv3TAD4JBMRj9e2HA0F8acagphGrX6hdG19pV3KkqC1ALk36TVpibPILf65IdGGNR@vger.kernel.org
X-Gm-Message-State: AOJu0YxVshsPFypCuYx0bYgJCZK0nwvYf/OCAqD0E7nlnhUBHCFuConu
	PQeJ+pXVQFUBJSaA/lCjAKfxRlC65R5H2RS3YQHuxEtgSmUStF36ff/Dk4etUqxBgGOVGikchMK
	wlEtfO6VoXdbHbw6jHLOwnPXAD4BMAKIeMr52OOoQ6MSCKa2nXZDQ+0eG4jjnG9NI
X-Gm-Gg: Acq92OHhS7cUKE83LEMGb920/tPp/GUPTby/rk0ZpyiA4K8e8uzhasQ2gL1oKDecsKQ
	d8cNXqu51VY0hlh1nlf40vUjqpbwznE2rXjd24be4UmmfMeA6duib0O/pe/KkWgR33CUN6aLacO
	ZQkYAhnM1lIN4Awqy65lwsLJknwRvkawCaYECDcq7To447jCo0ZJYKZz2y0Ca0/XVR4js52792D
	sWcLhP7iwNmTDNeD2/c8RQUK227C0zkMoL7pc2Yz8my/TaQv1jVSmJbpflLRPt45eQuRszfwey0
	xonn9Ods38PxofdhfaAf90fxSSUKYpiXo7sWaLj+89HAXodKXxUVZLLa4YniKPx+r/mwGm9gquS
	uMTe17Rrr5J0rD2TmdsJGscyFtBRpCdeHOzuehzpPHH4IZv/4fF/3jC6ujvOGTwRxePmemT8w12
	K8DRtcri/KyUZIdzTZc1g1WJBa9GiNVo2NFHmQMuA40kUwNLNL1IuUZGMfl2S8h+xkfnH+7i7B
X-Received: by 2002:a05:6820:6ac5:b0:69b:196a:de67 with SMTP id 006d021491bc7-69edc38e930mr1694317eaf.0.1781270466079;
        Fri, 12 Jun 2026 06:21:06 -0700 (PDT)
X-Received: by 2002:a05:6820:6ac5:b0:69b:196a:de67 with SMTP id 006d021491bc7-69edc38e930mr1694292eaf.0.1781270465641;
        Fri, 12 Jun 2026 06:21:05 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:3510:32cf:db6:13c6])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bfe6f9c46f0sm59986866b.1.2026.06.12.06.21.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 06:21:02 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 12 Jun 2026 15:20:54 +0200
Subject: [PATCH v5 2/9] dt-bindings: mmc: Document support for nvmem-layout
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260612-block-as-nvmem-v5-2-95e0b30fff90@oss.qualcomm.com>
References: <20260612-block-as-nvmem-v5-0-95e0b30fff90@oss.qualcomm.com>
In-Reply-To: <20260612-block-as-nvmem-v5-0-95e0b30fff90@oss.qualcomm.com>
To: Ulf Hansson <ulfh@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Jens Axboe <axboe@kernel.dk>,
        Johannes Berg <johannes@sipsolutions.net>,
        Jeff Johnson <jjohnson@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Balakrishna Godavarthi <quic_bgodavar@quicinc.com>,
        Rocky Liao <quic_rjliao@quicinc.com>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        Saravana Kannan <saravanak@kernel.org>
Cc: linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-block@vger.kernel.org, linux-wireless@vger.kernel.org,
        ath10k@lists.infradead.org, linux-bluetooth@vger.kernel.org,
        netdev@vger.kernel.org, daniel@makrotopia.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjEyMDEyMiBTYWx0ZWRfX8ClnyLpTjRMT
 /vmqCcWapNsdXn/Mrt86fgkCaNZTRCvlM5TQud3thDtR9/+C12k9TLhAhWAGsF7BJ+6YkPWc2eG
 Z481k5+AF+RJjBr1JuA1lOsVIMeC5fw=
X-Proofpoint-GUID: 2mbBtjiqAhD2Ile9S8MmMdRWpBVAYYBE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEyMDEyMiBTYWx0ZWRfX24ZxD68Dk1ST
 E0DWATdHqIQE7RBipGIP/cYas3TxCfPeIwuWbBH+kL2TeuhF0oG1QrkKGSGpcerhIWelnolDSbd
 jJ+4yls80bkDGumb+TnSaD+WTw4D3xWEJRUqOSc+xEeGcTtgJ+RqthPwO+G6y3JQp+0mUkIIntg
 oUCt0VQ1Fx8fy7TMDnO5lS+aqc0yU7zJMRPHZMdsfieiFRtAH+BOziiQG1N95s9zBqyQdwQAEvA
 lmipuQU1r9ZpXBsK6gCul9pQ71d7h1DmuyFf4f5smMhBotVyTrQ5IecxmICfXLH5rvkEMfqfUSI
 NQStTduo0b4Hl6r1L9Gu/+sr2JK8IFV3Mc3a+9QSeBx76igiHpiQBVSwP+iT3Fh0GvcA9oVngsW
 0O89RReBlkft+hA6nzYx7j7I0l9PyfsXq2q55xBeCo4Qm3xGSI2ikyLLbT9c2sM6LJUEL4RrjfQ
 irHMH2VUEMp6awhK2Bw==
X-Authority-Analysis: v=2.4 cv=DppmPm/+ c=1 sm=1 tr=0 ts=6a2c07c2 cx=c_pps
 a=lVi5GcDxkcJcfCmEjVJoaw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=9i5gzfhGLSn5NVSMExYA:9 a=QEXdDO2ut3YA:10
 a=rBiNkAWo9uy_4UTK5NWh:22
X-Proofpoint-ORIG-GUID: 2mbBtjiqAhD2Ile9S8MmMdRWpBVAYYBE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-12_01,2026-06-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0
 malwarescore=0 spamscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606120122

Add support for an nvmem-layout subnode under an eMMC hardware
partition. This allows the partition to be exposed as an NVMEM
provider and its internal layout to be described. For example,
an eMMC boot partition can be used to store device-specific
information such as a WiFi MAC address.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 .../devicetree/bindings/mmc/mmc-card.yaml          | 29 ++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/Documentation/devicetree/bindings/mmc/mmc-card.yaml b/Documentation/devicetree/bindings/mmc/mmc-card.yaml
index a61d6c96df759102f9c1fbfd548b026a77921cae..ca907ad73095925b234b119948f94ae81e698c86 100644
--- a/Documentation/devicetree/bindings/mmc/mmc-card.yaml
+++ b/Documentation/devicetree/bindings/mmc/mmc-card.yaml
@@ -40,6 +40,9 @@ patternProperties:
         contains:
           const: fixed-partitions
 
+      nvmem-layout:
+        $ref: /schemas/nvmem/layouts/nvmem-layout.yaml
+
 required:
   - compatible
   - reg
@@ -86,6 +89,32 @@ examples:
                     read-only;
                 };
             };
+
+            partitions-boot2 {
+                compatible = "fixed-partitions";
+
+                #address-cells = <1>;
+                #size-cells = <1>;
+
+                nvmem-layout {
+                    compatible = "fixed-layout";
+
+                    #address-cells = <1>;
+                    #size-cells = <1>;
+
+                    mac-addr@4400 {
+                        compatible = "mac-base";
+                        reg = <0x4400 0x6>;
+                        #nvmem-cell-cells = <1>;
+                    };
+
+                    bd-addr@5400 {
+                        compatible = "mac-base";
+                        reg = <0x5400 0x6>;
+                        #nvmem-cell-cells = <1>;
+                    };
+                };
+            };
         };
     };
 

-- 
2.34.1

