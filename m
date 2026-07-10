Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD4D71FC110
	for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 02:40:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783651203; cv=none; b=HUqO5/5uw7tCsmK4jRUmZaMWmti1ovfktVoNPmg2LRpimNxFCqvYq9z7Q2cUDlj5ieTH5ZKp9YbyTcyqefM1hYtJYvB6f1PL9tHA4KtGHRKePbGtAL/2TQkdNLScKhzJLyoTpdemb8NxB1242lX943iJII/ElFH6z23FMRUH0OA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783651203; c=relaxed/simple;
	bh=ltdgoUZ6tBDDcLfmDRkC7KQJz9iLegaPyl1qkMs19LI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WKT/sNGCjdbiOMi5xako+fn3etvD3LK5DLVc35hu5C76yEkSQEfIgM5b0Xx/NpyAHPRzVXP4BqVaNXoHvYa+UjpWIgbnP6uAM9oiyP42G7hyE4TlN/8uSddPjdYa7jXf/zcynL+oNCK5Pd4jJqo8eRrvE5r9ax4pzuovo4c+/nk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ENeThg6F; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Vckd+xk9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ENeThg6F";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Vckd+xk9"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 669JUlrU2556966
	for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 02:40:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aJcLj0G6FGt0cvIQzEeMaFLLKWTNo1edV+7XI84Hxcg=; b=ENeThg6F0zqhVDJw
	wkzjiBPw9g/1cTEV0O25Gvu5jfU1Q2TJbE5nWugoE7sK2L/z6FIszDIny1Bwtprm
	mQLlr1JBkdLXkpO2CnnprHSNg7tPJ2wGP9QRh2AqKnvO8hoLkiHwOLWJW3krJ5Y7
	wQukfNnVa415UqHLQdO8Y8R/G2b5iDsiS83zSHvdgL2YVc1nMQBe1zoFCRpL6sVc
	E1Y/2+Zy5VoK6EecrrIxwIDeQzf0llGOo1CnZpkCR2XMPni2AWDooChZvuqTX4fG
	5YAkixwVVOHJ1TcisDSb142BW6d2+KAr32EXEqIPzCbxbXwGug6KqMG/mbV+7qA+
	WLXcuw==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fahv8h78q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 02:40:00 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8484b9fb055so1201722b3a.0
        for <devicetree@vger.kernel.org>; Thu, 09 Jul 2026 19:40:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783651200; x=1784256000; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aJcLj0G6FGt0cvIQzEeMaFLLKWTNo1edV+7XI84Hxcg=;
        b=Vckd+xk9BBscsBk8eenBW/Ioxn3UrlELI1NjFqzms71fAhBGQ6zdUp+mdp429gd+Yf
         Bo4vTAsmc+aQ3sqYgQiWbr/OXlNBz9nbgnUpVbs28puEVXkPgsN/0EFIXEvCSvvGgGlZ
         f3UFmypHnvIkv/CHj4vr20/WB4mAneV0uKKpOLgAyilgbibNGx8cXhA+Th1MlNY6cWmh
         sWmhNzGHtJqlEIlm5+s9eiOkBHREaurT08v7X6OYmE6ZqTdhKlkJKTOC0GKgsZKaDTr+
         cfuW/xl6UU3KRrRYVpn/6U4DAlIVDrIPswqOCKazGHaa/vEgIznHwTunJOb9iqRYdPhg
         ot4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783651200; x=1784256000;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aJcLj0G6FGt0cvIQzEeMaFLLKWTNo1edV+7XI84Hxcg=;
        b=T9k/vK4iI2DNSR/8V/izA5vChx+y6j49mWom7Y1L5Pu59CFXbdZj0d33MpnGM450iY
         SQIOjlYNKIt/rB+Szp2LJ4jakdQx2WFuTXJlXOK4/jn25UX5eHB+DWt45MxX2To6e6E8
         OMN/TA91CHNTcqRL853+lYaik49QnaSwbn/yQGeiXKnfshbJ7Rm50wYWXfFQaP0Lrdqj
         YOzQ5vofW5nx9dOiWJQeFP0w2LDD7R/yQ1T8GKw7aTG4E2LVGU1NHofSEQ+9TldUwGCE
         +59SXIcY6ZpIbIONsq7E0La/cFeP+UKQWPpsC+LOgseAl86JW4/AZcWPelP/G1xkRvso
         Ar0A==
