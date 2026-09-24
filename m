Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0A263B38A4
	for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 09:39:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790242773; cv=none; b=gKF0T9KaXgp/cT5JgbXAQLIm+sgCrocBd8+1+Z7DKPdkhVcTc8bU6QP78S+aVBtkunoMXyFv1sHDI6WFD/AmR4XWNqHqr9grLTuCaPShDKOHJ4+PyhSsTpcsZt1jsuAVV/aDu5yqg3J8UiyyAP6G/6zRpoKNINapZXOExRfZ/Jw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790242773; c=relaxed/simple;
	bh=o43mUDqE5BdB0tF7FP0+xJSK7S34crz7c3l8Biqeqh0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rXSgYQJBCXvDw3gbf48bBdxFTPCZjr5Qm6tBWFp0OlUEUIa8Exna6jWloUpuRg5I6jqFMG4fGNO0d1q2zLe7Y4Ma4SW59XJ7UT+DMOAKxiXMCVVOXpennZ1m+VVWTxVg9wQmsPQDs1vDyEATSyMYd4p5MQarU72OPf64qqnjFhY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HHzo38+Y; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LXsaaUOY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HHzo38+Y";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LXsaaUOY"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68O9PM9F447383
	for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 09:39:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Jp2raTZUtG3uHXnDsMOnQNob
	40yCM+rjrGHtABixf7U=; b=HHzo38+Yvvx1CtiPUoWwqH7SZOCPaKF7K/NjyTNn
	AOeCQS3JLWILkv22Rqejws/tnQ/G8mXEy/apOwZice+rxhV2H3P4LkvwUqWnFIeH
	44Nrj30f9JLVkpKf83UqbdRZjcssolY5yikzaBdkYqUGs8Rm5Zf+AsOxd6fhm8+0
	QF7uOnIeivRC0vH9J0xlceVHjP7sVVN+wXTbP8PZTzPwNj/TjYufBlUbFfpwWqOA
	fswapZ2W0HICXTj2+jPb7n+zB3jjdU436fPoSFj2t/tustL/6cuLZ+4l2rBjmt4M
	Gc4px/L0O7JCdmESlJm5Rh6CGj/vD2DbRpycBSsUd0d6VA==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvfjv4br5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 09:39:26 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-1416f32fe11so2894880c88.0
        for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 02:39:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790242765; x=1790847565; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Jp2raTZUtG3uHXnDsMOnQNob40yCM+rjrGHtABixf7U=;
        b=LXsaaUOY5hrq4LFq+9HQVct/RwmNjI4/tOZB+/WHCNT9Z73i1aeR/CgFjEbFpmTRm2
         4syR2mhqQb08zxe3UjKOVM4v2Nt2TaTl/5pUXOgEDZxXEJIlnSzkrHf+zUua6NIf3TcD
         KbZVHJWAmO0S2hnh0/QCZbZP1njN2R/lo6nL80tYzjBYw3bkfDrDNc+kKcM0xhsD9Bnx
         jZHJexNXdULaycCMAVpMuvt2XHCyl32529DB58tEUSpLMRpwvfb5w9pbsVyMoy9N+K8l
         rMnRtZ3TI+EukZh+90zMDGV+Y1gR+a4DvisrfDQFUsaNHOKKjEo142yztX64OO97KEaP
         4KTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790242765; x=1790847565;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Jp2raTZUtG3uHXnDsMOnQNob40yCM+rjrGHtABixf7U=;
        b=UIdNfPCBf9zzHHuReonqFJdTgxDqSAmXpRqHMd2rt9TCRqf6aH6CYWr7VG7HMtVBGo
         ZXd9So1KM9TxMj4c2S8jQsIB0unuxxXlab+lvns88z151tByrY4GPvzINXp2PqnjjOZ4
         BVDs76lhw4sL5T8k1pg5TX0fcAthZ/Un/X5dfdd44FIcHLCq6ADFYnmb2dM96nBtos8x
         upcHoo6UiPd6tWVcAKzHLTbKcJmlmPug/b7vnPmC/NcpcSCGq6hX9f4ch2f52Q62uOmE
         jmOh8usKbnLE34HEHPpF5NAVl+FgQ9gZPmfaanYUsTUDWAKr9IeSO+5WEBjwXRYT5W1D
         Pf+A==
X-Forwarded-Encrypted: i=1; AKwUvBw0T5vZi8Q46NImbGFr2cSi3MNG+8GniaQ7OAbFwOJH7cwy7OJrHhCIs85RaEp6G/z7o3lTvwQyWQZQ@vger.kernel.org
X-Gm-Message-State: AFuF++lQ4WKGclxF2F/Wi7yxPqhAzYK7ZNGz2885Cfq0y/Xn9XevKd/S
	OsKdtEa88Lr8nAlYJq/RZ4fG6LJsdGZiGOUvSZ5BRV9nDrtK0hlkdNci8tM53+mi7grlFkvDTld
	KR3UxNO5vIE6jEtrcndAybceFOxiLLRSOt50va5xKexsE6DogQQVseI2KlLYliF+Q
