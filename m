Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DD7E34251B
	for <devicetree@vger.kernel.org>; Wed, 12 Aug 2026 01:21:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786497688; cv=none; b=ejIYh8DfkKIdpQ882hQgJ/1AxA8H7Ge+n86TzLO28IAlbZhqDN81I6vKJVdMkAQ5tOOQIGuRMM2+V9iPOqVVzfo6plMRWEWSY3IH3DxlBHFRHsleRqyozdLJ29KM+zXiACPyJkVl1hozRzOH6CKZhs6QNfnXr9T6f8NLgq+Wkng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786497688; c=relaxed/simple;
	bh=9UYl61WOmOuArFng3Xrwkw7uxon5EPQbUBcRNOj54pI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MStGoI2dgqi0H40TsS2DUoIXl1j+82Pi2ZTftn9XN/ibzgOs7FYzUI4Ev+5w02dphgDh991/B6Kp/rX1T9EJcolbIqqL/nuoa1Y8akweTZTx+wwdryDoz/zHz470EromJFkZE/Sy+v5Yv/Ks1S/7TcEMgRpNOcuSnJDq+zoIFI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=icWBn7Aj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Z0ny01Vw; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="icWBn7Aj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Z0ny01Vw"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67C06eMx1410097
	for <devicetree@vger.kernel.org>; Wed, 12 Aug 2026 01:21:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=5a3XBzcMA6vkW7LRI5Be/dhO
	NOD7PfEohmvAk5RCvEA=; b=icWBn7AjaNso3Q5fLbRB60DIvvB4jGkoxD+iaD1y
	HsoPnruWyxwSx0LWxjhJyQZL9zY4cRC+RefHozoMGSUbLZZOL01rq6BsNCpZqvTu
	535BhWfUnxNbop32+0SCi+DPmNeHZMHN2sD7UseyFJBVsMo/lIlUZAK6fbkgyoiM
	Z8qsjhSW7cTAxDK/6E/gdaNVG+BDJdpRJSzNU+wg0rhzvqwnKBLRQpXpbVBdKcbb
	TffZjgB2ne85pASICW94OvfCOwlDI3HtzLKQP8eh4h5MKflMeyWnscVnUOSZidnO
	ggw2S/dW7fPz45aUG0BW+fAvCK3fXqIwTyPEFRIE1QzUYA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g049g2ukv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 12 Aug 2026 01:21:25 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2cceabd70f5so13472465ad.1
        for <devicetree@vger.kernel.org>; Tue, 11 Aug 2026 18:21:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786497685; x=1787102485; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5a3XBzcMA6vkW7LRI5Be/dhONOD7PfEohmvAk5RCvEA=;
        b=Z0ny01VwH0G7nl28K8R0UMnxhrXFZvsq8I9FLJkKkbho3HmEypcpI7AAgJKO3bXctc
         sVniy3ORN79ktKnLmCoobF8W1Fx2S+vS3seJoFtkh8wOPJ7Sc1azFO9omfxk9XHM43+/
         lStbr/3GfY95K4PfE0PkT9NIQM5DrGI/dW56asXNKf+vn8ueDxsCj9L21NXq0gxFamAt
         ZZHcTkJubuHUbB6Dm3/jB6ZG++lCgLGWgs4DBioEI7WmqAs00JQ6pbkpzWDk4GPUKAPR
         8MWnsAb+Q4uEZuDBOuc1DnqFBWi+P1SwJVyfajuijfZxxY/gvCyVcb0FE21F8rbaCapa
         0SvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786497685; x=1787102485;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5a3XBzcMA6vkW7LRI5Be/dhONOD7PfEohmvAk5RCvEA=;
        b=S8NtOcuzawMH4GW6DDFLsT2FUaTN0/D8cRnlEBuYQT+s2M1VwHBINThpcSopbuWQh0
         DjIkig5rhIF0gww8xfxHexIoaqrMS6Hvhqe/fTtAgWRhZkxPFz4+gu7USioBNtrnK5pU
         VYPNU+JC7GzclseFrXbuDN2TQDakatmE2ZheP/U0UVezVEFampW5PtXDmzSWZ+JEs+Cm
         el6UBvY4Lv3iOFm211Wo8JjFeh0sxWL3iV9X6ucPlz44P6hjiDzwAuKuStByNf2VlQCY
         v4u7FHGkquA8kPhynbGtbdZo7T8qf9sKmKYyZDGQotYOP4nr87qEsNRREYgf90DrSTE+
         cBMw==
