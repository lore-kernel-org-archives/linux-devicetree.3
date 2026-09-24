Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0B9F48A2BC
	for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 10:41:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790246507; cv=none; b=u3YJPpZIQWIes/mN4+rZzz4aD0RQQYdLHWCQXrbc14e+Qt0VFs1jVhwBMPChVmvqANIhGPmmEBo0hYhqvJ1m/Y8gwTPZ4QIkUU7kkKNiya78CHf8dt30jI3EmNnV4xniKdCc9weI0fQj7PXYQPMxzdHByvRHjMnxUuedOpgudL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790246507; c=relaxed/simple;
	bh=p3n0vkGj1UgvhrXgJJZcBSedsJb1DlcOzeAG/9UG2H8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=k4WA1bFIgAa/XCZ43iXwXNaAhKA25bVB2drKwuUQcJpRES7sbaNvY9yku5nvU/xvvgb4bwPtT1FMlelg5a7lehtJNWrxE+B1lCQ/v7xp8WSl5fl8syVAQvyXUbwFp1ve2eIvQaCQow/WgKXwt9M19krvCgHelM0K2b/Bd8bKbhw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=msnL7tJg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=M7TcgpNa; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="msnL7tJg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="M7TcgpNa"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68OA3WGC538588
	for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 10:41:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pwHR77Ikl6CgHJ9i+7qXtKNMboGDr8DqEUo42XmSYD8=; b=msnL7tJgJjUVpVC2
	CS60395Sl1F/4FlEB+p3KQKPgGER34v2ivaz7ghWBdcVElX9uzV69hhlTWIIfJQb
	w7Wkv1A7kOmM7merw2C6DkGsznacYNsdp1G6PAGH2gEFnAwGFIXXGmxXKO726W8X
	xU7xz99OTokTsWZzM6YEDOsLhOXjo9vGR1NYO3zBufp0Ggyqc8DUapI0+IKWqV/j
	d5bG2qst0TLBDn3m5N8gL9ZmTCzv8rCpp4Ww8JcOQ04id9RcEPD1LA4dSJ2XUbil
	mjkFzhArbw5XysQbypp0W7Z6mvtkonk9ptlPXbgWHWJyZKbUMIUBV5MSoqvgx4DM
	iPgZbQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gw1sc84h9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 10:41:43 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-939d6c515deso374172285a.3
        for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 03:41:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790246502; x=1790851302; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pwHR77Ikl6CgHJ9i+7qXtKNMboGDr8DqEUo42XmSYD8=;
        b=M7TcgpNalPqIqHn/OWr2y9tLoaEZjf1O2myO7XqfyjzX9D1GJNKauYcnR7fISE8vZh
         fdVeekR0z5UFdYWSgYwV3vDq17rpcZPRxOjE5ewIoJsC2LsOXFJgxj+821QCDu6fnLX1
         Tu4yKPdBcYf7pts/zhHSpjB0kI1AE6MFdYYP+frFt8Zjhk7hkAfkqldTpBynwCsmQ8Lg
         87tK/6ggqXcz7UddlmwI3rH/JtLLvSJFiQ6g5DMGcP0pQEQZjsPLwvyB+j7IpecOf+hf
         8oQI0OqlzmEab4UL33DGiVTqau6aQFQPQarmNCqb+1T2Kwe97XpeUWuFH9vqDUb5h3WR
         ra7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790246502; x=1790851302;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pwHR77Ikl6CgHJ9i+7qXtKNMboGDr8DqEUo42XmSYD8=;
        b=T8+hpCqqdSLFYe1I/X0a6DGhDg1ZDfkw554AEOjjdtlM9fymJC2KauTpY6RHIvb+qQ
         CDyTm30Nu+GIFe9kuhGADVUiFHk3Ht1T8Koz6XHg9HZBA2/eNLJQJrtPsY223iUr+WAD
         mHdnPdFoYuFGcRpqk7a14uB8TZNLAJ3uKQK/v3zWZnwSR3rLbdmwdTRRXG9edlIA6JLv
         qvRr5argxcPU2bgw5kl26quJgYl/Sc9eOlqxQ9QdatRllMOepy/UtYc42Idz0P1IzhwW
         z+4waHe4b8aaSUibydyc4pt8uwGR8NgwRhyK42YmZWwuqg4UzqeHbjoZPsZWDt0dsnGb
         JGDg==
