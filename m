Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06BD5331A57
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 14:47:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778683633; cv=none; b=VKw1WWIte9TyiY7ZzY6HDeVFl16FY7ysCpRYe1d8waQLmoUoXWArW8Ab9tY50md+PL/e45ZYq0vrZ5RY1p3GyvfAgRuShviiiR1nVtRYKTn6hijyVcqi0YzmrG54fydXjMOU5XYpQyqLpGjHcqXseKRnUqFYkfVsr5rbJMnOtmE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778683633; c=relaxed/simple;
	bh=b4SxusKqNsSqRkvJjcE/Px/ClSp9uT8Kd5NTn0q9g+w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AmXc4wH+IhPjktYyfHDcSvgtFYJuNn3gl7scc3ZGjwSBx/lT9/s5vnVlxQF0DljJq8ONwv1RI7Y+xCkbHKtFi2aGwMuR5QebKW8PmtVj0l9xWoB0oxnobJKmNwAic7CKP0iL45F6wEYp11p+wxm322Eh9bQdI5FFkhpe59sSGb0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=d1nhB8Uy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=O3iIp3wc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="d1nhB8Uy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="O3iIp3wc"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64DAeB3V978368
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 14:47:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=cOGLbWKWUL7zcGN6Zsk4Euad
	YdpgsTi6NXegh7ZSjlM=; b=d1nhB8UyynKY8DjIQJZyH+lI8hVayz05519mL1V/
	XOIylBd/PMfuIoQMwA2yWfFg07iZZ2hXaAGkcX0YjF+obC5WtW/n9T4uWkinR2V9
	oYqvtQZEUtrU6eu3PciSFrH9ueqxAGcj0/db/1PHjrrQdGTg4WUveGDzGRA+FuOt
	+zTa9NhKSDT+G7rTAJukTOhIPwdYAhjW/RMH5oQMgcN0WgBOPuXSyihhgL/8RH1p
	j/KrR9x9SaAtmPVkD/6HlvwSREl6pnCaOKsh9BRrc4Gz7prRr28EPKizp8X3qdKD
	/Pw0AFY9xdgKlw6vUKPXlzB2SfjvBBv88LB+GKgyfmmsaQ==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e46s9vs9r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 14:47:11 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-132a99125f8so10926561c88.1
        for <devicetree@vger.kernel.org>; Wed, 13 May 2026 07:47:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778683630; x=1779288430; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=cOGLbWKWUL7zcGN6Zsk4EuadYdpgsTi6NXegh7ZSjlM=;
        b=O3iIp3wcBxC9JHeRLBSpihbRYXUrJkpXKfyqpJU3k5V+1Nx30dB4RimatmMX8bxiCX
         WVblu8gB9/yjyX1pDvzFO0ZL8hsvBRrLU9W0v72h/qOxJvI1yHbK3Ry/HDqia20ZX8ab
         BRTG5s4AS0N6VaYtfUspZYjkqTEQKzZPzDk5O4bHhEvMBcM51VZiIGDvlmVaGSX9xL0L
         9mZ2D8agKwhebA6UyDKin+QFMps9d58RPcwCN6jNAvo7bI31SPHzHE+2mtwmAu6WBxUK
         22nKh+0dn4GS7TtzourhGyAp0rHW2MwCc6ETPBCh2PErX1Gh1+neP6FXIwq1dKoCJBJr
         BYAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778683630; x=1779288430;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cOGLbWKWUL7zcGN6Zsk4EuadYdpgsTi6NXegh7ZSjlM=;
        b=T+MpxY53pPRuGFDzYi1wFjPl0UWEPWn1QfWr0JpgAwGAEiv0NjuXf6r+shTPqG1iQk
         tc3+rhpObNDK0W+Sb/XlZWCnAAv5zPRqlekUHrDaa3w49M/gkNU4dFc09fbeaGWPwyuL
         br36ap1ZNvQJTz0SpvwOfgkukG7KVvt0an88EJZi0kusfDPaciLn3oicN3IzqbjxD/kp
         3nvk+t3dot7eB0RotaMkGxHoso/3QeJABdERMdNwcL0Bk2ZsLD1I5suL9lQVMilfZvGR
         3ChFPR4H6zTl/QYyXhwgatKOfNJM9vsptjjnwuH5Q9vhBWltVgy61JN491pXWgzecfEX
         iUAA==
