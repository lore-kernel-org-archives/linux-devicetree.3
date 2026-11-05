Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793887277;
	b=bSF8VvpmdeSWz48nA7/xHXU8oj6JwEmJD/YqxAyzag2zpbET62Btn771EynqCLwAfeS6
	 lq9gsOt7HYu/WzBLWgpYa6Tap6jP4fjhctTO6pkz3TC3MvlsUKIcclJeLs5Sr03+SzUYp
	 ZOJmxAZp9X3GZtsprFzxKS4CUzbOvjJwv2h13huSMXzapUD/27yaMz8/tHD2R6PSMSaWD
	 jgWnkDsl/AqH925nNZwl/WlNJk3rsaqmITcq7l4s7xlJF3IfTEgKpQY/B7NmSWHSe+Noh
	 PmbetWZpwW0vJy1DzKTU1lTYF9LwBagy0fR4yiCv6DHKVk65kDAYjhmPP/yjFNoSh5Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793887277;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=TyfoRLOpQ0Pv8FfbhV0tQzNI/xObjFjyJa50AzI8c34=;
	b=3RvI96Eap5powbPcHjfRPzeTpAU6i1Hk4nVcBzUWq0olYHQRruu02JLRWuwgdAqMvK9n
	 0s26NVFYmrlPHimMEd0/1VuDiUv4brV2b0REQkDXXaiHB/0E+VZNMDpRkCYcJFYcdYSgZ
	 LTP3RY9fY5yrpA6EB4GwZGLyy5J967byLGCVdYFFiaObItqfaPWnD5lXRaar0EiDHMfkI
	 ZFHX19WwzZMOaMKGkovF9oFnqzJG2zaTT/uNblaeA5ExSYRTOp2BIaKEjk1CLMy9EFIG2
	 ZUvpfFmfodqOs3jgvF8yonN8AljJyJXU4CRBKzmmX2itpbhFHnEwqfcfkerV7Tr2Aug==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mir4VC+3;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=M0nOVwID;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61D56606A328
	for <devicetree@vger.kernel.org>; Thu,  5 Nov 2026 14:01:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 61D56606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mir4VC+3;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=M0nOVwID
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A59thun3531963
	for <devicetree@vger.kernel.org>; Thu, 5 Nov 2026 14:01:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TyfoRLOpQ0Pv8FfbhV0tQzNI/xObjFjyJa50AzI8c34=; b=mir4VC+3wdUaahp5
	ktja868nO4QtXhxgHuGqpHJGfc4y3qefHLIfA/n+XKk+aIfK8svi645NkkLweAsB
	mhzHivfz1lVQdT0kkdLuxCPr+T8t/fZWMEMXrr/YGpvO3bYwy27SClMuzmhh5uZ+
	VjEOByy1YTh2qYsShbTaiUyZP7Oa0OdEmoCZM4IBdaJZh/YK+amMlhVVEDi4agR3
	kvezPwijaoYnX3c7U6dBTN+t47cyN6mcLf5TZlK30+hjp8xZNkLtcElDfUcWhut8
	bzn3BASnyFr7nUuIyMxcPnt6RuzU5QqeSkATlmQf0mt1sHLRvsZGTY3ntbmku362
	ndrceg==
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hrksq9yg3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 05 Nov 2026 14:01:15 +0000 (GMT)
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-4ea2c058e67so2426444b6e.1
        for <devicetree@vger.kernel.org>; Thu, 05 Nov 2026 06:01:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793887275; cv=none;
        d=google.com; s=arc-20260327;
        b=f8Erd0T4+EYHjIDfOH0r8W+mdHMA/Gw+to2++cNc0WLwN17wlAJDWgzrYz6j/Iu8Fo
         gTKHbJRxeA918cRDIFlXN1LHCdMxd5MI1E/cyVebCmkl95pB4jyf6PAOb6A9hOy4zGMm
         R+4VTdt3JJSOBKRk+LJWGroW4Eo2PCg8BxSSUnTqFsVyC67El6iCv80uCXLwcmAt/Vwv
         iTl8Y1P2xmNdYlOihf8nT5zfcSUKcPEjKBsIIbsnda90PLBlDnkUMUr53IZfPUEvRbNs
         w3a2RUHnnUbRqJ5lKO6ZGeR+AvTD/5S3L3BgBFLBzGKY61VQcnsO7EfxwxUb6kHfDtna
         C2Sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=TyfoRLOpQ0Pv8FfbhV0tQzNI/xObjFjyJa50AzI8c34=;
        fh=Jo1KwYCJzHKDV5NOInHFbtmSOl+/ulZBDSf25a2uHZg=;
        b=mKVDk+B+wivAhv0EFwkbA+3WKkNCBgn5+1i4e/LpOTd8ueefH8AL47JZtcrRd/jT6r
         UxD0ZamzFysRuzJnxBxMY93rtP0TdVchzxn7dUE80rT8yH2hOI2qDeEv3rbwSXDJ4j7v
         3leIWUKPc0SKa8+RqaDgqh/9vdERMif69qwgQKcQnDSFOfMzaeGxFfcsB2uPssiTlu4j
         lOyObtnr6cqflikpuGnaPRJ7GhyLYH0hJFmPtjIVYj3hjZetpb9eFD/1os4vu9oqEiUP
         Oly/7OT6LmNXvc5TRajVSQz48oscY5QXgK+bl98uVaecQYSvqYAAH2F1SjmLpols9aaf
         KpNg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793887275; x=1794492075; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TyfoRLOpQ0Pv8FfbhV0tQzNI/xObjFjyJa50AzI8c34=;
        b=M0nOVwIDG7jODMT+nQkr/TPC8EkB/nasV2CIwBGyY4jSYU5vwmQQhLJesQh4BpO4xn
         ByKd5GG/EKVb9xOrS8QfrTi1s/VkiO4XN0ckZQ5NkwfOUfmiRaV5lGoXq1FQxOBeR4Ch
         Bb4TO6mOVzv2OPHtDmYvXph0ua2eL0MudhdyP/iQl8aosWa3GRaaaIzo91LWlWTiRiSJ
         q7kaOLacFA34DHBBeGuoDcWcQ1UOWYH0rOoxD+rOZtM5fB8troYwp0qN4u5MPIk1X6qU
         E5XkkMgIxZNj6alGq7HdlfWVL0q7riFSimK14x7XQt0CvMsCWPBaIAjFiZwD1EbZLSAZ
         TvIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793887275; x=1794492075;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TyfoRLOpQ0Pv8FfbhV0tQzNI/xObjFjyJa50AzI8c34=;
        b=eIWLxN74Ft51VkeA4jkW47XZxYPVLklFbRKJoJFi1a2ciGQJYR7eolTwYSUzO/NnUw
         f4KO+3BVodztr0jaL6BNIqVuiM+O3z42hXf98Tr9lvo09WFu/n+ySQhKk5qsyCm1kby+
         aEmHVXftITmsyXvel6Dqc5THVWYupnws+zY8Qzz2PMAIJN05Nuv8e3HrzGJUWEshmymq
         EtRpHFYqSH9D/wdGR+3bzQoqUHPCZGZzKE5y6yXNQL9sQOgohoQe6gEtSQ6aDrE4nrnB
         BJ6BMUQtFaQ4YiF3W0ioFza/ag9BOyTsikGK9kfoeYY1khdhp9c/kE91LSTRuV6XnoAL
         MHrA==
