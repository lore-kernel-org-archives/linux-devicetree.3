Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD2313EDAA0
	for <devicetree@vger.kernel.org>; Fri,  4 Sep 2026 08:16:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788509821; cv=none; b=C+YGIGSD61LEeivW9J+mW7pUtv9tcucNCA6CmIWB0t+QHKTZEHY921jQVfJtSJDkQD8Gd/qpH3FqST/1JbC/8CLMpEpSXO9dOwH7OIcHYiPr8RFUv0B+myGVbHS9OA1IDtEDCZOsHG8tVrvZeSO9HHmtdlKuLs90cpEoGSsa3A8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788509821; c=relaxed/simple;
	bh=OOscVmyFqYUCiz7c4uQpWAZrR9i2yNKDHAWX7fX2a4U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=j5b1Ws97lw+8hIAu+N1Ou3F3dp2ZdzRQuCoRKK1nK2xJng2lewFOXIp1vuaPl7Jc9wJvJGEDqP0xccmCwtKsfCtG5vKKMYMtUD4FcL3sFB/XqV7bol7YSTaGaEZjTVZyUdJeWLktU0hNAHYrviFXareSnoBlUupX0BMxFKusJk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Oqz1NrvM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JgHj9xYT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Oqz1NrvM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JgHj9xYT"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6847mnnv4111308
	for <devicetree@vger.kernel.org>; Fri, 4 Sep 2026 08:16:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=idakCR6eiUf
	MeM4OyC+t2HmgRfNsvqHamrnUXvWTUAw=; b=Oqz1NrvM8CFtnrXbaozAovGGKcl
	fjl6byuek6NZ8/BvMcZzMNR+flA5q8nvitiQnCHtKQn/b3uPDYPWIb1kbG5QoCX5
	kbV9I/x1sy/vvNhKsPb7Ncy2UPsspLnGi4D+e9fqKbeDmP/ia1egjdBiflUjZYBs
	I6eWEyErpfr9az5LvEPol4gmhKVfoFg20YEqrU9wCmMi+U7j+FI19CNygP5HfD3e
	ybskxA1vhcxp/Q+PQkRenPpe6blvKI0+gbZQvBKIk+VHNXXEdDuARjP5m7YO9iW/
	+TQVds1ws5ORlEFzkfFYHu9ROBNcQZt0HQXxqS1FWHee6R8c6BBj1Svjg5Q==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gf9b1c98p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 04 Sep 2026 08:16:58 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-399311947f6so1290369a91.0
        for <devicetree@vger.kernel.org>; Fri, 04 Sep 2026 01:16:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788509818; x=1789114618; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=idakCR6eiUfMeM4OyC+t2HmgRfNsvqHamrnUXvWTUAw=;
        b=JgHj9xYT6ciKUhpFt3OB0T8UyeHI03NAKJI1I3uvK/1rk+dM9q5zgv/Q/TUIdyz/3s
         jX0l2QNbg0esuYDTlctkO6hEfapztJnMGtZv3cHj5n8Vufxt9yharnwm84199vFbqred
         31VAQYsXbuvoWXVd6Fwu9mgTLghQByHZy0chnn2O8dLHlWw8NB2mzua9Ez4L5wVAhVsO
         qth5NWUoD+PEDZmR2EyP8zSjJJaYtfGtRmiNUYu9/fKXT4HaxEoD6JJUNhcoL1v5OgnK
         SAK37GvEVswPTO4QUZ/GlHJlonZ75Z7zuZcJfFp1FEOhVtA/jwo0cPpOnEnFqKdFPAed
         I+sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788509818; x=1789114618;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=idakCR6eiUfMeM4OyC+t2HmgRfNsvqHamrnUXvWTUAw=;
        b=Cyl2CVZyJwrVT5lM71M9CjCKqew8iFnVoK7QJUSEcd9/1d8B+1TipqUmlw/HEIOB5i
         /tM6tsOSkEQGKvYjmvBa+7v/yiLvg3WfWvwfwGVEr8zHacLi8DUZlr8BoaSOikL0AF6R
         Q2V+kyz6136dVJctUWcvqwJgyPkKILJmv0Bf+i5s8h1BZkhc1GETgw18+dJbtrt9S9Vu
         41ROAlaK3erDvDaGu3rLBv9mB4RG5ECPZE7EVeZplQj15gmEGHJQDZHsaG0IlmdKLTGf
         SGhJml0ddTAm/Wrmf3I4BrOeQ/CJMHz5lLTgzanFj89M1n6tVYfHqoN9P26QPyWIQ9Tm
         VDsg==
X-Forwarded-Encrypted: i=1; AKwUvBwXmbKHH3mylp/rXuBYr5S7QR7xgZ3Ro9NdJeeTn1Clrabo0L5IMMrfBI8AWfvRURjIz8iSFnO5xccm@vger.kernel.org
X-Gm-Message-State: AFuF++kfpmxEoQqR4mkjAkBLgsIWMB0+Zk2vEO3516/hPn12EQrDo820
	LaJFxWy/q3glLS0w+iAxHOs101PWxGOqxv1k4JX/7TWUJTKYVJH2XQCxuxuPICCa1wmhpw+WrQB
	AAqGDWz8hFCH8K6KCpV3cCQjiwNaBda8vLTzU87Q5J1AcgDh6ZlhHI4TbQ5rKX6RP
