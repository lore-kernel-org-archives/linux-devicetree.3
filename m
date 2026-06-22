Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72C5F33120E
	for <devicetree@vger.kernel.org>; Mon, 22 Jun 2026 15:13:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782141185; cv=pass; b=mWNDYhrDsC2bnVG1B2W80rUOp3ncLORdW+BrIgPs4M4zoMMFv2EEB8s5hECUXiX1W1IypxdXCpUYd0/X+RBj5VsY7tAoEr6O9VJxXG4b75dkJSspGNnGN0cKcTTtb9zPyWW1wSSRdmg0cj0OzUPA0NyNoXEQs8MMZAT3rL7NpI4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782141185; c=relaxed/simple;
	bh=jnnOTP98RJSIabIVnaNQSG6Q60LW9M63DltF5shduyo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VPUzZ12rwt5X2C3diOGyG37bBcYdPJyNe0XOmO1uDenA2kHxUvO2zfk0Kdy8JmXVA3fC6xrjNxqclLQTvcCTAQ1Yu9FqNloJwHZAtWhwF6c7dD9wXMiVrwODB5VwWMsIBNdFce8j0txShLiuQPXNXva9xHQI2kG29fQuwso28Ao=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EOCmz3Hp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QFInNeT6; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EOCmz3Hp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QFInNeT6"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65MDGNek1261428
	for <devicetree@vger.kernel.org>; Mon, 22 Jun 2026 15:13:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=p5YHH1cPRNvLPXQXevUlrGJm
	18UVfu7zN2fXkcwzJwM=; b=EOCmz3Hp6PTVojOiJ1lRZkNJuHYUT07OYy5kVE63
	Ro2cAkN/StUFvMaVmbEz74IduofCSrfTLC8MFWuaYti7+h9oZ2A1YiPIuncD6Mxc
	HnvwrSMu9UgAYeablvF5k5tsCFHvh3zRgYp8Eo9gFfgoYzx/yS/W2ferydWAb8eK
	X5jaPGe5ow8qnM9vYHKFEx5gxSBRK9YHqoAU2vEOam348mEbFPGAvFYSbNZPY50b
	WJxF8CN7kN1BUXkkWxYEJXdPqyX8O86X0Z+b24gSXwg/t/j0B2enpvjEggHFl8yq
	aL7Qabnls8QaqWLcQJk1xUy4G4rKPBqeCr7zw80F0C5q9g==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ey3eb8xx4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 22 Jun 2026 15:13:03 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8453031c57cso6344898b3a.0
        for <devicetree@vger.kernel.org>; Mon, 22 Jun 2026 08:13:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782141182; cv=none;
        d=google.com; s=arc-20240605;
        b=WyMICfrJxDci84f4rOLRhvO05O8iRy4+TxZzNrPEvZTe1Gr0dPmaTQ3I+H44j8fEkQ
         MQvwqDek/hMKpby8gZIfiOIljTcD3XmVtBNJxA4PHhsp9zMVrpv0wm/83sh5Z6vEhRn+
         LY5KXKh9PP0yE45iY++FkWIC4LE3RbDUuq6oHx5ByakZ53SrW27Bte/AIbMnNLVWfQPo
         PS66K8jCQY4d8fNgct+LiGZ3XEwE2CB/hXI9j8PAJufzsXNx/tMr0DfdfXgF0l4GzePZ
         8s1vf24WKUy5Ov9fb3ldt/JN/yv2fdqkypDQafz1vuw2bDUq+BypcGJkDvgVpYFKI/Mz
         xdNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=p5YHH1cPRNvLPXQXevUlrGJm18UVfu7zN2fXkcwzJwM=;
        fh=0oFYX7zflZH7X99TsEpkqFjLkavNjTARc0aCZ+RsbTM=;
        b=E4ILOO0ENjl0+CRpG+w/BtcJ69KZlsgXxiHDig3dx50QpFBU+fehlvfStYPRs0asiA
         Xa3STfgW50mKTyfCc5K/lyY0QEvgMALM36ix9F1C3p8KMCKDI1dr9b/3Q+ZWMaqPPT3U
         ZSkLPFmNjnOqH5Q8GWC6KljJ2iprij8j0uZ+n855Gm0aSz1uSLEjP/oe2Z89Y3ooOIhq
         4DM9eINwIahyFvKWagPylkxwSH/BnN+OjmE4hAd/Jdl3RxgBx6pG9+bsuKnJM3yHrG3f
         gHRPOuGVvlssOMQbjRuk1PUw9joIZoaJl/YeTkQlq7pUwabRKJHVgeg2MkLJm+FG25PU
         eP2Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782141182; x=1782745982; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=p5YHH1cPRNvLPXQXevUlrGJm18UVfu7zN2fXkcwzJwM=;
        b=QFInNeT6ux150QBG5huzdXml04LSWrox2JRQy3q2Wxy6RMg5naagRXOiT++yuH/FdT
         A4WUU5RwLkXBYI1YbVZtijvAmz/AcOba7S0BDkeBDISoAGGsSC97nb3pKEhiSfDihZVy
         jd/UvKF+fI4MufRzAgfDM3X3j9mGWtDoK5tCo/t9Duu2kdUTfoTHsmB9fFbDz45g7w5/
         InkXsQijtviXmGy0q2pZmvNCo0dudI2VPaaHTkzKF/nM39ePU3pSoER3hwYU/nmNeiby
         VzmIxfi+1HrTXxzjDcWD92x6vRywEHgj1Ht/PDX2TDGWpmQ7k/Wb7oPbVGzwboDzmv/b
         2/cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782141182; x=1782745982;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p5YHH1cPRNvLPXQXevUlrGJm18UVfu7zN2fXkcwzJwM=;
        b=tKfiVXOZT20BPc29bkZyvxK4PITjBXxMfkd01vr5wNXwfxf+7EY9i+TcFkTPU180lg
         IUAVmdWz19K+CjyD1mhOv1BPDZMoZcTsnO1PCsvinqo3OoRt6ttnTTncbfRMyLzomM6b
         tnw4qcYQVQMVlKxlrRNeM+txy8wupfcjs0y5BjJB8E/eJMZRzZ8j2kAwPVzgzxMSxIvp
         RwqnhIsDCdPIU/tz7nJ1hYyOiAnk/FFlJpOmKBAWF075ByszhnMHHhcygXqA2QTLBJr+
         19dcCNJiDHRYzYkoESUQlXLisTbuEIvUmPLzdiug4p79YWlMpkSPsplz4tRWiPivdUmT
         Nkow==
