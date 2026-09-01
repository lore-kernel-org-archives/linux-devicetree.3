Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0397542E428
	for <devicetree@vger.kernel.org>; Tue,  1 Sep 2026 15:46:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788277587; cv=pass; b=CRB8sLm0gme+pzs2qDgV6OTJx2OEU+1WogAh3e3US5qhYxTKWlKMx64iQ1xwe0lu+Yv4nfqdEhB5U7Rv16SBV3QVK3KX6ScpRKi+IWsLVxm6rQ/2ZD6GpdqlsmNLNE9kZXsPlLQaaKsL0KEcr0YftC4MNMR856HOt36lm5qHGzE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788277587; c=relaxed/simple;
	bh=rnICP/8ipFwPUYfbnkDLyV5xBmiEhD52APzyFmePejc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AKf5K4JN+/zXFkZ/7j3OOEKEWUhjUhA4h3WI9sWMzf+Z7mzbXcPG4wAizRUc4ArgHu5oZiOiXdBm+yklB+vLzbeOusFLJKzsI++jMYOUkNKpGlmwxrPeWV/wJ81Eaba2lJOgdevtvxmP2CtsMvAdSKNLAUc4KDvji580Uyw2ReI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=E2GM46wM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eEOPBW0j; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="E2GM46wM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eEOPBW0j"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 681E8WwV2746429
	for <devicetree@vger.kernel.org>; Tue, 1 Sep 2026 15:46:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WOtmA72ZFF7SpeYfPs2ScSy02kZ26uUYXO+68oHg/tE=; b=E2GM46wMMsXHOkeh
	ceRe6MDPCujkNOr8IAO3QT15bc40jxWKVmhh6NtQyBzB7MRKSE3+bc1W4mbtJrS3
	PxHNnDxcP69Q44V9GjyEV/v6HOMlpUFoQJN3TvhRXB2glWhOauZba+BvlUgJKg6T
	tcTBNitlQ/MZzspJTjmsWl2UnKFcPHp4+WCoyYoDOiKWeNBnu1VZUBxHaV4wEgy0
	aFv8H2BzDMJcik87d0hLQDGOI0qlQeK7lHn1doY+c/dvT1mEJueUl7dciyObeM1X
	UD1Si8yn7RZq3WiSo8wsoknkFsAR89kX7fY0YemRrlFjs0ryDRBBreeu96Vwa75X
	eDla2A==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdvmm1fyn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 01 Sep 2026 15:46:24 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2d7151120d6so28280175ad.3
        for <devicetree@vger.kernel.org>; Tue, 01 Sep 2026 08:46:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788277584; cv=none;
        d=google.com; s=arc-20260327;
        b=Lo9+9SYWoRN8Xr21JHqaEDV6IycOieZZ5jZe0mdWgLbQmk3cWQNhSJlqqKR0lUtYgT
         c1YmA2DWYGz0EsXW//8mBGCHrQf2kmBD0P4UfwkF0Q6QPB3/6Pvdc4/JVd4LiBqYSIfr
         /4zKlXiCghtK/z9Vc1MputYLXKsA3Uhp3dyLWnFphVgtNZpgMgMQd7/4ejIaVNrnsvix
         wlTz+lflehurb6XU+BtwSunT4FqArlVKGRsF7u94ky3MQrZcPz8ybAX+f7YEDilFSsWL
         XFeoZXdPL6EFYPMHd7OtKzMcUMVTJd3fAoBChiwdwhcsaACZPc0AYm9g1SVOl9ndMtAY
         AJfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=WOtmA72ZFF7SpeYfPs2ScSy02kZ26uUYXO+68oHg/tE=;
        fh=irRjKKYILtp79LIOe7tgiTHkSjoMHDjy7v0zxLrCrDE=;
        b=sofLQT5ZHzTAUtgd8qQFdpteeTULxfPYDv7bPdmbKP3J02N0BZyVXJ5mGuZUo2dELY
         HcKnKmdXcNBTowNQwB19sJsV+ENpS1ThtW9zHZNfXN0pR9XY1WCQvN4vuXaRQIxrn2TW
         fh+j4TAXyccBqsl+1zZOlaACgEw4rAIaO6RLDKSNSh6pQLazLxu2A06ogOp4UfidEEOo
         twJX808NNgHQGkKoj9czEFnJeENYphb0IGh1JPW+4wqW/eNRN1RTGk4OU0pV+dfvKlhx
         OqQNz2mpXUWc/J0k/ot8VIqnCnVVUf3aKSufLmUtxJ4WSL7fVXTcA2qAPL2zk3BJq8VO
         E7Yw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788277584; x=1788882384; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WOtmA72ZFF7SpeYfPs2ScSy02kZ26uUYXO+68oHg/tE=;
        b=eEOPBW0jSQnTQAUU3noG4SRokSZHz3q4/fMSJ6Vl523O+BW6ILPDMSernAhKCPm61G
         sIVCdKECFNq7XSdRi4U0+JG+1Gy9I9QBQt+ao1GhuYAaHGtO4JO+Yd3CK5MoA8R5yuo+
         BD5tQUJq36XbXkoPGlake1NdUVDoSjh0YKiWTOxPZfDCwQpEvNw5jCk+C7ALgIrgt1Bu
         d/GhbItDQ+5u+oOwzcBeNnlzoHzHC112iKXqamlN7MdPiL3d6uAfN9ToumxxLhdHKjKS
         /U+xNgBtDblI+tTrD+tUiZ6xzlYH/Am1tUosljoVmOFeykYA0RxqOC6SmjSa+lQYcoHU
         wU6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788277584; x=1788882384;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WOtmA72ZFF7SpeYfPs2ScSy02kZ26uUYXO+68oHg/tE=;
        b=EmexTLDDJN4Yov8jmdHlZLy7C11goh3lokiKsUfepaZoBt8X0BNbhjAH0Wa6rxXQdG
         5kf70m4SRAD0ucRpBZZ2bf96cLMIjBq2nF4PHqz+8bKjAyFBeN96AnMcTSHlVYId6Rus
         AmW4D43ZHWkscDfWxSmfLQbXk6BgO8wXmJeYGCuD2rzyHVTT//wquVfuiIsHp5bPqCNi
         G375kvgAsDKNj2IYKuGsG7J0piC+Rj+iD0eiWXpONG82HYDN8sigK4H69KEv8dGsK7Xx
         1SYPgz6lzFAtWeX1W254W07pDFA+COQEMPjKAVPuOGzSPlM5D2tjGlROmxhOCkiLRK+K
         KMZw==