X-Gm-Gg: AYBFou2J+86cxLxUZahgQ28z6STjlC4fXFhKu2rn+7NG7Y4VayCBenGr45fI76nToGE
	fkkf5M7JvlmX7tKD8iI9bkJKGhhZ2Fj7kzSEnjfnW3wW0iw2jbVGCMW9W1ruki4JRIZPeUwtRPe
	6sQ6UiUdxAw46GGdwXNiDLKiNzlO5lhjMRoXC8tmeU3cq/DAqXRVLeXt6ig//9JVQeMmOBEClBK
	Bc/GA3a0nTzIlgy3baiG32sxC0G7AKHXKSoQFqbjItOTkUn3ZohaZPxE3nZwMjxI9Wf48YjIBNs
	mYY8+5LXUJJb+jX9/pWwyxT3U2YqJdNatnzxZyvEVAJKGxYd1sB/VPqLDVq0Lash0+AP4BoiGkV
	XcG43eX6OEt1EI3a0w6tguM3P5FsR1JE71s56N4XQAA==
X-Received: by 2002:a05:7300:7a0c:b0:33b:5b1b:134c with SMTP id 5a478bee46e88-3400566b548mr1525578eec.38.1790242760004;
        Thu, 24 Sep 2026 02:39:20 -0700 (PDT)
X-Received: by 2002:a05:7300:7a0c:b0:33b:5b1b:134c with SMTP id 5a478bee46e88-3400566b548mr1525368eec.38.1790242754671;
        Thu, 24 Sep 2026 02:39:14 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e95c7d003sm11647648eec.9.2026.09.24.02.39.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 02:39:14 -0700 (PDT)
Date: Thu, 24 Sep 2026 17:39:09 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Taniya Das <taniya.das@oss.qualcomm.com>
Subject: Re: [PATCH RESEND] arm64: dts: qcom: nord: Add more clock controller
 nodes
Message-ID: <arTvvYoak2v_S9ts@QCOM-aGQu4IUr3Y>
References: <20260920081049.2183845-1-shengchao.guo@oss.qualcomm.com>
 <arDvejBVDThdga5C@QCOM-aGQu4IUr3Y>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <arDvejBVDThdga5C@QCOM-aGQu4IUr3Y>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDA0MCBTYWx0ZWRfX14m4gSy0IGOw
 p6H5Q1yBCh2Qc8smMLdvZArIkpijN9tlkoiEVT8ijTOUFRzXqaDFuKgV13lGAu5Foe0ZeQEz4tw
 lBWgfSDWb3JsmFlb/tkIL6As1nQ2Zo9/RlhOK88lF2nSJ/34m6wq6wXAKwbGUw6JxNBZfq+W4Sj
 ZJAN2RekPamrUaW5ztwCPIh93T2qo2Gbi5ClkoV6s3mfB8Ib0W/ow8f6Aux2LiUcJGKMqsKomTd
 YeEIUhQEG1lBnggFAVgwCl6HdLj5KSWwx6N8OQZaLBu/C4ys3iTxUBZsjpjv8wwAq0ZfM7Fmmc8
 EqWIzR83XL7nry6r/Y494baX9nunSHSMmsQb2OrDtA2fmdt5KvokckjzVaZrJhTDtbPrfttVph/
 eGvlx9oW89YkxOq/IaOt5nyAIDyxdEbQG5bNav2L9RFW0bCluxK7jyqeEktfCLCTZ/oCvVBGmdh
 rxBT0+A6J24lh4yNmng==
X-Authority-Analysis: v=2.4 cv=aIxlOr9m c=1 sm=1 tr=0 ts=6ab4efce cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=2mB2RfzVG-M0PQ__098A:9 a=CjuIK1q_8ugA:10
 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-GUID: xsaz1yzPo344nFfsE1jmVtV2z1PArxPC
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDA0MCBTYWx0ZWRfX/I104BqKrVo9
 z2Fr+RDPmryI6LxXAw5uO33yBAsVTy0H5lmijXXCEFPrzUjYWobGWCE+BpacQgP36tHgAMTdNoP
 E6oedNKKNHV0sXOAdnHy2MM9aAffAv4=
X-Proofpoint-ORIG-GUID: xsaz1yzPo344nFfsE1jmVtV2z1PArxPC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 priorityscore=1501 spamscore=0 phishscore=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609240040

On Mon, Sep 21, 2026 at 04:48:58PM +0800, Shawn Guo wrote:
> On Sun, Sep 20, 2026 at 04:10:49PM +0800, Shawn Guo wrote:
> > From: Taniya Das <taniya.das@oss.qualcomm.com>
> > 
> > Add the GPU, camera, video, and display clock controller nodes for
> > the Qualcomm Nord SoC, along with their required dt-bindings includes.
> > 
> > Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> > Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> > ---
> > Resend to separate from Nord display DTS series.
> > 
> > Dependencies:
> > - Nord base DTS: https://lore.kernel.org/all/20260914031412.140856-1-shengchao.guo@oss.qualcomm.com/
> 
> The dependency is cleared, so the patch is ready to be applied.

Will send v2 to drop Dependencies and add review tags.

Shawn
