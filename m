Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B5763AA502
	for <devicetree@vger.kernel.org>; Tue, 31 Mar 2026 11:09:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774955387; cv=none; b=HknlyISSlxPyzjRDZy56Fn00zuurYx5Lr2sOIAZ/j+Fv20vVxUEsTUfM9mXKbzOUmsY+LYfYUYFggfqPlLlb4UrWnU3Ybh7wgcMOeOWotHloFnvkex8jwK7vfYKZQClhroOfLIwblbDpxoiSdFrFoaLV8L34tlNPhba3fIg6O08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774955387; c=relaxed/simple;
	bh=YX4YeoXUQj4rirf0ZDxTIVRJgQZIJ91d0BJ/Hzx+brA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ECd9Ddcy9yi3SN1ksbOO7He8iq77apZ86J1sZULWCtM9Xne7TJF4H5pzKVOuHAtYTV8dB7GLJOdYO4Fn698rAMhb3pBiBltdnx40BLjp9LQm5P0r24rKv7K+yMnMxU2iiQboIF3YUBu6iL+HKqkG8GWjGvEe731MyiYGuUiwGmU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iL753jOi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=caM/gcri; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iL753jOi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="caM/gcri"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62V8k3VZ2049615
	for <devicetree@vger.kernel.org>; Tue, 31 Mar 2026 11:09:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=9k29WUXpNe4XtMNJRbs87y7z
	zVmykpGqEVD5gYnbM1Y=; b=iL753jOiGK3qBwhmXky2oeJe68xYqJT/NAdIQfe3
	WKHuvxHVuG39HBz4yFoXQNfVEoAE/jJNgkY9ugEqCqjKyVAXt59O07jxfaIe5oj4
	8Q9Xum4yYJLOrofaUWXUrhUzQdxYAe0b9NqJ3TSy/REQ7pLk2ekbLfXkQsFT49Ny
	4Kx/uNgyRl5LPIV0wBxdY4/GjGadcVIpHoIkZEOrON0Y4SbtBaTDiOAY2lFNpNbA
	AwMX5eCrXbZGdPEKtkxmjYqK0fKyRcEItbttAPYRU+u3ayez7haihlyzKf/rb4PV
	IcPTEyu/4OggYJivMBCz/FKgMb/UtqAdhJaOpmIeyKih6w==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d8b1yrhrf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 31 Mar 2026 11:09:45 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-2c4cfe08c9dso7628501eec.1
        for <devicetree@vger.kernel.org>; Tue, 31 Mar 2026 04:09:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774955384; x=1775560184; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9k29WUXpNe4XtMNJRbs87y7zzVmykpGqEVD5gYnbM1Y=;
        b=caM/gcriYox/wnZfCrvsoMFS4lIcwqOkzvMx2JfOkPxnx0c0e0RHfD3WnOlVEjIww9
         V4jmUQtRSwuzZZYHnBEHq17UGpeTHenmG46OshUk9Q4q/2ECoIb5rQa6J5wYdnEwcOI2
         IDPjU0eiD4iV8AJtWheJQ0VoN4QTqpYZVkpnIMs8wh/pwR7sjbkLkFiFD4GEy2TW3G5k
         EyxomZs0Z3Iy8iMr2kxdogyiXJAON16X5TOXqYgmrCxY/9f3iB9pVHQPMdQ4pxjNOzpx
         ayHCzko6xojUie9Vx3PW8UiGJcuGKKoRVuT6MYFA8JaW+0uIU3+FbGA3bYszsCD0/nkz
         doLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774955384; x=1775560184;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9k29WUXpNe4XtMNJRbs87y7zzVmykpGqEVD5gYnbM1Y=;
        b=IEolSC+LJvX3r/7a6PGRVVsaxw01baLqq3H+4MXZE8mmLNmS8baRvQ7hiyOeNJzmR9
         ST3e3VpDy9r1KGf9LHa6ZqepUHqjrdB5wkeNmudu0C+ZCUnqVteAswsIMQQHAuBhNFjD
         xspbZsfPH71Xz+pmEw4ID6cC2SXOcx/IeePe03h0gOU5C1rp889QlHSIE9IF/655GX2O
         JXiIMglxOsvvFWo3gvzGH+uHdLdhWlZIWweBqnxwVCK4fBnSTOSORFvcnGVFufYDKGDC
         aIhGXXoi+biI2ihvQFyzZy7Wp6NZ5gjvM70ecnFTgBAtk0QWibukn0Q+a9fy4H0OAeDK
         FOgQ==
X-Forwarded-Encrypted: i=1; AJvYcCXE5R11Bx+5aqElOqrywifthR59PF7cYZN8FTcNakVd0dqfogx6bGPqLTNRG0AIgKRM+aeS8p+pNk+W@vger.kernel.org
X-Gm-Message-State: AOJu0YwEjDRCdKBgvE7M0dwMJ0MUEOOAmkQ+4zKd5Gfj6bSm6wPy3RNU
	1SBs2QoN8bpwxeunjc3QUTFMhNwRKO0QjxHeVWWpDuvAqjj1O2bp0bmvDw5Qi2MBP/X1fK8OwiP
	iDmKhG27CUtetNFU3lNB4mW4aLPko+YsXJ0gESrFQPEJe5fblvkJEISbvysH8+ddS
