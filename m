Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1900C4C77D1
	for <devicetree@vger.kernel.org>; Tue,  9 Jun 2026 22:26:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781043997; cv=none; b=e/4D8yu72EBtNt0Jw2vM24KdiJTQ9rGwsUplx4adXK+CF5sq9x0TADG+5SHa59G+8Fz7gI1owCBxYdQ9G7vqCv7xkOR0TXHbtQmwgte3qe1jP+Q0ccHXtyYbkfftMSKam/9w6YVWhPdsjzLMcEFQyEMZBuJfmP1Ro2F1zUGg32c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781043997; c=relaxed/simple;
	bh=wSmbSWrh4KvndShnDN5RVVAgjW/hDF2yEiEk/WtBayM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IkC+9WRLaL4wAC3zBLn6V0D8aw8PN6cArWsU8+nHW4an7p5kuOY29ZeGAsu1lek68S4Ub3lwI6EMDmH1394k+Hp/DAXcXqnqkJ+c+WpjkBovzg6uvV9GTaG2FhiOF44UDyPyDhLsR5ugFVtC6lWI6RiZsYdXykMJwBEs6nubDR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=R4w17Bkm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OcsBswTt; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="R4w17Bkm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OcsBswTt"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 659MEggu1917651
	for <devicetree@vger.kernel.org>; Tue, 9 Jun 2026 22:26:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ts2sevuY/m2ocPH0TCVwzt2i
	P8IL8X/SqRKJ5vz6HlU=; b=R4w17Bkmge5qDosiuQAK+xx/ZLtvJfXFo9EZbqQu
	HOlsa/dPENsSfV5XLXzL6FDo84JTTyoxyTO6pcG3akeZFkXiSmdizbAbNgZVo1P8
	CVOWSpftquonnW879bQKb0rJDKcmqXGuwlaeJlKZQ5RbDqlnHq23kyIveT0MWb0g
	sY5NLb+i2O6qzwnAezhlTO+BOVAEIo4W4tqS5HVkBGObfRsFFCINIkAeXKVSEUv1
	q5nE8Iiq1BHTnmn+LBhalhGycpgWgi1RHR0gM670J8Sql9tdsSmubsA+ruhOB7OK
	Vn0XJ7hBIjRDy/sGGW07JuCHPZiFBKuM0GQXUH2mwY+iGw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epf0sv0wh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 09 Jun 2026 22:26:35 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-8cceaca5671so981866d6.0
        for <devicetree@vger.kernel.org>; Tue, 09 Jun 2026 15:26:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781043994; x=1781648794; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ts2sevuY/m2ocPH0TCVwzt2iP8IL8X/SqRKJ5vz6HlU=;
        b=OcsBswTtvHO0RvtT8mFWT5bOwmlsEuQ11sCckLngj/UDU694E+9M9N+YCxGwWpUrOW
         783TyedAU1iaxwZYsMTB63u7vZfkJ8wqk+jmqWmQ8uMqKhFOEU5wmpLaDcf0C+uzKxUT
         2z2Mw6yTu2Yqhvriu6WtWY3JRwsfLy+IuzuV6qyTmTyRTOWosHIW02WeR3nEcYrn6wEm
         M6Sy/YQPtU39+tF1a0PPM+K2evwsw9A4i6rnysnzmkIPWxi616T6jrJByYjGX+S0e9mU
         k+NmMSSWWIsqeAWOF3yohAeHHkzDZWNBJGy3tfEaigcvgOWNVriBSDzXL3ui9kb7d5/T
         LpjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781043994; x=1781648794;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ts2sevuY/m2ocPH0TCVwzt2iP8IL8X/SqRKJ5vz6HlU=;
        b=JrWx/JAj8pKwAknReOzWQyQduTufRy2b2JfWy36eEC4VmZMoXE3o0QRIo97sPvfxB8
         qAW/P6J0VfYSUfVL2zx4J0OJGCQYctFOyh57A+d1BLiOQtgNDsGk9Aa4fq6QvTpYO92d
         /sWfb0PojHky9q/5uzuGuFrSMsCIFJ4SSjflyqd4kdTzMXxL9iSllybEolnbl5uW+Vt5
         aOL41s8Mi/cXoAGhIMzyOOc6cBI4mbaSS5TGlIJtUQEQNJ327QjMqj5BDsvUpdDsWGk5
         wCsL/9QJAwWeKrn3oVVBOQUBMKDyLW5QBQkRKGqW4U5bfkSqRYBO74gWy80IbLS4IKgL
         iWgg==
X-Forwarded-Encrypted: i=1; AFNElJ/6Zc0aydoyH2TaSZOX2jt1BfqZuh4/Y1CieUzq7hVHW8D+kB67YxOltiUc0OZTJ5F9D4Yg8FuygESC@vger.kernel.org
X-Gm-Message-State: AOJu0YyBfgGgsnXIhx9Am69Fos1fOcWwZnDqZXABumP58WuLR5pMRspU
	niaS1ai4kuYcSiJ4RXO+/RJGuODShetcGf4BJU/C+iTZnvo2taKipXDO3GspkozV47+3pHi0N4Q
	KLrPQcrQjMXXwEjPPtyCOgF0ttuIEu+cxFIoRAdoqBpbzJS+3Yk9gxRgAQ0tVwXA7
