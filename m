Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792674548;
	b=3Qy+MYdxXO+I+HStevlxpx9AaIBHcWXzKzUP2NdBwZbzA9ke/P2K7EWcnnO5HPQarAdc
	 Sole2NKSBWQU3T2gQPmQu5oE3T5RhII58XYtXmZn6yT+5lIsMN0l8zknpErW3dBbGFlMF
	 CQxAh6U1zeg39U20bON1fRSyB99I8p84UpcITvlaGWMe0UtjTiAd3HEJ73/iBdduPKTKF
	 1dUmXro6Dm0OG5loSbIevVRIkqlP0ecJ4lJjXPwIvA2zVnW1EGCv0Tg5x2c4HokbPH0Ik
	 bh1WlCZioYrwba6Q3E82BoQ5+R/oNZnPGV0/7HIE0f6iuXn5sQY+uopLzeeLegDS8AQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792674548;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=3I3CqMlKS9kzfVvoatBulSB5vPOH1xeLfyRig00xmQ0=;
	b=DtH9Vdh09aCNuieDed9fChnQqsdb94xPAYV4bmeBRhrUmzEgyfHDGtOQ9CPYJiCP859p
	 d+vC3Mh2WZTZfHVmgW7lLIoGQK8OlWngwnqTiu1p4/l7EsNTPRJMVcyO1fwE4Hok4EeZZ
	 x8EbJ4X4DBlNsrx/Svd4uX4uq8DOP647U6eaUrNa0VoLmruOZtgNoLZYCrYA64Lp3INaq
	 F1pksE7YUU23UCkxZWhLsG7G77OXorCn6Ds0SRZou4l8tUDtBVCxwPEPQ5z1yCrGINlTh
	 CVB0n5XZEA5xUlH8d1AHYiDIDpwusn3f9xCvY5FnqeCQp+Y+rbSuM10B8i3ea37O2dA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fFUlxMUB;
	dkim=temperror header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dv3Mmo2v;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E437606A31E
	for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 13:08:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2E437606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fFUlxMUB;
	dkim=temperror header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dv3Mmo2v
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69MA0Em32919021
	for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 13:08:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3I3CqMlKS9kzfVvoatBulSB5vPOH1xeLfyRig00xmQ0=; b=fFUlxMUBQYcJI4dq
	HRjiZRyz+yWr2OWqoFsvQUGKPGs3TrfXtCj9F7nxrzhnHUJhNk00bA7ym+NGXlL5
	xbj26S8xDr3P7oYt/Klf0INzmZ1i5iFvoBOztup/m9Tq3zVEWYZ8Nc/7H7IyQKXx
	0ucCe/lvbD4CGrzQ7kF0c0rUgz0U4nUBE34r8hJMPgoVF/J8nnPQ4O2w3EGqt5NF
	N3YXxYOVhuFKuNRFgNwIBvZwMe/SVZSa76fWzLxXTizOl36SkvY5021Ai2arSRlr
	saakT0vvW6USlsMLajZnqqL21TAvK18Qh5inPb7eOUsYUEeL6Cw5BzbkkgIef4Dj
	+Upw4A==
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf93abj9x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 13:08:57 +0000 (GMT)
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-4a41f46d629so2856724b6e.3
        for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 06:08:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792674536; cv=none;
        d=google.com; s=arc-20260327;
        b=ALjJT1qUfQ3gJtuxqkziaYbymsnDGIVB/SOx/rIDVfT7pqeELB6iMgZuNydfEhI4qk
         8kLmwQkrQpZbrpxmjEZx3TlI7tDbZ+hINJEIMO7fdBH9UxwYbRsNeDyPMvXVG/9hmPyZ
         ah2JwQCLa5oOV1U8WhTuLCjEs/wpSMkkv8aOQqx+OkeVEd2Uw48v7BhEIdmQeKjOdeNq
         9DTgGOY8puBjGFmBoID1eIXmF/qWThZCA4C7Ske0nHOGTdD8e7uG7yGgj+opr5pabL/r
         lBE9uoLbs7/6zhbvlhr31A/TJA4ogfDUaGd7H89U59sHPkNOUTSYND4IC3m41zf23MnP
         dkTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=3I3CqMlKS9kzfVvoatBulSB5vPOH1xeLfyRig00xmQ0=;
        fh=1FU2ylHUn0Bs9BLtaIbfkhMEh1XeZj0lNh1dTy/TQo4=;
        b=o9pxPwo1sTZZfyUrjfpKqMsctsaAt2xUkYc1qUY8T9P+n9Y0nx7Od40PLO2oiGpAHy
         aN+752l8xEtacWAxCKDmq46NLSZWIZOLL83pSzms+30MmlTI+ohclsrFVnGQnxbc2xK7
         c2TbW0NG0aiq01WpdsouIJngp3Cxq1bc3htKHP9edGHrdZGPq3BC+uvcBIQbkIRxGnzE
         Yt1/ELTyQQxlmX3Oi6rQpAG14oufnOn021MY84w+ylS2jaoO2LWPBnvAoxlKiufshk3M
         ayfnOWKM5qv4WIX7UzhCDn61FkpTIToL7Wk/0ybYgW277l5UKg60HCnOu6bJRRDual6U
         9BLg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792674536; x=1793279336; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3I3CqMlKS9kzfVvoatBulSB5vPOH1xeLfyRig00xmQ0=;
        b=dv3Mmo2vK5i/Cp1ZEEkeVIgMJgtWkg+miQhO8dalYRJ+TR5qGIuH/WQAplf1CFxrrI
         W7MWcY6FA0x3tVXVsOmcG1dr7Cn8nb/FV+e4SLQ6+DmW/Fk8nVqqlNwbjHcV/K12w0QB
         N8TbFkBFf2k5Nppr4JCBgUjqHIL8HWXbqoPYKSWX3+s64NjBrTfHEY4amcLMsLEFf4xi
         tn2BPggHQi6GS2NT/4viilSj6OI1hmu4zRlYU0s/Z/kJ0pRMWhQ3nYpG8Rq3R0Yue8/N
         kx433BhSfsPhI6lheqp4nBp2dg5dAWIRFPQndYZIb//OWMKJor7nshmMtooIM9bfBAY0
         tB8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792674536; x=1793279336;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3I3CqMlKS9kzfVvoatBulSB5vPOH1xeLfyRig00xmQ0=;
        b=otOQ5AgdaiiCR7xPLjpVZmn1qmZzN0Ddbid6QdukSwariktAD6CudSRTZuLJ1GqqI4
         9Z6tfKBDnfS1LL+1MIr+Mq8oHL/jwe6uECDeMYxh2Ar3U/jYWtxeiWsK9tQwvi2CxLiY
         OYDCeisMIn2m+WOddlmhwpSNSS4ccFW22t9n6JvQDhCPaHewKn+gjC6luhoFNnAX1nny
         qN06yx9mLaFJu40oVXUzcOKMUT9TWsfdLe4t1le814fKkj15aTuWQWqsd5zpcO1CVF/h
         gKGt3QHVS/G+awYRL1Cfw2PyhHqW2Gmg7Lb2K4iH5mdlp58TfMmMNRToex3HHifoS102
         S4Og==
