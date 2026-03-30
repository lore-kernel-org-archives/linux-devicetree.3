Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11D163803EB
	for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 11:49:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774871360; cv=none; b=XyjtGgQMa56M+xe3fIQ4YlVbOS1aHkQTLoulCDNmuqp5nX1QCcmXQe6fWEpIedQ8jNTODYcdxj+3dlIsuD8ZVZSCgKusO5YqNCxaqucI+B0HCCSX1rwMoYOpqN2apOqmVIwKWDovCUcvp4UVxbTCfR8raVZaXEmKHHkS58KPdVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774871360; c=relaxed/simple;
	bh=IH6bsJ2fHIG5hc26HpCXbHj+oKQF1cN53dsvQV6EUv8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tHdbWelHRuuebjWSQtXhx8AYeX1fIUAhD+ke1lgGN7LgHdPWmaqGSUJMAOHEo6hGXV3gjOTSYY0fIOYoFgqZAw5p37ZBsP3W2CGm3FeI7853e/XKwvjoML6JYyjorm/Qj/+clqhjXzEnYJr553uukeWGm6Jd+yZgOF2lmpx/YNU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PDM0g9Xy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gRIG9Sdf; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PDM0g9Xy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gRIG9Sdf"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62UBZb3P4013544
	for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 11:49:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=hebXS8dFlHSczLktf6Y+/HKY
	041XZ7QQsM+NHoi8IeA=; b=PDM0g9Xys8JS9E0kCWkQkTc700SzDc1JTkxu5Qpz
	9ekcybnN9tccvtsIO8d0ZPQ88RvcHbMQD5T/H0GaX1VQ1i33spid+sGOqNbiG/5Z
	y8fvrTNtkORjQBKbOD0vuReX3mNc+mmsARDRAAz9SSt+jvkgfeIt6qwnLhkUBS+i
	LnXURhZi3291MV50+VsM7acoEohDXa7VO9N7WCGlev8exGag1jF5l4b9xN/9MQ0/
	J1U9+uyKDYk+cvHpRzMdfFsFubnLFfhJBA1iXDtJG3U96CrdyB6OZM3HiGxVvqRm
	4l4o+9TBVVAlAF0PuBBS82YU58tb7z+XPYQI+zFOMFdMpQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d7regr17n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 11:49:18 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50b4076dc16so86458681cf.2
        for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 04:49:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774871357; x=1775476157; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hebXS8dFlHSczLktf6Y+/HKY041XZ7QQsM+NHoi8IeA=;
        b=gRIG9Sdf05Hrec6jxRaSNJrxosgdhyQHA1I8UojQxarPsbw8PS4eGpdycLUFiIm/ue
         mBqP+M6lAcdr6sptpYjGPA2jE+vXsfhCQiFgefshd7uuwxTLJyttywLgnwPQGDHrksse
         B5rWbQILvSJwDwqrAV89ANHvqK6ZosBuwg14bEVwBdWcmeQvLov9GUmo6lvds8HIgoFc
         /g0fTQ4MX1M6Ero8xe2TMvVnZlV5ayxHdP2XH8PKyh8hYvPHZsF03Tni+dgblsRk+Dau
         ZlwXLNRKo0pSFaP/MTturSw8Go1KUBMXFvAu90UVZTBqwbjA02L7c9g5KgsdWvWzGKTW
         eM7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774871357; x=1775476157;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hebXS8dFlHSczLktf6Y+/HKY041XZ7QQsM+NHoi8IeA=;
        b=sRonqJ17cB4z0Ucr75JqMT3LeMr9wdNL5a93XlQlkPhiS9ABXTFAaP6JFeGxL+cvkY
         6Y+Iv14KDUFIbt9AZCSPmFedPoVE5TzzPPR5TSAsYwrvyK7VYY15h9mWo3QdDz3ldNqI
         Bne4BXzlgiB5bo5nQMEgnwVHnlAciZkN5v+J8O/uVVwsErokz9tSyf1C7FBH2tHYkogl
         xxrjFr9kaWhR6IcY+SAH3Fg4M+/or45xFiHsp6+e9nkMR+9EjIj0qQ56GWtY+uMapjIt
         umuXSKSBlnjiWDp4DtZZWr/xwOHIXLfCj3Mc0Yz+FJWIjqB25FdMzyXCzLWvMrG7/LPm
         oWKg==
