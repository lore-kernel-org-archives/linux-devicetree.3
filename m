Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792491949;
	b=RnHNSRBP6GTA9NeOhA0ZAGY1CRTpLXnJA1YuKriTy62uLDBMj6de/Vcw943U1rOGQNO4
	 mmIGCKgUpfXH8dPAL33kLdjnfQI3sx0fh4RiNwnmRO3IIq8S+EfvGPssgUNIoQ0nMhAER
	 blwt5aCPl+SGfUfR9OUyWfRAmqAIx5xBq2IZSGY7KbrL+ckO7OHyL4IZTXmzrpSsUQT/S
	 vV80RbCx1ZnbQwMLGak/m1gQJbr2MNow3ATUO2/TEOeqS5Jse+yLWKInab2TA3Lqi77fj
	 ZmzOOLHh5axe34NP9ZZ5nHBNOTheuiE/EgptTQVkBmZtwoNj1Ah47SsV07dbxFYZiQA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792491949;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=mLeqBaTgJ20aTc9spiaAIGrYYecfKuCtitYoCZ1tdAs=;
	b=Z7u/iHCa23xgkLV++utbi4PB71P1PnJRlvMsXBNJbbi4vonwtvXPVHjWSYBipac7Yrse
	 WMXMDLUQK5k8HgxVtIA9snvPVctD2D/A8dR0StnZqoxLSRyIJp2/hFcBZj5psSKUlCMlq
	 kYinfyr/Xn8lT6T2++2lgZ9fgkyrJV/edIqYZVngNtePRzHnV8mNFi+lTVYMrXtnFeaJg
	 ouoeYkR7PvYZl7+WH8Vzvi3RmE7jmfPYPDdsfHKrBdVzexSKYhvAA8XvxpthXMfmmvHg8
	 XwUXQb1SKxyS+Bb0KeJ/M+UnYSy0/QoxtVU+H/+fmzjAvoqT4RF8V+GTlYF4NeEabuA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Cb56eWOg;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GeZoGGJL;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20DEE606A31E
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 10:25:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 20DEE606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Cb56eWOg;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GeZoGGJL
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69KAKvVw1366161
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 10:25:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=mLeqBaTgJ20aTc9spiaAIGrY
	YecfKuCtitYoCZ1tdAs=; b=Cb56eWOgfpOLdx2wuarL92jytqocs3Wb/IfJOJ+n
	ywjf2DWmupscEzijhRAnP6mg7ec9w3B5lX+tRC48KQdVtWyDOGoUGs6bUMdHmUNx
	E9MgKujWpKCGjKkN4u72lnhw1jmpbgAUOhJj98MsYazjPmVxB5JdDYXbSAWYuUPJ
	dWaIFAFZUzURTS/f4hvRbq8MVes9C2u8XH9bI+PNuE3WNNZMadp/3qanXmyU4OKn
	EWBAGspfIVLzRJkpDfDX1Ybd8MX/6rG45XyFFkuFJ+lIycMkyH6lmtg5GSp4LlP3
	P+XxP+ckB+J5FhfkQiqG2AoHoakxbHFt7ONkQuE0Gx6c1Q==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5n228g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 10:25:48 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f33438950so802171485a.1
        for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 03:25:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792491947; x=1793096747; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mLeqBaTgJ20aTc9spiaAIGrYYecfKuCtitYoCZ1tdAs=;
        b=GeZoGGJLsbNN1cpmEcUUMWC79peGPPdwgL4jctkKkxspURbnjKGxv/Pc4oeoHvDJcW
         a6/CC5zfpuSVxsY+m3F0oUHWKpw4GIAjLSKHbB1pJ7/DC8TFWkFyEp5nX0ZooUg4lQW7
         SF+hdYLEBQ6d8v9923f19OY3E+gk9Y7QfoxdHRa07jb37f3luNttYkDenlvDaEwKty4Y
         H/A4sx4+K8e0xBdXW1LoA1kC/KpYpBLQi5PajQ3tCFFnepNaybRruYASgZslvxvaiiM8
         hBDrrCtOYw0yXLPnqKp8qebdnj7NfK7roDW9LkaC9hAtooA4hyyx28EBUg5ErtuOD1Tx
         xegg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792491947; x=1793096747;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mLeqBaTgJ20aTc9spiaAIGrYYecfKuCtitYoCZ1tdAs=;
        b=y9vcqT4KUXEadpmdyhI8JPPwQsmxyb3HK4NSnTVS4b8YC0NvOfVOkb3hLKH2YouRCN
         h3wH5OwncUvc4pLVtbunMUEPDj8JLk+GAEUH+M0aKChBhRDebUXOR6Z8Jmo52S7DSu8z
         hgQuqKZzW/RsFzIL3RQj8N4z4Vieru1WM8xOkkEypSEKnwg9C3pgJcKtSvuUWKpilrFC
         UAE3OwHp+PB401BkO7i+bOULSmR8HzvFTGzNRv7F/3OWFOi7nwKu+oPAYOQ8S+a9WyMK
         6dYkT5iZwfYJc/Oo2iCxL052KZoHfsTsT1FrC/HTYdMlIH5sYoo7ApW14VikMxzXlHVX
         DyFA==