X-Forwarded-Encrypted: i=1; AKwUvBwjCp6FSOs6epzpa2Sd82VUUYeWMUZ08q6PhYX6DGVJ3llWPg74Fp+l9ZV9GHMPPzKsIcOqJSMn+OCM@vger.kernel.org
X-Gm-Message-State: AFuF++mFvaf6SbZbrCb7RuUETyWkqt/fU9f0oYNUjEGfhGFcNqwOObcL
	920DZqU4SJvO5spPXyaueEgWzNs3JF+NqycckXwpjt10Sk7cVOM/V6gQu74lEhIEQcGjsG9NuZ/
	vFWrwy4meXGvlgMPfz0iaX0esQFO3Ol2DwefOmDANB/yW+mHOXtryMOzeEq30xUyN22jKpOTcVP
	9QzlBoLNW6+wRbO0KowCM1saZALyErmVoHZopB/RE=
X-Gm-Gg: AYBFou2p6fBJyi78sKSM897sY7XIc/5CP4DhqBasJshmdJ1NcW5+FSvI5XG6bbaYrf2
	VTMI4xYHq6wBUbpizktLSoryQWPKFrlpCTmoj7jMSW6ysHC0dluTRi9ZB/rJCwqASJPH7F57sX8
	lxr1k7nKHfLuoZh4r2U5lKALEGBjG5bP3BcTQPpAN75yvpzQ8xpBwQVesdeQ==
X-Received: by 2002:a17:903:3c65:b0:2c9:bf82:dd11 with SMTP id d9443c01a7336-2d94a784931mr142846895ad.7.1788277582911;
        Tue, 01 Sep 2026 08:46:22 -0700 (PDT)
