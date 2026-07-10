Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D552403EAE
	for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 12:52:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783687980; cv=none; b=GCIXJdlTcPMNAMNo+PGKoP0qkcSgfxz+mR182LBsKVxXKV50Y4BHNiGWAiiH3Hb5ihMF6/MvLN2/zVdVYDbSRAFn+jB8bMDcKiCex2IFkKKYLSkeL22DKns9l7pR+uKqTa8VucWoY5DMvtHuqxBOkekJWJqKFqB4CqipSHx+PUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783687980; c=relaxed/simple;
	bh=dff3dPz6fj6WTu2ipiERxBpDc6obBjfF4qBxHiQ0VQM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NZzInCdN/EKsxOy4ppSFFlpWbThqkEPSx/kpnmRDCOyqGySv/Y44BXXngTqYRRiR4gncUl22Fn1u+sazkIC9u09dgIDqsAUQC0cQkXirEAgp6ptv79pdFxwCvRKlKhUNzw377VRVjgM/D/UvNKXGWVdbACEO/1hhaTCtoAGGDMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=I42/IKe3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TTWin0qi; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="I42/IKe3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TTWin0qi"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66AAmcdp605206
	for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 12:52:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=NpAfu+gzDtNcSOBz6LH2pQ8p
	/Lp4trDqfrlm8ofYnek=; b=I42/IKe3Ri7lwyhxcP0dFl8qFQsMZfU3/utC6aPK
	eAN/xFQ+dwmBwLOZ5GbU16gbOUoqyNZ7IThEm0FjgpqXriMwwI7ZFq7vXpa4ilaA
	xY8MVwJQOL5iO0WrgnrdPvdQaWoZ96CY/8eCNX3+rfoedBsriIvzOge9GyiTb5EI
	CIiyZmZRYWdXoWOBlX+TOun4Zo5KDZISDpmx2Qj7xxrW/RhXDhdQAn8UH1RqYKIZ
	u252r/L4QbuqCzBLdhNEYCtieER6FgfyLuF9wfU33O7KPXLW92K37Rk2RvODGnBC
	aM1AQ7GI3JhgPMR5Zb3FeYff6jIO4IIqRRUvcaGtkzu0LA==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fanweahjm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 12:52:57 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-96dacd0ab0aso94442241.0
        for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 05:52:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783687977; x=1784292777; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NpAfu+gzDtNcSOBz6LH2pQ8p/Lp4trDqfrlm8ofYnek=;
        b=TTWin0qiqB0AWM2LBof4QfsNT9HPUntmWzB76f5Mk+m3VdgFABrfHqE7FzF74zz8q9
         ihefGc2h+uPVMwCk5rsYPMf9nCLhvmMrQfPDGgmnFabTeipPfIvfFnMh4pz608qAKrHE
         hZfo0SdELBRXPNSiGaPH0yZxOpx+b2uQkq6GeMjax7PvoZkW0ETW1DC+V2KSpL3haLSQ
         /b0/76mS3wQg9NqF/Jz1XP9L+0+sw9hk5qGvYAUMZdgidcFhTgHZWXjBwY5GdnAP468D
         Nb1mC0JBSjlToONE2jTTZx9GVWYH4cY5HhiLsS+icsW9sJ7P8av2UcmnVy7MYv0lWqgw
         /BJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783687977; x=1784292777;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NpAfu+gzDtNcSOBz6LH2pQ8p/Lp4trDqfrlm8ofYnek=;
        b=hrVO82OVBEZYDKySo4C58WaT+xvWNLl/q8WtlcNY6xfYW1Fshrt5eHwHc0crAT2hlJ
         zx/qPLbBXnbbS1qLQW0kVuOexwnKUjMPNLfkLkZ/ZZfiwz8HAl+Ovj+2TttBb09OUeHN
         yVslW2EAfqy85RZzRxBk9NcycJkSXEa3p7b/oYuuMsimbfTeIZEHxNJ402D5Njd9Hkcm
         4rBDFA2/yvcYPeMH8dD+rYozhKgLjFZd/iBR5bICri/aYDI1vElLew7xgOy5CCv/Cz5d
         x4DZsXc80lTXFC/SM9WlPpHDye7s2wOt0g9RTtAE8hWEb8k5Vy3i14322FZiPd9ZU0IU
         AXWA==
