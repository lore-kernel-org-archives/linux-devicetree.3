Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A28E43ADB92
	for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 02:44:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788144251; cv=none; b=HkVb5IM8VVzF/0QeER8K4PR8lEQvAZwIr/epxrVF3WuKHq2ZhYHvr83DfKChnxMTt9LT/nCz6Xit7UrZchibuy7fiySh8ZAkcicTUkX6BJHRRurUG/7a8yQzhr3EwIi9kPLmCXp4gdbk7YXMo7dNjicXsgvphwYexZkO18vxLwY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788144251; c=relaxed/simple;
	bh=PUDMY4WLXFBReBbRmBaTP6+PE4Cv4pgZHtjopE2nWgQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=rwMWBs5U3EtyOw5+hON5X2luD+Wu9xHK6lwT+Udm44EW51Wb5RLkNF4XXlo8e8BHE/+zeWjNedhRI9kqBO67BPlwUx9SnDHB6CbJwEC1VrB3TCZOnTErUGpOYfsatctgzRrDvo4De01jpmj2ujBOtnySni+1ysMYBV35IFuuTFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fFnrlXPD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LTO+x2Am; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fFnrlXPD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LTO+x2Am"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67V1bhMV3239196
	for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 02:44:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=ZhT897pRpBM+tJ1kem0SH3
	LVJgXDEhaNUrTZzsCdCzY=; b=fFnrlXPD9K3X/8Mh5DZSOKTSit6U3Mkn2qO8T5
	mLY0gVCWx/Sc7SAmVg7LezJ4mdTYBXdief200KjLzrRhYhR+kMT2nw2YAJB6upNw
	89X99tW/Hz+Xi4bbqw4bVhF2s3x8gMwShrnX/yeOkLjKALHOfJq37/YuAVSv1eKT
	dpvD3Zz5xNZMzG3+U39mrFwQ9qGoha5fGK0eOn3eIuMEXHLLWj5hZt8My4W/CY+M
	5megf/0LffzvB1a67XIjkifBqWKgeHdxWIpDv+MK8tL5nr7vN2n0G1GYKks38F65
	dT7LWu1u4cIYEWMJFGqw3EfuRDpnCykIjwokQmQx7MMiuz2A==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gcv8h0hpq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 02:44:06 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2cc6dd43737so60674355ad.2
        for <devicetree@vger.kernel.org>; Sun, 30 Aug 2026 19:44:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788144245; x=1788749045; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ZhT897pRpBM+tJ1kem0SH3LVJgXDEhaNUrTZzsCdCzY=;
        b=LTO+x2Am+105Wsf+5ru2b5JUUUhvB2/8yNzPp1NZOhI/aSFW+TbQKuMsNmX3NfBSN8
         Idfgnu3CYnyhKZteSJ0XCN7lUv7mpv2Xk8csASuRgtmo828VeX157pWsUq8G8qU3vWEc
         dRwlBjdyTboa0Cgnd5tvPC+LBbfGtGcpxJqcpJ849JhS4Tjuw6s6pmIFQARUDfU0reJf
         pUENXF3kcgO5UTLxolAYu/g4MDjncWR0FrYUEq1JP2Fp+unrrqjZ70K2IcyzLAi7Dgbj
         FnKfs6MfflV2ZrdQoVbIt/qxf9RfMHIoeoaVzsQ98tmJf5wm+Hul/J2sOn9Aa4F1PXYr
         j9Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788144245; x=1788749045;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=ZhT897pRpBM+tJ1kem0SH3LVJgXDEhaNUrTZzsCdCzY=;
        b=PHNanrZccUe+1F/MX62ybDQVH5YYX8usqc7yx3FqfiByfKu3zppUUyDPKHHKqWejZg
         cOLBGOO9fFqsopirH/Gkrl3XUcypUtwC3XEKJWr1hN8VsUV4gFr0R9XmgwwlsPHCw8GE
         spDF6JlXOoRSBTckZyWfu6243HLNkIiQXzap8eau8+E8jsV5RmhRg6igEP1hu4cmvdtJ
         P0DzXKmWLuKey6JRqpLjVSka3Gm//JYNNiIvdDHLJAQNN+rdGfUUdxcwTpwRd+jQkxQm
         ncnGVONpC527Aw175NzVpRb8nKk3KqJVXLm32Rgb+/Tz3n2inuuLbI2xalBb1nrcadwu
         TJBQ==
X-Forwarded-Encrypted: i=1; AKwUvBw6pJ1GNRY+/9tixdeZUFZ9MclBpojD89DlnW2Y86ezl6Y7IX8X/spyT2UPThI+GC5FLIYsqpbULBtN@vger.kernel.org
X-Gm-Message-State: AFuF++kNubMsX5torVCTbwfjK7JpKD4J9G6rvpU/BVXAuoTMRjUfXXL/
	W++KIqBP0XHp2rcvDBOpTJl+BegdmGcscmBoCAt7K7m6mTQMkB9xjuRtGWX+T/iZloh3TGDWzxo
	n9ulUjCtXEHuMqInJzAIXyWGxuQmlww1L/wc38iTgAb/BRnMvmx0gmjwo4KRXeLIp
