Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE81D34CFC3
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 13:34:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784727288; cv=none; b=nRvsxGk/7prhpqyOAGjTq12GF7gd0BVowjYLDxsEKmmH90dHjx0s5vZDeGqkzeRNB1c8kooc879vt45uu7HWv03POcFizM8h46fmhoCcAt5/nRGSp29A1ij56/sij0bD16pdqth4Y49JBp+2ZtVtIy28iilGR+K1MkL5m2nYl+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784727288; c=relaxed/simple;
	bh=N14BBnZYEzW7DFK9cV8i1zuO010YMCnevZrohK4TI+o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YGba3Lp3WA3nSnoRf3mOKKjvDdb/7WUSoSRefEYMhYLmhgB3QgWMeAQJ7IkkvRHaxO5TTkI+IOde8h7rzrXREG++/Tcxb4ITOYmUm3SvTerZMSRQpUQbVjOyPigNfZS+xtl7iVeWrNQxBOU4K4ijD2j27M9BppOCDPzYALw6Mwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DBVStTOq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WGlOIZzX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DBVStTOq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WGlOIZzX"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66MDWwkH861336
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 13:34:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=SkaktrxMNR4XV9Ly2K4y2fFD
	nw/dOgJ04mgtABo2xXg=; b=DBVStTOqFmSjdd+L9FfYmxnYcurEORf50u5RTr1k
	dFIR1a3m2INT9Asd77s8Ebhqhr4HqnPO8uO0h4NqO+tbbByptF0gtVDu5+Ryz08f
	+krHS8drlKo6ObKJv6B0PWel05geVsLFHHTTYliXpkwsBFZ1uStifgvacz0cl5NJ
	cmg7yRtMeBXjj2QzgEcz2WB5XLtJe+J29r+svY3c9Wee1h3d/H0VxawDxpCv9Wvc
	NZMI04GbPs8W9iq+l3ZhIAmNTjnEhQaJ4X0uhmK92BlhHwdIUxAs4erOfhc5AznM
	9LGFytLWNe68eFuZuj4HYpabXusQEBj4Nh6BxKFq9hGoLQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fjntn2bre-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 13:34:45 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c1b4d961dso107901151cf.1
        for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 06:34:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784727285; x=1785332085; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SkaktrxMNR4XV9Ly2K4y2fFDnw/dOgJ04mgtABo2xXg=;
        b=WGlOIZzX2P3Dblm8xpRI5ZxccxHL4iAOtTLit72ShLM2f0FIS5AZfgpDbU3/C0nVJx
         gsIKEeDLBcPEbAE6ks7lHuMypzVML9ELjslSyUODhQ3RWmnHKzqT+PY2pdYNqWmWJMKH
         gEHkSPjMo5TXJPknYpsCgXSbMIGK178fuK3OecwwB14MJa6z+Gpzqshre8LIAfu31jvx
         PuGr4/E3ozJzt4s2x+itXIPHKBLgCOcOgjN36PrrjbS7vL6EE7BySOa2IQnIkVAfWpEQ
         jeKxtgF98xl6kaayf7gIxz1cLRevOf0KxzKa8437CeTK6U0LFoAt0y8N7zMNxKDm8tB1
         8EXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784727285; x=1785332085;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SkaktrxMNR4XV9Ly2K4y2fFDnw/dOgJ04mgtABo2xXg=;
        b=rRGrwExb5zn1sNbqTeBH2KPkTQHj9tn636PBpfOb6YAKQw5FZ/oYMMZrS+Zi8b9QVa
         KvmuAX3I5HhH8iFXi7LNdJSVnbAegFtjRofM7r7R47B9dZaOXNvekWpvg79oLOxXI3Wq
         g4TTd6dy12C/HEh8PNFcnl2CCP2vDKWG6SHOT8qBSqXmJ3UxS/F6rhqGlQXXK0EAW2/V
         izVo208wSP9cbuAph3cGx0OBOo0xXY3xeFAn6Kw/QSb14JlN49qLWvoSd5DYcLVlr2FO
         2NDww/31ij9yVXJ7PYa+wZSVdnifEnyXME5aFlqyY4812dWR5CuhK3WDxfzbrfxU4EJd
         Ujhw==
