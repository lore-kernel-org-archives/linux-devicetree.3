Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793625823;
	b=LGqA9M7YjImpUDuOar/FcsnJzYbrQBZTumVzi7QsFO/K7M99Vxlf2eEHOEqY8xnse5z7
	 rLEvAI64T5Gh4TZoCiJy7djkbSF3xoxZGUKrEct9RuS6eksaWydrg2gQVa9Q+9qWA7Lyv
	 O2AC3YLapjoERb06j2SY/VkhVeTGvAkSAarHKZIkBTlFwHq4Y1y/2hBdzcF6AsrUbESth
	 fdZpDPSNVfiWzXmL4IypuukvFcoyLD+glf6X9nn2YNizp8DmQl1WTq65oL9kdajkZ1ao1
	 yDJnU7Vypv/B8rFwRJU5Yf6v8sH30e11V7F4Bua5Gjw9OlJuYIzSLkqfudLRtLP//zw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793625823;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=g1dUytA+EdoDg+Eu6pKR+9XMzqtgSGYZ7n7ArYD1v7g=;
	b=iPRYRV2kikKRAmhNrMYCCA9DonHNelf0rPy1BjWd1qLsbyGRKYIRvYlLkdYA/oad2fl3
	 gKdKazASHua4eCUkDfSSpXtoHUrSApeGoyiKltkL0HjrKa0ymvu4AdS1KW89KhK6HA77E
	 /WZTq2FyUVHAE4vi2DqL0QPP/NxkseQvscau5W1DG22SSrVFUn/XtztGFkhxsl5s7V33f
	 QgW4jBZoCvVq3xEH9AmrYGexpobE1nRbXTmAM436qWGJKe2zEXKWFSj1ZS+cVZ0S/aK/+
	 9iCfGOxBJvrvk/nGKe8L4xB/X7KGnRmIan7MEIKGcoLmkZn71XPibzjn+/zsMMT/lkw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cck0U1do;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CqreRL9I;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 975FF606A326
	for <devicetree@vger.kernel.org>; Mon,  2 Nov 2026 13:23:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 975FF606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cck0U1do;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CqreRL9I
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A2DAK6X3944290
	for <devicetree@vger.kernel.org>; Mon, 2 Nov 2026 13:23:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=g1dUytA+EdoDg+Eu6pKR+9XM
	zqtgSGYZ7n7ArYD1v7g=; b=cck0U1do+7MoT8wpb9pSYByRS1f9zyPEgQk2J/9n
	arFVVM9W62d/4YaWORfE7gVMkb/GCjCHPX6Ex/4jCGeym7UPg3GXScng26/nY85x
	PdBZIcB+dOexJbebuSeiTjINWgB4vKeXtVlLqdAm8GzZHQm/GCqFloIlXwTcdn0u
	StqcqimXbXI19xfe2W/a808Otw+/kkeO4nG5MbBgOH+c2VeIdWx2Bga48ZY2Afm2
	ZwxzW0KivTKL26iinFnCjQesZwyrHkoEDYlkpw+EwTok5q898AoB3vywz85Tswec
	/LvJc3X4uwnoY/oI9BbSfwDFrHKjqXayb2aT9rUzb7oUAQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hppfe999e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 02 Nov 2026 13:23:41 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-91c0f73807eso39493766d6.0
        for <devicetree@vger.kernel.org>; Mon, 02 Nov 2026 05:23:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793625821; x=1794230621; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=g1dUytA+EdoDg+Eu6pKR+9XMzqtgSGYZ7n7ArYD1v7g=;
        b=CqreRL9I+wRCvzeX2l215BXXJfh6xbfK94yjDT/SLQBLzZiJeF9FZ+I6FEKMSdWSdb
         Cv7lByYF3lnoK7s3dFjf5yiFPyarinQG7oEfoJRqT/fwfXctM+cd5SjUKx2ZME3jc9zf
         PraWayYXEKA5S97c2e5rxCNzBQdhTqqwtVyTl11Yl+RBnqkmCTgd1Qomm7Ooy8bSncib
         KYtG++APEPpJJ1TE1CtPIcR0jI6uLOqWe9poiek9Q5rbne+eU1DumBW9bod5ybTC4dVx
         XrYO/Vyurq27w8iwGfSldsdoI0Gacv48Irq77roWVJUKJvNSedq913yOxWTcY75FUBfR
         +V1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793625821; x=1794230621;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=g1dUytA+EdoDg+Eu6pKR+9XMzqtgSGYZ7n7ArYD1v7g=;
        b=JeXLdQkdWurMVQD+ZXS0hOVmee2Ng7AU4ia93E83mS1ygS1iu9U7RJ0Lrv5W3MyD8x
         GJ2czCeeDcjlTJeg+EP7t5WyYODWNtylw8bXBJTfyxXF190L5MDnS2oPk6hNCDETb9q4
         kyEpeAD+91lHyimPfCt/iCWfOB1+49jEckmxDERaxO3DECGdfxdNl0XUt5abZQHLc4CH
         miDE0xa4zKibzUZpXevV3bZejfmD/GWejheHwgJ2CR5c/U1aBcQFmejUYnjpTPu4Nwim
         dTyh6XtIj0Yjn35u0TQvOQlcD+aZU/jo2SSZPunDuJp5qollZOmzKWKhoeaqz8dlo9nS
         3GdQ==
