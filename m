Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2516B4F7CAB
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 10:09:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790071762; cv=none; b=ibMCM4nWZbU1zw7Rd2K0la+UICeRDjSHFNiEd+I4UsDjD9a87LfGnGL7fOglmRXt7gtfgtDeyND/bhV2RvLJnnFl2/vV2ZnVP9dWvo0+H24i4AVpfwY+TbZXcRdCNLYzPtWctryx2NbxzCguOpbHEBMAlg+2xXdVcEwQkvWD3Bg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790071762; c=relaxed/simple;
	bh=bin85GVzIG8p1h9hsVqmNzGpM9b9n77cuUtgsjyHMyY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=EIx70U1xEHbMtkxUlw4N2tkboc6xXL6G8SbzIY4IZOueUUN6zgcN74XH4RUOvD0YlYpe9nS+7AJ9MC2CS+t4JHN/q1INJ2hB44LbPpaCo9KfQvub8xZv9sOObMHEPo4TdF4u6q1RLqa+CUQL2ujUdytG0jXaPXR0z2PnFlT+Dgc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TeQawrQv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=e77rx6nT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TeQawrQv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="e77rx6nT"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68M9L3sh1842531
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 10:09:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=QE3vBUfsueLp6+xzBST6KK6eXznno2sjsZ8
	Ql02EPbc=; b=TeQawrQvefgyEDKnAyvfU++Vx9PppAdi44quiyFeEe9PqYRzGad
	jonh7kD+Um8itaSJslHLJAUyfsQ77td6nyap2JXSALcPp+k6WAwc97+GXmunnZd8
	duIa59EMuw8/3rtQJ9a+XpPHhC6UcPsFfGlu7x/x/ariyEGkXsJD54K/cw2l1CGO
	OSw9iDh4CV0PQZNod4u8yFBwcaSd/WeDSFNx9WovTKEmvOcKNnPUlz4Vu/3W85cs
	SRAqg71ySceC0k4742xfzK+LHJ46oRcg9mxDKb1FkhmwpQ1HC5tu0GJQ0viGZUMC
	yZ5X8ZDIZpVwSUodI02OwsGW6c9OoNvnEQg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4guj111d8d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 10:09:13 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2cfa4e4684bso96632805ad.2
        for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 03:09:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790071751; x=1790676551; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=QE3vBUfsueLp6+xzBST6KK6eXznno2sjsZ8Ql02EPbc=;
        b=e77rx6nTGADEMkkMJDVv9UQcnc0HJXcFbVGR2Gr3bMZvjDWH+KtVfaGX9jdtRZZzP3
         GNyszuUBIntC29gXd8wF8E21UTNEJO4NDApdkZmjaC6e7JFaaJmPBfWuoyNF8ATX5cVO
         fDqnXR4b8Jw0y9R6br90vGze2Q+GgPuC2UNXlEJhPe6VHAjY88BbgM0ZnoJSU24mEFIL
         X6sK5JM8MdMrn+g8RIYRzKS0rmN+xeXwz+Ym4fechYiQAWCt+EwDtrXFlBKKcF3ZQNrt
         y+s+MHp3EJLvcSUcf0ppCtrSn5DsfTEI4AVZPLaTvbMGJqnBZrPLS64ObnrR/32Nh116
         jLUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790071751; x=1790676551;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QE3vBUfsueLp6+xzBST6KK6eXznno2sjsZ8Ql02EPbc=;
        b=HhVrrT9vyXZcCp+ElODOBL1num6gvhcgu63FzzN2gv8FMzk49e3yCCRCAiaKTHA05f
         d897GK7MWMWdkBnA6iWVmgXVwxCkgSlkWzsRKSOBCaCz3w7TMG2T6EIxFmD4T1uo1pJR
         XdTm0EBx+ko2M/A4UhPI3lANe1Qx/wB5/xdRbbAQ3DfoNeyg7fw751/QD1+vaeNAoTdZ
         iPkd2xCbdUqmmGl/Af5idEJR3t6CHEJcayX0R4I+h01m+04K6ecTIv7C1Iw9UIK1oqxT
         a3i5jPiT153lCi3EKts5QeFAmbmvoTvENI6+kkfRWHL2K9VDd+MeP69lUCZZB6fRJ1Gi
         R3yg==
X-Forwarded-Encrypted: i=1; AKwUvBxNPuWJMz138pkYzVztj0szdi2HTD7dkb8qpkguvae0+bNoDkgYrXsvU1tumAsI7P2+BiAGifyFdtj7@vger.kernel.org
X-Gm-Message-State: AFuF++ncwfir6u1rmFZNcU3DAoJFBStwgdczS9yzSR4m+wEGwsTToZa1
	8lB7B4S85mg2JvFb0wxg9DpVpyId6FmvQqyiI122f44tCBgwV+iVNVPHkEl7nvjsDaLXVOl7O4l
	LANbNzhZz4o0rHPyrF7LIK7/Ims4ONMgzJdcLkBOr0zMkSfRB3RfljgGCsC/fLkEH
