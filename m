Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 393AA424D57
	for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 11:39:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792409948; cv=none; b=Sh96kQXIkgVl5XVHXAAglkCyuwMf2WzI5ol6ooJiNqlIxi1aztr8pjUaHCop8CFeyzqZY97c3QU1dg2Jx3l8NZsDZtaWVVUDKNZhCwVczFN0RNCoDDGTutg/lVej61zF8r6N3rxXY1HsFX1VJYHS7wyFcCLE5kzZ7dHV+IsdfLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792409948; c=relaxed/simple;
	bh=yBvJQLFVLs09NmJ//NAODVkTEFC8rjZkz2dfzZLVDxM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PwKoLKRU0MD+6Kxpgcqr95W/n4NBm+m/2CVeniMzNF+jJSC4gznKoJlin2DfeStLwYsbgYN4FmSeq/DDhsOotpkyC2eQ3n3ZprXo8BPP3YbDOzbG7mXWy136byBlPHglfaHTysVR14oq1iqSCFMxrJzCSEUP/6sSLFwSmhLJm7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lMmlfvsY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bUwcIX6E; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lMmlfvsY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bUwcIX6E"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69J8OrKn1665443
	for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 11:39:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=eZ7+ZE8bYc+JlEfpfUZf3/SB
	Y8q3s+sbzAwtbI+HWjg=; b=lMmlfvsYCUbPgp18SoKrqmq9OEORzmDApCfwAAIX
	UUFTldDzb6mGFfOL35BEerc/D60Iwy5KPTr8SK3jwWFFyxqiK8ib+TkoJF3KsdIW
	yuEhow3m3dKRlXSTslP35F+vOaRQst3zI56XfLdVx7FSNiONqtVaUb/IXIG7bSVu
	BJin7PNPKCtXnoMNVOgEP72zd26g8CvtvQ3CeDQRNw5q0yw1Z4PNK/lB0vNgv1+e
	7YtIst4QONVwkRcZEEziYRLMUNpgMD1j2cgdfFjTmwb5fsNrqiP3pgtAZhITsbp0
	CLTHRB0nKCuZdmkwEsPAI84lZiUd+L5TSFDEReyG2S7SlA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdf3n0uyk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 11:39:05 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f20addba1so381955185a.1
        for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 04:39:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792409944; x=1793014744; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=eZ7+ZE8bYc+JlEfpfUZf3/SBY8q3s+sbzAwtbI+HWjg=;
        b=bUwcIX6EDjVPB9nJQI3DTnHu/T6LJssFXCYISAIy63+exUvbuvDCNVPfoKjKUCnoDl
         uGpt2cbZO94+N0suNEvp9gPpmboOgq8FyQbRyCk4GEGDuRTQLeIzei4Rs7wU2clZr9Ht
         1g1dBv4eFzoaBGYeWnmR19h5caUFQEfrjUc+3Cf38m56fyA9VZKXDH08N2+QTSKnIjoN
         QyLDO+I1NT3Z8FipXnb9j3jK8NDWPWgZUPaUzAzV2oRGzQxR9AMt1pZtHKIKKYzFL//0
         eE5g2IbfhftyNw+lzdyDnCgkl9MPt1QwQIczYNqTksuOPipwiCXEZDPQRRYS0ACB67I6
         RluA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792409944; x=1793014744;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eZ7+ZE8bYc+JlEfpfUZf3/SBY8q3s+sbzAwtbI+HWjg=;
        b=sjMt+fUOM4JJpoHPB4cD+BrYioERJMKc2xfsDp6EUqhmhA15bcRTMx2mIt+PGEDtYn
         gOk0HqpGSggTFhRItqD/nUllRSvwhDMf9t82JF75CMqp5bAqo2hqAho0UCO81fW6MkGZ
         JQGlWTXrsl2BpfE4NTax/YOJnRyfW0V5DyLWT/dBD9DsipWWyuWDgsLdfteB165l28UR
         hdATZlUzOUfMbptYhiQQLUNRp3j5X7YF9UW61oFxeWTbtTsssnzWhPv7UwL5zPAEz86z
         a0XORBvmbalkRzt4xck4/Xk+5+ePg5SVOjYvkQ3AFahpTRykadcJOnkVo4fJ28YnifBG
         aFWA==
X-Forwarded-Encrypted: i=1; AKwUvBxw866cVOcQtp4phBBqoewFZW1QHa89M2Nsodi5iA7Vqr14LE/ZLjmBOsP7efH+oflaeOh3PE9c/Pj5@vger.kernel.org
X-Gm-Message-State: AFq9FYIxSx+YwLS+freLYjvyCFcXJMhsUVi+GyLbYUDzFwJI+Ht9THKi
	50FjbAde8XUghtmu9MRFKc3T854ViqVzkX2HZFrnOXu0wEEiiuVwjHB8j/2lVzpkLhPBBcqvW1l
	xeNH/AeKK/+DTz4tDPjDI0mR1DkWrpsFUFJ490W67Ph71X8NhfgOIdXoupktPyWqd
