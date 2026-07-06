Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FA7734E741
	for <devicetree@vger.kernel.org>; Mon,  6 Jul 2026 18:47:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783363640; cv=none; b=GZ4rpv3ttgAaJw+b/Y2kBi3J9nf4vxvWQq3JSVoQsclgKn+/lSyFsw3IcMwFR5xbuG9Kl0llXsePYVwb++WT+pEFhmvqPkLTeqX1wpPtBb06Cft1M1l1wVcBPMgWHfA8zAUJRNEgtgv8ODCeiTXeqCnDlt1SabX4IDEGphBgmrI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783363640; c=relaxed/simple;
	bh=qL9Yfw+uc5wo1DAwxzgU/wU7crRPW50fgGfVTdimoUk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=u6HM7YmZM7DUKKa8hPXvpVuep8w9ZFIXLXv0pAjevDbWW274LifPsWR2LD7M/77aFKsRzy9CYrbSn1hCnvldNT3T//EkaFeriiB4ntIoiG4raKbOfSM5DysqXFdsMAPKqNTch1+s4/kzw9YfPbzSvHpoq0VBz0rP5nlUZUhUH9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VlLc2xdd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=br91QniJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VlLc2xdd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="br91QniJ"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666FFC18762338
	for <devicetree@vger.kernel.org>; Mon, 6 Jul 2026 18:47:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=EVhvcgnKY9L
	yRKg+mffxnRd38kGleBy0v6Ff7TCPbc4=; b=VlLc2xddVMH1DBuG7s4kdeTIyoP
	Za3yAMH+EL2nFHRwzCF69oo/wQ9MuFIdWpHteL/m4KWzH33zEfYBzqpYW6PkLUtY
	NilSAJ0e6OD/JtLPYKrPE6U1HniJ59IGn9CpRV7va2FgAunPXhHlqn1OtdoE/W2a
	UqME0Znd5dky0XsBOIMQh5G8Omv4Z+2nCDWYCxE9A4O6gQvm6NH5Uy2kghnhqVVW
	e3lT5l7O5GhRh7D+EpyvhyXm73Cr7Z3Ga42/NI3gVVfKOToGBRwwzbdXaoDNw47A
	TGIemXWE8E0NNYp6XN2llYd/CnZrHrP9vGI0JXQXbAh+VzavWw2MnQjOmhQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f87rxu2mq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 18:47:14 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92e62e3459fso288609185a.0
        for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 11:47:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783363633; x=1783968433; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EVhvcgnKY9LyRKg+mffxnRd38kGleBy0v6Ff7TCPbc4=;
        b=br91QniJxRD6R7C3gB3JJHtw0MHvO+UTPL2L3A8GseArWM485ETQCqtufC6mf8Y7we
         5XR2cAkkChV1hYgjCRewy/UxDKHfCw2tA7wfi+tYK9Ijhzk+HmnIDI2bQmM2f6ApA6hZ
         Y85i9j9vI40vCdHmteSt8d/c/4D5zPa9qduo9U/k4UIbopQBImhjgVV5op/Xb2B5GtHD
         esGQy/olIkxfvTzlMIjqqkV7K1okBxXW86FfeMSZh2nM3N8wwBNzAxDk3eO9VEZufMsI
         NxxrfQyTIcFuiQO4j8U79VYBTOx5QK3POv0n8Lq+g0/Hk3kvUI12M/C9itCzvWeaQDwi
         ciiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783363633; x=1783968433;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=EVhvcgnKY9LyRKg+mffxnRd38kGleBy0v6Ff7TCPbc4=;
        b=qlKKlEsdEQCJtFzCWyA7P4U4M+i7gL9aM6DzsNdivgZ3OENKhSoFoRAUx42yzIIoBP
         hq9xGHB/BfKJrnqj2uTdmKdVkTL0x1ABv6z0H6NIxjI5Y0ks9uElz09FB8snGpHTaOfx
         L0Sbj+o+RwIr9N/joeA0CPj5Pe63O2z59joifacU4unW/Su8fi9TO7f9fwtZXFbSyjXg
         COKjUlgQiK4kiSuSM5Tg8B8NF4UVAOaH7YEh43lViv9ng6CBK0RKaFVyNXt+kXKPvhbZ
         ECE1PVhFPkcaIgDQ7aEtf93hyhb5EIlL1MA6NjAFID81v2rlSNIE0dRu2gUfYwthuKae
         6xvw==
X-Forwarded-Encrypted: i=1; AHgh+Rq+YE8btpvE9R2hLuJNeD8hB4pVhJMG99c/NIUo+3pGuNxHpPsOeGwNjNz+zy1oqIpzUZSyN8fDb3YE@vger.kernel.org
X-Gm-Message-State: AOJu0YzMIZ8NpK1MQ9EyiUwXaXmy9Nagfb+K18kZyMRjoFOyzcoM33ZU
	PecioR0PmSm4yksU6tNAfF5e/kRme24yC+xT6pjAKrG/vBVyTCmuuYnSdpj86uhvBITPl8TBgl2
	sr1itamlUmQVvrQ93W6lo+2WWKKSY7XEydS2AoYJ/oI/MUvkvYj8NcAJrgxQ6FSGR
