Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90A7B456DF4
	for <devicetree@vger.kernel.org>; Tue,  1 Sep 2026 07:27:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788247652; cv=none; b=QPFCDgukflJSqyYcGkuxbsTpooO7NlqrU4cqY0EgGXdiA/JDoz8NK6BIa8FFA+1kusMukMiGX/5wwb6SWWu6nwyACXDUS9eHld5NAZADScR4mdqacHKhYrf5X/r+kn7RMb91qaYnZiOsJXgvrn8KBF+L6pXsmiGxUQTngRBsHIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788247652; c=relaxed/simple;
	bh=q4f5C4BEJ8IzdaJPDMUTq1Ta+4redfGiHESgoxz5r6U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O/gj8KaN7FgQaRvydGJo/A1Ixrny0sxtKb9lHHp17cV1Pre+KIVlo7oOBGwUmGBYYsk/lfMlyUUEBgBjq5B5fSBPhpylDOD34KXN3PmgrPoCuNVti0tO8UnBG7E5W/w7OvVYXjTtaMquiV6tzL4ghYhHhu0BOTUY77u8rEcJPvg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cZfcDfNa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=U+tLXwLk; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cZfcDfNa";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="U+tLXwLk"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 681796jC705762
	for <devicetree@vger.kernel.org>; Tue, 1 Sep 2026 07:27:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=v0lPXfCpEUhDypLYv118FbCI
	Z/v3ylJvIPTPXW6I/v8=; b=cZfcDfNatd78mW8rJaKD/pZTSMUqMSNmbHKO9K0M
	fCZgsJ8IrP8rTMnEWY3T2sSrJJ5aKP37ukQUFG0GZZbR1Ou1Vu/+sqrUmfj2xXqL
	2fO0YoymVfnKjfVl0yRFFE9yBL1Q2UbeL/wMF0cKOkGHPqSWx8OF5P3foeb/XOQw
	gWhvlytXo9FQ5zLI8vrvFJijOqxiE006DUkDuxqgoXaiptYMNLuZR9unz6xUz6iM
	QOulguA/DqNaabeCzs31wnMDxrvsnQmofdAW41laZ0OLPzH5Oa35GII7J6vzv9Xj
	+y6VvFgqUE2qGY6SheP/2yqVZRwRNxIAPJaZ6dXvCTOHDw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdrcsgh6k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 01 Sep 2026 07:27:30 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5283df62d68so76555211cf.0
        for <devicetree@vger.kernel.org>; Tue, 01 Sep 2026 00:27:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788247649; x=1788852449; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=v0lPXfCpEUhDypLYv118FbCIZ/v3ylJvIPTPXW6I/v8=;
        b=U+tLXwLkhYgrDjG9AudmOnQmfohQwt2K88ue/X4JhXcDDAu9Foilo12vDCp4Zqd3ID
         Z0zRt9rrG/XOIaPQjdmhyPXmu1a7WinOlNrE8ZaGfUg6kZQ15nGCHZNZL9z6RSW+cFx3
         0FGjadqoyKBQfpZTFue/TRnVZHv6fsZMJSW2GXYWlxaYa19aUV6ebylSuX/HyQMYjeLU
         JFpdl6Ag3ON8eZhp+tOF/2trgQijbZE1o5WNwD6B3spP9CVWCewYC1rXkzU4XSnn8SUB
         SyQ55fCXbDGCsWfdfe4Tr2FkAVTkGtz3oCfi+afD66NAaaPtUmubamTHb83qWhNt4szV
         3jmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788247649; x=1788852449;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=v0lPXfCpEUhDypLYv118FbCIZ/v3ylJvIPTPXW6I/v8=;
        b=mb+t1Jxx73xw9xfOBKON+baOXyQzmcma9ZfispZld80QqlpHwANAtq1ALXp6XiZQpx
         eQz5VVWS41YyHY5CUgMQrkdxBhAoPeM2H2/1N+hlZPSu3nL6+k6/Cr4Eg3/EPX1x0MiU
         lWo4REm2m88jftamWKcfOTT1e5be+6JiVpYBCjA8e8KSkNAiH0544cn3IfZsPcp7C1gA
         GXbFOWvBcHKP3jMFS4NA6pO6ESCv/hlKmmUkJioo/Rz25gC06H0bexCCqlMoCqH+COwG
         FYcd26C9TppjN6ghdfcvp2REM4b5GMEL6td1U+rYSepjy+H6VDPtruaaPcZox2IRG8hX
         lZbA==
X-Forwarded-Encrypted: i=1; AHgh+RorNpa9pjoFxi6hMrEt3x+5qIWJZLiLZt25aTePsRUJOkpst8S5ZT0aOBcW8hOik2ItUzQyWA9dwVLn@vger.kernel.org
X-Gm-Message-State: AFuF++kPLUi3XULt9lWcSjIHOSSdwEdnpYFLawp55ppbSkmkNtvTxAD/
	Z2ua0/RYtCEerd2AG/bzE53b4HAmgllUvYYprSbzYP9eKaEWhDnvJd6Uaa584eUSFYzUqZnPKwZ
	u7LXykBbQbLM78fLhGOl3aMxcaPhnR6FedvBLCfvxJpZY6d8BR16nHen50t2u0he9
