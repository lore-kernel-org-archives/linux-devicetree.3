Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793010136;
	b=vl1kRwVU8TrGvz5+3v+bb2xG3K+KvMlFeudQQvdFNm8eB+gHmsrE8bw4hJCdbdsvCc/p
	 MHwWeMwtV/zPDhO2Qs+HpfivooI+XwyxUNQe7wHBHLMXsRDxN+QKfFZzW4lbhE0XXtobe
	 pnziSitFmNz0gy48N8WJKLJ65flTOimNCHGn/huN8ndJaP54bhqju0yzT1G3Zp573KW15
	 UeDszt650ZbFgmQTsX4E8F1d+0rYMvEesvOpYxUvb3ZeIKeoQE8RYomwAhkmWbaTXB8LD
	 uLZq7Zq8L1Htu87pqHnwfe6oDLeNsqQV7qtffYqjA7tD3qOgRatjkTOBvLrz4g+IMDA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793010136;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=KHrbmOf2F0FaoGuY9SF3WxuZWl8t4HRAuFWN10h/1qA=;
	b=Ctsh/ice3Q7yRzoivxDCQZPntxAu7sAHMWJNcY9BZMCmEhM8g7WHXmQBEddAeH/pxdb2
	 2VyW3mal2HnxJkRknrSKUwOZQGYW9DJmyahkoqkU+pTYpxdhIizxGO9+vVPKw6PW0+v9d
	 VNOKzi4dFoiuo8f4LKo+IEs6hrEct3Qy9vjhGMDHMEE7OKcG34AhYTdVWVgEPGcLpPYiY
	 ah9LP1V+dvz7U4HwjbhK1TvLiIzJlWAQNdQNuddGIIayemhfYaot+9SdXreI8IoYTVwDp
	 kbuNNCJ2Ez0ILMG1WJX2ARPjqN4qZ9n/GYVYfjgOLE0fM+2GdXdmDxYfbY5UiB0QEcg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DzghUXN3;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OJK1w1kf;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AA7B606A31F
	for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 10:22:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4AA7B606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DzghUXN3;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OJK1w1kf
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69Q8xEtT1911428
	for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 10:22:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KHrbmOf2F0FaoGuY9SF3WxuZWl8t4HRAuFWN10h/1qA=; b=DzghUXN3GTriIoQo
	uVKgpHKJuKi2N+Uxol72TGifH6HJfclAUE27lq7LK+SiKWdF5BDiybBP6PaNCyao
	75JN3do5HIGuGXpP36SEc0/JhsOceDOA5od4cqpVX0RY8iF/zZMnHvKoC03XejAZ
	saR6NQAfwO+CavhgH1S3C0H+3flrzrG1XmEZLyvxeCJMX3+0+UwWUd9Re5itBGD2
	W4UxjqyodaKDeTL9yNScNt/YynzCv/AfJmS92TqJQHTK1T2lUgoo9kASCHnf7O0X
	KV7ha4iPcf5OwVVCuw4kFn+SMzY5KuRDoSs2H3yWohI045L/e0TrqFk5LjfFItax
	HjipPA==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hj3u60a1m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 10:22:15 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-7cb9d27ddcfso416309137.1
        for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 03:22:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793010135; cv=none;
        d=google.com; s=arc-20260327;
        b=q5hQ1zwPw4CxTK1vq8XuaNvpCRQH1zaXliMNJ0MKIj0DbZn8d9LhrQRVYPjXXy+Q7o
         yufyXc3K7z8mI3MUgV/fLMltiDDgA1VUjbVn/PA9qMBS62ycR+0US4A5Sr60UeGbkueD
         c+Ac1ysGQpbQYu/G5Xn2fFQ42svM1GIGZgCwWf/23wE0OdmCkqnZKUTccRgOVgPJDrG2
         ZSeMKQB64wuCvvV+BGSxnE15HSnE4PhJHokOXnoVYDCarijwjCSfHDJmfCt09w00i7+2
         wLHFlGvmDkKI5xz8LlhN6eJsIgeMeaDPPeNbibYdhroUS6RLlCuXQgy79C5mDmw+auP1
         5caA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=KHrbmOf2F0FaoGuY9SF3WxuZWl8t4HRAuFWN10h/1qA=;
        fh=NT5nqK5Mn68Re0kce3w3f9O8YY8it29ZSX8jYGMRYEM=;
        b=CEBReCgrGoVSSXPpK9kIo4hsubmDC6/0/x+PbQC2YkWIIQQKCvdftBvaIfN9v2X5Up
         zQAQtABShJ5IjEifc/0EXzX9T/5lcut21A0kNWUfvYn5pGqE/br+db1Us+Y11k2mBMzb
         vrBi5dNDGIMJaQ+6U1GQfFBTi3ePoE5/Rmjlx2tR6HdQw5RFhcXIruVXVkurM3FCCEea
         0awmqx8dHQTxhXUR1mY3C7MpvNEu1PaTXVRWX/ze+K99VKj5XQxPzIrOq9wUkktktJDc
         2EJbC+ppGkzEWkVAwVXzSCokW42y0X8RA2UhGoNbYzmbJ8ZQpOlY05tXHiVtxJXzuhuC
         GBgw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793010135; x=1793614935; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KHrbmOf2F0FaoGuY9SF3WxuZWl8t4HRAuFWN10h/1qA=;
        b=OJK1w1kfj6ZT/c8pmUQgUMX2Q93wUv94Bm0pKloZ6krZR5m1jb7hnjh6y0WRZJCl/g
         SO/piwXIW0Z1VpWvh7IfVeBd53LrV9ffdClTZoJUxjdxqk+K2CD7+yz/8cc3LDBbR2Ut
         gGumlQtAHa5MpsdhLAdd1CFzN52Q0c/VB4pJSgjcgZ2OENMTmQ91wZuO4pzOHZ6PsyBH
         FJqwG/74bO2rIwApQ50Z2u9Xs09HxW5ObIUgKgbTxegNlWfQJ3/s6IMvMe4KgA7h1rQI
         R0KsK73BpNGVWM3R+YZM4gNBeQEEFjkEUi2cTr4cp0ycxuQ8qYpAR4vINOluvnb5vjVc
         exkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793010135; x=1793614935;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KHrbmOf2F0FaoGuY9SF3WxuZWl8t4HRAuFWN10h/1qA=;
        b=NJAPWdZnMozkBvxIHyoEHWyr7T7dhe31inGf22EE2f7PG4BZxfrTwuA2mChLCq4arw
         h5iQUPkeliuahYyfCLQCD0pCBDx0JWKxtVMJfWHafZXVYgVCgrOhMkBRY08eyNRtSJYG
         aSXqo6tRwYWBw2lLjGOP/BI/X66/7GjVQsNl+iy56+tHdtSd9kAUlojUrFwIH15vZpk1
         WPbX4rUpyRr3EIJHpbQQGvmgHX/B24lMVvV96z9A4byPgIn9BBZbgB1g02VEpT8XZXbY
         9wlWTccrOMDwryS9BuI2L/ZeYwSo74GRsx730Pzw4ZZkI1cC4bjpXL6XzitrgvDv5oNY
         EB4A==