X-Forwarded-Encrypted: i=1; AKwUvBwhc5xjn6KPvRQFFLesfunKk90ytb8AdbknmpxDiC9DXr9//uuA3BSxOTBxE+MzmghLwpI98sEJsgkl@vger.kernel.org
X-Gm-Message-State: AFq9FYLrgEeNY2y+mNjZAUicRyQNROTYSnzmZupZaNb6VjsColm36+4a
	PYqcv2g1XoltvNLjN8IWe/PtDdYanuCd4diKbwmMwBUtHkkqzkUc413rPG7h9k6GVTVBtoUzgGp
	9rmSXKHdbJnSi8SyDFq61qBsVzdVO7CNIsqaa6Zr2ISF+Sz6g2rZZGUZBOFaC47zb7fO3ZmdWaA
	N3UdmMGeh88Ye5tTXePxP1dqCW3ZyZ2ikSS2UgdIA=
X-Gm-Gg: AYBFou0Wo89op5WqfqeS9tH/oi56ffkouOCMMEwB1G+L6IpgshaCARbDKAuwt5xEKhJ
	OdnDn2HdKLh5XkVESG9ZwzSKEQpt3X4mG8J12A/8q7w649NDhaXUB0HUwU+WdDjGTuoGMb/z6V9
	7PPYk9//A1/zBP3toWKqY2S+YrCmudEbVInijabVUKzgI5vfxJON25AgzL+ZkMoPwB8uBymsDrC
	lXCZ7JtLa2w8GO0uLsGRGzezmHZoGnuu9RAgITfcTCXl5WMZNqx8SVtxysVqYEga5Wp3TAy53o=
X-Received: by 2002:a05:6808:4f0b:b0:4b9:e65b:8c36 with SMTP id 5614622812f47-5535818c38fmr3719765b6e.36.1792674536241;
        Thu, 22 Oct 2026 06:08:56 -0700 (PDT)
X-Received: by 2002:a05:6808:4f0b:b0:4b9:e65b:8c36 with SMTP id
 5614622812f47-5535818c38fmr3719745b6e.36.1792674535696; Thu, 22 Oct 2026
 06:08:55 -0700 (PDT)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <0303224f-4c2c-46ec-9866-5ea1fd0fb4a3@oss.qualcomm.com>
 <20260825092715.5794-1-wei.deng@oss.qualcomm.com> <isbrpaztfrgwfcleujrn4w26cshbi2mgn57tbh5bubvsegn6lc@jh3ab6htvd24>
 <83b67ab2-ab68-427a-94aa-881454f457ba@oss.qualcomm.com> <CAFEp6-2KDxDrfTZLN7KPRg=aavj8nqQr7ftna23n9C1Cpbwwbg@mail.gmail.com>
 <e26f0360-aaed-4e40-b1b2-956c92d34db5@oss.qualcomm.com>