X-Gm-Gg: Acq92OFf0wVdyXECweiQ4mFbzs2vz5EhpKTvuIcQnzIWwpwie6ELnvc5XKM8NGqFjgN
	TuKQ88dd9O1ggTTZ8euC1Ak4UNaGZrwpjI5C06kAR7jSAFOZOW0DpSqbte3wZLxjkeIWUm4gTNQ
	VYCBJtZGtd8iXsewY4VDqda4s70VVyXvZ7Bnbl2u/8/ek2JdU5GEAsUL4xK34n8ayuKemfCZkpU
	AsI3PrOHfPgpVvdbLs6zd0gvZloqeAa/mXAVTlu5Ys65P3Z340FdyfxLI07p1x8zfpxEYhCfc9e
	nDSelFWyFzAZw2bY7D3lQjLrcU3BPAz+HV2zXJ74ysrm7rNYwhwdPQ32XtT0jviM7Oebca0kSHg
	0cWVJPl3xsU3Z4nG47OTuvuL+xt1A8d/4z6Uy1oCkP2631LohP+JDo6X4KlaEQbgei68K5x/AF6
	KMZgihsqegydD+3UtDBKIwCTKO/Oj7uyTsjf7iDobh5w2d6A==
X-Received: by 2002:a05:622a:987:b0:516:e00e:6868 with SMTP id d75a77b69052e-517ca5fbb44mr62865671cf.46.1781043994213;
        Tue, 09 Jun 2026 15:26:34 -0700 (PDT)
X-Received: by 2002:a05:622a:987:b0:516:e00e:6868 with SMTP id d75a77b69052e-517ca5fbb44mr62865141cf.46.1781043993726;
        Tue, 09 Jun 2026 15:26:33 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa7b906a83sm4906345e87.33.2026.06.09.15.26.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 15:26:32 -0700 (PDT)
Date: Wed, 10 Jun 2026 01:26:31 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Cc: Bryan O'Donoghue <bod@kernel.org>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] arm64: dts: qcom: shikra-evk: Enable Iris core
Message-ID: <fg4oncrltunkvfgdca2ol6sx4tduvewuk3y6zw4bscgr42cmqu@noojvhygjwhq>
References: <20260609-shikra_vpu-v1-0-3a32bb38b080@oss.qualcomm.com>
 <20260609-shikra_vpu-v1-3-3a32bb38b080@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260609-shikra_vpu-v1-3-3a32bb38b080@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDIxMSBTYWx0ZWRfX1hDrflxt0O8w
 xzHAIlOwF2+ZB+QzcoXTu26p6TrNkPMDky3pKA/9qbs22/y80DvhVEr36kQjtBQMaNzG/tnSEd4
 FoTdLQ2hIhRHiWxff3xxFt396g88jrx7mtmwj2UZ1b543K8iqWKhYWMcUAbTkgmfpB1y/bsbiJa
 QTUnNtckxtqD6lyOU7gFQJCsGKdhwxhBUH89LpcAKFlxXRirGCqcHAioS0Me6RTa0s5kP5GeZvR
 c8d8Mwu5Pg0RjgBmqVe2pGn4F4qUd+ed63Co/DC0eRRk1fuZ9yeIy1dqXgRCXktU4Wbrz3hGlbP
 oTQFyHyMbks/m2QMm+BsmcdRFq9k8jdbQlmHT+Jjq5AWh4SAz+NQKliq8PGN0L6m23Bmm+HC2RV
 cXk5xJ2NHnm2vh+dc6vIFWkO6e20H7JsIMLo8tKXONJGJRvYIS6H2tjfVL/gy/ztIDWA78xtiqU
 vxVllUFl+VYC9ykTatQ==
X-Proofpoint-ORIG-GUID: NP42hYxAwNmNNN7iZy-uSWxhv7bIsreZ
X-Proofpoint-GUID: NP42hYxAwNmNNN7iZy-uSWxhv7bIsreZ
X-Authority-Analysis: v=2.4 cv=GeonWwXL c=1 sm=1 tr=0 ts=6a28931b cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=JNbnNDg-RtrLR9FoxugA:9 a=CjuIK1q_8ugA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_04,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 malwarescore=0 clxscore=1015 spamscore=0
 lowpriorityscore=0 impostorscore=0 priorityscore=1501 suspectscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606090211

On Tue, Jun 09, 2026 at 09:45:42PM +0530, Vikash Garodia wrote:
> Enable video en/decoder on the Shikra EVK board.
> 
> Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/shikra-evk.dtsi | 6 ++++++
>  1 file changed, 6 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
