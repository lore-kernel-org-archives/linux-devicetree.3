Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD0303CF1FD
	for <devicetree@vger.kernel.org>; Tue,  9 Jun 2026 06:03:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780985003; cv=pass; b=GCWzYRU5+OTkn0vr1LyeDZx8GzNvnVimt/EQAyurLEJeJK8EI4xTVxZbP9fsXKz8gecUMO2ZKiEa5tjdwjW5qi1zyMaflGcF14zUoD0B60lXQzZAeKzRcyn2PWRgT11m1RzYqONOXLgi9DjmvytrnsCxxMRleeFip5Szh55E7Ag=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780985003; c=relaxed/simple;
	bh=L4TRBdzNZwLBc/g33oBcQeCPWXTx2bqcKr8hl9QQ2Cc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OnhBA1SyoHdyP9ZjstuLXnRYOC7LPdhgFj79HP8l6T6k387MQ5n3SJuLEidB3UarLCi2d5LQfPFKjix65s74XjS5cq3LMxli17DH9J2BAlwpJkFFMvF2iLDQrstBWRzLwaT/T4lDtJ18xhS+DcbwDhVFyU4zdovaITTZdtH7DqA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=f41vUbis; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DnsVuPTm; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="f41vUbis";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DnsVuPTm"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6593wxNR1499044
	for <devicetree@vger.kernel.org>; Tue, 9 Jun 2026 06:03:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	L4TRBdzNZwLBc/g33oBcQeCPWXTx2bqcKr8hl9QQ2Cc=; b=f41vUbisFxFeMU45
	oYLjVeXIMDWOydds2DLLbvKjRSv52aY48MMU3ksMNbpI/QrhMXTAdpRNEQV3wkrN
	t5PpUY091jUqBWZbsJh4YsADDtIAQGm2Y6il7W2EapXb45fKnmc+sRcjOsQTnP/i
	0jmkNJh9pcQQXhv7OYcV3vkf5R5eD1i5UZi8B+OUVaEcsIHyZsHy/0CBrHJXEnb+
	5kG4NCz5Pb+t7dbb45EFoS36DJkI6fmawKadyuzb6mGHQ8hlGMjgHFvE2OrZwj2l
	5dfLXgNrPY3U3TJNrZtwlEUWbfISMiVJIQAMfezlq2fXa0qvsAhUA55hJh3HC6Pu
	Krc2pQ==
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com [209.85.210.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4enun8mp3h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 09 Jun 2026 06:03:21 +0000 (GMT)
Received: by mail-ot1-f71.google.com with SMTP id 46e09a7af769-7e6dcca848bso9413240a34.0
        for <devicetree@vger.kernel.org>; Mon, 08 Jun 2026 23:03:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780985001; cv=none;
        d=google.com; s=arc-20240605;
        b=jpoDxHSWZDHHdGVcD4jLbSzpKlHeNuX3fg+oqXMmGhtgg6KzPH3TIX7m8SxhGMRFyK
         A65pXROEgpk3E5Plh2QvN2/5XNcT6/qrYUR7VC8oQM5CEdkvctYrBhlDN+t7bsYGRMoC
         SKs+O1wicTvbSBOGcNKCgr8zlZO5i+BBqr0BxHJHkn6OlO15dEJBrq05fv/ku18pOR9i
         FbIzr25MEZLmvFIH7pmX53/DeB01/af1SVOlUgOYN+UA6oVyR4Y4huVHH8BV3nIRU379
         XC4xg2w4edmFztHjMOhT8JwVo3xPI0RQD40cRBbUsg2Ce3Gr5gSP1noa8yTDCIQ9VLEd
         qFbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=L4TRBdzNZwLBc/g33oBcQeCPWXTx2bqcKr8hl9QQ2Cc=;
        fh=1ic+y4rQVtDZeIxXUE06154mtcMcqB2EHTkjlhszCEo=;
        b=Fe0kGhLrtwgwBtx+edXVBtnHwvaI1SXzTF+/0oNxODGzjoJy6p2ukhmlvJXXuevE/s
         jZHcvUmmNCK/rOUyu+GwAJVWRRURiMu0PWXVAm6G+TMHtkwphmgyQR/Fd+oRu63QxnNP
         BZXQTmXYIu9gdnGAH4sZnG84LLCDMCTkbfWeYJXTI03ocefXoJh/NNipHiEIGewIDZPs
         X2v55fddpY4EH4e7RXD8peVQre2d3zH53jEQSnM01r5Y1ZLR4/6JcSrej7Gn7IcTg62s
         UCzd4iU6sWfCJgTZeKedNklPvKULKIEkpVVJPUCkmRtpUG3HWGowBETdIsGaHwoiWG19
         0mqA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780985001; x=1781589801; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L4TRBdzNZwLBc/g33oBcQeCPWXTx2bqcKr8hl9QQ2Cc=;
        b=DnsVuPTmFGy+oM1Y3UqKwBFNqE9rdkQhKIn7WMrik+zyWtN7buBhG6TdQvlkOIAA0v
         qzA69XoNZUi/OA/vG0y6Yx1TWqazrAFwHPn5CyNmLWYNZaXS2xfaQI/0b+IeNiOAmUC/
         UVPiTPqW0wqFPcDY4kCOJAueOfymEdPVQhddHeLItN34fprCXtFc9OetqP6TixYMmhkV
         wZlJMNVNGKZH4P5UV8tJlTDjQzdZtnkzLtNracpX7TrOaRfrFB5Z4T1qjYvMpaYPKHo3
         jDbRCqdu00/q4UECFYGzcyeCC3EoUfiIt9IQpLiSvYcZngTvYuSQsWRQFBp9uzUTrOL9
         VGDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780985001; x=1781589801;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=L4TRBdzNZwLBc/g33oBcQeCPWXTx2bqcKr8hl9QQ2Cc=;
        b=EinDg3jdIE4UMUbpeshdk4KqOK54bZ3gKB3US0B0z7oKLXwUHgYbl4m1+y1qQzutw9
         dbETVSBGQe/0WmGB12I5E00o2o4QUR9+0BVqt8qrBNO2HWOxRm3MG4uKbWhUa8KL23/s
         ViZLNGE+gk2JH7jXiPQdjcS52jSfoIOFFrybXs05qvHE6+b8LqlYNn9GiMzpabTxifQu
         d0B61u1GCDDjy/JGJsxJ5lXhreJiUvRWy56/ruwJTr6dHP32gWZxiz72bkqYpKVN/aVD
         z40g7mm3H3lzlSXsxnisvkzyOehKyPu0p03MQPcptVYvdTUkDWso7VnBp1OlxtHUlZ71
         FNiA==
X-Forwarded-Encrypted: i=1; AFNElJ/34VV77undbMEnhwEzcNf1DnS7Yc+lHv7v54c9SGoSFXNRu1VxjSbtmv5WzwVt0h0Ng2w+cavO2nI1@vger.kernel.org
X-Gm-Message-State: AOJu0YxauwR4TK3bYWz+I8sF6oiuTARByeU/Rz4WUvjK76UiA0LQZALv
	bP8H4SlDzOX1TC0MTI1FCEjTvkjLJkKPceURPM6nLHgcvGyjb0NCQYL1zPJQXd6L78Teq7b4B40
	HjtJzNalHqq++QMBbd34biwemhVq/4Tv47r7k7VJbV6etqvomGLcT+g6FNNIijJi0uhm226INNf
	kAXEA/Upkn7oHFvAzGJZ6ZV2odl4+TP9PKeWKhnFw=
X-Gm-Gg: Acq92OFPx0wEOy7Apo1CkK9XDyZXT4Ecih60odqRywFN5Krto6XVTFUFumq4jFNo5MU
	cLQzRa9p5wvETilud+7taDRMFsCRddpRYU/A9zSaFJAA5FjZvIO2JDTlxwJQNzxyA+qKR+YNjAy
	Szj9j5UbmC/hCZu9YhzqCuvb/UIglk4txKIs/5CvSR3aPcNBYfuPiKm9pR6ugq8upJg/AZX8Em+
	wmAVMB4F/1K72ac8w==
X-Received: by 2002:a05:6830:67d6:b0:7e6:fa1b:d99d with SMTP id 46e09a7af769-7e70ca4ebf8mr12256754a34.17.1780985001190;
        Mon, 08 Jun 2026 23:03:21 -0700 (PDT)
X-Received: by 2002:a05:6830:67d6:b0:7e6:fa1b:d99d with SMTP id
 46e09a7af769-7e70ca4ebf8mr12256728a34.17.1780985000811; Mon, 08 Jun 2026
 23:03:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260603015958.1242255-1-qian.zhang@oss.qualcomm.com> <CAFEp6-0XDjuCNy=Eac94VQC6uzumeTyYPy1CYtozrADpC5D5sA@mail.gmail.com>
In-Reply-To: <CAFEp6-0XDjuCNy=Eac94VQC6uzumeTyYPy1CYtozrADpC5D5sA@mail.gmail.com>
From: Qian Zhang <qian.zhang@oss.qualcomm.com>
Date: Tue, 9 Jun 2026 14:02:41 +0800
X-Gm-Features: AVVi8Cd7L4Z_UJCPjGFcYT1f94OB_jmsV2tMvP_qnmXGEQwhowQmYfvtLO30WPU
Message-ID: <CALC2J1PC7TuKyVZTmiYZmnWZnQjULGnQzw28MKT2OG02L7nOsQ@mail.gmail.com>
Subject: Re: [PATCH v5] arm64: dts: qcom: monaco-arduino-monza: Add QCNFA725B support
To: Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDA1NCBTYWx0ZWRfX5Z10gZgqkCo9
 jHKura2EzaIA008nxQeF9qn+L4wvCMhcplaFus8h4JPx1CsZlJXCm/74P7jZKD41D7opC0Nm57s
 3kL7VMwUTn/c/OLX9gjDi8TL5/56sC19bib8u6HPvLp16jOrGW4oPPFjL7+QP0o/Na+norSUVpR
 4eEg2xJefaroqvdyAMIT9/e4jCss86tAHk3vqu3oY7CMDeVmqwCdnPdjORR9sr1K++M4m55iX2l
 wkM1cBapo20jLFnR2eUvZzXMUWBRLViHueQkdEHJsI8wOFvQ08XFNrnuRzabwKiZXqKs7LjVIpS
 DrxpdnyjTilFn83qS/dmKLsUUIL7EuYrHY/AqzfQlDoc1b1Qae1oabpl1EuAD3CGfnN1ksn13ic
 VV1xyy5+MdYgukvHCyOQNg0wlvJfScrI+432htB7O8F+z5FmERa4CHvBerOfrCk09LLLQX8BGYI
 s+oxvjYm9tpN9FwegtA==
X-Proofpoint-ORIG-GUID: OeR1AsFlwMDgPiXj7oSI7bGjqd0bgOli
X-Proofpoint-GUID: OeR1AsFlwMDgPiXj7oSI7bGjqd0bgOli
X-Authority-Analysis: v=2.4 cv=Z7rc2nRA c=1 sm=1 tr=0 ts=6a27aca9 cx=c_pps
 a=OI0sxtj7PyCX9F1bxD/puw==:117 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=rJkE3RaqiGZ5pbrm-msn:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=X9Xm1guRSrHqRF9YbQUA:9 a=QEXdDO2ut3YA:10 a=Z1Yy7GAxqfX1iEi80vsk:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_01,2026-06-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 bulkscore=0 suspectscore=0 adultscore=0
 clxscore=1015 impostorscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606090054

On Sat, Jun 6, 2026 at 10:00=E2=80=AFPM Loic Poulain
<loic.poulain@oss.qualcomm.com> wrote:
>
> Hi Qian,
>
> On Wed, Jun 3, 2026 at 4:00=E2=80=AFAM Qian Zhang <qian.zhang@oss.qualcom=
m.com> wrote:
> >
> > Add support for the QCNFA725B M.2 module (WCN6855-based)
> > connected to PCIe0 on the Arduino VENTUNO Q board:
>
> This overlaps with another series that relies on the pwrseq-pcie-m2
> and M.2 connector bindings for Wifi/Bluetooth:
> https://lore.kernel.org/all/20260520-monza-wireless-v1-0-9f6942310653@oss=
.qualcomm.com/
>
> Now that this connector is available, I think we should use it for
> this kind of module.
>
> Regards,
> Loic

Sure!

Thanks,
Qian