X-Forwarded-Encrypted: i=1; AKwUvBy4plfUI5iyy28CFFjEzIy09SDdmvlz8a+tU6UqhJ9gBEk/SU73HWPZUXwaL7xdmP7FSZme5hGsWaiP@vger.kernel.org
X-Gm-Message-State: AFq9FYI3e2koKww50NsZIV9pTLbou/Snvj9FLDBexoK/4OJ1dgfxs5qO
	RadqIlQiGkxD4aPwjSBkk/sDjLhF5WOKEiVUNV2zS2r1bCHY4TvYNLTC4buahonSEfikkUccmjk
	zYHmMsFowOCGg+Xq2kgY9cpM84OaUfITEKBlAKsFdfQX8FYp2YqApi2OqrqUCSPhvOpVnxoGlah
	hdWIiPZuQBYSgcZGLVHMa3Lqmmt9Wa+vruqBYAGwo=
X-Gm-Gg: AYBFou24gJRtYTWCEgYj+cfE7oicWAvdcA1hfeZLWRPyz2484ZJoY4uDtTWJFQfpXru
	9JUzQLoCSoYphTf5bfxQEgjeEGrLyb8iaHzURR5qtgFbTPD7YsuHPfpZTXj7lHpzGa8OsuZ4n9j
	4pNNOX5gq16/g6BRBf9AQryuw40JVHvzTylWkgfygy4iH3dHpJmUEQn92j6lv/hHtPd7MHRcZ5S
	tq7IdpbDDqTOBzcyQ==
X-Received: by 2002:a05:6102:148e:b0:7c3:9b0c:a75 with SMTP id ada2fe7eead31-7ce5ccddaf8mr1532827137.12.1793010134563;
        Mon, 26 Oct 2026 03:22:14 -0700 (PDT)
X-Received: by 2002:a05:6102:148e:b0:7c3:9b0c:a75 with SMTP id
 ada2fe7eead31-7ce5ccddaf8mr1532813137.12.1793010134104; Mon, 26 Oct 2026
 03:22:14 -0700 (PDT)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261024-kaanapali-camss-v22-0-7da3ea49c8a1@oss.qualcomm.com>
 <20261024-kaanapali-camss-v22-9-7da3ea49c8a1@oss.qualcomm.com> <CAFEp6-2a9-P=eN-A3h_aWY=pbScKnwwn6me59S0oJipD4gLcmw@mail.gmail.com>
