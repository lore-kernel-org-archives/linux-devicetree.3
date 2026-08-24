Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57CC442A168
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 11:56:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787572597; cv=none; b=J3k1SNt7dsF0im3BXhh4fpFY/mU/bCTfv3H19r/j/YUvgtLwZ5AxnRhcnS6GefNMmkkkx3tSv/JdiNPbtyM40PPwswWXcY9u19lR9al0qwNqnMLT2bSec7oMt3uk9z98muv8WmUtuGlpjack/n89vtUg+Kajm5HxVuKjXrN7ti8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787572597; c=relaxed/simple;
	bh=ygaxzeR1m8fCjevKn4pRG00MpO1FK6KfllGLi4KPPX0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZzgMgvODzgWlNl5d6Sf2rXTCdTeQGKJdwdnphYGYFPbXLukb5S3c7t8w9uyoU1H4N1787P8hTH35t3T9ofzbnWRs2++fFHSscdF7O2fdgnAvm3yCWkp42y6gIK6ms6mHdtcyKZsFU/Es1K4NO/elhfjs8WpIruqELm3JX0+hW2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DdNL9t5+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cCEDEhTB; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DdNL9t5+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cCEDEhTB"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67OBMYH41673198
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 11:56:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KxIIXbuugwFOHSBBrDbEWPRp8IgxDM1kPW8oV1iV++s=; b=DdNL9t5+XLgk53vS
	XFbtyygMZpFRiZ97YDHxuO6+aKldJFEV27mPy32TwUzlLYchp2F5uyWbpspTc/b6
	jw0Jajzzrr8dobJPjXTF2e/73vbwIKSGV8END4HXIcx5KlG+3Z6p8sB3OIdsa540
	dwqTWiFWhJ9EzkT5tTulE/vjYyOLud1+2p/fcZ6CJYgSs8g4Yot9GTvfwE13eR9S
	7re4JEUaST3zjZejfx8A2Uu8c0YdQr9BXl6lJld4ePtCw1QqnXoy0gZFsZZiBW+i
	UAq5ZhqFw5GA+qwQCed10sa7DtpiP5Ju2eQSO3grLo+vyPIX2R/mDzqQd5xAuqHy
	wLgxWQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g8huf11es-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 11:56:35 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-52827090cc5so43954741cf.0
        for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 04:56:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787572595; x=1788177395; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KxIIXbuugwFOHSBBrDbEWPRp8IgxDM1kPW8oV1iV++s=;
        b=cCEDEhTBPpy/oSjUIRa7QE3gyi/uDg2ft9G/w2OlVnFqWjNZPa51Y+cTH+dNtT/Twm
         1tig1eancy7U5mF/wiCsXxUa/i1r4M1Qr8nKHIN+0ptTe87v7uB4Ug5NhkI3jz9J71q5
         nAMo6fRqH40Cf/AKh/w2zF2REsnuzs7lTQjEez6EYgYHJletF7L6rOmw7WVBvcV1rsTb
         j48QcyY+GB+IcoRcR4JqQPh+6X52Uk7646n8It+d7ac2DYL8oI6huke9BQ8vG4XIuFjz
         dYkUDjBSmgK7fBTGd4xQ1U5d2w7rRHVKQT4U17D+9leXrT+hd5YQr6dXf5sAkq4Y2Xk7
         q7Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787572595; x=1788177395;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KxIIXbuugwFOHSBBrDbEWPRp8IgxDM1kPW8oV1iV++s=;
        b=bBm8BTAVEsm1z01BshXIqE4t6sm662nBjDQ5clKjfZV+1GwyYhpExzGQvwtWEg+fj/
         KTDllEvhvIRHEBSWfpFYxJpPHl8TbyyN0Kzr5JHAdFdovLxn5ZcmShJjO2yoWxl6Vw6F
         l3UAnfYfASSbDkbNjJ0ZlKGb31bHqYWGhpGejaDr4C99A0jwNl79JUQdURuobYfe6p4e
         UEA36bvvoD9NRkptdwSxWwM+600TjMVar738+/KoHw/vqm7x5ev7FhX+wWTcuuPxFl7n
         4zHlXfVeo4z8MElaVgkzLu5B1I8nDA1HqkLI2m1raf3EdsMGloo8KASyXpY9VEHTDCxc
         L6Bw==
