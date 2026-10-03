Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52380281532
	for <devicetree@vger.kernel.org>; Sat,  3 Oct 2026 05:33:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791005581; cv=pass; b=bP0LgNpZJFfm93aGjI9OopJHnICTdhB3rsgDTLi5TWBwLEHkkv101b3/4+gKIbqdHqX5/BNYSqrWHRjwB0GBAyfsIoGtnTl4mF2WLSpIV0YqLFGnK2yvXh90L3UiRSEPLXnibm4TYspk8+NPierOmTN0GtY5vtrTp7hF0hIhCI8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791005581; c=relaxed/simple;
	bh=2w0phctrVZyUpiB4uhMp9PMl9UmO5DGHbQ59X60tavg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nr50oAu5DSOBFA6bcUOyeIarLp1dHJUJIYO63v+XkKcqK8A28X1pztk15Onv+xtbhnN9vZUo3dOWQZHwLmTlZpbNR9kqlMbGxtEuLlDhcTlwjODB+Iz1fQXCSwx3hBXfFekDKDRH5TdaSjlLGzIOBP4A5ics9cc3wzPVWMU+s54=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FptrvLkj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jjXvvfJS; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FptrvLkj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jjXvvfJS"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6934dgOO2111126
	for <devicetree@vger.kernel.org>; Sat, 3 Oct 2026 05:32:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WBfJlNyloqVAJ23jqA1Jjpi5P6Sh0h3sH7H/cf0PtU0=; b=FptrvLkjMDFtu7nG
	83MqdEm0DUeUMT2TwQ/jl9k1k/+CEw8Vku2tf7cRg4xpP0KARt2puUKOAfTBxjLD
	kmwNo9vDpR05R3U3vJjrQ7AGSH8upUKGLyTpqP8/WNi9oEAQJkdth6I+XRJZt22O
	zI7hFW5SRc8VW6Wche0FSkcfB6CXZkjoYxiJefo2HxZEK/0IGlFMW1aiNguwpNA3
	7dr3VI9ltm4qLG1L41PyBlOzUZ40F+LQpWaDS2yPwIL6S0G4k+r4f3SshDu+DzZz
	DjwNAElNdBEDPrMTQuNBqrSQKUcJ73JXqfO25DUPKm0IRP38k7hEv32IDspHEjpX
	6QDXsw==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h2tver2cm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 03 Oct 2026 05:32:59 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-7bf586522d4so178707137.1
        for <devicetree@vger.kernel.org>; Fri, 02 Oct 2026 22:32:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791005578; cv=none;
        d=google.com; s=arc-20260327;
        b=ZixsU4I/cmO9Ovp7yRPjMmQpsLJdJsJG3jZ0mUjyiDfkOVi+U7c9WCmIIq6A6e+NMR
         ZmjjUVppqb0HvA98/TR6Ki2aOOMpmohWzgUj4ObOtZTq4xVLzNp4RHo4HIPTBbn19LKq
         tCVu7quYEYpWS+EBtMsZG6PwGiOVKKuxn7CeCM2bpoZYg8QG+F4Z/m9Vfc781tyMZe79
         4A3brg8IE/yJsepPM3k6QcNcCJge7Lucj5pNpNRF2QQerP0Gd079FJCqaVYyFF6FtVtR
         1GzJlNTK881RB4yScQfn7G5uds9kxO/SW+qRNDyr6KEB2Z7dbLcs85gEmIOK9Po7nWGB
         0JTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=WBfJlNyloqVAJ23jqA1Jjpi5P6Sh0h3sH7H/cf0PtU0=;
        fh=xhEQTrH41kaeIydiqN0+ujlENhrlEtZv6iiGYePsm84=;
        b=ppOGEB+ab+SXuhgBguZ+FfHjuScWgZg4M7z4QBscl92Nt6qlG+TDyeLVxrlnzME/8o
         zEiJQC1eWyeFFMBNpFshJE2YYEe/dH4BpBw5d2wAFHaPdUX68QARDgXmnPc1l2cZYgtI
         LrIPptRzWjQb806B53aogdKc5dOcNxrkqIxrpoBaBXVku7CqDRNUw7pNaWnBGpyG7N6m
         lla5DMWOM6qONtdGMw9la3exVm7uEeZfc1wDRmzKlgDzx7G/SWqRcQqSYYDXpEdzEmAL
         ZVpcgdZZ5vOKTwyZ807RRbguMNu19B4Z7GiMu+Od3rok6ZQ4koe5/PW9EcCBcmVC8Lb9
         SFdQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791005578; x=1791610378; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WBfJlNyloqVAJ23jqA1Jjpi5P6Sh0h3sH7H/cf0PtU0=;
        b=jjXvvfJSMGJY7KcqGmB0DVxmS0XFnamFQkMs8f8rZxzxjoMViw/G+hp+rv0bTJQOUp
         1g0bilkaJeY9fc4z18NiWdzj8xb4Fe2ucpWc7VLnMrekSJmIGElj9QZGUVXcBYqOhjbN
         cTL7aWEJnILQciy+3f9UDQ8jWfQHZDHVCA/Xre7GH0iF+p4SPkXIgr+hqLTItp8NC5Jq
         VdtQtDbScrd6WMy5KxCDSXXlGsSyT74vCAJeMHH16YCJJiR27aTdEoO9Eam3YLnDDdQe
         6KHLE2rPPszV8hHwt6NrIegT1jFnsM4jaE21TeWRKlzSXCP74iUMD85AItcQXQz1BY4c
         zJyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791005578; x=1791610378;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WBfJlNyloqVAJ23jqA1Jjpi5P6Sh0h3sH7H/cf0PtU0=;
        b=0qETACM4BRQ9egbUytxuhTJVDhw1utsVH1wBPQLNloSy6FZ1ryJ1ukahNYgeXBfMhr
         gXsghFZUrZv9FIIdMj/WWSbNhX5K2uwz7Vef2YjHvNh8ns3kXTclGSypa0xDJlAF24vF
         UlQOOOWZ5hHX4x8nQoc55hOiQvrkBfuzq2vTHbnnvpEfFMiG6gzmX/HY+5sOvvWwLWNm
         Rdns/a2BSRqo5xBlU5Ggv14AGPjgodb62clkaAt2KsifBzicqklUxsltwAOjPhxjNxOZ
         qGSMHfKTfhXgirZx0yX05glD46Rqv+sp7yaZS+NGNQlBbHUyYqbY/12Ugk7Tsno1m9Mu
         BOwQ==
