Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B31E3C1416
	for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 06:07:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781244462; cv=none; b=Ul58bRJf5pCT2dGtL5xnxk0kQryPhpjipcAom1i/iyW/Fjl619OOz+Q5oLKVb2EMHeBJH/ABMAVhqlGa5bsvnHvpKA8sqpr9T0I1I26vgmT/aDSsT4dvvRPGUjrpsozD8bU2EDbgBUpUxLhkcYaKe1Gl44YYR9EaLjXnNYUPDkc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781244462; c=relaxed/simple;
	bh=dza5qCkk/msk6DZ3J+3f1O2/0bE8hbDUayonOYL4zYg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gWfou3EVfdCYd3+IIcglkhFxn+44oPllMBUsaUdzPOlW2ihp8vphLrJJ9ONftCtygEhlVYf+YXrqOoJ0yyJrkS8Y1FZeZNDqWL6kx+7nEd6xGEsiUeNH1avnTGgS8Ino0lyFjp7qXp/weLmKwJC3o7JZFwoVVO2IGFiWojc/Gx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TjHt8Aw/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DwKuZbBc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TjHt8Aw/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DwKuZbBc"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65C3C7Ui2506455
	for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 06:07:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=CEzOi38S1SZVQat1sn12gumC
	9IiUdpGFHjK+9WYrH60=; b=TjHt8Aw/wih7AtOkGGQR0Yp+FSvC+IFvMWMbCOwO
	7PrYzGfjamimGYUg8p+ivqviX7tISRJbpPgfVWB9lz63dwrvYx9ol5x98MESmhDZ
	JY4mBqhPgcFgn0Ms2LVFkMVtyQuu6ScN84YbcPAM0KTFU7AgNyDCiz20JdAS2Viu
	wjA8rpTRDrxTZ9hc2ln4n5DVAROiXWCkVeb055Bxp/u5ejyY/5R3ycpAsYMmJ9Oi
	JaXSt6DC/9B+agWDf0rgKhVGF06LQ8TCdqMUOylBmJXAp/8FdL41vmGVDGasQYaI
	lRbKnNCYr6H7llc+R+XjMAjdjVTj6qbpGELVm+nxrxRUOA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4er1cbja60-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 06:07:37 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-517c65e497eso10931041cf.2
        for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 23:07:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781244457; x=1781849257; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=CEzOi38S1SZVQat1sn12gumC9IiUdpGFHjK+9WYrH60=;
        b=DwKuZbBcjfIlL2LqXgLBjRzIv8/RJXCUf0LKhRPll083EXCUAxvjPj0CDzcegJkFXN
         4vWqzIgNC9y9c2FtXeNuz14DijNKGS7xCaDbqzEq59gayCSvgmSFfXFCyBHtTIMYvftL
         peLYKQAXY2bl4nLRrV6FRrxyO4a0Ab7CJzKLnpguduaAgMz3MhJpLKulZ2uplJ2b2tcj
         YzsHajquL+M96vVoen82DxGW8WTNd7tUmDwAlOFNUv9XwTDn0hX2p2shG0pLKx32YmS7
         CfloByrWFZRHpkhOiVpR00lawHoOq84UEVH7tjMoZ8Vgmpm8447bS+GJcJtC0ePEYxiP
         7LLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781244457; x=1781849257;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CEzOi38S1SZVQat1sn12gumC9IiUdpGFHjK+9WYrH60=;
        b=A6JiDoEnkisQHji1rEonjHa8UTwWb2F6rO5iV4yVpJ+SMMr6ZI/koKKUvVr/2ltQax
         Q8Yms5J6MK592BId2zi5DwcPgAsW+/HU6ODRjDzaIihjJeFbzVYclSpFqWfRc+YfT9Da
         aAJTuKLrxpWX+pzrtozQGp72ZaZFVRcsBesAligb5VJWX87NPULvc84TWuAEBdsIZXfA
         1Xqk8m6Owmu9y1DzjuLCNlbsmX9m4zvNwxryxuJEKx4CFNm6wzqbUTSI4t34wDdMNac9
         uu6W//Nu8UMpH4rLFNpZg7WWqtqU3wURAbzquwSILXlkJ6z2tj+pd4C5OVrwbhZyl6Np
         8c4w==
X-Forwarded-Encrypted: i=1; AFNElJ803RuGsWKqiEvsPfitXX+7Yg/oPRrCsRuWxAUFeYWgUbZmYDU4k2wRmbNwCkNYeC64J4Sw8MDWn3tJ@vger.kernel.org
X-Gm-Message-State: AOJu0YxZ3HsoDd/sdR9TDfMYyx7QcL2gpB9dItWUufQzvLf+XYCtBf2B
	ommTucbD5tf5E8FqMePwpGOw9qBbpbQQ/9deYjYqkAjUOICkIYcZ0IyHJRNBE8rdWLP2BoaFIIH
	pjiBI62E+pS6pTEPqPd5uZ+KS8EE7Q2+MxV9qfCiptrhVxIVNriLAMtLTfVUKf3t1
