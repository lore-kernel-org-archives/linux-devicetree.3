Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE1983A3E88
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 03:20:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783999209; cv=none; b=Ye1I2OnPeIz9ELCpQZIK/nzxvTWLrNDHpFS76Wt+F4X8+wuyfdt/QfH+uBd6pKyzzDdjxbqUvx4yWurhbKxX39thkixetiuVIhxgNSsJjgApvq3TT06jXVrXlDLGVp6jVSqFpLJAhW2MLYrTJxSlPVpd9r4DX5Aa8u6FKkOBd8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783999209; c=relaxed/simple;
	bh=+/S22kMW7/+loIW+zeguuEGkg/5tPuwQR//oJwuZZDc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XU+qkvwxGjFYkxEkAI187KNHwgAchWJLWr0eMvs9MBCylEoAypl5ByJV2wkKCW4ObPrmGuQyNxd3977J2STm0urkrL9WPKRt5Nvnz3c8N5/WkWHTCI2mbUPSQIzWydPMvgwYqQfeq7g4g86nAn93OvmN6Ke9piQx40M63/xZJN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VMwPAdvv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AWyOggLB; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VMwPAdvv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AWyOggLB"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66E38GlC3292906
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 03:20:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=k1pfnEfNlNBd0jQCJ7S2U+7u
	jH/MbH8zaxCRpzdA+NA=; b=VMwPAdvvVMfJ+AsseZ0Nu/0saPAXow4gekEybIYD
	+YtfmrktsBe4i1yQnvvMLSgqA3rVI+MeeurYBLeSkxZsH8G8mkWr+ROveFA8g07Y
	bvziEsgIkmZj+gUh1TEsXNkq17A1yvHAtG199iB8l/Jp+kh+FGjqPRH3X0STSp9X
	N959GfKaFgMdLr3CRqOeZqeFSWIL0AqU5cY3+1OyxDg5rh2BvYxk0IMk+ep2rbjz
	Z15EhMM8rjqgtNkRkSinzK1jDLScPzHk1+FoiBe9Uhvx3W1FRey1T0u1L12AN6Qw
	Q0Xl8vogrK58XkVkL7gHR6eF1GuCVX8T5qepb4HKOpFxlA==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fcwk9ugba-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 03:20:06 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-ca860baea9fso1126202a12.2
        for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 20:20:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783999205; x=1784604005; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=k1pfnEfNlNBd0jQCJ7S2U+7ujH/MbH8zaxCRpzdA+NA=;
        b=AWyOggLBxkza49SU/mqHXt4XY9swP2ZZj2mQrVGR7QoywUaRYrGISMs9Sy8d+px3kv
         OdGW+TehAYTo/i2iUrP+zoH9DitDUk8cm8a3l//d53CrXhSNve1GTxlx/ZL9QO9XXWRG
         UY5UxAveAFfM0yx2ruaCJfQxTE+8bb4HS8fn87oOTboo3fYdr01OOsHkZSb7GtUHBBoT
         eDS2qoCwiDuzg4b/7INdtn/7Egsa/VkmKCChWMc6kfaDZNI5N3h8E2LGcxUkNduxdWsH
         Cf+Gvrw+A1wrTNLrMKwuB0ExsZTUIwkt0WKCF21o5LLB7D5vXKZDxQagNmiFCfc08tWt
         mHdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783999205; x=1784604005;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=k1pfnEfNlNBd0jQCJ7S2U+7ujH/MbH8zaxCRpzdA+NA=;
        b=gaXt2HIDr6FKjwdpgPF1ZO+MgRLfv+QBOueFRU4hkvAI6P1utbzUuIfCW5c24V9zgI
         tqZvw+lGbOeLJaqWjuYH7bHH7jAlulDAYvzMVtXSY3Df9PHL7USE+9tu/2Oclg5dLXkA
         2djLgT/qchJXe4WPiG5ZpRUxK8XzJNDlXx94G8lTStyMisPegu0lv76lr0LqowOnuASr
         +JZ7Egt+P/g2AlBwiAbIMGNCS13J6n3iNCjd+XMmng35Hz6GNAuvw5LQfFM5DitEgJ2/
         jzjPzoBYQX52O3PxSTdlOehU5WcS86jX6rI0LVrUaZu6alYh9zym7OpRYucgjqcEfGZR
         J+fw==
