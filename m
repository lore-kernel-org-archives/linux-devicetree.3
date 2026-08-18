Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEFA53C661A
	for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 03:30:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787023809; cv=none; b=JG9FEyfje8owMssc70X3WEIkZIGW97CaJdM/xuyQbUfOQuq9KsFU5UDziz/nZJBXmSelc4OS0m3rMp0GDEWGXzQVbvWhY7gACYkTWS3Lntykd/sm7YiD8rl/1ZP61OsbRPqf6c5Qp6PVGewSVWv3uQO3AGcYiqWZ1Z3xoiunWis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787023809; c=relaxed/simple;
	bh=x2arTJaXS2KttDNNJ/HhTAwa5nXXpNA5vkvGbBiNaSI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pw4PNM8QTGaHxmJaoHeGhBUIiMXqQ/2NRVbV3FfhvAIAeCsi8D37k/hfFH7u6y2bWZbpsG3ni9wbDT1pbMr3Bv1Sq4lDeELLmGb0PAG5k8SXr5nIWAEDRPJcW4ycmgwNax5kdLcuozKHZwQsjYapSJIVCt/H9vaXpqxGMxo0M4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hc+OyDCo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bi5/944m; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hc+OyDCo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bi5/944m"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67HLkt4O399653
	for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 03:30:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=0eGLIP08xW5C8N+4tfokGJwm
	d3WHOu0D+8SfCX55mAQ=; b=hc+OyDCozmUowshH46wmKQ/GJaHMBJy2MX42L5iF
	UEr5JAsgiwM2KLJnZ0hcqM5BOsO02m95rJZ9Li1SUQiZ50/lbStVI1F8PBnjnw9R
	PUqWKFNIExV7633t4EByFIjeZUjKQ6JjxqAvjhIYJj2Giusj0ytuHbBpKQreCN5O
	qOeZM+1RfMH5jpovUZE8hftIDc83Mh3JAD2qc005qyR7l/QLfE6tFGn9yps3k3rZ
	y8DEuQczHIk3xd88Z+K7KHuyncox1kt3G882vS7ClRk0JOU7ftvE+5Ha1Dz+kLEe
	UOYVkSa8gM2UmAMZEsbgBQDTWkIoUNWWjfSO7URPuDxQEw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g3y7kv52c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 03:30:04 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92e62e3459fso392119585a.0
        for <devicetree@vger.kernel.org>; Mon, 17 Aug 2026 20:30:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787023803; x=1787628603; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0eGLIP08xW5C8N+4tfokGJwmd3WHOu0D+8SfCX55mAQ=;
        b=bi5/944mPTEN6Nq7mB1cHciMq4b31AjP0HfZb2KOTiv3GYNxGCMsRJUN8GZxFkj+Do
         qJN8Sf8a0DIrf73HsIg29LTUa9m4JyEps1n+cjTp6LkE2PqguD+W3K7EiRQgoPwwgRCS
         QecXYq6VTnE86fs2hzBQv2mawB0xe5buI0gm8IEbAydyxzy3SJ3lbZUGbI/tblresgxe
         YHNiruiUu17D5QATemmpHTIJpcdLNfo4LHfDtBBH1PSqLy/gLBLhF6niwovAIgrGe2Hv
         owDPUxnSduD4+96f9bv3+oxxCZPGXcDu+BrWZ3i6/Q786sdy5XC2R7a7YnEtj8R7aLL2
         Qw6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787023803; x=1787628603;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0eGLIP08xW5C8N+4tfokGJwmd3WHOu0D+8SfCX55mAQ=;
        b=ilg+Umh6VzubxUcl2eUFazTYC64BWHl9aRTHvDTIazBRLUd0bC5HJsO228NZmT9+ju
         o2WfQxrur4QzUjblDA8wkLKO/eNh1NIPaOLqmTGOXgiVPPFuAlkXiclGIm9sP5GQxUDf
         S5atLPrwbN5S+rHgecFZuQnaGCkiKOWE3s3OjScu34sV9xmiGu3OaQJ1z3BU+4o66EBp
         xHoImhjuIWa2IQbgZi0K4vrKkjYKC0APwccU8E0GXv7qVLAwvVKPdCGzrhYRkt2doC0n
         xurPnhre3/CgEcSERgafW4U3QwuOWr5l4XfEQzj9yF3B061psWlA4t/QCKmZNz8FqYg+
         JS4Q==