X-Forwarded-Encrypted: i=1; AKwUvBx7LV5Zi8St3s0/+sIWGhIPDZek+AtU1sG2rrTlFSLitAZMpJgFRBLqtUsCcIHxKFkHAc0UyGjhXwDx@vger.kernel.org
X-Gm-Message-State: AFq9FYKQ6eF0XUaW43wE25UuzoKa6vZaPMpAweCGY0/G1vOLIL4BN0Lu
	HpOOLNL5jzxpWsf06qbXNJrT3h+IkrQlmnfct4hW+I0mg0xwlGbt61HPhhEnCop4aBE45sxwHHs
	oGICS1SR4sH+GSKByL9ZckB15AzMoFR+bWyX1DmGlUMSZSMdc1V+hmNgaCYYaDyNffQFxeEe/V8
	Z8XD7jvmet0gyraz5wLylUrwMMjcZ3gSNb2jU4VhY=
X-Gm-Gg: AYBFou3aUFSqx2ahbr9boY+KtTTWKD38y77G1+Y0sFnicjql975XArM0V5EQeeBM6oU
	gI3O6yyjeGrOPXF+eySdMjJOWzVcC0D6QQmJEuugKgP94hspZqmOT/MSFcUH2878ePFqJQ//r3n
	0H+3VK4bREQttc5FL0yYwGIgu1Jw1nhIYm9QEeMMa/wnuz1aS71E/tOgNDucjUo5EHrfKxCIvY8
	xiPWraOz2UJrtHmaA==
