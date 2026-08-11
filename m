Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AD51435502
	for <devicetree@vger.kernel.org>; Tue, 11 Aug 2026 10:10:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786443045; cv=none; b=gbQZkPOQviGU9uB9mKMyAAzfM0oZ2+oOnExzFHH++zcZWDo49aYiYCqs4WlkYjMugZzyiyRMC9TOZkG9mpJk91lak8XhUjq/twOnQ3CFfTJmDBUYbrkWhrUWWl8LjbTCledlU7SpEZhTYoe1+Xtf9hxyWFjvH4dFcp9x2aufrCw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786443045; c=relaxed/simple;
	bh=fgXs0ECcNvgGaeJcwkLzQCD1n22yUPG5FRti3ek/DTU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GjfDbWjNo2p3rJZprrAVU5G65RKdQdo1yXH7vqzuahcVvrcFbihCJRFLuNAAv4zgun+n/R9P6DZqLEAWD/Mn7qOu/BAHIb+ZrXKPoUvJ3dQwFUnjNe+ceIGFdaPGzfSd2f88mHTW832B93aYOKuc6fYGDlIC+p/l6cOyF1lEzLw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CcY7HrCq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QvH6JZ/6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CcY7HrCq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QvH6JZ/6"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67B70I4d3048467
	for <devicetree@vger.kernel.org>; Tue, 11 Aug 2026 10:10:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=7QdukdYst6AdgiExdWVsNfBj
	ptF+nLJuNmughEUGSs4=; b=CcY7HrCqV+t/PV72ChNr7uGjZIvc9mVnyJbUByF/
	cD3YK/9a81JSJz0MqEBlyWj2PNNH9iwDWOHgKl9AUKgLvnkp4UlDH1NAeRzXgsJA
	/SIRNPnxqeQwqFiULRtcsZ5UzGBK2b3zj/JX8WpxttDX6fbG82faqRd9sd0XaKKd
	bnv2jlgnSEBImVOqpyVsj/lsFSrhlUHA3tyOHXGjMl5G+2XiN+iKT2DCt/FP31mZ
	ivgkLzrToti54cKiA6e0XyTyViM6zp12JABtnTvNcU58jD2zViM9JBzUMMST+/k/
	N8My1AuuFQgtL5UqAVukh62xwuCDIQao9zosO2YZ2BThDg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fyjk23nnt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 11 Aug 2026 10:10:26 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51a8db414c7so39485591cf.0
        for <devicetree@vger.kernel.org>; Tue, 11 Aug 2026 03:10:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786443026; x=1787047826; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7QdukdYst6AdgiExdWVsNfBjptF+nLJuNmughEUGSs4=;
        b=QvH6JZ/6FGA4CNXN5EvdM497vlsmbngpcXN/JjkCOo6V8YTeyeM+Eu1ytlq/5D89y9
         MiMFnjJbM58EtFf/Vdr2lYqCkkPwveARU9cK9ZNoi2zpbLVMt9B0q9gFLn9/74Mrmt4y
         3Kf2wLNVwTKJ2CRR2KQKwe6UZqO0xr6v0cRBVWjEgSRBIRJ+tkpVw0lDRAygTPkxcqHl
         JUChWpFpj3genYys3bdBaXU7f2jI04HdDpI1uNi83iarqRXjymakgxHXqNDLhI2EPorG
         WNU2FDF6PIS8B3jeTrz4qW2/ozCZOkxjYV5n455oHwcrQmO70sV2cKndOSpu8VpKJrJy
         CeMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786443026; x=1787047826;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7QdukdYst6AdgiExdWVsNfBjptF+nLJuNmughEUGSs4=;
        b=fXgW96haDJqqClZZ3pT4pIPGeiFSRCfkb5lErDXgWn0eBsFqVUPxXaTMVNz9Su5bi0
         UblGZF+Lsunlxst8C3Lxm6oBxGW6WwvGnAUsWRN2aNbvyaPwjbJjsogZm27BviYcbZdv
         eDUKUNi1srDMb4DO57sqZd0D71a1NxK/BiIJv4djm0ArTjGl7x7rSVJAhFboE/t/fj0+
         oNErXX7URyEPz3jYk4KOJ9bRfP7ubvT1KFGs9B95q/I7PAzyItcTySm8yWSIOlmL3w3x
         oVQaNKGdavf7wPeFgLjzs3RRf7x0YB+eHh0T7ltnRyBuhKsg6SAEhcSVWprFDfses9P+
         imZg==
X-Forwarded-Encrypted: i=1; AHgh+Rr+4KPWfxdgP8RwvIae9xm6y19c4znGP763VSjnILDTC05Xp+7f0cHORu5jWQWcXf3iL21LsS/ZSJkF@vger.kernel.org
X-Gm-Message-State: AOJu0YzaucUqnz995yqevLYJwFTGySB/Qz1vmlq3EamuOlEJ9pYWvKTY
	XeYf2lGW73H5bbbmKg/puihPN4EyJNt8Yb/mZAz7p4UHDNGx1IXd+GRtqLwg5qYhOg3ZbOXMs68
	6M0v7ykJDBYSwLqvieBIKdqyRsLaz1Hcj69Uk90ox7fdaRIuOLl3zJTixnVtq8+7z
