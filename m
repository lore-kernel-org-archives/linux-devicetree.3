Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83E9146A5EC
	for <devicetree@vger.kernel.org>; Tue,  1 Sep 2026 07:26:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788247586; cv=none; b=N+5f8qTQ8WD+97+1ULzNC5oKXhnk4hA65y/lFJETGeEW/lbkew4caAqKjasFVm97GWcGGJe7tRnQjSsb9rxT1nG+EmAlEObzNC7iutD6r2COJgpsqMUXCx0D0qpFHgHmLS0Xt1IZVR3bHdUqm4ueV8eGhnqJ/oP7oWKbOp34zSc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788247586; c=relaxed/simple;
	bh=a9DqKCNA1iCgEPyNHVkOQxKyQBg5z3GBAmuX+hxQkzI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qlP7btIoRqIc6j7T5IevwDk4N6iNHTZsH9VecVKrfItMrnTwJ00MENfyEiqXQLayPGG/l1/vTZ4HhWbenK2BSt2wH6+lscyws7AW2Fom8Tq/ZEn6HBEowVTm3KXET+mNOGe8NAoCK/BI9AQ9UGzvYkCW/nakJ4O/DZta42cNLEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VafbF0JH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VFhLdaLJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VafbF0JH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VFhLdaLJ"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68179MU81709660
	for <devicetree@vger.kernel.org>; Tue, 1 Sep 2026 07:26:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=SyyheYKwgD9MhO5a2LPElNl4
	00Uc8fYDajgPwssWuJM=; b=VafbF0JHOkDOl/27cWqAPQXLmE4AUGMUOd2FDfcE
	pKgjxUgztdRZ2b0tdxdMhpR6YodxzFp1DC5Mgg8DlvprceFRmJXJQEPsGAQtkPeH
	VuND4z4UaHzL4xcjvYaqMHI5B8lclep1ZM5AwwoTw4JTMNeLiS7RdHIq+Nxr1S4D
	utI1BrpRPEkqt9+9xnn9G3cYhPIxSYwvsoDb3ezrEzW9wOvA7CwfwyI15jgMc80Y
	Qbjz9puQl29/rszA2gRoTccazThevOngjFoZXqG/XBjfyDogfHAcC1u40KF0yXlF
	xv7eXn8Md8Vpvfa2KbwklPQbehguo/SJzOcgKj5ss5MBJg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdp8fs09b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 01 Sep 2026 07:26:23 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-938153538caso111103285a.1
        for <devicetree@vger.kernel.org>; Tue, 01 Sep 2026 00:26:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788247583; x=1788852383; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SyyheYKwgD9MhO5a2LPElNl400Uc8fYDajgPwssWuJM=;
        b=VFhLdaLJQ3Fy+RhxRx0vRruKw5Xau7ZDHv5WAsuwW7vcy1lgq87zC4yZqXs6O/Ys0Q
         uHUEUD3x/CMfdwgXwomV6BXihQ83ESky+mQN/JyAS1ClaM5lNNnHyWV9dbvyqmCFBxin
         ALn36l1Ee0Kk/es75iMksNLLaM3SS9/JzX0kVubRHWcv2LIp+oL9PIuIDQB2pwnkLSGU
         KDMl5ShbaoDi+RE5n1zR1Cngd95qaYEw44y3+P5sJMG8TFK7WQoRLerTwaTW9OC0hw7Y
         MCHnULuv+zHYBkbI8lNywDZWjTvyZVbUuUy2osnEErI1jBLep5gsrvZZQ/XKE0BmqXR7
         s2sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788247583; x=1788852383;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SyyheYKwgD9MhO5a2LPElNl400Uc8fYDajgPwssWuJM=;
        b=ID0XjtU5U5pEBaj4dxVN8V7+lAbhPUFLCpQ65MwrULfNAFC6b/5xsktZHxOwOOsCQ6
         xfwH6e2y6O49EEwAL9JZ4BqyGYzbq2E4dl2YXtxQW9W4MAAyw6aMzAeBuEIFHhUqg3FB
         nQ7QYs05xBc4fGFXXD67OZqW3jcrfco7HffrU6fqgex50Y4gOmGnus9hPC/it8WMoxpQ
         tMrB43Vtc+cMz84FcJOs0XW+6v91kzYaHOd6KpRxxOc8b+EaeJLZ0qZWUMPZ5Lk/4ibe
         KkaE6sd7ZqCyILtyASWrqw4PMo4276L5AeQMiA82t5+LoaMhEZnJSLbZDEAu0gshI4Vp
         RNIQ==
X-Forwarded-Encrypted: i=1; AHgh+RrWvADgCX5gQfxI3bWoH0x4AphZaMT9xRbR3M8h8+IcEyPyQmik/dRK3zHxgoCZrHKY95uYiUdo+gDB@vger.kernel.org
X-Gm-Message-State: AFuF++kplnBptvwMhSgJEW4MiBiQGFCKoJc4eW5pR+NPtwASktC2dCMy
	/IiQ8Zav+alv0ijU/8rwdtmuUDcV9hljniKjsen7YvCOnUqQJYRDBneXx4pKvmOTuN9llsRN0Dg
	u7ch/8fw335tU0Zr2u8f3OrapPMla9WWxk0BTFWN7gyErwcsXERz2NC2Th4jUqIZF