X-Forwarded-Encrypted: i=1; AHgh+Ro6XUIla6p9ew3felmxlVdjELxGJjToe0shk2SWRtYu5Bn1X2TU2LIODfM1FWCZmQNccBxchX3Fc888@vger.kernel.org
X-Gm-Message-State: AOJu0YwNs6aQeR2nDuCb292CR3VsmXtPe7PS5nun4CbuqYlu3lSmSOx4
	k7XIqawUyVzGbA/sGJgwtMrD31igysBcgH7nQkRKp5hifeGyZmPj+bGwl5bp8GTMx8hF7mDFrda
	pUHta94KWmeSF0SGzS2QBOThrg/ALAipVM6g73UXPY/LYThAJG6/kjyVQMZ8rgtO0
X-Gm-Gg: AfdE7cmukQe+IAALM2w7T2vOjbRqTxWctD98D4FKs83SIje6IO5dMTI7uh1X42Oh0j/
	b93Ppri3kaO+GiynGYN6dA4gch2jK/Jnj0WmhJh6lYQcowQC6CoUblgwGzaoSXrlHGjk1BBAIcR
	XxJ0/iOJuRAmDb7R2WkWirKda/v+UJRryz7044SkY44jLo/h+tRSzbiSk771uOkG/jWbOhj5CgA
	Lvh4LP0zjOiJolTH/uyDbzVEyQEyGYkZ/eEq+YFC7+k+xUm1BrKT3zGIDebeXLmoQb/qguT/R79
	3dGUHsY8LFBH1X76wa2SJJX/BZP/+8PEmhY8alNTWR/qfQgTUQlsuB7RUUGERcWdQIHHl543TwV
	OKpE9Y+djqtEAPSokRWLmM3KVl+XJQZcrX8imrU1J84jTc4CirpcttfOLalnTFP3iJBZS679ICQ
	==
X-Received: by 2002:aa7:88c9:0:b0:848:60a2:4e9b with SMTP id d2e1a72fcca58-84860a25381mr4199183b3a.42.1783651200310;
        Thu, 09 Jul 2026 19:40:00 -0700 (PDT)
X-Received: by 2002:aa7:88c9:0:b0:848:60a2:4e9b with SMTP id d2e1a72fcca58-84860a25381mr4199155b3a.42.1783651199850;
        Thu, 09 Jul 2026 19:39:59 -0700 (PDT)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ca5af6df87fsm4517611a12.5.2026.07.09.19.39.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 19:39:59 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Fri, 10 Jul 2026 10:39:00 +0800
Subject: [PATCH v6 1/5] dt-bindings: arm: coresight-tnoc: Bind on platform
 bus instead of AMBA
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260710-fix-tracenoc-probe-issue-v6-1-41eb36fef8d9@oss.qualcomm.com>
References: <20260710-fix-tracenoc-probe-issue-v6-0-41eb36fef8d9@oss.qualcomm.com>
In-Reply-To: <20260710-fix-tracenoc-probe-issue-v6-0-41eb36fef8d9@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Jie Gan <jie.gan@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>,
        Leo Yan <leo.yan@arm.com>,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783651186; l=1904;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=ltdgoUZ6tBDDcLfmDRkC7KQJz9iLegaPyl1qkMs19LI=;
 b=x6U8ATUjYt1nTIesdNn0TIKfMVJvoPUBd42Ap+ISOb1F/nvyCx0LKIGzdKwP1HDzxEC34he3i
 1Fd0UF3+A89D2tnB7KwCVWId/Xb42XoWIJGeTXBLOngreWA7K3mLQJw
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-GUID: M08vmFC4C_VKn_vCEvdhAUHMxpAnOnms
X-Proofpoint-ORIG-GUID: M08vmFC4C_VKn_vCEvdhAUHMxpAnOnms
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEwMDAyMyBTYWx0ZWRfXzSbiPMWOXW3I
 Ma3Be4I/luRUnUQcW1vdhOT5dFBz/kBM8cyLKwoCygUttl9mqQn7b9FGQm6P4+3BBYVNKFthMYH
 tzF7z4azOiP5b+7XSVdDlzXGN2zSoBM=
