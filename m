Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84AF33A4513
	for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 08:13:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791879211; cv=pass; b=lZWnRPkIevYlRoapKjxHBWLNamtWcgsbmIALnv3nI6Qdo/kMUJC++/KwQuCVL4xUNnN+S0Y2ogW5JdSXHBrtVGmYSize7GtNyqvhpa8pUstdWjlA4k7+Oi5jQQGs/xjsJHHgjB9JPkiVWUJppyUxYT5BwoM76PqRO+Qjytb5a6M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791879211; c=relaxed/simple;
	bh=yDVbioxNd4XCv57rDSmGntAP/3NDtR3SNAz7FzfXNc8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=E7DP3xtlN9VpwTQZlnbNdknV0XjhULKGPv2GxxLrgrHgN0+GLAvlv35+ATI33TnAIs3KDvRlnzjSrSHm2Ji79RHHV7BtRj259peaF0RZK58Tq/Jm+k56SHu8YO4yvS1WjhTs/YzA05Ang6Xt/h8FgN1U/hNbTaYZjmEuM+NCmjE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eakeK1RO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OMuRhTGg; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eakeK1RO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OMuRhTGg"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69D21DhM3054914
	for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 08:13:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yDVbioxNd4XCv57rDSmGntAP/3NDtR3SNAz7FzfXNc8=; b=eakeK1ROZyb8KPLG
	3/jfbyy3Bp6xBcbhHboSF8Q8FGAnDq6q03VUlPb0Mu9M57aPARFDHNPncw/aNRl4
	ipDLCW1vAyRi3nHyziZ9A3hflTwYSHPLHFEQUIOYj7aj213wk9EYZQQ9spT7JkvZ
	xo+W0bIiPp5e0pE97AzTrZjOgJCgwhLMaBfRG+5i/Q2rnwg0jUXQ0aAwHFVvWZzL
	LYly6BBvnG0fTjdpmdk4uqGqfxDtW29dxR173HDhZgJIjPqqyUkMh1g9dZLQ6Y3k
	539vfPWP7YF0XFiVn7IhA0qLaFGdRkqRirDyX/LUJX8qvB4qR0m+acC/rrkE/8vM
	VBPFjQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h93aeu7bw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 08:13:28 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93dd3c3badbso605193385a.2
        for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 01:13:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791879208; cv=none;
        d=google.com; s=arc-20260327;
        b=HCUZsWk38onbGtVJaTj0yAYuXNWN07VLsSIkhLbjLeOWrNP3r49BWjrbNU38pQBQ+/
         6HzeD6hqQ/0TJTOuS6jXXD21Mv7/5ywtbm5apn63fZMFmNV6zdWyG4lFEkQbdcYWKRlu
         UfGMYuX7wRurxPC1x09AWwd87oKSo6AG9frTRKvutcYRcE61VzMrg5VKdcLzhS0LwjQc
         V55OhsMLlnR1GEI3fJTSf38fBIJegY3DxquXmI+sJGSL26TkjegwROgVL7IYWVGEGb8u
         Rh58GXLwT6QH2sphtIjAKf28bItrjZTYDTun9dv7hBxex3abxNvhrJfqB3nWXiYq3SsZ
         M9ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=yDVbioxNd4XCv57rDSmGntAP/3NDtR3SNAz7FzfXNc8=;
        fh=XB4wVuHKKbaOAw4Oi+zA2xj3vWHPM1N0c6HkEfJjM7k=;
        b=a4MNX7DoKzw42cmp8pNgiPGL8Fm7YCSIJsfMzR5qSX0Plm0gWwEocJ7sIwdH6WaiMX
         APBuCfs5BdAMYNXYztfMvSVL8CYr0ZP/3rD0uCUt9wt/NHRUkT7taSxctnjmlTZt5sBa
         VnBi6XfUX22u4OuzuajdFNnhalbotYz9RF2KGhu695u5cum5k2GPBvanYUaDmPW+bO9+
         I/jf8eL2FERIJ/HK8b0i4NHUUC/6vrwOXwhkzjuc7iu04vlSBnFOhDK9VQ/I9k87Y6mJ
         uRGh51JXl2k6+GlfpG0XXvN4aJLTHVh4j3EbC2jKpag82VD9+Uqvc3gWEorLzUkjb/+1
         5RNQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791879208; x=1792484008; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=yDVbioxNd4XCv57rDSmGntAP/3NDtR3SNAz7FzfXNc8=;
        b=OMuRhTGgkvOVaH9NnHyxYbcToGntFkQb+CEerxns7UebVeN+1O+DSgjq6odsd4KyJh
         eDNtVvgMXfCSdZ3qex9S1f4MkgRJu5eqAd0yRbuPRkbX2UA6f7hvawI8yFUkCoaqxfck
         xrMvnog5fvq5ZDzzbWUF60B6yStYDGCgSI2G4GPfSYxVq7V+2Beh4BoIbmmruDAnHuEX
         3JLrpXd4a9gbtEb/lWiHzJUExby3YkaizmQGU5hKwxQ95W6xVdS1tcDP8gYwjLoftm5/
         mTomiUaaXiM7cF4Oi2gte63NnjBk+ME0LJ20HQSgAdb06FJIbKBgul95bWWCcHTLMg4B
         8CFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791879208; x=1792484008;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yDVbioxNd4XCv57rDSmGntAP/3NDtR3SNAz7FzfXNc8=;
        b=mdS3hA++uJys2F0J66e8GOGhtWOCARqFgPtCi5DSWC3pbeH6V+eh30c/fw+Ntr3VT9
         jzK6vZnlaxLo7WMPs8b/MJCHpwzVGbrG5TPsSAWSZJNiDKXwMIeRvRI4s3Mmt8oTd7kC
         7WcigUCgzOVAp/BGkjbZUHQ6n56X2AWKvb1m9ovh50fzAdaQPtts5zZc9ZuAW5fJAyJy
         FDxq4HQDKaK3GUYAm0iPz1vl0CNlwXr2H/aGe/NbYQyqHzQb0aFtLY3wJiUUOW0b/OrY
         aVwULLbXgYUEv5MY2GDOedf0xexM43aVkFKgBLjhomaK9mKCmyJtYEkSxLUHcnjVQ3u6
         6NNg==