X-Forwarded-Encrypted: i=1; AKwUvByHVnyOlThkTKxJZzVRCmY/ijcjsJpZnOAPvvreZ4v8jXvkHwSJx/cMywIIBzvzIDkX/mEFfSB2weun@vger.kernel.org
X-Gm-Message-State: AFq9FYIoA1fckZGJfK1XepN/SSAy0+sSy4P7jMHHup+7foMwzDd+2vqM
	aTViYB9O7YnJiQtdmjqVEldTOTYtq77oy1iaxz414kwyJ/+7mUTKaOMWznzn/ylagKqqJecZKY+
	hL4hG+4YgHb0KpYLQFyYhhX00kqxGxWXTZqQxVQMG3YpgJnSpBcR1lPzhRYuiyW3/
X-Gm-Gg: AYBFou33JmU7VU/ObtZSBr+oRSjExajcYLvBPzXzJ3gKJARJG+ZcQqqTtdv+03rjf9q
	ljJ1NQ+6DfgxGqSK1JS8x34iXTowO1WnXS0eYi7pn4kqO7nOxhrpCWOQw+6/LApr18dlewrGM31
	m0kFzMFjwPZio7gbW5g7RarhoBGaXpNuzGofRGYqCPrFTHbZYf9ZBBolnv559mHQRTeHEL9uOpH
	SmZqJgKy2b0Mi/lHaSowz0+wDjL5lALfPCCrHCIpENL6ZdOGoNZP7fEYE1U5zrkjV50796zZwhd
	+f/TPGoQUlvvKYYq4auuz6DRlEdPGtwMzaWMNCVWt+7kuC6M8AQjW/h7V/znTl2N+SadIxPj0bT
	tETIYA+Aa5opzZNVN+2nvdGYW3gEJBeJFs7vOpycO9tmgJ37GUxlpDwZ9D9iuLjw=
X-Received: by 2002:a05:620a:3188:b0:943:ff70:dc00 with SMTP id af79cd13be357-9442174fc9emr1562603485a.56.1793625820698;
        Mon, 02 Nov 2026 05:23:40 -0800 (PST)
X-Received: by 2002:a05:620a:3188:b0:943:ff70:dc00 with SMTP id af79cd13be357-9442174fc9emr1562597485a.56.1793625819910;
        Mon, 02 Nov 2026 05:23:39 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ac0a0a3495sm217300315e9.4.2026.11.02.05.23.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 05:23:39 -0800 (PST)
Date: Mon, 2 Nov 2026 15:23:38 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Jason Pettit <jason.pettit@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] arm64: dts: qcom: add HP OmniBook Ultra 14-kg0xxx
Message-ID: <62dacxdue7uakeqximurvi556y2d6cosaxc3prrytneggo7x52@qxvwqe53bpoc>
References: <20260830-x2-hp-omnibook-ship-v1-0-9feada71dc79@oss.qualcomm.com>
 <20260830-x2-hp-omnibook-ship-v1-2-9feada71dc79@oss.qualcomm.com>
 <e4p3eycp7tmwugjdei7kyqt5rkrbd4ml3f3oiferqpfpxvnjfg@ildezttj2ka2>
 <20261101194525.4173-1-jason.pettit@oss.qualcomm.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261101194525.4173-1-jason.pettit@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=SeZi5fRu c=1 sm=1 tr=0 ts=6ae88edd cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=_gEsykP72j_chJFTmiQA:9 a=CjuIK1q_8ugA:10 a=ukwt756SXJsA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA1MyBTYWx0ZWRfX/2rmdwe/hCkm
 oxAriFUk2jl5m/hm+aQ/B4cn2dMzzYKBj28xm3S5oP44ubvsb+IgN+oz6XfH3FZp9Qb3ICiS8TF
 RdYYrSCmIEU6LMBJCCIlftMtEjzaw85EHt33RMJIiL5Lam6G+nMPo5CX9IQMJ+k1uHJGdSr9aYq
 zVWbKxRS3RzjMq/i68d6CYKxMivxugTmTFLYW/B8z7a09yQvyK8Sx+4Ys2tUfCmLd8ODEmSS/QP
 2ITeShH5j8sBypsOuTGZbO1vTiURgAh5Rvqjnlu6S0ThmAoGUcmgXMOkGYYaJSfspIRxfka7Yp/
 WL4G2sIciZ/3ZbvXiOHjgndzH1jO/sgxqbzFV7dPCwmAcyUpDF5gZcofS0JnUkl4scCSYkUSR49
 7YVDdOGs5M8VoyZ38qSPHg1I3/u0WUlOFjHDcPUDZHFt8SaSG2Z6MHnc0KadprRu1ObcsVsiTlK
 3OJq/g6KvKgNZReYq2g==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA1MyBTYWx0ZWRfX7kNo9S9TapL7
 WxBKngQDob+DTFl7bHPs5tlo/Ab0YbMfkCJwToRdkV47x95mCKbxTpu4kTPRpXy7QYGjrrH/9ZU
 fI2IFEFn0EK4qenMaFyHVyyNgWw3vfc=
X-Proofpoint-ORIG-GUID: udl3C20852BJpT09uwU0Ta04IsQZnwIx
X-Proofpoint-GUID: udl3C20852BJpT09uwU0Ta04IsQZnwIx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_03,2026-11-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 spamscore=0 bulkscore=0
 suspectscore=0 priorityscore=1501 clxscore=1015 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020053

On 26-11-01 11:45:25, Jason Pettit wrote:
> On Mon, Aug 31, 2026 at 11:30:52 +0300, Abel Vesa wrote:
> > On 26-08-30 14:56:15, Jason Pettit wrote:
> > > +&usb_hs_phy {
> > > +	vdd-supply = <&vreg_l2h_e0_0p88>;
> > > +	vdda12-supply = <&vreg_l4h_e0_1p2>;
> > > +
> >
> > No redriver?
> 
> There is no redriver in this case since this USB is an internal
> connection to the USB camera module.

OK. Thanks for clarifying this.