X-Forwarded-Encrypted: i=1; AKwUvBxdkYrYlvjUVsQps3B8aEMhWmJ4FN77mpy5uHuwVY72UZpgcefqPq1iYLodL+XeI31LqEfZMn4l0o0h@vger.kernel.org
X-Gm-Message-State: APuU4Z+2vKiIKK9UDnJs8shvxgC7YhafLn5/zpByjnarGv+Zu4jo1b7x
	jC6mF5TObHVJYZMEIrQa5de2t1arFdN9+nWHDFGxNjNAOSFW1mZM5bwLIiVHNNupLiruE/9aHoY
	5GqS9Y5/wmqsZv+urEAl0SAmmZ4VdMLf21XfKyl5HTxGoV2m0DDt9SCYzLIz8KLz3bbW9OlGu/I
	52x8JBcjZK6l1g4k82rriw8XSScOQ9+lXEYkRFkSQ=
X-Gm-Gg: AYBFou3OwO9hR4R6IEzGcSuiFB+JoaZbIAApqr1T4wo1kr9OHA2f9z3ngumuYG3BkLN
	UySHi6c/DxdZBHSBHwoyoMEq4v2JJ4ZndDQM4gz9zGqh7d7buiGWvPSeEGoyv8S8G7f/gDfiDd1
	QuOoFN6VD4Tg+ZS8RHK0Pp3J5slOjGZwT74rg1GWgauZKMIUap17u1wJaKf+DDucSNeMirWMKvM
	3wm1+UHiCBE4tnW/es6v8HFx8B+RAbQ682JkG86NtN114Zrccrhm9rb6o5Q3FqoaKYQrcMWhpI=
