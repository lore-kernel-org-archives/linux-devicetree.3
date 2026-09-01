Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7127D25B092
	for <devicetree@vger.kernel.org>; Tue,  1 Sep 2026 03:41:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788234079; cv=none; b=RdnyUsv2cvwSZVaChwILprmWeucH314Jz+GEQfWQK9+reh5YoPw8h6MlNTevXhn/na2cJNMYx4c4K3rHX8oQSwlkf4KBzJzq7+/PnZP5WzaJ8WZkA/cpnGTAsgSuOE4GYGlhvxyq3qGwLJ+LbrIOOxS2UdltGB2/JUrNovfAV+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788234079; c=relaxed/simple;
	bh=tu+tiE5Dy+gQ0qmzHr41PsO5oiHuuTlxsXsSJdb4oNk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=QRQmplz84NYi5nVu9mxXbNNbUDOqoXjTCLtVgQdqvfVO3pPasT4sH4UceziNiDlmWTgFzY087I6DcZwXDoAWWJtMFexiWimRIf6WHLaCPwPB9+r0p8nDSQ4ClObIFHfV2Ig8ZZ/h0UDZMM8EmjeYaKyyQSOzlZCY3vJ7cR8npA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LN4yNUmw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Fm55LmSZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LN4yNUmw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Fm55LmSZ"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6810oBf52138365
	for <devicetree@vger.kernel.org>; Tue, 1 Sep 2026 03:41:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=TGSkA5vy38DcELVchDrIoW
	vMRB6AuIQXXh4MQUVn5AQ=; b=LN4yNUmw6jxpE64aiU/5fBh73TuRR5bijxesBZ
	oZXLi+2TD+1j87Lja9RvkCHm0LgwznPdryCSGly1J6r6tp0zr7Zp6DuFLlDVqVGV
	OHy5W5H8cHDhf9S3WRpysXzfpC9Muu0OHozBlUDwjk4oX+tf/9qTwcxJyCVXd8IE
	9b2BmNRMHr9udB0+ShggSqvK4B1ZnJfWwCTBjgLrBxolakmhqqb3dKThUdig4baq
	QZFQEXn1mD6E3EHRDpAaI8mEbZSSB/92ibaQqBgBSwOuKtI3dIQgyJxJWgZRBKhN
	VkRKMHc2oJZfGPvmcJUOqTY9ohRFVv9tPIRuxpb0KybBIiNQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gd8cvv3jy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 01 Sep 2026 03:41:17 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38f97b3f853so7340756a91.3
        for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 20:41:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788234077; x=1788838877; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=TGSkA5vy38DcELVchDrIoWvMRB6AuIQXXh4MQUVn5AQ=;
        b=Fm55LmSZG/sKLDsQP7bmpZPNoICWGkPBlvwLxd3uWkgFlJgacy+C25aeU6/OaZfsrh
         BHVS5EwV7UD1UX8LWdjVRhb+qF+97v9N6Vr3+9GdlBE7T5Xa/aO7x09wdlkvMopa9cvP
         211ao+iJ4CNcAlTbpclj8OejSfsbnSgl8emFYyDPuu+X/SdPv57VpgVojUhWEU//F/L7
         DShz8e5/7qSjQWjQCpfPANrh6jagRK3xO4LC57zfZw1uuAt+AoSkv/G73pvGk/IJArVC
         0DomIPcyTGWujENlN5IDsF0z7Ye/1jTCk3u6xe3HSw6+zr3rtsidJsux7mzppaPouQNM
         pphA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788234077; x=1788838877;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=TGSkA5vy38DcELVchDrIoWvMRB6AuIQXXh4MQUVn5AQ=;
        b=j1vHN9hra2o2omrx1TnkwNh0+HF4CfKWe84ShB1rt5DfccloIbRPA3N67+2PsX6wMn
         9nURfOTLrClhnfpjKsuKBoAYfAorM/lXIO0BAvYAy/KP6cgxlP0ULNrarIvdBA7GfQBn
         Z3TjgHQePDiL8E9ZpDXdqNDZ2cUaredgM3legmAW4nxpZ8xs3/JK9d1TwSbzRfKJXM+8
         UADKApkg5HlWx484sMy8AuXU1oRlztJMPso9YbhSZDSJx9d/vQjLHYxjfK1Gr0nsXzZA
         Okryr1xuRUDBJsJUZhz48sPOpWQQV/c3WpJrqQDjImHCLR5mpMGNsIwWwmtHl7rw3AzC
         xKHA==