X-Forwarded-Encrypted: i=1; AFNElJ8ZXWTEJzeU7rizBjkcRTQvCA7cE8cpgyo0qzxCXbAt+/b/Or90hWFADF9bQiYDczTzgiXyQe8uiiHC@vger.kernel.org
X-Gm-Message-State: AOJu0YxmuRdIm/GrNIdCPnDoGL3N2a+TdsOP9j8B6WSkiWKTw9ThEHee
	fYw56zE4hlmv9PhG9pnazETbZmSjjSkWEnxOYgAsyRLx9nfpHdRj8M8L8wQGUWRSXuoM9F4yXjC
	lBtAQmjs8urjcXh1WO4+0YgB1xDrQ18ldRu3zh/Tko3ZxS1sRqM7iOUb/PNgkEwxX
X-Gm-Gg: Acq92OGm/HLF3nPIx0U4mY3LwJe1MV2LU0hjrp3TvIsS+3fX2EQyqU5CdKZa8XpsuXD
	foxadXKUOohTxKEu4WKgzQ4LCpJEswgF4UW2OCh7UZ/lAvp0L5KTU1GQO1uwmAcbX9Y+GYjkgzH
	qdbSqT/OIvZFReorsfMstWwTnXg4SQhJyJXZn5Vj+dFq/7xQOxfa4sy9F1pxncPhuj/7LcuHMNT
	Tc//qCaeWow9LDoYs1MOgrKWvln5wxbJj//La4JFOvQSKMHSvH1zTEeUBKFdWv3a4JXH+ReShhO
	NDjr9CUyLwnUzkDXXv29xAX4LEJf+gsU/6l5ddl7QFMFyr1shkPodhDj+H0R/ojg3lLwzo9Ru9r
	BHGZtdGJ9hKg1KNPHtsaENXpeQQxvFyRAujQHJjmV5bj82nfT5zv93PToIg9wEZxS
X-Received: by 2002:a05:7022:920:b0:132:7ab5:6cb6 with SMTP id a92af1059eb24-1342ee42340mr2224708c88.2.1778683630076;
        Wed, 13 May 2026 07:47:10 -0700 (PDT)
X-Received: by 2002:a05:7022:920:b0:132:7ab5:6cb6 with SMTP id a92af1059eb24-1342ee42340mr2224678c88.2.1778683629453;
        Wed, 13 May 2026 07:47:09 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f888e381c9sm22183574eec.26.2026.05.13.07.47.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 07:47:09 -0700 (PDT)
