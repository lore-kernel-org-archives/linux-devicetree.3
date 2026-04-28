Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB3FE30B517
	for <devicetree@vger.kernel.org>; Tue, 28 Apr 2026 20:38:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777408715; cv=none; b=cbLEAjNmNIr+5bcrC7EXEd1o1gXUdNwnFKzgZ+mTzHTjyvmfsR7Y8yv1m55ICl8OBHTCgUoylh6YmaPbVsbxnOuhvkFsv2ybbt1DVn0YS/GUrghlnM2m2hlPYTD7/xg38wTLcfdyyLdBoaFlg6fWuZUeRr5AY0xXyqd974+X9Mo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777408715; c=relaxed/simple;
	bh=Vhz/YEl8fzZYz+/Z/DZ8cnbFQ8l6QVcRyVKTTgCKtZs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GQHISaV20TVMewys3xkI1SXjkG3ngUYF9VWj6X9FZf99wtbfXt7Mkecru6RfXrxGNSHBvtvouDnoY3upwIMWlYrPNxOCTfs7QXlGbvvwlVP27Fs/Ps5HBoxoPuccSV8hATpzm1eYfvxLq6XDEFSb2lIXWvmjVuoVJBNgEZzBwTk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KxuPUb5W; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LqjpCdYk; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KxuPUb5W";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LqjpCdYk"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63SFsTRC1796707
	for <devicetree@vger.kernel.org>; Tue, 28 Apr 2026 20:38:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=qIIMGujOvILN3HT8I/n+2QFM
	OwK60Iic+R2+EUaSQJM=; b=KxuPUb5WSzixO4OYtVfmdZybz/nbwtwm+JrFzqlA
	1iMFHyayoV+unUSS5MTEP0gRhY03nIm70P7lNgFb1V2kzz5oDrbBpbSGqG+GFCW+
	aQ9k8ggDBf6k+eBNnbUsHCrjxrrrAeo7Vz98+1RKwFYt5CBMzOn7I92w3lysZ6sd
	AAJluoM1Eewkz67m86FJ6Eidv4eOe8Il9NZa8ATUW75K9uLYLyvVW+cO33nAbMw/
	vbHkl1hW6gOfrlFu6bzqeDxSBt8eSNEKzXqd3r96IHQOlpZqk45QsBVKaKtM7sIC
	x9pcW5UqyXVUa+AG9Sbr2svoX4rNhywMdiz5jpuKUntAlg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dttt2tg74-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 28 Apr 2026 20:38:34 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50e5a336b44so6319161cf.0
        for <devicetree@vger.kernel.org>; Tue, 28 Apr 2026 13:38:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777408713; x=1778013513; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qIIMGujOvILN3HT8I/n+2QFMOwK60Iic+R2+EUaSQJM=;
        b=LqjpCdYkGMlZBVeOphFLMXC60yvm6Ylx0gCoqpbvmQJ1D92lMd5cQjzvtOMpTUYTu3
         Q9UxzBRYxiLPH5MTrRvFICGKe6hPT2Eve4WmT8xEeR46Q53U3gs5Ikj4uoEVxh5rfRiN
         iprjnB2Yu37cGY/YNqewUMEoF0mYvIJh3nLKOzfR6gYHwKw1Bpb2lYa1KYpwFZ2spqaE
         KfRSOH0Q/1NAIG1AuI9vPjZmMT0HA5RODyEAEwJfcRcxW8GpjClxjuubmNXLX1oQEfGo
         IEGaSYo51rza51Vdt19l1T8NWRTngkgi+l8nd8sPjv7wglb8ohW0yD9+nqZ+84f0fgWo
         aXRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777408713; x=1778013513;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qIIMGujOvILN3HT8I/n+2QFMOwK60Iic+R2+EUaSQJM=;
        b=qn+ERbvanqBx3fbkF2OjX7o0ZK9u5waYWTf4Aj1lG0uAxx4RmF/mSBIPWAwmxqDe56
         LW0uzQHSLn6xH8pEpVZeYRokZfM0BYInpfk1gvnZeCeEJMXhegvdGMi4hdevFg/LNR+M
         bvwDd8NAoEM3hX8/hFoKsU6ImnsVOn/S1bOS2fMljRiaP3wgALO6wfsdFMY2S1qPt2Uu
         GNFYCnbHRxKM54f5ZPgianJEGEO7rv2EwQ772HVx1uy85IsLRrBTfZZ32XKeJJ24K01x
         T7tNFJoMZ45nbzTfCRFGPASIkDCTxMnmtCNO9RWsFmIP3NqSOBqi/+HTTWY3JG8iAuP+
         tldg==
