Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3926F1F12F8
	for <devicetree@vger.kernel.org>; Thu, 20 Aug 2026 19:23:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787253841; cv=none; b=SxTLUBP3q0TEYOg7YPs4ZbnYnbGOdTO/fA7zl2S8caNOwj3EdfiAKZ/eDV2WsU5xKSpSgS0Z3l4O539QaHSwhvOYpZI5alfoE0RyUrnzh3ba6a8DSutUQFrTa8y7QbQjGdf50ZQ0cxXAhXGriZ9YUHk0FMgrUJdWvrmv7dvj628=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787253841; c=relaxed/simple;
	bh=p9R0n2/IZyPe/jmWZcKrvxz1ButSnBuCWyKFnF59Qq8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EurwcqU036YeE0+oQ249mgX1TFwuCSyBg9R8GPm6Zn89tjbIvNVNyqpWVjNlAhxOrSKKnq/IE2rOi9ojhA2wBIq6vzwxPOHzM9EzTtfR1ipTy3Fp39zJF0TqdNQyOBSOjx9iik4zYiSCI0ZLA68zBGMJdBdgN/kBKwWhSfXoahM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LXhvu7iM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=S0krfz+Q; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LXhvu7iM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="S0krfz+Q"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67KIJNii352530
	for <devicetree@vger.kernel.org>; Thu, 20 Aug 2026 19:23:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=3v5shSwVcXbQY7glP5SzAy4L
	VwnmHAwj2jeagwqbKeE=; b=LXhvu7iMoMFTgDo6UYF4WrY2Fs7bDx+7qQtnD+K/
	Yr7SmT4awGLvvdrtyzvmI6TRYovFpop7ZpCX4hreTq72q8C8SpbXyLGCW4Qsvpth
	9mttDd/fc/s+8osnrKPZjO8HJdWEKnG+Pv5GzImHQo8J8Tp4e+K3DYiCSWz90F8b
	N7wTJnrWYg8oJWwwIMg0upj/uF0qRkX5WJLfxUHKkIdccXsekItg95kCITaPyFcA
	BSeMuCjUDKO95q9IvSCijWUnjR06ptVbSJ/jc01SUKUP4eYcoqyBLCLVOElA5Prn
	qhshsxDfcow+X8Euk5YelSheGI229fOV9N8dhV3WDEkPZA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g5yg8aj0e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 20 Aug 2026 19:23:48 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38e475f83a2so251871a91.1
        for <devicetree@vger.kernel.org>; Thu, 20 Aug 2026 12:23:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787253828; x=1787858628; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3v5shSwVcXbQY7glP5SzAy4LVwnmHAwj2jeagwqbKeE=;
        b=S0krfz+Q7EvUuD+WIxVcD6Kj/5NG5nCubg+djdd66fEvud71v3phZsf29kKOw2dyJN
         t8oj1EknN9ahhMny+tuZU/oRoR6znYM3fBQnlMXO2ju0psp6MV2+dJWRo5n1YGBJVb8z
         DYjyYwIHNtBDRV9yE4dEeb2OIcdjrM1o00FJ8OssCv0EKxCI8GqviAWNp48olNGMx+5p
         2Zvst7xxN9c0VsFagNX9pUokIC/Z8DPAZxMjJoGb7a6gS7iaP7GcJA/d3aJI9vxhWkd5
         yUBcHqeNKMjWnlkWCq+qh9EyZkpVGPX+/AMaePl/K7vKmwtoNijLCakocUeszREdwhGo
         Z4zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787253828; x=1787858628;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3v5shSwVcXbQY7glP5SzAy4LVwnmHAwj2jeagwqbKeE=;
        b=HCsqEwvREymIEi6HaJhXi8NBIqx50Hm9PGXBv97RkksbBJctqWfDhDnixPWOdQ05Cv
         PHJAwP6OcJ9H5ziBhrS7Fb+gmS0hOfCZJPnTiBlxTRwjaKJStI23xUDo4R38tczZWTrX
         GKhIDmGJ+G0whPlkLVHcWgNEz0V2AaoH8guHdnJxqy8p6JUJ/rH82z57ysmvDc47Bv12
         xBHt/+Gz6bzL6GOr1IsxwEiRzyYbg0tQ+L5kGzpraNFmaR743/8MvM3/sl8gKeIRYVty
         DGeEc8E6qZ56i+TeHBaKUdckXImAHLbXfdrsYFpF7JpPXmFkqB7sJ/gVdKV1BBEspOhz
         fbhQ==