X-Forwarded-Encrypted: i=1; AFNElJ8wPnQoF5HDhzYSLuCaKg2MwOOfbaZux3jbguaZD0m4FCNcbo+QtIvdlN6iX/i80Dw8Cuv4mX+SFBDh@vger.kernel.org
X-Gm-Message-State: AOJu0YzEfApWB+NFtenpCtLR2lPpVIZJUxGNFcRmC0rR1hOdI6BLmu9e
	DHqvwq8icO1uSVNY1Pea/s0i2IKC9fbycevH/dL+1/DDm2sCfYDCpcObm4sNPOEMqWa40DPk+FT
	Cg6vw+dBv9IwfOsggrchkbRfQUuvb7v4RmuUJzcMsxtSD/xXKfAQL6ED+lqinuzrBm0huIpQR2K
	UiRAfxZ3wYCEhfTrQgJYm1ZHNVq9NQTDusX+8vquE=
X-Gm-Gg: AfdE7clnypL/EYR41Jy4OPlAbfirGoGuH8qrMJWo+Ww4Pg0n1D+kM2wyTfQ6zq0Fy+M
	+IpnWkZRDINrEvjY3P35TWX+RtSUNaOBCs6KpOtgZ8NJYy4dFkvH3/JlVe53DcW+rVPrAPMDApI
	OVVZBKiBvWaYN7ZRdRn4WgmfvmS/1x0O41701+Llo5p6ZVLlQ+lpv6ft5BCAYNVsvgTeYgbmXEW
	bY9YCHRjR86kTVy19ljNEXajU18Ow==
X-Received: by 2002:a05:6a00:cc3:b0:82f:5051:f024 with SMTP id d2e1a72fcca58-84550866614mr16439110b3a.27.1782141182308;
        Mon, 22 Jun 2026 08:13:02 -0700 (PDT)
X-Received: by 2002:a05:6a00:cc3:b0:82f:5051:f024 with SMTP id
 d2e1a72fcca58-84550866614mr16439067b3a.27.1782141181783; Mon, 22 Jun 2026
 08:13:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260604-shikra-dispcc-gpucc-v4-0-8204f1029311@oss.qualcomm.com>
 <20260604-shikra-dispcc-gpucc-v4-1-8204f1029311@oss.qualcomm.com>
 <w2y2wz3cbifnko3td3ovxfom26lll3vl5qgulksa7qnuvzukpf@pqlrh23sljsz> <f6264995-a6f6-498f-9557-723c39becf1a@oss.qualcomm.com>
