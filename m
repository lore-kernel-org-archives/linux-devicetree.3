Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D77533998
	for <devicetree@vger.kernel.org>; Sat,  4 Jul 2026 00:24:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783124654; cv=none; b=nEmn4yilOinKXpblM/t+/R1vgWgadB8RESKIVpWvn2e+VsmhMuEiZuGZ47dT/1fB+9GC259Y2il0o5b2uxInbLfhKMVFp5Aw4d8Y1IffA7R25/FX8krm8UbgGEcmBN82YgTszQhlZGwU786fgS/TPpDo92pmqbOGV85cYr/54EA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783124654; c=relaxed/simple;
	bh=Q8XLJVd31a4uqkHo70kNzZRqRedRGi5J3rgHb1sVHik=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=erM0sCrwViwXYPmgWrzXBUTRAHt0j5Rv0fbkcR7FOEGUmcSFC0CpNgtebQUplxCbe7hsCXsMuvrUPvy/aztLa6mqD5gZYVWBWKF25BdtJaOR9UItvg8xPw49CP3jFmiEanAWUyyht+6L1gl0AiSVJfJQfElIbRgNXq3A2h2SAHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Mnuz4L13; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FNdTXdzA; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Mnuz4L13";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FNdTXdzA"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 663KQONr1032347
	for <devicetree@vger.kernel.org>; Sat, 4 Jul 2026 00:24:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=gPghQLxdklXsOaeUo28LNs4A
	s5M6v+8qzGSOyFIOr2g=; b=Mnuz4L131ip0X9LCSp5EOrMgvlOpNVwG/jCPeEYy
	geRG8JB5Vre37VsjEuFIsH5+Ccd7zuozj+nwSaiupWKRLxdz/2YdfZjXCSgqYovh
	Ly+DYYoVFF93p8CMHcBRD3UAxKKUBSg59MnwDVEcDEN28xfLIhbfrQeAE3EKKvUQ
	PD53jQY2pG+LKAbSZxrkw5/6BH9D9GsBidQ2b3nPGY2JUDo6ugjsLLStCkksSQsy
	BeZ1KwhDI6cft29phBT71qjB4uLQV9YIEwEu6HjIP600bV0Kjmoje8vVZIhfjhqI
	OBYO4MrOJa8PSRSW3cri9gmG6zkZvCmIBi5iSABHCiUF8w==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f64b5cb6j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 04 Jul 2026 00:24:12 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92e59b0e0f4so83315985a.1
        for <devicetree@vger.kernel.org>; Fri, 03 Jul 2026 17:24:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783124651; x=1783729451; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gPghQLxdklXsOaeUo28LNs4As5M6v+8qzGSOyFIOr2g=;
        b=FNdTXdzAIdFGFoTlqsVdXB1Al1/2FjW5/gBNweFaV3XX+N7mc/kyZfozOkU5NTDqOD
         Ia2f7fVAwwMJMRkumur3kajtXnL0Yvpr/IO9m4XzfyJZH0xSfl7jSRSdhPbWIAIPsMTf
         m8nQERleZ83n2FC8DWPpQj5JOZWRL5G1UKCnLyK+DHDprzcVAQkQuP1DBuiVj2+OP+lQ
         kTvefQJKsIDKkSozRSdbMZwM1oR2478Dt7m7jRTcPop8LgWVH8dOff8ASbaWdhrxkVSE
         I2xvcffdV5eNLK9BWnNOjNlxnEvY5PslFIOwtjnY9Nyj/VybpIby3i+DSXnm6dV2qBYx
         FYKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783124651; x=1783729451;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gPghQLxdklXsOaeUo28LNs4As5M6v+8qzGSOyFIOr2g=;
        b=IRN5VIhK5LKS8unL95T6GUi71qGAfEO0PK7pTKYlgclHbWAlmJ8sOW2Gau8xVQAMmJ
         xPXyP/0K3MZUwzsObkPWfNsIYo3Y1Dr+bWy4y8d1aKH0PlOsYWHbbiMlEqoMuSIoWRMe
         2IrQonieS3QcVO51/He4ZPEmF6d4yq6gPlaRkzgx2lKytPJTXN5vU9C0yaSI39e9+tTS
         5v2Ur12fXEAp3neykx+nHVrtg08Jy0nX12bqtFL9zn/sgsaiPTxXcn8mz8jXUrmq2iZb
         RD9Tvh8D2G9QZ73CJsnbD703GDJATsSkAGWhbrWavZCvckkODhH37ooGvGAHRVY5o51z
         SB6A==
X-Forwarded-Encrypted: i=1; AFNElJ/Kfrs3ZkyViht/RkBUJmrPahfFJGH2xFDJHHlSvBidIJci02kjURtIvpipT3fagV/K1lKRXU6IA8FD@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5AwGi9d0gz2497QxFeUNdJ5fzPAHkEWGoolukcExFxivXiI2V
	x4hvFpbqQi2tE2wypG8wD6LYX5PHHAnYH3WVts3TxKXklZ7O2NSCfMVrAc4YNqAK5m2w/ig0zY9
	6bAxMrvh5yM1yYqZpJrwNUvwj+xnOMMAzow/bwRKWCWn1J4rJqUr0LX0XbGXn9GUU
