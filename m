Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 274ED3242AB
	for <devicetree@vger.kernel.org>; Fri, 22 May 2026 15:56:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779465378; cv=none; b=DATVhKZmFGXp1cuMS0GjtiI3MmXIfU3S5NQDgsns8g6kOcA84bo/qmgmGUcliUFJfk/Jt86s3jgxqFxCLV2FaVc/rMl14riQwe4gaAIwT4I9+1O9aohTh+1XFS3noCVKYPk+p+2HIp3gamWobMyeW+/nXZMFoW0gjNAskPoUfno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779465378; c=relaxed/simple;
	bh=QwGLipH00Xrr+3msIoEu7uhaOm8InQFJw6raskRiIZY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jz8lVXVCTEdHxFSoTjDqGkVADcc5eSt8WtkU7Ku03A3GiVCfo/HhrnCSiN5ws1IsMF1JcSraYO7vuWeKzmE9jV2HYxcSAYcVP1ng4uERCm1oDXXj4HleIP3W1Pyd0sTwqso8t+VVGpxCIR2YW7jk5UsGvS8GQjaeMZwLopol13g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=V1xbKELn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XNMFxL0y; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="V1xbKELn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XNMFxL0y"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64M9mtFi312898
	for <devicetree@vger.kernel.org>; Fri, 22 May 2026 15:56:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=z5gWBtuKrGAwT3qrhQiiIR0Y
	XtC82aee7mytyXlMvEY=; b=V1xbKELnt9GtC51Fwo1tULB2T8tRgxVnd1yefJrB
	LRyGyGoDu4TKulzv4/ywFZU47C14ctx/oo9xZyf2YpvnTkmWt/3VLP4lCSbrqD+8
	KwWGtIpr0mM0Ax4wNEXEFE99XEU5Czbmvghls3CzuXVQBwZnFELzL+wPrQQlSxho
	cY1gw+QHJFPQbzTWt8gqAp0pNzcWHTnU7SASvC8IXpAdvTG3RUE2Xu7L0Eeae5mz
	MbSz4La3pDJItYzJsZaDHpq/14/EuIt2mFd+X54vpqRmUjiSSKO7PDhrVKZta3DU
	NUUCrd04UOT52QPwz3UKkThclIKceCQPOl0kMVZm/d94vw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ea8834m47-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 22 May 2026 15:56:16 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-368edd5fec4so8506176a91.0
        for <devicetree@vger.kernel.org>; Fri, 22 May 2026 08:56:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779465375; x=1780070175; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=z5gWBtuKrGAwT3qrhQiiIR0YXtC82aee7mytyXlMvEY=;
        b=XNMFxL0yAvDLbG/a5Nt430A0L6f++COtKX2MvoskJq8amiIMrDk0+/ueRQ8tVOzpwz
         deC2W/FnDRfD+a55QQspcFwx+XAgDhW8LTpUQbr2xWb0RPIh5hLkE+EQoDtedTEGF6h+
         c07ws+RlT2vHtE/W163IsgyeWtARXa53VELZ5Haw/C1oCPUYlZkSQxbOaxC87STCBEl2
         1RKdOkBJ6/qecUbkqoO6zc3dekvX2q3mbUJcUaBrp9oLfJC86uzZ5rtLT2+G4CUb4kNn
         T8pIzZjaceROqBI3mp4VXdtL0G629FmjnyScTTs0uYup9tVlVzpU6PkH41q0FqudBU3s
         TWxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779465375; x=1780070175;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z5gWBtuKrGAwT3qrhQiiIR0YXtC82aee7mytyXlMvEY=;
        b=QqmgMoFZA0Lob7qexJ+8qQTVPjk+MMp0GCBjwzup9/YMvhbLka6MIE/Cnc+741eVhZ
         rxb0LHSjJxzAP+IPuHixKjrqz5Hm0SB6Qmf1Kuu9gdD7yBRvNW0yUhfXcK7HdRsrHJKc
         0dtNpM/Be8TfJc/Lwm7WA+swlYPFtEU2OICBNlROFeBXkTPZv3+yXyRYcBmfGdtLU0N7
         5QMEanaWQRejx+O6w9H01ajGaLIHRis1onoWt+ymeSrhh2ICFKx2HNS1g1nKqKCOOOo3
         iMdDyPmcL1y2Fqe0I5lvUeVck/xO2g9xAOQZ4l92jZ8KGfaCO+M+jyyOB73kRknJ68w1
         4niw==
X-Forwarded-Encrypted: i=1; AFNElJ/cz8y3M+XKhX3uxoiTShL4IDJm1SV3up2gHP/BoG/JiGByXICbGQKfrD8msvZ5vN+SSqmEsEi8Qr57@vger.kernel.org
X-Gm-Message-State: AOJu0Yxj2u526uayv70webk/2rPyFutFatd9XU/lkhHfw9K/i3uzJevS
	otkIjtoymjOpmdjDShIAAm5PNFAUbllt4ybK8RBs9XiN6FZZZsbb9+zB0qPRXL/OaTD6Mg0E/Mo
	QYjeYAiz6qqLqeBDleqvZssIauE/sq/S18Qg2C1eUqHRBWYtOdDitfuamnCJKwuCK