In-Reply-To: <CAFEp6-2a9-P=eN-A3h_aWY=pbScKnwwn6me59S0oJipD4gLcmw@mail.gmail.com>
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 18:22:02 +0800
X-Gm-Features: AclHuK_xlm6aQdEz-Css4rzUDVJF4QbmrIMsutgXwCB88U0Xqwpq1be9I71U3vE
Message-ID: <CACbMrhrJTacHvdJ7eext9ucxwo4=XEDnnxxtL+DSpYzw+ozKxQ@mail.gmail.com>
Subject: Re: [PATCH v22 09/14] media: qcom: camss: vfe: Add support for VFE 1080
To: Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: "Bryan O'Donoghue" <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, linux-phy@lists.infradead.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        jeyaprakash.soundrapandian@oss.qualcomm.com,
        Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>,
        Atiya Kailany <atiya.kailany@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: xMugyt2HAbjOMU_MDC4-MlRJWq7Fb5_1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA0MSBTYWx0ZWRfX+DGf8X7uhQYP
 BEOsTolz6xF5BFSvoZNTOfOrQkVgwZUTVg1ZeplB7kNRE4zHb0asysnFpeaFBc0SQzElQmnwTTg
 1+wfUGuAFwN+lLvFOwQWj+j/MTJMylIol1zfMv3kbNVhYI5eAZTgzIYW9Xnay5eWmrN10A8UPhQ
 2s1QPcnaRtk+k/QebmGuu4Sz9crzsjlyYZgYk5z0yfR9Vni03u0DrRgJxnQwnOEgpahhPppJs4i
 0Uk/mnrQwGU4k11ypOyBikBApYgKGKvmTDNrOl1J1yjPipYblrJfoPBm+X6l7E5WkAxWYVrP4fx
 +fOg8pFeqCRQk69p2zjLC/z3IcGgtC6lkF7MQ4cdZj6sC3WqvaSIkADjbNm/7duK4rQizTeRxPH
 4FUkahYTMommrRCNeX2O+Ge4mMIKLmJ6vTMOEZOsc6zujilSoepxUZLlvXF5PslJ5pDAON2UX50
 rny+lDUuhVMSLvkvAVQ==
X-Proofpoint-ORIG-GUID: xMugyt2HAbjOMU_MDC4-MlRJWq7Fb5_1
X-Authority-Analysis: v=2.4 cv=K823jCWI c=1 sm=1 tr=0 ts=6adf29d7 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8 a=q1ahQF__i1vN_A3V8cEA:9
 a=QEXdDO2ut3YA:10 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA0MSBTYWx0ZWRfX0CJtAul3pKe5
 e+IrGkR71q595fdRHnRMah33vPfq4h5SqAt+eXMYK6WjeI7PLcOgTlrl/mu+p5fxRymR0w4Z1KN
 aAEXnCv0idxc3+t9DnzvUWDfsNPnpJ0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 spamscore=0 clxscore=1015 impostorscore=0
 lowpriorityscore=0 malwarescore=0 suspectscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610260041

On 10/26/2026 6:00 PM, Loic Poulain wrote:
> On Sun, Oct 25, 2026 at 4:17=E2=80=AFAM Hangxiang Ma
> <hangxiang.ma@oss.qualcomm.com> wrote:
>>
>> Add support for the VFE (Video Front End) 1080 found on Kaanapali SoC.
>>
[...]
>> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/p=
latform/qcom/camss/camss.c
>> index 7acace363fc2..beca4b827b32 100644
>> --- a/drivers/media/platform/qcom/camss/camss.c
>> +++ b/drivers/media/platform/qcom/camss/camss.c
>> @@ -156,6 +156,152 @@ static const struct camss_subdev_resources csid_re=
s_kaanapali[] =3D {
>>          }
>>   };
>>
>> +/* In Kaanapali, CAMNOC requires all CPAS_TFEX clocks
>> + * to operate on any TFE Full.
>> + */
>> +static const struct camss_subdev_resources vfe_res_kaanapali[] =3D {
>> +       /* VFE0 - TFE Full */
>> +       {
>> +               .clock =3D { "gcc_axi_hf", "cpas_ahb", "cpas_fast_ahb",
>> +                          "vfe0_fast_ahb", "vfe0",
>> +                          "cpas_vfe0", "cpas_vfe1", "cpas_vfe2",
>> +                          "camnoc_rt_axi", "camnoc_nrt_axi", "qdss_debu=
g_xo" },
>
> Now that we have pm_clk in the main camss_resources structure, it
> would make sense to move common/top-level clocks, such as the AHB
> clocks, to it. That would avoid having to duplicate them across each
> individual sub-block.
>

Thanks for pointing this out. I double-checked it, and this makes
perfect sense. I'll move the common/top-level clocks to pm_clk.

---
Best Regards,
Hangxiang
