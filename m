Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FC1537F006
	for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 19:18:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784834337; cv=none; b=R3Fvc/cdhsSk+8aJ8k2v3yDlPcD7wKS2Ko8KEcxdyJm3yg0mMuhEZRb+ujflbjlhkrbeStR9NXYbttVrCllsZaQkKjKT6AAejYT5dGqvZaJ6/gO+l7fB7fBamlPHYVGqHdpch74jgNtwKnFhW5vGRyTKZGMf9BlL4OsYTzo0c/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784834337; c=relaxed/simple;
	bh=62MH3ErigjlRTtTQVAj5oD0cUicYxTuv6jKO7iogfzU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=o8LVSBQLseHXLbei6skQUlPdXN52dyDeLFEVSNPLLXcVgbUBlMXF3apDSr6Bo8CvR809FC8NCMaUwKTNdCYJWKb2vS6oxdHyPe0efk6lZC2/PQRe8Wn0t0KJmxG34LNz2XfFxyCWikRq5DUgtRTkJoYvzN4VePJyiJfgw1XNPx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Rg+n2qdR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=e5rK5JMd; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Rg+n2qdR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="e5rK5JMd"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66NImQR5224921
	for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 19:18:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=zb/ry0UeGYL5zv8gKcX/rJF/
	g4FlRmPl6+5B6sl8am4=; b=Rg+n2qdRlrji+8eKrEkcLKblsiF29tBmbvoFuEY0
	O8YbrvjNqa68nZzJSSOMWGeeV+5kWr4HLHAOmGRo5sFatVB14xtH65IIz96PsP8V
	rnyrAFFTuyZ7WUSmmLZ85eBgpZHm9c7hgsjwiE2sNOZxUg8XhBb2IOOzZgE5y8Ej
	Gk6NpDlS4UB75CTcCROpfDbolcEl8zjMDt5hCCX2yFG2dlbmRen1ibjB6aF3XCM3
	LcoCvMS7n+cKv8NlG3xTKQp4aGpY/kidtF+j3Zd5Ju8/tKZYDeL/Mbhdcuhjqwwu
	l4YyyxztXeR9AMFuPvcCev0uEknQniEqRoOcz/eutt28LA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fkeuqb099-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 19:18:54 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-522de3c645dso27015121cf.3
        for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 12:18:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784834333; x=1785439133; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zb/ry0UeGYL5zv8gKcX/rJF/g4FlRmPl6+5B6sl8am4=;
        b=e5rK5JMdHd3sj1t1GeRAqNbLw4HFvTtPfb9d6xuMAgX717M/mx5XT2Aekw2eDh/wyV
         gBKpCVOqiLDNddzzqzpdzFdcxd29JSsk7umoEJ2ETZ3Lm8frd+Mez2mciWWceu0O+KTT
         J+KHtCEGamCWSTkk9GE4iUooNjXJ6jKmua5tzOHm0p7XrRrVozTg1m4LgSk9aLrB9ZI8
         KOrmMzXSxf4gU5AnqDCjYZxYCMFs+P/56eF4SjbkJ62dcQ2rtAnwrmg9us1P6sG+BPdf
         ZjFq/LFxobPhWvrxEURbu58e8sKb9cpUhFacepILQMrcrgXA31E4OVfRp7366XGkOB59
         7RwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784834333; x=1785439133;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zb/ry0UeGYL5zv8gKcX/rJF/g4FlRmPl6+5B6sl8am4=;
        b=prxB9J95SjPecQ4k32Abaq7yhXsAl0EA5jJGewKhYIZFb225Grlr2itf9CT0Z3SH8N
         d/DI+ESGcPF72zTKjiu2kDYlTy/JJ44b6HTwcUBNyBREqNKF9TAhrZ4qYC+Q9QgnVwFA
         d73wMV27YSs3hHX0UyrCyV+mVThki46toU5VqdafTIzSKPaPlF9dVbpF/my/2WNSpxLZ
         jcxDnc7ZKi2gNZ6bHoD/oabIqL3e3+Ah26yoJtCSFEG7ECKG/+8Whk60oRMfoLCmKfcb
         wylmjVxUWonibX4JpiswsCsTqdBv8Mohl4PWN/e4s103GqQuS6Xb3cJuebGI9ECJDPl5
         UOtQ==