X-Forwarded-Encrypted: i=1; AHgh+RouXF1VIBpi3DnpMkxYAmtso4iljPIeb6OpDMKOyGBVM/2nUsuodRecomk0rqxaxjJs9IlGiHLb2FJx@vger.kernel.org
X-Gm-Message-State: AFuF++nfVw5DPqwZ5w6T6UCB9zs8f4Uu81lpcW76O7fcLL+GQH8NbYsE
	7vCGArGLWd71s5eZk2UMXvMMeF2dF8I5SbFBVGcGpMKhKymQCP7uaLnUy3QFmDvV+qlXkWEUQ/3
	bo85w4549NJezT731zO/oAtllBl6a85frLhkE3g+mf7S1GR5LKUHGNM4Y+xfea/vE
X-Gm-Gg: AR+sD13/Tpb7kb6qN3CzmU3psu7O10rOPLTg2AVGFc3MDI9PzmMinSiH1sb/uPYzzlN
	Q7IpjsORc3QSN6C6Fkx1RZSZ1oxVMI2UxSbazrtiEKLvFBJSrUmOCEwQtzqYszpIG0Q0R/ukPou
	02CD6sIegW/Gz6wixM0RFmMOQ6SoVP0dmiwjnkk8NWtsneepZ/qN1N/4eoEpGZSv1Eb7puSc7lh
	opUgVWzjcw/g+C9x+ZGymyS/FmYJoHPeMCVtkdevqTcgbyysRkzKL+lHdcZLlAAJIJOQrmG5leL
	nVpr/N3JuetFpfpKsrdOGczkbeisKdy3BstEd3Q3BVH/MQC5fKgfriP3gxTm3DwHmaP0e+ugBYc
	HXPZ78KViXJIyPlqyt6eNiEW6kMQMAA==
X-Received: by 2002:a17:90b:3d8a:b0:38e:6d4c:14e6 with SMTP id 98e67ed59e1d1-395c33daf0fmr1571251a91.3.1787253827618;
        Thu, 20 Aug 2026 12:23:47 -0700 (PDT)
X-Received: by 2002:a17:90b:3d8a:b0:38e:6d4c:14e6 with SMTP id 98e67ed59e1d1-395c33daf0fmr1571173a91.3.1787253827145;
        Thu, 20 Aug 2026 12:23:47 -0700 (PDT)
Received: from hu-kamalw-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-395c49223c3sm107481a91.11.2026.08.20.12.23.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 12:23:46 -0700 (PDT)
Date: Fri, 21 Aug 2026 00:53:41 +0530
From: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
        linux-rtc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, Raj Aryan <raryan@qti.qualcomm.com>
Subject: Re: [PATCH 1/2] dt-bindings: soc: qcom: qcom,pmic-glink: Document
 RTC client properties
Message-ID: <2yndadk6urzktzbb4mg7rhnywb3lxi6liuw2afdee6tswhnl6h@tqvt3n2r4qkj>
References: <20260807-rtc-glink-cleanup-v1-0-7801e4d69c4f@oss.qualcomm.com>
 <20260807-rtc-glink-cleanup-v1-1-7801e4d69c4f@oss.qualcomm.com>
 <anUemwQJgHJP7iOS@baldur>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <anUemwQJgHJP7iOS@baldur>
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIwMDE0NSBTYWx0ZWRfXyPYq8YI2lGCX
 h5SMzVO1Vcz1sNIGz0RAOqbvpq6ityR514reAXiqOhprPY4uW3hnRBNP1WWzfJNmW1bQ6g2G9oJ
 4st+zbvznrvFKIx5NW3ywmVUDYkREtQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIwMDE0NSBTYWx0ZWRfXy83QMRhu2oi7
 vYql3q7kY8CXw6pikx4pqIfdWpvViJwJYrRcio/YqRb7Uj2ruK5iIxD748RmulCEqa9QeG3dlSJ
 /3kVVLkjalucHTBkA0+HlF9B2pE4F+Zftkmh6pIcgNjR1CEkUOU8AuumLpZ2XRb+8Eybw6ZHPmX
 jY6bjPdNC5hkTJ/GmDtmqjDjmZUf+QquY2LitZFVrbcEr33qffClM9Ex04cyiWIIezWWkkkgrch
 Pak+SRIEuDWNmIfFYl6PD9K1+0iSyrCD2Ahy4NfuJl0UQtDdCuyCJ4dNazQUd98TcGEUvx9nEFb
 v3aZHDGfhfrK4gaIGR4USiC8i3qRPaAcPtbuoKBR+DbW9x1RqgzHVeo45t9bc/7/27onbpe+Sww
 53KUpg7nhqNNQ+gBI1FqWGiSvbpS5ec4R66F4epUoexDC16bW6Ny+Vcko0EN0j/ql+0FNUe2jxf
 nfx2kvsgWQonJxwz5oQ==