X-Received: by 2002:a05:6808:3509:b0:50a:f56d:a6f1 with SMTP id 5614622812f47-5640dc1b211mr13019211b6e.10.1793887275118;
        Thu, 05 Nov 2026 06:01:15 -0800 (PST)
X-Received: by 2002:a05:6808:3509:b0:50a:f56d:a6f1 with SMTP id
 5614622812f47-5640dc1b211mr13019186b6e.10.1793887274640; Thu, 05 Nov 2026
 06:01:14 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261102-glymur_camss-v1-0-fcb619fc7319@oss.qualcomm.com>
 <20261102-glymur_camss-v1-1-fcb619fc7319@oss.qualcomm.com>
 <20261104-real-nebulous-ostrich-017e92@quoll> <72064a9a-1b2e-4c24-99e2-2cc15a8dd7f1@oss.qualcomm.com>
 <a2d3190f-bfd1-4548-aba9-a186cfea878b@kernel.org> <c5af7192-c923-4fbc-bbfc-7f03e310fddb@oss.qualcomm.com>
 <fc9acaf2-f214-434e-bbe1-88e8e1af7683@kernel.org> <539842db-c672-4549-b861-4a6f3be47556@oss.qualcomm.com>
 <d586b7b3-675d-48a8-b0d4-564e571ef69f@kernel.org> <CAFEp6-25QrLAF=-KgGJ-rC9pDpGa2YgoQAMKxU-FoByu2CJpMw@mail.gmail.com>
 <1db9bf48-01d8-44fe-8dd2-7a3c84ecc556@kernel.org> <CAFEp6-1fSPP41cVFmu8=0z2xibDpHuH5Lxrw7W_rvnt+Fw9EpA@mail.gmail.com>
 <62fba00d-831c-44cc-8d3e-083a95abfbe8@kernel.org>
In-Reply-To: <62fba00d-831c-44cc-8d3e-083a95abfbe8@kernel.org>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Thu, 5 Nov 2026 15:01:02 +0100
X-Gm-Features: AclHuK-b0A4Gh4xuvf-RvkEJ0Ayhot6Y1dIQBdbhsTwiCiM18Z5of_94siqhfkU
Message-ID: <CAFEp6-2_opRq3pj6S=2nDFxXBv0waeyGBKSxp3t8OOe6vvKcoQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: media: qcom,glymur-camss: Use CSIPHY
 indices for ports
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
        "Bryan O'Donoghue" <bod@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Suresh Vankadara <svankada@qti.qualcomm.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDA1NSBTYWx0ZWRfX7pUXoaYm/8+T
 VGeKcp9qky7oNhnuyCo/kpKu8dCWSXkCMwxLYcFLiRSClXu3WrhXkkOvKxuRrmg6pwGM89IjpVq
 Z5lZfMvC7mAJ1pDtLCcbWBR2fKGFpVO97i0pvPxCxK5frL+RIlJdtacKI+VKQf+NLXROlIMNJIv
 MJG1Ndj0zhju6gjv787KHTa5biOPyOcpMjm5XU/c5t6O7Zur8M7Ou5Zso7xKM4G+XS0wGPhAhFD
 t05zz0FqiBPJwDKh+AovPwPPtc+QVmSiT4IKoSiEE1IhDSmiYACDwplhWWHXu+tn+MTW65IHXG+
 u5rht7rcdqNRSJ0hJxLfL8WMHa/lH26K+recHjUw33CFxpuY5mNK0LvAzdwCVanImhkTRr/QSj0
 lu1tYXcuF0dn/V66NUk+sopKtMx6CPRwKEKM+6xcS7TXaUxiUtVSR4SRv4L+R0laMJk75IM58FU
 iHGETgFzfMYGTbEWuow==