X-Gm-Gg: AR+sD13dnrG7NERQWgyufNLKZjKM1D3lI0RPFPwPwLkjEZjg4HxCmnpUjU5uLBY7CgZ
	vkxX8Gki8e1m2XLt4AD87uDEX8bCeKnu1DQSCpttANYJnmFr1xyaHdUBuq5y6gl2sp2PblKDQWD
	ASn9mXaJiwQ7QaLNEoXKwblY5XFOu8PNIT5Ssmg7w9IWdt3totTzDeKC7RAuszi4o6r/tRbXdoF
	vhepoRa61risi7GrFCoF/ZKjCktGJT6XGuMQJRvXeCzagYSwYKjUNwYf0+/o03xTZIkZzZ6fx+S
	m7xkj0DT4A5/+Yju1qKrcNt8gDZoDA4GP0IuerFcdMM498NYeDHliI6K9fZN1HxIe2E1hc38UWu
	CHievsL4DtGQ5T2ah80Ga7lymaReSpLloQSblA52fx9UUOIIbPeblZsLQ0oqva1jrxlAea7yu+V
	YrwEazcEbeGAeweQ==
X-Received: by 2002:a05:622a:178f:b0:51c:1006:a024 with SMTP id d75a77b69052e-52d586c8d5amr15905251cf.43.1786443025743;
        Tue, 11 Aug 2026 03:10:25 -0700 (PDT)
X-Received: by 2002:a05:622a:178f:b0:51c:1006:a024 with SMTP id d75a77b69052e-52d586c8d5amr15904781cf.43.1786443025281;
        Tue, 11 Aug 2026 03:10:25 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b44872e696sm194374e87.68.2026.08.11.03.10.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 03:10:23 -0700 (PDT)
Date: Tue, 11 Aug 2026 13:10:21 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Cc: Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH 2/3] clk: qcom: ipq9650: Use icc-clk for enabling NoC
 related clocks
Message-ID: <ekugszfavtnbsprtjyid6htrjqg4iziss4hknniuvistiwy3l2@rjbmoaau5zh5>
References: <20260519-ipq9650_icc-v1-0-4d3554c94257@oss.qualcomm.com>
 <20260519-ipq9650_icc-v1-2-4d3554c94257@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260519-ipq9650_icc-v1-2-4d3554c94257@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwODExMDA4MyBTYWx0ZWRfX0YbMpmW/Xh4J
 vRrYX5rqzg/Xk8TNAKJBeFlJrzI9z/W2q8ojpfSB01RMGLdjtlQ/aobDlZ6c5aelJ9Hp2dtm/3F
 x0Lo8Boiq1MbT47C+DKcCekud1/W9oQ=
X-Proofpoint-GUID: nqFfajAre83ENN4waAq2T61tbdnS1nxv
X-Proofpoint-ORIG-GUID: nqFfajAre83ENN4waAq2T61tbdnS1nxv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODExMDA4MyBTYWx0ZWRfX5+fSEauIMI84
 uPnEM/jQwQrkDbsK1kN3DxPBLlKEv1NylZxrvIS/Ht+shyXc4UCh345R9DIHT/cngQRKMGQh8wv
 DlTbDEuy/2QWOEJ+tPsSaRrVpyVjJuvS4dkTFkhu2xjG1CSKPEbTkyxN7KwjncjjEbCPC61mndi
 7rxtJdQ1HurtRJDBsRr1xjIzUXaXmZXyKTvrcxFHyl4WrvAL+SS1pMgdpjSiXN5IBICOQEeYpdg
 6W2jKbbcW3wer2a63GsqytmwvRrkW/1ymscNeIdZdO90kqw7WHIavvGs9uhlbVKsyFLfiwf7LP1
 QA5WPhZCb4GSPCZ/k5cDBSbqXFIDDS8kP3DMXNdx4B1MATu6/Nh9z4JONyuId/yFJRnh7hszJ92
 kw6grgGDo0VsR9CQ7el8Fhy96zVAZ7ruoZaUucSCTLlbEDOmYUvvuTDlEObzxCzkB2r+ds6MisC
 vDzob+UMgvi+DMp3+1g==
X-Authority-Analysis: v=2.4 cv=eJ4jSnp1 c=1 sm=1 tr=0 ts=6a7af512 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=5alyi5PEbrS2V74xuKgA:9 a=CjuIK1q_8ugA:10 a=zZCYzV9kfG8A:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-10_06,2026-08-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 phishscore=0 malwarescore=0 bulkscore=0
 adultscore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608110083

On Tue, May 19, 2026 at 02:17:06PM +0530, Kathiravan Thirumoorthy wrote:
> Register NoC clocks for PCIe and USB interconnect paths using the
> icc-clk framework. Without this, the clocks required to create
> interconnect paths and access peripherals connected to these NoCs are
> not properly managed.
> 
> Also add icc_sync_state to ensure clock states are synchronized after all
> consumers have probed.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/gcc-ipq9650.c | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
