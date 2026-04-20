Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B9EA1A682C
	for <devicetree@vger.kernel.org>; Mon, 20 Apr 2026 04:21:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776658896; cv=none; b=Av1K+lxYZRrdYvmQjOJmIW0FZQKyEDxswu2qKm8yv4LchdAZ39g+sFI8NvveFbZerS8kDsYCklmI6uBQyZmW8eLGEREtYZQ2qAE6W6uUI4ZcMX3oUn7t+cwyG0cUsoMDTJ7HOL9qeadlN4bJ2pFZQuSAO0oOsvExJv60KIueAp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776658896; c=relaxed/simple;
	bh=9zk2e0pX60sa98Q31J8tqnytS6SQBvDq64DeqNlhcuc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HdjJgCDAP5cvE7zU1UCMT86flmG65RHbylGAU9xn0L6LXFUW62Ce8+9wBdaOXzo3jHf6drmHqU6TnlVQqaXdg3i30rZizoF5zU4YXBxJCvtGTj0HAjGzQ+nGXaspaA7zxkR6oIXUZRhEDlr/bwLD0Hvpq4+Tv1ex0pivwjCO9+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CU+o/bLT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GAADn79O; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CU+o/bLT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GAADn79O"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63JIKBDF382691
	for <devicetree@vger.kernel.org>; Mon, 20 Apr 2026 04:21:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=qaM+GPaTDpokAo4rJuDE8WVmWv/fVcxz9V7
	7vFiuogw=; b=CU+o/bLTq8+2zcePFRHjj6YzPwmZ7ZGe03zS1B+vq6xSzKYW19S
	laerRBlOlyDgDGoXovGSCKmp3d+WBabWout3G6aqx9iEJl6cGbgvZvfhj2Sj9xsq
	3a2e2DC0emqo9lkgiWmw+MJm4Z39i7yyNG6czP1mLcqpCRMA9Fh6e3TonW3Ibd+g
	Mfc431oClDfbJmimnEKDCkrE2TwslqCoWP/GktMyXCvWz/t5HP6mtiABgr4jn5Un
	R2H4wJ25p7p5iY86MGdu7uAEBxpBNv+cSS7ng1Wuw4xMh9BqKNs7B/Mxqbzi8OhM
	sP/2/1MM9BtvAG1YiFOr96hWO92SYlMg4RA==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dm1hx40un-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 20 Apr 2026 04:21:33 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-2cc75e79b97so2437622eec.1
        for <devicetree@vger.kernel.org>; Sun, 19 Apr 2026 21:21:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776658892; x=1777263692; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qaM+GPaTDpokAo4rJuDE8WVmWv/fVcxz9V77vFiuogw=;
        b=GAADn79OEFpK9OleedY6petIq1FdXfKPI4180ko8UoHGyIbf8ogjB6RoWBeGGhyuuL
         tgaK196P1w94epDW+41oL7hDqhy7l/zrWcsmPtF6b9cPxeZRhSukZzewPWQwYG9hs+Bq
         VZgCfve/mkaq4a7OqmIHug2QAy8DyF1CjR109pB2OF6xLEBirBXXueDqIZNnd8A4LlHa
         GjdGgs8trvHtegZS/xZVqtdsXEjpveSQ5HJBguVeSKHPYvLk4EuM02Zb0ay2fcAEJ8hL
         IfnVdDAYpFgAatwLB6qF3O51uVaZxqT9RXuvrEFwNMRal9rYQv8woQoUFAfWWA5sWCtv
         at2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776658892; x=1777263692;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qaM+GPaTDpokAo4rJuDE8WVmWv/fVcxz9V77vFiuogw=;
        b=cVE8mUG4vVZHyx3H9AINg6s3fb3b+G5Pdsj2MOg3bLmjYfAixpHfa/UMe5BSUZ9t6u
         7WE6KKutqI/qzecgewGqqQCBXQenlGLKvR8Wm/Bbb1MBOMNZTtXSBm4JEPSjmQIhNmV5
         uNcLIgT4xVBwrUk9sFVi6R9klNQGo+uqfxuR7dRw73goLGAhTmv2TTmB1znqX65BYeeN
         OtU33pDdNMKFtv5GScgMG+UcAXFxgP2Ztzl76rUB9f/7ItE8o4Spp0QkHY8bROc04a/n
         uSRHRQ2k3zTZBnT4EMVFUUTHRyZrFgOV1wS5p5EkAAIbxU2vfBR3f9tm81P4HSyXOc1a
         Kigg==
X-Forwarded-Encrypted: i=1; AFNElJ8TboiTgq420kl0zXqQlmeUEdFZHNu6FWDAhatYdUWW6rMhDW8MEuOI5yE5B8/as/Acf/mretCJR8k4@vger.kernel.org
X-Gm-Message-State: AOJu0YwTRoYV+5MyWPpLrrcnVq6BSF7J+cmol8G5J1+FgpPBHfTiVC77
	sAPoGwGfgVFS+mnwLq+BHRJUpSihKtfDrCFH7L41iuVd438XMYfpjkfH3cWHJrBiPsXAnDGGbcN
	pekZDszjABz26vOaBW3LXhCt/fupI5kz72J0lkQPdapDRj3ny1xGL6RPg7Ah1swTE
