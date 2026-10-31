Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793437256;
	b=eaVrFD6W0SYsxKgyvoLSRKcqmKNGRjXZJQ4V1VjwgjRxsWQaJQBRLOXt8MXZ/MuNwQ7f
	 mczEaMzl38vwUVuHTPcRACeC75BpudKZ9PU1zsJmIt6FRwApIGfT13jTceop7Dbe5zp9Y
	 t8CNOVkhAG6cSYj+fturSVddQKxdvuGTPd6Kk5s+zMARVtLpo483SG4kb49zPThGmsEj8
	 TZxzLcN2zvWG/yxqpI1Q5AwW0iezXvnOR/g8vnTn2dsXbPWR1Na8RFxOxRh7fmdZP/v9e
	 UD4nKlQLdI9eztsS0/6BzcePP+LH4Gfn2BGuuZzqPGrZfapmEXelPvMaw6ecik3f+ig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793437256;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=hEBW3LH4sOgJCtCxVxcQeurZ55QVpzO3dxYT1b7yId4=;
	b=v0kXJrvGQVmAIkgcbF7vMo8tCMMcniQAwuzO0STbBw/Yo38viWg1WMFrwQHVoq3T8hbE
	 PYeuMA+/ZbQ7vzoSjnPGwm1R5hdzAEk0lPVFBHJVLVyJpQIGx4ZTWDRqffH2ZjdwtOEIV
	 NcaeZMaM70mKDqIrP5Q8QyfPrW3g5XyKNrjPgZK9w1P7NGfXDwIqYEzSKhhwrpDJyo1oL
	 rhsytFqa9LRQ/whU+6dJzbydns7Wd5PGyn49ukq9m/bYgnI1fmlDf9MBR8WMwcMF6D41m
	 jPjFGnKJnUP6qA84pdkKYENyMdGjS1qooNMGDY3viOGbz1rHHyndrBaCRutP2qd3rdQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pTEaXROH;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="LE92xQ/w";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D02FA606A31A
	for <devicetree@vger.kernel.org>; Sat, 31 Oct 2026 09:00:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D02FA606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pTEaXROH;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LE92xQ/w
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69V4dnMB3761071
	for <devicetree@vger.kernel.org>; Sat, 31 Oct 2026 09:00:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=hEBW3LH4sOgJCtCxVxcQeurZ
	55QVpzO3dxYT1b7yId4=; b=pTEaXROHxaEJuVLIa8+QCUI9rfTd001z1ZdX+N7q
	GsbISwdcTtepdCjg1lb946VR6cl/Ilqpcf+XyN+eIBGgEqcFDCg56brsi7dpLh0K
	iGnkdiTq1k16T51BJCgUCUKtHQEeaZVtJ/5utoTVSbdNPc0YIkdCyjFwDoWPBCLd
	76u7QTLCycONR6dWlS4Kbk6ELMMHrm5eSPmNWumt8WTIOvvj9QCpnrZyHDymyXMJ
	z50wJcNfnJL+zcu+Ui2kCIcNoVHsAtcOUU5JbZYiTsAZiIQkzcyZfsLl+RFYQVBo
	ueeC5/Dm+/qMssHNYS8J0yWfip6a0X8TUdSxjX3VUar2Bg==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn9gk0j95-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 31 Oct 2026 09:00:49 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-36a223755e4so6006370eec.0
        for <devicetree@vger.kernel.org>; Sat, 31 Oct 2026 02:00:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793437249; x=1794042049; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hEBW3LH4sOgJCtCxVxcQeurZ55QVpzO3dxYT1b7yId4=;
        b=LE92xQ/w18R1PWG3hE5olTjWIpG9qa2JlaGU39E5BlRmixusUGK/lV+B/l5Xw2qB2U
         jR/xe+dRZ5tEqxfioR1HLt9VR/nffboe5HIvthkAhJiW92mARQX9xxIQwNzJvA3/YR7H
         GZd93CL0WlsThiyhAiK//hoyUPHDdzQfmBSZqDIrCwQhosdaDJduGIOtOB5igmNP1I3J
         yQoepOORu3Yxc76ip3sxiGwzCkvNlb6En19WS74cT9hTK5nG3CIDlhcyit8rVKt4e0pn
         7vjmck7mvZpBWDNYGrCqZeaz1Mxn2DvDvE5XuW3mpVaW7QmGmw/c0Au7JOZGrf5ZB5eQ
         0JVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793437249; x=1794042049;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hEBW3LH4sOgJCtCxVxcQeurZ55QVpzO3dxYT1b7yId4=;
        b=hTvdAw9idGHjMvjhw2DpLQxu23sq5GNB3BKxab5DYus2m4h3EdoF+bl0R/ZMG7AWFB
         cOS8AcSz81B6gg/cO4i84yBt9Auctit88giet2v5jT6Wegi2hLyWbQgeArzmtKSmtQVz
         ZicXrV6xJzDiEPo4fceow4h3ts5Q1wgrWa0U8IBtkRcPjcTkM6eKQVia9clZIhOm/xt/
         MVoOQmFq9InLWQ6fiYFCVzT3fGkuqLGoR6LgSmRLnb0LMR5ypjIN7hFosla/dzPwnMQ5
         BR6m22w0iCYY/gEji+QqXw2/4dd2vTU+yDv+8MiaUS6u6Sv3Ss5SHyC3+K2wYsi3QkuL
         AZiA==
