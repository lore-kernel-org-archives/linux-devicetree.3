Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C130351C2F
	for <devicetree@vger.kernel.org>; Thu, 26 Mar 2026 10:09:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774519790; cv=pass; b=PlaXv3pZET0HAx4UV2RVerWwNMEr5yNYiPwNHUBlS6cMCtUjtq8YqZNdfVqjF5oeqIx8ujlbGgoFyPZPZ2pISXX1NcXuYC2pZyrh/FXvD3ovHuiApUDUEg6c9aLsbaWn2ZSgy1+vwNO9a2T1er7QWFY7vNb+i1vNI3xQmhdvnlE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774519790; c=relaxed/simple;
	bh=skgUdY/qJbcGxUR9dQOLB+4Bt5AS05s4FTctmnMSjg4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=D4MnvoBRa0djGuUftg+GmLn8JtaZb+XXLpuBCPVi0HFWv9N/wuUVuIZhsxXwhyf2oqja/hFpAlSkv/ser+oM6punHUGqqYLDf3vxZUwqcboT1ipa2tUdh8pS+EAWivF1yj2meNa2GahK9qjgaUTsnRrgIYvPealouht+QnQCEgM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KgY1giiH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iTxUZcOL; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KgY1giiH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iTxUZcOL"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62QA0UTq4015116
	for <devicetree@vger.kernel.org>; Thu, 26 Mar 2026 10:09:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	skgUdY/qJbcGxUR9dQOLB+4Bt5AS05s4FTctmnMSjg4=; b=KgY1giiHYXJcAZfz
	5W+R0ht2uQIeQGOBCWBu0hvRexTlAnbQ7NHX+rsmHyMPjoXi2VZYqOqp9zW8/qZy
	etutvF5bQ3Mk4lCjakh8s5pENXvAqIgcxLUbVvk5/Oez+3zq/WBije24Fk77TAxv
	HIV0PflWvxr8mYwI0aPaw0vEus08W3Vwee7kOvH0ZkAgTwm1ADU5oys0w7EK/pl1
	dRySGD/zctSw9kx+Kv6FznHDF9fpgMHtgk7feStGZKK91hmEkeko3JqKfHl86Acj
	EGeASrBQ/OpPkxFoDKK35LfQt99n5+e/La7cOJDUAvw5z7zBQoTifzyg4JoSaX3K
	NdRAdQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d4w1q99en-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 26 Mar 2026 10:09:48 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-89cc6879a4bso23821396d6.1
        for <devicetree@vger.kernel.org>; Thu, 26 Mar 2026 03:09:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774519788; cv=none;
        d=google.com; s=arc-20240605;
        b=dkDPRCvXF/VrIqrkypkZodII9d8D8z8Ba/0d3JtP8Uaayt+2LlwRUOdwyukm7Dk348
         FBSRAf6X0l9ZFMY4V7g7+GogpR1H8VZVUnDMcTeWbiFVE//OHNrkAtxUguvm85ACtol+
         hE0z0NhLIbHCgm/C8Icj8Hu/AFBd5/kFUoJCeVV/gxof5UrgtardCLOH4IacU2zzFlNh
         6NdxVDRHE9l8VJ6QHM87g0iZo1BVMbvVaZOChh6bGrWP5HDZAejRQj5JuN6eo2aQMfbU
         CVNiYT5B957X/YealpSKXBfP3TOX1H/r49nYZfnr+oSNhfQFKSDh90omEEC7GZbW/ltM
         Uhrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=skgUdY/qJbcGxUR9dQOLB+4Bt5AS05s4FTctmnMSjg4=;
        fh=cP/rRcIlkTx84S/yX6lCSo2n1YN8n5YyDhOiuUzOpy4=;
        b=KRYSU4GtMU2GK5HUehDZdta/13slmK6/GQF9S03xRpuOU1RPjlq8mJpg+YCpQD5Ios
         0z874M40xjKRLVyS6fcDGBX0r7mtnZ1lffMhLIhyfTOGnX+xE8Y6POKoWfoXnaGnEJ8a
         unIIyWAxnrpDxlOXrTOF6GK7GL+FbVzZwDMgROJZWLDhLAQDHDOaee81eTb2QTqC7pMG
         Sbuyje0uKYTazbXE6QaFZGgqTESicYXA06zvcBSXX/BhuWx7tXZX4hKvFNP3OLXRcChh
         fy7Wit9mwal5ynz+9RtSpEjKKCIDadN7bNPfPyjNQPDzFdNFeWdotU7YWVKwlLC0Df9D
         lYfw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774519788; x=1775124588; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=skgUdY/qJbcGxUR9dQOLB+4Bt5AS05s4FTctmnMSjg4=;
        b=iTxUZcOLhhoOe2VjmdWPrK+gFoj2OKo9P2Spo/WKgnZSLKTcROw0fj4JXB+HfgigjL
         1GDGDq/ZXUH6AI4UE8Lnm/EUeoWW/H8pSqpweAE4GobDtwLSKdwuDR761Y7/8oTptVEp
         cErovzlCORO++Iua/uOHkHsaLKeqhQdASdX+nSspe/zvNRKHO4AaCsBOl0Rs4jq8Ce/O
         Gn+8gbBb9D3A3iTKyrl2n4os8Sr04ie0RHQjto8vjq++PWJ9UFNH/99bM7EKIK4Lwi4m
         BVTqc0MGBk0j7ETVjgFGWnE8C2F4/4kHt5w1cBXry++LbLGZD4BEIe3Fn5NQ/MHT2bwe
         FYnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774519788; x=1775124588;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=skgUdY/qJbcGxUR9dQOLB+4Bt5AS05s4FTctmnMSjg4=;
        b=e76l9RgLaXQOiXHd0euoaHvTVc5zvqGBvK6oAilmK78fjMDWLS4Ezo7kVYmBdEb8e9
         WuHEqcdE6Yw/Wc/EMQXUwo0ht67qEd6jMl9Qy7ySdzqVSuJSt7zon1gDWNmJL/4VpGWd
         1BA9jNZnC2vnHVoI1CbfBSiKFBJnm6qZihmNho9VDoD0IMmFA+FT3LfDZ3PWTWjduds6
         geXEqNExY/H5ZNXXe3ZpU6JYtaZp5MhmCdREKI7zbHKkOiJ89jkbeXyOj1iiGRYRBAec
         qP9vTY7suYxo31hCGZuYOOat2sjYzHySgQrlnsERPoImvuelm8rPnsg5XLlSUHDr5kmD
         GBYA==
