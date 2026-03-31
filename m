Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC4163ECBE6
	for <devicetree@vger.kernel.org>; Tue, 31 Mar 2026 09:13:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774948391; cv=none; b=joBBEL+okWNrFC2R8Nou06f3Wr/w9WvXbRz0k1RKsgySQBVNrEaEIByct0ivkv6q7Y/fCbDsLnE6TYeYcot2FxXo1RwbMaxsxE+VasS/lfe5zQwUUvaLV1/SvdeFnOkhPeNxyseJz76gAFfsdnlb73lRR/8Y+0dK4NG04qYHqGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774948391; c=relaxed/simple;
	bh=Bdo8nbx3rVkNTL5HDnpcpago/e2UR44Mc4Mq4d7wBRs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=C68kd3/zYUCQKIUDBNU2+U4tC7TNwIdxb3gYAaQg2qapuPsKYXc4RukDQwyrtc2iGe1FcDVXQOy9i1XQ2KOcMkqKPmZ8bMsnEMj1mlxBg2lxbXnR044RCI0V9T2Sl5Tt0+2szutrMb7bkzPQBsYJvfPd0dZLDMD5J1v2KW5tH3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DAtSHiVd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=X4oEvnxp; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DAtSHiVd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="X4oEvnxp"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62V913iw2761368
	for <devicetree@vger.kernel.org>; Tue, 31 Mar 2026 09:13:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4MXPuiGB6wexoK9zZ14N4Shw9zVt1WFOElMC+KTHD8k=; b=DAtSHiVdRmd/EIvS
	btT2wXWxL3qxeTzHq9TDsePKtAHXsKPJZVC4wtCHo9SB5z+Uj6M5Svt+svXCG8YM
	KlbPrhNAP3j69zFYb3AYTeT90IsPAr600rhJbgzdfgTt2K4DrG0v1y2OHNIqD4Pp
	N7lVdnZUByL6Z4uKkOT2qV4vattaW8of2mygwyPYQZKMsHtAvUwydeZpqRkjp1kR
	gqvmG9Jjk7Z/E3Ai83OZ2muNL5UR9uARiCruyVHJea387W40yC9GlxqUUgpeGHdB
	00ANadrHfTEJaLVOEdPoMiuWhuGkpMyOCtzdTRJja3KYg86s1/nb7DdX6rjslbWs
	7htmUg==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d8b9301jk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 31 Mar 2026 09:13:08 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-82c69a72aeaso3413964b3a.2
        for <devicetree@vger.kernel.org>; Tue, 31 Mar 2026 02:13:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774948387; x=1775553187; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4MXPuiGB6wexoK9zZ14N4Shw9zVt1WFOElMC+KTHD8k=;
        b=X4oEvnxpAlE4YygFSM01z1aOcLe5qZ1vxWLkWejcHQyi9YnK2NuRqouRIAjfMcTuf8
         6bwu/9x/tBbVkCrrkvCVpF5OjEgWkdlzF76T4eUE8/DCu9t6GkfDrCL3ss+wbOWbrdh3
         qDjZ/808cH+/0rTgNe1+MHiCghDtvHolLVY138J2f3O5V8ML7wu8mflftEIGDS7LWLsk
         pRk4wXCUNcS6TYWs4IXscl2u3ZFvhkhUdG2AqpzKXO0NvNJwIMm81BdrtcmGoFuY+fMV
         5AEau4Fkoh+FkhSCHhRGCjLDeWsi/DGAer+A9CrVuceQ2PZuJo3pII+x2fB4ZfHMZ9d3
         3ETg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774948387; x=1775553187;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4MXPuiGB6wexoK9zZ14N4Shw9zVt1WFOElMC+KTHD8k=;
        b=SK4m79hCIFrutSgZVUDkFQYX3/oYD89W5sgeHfPhk2E5Px2qsgYh/7l4TixN3RrfCa
         dBqvB76W078b32gkODKOECpP8lKvQWwBop3VMrN9LCwB1RnQ5tnIaItMttx8TabpEzY5
         GmB3LJvx1LzwDO1EP+DfM4IxrEEHkJ2vgTQrBymgtD7nSXQlzB6uX69IRXrCaf68kUmG
         +vqrH2tFSXV/l3o9wDjLYb0p7C3V0aYniSUFWWXHy6k+7ZF1YFqQPIVKbD7fffn+YL6U
         EBpeojBBsgswGTnBfjgvVsJod7T4nozObxH+28s1wqevItpo/du+Jg+Ldmg5Dj5Kc9vk
         IVwQ==
X-Forwarded-Encrypted: i=1; AJvYcCW72DoQTM0j74udEbY6/ju4jJee2LNN+9ndyPqjN98I1sgkkGLsDovcYcxEBxuSYKxkupfbVIHroBIG@vger.kernel.org
X-Gm-Message-State: AOJu0YyTHwNsdMsVWr+xqZ6d89fimf2Brl/1F/kyd0MeA8u2ITd1SLTG
	2xTAoN7UK7X+QMQ5f7ldDhqXzNL1XDppnXIUSSB7k8S1Dwp9GtdafmNqXE89ycsW1ZhskdjuBap
	y9KamPtxBwSWd6Gb0xRfUMFyUuNkGe62RupkYJ5gT8hxQwqtog47U43kX5sIVJ/uY