X-Forwarded-Encrypted: i=1; AHgh+RqUenfj0v6mkwQxhUGdyt3FZ6f+LTF6TweLz/g7+qGqrGqXOKjTPY7axCVo4KYEyMUd5opXp8OqZNsZ@vger.kernel.org
X-Gm-Message-State: AOJu0YyGbkUMA6EaBIW+pVpAr/Atd7ICr7cq/chxRR824amsXogCb1lb
	+lvwLx/Dld/mTXQhbvnZ4QsWyFEmzrlggSumX88MDVnERbfr5BtI92t7vvSzMxVIvW2ZOtUng/h
	8nDgbWckhyX+LLLdnGN1//Mcqg6j5PXifdWaFjzH3laZkaR4xfIGo7UfWl09VEjU4
X-Gm-Gg: AR+sD13IOvRXNsf1BeXK83SVxitdMQhOuAva23+Z9BqxaQDjoBUdho3HiLzT6kuf1AM
	uRDc+Q8CR9fZWPEzuMENrrkTnzOGPfCGbx0I8mKLzgsBz88oiIEEJ0kPXpwEC62hMHWSdyIPxtY
	SI0GoYDDcbIsdyn5w5xABBxkXKA7wHnItlAPRoFR6/yxZVHKafaNvQHJRf8q58LJ4RBAGpnF0u/
	sgdv7FdIv0mzNS/+oBG+ywzKIQOXPmxb9IcksbsuIC4UXImj1gdUHMcL2kCwT6jZ/WwxMiYm6kf
	1MwScb8otTmNEFvF0dudsLwWTp1AGSExiKZ/CbDOQfJgDwIhK13nx/MayHoGvuQnD4O3T+cP0/C
	QvXMbemMV9Bt5H6CZBSYYPVffYmTKsjfMnYshH7zf9eobm0JEQB3sOQ==
X-Received: by 2002:a05:6300:95:b0:3c3:b57b:6285 with SMTP id adf61e73a8af0-3cc3f5cee4emr1257773637.13.1786497684840;
        Tue, 11 Aug 2026 18:21:24 -0700 (PDT)
X-Received: by 2002:a05:6300:95:b0:3c3:b57b:6285 with SMTP id adf61e73a8af0-3cc3f5cee4emr1257699637.13.1786497684277;
        Tue, 11 Aug 2026 18:21:24 -0700 (PDT)
Received: from hu-mdtipton-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31cf3624c6dsm5983243eec.4.2026.08.11.18.21.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 18:21:23 -0700 (PDT)
Date: Tue, 11 Aug 2026 18:21:21 -0700
From: Mike Tipton <mike.tipton@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>
Cc: Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: clock: qcom: Add Hawi camera clock
 controller
Message-ID: <anvKkfkiWEGk6ODs@hu-mdtipton-lv.qualcomm.com>
References: <20260723-camcc-hawi-v1-0-7057658c5c47@oss.qualcomm.com>
 <20260723-camcc-hawi-v1-1-7057658c5c47@oss.qualcomm.com>
 <20260807215046.GA2074060-robh@kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260807215046.GA2074060-robh@kernel.org>
X-Proofpoint-GUID: kUHC9SdAh6gDK_2E5lOFKjAEUtNGEe0b
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEyMDAwOCBTYWx0ZWRfX9r90CZamfzoX
 CHcsFQvez06GbU1MV/7h+3IkYw9/XILlbdyHp0tqZJmOPup0x91e9dxKO+hLm7dR5GQKGfvJ4HK
 1j7GAHyaDkpTC64IU3GtZAP2KJCwuio=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEyMDAwOCBTYWx0ZWRfX4WXR6obzehL2
 jpRLu9LAKivexk/9H6AqH97kSs5zNeG9xHCQJlhXAaJbbYoD2E9wcNTDpgNMCEtTuMXXkVnpQbR
 KlNDNXM74KAqUDED8KrbDSBEDhNLdPXPMpKaQwLxLE1u/vGlEwAcxPl4jeqSeEv2GdNcXZ2LXSm
 n4LA2h1W8AX5FC/VAuYrikaY/QYz20G2Mp7+KpTPLMO7/SsFNwIQJTJSuaO7VLmoDLapxuDN9HM
 yPsxX0znu+x71dhV5j/bWTC/f7qndnhN5nmiiGGe0YM6uuLOKeujiu+EKADkQ/YhKdNa/q20UEf
 6asaPswtXcgdQnGaPrS6IoeEMNxa982IeEOCy3XI33BsOak7UAAkySjxD4GVyptmcoeoghHCY+5
 rlkbrjB6iTVvJBVMNIok5+q7wAQ+rrimMPQ5LD5E7Ka/FhLq9Iqtc3dB/TDhsk5CrDO14reczP6
 04/V83/5xEdUIetwRug==