X-Received: by 2002:a05:6102:5494:b0:7b2:f3ff:6b34 with SMTP id ada2fe7eead31-7c2427e43cdmr428028137.1.1791005578058;
        Fri, 02 Oct 2026 22:32:58 -0700 (PDT)
X-Received: by 2002:a05:6102:5494:b0:7b2:f3ff:6b34 with SMTP id
 ada2fe7eead31-7c2427e43cdmr428021137.1.1791005577532; Fri, 02 Oct 2026
 22:32:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260928-kaanapali-camss-v17-0-dcf3fd37f76c@oss.qualcomm.com>
 <20260928-kaanapali-camss-v17-6-dcf3fd37f76c@oss.qualcomm.com> <20260929061724.7E52C1F00893@smtp.kernel.org>
In-Reply-To: <20260929061724.7E52C1F00893@smtp.kernel.org>
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Date: Sat, 3 Oct 2026 13:32:46 +0800
X-Gm-Features: AclHuK9aBleyJ22M62RSQUnz4PnDmFE-WZpjV34zP8HiyBjyBg5R_gBameCGqVk
Message-ID: <CACbMrhpeuzE+RgXwjfuBz24WE2Q7yCsxMWBjthy4RCtH0snkgQ@mail.gmail.com>
Subject: Re: [PATCH v17 06/11] media: qcom: camss: csid: Add support for CSID Gen4
To: sashiko-reviews@lists.linux.dev
Cc: neil.armstrong@linaro.org, vkoul@kernel.org, devicetree@vger.kernel.org,
        linux-phy@lists.infradead.org, media-ci@linuxtv.org, robh@kernel.org,
        olteanv@gmail.com, conor+dt@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: tNR5SmjP5Z9NwzhnQRN9zeQiOobUA-mo
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAzMDAyMSBTYWx0ZWRfX+rNnQ/QZBbPS
 qWei8DV03K+agQYDr4b0ofOS2mgkcFq/GzDgJd595hnhohQoCFlMXTq6v3hQ6TKS0JJMjTIS9xl
 ggNaRJuE/kM3XlOjciMPV6bq06flk6k=
X-Authority-Analysis: v=2.4 cv=YoGa1IYX c=1 sm=1 tr=0 ts=6ac0938b cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=DJpcGTmdVt4CTyJn9g5Z:22 a=c92rfblmAAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8
 a=CaMBOwoDLpX39Z_i5uIA:9 a=QEXdDO2ut3YA:10 a=ODZdjJIeia2B_SHc_B0f:22
 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAzMDAyMSBTYWx0ZWRfX8Qja3hWqZsHe
 xKlIC3N0vIbiq6YVOA/snYm+pIi17YGKDgZ45qhrOD3VIzsw3o0PImPUAK1FRvgpDUWlale/sSb
 KkMNwL2aiZBxh7sTv63HE8d/mMPHwmhWumtqykJxB0YRs6QykwbSD73Ku+1LVJloAjTa4zzPKRv
 P288ptHV1aNlcfnsO+El6CMkSxK9oo7CSD41CB7QJMOy/om3x6Tvl6zDGkI48vq3U0oeacFycGJ
 kypqad22+NtEXo8/HWBWuSvGQcCIxH7EWy2mYfsCkCD5nGgDpyROyAGeXxVjrvhYgwFsNEiSGNV
 f78Inuci9vI85bhtQ4y6mqt8dBKKCiJyQen12t5FP6nSoQsgo0uAR3WZ63C+hqf6bapCiZyfXGx
 Wg8zlgXa5JHlfjoY276/JJ3iaAX7bkYWFFaQlNFHmP2eNVxz6+gruRxhpA89SMvGe8hERmcDNF0
 lwe3dUVZPToUYIh9HHg==
