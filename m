Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A4113CF050
	for <devicetree@vger.kernel.org>; Wed, 22 Apr 2026 12:44:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776861852; cv=pass; b=Y8wbTHxQ9wmNp9jwWxy5b9tusD4WOnxTBsgaxcWuIlOBy9H9LQk7tedubcyXOrQI87Uf6O3NmrdiiaEu5/RtTkfVFP3UirE6uMhG2GHybOxur0gVR/iKZpFOut/DP5EzKuFzS1RUAs8I/mQXedSjfKXnEjd75dq4WT7H8JBTukU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776861852; c=relaxed/simple;
	bh=zTwKs5hGUdQlYQ2nFSA3gLBymZuCdqbUIAUQGsQZJag=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XLsJRgbGsitGqfBbEu6fokud4pyZ291fWob4xKZjR/nU9ovqPuy/jLxhdvtdz+dNVZMysrBCY1vbeSHf1CHrQsrV/i/D5+/oqVkvIJu4DQhTqWgKC0drdAT/49VMoNCC6SSKGv7H+2vBFPygzIU38o9+KIhvhZwyMtUB9Xgvvx0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IXwboDxD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PjmNf5UW; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IXwboDxD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PjmNf5UW"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63M995jM2064777
	for <devicetree@vger.kernel.org>; Wed, 22 Apr 2026 12:44:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uc8MWdVbaDQYCYOCscGpYZjSPzPMKf/2mf0l+rt3kM4=; b=IXwboDxDZ2dHc0Gb
	MAJ7zD3Dz3DzocKleVS/AR4XMoVyTHwXZOc2Q8g2k5En8O1YzFjRtqDkO+KUbKDm
	TfBI1CHddl0FJn/M7/OFoppbVRv9vDbu8UC6iMxZcY8lCMlimPDLg2RlEAiHTWZl
	naevnTPTTZiFz1CHOn/EwJZbFPZm0hC1Mx0xntFmkJQQOEG+1bfPC36I1rgbBU9r
	SWZtECMbKJjDK/J8vUmXNDhtc1h+WEBwiBVarUTAUVZS3d3eygATC+tIp35y8MPZ
	ImFMsaIUDftiNSKoIoVYK/IycuMjxb+jf6BdpNOmNM863xq7w06YUjJtPANsXAbk
	ILoDpw==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dpenhke8b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 22 Apr 2026 12:44:09 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8a22dbeeb96so108418926d6.3
        for <devicetree@vger.kernel.org>; Wed, 22 Apr 2026 05:44:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776861848; cv=none;
        d=google.com; s=arc-20240605;
        b=P47ely+fOAg8f/JCTQLeL6Zl7UdOE+u+7jpu3Sc78vPSx/A/2bZS7JbEmH62ziHC/e
         UZBvvOpmNdp/46lJydRvJ9UxXHqgckn0pG+lAHKOYGKTwMBH1yDV+/NrNMb0j0+nrrG5
         ULSuCa4gKstMGue6y8UBltcFMvNDwGESuN6/fIQMBuSQNnDaEmJ7qsBuwKa5xAAayqRh
         EnMoAxxPkfCjg/VAe2oBDNQ0DytdrUacLza0pG2L+7/H/5/RER6eJacGbg6QafYgVfbC
         PKNQ2dTk0Jl/c3TMEq6UF/gH86hOTU0ulUQQ8KXw5hJoH0ervdPtX2V1N4zoG1VQEm22
         Vjjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=uc8MWdVbaDQYCYOCscGpYZjSPzPMKf/2mf0l+rt3kM4=;
        fh=6bXBhNqpLUBl20eeAQDR0QMiD0Rs7YmkI79rGATtdtU=;
        b=cBPRH/qTlQaYlhrR65/e7iTZpvLw1wsIYHA4rhjgxfUuSDokL4Cpq+frrgoaMsdU+R
         8VqW9wGdVKVM6OCxFEMaNF2FiGAeRPNDOS3E+K05lS6ZLb/GwYgKKSzZGx+vSnKmHM2o
         eT6cPucdBI3BuEWHyci4DhO8X44khpOZ4+x/opZOb3O4zR+9knCGqwiivn8VnWYdSXXM
         lXEQa/C7c60wUbcEe4u90kXDu1s7Bu9diXzwZffQ/1q4Afe3IO9/QYGveH8JYJHky3xF
         RnQjNoDXxMlizXeSHeZRk7KYuOEmMVrjBMKod5zP19sYGwBPQyR8tLPHzO3HEh+khGSc
         YD2g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776861848; x=1777466648; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uc8MWdVbaDQYCYOCscGpYZjSPzPMKf/2mf0l+rt3kM4=;
        b=PjmNf5UWO7MeqJPdo+QKXJl1CXfzbNGO1ppLl5U8s6M27XPNokk6xNcbneehHjW/Zf
         oeBJoeSDrA+INO4a+z3GR5675/OMhE5762mSao3V39LuPjQ/bini1XI5idnfkN50htLe
         U6RlLdUpFAUuvKh/hrO+i5m1ABV1a9h/cre8NSYGw0bmyq8rdxRj0wEhon3u5/ldPq/Z
         2IzZTO061oif58lTOyYuG5kJeDCkkXYIGIzVmqdg+fWscUOOnEGEKtMgK+KNmlkdG20N
         CVFQ8NeUeRJp6r8ZzqWAf/mK/HIJdOBTE+dWSh93tUuGGgyeiBmx8Fp6wXkJS/fDTNRe
         /CwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776861848; x=1777466648;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uc8MWdVbaDQYCYOCscGpYZjSPzPMKf/2mf0l+rt3kM4=;
        b=b/HoQxh8o0/EwgKRTfme6m/6kSg+9QDStGbCmuDBOkMJHrBAxeceBhruHJx6f3/YLX
         1hnOMdzAn+nBBetcs1Ww6JY100969tcKJqFvgujAgFHqH+3vIACHsawoOeOvG+/yWHdu
         pzuts2oZIPSruFINThUtSu8cUFWIfsrQXlLsgwU2F1o9i6I0HSqDnkkRehX7/biTgH7x
         GSXLJeXviS7RogUKt4pIxNyaG4cgl8Xl5WGj946sj8G0BDMJErIewQ9bxsJbFkHof9Pl
         3G55sTNk+74nU7MutSeZFm/8IAPQgFRKfiphx9qVkfxPxOfpqdNIBFZ53YVwfW1hoH24
         qXdQ==
