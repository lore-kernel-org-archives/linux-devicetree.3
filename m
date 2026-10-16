Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5D6B3AB28D
	for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 05:40:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792129220; cv=none; b=IfWryPIxSRtCyjGjrtoB/VXRxVKCKuvNFpwNjLwP/oBbkr8EXlZ+3sj56Nu7YIG/KVaZPUkqs5kevURjrW11uyR0BKG0IwWJCgz8hTX5UZ74LEXrsu1018ag0/3Rg+ZqBImxywhuhFTyURU+6HtyH3wvGrBBa79UCeVubW/aNJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792129220; c=relaxed/simple;
	bh=CJ9uaSzQghC6lH1iGbaK94WLx2v3FiycIFCYKuXJlW8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BEW0VU0sRi4s0Sz7eqq8AV1TXRnSWYBwRZUiAk0f6bvz2gAen2IimceHNhps3qK059UMciIPS92oEQmdd5mQFDwY24P/YEjAiWgSTXSruNLx4mqmS3nFVsiuaSwRH4JQu5DlfMFkAm/AmU2KuXazXoBTakhA7dKxzeRWqpB17HA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=prZPfVa8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=F0E20ien; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="prZPfVa8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="F0E20ien"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69G4SMRZ3462799
	for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 05:40:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	P8GzhAakLwWM97pAG37TwFNHub2FFsaxlZcI6MJIasA=; b=prZPfVa8v5ih7+Rd
	VC0oQ+SprhiPyWjEAlZ2UzFk20uo3X+XzHLr+/w39geb8ms4qOum1PQRcL4oaPou
	12ZX8Q2TmzfEh+CadkswJpcYpaAflIlnX2qmqY1Q6vZzDgXmkrLLz8OT5FKz7BNM
	IfRBT8qiZUOPefsLKKfgaIkKrxfIjVsNXvDn2m7vNRcc0ZyxFQ5S0oIQ2AO0RwZY
	rwM960/FFz5vuUgXxUUB8xdFvUmTvwYUY31V2vQBc1jful5FV4o9SeoRDeDTY6sh
	RCkCAYEp+lGBMa0b0r5xwCFVU64J2xzA1kPt1T2MXSgpLqPrmymihyu9PwmDSdY5
	Brdslw==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hayu6bb5p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 05:40:17 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-33c35f5ca6cso12352151eec.1
        for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 22:40:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792129217; x=1792734017; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=P8GzhAakLwWM97pAG37TwFNHub2FFsaxlZcI6MJIasA=;
        b=F0E20ien0hP+Qymn62pk07rFH96JO3EoCxDVkji7zmQVV682l+GtTkG9CH85BuMUs+
         xkxOthq343vlJyu4c2XTVxNKwD+g5RDiMMfXOXKs9H/jOfL83gZ9wsfvaNz3JWsp/Sg/
         23tQu0Ymle3WUFttI9bayQBqC2EevB9xnqDtu1QuKmFDopa9y4B8OGZyUN1VkYt+Yvcq
         dfRB3x0/c3KVgVgAN/U2L4AarKusxNUQHTp5PNCwsOttDFiKWMA76x6aLGit4J5wcoX/
         xQVr52+R5DsTU23nCG1d8KZy7H5l8/36Q/h1AbPpCnZgL9rH+YWBsGBIr0pNcdkvK1nm
         iQmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792129217; x=1792734017;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=P8GzhAakLwWM97pAG37TwFNHub2FFsaxlZcI6MJIasA=;
        b=HAl01ioXB92o7PtNGC/W4mMiW/Gw4iaG4fgqUkp5AR4PKNY7hLaNT3FA0Q+0eWlMtd
         Mdb55zV+kAETW1t+4B2zh9hMqjpZ/1jEuCaJyVtALrMFhMe433AVu7bs4JVoQ9nHW4H8
         pXaw2l2BHfLj5TrggD9u6NBS1wNU09pWywdw5rbC8y/OHk2G7ytON1rY0+7ikrWhuVUt
         wsZyFyfi9JJbdPWy/kuYKTZr5dr3Oh+ebpSVJhs0WwXie16AX3bG9Nk5SE2qbh12kM+u
         0xGAuzJDTIJcz62Q09wE1oQrXJ+1xmpb/fDsLhckd1eSZP709ocLiX4ahHQdxnW9aucc
         HQ1A==
X-Forwarded-Encrypted: i=1; AKwUvByyT+OXNl2UBEU12GFV1uhcb/+RILjUVHpa1Vt4iAE3wd2PjTSZ2vMzyw+GHYCMu0MmqYUGlF9j+Rsg@vger.kernel.org
X-Gm-Message-State: AFq9FYIosJXXR5LEnlno/niouGUM0sK8B8XiPZ52c93iwEp5+v+gdKSX
	Itzijz8Ct1dltpdps/g5rBPpbfP6MaC9DYDrj7aPjutYIXm3O2wtwlHJt6nLg4dUi0IAYh0wZfz
	/BgR5HuXvEtKIRogOrYz1R0ba+FznGwu/o6JKQjwFLgi5oH842C2g9g29cgEhmt/X