In-Reply-To: <e26f0360-aaed-4e40-b1b2-956c92d34db5@oss.qualcomm.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Thu, 22 Oct 2026 15:08:44 +0200
X-Gm-Features: AclHuK97HFIdPEr61N5bt2T_LHXrNyu9E7auEMGCcuKFJXvXq_yVtWyXBQ__JQ4
Message-ID: <CAFEp6-0b15kV6ehMN4Pv24UmMo7xFYr=H396dvdD1Teh7h+K+w@mail.gmail.com>
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
X-Authority-Analysis: v=2.4 cv=JudkP84C c=1 sm=1 tr=0 ts=6ada0ae9 cx=c_pps
 a=4ztaESFFfuz8Af0l9swBwA==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8 a=8PI_4jS6IWSl88OZsVIA:9
 a=QEXdDO2ut3YA:10 a=TPnrazJqx2CeVZ-ItzZ-:22
X-Proofpoint-ORIG-GUID: tlFx1j4-qv9dqrvpKiwHKa39a3LZiVsJ
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDA1MiBTYWx0ZWRfX87/lafugj6pa
 4qBEckB7xFIcozabiR1FL8XEpp8seOTnWyncBu9pLPBzO6O2xrKdb/rQrrrx5o6YkTWREo3mR8z
 Ys8ife5o9rct+E1g3HXuZg/Cvafx0GY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDA1MiBTYWx0ZWRfX/Sxdc8XuMejp
 rsocwa6aRCa/RUE9ufehb45na1EmKkvnBBE9/EPioEck+IhMITkXvNPRJcdBpzxnr/asSBI3pvD
 kQdCMbfZfAs68sOk2NX+SpKKPH9M0Gf8nbN0oinmpeWzYVgGecQejKDCthn6/Sixbz7A+JYovH/
 KFRWG/9rZ9ZvfqWgLpU9D0PzUUOB56b4EOrkxoABSjLwLQawcvrgPrYcoNH1Ae3Zx48byUVv8rW
 jLklU8/4v5LXAN3n6GpRgoC67goKCRAMow+/5sAkSiqco45JuTSPePFKZl2U5UUTmxqUdmdWQ53
 TtkvbKqSomldsZ1e/F17AbOKNaT8qT1XC2jTJgqaluP8MUyeSQlWaVVn3bVuR310+kY6p1FKRTQ
 cOsO95DcX1e+W10EHUS4XseXdCwc/0vOaYeN/F30qtoIR5WGwO7mp5GpZtKF7dMqB8V5jt1WPwg
 stm03kjRkiG7xmlDGCw==
X-Proofpoint-GUID: tlFx1j4-qv9dqrvpKiwHKa39a3LZiVsJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 malwarescore=0 impostorscore=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 adultscore=0 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610220052

On Thu, Oct 22, 2026 at 11:34=E2=80=AFAM Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> On 10/13/26 10:13 AM, Loic Poulain wrote:
> > Hi Folks,
> >
> > On Mon, Sep 21, 2026 at 2:38=E2=80=AFPM Konrad Dybcio
> > <konrad.dybcio@oss.qualcomm.com> wrote:
>
> [...]
>
> >>>> We are adding M.2 Key E connector support for monaco-evk [2]. Konrad
> >>>> suggested moving the port/endpoint anchor nodes to the SoC DTSI
> >>>> (monaco.dtsi) for clean DTS layering, so that board files only need =
to
> >>>> fill in remote-endpoint for boards that actually have an M.2 connect=
or.
> >>>>
> >>>
> >>> This means, the dummy port/endpoint node will always be present even =
when the
> >>> M.2 connector is not used. I don't see a compelling reason to do so.
> >>
> >> I don't really see a compelling reason to defer re-defining them to ea=
ch
> >> device DT either..
> >
> > Adding an empty port/endpoint at the SoC level is problematic for
> > uart, port is not always expected, this depends if the uart is exposed
> > through a connector or to an onboard device. So we may end with an
> > unconnected endpoint but still have a bluetooth subnode, which can be
> > a bit confusing... Also why adding a port/endpoint only for a specific
> > uart in the dts, and not for the others? This is a board/SoC level
> > choice to use a specific uart for M2 or not.
>
> From my perspective it's removing boilerplate. Currently all USB and
> PCIe hosts already define their ports and endpoints in the SoC DTSI
> and if they're unconnected, then simply nothing happens.
>
> Both 'ports' and 'endpoints' are an abstract property that signify
> 'X can be related to Y' and I don't see how that's a problem here given
> UART is very much expected to be connected "somewhere" (with the
> "somewhere" perhaps being external/a pin header)

Yes, but in the UART case, where the connection can be represented in
different ways, we can end up with devices being described as both
unconnected (no remote endpoint) and connected (via a child device).
We can probably live with that, but if we go in this direction, we
should consider adding a port/endpoint definition for every UART
instance in the DTSI for consistency. The same would apply to I2C once
endpoint support is available there as well.

Regards,
Loic