X-Forwarded-Encrypted: i=1; AFNElJ+hHCOO3cNww4psB7w51Pq09Ypsdw3W/7S9JTCRsk1KDjS64D6nmMnu0iLNHoKZR8Ypyb8YGxexqU/I@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2qI8BzJacW4QjgzQwztFyzZUknBrTeCoADu4VDV28qZq10/kH
	VJQGk1P7JKRfYLG5aInU5qedmzXkzFC9v44reLZgDjDXuRjvNqSetOLLN79W1CLnWCqU1Cysvfc
	C5W+Hi4m6D4gSSPe97ogqWKDJKHYhtqIjwGrDG70XgmXLcTIXI1a8DpbL4sF+1C8dfh9yyYDdUC
	cEcwQG76J9oCqCV4aKb3WNtcagHTSRAlScI+HIiWQ=
X-Gm-Gg: AeBDieuPYJAYLFtCop6jJUNHz97yvttLK8fgvooy27AzQeErv20flF8bP7839toVjT/
	3K8wROQZ3rH+19uDwK0n0r1Lz6i/WNKDO/uQ3ESdQtF76kel1S+9mKwf6nSKHcHtptkaQriyJza
	jsYcft8ey4j+vFAi3944+GOQDPXanDqEpvE1v+GyKegTibFG4QYjG3fhFC7DfatyQVJb+0DA5Li
	8DAjzWeI9mZrfA1xUE=
X-Received: by 2002:ad4:4ea8:0:b0:89c:806c:93 with SMTP id 6a1803df08f44-8b02818d80cmr355012126d6.30.1776861848392;
        Wed, 22 Apr 2026 05:44:08 -0700 (PDT)
X-Received: by 2002:ad4:4ea8:0:b0:89c:806c:93 with SMTP id 6a1803df08f44-8b02818d80cmr355011726d6.30.1776861847971;
 Wed, 22 Apr 2026 05:44:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260406110113.1709886-1-swati.agarwal@oss.qualcomm.com>