X-Forwarded-Encrypted: i=1; AHgh+Rrhre1EJ7yStW2JahGDpUJGUC41Djxk1NqGNzTXNa++xXV/N9eWlRhpBom9MURZYeYbuP/+wQgjIPGz@vger.kernel.org
X-Gm-Message-State: AFuF++kRkLxoygSyHYw9d9zioMgNzcpy9G957F1/PkolMnTbBe+x7xV6
	M4PIeeqkbbu2W9ArOiAthnxhZaApsO9r7eAaqoF/s5yax2Mecux79uaDwQNADNct9ca3yO534ib
	vieNaeA3AR+nV4N/7Tr172FD1YPj6/Q8r6HDADNPCvc/0rDCKVe1C/Alcm3l7ssth
X-Gm-Gg: AR+sD13hyVlfKHSUs4wzBcYYVfpxHMBQSo7f7ttk5Hfxjq17Zrwsxy/kBhFw1r+N8oN
	fIVUZoBW+q+vh0QO8d1VD9ky5xjAFMGVk77jSCPK5318WScCfcgDjJxE/dBJjqMy5f2RAFI2J3A
	x/I6Kv4BaFfSs2ZbuSEKcs7n6M6RqDJdzCfcm69ec/xSiEuIedV+PdYU1CQytKmipKzxazlft1X
	kdN5iefjzXR77sQ0hpuO0ioKqGZg+Z45aoLf31rJivlj8OLZUKieKImqqKZkITSh79u0t4sw2oi
	UqkO6mT2ptjCQofQiwGq6ffL6srgog71WxJwwI7tsb8bxXIGyujYekOTaMvoYujJRuuZNYL6OiZ
	VTOn0rR4F
X-Received: by 2002:a05:622a:1cc9:b0:52d:9ab4:7775 with SMTP id d75a77b69052e-52de36e0794mr349089371cf.21.1787572594509;
        Mon, 24 Aug 2026 04:56:34 -0700 (PDT)
X-Received: by 2002:a05:622a:1cc9:b0:52d:9ab4:7775 with SMTP id d75a77b69052e-52de36e0794mr349088771cf.21.1787572593981;
        Mon, 24 Aug 2026 04:56:33 -0700 (PDT)
Received: from [127.0.1.1] ([188.27.161.240])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c249629563dsm1259990366b.17.2026.08.24.04.56.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 04:56:32 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Mon, 24 Aug 2026 14:54:25 +0300
Subject: [PATCH v3 38/47] arm64: dts: qcom: sm4450: Add GCC CX power domain
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260824-qcom-tie-cx-to-gcc-v3-38-f1205a92682b@oss.qualcomm.com>
References: <20260824-qcom-tie-cx-to-gcc-v3-0-f1205a92682b@oss.qualcomm.com>
In-Reply-To: <20260824-qcom-tie-cx-to-gcc-v3-0-f1205a92682b@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tengfei Fan <tengfei.fan@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=953;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=ygaxzeR1m8fCjevKn4pRG00MpO1FK6KfllGLi4KPPX0=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqjDD69LNjiZUQCJB0/pLmPdDfKjMfu+TG7wnLc
 dN2TMS7ATyJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaoww+gAKCRAbX0TJAJUV
 VlKpD/90UVtdVEQkMAh8529CNhnOFTi4v2ixDjlNgRiEc9sELZF+KDhPJFCQEb0cablWNSgKt4Y
 8vNtEDsIPVa5XgFAFUpaELBZnn+6r2It3q5/K8tuGO8Xx46Ubl3t5P86nLUVBIpeqdY92w3bcjE
 ZfwWx+GfpPvAv1ZXlYexqE9KgYigsN3GLVeSH29BpNZ5XS9ZYoS46I4tWvUMlZDMIDouoQPY9L6
 yWy8JlSTfU3IP9l1KBLddpF4kwRDrQfjdl0EYKaaCbKbF1lcjpssVrMkznuI6p21itBlj84/Fxi
 hyfo6FImK2VeQC3MueNoNZcLT3fAHhWfJEGm67HIfsVBcerOpqSG9op2+eS7Yro6PWeo2QEQiBL
 sABI5X3iG3nlwNc4KhStuX8K4YpB5lhMNQcn1+asMWe4m4881mgtS6jKtmDoPiV1rc4yrewIv/I
 SN5z7xlj0CXl3n0hTZtpF0i6ACZaz4E2HeE3aH3R200aQJMDsW47jglMOHJac08DqhcHW5NEHHM
 H0HvzA6XKSzRO1ViNJ2wmvhh7hqLqVMclcZ5fEuvje9i4OjMM/x1E7liIubMG6iss/V6OcuIrjJ
 hEb1GTYgJX1+M7u32wvYujWUjILegfNHEaxIodU87xSEhY2bAz6Qg2IZ/qhWAtrKUol9kpqvF36
 /DUmMrhfr8BP1cA==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDEwMCBTYWx0ZWRfX/h1K8sgXbciR
 S65z5MTHJUX7Nq4kB8Wx2lrwKTVmF5l7et4t99eEtdTrlhZS2Bf9qFFJfiUxVtYx4mszUfvO3iV
 18P7ofe2PkGfewBfypdzfcZyla21ers=