X-Forwarded-Encrypted: i=1; AFNElJ+IVdTQZVetaqKQChWhSEWck8oDG4ksx0pQhbDhGz0GbHowbHsbYPEQRI+LqKMcJ8U12EaOZT3ZInH+@vger.kernel.org
X-Gm-Message-State: AOJu0YxEp34YPmGmDbI9KNhGE8cNzF6/+D3fJ7cM5zbLotTtJpgsCl5L
	7WWa5paZW692dXhb1KUPl21khZlPNC4Dq8T4EiMUe/VHmpEAglTZj1vkJApQMlWW8bXbkumAz/Z
	+ECh7umrundmxNF4iEIlSzsv5W5fLxbzijVuogJlFNDBpyagAxK5C93zaWZ8+iAF0
X-Gm-Gg: AeBDiet7Z3otUGS/TFr6BokZmrRvBdb+oH3lBVtRrAdyzDzrshlKWlDrhkAjOv0UGE4
	hcn+ZW2/s/mFQGFE3wsyuItD+vX+KEppQVmVkLvkuufDKbuc+fS1q/YY+Y0ZSiiKqF4dwHylIcq
	EF8G85OlVMFu0gHJKzZSAd7GcSdbtBltY6cU+mfPFJ+abNrkuXvJacQOqzBzf93bI/aZod9P8Ux
	KdmuCeMH7qkVG5E8E3DON4kbx2ImgFioik7iuHjCcJadrk0OHIpMjcDMSw/Ft76godSrMwn0coi
	9UOVKXaXSg83hkQllBVND0tyJqy+GmAri1/hZ/YsIvkayz213Oo6sUjdylHtdyB3EwdDUN913q1
	SxYstWOivYvWJF2lMhRyhINJNngtF0BId6WHIcRXIZvmbyN8=
X-Received: by 2002:ac8:5706:0:b0:50e:474a:47e1 with SMTP id d75a77b69052e-51019a290ecmr8046701cf.10.1777408712957;
        Tue, 28 Apr 2026 13:38:32 -0700 (PDT)
X-Received: by 2002:ac8:5706:0:b0:50e:474a:47e1 with SMTP id d75a77b69052e-51019a290ecmr8046521cf.10.1777408712562;
        Tue, 28 Apr 2026 13:38:32 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.213])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a7c57335csm5093135e9.3.2026.04.28.13.38.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 13:38:31 -0700 (PDT)
Date: Tue, 28 Apr 2026 23:38:30 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: sdm850-lenovo-yoga-c630: lower PSCI
 cluster idle
Message-ID: <dl35jhcdlclpxssnhqbvu6ae4hf6oyqh4rmavul4helgxwrijl@jbqtgv3sva4f>
References: <20260428-c630-fix-idle-v1-1-29d0da326eb3@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260428-c630-fix-idle-v1-1-29d0da326eb3@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=HbIkiCE8 c=1 sm=1 tr=0 ts=69f11aca cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=gcnggjyPzmaCdwFRn6A1TQ==:17
 a=kj9zAlcOel0A:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=FQspZMmlHvdRTvJyRkoA:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: oSI-W4dAUxBr3DNmPYmYRc_iMjY35KDT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI4MDIwMSBTYWx0ZWRfX1JbtVD7GVhZ6
 JBy5BynzyLVRwhtqOfnhvsr2zzQk5tOcSFYU3Gs8F9Sjd9jf460IBfXnLCQLZMfDRU9CtV+83oi
 PhqJfowaJvhnskUcqdZcJGxjtSphXdmWZT8hM4RhMDR94+koLwDGaM/840gn3BMX/VSd9QHq8Lp
 9eynkftVqyBZZkhcHHzHZhI1Pz/BHC1srLLoDktRgDuk8FulHB4crcUnrYaLT5O7Y8ceZaO8TdY
 UGSAilD4iwr4B18l46NtiJQ1UBJ4AwkQeWZquxNBr3XE3gLOJBrPaKPUKXaB0Fw4Sd/fmKX5m7F
 t7S6/Od2cfRBEAQSEStBqfk1pdGw/fVYmz0uTzdpf4IHz/lB8bO3aQrxx8p6X48eklHm0fmvo78
 TvMIRHoczFzfr8nPf0uc9ZemlG7XWt0ZAsYFfNnMrZClvBHPxKggeeuGXoKGMcml/XedB/dDBbL
 0XWeF3KDu+jz1D5W3cg==
X-Proofpoint-GUID: oSI-W4dAUxBr3DNmPYmYRc_iMjY35KDT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_05,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 suspectscore=0 adultscore=0 clxscore=1015
 bulkscore=0 lowpriorityscore=0 spamscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604280201

On 26-04-28 22:36:49, Dmitry Baryshkov wrote:
> With the default PSCI suspend value for cluster idle state Lenovo Yoga
> C630 isn't stable enough. For example it might reset if display device
> isn't probed early enough. Drop one of the bits from the PSCI suspend
> value to make C630 work in stable way.

Now I'm curious how you got to this new value.

> 
> Fixes: a1ade6cac5a2 ("arm64: dts: qcom: sdm845: Switch PSCI cpu idle states from PC to OSI")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Anyway:

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