X-Proofpoint-ORIG-GUID: kUHC9SdAh6gDK_2E5lOFKjAEUtNGEe0b
X-Authority-Analysis: v=2.4 cv=LIRWhpW9 c=1 sm=1 tr=0 ts=6a7bca95 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=ln3hM7--VPYWvVz1xlgA:9 a=CjuIK1q_8ugA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-11_06,2026-08-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 impostorscore=0 bulkscore=0 phishscore=0 suspectscore=0
 priorityscore=1501 adultscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608120008

On Fri, Aug 07, 2026 at 04:50:46PM -0500, Rob Herring wrote:
> On Thu, Jul 23, 2026 at 02:38:57PM -0700, Vivek Aknurwar wrote:
> > Update the compatible and bindings for camera clock controller (CAMCC)
> > support on the Qualcomm Hawi SoC.
> 
> That's obvious from the diff. Explain how the block is the same or 
> different in Hawi.
> 
> > 
> > Signed-off-by: Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>
> > ---
> >  .../bindings/clock/qcom,sm8450-camcc.yaml          |  36 +++--
> >  include/dt-bindings/clock/qcom,hawi-camcc.h        | 165 +++++++++++++++++++++
> >  2 files changed, 192 insertions(+), 9 deletions(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml
> > index b41247b257b1..cdc19418c064 100644
> > --- a/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml
> > +++ b/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml
> > @@ -16,6 +16,7 @@ description: |
> >    domains on SM8450.
> >  
> >    See also:
> > +    include/dt-bindings/clock/qcom,hawi-camcc.h
> >      include/dt-bindings/clock/qcom,kaanapali-camcc.h
> >      include/dt-bindings/clock/qcom,kaanapali-cambistmclkcc.h
> >      include/dt-bindings/clock/qcom,sm8450-camcc.h
> > @@ -26,15 +27,21 @@ description: |
> >  
> >  properties:
> >    compatible:
> > -    enum:
> > -      - qcom,kaanapali-cambistmclkcc
> > -      - qcom,kaanapali-camcc
> > -      - qcom,sm8450-camcc
> > -      - qcom,sm8475-camcc
> > -      - qcom,sm8550-camcc
> > -      - qcom,sm8650-camcc
> > -      - qcom,sm8750-cambistmclkcc
> > -      - qcom,sm8750-camcc
> > +    oneOf:
> > +      - enum:
> > +          - qcom,hawi-camcc
> > +          - qcom,kaanapali-cambistmclkcc
> > +          - qcom,kaanapali-camcc
> > +          - qcom,sm8450-camcc
> > +          - qcom,sm8475-camcc
> > +          - qcom,sm8550-camcc
> > +          - qcom,sm8650-camcc
> > +          - qcom,sm8750-cambistmclkcc
> > +          - qcom,sm8750-camcc
> > +      - items:
> > +          - enum:
> > +              - qcom,hawi-cambistmclkcc
> > +          - const: qcom,kaanapali-cambistmclkcc
> >  
> >    clocks:
> >      items:
> > @@ -67,6 +74,17 @@ required:
> >  
> >  allOf:
> >    - $ref: qcom,gcc.yaml#
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          not:
> > +            contains:
> > +              enum:
> > +                - qcom,kaanapali-cambistmclkcc
> > +                - qcom,sm8750-cambistmclkcc
> > +    then:
> > +      required:
> > +        - '#power-domain-cells'
> 
> This makes #power-domain-cells required on existing platforms. That's a 
> separate patch and needs to be explained.

It was functionally required already but was never documented as such.
All the pre-existing "-camcc" compatible devices register genpds for
their GDSCs. And all these camcc devices already include
#power-domain-cells properties, so this change shouldn't cause any DT
validation failures (at least for any in-tree).

It could certainly be moved to a separate patch though. Hawi isn't
actually changing the fundamental requirement here.

Thanks,
Mike