X-Forwarded-Encrypted: i=1; AJvYcCXV4q2HrxVlYrj70kpruiEz6YtWupyBYYdcFTmi5qiTAVfF3NXwqjoDlLDzkddiRL0RufTMSpuIVv6J@vger.kernel.org
X-Gm-Message-State: AOJu0YzIPNk30JDHwgs2vW2kq0X8dXybTcDra0uEg46mazqCKrMxOECO
	CstyR49txfvjdNtt0F8vnevg8zeJwTrBfp1i8AAcvdi84eVO0ireXHNiM5+snanJOG9UJ+u7mDc
	rZMz4jrVSxkFOX35gXAluXDjnAL/zHJ/DuetUEmly4Mi8ImrUd3swXaN4saWPfPHY
X-Gm-Gg: ATEYQzyRkw6jFgfDPWZyrziFQcdnIh5QvudWb5phSOx9MLSvEnkmqop2srG1qykcSau
	C3Hf7Tih8aU+eUlfVNnzwRsdQlA0jS3HwxrFI4hC5BGT9BAqI7Ck1lBmaljiy5VQ61jY0JfJjLN
	MQ9+9tLHwZJdBhpvStrGm8DwFlnzDRflf1tzxX58+GyRuF/XB3sIrN4zDylV4Teej6j7EROldmV
	b0/pg0ZsL6znZ/LTQOxhz8/E6gGZ8Ef0KK6inTXMRDP2IIugHekxLYYHvCuaGUWvo0w63UkPsQT
	1oZV74QWxx81B3KS+MdTnwUitO3aQbPIhbOMBe4AL+Lv7kFEp1qw9cXKyVFHHBwfmUNxISW80Tg
	zLYSuL6qR/AWRc7QhndnCyMg0wnP1lwASYd4VyEq7h6WK/NQsR24l1AiXBOG1xQXO/KNlKqNqT5
	xIFxOOB4oy9xF6n28jFU+rpB216cuZ9DqwYH0=
X-Received: by 2002:a05:622a:295:b0:50b:4e65:95d3 with SMTP id d75a77b69052e-50ba398eabfmr172138741cf.65.1774871357292;
        Mon, 30 Mar 2026 04:49:17 -0700 (PDT)
X-Received: by 2002:a05:622a:295:b0:50b:4e65:95d3 with SMTP id d75a77b69052e-50ba398eabfmr172138191cf.65.1774871356694;
        Mon, 30 Mar 2026 04:49:16 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2b145642dsm1615209e87.65.2026.03.30.04.49.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 04:49:15 -0700 (PDT)
Date: Mon, 30 Mar 2026 14:49:13 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bryan O'Donoghue <bod@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 1/2] dt-bindings: phy: qcom: Add CSI2 C-PHY/DPHY schema
Message-ID: <gcu6qzsoff2fox3nbytegyikajn65ae4ekowcn7bs4x2k53vao@rykmxndzzhlu>
References: <7712fbdd-a225-49f0-aeb9-ebcbb9d5abac@oss.qualcomm.com>
 <da3ed78d-fb5e-4820-95d6-527d540cf03e@linaro.org>
 <1f38187a-9464-4aa9-b70a-03b767349d56@linaro.org>
 <c5278028-dfe9-4d09-970a-a25977967bdd@linaro.org>
 <016c03b8-27c3-41dc-a630-8e7095db1f88@linaro.org>
 <456ded59-d13e-4b61-975b-97ca48b5e771@linaro.org>
 <RAPaPhpxA39W0ykm-Cr1KaDiJKpRqdQTXUeEmt5mQn4lJBHEGaIS010ejjmhUYEBsHjzrTX41Ek9zLU2bae_YA==@protonmail.internalid>
 <76ea03d0-d41b-4880-a48c-06570eb089ed@linaro.org>
 <0101d8bc-1ae8-475e-bb9e-cc1e16db87ec@kernel.org>
 <6d5ebab6-3c4e-4a1c-9578-6e926cbd96de@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6d5ebab6-3c4e-4a1c-9578-6e926cbd96de@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=G6wR0tk5 c=1 sm=1 tr=0 ts=69ca633e cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=f9JiygmAj-6OnV0y8IgA:9
 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMwMDA5MiBTYWx0ZWRfXyumoL70xSQj6
 UgE3lBZtvjLFDRoZqbXbkI94TKFQQPUS6woehjb+mAY3XZhLLQNkrk6XsNwNU8hdBipHPGtrIis
 9erW9HQC6eAiM9bmc0LODV15DOiMFZI16tFmTQXCJAQ3bnohZfBLhESweW53gLNKH8wW81qRYjK
 4genAUPOmYP2wq0A+cYsKKvzEflyVOP/JKNDbboz6+lzjw9AuBONlxMCq6O9ISNELgr84uV0TsY
 xdP5ufJXNk09ZKXEeub3edkr9PTCXT3Pp8YL2NgN61JFfpz3ZHxiEpYMFqvECzWoIIJ9eIOcXkt
 rULB0R6tOnalV6RFHvODHw1lBE9G2yo8oxufpvycjT2DdShbrVNZYQgYwpzRWIR231e1++8Zhq3
 J1PMuBXSyFAHkZY5f/V7YBNB0AoLhYJkdRdcJY9Rq55z3b/FgqBTpDxsj5rUAkxAWX88CNyyYvU
 K1BAvXDlaUBj4DFVS7w==