X-Proofpoint-GUID: tNR5SmjP5Z9NwzhnQRN9zeQiOobUA-mo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-02_07,2026-10-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0
 phishscore=0 suspectscore=0 clxscore=1015 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610030021

On 9/29/2026 2:17 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issu=
e(s) to consider:
> - [High] media: qcom/camss: data race on csid->aup_update and rup_update
> - [Medium] media: qcom/camss: integer underflow in __csid_configure_rx
> --
>
> commit 611abdeb4b5da574ae292d1ff736d0d71f2f4ed2
> Author: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
>
> media: qcom: camss: csid: Add support for CSID Gen4
>
> Add support for the CSID Gen4 hardware found on Kaanapali SoC.
>
> Introduce Gen4 resource descriptions and implement the hardware-specific
> register programming, reset sequence, and BUF_DONE interrupt handling.
>
> Gen4 splits RUP and AUP updates into separate registers and uses a SET
> register to commit the updates. Update the CSID interface to support
> both this scheme and the legacy combined reg_update mechanism.
>
>> diff --git a/drivers/media/platform/qcom/camss/camss-csid-gen4.c b/drive=
rs/media/platform/qcom/camss/camss-csid-gen4.c
>> new file mode 100644
>> index 0000000000000..4ff2f41f70f7e
>> --- /dev/null
>> +++ b/drivers/media/platform/qcom/camss/camss-csid-gen4.c
> [ ... ]
>> +static void __csid_aup_rup_clear(struct csid_device *csid, int port_id)
>> +{
>> + /* Hardware clears the registers upon consuming the settings */
>> + csid->aup_update &=3D ~CSID_RUP_AUP_RDI(port_id);
>> + csid->rup_update &=3D ~CSID_RUP_AUP_RDI(port_id);
>> +}
>> +
>> +static void __csid_aup_update(struct csid_device *csid, int port_id)
>> +{
>> + csid->aup_update |=3D CSID_RUP_AUP_RDI(port_id);
>> + writel(csid->aup_update, csid->base + CSID_AUP_CMD);
>> +
>> + __csid_aup_rup_trigger(csid);
>> +}
>> +
>> +static void __csid_reg_update(struct csid_device *csid, int port_id)
>> +{
>> + csid->rup_update |=3D CSID_RUP_AUP_RDI(port_id);
>> + writel(csid->rup_update, csid->base + CSID_RUP_CMD);
>> +
>> + __csid_aup_rup_trigger(csid);
>> +}
>
> [Severity: High]
> Does this introduce a data race on csid->aup_update and csid->rup_update?
>
> If a stream is configured in process context via csid_set_stream(),
> __csid_aup_update() and __csid_reg_update() modify the shared state with
> non-atomic bitwise operations (|=3D).
>
> If an interrupt (such as RUP_DONE) fires concurrently for an already runn=
ing
> stream, csid_isr() will execute and call __csid_aup_rup_clear(), which mo=
difies
> the same variables using non-atomic bitwise clear operations (&=3D ~).
>
> Because these bitwise operations lack locking, could the interrupt's
> modifications be lost, causing the hardware to receive an invalid AUP/RUP
> command mask? This might lead to broken streaming when dynamically config=
uring
> multiple virtual channels.
>
Additional reply for this. As this relates to CAMSS arch so that a
separate series will take care this. Kaanapali series will continue
focusing on the platform enabling. Thanks.

Best Regards,
Hangxiang


