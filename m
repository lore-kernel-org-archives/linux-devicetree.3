Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 242762E764D
	for <devicetree@vger.kernel.org>; Sun, 29 Mar 2026 10:23:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774779785; cv=none; b=g7JFkLoUHEkznskZtZFHXsvY80L8FYMYzkeOUADHPJZPAQUl4bzVt3je10B9ySZaGOYyoJOPRjrVzmjZx6+LgEr/t4wzR88fBZDVbBabfi4aUzUfn+8ygIdQk8GI5DEGxBms1sLA9D3tSkB3wDyRBAYc8Y5VV+Tlp9vq2Vh2QH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774779785; c=relaxed/simple;
	bh=1B3p8t7p+sNp6smp5yfHHFK4FfmnNnwgd+F2bvVNRZE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PfR4yNlprhK/FCmkcdxMyNXG2hFhmPRMXHjdFDR0i0IoihYciNTF8e6XNTZnxf6v/N8grLsR1hrKKVATfraeRdFpSdL+WDQLxlPqW/qg4Iyoqb3FTvedn8xfAOE6YfUQpuBI1W0OoDf31e15n3zGj2nVnPrlnNjcMc+uThy75H0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=i4ajmDHD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YPHrhe6W; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="i4ajmDHD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YPHrhe6W"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62T3TJDV886212
	for <devicetree@vger.kernel.org>; Sun, 29 Mar 2026 10:23:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=WjruFqvQGpvNJCs904A4Sfzy
	trtbC/kUoihmkvmtPGA=; b=i4ajmDHDD29DW+HQ9EDQh9hR+QKxlVE/8KJZTGCE
	BqBmPNmVDQq+C7AO5VQPVyR/CPz7ZwcflmOiNG4FxcJ4vk7z2/HVIwv3AXQRz5IQ
	Ps8e501kdwnoSDoCyWa8ACmMBt6OIJqdFN/wYBI1uPyrT+5Fc2UfKOefynrKkMP/
	wu7zrnvkmDjan1HwQksw6013YU5PqlX3aogKVy4OPHdExDgPzH7dB1THiGBC0apc
	1p9H/Ev+CCYO8Ews0nbysMwnsNeOMYnZfK3AxHiUzY32/0cIFU3k3Hm040udX0py
	SKqVPtUL/6BFrrcNfigF4hb0UYc1n5gm5GCjzv/KgdXTzw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d6ufmgmae-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 29 Mar 2026 10:23:03 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50b2cbe7223so117689371cf.2
        for <devicetree@vger.kernel.org>; Sun, 29 Mar 2026 03:23:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774779782; x=1775384582; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=WjruFqvQGpvNJCs904A4SfzytrtbC/kUoihmkvmtPGA=;
        b=YPHrhe6Wfi7J8YjfFqIX++lfNTCgD5sYC0DWIEoPsi8GaAvPPwXfHeadEZ9U+0Zmjr
         IMGGLZ+MksNKWYIOBsY4B1+/RN3hmzCgIVR9FdtImiFyHQ3b0uAxuXKpRq/cLHkccaGU
         mxhnYbNljFeV2QDKgoV6nuGpQ+pbDzm7a7bNeClQVWBWQY2y7kJ+VAsyDWphprMsv8Ac
         6bz8SXEcJmJBdmMS78K7aIVMFsU3bqarp+bILeE4ZRtUNiaP09F8dPl+foEqUmtPLIso
         A323K5owkAq9Id6tXcyynYgVvTVAKI8pHpDuzStQeblN8FApO4ykNkSJ5r/CpqkadwoK
         Ic5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774779782; x=1775384582;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WjruFqvQGpvNJCs904A4SfzytrtbC/kUoihmkvmtPGA=;
        b=jVFdEh50ajNJmzBzaN+G9phLHcNL+EY7Xe01VBzZVg39ltlhLcAFJEL94yn1slGIaP
         IVR/hQvK9GOyITtXP5hKldF2urWE0wNI5U19QHc6bYlU66OWClr8400CSAi289+wPGuc
         4IZJZOb/ZN8kLaCIF/wdAYy/vQKWFVruwX0sEEHaMslntUEB+1k5DTQ/e7lS2/aAmg0k
         NbOlGUo9CD3mNVG9lFa2XpzkWeRpViaXY33nSkCn+aV/jufQvv8cp6cJs6lF0LBfRcrw
         Sl1IAXHc7jEcqLiIVh46qzvXUUhQVdA+qCy866FeZPHnHKmbpXfGdm8/TNAaXi/V/k5M
         WsHw==
X-Forwarded-Encrypted: i=1; AJvYcCUyhvaxJrZ6ovICBglaVHFlKc3vN54MRg1KWOqttOkxrcCt4QTizmOUq5ect51UzrplGmE2MS7uNdci@vger.kernel.org
X-Gm-Message-State: AOJu0Ywz9KKt+8fIQ+P+33vBUWdE5T5B260INm9Jmgdm1I28fp21nHsf
	pYV1RinQKe5y0VEelG7Z5UYjHVF4sy5U7zAfIWIKCGCgKIAn1a+ZPSX/EcEG97EN98GVTSMzxXp
	FUUbl+e1d8hoNDKb0SW8x7zUDBIF3SH7KvpytonJgX6L5AM7hKOolSjANBTItOcfJ