X-Forwarded-Encrypted: i=1; AHgh+RrteF3JkSNQc258pfYkc4YbPKMjFOnW7B4xflmLYEHzeFlFP0nNGbC7iGj0P/NjCbCHjnVkjuzk9bjP@vger.kernel.org
X-Gm-Message-State: AOJu0YyuZO9CSCky4MgQ8DsLnTagwUArA09LngMkl4Qqmii3zGHRqTH2
	y/v/7iOVGdWJNjTTlkCTnGYqsb1GMo9DkJh8JD5810UUy6kXgOKsfV/SwbADz6gxNiezXK1IJA+
	ZD9gyr4sIHAW3n6ui7YFjGDvBeLFHJcsLmllDZMlsQO+nC738TX1h59IExcWiSOFY
X-Gm-Gg: AR+sD109TuHUjm2VJB1O2VFh5jTVaGayku6YYu8YPMjoGLcH2h2wLhgAeeLlHOYOCRm
	iZfG6GFgCKrIxAa3r2B+KUnaZlCRIyag3Uvlv+hxoPnqVIT+jvt9LZjMQohxfNKJuqSZD7K9aCn
	VKeQwp2tloKVgB/SV3h7/k4wSolYgiLgQQLs+X2PF3zLEZ4UgVzrSWTxPALuZBFRSXr7uHY/Qo4
	im7Mg+ZUi4X/7tzp/BkMAPBXkhJnZPiTh0pMYFTYu9JL1qQUGVn+BEMgIYKxwnxXQIHqldW98AP
	8Wnb7+NoaJdebuo9vsyr7NCevjN4xAIVS74fuDf2NEq4vnZwPG+uQdSvkz6OPz+eqs4QKwKxKSg
	VaKJZWaZhUj446zRn2/2x3T0QtAc2mx5x881ORxCrtFla6fcYMaIQGoFt0H19EurTmhEFiJNQJc
	kdaO5g8n9OJzxGow==
X-Received: by 2002:a05:622a:4cd:b0:51c:8556:55f0 with SMTP id d75a77b69052e-527a9326861mr41664561cf.34.1784727284424;
        Wed, 22 Jul 2026 06:34:44 -0700 (PDT)
X-Received: by 2002:a05:622a:4cd:b0:51c:8556:55f0 with SMTP id d75a77b69052e-527a9326861mr41663141cf.34.1784727282889;
        Wed, 22 Jul 2026 06:34:42 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2a9badae1sm482006e87.28.2026.07.22.06.34.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 06:34:41 -0700 (PDT)
Date: Wed, 22 Jul 2026 16:34:40 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4 1/2] dt-bindings: qcom,snps-dwc3: Add property
 indicating presence of eUSB2 phy
Message-ID: <3iubu5nrdd2zwdks2qisqmlyzj66wanwpwvxpls6xgrqjrpakq@b2xb36qgexkc>
References: <20260709-eusb2-interrupt-handling-v5-v4-0-d4f993925608@oss.qualcomm.com>
 <20260709-eusb2-interrupt-handling-v5-v4-1-d4f993925608@oss.qualcomm.com>
 <d742u7jrpm7gdoljgiwkfexc47qhprwoibk6fadpm3qilbdpgi@jrkbrwfmqmrp>
 <alBOC18CpkGDhM2m@vbox>
 <20260710-warping-resolute-wasp-e4b8ce@quoll>
 <7a099224-ea95-40ec-b279-f8834f261e23@kernel.org>
 <alFTxg0HLyke0gCK@vbox>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alFTxg0HLyke0gCK@vbox>
X-Authority-Analysis: v=2.4 cv=AJsSZ1gA c=1 sm=1 tr=0 ts=6a60c6f5 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=kytnFc8dcNkQ8RD8sAUA:9 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: zvdU6f36H-QUThmLBevnw_KgIOBQPiyM
X-Proofpoint-ORIG-GUID: zvdU6f36H-QUThmLBevnw_KgIOBQPiyM
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDEzMiBTYWx0ZWRfX+0nQSr6UVjOF
 h5EG6SeOLu8Hibd7weQwYDcU/PQOb65tTcNJEllX+i+eUmr/EW8VmUPtKrTTaYlQ2Y7MgQSKfuF
 0OGpp7iPl63EzO2uItMMdeGM5X1xJE8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDEzMiBTYWx0ZWRfX0FsG82wO8IUW
 LJL5X5rwjEcvXgrnI2YVymhhTYTqK9CFP3BOWyo4ayHFleshlWjKBXIGeG00c+oEeTn+vc/vizk
 3UXJCK54J/ogWvfL3EDkOSI1Bgj5P9j3+eMur7JeB7IXB0dlxAICKudCVCNYawq7U+AtMObvOpq
 FDPJ1n9DWkn5Tc+WV8TfAL1Dxx2rljkvkJzeBhNN4Kg6HLYmgymbaeg4kBTx/pf6ecmwvUFqb05
 iQvrPoPvXkob8au59M/yjgeXrwbzpHucJpxx8KoaSUBNBsj+ACngz3b8V0Rn99/hTYVSmrM1MPY
 2gixqbERems5qUAQZ+JDMqF092aZesIfB4yw6ymR2aSotU3q4ynN5bwqH+doAMefhFd5hOoRkBy
 QmhfJrtHee64oDLHSEGbk9E8LKWql3O+sM6OiO9UmyweXnxHl1tyubQzoKhVju6toMex4ja//BJ
 10PHVru6qt3lxP/FyUA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-22_04,2026-07-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 bulkscore=0 adultscore=0 priorityscore=1501 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607220132