X-Forwarded-Encrypted: i=1; AHgh+RrS6jM/RAVHrdbKdoz8QBJctQLPBc4lfLBjpyyRVClgcDih0fOznAlSwp4B+Ppv+L2sIy+lzkq9TQeD@vger.kernel.org
X-Gm-Message-State: AOJu0YzOF4DDoez3n1uRkhYcW6nPhJpmw78i17XlDhEVhg8Zq7fCrwtP
	NlZs0qxGyA87pAZzLdNPXLODxln6pcupF04XsroRymE61YCWWHxzHKOG8Z4Fz7KHJBHpsLSbNVj
	1fM13iGvhUc34DD7rMqH0FtUK3j94h+kNbVaitTqBXrtdVCA9PX9VZI3n3/prnz3A
X-Gm-Gg: AR+sD10ISgUUXAd3zQxuUDuMfmk/u8OGY+F/JpOiyAst8SBejVMaeJZnEOk7VCDgDBc
	pMQBjWymqFoq1X1O2VKfugGIZu95qFsNTRBsfit4FKZfMFmcVtHH6tNoYDV66V0VgMyeQkemm0N
	141ZHr4UGw1Jteez17xAbZ6EMJFfjIAUYv00M1z60NJpL6k+j8VHv5KfgtoXi2ZE8PUQ0ijtBoa
	Oz82d+WoFpAd46lJYDtZkMpRPTn6Yb9olNDs2d4cgcMXmauK++oIBRUlUhfyNFaLblSBBDracJg
	QjcfpLk+g7RBNU+ZQnvdH/dW+xsNWd+hfAEqQWOtqd4b3IugCkSqetNA0wjKkSRXY0rgu3lKfgJ
	ihK6FUJYRdMy9om72J9dQVxBL2Gc+T5DHtslL9lUPBjNvr/6Wb06Lqd/BfZxIV5diMnuMjHZX8m
	CmNEA6oMhiHILUzA==
X-Received: by 2002:ac8:5c83:0:b0:517:9f43:4732 with SMTP id d75a77b69052e-5283ddd1608mr44394961cf.11.1784834332777;
        Thu, 23 Jul 2026 12:18:52 -0700 (PDT)
X-Received: by 2002:ac8:5c83:0:b0:517:9f43:4732 with SMTP id d75a77b69052e-5283ddd1608mr44394791cf.11.1784834332367;
        Thu, 23 Jul 2026 12:18:52 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2a9e44b97sm1155545e87.61.2026.07.23.12.18.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 12:18:51 -0700 (PDT)
Date: Thu, 23 Jul 2026 22:18:47 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH 1/2] ASoC: qcom: remove ipq806x Storm machine driver
Message-ID: <5o4nyr5iycpgopeo5dllygtndbp24g5ejqvh43d3mxwnxufork@zds6b6aqvcqf>
References: <20260721-drop-sound-storm-v1-0-23ae4a689ffe@oss.qualcomm.com>
 <20260721-drop-sound-storm-v1-1-23ae4a689ffe@oss.qualcomm.com>
 <85f2799d-fadf-478d-9f3f-fb8ff91ba84d@oss.qualcomm.com>
 <6a609d87.87c5160c.1accad.0f33@mx.google.com>
 <CAO9ioeUw4QgW47xmC58dGc1_j2UPFjDM+dDRF-bggpBPFA32YQ@mail.gmail.com>
 <6a625f94.4d70c427.b2b96.9b5b@mx.google.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6a625f94.4d70c427.b2b96.9b5b@mx.google.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIzMDE4OCBTYWx0ZWRfX0UbDdymabXSr
 +v/btGmYczpYBq9wmhqXBYKLYYFA6g8b2wEYrmQ2JDfY/YFVNmBCIEgnS6F/r9BdJAMtx4VK6zK
 wfQ8Iq9fdy9pQWWW0Kjhr8SQ/YL8mfI=
