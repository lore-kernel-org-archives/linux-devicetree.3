Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD0CD3624A3
	for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 07:08:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774422533; cv=none; b=aWTUM0OpTOjdQ4A1ubDn/JrM4lp9oiBVOwFdwNr+Eo/s3riE+Wpfzn0H0jif2BHJbmkaHD9p5lfrPovb4vj6pENRvOtGvR1IqB1jHThrZLpsDYkAD5N8aqjflXIEQIg57Z6fOQ+nopmmVrtZqGUrlUoubsXia0xIqr3nvcq12C4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774422533; c=relaxed/simple;
	bh=wQ/zoNaxLJBlwZ4gVyMJ/8dOvqCm5aHwPantsdEceQw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YXuC1Xb4X2rWJvSBv7fNvXS1QIRo8iJExV7sAeHBFtHBGGW9rJe6B6E0932XR90cnVQILuSU54gKr5EAHvc5pXMghEHpjGw8TyLCFWHN0VTT/0RRcI9QCEAfM+to/UlWIw6TEb8w2Pim/0gL7BMFREeOERHSKTh06kqi5gV8Ijw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HfgInqX0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QWNz/WiT; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HfgInqX0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QWNz/WiT"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62P4sCAD2973641
	for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 07:08:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=iKQ+FSSiQfqLwu71QB1udve1
	emxIWdi86i3CWGPBOB8=; b=HfgInqX0ajgGeJaPCJ7oiYxCbzl8l+urRyWdE+8g
	b122NFw21pGpoDNT/faJRqEoDcEpSDOOGpa5ivDR/wIbjKEehS6J9FuWu9oZB2lq
	4oAzIoCI6XwWFutGQDJZ9oqY7vapJAUEuc1HQRIs+RHj5S/b2Xq9sAzCt5V9yb1+
	+ij19rv10NjC5hcuxwQdZHteLbcI6OLFByOEPyKnGYfggWzpa/6ZYeEyrERnEHs9
	9CH/Bfa+/a20RvOFlrstVQ/XLOC3tWyb3bniiV8R4cs4LvnjSTww1piwe++8TZbI
	b9U2EarcJFT4pFXqNwNk/uZQBMWXzYLsSqhfQ5nD86SUcg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d40f4hxnd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 07:08:50 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50b34223670so21977221cf.0
        for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 00:08:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774422530; x=1775027330; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=iKQ+FSSiQfqLwu71QB1udve1emxIWdi86i3CWGPBOB8=;
        b=QWNz/WiTfWIdypOhPE7yrbOvbiYfdlmeJxqiHCEkvVmfi215cMOESaNyPZaQFuh0v+
         sqNt4Ct4HLisa3EHS1kUEqa1fWpbZX04r+l7cXJ5cmuJ4oiB9F92ETIl2lb5CbxVmIn7
         P6ivy0XoHOWSzs6LlTrtxGERyP9FbreIbpBtnq6L9eDOubN+bgA1fEeRlDxFBDeUkosk
         raS6ZPoAisw0dGBDAPcWFnu0wbQSaZUZaRnkE2rKSXHaVIuaCLIY19xnzGBKwpmKVkkB
         VXzWm82e3AUfUMDSfdbIshBPTOCkxwC/q1lUvg9B4+4B6O5ixcdJaxmTYzUuffOSGjXD
         m4OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774422530; x=1775027330;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iKQ+FSSiQfqLwu71QB1udve1emxIWdi86i3CWGPBOB8=;
        b=SnsoTNyL7M+KYkF0xNG7p43vqqYCFdVOllVMRPMKl6J40Hp8K2yYx7+GDUpF1xP6bX
         J2fNFWGKg/OfkhnLmBMNDk0s8ln/o0URwpzBhE7lh9mSQK3LhLcq/isMau9LehPR8fUE
         TZUcs/H+RxqSn22njM00bvqyLNINifkUljqtrd17aRafvMvudLUesCbpEhDihwGGi51a
         rMF1muDdTvX94qurCvO3X08yApuLpaGYOgUvdoGzvqGhHh/mFfpj+KcjGYSg9yN0Oh/s
         0eJOWPMSsjousg5AOC9Ylggjt9Iog65hQ1M80x3FHLsOzj7fZ7vXt+uyUPCMDZYTh5XJ
         Gt6A==
X-Forwarded-Encrypted: i=1; AJvYcCU8BhttTCUZQup/IxPLA9AxaniqwXyE/86+/L/WtISoeXta6c3YnwP4gRA2DMuLqntIMt0VzQp9Lnhv@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3FiX5btgHUX/TaDDVWWeeRVkVGnORpshW4PJ6u9xA/eRdJsf8
	xPXflM5lk6oNsaWZnA0nF0onyRmtqJtvZCM872BvnEWmBBByAiadPdV9HgWdKexFYN/AKCpNZ/1
	p8qno3KA5SNyN2B3Zt3XoM7KNDqSsxpv9aBh5/gytSFG4R8vL7z4/qKBqrWGdev3P