X-Forwarded-Encrypted: i=1; AKwUvBxmKAK4GM+1jov52pqtaEpfN4b8+yS2lmzk8HT8zQKYli+QTpRcb+Q6K7QRn6azGXYNlVo5X/v+0Irc@vger.kernel.org
X-Gm-Message-State: AFq9FYLjHQXPj0Pe2m1fvYdOEwNEEt2+00dGI2xQZ5mbWdiYqCE5x7yp
	bF6Bmf2gP/JSIQQvhkRClnpFZWtvRSikMKSGKzC8q6eAR6uhDh+DwPNuFX2jTE6Ze8s4LBEE1Fc
	2wQlY7Es01BP7keix3IzOWXm6PsqUy80puwOwvTlh5pltGCiDD7SeF/oET0yTVNFf
X-Gm-Gg: AYBFou0NjGBphlZ8ZjkJrkEtd7rgd5KwFZKWZPFkRn+UgEi2pkr4O9pZrJyjnTRyCor
	cEqCm71y/htptd1TmbtdGL7gwXsahGN6TFW/ZjEIzg0IRkSaWtUOBwvWATWfEcTPINqkToDeaR6
	rcrpllqtZmTKLWAN4NNK0RtaKVjR7kVv2Iulnyu5JKZEc8zDG8yGknFhIfkZ76MNdL2cr3iBqee
	6ke2pcZgMeYVvZmbQUalNwKOuphPFADElB50ny9zXnsbPJpwhS+E4l0NRC4oYaX1cssKF/Iricp
	xrpE+fCKI1zJasaNsbeD5U9mZ5gBTwxpIWGSlQobIxaDmGnn3lZ3UoYs7xhlyQu0YCBWlVDrLCT
	DAl0mG0LYZwm2aO9lo6/nip61p3PfPZnwBwZiFb0bATjBBhpEk+kxNsXuOOdNp1fszENyrI5nEW
	xvCRM2jj7XN4SFmzY=
X-Received: by 2002:a05:7300:a945:b0:35d:d9a9:e455 with SMTP id 5a478bee46e88-36a423b3556mr11293419eec.21.1793437249116;
        Sat, 31 Oct 2026 02:00:49 -0700 (PDT)
X-Received: by 2002:a05:7300:a945:b0:35d:d9a9:e455 with SMTP id 5a478bee46e88-36a423b3556mr11293357eec.21.1793437248425;
        Sat, 31 Oct 2026 02:00:48 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a428c17bdsm14573186eec.6.2026.10.31.02.00.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 02:00:48 -0700 (PDT)
Date: Sat, 31 Oct 2026 17:00:42 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shazad Hussain <shazad.hussain@oss.qualcomm.com>,
        Nikunj Kela <quic_nkela@quicinc.com>
Subject: Re: [PATCH v2 5/7] arm64: dts: qcom: Add device tree for Lemans
 GearVM variant
