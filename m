Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EB6D397930
	for <devicetree@vger.kernel.org>; Thu, 13 Aug 2026 14:48:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786632517; cv=none; b=rXMRlTulslnUNpTif3QN9VTX8dK5PAuZXG0JoZyibtk3ShdL6KdUSQ8bo2fJBDFUgclGb5etsYhHDhm/PEL0QdhZUjiJXe802uNr5X8ZWQSqSg6xKulDU1aKkEtXSpygcC4KeRq29jANn+drVzuitedu5HKq4cOkDihTuy9s9hE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786632517; c=relaxed/simple;
	bh=fPVZ1ihw05vS5fOYEENuHWqa5iPU8L2MRPmEcSIB9pY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TVgPkoL9RF8zlT4yn7yoRDCuo1PFgl8mNfw1tiIfERCNq9WnrofdJzzaxAeAvcAaU/X5AEhtV6QjzYL7JtjTztiEAw6gp8UwNYsJaVLEmj75Yqc6B37aFrfhU/3cYspnfzSLRAwlA2j4lFHC0YDZC02FHoQafyaR1GyMfABCqUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VnhDxUpA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=krdFwZ1Z; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VnhDxUpA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="krdFwZ1Z"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67DCJk4Z3286567
	for <devicetree@vger.kernel.org>; Thu, 13 Aug 2026 14:48:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=uRZcIZWzwhsQClQoWCRDPoqO
	ksp7QGY7YMrfX9l8rqM=; b=VnhDxUpAYj2LZJPIekIvknYaa1JNyZjhQy+ojpxH
	yBnTIjMnLs/XnUgUeT7A+5MiXVdTcWQerfUzU+spDZuw4SvZO/Gd3oKCGkPuDIUN
	Qw1qdHn467m/fXuzEMF+X2tGGo/rxsy+h4pi4xElCATBw8pieNc04e1llY9+Ff0z
	+x5s4BOS95OjvF/zkD5x/OX1YMAoaIVrGEjajoHX+13Ms9wGmwaIs7korH1TeHuQ
	JISnjjBWn89UqlAYYQN4NerCTNO5nUhc/yRmwPYStfGVRcgaRuSVo8oa6VWv0FPK
	bD95PHSYzGdUdlQRs++N/VSGhcEkkdQGuswCEe4J6uLvQA==
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com [209.85.210.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g18c5j6gt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 13 Aug 2026 14:48:35 +0000 (GMT)
Received: by mail-ot1-f72.google.com with SMTP id 46e09a7af769-7f1ddcd241aso6693a34.0
        for <devicetree@vger.kernel.org>; Thu, 13 Aug 2026 07:48:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786632514; x=1787237314; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=uRZcIZWzwhsQClQoWCRDPoqOksp7QGY7YMrfX9l8rqM=;
        b=krdFwZ1ZC+hsfGdvyieKj8Wb2cn/znKoNDJkqdzEtnFx++98qeSPv+lFcP79N9hR8X
         pRUffY2KgycJAeWU/wG0+VbIDTwWN8XbGTbQoSj+5Skc4o1wKXWQ8jOXqHTqGRRnruQQ
         dHj0kOgF7raUaoGPl9uxUAACaFG0BwiqeGajmxdYmuYH0/5pTC62xGYgL7Bbqb+IUE+S
         EExuh9O7BEK7rYu8LXhG8OSPQ7MlltAwL9n6MH1oCFaWuoo9AjpV0tUwA/PlinR/N0mx
         CTpGL8dK8E4XFHb3gf9am9WbArVP9s3Ctrlg6rHcY/tKLT0CZ/kIsD1pV4u9bItNdmQZ
         LIRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786632514; x=1787237314;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uRZcIZWzwhsQClQoWCRDPoqOksp7QGY7YMrfX9l8rqM=;
        b=D4o1k/rR7gG88MZDqvDc6J9gA3SOSahTaLI90lIm4aQRN4XNhMKQBZPYEN1bBfmta0
         8kypQgY7j/ovHhs9ut9ACkM2rn/nRoV4MvwZXGDVj7ujqpD39Et9B8jsUE5khsqcNsLq
         OrdVEzxCh5O5DGTeLu3iDsi0UWCbceIadRteZoWbBigc36sLhShKQWGZEAmI3Q1KnJlf
         8rQ8iNjKEkOChRbT0KSye1n4nGCkmmwFmvKRzp01jLlUU4GAw4cg83Z6mzf9oGwTGiqG
         7twYBm3K3fGKmC7Ut4X4VreYXj9JOQMnLFPUnWzdJQNIyAilWbD6rA4xRRgIkagUlc2i
         kf/A==
X-Forwarded-Encrypted: i=1; AHgh+RrkFOhyyKWP1B6Lw5uD3aNBoSCT2YYxevOLnRHh3BYmhqZNKxzqaMFUZtoJSHDyrWWatUICfBB3Nf/4@vger.kernel.org
X-Gm-Message-State: AOJu0YxKy8k2WB/i9Z7IFuz+ElRFixJoWmEH2ieJ096F7oZ8ev0YH8Hq
	HrxaVujWJNphGjx1ibmL0QS4XRONBbozHNakkfEJkRnm6jDyNKxDJkvdOOOud1+da1wBuSqh3qT
	SaNUwQz1Ox+7j90BaVqD//IN5Fu6KTVTx9UliFRLRG3EgUH3j/ejPCKAZTEYDlmtA
X-Gm-Gg: AR+sD13wbBcM+Bl08DHs6NyvSHI2bJxReP97kjN4vZXesJM1QCjZxrS2WN0pzeZ3nHe
	lV52zh77ZygklKBBLfE+x3Q3P8BnQFDOrLFfiOtSp/OKaDzYe95Q90WOodnFwAlyrYYDcXx5Bxg
	LkEjbSgvDqNevR4mqXEUQcVK1VcbxxxcWQ8p6w4q54Y7Hregh3O5meRdCin2cV1P4YcBYuV8UCV
	wvLKINsq2Vj9Elko2hkBtjnt8nQUKkt1vV09mQI2vvy4JQqoKIvoV9JspHg0UKQXGnx/bMUZAIl
	SYbAHdpNYBSkur78knjqIUhIQhAAUPixyAqAIS5HgUp/5GTk1SCCbfaWuaRTjRb8I5AxW7eH8Zn
	SBZnEXcSdbUkHOFvE5PxMzxIwf/3BoX1x
X-Received: by 2002:a05:6830:2992:b0:7eb:d848:c867 with SMTP id 46e09a7af769-7f3ca6c6723mr6288330a34.6.1786632514480;
        Thu, 13 Aug 2026 07:48:34 -0700 (PDT)
X-Received: by 2002:a05:6830:2992:b0:7eb:d848:c867 with SMTP id 46e09a7af769-7f3ca6c6723mr6288294a34.6.1786632514014;
        Thu, 13 Aug 2026 07:48:34 -0700 (PDT)
Received: from hu-anantiwa-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7f3c9ca7bf1sm2271803a34.13.2026.08.13.07.48.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 07:48:33 -0700 (PDT)
Date: Thu, 13 Aug 2026 20:18:27 +0530
From: Anand Tiwari <anand.tiwari@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        venkata.valluru@oss.qualcomm.com, vishnu.saini@oss.qualcomm.com,
        Jessica Zhang <jesszhan0024@gmail.com>
Subject: Re: [PATCH 1/2] arm64: dts: qcom: hamoa-iot-evk: Add eDP display
 overlay
Message-ID: <an3ZO6i4S2ttjLTH@hu-anantiwa-hyd.qualcomm.com>
References: <20260806-edp_overlay_for-next-v1-0-c3aebbc81f38@oss.qualcomm.com>
 <20260806-edp_overlay_for-next-v1-1-c3aebbc81f38@oss.qualcomm.com>
 <anUgxo3BPt74Wx7K@baldur>
 <anWsrXO9RztrF5H4@hu-anantiwa-hyd.qualcomm.com>
 <anZGDietz47mE2wp@baldur>
 <anmKUoLFSDpgOjoE@hu-anantiwa-hyd.qualcomm.com>
 <annMk4RnQKl51Oug@baldur>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <annMk4RnQKl51Oug@baldur>
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEzMDEwNiBTYWx0ZWRfX8xhm6cz4Go2B
 5q3ZQw8QDsVLsHlqPP7i4ZpcG4Z1gZQ/FwD1jv9aOZmFzK0CllmJGExFNlsI5yTocRidCTNMZB8
 pl65PP9jSYn35KZ6qWg2gu5HjzOpEf0=
X-Proofpoint-GUID: pLMq_TrtSoq5lm5uQfhe_IU7QGvVQ6Co
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEzMDEwNiBTYWx0ZWRfX8a9YEVnPYZus
 q9xd3b14SdrFRHJu/wCMI3w68TG85y1rgTzdvMT0a9aHzYavzJh93SM4lqvwn9uLZ2DxMX44nge
 U4aU7d2kj5hImnY/3TDkwAIRjAtrCLa83+fMkEyS+Ee8sDSQ5qNT1FIOPT5YbetXnw6lkc+CyPb
 U0QC1fM5N4w8OALonwrTjR2sQjhnmkZLi3LBgx9D66Fgr471DI95W7OPZIXM6XZr+Qe+kMg72AT
 RLFxtmewSWopujTfGSf9yu0VnGzEK7/QDB0cwp58gAuuSMPx9WXmEBi/X/UIJK+nfsQkKItKyn/
 dBkbLB5let0HE1ibCWFLx+bUtBNEa2AzwiHyOaB2e0nyzQyqQp8xAuffp4rhXrgD9tcShd80weq
 Ef06pwvMTe4d4tS9dEWImuSx7PNtOzKE/Kav37nOCS6BneWMRSwCoSTfJ4WEbwMzpHPHgjIiUHS
 i1R4Kb/mnngE/aAp3mA==
X-Proofpoint-ORIG-GUID: pLMq_TrtSoq5lm5uQfhe_IU7QGvVQ6Co
X-Authority-Analysis: v=2.4 cv=VebH+lp9 c=1 sm=1 tr=0 ts=6a7dd943 cx=c_pps
 a=+3WqYijBVYhDct2f5Fivkw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=JxsENykyxGhnw_pnO58A:9 a=CjuIK1q_8ugA:10
 a=eYe2g0i6gJ5uXG_o6N4q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-13_04,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 bulkscore=0 suspectscore=0 clxscore=1015
 lowpriorityscore=0 priorityscore=1501 impostorscore=0 spamscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608130106

On Mon, Aug 10, 2026 at 08:11:12AM -0500, Bjorn Andersson wrote:
> On Mon, Aug 10, 2026 at 01:52:42PM +0530, Anand Tiwari wrote:
> > On Fri, Aug 07, 2026 at 04:01:05PM -0500, Bjorn Andersson wrote:
> > > On Fri, Aug 07, 2026 at 03:30:13PM +0530, Anand Tiwari wrote:
> > > > On Thu, Aug 06, 2026 at 07:05:37PM -0500, Bjorn Andersson wrote:
> > > > > On Thu, Aug 06, 2026 at 10:01:20PM +0530, Anand Tiwari wrote:
> > > > > > Move the eDP panel configuration and related power, backlight, and pinctrl
> > > > > > nodes into a separate overlay. Keep the base DTB suitable for headless
> > > > > > variants and provide a composite DTB for headed variants.
> > > > > 
> > > > > To quote:
> > > > > https://docs.kernel.org/process/submitting-patches.html#describe-your-changes
> > > > > 
> > > > > """
> > > > > Describe your problem. Whether your patch is a one-line bug fix or 5000
> > > > > lines of a new feature, there must be an underlying problem that
> > > > > motivated you to do this work. Convince the reviewer that there is a
> > > > > problem worth fixing and that it makes sense for them to read past the
> > > > > first paragraph.
> > > > > """
> > > > > 
> > > > > In fact, I'm not even able to guess what the problem you're fixing here.
> > > > > 
> > > > > Regards,
> > > > > Bjorn
> > > > >
> > > > 
> > > > The problem is that the base device trees currently describe the eDP
> > > > display hardware unconditionally. However, Hamoa and Purwa IoT EVKs
> > > > are also available in headless variants without an eDP panel.
> > > > 
> > > > With current base DTBs, headless variants are not stable where eDP panel is not
> > > > physically connected with board and userspace is trying to use it.
> 
> If this is the configuration that is shipping, then it better be
> stable...
>

Agreed.
 
> > > > 
> > > > This series fixes the inaccurate hardware description by keeping the
> > > > base DTBs limited to hardware common to both variants and moving the
> > > > eDP-specific nodes into separate overlays. The base DTB can therefore
> > > > be used for headless variants, while the overlay is selected for
> > > > headed variants.
> > > >  
> > > 
> > > I see, then it seems your change does make sense. I don't understand why
> > > you didn't explained this in the commit message though.
> > >
> > 
> > I will update the commit msg with details, currently details added only in 
> > series cover letter. 
> > 
> > > 
> > > I further do not understand how it can be that nobody noticed that the
> > > display was missing on their Hamoa EVK during the 11 months since I
> > > merged the offending patch - this is completely unacceptable.
> > > 
> > > Regards,
> > > Bjorn
> > >
> > 
> > Internally, we have always required the eDP panel to be connected during 
> > testing. In theory, this platform is expected to have a display attached 
> > by default.
> > 1. The only difference is that the eDP connector on this board is externally 
> > accessible and can be disconnected quite easily.
> > 2. Also, only the boards shipped to customers are delivered without an eDP 
> > panel attached by default, which is why this requirement exists. 
> 
> In particular since you're shipping it without display, that is the
> configuration that should be the dts (and that you should test...).
> 
> Common additional configurations can then be added as overlays - while
> the developer can add their own overlays as needed.
> 
> Regards,
> Bjorn

Agreed. The headless configuration is now the base DTS, with the eDP
nodes moved to an optional overlay. Testing is complete for both
headless and headed configurations.