On Fri, Jul 10, 2026 at 09:02:29PM +0000, Thinh Nguyen wrote:
> On Fri, Jul 10, 2026, Krzysztof Kozlowski wrote:
> > On 10/07/2026 09:16, Krzysztof Kozlowski wrote:
> > > On Fri, Jul 10, 2026 at 01:52:45AM +0000, Thinh Nguyen wrote:
> > >> On Thu, Jul 09, 2026, Dmitry Baryshkov wrote:
> > >>> On Thu, Jul 09, 2026 at 02:22:36PM +0530, Krishna Kurapati wrote:
> > >>>> Add property "qcom,has-eusb2-phy" to indicate whether the SoC has eUSB2 phy
> > >>>> or not. This is used to modify dp/dm interrupts during host mode suspend.
> > >>>>
> > >>>> Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
> > >>>> ---
> > >>>>  Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml | 7 +++++++
> > >>>>  1 file changed, 7 insertions(+)
> > >>>>
> > >>>> diff --git a/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml b/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
> > >>>> index 8201656b41ed..0c6a839be82f 100644
> > >>>> --- a/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
> > >>>> +++ b/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
> > >>>> @@ -152,6 +152,13 @@ properties:
> > >>>>        HS/FS/LS modes are supported.
> > >>>>      type: boolean
> > >>>>  
> > >>>> +  qcom,has-eusb2-phy:
> > >>>> +    description:
> > >>>> +      If present, it indicates that the controller is working with eUSB2
> > >>>> +      phy. This property is used to modify dp/dm interrupt configurations
> > >>>> +      while entering suspend.
> > >>>> +    type: boolean
> > >>>
> > >>> I still have exactly the same concern. This information is already
> > >>> present in the DT.
> > >>>
> > >>
> > >> Could you clarify what you mean by "this information is already present
> > >> in the DT"? Are you suggesting we use the dwc3 node's compatible string
> > >> to infer the phy type?
> > >>
> > >> The dwc3 glue compatible describes the controller, not the phy. They are
> > >> separate IP blocks. A board variant could reuse the same dwc3 compatible
> > >> with a different phy attached, making that inference silently wrong.
> > >>
> > >> The phy type is described somewhere else in the DT (in the phy node
> > >> itself), referenced via the phy's phandle on the dwc3 core child node.
> > >> We could walk that phandle and check whether the phy node's compatible
> > >> contains "eusb2". However, that relies on a naming convention that isn't
> > >> enforced anywhere. All current eusb2 phy compatibles happen to follow it
> > >> (qcom,sm8550-snps-eusb2-phy, qcom,sm8750-m31-eusb2-phy,
> > >> samsung,exynos2200-eusb2-phy, etc.), but a future phy driver could break
> > > 
> > > You have a fixed/finite list of phys which needs something special, so
> > > that information as Dmitry said is in DT already.
> 
> Are you referring to a fixed list of eusb2 phy compatibles, or a fixed
> list of dwc3 node compatibles?
> 
> Either way, the list is not fixed. New eusb2 SoC variants are added
> regularly, and there are already 12 eusb2 phy compatible strings in the
> DT bindings but only 3 in the PHY driver of_match tables, they don't
> land at the same time. As for what information is already in DT, I've
> addressed this above and in my earlier response.

As we expect more eUSB2 PHYs rather than non-eUSB2, you can add a fixed,
closed list of non-eUSB2 PHYs.


-- 
With best wishes
Dmitry