X-Gm-Gg: ATEYQzzvorMMLJ5EMdItWHr0kRAzjBt6OwbxJ8BIoFASYLh4eSm3wQu4soOl8+iTLND
	+2dFAEWj2ir2eVy1+NXk2U7ZedKpCxtBp61f6AVKjjeiBXCtr3wjvAUsDAAqC9RFFAguaxPQxIh
	Hp0I45JsoarJ1VDscLxCcx0TC78wkN+g+xWTnFp1oZvEEv5KYCKXcUDvmhcHInWBUr/pRQrs9fT
	wEINxCMWxSfYuEdvzMdBBMUb3VpDYv7kvaLZYn3IJ5rUQh8bueGlorVCZ03yXARz4LSRrLQ8W4u
	KBn0weHIf5nV2Fe0E5PbEzHQCKAw8Ea2WHrtElpdeR5LdJU/yT+iFnOlMyhgAgckCavbHi+oVi5
	/1BAP2xR9B30A2Elp0Eo6/wzIeX//G0wC0ULUHqxxNN9JxW+1jpSnTbyqXB0IRC/VdMfprolB3I
	6T1tiE8WltlIwCu18omr2y3/KL6QSjlznUcaI=
X-Received: by 2002:ac8:7fd0:0:b0:509:44c3:5fe7 with SMTP id d75a77b69052e-50b80de0093mr36922251cf.46.1774422530095;
        Wed, 25 Mar 2026 00:08:50 -0700 (PDT)
X-Received: by 2002:ac8:7fd0:0:b0:509:44c3:5fe7 with SMTP id d75a77b69052e-50b80de0093mr36921991cf.46.1774422529667;
        Wed, 25 Mar 2026 00:08:49 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2992e175dsm840340e87.68.2026.03.25.00.08.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 00:08:48 -0700 (PDT)
Date: Wed, 25 Mar 2026 09:08:46 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Zijun Hu <zijun.hu@oss.qualcomm.com>
Cc: Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, aiqun.yu@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
        yijie.yang@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        20260224-knp-dts-misc-v6-0-79d20dab8a60@oss.qualcomm.com
Subject: Re: [PATCH 4/6] arm64: dts: qcom: kaanapali-mtp: Enable bluetooth
 and Wifi
Message-ID: <hyy65v74scdekci3kdowxdcujbmoeyx3vxv6dahvif6rzhloxi@rirggsitayqv>
References: <20260322-knp-pmic-dt-v1-0-70bc40ea4428@oss.qualcomm.com>
 <20260322-knp-pmic-dt-v1-4-70bc40ea4428@oss.qualcomm.com>
 <b5ogt5phzzifh45zyvzbressexgp4se5m7vvgmvaf3ed723hww@qovynwnps455>
 <13745334-c2dd-4a97-90de-a5ee18cff6a7@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <13745334-c2dd-4a97-90de-a5ee18cff6a7@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI1MDA0OSBTYWx0ZWRfX0kOzH7ygdtpE
 qBzqgy30o6yeax6pOhDvP/TZx7s+bJvUlSooimKjDzx4e2s3onpfJZQsbbRQ/99Iqd6iouoJ102
 gRthocs1mvQ4efDCLaSStQPHmGe0BDMERSegKEd4wvHjnILCX57gZoqdxpxcGQhRfaBjbG3Dfew
 hSOHWctC0Y7zXrF4oL7j3P9Z8EOOX4pVoQyJ9MHw54YoTi1ZyhwujTetI9xRipZrh8K3YS50L96
 a+CxE9w0JolUQ1js6irgen9mY0fMWqiTP2Yf+CKbjETDBuejSgSe7rR+XhpTXIaBlqxZsxD0cRM
 KgioxQcyfNVJGI7bw2f9lVlmkC9+h4FPHXckguJBB68c0iDz4/mqK3B0BMk6PxSabdLkf+VMbn6
 b/yLGb6qDhoV+uuAvqpLggVLOg/8L4AIZP48S7lkOCaC1zUtg+56r6TEZFPtawurfZXZfz4Y0W9
 YYVqmeB9TDjiqJ7+OBw==
X-Proofpoint-ORIG-GUID: hmy4tF-8DbPdSxG1jxohh45n_rsG1ZOz
X-Authority-Analysis: v=2.4 cv=Cd8FJbrl c=1 sm=1 tr=0 ts=69c38a02 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=QD5C3A9ALSE2Vvq5J3oA:9
 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: hmy4tF-8DbPdSxG1jxohh45n_rsG1ZOz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-25_02,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 bulkscore=0 priorityscore=1501 clxscore=1015
 malwarescore=0 suspectscore=0 phishscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603250049

On Wed, Mar 25, 2026 at 02:40:19PM +0800, Zijun Hu wrote:
> On 3/24/2026 9:16 AM, Dmitry Baryshkov wrote:
> >> +
> >> +	wcn7850-pmu {
> >> +		compatible = "qcom,wcn7850-pmu";
> >> +
> >> +		pinctrl-0 = <&bt_default>, <&sw_ctrl_default>, <&wlan_en>;
> >> +		pinctrl-names = "default";
> >> +
> >> +		bt-enable-gpios = <&pmh0104_j_e1_gpios 5 GPIO_ACTIVE_HIGH>;
> >> +		wlan-enable-gpios = <&tlmm 16 GPIO_ACTIVE_HIGH>;
> > swctrl-gpios?
> 
> it is '<&sw_ctrl_default>' within 'pinctrl-0' above.
> the input pin is not used by power sequencing driver.
> just give it some default configurations here.

Please don't mix hardware description and the driver. If the pin is
wired, let's describe it in DT.

-- 
With best wishes
Dmitry
