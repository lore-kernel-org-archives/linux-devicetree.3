Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F215A34EEEE
	for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 22:48:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774651715; cv=pass; b=YEMcg0UyI0erZb6ch/pov86sZo4pmrB04Qgq0SP8kr3LO/1BSgXuppMIO2g2Se4azS2U+5eY45Zjo9fQUyQnu6BbpR5XZvty3HtrDUzDikt5Lzhdq3BbDRObCU9YMffZNQxj0Ry1mpktA8bEmmUzaOzkdzp7xFiYjQjnmdhbdVU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774651715; c=relaxed/simple;
	bh=O1NKOiweRJjnjoPU1WxUJ2OHjCKtZyFHqNZw59QAu6s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hG7lRJwqtZjSh7JBxmIJMKwGdoLLUcpmrgWGTzuTWM5l7g7gPzyNqDGImJEPFHDrVSyraLhEgJgoLhdfaVsYGN44v2JXgjP+OCFEAWC+gn2x/S0I9XPhUDddgSjPpD6E2OzGVFo3FtBmBBfbTkz8Ldxmtqr5Ct1S+QR0xsJ72cM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PPeJjtd2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=e6CxWZun; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PPeJjtd2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="e6CxWZun"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62RLgM5J306900
	for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 22:48:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	a5gVcMuDsUAZsGbjud51wuG/3Pd9PqWHlN4ImA480V4=; b=PPeJjtd2pfiqnLS/
	Jq8Nna4aXwsTQmqjKuGssdXhoIxVexBOzodyMJqJltnCu63kUZIZLdBaMR37lMn9
	4JphGMOQ/U9bW0W5CKNH48pPX6+SF3qCfE/Ci2Q5L+c/uLVy3Zq4z2GGA8x6X784
	v9Rxl1SI1s24VDZ/q7PzOD7A90lLWOpMzrV9Vf+kyJYeLyBzY484Ywg0VWfIDk11
	anj27futnyjEyJnqdyBlMPlXCTa7cNoYwv4aTxItJJGYv+R25W9R4fTO456jpG5B
	J5Ao+vPRDjtj99C1pfRmfOFt7WnxA6idSDbe2HpKHCFt9nHpuyqjaFImEz4TuBPv
	3/cE5w==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d5v6b1cam-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 22:48:33 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-89ce5eec0f0so8126326d6.3
        for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 15:48:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774651712; cv=none;
        d=google.com; s=arc-20240605;
        b=cPx446rJUOSMynIaP1kGyzt2qy6d2gTn9kfv30w0SAjRlmylTRWBaCV7D8kivY3SCL
         XmqiCdHudo6OkZGR4v0dtdAlfgb74D7pTcihEWaJaX3IM7zDjPDepmBwwIio7cGUyJI1
         8ImfFSu6T0Nil2X0q8lkYSfD8b6YNg+uebc7ykL1NpH+dcFBI73bQwBSEpBKCFjp2m2s
         9V21l6JLu1H+DrT2pJbtzi+oPIn5ucLo0oVb2YEsNFNjDxr+rsN7/widREc23hcd9BRH
         1zxVogCkOD9sHPMEwazvg+Z6uXgDhrOQ0UvmJAymr1wFcKCBTO0h7610/8gSBaPTwtx/
         2ARw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=a5gVcMuDsUAZsGbjud51wuG/3Pd9PqWHlN4ImA480V4=;
        fh=EQCKbR6Rv1WJIve5zImTJjVuAEIKZpSLLbd1jv6L6lQ=;
        b=H2odqp5fiLe0Z/oVAE4ONvX2j/vKsd4VtX7UGp6hsoFxCw6cTekq+X0zr6LBk9SAwR
         eetOh2Jp2k7inqJ3J/DVNga3C99yarTyfFOcY1FqHWzEZpcdP2RwXlcJxW8v9titeThl
         luezMB/YhR+gxfHx23icjwj879oOUc3l5Hj3RTtONHRPFe+v8HfHikw4n5YyRlPYHWqf
         xgHWcRMTsto1UU1kbM8JujPZJUHzY6DJHuBFVNw14xFNXPg4rVZxTB7pZ1iqziC06UZv
         66u0C7Tx5JQZw1mwpJanCA8nJpQ4T6kGfj2WcLcBb3iRHvVGqx36PGhC9/dsrugRhOpp
         r8wA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774651712; x=1775256512; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a5gVcMuDsUAZsGbjud51wuG/3Pd9PqWHlN4ImA480V4=;
        b=e6CxWZunAMu4cjBsPAxiiGxsTFNQ/T/GSaR90nJhdbmnImlnw1xg/OPWjWyuQP6lSA
         ttmn5XVJFqiIBMzyGZcPvUO2nEwuoFkPsvgOSuvVMXaxYY2lkzg3DBYt4b2phO5W7EOB
         wI4iKbGVzxXJzXc6XzBVgCjSBWBzJoXTyRnZs9qy3usvfbCD2ckSIZZD/9xUQtb3NPHr
         meGHsbth2v1+QhLgKsxwqPUetSqBLTNFbbMKOMRkUR67wA1iLW16MXYgUaHSpjiyRwUx
         lb/4j2ZjIb5kC8t8TLhKDl0cS5uB7Ll5eVmZ2uMZRBdNiLs0dpfpaPbhDXyb+kNiKS/J
         kD7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774651712; x=1775256512;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=a5gVcMuDsUAZsGbjud51wuG/3Pd9PqWHlN4ImA480V4=;
        b=JZDxbD92LdjMs4MQ6pnzjgG70JuEX47TOIpVAhkUf2NmlP6plyQy56bu7tLiV/at8J
         eT2m0PLV3y55aGxwR1S4nGkM+YcgcD894QwYq5slPq2iiPdmPGNt1bqjDEAlpRvUY6MY
         6+QNBU2P7i2r68ZDw8h4FAj0YygUMCrP7FGEdBGElYK/6O03JSelpKK5F+ag1N3K4Ypl
         ZUKoqov1oCIGf4rYyRdZGR7zpYqEdJMQTu6cTQjJ17WPNK6dN7vo4clHm/YDzadR03Yi
         1PGX8V8MsGk5H7SGa8o5wuvqh9XS9G/2zsq/3laObGh1SRCd+5e108cQ9n8eg+MXn2RS
         NgYQ==
