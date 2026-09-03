Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6F1F390991
	for <devicetree@vger.kernel.org>; Thu,  3 Sep 2026 13:23:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788441806; cv=none; b=MOTn0oWG7VylRbUk5g0wTuh58r6sLVbzxGaS1TrylAN+qxQ9cAIHlGo/XvAVPD7XXQhefcJtDXgzg/zgKCNaXhA01gifLzzJ5k8sGOp48qINyZGnZbI4ekVLxwD1/+RFVMIOEiR8kMwkT2JiH9alybKjMkAY+zj4FYGZ0vllNIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788441806; c=relaxed/simple;
	bh=degx7nhJT2AUSifCshGpxZomdyz6i/wdqKZcuSCRLms=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IiabRcpROrva75aWDthdYzVday2gDDy6+u8eA4pFKI7zYSdMAfMw2bZc1iUCpijFk7wmwabHb7Tb6/vXWA0am9wRbWOTBGapDmM7DoRGwSI78ElH6tSIhmQ3BtV1Wj/3avZnAIeYTy5EKUR8k7+WWpdW3tHvi098G9iNddaJxWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Sft/zSB0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gY3ZkVOh; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Sft/zSB0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gY3ZkVOh"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 683DANEh588303
	for <devicetree@vger.kernel.org>; Thu, 3 Sep 2026 13:23:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=a67eEv58fAbLQ4CqoD0i9gTm
	udIxhzIVuWNoAajgcE8=; b=Sft/zSB0IO58CgKnabbIjCEtwiCEqKy5mchOW8Z7
	gzKyoB+quBUn+3BgFkamNKwiVgP3BIElFSQsuMKIxn3t1KqsSXJDkojrg5SOGEXJ
	uEOJi80faONRWcQduSSv9KCYZv1AnkpMXxyTO8S+zkn8rl7qu78/3l3shUmiIfeZ
	x40RCY9Ox79sIjVUGOIgouBCa5Ejd1dG25Ky+XJ5UcwubV5bKByhnYF3fmHvFO2q
	VZYN1qUS3yrzEIQOdBo5uJHkxbSqKS1I50mAoQQc2tvrQv8Wrb1DssOGj5339XhA
	ZrU9BTQYrBbOqTYS4Dhvb7A3AzOhj2bK0OA2ZELq7UVnwg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gf1pyj35n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 03 Sep 2026 13:23:08 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-938153538caso460180485a.1
        for <devicetree@vger.kernel.org>; Thu, 03 Sep 2026 06:23:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788441788; x=1789046588; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=a67eEv58fAbLQ4CqoD0i9gTmudIxhzIVuWNoAajgcE8=;
        b=gY3ZkVOhIQzsr2iufPzqVgRP7QFn0WrHN3OyFOvQz4dP3Cr5EIUk2lZPIsZfKMxMWt
         a3o3zcNpi70qZI5NE8u6Ev08zhzD1zuZ9BGmvckY7o6xz7v+QybA+Md0hJTMgswffpQ1
         L+XOtzbhYySp/yyCPvVfMjm0DWEsvvhhf79JCvkedVyAPJ5vML2+ilGzLdmSkLV2Jcls
         Pm04VdClA7LF+yVKD8VuMwEn0MlxAhXYJVN/3BbiXm6+i3VDHx0ez9V3Syjo09twyvm1
         Tn1qEZaiTb17ylJgM74OIWXtfcw1VaCfAuH66+9R+fAgZe3WknU+46b26F4p3pLsEzO/
         vFCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788441788; x=1789046588;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=a67eEv58fAbLQ4CqoD0i9gTmudIxhzIVuWNoAajgcE8=;
        b=GvRoqiZyzV1b12jpx0gfcyncEaIwGUV8oI9DBHnOFVmPWNwCIgc0gXvkxhlF7S00Nq
         PwyaFB2jNyn3DJL/6xPqzIKXIliuABfpTyy++a9sZ0NTt7/D0q5bxIMxj/XGmTNe22Su
         GHpUSWT1kxwAm3xfzMXUaHYC/oPiqLxO7XkwUMX/Ur9MaQ+7EEQKmYUO1zW7qpQyBo2Z
         LMbxuYrs4tNtrQ7Fc1XgbiRrCmLQq/V/dr3XnM6eqvF++Eem6gdsv4V/81wATNulLZZq
         iU3v0KIagE3pmsrzGWepAZnwWPmXrFqZlC376L/rhMgfp4bUUYhKLnR/325huz9vAJM7
         0m1g==
X-Forwarded-Encrypted: i=1; AKwUvBy2lu/ZAhHL8J0HgmJlZ4vK1DWyFp5D0dCVPTOu7gfHmLC51vG+M2Guj0DvYnUh7ygi3TSiuEguKy7o@vger.kernel.org
X-Gm-Message-State: AFuF++mEumD7hT1x4AkkqZFblO/xxqYt5shJt3YToaQIiaIAmuNIMUCq
	9po9hZWqmQUNPmxru8t10fazV3HK+vLvlH6jyKCWZfPqCaiFIOo5eOrPKD3kbai97LhmPIfx6+y
	olYPJPM7qsnGNfBOHGAGzlg6H5G+xsEFyNg1Ez+JM/gI8U5810Qmox7EzPbFuQMcO