X-Gm-Gg: AYBFou2Vb+mv3yA68rxrpBlCKN2IfKV64rH7LMJkkxGqK4zjV9K1gk7i+LduTrXJ9Av
	EG3Y49aCv/QMCOB5OgQD1wEkSeIQ+UgWqJ2a24lVnsFiyMTtO4KA3MNdmZ79zRa/AjQ2//BIS/t
	tO5YsiKbuZQehys8oyFBbF9dC88eAAfD+CW5Yf+qQvPBm9dexd4cJRen15PAdqo9qXewVcjFpFW
	kBUw6iILqky8rns6liipw9qVt4BgJgEjBa8//Ac7K/L+DDvtsfgJbBYaWR9mUqpDcSWDsxH1wrF
	YAMeWkDYynrTxHq3lHndhKgal4Ilxi9wUnKNxuXkzLrY8Oq+c9ljp6dxR+ZNyLZUXy8tEy06v71
	3mkqTSVp+sBtEVY1h97oPnpJh95ydHRs2qh+40YIz6Jrk428EbBEgYyEQHV0d
X-Received: by 2002:a17:90b:5844:b0:38f:5869:387b with SMTP id 98e67ed59e1d1-39b26101c20mr6620251a91.9.1788509818161;
        Fri, 04 Sep 2026 01:16:58 -0700 (PDT)
X-Received: by 2002:a17:90b:5844:b0:38f:5869:387b with SMTP id 98e67ed59e1d1-39b26101c20mr6620215a91.9.1788509817777;
        Fri, 04 Sep 2026 01:16:57 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339a534df1sm5466648eec.7.2026.09.04.01.16.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 01:16:57 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Dhruvin Rajpura <dhruvin.rajpura@oss.qualcomm.com>,
        Anandu Krishnan E <anandu.e@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH v2 5/6] dt-bindings: arm: qcom: Document Nord Ride Embedded board
Date: Fri,  4 Sep 2026 16:16:18 +0800
Message-ID: <20260904081619.593602-6-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260904081619.593602-1-shengchao.guo@oss.qualcomm.com>
References: <20260904081619.593602-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: IDGf9_N_Kt8hnX4wy46qplrz0VgOI2UL
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA0MDA3NSBTYWx0ZWRfX1pMauCmGS/mi
 xgiCimZVPAS9ZOrZA2EIUMmG9tkukZv634rdXtMoQ+WCTLxGLaHsMmtqGZkCzc8TWcYOq8rRI5A
 sue4aJX9mn2/Sy0ZWWSp50b225qO1vA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA0MDA3NSBTYWx0ZWRfX3xUOcb5RxAeY
 tIVn5vz/IvJN0MaizmvZZZZ5HEChCtYIssed83KKeQIsdIlMU5zoZxE5MUrKamp+VyiCAjLnHXy
 k9PTx5vkGukCNmpWWGfzLLgvZ6laM4HR98P+pFK5sB2ZxnsI92m69dbDN0cFyZIerDVUxVK/zwk
 p+A1JV5pZ3SV5J6oGLfjYXZQC0BlzO2E4ozSCieC5+m5k+P90SIsziZQSpOQHUjwZ0IcQpaWGr9
 bBJ1r5JWEqZVSbxet3lcNHanWaM2YPmR34758V2Wu3JL70N6FSpIII1ImZe/yqey3dVSLQEKIBJ
 k8QkBvH5vUhs2agpix332BjIt+4BlXXCg9bHMV6M0HQOARkx+eLhEF/+gqc0Dof20A1vRJSXQ1m
 Lwk7ULb01Kj3Y4oMDv0wnvUCi9yTcax/uHOqdcVluGS9aBQDDJ8Ayl5k8lsK2zZu5mLMXYPp7R+
 UIdkB5uxfk5AxjoeQ7Q==
X-Authority-Analysis: v=2.4 cv=NNTlPU6g c=1 sm=1 tr=0 ts=6a9a7e7a cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=2D4h3_R6Pk8q5fQxhhEA:9 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: IDGf9_N_Kt8hnX4wy46qplrz0VgOI2UL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-04_02,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0 adultscore=0
 malwarescore=0 clxscore=1015 suspectscore=0 impostorscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609040075

From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

Add qcom,sa8797p-ride-embedded to the list of compatibles for boards
based on the Nord SoC. This is the Embedded variant of the automotive
SA8797P Ride board.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 0759969b8aa8..7efd837b0fe3 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -407,6 +407,7 @@ properties:
           - enum:
               - qcom,iq10-rrd
               - qcom,sa8797p-ride
+              - qcom,sa8797p-ride-embedded
           - const: qcom,nord
 
       - description: Qualcomm Technologies, Inc. Robotics RB1
-- 
2.43.0