X-Proofpoint-ORIG-GUID: TymYGceKmZ5U-PRv67KtUxIGZyYXVeZb
X-Proofpoint-GUID: TymYGceKmZ5U-PRv67KtUxIGZyYXVeZb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-29_05,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 clxscore=1015 suspectscore=0 bulkscore=0
 malwarescore=0 adultscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603300092

On Mon, Mar 30, 2026 at 01:34:57PM +0200, Konrad Dybcio wrote:
> On 3/30/26 11:25 AM, Bryan O'Donoghue wrote:
> > On 30/03/2026 10:17, Neil Armstrong wrote:
> >> On 3/30/26 11:02, Bryan O'Donoghue wrote:
> >>> On 30/03/2026 08:49, Neil Armstrong wrote:
> >>>> On 3/27/26 18:42, Bryan O'Donoghue wrote:
> >>>>> On 27/03/2026 15:28, Neil Armstrong wrote:
> >>>>>>> To be frankly honest you can make an argument for it either way. However my honestly held position is analysing other upstream implementations connecting to the PHY means we can't make the PHY device a drivers/phy device - it would have to be a V4L2 device and then for me the question is why is that even required ?
> >>>>>>
> >>>>>> This is plain wrong, DT definition is different from software implementation, you can do whatever you want if you describe HW accurately.
> >>>>>
> >>>>> I'm not sure what point it is you are trying to make here. Are you trying to say drivers/phy is OK with you but you want an endpoint ? If so, please just say so.
> >>>>
> >>>> I'm against using the "phys = <>" property in the CAMSS to reference the PHYs, a "PHY" in the classic terminology is tied to a single consumer, and if it can be shared to multiple consumer you must model a mux or whatever in the middle.
> >>>
> >>> The CSIPHY-to-CSID routing is runtime-configurable and is already managed by the media controller framework.
> >>
> >> This is not compatible with the PHY bindings if you don't have a defined MUX device in the middle, it's wrong. You're hiding the muxing details in the CAMSS blob node.
> >>
> >>>
> >>> DT describes static hardware connections. The dynamic mux is a software concern, not a hardware description concern.
> >>
> >> DT must describe the possible interconnections between the nodes, if a PHY can be used by multiple hardware components, it must be described.
> > 
> > But right now the CAMSS block is described as a single block. There is no CSID device in the kernel _yet_.
> > 
> > When we break CSID into its own block then fine, lets have a debate about a mux then but right now the "nodes" are CAMSS[MONOLITH] <=> CSIPHY there is no DT CSID device to model this to.
> 
> Let's take a step back - since any CSIPHY can feed into any CSID (at runtime),
> the resulting nodes would either look like:
> 
> // hardcoded, m may != n
> csid_n: csid@1000000 {
> 	phys = <&csiphy_m>;
> };
> 
> or
> 
> // determined at runtime
> csid_n: csid@1000000 {
> 	phys = <&csiphy_0>,
> 	       [...]
> 	       <&csiphy_n-1>;
> };

I think the bigger problem is:

&csid_L: {
	phys = <&csiphy_M>;
};

&csid_N: {
	phys = <&csiphy_M>;
};

aka split mode.

> 
> or we could store them once, centrally, in the "CAMSS_TOP" node and
> pass handles around as necessary:
> 
> // camss "catalog/manager" driver/library provides CSIDn with PHYm
> camss: camss@10000000 {
> 	phys = <&csiphy_0>,
> 	       [...]
> 	       <&csiphy_n-1>;
> 
> 	csid_n: csid@1000 {
> 		// no PHY references
> 	};
> };
> 
> Konrad

-- 
With best wishes
Dmitry