X-Forwarded-Encrypted: i=1; AHgh+Rrh7xm9nHxipg69K3FiA2LKvn/OHQH8tQQSLswqNAO+rA5tnKYz4UweoqQO85OxGpwGfjqKExGmZV7C@vger.kernel.org
X-Gm-Message-State: AOJu0YxuOHuVYcpsRa7ftTxOYBSTG+JL4YHCgfbvtKrepX1GdkVfozfN
	8MoLv6QTEob5IblXsbx/Xq4R7XFga/MVrM1j38qtdAyjjyAV4PHH9eIiW9vaJEhaDmJSxCeNerU
	eZBMs8oXDQpqIbNNGeBV+sGDph52iZf5/Wv9RDbeE1ZU1W0ARQCzuz4DQ9IiS88OnZUiqMiogVG
	8=
X-Gm-Gg: AfdE7clBhMuUAgBLvsPoRF67zpEjjB8pk4fCYV+h0gSfw36KB9oFwiq9/kdwUek9DWn
	FRf9nGjcgOGfBD1gqZU8SJjoMu5357c/TrVrCUqIaZavge7H2y5Vs+X/jPYm+g6Ry6ONH9zImcP
	x1LjTpyKP/rzqMw+WiHWS9LIv90h+IaCnOmVvJNDO7J1Sx59MVc/rhFaRSpva84mxbKlFcpFQRv
	dkDQMfXMQZ4UNwOTplTabcgR0WKYjGiZ1wTDyYKeY3VijvxSqW13mF/EKoLCjDjPykG4nJxNbOQ
	bZG2irmLJD0D7SXNbhooyC1XZ1Vwqsm7JhTFSbajgi5idDnwPszxP797aeg01984E2PBf+Q0B7A
	uFIrrWaMEQop5d9Byr2iMzufEWnNNg+K7HtZeIRi1WQZvIS/rtuSLrNGONQzd
X-Received: by 2002:a05:6a20:d81b:b0:3bf:7081:934b with SMTP id adf61e73a8af0-3c110163ecbmr13341068637.26.1783999205428;
        Mon, 13 Jul 2026 20:20:05 -0700 (PDT)
X-Received: by 2002:a05:6a20:d81b:b0:3bf:7081:934b with SMTP id adf61e73a8af0-3c110163ecbmr13341043637.26.1783999204930;
        Mon, 13 Jul 2026 20:20:04 -0700 (PDT)
Received: from hu-petche-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3117462f5c7sm81154981eec.0.2026.07.13.20.20.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 20:20:04 -0700 (PDT)
Date: Mon, 13 Jul 2026 20:20:02 -0700
From: Peter Chen <peter.chen@oss.qualcomm.com>
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
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
Message-ID: <alWq4jAGPTINnpxD@hu-petche-lv.qualcomm.com>
References: <20260709-eusb2-interrupt-handling-v5-v4-0-d4f993925608@oss.qualcomm.com>
 <20260709-eusb2-interrupt-handling-v5-v4-1-d4f993925608@oss.qualcomm.com>
 <d742u7jrpm7gdoljgiwkfexc47qhprwoibk6fadpm3qilbdpgi@jrkbrwfmqmrp>
 <alBOC18CpkGDhM2m@vbox>
 <20260710-warping-resolute-wasp-e4b8ce@quoll>
 <7a099224-ea95-40ec-b279-f8834f261e23@kernel.org>
 <alFTxg0HLyke0gCK@vbox>
 <b60b4d96-ea67-44d0-a627-c50ef0ed8615@kernel.org>
 <alSRvWY2LWp8OeOr@hu-petche-lv.qualcomm.com>
 <alV0_DHvBFpzDumP@vbox>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alV0_DHvBFpzDumP@vbox>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE0MDAzMiBTYWx0ZWRfX6+4pBN2s6Ci0
 qTXMTJijLQAJ6fHv/rTuZII+5KjQpObpbZVpoDPzcxI/ba9wSI+DSjKZLnVlqyYB70pnlI2yFmg
 w5cKFqkNt3E8z0rR59IzvtlamhfQmoKrXk45dqS/kFPePrRUE1zo+5CLSmMDs+7M6YS78QmuyE4
 JOIgE0fiuoN/+0ZZIfz7hhmtwy83Z8Ynz/L9Aej0ghfJ+2njief0P6kqnuy2qD8gnnuCFOC4E//
 IjbiHCISQErOLQgpCrhgUHxg15QRgxzbEWHcwwEpiOOGsKP05SAzhoKebgZDAY0toYkZQBJ3gbS
 8I2cUPuLzdVRsdcwNzjQsMMv2XmTvQM+nmQzHuF74S0iGq9pvlfYuUZCC5Wpg5AKhh6gCFpK4WG
 Y7VM3ZtV6fTPSS8BS5/XKAy+yz9ZM2Vh4u/j01e2rNQeMC9Fp5krUx+FgmOkXXzyiqbMACN0Vvo
 1pOz+OToHXTX0e4De8w==