X-Gm-Gg: ATEYQzy3Ib96aQ7p2LlR9qauy0sv6ZNTY8GaGIj0izeYZL2kLyFSG9wgE5dayc/2AXU
	6cSCz0feyfdU5YIt97Vk+JvJqyZ9f3F75tGN+s9PylzejURGhACID3J88vK+7eDg/EKfkK9ZgWX
	IkOuaXLOgWFi0h2lEr/cyUI1oZ8ABM5kkiVVEGMxXouCkZxaph2oVMLgZES2Nj91/jEylLuIFlW
	FTBqbdLojOGTq93KwlNVGYqikULui6pQRGJcGUB1QMncJwTd2712f8zts0aJbfyeqEFgc5tK6RG
	AmjQtW7wNGvCa7HmyhtzOYqeZtbCiEuS8kppI+slMnQUg9jxD/x3bIUNw+qli2o1PD5Jz7s02tP
	kPBVwqjtPvBJ2CcA/e3kmc+TWEY/PTQnqZCJDaPfhwGeejHOYN7CxK7JoFNRSnKsHvi6W5C59E9
	FxfL7ypysKjSxSC6B9zwUgMOxQVI5bgL5WbYA=
X-Received: by 2002:a05:622a:1805:b0:50b:436d:dcc1 with SMTP id d75a77b69052e-50ba38320cdmr117928951cf.26.1774779782368;
        Sun, 29 Mar 2026 03:23:02 -0700 (PDT)
X-Received: by 2002:a05:622a:1805:b0:50b:436d:dcc1 with SMTP id d75a77b69052e-50ba38320cdmr117928791cf.26.1774779781947;
        Sun, 29 Mar 2026 03:23:01 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38c83903e44sm7941931fa.40.2026.03.29.03.23.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Mar 2026 03:23:00 -0700 (PDT)
Date: Sun, 29 Mar 2026 13:22:59 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Tobias Heider <tobias.heider@canonical.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] arm64: dts: qcom: fix remaining gpu_zap_shader labels
Message-ID: <eulkgepkilthpnmavdyt7vyd4xbyieuilxnhczxplrarkf36dv@4mrclcnlpxdd>
References: <20260328-zap-v1-0-f6810b9b4930@canonical.com>
 <20260328-zap-v1-1-f6810b9b4930@canonical.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260328-zap-v1-1-f6810b9b4930@canonical.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI5MDA4MCBTYWx0ZWRfX97KBKXz/z/wW
 8tB9Eqmb74Jml/g1xqkza80Oif3YB3xh41Vcg4riAnbvWaGMr81L0INCh4cJNHaKuv+ie66Mgtf
 1SSThNHf5kvWo9nVMNZWJH4egkm+8UDT5sydHnhLj45Z+B2+8IndU1oDkRjrJMc+FQfXSZvaZE2
 r9YYdMV4lGFApMO+2TfYXr/gPuKjHZco5+QXQA6w0jZswDgsnq+DThsxFl5+a4ZTZegDf5p/6V1
 MxkDKZFaTRZFUQbKLhCvjkE4IIo/8HQ7onOtNRcTQWvZJB/VqGh3giv6P8MDTRx4OEmeftg5Cej
 ZtC7f0t7g8iwzKm04yflOJ7bRkAaIMEPEJSTyxNv0l1EoJbRiZTmcdoGcmxsbhd/KWpCpNV0wng
 4JNN5vzEcx+f6FtdlsrSWVSAqlAyR99xKnga8rZys8Ir3jYGCG/Ld6J9pyXReNDx5ToKZmnPLqP
 we7cLCpk1Zlq12O6oJw==
X-Authority-Analysis: v=2.4 cv=aOT9aL9m c=1 sm=1 tr=0 ts=69c8fd87 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=DfNHnWVPAAAA:8
 a=EUspDBNiAAAA:8 a=vnj7qRFnXMJaR1x2dbIA:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=rjTVMONInIDnV1a_A2c_:22
X-Proofpoint-ORIG-GUID: pBdqXYKwfiW8hR6JxSiGNNQXJSi7kyCq
X-Proofpoint-GUID: pBdqXYKwfiW8hR6JxSiGNNQXJSi7kyCq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-29_02,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0
 clxscore=1015 suspectscore=0 adultscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603290080

On Sat, Mar 28, 2026 at 04:49:21PM +0100, Tobias Heider wrote:
> Most qcom DTs were converted to use the gpu_zap_shader label instead
> of patching the gpu node in commit 2377626fd216 ("arm64: dts: qcom:
> add gpu_zap_shader label"). This fixes the remaining ones.
> 
> Signed-off-by: Tobias Heider <tobias.heider@canonical.com>
> ---
>  arch/arm64/boot/dts/qcom/x1-microsoft-denali.dtsi           | 8 ++++----
>  arch/arm64/boot/dts/qcom/x1e80100-medion-sprchrgd-14-s1.dts | 6 +++---
>  2 files changed, 7 insertions(+), 7 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