X-Authority-Analysis: v=2.4 cv=funsol4f c=1 sm=1 tr=0 ts=6a505b80 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=vX9vLbfq_6l8qkBHxBYA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEwMDAyMyBTYWx0ZWRfX5rRcrleINuPH
 tGjo/ToU+XPiGjQ+NDp7tFbP7ALxe1x+wTvOlxUC/JqFHNAA+/7iRbsLHiq6k9VuHj5oHBEgwUM
 wkwrAyYFnc8H2CkfkaGr3nm2NrUqmX08SwT62FmWwTpateTdMx+snWKA95bxXqTKsLOPkUAsNDg
 LWT7J8C8inD5SEjE7VxwnHelgK5I5cP2SOCZh2M8UOEQSQriSlwazb9YBeDb80mexJt3yEpg6MV
 YCn2XvLlL8+pgT8XAfnQ8OFQM2aX3xNdVkQETtVynxYgqDPBz65GuC19MMmk5fRkIuqQFGjlHHW
 /iYdAwdsrM9Ylm09678ircSRVk8pxCs/EQQYYJNSvh9u4WE2kwIDhqcDBci7PzTWgpOLL//RgjV
 cPD95EiC7N2GszkdQLopBVk8eNIoDsTu26ew4a+FdW39UaSf+BEspxaJVV1ZMXiMUjrTIwuGHp6
 P8lGQm6Ju2CX2BECCkw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_04,2026-07-09_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0 adultscore=0
 bulkscore=0 suspectscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607100023

The Aggregator TraceNoC hardware exposes CID registers, but the Component
ID value returned by the hardware is 0x00000000 instead of a valid AMBA
Component ID. As a result, the device cannot be identified on the AMBA
bus.

Describe the Aggregator TraceNoC with a dedicated single
"qcom,coresight-tnoc" compatible instead of the two-string AMBA form
"qcom,coresight-tnoc", "arm,primecell". This creates the device on the
platform bus so it is bound by the platform driver through its compatible
string rather than as an AMBA device.

Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 .../devicetree/bindings/arm/qcom,coresight-tnoc.yaml     | 16 ++--------------
 1 file changed, 2 insertions(+), 14 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/qcom,coresight-tnoc.yaml b/Documentation/devicetree/bindings/arm/qcom,coresight-tnoc.yaml
index ef648a15b806..72fb1210e22e 100644
--- a/Documentation/devicetree/bindings/arm/qcom,coresight-tnoc.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom,coresight-tnoc.yaml
@@ -22,24 +22,12 @@ description: >
 
   Note this binding is specifically intended for Aggregator TNOC instances.
 
-# Need a custom select here or 'arm,primecell' will match on lots of nodes
-select:
-  properties:
-    compatible:
-      contains:
-        enum:
-          - qcom,coresight-tnoc
-  required:
-    - compatible
-
 properties:
   $nodename:
     pattern: "^tn(@[0-9a-f]+)$"
 
   compatible:
-    items:
-      - const: qcom,coresight-tnoc
-      - const: arm,primecell
+    const: qcom,coresight-tnoc
 
   reg:
     maxItems: 1
@@ -83,7 +71,7 @@ additionalProperties: false
 examples:
   - |
     tn@109ab000  {
-      compatible = "qcom,coresight-tnoc", "arm,primecell";
+      compatible = "qcom,coresight-tnoc";
       reg = <0x109ab000 0x4200>;
 
       clocks = <&aoss_qmp>;

-- 
2.34.1