In-Reply-To: <20260406110113.1709886-1-swati.agarwal@oss.qualcomm.com>
From: Swati Agarwal <swati.agarwal@oss.qualcomm.com>
Date: Wed, 22 Apr 2026 18:13:56 +0530
X-Gm-Features: AQROBzBixNp2sGtJh_9mcdHIvilb_304EKA6TCZzHNk5W7rGeKgHetBKMgZyk4g
Message-ID: <CAHz4bYubL1b1h4GecZWk4uvPittJ72OsVOLWvfmSGMFGpH2gtw@mail.gmail.com>
Subject: Re: [PATCH v8 0/2] Enable secondary USB controller in host mode
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: RHmvNYUWRDEkw8EUIEDOl_5V2RTqRF3g
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIyMDEyMiBTYWx0ZWRfX7unatxZMfPbz
 JVYda2nvg54v8JKSD/MAEv11abJxFL6EwcPi+3re6jPGRl4tW9ZikSyrgxB2xBk1hT3D28i04Gl
 0xvGPGYU/TPJYf2Hc9LgtQNUFTvXy4GDsVjvijO6Tlpe5TC8hF5SDvIwE4luOpCSuWEsstIPnmG
 X9t9ll9vpHZki+zpcs5TB/iKyY8FDGU5plG1qUe/lvY/H0Zj3HY/Kw8qqw/z1vPOnyjs7iW9w78
 oEqQhaEZ5l4FYBT2R9N7dxn0/L8W+JKT9ZrFG6NgIVE6KzaFA1UZu3gP3Yt21cUFfw9caZYDlrn
 7LwXukZd7kr3YkjfO4+kKTNbmnpiOS1xQGEeqLkiCJ0IEygCOnqDuASWDbc8/elf6PjSJPLXXrM
 wYdWog14ZL55r29dr+VXOubLnmr7+XSRqj0TCdtyu+qtyLfHag2h7znyUaznY1VSBTx6PbMBdz0
 exotLaDduaL+iE0n3zg==
X-Authority-Analysis: v=2.4 cv=WKJPmHsR c=1 sm=1 tr=0 ts=69e8c299 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=gowsoOTTUOVcmtlkKump:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=RfbAcnND_3HjLPHxiFwA:9 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-GUID: RHmvNYUWRDEkw8EUIEDOl_5V2RTqRF3g
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-22_01,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0
 bulkscore=0 phishscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604220122

On Mon, Apr 6, 2026 at 4:31=E2=80=AFPM Swati Agarwal
<swati.agarwal@oss.qualcomm.com> wrote:
>
> Enable secondary USB controller in host mode.
>
> Changes in v8:
> Removed unsed nodes.
Hi,

Gentle Reminder for reviewing v8 version!!

Regards,
Swati
>
> Changes in v7:
> Split Driver and DT patch for USB1 controller and USB1 HUB support
>
> Changes in v6:
> - Removed vdd12-supply property status for all hubs.
> - Added connections between genesys hub, HD3 port controller and type-C
>   connector as follows.
>
> GL3590 USB     HD3SS3220 Type=E2=80=91C  USB TYPE=E2=80=91C
>    HUB         Port Controller   Connector
>
>
> HS HUB                           HS con
>
>  |------------------------------------|
>
> SS HUB          HD3-out          SBU con
>
>  |--------------------|
>
>                 HD3-in           SS con
>                 |---------------------|
>
> Changes in v5:
> Updated comment description in DT.
> Updated vdd-supply status for other hubs in bindings.
>
> Changes in v4:
> Updated power supply property for hub.
> Updated details for all 4 ports of hub.
>
> Changes in v3:
> Updated binding properties for genesys hub.
>
> Changes in v2:
> Add Genesys Logic GL3590 hub support.
> Rename hd3ss3220_ instance for primary port controller.
>
> Link to v7:
> https://lore.kernel.org/all/20260403100753.3477925-1-swati.agarwal@oss.qu=
alcomm.com/
>
> Link to v6:
> https://lore.kernel.org/all/20260318040644.3591478-1-swati.agarwal@oss.qu=
alcomm.com/
>
> Link to v5:
> https://lore.kernel.org/all/20260122092852.887624-1-swati.agarwal@oss.qua=
lcomm.com/
>
> Link to v4:
> https://lore.kernel.org/all/20260120103312.2174727-1-swati.agarwal@oss.qu=
alcomm.com/
>
> Link to v3:
> https://lore.kernel.org/all/20251220063537.3639535-1-swati.agarwal@oss.qu=
alcomm.com/
>
> Link to v2:
> https://lore.kernel.org/all/20251216120749.94007-1-swati.agarwal@oss.qual=
comm.com/
>
> Link to v1:
> https://lore.kernel.org/all/20251203-swati-v1-1-250efcb4e6a7@oss.qualcomm=
.com/
>
> Swati Agarwal (2):
>   arm64: dts: qcom: lemans-evk: Rename hd3ss3220_ instance for primary
>     port controller
>   arm64: dts: qcom: lemans-evk: Enable secondary USB controller in host
>     mode
>
>  arch/arm64/boot/dts/qcom/lemans-evk.dts | 176 +++++++++++++++++++++++-
>  1 file changed, 172 insertions(+), 4 deletions(-)
>
> --
> 2.34.1
>
