Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0A2C4921B1
	for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 12:49:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789476592; cv=none; b=hPA9fd3VoMEXgOddwt8UNbMC0Z/w4KAz8KT9oGkqoJmu9A3HPrWEDTBmA9ix4xK9b3n6uuXNnr24Ns/UZvW7ZB5TINH2DCqOzDigb4Ug9lZ31MQ+Pu3Gga0PQ9MNDnOYrh+Ys3FH9yo4EeLguV5shVdGRawYv/RPvj7deuujzQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789476592; c=relaxed/simple;
	bh=g1AzAZkdPDHguXpNufhDaBNRT4BPES3gacsBP8AdF+4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Reck9bSw56V4Kr3Fgy6aFLaNVrcq0gyXGZh0NC0smhXk8+lr+fwF24CYPx4aUkOThZtOqTvNH8U2uFUCZ3cZav+BGL8r8bFy+81aWYYVME0tG7OYrCyIB5u4BQhzimXcztNMZbcZFhpAv6btN+f+65idv+L+35wDvZ1e7/bs6Ak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PF0Vhe9B; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XcmGQjv/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PF0Vhe9B";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XcmGQjv/"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68FA4aFx3611231
	for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 12:49:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=/ZiviBOWkE44Z/tDslnfzRoB
	pPcgt0qgNQY/77lDuyY=; b=PF0Vhe9B7CcCSegaFI0zub0e6Zim6M8zHBdQ50s7
	+LBWG9FIqN0STxGdr2QyiRfiZvdojh1vYRP8Df1SVpXuIlPGTffvivhuWqaL5w79
	BnatGRwi3hUaIjvm+8ru1hmXiXq253TTeab0P3e0dkuLCdafYPJjjvAQC51SMfIa
	bElGvMJf7Vz12tsh2v4VPUcaTQYJrwo1s8y2GHHFMj1kf+upc0tMryCCMEj1bIx0
	HO6xjOFvRto6b4HClx1icpwOaoegx4VOhgFeemxlFqXyNZyuJqkzy/0fPdMQc6MR
	6zN9hhZ6cUown0ZQu8Yge620j/hLzmc2/GK18bHd3ABsBg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gq3xtrsm5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 12:49:50 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93a0b66ecd9so371119385a.2
        for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 05:49:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789476590; x=1790081390; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/ZiviBOWkE44Z/tDslnfzRoBpPcgt0qgNQY/77lDuyY=;
        b=XcmGQjv/7aK1cPlvN6CmrCOQiBPla6vJde7C/80mXCX4CN/P8N+OTxYBfUIGUoHNLi
         1kM8peJZTHmYnvlZInlzU0GB8DabQtFo0XJSpvd5ld9wzE4j50ui1IFUWm3d3+hk+hEp
         PWCTDmJjUu9v56mj0hWQr4iAaGSf3/yGc8LP1OAhWhtrCuBhw57Km9gFC00T+pgb7YL4
         tkd56d3bToAFC6HnrWc/DtbjzfUC3Z/rWMEgnZvUWrnUEDRgPIqs7k8nn6rFq0xqXhTJ
         38cwx9Twdao442yP1kw2CSUuCQVRZ2bbbCJ36TvJFgjWEspJ7N2jC31Pw3l0SSYjKK43
         dn/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789476590; x=1790081390;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/ZiviBOWkE44Z/tDslnfzRoBpPcgt0qgNQY/77lDuyY=;
        b=v6gon75Ope3Ayf5Z+T73IVckxrm+HVY3Db5L/nwTTjxHVRZZbJSHa3pWCaB/Xa6sKJ
         ychmmeYIXBi7isH/qXZxYX3GUgVBodfqXrQtVoBfhZaI8MB5VfMF+ipdFoYDPpJIKKNj
         ECJFM6cKABSzz0sjglLpuwcLb203+gvuxwKeNLAvTNG2yoKiB5j5DZbW0Ss9XrlRLGVI
         +k6Zs7vh2hUFy3ojZPbbDfp/lpQHpiCXY85nd8lVxpGgWm9Hrb006qFGhytTLyQ4NzUV
         taGs4H+M9UvYJUyfYzPtCJ7FlqySPyborCTNrSIEZ3p+qils2dFN1HYbB69ZH9+tw+lC
         jvyA==
X-Forwarded-Encrypted: i=1; AKwUvBw8pi1NJhnrMpp1YFxdFKC0SLrTAG9wMKR95QUlA2muQFvZUVEogJBNkG5d8kdOWU3bkiUIcBo/neDr@vger.kernel.org
X-Gm-Message-State: AFuF++lq5JAHPmxCM14r3XWe4OV2bGC4Bfu06XpivHl/vmBYOaghq83Y
	q0A+G9iRUuqfkEm94cPI21bAMK13oz7ikKSJZRu06YfOvN1zJpiqEUYznBqM1MbXDNBgvY09Awb
	b/llIiZu7YFp+8uTJRIoSXFzEOSawR1BoWRrrBAVLKo8lq5JNnQVYHSGWligQgt7w