X-Gm-Gg: AYBFou0wXde3fmbonwo/RdfyDCuxgYcu2xufvALMxZWN+BhZugC/mtaDOFMBTnr3MZM
	HszzeKmdj4CrmKiiBqv8UkOAkOim6/oU553LABXH9ikqS80ZwPOOcWnXLvSzetMvhpHpwwxkpWV
	wyDFhgKuL6zM2IegiW63NmEZVkRQtA2Od+wbXT2RDoTYrw8GJ6/FDgC8TMmjXSboosITMITcW2c
	tyHGdLAsD7bPcgRz/h+M5gCtIug9BvTmMYGg8te8rz0qMCrjLrbxZTinuoqOkeLdrTkJ0aR5Kgt
	Ikg1lyEFzKto+bEKJuPN0jxrjRKNy7SfFrUn/R4S9VkHwH8fea/nxy5a8K8EUKXf0BLg3UNtcKR
	xI+53lF3U2kaVMd6iA11nH96d28e31NdPvjjR
X-Received: by 2002:a05:7300:ce86:b0:360:ca2f:ce6f with SMTP id 5a478bee46e88-360ca2ff3b8mr803993eec.1.1792129216822;
        Thu, 15 Oct 2026 22:40:16 -0700 (PDT)
X-Received: by 2002:a05:7300:ce86:b0:360:ca2f:ce6f with SMTP id 5a478bee46e88-360ca2ff3b8mr803886eec.1.1792129214248;
        Thu, 15 Oct 2026 22:40:14 -0700 (PDT)
Received: from hu-apateriy-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-360813b6791sm3811393eec.6.2026.10.15.22.40.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 22:40:13 -0700 (PDT)
From: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>
Date: Fri, 16 Oct 2026 11:09:56 +0530
Subject: [PATCH RFC 3/3] arm64: dts: qcom: nord: Enable SoCCP on
 Ride-Embedded board
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261016-nord-soccp-dt-v1-3-ee13aef55d8b@oss.qualcomm.com>
References: <20261016-nord-soccp-dt-v1-0-ee13aef55d8b@oss.qualcomm.com>
In-Reply-To: <20261016-nord-soccp-dt-v1-0-ee13aef55d8b@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Proofpoint-ORIG-GUID: MiKkYBXWHPEcg5A8ehNqVulNwVl3kmXf
X-Authority-Analysis: v=2.4 cv=ff04WEQF c=1 sm=1 tr=0 ts=6ad1b8c1 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=J-qd9a_u2GMogK4B2f8A:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-GUID: MiKkYBXWHPEcg5A8ehNqVulNwVl3kmXf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDAyMiBTYWx0ZWRfX11XOCHlkhDI6
 e5fpPkuelGra8TcnacLzesDR7tS3X+GBQb5SKOS3VQO7LUwgmHFhypEWvlqLLyvuTog/mxKJeS2
 im+bocCMuOY6uD8+dn09wdVJTo2TBy6bSf7hQiLhHP4jKx5TLZBzCrq/yJuqscIiIpyz3LHafVI
 /Ofym1NdMnOACZSTNEwMCh370jIvMq4SD8uJutrIdQU8soeu1NwV1fpDc6UFEYz4GtzrBDr/LhE
 dzEEPvXvUvsINbD8b6Ew/VQZkp9ykBDqFdTXmK14JSpq6hUdzTdK5z2GfzU+2SbUQYMuBKZKkAI
 g71cdGfeMaASLV4UgCPThJwtLrtAAREzt3Vcb3ueRsRF/uuNYoeDj1AOtjTuR4qqtnwbOsmDBFo
 1GqxaoOYJv15QtDiPuaY33gZYZGkgd+LSLodi5OCyPo5b1A5ErXZnwU0/n6IfxQvTUEFtXEJWMC
 dE/E7+HqpNeuo6sKSSg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDAyMiBTYWx0ZWRfX228WEAstGsW6
 bjQGVeytzHm9taivEAnPxM6oRE8ZRNaVwz9h8gfib5zkZxaFevn7QweQZOcAg1/ljn8W7UMAQRf
 He9dmyoJC55x3GUp+nHYVPAjWIu/HhA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0 spamscore=0
 phishscore=0 bulkscore=0 suspectscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610160022

Enable the SoCCP remoteproc node with its firmware path on the Nord
Ride Embedded board.

Signed-off-by: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/nord-ride-embedded.dts | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/nord-ride-embedded.dts b/arch/arm64/boot/dts/qcom/nord-ride-embedded.dts
index 49635695f832..1206609a5030 100644
--- a/arch/arm64/boot/dts/qcom/nord-ride-embedded.dts
+++ b/arch/arm64/boot/dts/qcom/nord-ride-embedded.dts
@@ -419,6 +419,12 @@ &remoteproc_cdsp3 {
 	status = "okay";
 };
 
+&remoteproc_soccp {
+	firmware-name = "qcom/nord/soccp.mbn";
+
+	status = "okay";
+};
+
 &uart15 {
 	status = "okay";
 };

-- 
2.43.0