X-Gm-Gg: ATEYQzyKGlXAZqa+i2euuV6l54awahvz+yPOM/ql/O3qAzqvB7S/CpqtHWobDRoFTSk
	r7Bam9hNj+nX2JtYAxjHyXYgRJrMng4ePpkKFN7+FAAUWEC2lNmcp7qnqXqEjihNV2AY8uOGTb1
	+Zouoa60y58ROW/GjnE+NwJbiBIygobuYUH89pDdysEDw4W35gX7hhV5jO1/OrbkuECxcsWHCoi
	0Y9o8OAzADFl5I74ZCBvgXALSyLXIWWBrZHSZNd4wKkUJw+RxWt4xIoIDiXm431mSQlr4754Zd7
	gF3Qb5z2UjqGCxtA4Io50bSURExGVvkLpyweP+dBU0hZER4BicvNgDZPb9wsFVSqsU0A7k8VJrm
	wsQEVGYEUJh9kZu9/b3Td+w06BZRv4s3c0cliaQDs9ULZwJc/P1DniAtReq7eDKkiXsZmc+w=
X-Received: by 2002:a05:7300:6423:b0:2b8:c1b4:9cb7 with SMTP id 5a478bee46e88-2c185dfe8c4mr9580059eec.22.1774955384151;
        Tue, 31 Mar 2026 04:09:44 -0700 (PDT)
X-Received: by 2002:a05:7300:6423:b0:2b8:c1b4:9cb7 with SMTP id 5a478bee46e88-2c185dfe8c4mr9580042eec.22.1774955383612;
        Tue, 31 Mar 2026 04:09:43 -0700 (PDT)
Received: from hu-anancv-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c3c79722e0sm10518512eec.31.2026.03.31.04.09.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 04:09:43 -0700 (PDT)
Date: Tue, 31 Mar 2026 04:09:41 -0700
From: Ananthu C V <ananthu.cv@oss.qualcomm.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v4 1/2] dt-bindings: sram: document glymur as compatible
Message-ID: <acurdc3YBb6w2huc@hu-anancv-lv.qualcomm.com>
References: <20260327-glymur-imem-v4-0-8fe0f20ad9fd@oss.qualcomm.com>
 <20260327-glymur-imem-v4-1-8fe0f20ad9fd@oss.qualcomm.com>
 <t5vbe36b3i2lx4ktrw5bosjtldgpmep4ueqkx5b5saoc7a3dm4@ywsv5rrcefew>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <t5vbe36b3i2lx4ktrw5bosjtldgpmep4ueqkx5b5saoc7a3dm4@ywsv5rrcefew>
X-Proofpoint-GUID: ntvjDZgVrU8MzzU4m7nufzqYYulDPODq
X-Proofpoint-ORIG-GUID: ntvjDZgVrU8MzzU4m7nufzqYYulDPODq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMxMDEwNyBTYWx0ZWRfX2V9xANcMZhVn
 hpucA7SIRLTSR82vqUP2uQrOsauz+ngmbZHdvlln2hwrWw3D32alh6fD9/LtdU7P1GyfwXrVMEX
 WmNNMx1eXWinEyqLNE59tYYYq019H2PflGRy/Ct0l2DGCoNn7h2+U1mguEiCcBnKvb912VAqY+d
 TQIdzaZKvqve8GWesEqz0xquIaWTSr38zxTmpfe2K4Xn1tcve84JF0QtWRtm66T0NPj3bZBJIdC
 4jIVO+8oNehrXJJZSKmJlVYCM1V8zGt5jvukcGCTYwYYRFeKEMhYV7TzE4bVE6NjtO4A8Zh42je
 XdQlczhLZAOA5NmO+CfiVspGPdU1iqID/bvjmzuIe7K6jc5B/ioLRhqQiUr47/uF8ouiWofq674
 LQpRfViVm9jhLPcOjC6PgKY9YFR1ktsQSUvebTj/ROrs7lElwp1p0CAZXMUCZutJnWpCLaqjJZ4
 CkY2dxn6nUHBlyHpYGw==
X-Authority-Analysis: v=2.4 cv=aJT9aL9m c=1 sm=1 tr=0 ts=69cbab79 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=kj9zAlcOel0A:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=U24DiTx__9Z7KcXm8yYA:9 a=CjuIK1q_8ugA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-31_02,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 phishscore=0 bulkscore=0 malwarescore=0
 priorityscore=1501 adultscore=0 lowpriorityscore=0 clxscore=1015
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603310107

On Sun, Mar 29, 2026 at 02:05:23PM +0300, Dmitry Baryshkov wrote:
> On Fri, Mar 27, 2026 at 03:24:35AM -0700, Ananthu C V wrote:
> > Add compatible for Qualcomm's glymur IMEM, a block of sram which
> > can fall back to mmio-sram.
> > 
> > Acked-by: Rob Herring (Arm) <robh@kernel.org>
> > Signed-off-by: Ananthu C V <ananthu.cv@oss.qualcomm.com>
> > ---
> >  Documentation/devicetree/bindings/sram/sram.yaml | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/sram/sram.yaml b/Documentation/devicetree/bindings/sram/sram.yaml
> > index c451140962c8..bd62711dc630 100644
> > --- a/Documentation/devicetree/bindings/sram/sram.yaml
> > +++ b/Documentation/devicetree/bindings/sram/sram.yaml
> > @@ -34,6 +34,7 @@ properties:
> >          - nvidia,tegra186-sysram
> >          - nvidia,tegra194-sysram
> >          - nvidia,tegra234-sysram
> > +        - qcom,glymur-imem
> 
> Is it different from the Kaanapali one?

No, it is the same as the kaanapali imem.

> >          - qcom,kaanapali-imem
> >          - qcom,rpm-msg-ram
> >          - rockchip,rk3288-pmu-sram
> > 
> > -- 
> > 2.43.0
> > 
> 
> -- 
> With best wishes
> Dmitry

Best,
Ananthu