X-Gm-Gg: AYBFou1wWYLumWFIHrzMEcgG7/82+vjvNA5ISXdcwACeDMppIgW/S4MzRQEtXyGd5dl
	fq2avSwHZqnlnZADJUUbz7HBv3qJMt3vmRQoVGkLKCkBslTxJOtReZfTsvftUl6cvoNiwmILmqB
	eRlVe5tx+UG5V0mI25g3Ci8mYmHmpMIcqETm01gKsM9LKnFp1rw6IY+InpiiGk0010vKWv+YFVj
	25OGapR5tfkPqagSd4fORwQBtd/fkGO828bVc8rSwov06xV3p380D3nLjTTbZ11sE03Oil5g0f4
	3xCEzKntdNT0mq2sb9AsIZNEZ+bRX1HTLEaITxnrphPwFpkNYqx8oPEqmF4Jhgr9i84xbWedRDI
	VsAhLfaLDSjRCIA==
X-Received: by 2002:a05:620a:890e:b0:939:2c5c:7977 with SMTP id af79cd13be357-93a29855523mr1208805885a.20.1789476589621;
        Tue, 15 Sep 2026 05:49:49 -0700 (PDT)
X-Received: by 2002:a05:620a:890e:b0:939:2c5c:7977 with SMTP id af79cd13be357-93a29855523mr1208747885a.20.1789476584805;
        Tue, 15 Sep 2026 05:49:44 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-487072a93f6sm4893480f8f.15.2026.09.15.05.49.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 05:49:43 -0700 (PDT)
Date: Tue, 15 Sep 2026 15:49:41 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] clk: qcom: rpmhcc: Add LNBB clocks support for
 Glymur
Message-ID: <kmfzk4n6xm6bat2clr2ahka557d67vqqgkdvhbcj3lx64bfsyh@isumhqdfhwnj>
References: <20260915-glymur-ufs-clk-changes-v2-0-d0aa1c60c269@oss.qualcomm.com>
 <20260915-glymur-ufs-clk-changes-v2-1-d0aa1c60c269@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260915-glymur-ufs-clk-changes-v2-1-d0aa1c60c269@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: jGRYyGiyv-8X4qrEQMewGZqokrPApEJm
X-Proofpoint-GUID: jGRYyGiyv-8X4qrEQMewGZqokrPApEJm
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDE4NiBTYWx0ZWRfXx5XrsJQqjfa4
 Zk3QeRLFBidrQqSQn+fO1pksvnftwRnJEvjRtXrZ1uJgiRpSTRLHCDW1OjZmTfPdy0KJqY30C8d
 DgmlZcq5ZgogasWY/5IGB2x7h4tkKP0=
X-Authority-Analysis: v=2.4 cv=As97T+9P c=1 sm=1 tr=0 ts=6aa93eee cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=dHuaQup7kaPGrqMl_VAA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDE4NiBTYWx0ZWRfX2c9NHmHxoyzM
 UB6494uhx0z1wUIN7wViHYk28yZK124OvkwamtuXJ6Fsd4j113RhDdajvygLUN8ZVo/IB2VHjhO
 JcPoBI+puplJDqCNrOnxQvWbv8IGk4IiFO5/IuspUzva414mr8Q0Ptqj56wKdoAzhe/ieaeVFEh
 GAElApLaEMfAVh6iQecz+WlVDcYflpxGBXxArjIH6yvbCXL2exR46bv0PVPqCEhcoGNenKJr31n
 pAKiPGAJt25Jvzzu6vvGp8jFvwsye6dcVF6ZT92+gugX5ui9095oab6hrNsbmSqgEkrLVeW3u7L
 xS7n+uf9h2QT/JwbHZxSU+aI6X8vCPolqdLETMv9AfmV1V6FrEY7hE8J17ERHpUCk0no/bHReao
 HRGu5aB45dntYnIZqNmeazfl6hUZQgzi1Wl5EIm8mI3QOUQiVDJ+69yGVGBdn16kiu6GLJNrVYs
 CygdWvj5ojk3ed4gMbQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_03,2026-09-14_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 bulkscore=0 clxscore=1015 impostorscore=0
 priorityscore=1501 phishscore=0 lowpriorityscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609150186

On 26-09-15 17:37:31, Jagadeesh Kona wrote:
> Add support for rpmh LN_BB_CLK2 and LN_BB_CLK3 clocks on Qualcomm Glymur
> platform.
> 
> Fixes: ebcb9db98bda ("clk: qcom: rpmh: Add support for Glymur rpmh clocks")
> Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
