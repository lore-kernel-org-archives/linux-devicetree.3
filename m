Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4C4A3033D8
	for <devicetree@vger.kernel.org>; Wed, 24 Jun 2026 19:09:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782328153; cv=none; b=AWxpx0JreYMJmcofa6KoliIIoyA+SPL03OBNaASB28qQH5zfxjBrFnmqtdDS4Hdf/WvxfxqSCIf6yUCrPJiQHzJPQn063cyKHwBcnsLEEUVzYoJgfsL6iuZ+1pgk7DqZ5MCWrEWxZnHbW4JIO5qU98X3PFFr5h9D0865tKhixcc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782328153; c=relaxed/simple;
	bh=XdtLEaH8dAtuQySt0HvTN+uaOVEXsxsDNrDz292Keds=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qz8uYFHwBA7CLzQUcIAldur3arttUTrGiiPvse06hdlFP85OtCm63JMlkqihXyxlcT86dSm1WO0HGSL0CuJydNxUsr/bUeSP7LFYLzpoq0826yGpqCwDlrRqrPqIl4h1pveXUgsPn8Z7SkhrfwSppWNtd4dz1QwUQOLNi5uTYnI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=U4KSbZkU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Cl5r1X0j; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="U4KSbZkU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Cl5r1X0j"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65OHj8tL4153445
	for <devicetree@vger.kernel.org>; Wed, 24 Jun 2026 19:09:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=C7P1pQrIDHm
	k6wa5FgU9fsIfcm6sy9xqBHFINxP0Lss=; b=U4KSbZkUmdY+Od3O7H9vc8NF8ai
	JVl6cXevnj1QZSNiAdPTavZ6mdW9yMIvQzIYxZWBSUGdUCQHzihQ4s4N6SHXdgCh
	K2Bi7CNMzqunFsoFwc9Q2vB1oa+Jaeg+qZMnrR6cvZ0dYeGNSJdqdq2Qg/LDfUrW
	qR+LgkyoXGMKkT6RhIVZs1m1MdEsdIsRA09oXCosn8bzVpNMmwd0GNx7tcqL0qhP
	36zNRjSVrEJ8s1ZstAyKaxYOZZU22q3GozaLzRF3LLqAvWqerzqvoTxKd9hAP3ui
	WNCLl22328Ricu8gePdmuSbzM0vidINJ0FQCq9sKTMIYkqf3VKwHedOK9jg==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f0996k5xk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 24 Jun 2026 19:09:09 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-842446a3851so953718b3a.0
        for <devicetree@vger.kernel.org>; Wed, 24 Jun 2026 12:09:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782328149; x=1782932949; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C7P1pQrIDHmk6wa5FgU9fsIfcm6sy9xqBHFINxP0Lss=;
        b=Cl5r1X0jXgDGJQu6VdsbmfCP6wpGeR5bVow3z18QwHhihu2Szz45Z3ZmZFtd8mmKTo
         hdjfktE4jqnn+5LvhFVkDRJvZRjOAsSN3pGKWtAPMJCv9lS9YMC4WN725Mf3klbcvUHJ
         iecKNkrr8cWsYXuzRb6dJVye2UQJoLmL+wv6mrT4juEZdbLoCRMYtixEqcO3CHxIuBs9
         pAXFfon86jKX//SWhkU7Kvy2CXKXTVK6qnJ3wWl4gZuimONn87oBZmQbYijxUVBrkP5I
         dE2qJjeeHJdrpYd8g1C9mhvc52XbeXzyz0F49GjLPBE2E08nrJzzRCgkyuwYAUUXuyon
         fGGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782328149; x=1782932949;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=C7P1pQrIDHmk6wa5FgU9fsIfcm6sy9xqBHFINxP0Lss=;
        b=cZMBoSRSwD7MxQlF+n69cTU8CTJT6weqKT+O7FqvZk8DI56GbMbLtG/kl1N/lYOF7N
         SwJfiOkRD0c3+hjwDeiywrFwJNLXyxcKa7n8UHbziexB3BO+T4voK6RtxzUiUWhz+pfS
         BbdqaINi8IWrMedzM1WQkz85UGBhxRlBUru5Zi1r/QurJNeDMafr0BMtHar/4NwKUz9k
         xBlD1j8KMF+ASB3FgMRuRdnWb1147DDCiFfIVkQSCa57W3r5nyBvJLxEIeO7nA4c1Kb9
         jnxATMhOOCE1PBigpZowO81mfaSuHrsyfIRxTmbWLq0ImopLp+bQD8+ZkhaQvQUEMU5k
         fA4A==
X-Forwarded-Encrypted: i=1; AHgh+RpDiHaM3PRJYQAthvUDUEmb64DH2PdaSgXD8qGxT4xqJJgjcNnR0Ir3tX4W3nCBpVAvFwzh4LiinK3J@vger.kernel.org
X-Gm-Message-State: AOJu0YzF7IAuzGULyhQp2tBQq0PUggDclE+FPxFBuR/5WKUJzYNQkUWG
	jq5vRJqOPCj2Ze6PZdB1zRDzACLgVlatjqztC5XOa4slq6W/zu6rxTuLvjJDmRM+RXeHgzpHilc
	7BOadXXvRF4d9JIClAzxr3FHZ0jsQzTRbk0nw8cF4YiJsX3VGjKTrrqUXJY2cl33S