X-Forwarded-Encrypted: i=1; AHgh+RpsL4FcxKx7lJcyXLZa+E05EIEN0F93qoQLpgS8RE+0isJM/ticwS++CnmIYQnQWtVGT6yIeM/Al4Df@vger.kernel.org
X-Gm-Message-State: AOJu0YxcCcM1l/PbdS1TdMLFoRQgCyVdGmecFbl4E8V0UdPqu1oWm/Ic
	JQza306U6iWb4v2HuyJPCPMNo25lDwS6QLNFEFJeL3wELUfhKfyR3gHfIFRkqfyMSLn3SzaT4Px
	vy/2MrNjUDGanJJIJfC4Em/e5WZHIhC9uLZaaonC5UjpzErORcjWLz7U0lXPcK/jF
X-Gm-Gg: AfdE7ckXCs0AQF3AS30TW9mDkJR4Nn7WH4o9spDK0Xhbowvu1Bx3FPZ1UM+agoNh5AQ
	dZR+Zm4ASjFDacD3P6U8Cu/jVUkqTVXAQcp8uWgyiGV7UiIc3G8b9CSn+pfnMMUAil5SbQk7IHj
	vbwivVUptWRevRfcVtUQPVf2Wpbyc4i1xFbSuOS9ALJe8mYqGyham6WH/o/YObkGHn4pp+6i2Xy
	nDrZQG1ncObfbqpwu3OJzrHuzcnBZKeTuspWDFYSjfordqE+QCEKbFq1VpmnfsfuWkTK/FPwfCX
	SDNt1QO9FOnGODB/OGhVQrepcbWr049W0JOFGgrATlKZKFvFpS4AsTppKMs4YnD7vCzUqJPLHcQ
	m5VG9M1/jl4aIJ5YA/oJlYH+zOLOjqviJjfoDsCmQCwKPrRtMoA29+u42jxU9wIEAHsqxTRi12W
	KDPVEY1njfW+Z++KHb0nKU1I5i
X-Received: by 2002:a05:6102:914:b0:740:2664:801b with SMTP id ada2fe7eead31-744e00462c3mr6355728137.11.1783687976784;
        Fri, 10 Jul 2026 05:52:56 -0700 (PDT)
X-Received: by 2002:a05:6102:914:b0:740:2664:801b with SMTP id ada2fe7eead31-744e00462c3mr6355697137.11.1783687976325;
        Fri, 10 Jul 2026 05:52:56 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b01caa635dsm589398e87.62.2026.07.10.05.52.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 05:52:55 -0700 (PDT)
Date: Fri, 10 Jul 2026 15:52:53 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bryan O'Donoghue <bod@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Atanas Filipov <atanas.filipov@oss.qualcomm.com>,
        linux-media@vger.kernel.org, loic.poulain@oss.qualcomm.com,
        mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, andersson@kernel.org, konradybcio@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v4 0/5] Add Qualcomm JPEG V4L2 encoder for SM8250