Date: Wed, 13 May 2026 22:47:03 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] arm64: dts: qcom: Add device tree for Nord SoC series
Message-ID: <agSO5yl2L8jLNVJx@QCOM-aGQu4IUr3Y>
References: <20260427023455.236410-1-shengchao.guo@oss.qualcomm.com>
 <20260427023455.236410-2-shengchao.guo@oss.qualcomm.com>
 <20260428-dangerous-garnet-collie-dacccf@quoll>
 <e1a84d37-04a1-4c36-b6c3-f8830df9a744@kernel.org>
 <afCxhUaxLEcbosvV@QCOM-aGQu4IUr3Y>
 <agJ-Qc71PloUM1pI@baldur>
 <agKBQ2rRtapoFlCE@QCOM-aGQu4IUr3Y>
 <agKGSaODUsI2Vj0A@QCOM-aGQu4IUr3Y>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <agKGSaODUsI2Vj0A@QCOM-aGQu4IUr3Y>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDE1MiBTYWx0ZWRfX8m3g7yReOCl1
 jOS27tMai5ytDS+MW5HBEhUvJy0JY0txcrIX21kWMC/oHI+BsWfh3MHyx4kDEjoqaRgRV5F+OoP
 nvEo5/f4Yd8FIT+mAB3zXHZeQZCZXUNuTVKtHoOZhRMmtB/I3bWkD1U2BRuooJzVIjsKm3ZtyPn
 gL9XDlDsAOCqUBl8w9amNucmW7eXqwBzYiVGsDmlXpxDPPb+nmN2wonuzW/PvbloE23kcxJzvgg
 pKi68E7wr0k4hVSAKEtvcRPUROdg0+PV4RVeGnTIhot73AkZvSxdR+fOkVlOJkY6dl5UpTL7/iz
 cCO7mFmb+p8RDbTBawo5X8o1AUeJKqWeVkICZNFuf8vv+HnHInvQDo2K2YZteMHTpPbQZRx7RfS
 kmfqcslsX6NNH2gd/XBTUdDCJheELr/hPUVoj9jpR0jaCG3R6/Qim4R5NP1k8WarAuH54KtzJ6p
 Vl1uQPUMI+1khjE81Ow==
X-Proofpoint-GUID: S4ZfjY6Bc7BBUD_VT1swO0aXDHBeVncq
X-Authority-Analysis: v=2.4 cv=L68theT8 c=1 sm=1 tr=0 ts=6a048eef cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EaVzfY0qQffko5ijWJIA:9 a=CjuIK1q_8ugA:10 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-ORIG-GUID: S4ZfjY6Bc7BBUD_VT1swO0aXDHBeVncq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-13_01,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 impostorscore=0 adultscore=0 priorityscore=1501
 suspectscore=0 clxscore=1015 malwarescore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605130152

On Tue, May 12, 2026 at 09:45:45AM +0800, Shawn Guo wrote:
> On Tue, May 12, 2026 at 09:24:19AM +0800, Shawn Guo wrote:
> > On Mon, May 11, 2026 at 08:12:01PM -0500, Bjorn Andersson wrote:
> > > On Tue, Apr 28, 2026 at 09:09:25PM +0800, Shawn Guo wrote:
> > > > On Tue, Apr 28, 2026 at 09:28:47AM +0200, Krzysztof Kozlowski wrote:
> > > > > On 28/04/2026 09:24, Krzysztof Kozlowski wrote:
> > > > > > On Mon, Apr 27, 2026 at 10:34:52AM +0800, Shawn Guo wrote:
> > > > ...
> > > > > >> diff --git a/arch/arm64/boot/dts/qcom/nord.dtsi b/arch/arm64/boot/dts/qcom/nord.dtsi
> > > [..]
> > > > > >> +			compatible = "qcom,oryon-1-5";
> > > > > > 
> > > > > > I asked you to send this binding WITH the user, because they go via
> > > > > > the same tree. I see the user, but no binding for it in the patchset.
> > > > > 
> > > > > And few others like SCM are also missing. I am talking about this many
> > > > > times already, to multiple vendors, and I am still surprised why people
> > > > > on purpose give more work to the maintainer. Well, not my tree, so not
> > > > > my work, but if you ever wonder why your patches are not applied for
> > > > > longer time, that could be one of the reasons.
> > > > 
> > > > Yes, I should have sent all those bindings targeting Bjorn as part of
> > > > this series to make it easier for Bjorn.  But I'm not sure cpus.yaml
> > > > change is one of them, as I'm sending it to Rob.
> > > > 
> > > 
> > > Not sure if you have settled this by now, but I can merge such binding
> > > change together with the dts change.
> > 
> > Thank you for the offering, Bjorn!
> > 
> > I will include it into dts series if Rob hasn't picked it up when v2
> > of dts is ready for posting.
> 
> I'm currently targeting PDC binding to Rob. Is that something you can
> merge together with dts as well?

Never mind. Rob picked up both cpus.yaml and qcom,pdc.yaml changes.

Shawn
