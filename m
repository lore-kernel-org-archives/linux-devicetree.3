Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F16D51A742
	for <devicetree@vger.kernel.org>; Tue,  8 Sep 2026 10:02:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788861778; cv=none; b=XA7ASvfoBwOBKHBT2UfgAjRiPAdDOsINYyHQw0Kvfa50a4CkpgAFuGHDiW0KfDu8JjNRwpmzsxzKWU4sQkLHCj7QsfGxmqiP3gwtj0G4rVMxmMEawI9FLbFvWug+uNOUoMjDPgWDYcC98siZqGduopNSx1cSuRTLtaAseNyscs0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788861778; c=relaxed/simple;
	bh=nu66mMKWC73o/vxB4qVjJ6LaMbWAWzdLBk2oam+8eO8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QKv3m1OXapBMMLAvMSXZAC2Xp6rP1alOiLDRt9GjNwbXTipfTbS78hJ1ZltxKnWU+b0dh78AGxOHpPf8N0++NotH+UUxwVZ4Y/42lqcJ2QnfqnZa1lxHnn7/cJEc0x4LjpoVoNGKU9gc9F/vNwYXIBuzrcJiWNdm8fJUmxzhnPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=htKLF1O1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bmlbbtOt; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="htKLF1O1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bmlbbtOt"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6886LdB93299143
	for <devicetree@vger.kernel.org>; Tue, 8 Sep 2026 10:02:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=hRAvu4aI94s4uQ+esf+PyyrN
	kw8w71mQnH/4hgf3JqA=; b=htKLF1O13lOBNYC6cLwdnixMeOgCvTL+5V/epkaV
	blUgbw7g7doZydVZpM4KVw3uJKruk8AbYYE5RKFaiLZwVnwMsSRGUhKsGUcL+b2R
	9GcA9S6Y17bEk/OKoDusc2nDfnKUEIpqdS7qdJAyr0RIRHbXER8T6r9Q9H3yxMDZ
	6KZ6pBtfCKY94KpNl+GA5HPD/EtLeOT2RqrAuMuJ45xWKVqj14c7lQRDCdLpg9dx
	/kIERbObmdi/mR4OQsaigY0jk4tJq+uBGCTZaFE7GVFWr5j6NoekeOf1yllT54VM
	KXaI2dT3zOaQQXM3c/qyPfqRf84qRcXlZqkVX3auoAusaw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gjb0p9byj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 08 Sep 2026 10:02:56 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-396901263b6so8078232a91.2
        for <devicetree@vger.kernel.org>; Tue, 08 Sep 2026 03:02:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788861775; x=1789466575; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hRAvu4aI94s4uQ+esf+PyyrNkw8w71mQnH/4hgf3JqA=;
        b=bmlbbtOtFgyk4FDDY6LnUE0DOulv+18vpox3JEYznabmOaF1dAzugD1YmFzx1w/Tjd
         JXhx9mNkKdWnQNvqVkGasd1qjVfFNzXxeGOb3g6Sy7Shyo/L01zitDSVu4Bn4wbqvuRO
         7mGNWYjkYJcNQThs4NuBCQr1rUaybIZO4i+ycYMm5gH+JxjRglxUNsVMGVKgcOw3tU3y
         O+zekmN1tF9oxq6X5H4gzgtu3wJH2K6BOe03exXehL4VE3JY6AKvOuUSNmJOirMHJia9
         7IFdtVtx3TmgYfcb1kYZMJ+ZJGBo6/b0i0ZwXHsvO9k8tQCuoy7YBx7lLdZ64DitKVD4
         TtBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788861775; x=1789466575;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hRAvu4aI94s4uQ+esf+PyyrNkw8w71mQnH/4hgf3JqA=;
        b=HguSaaBNWKZmj9h0n6dhiwmkFQwM7LCwieNRX7LXy74euELwcAhh71LfKJxHsKqw73
         V6DCv3iaBc1i88N5gmnMXj1cDkk7d0AaHHoDQU7whh5a6rhObW+7cv1DUHwLYk7NBP8J
         4DTxZkppAL81gUnvUMZSZ9H1scb0bUjnSMQaAoVgM9JDhA7XXqjI+/eTpjwx3YmIrqEz
         qQAWaYdjXKvqKmTcvr3xn5cb5ALUA37sJ7LFd6qAZVFejghNQBfkfUVDBqCrR+zv08kx
         MJYDa9WvSmZiGoBvMoYgPIO/0Qf9sk7yjPpNabrQTXPtsU8Azs2iq8Nz5j00duHnqV1D
         GY4w==