X-Gm-Gg: AfdE7ckBrfhDiYhlBzhxL1HPdgqFcRFrvGJ64JOkAkPZm/etd62nFh2xH1cPkZDOiK+
	RwFZz/Pi5OoSGSJ7/B5v+7cJ2iy1A3Qxmr1+22DsslX/e9ssvPQ+GRL+wqqEOuN2opNAkj24r5M
	Ys0zJ0BjQJ/hxsWpksSVWQlzvb3V8xmW15LPLKdmVMJHu59SkAd7fAUiclU+GXz1f4A8PdA/wDr
	NSb91OC23W02sQTnqFAo3VeJv0qAfwHMYqGe/Zpv6vVl3zo7BGG52KhrB/4P8q2Yso64wzTAOWv
	RHAHWSI04msB54E+d5/GGjy6FNaS0ZjTel10isWa5JvtO00IQJg2S9T/rnkamWiKR8Pzapt9Xvn
	C3m6R1R9u4GmQkbFVaCPK29OtLgNPEOB16cLxk2yFaGF2UkdZNIC80Kpq2JEAQo11nn0GQGTGLZ
	91cRkaOMQwGOPbxV9a+EafAv4Q
X-Received: by 2002:a05:620a:4626:b0:92b:67e6:8ac9 with SMTP id af79cd13be357-92e9a52bdcfmr234718485a.67.1783124651278;
        Fri, 03 Jul 2026 17:24:11 -0700 (PDT)
X-Received: by 2002:a05:620a:4626:b0:92b:67e6:8ac9 with SMTP id af79cd13be357-92e9a52bdcfmr234714185a.67.1783124650766;
        Fri, 03 Jul 2026 17:24:10 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aed13bbbc6sm870438e87.41.2026.07.03.17.24.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 17:24:09 -0700 (PDT)
Date: Sat, 4 Jul 2026 03:24:06 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Imran Shaik <imran.shaik@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Brian Masney <bmasney@redhat.com>, Dmitry Baryshkov <lumag@kernel.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 18/19] arm64: dts: qcom: agatti: Add missing CX power
 domain to DISPCC
Message-ID: <4pbaiqofyb7jhujnftyog4idm3gu74kdwvrzod66zmtj4dbxa7@dovnrielmv3z>
References: <20260703-shikra-dispcc-gpucc-v5-0-cc13826d4d5a@oss.qualcomm.com>
 <20260703-shikra-dispcc-gpucc-v5-18-cc13826d4d5a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260703-shikra-dispcc-gpucc-v5-18-cc13826d4d5a@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA0MDAwMSBTYWx0ZWRfXzYwxe5cMeZB3
 hvf8aJvOHWk5xR1TaLU8L5Pie1oMEBtDUVUOYne/FBdXF9ICn7nHUAa3Yjvg+FPoGkoaQvR0bFK
 CKUMK58s7K4XT4QNN22GYx31LGLDoVI=
X-Authority-Analysis: v=2.4 cv=FOQrAeos c=1 sm=1 tr=0 ts=6a4852ac cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=QOFLiwY2CebeDMEKwNAA:9 a=CjuIK1q_8ugA:10 a=zZCYzV9kfG8A:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: bZppTycPt1EDjBHO1kaoxH-CtG9OK9K4
X-Proofpoint-GUID: bZppTycPt1EDjBHO1kaoxH-CtG9OK9K4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA0MDAwMSBTYWx0ZWRfXzcKWGFhtoTiH
 xlT1uYPFqe5Mv2eZ84jlv88FGkI6YMnVlPbItpbZVas8ESlPfQfLYTpln6op1J3WjEeoEhMrTSn
 KLjRzXrQhHJ110cGdlKifF8BtFsq6R3dZhmIlN4qxCWwKJugCIjCRVIAxQ6rauaZsSm+6c6dDq3
 dejPR5sTaswYlSwp8v86ipoufPYstoEdvABemQq4DywKMIVmSjxOdSOTea+wi9btMNmLkSHHYW/
 t3mdWl5eLZs6vD7eg4bBaUN5jYwMX99cbi4SVXtENEDgatxCk0IOoMLoE+MIYobl0VSHD8t54AG
 CAvOIW13Ph5GIz/6Tc55m+5k1Qh8LXZu/IObdEIYFJ27awJ9jrTezU0OKbUovEeUhGvgT15A1X2
 aFC7/by6yobcqUc+B8xuOX0fBOdMpuzqqURLYVCPpmr1lwOqaONLkog6AsKvexdoncuGHF8xxJg
 +eQXEerHhjQYerXdk5A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_04,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 priorityscore=1501 lowpriorityscore=0
 bulkscore=0 adultscore=0 clxscore=1015 malwarescore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607040001

On Fri, Jul 03, 2026 at 12:01:40AM +0530, Imran Shaik wrote:
> Add the missing power-domains property to associate DISPCC with CX rail.
> This is to ensure the genpd performance state votes on GDSC the to get
> propagated to the CX rail and to avoid the rail under-voltage conditions.
> 
> Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/agatti.dtsi | 1 +
>  1 file changed, 1 insertion(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