X-Received: by 2002:a17:903:3c65:b0:2c9:bf82:dd11 with SMTP id
 d9443c01a7336-2d94a784931mr142844255ad.7.1788277581551; Tue, 01 Sep 2026
 08:46:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260826135454.658615-1-shengchao.guo@oss.qualcomm.com>
In-Reply-To: <20260826135454.658615-1-shengchao.guo@oss.qualcomm.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Tue, 1 Sep 2026 17:46:09 +0200
X-Gm-Features: AcwNN1WYz_8rnm2ufJJ2jNPXi9qD6e76DvNVZfDobNOrG3sw9T-MJKxhGpSje5w
Message-ID: <CAPx+jO8RVUv=mqDZ-GeJa=dEYdNCK9L8Vi=UCDY9GqQ1TefCsQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] Add NMXC power domain for Nord SoC
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Ulf Hansson <ulfh@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: V2Qkgehb54Tiu3AWxRsVebqP48uk57vu
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDEzOSBTYWx0ZWRfX+1cj/ZWdKo5x
 M4cmSDpS8prsalGpQ0K3kk8U7TyCQWwxm5qRCQQIkXDu7CCIbo09QdUuINNuwKY1fRZgiNek22U
 dFN8BR07d/gCP14QrOq2MFyn7kAlhxo=
X-Proofpoint-GUID: V2Qkgehb54Tiu3AWxRsVebqP48uk57vu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDEzOSBTYWx0ZWRfX5W1IzMPaRSYg
 9kRnhrwVg7U2TzrP9Yk+hgWOP+aoVzGk/e2/KsdUU55vp8slDTH2X7UPvHxdVzqrVrJj4XlI9An
 ormHK/IP4/FvUOFHsO0iihnZQvUXqQv5yid3TB6iVgJ6s6EEeoHQ4DZCNZM7SgSNgt2S0qDfjdz
 iHZMOmY5M/sm2PNxZmCVY071o6lvC0RNA2cCgEAjI5PRCSFj5d29Ga1g/ExP1vwJvKmcaBHGbLC
 ebAb3yUyDUZrgFKuxFGf/UphUtclT7AvoFPuRNNpZcNjAYOEaDsvpWb6QJZeBthKSV0olUOK1wB
 BCqfD3rzcajK6hCGuiNIP2BD/HZ7e9wdL0T4NXqsurW8AomLTxbtfVNn/IW4zLmYGoMVKQ3n2+T
 4LKIbAzHFVvJl3iW4fIQPNWXDJAJ3g==
X-Authority-Analysis: v=2.4 cv=GfwnWwXL c=1 sm=1 tr=0 ts=6a96f350 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=rJkE3RaqiGZ5pbrm-msn:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=vbPe28F0ARNTXUAfal8A:9 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_04,2026-09-01_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0
 malwarescore=0 adultscore=0 classifier=typeunknown authscore=0 authtc=
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2606150000 definitions=main-2609010139

On Wed, Aug 26, 2026 at 3:55=E2=80=AFPM Shawn Guo
<shengchao.guo@oss.qualcomm.com> wrote:
>
> The Nord CDSP subsystems do not take their memory rail from the shared
> MX rail like all other Qualcomm SoCs, but from a dedicated NMXC RPMh
> resource. Add the nmxc.lvl RPMh resource and register it in the Nord
> power domain table.
>
> Changes for v2:
> - Drop remoteproc changes since "mx" of remoteproc is just the name of
>   memory rail input which can be wired up to NMXC power domain in DT
> - Link to v1: https://lore.kernel.org/all/20260826102746.633076-1-shengch=
ao.guo@oss.qualcomm.com/
>
> Anurag Pateriya (2):
>   dt-bindings: power: qcom,rpmhpd: Add NMXC power domain index
>   pmdomain: qcom: rpmhpd: Add NMXC power domain for Nord
>
>  drivers/pmdomain/qcom/rpmhpd.c          | 6 ++++++
>  include/dt-bindings/power/qcom,rpmhpd.h | 1 +
>  2 files changed, 7 insertions(+)
>

Applied for next, thanks!

Kind regards
Uffe