Message-ID: <auWuOmzGjuT9Zjmd@QCOM-aGQu4IUr3Y>
References: <20261015023711.721837-1-shengchao.guo@oss.qualcomm.com>
 <20261015023711.721837-6-shengchao.guo@oss.qualcomm.com>
 <302ff5ea-cd47-4703-8b29-125d5f91ccc2@oss.qualcomm.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <302ff5ea-cd47-4703-8b29-125d5f91ccc2@oss.qualcomm.com>
X-Proofpoint-GUID: YNfY27_9OtdsL28g96Oowbm4_Yx9iB_c
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMxMDAzNSBTYWx0ZWRfX7TIUan7g+yh+
 q83K2Af4G9yyZsiC8YyQ8wJ9VcNJ4cAyLEgZvbQuOFcC1QduAaHeQ7Ck84RgqdxF9rQyeUHlf2E
 VuO2kW6PfqkR/U+dYvJXH4OPgSFrUXk+eMHDk0RyFyv7KLvCBJaLA09M3L2i/M5+9YEJaxfAq4B
 3yctdtOxat+JI+mylpa2+vvOsja8usSLAI4da0ykd2Ir00usrwb8Tp5HzPBJtsSQYXHAlApSo9i
 W6Dd8SJzwPbvGPRl4HhoO0cdatG+9rtA7np5p4gLF/hmUzWr40URiAC5SpBKln12Wap6Vb9GyUE
 58R4eKIZZiOyx7OsjkMoqD3pciudVi7XiZLKuiRLNVa49vE9hOi/9TbCofAszdj+zPQTfcXj9Re
 73gXI1oZTTnLYdN0ciw+458HYZ9OxJpNK0toVz1ZgSXCRp6MNEEaLdR1BZL+VOYNl6+hgL2nyYT
 87XlouF+LuMji8WS77Q==
X-Authority-Analysis: v=2.4 cv=HNBWhYtv c=1 sm=1 tr=0 ts=6ae5ae41 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=ht1BiLNV8k9JpZ-vTNMA:9 a=CjuIK1q_8ugA:10 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMxMDAzNSBTYWx0ZWRfXzbTSmlo85NBq
 yvsYCoEc1aA7+ebxMZ6HP6Mqh3jPtDiM+YIGmhQa6xhcGbCRdFFEr28nimIShIwP+E8X6MIJHwA
 lWDIBOwgsnWZAYlzizu47PCLSLgWc38=
X-Proofpoint-ORIG-GUID: YNfY27_9OtdsL28g96Oowbm4_Yx9iB_c
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-31_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 adultscore=0 suspectscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2610310035

On Tue, Oct 20, 2026 at 02:14:46PM +0200, Konrad Dybcio wrote:
> On 10/15/26 4:37 AM, Shawn Guo wrote:
> > Add lemans-gearvm.dtsi for Lemans GearVM variant (SA8255P) that utilizes
> > firmware to configure platform resources such as clocks, interconnects
> > and TLMM.
> > Device drivers request these resources through the SCMI power, reset and
> > performance protocols.  Assign each device driver a dedicated SCMI
> > channel and Tx/Rx doorbells to support parallel resource requests and
> > aggregation in the SCMI platform server.  Operate the SCMI server stack
> > in an SMP-enabled VM using the Qualcomm SMC/HVC transport driver for
> > communication.
> 
> [...]
> 
> > +&firmware {
> > +	scm {
> > +		memory-region = <&tz_ffi_mem>;
> > +	};
> 
> SCM should have its own label since it's an existing node
> 
> [...]
> 
> > +&qupv3_id_0 {
> > +	compatible = "qcom,sa8255p-geni-se-qup";
> > +
> > +	i2c0: i2c@980000 {
> 
> Likewise all of these

Yes, I should have done it like what we did on Nord.

> 
> [...]
> 
> > +	cma: linux,cma {
> > +		compatible = "shared-dma-pool";
> > +		alloc-ranges = <0x0 0x00000000 0x0 0xdfffffff>;
> > +		reusable;
> > +		alignment = <0x0 0x400000>;
> > +		size = <0x0 0x2000000>;
> > +		linux,cma-default;
> 
> What's the nonobvious reason for this?

I will drop it.

Shawn
