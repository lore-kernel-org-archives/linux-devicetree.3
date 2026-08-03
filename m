Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36D4231F984
	for <devicetree@vger.kernel.org>; Mon,  3 Aug 2026 05:30:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785735049; cv=none; b=DrhEtNCFIwt3iuXjH25I6jqCg2stjF/cBMKscSAjbnNis1T5e2P7IP0lql2p6JlKWkS3AkLQvU6Fw6W+JFMyBNdmaC86LEDRxMUT/A3yH70gRcRMBj4e0if6uGMVGjfbZuKCCH/PTMdjwPrCT/lvDqGmeW1tgrQbJeWd6/6Wewg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785735049; c=relaxed/simple;
	bh=j6lKaQqYoghcUSxUK72LGfNZIW2lj/2YL8jtsC6f2HM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=X/4gv67ITotzz1ANMmGCM7guoZoW7ounHjs756LqNkeNqGdjIRurUEnTmVxRGNpMF3I26NT0GywcdeiLRZrvrwD5+OVomTEiknDgUIHxHahrGZBLfuhfFYD9j+Q5Jh+oMeqGvRdMHe6RILN0otKU/YZE+1QMsEV3jSydRD7hq4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CEGQ+hBR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Q71FlFBO; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CEGQ+hBR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Q71FlFBO"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 672LVkkw2626039
	for <devicetree@vger.kernel.org>; Mon, 3 Aug 2026 05:30:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Z7PN3GBatwIXSPZ+D7ej6e8ycXZxHsTg6kh6N1ZeJJA=; b=CEGQ+hBRpFdkyDea
	qRHEXkS2YcW2tBnFF5mf5+W/8TeDgn5jgYHuQ6+9oFBZ2jammmpmfIgEIXSuOrmm
	wrIDhyGlz7DpT+IYBSQy+QZ+pCHgL1dqZhVU1ivaaJbqyrcL24ZwefckhOCdlDmX
	ZFCjNrqcuyzy4ZwrbJbRDbLchQgDP535McH7x7bv7tEYvkMV097ktlya8Myf0CEm
	C28f2+NPxYZClTwHiVJk7NozbR00pX39T55TPhqWbwfroDc9nnyeNTVwzZ+rlks/
	vRzIp4g6bEXZDgdGaF58Sdt/WFWSRWUXE+/xjLMKqUgYHjo2/BEhZA5UAI0D0178
	CWgjmQ==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fs9jfvfnk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 03 Aug 2026 05:30:47 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cb835525b13so3811893a12.1
        for <devicetree@vger.kernel.org>; Sun, 02 Aug 2026 22:30:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785735047; x=1786339847; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Z7PN3GBatwIXSPZ+D7ej6e8ycXZxHsTg6kh6N1ZeJJA=;
        b=Q71FlFBOM7NyLDfgLGxMcYKprxxGzKy1rWACGBIK7F1De39n34NIK4gElTKfUhKbne
         p8pkMv8mAa0CWwumR3SmAyiovngciQBaW8Fjx757l6THsU88k4WOgPDMKSJKkI0rqC7G
         HF9CBRT37/VrJjlI8BSvoPZguxJM1mVxKCbH78Ng5K3c3X9YQqIGMXPuPRUMP2G5qzK8
         2Yhq7DJr6ZvTS9JkLo7SR+hoOFfJqWAb9awU8Cvq/jdndN4hby24jWI40Irgp/X38Ak9
         np9mJekE9XPCazY8OgjIcOMGuQode6NMk0bWvV5nhSlzox3whuMgpzFoV+A0VTkfBaWO
         iOdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785735047; x=1786339847;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Z7PN3GBatwIXSPZ+D7ej6e8ycXZxHsTg6kh6N1ZeJJA=;
        b=k+Xzmz/huLZMOO3pXjU7ijHqJ/RSIoeTzOf9Vp+EKlzKBe+zqLHMQ2Kd+voaJJCKpP
         oItZE42V7IBvFkC1igBAl3c/+a0RBmNOyUNOHrnx8o924pX4vce9TMpVCEiiIzxa13qT
         eiuNF9t5ziJNOcLOD9n9Aivg6kwrr9YHqmY7X7XuL6ggHQzFcAo2WJdCYsvr4yuKyWuT
         bP4Ze7fQRuOUHaBOJL+x/6Xw9gYRImrzzOKM5OBhIPRXCl0iLs6FiWvm6lIEHq5ZcSr/
         /y2k1spXCWM3CjdZvhfRQ1B5iTyZyjMd1133FxkVMAPTzwwmEGiChaCUmmq8Ig1CJtfj
         UfeQ==
X-Forwarded-Encrypted: i=1; AHgh+Rq5C868hF2NrRXc2ykVsLFDHLve/Iom/IkT1pdDqWY04ypt5lwMbqk6LWiXyCC3/OoWydTotyaA15Cf@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+Tw3TXswJ/fpBPNdSBLeZEOnYotHZBgfIJVJBgqs4zOcdZT7c
	Qp8/RzEjlGtSQkgfmPagNf2WSduQTjU4QhcBls/38QzPjIeQ2ARnbMuOTvFzFtQbeJse0E6L6YL
	fPKkm/AEgauIi5X0Dd/fEcr+NjDZ/14OtnbS5vZ+Rp63+B9iVzcg4xv5sZFI1P00EVqtZhBq4