X-Proofpoint-ORIG-GUID: 4acWE0Sy9Z92No4IfE0ynrIOSeJ0Daa2
X-Authority-Analysis: v=2.4 cv=UMHt2ify c=1 sm=1 tr=0 ts=6a55aae6 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=G0XHSz-fAAAA:8 a=9s4_ODXOAMUL3Z7cIVoA:9 a=CjuIK1q_8ugA:10
 a=bFCP_H2QrGi7Okbo017w:22 a=9GzJQMQvVMogKS571uVa:22
X-Proofpoint-GUID: 4acWE0Sy9Z92No4IfE0ynrIOSeJ0Daa2
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE0MDAzMiBTYWx0ZWRfXzBN3SzIYPDRg
 DeVYLT5177dA27tbznk2khcFOkuzQBLgiSBKKIS6yVD6DKuLxG3RrS/JSCV/C++17sYf83d1G17
 +TbBrpDDeUU+WFI9ZY0yU4cr7eV6e2s=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-14_01,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 spamscore=0 clxscore=1015 adultscore=0
 malwarescore=0 lowpriorityscore=0 phishscore=0 suspectscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607140032

On 26-07-13 23:41:14, Thinh Nguyen wrote:
> On Mon, Jul 13, 2026, Peter Chen wrote:
> > On 26-07-13 08:26:59, Krzysztof Kozlowski wrote:
> > > >> And Dmitry already said this at v3.
> > > > 
> > > > And I've already responded to his comment in v3:
> > > > https://urldefense.com/v3/__https://lore.kernel.org/linux-usb/ahjYwJtiMsm0BcCh@vbox/__;!!A4F2R9G_pg!YksJ0tPtRth9ez8t0GB_WaxH3ynx3ya8M8aFIyKfYpApRC_79Ig93CqE2MKcrGJ6O6t_Dl3RD1zftrnxhdtcfoW7hgep8w$ 
> > > 
> > > It does not change the fact that type of phy is implied by compatible,
> > > thus you do not get a new property.
> > > 
> > > 
> > 
> > For USB2 PHY, it has property "phy_type" already, it could extend support
> > list to eUSB2 like below, dwc3 qcom glue layer could call of_usb_get_phy_mode
> > or re-use dwc3->hsphy_mode depends on where it needs to use.
> > 
> > diff --git a/drivers/usb/phy/of.c b/drivers/usb/phy/of.c
> > index 1ab134f45d67..5cbf17d493ad 100644
> > --- a/drivers/usb/phy/of.c
> > +++ b/drivers/usb/phy/of.c
> > @@ -16,6 +16,7 @@ static const char *const usbphy_modes[] = {
> >  	[USBPHY_INTERFACE_MODE_ULPI]	= "ulpi",
> >  	[USBPHY_INTERFACE_MODE_SERIAL]	= "serial",
> >  	[USBPHY_INTERFACE_MODE_HSIC]	= "hsic",
> > +	[USBPHY_INTERFACE_MODE_EUSB2]	= "eusb2",
> >  };
> > 
> > 
> 
> eusb2 uses utmi, so it doesn't fit here as a separate mode.
> 

Hi Thinh

Yes, eUSB2 is based on UTMI Parallel mode, but it has dedicated
Physical Layer Supplement [1], eg at CH2.4, it lists eUSB2 PHY
Features.


> To go this route properly, we'd need to introduce a new phy type
> attribute in the phy framework, which will be a bigger change that may
> impact more than this driver.
> 

It is not at generic PHY framework, it is just for USB PHY dedicated.

I do not see big changes, it only needs to change above files and related
dt-binding files, and other users may leverage it if the controller
has special sequence or settings for eUSB2.


[1] https://usb.org/sites/default/files/eUSB2_1p2_20211217.pdf
-- 

Thanks,
Peter Chen