X-Forwarded-Encrypted: i=1; AKwUvBxgYzBZhpUd2ehSzVDESINwBD0rhVGfw0B74/S+ZzBVBF0x8HoM0wnzl0bfuXzOBmmH6Q8Ws6vHj89v@vger.kernel.org
X-Gm-Message-State: AFq9FYIOwmvVG3QH98Aef8k7TuBKZXEIgSP/IXFTpW7DRUsJqTy2YOoX
	2xDNkOuBW7u2K5p/3xaxxNzMI9dwtFzsCxXX/teAUSmJRnmGLYIPDMXq9IuiWVk4MDfg6ieAdAq
	grTmMW0X8bIB2LH5Eziu8t6em7N2XaccVxVM6QJq0rhrf9+WIk5yf+R6phP/sfUzX
X-Gm-Gg: AYBFou0X7RkuytLLib/kQU6E8lg29j2mDLKTdW/4qlN+FdTqMqpm4ofP4Ba8Aagog0h
	213RLTzo/aQAGL73vsTlg3icWGDqswNpA53bGUcx1BzC5Jcw9NtEOutCAXmzDJsf97+2YJHzhKh
	y+2qDmsmzWQ5KJm9fKKvf7wG5FITSRHuTNE4I0t5C37Zg8eLiUciRB8oVvKRI9qHYQO3MwaYBqe
	JzhocIlA8oSAtCZoJEhun1vBg5F85u8vYYuehqKLXOvLmZ71xXBpjFWeDIvKyaTXZVwwq3wWl42
	i7vuDcaUyNYzScbDTKYI4CmA2A6hxXQXDFyId9ClHUxtK15rlqIT08o9adVFhdOYaAWHWVd3OZE
	/sW/mk/V0yFMOdrztjQpk7uVGSfnmjl/K5uQUd3uG9BFI6GnSbcOyRtkS/eW1IVDS6xmTY0xWFL
	NVu6982R1ToeyT
X-Received: by 2002:a05:620a:6019:b0:93f:38ee:68b9 with SMTP id af79cd13be357-93f38ee713emr1081444185a.28.1792491947395;
        Tue, 20 Oct 2026 03:25:47 -0700 (PDT)
X-Received: by 2002:a05:620a:6019:b0:93f:38ee:68b9 with SMTP id af79cd13be357-93f38ee713emr1081441285a.28.1792491946837;
        Tue, 20 Oct 2026 03:25:46 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ab20a8b3a4sm28145191fa.1.2026.10.20.03.25.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 03:25:42 -0700 (PDT)
Date: Tue, 20 Oct 2026 13:25:40 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Del Regno <angelogioacchino.delregno@somainline.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Andy Gross <agross@codeaurora.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Shawn Guo <shawn.guo@linaro.org>, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/8] dt-bindings: interconnect: add Qualcomm MSM8998 NoC
Message-ID: <guychj77ohhlnhzw4bcgglcfiwyppgt7wzd677smjbd777kmpv@s4bclghi335b>
References: <20261019-msm8998-icc-v1-0-c2da3934b6c8@oss.qualcomm.com>
 <20261019-msm8998-icc-v1-1-c2da3934b6c8@oss.qualcomm.com>
 <20261020-daft-competent-saluki-a080c7@quoll>
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
In-Reply-To: <20261020-daft-competent-saluki-a080c7@quoll>
X-Proofpoint-GUID: mZyhoz2h1aPnQ28SNp__2qYDrlcJvLmK
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDA0MSBTYWx0ZWRfX2njj3l0xZgon
 cx8x2cY//hGOtZO6oCEewcplBIh73rwFaDSPIeZfb9cMZOpZo/il+SnyRekDuAs+kMPzRBAKyvR
 jgMPDuCv59QKC6BR4qZ28uVpnfeA9SE=