X-Gm-Gg: AYBFou0TsluX/BCVDnYSDTuCYjmoQ+phDaOrVYLHJF06VJbCfERjn/l9wd8aJox054H
	R6Jjw8zFMb7+p0wfpoGRthEWTX8i3w3p4l2CaAabjED0N3UjCeOxjezSPVez4ow9N7LSaL7kcsF
	vAgvJ4eIt0MI/UBQMhmVWgyyz46yzvDAZj3YAOgJzAeQ7sTi+dHcUQv2wjOwEZfcH606hKCHyYU
	l/m0XiitHKfZgowUWmnVLfjgse780pFQFi14tfu4moPEpzJ0p0sgrLzKbmNIgo9XcbBJjffy6H0
	R6kGINsKTfiUVcnKVAsHAwxvTfotaTRZj19LID6ZOjO+gC4FyOwwQ4iNodkEQ1WorYqLn+uVTgb
	j4BEQgFEX/xZ3lZMHlJ3l6CAScC4eZiHcB4+lvMgFK6vh2XhJIS8=
X-Received: by 2002:a17:902:f685:b0:2d3:716e:e2ae with SMTP id d9443c01a7336-2d93f94ccc6mr3407005ad.6.1788144245454;
        Sun, 30 Aug 2026 19:44:05 -0700 (PDT)
X-Received: by 2002:a17:902:f685:b0:2d3:716e:e2ae with SMTP id d9443c01a7336-2d93f94ccc6mr3406595ad.6.1788144244994;
        Sun, 30 Aug 2026 19:44:04 -0700 (PDT)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3286f7bf283sm27982915eec.8.2026.08.30.19.44.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Aug 2026 19:44:04 -0700 (PDT)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Date: Sun, 30 Aug 2026 19:44:03 -0700
Subject: [PATCH] dt-bindings: arm-smmu: Document GPU SMMU on Qualcomm Maili
 SoC
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260830-maili-gpu-smmu-v1-1-253e1108ce82@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAHLqlGoC/x3MwQqDMAyA4VeRnBeI6dCyVxk71Bo1sHbSoAzEd
 1/n8Tv8/wEmRcXg0RxQZFfTT65obw3EJeRZUMdqYOKOvCNMQd+K87qhpbShcyNTbKd71zPUaC0
 y6fcaPl/VQzDBoYQcl/+GPHs4zx+Fon9wdwAAAA==
To: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-3d134
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788144244; l=1316;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=PUDMY4WLXFBReBbRmBaTP6+PE4Cv4pgZHtjopE2nWgQ=;
 b=krsN/QHNnWo2ZNh6r/qHqaAjxKhPy5UC4KhZI3frkNdGfG0+mq/11lmoD+0xzxia4RJKXtfT5
 tlwXFEoOKHzDB4pbzbCndHHGOxah27KU6AAiho5NtqUTMk3egOPuUU9
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Authority-Analysis: v=2.4 cv=DY0nbPtW c=1 sm=1 tr=0 ts=6a94ea76 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=TpgbzC6p0oeasEHOM3UA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDAyMiBTYWx0ZWRfX5k5R81xt9w4S
 X4ruo8X5HeAllA4/IHgE+FZ4zkewTdsSfeisoMJ6GbvUjHTOukJ8l0fzNqgD1HF2nv1r+ZQTgoV
 JAo6c/5nbgHg7vvOzn3nUmqqEz6/VVWs3DlJupOvb569eY0PIYdh+oUrd9Vk3OeYjW9yZCWI+Im
 YYxXOjjSNPpNgBqMohnBJDSxPR0a17TsPDn6XcQAxNj2Xu7ezr1pfpZjW931spb/elQ9D8tnaXL
 bh5oh85HJKp1uNQh9N3BywcfEKOCJk/JcMO+dxZDG6UVZ4Oj+SZbyoDN8DlLzWTtBQngNt3Rqn9
 JexBYvRnEnU08iB0Or+iA5GnKKF7VwUtABwhRo4hlElPqq6bBbMkKHYwxN5bQCbjT11/pzdgiCw
 qOyNCIW+eGq0MqQeC1bIu9yK/XE6Rejzn01/UjbselWQlmNsgITxQILVDYdVXaYKqQN9JtOjfcJ
 YkOybmGhA8yxwgW66BQ==
X-Proofpoint-ORIG-GUID: MwWc0fAVZxQk7Gus056Ke0ahkDNslNum
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMxMDAyMiBTYWx0ZWRfXxIYoqNB9BKlI
 nJwDzRZ8RW9DKhvZHrCeDVFcS3boE9SoaIquP3a5J/S5oKRTkGsiOU62bqKeYq/so0huiyO4SxW
 9GrQFbpNW1u1n2rUlcVhFEqWGYjXzR0=
X-Proofpoint-GUID: MwWc0fAVZxQk7Gus056Ke0ahkDNslNum
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-31_01,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 clxscore=1015 priorityscore=1501 spamscore=0
 suspectscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608310022

Document GPU SMMU which uses "hlos" vote clock on Qualcomm Maili SoC.

Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/iommu/arm,smmu.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
index ffa33b7f4a96..187710fcc567 100644
--- a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
+++ b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
@@ -101,6 +101,7 @@ properties:
               - qcom,glymur-smmu-500
               - qcom,hawi-smmu-500
               - qcom,kaanapali-smmu-500
+              - qcom,maili-smmu-500
               - qcom,milos-smmu-500
               - qcom,qcm2290-smmu-500
               - qcom,qcs615-smmu-500
@@ -579,6 +580,7 @@ allOf:
                 - qcom,glymur-smmu-500
                 - qcom,hawi-smmu-500
                 - qcom,kaanapali-smmu-500
+                - qcom,maili-smmu-500
                 - qcom,sm8750-smmu-500
             - const: qcom,adreno-smmu
             - const: qcom,smmu-500

---
base-commit: e30626823a406725ce29bc75cb8ec467d3e1e326
change-id: 20260830-maili-gpu-smmu-33d20c1f4672

Best regards,
-- 
Jingyi Wang <jingyi.wang@oss.qualcomm.com>