X-Forwarded-Encrypted: i=1; AKwUvByxFKV6hMYprDuLy8MHTXXljhK4f3IZzm/RV4/0nTjckPIV8R5NxgDN/cqB5jEhDDeJJNNXLbjYKdby@vger.kernel.org
X-Gm-Message-State: AFq9FYKG4eoD0ATphz7U5iVdCmgO5O0iEBJo2OFsBqtRxt0zAXUWhD5N
	TtMedy25Krl7tuEZ4gVnaxNcXPuMd79EwzMI5BXTSVnXKPx+Tcc18zOFrpNtrOi5iiENR1/o9CN
	Ur8EfgXmMnfymlZwGrOHqBiIWhGd9fI1h96XSQ8Gp2wyHIhOTHfoWxHJZqHalX5/hb7P9kY7bp9
	y4MG7zYjBC0L1fpeqLgB9JBoq0WPH/OvrmO+p2DGw=
X-Gm-Gg: AYBFou1myfWIWp06P0v8TBQmxwEzLX/DYxAZgkQmyq9TDE7+bG6ObH3+qi8xt5zx2jt
	Oz2H/hxyTM0qeHd2xoQCD//muzgPDZKN7tHQTuTQUC1fZMV1mDVOj0ZmIPOtWtk6gj55Vfpv+Km
	9ughYWExUM5EtSk90Y1cZTI8guBKWU+7INLCH0dAfn+6AWuHAFfmk4gOdvC6aMAmZhDY3Ox3QBa
	yuyhd85Zh5pj9txT47OQ0cpGwaAhAsqiOwXyQlWUGfKG/pUHPa0Pz4QA5iCHh0CB1+F4ppe/Mqi
X-Received: by 2002:a05:620a:1981:b0:93c:b420:c2a1 with SMTP id af79cd13be357-93ebd26256emr2008879885a.65.1791879207643;
        Tue, 13 Oct 2026 01:13:27 -0700 (PDT)
X-Received: by 2002:a05:620a:1981:b0:93c:b420:c2a1 with SMTP id
 af79cd13be357-93ebd26256emr2008876785a.65.1791879207179; Tue, 13 Oct 2026
 01:13:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <0303224f-4c2c-46ec-9866-5ea1fd0fb4a3@oss.qualcomm.com>
 <20260825092715.5794-1-wei.deng@oss.qualcomm.com> <isbrpaztfrgwfcleujrn4w26cshbi2mgn57tbh5bubvsegn6lc@jh3ab6htvd24>
 <83b67ab2-ab68-427a-94aa-881454f457ba@oss.qualcomm.com>
In-Reply-To: <83b67ab2-ab68-427a-94aa-881454f457ba@oss.qualcomm.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Tue, 13 Oct 2026 10:13:15 +0200
X-Gm-Features: AclHuK8FF1WzYIEKdmFAQIHjYBcgky7I2UfsPLuRu1T02zadG_wSv2Q4BrBkFes
Message-ID: <CAFEp6-2KDxDrfTZLN7KPRg=aavj8nqQr7ftna23n9C1Cpbwwbg@mail.gmail.com>
Subject: Re: [PATCH 2/2] arm64: dts: qcom: monaco-evk: Describe the PCIe M.2
 Key E connector
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Manivannan Sadhasivam <mani@kernel.org>,
        Wei Deng <wei.deng@oss.qualcomm.com>, andersson@kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, linux-bluetooth@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, quic_chezhou@quicinc.com,
        cheng.jiang@oss.qualcomm.com, shuai.zhang@oss.qualcomm.com,
        jinwang.li@oss.qualcomm.com, xiuzhuo.shang@oss.qualcomm.com,
        mengshi.wu@oss.qualcomm.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: iB_xXLe2puh0rR8SfgpSPnV4eiff9AAF