X-Forwarded-Encrypted: i=1; AKwUvByqycyQ3bINxGq2eWk/0SjvtH+d9QzJedTaL0kF6iTWb7aDZzBPM0jSs7IdDcVsnatDvd7txC8p2+KN@vger.kernel.org
X-Gm-Message-State: AFuF++lamY/QwGMfrZVeQwH1xvWSAzJAXsAL6bUlh6JLsHayHpd5m5bA
	iZzaMd1ofFcMOLMtdw9iYdLvcYgE0pkLDdn6Wm/EsKxQS3Mmbqr/NHPlE5keU1nZjhhhdhPG53A
	ijhQZicHbSZTyx3/tKXPdUh6mMXHC1GLyjJb9NQPbNMGcZSD9UyO3kIb3BOOSWOMN
X-Gm-Gg: AYBFou1rJvRPvaCDywN7LRjMOAoOgHF1MKLIHWZsIdZ2FM2cboFWywqo2VauumD2Hvm
	d0H1aIysj8OKZOX8oSoVUNa6lkMIOyh46sutzU1hCpSh9996lgrxxwLd6+ll34HwQ7KcXLaI+xY
	BfM4yQelKqotjPMR80tSi6OQeL6whNgrzFze6tFMkidrKRhrjRAL5Hj+3wXDkjIBVjh4sZS0TnM
	7Gfku8icE9GXvovHCd58Ux3/DC5QRvL2gWqSEnpjidX/TLkYItormcAKNvCt9iI6pXVxBWrSpSW
	XnB+FEVpJ6ynpfPU/Jta5op4eNCpIYJWsOm0LVAM28xaSSJmN9346NI7l8S6Rrkt8SBH2OnxkIT
	SzbvITg8v94pPNg==
X-Received: by 2002:a17:90b:39ab:b0:398:9be8:ea68 with SMTP id 98e67ed59e1d1-39b261da75cmr43496163a91.21.1788861775458;
        Tue, 08 Sep 2026 03:02:55 -0700 (PDT)
X-Received: by 2002:a17:90b:39ab:b0:398:9be8:ea68 with SMTP id 98e67ed59e1d1-39b261da75cmr43496037a91.21.1788861774900;
        Tue, 08 Sep 2026 03:02:54 -0700 (PDT)
Received: from oss.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1434c745a09sm3818443c88.7.2026.09.08.03.02.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 03:02:54 -0700 (PDT)
Date: Tue, 8 Sep 2026 15:32:47 +0530
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Anurag Pateriya <apateriy@qti.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Richard Cochran <richardcochran@gmail.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        Maxime Chevallier <maxime.chevallier@bootlin.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org
Subject: Re: [PATCH PRELIMINARY 0/5] arm64: dts: qcom: shikra: add Ethernet
 support
Message-ID: <ap/dR6Wn6IhdROZK@oss.qualcomm.com>
References: <20260908-shikra_ethernet_dts-v1-0-69c0c5c7c124@oss.qualcomm.com>
 <e9388ffc-ddc8-456f-ad7f-1d185d35ab69@kernel.org>
 <ap+zd/2QmerMwi0o@oss.qualcomm.com>
 <c23369fc-84ff-4881-8327-c18fc3692306@kernel.org>
 <ap+3+Xhq6ygnPzQ7@oss.qualcomm.com>
 <ap+7oEcW6GONVdEk@oss.qualcomm.com>
 <c0e617f9-202a-4786-8383-2ce7567b7d29@kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c0e617f9-202a-4786-8383-2ce7567b7d29@kernel.org>
