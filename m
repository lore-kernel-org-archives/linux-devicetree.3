Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 414C445A2A2
	for <devicetree@vger.kernel.org>; Tue,  1 Sep 2026 07:26:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788247602; cv=none; b=XME0Uuz5+F0qHZa9Bg7xk4wei/VQZys0sHxHBbPpGDrJGVpJ+velNvhFh/QJ4GyAH8uOUg3uQHO6Egy+h549NLCd8MWKgiW4KzAkLxnqY7fyINqDcn3hAa3xTH+K099tE/ae7mB6BssneVXCiO/dAsdIpVHQeKVbHDsDlQUAVz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788247602; c=relaxed/simple;
	bh=SuVWw66eKy5JnK3r53g2nB2OWaRv+p1v8YhHc9SSMIk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cTu+8QK+jOiTSVTIBERZy8poPYiJOciYLt2JKI7G7hlw7dX4tUzMyO37Btw7tACsQyBMQYG+suCnUyQNzBcGk9DBeDTV/WiTQCVxtj3Zw8i1v1vJ6o13nk2yLEhsy6mRDNq+6aBfHyxszSswCCLwzeCcUWK7CsV35+s4vKxX3Tg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CPB4gOYI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EHzDD3Ri; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CPB4gOYI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EHzDD3Ri"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68179RVa2322005
	for <devicetree@vger.kernel.org>; Tue, 1 Sep 2026 07:26:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=7iVxONI1aflUyK8XwlfsoiG9
	Mfh6q0kvO2xXoUu3pTM=; b=CPB4gOYI1lwHtz579z7doLqxhkUrpAz3RvKLs5IJ
	/3yJVB0c/nZ2tygQWM22s5BqvDpmgNRz0enaxLT/Jojkv+sL3chlUeuvc6l1GzB6
	Sn38s/5eQROXDkjKpkuPMbWD7LnYPjJFh7G/jJcEWkwL7mFg2xKC2g1sahN7zXAZ
	Pjh2mw8Vcfj+9Tc7Oj2e/v4EMaZ7IIYbi26eEdfnuUfSIcDGQFG0dD6u8EmVWi4h
	bXmBwm8wavOcX/DYaKC0ZhK8iyiDzmf3MYUsrUdiE9/H1chvh20j5PYTGFCa30jS
	gRO7umkXdNkN+2Cuagi1OSmcikSIrMEMZegYXYXyxIMI8g==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdfchans3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 01 Sep 2026 07:26:38 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93909014c85so709564385a.0
        for <devicetree@vger.kernel.org>; Tue, 01 Sep 2026 00:26:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788247598; x=1788852398; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7iVxONI1aflUyK8XwlfsoiG9Mfh6q0kvO2xXoUu3pTM=;
        b=EHzDD3RibaDXBP8dSiILow9zaTR12cWXLG48PyT9BtfuwjC3ylQYLD+BxPLqL1tlC9
         Sm3ljO0eKliDiX9arBZDC9/1mKld3tRBqK/vfxXc85HzUXZcyPG5OA5T2ZJzGyqa6t2M
         xkxTZyoRFkyrz7pmVXlXWP98YGdhivIvaNdrIq6uwhMpXzAPSp8noYaOJcAuPQ7wuysd
         w8Dw7IklB+etZOsflm93AjPHI1Q9MMTVc9xdWeiAyQWOKP/rWvd0/Pgq7k+9sJq360dd
         Uh1Ad30rhh89fX7GPs1Aw0rRyucC3CoQ0sfrDvOKBhFvcbFkr4xVLqlswfg1ramh5AGo
         9lWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788247598; x=1788852398;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7iVxONI1aflUyK8XwlfsoiG9Mfh6q0kvO2xXoUu3pTM=;
        b=c+GRr8+y9yY5POHsn3ZfpYy9JI0ITwT9mJ/3LZBQYoIAcYvF1WZcCP3UXdtPmzYSp4
         +EVMuSGB18GuP8xIlG3b0OKOaIu59hJR9ElgjLFoHUBPpYq0G3Bk13xF9jGy/AUV4616
         xE9IfPAxjsFYGfKRFBIsPRmbPvGXw4PEPUZdTEsS6t1+RCroO+pPftvKTvQCJoIz1ZPO
         AacIXpPECaJ18a/ZGYKvZ9KUefgFSwP53yzD+pR6cr0bEkgOh5iIWz1B0MlAvvrgws4L
         QS+dqIx7JZynKfPPJPvQVOLXNeW56PH+DnqSdIt34ZkoCK0vV7aBFl0+uy7Xb/Rg9viW
         GG9g==
X-Forwarded-Encrypted: i=1; AHgh+RrXBhWPjukC3I/ALeM0JdFonWNpaDBahmHPLGGTECIafACY7ttbF+K3yHicG5fsEDkc3iR7Ckr7f9Cd@vger.kernel.org
X-Gm-Message-State: AFuF++kp3JpHe8FaAHalwxziQ1wKctrrNdJT2hcU9/73q2jK/PyjrYtO
	qvQ8p38IQySohv1a5mPFJjEUkOpdUWgEVNpxnfxqOPq+GpXyvcGjy4eVeOKue4PmCekkYpDSgIQ
	NQPlNHa8+l7+3pBippgf0Y36tcYjAVABMXCPcS/mLKUuO11MjbEAGXT0dU/wwGNKM