X-Gm-Gg: AeBDietG3h3o+lq4Eh4Q3mDKVloOzWDoI7Seqy0kQ3/ytL0JQT1ehinOhgcK0ep4nGy
	I/HupRe/2sxFP8CUpTZsCtRnduGNGQJOSYsshVHbNtPBte6hQMzo3H0whafxzT1LU0uyHCjkvxl
	refTBfl6clkfpsmAaZ39Z498vVbdiUej2Ypxhxv7gJfr6FjZ+MwoPZefjhZCqHhL3tlVjMBU18T
	aj8goZyPw5Bjkw6cnqY5nML4/1l+yMOGOh/SydjyVxRZgNxR/HY06h5IvJ/TiPd2KMRiYOaAEuC
	NELhcO0n8XGs9oYA0J8fXNyw5Jq7fsu8CDnvhlI11KTbc33Y7kclkUpYKT8xTzABtvMsaTaG1ov
	b6+XwniTKyLjj/icrDjoeZ85rb7S63kvc6RbJkpaLOUW1dAu1L46g1hY1Hy4ACZvluVlq/OWRmO
	RX01rnCdnxhlMOXpPf
X-Received: by 2002:a05:7301:1e8c:b0:2dd:c066:bf7 with SMTP id 5a478bee46e88-2e465772629mr6262855eec.11.1776658892337;
        Sun, 19 Apr 2026 21:21:32 -0700 (PDT)
X-Received: by 2002:a05:7301:1e8c:b0:2dd:c066:bf7 with SMTP id 5a478bee46e88-2e465772629mr6262839eec.11.1776658891805;
        Sun, 19 Apr 2026 21:21:31 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2e53d4bdaf7sm12340216eec.25.2026.04.19.21.21.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Apr 2026 21:21:31 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Lee Jones <lee@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH RESEND] dt-bindings: mfd: qcom,tcsr: Add compatible for Nord
Date: Mon, 20 Apr 2026 12:21:24 +0800
Message-ID: <20260420042124.1247995-1-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: JH_LwupUsF1s964HtzTI-07_VFMUl5hj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIwMDAzOCBTYWx0ZWRfX1nUnTJn9OYNw
 vy1COv815BICUiPjwS5SVwc/WbSXYQQ6tjZ1W8Yus67XCnd2uXMqmFD6B+jLn6yOTVoGqmN7W3D
 +PofMCzCwoKjAvCtN9NAGCYJzxoLvGNQiF7BUje1HYm7OHSeA91CpwQ+m8qxbLmKE0uq/9h+COA
 qHpy/qqKpOPjcSfDqOrGjZ2J17JwbXt7s5ofP4UMRiU0Gn9E7KpbOQvuIbvNXsJmSZNrxP2RQ+B
 OR0/tx7oR3zKmS3fSIrsJu9sdwP5myY86i9zA9n1aC8ucCcXMS12GoSS79sJMklTQMbZhYcytdV
 1KyTXfI3pNmKA66kZ4dc0kGg5gdzyrgfMjokvv5ggdIEKPQrX0WNXrv/LMFiAKevQ6t8TDpmy1R
 DFgTAbSxF+jhstiy3E9xIW8b32UzqwyzA+niTy3QgmSlNjubZUR5XdqZ28BjXHyQ1rLaLbxaSG8
 /481JfQ/3maGNE+MrqQ==
X-Proofpoint-GUID: JH_LwupUsF1s964HtzTI-07_VFMUl5hj
X-Authority-Analysis: v=2.4 cv=RoX16imK c=1 sm=1 tr=0 ts=69e5a9cd cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=LjGnC7tzK2yCY8HLVSUA:9 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-19_07,2026-04-17_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 adultscore=0 spamscore=0 phishscore=0
 clxscore=1015 bulkscore=0 lowpriorityscore=0 suspectscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604200038

From: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>

Document Top Control and Status Register controller for Qualcomm Nord
SoC with a fallback on syscon.

Signed-off-by: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
Resend to add my SoB.

 Documentation/devicetree/bindings/mfd/qcom,tcsr.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mfd/qcom,tcsr.yaml b/Documentation/devicetree/bindings/mfd/qcom,tcsr.yaml
index 14ae3f00ef7e..23317d1b381c 100644
--- a/Documentation/devicetree/bindings/mfd/qcom,tcsr.yaml
+++ b/Documentation/devicetree/bindings/mfd/qcom,tcsr.yaml
@@ -19,6 +19,7 @@ properties:
       - enum:
           - qcom,msm8976-tcsr
           - qcom,msm8998-tcsr
+          - qcom,nord-tcsr
           - qcom,qcm2290-tcsr
           - qcom,qcs404-tcsr
           - qcom,qcs615-tcsr
-- 
2.43.0