X-Gm-Gg: AYBFou2ZMVEQ20SfVrknvMj/3v6xabCyajxfHmwR+lqd/Py7sLahqV4xoU4UbEqIawu
	F3rAW5o6dl80KHyiROQ8tcu3iSaIFcoY43hugV0QaKgnpB9aiHH3aSwm2BUzCyWt2eQi4YtUPkw
	46k32Mhq7rlyrd8Ksu1uoacDgKnnWZYvBX8jqLdGOMVd5VMsdY4rrwUuU0f6fkeGPG2hz5FWUt0
	3fsWRJu8S4lnAqN3kyKabflktRL0IDL/r9v1d5fx7YOJ0R/q57dstNjeI0KefJWPTsOESEgfkgR
	ZNVf0q4WV3oCowhJUvQerTucq/Av93ZppeCkP5cY+S8SMnO9jXjAJVEwObXlLwD/pkwYeXm1Uuh
	tnHnryMatfzrPrw==
X-Received: by 2002:a05:620a:1709:b0:939:74ab:c1b7 with SMTP id af79cd13be357-93974abc7eemr331352185a.23.1788441787683;
        Thu, 03 Sep 2026 06:23:07 -0700 (PDT)
X-Received: by 2002:a05:620a:1709:b0:939:74ab:c1b7 with SMTP id af79cd13be357-93974abc7eemr331340585a.23.1788441787066;
        Thu, 03 Sep 2026 06:23:07 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cee60d9c6sm72882415e9.11.2026.09.03.06.23.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 06:23:06 -0700 (PDT)
Date: Thu, 3 Sep 2026 16:23:04 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Luo Jie <jie.luo@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, quic_kkumarcs@quicinc.com,
        quic_linchen@quicinc.com, quic_leiwei@quicinc.com,
        quic_suruchia@quicinc.com
Subject: Re: [PATCH v3 05/12] clk: qcom: ipq-cmn-pll: Add NSS clock support
Message-ID: <t2uxcw3dl2dnb4n7zi23bjkixa6iisciiqgizrrp6xldqziism@fpuflpaahf4r>
References: <20260814-qcom_ipq5210_cmnpll-v3-0-21c3db378611@oss.qualcomm.com>
 <20260814-qcom_ipq5210_cmnpll-v3-5-21c3db378611@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260814-qcom_ipq5210_cmnpll-v3-5-21c3db378611@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDExNiBTYWx0ZWRfX/FK2ILJcGMFO
 sx5pw3Caknrjk7K9p9YD1aimC1CHi4QHdSJfrYjMKeT3oQG7zbFHgPxvXef3acMVxFuKly8y4cX
 SwdWIACGztQtSnZZK+acUmdtA2V9Grt0A2offUEIKMemWW4e5fX9Sf9QO5yulKe/8bz0f9iFZIM
 ILkpYLUkIn+iby4H4kvOn+Egh4jaFT1BR7Gl2+Dl885fK+qxLxjnbvZ1WSLNZsYHHxp00lOks4U
 RfAWjOZFLvCsClsDLoBrHbbwb41T7b761l4XOxffIv4CqtRC6BAB637uTBTlEIZvw5/Y01X4etx
 4qAQHs8UCXvvmT5aZHwiKUqdXGMnwMqWRRs512XNqOTeqKX8ZBd2nhS+fR6AFPJjNSzKoxaoEBz
 m88CssZJJX92ZP6l+pLla4dj0CuL3IJYWDnmbJRx4bCvHVmdmvT0dzbhpbnDbrC2s8arJRTZ6E7
 wMt3kC/17XYPziccfbQ==
X-Proofpoint-ORIG-GUID: 6GCnh-1jQJuW_NwPhFut1cegJd4MUNXQ
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDExNiBTYWx0ZWRfX5GdG/A0XnBC8
 8hFtoZALf56Td1zU/w4FxoGzwJ+MhQAFrz/1yrUjGSYujALo8uCidQuJN/F3/GwSX9vAQXiXUdU
 JefOEJiSNVVTO3TKS8hTNFWHi202Ahk=
X-Proofpoint-GUID: 6GCnh-1jQJuW_NwPhFut1cegJd4MUNXQ
X-Authority-Analysis: v=2.4 cv=DMO/JSNb c=1 sm=1 tr=0 ts=6a9974bc cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=q7XEBjOi5DRkXzmV0jSBjQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=bSJSfGj242zlhJVEaKEA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_04,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 bulkscore=0 priorityscore=1501 clxscore=1015
 lowpriorityscore=0 suspectscore=0 adultscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609030116

On 26-08-14 05:48:15, Luo Jie wrote:
> The NSS (network subsystem) clock's parent is cmn_pll_div2 (CMN PLL
> rate / 2); it is then further divided by a configurable 6-bit divider.
> 
> Register the NSS clock through a new ipq_cmn_pll_regmap_div_register()
> helper, built as a plain struct clk_regmap_div instance instead of
> hand-rolling recalc_rate/set_rate. The helper takes the register field
> mask and clock name as parameters so that the upcoming PPE clock, which
> shares the same register with a different field, can reuse it.
> 
> Signed-off-by: Luo Jie <jie.luo@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