X-Gm-Gg: AfdE7cmu0wjkkgtWKoXwfAQy30SCCcHwtEYto3WoaCfO9a3cl0v7rmR3vTpR0OFPjuE
	dIvjPRprIAI+2urrcZVgXrW2clTyX8mXM0eI6MLamo9ut+NHuVS1LCg9mod7yBtRC0z7u7MTFuO
	482309lnP0kim/8uNtxYM9+exK7wdb5rM7HOxQS2b66BgoBbbsZvom7KiFugnk/ocmd4M4xT65F
	BFLXHnW92stECDcEkdzDODYbDSfHKkCNRgSvIX9zZzxpIURHkLihK2r5/P4tm9QWznzvHt41BRx
	uhN0XetZVofYXKiPpSOOwpZ5seC/A9KlrETAFHYq2DRiULWF0f6LJw2r1/dz7lGXXrzRi7tkoUZ
	kN4kMiYvcYjNu+gC+XZoJ/t94SlwpxvvVuSsqEa64iXDWQA==
X-Received: by 2002:a05:620a:40c7:b0:92e:4a4a:4478 with SMTP id af79cd13be357-92ebb575ad4mr257500385a.31.1783363632918;
        Mon, 06 Jul 2026 11:47:12 -0700 (PDT)
X-Received: by 2002:a05:620a:40c7:b0:92e:4a4a:4478 with SMTP id af79cd13be357-92ebb575ad4mr257495985a.31.1783363632460;
        Mon, 06 Jul 2026 11:47:12 -0700 (PDT)
Received: from juillet.box.freepro.com ([2a05:6e02:1041:c10:b077:843a:5587:be05])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493e0078d56sm3858625e9.8.2026.07.06.11.47.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 11:47:09 -0700 (PDT)
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
To: sre@kernel.org, hansg@kernel.org, ilpo.jarvinen@linux.intel.com,
        linux@roeck-us.net, andersson@kernel.org, konradybcio@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: bryan.odonoghue@linaro.org, platform-driver-x86@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        neil.armstrong@linaro.org, gaurav.kohli@oss.qualcomm.com,
        manaf.pallikunhi@oss.qualcomm.com, priyansh.jain@oss.qualcomm.com
Subject: [PATCH v5 1/3] dt-bindings: embedded-controller: Add Lenovo ThinkPad T14s thermal sensor provider support
Date: Mon,  6 Jul 2026 20:46:46 +0200
Message-ID: <20260706184648.35613-2-daniel.lezcano@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260706184648.35613-1-daniel.lezcano@oss.qualcomm.com>
References: <20260706184648.35613-1-daniel.lezcano@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 9s2KU6viyDHaQ6lHZClnnmrGLOIXgmEc
X-Authority-Analysis: v=2.4 cv=Hv1G3UTS c=1 sm=1 tr=0 ts=6a4bf832 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=RAioF0-LDSMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8 a=s6oxFZdllmZqp78XS98A:9
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDE4OSBTYWx0ZWRfX1sCC3WZ/Rphl
 z8G0vUZ+geQMSwN/JXaYQBQUT4HsO+8sHFR7lA5tZ7IwTSf8DBiYJ1MvjNAOg0LGxvluEuzWEb4
 rfn/E8wf6d+i6x0mBpLSyHISVi1N9vg=
X-Proofpoint-GUID: 9s2KU6viyDHaQ6lHZClnnmrGLOIXgmEc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDE4OSBTYWx0ZWRfX4irxvyC7u7eG
 9R4LIk8eNgoh2L51Fwett/p3IHwnd7zL9BbCyCKXiJB84IRSb+Jzo1GqKAvholRU8eW13p/AceK
 T8HVMmOUTjtytMu37iZs+PWOmYeHo5f1fxQ7N0jIoHwXnpD1aRe7CljbaUGTFNPEo952oVsvrw4
 +jBf0GFuUmYa3y/h3nWaxTkRJplhTFjCa1srGjh5kiyiEwHoXmJ2gKbV+bE4LTBPfrS51q9g5wA
 7JSMAOBpyccoVOlBg80qKetOTLgWZwHRjxkwzfwoa0v3nszq5iD686tqxYMJiYF0vuYs4SKxq/d
 MTlByLV6FITCW+s6mffbhPkLsYY34IoMqyvro8J5xNa4S0eSKhKRvZTPIwe4UDKOiZ9ORU3jAgW
 Ba55TS+ZrWgZM3VVJq78vtP2EPfmKcL+cPdWagxCRmrpxlrCCkuMp1gRAO6re7ar2DD7VSemAr/
 b4pk4EKvPBSfegCXWLQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_02,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 malwarescore=0 adultscore=0 priorityscore=1501
 spamscore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060189

Document the Lenovo ThinkPad T14s Embedded Controller as a thermal
sensor provider by adding the '#thermal-sensor-cells' property.

This allows the EC temperature sensors to be referenced from thermal
zones in the device tree.

Signed-off-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
---
 .../embedded-controller/lenovo,thinkpad-t14s-ec.yaml         | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/embedded-controller/lenovo,thinkpad-t14s-ec.yaml b/Documentation/devicetree/bindings/embedded-controller/lenovo,thinkpad-t14s-ec.yaml
index c87ccb5b3086..0d049979e35b 100644
--- a/Documentation/devicetree/bindings/embedded-controller/lenovo,thinkpad-t14s-ec.yaml
+++ b/Documentation/devicetree/bindings/embedded-controller/lenovo,thinkpad-t14s-ec.yaml
@@ -26,10 +26,14 @@ properties:
 
   wakeup-source: true
 
+  "#thermal-sensor-cells":
+    const: 1
+
 required:
   - compatible
   - reg
   - interrupts
+  - "#thermal-sensor-cells"
 
 additionalProperties: false
 
@@ -45,6 +49,7 @@ examples:
             reg = <0x28>;
             interrupts-extended = <&tlmm 66 IRQ_TYPE_LEVEL_LOW>;
             wakeup-source;
+            #thermal-sensor-cells = <1>;
         };
     };
 ...
-- 
2.53.0