X-Forwarded-Encrypted: i=1; AKwUvBw1s4MxEB4GKXNJvf4dfQ7FQobCJsoC1UsCPloio06if/yN8GXnvEy3IzsEyBU/majLx3G18yzraSlR@vger.kernel.org
X-Gm-Message-State: AFuF++mDK3PNBmwU1nF75Zl4as9CE+BK+YXCjR5eHxK1TAekdQcY3WW0
	w6r8WaFO5M2L9VknaHORyIEbq0ziUuA8gEKsH+YzwWJojBfyjcU5JN2OeArLGOeO+NkhNY3LQ0v
	FAIFuqKb518lYP0pNNWnn9aHITioQhnLCSayKBUlI26pEv90HGbmkuNQWKP8+1BXhJs7Pw0yj
X-Gm-Gg: AYBFou2JUXMlItgXwmqCLrpT6PtPZFYvt71+jSHUFCvRPWkKkx9YNbWV0xuxIkTJQsN
	zSarf+rjdeZnsfYtPw+vtwDAN5akz9x2P1DkaWfDbshYyD5p+lpCrf4NxSUgNAqhtehUwG1Asgv
	cvwxhDkkO/3RT6gcKxYG7EgfdMydhsfVVLPIGeiheJucF9eyNegQytbD5m3uXBUZ6sPkyroEdlS
	3vi0VQeBkAjufHgxrejKDIrV7g2TBx57LwX6J1HC3FRqfKB3haFCgoADAJRPC8URXDP1+oijMkP
	XWMzhPkvW5WkSJAakIxxt8E0FAAdRYywY3J4rBWLFW6+L8V2JGhLZ8XS6XGhE8rHj9/WOphGuNk
	Pd/UsPrEOhAe15P2tHBshHV+SQEVT0LXGMOXDo6UnI6dk8ap21gyh
X-Received: by 2002:a17:90b:3c44:b0:398:dcef:c040 with SMTP id 98e67ed59e1d1-398dcefc24amr18581551a91.19.1788234076877;
        Mon, 31 Aug 2026 20:41:16 -0700 (PDT)
X-Received: by 2002:a17:90b:3c44:b0:398:dcef:c040 with SMTP id 98e67ed59e1d1-398dcefc24amr18581466a91.19.1788234076407;
        Mon, 31 Aug 2026 20:41:16 -0700 (PDT)
Received: from hu-fenglinw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3286f9595bbsm39128286eec.14.2026.08.31.20.41.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 20:41:15 -0700 (PDT)
From: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
Date: Mon, 31 Aug 2026 20:40:27 -0700
Subject: [PATCH RESEND] dt-bindings: spmi: glymur-spmi-pmic-arb: Add
 compatible for Qualcomm Maili SoC
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260831-maili-spmi-binding-v1-1-3c38c4eff7aa@oss.qualcomm.com>
To: linux-arm-msm@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: David Collins <david.collins@oss.qualcomm.com>,
        Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>, kernel@oss.qualcomm.com,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Fenglin Wu <fenglin.wu@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-17187
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788234075; l=1265;
 i=fenglin.wu@oss.qualcomm.com; s=20260324; h=from:subject:message-id;
 bh=tu+tiE5Dy+gQ0qmzHr41PsO5oiHuuTlxsXsSJdb4oNk=;
 b=Ce4a1Is98NL1UmdMoYVz5/vI5d9Pa075UFuwZoP841nGkRe5ErdRi/bQxupf0FRrRRex9EuWy
 MMTGLtdEsNpCNI5YXouamm7B8RUCdi+tslehpSc2X1xFKkK7geC7xza