In-Reply-To: <f6264995-a6f6-498f-9557-723c39becf1a@oss.qualcomm.com>
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 22 Jun 2026 18:12:50 +0300
X-Gm-Features: AVVi8CfSUPRz9gDGBmkPIUFQfXnnifWv20vKVxQV_ubt0A933mN-klc7ydBhPFs
Message-ID: <CAO9ioeUtpSoorLUHXXLEjS+N_AWUtdX2ZD0X+Wss6O0+gwq55g@mail.gmail.com>
Subject: Re: [PATCH v4 01/13] clk: qcom: gcc-qcm2290: Keep the critical clocks
 always-on from probe
To: Imran Shaik <imran.shaik@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Brian Masney <bmasney@redhat.com>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIyMDE1MSBTYWx0ZWRfXyed3vQoYUyBA
 SYV46q5QXSpWOwHl81rawQ3QslbtHF4m1KQFAw53Z3oWmwmDH3vYXt+FZTzpAmRo1WLXXrJtwd3
 yY+t7Isa7Wt+pUHXlCQzJ8NDFkgInZs=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIyMDE1MSBTYWx0ZWRfX80T1J2ahOv3l
 g+/3Xqc+Zh/NWEbdCAFIdqk+M8vcdEGnebaeYLI2+s4TAnTGJ++PoxPb3ELy16PI8icwWBrl5MZ
 8hBxLDkqriI+ZHFIdiLq7BwntABExmpdzevNtZEtyqm97GuZeXDC0vSq9DLYH3OXrJ9UGD1wRIi
 GddpKxn7UOn0JWK7ZhWG7UBp9IHn5HWRj/KtIn3z4Kmz8dtTCD6MX5uVEoxLGquiNVEsqC550+k
 H3BIVHb2vLYEkkBRPm0vxVhO3Poz1EhzA83zemQeR5j3qwYh8NytN+NZDwNNJ9yWbzLbpRwJ5y4
 CNmMwMgCoY2P0OKwuEfW8K5hLMZnrdOUI6sm78+1twlpSrcNLcQwpKUcbejXIhyl8RDvO2xOsl4
 EjtAjHjARbZiCwDbhNMeFOhvV/DiOm0ZyIameOtgBlNizXXbgJvPsY+Djl3SRa94o+6z1fjc3me
 UBx/8aAqoVucKT88mng==
X-Authority-Analysis: v=2.4 cv=ILIyzAvG c=1 sm=1 tr=0 ts=6a3950ff cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8 a=hv-Y2RuR39m9dDk4NsIA:9
 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-GUID: vBbPOI30Qwa__0VjCgoEkIhShCFeyHAi
X-Proofpoint-ORIG-GUID: vBbPOI30Qwa__0VjCgoEkIhShCFeyHAi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-22_02,2026-06-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 bulkscore=0 clxscore=1015 adultscore=0
 suspectscore=0 malwarescore=0 spamscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606220151

On Sun, 21 Jun 2026 at 16:28, Imran Shaik <imran.shaik@oss.qualcomm.com> wrote:
>
>
>
> On 06-06-2026 04:54 pm, Dmitry Baryshkov wrote:
> > On Thu, Jun 04, 2026 at 10:56:07AM +0530, Imran Shaik wrote:
> >> Some GCC branch clocks are required to be kept always-on due to the
> >> hardware requirements. Drop the modelling of those always-on QCM2290 GCC
> >> clocks and use the latest .clk_cbcr convention to keep them enabled from
> >> probe.
> >
> > You got the feedback, but it got ignored. There is no explanation about
> > gcc_gpu_iref_clk and several other clocks becoming always on.
> >
>
> Apologies for the late reply.
>
> I have updated generically that few clocks are required to be kept ON
> due to the hardware requirements. For gcc_gpu_iref_clk clock the
> Power-On-Reset value is default ON, and such clocks are kept ON from
> probe. As Agatti is working functionally, I will keep this clock
> modelling same as before.
>
> And I will update commit text that the GCC video ahb/xo clocks are
> required to be kept ON similar to other camera/disp ahb/xo clocks.

Why? What is _wrong_ with thow they are modelled now?

>
> Thanks,
> Imran
>
> >>
> >> Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
> >> ---
> >>   drivers/clk/qcom/gcc-qcm2290.c | 160 +++++------------------------------------
> >>   1 file changed, 18 insertions(+), 142 deletions(-)
> >>
> >
>


-- 
With best wishes
Dmitry