X-Gm-Gg: AR+sD12iQyodpZjvWCvhhUHRkZE3/EAeZPpEBoxuU6uw3CmHd5s2XaT0LgyBvph9cu+
	VucwiAS8hZxjCvqbNmcw6+PpoZCitvtJOmWQkQhLawZcLzjGvYJLPHRogIcOVHhW3OtlAtm6zI8
	tQ6SALlypSIjNsSSjcEzkqWJ9uuTbrdTHlJzm7PKFWqCRxD0XK+eZJC3pZ5ctLgGLzj9jXLCMhz
	HYnUkVepdN0GM8LI97kPlKvfqzj+hV9mGsTkX88WFgPdC9BsbN3RLQXW06T4YsXIBt/uirtqFTR
	gCgbtmB0ukjVt0mwqDx2IhhSrXsoZZUAks5fEqUxI/MtgicNDkepsbJxo6UBd86oGsoiFY21so0
	BgRMJPKKJacf5a+90sfSoMm819lwa
X-Received: by 2002:a05:6a21:700a:b0:3c4:203a:c334 with SMTP id adf61e73a8af0-3c92a8f3f93mr8422258637.55.1785735046791;
        Sun, 02 Aug 2026 22:30:46 -0700 (PDT)
X-Received: by 2002:a05:6a21:700a:b0:3c4:203a:c334 with SMTP id adf61e73a8af0-3c92a8f3f93mr8422236637.55.1785735046400;
        Sun, 02 Aug 2026 22:30:46 -0700 (PDT)
Received: from [10.218.15.172] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3153dd9c96asm35050311eec.7.2026.08.02.22.30.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 02 Aug 2026 22:30:45 -0700 (PDT)
Message-ID: <520ce780-8935-4f72-bb62-e1db58568a1f@oss.qualcomm.com>
Date: Mon, 3 Aug 2026 11:00:40 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/7] dt-bindings: interrupt-controller: mpm: Document
 power-domains property
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Shawn Guo <shawn.guo@linaro.org>, Marc Zyngier <maz@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260713-b4-shikra_lpm_addition-v1-0-3d858df2cbbf@oss.qualcomm.com>
 <20260713-b4-shikra_lpm_addition-v1-1-3d858df2cbbf@oss.qualcomm.com>
 <20260721-lurking-polar-macaw-b4abba@quoll>
Content-Language: en-US
From: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
In-Reply-To: <20260721-lurking-polar-macaw-b4abba@quoll>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: -1TO1xyPTFbQ9MKdEnSaEbiiSiwa4Bst
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAzMDA0NSBTYWx0ZWRfX094jam182Ro2
 mYMW4aj0XYkWfM0wf9FuR3PQ3yCvLAX5LBfmBN+/DHXC5Ll2Nvdnfg8hZQCoSE2kNd4/2Hsa/gQ
 NnBmbnvOOSyMVNfqPZgL+zo4BO9I+CrhsYTFeToHxSVOKrbBxll4poniehOeoUG6ppF+CaJqNSM
 08ftGHHZiUPLC17FQ09pPscasSAiwLZu8NMgbpvEE+RezvA2lBXku+uYIR0QGsQ8gko7g2chfkS
 nsLgFqwzs5nuEJ07BoLbZ/BmRywnRJMmFVDt8QrFypG0r+vlmxRDDQ+D8bmAdi7HtuY09urfx1d
 gBxsleZ0vXGZnrTtKrShClEkeoDh16hZOCVNWgsX1M1pzMapzmYeJWSW/EfquyriiPzQVc71G6s
 TX42SHGTMxUIEfj+6q4eCc9lPgYwa6v7e+/tBIST41A8FnVfoHp2+FFZz9NDQnJLsvuJbg1WeZV
 i+RoPIOYJwsgGGDclxw==
X-Authority-Analysis: v=2.4 cv=TYSmcxQh c=1 sm=1 tr=0 ts=6a702787 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=aJKyoP8-HFX-j1aC8PIA:9 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-ORIG-GUID: -1TO1xyPTFbQ9MKdEnSaEbiiSiwa4Bst
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAzMDA0NSBTYWx0ZWRfX5UUZwyANsfZA
 2N6MnKeQMYr9rZUO/eA1OYSDu0Os/BaX1d1HUkUtQWG3hbKLFFk4n1irm93BmjbWWDZ8CmE1ffm
 xJRyy876mo7VDnSSEDsls/pWwQLcvtQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-02_06,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0
 suspectscore=0 priorityscore=1501 bulkscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608030045

On 21-Jul-26 2:36 PM, Krzysztof Kozlowski wrote:
> On Mon, Jul 13, 2026 at 03:55:41PM +0530, Sneh Mankad wrote:
>> Remove #power-domain-cells property and add power-domains property for
>> MPM device.
> 
> Why? You just repeated the diff, so not really useful.

I did not mention since the explanation is present in cover letter and driver
change, but I agree there should be a brief explanation in this patch too. I
will add it in v2.

Thanks,
Sneh