X-Gm-Gg: ATEYQzy8RWWT8CiSXPT0U7uTvR6XChkOh993ghDaYlGD5DU+WIHxJQzdAlHlPteyeIE
	H7Lh8Qs2x2PuuxSFIrjh0igl34gGQgxYTte5pb7T44ZO6fm1CRBnXrLEai41sUyIxP2NmNlBgK6
	Gn4jD5/2pf45ybguvnjLd/eDQrT7xJ/OUaJ4HZyITOGVl/dk2vwzWd8Fz1oMvOMPk8y3L5P4yyb
	IMF8os/R8YgJ8bcmFMXdSkBodyU3cK0BfnMxBa2b8M/p476/uUVU/IkjdwWRKWDk2AkN1VUf14d
	zlbzBvJMJixmB7HIR1CsLNSVZ67JykWQyWe0Cr+jBfzAVVLasq3QqlbrJYej5ljFhYDfioINQVX
	9GTbu9Pjmdqj+60EE9E5/+NCnRj1z2hdfMEsgX7BBImSSe6f9MA==
X-Received: by 2002:a05:6a00:299b:b0:82c:2205:507d with SMTP id d2e1a72fcca58-82c96025997mr13153912b3a.36.1774948387580;
        Tue, 31 Mar 2026 02:13:07 -0700 (PDT)
X-Received: by 2002:a05:6a00:299b:b0:82c:2205:507d with SMTP id d2e1a72fcca58-82c96025997mr13153874b3a.36.1774948387127;
        Tue, 31 Mar 2026 02:13:07 -0700 (PDT)
Received: from [10.217.216.245] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82ca843db09sm11106538b3a.7.2026.03.31.02.13.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Mar 2026 02:13:06 -0700 (PDT)
Message-ID: <aeddef2d-2d61-4fd7-b25b-9eec8e2fceaf@oss.qualcomm.com>
Date: Tue, 31 Mar 2026 14:43:01 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/7] clk: qcom: Add support for global clock controller on
 Hawi
To: Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Taniya Das <quic_tdas@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mike Tipton <mike.tipton@oss.qualcomm.com>
References: <20260330-clk-hawi-v1-0-c2a663e1d35b@oss.qualcomm.com>
 <20260330-clk-hawi-v1-7-c2a663e1d35b@oss.qualcomm.com>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <20260330-clk-hawi-v1-7-c2a663e1d35b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMxMDA4NyBTYWx0ZWRfX05yXXzrcwxE+
 iLvMz0oN0OqLaI4rXLjRxaD7mGHzCmAwoJe+yKUR49G6DATEfxMMQd504E0QhJe9TL5G07ndH22
 rOKbMoYD1yqTh5LgQdnvqVRo5FLF7sEewyqMVjqQfibliUMNKTZaInm8j/khBb1xcBVnuXD9LPp
 +MMfa1HyATgzgXnz1QYMHwbQaSyK3Z+WUX3kS7VaIUroArz0CE0rSFcp/Nf5yPsNcg2IVJOAABg
 lEXpSCJ08pdYf1L26UHhmXB+cfKj2CXTbYmYJpD9PhHhJYWGSAsJbZmdr0+joI7upoVmF1mAvW0
 h699hTpCr+91M8VUmq6JpgoMxo8UhiOVPgiJZ1vLqkq1ggXz1KuIh4rUlh6ynSlwLtjdUPxUA8k
 QBuCKiO/dNP7MkEZQHP76ctWm2KLVBKtLKoMzlXbLK2AbWhgIGdLii2WG9Ttn26o44ioDehIb0K
 +skFc5yxxcweYCuOPWQ==
X-Proofpoint-ORIG-GUID: PfLveQvVtCkXmvX9kePoYemkDQk0VdGM
X-Proofpoint-GUID: PfLveQvVtCkXmvX9kePoYemkDQk0VdGM
X-Authority-Analysis: v=2.4 cv=NLjYOk6g c=1 sm=1 tr=0 ts=69cb9024 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=yIexR1LhTexBxIJ9UtoA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-31_02,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 impostorscore=0 spamscore=0 phishscore=0
 priorityscore=1501 malwarescore=0 clxscore=1015 lowpriorityscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603310087



On 3/31/2026 6:05 AM, Vivek Aknurwar wrote:
> Add support for the global clock controller (GCC) on the Hawi SoC.
> 
> Signed-off-by: Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/Kconfig    |    9 +
>  drivers/clk/qcom/Makefile   |    1 +
>  drivers/clk/qcom/gcc-hawi.c | 3656 +++++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 3666 insertions(+)

Reviewed-by: Taniya Das <taniya.das@oss.qualcomm.com>

-- 
Thanks,
Taniya Das