X-Gm-Gg: AfdE7ckNRdwYbJ3Kw/uCO2rBJbGNE22y7Ezv77L7DSi3vxHNWdqIlgCB+YAordRTbdE
	oZQTXzeJnV6ufBP4ZRbA2p2kFExAdbR4E0qEvVg8fjWLrhYRrm0qnusBeR+Kx7sXjaWSjBKhPnK
	B3K+QCo4prGo2CLoW0oD3oy+nZtdmx8YxdJDI6/IJGLu95V3vJBWmHjUeBhQlxVpzNveKZAl0eS
	UBFvqw6FFGiiYuk0syGC6747lYeaMSxaX6Cv6HGoGIyw+cRVCTV4JoQ2tXrYy6Fdj/dRwzoi842
	7y9X++cf1vMRaQSJgcutChGGDETl/t9MbsbnuF1bOr/WCuOG5k/+U2kKBKzOSx6qRnsq8RE8JOG
	Te+TslkQwFDoU2eWDUPpsXf08QCFsBc7kI5zBEw==
X-Received: by 2002:a05:6a00:23d2:b0:842:6a3b:60d8 with SMTP id d2e1a72fcca58-845a27afc4emr5653695b3a.30.1782328148819;
        Wed, 24 Jun 2026 12:09:08 -0700 (PDT)
X-Received: by 2002:a05:6a00:23d2:b0:842:6a3b:60d8 with SMTP id d2e1a72fcca58-845a27afc4emr5653663b3a.30.1782328148290;
        Wed, 24 Jun 2026 12:09:08 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-845a412e5e9sm2932120b3a.54.2026.06.24.12.09.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jun 2026 12:09:07 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>
Cc: cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH v4 07/19] arm64: dts: qcom: sm8450: Add minidump SRAM config to SCM node
Date: Thu, 25 Jun 2026 00:38:18 +0530
Message-ID: <20260624190830.3131112-8-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260624190830.3131112-1-mukesh.ojha@oss.qualcomm.com>
References: <20260624190830.3131112-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: rcQfBteXKkYhQgVKHPXlVVSUzVE7lznJ
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI0MDE2MCBTYWx0ZWRfXyqLyaZv027j1
 oSQwtuI3ajNHndzDkZ5us1EzAngfkYlMHrhONRCPUSgJeOLXxYBb+MwSvwc9JSaWP4ZwuiAUD1b
 BrK92Cmmdqs26/+GdW8S5bnP8fMR714=
X-Proofpoint-ORIG-GUID: rcQfBteXKkYhQgVKHPXlVVSUzVE7lznJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI0MDE2MCBTYWx0ZWRfX2oj0Xkr07FXk
 W1W/VR1r39p170tWN9xdORiiGE/DBUII0kpOVrA4VXTEzMprNc1deSylLeGwR2XftdiK/yDy4sE
 NUwuziADtnJftHb8VreBmO553XeX58OrSHEP7nvCZVGOj9XOwdnTWUmj5maIXB/dLZHUm6vk5FE
 LkZqdnvtBl36Yu4Mbg0zqPwEubfZum88MnpwgnDtpex2L/3qwAQYKUEHHokAYlJ4TET8KdsPar7
 +AyVUMYlqnGjrJEp8kfnu7RDKTaasPx5+OlA52nB8IMjrvyFt70P/wPkg/tF+tg9KMz6MKtaJxm
 EjuwHoueh+SM8+FlfmoBI9r/cGxDU7dY6zpMt2BO+DIhTXrm0o3pEGBrcET6UowC6e7IMh2AP6w
 OKqJqjJjLXN4wigMzd/qWW7QnJaKQQ==
X-Authority-Analysis: v=2.4 cv=Tv/WQjXh c=1 sm=1 tr=0 ts=6a3c2b55 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=ih2dppi7jw4BXePuyMoA:9 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-24_03,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 adultscore=0 lowpriorityscore=0 spamscore=0
 malwarescore=0 phishscore=0 classifier=typeunknown authscore=0 authtc=
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2606150000 definitions=main-2606240160

Point the SCM node at the minidump config slot in the always-on SRAM.
Boot firmware reads this word before DDR is initialised on a warm reset
to decide where to deliver the minidump.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8450.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8450.dtsi b/arch/arm64/boot/dts/qcom/sm8450.dtsi
index 56cb6e959e4e..f819b4f7fdbc 100644
--- a/arch/arm64/boot/dts/qcom/sm8450.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8450.dtsi
@@ -479,6 +479,7 @@ scm: scm {
 			compatible = "qcom,scm-sm8450", "qcom,scm";
 			qcom,dload-mode = <&tcsr 0x13000>;
 			interconnects = <&aggre2_noc MASTER_CRYPTO 0 &mc_virt SLAVE_EBI1 0>;
+			sram = <&minidump_config>;
 			#reset-cells = <1>;
 		};
 	};
@@ -4978,6 +4979,10 @@ sram@146aa000 {
 			#address-cells = <1>;
 			#size-cells = <1>;
 
+			minidump_config: minidump-sram@1c {
+				reg = <0x1c 0x4>;
+			};
+
 			pil-reloc@94c {
 				compatible = "qcom,pil-reloc-info";
 				reg = <0x94c 0xc8>;
-- 
2.53.0