X-Proofpoint-ORIG-GUID: ifjOMDrz5XtOD0BG6zSGXuuzi4iRY-1W
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIzMDE4OCBTYWx0ZWRfXxZaS6pKKisaW
 igXOH7ti83vHVLlV1EN8GrerOrhE1ZIKtXfAoGZQ0LJg42CKtstVSyr9b9WG07PGvuT3hf9U3mX
 X7b2vozIS8B+xMBHgmafavkFMsvvwW8h/eiuByxzgzI4qkNsInVPMglY57KI1BXz40+bN7UA1/g
 DTC0PL6m4u3omnzZSsx5FiuKwX3sH+tw8p8FeQ+SjwOExqVP1lK+g6VXF9qYQFbz6datSaQKQvJ
 0T34XdQs2DWL8lIa9eQfmLkWtdWOX+vzp29mJliklrNELlT4l1qRo0a+GMlG4CTsUJ3OoK9BeIc
 l70FqlDZErLDMem117WbWlBeyGdTWy9SIooRKbuDz50GfZWfHWKFDw0KMS9PeKWQHtYA4IWEp5a
 agNewgePOSHMs1nvu7w9ifX/eN3swB7WxtyzJs6EtiyAqbXaiGUFgWhylhjbO/FIgnv5TEdKdE5
 GiyhbrGDf4rc+bPhSVw==
X-Authority-Analysis: v=2.4 cv=cPDQdFeN c=1 sm=1 tr=0 ts=6a62691e cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=pGLkceISAAAA:8
 a=EUspDBNiAAAA:8 a=pgCZHW_WQO5PacoC4eoA:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: ifjOMDrz5XtOD0BG6zSGXuuzi4iRY-1W
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-23_06,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 lowpriorityscore=0 adultscore=0 phishscore=0
 clxscore=1015 suspectscore=0 priorityscore=1501 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607230188

On Thu, Jul 23, 2026 at 08:38:09PM +0200, Christian Marangi wrote:
> On Wed, Jul 22, 2026 at 01:48:30PM +0300, Dmitry Baryshkov wrote:
> > On Wed, 22 Jul 2026 at 13:38, Christian Marangi <ansuelsmth@gmail.com> wrote:
> > >
> > > On Wed, Jul 22, 2026 at 10:00:34AM +0200, Konrad Dybcio wrote:
> > > > On 7/21/26 8:12 PM, Dmitry Baryshkov wrote:
> > > > > The Storm board machine driver targets Google's IPQ806x-based Storm
> > > > > reference board (a MAX98357A DAC wired to the LPASS I2S bus). This board
> > > > > has no upstream device tree, no active users and has seen no functional
> > > > > changes in years, so the driver is dead weight.
> > > > >
> > > > > Remove the driver together with its Kconfig entry and Makefile rule.
> > > > >
> > > > > Assisted-by: Claude:claude-opus-4-8
> > > >
> > > > Using AI to `git rm` is definitely tokenmaxxing!
> > > >
> > > > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > > > > ---
> > > >
> > > > Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> > > >
> > >
> > > Honestly I'm pretty angry about the latest changes on ipq806x. First the
> > > dtsi just because there weren't device (it's ok and understandable) now we
> > > are starting to remove driver...
> > >
> > > There are godzillion situation where there is a driver but absolutely no
> > > dtsi. Lets remove the dwmac driver, usb phy, pcie and everything else at
> > > this point and treat this soc like it's a 80-90 code...
> > >
> > > I will post dtsi with actual device for the SoC but really I'm not
> > > following all this hurry in cleaning code for device that still gets used
> > > and actually some company even produced new one (even if it's EOL)
> > 
> > We have no way to check that the device is being used other than the
> > DTSI present in the kernel, being updated from time to time with
> > non-trivial changes.
> > 
> > For the patchset in question, do you (or the community) actually use
> > OnHub? If so, please consider upstreaming DT files (and also updating
> > schema FWIW).
> > If not, the files will eventually go away. Just having unused drivers
> > _adds_ a burden. I stumbled upon the driver while reviewing a patch
> > changing the driver (for the sake of changing the ASoC API).
> > 
> > And FWIW the series doesn't touch the IPQ806x LPASS driver (which has
> > a DT counterpart).
> > 
> 
> Yes on OpenWrt we support 3 OnHub google devices from Asus and Tplink and
> they also use the storm driver for the strange attached speaker.

Ack. Then pretty please, could the OpenWrt community please contribute
those to the mainline. It is a quest and a process, but it helps us to
understand actual hardware users.  Not to mention that getting platforms
support upstream would lower the burden of rebasing on the new upstream
kernels (assuming that you are using close-to-upstream kernel) and it
would also save from similar cleanup attempts.

-- 
With best wishes
Dmitry