X-Gm-Gg: Acq92OFICS2Jaomlzi12equatNAS7ERaz3fNyaA/ebcCFA0LiPBvmNIbIaKDTiCmCz4
	kXo4INe57wywSlZaW3q70nhzJRNaGIMOMPqA9iOxCbr//5oUEYLpmhGAdrsmOvggNLYQH913Ljx
	p+1j+8ZsSE4MnKvIZtOSNZ6eGmdm3kGoayXTONMpTr0gqzxak57TpQmLFmCqbHj17VfvtGs13hj
	iPtZed6om5ZYIykZV9oX39sf5RYGCXKqb69+W4eAlxyTGSvuu7ljVavezFb4G6pV+2KyZlC997p
	zU0wzv8yUjKb+tbeclCXIoFnVfn+jmWvHgGDEWVu8iq5UfBM22hP9U4xHrcSbbJPPcsuuP1Psz3
	tfN8gPzJZa4y2IsGlzSFFMvzf037O8IcoQOUK3fFQRBs4OUjboLcTlEpBr658wVtXzSDDETCJrg
	6l/T8qHMPVWILWNx6fedyqMMsyuN6wo4DVD3w=
X-Received: by 2002:ac8:7dd4:0:b0:517:8011:3a4b with SMTP id d75a77b69052e-517fe245abcmr18048501cf.21.1781244457272;
        Thu, 11 Jun 2026 23:07:37 -0700 (PDT)
X-Received: by 2002:ac8:7dd4:0:b0:517:8011:3a4b with SMTP id d75a77b69052e-517fe245abcmr18048211cf.21.1781244456832;
        Thu, 11 Jun 2026 23:07:36 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ad2e1b421bsm244255e87.73.2026.06.11.23.07.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 23:07:35 -0700 (PDT)
Date: Fri, 12 Jun 2026 09:07:33 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Monish Chunara <monish.chunara@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Nitin Rawat <nitin.rawat@oss.qualcomm.com>,
        Pradeep Pragallapati <pradeep.pragallapati@oss.qualcomm.com>,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Sachin <ssachin@qti.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/4] arm64: dts: qcom: Enable SD card for Glymur CRD
Message-ID: <logxz4exkcj2k6ocqhbl352u3kmnpi26wgm3mh46cmsa5336ux@6w4uq2wori75>
References: <20260610111508.3941207-1-mchunara@oss.qualcomm.com>
 <20260610111508.3941207-5-mchunara@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260610111508.3941207-5-mchunara@oss.qualcomm.com>
X-Proofpoint-GUID: z_tP_teR2ceoQkJDci7TfI3ZMFwvqJGe
X-Proofpoint-ORIG-GUID: z_tP_teR2ceoQkJDci7TfI3ZMFwvqJGe
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjEyMDA1MyBTYWx0ZWRfX4p3SFAvlxkTQ
 KOpWpP0QPlshrsKt0OJYZwM9utDUxY8EwyxsDy+zSOmnN4CxwhOdwIre76x8qX4v4dRTVY4GslM
 Xgp+cbuFKZLjIQqrmp4hH6Q7IEorCqI=
X-Authority-Analysis: v=2.4 cv=S57pBosP c=1 sm=1 tr=0 ts=6a2ba229 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=5U2oNk2jDa2XcSTJXtMA:9 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEyMDA1MyBTYWx0ZWRfX1NDeqBP+rAjq
 Qfi2tKvcPE9T8ou1IIjd2nAnnL7HqOutZBVIcQRe6w5aUYMqNeRWA9L75GUKRnCE0hKHJ3qsMfr
 brZB64mMpAac89T79YP0lxDZpn2yIx5v3Qa+gaZ/VnsBOIa7fWsDXR5rP9y5lbxUeAZkLv/e+5G
 c9/uSyltkDU08qKhWoQvRzD6tb9BVnUPnq0Q7BsMQ5P/WetRAPFkkKyuDNIsjYGaUv4PPbOq1Cs
 4WtqnE73x8Rwjln+g1ZPEKRBOUMILMc2n2GE12NQORiEqJqaxDeM3HKGc+REQabnU6rcHoF8Hyi
 sNNloRU8XMSPhPjoudbSOuU7iOF4PWew8cGYFCo1EMzU8Q3gP4JsQrUh0tY3jbytNc/iO65hCMb
 Ycd7fkoI/Bgxh3OKGXoNzswjULW6++t3ZyKKGqTsR1eukz3WqJHXMyT5uUqum5oPbKfz7YG2ZLK
 /7a9Pr+KNHOyA7GKwKA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-12_01,2026-06-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 adultscore=0 phishscore=0 bulkscore=0
 lowpriorityscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606120053

On Wed, Jun 10, 2026 at 04:45:08PM +0530, Monish Chunara wrote:
> From: Monish Chunara <monish.chunara@oss.qualcomm.com>
> 
> Enable SD card for Glymur CRD platform. Configure the vmmc/vqmmc
> regulators and gpio-based card detection for the platform.
> 
> Co-developed-by: Sachin <ssachin@qti.qualcomm.com>
> Signed-off-by: Sachin <ssachin@qti.qualcomm.com>
> Signed-off-by: Monish Chunara <monish.chunara@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/glymur-crd.dts | 25 +++++++++++++++++++++++++
>  1 file changed, 25 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/glymur-crd.dts b/arch/arm64/boot/dts/qcom/glymur-crd.dts
> index c98dfb3941fa..f68d27429440 100644
> --- a/arch/arm64/boot/dts/qcom/glymur-crd.dts
> +++ b/arch/arm64/boot/dts/qcom/glymur-crd.dts
> @@ -427,3 +427,28 @@ &usb_mp_qmpphy1 {
>  
>  	status = "okay";
>  };
> +
> +&sdhc_2 {

The board file should be sorted by the name. So these two entries are
wrongly placed. sdhc_2 < usb_mp_qmpphy1.

> +	vmmc-supply = <&vreg_l9b_e0_2p9>;
> +	vqmmc-supply = <&vreg_l2b_e0_2p9>;
> +

-- 
With best wishes
Dmitry
