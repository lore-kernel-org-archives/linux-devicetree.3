Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E093C3E3D9C
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 06:25:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787552747; cv=pass; b=ViDXVScMiYl5r04tt6PmQoDU5/XxDApdJUlFxAskk8Y5qOG+SoHCzXq/S6K36Dx2pVfpKEHnC/TN48w3Qexxm1d9er1sT47eChh4qoALL8HY5Ut5rTGJGj+IvaoQpAq9UA9Kw0OOnOImGNRKwSTyvRw7s/CWchmbfZ37cZhUYC4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787552747; c=relaxed/simple;
	bh=K6n5beyT7b2xC5a82nuhKtQd2qh5DqtuyS9OHA9w1qM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TTr3jZ84dbP25H+iq29lDx8aFEnkTv4IqomXY3R1WCqL8me6EM7TSCSwtq8xczwCGiwPp70EQju75Ik6EUkr8KTT57pSrEYUgiGqnzsM/BMvKCfjo3oIUn93xl1tpAvCWr7Pvi54OcQHfFlsU8sXUDONhro0oOZUeQXe0DCPqHM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aarzTtmw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YA6iQxkh; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aarzTtmw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YA6iQxkh"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67O5RH0u1577188
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 06:25:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mCajhJHR3Pp/IpuVOzEzedPicvstmSGI2JFzY0KKFNM=; b=aarzTtmwCjyN2sbw
	X+Zi/X9PRU/YFpjXp3Z/g+6eiN6An3pgY7L48zEKpxjngrHImrHK5tXpywQUNFoQ
	XnOOEtPqUVv1Tyl0++WDFh6Jz/v0h0CuagulM5lsvwJRmJVoAVB9IBqtioKswfVV
	HrYN/PtNJt5x0YdO9kxIHTVDI49L3IiEyw1jN2tom8jZhW18GRXiss5OLcbXCloC
	+fF5Uq4MN5ZHdY4TPsFgi/Dzguz6Xw7Y/J+RJ/gC2PREOuGzOfFQXASOcOF+puPh
	qtbBnqX1Rs2zcY8xMsAS/ODoUvJs2chnkDkiWENSqzZq/Ta1KpGfmp88T/2JKNgn
	6WzSNQ==
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com [209.85.128.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g74hcwgcv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 06:25:41 +0000 (GMT)
Received: by mail-yw1-f198.google.com with SMTP id 00721157ae682-836ec8c3338so52612427b3.0
        for <devicetree@vger.kernel.org>; Sun, 23 Aug 2026 23:25:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787552741; cv=none;
        d=google.com; s=arc-20260327;
        b=EHuBKlHjTP0CHmk5bfwlAya0Ssw+roFJzlH5R1XbNPMGcSvpXqzWAKSN5atRQWuYb3
         EPLgERDHHNZlsza+A5N+OQO3bHJFCCiq1fBvHpKWQY9vgQVZAWt3nCTFnGNVUR4BXzy+
         2CDnwj/V8AJCM5QzKod3FrV9iYvYBkVqwoGjrVmP+i23fBVA0Y5WQQ18I1IgGV7YX4vk
         sh6INZbw+Jvgoe1mOisPgWGSCqRjhY+gdBvGPp6OXlBIvsdGJXMKxQB0kPNSKqzmE63k
         mEb/kEjbJCAROyEdJUxAHx5BWGUpLhQT5ICOWYvzpWtGoAy4qwZ7DB/0DvNCdVYTFna0
         Oa/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=mCajhJHR3Pp/IpuVOzEzedPicvstmSGI2JFzY0KKFNM=;
        fh=B9UEm6BLNO5Pvl436QEmOhbX1eZZILSeA3yUCzxMMoQ=;
        b=Osrm0ZKgwDa0qfshmU+Yh640McqlEbw0bwppXD5Prm+bImarADEvi22xhtky2gcyXX
         Z8YDOfhKZ9tng4nQPeq1KF9oUBTkz2tBwRcoEIdundXFLM9Hbf5flK05eldgusz4fTM5
         5KSnXlbBqIqopyuANfkkOLZ+PLKg8RZdTV6DGzkDJ5Q6221qmVVf0fQlU7r7jTG0CbXd
         GIIiHoOOUM5/b8CKpUqm4jgVVam7L/ig3eXblLHXHW2MLdVEOpwYWvWc3LyR8qCpeiHK
         zEptWjBA9z2vKjQL/HnKuBhbzb4M97VTejHtsiOSULQ19saab/dka7Vf+KuLn+yYLNtp
         afpg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787552741; x=1788157541; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mCajhJHR3Pp/IpuVOzEzedPicvstmSGI2JFzY0KKFNM=;
        b=YA6iQxkhtNvmZaNj3f4vczlRP1KqwPdmmp5ApJBUAkfCnn9twF51BDFhVBMDee+1Ez
         YtcUEyFFQxV+Nfz57WM44B3QQzH1sjTcplPir8az25Yr8FNfuqbPIdWVtQubW2Ouswrb
         6HQ9nAQEQoQKRuvzyuf66jdROdT36IBYrtXInITk1seo0m5bXwjdnAwqDBLiNso+U/qK
         gw062cdgosalO3axeWCB3fQb7kQ04r2rCbJuXyctyujOpMEkEwoi51Fbrtnf9HNsyI5d
         KzUDHeHowbKfRmhXnO0HgOHR3sFvfQORXgWNxok+AH5q7xpjo+y0Jm634UHbghe2cT2t
         ybvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787552741; x=1788157541;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mCajhJHR3Pp/IpuVOzEzedPicvstmSGI2JFzY0KKFNM=;
        b=GqFiwDNA/l+PueHzbQQNLoP0vlkZxJ/HKuSM1VPTQswLfItyOg3QIHL6HezXY/9TT6
         5v9/Y0eelxyHhSiLFRj2GYXdSWBAX7SKOYD+oFyWsUYSuDKowrsyjaCpO9vI5jdXmllR
         dZFOkM2MmaZnKqoT/L6O/VqXz2kSI3nFyR3cf9uoZaDQL+++huB8sG3Nnbj77t96jgQS
         5XcRY7k+BB+pNgcWxDXhCDc6L4ddDYlpu82AcNWbWIzrZWAt9qChFk1a5EApMoPWHQGE
         66tzmbR/iOe33MDGXzo7yyzUHj8Db0GH2jA118/ihuDMg8/Mv0Oz3B2nBL8SUEfGJYkL
         ozfw==
X-Forwarded-Encrypted: i=1; AHgh+RqwgT07XS0TCAWeT3oHgR85q1sriMgfrDq10N70L4FsAw+P9xPEp1JtoKT67k2tLtbAlqYdOa9DqdKY@vger.kernel.org
X-Gm-Message-State: AFuF++lt5Upass6hPvgE1/S0dNHOwfUQed1ezaIdH7oo5zKiJm5bkR9R
	yuGFzs2eJ3r2dxgwT0tWECUQTbJlgOiNrhT1m2GRvRH/eZcOPP3eVqkg1hNx+YOnIDrwqSpiGZI
	iWPji7hv4cKE+JYmb3pDV78DaSOqEyY+TWKpHHmR2WxW7u34CTo9MHsZ0W145bBgMsRxJphFndz
	MW4JDI7T5xX8S9hB34jCv5J8SDK/LZtn0IVEKdUfg=
X-Gm-Gg: AR+sD10Kouuqy6GXLJTtOwJ6/2/mq4a42ZBewxKqp6UE9SE8R9T6MB2sg6QJcF2Qmd0
	O/uCW+bbprEKWnj8SB9U7XU9oWcLs+dhxB3f1RAJhj1pnFpCt0eW6vZMox/zt2xAvmDaZdt9LGu
	P8i5guK6r251kYI6OdLb33cQFOlVpBYmdeOjJJDSIWUfCfIOU4MYrdbcmh12Y=
X-Received: by 2002:a05:690c:c94:b0:81f:a595:2e19 with SMTP id 00721157ae682-84c98c15838mr61606377b3.23.1787552740913;
        Sun, 23 Aug 2026 23:25:40 -0700 (PDT)
X-Received: by 2002:a05:690c:c94:b0:81f:a595:2e19 with SMTP id
 00721157ae682-84c98c15838mr61606227b3.23.1787552740496; Sun, 23 Aug 2026
 23:25:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260701105757.2779738-1-harendra.gautam@oss.qualcomm.com>
 <20260701105757.2779738-7-harendra.gautam@oss.qualcomm.com> <20260702-augmented-raccoon-from-asgard-1878d9@quoll>
In-Reply-To: <20260702-augmented-raccoon-from-asgard-1878d9@quoll>
From: Harendra Gautam <harendra.gautam@oss.qualcomm.com>
Date: Mon, 24 Aug 2026 11:55:29 +0530
X-Gm-Features: AcwNN1XHf1j87QKD7cF1jGyxFPL-NX8DXn1dD1RwuLYfH38PNhcv9vuhBxW9jVs
Message-ID: <CAC-tS8D3KReZ8tJ3LZdnrUbEE36KVACDHaZ+=cDddKLgSLUgtg@mail.gmail.com>
Subject: Re: [PATCH v2 06/11] ASoC: qcom: Add generic of_xlate_dai_name helper
 and use it in lpass-cpu and qaif-cpu
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Srinivas Kandagatla <srini@kernel.org>, Mark Brown <broonie@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: YE1c-XmuITeErch6doPheYCcB-xUVr1U
X-Authority-Analysis: v=2.4 cv=U7iiy+ru c=1 sm=1 tr=0 ts=6a8be3e5 cx=c_pps
 a=g1v0Z557R90hA0UpD/5Yag==:117 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_K5XuSEh1TEqbUxoQ0s3:22 a=VwQbUJbxAAAA:8 a=Z5INuiQzEjELwub_QUcA:9
 a=QEXdDO2ut3YA:10 a=MFSWADHSvvjO3QEy5MdX:22
X-Proofpoint-GUID: YE1c-XmuITeErch6doPheYCcB-xUVr1U
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDA1NCBTYWx0ZWRfX46zpeDp54MV9
 Zr765X8x73jvg2OthnFI8sU8MPGidxcsRgMenmynYsvL7XT5p3qV3mOE3rTejBYJuX/lutEv7H+
 EVK8xTAmmKIFOqp8aMHjuCPmJThoKinLIdgYFyuxhm6SdQbmIMO1oIjdP7bZ5oaStoVn0TWz428
 g/rWWuMkOMr0eOSzLfBKKaxzaIJlEvcqYm9HkodxL8Ujc1x2nPPiq4e4rql5CPSfMnGAMZu6KrB
 jo7AfOB16s7gOpQN2vxzywuDR1rUenITe/AV8c897FAAJL6H1qQ3anqraxvKhPkY4Csk6PLIxHU
 aq2CGYeRdo1zXYCZRfLzrnWbRwT1Ds4DtLcCKQrBR/PB4QWQ9Fj3d83DS1/sELryYXxL2PPutvx
 SV/Ftd1XiErs7UYRhnI7Nfxo0gffBUaekKasDKaXfGGf6BBBXdWwVjOzKpuKUqVR7jpf8r66pAP
 KIz4dqPh5BlRhfuflxg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDA1NCBTYWx0ZWRfXwCqiPo0P+yFY
 CTPU92pGSDPbAFWxzobHHCvL7Es9jFhSmbnjRkAWn2h6Cma4zrir6JhQqbWHlzZ2HqmIIv7i3cN
 k6nUdA6bhmlF7m+cx+8evCNiGMSOb2w=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_02,2026-08-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 adultscore=0 priorityscore=1501 bulkscore=0
 lowpriorityscore=0 malwarescore=0 clxscore=1015 suspectscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608240054

On Thu, Jul 2, 2026 at 12:42=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On Wed, Jul 01, 2026 at 04:27:52PM +0530, Harendra Gautam wrote:
> > Multiple Qualcomm ASoC CPU DAI drivers need to resolve a sound-dai
> > phandle argument to a DAI name by searching the component's DAI driver
> > array by ID. Each driver currently implements this identically.
>
> Heh? Identically? So why even doing this?
>
>  +
> > +static int qaif_cpu_of_xlate_dai_name(struct snd_soc_component *compon=
ent,
> > +                                   const struct of_phandle_args *args,
> > +                                   const char **dai_name)
> > +{
> > +     struct qaif_drv_data *drvdata =3D snd_soc_component_get_drvdata(c=
omponent);
> > +     const struct qaif_variant *v =3D drvdata->variant;
> > +
> > +     return asoc_qcom_of_xlate_dai_name(v->dai_driver,
> > +                                        v->num_dai, args, dai_name);
> > +}
> > +
> > +static const struct snd_soc_component_driver qaif_cpu_comp_driver =3D =
{
> > +     .name =3D "qaif-cpu",
> > +     .of_xlate_dai_name =3D qaif_cpu_of_xlate_dai_name,
>
> I miss something - qaif_cpu_of_xlate_dai_name() wrapper and
> lpass_cpu_of_xlate_dai_name() are identical. Why can't you use
> asoc_qcom_of_xlate_dai_name() here directly (or
> lpass_cpu_of_xlate_dai_name() without all this renaming)?
>
>
>
> Best regards,
> Krzysztof
>
Will address this in next patchset.
-Harendra