X-Proofpoint-ORIG-GUID: mZyhoz2h1aPnQ28SNp__2qYDrlcJvLmK
X-Authority-Analysis: v=2.4 cv=A5z5rKWG c=1 sm=1 tr=0 ts=6ad741ac cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=NwY7b9YWZjBNx-CeCFIA:9
 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDA0MSBTYWx0ZWRfX7n70dGNOx9Kc
 H9NA9FLN2cdVekIwzy1gzu0YosAeq/BWnEUSi21Y8T5PZC5M00Rz7w1RxFUjpJs1ArsXAOGepJ/
 rutFJXPWAbxSoma7helZNHXp8F/BOi7axnzT46rP4OXFrFKaZy8it5dhgou9e62PL4mOFOkUlxX
 04+ETCiPPJsLPXDrvGI6gGZnTd+/HK1pGkt0Aflm4LBapDiL/htERVPKnEIO1cqk6mXjLVThUkK
 evHMdlw2TdCCf8vpBNsL3AwZwspZ5gU/bSUhut4s48ZrE/PQH3FS8sfkE341iVpZZ35YN1a9+C1
 DmEmZNWyAdlN1qQ5sgRZPHm2KO5ZZgYwm27oSvZJ64dHr8AQiuBZHlR3IVzgfPbzxHEyOCbb45p
 uFOFS3pqa1QqyqtPnPDBgmgYfRoQMs4sca2jdLYt7HDKtbdo9CFLUlJHbiXA3uLOjZ99/5eZgk7
 knBPTPGsVIHH/k9Xn7g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 adultscore=0 priorityscore=1501 suspectscore=0
 phishscore=0 spamscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610200041

On Tue, Oct 20, 2026 at 10:24:24AM +0200, Krzysztof Kozlowski wrote:
> On Mon, Oct 19, 2026 at 05:12:39PM +0300, Dmitry Baryshkov wrote:
> > +properties:
> > +  compatible:
> > +    enum:
> > +      - qcom,msm8998-a1noc
> > +      - qcom,msm8998-a2noc
> > +      - qcom,msm8998-bimc
> > +      - qcom,msm8998-cnoc
> > +      - qcom,msm8998-gnoc
> > +      - qcom,msm8998-mnoc
> > +      - qcom,msm8998-mnoc-ahb
> > +      - qcom,msm8998-snoc
> > +
[..]

> 
> > +examples:
> > +  - |
> > +    #include <dt-bindings/clock/qcom,gcc-msm8998.h>
> > +    #include <dt-bindings/clock/qcom,mmcc-msm8998.h>
> > +
> > +    interconnect@1008300 {
> > +        compatible = "qcom,msm8998-bimc";
> > +        reg = <0x01008300 0x77d00>;
> > +        #interconnect-cells = <2>;
> > +    };
> > +
> > +    interconnect@1740000 {
> > +        compatible = "qcom,msm8998-mnoc";
> > +        reg = <0x01740000 0x10000>;
> > +        clocks = <&mmcc MNOC_AHB_CLK>, <&mmcc MNOC_MAXI_CLK>;
> > +        clock-names = "iface", "mnoc_bus";
> > +        #interconnect-cells = <2>;
> > +
> > +        interconnect-mnoc-ahb {
> 
> I do not see how this can validate. You do not allow any children in
> your binding. Your tpo-level properties should define all possible
> properties and nodes.

This was validating because mnoc node explicitly allowed the children.
I'll move the declaration to the top node and constraint it separately.

> 
> also, name should be just "interconnect"
> 
> 
> Best regards,
> Krzysztof
> 

-- 
With best wishes
Dmitry