X-Gm-Gg: AR+sD103R1Hqzy3gvJSXJgYrhw6cK4JiFbt/an7XWdN6OmmXaKD7sgia1sq7b+Ds3+F
	L1T+B3B/YVdwTRLSz6NO1Uo/nyfCdjp+5KFByKU3d9edzBo2SZmzTFYL0vWw4MZpraE2h2WrI5/
	h6mfYXHK3PHYY0Zv8Dm+9HBthcHNAes2s4k9U4fou9uGhbMXd4SkjQwkRgzpeeX23g5AGuISc2N
	r4yvU7q+QiZp5ShjyQ+ripuqJiR6lEnJMeZrJkqZwi8fAvTIqLOr6JgDhVh/GTSfXMzlFCMFsg0
	hDib7FW+3orJEaYiWS4PY3LD+sH4YiwTFko8/CD3CjX390VzShk+aOmjneG806jusBPTz+KDUuT
	dOdMfGzO8ZJ0CBg==
X-Received: by 2002:a05:620a:701c:b0:92e:6c8a:2a15 with SMTP id af79cd13be357-93947f3c0c7mr813119385a.1.1788247649278;
        Tue, 01 Sep 2026 00:27:29 -0700 (PDT)
X-Received: by 2002:a05:620a:701c:b0:92e:6c8a:2a15 with SMTP id af79cd13be357-93947f3c0c7mr813114385a.1.1788247648709;
        Tue, 01 Sep 2026 00:27:28 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.178])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48442d7e70csm2844566f8f.36.2026.09.01.00.27.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 00:27:27 -0700 (PDT)
Date: Tue, 1 Sep 2026 10:27:25 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Alex Elder <elder@riscstar.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, mani@kernel.org,
        krishna.chundru@oss.qualcomm.com, dmitry.baryshkov@oss.qualcomm.com,
        sushrut.trivedi@oss.qualcomm.com, umang.chheda@oss.qualcomm.com,
        rosh@debian.org, jsandom@axon.com, daniel@riscstar.com,
        mohd.anwar@oss.qualcomm.com, lorenzo.bianconi@oss.qualcomm.com,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v2 5/6] arm64: dts: qcom:
 qcs6490-thundercomm-minipc-g1iot: clean up PCI function nodes
Message-ID: <6eok5umpghr44qfq2o2fjonnwqaisyguza2e6sk7jrtqez4cpo@6346apufhmb2>
References: <20260901013654.1343537-1-elder@riscstar.com>
 <20260901013654.1343537-6-elder@riscstar.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260901013654.1343537-6-elder@riscstar.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDA2NiBTYWx0ZWRfX3YQjBneFWVmB
 cQMCgyV0v1rj38bZmFlSH6TY98IH39DEjUMHd+yQolBl3XdBFb2EKb1+z3yjSRq5iBaQPvu49lD
 2dCYsdVeTYWzGJSLg2aq5GCQ9vLBCPg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDA2NiBTYWx0ZWRfX3RvC0Ljy9g0c
 bWR8SxW4wqIde6+I0ugaPJ9yo+46Yq7YoQKnniT4r4J8r9/4lkhdzQXaXeRsWX10Ht3DryK2LRV
 /2D0CR1433a4ERtoovJd2D4lpRM0J2cOBBdqTPV7OupnwjwJiDLV27HU/6NV37PaTIbupMODLvq
 E85ShgY6Fg4W0E2QAg77eO7HE8oLDUoIhoBWXpdk8z8qUxPqKoitCH4rp7ikDVJeXIPGvjcHQcx
 VHkWlrlVtNzc3+RxrP6DTOhtPZms/bHO6Oqxoo9QDPNf8XFdmJuH2LaatYbBoZcO/ytImWy2WVZ
 EhNLjPB1y86n8SanhYKTEuWMvl61dIgOeprb7rqBQ1ZldGA6fc8X8D3lNAaoLQhYxFuAHlv7G8b
 TGj5ko3aMhvFgkD+x1NXq+bxysBeq8Md+SFRILvc+6BN6V21IyQcaQvqHzAkXjNuW1BSusHbIWR
 KzisNs3bJyX9x697sxw==
X-Proofpoint-GUID: JllFGRBJRmBKn2XJ0NXNp-_8w6EUEjrv
X-Proofpoint-ORIG-GUID: JllFGRBJRmBKn2XJ0NXNp-_8w6EUEjrv
X-Authority-Analysis: v=2.4 cv=QsNuG1yd c=1 sm=1 tr=0 ts=6a967e62 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=G5ilVN+faPP2Ze1SHB4iFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=ee_2aqc6AAAA:8 a=G74fm3nFy9K8dTtaw3cA:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=VOpmJXOdbJOWo2YY3GeN:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_02,2026-08-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 phishscore=0 suspectscore=0 adultscore=0
 lowpriorityscore=0 malwarescore=0 priorityscore=1501 spamscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609010066

On 26-08-31 20:36:52, Alex Elder wrote:
> The Thundercomm AI Mini PC G1 IoT devicetree source file defines a node
> representing a TC956x chip which contains a PCIe switch and an embedded
> endpoint that implements two PCIe functions.
> 
> The devicetree nodes erroneously include a "pci" device_type property
> for the two PCIe functions.  That property should only be used for a
> PCI device "that implements a PCI bus".  Remove this property for the
> two function nodes.
> 
> In addition, these nodes define #address-cells, #size-cells, and ranges
> properties, which are not normally defined for PCIe endpoints.  Remove
> properties as well; they can be added back once they are actually
> needed/used.
> 
> Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Fixes: 1cde54c54b83b ("arm64: dts: qcom: qcs6490: Add Thundercomm AI Mini PC G1 IoT")
> Signed-off-by: Alex Elder <elder@riscstar.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