On Tue, Sep 29, 2026 at 2:17=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 2 potential issu=
e(s) to consider:
> - [High] media: qcom/camss: data race on csid->aup_update and rup_update
> - [Medium] media: qcom/camss: integer underflow in __csid_configure_rx
> --
>
> commit 611abdeb4b5da574ae292d1ff736d0d71f2f4ed2
> Author: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
>
> media: qcom: camss: csid: Add support for CSID Gen4
>
> Add support for the CSID Gen4 hardware found on Kaanapali SoC.
>
> Introduce Gen4 resource descriptions and implement the hardware-specific
> register programming, reset sequence, and BUF_DONE interrupt handling.
>
> Gen4 splits RUP and AUP updates into separate registers and uses a SET
> register to commit the updates. Update the CSID interface to support
> both this scheme and the legacy combined reg_update mechanism.
>
> > diff --git a/drivers/media/platform/qcom/camss/camss-csid-gen4.c b/driv=
ers/media/platform/qcom/camss/camss-csid-gen4.c
> > new file mode 100644
> > index 0000000000000..4ff2f41f70f7e
> > --- /dev/null
> > +++ b/drivers/media/platform/qcom/camss/camss-csid-gen4.c
> [ ... ]
> > +static void __csid_aup_rup_clear(struct csid_device *csid, int port_id=
)
> > +{
> > +     /* Hardware clears the registers upon consuming the settings */
> > +     csid->aup_update &=3D ~CSID_RUP_AUP_RDI(port_id);
> > +     csid->rup_update &=3D ~CSID_RUP_AUP_RDI(port_id);
> > +}
> > +
> > +static void __csid_aup_update(struct csid_device *csid, int port_id)
> > +{
> > +     csid->aup_update |=3D CSID_RUP_AUP_RDI(port_id);
> > +     writel(csid->aup_update, csid->base + CSID_AUP_CMD);
> > +
> > +     __csid_aup_rup_trigger(csid);
> > +}
> > +
> > +static void __csid_reg_update(struct csid_device *csid, int port_id)
> > +{
> > +     csid->rup_update |=3D CSID_RUP_AUP_RDI(port_id);
> > +     writel(csid->rup_update, csid->base + CSID_RUP_CMD);
> > +
> > +     __csid_aup_rup_trigger(csid);
> > +}
>
> [Severity: High]
> Does this introduce a data race on csid->aup_update and csid->rup_update?
>
> If a stream is configured in process context via csid_set_stream(),
> __csid_aup_update() and __csid_reg_update() modify the shared state with
> non-atomic bitwise operations (|=3D).
>
> If an interrupt (such as RUP_DONE) fires concurrently for an already runn=
ing
> stream, csid_isr() will execute and call __csid_aup_rup_clear(), which mo=
difies
> the same variables using non-atomic bitwise clear operations (&=3D ~).
>
> Because these bitwise operations lack locking, could the interrupt's
> modifications be lost, causing the hardware to receive an invalid AUP/RUP
> command mask? This might lead to broken streaming when dynamically config=
uring
> multiple virtual channels.
>
> > +
> > +static void __csid_configure_rx(struct csid_device *csid,
> > +                             struct csid_phy_config *phy)
> > +{
> > +     int val;
> > +
> > +     val =3D (phy->lane_cnt - 1) << CSI2_RX_CFG0_NUM_ACTIVE_LANES;
> > +     val |=3D phy->lane_assign << CSI2_RX_CFG0_DL0_INPUT_SEL;
> > +     val |=3D (phy->csiphy_id + CSI2_RX_CFG0_PHY_SEL_BASE_IDX)
> > +            << CSI2_RX_CFG0_PHY_NUM_SEL;
> > +     writel(val, csid->base + CSID_CSI2_RX_CFG0);
>
> [Severity: Medium]
> Can this code underflow if phy->lane_cnt is 0?
>
> If the device tree incorrectly omits the data-lanes property, phy->lane_c=
nt can
> evaluate to 0.
>
> While __csid_configure_rdi_stream() provides a fallback for this scenario=
:
>
>     if (!lane_cnt)
>         lane_cnt =3D 4;
>
> __csid_configure_rx() omits this check. If phy->lane_cnt is 0,
> (phy->lane_cnt - 1) underflows to -1. This would result in writing 0xFFFF=
FFFF
> to CSID_CSI2_RX_CFG0, clobbering all its fields.
>
> Should there be a similar fallback or validation check here to prevent
> hardware misconfiguration?
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260928-kaanapal=
i-camss-v17-0-dcf3fd37f76c@oss.qualcomm.com?part=3D6