X-Authority-Analysis: v=2.4 cv=JJuuIMKb c=1 sm=1 tr=0 ts=6acde828 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yx91gb_oNiZeI1HMLzn7:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=BlC6lpywZLIZl5_qNqMA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDAzMiBTYWx0ZWRfX1vb7ZEfDb174
 aNOngHS4+rLSOpdmfy/rEzT48PgQKUZB9TGJa6HD2RnTG8I9tqVVrTmJQdoe6+pjIQY4oiEXiuz
 seea+L2tRWnOGJCrcpWaM8wlV60X3KM=
X-Proofpoint-ORIG-GUID: iB_xXLe2puh0rR8SfgpSPnV4eiff9AAF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDAzMiBTYWx0ZWRfX1H+h6XmSfk6j
 iJYzoB0SyjEdlCA5xDbsIoQws4aZBwFaBynLkcK4da0T3jGEwltJkLabjswfK/9ayxCy5+5F38r
 J7boq8YyscTJ9bxVxRDW3i+CAej6PZuxCBtagpDWC54P0FlfoRkcZWjmei966Cbhb7Dz/5wlQw8
 I6PeRxC2bbsX+5T5a4WtwyNI4+OQUuG/MAttYVi7t+iZBC5HxYx4z/lzNM7y+LaDk9G+4UG3CoU
 C2Yl/43O9WJ+QL8FGbful5iXKB5JTt5IEDvP3y0W4kHoluG0r/ClpQ7o7UvO59poSSAxk8Jd4hY
 zJBw/WxrU1YCi5dax98yVQYdsesbFZZIOyvvOyNUIqjLluoh+8xjCeFRpQV0YX7YZD+XNY/m1Uu
 e6oO2Ousb31rRmVfXLKeMxjyOTSjHSC7NAuVijlXQQAmgB9RajNGiUyPeDgLaYnMSclgK3uqDoP
 eOtcYKsCwelME1bLepQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 malwarescore=0 lowpriorityscore=0
 impostorscore=0 adultscore=0 phishscore=0 priorityscore=1501 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610130032

Hi Folks,

On Mon, Sep 21, 2026 at 2:38=E2=80=AFPM Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> On 9/2/26 3:48 PM, Manivannan Sadhasivam wrote:
> > On Tue, Aug 25, 2026 at 02:57:15PM +0530, Wei Deng wrote:
> >> Hi Konrad,
> >>
> >> On Wed, 19 Aug 2026 16:24:35 +0200, Konrad Dybcio wrote:
> >>> On 8/19/26 4:13 PM, Wei Deng wrote:
> >>>> On Wed, 29 Jul 2026 08:06:54 +0530, Wei Deng wrote:
> >>>>> Fair point. I will move the port/endpoint anchors to monaco.dtsi in=
 v2.
> >>>>
> >>>> After testing v2 on qcs8300-ride-sx, BT init broke. qcs8300-ride-sx =
has a
> >>>> soldered WCN6855 and no M.2 Key E connector, but the pending series =
[1]
> >>>> uses of_graph_is_present() to detect whether an M.2 connector is pre=
sent.
> >>>> Since of_graph_is_present() only checks for a 'port' child node, the=
 empty
> >>>> anchors in monaco.dtsi caused hci_qca to incorrectly enter the M.2 p=
wrseq
> >>>> path on all monaco boards.
> >>>>
> >>>> v3 moves the port/endpoint nodes back to monaco-evk.dts. Please revi=
ew.
> >>>>
> >>>> [1] https://lore.kernel.org/all/20260720-monza-wireless-v5-1-69ec674=
3543c@oss.qualcomm.com/
> >>>
> >>> The series should test of_graph_get_remote_endpoint() instead
> >>>
> >>> Konrad
> >>
> >> Hi Konrad,
> >>
> >> Tested: replacing of_graph_is_present() with of_graph_get_remote_endpo=
int()
> >> in hci_qca.c works correctly. The M.2 pwrseq path is only entered when=
 a
> >> remote-endpoint is actually populated, so boards like qcs8300-ride (so=
ldered
> >> WCN6855, no M.2 connector) are no longer affected.
> >>
> >> Hi Mani, Loic,
> >>
> >> We are adding M.2 Key E connector support for monaco-evk [2]. Konrad
> >> suggested moving the port/endpoint anchor nodes to the SoC DTSI
> >> (monaco.dtsi) for clean DTS layering, so that board files only need to
> >> fill in remote-endpoint for boards that actually have an M.2 connector=
.
> >>
> >
> > This means, the dummy port/endpoint node will always be present even wh=
en the
> > M.2 connector is not used. I don't see a compelling reason to do so.
>
> I don't really see a compelling reason to defer re-defining them to each
> device DT either..

Adding an empty port/endpoint at the SoC level is problematic for
uart, port is not always expected, this depends if the uart is exposed
through a connector or to an onboard device. So we may end with an
unconnected endpoint but still have a bluetooth subnode, which can be
a bit confusing... Also why adding a port/endpoint only for a specific
uart in the dts, and not for the others? This is a board/SoC level
choice to use a specific uart for M2 or not.

Regards,
Loic