X-Forwarded-Encrypted: i=1; AKwUvBxc+q7fcbgscnhqvVTY9GjynVapl512+iKfYNCLoI+MctHn7NKPUJ2b/LHBMFUc7m6AKXQqmY6ksABA@vger.kernel.org
X-Gm-Message-State: AFuF++mbgizAv4t8AYMO4JZryUitp2LRiZT//SsqADebDMkGMi59dLZb
	wXuawYjiakwkt99eMjiQ3xbum1V4cMru3/uty41z6tc9QY1WUuzkZAMN61R3ci6skWUh1nCFgQ0
	yGH+bkbMAHsda8Xb3lTiORWnVeU2itbGMDOW5a8SwZpYe5QzPu/1yisLknP08hiT3
X-Gm-Gg: AYBFou075VRGjlPCEROaLnLWp9iNu4dnJyVLS6LOwCpgcUg3hEnJ38lsPyd3EMA8Ump
	LrcyVFid2T4Yen5WMD9znTlJYcp2nXnyNsPVYEy+R6l+Ixya+rojh9hJPMDFNtoQfIAF+C0OE9n
	6VObNQgxXzNgp8j84UuUhfPIOIOSj1JZvkwv8ui5O9aRszYJ9Gig6X5YVdqwV7L3z2KvMyfptdU
	v5SGSS0LsuZM52QmagcUMmZm2uBGIfIN4CDoDwxpwJOp4xQT9865sjcCB2fL7JJpGVDSOFj8WHU
	bE2hZQGDAWe5IdYaHrKRqXYZk4m1+2R2LKRYUb1O/BxkmZCOINiZt8UrDKVmQp0Q2NPmFtaSQur
	+D9wySl0x
X-Received: by 2002:a05:620a:3913:b0:939:f188:6d97 with SMTP id af79cd13be357-93c363febacmr208440685a.48.1790246502165;
        Thu, 24 Sep 2026 03:41:42 -0700 (PDT)
X-Received: by 2002:a05:620a:3913:b0:939:f188:6d97 with SMTP id af79cd13be357-93c363febacmr208433285a.48.1790246501415;
        Thu, 24 Sep 2026 03:41:41 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe5dff204sm88239935e9.14.2026.09.24.03.41.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 03:41:40 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Thu, 24 Sep 2026 13:39:49 +0300