X-Developer-Key: i=fenglin.wu@oss.qualcomm.com; a=ed25519;
 pk=hJdt3E7o54lql+miD2GaxwF74cDyhgNwMbmFOZ46bRU=
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDAyOSBTYWx0ZWRfX1A2JqekxDxY7
 q4ObfbzUDON4R4/RBdJFt17Pfyqs5ikv9YUNWYQNFLgMl0mZacQJIAzlGmPafDZ+XxGKDKD1dMK
 0H9tMEgH8/N2qiEymrbej8EbOVorloQ=
X-Authority-Analysis: v=2.4 cv=JtnBas4C c=1 sm=1 tr=0 ts=6a96495d cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=w-QGtfMo4T9X6HggfYsA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDAyOSBTYWx0ZWRfXzlmMnWWWcJnT
 kPNz1LQz1sXfZ1pxyxOIaZoXQBIy4AOohxwY7tOi8vr3Xy/SYjzs0ryjv33L5e7IZODcZgfBbyV
 R3ogb1SrPiLVmXMlZVF2rtM8Jme/cexpQxdvtfX5p0ZMd/HXSnrPKH4POSKMjkM5AdbaSAbJIXa
 KP65cmV3eL3msb3syEcTErehz0HF4KfJr29275L3vlg2Gf4/t34fzCFfCiITKXezSR6zvwfKxOv
 W36JiSUmCsWZ9+fFuVmoNTx13GXXc3FmD7lsl/OmOluO9/m0aRV74hf5lPt8RjGipqn2PnrsAL8
 ESjob52Nni6gRgP0stVAH99PdTjetDRgGzx2LvtERGxGaEN6zEUFRl9yynOYz1YJ0KZtjv9Lqb+
 +2nIsbCRnyczZlUcwB11WjERmUh0YqiRD8g5rpYqO501GCCr51jyZofnQ3qC1CVQBK7JGULfpDl
 EMSNIcnOOw3Ca+Y8/wA==
X-Proofpoint-GUID: l9gtKd88PvHRL5ulW7hQokUArHShvN2d
X-Proofpoint-ORIG-GUID: l9gtKd88PvHRL5ulW7hQokUArHShvN2d
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_01,2026-08-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 bulkscore=0 phishscore=0 priorityscore=1501
 adultscore=0 spamscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609010029

The PMIC arbiter in the Qualcomm Maili SoC is version v8.5, which
is the same with Hawi and compatible with Glymur. Hence, add a string
for "qcom,maili-spmi-pmic-arb" as a compatible entry for
"qcom,glymur-spmi-pmic-arb".

Signed-off-by: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/spmi/qcom,glymur-spmi-pmic-arb.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/spmi/qcom,glymur-spmi-pmic-arb.yaml b/Documentation/devicetree/bindings/spmi/qcom,glymur-spmi-pmic-arb.yaml
index 1593a1183a36..44c864fd5fc7 100644
--- a/Documentation/devicetree/bindings/spmi/qcom,glymur-spmi-pmic-arb.yaml
+++ b/Documentation/devicetree/bindings/spmi/qcom,glymur-spmi-pmic-arb.yaml
@@ -27,6 +27,7 @@ properties:
           - enum:
               - qcom,hawi-spmi-pmic-arb
               - qcom,kaanapali-spmi-pmic-arb
+              - qcom,maili-spmi-pmic-arb
           - const: qcom,glymur-spmi-pmic-arb
       - enum:
           - qcom,glymur-spmi-pmic-arb

---
base-commit: 3443eec9c55d128064c83225a9111f1a1a37277a
change-id: 20260609-maili-spmi-binding-dbecf60b498e

Best regards,
--
Fenglin Wu <fenglin.wu@oss.qualcomm.com>
-- 
Fenglin Wu <fenglin.wu@oss.qualcomm.com>