X-Gm-Gg: AYBFou0GS9cxvtFf1dmFBgYwNxeU7x2Ap0HjYknZ8zzc9uhpKi6I+7MdsBXQidS2inf
	zwyk2w5O7WbMefM2WD/qHXaRD2tC0Vbxd8PTB1M2eZOqLH7HIdHiqYWEzI88NYL/Mmbv8nXEt/q
	rloK6POkAUTunj3r5Nj4tvvvvxhC9/5mdoi2nx1Np/2PuraoJJ4CWFVgaskTlR13oR1f7Ma9mAE
	3oyjLVC/mSp0X4KjxdC3JrKf1Hvq+AjF3OPVK75H91NFkHWTodMGfYcRy4RKG6lFyMUPqL4/RRb
	Clmye4h0sK4ccwkjlMTPRbYoYEoXTo1TMfsJQUpNruOp5gslfe7K9OtuuuGm/V+6sGiyUVG2VRe
	ptZseKPXIMXCU6etT
X-Received: by 2002:a05:620a:31a1:b0:93b:d7ed:ff3d with SMTP id af79cd13be357-93f29d8498emr1212235085a.63.1792409944301;
        Mon, 19 Oct 2026 04:39:04 -0700 (PDT)
X-Received: by 2002:a05:620a:31a1:b0:93b:d7ed:ff3d with SMTP id af79cd13be357-93f29d8498emr1212231385a.63.1792409943672;
        Mon, 19 Oct 2026 04:39:03 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.187])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1d85f92d9sm196186605e9.4.2026.10.19.04.39.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 04:39:02 -0700 (PDT)
Date: Mon, 19 Oct 2026 14:39:00 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 1/4] clk: qcom: gcc-glymur: Mark GCC AV1E AHB and XO
 clocks as critical
Message-ID: <gytzl6qdv5yt2solrssptdmyhbtobfafirx3mqmnogiyrgw5g7@ntmxiwmmcztl>
References: <20261015-glymur-av1ecc-v1-0-448a476d54af@oss.qualcomm.com>
 <20261015-glymur-av1ecc-v1-1-448a476d54af@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261015-glymur-av1ecc-v1-1-448a476d54af@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDA0NiBTYWx0ZWRfX6fu5ap3q0fft
 seOBS+TJ7TW+ox3IxcnUHO4J71kFC5UG3kfyAlonzt/Nx8aEEGfYJOl29gNFq9F6GWuoB236ghq
 ZsqUNrotxa8BoWwzqT20Mqe1yBqJhUs=
X-Proofpoint-ORIG-GUID: TcZIvDkJCopJJEvbHmbAh8urQajFvOvF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDA0NiBTYWx0ZWRfX6Um6PPq08mBp
 RX3c319yAIKJj4GST3lXyvvTtxlHBOUndpi4D6MAR61ZfTzWyZIkJuAU1r/0zIfGDzpb5NasAa1
 XJ+YoSHFpzgBPZK/855wZHPCENcTPMb3k/QR9oHBP+qKEjZUTA2ee4VEGVkJtz18xhN+KgjOOFa
 vXdx86hD1dpuU1M8HsT/h9qmMXQJuTu0SVX82yJ/POEVD9ojybRTxUezwbuQ3elpJabQ/g02d1g
 kan5qUzttQBiuhc1QBXoCltZruajBns+qLVZhZ6X65vVwmv5rhLBOmvuWS1G3tkzMVS9fI1AEAs
 59iAbgfLhC/ZF8fc9kcJflQrd/WABn0t7v1UTFNSfZNlwNzOC8mnCeCLDXGXhjM5qe58I0mmF1Z
 fOQnxJ2SiN5ITTe6kwMv5pahS0RB3e/d40M3trpjEmLRz3qNAyptpOTCjgBj5Zayas+Mai5qoeH
 nhdhMyRVwFwBpOuP8Lw==
X-Proofpoint-GUID: TcZIvDkJCopJJEvbHmbAh8urQajFvOvF
X-Authority-Analysis: v=2.4 cv=Zf2IpcVA c=1 sm=1 tr=0 ts=6ad60159 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=Qvngrl3H0rQgGg+94q4QgA==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=gMNnsTi2PY8_Sv5w8JUA:9 a=CjuIK1q_8ugA:10 a=zZCYzV9kfG8A:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_03,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0
 phishscore=0 priorityscore=1501 bulkscore=0 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610190046

On 26-10-15 19:05:01, Jagadeesh Kona wrote:
> The GCC AV1E AHB and XO clocks are required for AV1ECC register access.
> Hence remove their clock modelling and add them to the GCC critical
> clock list.
> 
> Fixes: efe504300a17 ("clk: qcom: gcc: Add support for Global Clock Controller")
> Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