X-Forwarded-Encrypted: i=1; AHgh+RpcOsdP3ujNJMlqKUUh+icjE18NXpQLrmF7psjMLyuL6kdfYFUo8nyc5erzl55eltUDb+603GjwVeAy@vger.kernel.org
X-Gm-Message-State: AOJu0YzPsog5lI6VNcBq2vNqeoZLOooaagrzUoZwf78rNtoJN4gMp8vf
	fq1t7yNaCukd4z/xtph/X8fk8tBNpYXYEFL5JVpGY2CFKDeZB6VouII1CYKgN30gXoy6qNKPElA
	7sYxY9vs5Fe2iBr2HGpt2Uf9gLPUmqMOraJpql1EGfm0+HoTNcZGbng9zxr0B2h5F
X-Gm-Gg: AR+sD13ak1q0N3ioKJX7EhsA27CA3c9qqRBVpPuKCwSLVLW0BjBaHDTYSmbvejDIX7/
	d0XrilSpEl5yt+u4Vfbe9vs9hQlC5z43oZKYOHxzpT7RpKqAoxA2B+6ZltKmdE9ehHE4sIKYsvO
	u+eaNg9U+XM9iNRwS0Kaa04J9DeANYqfSRZoyxewh4NvdEwHitOfcQBT/FoGxyFpARAwwSDPlA0
	1X30ejgwbu+kWnmA7uXIJ5V9JNp+6V/D302yYyi994qcOAS9k+k30MQLzLS1zpsRhR98hUZXYOS
	sDDpUuzzXUxWhLu4BsTs9XWMB/oYnqaxxdDNQFHOL0C/TS2koMa9y35Wj/kEQFhrEUVkZQC0WRe
	F2uLpmNtasGWxWLMbmgmQq7vL0lUSOfFXywC4syZMmEjFjhCxrX+LQwHk87r1I6nd92AI8CQQBU
	EppeQO89gjeOMg
X-Received: by 2002:ac8:5f4a:0:b0:517:6550:2a0 with SMTP id d75a77b69052e-52d853b544cmr310910791cf.19.1787023803279;
        Mon, 17 Aug 2026 20:30:03 -0700 (PDT)
X-Received: by 2002:ac8:5f4a:0:b0:517:6550:2a0 with SMTP id d75a77b69052e-52d853b544cmr310910521cf.19.1787023802765;
        Mon, 17 Aug 2026 20:30:02 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b46d00b5ffsm848096e87.67.2026.08.17.20.29.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 20:30:01 -0700 (PDT)
Date: Tue, 18 Aug 2026 06:29:58 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: display: msm: Allow two MDSS power
 domains
Message-ID: <44exzg6xzsxsgfspasbfwdi6mkovpoon6rsz4ahsomcveuvmkg@jau2b6lutygo>
References: <20260720-msm_gdsc2-v1-0-4687866d6cb0@oss.qualcomm.com>
 <20260720-msm_gdsc2-v1-1-4687866d6cb0@oss.qualcomm.com>
 <20260724-cocky-uppish-pelican-3796ee@quoll>
 <bad2e899-106a-4d7e-b082-345ec757ee9f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bad2e899-106a-4d7e-b082-345ec757ee9f@oss.qualcomm.com>