X-Proofpoint-ORIG-GUID: MHAt1IdjE_yM4f35OIWq80yfgXkJ4vOB
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA4MDEwNiBTYWx0ZWRfXzSNYw2NGEmkI
 as+hiUp6i25ORWnCnP20jA12V3dnU99RF/2YnpKP2ftRpMnLjmVTu3TsNEhWgtlJlBaqVt6xvJ2
 0vNai4QBP5fLaNbw9GN2qyP7SUny0uk=
X-Authority-Analysis: v=2.4 cv=HL3z0Itv c=1 sm=1 tr=0 ts=6a9fdd50 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=2Yymz3qdJ2OcZe8EWdwA:9 a=CjuIK1q_8ugA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: MHAt1IdjE_yM4f35OIWq80yfgXkJ4vOB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA4MDEwNiBTYWx0ZWRfX6K5xpHPU7o3l
 6tBrt3RHtVzVHcyyNMVtmF9vtkLkQF9UoWW1sroYuLLZWim+EVROO9Cv45Ub//yPWMWd9VtW3Kq
 HzKELaHRLeLAaMYBlZmspih4Sr5hHkyVvcexu4NqjZNMw9FqtBdSGjSb8b/joVho2FJHa4oeN0M
 jjNlMyMYoWgOHkg7q+v1MmD1ergoLA99F00ftFB3ls24DVV8HM1OwtJRmnmD2YXDjzj+GkziyBd
 InfiuzUU49yM8H2MDDXW7LT1HezDe5ko7zP/Qrbh8kztW1hI6pXIwIDry8aPXU3NXcSa6aFAaq/
 XrUPwOpm0GCW5Sqa0+bbudHy7TxRxElKhDxpG8zMnhPqOthnKaQdMLD9heMXsBIhN0kHCmvXuqX
 zDCE6paTEIzISbSBhRkE4odoSebfh3Szm88j8Yh17uuPSNSyYwPfSbDcUyXvG/JKb2EQcyl00nL
 0dODKfnC3/qSD3yOn8Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_01,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1015 suspectscore=0
 impostorscore=0 spamscore=0 phishscore=0 malwarescore=0 bulkscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609080106

On Tue, Sep 08, 2026 at 10:42:40AM +0200, Krzysztof Kozlowski wrote:
> On 08/09/2026 09:39, Mohd Ayaan Anwar wrote:
> > On Tue, Sep 08, 2026 at 12:53:46PM +0530, Mohd Ayaan Anwar wrote:
> >> On Tue, Sep 08, 2026 at 09:14:45AM +0200, Krzysztof Kozlowski wrote:
> >>> On 08/09/2026 09:04, Mohd Ayaan Anwar wrote:
> >>>> The only reason I added a PRELIMINARY tag was because these DTS changes
> >>>> should go in after the driver changes and dt-bindings.
> >>>>
> >>>
> >>> DTS cannot go after the driver changes. If that is your requirement,
> >>> then original work is broken and needs to be fixed.
> >>>
> >>
> >> I should have worded it better. I am only worried about the dt-bindings
> >> going in before this DTS. The driver changes just add support for
> >> whatever we are desribing in this series, they can go in after
> >> dt-bindings and DTS without any issues.
> >>
> > 
> > ...would it be preferable to instead have the split like this?
> > 
> >   - This series + dt-bindings (on top of linux-next)
> >   - Only driver changes from [1] (for net-next)
> 
> No, because it would be against explicit documented rules in the kernel
> and against clear guidelines and recent discussions within Qualcomm. I
> wonder why did we have these long discussions about Shikra if only a few
> people were listening and the rest will be repeating the same broken
> process as before?
> 

Understood, thanks. I'll keep the current split (bindings + driver to
net-next, DTS separate for the SoC tree).

	Ayaan