X-Authority-Analysis: v=2.4 cv=Y7/IdBeN c=1 sm=1 tr=0 ts=6a875444 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=nd8GiHU6-Hv5HswjJXAA:9 a=CjuIK1q_8ugA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: JjcfwZNJDoBD5VEF_r8iqXtkbxBVCkLQ
X-Proofpoint-ORIG-GUID: JjcfwZNJDoBD5VEF_r8iqXtkbxBVCkLQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-20_01,2026-08-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 clxscore=1015 phishscore=0 impostorscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608200145

On Thu, Aug 06, 2026 at 07:02:44PM -0500, Bjorn Andersson wrote:
> On Fri, Aug 07, 2026 at 02:26:30AM +0530, Kamal Wadhwa wrote:
> > The pmic_glink driver can now register an RTC auxiliary device on
> > glymur, whose PMIC exposes an RTC over GLINK (see rtc-glink driver).
> > Document the allow-set-time flag it consumes from the parent
> > pmic-glink node.
> 
> The driver functionality has no relevance to the DeviceTree binding.
> 
> The binding defines the contract between the DeviceTree (DTB) and the
> implementation, such that the implementation knows what to expect from
> and how to interpret the DTB.

  Ok. I'll rewrite the commit message to describe the property itself
  rather than the driver change that consumes it.

> 
> > 
> > Assisted-by: Claude:claude-sonnet-5
> > Signed-off-by: Raj Aryan <raryan@qti.qualcomm.com>
> > Signed-off-by: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
> 
> As with the driver, the author/s-o-b chain is wrong.
> 

Ack. will have it this way

Assisted-by: Claude:claude-sonnet-5
Signed-off-by: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
Signed-off-by: Raj Aryan <raryan@qti.qualcomm.com>
Signed-off-by: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>

> > ---
> >  Documentation/devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml | 5 +++++
> >  1 file changed, 5 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml
> > index 16ad4f5698fc..38db1ff473c0 100644
> > --- a/Documentation/devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml
> > +++ b/Documentation/devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml
> > @@ -79,6 +79,11 @@ properties:
> >        - const: charge_limit_end
> >        - const: charge_limit_delta
> >  
> > +  allow-set-time:
> > +    $ref: /schemas/types.yaml#/definitions/flag
> > +    description:
> > +      Indicates that the setting of RTC time is allowed by the host CPU.
> 
> What property of the hardware/firmware that this describes would cause
> you to set or not set this?
> 
> Also, what would the expected outcome be if I declare that my Hamoa
> hardware has pmic-glink with allow-set-time?

Actually Hamoa firmware does not support it yet, so it may get ignored.
but if the support was present, the writes will cause the system time
to go bad, which relies on the RTC time elapsed during off state to 
calculate current system time, incase network is not available.

this was used on rtc-pm8xxx.c driver as well
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/rtc/rtc-pm8xxx.c?h=v7.2#n622
 

> 
> Regards,
> Bjorn
> 
> > +
> >  patternProperties:
> >    '^connector@\d$':
> >      $ref: /schemas/connector/usb-connector.yaml#
> > 
> > -- 
> > 2.43.0
> > 