Message-ID: <olngpgjkxejkpnxtbwazut32umi6w6zc5gsqybpmnzm6kliywf@5eclmxcnoybc>
References: <c8c38ec6-4422-4c91-a249-20bc20260e73@linaro.org>
 <d0768c15-453f-4d3f-8110-886a5c697b02@oss.qualcomm.com>
 <d5407ab1-1af7-4678-ae67-5cf30ce8fa4b@kernel.org>
 <VoXmpDKdgY_XxAvO5tkDze4jpmMzSuKTmIISTejJsbIO_FIO1JFfUBlaPkNdb14E95zf_qwtDB6myQ2wdRCh1Q==@protonmail.internalid>
 <8fc1ddfd-0f77-4b67-b9bd-33fbd60e2046@oss.qualcomm.com>
 <54ad9b8a-7596-4bc7-a1c3-7230cca21360@kernel.org>
 <wbjec4qhzkpvdfnrvffk7tjmlvli5q2jiuzdp2iqt2cbf2uat7@usg2mizurxpp>
 <29bbcc9d-a0b5-4966-a195-1702ed514a4a@oss.qualcomm.com>
 <l5fz64drffgrep57hj7kwc7v2drbg6kdkw4f7wxrmxf2kjjhsv@pcyyjtzi7jlc>
 <1921023f-da03-4f3d-8489-bfa2c5fe4f3b@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1921023f-da03-4f3d-8489-bfa2c5fe4f3b@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=LbIMLDfi c=1 sm=1 tr=0 ts=6a50eb29 cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=0W1SmJJ0diwaTAMQS2cA:9
 a=CjuIK1q_8ugA:10 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEwMDEyNiBTYWx0ZWRfX4JPhZN7VRqtg
 MkbgTPQ4yw3h5ULotAqBZyb34aUGA81Xik+n98X5FMWahQWdyRn2p2EP/gKMsQft6ZpKgw+YXUJ
 1aFXvKhN85wZP5eDp9w06WDmzvDA7qAsX2NB0EgYecn82qjauSfnG1IdBbYT3+hidfwhytUoBdY
 XIVqBc29rh8CDOUmI05jlOy1ADbiUxCUwciLaap37O6qNpMhvFXB99P/b38qCj/Soqy6qFNFaUM
 rtQ8KUpSiuOn0+3vp/bgDnkCSiKLQcMqs3pAdatKYWzAP4c+VDE4QIT5ewaDQVG5e/xGsu40Nzn
 hqo3oDuvd4i2FXGdsS+NSLmHsZXF9ctnaO30Y2q+IIrix/LLuML1h6xlpBKNjsarqfR9XRTjLQO
 mVrde6aco+waUYDGAIoJ1uYNR2GiUnzXt3HmY6daasSNLCrLCwqmf+KK4U+UARjfbJo4d/OxqoO
 d+eV9iMLot7qI1HE/Zg==
X-Proofpoint-ORIG-GUID: ijtRigXPytoJWDn5aZYsiBH18bzhB1UO
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEwMDEyNiBTYWx0ZWRfXx6T5ucRJwiEH
 bqOShGkuQp4rPA2XuPZ2FI5QrPcofOuqNgTcA8dnHfEWnPZgXftIvijLWCtP3DOzs5Jn3MTo+OI
 WgYfCNFPbll6ITGPO/tP1iGg1fwXCCc=
X-Proofpoint-GUID: ijtRigXPytoJWDn5aZYsiBH18bzhB1UO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-10_03,2026-07-09_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0
 clxscore=1015 impostorscore=0 priorityscore=1501 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607100126

On Fri, Jul 10, 2026 at 02:33:53PM +0200, Konrad Dybcio wrote:
> On 7/10/26 2:28 PM, Dmitry Baryshkov wrote:
> > On Thu, Jul 09, 2026 at 08:16:21PM +0200, Konrad Dybcio wrote:
> >> On 7/9/26 9:33 AM, Dmitry Baryshkov wrote:
> >>> On Wed, Jul 08, 2026 at 10:21:43PM +0100, Bryan O'Donoghue wrote:
> >>>> On 08/07/2026 13:19, Konrad Dybcio wrote:
> >>>>> On 7/7/26 12:41 PM, Bryan O'Donoghue wrote:
> >>>>>> On 07/07/2026 11:11, Konrad Dybcio wrote:
> >>>>>>> On 7/7/26 12:00 PM, Bryan O'Donoghue wrote:
> >>>>>>>> On 07/07/2026 10:24, Konrad Dybcio wrote:
> >>>>>>>>> On 7/6/26 3:37 PM, Bryan O'Donoghue wrote:
> >>>>>>>>>> On 06/07/2026 14:02, Vladimir Zapolskiy wrote:
> 
> [...]
> 
> >>> Which way of representing device nodes makes it easier to migrate
> >>> existing platform to the CSI PHY driver, while keeping compatibility
> >>> with old DTs (yeah, ABI, old DTs must continue to work)?
> >>
> >> Quite frankly, I don't consider the existing (meganode) description
> >> any valid, and would vote to rip it the second a replacement is
> >> available. But once, not N times.
> > 
> > Rip without providing backwards compatibility?
> 
> Because the existing bindings make ensuring the required performance
> state of power domains impossible, yes

Then, should it just be 'write new set of bindings and drivers for the
platform XYZ', then completely migrate existing platforms one by one.

-- 
With best wishes
Dmitry