X-Gm-Gg: AYBFou2kH2ijwImehBW/F4mjxgSpVQb4mJs0PDsxRvHYVgus1cYgGGcJS+sIet/mb9y
	qkk8s4elUqdxiqD7WQDCmnO5sa2/29FqHCR9Wx9ruSSGKGddetHet0nKFbaTTKHjsPUj7DEyyYs
	slGpUpDgSrnEuixO172EbO4pOuOAfmi/BEAvq/jpYw2MdJ/8sFoJeXdekl8qQfnYDWxZC4sRSLV
	CMPpfAtbiwn+CHAuzrqfBmhW6tzpKxdTfLQ72gToJZst6PllRcvdO5vPZwITdwgooeHo425zJ/Y
	adA3C2XTFPCN0ltGGd/CUJdvqU6pMTiginY8jO5cjLulNV6qect5sJv9nLZmHLTuUdTlxs0adGN
	9FspHZUcfTpjjGdC4aQ0Yl0KrmSbqq9zjb2O12ECQ+Bw47QnrVPbsqrUWD/Y=
X-Received: by 2002:a17:902:e88d:b0:2dd:c100:3140 with SMTP id d9443c01a7336-2df60b975b5mr6992555ad.60.1790071750559;
        Tue, 22 Sep 2026 03:09:10 -0700 (PDT)
X-Received: by 2002:a17:902:e88d:b0:2dd:c100:3140 with SMTP id d9443c01a7336-2df60b975b5mr6992315ad.60.1790071750092;
        Tue, 22 Sep 2026 03:09:10 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e612c9ca7sm5121502eec.17.2026.09.22.03.09.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 03:09:09 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Jie Gan <jie.gan@oss.qualcomm.com>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH 0/2] arm64: dts: qcom: nord: add CoreSight debug nodes
Date: Tue, 22 Sep 2026 18:08:48 +0800
Message-ID: <20260922100850.527109-1-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: EP0DpWuyqtLRMITvd6eKBbMPGG9Uh6JZ
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDE0NiBTYWx0ZWRfX3hwGoMPmXS3s
 86NyUBdsar0EF4sumG6eE2QkZ//gfAB7AU00rKy16dXKL+vpaZX3flWP7CKPznDnFYNbKV2ew7m
 c2BbfzdcOjvX7DOa0saFsRGuUvKvxao=
X-Proofpoint-ORIG-GUID: EP0DpWuyqtLRMITvd6eKBbMPGG9Uh6JZ
X-Authority-Analysis: v=2.4 cv=atQnmiZV c=1 sm=1 tr=0 ts=6ab253c9 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=R3va9QD4umMSEl8p30sA:9 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDE0NiBTYWx0ZWRfX5Z88ZBZuXJ6h
 +X3/Lg+49RzVeg8wKF4jA7fbYgaisvDLxqR6jbUVMoAUlfuKWKk3EDZY++c7ySMwU1Ag9/TDrgG
 zLHqolMrHRjkeNbbbB2GSSg+rCUjHaUwZBkjuhrC4oPFwA97nTpX+vsfLkqWIbUJ3HBJRbxHXq1
 W9YdNoNz64PgJWFCBHuTlx8z87xzU29pD/hineEVVA/9N9g49Z9ACxH/nWEhB3hgzREo2enOKmw
 cPggwZ8LkdsTqrTiCuDZUjqdBGmhD71pqZZxP6s05R06ovrtNo8JX6y2vd86aQKymoaAjfp78ny
 kOtS01mpystybfL10nxl8gpK2iEAvyx//1ymR1Po805H7VTjzs6g9hppkwupWc03iTxXLyN2qoO
 IGdauviZiSpkK2inVq7wFxoGpiwF7TvxbkH11ma5d2o0Tw7kyU9HB37gABQwvi9vAqnPzxUPKKv
 9Q4iTNPRpWEuxkTSDcA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_07,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0
 clxscore=1015 priorityscore=1501 adultscore=0 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220146

This series adds the CoreSight trace topology for the Qualcomm Nord SoC.

Dependencies:
- traceNoC probe fix: https://lore.kernel.org/all/20260710-fix-tracenoc-probe-issue-v6-0-41eb36fef8d9@oss.qualcomm.com/
- Prerequisite DTS: https://lore.kernel.org/all/20260920084920.2201418-1-shengchao.guo@oss.qualcomm.com/

Jie Gan (2):
  dt-bindings: arm: qcom,coresight-ctcu: add Nord
  arm64: dts: qcom: nord: add CoreSight debug nodes

 .../bindings/arm/qcom,coresight-ctcu.yaml     |    1 +
 arch/arm64/boot/dts/qcom/nord.dtsi            | 3540 +++++++++++++++--
 2 files changed, 3315 insertions(+), 226 deletions(-)

-- 
2.43.0