X-Gm-Gg: AR+sD13X3wtnrrcXxMB3PHGi0GdBAcFv+kgFTLCXqxILcS5FC8486wagse7/VmIMvIW
	jo6LBOY0HLnfplk04bu3hxBWHF4ESeIkqZ75h7AxDo1oKGvVvTO+BNYNN89RjlBiqU7KY8A2Ihq
	1d4kwmbUF77cmLfJfViG8XYONbkykNwCNY1kA2iG/TrYJ7qKSCytI7p+PnAkdErGVGU5pM+HrFM
	EqiPa+XEjHCDv8WUTaZ4D5oax2xzHxTYNRnzusdPCYLoelWNV3qnRT4xU0fmNaDFSnzxDi0Hbny
	kewbEx7WFnFP+agn3RT+9D3oZ7jc7VUGSY36UOdKLxywOICNUR6pOBAxcPQO3MaHSnAV2z9+AWW
	fHpJKTi5nmEomDg==
X-Received: by 2002:a05:620a:4154:b0:936:ea3d:9313 with SMTP id af79cd13be357-939480b0083mr713535085a.20.1788247598266;
        Tue, 01 Sep 2026 00:26:38 -0700 (PDT)
X-Received: by 2002:a05:620a:4154:b0:936:ea3d:9313 with SMTP id af79cd13be357-939480b0083mr713529185a.20.1788247597727;
        Tue, 01 Sep 2026 00:26:37 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.178])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b955e7906sm282036475e9.1.2026.09.01.00.26.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 00:26:36 -0700 (PDT)
Date: Tue, 1 Sep 2026 10:26:34 +0300
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
Subject: Re: [PATCH v2 3/6] arm64: dts: qcom: lemans-evk-ifp-mezzanine: clean
 up PCI function nodes
Message-ID: <dg7754iwcpcwclvuvgley3o57erzamhkfbulnoy57drgb5gjog@iqnak27plvid>
References: <20260901013654.1343537-1-elder@riscstar.com>
 <20260901013654.1343537-4-elder@riscstar.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260901013654.1343537-4-elder@riscstar.com>
X-Proofpoint-ORIG-GUID: u8UeODYrWq3QXvnX3-lQVF965-cVMiZi
X-Authority-Analysis: v=2.4 cv=G9Ms1dk5 c=1 sm=1 tr=0 ts=6a967e2e cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=G5ilVN+faPP2Ze1SHB4iFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=ee_2aqc6AAAA:8 a=w6-NgDdMmUSj8GgG8GEA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=VOpmJXOdbJOWo2YY3GeN:22
X-Proofpoint-GUID: u8UeODYrWq3QXvnX3-lQVF965-cVMiZi
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDA2NiBTYWx0ZWRfX/B7oODS9FrBs
 2Eqfz2E+F+aJIJxco/BzfuYzxuL2YU43Bz/1ZUCyhxE2W4iMzMcxaZCqnVgH5riXfJ243ZWQeHj
 VwYQ26/z4y4+aJVIlIhcZuuZZRM7xis=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDA2NiBTYWx0ZWRfX4Vlnc/5i/XJA
 iQTUg8Ro341yD7eh+5m8kx+lVbUNZQWeHZKEFq3RxC/b9O5/2LgEs4JoO9M79Cyz0SDISfQTh7x
 j2OQEKBiSAjqGOBGO63kvKsGlqS7u7GmJVXlqLbPNzNw/zFP8Hxb2JTuPps56CjikdcA1SxrO3O
 jIHMG5vKKQleAPbWv4RfEdTtKzciFV8HhJcQCqiSMdaR3lJkz53gVPhdX2rjNVFxT/ivuVkJ/4Q
 vQCX3Gax/eubigLnmZhAoWEcpLWxWfuhQr9foagiN5kw6xglQRT4GRKSO7WKzostzTM6ohXyAjQ
 eT30w58uhUAJz1zOcH85/0223sAsYE2+fTbSdE6mlIuJLugxQnJ6qMwbD4G+CKUzHeubfHG3lOS
 nkCW9sayiNTud8lOUD+jMee1N5AeceHDBa+UfuJARoG9BocbWiytQfnnpAPhcR3rdDVF6GnnPeO
 GeZ71TETzDGw8YO5Rjw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_02,2026-08-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 adultscore=0 phishscore=0 malwarescore=0
 impostorscore=0 spamscore=0 bulkscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609010066

On 26-08-31 20:36:50, Alex Elder wrote:
> The lemans-evk-ifp-mezzanine overlay defines a node representing a
> TC956x chip which contains a PCIe switch and an embedded endpoint
> that implements two PCIe functions.
> 
> The devicetree nodes erroneously include a "pci" device_type property
> for the two PCIe functions.  That property should only be used for a
> PCI device "that implements a PCI bus".  Remove this property for the
> two function nodes.
> 
> In addition, these nodes define #address-cells, #size-cells, and ranges
> properties, which are not normally defined for PCIe endpoints.  Remove
> these properties as well; they can be added back once they are actually
> needed/used.
> 
> Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Fixes: b64abb26a2916 ("arm64: dts: qcom: lemans-evk: Add IFP Mezzanine")
> Signed-off-by: Alex Elder <elder@riscstar.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