X-Proofpoint-GUID: WzbplBiL546KTPk3yBrJadKpXYyWv8rO
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE4MDAyNCBTYWx0ZWRfX410KXv5UhMDX
 oqHd2H2gY+nt2APbXOtoRy+xI83zZvQadIifDFjS1JvZqzEqr1bsIX7ufRh69VN22/EF+EZXQiu
 mcRZgMoJHTuYSeUUUrUW7LGxwg/tZko=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE4MDAyNCBTYWx0ZWRfX1h8cBH1z0SHF
 s9hkoewtpmkmjsZVfR+4oGHaAQHAKXFz6Pm6Zn99urSb+OZQvlc1s7heesYZ1i1E/be3ljbOLdr
 zsBrae2XukRB2e183pwDeLpUQ74X6CLmvJJGiqRf852xtmN5iJB3PmCHyBMC+Qd+N0AMh/+HiST
 rMfeGa7QAArE1YKu5oYQ0Gsu5xmSq9qG69DWIkDdYDX4Q0yWSTSJ4Rns71oPFE80WHdBhq+1HGf
 n2kjsIDyU5nzdNDWg2g6ZUmNZBh0eUl+51iZIxNvOPKCw7F7qmZUM0Jo9pO8ujaBMKromLU6DR8
 C78nuIxeyQkUrth5mPcGFvf7+8d4Ae4g51RqVOHFsS9jFqVcY5qq6OJtMBw9/lUFJWq0OHleGNG
 4PRkSjr43F27QkLDRlA70f85G02f0BvZ5E/+dH9s3bb7oHvLAEXWFOW0bafU7DA7plrvt/aLzvp
 WGHtNIrzSNyHprncwRg==
X-Authority-Analysis: v=2.4 cv=HYEkiCE8 c=1 sm=1 tr=0 ts=6a83d1bc cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=dX4k0HLE7GFHfSP62QsA:9 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: WzbplBiL546KTPk3yBrJadKpXYyWv8rO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-17_04,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 suspectscore=0 phishscore=0 malwarescore=0
 spamscore=0 clxscore=1015 adultscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608180024

On Thu, Aug 13, 2026 at 03:45:18PM +0800, Yongxing Mou wrote:
> 
> 
> On 7/24/2026 5:36 PM, Krzysztof Kozlowski wrote:
> > On Mon, Jul 20, 2026 at 04:43:53PM +0800, Yongxing Mou wrote:
> > > Kaanapali (SM8750) and Glymur use two display power domains.
> > > CORE_GDSC powers the main display hardware while INT2_GDSC
> > > powers a subset of SSPP blocks.
> > > 
> > > Allow the MDSS bindings to describe both power domains and
> > > their corresponding power-domain-names values.
> > > 
> > > Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> > > ---
> > >   .../devicetree/bindings/display/msm/mdss-common.yaml        |  3 ++-
> > >   .../devicetree/bindings/display/msm/qcom,glymur-mdss.yaml   | 13 ++++++++++++-
> > >   .../bindings/display/msm/qcom,kaanapali-mdss.yaml           | 13 ++++++++++++-
> > >   3 files changed, 26 insertions(+), 3 deletions(-)
> > > 
> > > diff --git a/Documentation/devicetree/bindings/display/msm/mdss-common.yaml b/Documentation/devicetree/bindings/display/msm/mdss-common.yaml
> > > index c6305a6e0334..c0b650ffd9ef 100644
> > > --- a/Documentation/devicetree/bindings/display/msm/mdss-common.yaml
> > > +++ b/Documentation/devicetree/bindings/display/msm/mdss-common.yaml
> > > @@ -31,7 +31,8 @@ properties:
> > >       const: mdss
> > >     power-domains:
> > > -    maxItems: 1
> > > +    minItems: 1
> > > +    maxItems: 2
> > 
> > So all deviecs now get 2 domains and this is completely ignored in the
> > commit msg.
> > 
> > Best regards,
> > Krzysztof
> > 
> Thanks, will modify a proper commit message next version.


And add if, enforcing either minItems:2 or maxItems:1 depending on the
compat.

-- 
With best wishes
Dmitry