X-Forwarded-Encrypted: i=1; AJvYcCVYx7+0WwYfM3Lza/YKttrj7u69dD+eWIcgsVupaTCjx1qyplBclGds8Div/4ZBR/iTkPFow/pAA/T2@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/YwgtmhvmHFn8dggAesLHGMa/VkcrOargu7zS5kHYoU4Ksb3X
	ezDVDCNggPYo8o20Rcmy+o1TttsQ7pXRvEQ7PejpmqrDvde17LxOnrlfFKgx/aDpaEfjJ3XrE4a
	j0mxw3w6bHMtVS0ElPZ+Wv1rO7zJJfPv7NgkrmcLh8afNVhh1fwQ55D9MY5/HaVEWBO+GrMU7sW
	pmVfaNli4ju/VNtrp6zIj0+IoeZyT/HnzgmOc7P6Y=
X-Gm-Gg: ATEYQzxONkovhGlMhb0mJ8qMZ/HHpy2BzYXMjqX6LtYQCZTe5U3+rw0aNtKsnq0i769
	fIXuvgqjESXuIFCNeFLECu2/JiJA9LQfOW2MHWmb57PYTHr4/DiwXj1Nr/SBUz4f2P+PtsOmDYv
	o6ixsoQ0Jw0wIv+aIMvopCzBSDvKQu5yKwqI7CxopIszk/Gx3aG9eLvPMVPCO9zr0DWLrI5f4ip
	/BTNGXkbEr/7g7qEB6BAacGG4U5rssDBRvHZ8RvuRxhMZEpOybDSqYiIPzA1Ns4w7HV
X-Received: by 2002:ad4:4ee9:0:b0:89a:126a:5b7d with SMTP id 6a1803df08f44-89ce8d5833fmr56319626d6.2.1774651712348;
        Fri, 27 Mar 2026 15:48:32 -0700 (PDT)
X-Received: by 2002:ad4:4ee9:0:b0:89a:126a:5b7d with SMTP id
 6a1803df08f44-89ce8d5833fmr56319316d6.2.1774651711923; Fri, 27 Mar 2026
 15:48:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260326-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v11-0-5b93415be6dd@linaro.org>
 <20260326-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v11-4-5b93415be6dd@linaro.org>
 <CAFEp6-2s=N9=Z5A3gZZYo+XErBT=gMRHdxB7EQV71wPd3UqYrg@mail.gmail.com>
 <b7hndy63j2foc5iuly4reaunaorvg5asfgeza5ptjytaghc772@6jxgnimkcvx6> <7757b121-da4f-4157-93c9-4ba162b2696f@linaro.org>