Subject: [PATCH v5 33/42] arm64: dts: qcom: sm4450: Add GCC CX power domain
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260924-qcom-tie-cx-to-gcc-v5-33-38732033e5b5@oss.qualcomm.com>
References: <20260924-qcom-tie-cx-to-gcc-v5-0-38732033e5b5@oss.qualcomm.com>
In-Reply-To: <20260924-qcom-tie-cx-to-gcc-v5-0-38732033e5b5@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Ajit Pandey <quic_ajipan@quicinc.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Tengfei Fan <tengfei.fan@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=953;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=p3n0vkGj1UgvhrXgJJZcBSedsJb1DlcOzeAG/9UG2H8=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqtP36rsI6Vk0qlvrs3AnGXi9AGUflFqHLjE8wZ
 G3XJCrELkqJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCarT9+gAKCRAbX0TJAJUV
 VlzsD/wNXN8OuhKqNm7fOxIdx9WVRUvSf1b4ElIXw+s3tWJTQfxPOfx0K9BTdmH+n+mWK+PSkAh
 VtBgEvWA0akzgdT1oM6RL8vfDzBGDwwwOwVULKyPposlNHxGaVeoMZfneCGm3PP1HcEu8hXWTog
 SxR2duLIBJQzAp3VsnrI3CEhYzSl9zz5fNSR8x/bmlhBPuADDyZJgKd7DULKcEvEP7IBspw9OWT
 86JqsG8Y5dNv1TP43NmruNqh0pOeKk5ZU62yGxsG2RAqKqwdkIWYkwiqh74t4NpymsnUgvN8BwR
 U5LqzEylDWNEXAmqeYlszfJzvVrxyVILc5MsEBLqpkaFKk0tBb5tD5souZ4rmTa83uT+EgVw/Bn
 mFeP4WkR+1D/yjJvQkTo8awT8GYZUT26+OlnQkzq5joXhcue7UlNRf6XLPK5b2oY+XZ5nJKBFay
 kvnVyMBf3WKFqXi0KHXeIux2Ri3wjMgHjNihV6b1iQlyQKzNVllS7XcPrsEJzWarH555BW0aUXe
 s3jJBbByJHd2umo+YWV4s/FX2nW1+k8mkZAwCefDhMjucZdM8Vpueq0IpeIWa051UjyFWmDI8vE
 1nBkuoUlLlVGdW06EOnTJYqMvloFhG0gs/FTUggAn53Rr376ynUzIiJ1Ore/KNhhG0fQbgAILYa
 yk3wOjOH9W2Zdxw==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-GUID: Xppo1-pJPTPazESdgOcIgRT5BRToGV4g
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDA0NCBTYWx0ZWRfX+fdsS0MRJkiy
 2EnDeTkcI7QqraA3SilH4YawV5CxVNj3eWpoJg3q2I1rnP8eZeoR4By7Co4+C/E3VxGjPdl/aid
 X8fgafF+TIDJqx/53F1y7ICzsur5shQc7mMoKW1UhcIbZystirzDQENFGGrCIlMMHRahpipA2pK
 6EXNBf7x2F6aR75H2YMyhjLMEoap+1dkNjT/pME0obH99aOFskupV2flTTTEbz6THHRcwGdl4tM
 TzQQCmYc48MWpaQnvhiEEjZxNKcyq56pzFRfX5SM2E1KhR7HSxOmQdRiaOKTn9u7odMoC0pg8e3
 Fyuh1XLymS0zCIiGXpCBB3aruHZLgd4WixtOYRaiffJnm4P65jeC1FRgibunbNEHNwNY2EM5uuu
 ViXzf+Wi+gforkD24pUx4MS/yzH8tX0sOZZN/W/aPvEa6m/zWwstsErMY0HziWGcyCJdqHFbRmI
 66sByr7n6sqIS1gRPng==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDA0NCBTYWx0ZWRfX/rZC6/KWvh/s
 3IYxpq2/F6anx9CegWTZMYVD1JqJiKZO9vB8wHVZPm8li33XaEbQmhiMFELLKfdYKL2Y4PKWuZ9
 Yzy4imbLysnmj53dx2hWc+l4qvW7d2g=
X-Proofpoint-ORIG-GUID: Xppo1-pJPTPazESdgOcIgRT5BRToGV4g
X-Authority-Analysis: v=2.4 cv=GI+dgeNK c=1 sm=1 tr=0 ts=6ab4fe67 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=3n_S7Wnn7mudAyu7Y6kA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 malwarescore=0 impostorscore=0 suspectscore=0 spamscore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609240044

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
index bc9c788b92b1..11ab6ed4f655 100644
--- a/arch/arm64/boot/dts/qcom/sm4450.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm4450.dtsi
@@ -389,6 +389,7 @@ gcc: clock-controller@100000 {
 			#clock-cells = <1>;
 			#reset-cells = <1>;
 			#power-domain-cells = <1>;
+			power-domains = <&rpmhpd RPMHPD_CX>;
 			clocks = <&rpmhcc RPMH_CXO_CLK>,
 				 <&sleep_clk>,
 				 <0>,

-- 
2.54.0