X-Authority-Analysis: v=2.4 cv=Wac8rUhX c=1 sm=1 tr=0 ts=6a8c3173 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=wUpz7uCjLrEXi01cjX+DLw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=3n_S7Wnn7mudAyu7Y6kA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: 8JYj4MU5gESarQORJsVcwGCUP75ra_FB
X-Proofpoint-GUID: 8JYj4MU5gESarQORJsVcwGCUP75ra_FB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDEwMCBTYWx0ZWRfXxrm+dHw2aZFw
 ITkuk3hEmDY119sND2iM8Hk8IqWvElF7HO9uvEmku1kH/7gUtM6n9eUgZDnmNJgpuHe9iGkNEN/
 wwKOySO3KXq8IfBI3PwRGSR/36I/TuFesqw8vYNoAD1S1tgQ93EFl50CPPp0crelB7yULXR0zWo
 XqCJqUceFDta+6lDG6X7Oo5aJH9AwMs+n4uluP5NwdzqlY1+iid9C8mYt/U3beOoNnY7mys6SUD
 ttsyRQLFmWxHHw6vxbBB+KjYKuWxAmJ+I0aKU7ks38lMsgrUB9xFlXDkiSfkKjRFcqYrjiUt7np
 WmeYpTbK0gJKV6RE3aIRh2N7JC8NMwuq+bnKZnadubnghIhQVFMZL3hPUKT/9lThl843cM7Fa/6
 8F21IAXIbZmUseS548JYtFZks78ni3+5IClQL71inEmB5X6fS/QC9mdwit61UqZNGsRVFsqCT1r
 bC5yghXgz/5kO0U5e/w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_03,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 impostorscore=0 adultscore=0 priorityscore=1501
 bulkscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608240100

The GCC GDSCs on SM4450 are backed by the RPMh CX power domain. Without
describing that parent domain, consumers of GCC-provided GDSCs can enable
their local domain without causing the required CX vote to be held.

Add the CX power-domain reference to the GCC node so votes from GCC GDSC
consumers can propagate to RPMh CX.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm4450.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/sm4450.dtsi b/arch/arm64/boot/dts/qcom/sm4450.dtsi
index b7dc40f3778c..0057f68732b1 100644
--- a/arch/arm64/boot/dts/qcom/sm4450.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm4450.dtsi
@@ -390,6 +390,7 @@ gcc: clock-controller@100000 {
 			#clock-cells = <1>;
 			#reset-cells = <1>;
 			#power-domain-cells = <1>;
+			power-domains = <&rpmhpd RPMHPD_CX>;
 			clocks = <&rpmhcc RPMH_CXO_CLK>,
 				 <&sleep_clk>,
 				 <0>,

-- 
2.54.0