X-Gm-Gg: AR+sD13Bb9d9p6g8IKtT5t4EdguYmu93PEXJqxvzD9QJzK42quTqW/2GgQfX8i62+VK
	dSDrfJ+/A0TC4w2AxrMPls4NePswum1D6tt79QtgGWHwVF4IXdXj4D0XNeefFgTz7SrJYx+WqeH
	VMESylwfAUQ2D6dHr7ishfDr+6Cf/SZFKr6mKVhjJA/Mkkr7f80pkykCAJJTz8RavMpwqTW0c3e
	neAj0auj2Mn7ezeWsHbkuhWLBqvQ1DYBf7YrZVlTSZMt90gHZxLJJzE1GLj7XUW0A9Wx9MUJDJR
	Gav254FF3lUYjOev7jlvi69NmKEIJeXpLT2uAlmeLd+sI4OmKK7V2KeftQSzh107YwYyK5inOfo
	NwMxVMyJVz27r4A==
X-Received: by 2002:a05:620a:2908:b0:934:81ae:6d1b with SMTP id af79cd13be357-93913903c4dmr3456672985a.22.1788247582630;
        Tue, 01 Sep 2026 00:26:22 -0700 (PDT)
X-Received: by 2002:a05:620a:2908:b0:934:81ae:6d1b with SMTP id af79cd13be357-93913903c4dmr3456665885a.22.1788247582113;
        Tue, 01 Sep 2026 00:26:22 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.178])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cdce1a3fesm48344405e9.12.2026.09.01.00.26.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 00:26:20 -0700 (PDT)
Date: Tue, 1 Sep 2026 10:26:17 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Alex Elder <elder@riscstar.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, mani@kernel.org,
        krishna.chundru@oss.qualcomm.com, dmitry.baryshkov@oss.qualcomm.com,
        sushrut.trivedi@oss.qualcomm.com, umang.chheda@oss.qualcomm.com,
        rosh@debian.org, jsandom@axon.com, daniel@riscstar.com,
        mohd.anwar@oss.qualcomm.com, lorenzo.bianconi@oss.qualcomm.com,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v2 2/6] arm64: dts: qcom:
 qcs6490-rb3gen2-industrial-mezzanine: clean up PCI function nodes
Message-ID: <2a3ofethirhgwfppu5y7oralqvcswbsral6ylcgniojetd5bma@puoiewtiavtd>
References: <20260901013654.1343537-1-elder@riscstar.com>
 <20260901013654.1343537-3-elder@riscstar.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260901013654.1343537-3-elder@riscstar.com>
X-Proofpoint-GUID: dQYxWsPnDJn5Tu8WzMyQ2lsu9cvxIVx_
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDA2NiBTYWx0ZWRfX0yzcVcDGlb83
 lxEuYlruckkhEKaNNCQkXA2+KMQS2pG/G25wxnNnWAcCCrMAKO/7PBBohGGCWaj7ISlRWNmKhPE
 G19648ZFrlK6+zTNzdJyQgLaw5TpgJ0=
X-Proofpoint-ORIG-GUID: dQYxWsPnDJn5Tu8WzMyQ2lsu9cvxIVx_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDA2NiBTYWx0ZWRfXy7vQlSLJXvqe
 7ruelQMH2BcZQrCfD+kL/LIwL+JH0CXl30jSlC3OAEuxBrVoC8iuHLQt0Cr4+juMKmx1m9t2Ka9
 47+uw7CArGJDcbHlTkM5JJ6ti++NRVrqM1Gat5Af5gpJnj0CL2RokMdNHvFjavSt5WyG+GS5EWU
 ZoDIa+y9rHh2Hr8fB6ExbBMrU2f+Fw0z2o4WC+cjIkDMdh21nfkDy9JBoJXUH53Vd3GcC/vPsCS
 c88xRyNExU17Exdxf3NvCZZ492FsGMzmTWSbZMVciOBKdkbQrARX3QilXjRU7VNQc8nT9JKLH6O
 hggXR7VS4yC+CqoMDhu6Yh5lfwp4BqW1OBpRXBXZg/HzIKsCHKpjyTqc+67K7RvzZMVSfbBuZac
 367uJzt/Zs0MqjgNJvjAg2c/0eo+mjMGEQsi0OTj37v9TzIxSHnpHbgh/nAbeGNpU6H1b6UtNWx
 bCFuJxwiv7qzepEPQYA==
X-Authority-Analysis: v=2.4 cv=BPWDalQG c=1 sm=1 tr=0 ts=6a967e1f cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=G5ilVN+faPP2Ze1SHB4iFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=ee_2aqc6AAAA:8 a=FuJlbAGUYoPPbcebnI4A:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=VOpmJXOdbJOWo2YY3GeN:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_02,2026-08-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 phishscore=0 adultscore=0 spamscore=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 malwarescore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609010066

On 26-08-31 20:36:49, Alex Elder wrote:
> The qcs6490-rb3gen2-industrial-mezzanine overlay defines two nodes
> representing TC956x chips, each of which contains a PCIe switch and
> an embedded endpoint that implements two PCIe functions.
> 
> The devicetree nodes erroneously include a "pci" device_type property
> for the two PCIe functions.  That property should only be used for a
> PCI device "that implements a PCI bus".  Remove this property for the
> two function nodes.
> 
> In addition, these nodes define #address-cells, #size-cells, and ranges
> properties, which are not normally defined for PCIe endpoints.  Remove
> properties as well; they can be added back once they are actually
> needed/used.
> 
> Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Fixes: 4559b435f741b ("arm64: dts: qcom: qcs6490-rb3gen2-industrial-mezzanine: Add TC9563 PCIe switch node for PCIe0")
> Signed-off-by: Alex Elder <elder@riscstar.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