X-Gm-Gg: Acq92OFmsewvBZEMg0hmmaYYfDeXcHSZaubunCOnkRdza9w5dUxcio3wplLTm8+fyQs
	i5m7pVQi9/yJAQN5QZMsLYv7D75tUzsTt9E3E+4+E3zlbK7mk9HR0EcRRkQW1F05Cj/Teig6vIS
	1jisROj5bIIPRyvoJsIu7fr8pkxsAsjcVojIOvcltyEUhXRO6MppewVKkqREuULnFwahIab7biP
	eRDYyUtiRr9Y+W6OKBDPL90j7mnAStoSBTzjVAAMkMDt5a6YSjXbij3tMnihavHQ+e2OubyAmu0
	SmJfXvzXPa5uNA55j9FDby56Cr0aiXrJrJwrNnL5Ed/Cj8V4RItpiXCg5Bn0Pm5QHFqiNpwYruT
	MtvOggbGN5ohuXCeZWFdJtj/iOQnrFN1zB8dJei74IfsP+RJW
X-Received: by 2002:a17:90a:dfce:b0:368:ed92:6f6 with SMTP id 98e67ed59e1d1-36a676f0280mr3760211a91.1.1779465374980;
        Fri, 22 May 2026 08:56:14 -0700 (PDT)
X-Received: by 2002:a17:90a:dfce:b0:368:ed92:6f6 with SMTP id 98e67ed59e1d1-36a676f0280mr3760180a91.1.1779465374412;
        Fri, 22 May 2026 08:56:14 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36a71d9416csm3419461a91.3.2026.05.22.08.56.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 08:56:13 -0700 (PDT)
Date: Fri, 22 May 2026 21:26:07 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/4] firmware: qcom: scm: Add minidump SRAM support
Message-ID: <20260522155607.dgdpun3yonmklhx3@hu-mojha-hyd.qualcomm.com>
References: <20260519171442.1582987-1-mukesh.ojha@oss.qualcomm.com>
 <20260519171442.1582987-4-mukesh.ojha@oss.qualcomm.com>
 <19de35c4-8ddc-4824-b8c6-083eb53a5e8d@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <19de35c4-8ddc-4824-b8c6-083eb53a5e8d@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIyMDE1OSBTYWx0ZWRfXw1Bz9zX4ygc/
 VXXGbtohcFC+9Jo+X23W+BsjDkzH0qs6iNqChvvtjMAJll0wmuuR5CHd4BhvwE2+OKJRVc+w5eU
 kwgHV/BFwtNs9kqCJLb5ZY+KhnFT8Mxy/XOmwozuKSxHPN43jLLkh3eG79HB7Iac7AKrOpBEd5p
 1prgrXv3Hy87FFyYD/FZ4czD+62hdQAwunZNvuM56jh5QQIH9GJD1lnjL3gJkCpVeftRRXdVAwz
 FedHgESOVDKIYJHTO8zmSIunARXcV01CAt95/WmBkrVJZPTA+vlhOn8fFWvPJXLPg5YXDQNja5G
 wHnedbtUW1a2y0L1MSWsyZhsGYbpwXrO4P0JaVB4L1EIEaookevzTU0xCKco7NkcgVZ78Y/6ufo
 j5+GFnHwSZyYWD8cPa8BMbcPkGPxNwe4kQN8KafLeSOyRqqEnHBZ08/TC4gbA6y/rPdqS7rxYOQ
 t2s5YHUUWbSWZXlZhHA==
X-Proofpoint-GUID: S3ZmjZVMrbl_lihyvENfAw0EYgJ1bEsz
X-Proofpoint-ORIG-GUID: S3ZmjZVMrbl_lihyvENfAw0EYgJ1bEsz
X-Authority-Analysis: v=2.4 cv=LsSiDHdc c=1 sm=1 tr=0 ts=6a107ca0 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=9xwycFMNzIvhgBqj4zYA:9 a=CjuIK1q_8ugA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-22_04,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 suspectscore=0 priorityscore=1501 impostorscore=0
 bulkscore=0 spamscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605220159

On Thu, May 21, 2026 at 12:21:34PM +0200, Konrad Dybcio wrote:
> On 5/19/26 7:14 PM, Mukesh Ojha wrote:
> > On most Qualcomm SoCs where minidump is supported, a word in always-on
> > SRAM is shared between the kernel and boot firmware. Before DDR is
> > initialised on the warm reset following a crash, firmware reads this
> > word to decide if minidump is enabled and collect a minidump and where
> > to deliver it (USB upload to a host, or save to local storage).
> > 
> > The SRAM region is described by a 'sram' phandle on the SCM DT node.
> > If the property is absent the feature is silently disabled, keeping
> > existing SoCs unaffected.
> > 
> > Expose a 'minidump_dest' module parameter (default: usb) so the user can
> > select the destination. Only the string names "usb" or "storage" are
> > accepted; an invalid value is rejected with -EINVAL. Changing the
> > destination while minidump mode is already active updates SRAM immediately.
> > 
> > Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> > ---
> 
> [...]
> 
> > +
> > +static u32 minidump_dest = QCOM_MINIDUMP_DEST_USB;
> > +
> > +static const char * const minidump_dest_name[] = { "usb", "storage" };
> > +static const u32 minidump_dest_val[] = {
> > +	QCOM_MINIDUMP_DEST_USB,
> > +	QCOM_MINIDUMP_DEST_STORAGE,
> > +};
> 
> Since these two are supposed to live together, could you turn this into
> a struct?

Sure.

> 
> Konrad

-- 
-Mukesh Ojha