X-Proofpoint-ORIG-GUID: CY0orC22RTpjmHTfkN4Um1EbAFCEYkRS
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDA1NSBTYWx0ZWRfX0A+chmgO1OAX
 rHAF0v/Qsv0ZWIy4BPlNo7PW0px0QsC+UD4JebZgjG1vfQU5DO/zkTxN1St1A+fu1QgCuLd/VQN
 Vu5DFAirJs2dfR+PX+8WvMz94w3hrVs=
X-Authority-Analysis: v=2.4 cv=CIe/zhrD c=1 sm=1 tr=0 ts=6aec8c2b cx=c_pps
 a=WJcna6AvsNCxL/DJwPP1KA==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yx91gb_oNiZeI1HMLzn7:22 a=VwQbUJbxAAAA:8 a=5UNgDV9Nf9xsrLWpgpcA:9
 a=QEXdDO2ut3YA:10 a=_Y9Zt4tPzoBS9L09Snn2:22
X-Proofpoint-GUID: CY0orC22RTpjmHTfkN4Um1EbAFCEYkRS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_03,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 bulkscore=0 suspectscore=0 adultscore=0
 lowpriorityscore=0 phishscore=0 impostorscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611050055

On Thu, Nov 5, 2026 at 2:21=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.org=
> wrote:
>
> On 05/11/2026 13:04, Loic Poulain wrote:
> > On Thu, Nov 5, 2026 at 11:45=E2=80=AFAM Krzysztof Kozlowski <krzk@kerne=
l.org> wrote:
> >>
> >> On 05/11/2026 10:53, Loic Poulain wrote:
> >>> So some chipsets share the same IP blocks, with some block/phy
> >>> instances disabled. As a result, we need to decide whether we're
> >>> numbering based on active instances or on the actual hardware instanc=
e
> >>> index/offset. If we use active-instance numbering, then yes, it shoul=
d
> >>> be @2 (CSIPHY4 being the third active instance). Alternatively, if th=
e
> >>> port numbering is intended to reflect the hardware instance offset,
> >>> matching the register prop, then @4 would be more appropriate. It als=
o
> >>> has the advantage of directly identifying the underlying hardware
> >>> instance, without requiring any additional driver-side mapping. In an=
y
> >>> case, @3 is incorrect.
> >>>
> >>> That said, since the bindings have already been merged in its current
> >>> form, we'll need to preserve backward compatibility when addressing
> >>> this.
> >>
> >> This is the input port to camss, so how is it called in camss, not the
> >> csi phy?
> >
> > The CSIPHYs are connected to the CAMSS input ports, which can then be
> > multiplexed and routed to different CSIDs. The mux identifies its PHY
> > inputs using the hardware PHY IDs, so the CSIPHY4 is identified as the
> > CAMSS PHY4 input. In this configuration, PHY2 and PHY3 inputs are not
> > connected.
>
> I could not find that information in Glymur HPG, but maybe I looked
> wrong. CSID Wrapper lists CSID 0-2, not 0, 1 and 4, but again maybe I am
> looking at wrong device description/interface...

Yes, there are three CSIDs (CSID0-2) and two CSID_LITEs
(CSID_LITE0-1). These blocks select the PHY source to be routed by
programming their PHY ID (PHY ID =3D PHY index + 1), as defined by the
PHY_NUM_SEL field in CSI2_RX_CFG0.

If the CAMSS port ID matches the PHY index, the port ID can be used
directly as a routing reference, which keeps the implementation
straightforward.

Alternatively, exposing logical port IDs such as { 0, 1, 2 } also
makes sense. In that case, the driver would simply maintain an
internal mapping table, for example mapping DT/logical ports { 0, 1, 2
} to PHY indices { 0, 1, 4 }. As long as we establish and document the
convention, either approach should work fine.

Today, the Glymur bindings define DT ports { 0, 1, 3 } to map to PHY
indices { 0, 1, 4 }. One could argue that this is already an
established convention, as it is documented in the bindings. However,
it is somewhat confusing.

Regards,
Loic