X-Forwarded-Encrypted: i=1; AJvYcCX/Uy2jLCMWtPaxpfPi6VZfVSx27MBdql8cfBAvLWFciQb/OYWjcgGvFI9NvbJ8NpWy1ATHigKd+0X2@vger.kernel.org
X-Gm-Message-State: AOJu0YxzsdXsTyQ7DgwGlwWQkT1/lH9AeBAdV4Nvdhxz+xTLMfOePhEx
	VC2ZPRfnwyA+TbfTcs+VnmfvS3gD8MR/GhuRjClSYiIflvo8VH7UKGMStHmHNhyyLnzrVr1+526
	Gn2A8+lJM3RkqV9QUDMTNVhDLDZ3XiBfHsgB990NCbDKvNa9RDb2dEFBy764oQtBeFdyTj71JqQ
	+3fnIdnWPMiiWbPMi+lt+V+jOXG3Z3ifiUUykHBNg=
X-Gm-Gg: ATEYQzzgkGvvXf6W3eDfXnHrRFalfnmxQixCvhhBCNEwe5jQXQk3RUSfrTFZrfJPz5c
	QSmJLqfP119HXmx9MVQ82APG5dCqPtD/olKaPS5MSywEz8FRm9qh2rcmEiMLoWhY3KNGlRl7VPl
	/sYGkAb5Hu1uZYTbs8N03DfpFQwxbw1pZYi9eAMmAOSQQI4vksfUCCtr9mhaNxZc95j9pqIjcfR
	A60+AI=
X-Received: by 2002:a05:6214:d81:b0:89c:866d:243d with SMTP id 6a1803df08f44-89cddf63383mr9218046d6.35.1774519787942;
        Thu, 26 Mar 2026 03:09:47 -0700 (PDT)
X-Received: by 2002:a05:6214:d81:b0:89c:866d:243d with SMTP id
 6a1803df08f44-89cddf63383mr9214636d6.35.1774519781777; Thu, 26 Mar 2026
 03:09:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260318040644.3591478-1-swati.agarwal@oss.qualcomm.com>
 <20260318-neon-vigorous-prawn-dce7f3@quoll> <CAHz4bYvs9mnDwfkfjkebucZSQpugEqr6+sFf1-hgzNO8SodzQA@mail.gmail.com>
 <d44ec842-1763-4f5a-a987-f41a6e624e87@kernel.org>