In-Reply-To: <7757b121-da4f-4157-93c9-4ba162b2696f@linaro.org>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 27 Mar 2026 23:48:21 +0100
X-Gm-Features: AQROBzAMm1yN1rLAJcaNHZgHlMfTEGzX94B2QA3fXAqRa4WXjkjCipnSkkRQp1k
Message-ID: <CAFEp6-0og=MJm-kZmTdTka7per6eHvfO8pR1k87NwGT0no-Ncg@mail.gmail.com>
Subject: Re: [PATCH v11 4/7] media: qcom: camss: Add support to populate sub-devices
To: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        "Bryan O'Donoghue" <bod@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: WEQmOnTbDkXGtv6tgWSD5Mk5_BTdxNjm
X-Proofpoint-ORIG-GUID: WEQmOnTbDkXGtv6tgWSD5Mk5_BTdxNjm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI3MDE2MCBTYWx0ZWRfX61NUfwKG8NNO
 Hmby69BOl2T1P8pnv0Z8orAoJIvkilFcItDEz14rFfVQVOk2ciYPE8+3aFhTsOdcvnsEXGkbbAs
 XUNZ/5J0sCBeOCi8B4h/L2FaFBugLkUbD8KO3bPxPpPC4QdbKCO0/CZl9pZgA0QdbXqacBqzPHG
 RwsnHwwXcGHdYUj2eW/dfWB5Gz6vuw0vKqFmxQcxAxaeX4DAeBbY9Dzrk2yCzDjiL7pw/T3gZ48
 mnB+85JRLgaeJPeue0PBj/5eM+XBnuZOlK2R6l74GNYxwx1bJxa6lJXUMn4sDSTxkfftz0CbtaG
 QXx+WPgSER8ZyfKFoeFLS059hEzBMq8NGQ9Ek/zqMS3W4GWmSwH2vdWatzSMNzzvbOhIEuTjH3e
 dbHx9Wvizx6in+dQh6joO+c09ETaHDEl0fvNrk4wRekN90vWxONCHLugy8FmUn1K+rKL8IhoGAE
 DDKDBUqsjCQwff/RCLA==
X-Authority-Analysis: v=2.4 cv=JLs2csKb c=1 sm=1 tr=0 ts=69c70941 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=Um2Pa8k9VHT-vaBCBUpS:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=XwtK2cgshX5IxEekORwA:9 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-27_01,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 phishscore=0 priorityscore=1501
 impostorscore=0 clxscore=1015 bulkscore=0 suspectscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603270160

On Fri, Mar 27, 2026 at 11:37=E2=80=AFPM Bryan O'Donoghue
<bryan.odonoghue@linaro.org> wrote:
>
> On 27/03/2026 21:33, Dmitry Baryshkov wrote:
> >> Other drivers typically call the populate function at the end of the
> >> probe function. In this case, however, it is invoked before the main
> >> resources are enabled. I assume this is because the CSIPHY device
> >> needs to be available early. Aside from that, it looks good to me.
> > This becomes fragile. The CSI PHY might be built as a module, which
> > might be loaded later.
>
> Is it any more or less fragile than "simple-mfd" in a DT though ?
> Krzysztof isn't very much in favour of simple-mfd so this method of
> population is the alternative to hand.
>
> The CSIPHY driver uses devm_of_phy_get which handles deferred probe. If
> the PHY module isn't loaded yet when CAMSS tries to get it, CAMSS gets
> -EPROBE_DEFER and retries.

What about relying on v4l2_async_nf_register() in the same way as for
the sensors? That would allow both the sensors and the CSIPHY to be
bound asynchronously when they are ready, assuming the CSIPHY driver
registers a V4L2 subdevice...

>
> >
> >> Reviewed-by: Loic Poulain<loic.poulain@oss.qualcomm.com>
> >>
> >>> @@ -4964,6 +4965,8 @@ static int camss_probe(struct platform_device *=
pdev)
> >>>          if (!camss)
> >>>                  return -ENOMEM;
> >>>
> >>> +       devm_of_platform_populate(dev);
> >>> +
> >>>          camss->res =3D of_device_get_match_data(dev);
> >>>
> >>>          atomic_set(&camss->ref_count, 0);
> > And this looks suspicious. What if drivers for submodules are already
> > there and start probing once populated? Do they have a chance to access
> > this ref_count?
>
> Nope, we don't share the camss pointer or any of the data-structures in
> the existing upstream driver with sub-modules.
>
> ---
> bod