In-Reply-To: <d44ec842-1763-4f5a-a987-f41a6e624e87@kernel.org>
From: Swati Agarwal <swati.agarwal@oss.qualcomm.com>
Date: Thu, 26 Mar 2026 15:39:30 +0530
X-Gm-Features: AQROBzCKNcMgzC1itNNe9U5zfG-CQ45Lu-HC814-XQT9cIrVkIQQGAkLeXVM0xg
Message-ID: <CAHz4bYuuhHYvmf4ZvaTrba3RAHJ6jMk9h=_DVZ2wwo-5PiaHSA@mail.gmail.com>
Subject: Re: [PATCH v6 0/4] Enable secondary USB controller in host mode
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Icenowy Zheng <uwu@icenowy.me>,
        Matthias Kaehlcke <mka@chromium.org>,
        Mike Looijmans <mike.looijmans@topic.nl>,
        Pin-yen Lin <treapking@chromium.org>,
        Chaoyi Chen <chaoyi.chen@rock-chips.com>,
        =?UTF-8?B?SiAuIE5ldXNjaMOkZmVy?= <j.ne@posteo.net>,
        Jens Glathe <jens.glathe@oldschoolsolutions.biz>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: nw8Bii3xQDzKkxttG7yg-By6D7La5NjQ
X-Authority-Analysis: v=2.4 cv=HvV72kTS c=1 sm=1 tr=0 ts=69c505ec cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_K5XuSEh1TEqbUxoQ0s3:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=OjkoTXuNvuUHmlkjld8A:9 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI2MDA3MCBTYWx0ZWRfX8SQisa6hisJE
 ROd6HXPmpPpH9NlLTQNlHdk4psTJRn4xIMCbeMOgylxiIPP7Q8qnouGebliTW9oMz6+pZnmOgCQ
 t0DzujVywAVV9+BNQJLJFO2VzcVCYonteZlZFj53/kQa3UhUpUjgn7D0DJgaEUKf85ibcHMYDFj
 6L0uYctPEIwaZLK1l5CiLHCcDA830HOB8ziOI27iEuYJNT6mwOmVyGy7Ugv8O81Eh3tSM/vigHg
 CBNYWoyRQ7vH9PUKR5baQnTeoz7OkADZmYiNPraQnuW3lR+3SgW6kdST4bb1b6VfAB2e5Y3BaLk
 br9iiXHecQaZ6M0T7YGN2XcOpVaXg3NDssvZauWpJu2/6hlB/JtdVRxn84EMR5c+eprKlunxZA7
 2LR4dLZGRbTHTaA4M5fsh+j1n7EL0zWni09NLuD6gs4PjTPOIpATEBggNQFwbuTRibLyeDU2pV0
 T76b1PJvJf2ttk7zQmg==
X-Proofpoint-GUID: nw8Bii3xQDzKkxttG7yg-By6D7La5NjQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_02,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 bulkscore=0 phishscore=0
 impostorscore=0 suspectscore=0 priorityscore=1501 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603260070

On Mon, Mar 23, 2026 at 1:12=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On 23/03/2026 08:36, Swati Agarwal wrote:
> > On Wed, Mar 18, 2026 at 12:33=E2=80=AFPM Krzysztof Kozlowski <krzk@kern=
el.org> wrote:
> >>
> >> On Wed, Mar 18, 2026 at 09:36:40AM +0530, Swati Agarwal wrote:
> >>> Enable secondary USB controller in host mode.
> >>>
> >>> This patch depends on:
> >>> https://lore.kernel.org/all/20260306091355.1178333-1-swati.agarwal@os=
s.qualcomm.com/
> >>
> >> Honestly? No. Drivers cannot depend on DTS.
> > Hi Krysztof,
> >
> > Here what i meant by dependency is that I have rebase this patch
> > series over below patch series. Below patch series is related to USB2
>
> And you should not. Drivers cannot be based on DTS branch.
>
> > micro USB controller support on lemans EVK.
> > https://lore.kernel.org/all/20260306091355.1178333-1-swati.agarwal@oss.=
qualcomm.com/
> >
> > There is no dependency of drivers on DT.
Hi Krysztof,
Sure, i will send a separate series for driver and DT.

Regards,
Swati
> >
> >>
> >> Also, combining here USB is a no-go. Do not combine independent
> >> patchsets into one patchset.
> >>
> >> I also do not see how you addressed my comments from previous version.
> >> You never bothered to respond and I do not see them implemented.
> >
> > Apologies if i missed replying any comments.
> > Regarding your comment on v3 series below:- GL3590 hub used in lemans
> > EVK requires only 1.2V and 3.3V supplies for operation, confirmes the
> > same from our internal HW team and update the same in thereafter patch
> > sets.
> > https://lore.kernel.org/all/20251220-economic-gay-firefly-1873a9@quoll/
>
> This does not address the feedback. I did not talk about Lemans EVK. I
> don't even have its datasheet. We speak here about GL3590. I found at
> least three supplies in datasheet. Your binding has only two.
>
> Best regards,
> Krzysztof
